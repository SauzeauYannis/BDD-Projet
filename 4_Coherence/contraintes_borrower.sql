-- le nombre d'emprunt courrant d'un emprunteur doir être égal à 0

CREATE OR REPLACE TRIGGER trigger_borrower_current_number_borrow
    BEFORE INSERT
    ON Borrower
    FOR EACH ROW
BEGIN
    IF :NEW.current_number_borrow != 0 THEN
        RAISE_APPLICATION_ERROR(-20007,
                                'Erreur d''insertion : Le nombre d emprunt courant doit être égal à zéro');
    ELSE
        NULL;
    END IF;
END;
/


-- Désactivation des contraintes

ALTER TRIGGER trigger_borrower_current_number_borrow DISABLE;


-- Activation des contraintes

ALTER TRIGGER trigger_borrower_current_number_borrow ENABLE;


-- Suppression des contraintes

DROP TRIGGER trigger_borrower_current_number_borrow;
