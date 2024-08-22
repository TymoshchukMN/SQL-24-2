USE [SQL 24-2];

--Task 1
--Write a query that will return a list of eastern offices which 
--target sales amount is less or equals 350000.00.
--- Resultset must contain: office ID, city, manager ID
--- Tables that are being used: [dbo].[OFFICES]

SELECT [OFFICE]
       ,[CITY]
	   ,[MGR]
  FROM [dbo].[OFFICES]
 WHERE [TARGET] <= 350000.00 AND [REGION] = 'Eastern';


-- Task 2.1
--Write a query that will return a list of orders which were purchased not in 2008.
--Consider only orders with products id that have A as second symbol or 0 anywhere.
--- Tables that are being used: [dbo].[ORDERS] 
--- Operators must be used: LIKE, NOT BETWEEN

SELECT *
  FROM [dbo].[ORDERS]
 WHERE ([ORDER_DATE] NOT BETWEEN '20080101' AND '20081231')
       AND 
	   ([PRODUCT] LIKE '_[A]%' OR [PRODUCT] LIKE '%[0-9]%');

--Task 2.2
--Write a query that will return a total amount of order sales per manfucaturer. 
--Consider orders that were purchased not in 2008 only and products id that have A as 
--the second symbol or 0 anywhere.
--- Resultset must contain: manfucaturer id, total sales amount
--- Tables that are being used: [dbo].[ORDERS] 
--- Operators must be used: LIKE, NOT BETWEEN, SUM
--- Sort out the resultset by total amount (descending)

  SELECT [MFR]
         ,SUM([AMOUNT]) AS "total sales amount"
    FROM [dbo].[ORDERS]
   WHERE ([ORDER_DATE] NOT BETWEEN '20080101' AND '20081231')
         AND 
         ([PRODUCT] LIKE '_[A]%' OR [PRODUCT] LIKE '%[0-9]%')
GROUP BY [MFR]
ORDER BY SUM([AMOUNT]) DESC;


--Task 2.3
--Write a query that will return manfucaturer id which has the biggest total amount of sales.
--Consider the possibility that several manfucaturers may have the same total amount.
--Consider orders that were purchased not in 2008 only and products id that have A as 
--the second symbol or 0 anywhere.
--- Resultset must contain: manfucaturer id, total sales amount
--- Tables that are being used: [dbo].[ORDERS] 
--- Operators must be used: LIKE, NOT BETWEEN, SUM, TOP, WITH TIES

  SELECT TOP (1) WITH TIES [MFR]
         ,SUM([AMOUNT]) AS "total sales amount"
    FROM [dbo].[ORDERS]
   WHERE ([ORDER_DATE] NOT BETWEEN '20080101' AND '20081231')
         AND 
         ([PRODUCT] LIKE '_[A]%' OR [PRODUCT] LIKE '%[0-9]%')
GROUP BY [MFR]
ORDER BY SUM([AMOUNT]) DESC;

--Task 3
--Write a query that will return an office id which has the biggest number of employees (number of people who work in an office).
--Consider the possibility that several offices may have the same number of employees.
--Consider employees who hold Sales Rep position and 29, 45, 48 years old.
--- Resultset must contain: office id, number of employees (number of people who work in an office)
--- Tables that are being used: [dbo].[SALESREPS] 
--- Operators must be used: IN
--- Operators must be used: COUNT, TOP, WITH TIES

  SELECT TOP(1)
    WITH TIES
	     [REP_OFFICE]
         ,COUNT(*) AS "number of employees"
    FROM [dbo].[SALESREPS] 
   WHERE [TITLE] = 'Sales Rep' AND [AGE] IN (29, 45, 48)
GROUP BY [REP_OFFICE]
ORDER BY "number of employees" DESC;