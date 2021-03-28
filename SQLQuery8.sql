BEGIN TRAN
UPDATE Person.PersonPhone
SET
PhoneNumber ='000-000-0000'
WHERE BusinessEntityID IN( SELECT 
                            BusinessEntityID +3 
                            FROM Person.PersonPhone 
                            WITH(REPEATABLEREAD)
                            WHERE BusinessEntityID BETWEEN 1 AND 5)
WAITFOR DELAY
'00:00:05'
ROLLBACK
SELECT
BusinessEntityID,
PhoneNumber,
PhoneNumberTypeID
FROM Person.PersonPhone
WHERE BusinessEntityId IN(2,3)