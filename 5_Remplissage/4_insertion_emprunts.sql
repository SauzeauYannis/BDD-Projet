-- Remplissage des emprunts et de leurs traces

-- Empunts

INSERT INTO Borrow (borrower_id, copy_id, document_id, borrow_date, borrow_return)
VALUES (1, 1, 1, TO_DATE('22/04/2021', 'DD/MM/YYYY'), NULL);

INSERT INTO Borrow (borrower_id, copy_id, document_id, borrow_date, borrow_return)
VALUES (4, 1, 12, TO_DATE('15/11/2018', 'DD/MM/YYYY'), TO_DATE('14/12/2018', 'DD/MM/YYYY'));

INSERT INTO Borrow (borrower_id, copy_id, document_id, borrow_date, borrow_return)
VALUES (4, 2, 12, TO_DATE('12/02/2019', 'DD/MM/YYYY'), TO_DATE('16/02/2019', 'DD/MM/YYYY'));

INSERT INTO Borrow (borrower_id, copy_id, document_id, borrow_date, borrow_return)
VALUES (4, 1, 13, TO_DATE('15/11/2019', 'DD/MM/YYYY'), NULL);
