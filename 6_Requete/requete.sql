-- Requêtes


-- 1
-- Liste par ordre alphabétique des titres de documents dont le thème comprend le mot
-- informatique ou mathématiques.

SELECT D.title AS Titre, T.word AS Thème
FROM Document D,
     Theme T
WHERE D.theme_id = T.theme_id
  AND (T.word = 'Informatique' OR T.word = 'Mathématiques')
ORDER BY title;


-- 2
-- Liste (titre et thème) des documents empruntés par Dupont entre le 15/11/2018 et le
-- 15/11/2019

SELECT D.title AS Titre, T.word AS Thème
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
GROUP BY A.LAST_NAME, Bwer.first_name, Bwer.last_name, D.title;


-- TODO Requete 4
-- 4
-- Noms des auteurs ayant écrit un livre édité chez Dunod. Attention : cette requête est à
-- exécuter sur la base d'un autre collègue qui doit vous autoriser à lire certaines tables (uniquement
-- celles qui sont utiles pour la requête).

SELECT A.last_name AS Nom, A.first_name AS Prénom
FROM Author A,
     Publisher P,
     Document D,
     Document_author DA
WHERE A.author_id = DA.author_id
  AND DA.document_id = D.document_id
  AND D.publisher_id = P.detail_id
  AND P.name = 'Dunod'
GROUP BY (A.last_name, A.first_name)
ORDER BY A.last_name;


-- 5
-- Quantité totale des exemplaires édités chez Eyrolles

SELECT COUNT(*) AS Quantité
FROM Document D,
     Copy C,
     PUBLISHER P
WHERE P.name = 'Eyrolles'
  AND D.publisher_id = P.detail_id
  AND C.document_id = D.document_id;


-- 6
-- Pour chaque éditeur, nombre de documents présents à la bibliothèque.

SELECT P.name AS Editeur, COUNT(C.copy_id) as Nombre_de_document
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


-- TODO Requete 8
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


-- TODO Requete 9
-- 9
-- Noms des emprunteurs habitant la même adresse que Dupont.

SELECT PD.street AS Adresse, PD.postcode AS Code_postal, PD.city AS Ville, B.last_name AS Nom, B.first_name AS Prénom
FROM Borrower B,
     Personal_detail PD
WHERE B.detail_id = PD.detail_id
  AND B.detail_id IN (SELECT detail_id
                      FROM Borrower
                      WHERE last_name = 'Dupont');


-- TODO Requete 10
-- 10


-- TODO Requete 11
-- 11


-- TODO Requete 12
-- 12


-- TODO Requete 13
-- 13


-- TODO Requete 14
-- 14


-- TODO Requete 15
-- 15


-- TODO Requete 16
-- 16


-- TODO Requete 17
-- 17


-- TODO Requete 18
-- 18


-- TODO Requete 19
-- 19


-- TODO Requete 20
-- 20
