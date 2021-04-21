-- conventions de nommage pour les FK : FK_<Target>_<Source>

CREATE TABLE Author
(
    author_id  INT          NOT NULL,
    last_name  VARCHAR2(64) NOT NULL,
    first_name VARCHAR2(64),
    birth_date DATE         NOT NULL,
    CONSTRAINT PK_Author    PRIMARY KEY (author_id)
);

CREATE TABLE Personal_detail
(
    detail_id    INT           NOT NULL,
    phone_number VARCHAR2(12)  NOT NULL,
    street       VARCHAR2(128) NOT NULL,
    postcode     VARCHAR2(8)   NOT NULL,
    city         VARCHAR2(64)  NOT NULL,
    country      VARCHAR2(64)  NOT NULL,
    CONSTRAINT PK_Personal_detail PRIMARY KEY (detail_id)
);

CREATE TABLE Publisher
(
    publisher_id    INT             NOT NULL,
    name            VARCHAR2(128)   NOT NULL,
    detail_id       INT             NOT NULL,
    CONSTRAINT PK_Publisher                 PRIMARY KEY (publisher_id), -- detail_id en primaire ?? (voir SR)
    CONSTRAINT FK_Personal_detail_Publisher FOREIGN KEY (detail_id) REFERENCES Personal_detail(detail_id)
);

CREATE TABLE Theme
(
    theme_id    INT             NOT NULL,
    word        VARCHAR2(32)    NOT NULL,
    CONSTRAINT PK_Theme         PRIMARY KEY (theme_id)
);

CREATE TABLE Keyword
(
    keyword_id  INT             NOT NULL,
    word        VARCHAR2(32)    NOT NULL,
    CONSTRAINT PK_Keyword       PRIMARY KEY (keyword_id)
);

CREATE TABLE Borrower_category
(
    borrower_category_id    INT             NOT NULL,
    category_name           VARCHAR2(32)    NOT NULL,
    max_borrowing_number    NUMBER(2)       NOT NULL,
    CONSTRAINT PK_Borrower_category         PRIMARY KEY (borrower_category_id)
);

CREATE TABLE Borrower
(
    borrower_id     INT             NOT NULL,
    borrower_cat    INT             NOT NULL,
    last_name       VARCHAR2(64)    NOT NULL,
    first_name      VARCHAR2(64)    NOT NULL,
    detail_id       INT             NOT NULL,
    CONSTRAINT PK_Borrower                   PRIMARY KEY (borrower_id),
    CONSTRAINT FK_Borrower_category_Borrower FOREIGN KEY (borrower_cat) REFERENCES Borrower_category(borrower_category_id),
    CONSTRAINT FK_Personal_detail_Borrower   FOREIGN KEY (detail_id) REFERENCES Personal_detail(detail_id)
);

CREATE TABLE Document_category
(
    document_category_id    INT          NOT NULL,
    category_name           VARCHAR2(32) NOT NULL,
    CONSTRAINT PK_Document_category      PRIMARY KEY (document_category_id)
);

CREATE TABLE Borrowing_duration
(
    borrower_cat    INT     NOT NULL,
    document_cat    INT     NOT NULL,
    duration        INT     NOT NULL,
    CONSTRAINT PK_Borrowing_duration                   PRIMARY KEY (borrower_cat, document_cat),
    CONSTRAINT FK_Borrower_category_Borrowing_duration FOREIGN KEY (borrower_cat) REFERENCES Borrower_category(borrower_category_id),
    CONSTRAINT FK_Document_category_Borrowing_duration FOREIGN KEY (document_cat) REFERENCES Document_category(document_category_id)
);

CREATE TABLE Document
(
    document_id             INT             NOT NULL,
    title                   VARCHAR2(128)   NOT NULL,
    copy_number             INT             NOT NULL,
    document_category_id    INT             NOT NULL,
    publisher_id            INT             NOT NULL,
    theme_id                INT             NOT NULL,
    CONSTRAINT PK_Document                   PRIMARY KEY (document_id),
    CONSTRAINT FK_Document_category_Document FOREIGN KEY (document_category_id) REFERENCES Document_category(document_category_id),
    CONSTRAINT FK_Publisher_Document         FOREIGN KEY (publisher_id) REFERENCES Publisher(publisher_id),
    CONSTRAINT FK_Theme_Document             FOREIGN KEY (theme_id) REFERENCES Theme(theme_id)
);

CREATE TABLE Copy
(
  copy_id       INT     NOT NULL,
  document_id   INT     NOT NULL,
  shelf_number  INT     NOT NULL,
  CONSTRAINT PK_Copy          PRIMARY KEY (copy_id, document_id),
  CONSTRAINT FK_Document_Copy FOREIGN KEY (document_id) REFERENCES Document(document_id)
);

CREATE TABLE Borrow
(
    borrower_id     INT     NOT NULL,
    copy_id         INT     NOT NULL,
    document_id     INT     NOT NULL,
    borrow_date     DATE    NOT NULL,
    borrow_ret      DATE,
    CONSTRAINT PK_Borrow          PRIMARY KEY (borrower_id, copy_id),
    CONSTRAINT FK_Borrower_Borrow FOREIGN KEY (borrower_id) REFERENCES Borrower(borrower_id),
    CONSTRAINT FK_Copy_Borrow     FOREIGN KEY (copy_id, document_id) REFERENCES Copy(copy_id, document_id)
);

CREATE TABLE Document_author
(
    document_id     INT     NOT NULL,
    author_id       INT     NOT NULL,
    CONSTRAINT PK_Document_author          PRIMARY KEY (document_id, author_id),
    CONSTRAINT FK_Document_Document_author FOREIGN KEY (document_id) REFERENCES Document(document_id),
    CONSTRAINT FK_Author_Document_author   FOREIGN KEY (author_id) REFERENCES Author(author_id)
);

CREATE TABLE Document_keyword
(
    document_id     INT     NOT NULL,
    keyword_id      INT     NOT NULL,
    CONSTRAINT PK_Document_keyword          PRIMARY KEY (document_id, keyword_id),
    CONSTRAINT FK_Document_Document_keyword FOREIGN KEY (document_id) REFERENCES Document(document_id),
    CONSTRAINT FK_Author_Document_keyword   FOREIGN KEY (keyword_id) REFERENCES Keyword(keyword_id)
);

CREATE TABLE Book
(
    document_id     INT         NOT NULL,
    page_number     NUMBER(4),
    CONSTRAINT PK_Book          PRIMARY KEY (document_id),
    CONSTRAINT FK_Document_Book FOREIGN KEY (document_id) REFERENCES Document(document_id)
);

CREATE TABLE CD
(
    document_id     INT         NOT NULL,
    duration        NUMBER(3),
    subtitle_number NUMBER(3),
    CONSTRAINT PK_CD          PRIMARY KEY (document_id),
    CONSTRAINT FK_Document_CD FOREIGN KEY (document_id) REFERENCES Document(document_id)
);

CREATE TABLE DVD
(
    document_id     INT         NOT NULL,
    duration        NUMBER(3),
    CONSTRAINT PK_DVD          PRIMARY KEY (document_id),
    CONSTRAINT FK_Document_DVD FOREIGN KEY (document_id) REFERENCES Document(document_id)
);

CREATE TABLE Video
(
    document_id         INT         NOT NULL,
    duration            NUMBER(3),
    recording_format    VARCHAR2(24),
    CONSTRAINT PK_Video          PRIMARY KEY (document_id),
    CONSTRAINT FK_Document_Video FOREIGN KEY (document_id) REFERENCES Document(document_id)
);

COMMIT;