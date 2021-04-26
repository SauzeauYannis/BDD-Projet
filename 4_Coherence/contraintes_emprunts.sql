-- TRIGGERS DU SUJET

-- TODO - Ne pas pouvoir emprunter un exemplaire en cours d'emprunt
--        i.e. : on ne peut pas ajouter de lignes pour la copie d'un document dans Borrow ssi ce meme document est présent dans Borrow avec date_ret = null
CREATE TRIGGER tg_before_insert_borrow
BEFORE INSERT ON BORROW FOR EACH ROW
WHEN ( OLD.COPY_ID = NEW.COPY_ID)
BEGIN
    IF :OLD.BORROW_DATE = NULL
        THEN
            RAISE_APPLICATION_ERROR(1,'Erreur d''insertion : Le document est déjà emprunter !' );
        ELSE
            NULL;
    END IF;
END;

-- TODO - Ne pas pouvoir emprunter un exemplaire avec une date retour déjà fixée
--        i.e. : on ne peut pas ajouter de lignes avec date_ret != null

-- TODO - Ne pas pouvoir emprunter un exemplaire en cours d'emprunt
--        i.e. : on ne peut pas ajouter de lignes pour la copie d'un document dans Borrow ssi ce meme document est présent dans Borrow avec date_ret = null

-- TODO - nombre d'emprunts inférieur à celui autorisé pour la catégorie de l'emprunteur (on doit rajouter le nombre d'emprunt que l'emprunteur possède je pense)
--        i.e. : à chaque ajout dans Borrow on incrémente le nb_borrow de l'emprunteur si ce chiffre est supérieur à celui autorisé on doit refuser l'ajout de la ligne

Drop trigger trigger_current_number_borrow;
CREATE OR REPLACE TRIGGER trigger_current_number_borrow
    AFTER INSERT
    ON Borrow
    FOR EACH ROW
DECLARE
    max_borrow     INT;
    current_borrow INT;
BEGIN
    SELECT max_borrowing_number, current_number_borrow
    INTO max_borrow, current_borrow
    FROM Borrower_category BC,
         Borrower B
    WHERE :NEW.borrower_id = B.borrower_id
      AND B.borrower_category_id = BC.borrower_category_id;

    IF (current_borrow + 1 > max_borrow) THEN
        RAISE_APPLICATION_ERROR(-20006,
                                'Erreur d''insertion : Le nombre maximal d''emprunts a été atteint');
    ELSE
        UPDATE Borrower B
        SET current_number_borrow = current_number_borrow + 1
        WHERE :NEW.borrower_id = B.borrower_id;
    END IF;
END;
/

-- TODO - ne pas ré-emprunter de documents si on est hors délai sur l'emprunt d'autres document
--        il faudrait modifier des attributs dans borrow pour mettre la date de retour estimé (la date à laquelle il est
--        censé rendre le document) et la date de retour réelle (celle à laquelle il rend le document) qui peut être null
--        i.e. : à chaque ajout dans borrow :
--              - on récupère tous les emprunts de l'emprunteur
--              - de cette liste on vérifie s'il y a des lignes avec une date de retour réelle null (s'il y en a pas on peut ajouter l'emprunt)
--              - pour les emprunts avec une date de retour null, on regarde si la date du nouvel emprunt n'est pas supérieur à une date de retour estimé

-- Désactivation des contraintes
ALTER TRIGGER tg_before_insert_borrow DISABLE;

-- Activation des contraintes
ALTER TRIGGER tg_before_insert_borrow ENABLE;


-- Supression des contraintes
DROP TRIGGER tg_before_insert_borrow;
