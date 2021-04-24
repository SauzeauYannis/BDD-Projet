-- Replissage des entités : auteur, éditeur et emprunteur


-- Auteurs

INSERT INTO Author (last_name, first_name, birth_date)
VALUES ('Rowling', 'J-K', TO_DATE('31/07/1965', 'DD/MM/YYYY'));


-- Coordonnées

INSERT INTO Personal_detail (phone_number, street, postcode, city, country)
VALUES ('02076315600', '50 Bedford Square', 'WC1B 3DP', 'London', 'England');

INSERT INTO Personal_detail (phone_number, street, postcode, city, country)
VALUES ('0612345678', '667 rue de la street', '93667', '667Land', 'France');


-- Editeurs

INSERT INTO Publisher (detail_id, name)
VALUES (1, 'Bloomsbury');


-- Emprunteurs

INSERT INTO Borrower (borrower_category_id, last_name, first_name, detail_id, current_number_borrow)
VALUES (1, 'Chevais', 'Benjamin', 2, 0);
