-- Replissage des catégories d'emprunteurs et des catégories de documents
-- ainsi que la durée d'emprunt d'une catégori de document par une catégorie
-- d'emprunteur


-- Catégories d'emprunteurs

INSERT INTO Borrower_category (category_name, max_borrowing_number)
VALUES ('Personnel', 10);

INSERT INTO Borrower_category (category_name, max_borrowing_number)
VALUES ('Professionels', 5);

INSERT INTO Borrower_category (category_name, max_borrowing_number)
VALUES ('Public', 3);


-- Catégories de documents

INSERT INTO Document_category (category_name)
VALUES ('Livre');

INSERT INTO Document_category (category_name)
VALUES ('CD');

INSERT INTO Document_category (category_name)
VALUES ('DVD');

INSERT INTO Document_category (category_name)
VALUES ('Video');


-- Durées d'emprunts

-- Personnel
-- Livre

INSERT INTO Borrowing_duration (borrower_category_id, document_category_id, duration)
VALUES (1, 1, 9);

-- CD

INSERT INTO Borrowing_duration (borrower_category_id, document_category_id, duration)
VALUES (1, 2, 5);

-- DVD

INSERT INTO Borrowing_duration (borrower_category_id, document_category_id, duration)
VALUES (1, 3, 4);

-- Vidéo

INSERT INTO Borrowing_duration (borrower_category_id, document_category_id, duration)
VALUES (1, 4, 3);

-- Professionnel
-- Livre

INSERT INTO Borrowing_duration (borrower_category_id, document_category_id, duration)
VALUES (2, 1, 11);

-- CD

INSERT INTO Borrowing_duration (borrower_category_id, document_category_id, duration)
VALUES (2, 2, 4);

-- DVD

INSERT INTO Borrowing_duration (borrower_category_id, document_category_id, duration)
VALUES (2, 3, 3);

-- Vidéo

INSERT INTO Borrowing_duration (borrower_category_id, document_category_id, duration)
VALUES (2, 4, 2);

-- Public
-- Livre

INSERT INTO Borrowing_duration (borrower_category_id, document_category_id, duration)
VALUES (3, 1, 3);

-- CD

INSERT INTO Borrowing_duration (borrower_category_id, document_category_id, duration)
VALUES (3, 2, 3);

-- DVD

INSERT INTO Borrowing_duration (borrower_category_id, document_category_id, duration)
VALUES (3, 3, 2);

-- Vidéo

INSERT INTO Borrowing_duration (borrower_category_id, document_category_id, duration)
VALUES (3, 4, 1);
