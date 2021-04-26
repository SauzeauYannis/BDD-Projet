-- Les instructions ci-dessous ne fonctionne pas volontairement.
-- Elles sont ici pour vérifier la cohérence de la base


-- Vérifications des contraintes de catégories

INSERT INTO Book (document_id, page_number)
VALUES (100, 7); -- pas d'insertion car le document 1 n'est pas un livre

UPDATE Book
SET document_id = 1
WHERE document_id = 0; -- modification non authorisée

INSERT INTO CD (document_id, duration, subtitle_number)
VALUES (0, 500, 200); -- échoue car le document 0 n'est pas un CD

INSERT INTO DVD (document_id, duration)
VALUES (0, 500); -- échoue car le document 0 n'est pas un DVD

INSERT INTO Video (document_id, duration, recording_format)
VALUES (0, 500, 'mp4'); -- échoue car le document 0 n'est pas une Video


-- Vérifications des contraintes de copies

INSERT INTO Document (title, copy_number, document_category_id, publisher_id, theme_id)
VALUES ('test', 5, 0, 0, 0); -- échoue car le nombre de copy doit être égal à 0

-- Vérifications des contraintes de Borrower

INSERT INTO Borrower (borrower_category_id, last_name, first_name, detail_id, current_number_borrow)
VALUES (1, 'nom', 'prenom', 2, 1);

INSERT INTO Borrower (borrower_category_id, last_name, first_name, detail_id, current_number_borrow)
VALUES (1, 'nom', 'prenom', 2, 0); -- échoue car le nombre courant d'emprunt n'est pas égal à 0


-- Vérifications des contraintes d'emprunts

UPDATE Borrower
SET current_number_borrow = 9
WHERE borrower_id = 1;

INSERT INTO Borrow (borrower_id, copy_id, document_id, borrow_date, borrow_return)
VALUES (1, 2, 1, TO_DATE('22/04/2021', 'DD/MM/YYYY'), NULL); -- réussi car il est à son maximum d'emprunt possible (10)

INSERT INTO Borrow (borrower_id, copy_id, document_id, borrow_date, borrow_return)
VALUES (1, 3, 1, TO_DATE('22/04/2021', 'DD/MM/YYYY'), NULL); -- échoue car il ne peut pas emprunter plus
