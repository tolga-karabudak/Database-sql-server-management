--16050111042 Tolgahan KARABUDAK

BEGIN TRAN
UPDATE Sales.CreditCard
SET

[ModifiedDate] ='08.08.2019'
WHERE CreditCardID IN (Select
[CreditCardID]
FROM Sales.CreditCard
WITH(REPEATABLEREAD)
WHERE CreditCardID BETWEEN 10 AND 15)
WAITFOR DELAY
'00:00:10'
ROLLBACK
SELECT
[CreditCardID]
,[CardNumber]
,[ExpMonth]
,[ExpYear]
,[ModifiedDate]
FROM Sales.CreditCard
WHERE CreditCardID IN(2,3)