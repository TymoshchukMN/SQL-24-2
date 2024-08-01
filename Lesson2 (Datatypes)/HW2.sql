/*
	Create a table to store customers' data. Put into the table a few rows.
	id            -- unique id <= 2147483647
	fname         -- first name unicode(50)
	lname         -- last name unicode(50)
	birthday      -- birthday 
	age           -- number of years <= 255 
	country_code  -- country of a customer asci(2)
	credit_limit  -- current available credit limit - money type value with fractional part
	regst_date     -- date and time when a customer was registered(utc-0)
	regst_date_ltz -- date and time when a customer was registered(local timezone)

*/



CREATE TABLE CustomersData
(
	ID				INT IDENTITY(1,1),
	FirstName		NVARCHAR(50),
	Lastname		NVARCHAR(50),
	BirthDay		DATETIME,
	Age				TINYINT,
	CountryCode		CHAR(2),
	CreditLimit		MONEY,
	RegisterDate	DATETIME,
	RegisterDateLTZ	DATETIME,
)

-------------------------------


INSERT INTO CustomersData
(
	FirstName,
	Lastname,
	BirthDay,
	Age,
	CountryCode,
	CreditLimit,
	RegisterDate,
	RegisterDateLTZ
)
VALUES
(
	N'Petr',
	N'Smith',
	'1950-01-01',
	88,
	'UA',
	15000.85,
	'2017-08-15 14:17:00',
	'2017-08-15 17:17:00'
)


INSERT INTO CustomersData
(
	FirstName,
	Lastname,
	BirthDay,
	Age,
	CountryCode,
	CreditLimit,
	RegisterDate,
	RegisterDateLTZ
)
VALUES
(
	N'??????',
	N'????',
	'1950-01-01',
	35,
	'UA',
	5000.50,
	'2021-07-15 13:15:00',
	'2021-07-15 16:15:00'
)

-------------------
SELECT *
FROM   CustomersData 