-- Author
INSERT INTO Author VALUES (0, 'Rowling', 'J-K', TO_DATE('31/07/1965', 'DD/MM/YYYY'));

-- Personal_detail
INSERT INTO Personal_detail VALUES (0, '02076315600', '50 Bedford Square', 'WC1B 3DP', 'London', 'England');
INSERT INTO Personal_detail VALUES (1, '0612345678', '667 rue de la street', '93667', '667Land', 'France');

-- Publisher
INSERT INTO Publisher VALUES (0, 'Bloomsbury');

-- Theme
INSERT INTO Theme VALUES (0, 'Fantastic');

-- Keyword
INSERT INTO Keyword VALUES (0, 'Magic');
INSERT INTO Keyword VALUES (1, 'School');

-- Borrower_category
INSERT INTO Borrower_category VALUES (0, 'Personnel', 10);
INSERT INTO Borrower_category VALUES (1, 'Professionels', 5);
INSERT INTO Borrower_category VALUES (2, 'Public', 3);

-- Borrower
INSERT INTO Borrower VALUES (0, 0, 'Chevais', 'Benjamin', 1);

-- Document_category
INSERT INTO Document_category VALUES (0, 'Livre');
INSERT INTO Document_category VALUES (1, 'CD');
INSERT INTO Document_category VALUES (2, 'DVD');
INSERT INTO Document_category VALUES (3, 'Video');

-- Borrowing_duration
INSERT INTO Borrowing_duration VALUES (0, 0, 9);
INSERT INTO Borrowing_duration VALUES (0, 1, 5);
INSERT INTO Borrowing_duration VALUES (0, 2, 4);
INSERT INTO Borrowing_duration VALUES (0, 3, 3);
INSERT INTO Borrowing_duration VALUES (1, 0, 11);
INSERT INTO Borrowing_duration VALUES (1, 1, 4);
INSERT INTO Borrowing_duration VALUES (1, 2, 3);
INSERT INTO Borrowing_duration VALUES (1, 3, 2);
INSERT INTO Borrowing_duration VALUES (2, 0, 3);
INSERT INTO Borrowing_duration VALUES (2, 1, 3);
INSERT INTO Borrowing_duration VALUES (2, 2, 2);
INSERT INTO Borrowing_duration VALUES (2, 3, 1);

-- Document
INSERT INTO Document VALUES (0, 'Harry Potter', 0, 0, 0, 0);
INSERT INTO Document VALUES (1, 'Blanche fesses et les sept mains', 0, 2, 0, 0);

-- Document_author
INSERT INTO Document_author VALUES (0, 0);

-- Document_keyword
INSERT INTO Document_keyword VALUES (0, 0);
INSERT INTO Document_keyword VALUES (0, 1);

-- Copy
INSERT INTO Copy VALUES (1, 0, 100);
INSERT INTO Copy VALUES (2, 0, 100);
INSERT INTO Copy VALUES (3, 0, 100);
INSERT INTO Copy VALUES (4, 0, 100);
DELETE FROM Copy Where COPY_ID = 4 AND DOCUMENT_ID = 0;

-- Borrow
INSERT INTO Borrow VALUES (0, 1, 0, TO_DATE('22/04/2021', 'DD/MM/YYYY'), null);

-- Book
INSERT INTO Book VALUES (0, 500); -- insertion réussi
INSERT INTO Book VALUES (1, 7);   -- pas d'insertion car le document 1 n'est pas un livre
UPDATE Book SET page_number = 250 WHERE document_id = 0; -- modification authorisée
UPDATE Book SET document_id = 1 WHERE page_number = 250; -- modification non authorisée

-- Cd

-- DVD

-- Video