/*
	[AdventureWorks2016].[Sales].[SalesOrderHeader]
	Clientes que compraram mais de 5 vezes e quais as compras durante os anos

	* Tabela de variável
	* Tabela Temporária
	* Sub Select
	* CTE

	1° - Clientes com mais de 5 compras
*/
--============= * Tabela de variável ==================

/*SELECT
	*
FROM (
	-- Subselect
	SELECT 
		CustomerID,
		COUNT(*) As Quantidade
	FROM 
		[AdventureWorks2016].[Sales].[SalesOrderHeader]
	GROUP BY
		CustomerID
) Dados
WHERE
	Quantidade > 5


DECLARE @Dados TABLE (
	CustomerID INT,
	Quantidate INT
)


INSERT INTO @Dados
SELECT
	CustomerID,
	COUNT(*) as Quantidade
FROM
	[AdventureWorks2016].[Sales].[SalesOrderHeader]
GROUP BY
	CustomerID
HAVING
	COUNT(*) > 5

-- Join 3364
/*SELECT
	S.*
FROM
	[AdventureWorks2016].[Sales].[SalesOrderHeader] S INNER JOIN @Dados D ON D.CustomerID = S.CustomerID*/
	


-- SUBSELECT
SELECT
	S.*
FROM
	[AdventureWorks2016].[Sales].[SalesOrderHeader] S
WHERE
	CustomerID IN (
		Select DISTINCT CustomerID FROM @Dados
	)

--============= * Tabela de variável - Fim ==================*/