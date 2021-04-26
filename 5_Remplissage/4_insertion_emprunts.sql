-- Remplissage des emprunts et de leurs traces

-- Empunts

INSERT INTO Borrow (borrower_id, copy_id, document_id, borrow_date, borrow_return)
VALUES (1, 1, 1, TO_DATE('22/04/2021', 'DD/MM/YYYY'), NULL);

INSERT INTO Borrow (borrower_id, copy_id, document_id, borrow_date, borrow_return)
VALUES (2, 1, 1, TO_DATE('22/04/2021', 'DD/MM/YYYY'), NULL);
