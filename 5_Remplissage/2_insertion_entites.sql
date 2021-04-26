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

INSERT INTO Author (last_name, first_name, birth_date)
VALUES ('Monka', 'Yves', TO_DATE('31/07/1965', 'DD/MM/YYYY'));

INSERT INTO Author (last_name, birth_date)
VALUES ('Renaud', TO_DATE('31/07/1965', 'DD/MM/YYYY'));

INSERT INTO Author (last_name, first_name, birth_date)
VALUES ('Balavoine', 'Daniel', TO_DATE('31/07/1965', 'DD/MM/YYYY'));

INSERT INTO Author (last_name, first_name, birth_date)
VALUES ('Besson', 'Luc', TO_DATE('31/07/1965', 'DD/MM/YYYY'));

INSERT INTO Author (last_name, birth_date)
VALUES ('Programmation facile', TO_DATE('31/07/1965', 'DD/MM/YYYY'));


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
VALUES ('0134256152', '6 avenue univers', '75000', 'Paris', 'France');

INSERT INTO Personal_detail (phone_number, street, postcode, city, country)
VALUES ('0139387622', '7 boulevard frères Lumière', '75000', 'Paris', 'France');

INSERT INTO Personal_detail (phone_number, street, postcode, city, country)
VALUES ('0189736256', '8 impasse du miroir', '75000', 'Paris', 'France');

INSERT INTO Personal_detail (phone_number, street, postcode, city, country)
VALUES ('0612345678', '9 rue de la street', '93667', '667Land', 'France');

INSERT INTO Personal_detail (phone_number, street, postcode, city, country)
VALUES ('0556575647', '10 rue de Dupont', '13000', 'Marseille', 'France');

INSERT INTO Personal_detail (phone_number, street, postcode, city, country)
VALUES ('4446567198', '11 rue detunes', '25419', 'Los Angeles', 'Etats-Unis');

INSERT INTO Personal_detail (phone_number, street, postcode, city, country)
VALUES ('0576517398', '12 avenue des coloques', '86000', 'Poitiers', 'France');



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

INSERT INTO Publisher (detail_id, name)
VALUES (6, 'Universal Music');

INSERT INTO Publisher (detail_id, name)
VALUES (7, 'Pathé');

INSERT INTO Publisher (detail_id, name)
VALUES (8, 'Youtube Originals');


-- Emprunteurs

INSERT INTO Borrower (borrower_category_id, last_name, first_name, detail_id)
VALUES (1, 'Chevais', 'Benjamin', 9);

INSERT INTO Borrower (borrower_category_id, last_name, first_name, detail_id)
VALUES (1, 'Andrianarivony', 'Henintsoa', 9);

INSERT INTO Borrower (borrower_category_id, last_name, first_name, detail_id)
VALUES (1, 'Sauzeau', 'Yannis', 9);

INSERT INTO Borrower (borrower_category_id, last_name, first_name, detail_id)
VALUES (1, 'Dupont', 'Michel', 10);

INSERT INTO Borrower (borrower_category_id, last_name, first_name, detail_id)
VALUES (1, 'Macé', 'Jean', 10);

INSERT INTO Borrower (borrower_category_id, last_name, first_name, detail_id)
VALUES (2, 'Musk', 'Elon', 11);

INSERT INTO Borrower (borrower_category_id, last_name, first_name, detail_id)
VALUES (2, 'Cook', 'Tim', 11);

INSERT INTO Borrower (borrower_category_id, last_name, first_name, detail_id)
VALUES (2, 'Ma', 'Jack', 11);

INSERT INTO Borrower (borrower_category_id, last_name, first_name, detail_id)
VALUES (2, 'Page', 'Larry', 11);

INSERT INTO Borrower (borrower_category_id, last_name, first_name, detail_id)
VALUES (2, 'Gates', 'Bill', 11);

INSERT INTO Borrower (borrower_category_id, last_name, first_name, detail_id)
VALUES (3, 'Subrenat', 'Gilles', 12);

INSERT INTO Borrower (borrower_category_id, last_name, first_name, detail_id)
VALUES (3, 'Bergey', 'Antoine', 12);

INSERT INTO Borrower (borrower_category_id, last_name, first_name, detail_id)
VALUES (3, 'Fuchs', 'Laurent', 12);

INSERT INTO Borrower (borrower_category_id, last_name, first_name, detail_id)
VALUES (3, 'Peltier', 'Samuel', 12);

INSERT INTO Borrower (borrower_category_id, last_name, first_name, detail_id)
VALUES (3, 'Andres', 'Eric', 12);
