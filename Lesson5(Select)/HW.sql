USE [SQL 24-2];

--Новые быстрые клавиши. … Быстрые клавиши для работы с Диском обновлены, и теперь у вас есть возможность навигации по первым буквам слов.
--Task 1
--Write a query that will return a list of employees over 45 years old.
--- Resultset must contain: id, employee name, age, position
--- Tables that are being used: [dbo].[salesreps]
--- Sort out the resultset by age (descending)

SELECT *
  FROM [dbo].[SALESREPS]
 WHERE AGE > 45
ORDER BY AGE DESC;

--Task 2
--Write a query that will return a list of unique combinations of values
--manufacturer ID (MFR) and product ID (PRODUCT). Consider only
--orders that were purchased in 2008.
--- Resultset must contain: manufacturer, product
--- Tables that are being used: [dbo].[orders]
--- Operators must be used: distinct
--- Sort out the resultset by manufacturer and product

SELECT DISTINCT MFR,
	   PRODUCT
  FROM [dbo].[orders]
WHERE [ORDER_DATE] BETWEEN '2008-01-01' AND '2008-12-31'
ORDER BY MFR, PRODUCT;


--Task 3
-- Write a query that will return client id([CUST]) with the biggest number of completed orders.
-- Consider the possibility that several customers may have the same number of completed orders. 
-- Only consider orders that were purchased in 2008.
--- Resultset must contain: client id, number of completed orders
--- Tables that are being used: [dbo].[orders]
--- Operators must be used: with ties, count
--- Sort out the resultset by number of orders

SELECT TOP 3 WITH TIES [CUST],
                       COUNT(*) AS 'completed orders'
  FROM [DBO].[ORDERS]
WHERE [ORDER_DATE]  BETWEEN '2008-01-01' AND '2008-12-31'
GROUP BY [CUST], [ORDER_NUM]
ORDER BY [ORDER_NUM]