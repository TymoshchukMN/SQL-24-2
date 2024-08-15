--1. ������� ��� ������, ��������� � ��������� �������� 2023 ����, � ����������� �� ���� ������.
SELECT * 
  FROM [DBO].ORDERS
WHERE ORDER_DATE BETWEEN '2007-10-01' AND '2007-12-31';

--2. ������� ���� ����������, � ������� ���� �� ���� ����������� ������ ������� �� ����� ����� 100,000.
SELECT MAN.[NAME]
  FROM [dbo].[SALESREPS] AS MAN
INNER JOIN 
(SELECT * 
  FROM [dbo].[SALESREPS]
	WHERE SALES < 100000) AS EMPL
	ON MAN.MANAGER = EMPL.MANAGER

--3. �������� ���������� � ��������, � ������� ��������� ����� ��������� ������� ��������� ����� ���� ��������.
SELECT [CUST_NUM],
	   [CREDIT_LIMIT]
  FROM [dbo].[CUSTOMERS]
  WHERE [CREDIT_LIMIT] > (SELECT AVG([CREDIT_LIMIT])
                            FROM [CUSTOMERS])

--4. ������� �����, ��� ������� ��������� ���� �� 20% � �����.
SELECT *
  FROM [dbo].[OFFICES]
 WHERE TARGET < SALES * 1.2

--5. ���������� ����� ����� ���� �������, ��������� ������ ��������������, � ���������� ������ ���, ��� ����� ������� ��������� 50000.
SELECT [NAME],
	   [SALES]
  FROM [dbo].[SALESREPS]
GROUP BY [NAME], [SALES]
HAVING SUM(SALES) > 50000
--6. ������� ������, ������� �� ���� �� ���� ��������.


--7. �������� ���� ���� �������, ���������� �� ������ ������� ����� 10, �������� � �� 15%.
--8. ������� ��� ������, ����� ����� ������� ������ 1000.
--9. ������� �����������, ������� �������� � ������, �� ������� ���������.
--10. ������� ���� ��������, ������� ���������� ������ � ���� ��������������.
--11. ����������, ��� �� ����������� ����� ���������� ���������� �����������.
--12. ������� ��������, ������� �� ���� �� ������ �������.
--13. �������� ���������� � �������, ����� ������� ��������� ������� ����� ���� �������.
--14. ������� ��� �����, ������� ������� ������� � �������, �������� �� �� �������.
--15. ������� ��������������, ��� ������ �������� ��� �������.
--16. �������� ������ ���� ������, � ������� ������� ���� �������� ������ �� ���� ������.
--17. ����������, ��� �� �������������� ������ ������ ���� ������� ������������� ������������� (��������, MFR_ID = 'ABC').
--18. ������� �����������, � ������� ������� ������ �������� �������� ���� �����������.
--19. ������� ��������, ������� ������� ������� �� ����� ������, ��� �� ��������� �����.
--20. ������� ��� ������, ������� �� ������������ � ������� ���������� ����.