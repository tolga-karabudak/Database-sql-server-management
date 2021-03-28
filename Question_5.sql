--16050111042 Tolgahan KARABUDAK

WITH EXPERIMENT(ExpId,Code) AS
(
SELECT 
*
FROM(
    VALUES
    (1,'A10'),
    (2,'A20'),
    (3,'C40'),
    (4,'B00'),
    (5,'B99')
    )
EXPERIMENT(ExpId,Code)
),

MEASUREMENT(ExpId,Value) AS
(
SELECT
*
FROM(
    VALUES
    (1,30.0),
    (1,3.0),
    (1,0.5),
    (2,5.0),
    (2,7.0),
    (3,0.1),
    (4,1.0),
    (4,2.0),
    (4,3.0),
    (4,5.0),
    (5,2.0),
    (5,0.1),
    (5,3.0)
    )
    MEASUREMENT(ExpId,Value)
)
SELECT EXPERIMENT.CODE AS "ExperimentCode", COUNT(*) AS "ValCount", 

EXP(SUM(LOG(MEASUREMENT.VALUE))) AS "ValueMultiplication"

FROM EXPERIMENT, MEASUREMENT

WHERE EXPERIMENT.ExpId = MEASUREMENT.ExpId

GROUP BY EXPERIMENT.CODE;