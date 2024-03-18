CREATE TABLE T1 ( C1 INT PRIMARY KEY, C2 VARCHAR(100));

CREATE FULLTEXT CATALOG ft AS DEFAULT;

CREATE FULLTEXT INDEX ON T1(C2) KEY INDEX PK__T1__7D78A4E7;



INSERT INTO T1 VALUES (1,'CARRO DE CORRIDA');
INSERT INTO T1 VALUES (2,'CARRO');
INSERT INTO T1 VALUES (3,'CARROS');
INSERT INTO T1 VALUES (4,'CARRO�A DE CORRIDA');
INSERT INTO T1 VALUES (5,'CARRO�A');
INSERT INTO T1 VALUES (6,'BOI DE CARRO');
INSERT INTO T1 VALUES (7,'CORRIDA');
INSERT INTO T1 VALUES (8,'BRASIL');
INSERT INTO T1 VALUES (9,'CAR');
INSERT INTO T1 VALUES (10,'AUTO');
INSERT INTO T1 VALUES (11,'AUTOMOBILE');
INSERT INTO T1 VALUES (12,'BUS');

SELECT * FROM T1;

SELECT *
FROM T1
WHERE FREETEXT(C2, 'car')

SELECT *
FROM T1
WHERE CONTAINS(C2, '"carro*"')