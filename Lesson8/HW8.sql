--Task 1
--Write a query that will return a list of manufacturer IDs (without duplicates).
--Consider orders that were purchased in 2008 only.
--- Tables are used: [dbo].[ORDERS]
--- Use date functions: Year
--- Resultset contains: manufacturer ID
--- Sort the resultset out by manufacturer ID

SELECT DISTINCT [MFR]
  FROM[dbo].[ORDERS]
WHERE YEAR([ORDER_DATE]) = 2008
ORDER BY [MFR];

--Task 2
--Write a query that will return the number of employees per years of experience (math year difference).
--- Tables are used: [dbo].[SALESREPS]
--- Resultset contains: Years of experience, number of employee
--- Sort the resultset out by number of employees (descending)

SELECT YEAR(GETDATE()) - YEAR([HIRE_DATE]) AS [Years of experience],
		COUNT(*) AS [number of employee]
FROM [dbo].[SALESREPS]
GROUP BY  YEAR(GETDATE()) - YEAR([HIRE_DATE]);

--Task 3
--Write a query that will return a period (year, month) that has the biggest number of employees.
--Consider probability that several periods may have the same number of employees.
--- Tables are used: [dbo].[SALESREPS]
--- Resultset contains: Hire yaer, hire month, the number of employees that were hired
--- Use date functions: Year, Month

SELECT TOP 1
       WITH TIES
	   YEAR([HIRE_DATE]),
       MONTH([HIRE_DATE]),
	   COUNT(*)
  FROM [dbo].[SALESREPS]
GROUP BY YEAR([HIRE_DATE]), MONTH([HIRE_DATE])
ORDER BY COUNT(*) DESC;
 
--Task 4
--Write a query that will return the number of orders, total amount of orders, total 
--quantity of the sold goods per day of the week (string representation)
--Consider orders that were purchased in the winter months only.
--- Tables are used: [dbo].[ORDERS]
--- Resultset contains: week day number, weeek day, 
--  number of orders that were purchased, total amount of sales,
--  total quantity of good that were sold
--- Sort the resultset out by number of the week day

SELECT DATEPART(WEEKDAY, [ORDER_DATE]) AS [week day number] 
	  ,DATENAME(WEEKDAY, [ORDER_DATE]) AS [weeek day]
	  ,COUNT(DISTINCT[ORDER_NUM]) AS [number of orders]
	  ,SUM([AMOUNT]) AS [total amount]
	  ,SUM([QTY]) AS [total quantity]
  FROM [dbo].[ORDERS]
  WHERE MONTH([ORDER_DATE]) IN (1, 2, 12)
GROUP BY DATEPART(WEEKDAY, [ORDER_DATE]),
         DATENAME(WEEKDAY, [ORDER_DATE])
ORDER BY [week day number];