-- Dans notre base, lorsque l'on veut créer des données spécifiques à une catégorie de document
-- (par exemple : ajouter un nombre de page à un livre) il faut ajouter les données dans la table
-- qui porte le nom de la catégorie du document avec pour clef primaire une clef étrangère qui
-- référence le document (par exemple : ajouter dans la table 'Book' la clef primaire '0' et le
-- nombre de page '200' où '0' est la clef primaire d'un document qui a pour catégorie_id la
-- clef étrangère qui référence la catégorie 'Livre' dans la table 'Document_category').


-- Création des contraintes

CREATE OR REPLACE TRIGGER trigger_book_category
    BEFORE INSERT OR UPDATE
    ON Book
    FOR EACH ROW
DECLARE
    category VARCHAR2(64);
BEGIN
    SELECT category_name
    INTO category
    FROM Document D,
         Document_category DC
    WHERE :NEW.document_id = D.document_id
      AND D.document_category_id = DC.document_category_id;

    IF category != 'Livre' THEN
        RAISE_APPLICATION_ERROR(-20001,
                                'Mauvaise clef primaire : Vous devez référencer un document de la catégorie "Livre"');
    ELSE
        NULL;
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trigger_cd_category
    BEFORE INSERT OR UPDATE
    ON CD
    FOR EACH ROW
DECLARE
    category VARCHAR2(64);
BEGIN
    SELECT category_name
    INTO category
    FROM Document D,
         Document_category DC
    WHERE :NEW.document_id = D.document_id
      AND D.document_category_id = DC.document_category_id;

    IF category != 'CD' THEN
        RAISE_APPLICATION_ERROR(-20002,
                                'Mauvaise clef primaire : Vous devez référencer un document de la catégorie "CD"');
    ELSE
        NULL;
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trigger_dvd_category
    BEFORE INSERT OR UPDATE
    ON DVD
    FOR EACH ROW
DECLARE
    category VARCHAR2(64);
BEGIN
    SELECT category_name
    INTO category
    FROM Document D,
         Document_category DC
    WHERE :NEW.document_id = D.document_id
      AND D.document_category_id = DC.document_category_id;

    IF category != 'DVD' THEN
        RAISE_APPLICATION_ERROR(-20003,
                                'Mauvaise clef primaire : Vous devez référencer un document de la catégorie "DVD"');
    ELSE
        NULL;
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trigger_video_category
    BEFORE INSERT OR UPDATE
    ON VIDEO
    FOR EACH ROW
DECLARE
    category VARCHAR2(64);
BEGIN
    SELECT category_name
    INTO category
    FROM Document D,
         Document_category DC
    WHERE :NEW.document_id = D.document_id
      AND D.document_category_id = DC.document_category_id;

    IF category != 'Video' THEN
        RAISE_APPLICATION_ERROR(-20004,
                                'Mauvaise clef primaire : Vous devez référencer un document de la catégorie "Video"');
    ELSE
        NULL;
    END IF;
END;
/


-- Désactivation des contraintes

ALTER TRIGGER trigger_book_category DISABLE;
ALTER TRIGGER trigger_cd_category DISABLE;
ALTER TRIGGER trigger_dvd_category DISABLE;
ALTER TRIGGER trigger_video_category DISABLE;


-- Activation des contraintes

ALTER TRIGGER trigger_book_category ENABLE;
ALTER TRIGGER trigger_cd_category ENABLE;
ALTER TRIGGER trigger_dvd_category ENABLE;
ALTER TRIGGER trigger_video_category ENABLE;


-- Suppression des contraintes

DROP TRIGGER trigger_book_category;
DROP TRIGGER trigger_cd_category;
DROP TRIGGER trigger_dvd_category;
DROP TRIGGER trigger_video_category;
