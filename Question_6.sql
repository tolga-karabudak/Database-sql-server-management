--16050111042 Tolgahan KARABUDAK

WITH DEPARTMENT (ID, GroupName) AS
(
    SELECT
        *
    FROM (
        VALUES
        (1, 'Research and Deveploment'),
        (2, 'Research and Deveploment'),
        (3, 'Sales and Marketing'),
        (4, 'Sales and Marketing'),
        (5, 'Inventory Management'),
        (6, 'Research and Deveploment'),
        (7, 'Manufacting'),
        (8, 'Manufacting'),
        (9, 'Executive General and Administration'),
        (10,'Executive General and Administration'),
        (11,'Executive General and Administration'),
        (12,'Quality Assurance'),
        (13,'Quality Assurance'),
        (14,'Executive General and Administration'),
        (15,'Inventory Management'),
        (16,'Executive General and Administration')
    ) DEPARTMENT (ID, GroupName)
)
SELECT s.ID,
       CASE WHEN s.groupname = s.out_groupname 

       THEN '" "' 

       ELSE s.groupname

       END as GroupName

  FROM (
        select 
        a1.ID, a1.groupname,

        a2.ID as alt_ID,
        
		a2.groupname as out_groupname

          from 
          department a1  LEFT JOIN department a2 

          ON a1.ID = a2.ID+1
       ) s
ORDER BY s.ID