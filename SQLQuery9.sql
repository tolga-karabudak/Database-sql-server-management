BEGIN TRAN
UPDATE Sales.CreditCard
SET
[ModifiedDate] ='22.01.2021'
WHERE CreditCardID IN (Select
[CreditCardID]
FROM Sales.CreditCard
WITH(REPEATABLEREAD)
WHERE CreditCardID BETWEEN 10 AND 15)
ROLLBACK
SELECT

[CardNumber]
,[ExpMonth]
,[ExpYear]
,[ModifiedDate]
FROM Sales.CreditCard
WHERE CreditCardID IN(2,3)