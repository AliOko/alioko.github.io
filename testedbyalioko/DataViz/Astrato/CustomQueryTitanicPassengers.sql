-- Data based on https://github.com/ali-ce/datasets/blob/master/Titanic/Passenger%2BCrew.csv

-- Disembarked passengers

SELECT DISEMBARKED_AT, COUNT(*) AS "Disembarked_passengers"
FROM MEDELLIN.TITANICPASSENGERS
GROUP BY DISEMBARKED_AT

-- Embarked passengers

SELECT EMBARKED, COUNT(*) AS "Embarked_passengers"
FROM MEDELLIN.TITANICPASSENGERS
GROUP BY EMBARKED

-- Embarked vs disembarked passengers
SELECT CLASS__DEPARTMENT, EMBARKED,DISEMBARKED_AT, COUNT (*) AS passagers
FROM MEDELLIN.TITANICPASSENGERS
GROUP BY 1,2,3


-- Summarised by Class, Status

SELECT COUNT(TITANIC_PASSAGER) AS TITANIC_PASSAGER,
CASE
    WHEN CLASS__DEPARTMENT LIKE '1st%' THEN '1st'
    WHEN CLASS__DEPARTMENT LIKE '2nd%' THEN '2nd'
    WHEN CLASS__DEPARTMENT LIKE '3rd%' THEN '3rd'
        ELSE 'Crew'
            END AS DEPARTMENT,
CASE
    WHEN STATUS = 'Survivor' THEN 'Survivor'
    WHEN STATUS = 'Victim' THEN 'Victim'
    WHEN STATUS IS NULL AND DISEMBARKED_AT != 'Not Disembarked' THEN 'Disembarked'
    END AS STATUS
FROM "DEMO_DATASET"."MEDELLIN"."TITANICPASSENGERS"
GROUP BY 3,2

-- Summarised by age
SELECT AGE::float AS Age, COUNT(*) AS Passengers,
CASE 
	WHEN Age < 12 THEN 'Child'
    WHEN Age >= 12 THEN 'Adult'
    	END AS Maturity
FROM MEDELLIN.TITANICPASSENGERS
GROUP BY 1,3

-- Summarised by age, class

SELECT AGE::float AS Age,
         COUNT(*) AS Passengers,
        
    CASE
        WHEN Age < 12 THEN
        'Child'
        WHEN Age >= 12 THEN
        'Adult'
    END AS Maturity,
    CASE
        WHEN CLASS__DEPARTMENT LIKE '1st%' THEN
        '1st'
        WHEN CLASS__DEPARTMENT LIKE '2nd%' THEN
        '2nd'
        WHEN CLASS__DEPARTMENT LIKE '3rd%' THEN
        '3rd'
        ELSE 'Crew'
    END AS DEPARTMENT
FROM MEDELLIN.TITANICPASSENGERS
GROUP BY  1,3,4

-- Summarised by age,gender
SELECT AGE::float AS Age,
         GENDER,
         COUNT(*) AS Passengers,
    CASE
        WHEN CLASS__DEPARTMENT LIKE '1st%' THEN
        '1st'
        WHEN CLASS__DEPARTMENT LIKE '2nd%' THEN
        '2nd'
        WHEN CLASS__DEPARTMENT LIKE '3rd%' THEN
        '3rd'
        ELSE 'Crew'
    END AS DEPARTMENT
FROM MEDELLIN.TITANICPASSENGERS
GROUP BY  1,4,2

-- Route data

SELECT Route, Port, Country, Date::Date , Alpha3, From_, To_
FROM (values(0,'Belfast','England','1912-04-02','GBR',NULL,'Belfast'), 
     	    (1,'Southampton','England','1912-04-10', 'GBR', 'Belfast','Southampton'),
     	    (2,'Cherbourg','France','1912-04-10','FRA', 'Southampton','Cherbourg'),
     	    (3,'Queenstown','Ireland','1912-04-11','IRL', 'Cherbourg', 'Queenstown'),
            (4,'New York','USA',NULL, 'USA', 'Queenstown','New York')) AS v1(Route, Port, Country, Date, Alpha3, From_, To_)
