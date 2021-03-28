--16050111042 Tolgahan KARABUDAK

SELECT
CreditCardID
, ModifiedDate
FROM Sales.CreditCard WITH(NOLOCK)
WHERE CreditCardID IN (6,2)

SELECT
CreditCardID
, ModifiedDate
FROM Sales.CreditCard
WHERE CreditCardID IN (3,4)

--We can do these two things to avoid deadlocks
--	1.	Let we think about, we use SQL in default 
--		isolation level, table will lock. Then, next
--		querie have to wait. We should use NOLOCK so,
--		we can override that lock. We can able to access
--		other querries.

--  2.  We can realise that we use NOLOCK but that is
--		not effective to get deadlock. We can update 
--		data to the transaction to avoid deadlock. And
--		we can decrease user interaction because for
--		increase speed. In my researches, keeping short
--		and fast will be avoid deadlocks.