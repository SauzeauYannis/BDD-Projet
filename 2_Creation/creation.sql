-- conventions de nommage :
-- pour la clef primaire de la table <Table> : PK_<Table>
-- pour la clef étrangère de la table <Source> référencant la table <Target> : FK_<Target>_<Source>
-- pour vérifier une condition <Condition> sur la colonne <Colonne> : check_<Condition>_<Colonne>

CREATE TABLE Author
(
    author_id  INT GENERATED BY DEFAULT AS IDENTITY,
    last_name  VARCHAR2(64) NOT NULL,
    first_name VARCHAR2(64),
    birth_date DATE         NOT NULL,
    CONSTRAINT PK_Author PRIMARY KEY (author_id)
);

CREATE TABLE Personal_detail
(
    detail_id    INT GENERATED BY DEFAULT AS IDENTITY,
    phone_number VARCHAR2(12) UNIQUE,
    street       VARCHAR2(128) NOT NULL,
    postcode     VARCHAR2(8),                                               -- Certains pays n'ont pas de code postal
    city         VARCHAR2(64)  NOT NULL,
    country      VARCHAR2(64)  NOT NULL,
    CONSTRAINT PK_Personal_detail PRIMARY KEY (detail_id),
    CONSTRAINT check_size_phone_number CHECK ( LENGTH(phone_number) >= 4 ), -- Un numéro de téléphone doit faire au moins 4 lettres
    CONSTRAINT check_size_country CHECK ( LENGTH(country) >= 4 )            -- Il n'existe pas de pays avec moins de 4 lettres
);

CREATE TABLE Publisher
(
    detail_id INT           NOT NULL,
    name      VARCHAR2(128) NOT NULL,
    CONSTRAINT PK_Publisher PRIMARY KEY (detail_id),
    CONSTRAINT FK_Personal_detail_Publisher FOREIGN KEY (detail_id) REFERENCES Personal_detail (detail_id)
);

CREATE TABLE Theme
(
    theme_id INT GENERATED BY DEFAULT AS IDENTITY,
    word     VARCHAR2(32) NOT NULL,
    CONSTRAINT PK_Theme PRIMARY KEY (theme_id)
);

CREATE TABLE Keyword
(
    keyword_id INT GENERATED BY DEFAULT AS IDENTITY,
    word       VARCHAR2(32) NOT NULL,
    CONSTRAINT PK_Keyword PRIMARY KEY (keyword_id)
);

CREATE TABLE Borrower_category
(
    borrower_category_id INT GENERATED BY DEFAULT AS IDENTITY,
    category_name        VARCHAR2(32) NOT NULL,
    max_borrowing_number NUMBER(2)    NOT NULL,
    CONSTRAINT PK_Borrower_category PRIMARY KEY (borrower_category_id),
    CONSTRAINT check_positive_max_borrowing_number CHECK ( max_borrowing_number > 0 )
);

CREATE TABLE Borrower
(
    borrower_id           INT GENERATED BY DEFAULT AS IDENTITY,
    borrower_category_id  INT           NOT NULL,
    last_name             VARCHAR2(64)  NOT NULL,
    first_name            VARCHAR2(64)  NOT NULL,
    detail_id             INT           NOT NULL,
    current_number_borrow INT DEFAULT 0 NOT NULL,
    CONSTRAINT PK_Borrower PRIMARY KEY (borrower_id),
    CONSTRAINT FK_Borrower_category_Borrower FOREIGN KEY (borrower_category_id) REFERENCES Borrower_category (borrower_category_id),
    CONSTRAINT FK_Personal_detail_Borrower FOREIGN KEY (detail_id) REFERENCES Personal_detail (detail_id)
);

CREATE TABLE Document_category
(
    document_category_id INT GENERATED BY DEFAULT AS IDENTITY,
    category_name        VARCHAR2(32) NOT NULL,
    CONSTRAINT PK_Document_category PRIMARY KEY (document_category_id)
);

CREATE TABLE Borrowing_duration
(
    borrower_category_id INT NOT NULL,
    document_category_id INT NOT NULL,
    duration             INT NOT NULL,
    CONSTRAINT PK_Borrowing_duration PRIMARY KEY (borrower_category_id, document_category_id),
    CONSTRAINT FK_Borrower_category_Borrowing_duration FOREIGN KEY (borrower_category_id) REFERENCES Borrower_category (borrower_category_id),
    CONSTRAINT FK_Document_category_Borrowing_duration FOREIGN KEY (document_category_id) REFERENCES Document_category (document_category_id),
    CONSTRAINT check_positive_duration CHECK ( duration > 0 )
);

