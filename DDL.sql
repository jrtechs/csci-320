CREATE TABLE QUESTION
(
    question_id INT NOT NULL PRIMARY KEY,
    text VARCHAR(100) NOT NULL,
    question_type VARCHAR(12) NOT NULL,
    CONSTRAINT sex_type CHECK
        ( question_type IN ('WORKER', 'DRIVER', 'LIFE_OUTLOOK'))
);

CREATE TABLE RESPONSE
(
    response_id INT NOT NULL PRIMARY KEY,
    answer VARCHAR(10) NOT NULL
);

CREATE TABLE OCCUPATION
(
  occupation_id INT NOT NULL PRIMARY KEY,
  occupation_type VARCHAR(20) NOT NULL
);

CREATE TABLE REGION
(
    region_id SMALLINT NOT NULL PRIMARY KEY,
    name VARCHAR(20) NOT NULL UNIQUE
);


CREATE TABLE STATE
(
    state_id SMALLINT NOT NULL PRIMARY KEY,
    name VARCHAR(30) UNIQUE,
    region_id SMALLINT NOT NULL,
    FOREIGN KEY (region_id) REFERENCES REGION (region_id)
);

CREATE TABLE RESPONDENT
(
    respondent_id INT NOT NULL PRIMARY KEY,
    sex CHAR(1),
    CONSTRAINT sex_type CHECK ( sex IN ('M', 'F')),
    age SMALLINT,
    community_type CHAR(1),
    CONSTRAINT community_scope CHECK ( community_type IN ('U', 'R', 'S')),
    state_id SMALLINT,
    occupation_id INT,
    FOREIGN KEY (state_id) REFERENCES STATE (state_id),
    FOREIGN KEY (occupation_id) REFERENCES OCCUPATION (occupation_id)
);

CREATE TABLE PERSON_QUESTION_ANSWER
(
    respondent_id INT NOT NULL,
    question_id INT NOT NULL,
    response_id INT NOT NULL,
    PRIMARY KEY (respondent_id, question_id, response_id),
    FOREIGN KEY (respondent_id) REFERENCES RESPONDENT (respondent_id),
    FOREIGN KEY (question_id) REFERENCES QUESTION (question_id),
    FOREIGN KEY (response_id) REFERENCES RESPONSE (response_id)
);