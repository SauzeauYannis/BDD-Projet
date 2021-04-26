-- Requete

-- 1
-- Liste par ordre alphabétique des titres de documents dont le thème comprend le mot
-- informatique ou mathématiques.

SELECT D.title, T.word
FROM Document D,
     Theme T
WHERE D.theme_id = T.theme_id
  AND (T.word = 'Informatique' OR T.word = 'Mathématiques')
ORDER BY title;

-- 2
-- Liste (titre et thème) des documents empruntés par Dupont entre le 15/11/2018 et le
-- 15/11/2019

SELECT D.title, T.word
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

-- TODO trouver le moyen de regrouper des lignes
-- 3
-- Pour chaque emprunteur, donner la liste des titres des documents qu'il a empruntés avec le
-- nom des auteurs pour chaque document.

SELECT Bwer.last_name, Bwer.first_name, D.title, A.last_name, A.first_name
FROM Borrow B,
     Borrower Bwer,
     Author A,
     Document D,
     DOCUMENT_AUTHOR DA
WHERE B.borrower_id = Bwer.borrower_id
  AND D.document_id = B.document_id
  AND D.document_id = DA.document_id
  AND DA.author_id = A.author_id;


-- TODO Requete 4
-- 4
-- Noms des auteurs ayant écrit un livre édité chez Dunod. Attention : cette requête est à
-- exécuter sur la base d'un autre collègue qui doit vous autoriser à lire certaines tables (uniquement
-- celles qui sont utiles pour la requête).

SELECT A.last_name, A.first_name
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

SELECT Count(*)
FROM Document D,
     Copy C,
     PUBLISHER P
WHERE P.name = 'Eyrolles'
  AND D.publisher_id = P.detail_id
  AND C.document_id = D.document_id;


-- 6
-- Pour chaque éditeur, nombre de documents présents à la bibliothèque.

SELECT P.name, count(C.copy_id) as Nombre_de_document
FROM Publisher P,
     Document D,
     Copy C
WHERE P.detail_id = D.publisher_id
  AND D.document_id = C.document_id
GROUP BY P.name
ORDER BY P.name;


-- 7
-- Pour chaque document, nombre de fois où il a été emprunté.

SELECT D.title, Count(D.title) as nb_emprunte
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

SELECT P.name, Count(P.name) as nb_document_edite
FROM Publisher P,
     Document D,
     Theme T
WHERE D.publisher_id = P.detail_id
  AND D.theme_id = T.theme_id
  AND (T.word = 'Informatique' OR T.word = 'Mathématique')
HAVING Count(P.name) >= 2
GROUP BY P.name
ORDER BY P.name;

-- TODO Requete 9
-- 9
-- Noms des emprunteurs habitant la même adresse que Dupont.

SELECT Pd.street, PD.postcode, Pd.city, B1.last_name, B1.first_name
FROM Borrower B1,
     Personal_detail PD
WHERE B1.detail_id = PD.detail_id
  AND B1.detail_id IN (SELECT B2.detail_id
                       from BORROWER B2
                       where B2.last_name = 'Dupont');


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