CREATE TABLE Document
(
    document_id          INT GENERATED BY DEFAULT AS IDENTITY,
    title                VARCHAR2(128) NOT NULL,
    copy_number          INT DEFAULT 0 NOT NULL,
    document_category_id INT           NOT NULL,
    publisher_id         INT           NOT NULL,
    theme_id             INT           NOT NULL,
    CONSTRAINT PK_Document PRIMARY KEY (document_id),
    CONSTRAINT FK_Document_category_Document FOREIGN KEY (document_category_id) REFERENCES Document_category (document_category_id),
    CONSTRAINT FK_Publisher_Document FOREIGN KEY (publisher_id) REFERENCES Publisher (detail_id),
    CONSTRAINT FK_Theme_Document FOREIGN KEY (theme_id) REFERENCES Theme (theme_id),
    CONSTRAINT check_positive_copy_number CHECK ( copy_number >= 0 )
);

CREATE TABLE Copy
(
    copy_id      INT NOT NULL,
    document_id  INT NOT NULL,
    shelf_number INT NOT NULL,
    CONSTRAINT PK_Copy PRIMARY KEY (copy_id, document_id),
    CONSTRAINT FK_Document_Copy FOREIGN KEY (document_id) REFERENCES Document (document_id)
);

CREATE TABLE Borrow
(
    borrower_id   INT GENERATED BY DEFAULT AS IDENTITY,
    copy_id       INT  NOT NULL,
    document_id   INT  NOT NULL,
    borrow_date   DATE NOT NULL,
    borrow_return DATE,
    CONSTRAINT PK_Borrow PRIMARY KEY (borrow_date, copy_id, document_id),
    CONSTRAINT FK_Borrower_Borrow FOREIGN KEY (borrower_id) REFERENCES Borrower (borrower_id),
    CONSTRAINT FK_Copy_Borrow FOREIGN KEY (copy_id, document_id) REFERENCES Copy (copy_id, document_id),
    CONSTRAINT check_date_borrow_return CHECK ( borrow_return >= borrow_date ) -- Il faut retourner un livre après l'avoir emprunter ou le même jour mais pas avant
);

CREATE TABLE Document_author
(
    document_id INT NOT NULL,
    author_id   INT NOT NULL,
    CONSTRAINT PK_Document_author PRIMARY KEY (document_id, author_id),
    CONSTRAINT FK_Document_Document_author FOREIGN KEY (document_id) REFERENCES Document (document_id),
    CONSTRAINT FK_Author_Document_author FOREIGN KEY (author_id) REFERENCES Author (author_id)
);

CREATE TABLE Document_keyword
(
    document_id INT NOT NULL,
    keyword_id  INT NOT NULL,
    CONSTRAINT PK_Document_keyword PRIMARY KEY (document_id, keyword_id),
    CONSTRAINT FK_Document_Document_keyword FOREIGN KEY (document_id) REFERENCES Document (document_id),
    CONSTRAINT FK_Author_Document_keyword FOREIGN KEY (keyword_id) REFERENCES Keyword (keyword_id)
);

CREATE TABLE Book
(
    document_id INT       NOT NULL,
    page_number NUMBER(4) NOT NULL,
    CONSTRAINT PK_Book PRIMARY KEY (document_id),
    CONSTRAINT FK_Document_Book FOREIGN KEY (document_id) REFERENCES Document (document_id),
    CONSTRAINT check_positive_page_number CHECK ( page_number > 0 )
);

CREATE TABLE CD
(
    document_id     INT       NOT NULL,
    duration        NUMBER(3) NOT NULL,
    subtitle_number NUMBER(3) NOT NULL,
    CONSTRAINT PK_CD PRIMARY KEY (document_id),
    CONSTRAINT FK_Document_CD FOREIGN KEY (document_id) REFERENCES Document (document_id),
    CONSTRAINT check_positive_CD_duration CHECK ( duration > 0 ),
    CONSTRAINT check_positive_or_zero_subtitle_number CHECK ( subtitle_number >= 0 )
);

CREATE TABLE DVD
(
    document_id INT       NOT NULL,
    duration    NUMBER(3) NOT NULL,
    CONSTRAINT PK_DVD PRIMARY KEY (document_id),
    CONSTRAINT FK_Document_DVD FOREIGN KEY (document_id) REFERENCES Document (document_id),
    CONSTRAINT check_positive_DVD_duration CHECK ( duration > 0 )
);

CREATE TABLE Video
(
    document_id      INT       NOT NULL,
    duration         NUMBER(3) NOT NULL,
    recording_format VARCHAR2(24),
    CONSTRAINT PK_Video PRIMARY KEY (document_id),
    CONSTRAINT FK_Document_Video FOREIGN KEY (document_id) REFERENCES Document (document_id),
    CONSTRAINT check_positive_Video_duration CHECK ( duration > 0 )
);

COMMIT;
