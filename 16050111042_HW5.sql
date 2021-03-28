WITH Emp AS
(
	SELECT
		PersonType
		, Title
		, FirstName
		, MiddleName
		, LastName
		, JobTitle
		, BirthDate
		, MaritalStatus
		, Gender
		, HireDate
	FROM HumanResources.Employee AS E INNER JOIN Person.Person AS P
	ON E.BusinessEntityID = P.BusinessEntityID
)
SELECT
	PersonType
	, Title
	, FirstName + ' ' + MiddleName + ' ' + LastName as FullName
	, JobTitle
	, CASE WHEN MaritalStatus = 'S' AND Gender = 'M' THEN 'Single Male'
		WHEN MaritalStatus = 'S' AND Gender = 'F' THEN 'Single Female'
		WHEN MaritalStatus = 'M' AND Gender = 'M' THEN 'Married Male'
		WHEN MaritalStatus = 'M' AND Gender = 'F' THEN 'Married Female' 
	END AS SocialStatus
	, DATEDIFF(YY, BirthDate, GETDATE()) AS Age
	, CAST(MONTH(HireDate) AS VARCHAR(11)) + '/' + CAST(YEAR(HireDate) AS varchar(11)) AS HireMonthYear
FROM Emp
WHERE Title IS NOT NULL
ORDER BY PersonType