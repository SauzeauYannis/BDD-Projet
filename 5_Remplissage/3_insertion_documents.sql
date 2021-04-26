-- Remplissage des documents et de tout ses attributs


-- Thèmes

INSERT INTO Theme (word)
VALUES ('Fantastique');

INSERT INTO Theme (word)
VALUES ('Informatique');

INSERT INTO Theme (word)
VALUES ('Mathématiques');

INSERT INTO Theme (word)
VALUES ('Chanson française');

INSERT INTO Theme (word)
VALUES ('Film français');

INSERT INTO Theme (word)
VALUES ('Tutoriels');


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

INSERT INTO Keyword (word)
VALUES ('Statistque');

INSERT INTO Keyword (word)
VALUES ('Intégrale');

INSERT INTO Keyword (word)
VALUES ('Société');

INSERT INTO Keyword (word)
VALUES ('Jean Reno');


-- Documents

INSERT INTO Document (title, document_category_id, publisher_id, theme_id)
VALUES ('Harry Potter', 1, 1, 1);

INSERT INTO Document (title, document_category_id, publisher_id, theme_id)
VALUES ('Johnny Happy day', 2, 1, 1);

INSERT INTO Document (title, document_category_id, publisher_id, theme_id)
VALUES ('Blanche fesses et les sept mains', 3, 1, 1);

INSERT INTO Document (title, document_category_id, publisher_id, theme_id)
VALUES ('stepsis is stuck', 4, 1, 1);

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

INSERT INTO Document (title, document_category_id, publisher_id, theme_id)
VALUES ('Statistiques', 1, 4, 3);

INSERT INTO Document (title, document_category_id, publisher_id, theme_id)
VALUES ('Intégrale', 1, 4, 3);

INSERT INTO Document (title, document_category_id, publisher_id, theme_id)
VALUES ('Mistral Gagnant', 2, 6, 4);

INSERT INTO Document (title, document_category_id, publisher_id, theme_id)
VALUES ('Vendeurs de larmes', 2, 6, 4);

INSERT INTO Document (title, document_category_id, publisher_id, theme_id)
VALUES ('Léon', 3, 7, 5);

INSERT INTO Document (title, document_category_id, publisher_id, theme_id)
VALUES ('Le grand Bleu', 3, 7, 5);

INSERT INTO Document (title, document_category_id, publisher_id, theme_id)
VALUES ('Comment utiliser les pointeurs en C', 4, 8, 6);

INSERT INTO Document (title, document_category_id, publisher_id, theme_id)
VALUES ('Créer une classe en Java', 4, 8, 6);


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
VALUES (11, 6);

INSERT INTO Document_author (document_id, author_id)
VALUES (13, 6);

INSERT INTO Document_author (document_id, author_id)
VALUES (14, 7);

INSERT INTO Document_author (document_id, author_id)
VALUES (15, 7);

INSERT INTO Document_author (document_id, author_id)
VALUES (16, 8);

INSERT INTO Document_author (document_id, author_id)
VALUES (17, 9);

INSERT INTO Document_author (document_id, author_id)
VALUES (18, 10);

INSERT INTO Document_author (document_id, author_id)
VALUES (19, 10);

INSERT INTO Document_author (document_id, author_id)
VALUES (20, 11);

INSERT INTO Document_author (document_id, author_id)
VALUES (20, 3);

INSERT INTO Document_author (document_id, author_id)
VALUES (21, 11);


-- Mot clef(s) d'un document

INSERT INTO Document_keyword (document_id, keyword_id)
VALUES (1, 1);

INSERT INTO Document_keyword (document_id, keyword_id)
VALUES (1, 2);

INSERT INTO Document_keyword (document_id, keyword_id)
VALUES (5, 6);

INSERT INTO Document_keyword (document_id, keyword_id)
VALUES (5, 9);

INSERT INTO Document_keyword (document_id, keyword_id)
VALUES (6, 3);

INSERT INTO Document_keyword (document_id, keyword_id)
VALUES (6, 8);

INSERT INTO Document_keyword (document_id, keyword_id)
VALUES (7, 3);

INSERT INTO Document_keyword (document_id, keyword_id)
VALUES (7, 8);

INSERT INTO Document_keyword (document_id, keyword_id)
VALUES (8, 4);

INSERT INTO Document_keyword (document_id, keyword_id)
VALUES (8, 8);

INSERT INTO Document_keyword (document_id, keyword_id)
VALUES (9, 4);

INSERT INTO Document_keyword (document_id, keyword_id)
VALUES (9, 8);

INSERT INTO Document_keyword (document_id, keyword_id)
VALUES (10, 7);

INSERT INTO Document_keyword (document_id, keyword_id)
VALUES (10, 8);

INSERT INTO Document_keyword (document_id, keyword_id)
VALUES (11, 7);

INSERT INTO Document_keyword (document_id, keyword_id)
VALUES (11, 8);

INSERT INTO Document_keyword (document_id, keyword_id)
VALUES (12, 5);

