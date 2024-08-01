/*
Использовано 86 % доступного пространства. … Когда свободное место закончится, вы не сможете создавать, редактировать и загружать файлы. Получите 100 ГБ за 45,00 грн. 11,00 грн./мес. на 2 месяца.
Create a table to store employees' data.
empl_id       -- unique id <= 2147483647 primary key can not be null identity
fname         -- first name unicode(50) can not be null
lname         -- last name unicode(50) can not be null
birthday      -- birthday can not be null
hire_date     -- date and time when an employee was hired (utc-0) can not be null
hire_date_ltz -- date and time when an employee was hired (local timezone) can not be null

Create a table to store orders' data.
order_id       -- unique id <= 2147483647 primary key can not be null identity
order_date     -- date and time when on order was applied (utc-0) can not be null
order_date_ltz -- date and time when on order was applied (local time zone) can not be null
empl_id        -- ID of an employee who provided an order <= 2147483647 can not be null
prod_id        -- ID of a product that was bought <= 2147483647 can not be null
qty            -- quantity of a product that were bought <= 32767  can not be null can not be less or equal to 0
amount         -- cost of an order (15, 2) can not be null can not be less or equal to 0

Create a table to store products' data.
prod_id        -- unique ID of a product <= 2147483647 primary key can not be null identity
[description]  -- unicode(50) can be null    
qty_on_hand    -- quantity of a product that is available <= 32767 can not be null
price          -- unit price (15, 2) can not be null can not be less or equal to 0 	

Link these tables with foreign keys:
	orders.empl_id -> employees.empl_id
	orders.prod_id -> products.prod_id	

Insert into the tables some rows.
*/

CREATE TABLE [EmployeesData]
(
	[Empl_id]     INT            NOT NULL PRIMARY KEY IDENTITY(1, 1),
	[FirstName]   VARCHAR(50)    NOT NULL,
	[LastName]    VARCHAR(50)    NOT NULL,
	[Birthday]    DATE           NOT NULL,
	[HireDate]    DATE           NOT NULL,
	[HireDateLtz] DATETIMEOFFSET NOT NULL
)

CREATE TABLE [Orders]
(
    [Orderid]      INT            NOT NULL PRIMARY KEY IDENTITY(1, 1),
    [Orderdate]    DATETIME       NOT NULL,
    [Orderdateltz] DATETIMEOFFSET NOT NULL,
    [Emplid]       INT            NOT NULL FOREIGN KEY REFERENCES [EmployeesData] ([Empl_id]),
    [Prodid]       INT            NOT NULL FOREIGN KEY REFERENCES [Products] ([ProdID]),
    [Qty]          SMALLINT       NOT NULL CHECK([qty] > 0),
    [Amount]       NUMERIC(15, 2)
)

CREATE TABLE [Products]
(
	[ProdID] INT NOT NULL  PRIMARY KEY IDENTITY(1, 1),
	[Description] VARCHAR(50),
	[QTYOnHand] SMALLINT NOT NULL,
	[PRICE] NUMERIC(15,2) NOT NULL CHECK([PRICE] > 0)
)

INSERT INTO [EmployeesData]
(
	[FirstName],
	[LastName],
	[Birthday],
	[HireDate],
	[HireDateLtz]
)
VALUES 
(N'John', N'Doe', '1980-01-15', '2020-03-01T13:00:00Z', '2020-03-01T18:00:00'),
(N'Jane', N'Smith', '1990-06-22', '2019-07-15T09:00:00Z', '2019-07-15T14:00:00'),
(N'Michael', N'Johnson', '1975-11-30', '2021-01-20T11:30:00Z', '2021-01-20T16:30:00');

INSERT INTO [Products] ([Description], [QTYOnHand], [PRICE])
VALUES 
(N'Product A', 100, 29.99),
(N'Product B', 50, 49.99),
(N'Product C', 200, 9.99);

INSERT INTO [Orders] 
(
	[Orderdate],
	[Orderdateltz],
	[Emplid],
	[Prodid],
	[Qty],
	[Amount]
)
VALUES 
('2022-05-10T10:00:00Z', '2022-05-10T15:00:00', 1, 1, 3, 89.97),
('2022-05-11T14:30:00Z', '2022-05-11T19:30:00', 2, 2, 2, 99.98),
('2022-05-12T08:15:00Z', '2022-05-12T13:15:00', 3, 3, 5, 49.95);