--TODO à l'insertion d'un livre, CD, etc on doit vérifier si le document est bien de la bonne catégorie (ce serait pas un trigger ducoup?)
CREATE OR REPLACE TRIGGER trigger_book_category
    AFTER INSERT OR UPDATE
    ON Book
    FOR EACH ROW
DECLARE
    category VARCHAR2(64);
BEGIN
    SELECT category_name
    INTO category
    FROM Document D,
         Document_category DC
    WHERE :new.document_id = D.document_id
      AND D.document_category_id = DC.document_category_id;

    IF category <> 'Livre' THEN
        raise_application_error(667, 'mauvaise catégorie');
    END IF;
END;


-- TRIGGERS DU SUJET

-- TODO à chaque fois qu'on ajoute une copie dans la table copie, Docuement(nb_copy) devrait être incrémenté
DROP TRIGGER tg_incr_nb_copy;
CREATE TRIGGER tg_incr_nb_copy
    AFTER INSERT ON COPY
    FOR EACH ROW
    BEGIN
        update DOCUMENT D
        set D.COPY_NUMBER = D.COPY_NUMBER + 1
        where D.DOCUMENT_ID = :NEW.DOCUMENT_iD;
    END;

DROP TRIGGER tg_decr_nb_copy;
CREATE TRIGGER tg_decr_nb_copy
    AFTER DELETE ON COPY
    FOR EACH ROW
    BEGIN
        update DOCUMENT D
        set D.COPY_NUMBER = D.COPY_NUMBER - 1
        where D.DOCUMENT_ID = :OLD.DOCUMENT_iD;
    END;

-- TODO - Ne pas pouvoir emprunter un exemplaire en cours d'emprunt
--        i.e. : on ne peut pas ajouter de lignes pour la copie d'un document dans Borrow ssi ce meme document est présent dans Borrow avec date_ret = null

-- TODO - nombre d'emprunts inférieur à celui autorisé pour la catégorie de l'emprunteur (on doit rajouter le nombre d'emprunt que l'emprunteur possède je pense)
--        i.e. : à chaque ajout dans Borrow on incrémente le nb_borrow de l'emprunteur si ce chiffre est supérieur à celui autorisé on doit refuser l'ajout de la ligne

-- TODO - ne pas ré-emprunter de documents si on est hors délai sur l'emprunt d'autres document
--        il faudrait modifier des attributs dans borrow pour mettre la date de retour estimé (la date à laquelle il est
--        censé rendre le document) et la date de retour réelle (celle à laquelle il rend le document) qui peut être null
--        i.e. : à chaque ajout dans borrow :
--              - on récupère tous les emprunts de l'emprunteur
--              - de cette liste on vérifie s'il y a des lignes avec une date de retour réelle null (s'il y en a pas on peut ajouter l'emprunt)
--              - pour les emprunts avec une date de retour null, on regarde si la date du nouvel emprunt n'est pas supérieur à une date de retour estimé
