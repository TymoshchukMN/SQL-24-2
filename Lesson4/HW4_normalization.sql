CREATE DATABASE TEST;
USE TEST;

-- Task 1. Create a table for products
CREATE TABLE PRODUCTS
(
	[MFR_ID]      NCHAR(3)     NOT NULL,                  
	[PRODUCT_ID]  NCHAR(3)     NOT NULL,           
	[DESCRIPTION] NVARCHAR(50) NOT NULL,           
	[PRICE]       DECIMAL(9,2) NOT NULL,
	[QTY_ON_HAND] INT          NOT NULL,
	CONSTRAINT COMPOSITE_PK PRIMARY KEY([MFR_ID], [PRODUCT_ID])
)

-- Task 2. Create a table for offices
CREATE TABLE OFFICES
( 
	[OFFICE] INT           NOT NULL PRIMARY KEY,
	[CITY]   NVARCHAR(15)  NOT NULL UNIQUE,
	[REGION] NVARCHAR(10)  NOT NULL,
	[MGR]    INT           DEFAULT(106),
	[TARGET] DECIMAL(9, 2) CHECK([TARGET] >=0),
	[SALES]  DECIMAL(9, 2) NOT NULL DEFAULT(0.00),
);

-- Task 3. Create a table for employees
CREATE TABLE SALESREPS
(
	[EMPL_NUM]  INT           NOT NULL CHECK([EMPL_NUM] BETWEEN 101 AND 199) PRIMARY KEY,
	[NAME]      NVARCHAR(15)  NOT NULL,
	[AGE]       BIT           CHECK([AGE]>=21),
	[REPOFFICE] INT,
	[TITLE]     NVARCHAR(10),
	[HIREDATE]  DATE          NOT NULL,
	[MANAGER]   INT,
	[QUOTA]     DECIMAL(9, 2) CHECK([QUOTA] >=0),
	[SALES]     DECIMAL(9, 2) NOT NULL,
) ;

-- Task 4. Modify the salesreps table. Add a foreign key (Manager ID) that would refer to 
-- the salesreps table (Employee ID). This particular foreign key represents a relationship between 
-- an employee and his manager. 

ALTER TABLE SALESREPS 
ADD CONSTRAINT SALESREPS_FK 
FOREIGN KEY ([MANAGER]) REFERENCES SALESREPS ([EMPL_NUM])

-- Task 5. Modify the offices table. Add a foreign key (Office Manager ID) that would refer to the salesreps table (Employee ID).
-- This particular foreign key represents a relation between an office and its manager in charge.
ALTER TABLE [OFFICES]
ADD CONSTRAINT OFFICES_MANAGER_FK 
FOREIGN KEY ([MGR]) REFERENCES SALESREPS ([EMPL_NUM])

-- Task 6. Create a table for customers.
CREATE TABLE [CUSTOMERS]
(
	[CUST_NUM]    INT          NOT NULL PRIMARY KEY,
	[COMPANY]     NVARCHAR(20) NOT NULL,
	[CUST_REP]	  INT          FOREIGN KEY ([CUST_REP]) REFERENCES [SALESREPS] ([EMPL_NUM]),
	[CREDITLIMIT] DECIMAL(9, 2)
) ;

--Task 7. Create a table for orders.
CREATE TABLE [ORDERS]
(
	[ORDER_NUM]  INT          NOT NULL PRIMARY KEY,
	[ORDER_DATE] DATE         NOT NULL,
	[CUST]       INT          NOT NULL FOREIGN KEY ([CUST]) REFERENCES  [CUSTOMERS] ([CUST_NUM]),
	[REP]        INT FOREIGN KEY ([REP]) REFERENCES [SALESREPS] ([EMPL_NUM]),
	[MFR]        NCHAR(3)     NOT NULL,
	[PRODUCT]    NCHAR(3)     NOT NULL,
	[QTY]        INT          NOT NULL,
	[AMOUNT]     DECIMAL(9,2) NOT NULL,
	CONSTRAINT MFR_PRODUCT_FK FOREIGN KEY ([MFR], [PRODUCT])  REFERENCES PRODUCTS ([MFR_ID], [PRODUCT_ID])
) ;