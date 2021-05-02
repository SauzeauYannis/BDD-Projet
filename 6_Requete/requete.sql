-- Requêtes


-- 1
-- Liste par ordre alphabétique des titres de documents dont le thème comprend le mot
-- informatique ou mathématiques.

SELECT D.title AS Titre, T.word AS Theme
FROM Document D,
     Theme T
WHERE D.theme_id = T.theme_id
  AND (T.word = 'Informatique' OR T.word = 'Mathématiques')
ORDER BY title;


-- 2
-- Liste (titre et thème) des documents empruntés par Dupont entre le 15/11/2018 et le
-- 15/11/2019

SELECT D.title AS Titre, T.word AS Theme
FROM Borrow B,
     Borrower Bwer,
     Document D,
     Theme T
WHERE B.borrower_id = Bwer.borrower_id
  AND B.document_id = D.document_id
  AND D.theme_id = T.theme_id
  AND Bwer.last_name = 'Dupont'
  AND TO_DATE('15/11/2018', 'DD/MM/YYYY') <= B.borrow_date
  AND B.borrow_date <= TO_DATE('15/11/2019', 'DD/MM/YYYY');


-- 3
-- Pour chaque emprunteur, donner la liste des titres des documents qu'il a empruntés avec le
-- nom des auteurs pour chaque document.

SELECT Bwer.last_name || ' ' || Bwer.first_name            AS Emprunteur,
       D.title                                             AS Titre,
       LISTAGG(A.last_name || ' ' || A.first_name, ' et ') AS Auteur
FROM Borrow B,
     Borrower Bwer,
     Author A,
     Document D,
     Document_author DA
WHERE B.borrower_id = Bwer.borrower_id
  AND D.document_id = B.document_id
  AND D.document_id = DA.document_id
  AND DA.author_id = A.author_id
GROUP BY A.last_name, Bwer.first_name, Bwer.last_name, D.title;


-- TODO Requete 4
-- 4
-- Noms des auteurs ayant écrit un livre édité chez Dunod. Attention : cette requête est à
-- exécuter sur la base d'un autre collègue qui doit vous autoriser à lire certaines tables (uniquement
-- celles qui sont utiles pour la requête).

SELECT DISTINCT A.last_name AS Nom, A.first_name AS Prenom
FROM Author A,
     Publisher P,
     Document D,
     Document_author DA
WHERE A.author_id = DA.author_id
  AND DA.document_id = D.document_id
  AND D.publisher_id = P.detail_id
  AND P.name = 'Dunod'
ORDER BY A.last_name;


-- 5
-- Quantité totale des exemplaires édités chez Eyrolles

SELECT COUNT(*) AS Quantite
FROM Document D,
     Copy C,
     PUBLISHER P
WHERE P.name = 'Eyrolles'
  AND D.publisher_id = P.detail_id
  AND C.document_id = D.document_id;


-- 6
-- Pour chaque éditeur, nombre de documents présents à la bibliothèque.

SELECT P.name AS Editeur, COUNT(C.copy_id) as Nombre_de_documents
FROM Publisher P,
     Document D,
     Copy C
WHERE P.detail_id = D.publisher_id
  AND D.document_id = C.document_id
GROUP BY P.name
ORDER BY P.name;


-- 7
-- Pour chaque document, nombre de fois où il a été emprunté.

SELECT D.title AS Titre, COUNT(D.title) AS Nombre_d_empunts
FROM Borrow B,
     Copy C,
     DOCUMENT D
WHERE B.copy_id = C.copy_id
  AND B.document_id = C.document_id
  AND D.document_id = C.document_id
GROUP BY D.title;


-- 8
-- Liste des éditeurs ayant édité plus de deux documents d'informatique ou de mathématiques.

SELECT P.name AS Editeur, COUNT(P.name) AS Nombre_d_edition
FROM Publisher P,
     Document D,
     Theme T
WHERE D.publisher_id = P.detail_id
  AND D.theme_id = T.theme_id
  AND (T.word = 'Informatique' OR T.word = 'Mathématique')
HAVING COUNT(P.name) >= 2
GROUP BY P.name
ORDER BY P.name;


-- 9
-- Noms des emprunteurs habitant la même adresse que Dupont.

SELECT PD.street AS Adresse, PD.postcode AS Code_postal, PD.city AS Ville, B.last_name AS Nom, B.first_name AS Prenom
FROM Borrower B,
     Personal_detail PD
WHERE B.detail_id = PD.detail_id
  AND B.detail_id IN (SELECT detail_id
                      FROM Borrower
                      WHERE last_name = 'Dupont');


-- 10
-- Liste des éditeurs n'ayant pas édité de documents d'informatique

SELECT DISTINCT P.name AS Editeur
FROM Publisher P,
     Document D
WHERE D.publisher_id = P.detail_id
  AND D.theme_id NOT IN (SELECT T.theme_id
                         FROM Theme T
                         WHERE T.word = 'Informatique')
ORDER BY P.name;


-- 11
-- Noms des personnes n'ayant jamais emprunté de documents

SELECT DISTINCT Bwer.first_name || ' ' || Bwer.last_name AS Emprunteur
FROM Borrower Bwer
WHERE Bwer.borrower_id NOT IN (SELECT Bwer.borrower_id
                               FROM Borrow B,
                                    Borrower Ber
                               WHERE B.borrower_id = Bwer.borrower_id);


-- 12
-- Liste des documents n'ayant jamais été empruntés.

SELECT DISTINCT D.title AS Titre
FROM Document D,
     Borrow B