INSERT INTO Document_keyword (document_id, keyword_id)
VALUES (12, 8);

INSERT INTO Document_keyword (document_id, keyword_id)
VALUES (13, 5);

INSERT INTO Document_keyword (document_id, keyword_id)
VALUES (13, 8);

INSERT INTO Document_keyword (document_id, keyword_id)
VALUES (14, 10);

INSERT INTO Document_keyword (document_id, keyword_id)
VALUES (15, 11);

INSERT INTO Document_keyword (document_id, keyword_id)
VALUES (16, 12);

INSERT INTO Document_keyword (document_id, keyword_id)
VALUES (17, 12);

INSERT INTO Document_keyword (document_id, keyword_id)
VALUES (18, 13);

INSERT INTO Document_keyword (document_id, keyword_id)
VALUES (19, 13);

INSERT INTO Document_keyword (document_id, keyword_id)
VALUES (20, 3);

INSERT INTO Document_keyword (document_id, keyword_id)
VALUES (20, 8);

INSERT INTO Document_keyword (document_id, keyword_id)
VALUES (21, 7);

INSERT INTO Document_keyword (document_id, keyword_id)
VALUES (21, 8);


-- Livres

INSERT INTO Book (document_id, page_number)
VALUES (1, 500);

INSERT INTO Book (document_id, page_number)
VALUES (5, 480);

INSERT INTO Book (document_id, page_number)
VALUES (6, 504);

INSERT INTO Book (document_id, page_number)
VALUES (7, 323);

INSERT INTO Book (document_id, page_number)
VALUES (8, 365);

INSERT INTO Book (document_id, page_number)
VALUES (9, 387);

INSERT INTO Book (document_id, page_number)
VALUES (10, 465);

INSERT INTO Book (document_id, page_number)
VALUES (11, 356);

INSERT INTO Book (document_id, page_number)
VALUES (12, 378);

INSERT INTO Book (document_id, page_number)
VALUES (13, 426);

INSERT INTO Book (document_id, page_number)
VALUES (14, 345);

INSERT INTO Book (document_id, page_number)
VALUES (15, 423);


-- CD

INSERT INTO CD (document_id, duration, subtitle_number)
VALUES (2, 100, 200);

INSERT INTO CD (document_id, duration, subtitle_number)
VALUES (16, 47, 765);

INSERT INTO CD (document_id, duration, subtitle_number)
VALUES (17, 54, 237);


-- DVD

INSERT INTO DVD (document_id, duration)
VALUES (3, 180);

INSERT INTO DVD (document_id, duration)
VALUES (18, 187);

INSERT INTO DVD (document_id, duration)
VALUES (19, 164);


-- Vidéos

INSERT INTO VIDEO (document_id, duration, recording_format)
VALUES (4, 100, 'mp4');

INSERT INTO VIDEO (document_id, duration, recording_format)
VALUES (20, 12, 'mkv');

INSERT INTO VIDEO (document_id, duration, recording_format)
VALUES (21, 10, 'mp4');


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

INSERT INTO Copy (copy_id, document_id, shelf_number)
VALUES (2, 5, 200);

INSERT INTO Copy (copy_id, document_id, shelf_number)
VALUES (3, 5, 200);

INSERT INTO Copy (copy_id, document_id, shelf_number)
VALUES (4, 5, 200);

INSERT INTO Copy (copy_id, document_id, shelf_number)
VALUES (1, 6, 200);

INSERT INTO Copy (copy_id, document_id, shelf_number)
VALUES (2, 6, 200);

INSERT INTO Copy (copy_id, document_id, shelf_number)
VALUES (3, 6, 200);

INSERT INTO Copy (copy_id, document_id, shelf_number)
VALUES (4, 6, 200);

INSERT INTO Copy (copy_id, document_id, shelf_number)
VALUES (1, 7, 200);

INSERT INTO Copy (copy_id, document_id, shelf_number)
VALUES (2, 7, 200);

INSERT INTO Copy (copy_id, document_id, shelf_number)
VALUES (3, 7, 200);

INSERT INTO Copy (copy_id, document_id, shelf_number)
VALUES (4, 7, 200);

INSERT INTO Copy (copy_id, document_id, shelf_number)
VALUES (1, 8, 200);

INSERT INTO Copy (copy_id, document_id, shelf_number)
VALUES (2, 8, 200);

INSERT INTO Copy (copy_id, document_id, shelf_number)
VALUES (3, 8, 200);

INSERT INTO Copy (copy_id, document_id, shelf_number)
VALUES (4, 8, 200);

INSERT INTO Copy (copy_id, document_id, shelf_number)
VALUES (1, 9, 200);

INSERT INTO Copy (copy_id, document_id, shelf_number)
VALUES (2, 9, 200);

INSERT INTO Copy (copy_id, document_id, shelf_number)
VALUES (3, 9, 200);

INSERT INTO Copy (copy_id, document_id, shelf_number)
VALUES (4, 9, 200);

