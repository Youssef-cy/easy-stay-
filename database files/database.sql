CREATE TABLE users (
    user_id NUMBER PRIMARY KEY NOT NULL,
    first_name VARCHAR2(25),
    last_name VARCHAR2(25),
    phone_number NUMBER,
    location VARCHAR2(200)
);

INSERT INTO users 
  VALUES (1,'mohamed', 'ahmed', 0100156733, 'italy ');
INSERT INTO users 
  VALUES (2,'mohamed', 'ahmed', 0100156733, 'italy ');
INSERT INTO users 
  VALUES (3,'mohamed', 'ahmed', 0100156733, 'italy ');
INSERT INTO users 
  VALUES (4,'mohamed', 'ahmed', 0100156733, 'italy ');
INSERT INTO users 
  VALUES (5,'mohamed', 'ahmed', 0100156733, 'italy ');
INSERT INTO users 
  VALUES (6,'mohamed', 'ahmed', 0100156733, 'italy ');
INSERT INTO users 
  VALUES (7,'mohamed', 'ahmed', 0100156733, 'italy ');
INSERT INTO users 
  VALUES (8,'mohamed', 'ahmed', 0100156733, 'italy ');
INSERT INTO users 
  VALUES (9,'mohamed', 'ahmed', 0100156733, 'italy ');
INSERT INTO users 
  VALUES (10,'mohamed', 'ahmed', 0100156733, 'italy ');
INSERT INTO users 
  VALUES (11,'mohamed', 'ahmed', 0100156733, 'italy ');
INSERT INTO users 
  VALUES (12,'mohamed', 'ahmed', 0100156733, 'italy ');
INSERT INTO users 
  VALUES (13,'mohamed', 'ahmed', 0100156733, 'italy ');
INSERT INTO users 
  VALUES (14,'mohamed', 'ahmed', 0100156733, 'italy ');
INSERT INTO users 
  VALUES (15,'mohamed', 'ahmed', 0100156733, 'italy ');

create sequence users_id 
start with 1 
increment by 1
nocache 
nocycle ; 
-- youssef yasser 