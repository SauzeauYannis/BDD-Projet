DROP TABLE Author CASCADE CONSTRAINTS;
CREATE TABLE Author
(
    author_id  INT          NOT NULL,
    last_name  VARCHAR2(64) NOT NULL,
    first_name VARCHAR2(64),
    birth_date DATE         NOT NULL,
    CONSTRAINT PK_Author PRIMARY KEY (author_id)
);

DROP TABLE Personal_detail CASCADE CONSTRAINTS;
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
