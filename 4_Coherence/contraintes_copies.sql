-- Le nombre de copies d'un document est stocké dans la table document
-- c'est pourquoi il faut incrémenter ce nombre à chaque insertion
-- d'une copie et à l'inverse décrémenter lors de la suppression
-- d'une copie, il faut aussi vérifier à la création d'un document
-- que le nombre de copies est bien égal à 0


-- Création des contraintes

CREATE TRIGGER trigger_increase_copy_number
    AFTER INSERT
    ON COPY
    FOR EACH ROW
BEGIN
    UPDATE DOCUMENT D
    SET D.copy_number = D.copy_number + 1
    WHERE D.document_id = :NEW.document_id;
END;
/

CREATE TRIGGER trigger_decrease_copy_number
    AFTER DELETE
    ON COPY
    FOR EACH ROW
BEGIN
    UPDATE DOCUMENT D
    SET D.copy_number = D.copy_number - 1
    WHERE D.document_id = :OLD.document_id;
END;
/

CREATE OR REPLACE TRIGGER trigger_document_copy_number
    BEFORE INSERT
    ON DOCUMENT
    FOR EACH ROW
BEGIN
    IF :NEW.copy_number != 0 THEN
        RAISE_APPLICATION_ERROR(-20005,
                                'Erreur d''insertion : Le nombre de copie doit être égal à zéro');
    ELSE
        NULL;
    END IF;
END;
/

-- Désactivation des contraintes

ALTER TRIGGER trigger_increase_copy_number DISABLE;
ALTER TRIGGER trigger_decrease_copy_number DISABLE;
ALTER TRIGGER trigger_document_copy_number DISABLE;


-- Activation des contraintes

ALTER TRIGGER trigger_increase_copy_number ENABLE;
ALTER TRIGGER trigger_decrease_copy_number ENABLE;
ALTER TRIGGER trigger_document_copy_number ENABLE;


-- Suppression des contraintes

DROP TRIGGER trigger_increase_copy_number;
DROP TRIGGER trigger_decrease_copy_number;
DROP TRIGGER trigger_document_copy_number;
