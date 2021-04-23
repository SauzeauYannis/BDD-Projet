-- AVERTISSEMENT : les instructions ci-dessous ne fonctionne pas. Elles sont ici pour vérifier la cohérence de la base

-- Test trigger

INSERT INTO Book VALUES (1, 7);   -- pas d'insertion car le document 1 n'est pas un livre
UPDATE Book SET document_id = 1 WHERE page_number = 250; -- modification non authorisée

INSERT INTO CD VALUES (0, 500, 200); -- échoue car le document 0 n'est pas un CD

INSERT INTO DVD VALUES (0, 500); -- échoue car le document 0 n'est pas un DVD

INSERT INTO Video VALUES (0, 500, 'mp4'); -- échoue car le document 0 n'est pas une Video

INSERT INTO DOCUMENT VALUES (5, 'test', 5, 0, 0, 0); -- échoue car le nombre de copy doit être égal à 0

update BORROWER set CURRENT_NUMBER_BORROW = 9 where BORROWER_ID = 0;
INSERT INTO Borrow VALUES (0, 2, 0, TO_DATE('22/04/2021', 'DD/MM/YYYY'), null); -- réussi car il à son maximum d'emprunt possible (10)
INSERT INTO Borrow VALUES (0, 3, 0, TO_DATE('22/04/2021', 'DD/MM/YYYY'), null); -- échoue car il ne peut pas emprunter plus