WHERE D.document_id NOT IN (SELECT D.document_id
                            FROM Document D,
                                 Borrow B
                            WHERE D.document_id = B.document_id)
ORDER BY D.title;


-- 13
-- Donnez la liste des emprunteurs (nom, prénom) appartenant à la catégorie des
-- professionnels ayant emprunté au moins une fois un dvd au cours des 6 derniers mois.

SELECT DISTINCT Bwer.first_name || ' ' || Bwer.last_name AS Emprunteur
FROM Borrower Bwer,
     Borrower_category BC,
     Borrow B
WHERE BC.category_name = 'Professionels'
  AND BC.borrower_category_id = Bwer.borrower_category_id
  AND Bwer.borrower_id = B.borrower_id
  AND (CURRENT_DATE - B.borrow_date) <= 6 * 30 -- 6 * 30 jours = 6 mois
  AND B.document_id IN (SELECT D.document_id
                        FROM Document D,
                             DOCUMENT_CATEGORY DC
                        WHERE D.document_category_id = DC.document_category_id
                          AND DC.category_name = 'DVD')
ORDER BY Emprunteur;


-- 14
-- Liste des documents dont le nombre d'exemplaires est supérieur au nombre moyen
-- d'exemplaires

SELECT title AS Titre
FROM Document
WHERE copy_number > (SELECT AVG(SUM(copy_number))
                     FROM Document D
                     GROUP BY document_id);

-- 15
-- Noms des auteurs ayant écrit des documents d'informatique et de mathématiques (ceux qui
-- ont écrit les deux).

SELECT DISTINCT A.last_name AS Nom_de_l_auteur
FROM Author A,
     Document_author DA,
     Document D,
     Theme T
WHERE T.theme_id = D.theme_id
  AND D.document_id = DA.document_id
  AND DA.author_id = A.author_id
  AND T.word = 'Informatique'
INTERSECT
SELECT DISTINCT A.last_name AS Nom_de_l_auteur
FROM Author A,
     Document_author DA,
     Document D,
     Theme T
WHERE T.theme_id = D.theme_id
  AND D.document_id = DA.document_id
  AND DA.author_id = A.author_id
  AND T.word = 'Mathématiques';


-- Création d'une vue
-- Compte le nombre de fois qu'un document a été emprunté

CREATE OR REPLACE VIEW My_Borrow AS
SELECT D.title, COUNT(B.document_id) AS borrowed_copy
FROM Borrow B,
     Document D
Where B.document_id = D.document_id
GROUP BY D.title;


-- 16
-- Editeur dont le nombre de documents empruntés est le plus grand

SELECT P.name AS Editeur
FROM Publisher P,
     Document D
WHERE D.publisher_id = P.detail_id
  AND D.title IN (SELECT title
                  FROM My_Borrow
                  WHERE borrowed_copy = (SELECT MAX(borrowed_copy)
                                         FROM My_Borrow))
ORDER BY P.name;


-- Création d'une vue
-- Recupère les mot-clef du document dont le titre est "SQL pour les nuls"

CREATE OR REPLACE VIEW SQL_nuls_keywords AS
SELECT K.word
FROM Document D,
     Document_keyword DK,
     Keyword K
WHERE D.document_id = DK.document_id
  AND DK.keyword_id = K.keyword_id
  AND D.title = 'SQL pour les nuls';


-- 17
-- Liste des documents n'ayant aucun mot-clef en commun avec le document dont le titre est
-- "SQL pour les nuls"

SELECT DISTINCT D.title AS Titre
FROM Document D,
     Keyword K,
     Document_keyword DK
WHERE D.document_id = DK.document_id
  AND DK.keyword_id = K.keyword_id
  AND NOT EXISTS(SELECT *
                 FROM SQL_nuls_keywords
                 WHERE K.word = SQL_nuls_keywords.word);


-- 18
-- Liste des documents ayant au moins un mot-clef en commun avec le document dont le titre est
-- "SQL pour les nuls

SELECT DISTINCT D.title AS Titre
FROM Document D,
     Keyword K,
     Document_keyword DK,
     SQL_nuls_keywords
WHERE D.document_id = DK.document_id
  AND DK.keyword_id = K.keyword_id
  AND K.word IN SQL_nuls_keywords.word;


-- 19
-- Liste des documents ayant au moins les mêmes mot-clef que le document dont le titre est
-- "SQL pour les nuls"

SELECT DISTINCT D.title AS Titre
FROM Document D,
     Keyword K,
     Document_keyword DK
WHERE D.document_id = DK.document_id
  AND DK.keyword_id = K.keyword_id
  AND EXISTS(SELECT *
             FROM SQL_nuls_keywords
             WHERE K.word = SQL_nuls_keywords.word);


-- 20
-- Liste des documents ayant exactement les mêmes mot-clef que le document dont le titre est
-- "SQL pour les nuls

SELECT DISTINCT D.title AS Titre
FROM Document D,
     Keyword K,
     Document_keyword DK
WHERE D.document_id = DK.document_id
  AND DK.keyword_id = K.keyword_id
  AND EXISTS(SELECT *
             FROM SQL_nuls_keywords
             WHERE K.word = SQL_nuls_keywords.word)
  AND D.document_id IN (SELECT document_id
                       FROM (SELECT document_id, COUNT(*) AS keywoards_number
                             FROM Document_keyword
                             GROUP BY document_id)
                       WHERE keywoards_number = (SELECT COUNT(*)
                                                 FROM SQL_nuls_keywords));