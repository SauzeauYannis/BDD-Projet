-- Requete

-- 1
-- Liste par ordre alphabétique des titres de documents dont le thème comprend le mot
-- informatique ou mathématiques.

SELECT D.title, T.word
FROM Document D, Theme T
WHERE D.theme_id = T.theme_id
AND (T.word = 'Informatique' OR T.word = 'Mathématique')
ORDER BY title;

-- 2
-- Liste (titre et thème) des documents empruntés par Dupont entre le 15/11/2018 et le
-- 15/11/2019

SELECT D.title, T.word
FROM Borrow B, Borrower Ber, Document D, Theme T
WHERE B.borrower_id = Ber.borrower_id
AND B.document_id = D.document_id
AND D.theme_id = T.theme_id
AND Ber.last_name = 'Dupont'
AND TO_DATE('15/11/2018', 'DD/MM/YYYY') <= B.borrow_date
AND B.borrow_date <= TO_DATE('15/11/2019', 'DD/MM/YYYY');

-- TODO Requete 3
-- 3


-- TODO Requete 4
-- 4


-- TODO Requete 5
-- 5


-- TODO Requete 6
-- 6


-- TODO Requete 7
-- 7


-- TODO Requete 8
-- 8


-- TODO Requete 9
-- 9


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
