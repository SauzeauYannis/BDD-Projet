-- Replissage des entités : auteur, éditeur et emprunteur


-- Auteurs

INSERT INTO Author (last_name, first_name, birth_date)
VALUES ('Rowling', 'J-K', TO_DATE('31/07/1965', 'DD/MM/YYYY'));

INSERT INTO Author (last_name, first_name, birth_date)
VALUES ('Taylor', 'Allan-G', TO_DATE('15/03/1972', 'DD/MM/YYYY'));

INSERT INTO Author (last_name, first_name, birth_date)
VALUES ('Delannoy', 'Claude', TO_DATE('31/07/1965', 'DD/MM/YYYY'));

INSERT INTO Author (last_name, first_name, birth_date)
VALUES ('Roland', 'Julien', TO_DATE('31/07/1965', 'DD/MM/YYYY'));

INSERT INTO Author (last_name, first_name, birth_date)
VALUES ('Raymond', 'Jean', TO_DATE('31/07/1965', 'DD/MM/YYYY'));

INSERT INTO Author (last_name, first_name, birth_date)
VALUES ('Haynard', 'Estelle', TO_DATE('31/07/1965', 'DD/MM/YYYY'));


-- Coordonnées

INSERT INTO Personal_detail (phone_number, street, postcode, city, country)
VALUES ('02076315600', '50 Bedford Square', 'WC1B 3DP', 'London', 'England');

INSERT INTO Personal_detail (phone_number, street, postcode, city, country)
VALUES ('0141236600', '11 rue Paul Bert', '92247', 'Paris', 'France');

INSERT INTO Personal_detail (phone_number, street, postcode, city, country)
VALUES ('0144414187', '61 boulevard saint-germain', '75240', 'Paris', 'France');

INSERT INTO Personal_detail (phone_number, street, postcode, city, country)
VALUES ('0135873652', '12 rue des rosiers', '75014', 'Paris', 'France');

INSERT INTO Personal_detail (phone_number, street, postcode, city, country)
VALUES ('0144160900', '92 avenue de france', '75013', 'Paris', 'France');

INSERT INTO Personal_detail (phone_number, street, postcode, city, country)
VALUES ('0612345678', '667 rue de la street', '93667', '667Land', 'France');

INSERT INTO Personal_detail (phone_number, street, postcode, city, country)
VALUES ('0556575647', '7 rue de Dupont', '13000', 'Marseille', 'France');


-- Editeurs

INSERT INTO Publisher (detail_id, name)
VALUES (1, 'Bloomsbury');

INSERT INTO Publisher (detail_id, name)
VALUES (2, 'Dunod');

INSERT INTO Publisher (detail_id, name)
VALUES (3, 'Eyrolles');

INSERT INTO Publisher (detail_id, name)
VALUES (4, 'MathenFolie');

INSERT INTO Publisher (detail_id, name)
VALUES (5, 'First');


-- Emprunteurs

INSERT INTO Borrower (borrower_category_id, last_name, first_name, detail_id)
VALUES (1, 'Chevais', 'Benjamin', 6);

INSERT INTO Borrower (borrower_category_id, last_name, first_name, detail_id)
VALUES (1, 'Andrianarivony', 'Henintsoa', 6);

INSERT INTO Borrower (borrower_category_id, last_name, first_name, detail_id)
VALUES (1, 'Sauzeau', 'Yannis', 6);

INSERT INTO Borrower (borrower_category_id, last_name, first_name, detail_id)
VALUES (1, 'Dupont', 'Charles', 7);

INSERT INTO Borrower (borrower_category_id, last_name, first_name, detail_id)
VALUES (1, 'Macé', 'Jean', 7);
