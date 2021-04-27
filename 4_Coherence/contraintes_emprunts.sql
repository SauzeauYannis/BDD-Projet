-- bla bla

-- Création des contraintes

-- ne pas pouvoir emprunter un exemplaire en cours d'emprunt

CREATE OR REPLACE TRIGGER trigger_copy_borrowed
    BEFORE INSERT
    ON Borrow
    FOR EACH ROW
DECLARE
    is_borrowed INT;
BEGIN
    SELECT COUNT(*)
    INTO is_borrowed
    FROM Borrow
    WHERE :NEW.copy_id = copy_id
      AND :NEW.document_id = document_id
      AND borrow_return IS NULL;

    IF is_borrowed > 0 THEN
        RAISE_APPLICATION_ERROR(-20008,
                                'Erreur d''insertion : L''exemplaire que vous essayez d''emprunter est encore en cours d''emprunt');
    ELSE
        NULL;
    END IF;
END;
/

-- nombre d'emprunts inférieur à celui autorisé pour la catégorie de l'emprunteur

CREATE OR
    REPLACE TRIGGER trigger_current_number_borrow
    AFTER
        INSERT
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

-- ne pas ré-emprunter de documents si on est hors délai sur l'emprunt d'autres documents

CREATE OR REPLACE TRIGGER trigger_is_out_of_time
    BEFORE INSERT
    ON Borrow
    FOR EACH ROW
DECLARE
    is_out_of_time INT;
BEGIN
    SELECT COUNT(*)
    INTO is_out_of_time
    FROM Borrow B
    WHERE :NEW.borrower_id = borrower_id
      AND borrow_return IS NULL
      AND :NEW.borrow_date > borrow_date + (
          SELECT duration
          FROM Borrower Ber,
               Borrowing_duration BD
          WHERE :NEW.borrower_id = Ber.borrower_id
          AND Ber.borrower_category_id = BD.borrower_category_id
          AND BD.DOCUMENT_CATEGORY_ID = (
              SELECT document_category_id
              FROM Document D
              WHERE B.document_id = D.document_id
              )
        )
    ;

    IF is_out_of_time > 0 THEN
        RAISE_APPLICATION_ERROR(-20009,
                                'Erreur d''insertion : Vous ne pouvez pas emprunter lorsque vous êtes hors délai sur l''emprunt d''autres documents');
    ELSE
        NULL;
    END IF;
END;
/

-- Désactivation des contraintes

ALTER TRIGGER trigger_copy_borrowed DISABLE;
ALTER TRIGGER trigger_current_number_borrow DISABLE;
ALTER TRIGGER trigger_is_out_of_time DISABLE;


-- Activation des contraintes

ALTER TRIGGER trigger_copy_borrowed ENABLE;
ALTER TRIGGER trigger_current_number_borrow ENABLE;
ALTER TRIGGER trigger_is_out_of_time ENABLE;


-- Suppression des contraintes

DROP TRIGGER trigger_copy_borrowed;
DROP TRIGGER trigger_current_number_borrow;
DROP TRIGGER trigger_is_out_of_time;
