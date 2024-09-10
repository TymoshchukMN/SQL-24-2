USE [SQL 24-2];

--Task 1
--Write a query that will return data of the product with the longest (by number of characters) description.
--Consider the possibility that several products may have the same number of characters in the description.
--- The table used is [dbo].[PRODUCTS]
--- Use the string functions: len
--- Resultset contains: Ident. manufacturer, ident. product, 
--  product description, description length.

SELECT TOP 1
       WITH TIES
	   [MFR_ID],
       [PRODUCT_ID],
	   [DESCRIPTION],
	   LEN([DESCRIPTION])
  FROM [dbo].[PRODUCTS]
ORDER BY LEN([DESCRIPTION]) DESC;

--Task 2
--Write a query that will return data of the products that contain digits in its prodict id only.
--Concatenate values of the columns: MFR_ID, PRODUCT_ID, [DESCRIPTION]. Please note that between
--column values must be only one space. Remove trailing spaces if necessary.
--Count the number of characters in the concatenated string. Avoid duplicated rows in the resultset.
--- Table are used: [dbo].[PRODUCTS]
--- Use the predicates: NOT LIKE
--- Use string functions: CONCAT_WS, UPPER, LEN, RTRIM.
--- The resultset contains: the concatenated string, the length of the concatenated string.
--- Sort the resulting data set by the length of the concatenated string (descending)

  SELECT DISTINCT TRIM(CONCAT_WS(CHAR(32), [MFR_ID], [PRODUCT_ID], [DESCRIPTION])) AS [concatenated string],
                  LEN(TRIM(CONCAT_WS(CHAR(32), [MFR_ID], [PRODUCT_ID], [DESCRIPTION]))) AS "number of characters"
    FROM [dbo].PRODUCTS
   WHERE [PRODUCT_ID] NOT LIKE  '%[^0-9]%'
ORDER BY  "number of characters" DESC;


--Task 3
--Write a query that returns a list of customers with the lowest credit limit.
--Take into account the fact that several customers may have the same credit limit.
--The resultset contains: id. client, client name, credit limit.
--The client name must be reflected as 2 letters at the beginning of the line and 2 
--letters at the end of the line, all other numbers must be replaced with the * symbol.
--- Table are used: [dbo].[CLIENTS]

SELECT TOP 1 WITH TIES [CUST_NUM],
                  CONCAT (LEFT([COMPANY], 2),
                          REPLICATE(CHAR(42), LEN([COMPANY]) - 4),
                          RIGHT([COMPANY], 2)) AS "COMPANY",
                         [CREDIT_LIMIT]
FROM [dbo].[CUSTOMERS]
ORDER BY [CREDIT_LIMIT]