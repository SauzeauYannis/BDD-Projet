-- Optimisation des requêtes

-- Création des index

-- INDEX B-tree sur l'attribut word de la table Theme
CREATE INDEX index_theme_word ON Theme (word);

-- INDEX B-tree sur l'attribut last_name de la table Borrower
CREATE INDEX index_borrower_last_name ON Borrower (last_name);

-- INDEX B-tree sur l'attribut name de la table Publisher
CREATE INDEX index_publisher_name ON Publisher (name);

-- INDEX B-tree sur l'attribut category_name de la table Borrower_category
CREATE INDEX index_borrower_category_category_name ON Borrower_category (category_name);

-- INDEX B-tree sur l'attribut category_name de la table Document_category
CREATE INDEX index_document_category_category_name ON Document_category (category_name);


-- Requêtes optimisés

-- 1)
SELECT /*+ INDEX(T.word index_theme_word) */ D.title AS Titre, T.word AS Theme
FROM Document D,
     Theme T
WHERE D.theme_id = T.theme_id
  AND (T.word = 'Informatique' OR T.word = 'Mathématiques')
ORDER BY title;

-- 2)
SELECT /*+ INDEX(last_name index_borrower_last_name) */ D.title AS Titre, T.word AS Theme
FROM Document D,
     Theme T,
     (SELECT B.document_id
      FROM Borrow B,
           (SELECT borrower_id
            FROM Borrower
            WHERE last_name = 'Dupont'
           ) Bwer
      WHERE B.borrower_id = Bwer.borrower_id
        AND TO_DATE('15/11/2018', 'DD/MM/YYYY') <= B.borrow_date
        AND B.borrow_date <= TO_DATE('15/11/2019', 'DD/MM/YYYY')
     ) B
WHERE B.document_id = D.document_id
  AND D.theme_id = T.theme_id;

-- 3)
-- Pas d'optimisation

-- 4)
SELECT DISTINCT /*+ INDEX(P.name index_publisher_name) */ A.last_name AS Nom, A.first_name AS Prenom
FROM Author A,
     Publisher P,
     Document D,
     Document_author DA
WHERE A.author_id = DA.author_id
  AND DA.document_id = D.document_id
  AND D.publisher_id = P.detail_id
  AND P.name = 'Dunod'
ORDER BY A.last_name;

-- 5)
SELECT /*+ INDEX(P.name index_publisher_name) */ COUNT(*) AS Quantite
FROM Document D,
     Copy C,
     Publisher P
WHERE P.name = 'Eyrolles'
  AND D.publisher_id = P.detail_id
  AND C.document_id = D.document_id;

-- 6)
-- Pas d'optimisation

-- 7)
-- Pas d'optimisation

-- 8)
SELECT /*+ INDEX(T.word index_theme_word) */ P.name AS Editeur, COUNT(P.name) AS Nombre_d_edition
FROM Publisher P,
     Document D,
     Theme T
WHERE D.publisher_id = P.detail_id
  AND D.theme_id = T.theme_id
  AND (T.word = 'Informatique' OR T.word = 'Mathématique')
HAVING COUNT(P.name) >= 2
GROUP BY P.name
ORDER BY P.name;

-- 9)
SELECT /*+ INDEX(B.last_name index_borrower_last_name) */ PD.street AS Adresse, PD.postcode AS Code_postal, PD.city AS Ville, B.last_name AS Nom, B.first_name AS Prenom
FROM Borrower B,
     Personal_detail PD
WHERE B.detail_id = PD.detail_id
  AND B.detail_id IN (SELECT detail_id
                      FROM Borrower
                      WHERE last_name = 'Dupont');

-- 10)
SELECT DISTINCT /*+ INDEX(T.word index_theme_word) */ P.name AS Editeur
FROM Publisher P,
     Document D
WHERE D.publisher_id = P.detail_id
  AND D.theme_id NOT IN (SELECT T.theme_id
                         FROM Theme T
                         WHERE T.word = 'Informatique')
ORDER BY P.name;

-- 11)
-- Pas d'optimisation

-- 12)
-- Pas d'optimisation

-- 13)
-- Avec l'index sur l'attribut category_name de la table Borrower_category
SELECT DISTINCT /*+ INDEX(BC.category_name index_borrower_category_category_name) */ Bwer.first_name || ' ' || Bwer.last_name AS Emprunteur
FROM Borrower Bwer,
     Borrower_category BC,
     Borrow B
WHERE BC.category_name = 'Professionels'
  AND BC.borrower_category_id = Bwer.borrower_category_id
  AND Bwer.borrower_id = B.borrower_id
  AND (CURRENT_DATE - B.borrow_date) <= 6 * 30 -- 6 * 30 jours = 6 mois
  AND B.document_id IN (SELECT D.document_id
                        FROM Document D,
                             Document_category DC
                        WHERE D.document_category_id = DC.document_category_id
                          AND DC.category_name = 'DVD')
ORDER BY Emprunteur;

-- Avec l'index sur l'attribut category_name de la table Document_category
SELECT DISTINCT /*+ INDEX(DC.category_name index_document_category_category_name) */ Bwer.first_name || ' ' || Bwer.last_name AS Emprunteur
FROM Borrower Bwer,
     Borrower_category BC,
     Borrow B
WHERE BC.category_name = 'Professionels'
  AND BC.borrower_category_id = Bwer.borrower_category_id
  AND Bwer.borrower_id = B.borrower_id
  AND (CURRENT_DATE - B.borrow_date) <= 6 * 30 -- 6 * 30 jours = 6 mois
  AND B.document_id IN (SELECT D.document_id
                        FROM Document D,
                             Document_category DC
                        WHERE D.document_category_id = DC.document_category_id
                          AND DC.category_name = 'DVD')
ORDER BY Emprunteur;

-- 14)
<<<<<<< HEAD
-- Pas encore fait

-- 15)
-- Pas encore fait

-- 16)
-- Pas encore fait

-- 17)
-- Pas encore fait

-- 18)
-- Pas encore fait

-- 19)
-- Pas encore fait

-- 20)
-- Pas encore fait
=======
-- Pas d'optimisation

-- 15)
-- Pas d'optimisation

-- 16)
-- Pas d'optimisation

-- 17)
-- Pas d'optimisation

-- 18)
-- Pas d'optimisation

-- 19)
-- Pas d'optimisation

-- 20)
-- Pas d'optimisation
>>>>>>> b29bc9b0c6c0d153b20b9f3813ed839d5585a559


-- Suppresion des index

DROP INDEX index_theme_word;
DROP INDEX index_borrower_last_name;
DROP INDEX index_publisher_name;
