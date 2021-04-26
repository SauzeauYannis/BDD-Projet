-- Remplissage des documents et de tout ses attributs


-- Thèmes

INSERT INTO Theme (word)
VALUES ('Fantastic');


-- Mot clefs

INSERT INTO Keyword (word)
VALUES ('Magic');

INSERT INTO Keyword (word)
VALUES ('School');


-- Documents

INSERT INTO Document (title, document_category_id, publisher_id, theme_id)
VALUES ('Harry Potter', 1, 1, 1);

INSERT INTO Document (title, document_category_id, publisher_id, theme_id)
VALUES ('Johnny Happy day', 2, 1, 1);

INSERT INTO Document (title, document_category_id, publisher_id, theme_id)
VALUES ('Blanche fesses et les sept mains', 3, 1, 1);

INSERT INTO Document (title, document_category_id, publisher_id, theme_id)
VALUES ('stepsis is stuck', 4, 1, 1);


-- Autheur(s) d'un document

INSERT INTO Document_author (document_id, author_id)
VALUES (1, 1);


-- Mot clef(s) d'un document

INSERT INTO Document_keyword (document_id, keyword_id)
VALUES (1, 1);

INSERT INTO Document_keyword (document_id, keyword_id)
VALUES (1, 2);


-- Livres

INSERT INTO Book (document_id, page_number)
VALUES (1, 500);


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
