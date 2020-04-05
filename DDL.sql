-- DDL Statements

CREATE TABLE QUESTION
(
    question_id INT NOT NULL PRIMARY KEY,
    text VARCHAR(200) NOT NULL,
    question_type VARCHAR(12) NOT NULL,
    CONSTRAINT question_constraint_type CHECK
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

-- Insert Statements ---

-- Questions Table
INSERT INTO QUESTION (question_id, text, question_type) values (1, 'All in all, are you satisfied or disatisfied with the way things are going in your country?', 'LIFE_OUTLOOK');
INSERT INTO QUESTION (question_id, text, question_type) values (2, 'How many miles have you driven in the past 12 months?', 'DRIVER');
INSERT INTO QUESTION (question_id, text, question_type) values (3, 'On what step would you say you stood five years ago?', 'LIFE_OUTLOOK');
INSERT INTO QUESTION (question_id, text, question_type) values (4, 'DO you like to drive or do you consider it a chore?', 'DRIVER');
INSERT INTO QUESTION (question_id, text, question_type) values (5, 'Overall, how satisfied are you with your job?', 'WORKER');


-- Response Table

INSERT INTO RESPONSE (response_id, answer) values (1, '1');
INSERT INTO RESPONSE (response_id, answer) values (2, '2');
INSERT INTO RESPONSE (response_id, answer) values (3, '3');
INSERT INTO RESPONSE (response_id, answer) values (4, '4');
INSERT INTO RESPONSE (response_id, answer) values (5, '5');
INSERT INTO RESPONSE (response_id, answer) values (6, '6');
INSERT INTO RESPONSE (response_id, answer) values (7, '7');
INSERT INTO RESPONSE (response_id, answer) values (8, '8');
INSERT INTO RESPONSE (response_id, answer) values (9, '9');
INSERT INTO RESPONSE (response_id, answer) values (10, '10');
INSERT INTO RESPONSE (response_id, answer) values (11, 'n/a');

-- Occupation Table

INSERT INTO OCCUPATION (occupation_id, occupation_type) values (1, 'PROFESSIONAL WORKER');
INSERT INTO OCCUPATION (occupation_id, occupation_type) values (2, 'MANAGER, EXECUTIVE');
INSERT INTO OCCUPATION (occupation_id, occupation_type) values (3, 'BUSINESS OWNER');
INSERT INTO OCCUPATION (occupation_id, occupation_type) values (4, 'CLERICAL OR OFFICE WORKER');
INSERT INTO OCCUPATION (occupation_id, occupation_type) values (5, 'SALES WORKER');
INSERT INTO OCCUPATION (occupation_id, occupation_type) values (6, 'SALES REPRESENTATIVE');
INSERT INTO OCCUPATION (occupation_id, occupation_type) values (7, 'SERVICE WORKER');
INSERT INTO OCCUPATION (occupation_id, occupation_type) values (8, 'SKILLED TRADE OR CRAFT');
INSERT INTO OCCUPATION (occupation_id, occupation_type) values (9, 'SEMI-SKILLED');
INSERT INTO OCCUPATION (occupation_id, occupation_type) values (10, 'LABORER');
INSERT INTO OCCUPATION (occupation_id, occupation_type) values (11, 'OTHER');

-- Region Table
INSERT INTO REGION (region_id, name) VALUES (1, 'Northeast');
INSERT INTO REGION (region_id, name) VALUES (2, 'Midwest');
INSERT INTO REGION (region_id, name) VALUES (3, 'South');
INSERT INTO REGION (region_id, name) VALUES (4, 'West');

-- State Table

-- Respondent Table

-- Person_questions_answer Table

INSERT INTO PERSON_QUESTION_ANSWER (respondent_id, question_id, response_id) VALUES (1001, 1, 2);
INSERT INTO PERSON_QUESTION_ANSWER (respondent_id, question_id, response_id) VALUES (1001, 3, 8);
INSERT INTO PERSON_QUESTION_ANSWER (respondent_id, question_id, response_id) VALUES (1002, 3, 4);
INSERT INTO PERSON_QUESTION_ANSWER (respondent_id, question_id, response_id) VALUES (1002, 4, 2);
INSERT INTO PERSON_QUESTION_ANSWER (respondent_id, question_id, response_id) VALUES (1002, 5, 11);