INSERT INTO Copy (copy_id, document_id, shelf_number)
VALUES (1, 10, 200);

INSERT INTO Copy (copy_id, document_id, shelf_number)
VALUES (2, 10, 200);

INSERT INTO Copy (copy_id, document_id, shelf_number)
VALUES (3, 10, 200);

INSERT INTO Copy (copy_id, document_id, shelf_number)
VALUES (4, 10, 200);

INSERT INTO Copy (copy_id, document_id, shelf_number)
VALUES (1, 11, 200);

INSERT INTO Copy (copy_id, document_id, shelf_number)
VALUES (2, 11, 200);

INSERT INTO Copy (copy_id, document_id, shelf_number)
VALUES (3, 11, 200);

INSERT INTO Copy (copy_id, document_id, shelf_number)
VALUES (4, 11, 200);

INSERT INTO Copy (copy_id, document_id, shelf_number)
VALUES (1, 12, 200);

INSERT INTO Copy (copy_id, document_id, shelf_number)
VALUES (2, 12, 200);

INSERT INTO Copy (copy_id, document_id, shelf_number)
VALUES (3, 12, 200);

INSERT INTO Copy (copy_id, document_id, shelf_number)
VALUES (4, 12, 200);

INSERT INTO Copy (copy_id, document_id, shelf_number)
VALUES (1, 13, 200);

INSERT INTO Copy (copy_id, document_id, shelf_number)
VALUES (2, 13, 200);

INSERT INTO Copy (copy_id, document_id, shelf_number)
VALUES (3, 13, 200);

INSERT INTO Copy (copy_id, document_id, shelf_number)
VALUES (4, 13, 200);

INSERT INTO Copy (copy_id, document_id, shelf_number)
VALUES (1, 14, 300);

INSERT INTO Copy (copy_id, document_id, shelf_number)
VALUES (2, 14, 300);

INSERT INTO Copy (copy_id, document_id, shelf_number)
VALUES (3, 14, 300);

INSERT INTO Copy (copy_id, document_id, shelf_number)
VALUES (4, 14, 300);

INSERT INTO Copy (copy_id, document_id, shelf_number)
VALUES (1, 15, 300);

INSERT INTO Copy (copy_id, document_id, shelf_number)
VALUES (2, 15, 300);

INSERT INTO Copy (copy_id, document_id, shelf_number)
VALUES (3, 15, 300);

INSERT INTO Copy (copy_id, document_id, shelf_number)
VALUES (4, 15, 300);

INSERT INTO Copy (copy_id, document_id, shelf_number)
VALUES (1, 16, 400);

INSERT INTO Copy (copy_id, document_id, shelf_number)
VALUES (2, 16, 400);

INSERT INTO Copy (copy_id, document_id, shelf_number)
VALUES (3, 16, 400);

INSERT INTO Copy (copy_id, document_id, shelf_number)
VALUES (4, 16, 400);

INSERT INTO Copy (copy_id, document_id, shelf_number)
VALUES (1, 17, 400);

INSERT INTO Copy (copy_id, document_id, shelf_number)
VALUES (2, 17, 400);

INSERT INTO Copy (copy_id, document_id, shelf_number)
VALUES (3, 17, 400);

INSERT INTO Copy (copy_id, document_id, shelf_number)
VALUES (4, 17, 400);

INSERT INTO Copy (copy_id, document_id, shelf_number)
VALUES (1, 18, 500);

INSERT INTO Copy (copy_id, document_id, shelf_number)
VALUES (2, 18, 500);

INSERT INTO Copy (copy_id, document_id, shelf_number)
VALUES (3, 18, 500);

INSERT INTO Copy (copy_id, document_id, shelf_number)
VALUES (4, 18, 500);

INSERT INTO Copy (copy_id, document_id, shelf_number)
VALUES (1, 19, 500);

INSERT INTO Copy (copy_id, document_id, shelf_number)
VALUES (2, 19, 500);

INSERT INTO Copy (copy_id, document_id, shelf_number)
VALUES (3, 19, 500);

INSERT INTO Copy (copy_id, document_id, shelf_number)
VALUES (4, 19, 500);

INSERT INTO Copy (copy_id, document_id, shelf_number)
VALUES (1, 20, 600);

INSERT INTO Copy (copy_id, document_id, shelf_number)
VALUES (2, 20, 600);

INSERT INTO Copy (copy_id, document_id, shelf_number)
VALUES (3, 20, 600);

INSERT INTO Copy (copy_id, document_id, shelf_number)
VALUES (4, 20, 600);

INSERT INTO Copy (copy_id, document_id, shelf_number)
VALUES (1, 21, 600);

INSERT INTO Copy (copy_id, document_id, shelf_number)
VALUES (2, 21, 600);

INSERT INTO Copy (copy_id, document_id, shelf_number)
VALUES (3, 21, 600);

INSERT INTO Copy (copy_id, document_id, shelf_number)
VALUES (4, 21, 600);