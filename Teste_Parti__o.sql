CREATE TABLE table Jan1998sales
   (OrderID      INT,
   CustomerID    INT           NOT NULL,
   OrderDate     DATETIME      NULL      CHECK (DATEPART(yy, OrderDate) = 1998),
   OrderMonth    INT                     CHECK (OrderMonth = 1),
   DeliveryDate  DATETIME      NULL      CHECK(DATEPART(mm, DeliveryDate) = 1)
   CONSTRAINT OrderIDMonth PRIMARY KEY(OrderID, OrderMonth)
   )

CREATE TABLE Feb1998sales
   (OrderID      INT,
   CustomerID      INT      NOT NULL,
   OrderDate      DATETIME      NULL
      CHECK (DATEPART(yy, OrderDate) = 1998),
   OrderMonth      INT
      CHECK (OrderMonth = 2),
   DeliveryDate      DATETIME      NULL
      CHECK(DATEPART(mm, DeliveryDate) = 2)
   CONSTRAINT OrderIDMonth2 PRIMARY KEY(OrderID, OrderMonth)
   )



insert into Jan1998sales (OrderID,CustomerID,OrderDate,OrderMonth,DeliveryDate)
values (1,100,'1998-01-01',1,'1998-01-01')

insert into Jan1998sales (OrderID,CustomerID,OrderDate,OrderMonth,DeliveryDate)
values (2,100,'1998-01-02',1,'1998-01-02')

insert into Feb1998sales (OrderID,CustomerID,OrderDate,OrderMonth,DeliveryDate)
values (1,100,'1998-02-01',2,'1998-02-01')

insert into Feb1998sales (OrderID,CustomerID,OrderDate,OrderMonth,DeliveryDate)
values (2,100,'1998-02-01',2,'1998-02-01')

CREATE VIEW Year1998Sales
AS
SELECT * FROM Jan1998Sales
UNION ALL
SELECT * FROM Feb1998Sales



SELECT *
FROM Year1998Sales
WHERE OrderMonth IN (1,3)

