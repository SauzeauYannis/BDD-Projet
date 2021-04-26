-- Remplissage des documents et de tout ses attributs


-- Thèmes

INSERT INTO Theme (word)
VALUES ('Fantastique');

INSERT INTO Theme (word)
VALUES ('Informatique');

INSERT INTO Theme (word)
VALUES ('Mathématique');

INSERT INTO Theme (word)
VALUES ('Polar');


-- Mot clefs

INSERT INTO Keyword (word)
VALUES ('Magic');

INSERT INTO Keyword (word)
VALUES ('School');

INSERT INTO Keyword (word)
VALUES ('C');

INSERT INTO Keyword (word)
VALUES ('C++');

INSERT INTO Keyword (word)
VALUES ('Python');

INSERT INTO Keyword (word)
VALUES ('SQL');

INSERT INTO Keyword (word)
VALUES ('Java');

INSERT INTO Keyword (word)
VALUES ('Programmation');

INSERT INTO Keyword (word)
VALUES ('Base de données');


-- Documents

INSERT INTO Document (title, document_category_id, publisher_id, theme_id)
VALUES ('Harry Potter', 1, 1, 1);

INSERT INTO Document (title, document_category_id, publisher_id, theme_id)
VALUES ('Johnny Happy day', 2, 1, 1);

INSERT INTO Document (title, document_category_id, publisher_id, theme_id)
VALUES ('Blanche fesses et les sept mains', 3, 1, 1);

INSERT INTO Document (title, document_category_id, publisher_id, theme_id)
VALUES ('stepsis is stuck', 1, 1, 1);

INSERT INTO Document (title, document_category_id, publisher_id, theme_id)
VALUES ('SQL pour les nuls', 1, 5, 2);

INSERT INTO Document (title, document_category_id, publisher_id, theme_id)
VALUES ('Apprendre le C', 1, 3, 2);

INSERT INTO Document (title, document_category_id, publisher_id, theme_id)
VALUES ('Cours et exercices C', 1, 2, 2);

INSERT INTO Document (title, document_category_id, publisher_id, theme_id)
VALUES ('Apprendre le C++', 1, 3, 2);

INSERT INTO Document (title, document_category_id, publisher_id, theme_id)
VALUES ('Cours et exercices C++', 1, 2, 2);

INSERT INTO Document (title, document_category_id, publisher_id, theme_id)
VALUES ('Apprendre le Java', 1, 3, 2);

INSERT INTO Document (title, document_category_id, publisher_id, theme_id)
VALUES ('Cours et exercices Java', 1, 2, 2);

INSERT INTO Document (title, document_category_id, publisher_id, theme_id)
VALUES ('Apprendre le Python', 1, 3, 2);

INSERT INTO Document (title, document_category_id, publisher_id, theme_id)
VALUES ('Cours et exercices Python', 1, 2, 2);


-- Autheur(s) d'un document

INSERT INTO Document_author (document_id, author_id)
VALUES (1, 1);

INSERT INTO Document_author (document_id, author_id)
VALUES (5, 2);

INSERT INTO Document_author (document_id, author_id)
VALUES (6, 3);

INSERT INTO Document_author (document_id, author_id)
VALUES (8, 3);

INSERT INTO Document_author (document_id, author_id)
VALUES (10, 3);

INSERT INTO Document_author (document_id, author_id)
VALUES (12, 3);

INSERT INTO Document_author (document_id, author_id)
VALUES (7, 4);;

INSERT INTO Document_author (document_id, author_id)
VALUES (9, 4);;

INSERT INTO Document_author (document_id, author_id)
VALUES (11, 4);;

INSERT INTO Document_author (document_id, author_id)
VALUES (13, 4);;

INSERT INTO Document_author (document_id, author_id)
VALUES (6, 5);

INSERT INTO Document_author (document_id, author_id)
VALUES (8, 5);

INSERT INTO Document_author (document_id, author_id)
VALUES (8, 5);

INSERT INTO Document_author (document_id, author_id)
VALUES (11, 6);

INSERT INTO Document_author (document_id, author_id)
VALUES (13, 6);


-- Mot clef(s) d'un document

INSERT INTO Document_keyword (document_id, keyword_id)
VALUES (1, 1);

INSERT INTO Document_keyword (document_id, keyword_id)
VALUES (1, 2);

INSERT INTO Document_keyword (document_id, keyword_id)
VALUES (5, 6);

INSERT INTO Document_keyword (document_id, keyword_id)
VALUES (5, 9);


-- Livres

INSERT INTO Book (document_id, page_number)
VALUES (1, 500);

INSERT INTO Book (document_id, page_number)
VALUES (5, 480);


-- CD

INSERT INTO CD (document_id, duration, subtitle_number)
VALUES (2, 100, 200);


-- DVD

INSERT INTO DVD (document_id, duration)
VALUES (3, 180);


-- Vidéos

INSERT INTO VIDEO (document_id, duration, recording_format)
VALUES (4, 100, 'mp4');


-- Copies

INSERT INTO Copy (copy_id, document_id, shelf_number)
VALUES (1, 1, 100);

INSERT INTO Copy (copy_id, document_id, shelf_number)
VALUES (2, 1, 100);

INSERT INTO Copy (copy_id, document_id, shelf_number)
VALUES (3, 1, 100);

INSERT INTO Copy (copy_id, document_id, shelf_number)
VALUES (4, 1, 100);

INSERT INTO Copy (copy_id, document_id, shelf_number)
VALUES (1, 5, 200);