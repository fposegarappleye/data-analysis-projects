SELECT TOP 5 * FROM LaborStatisticsDB.dbo.annual_2016
SELECT TOP 5 * FROM LaborStatisticsDB.dbo.january_2017

SELECT * FROM LaborStatisticsDB.dbo.industry
SELECT * FROM LaborStatisticsDB.dbo.series

SELECT * FROM LaborStatisticsDB.dbo.period
SELECT TOP 5 * FROM LaborStatisticsDB.dbo.footnote
SELECT TOP 5 * FROM LaborStatisticsDB.dbo.seasonal
SELECT * FROM LaborStatisticsDB.dbo.datatype
SELECT * FROM LaborStatisticsDB.dbo.supersector

-- SELECT TOP 5 * FROM LaborStatisticsDB.dbo.annual_2016
-- SELECT * FROM LaborStatisticsDB.dbo.series

-- SELECT data_type_code FROM LaborStatisticsDB.dbo.datatype AS Datatype
-- WHERE data_type_text LIKE 'women employees'




-- QUESTION 2
-- Connect Supersector WHERE industry name LIKE banking
--   TO: 
-- SELECT series_id AS 'Series ID', seasonal_text AS 'Adjusted or Not'
-- FROM LaborStatisticsDB.dbo.series AS s1
-- JOIN LaborStatisticsDB.dbo.seasonal AS s2 
-- ON s1.seasonal = s2.industry_code
-- WHERE 
--     supersector_code = (
--     SELECT supersector_code 
--     FROM LaborStatisticsDB.dbo.supersector
--     WHERE supersector_name 
--     LIKE '%financial%'
--     )
--     AND data_type_code = (
--     SELECT data_type_code
--     FROM LaborStatisticsDB.dbo.datatype
--     WHERE data_type_text LIKE 'women employees'
--     )
--     AND s1.industry_code = (
--         SELECT industry_code FROM LaborStatisticsDB.dbo.industry
--         WHERE industry_name = 'Commercial banking'
--     )



SELECT * FROM LaborStatisticsDB.dbo.annual_2016 WHERE period = 'M13'
SELECT * FROM LaborStatisticsDB.dbo.series

-- AGGREGATE FRIENDS
SELECT CAST(ROUND(SUM(value), 0) as INT)
-- SELECT *
FROM LaborStatisticsDB.dbo.annual_2016 AS a
LEFT JOIN LaborStatisticsDB.dbo.series AS s 
    ON a.series_id = s.series_id
LEFT JOIN LaborStatisticsDB.dbo.industry AS i
    ON s.industry_code = i.industry_code
WHERE series_title LIKE 'All employees'
    AND original_file LIKE '%allcesseries%'
    AND LEN(naics_code) > 3 
ORDER BY s.series_id




SELECT CAST(ROUND(SUM(value), 0) as INT)
 SELECT *
    -- i.industry_code, 
    -- naics_code,
    -- industry_name,
    -- value
FROM LaborStatisticsDB.dbo.industry AS i
LEFT JOIN LaborStatisticsDB.dbo.series AS s 
    ON i.industry_code = s.industry_code
LEFT JOIN LaborStatisticsDB.dbo.annual_2016 AS a
    ON a.series_id = s.series_id
LEFT JOIN LaborStatisticsDB.dbo.supersector AS ss
    ON ss.supersector_code = s.supersector_code
WHERE series_title LIKE 'All employees'
    AND original_file LIKE '%allcesseries%'
    AND LEN(naics_code) = 1
    -- AND industry_name IS NOT NULL
ORDER BY naics_code


SELECT * --naics_code, industry_name
FROM LaborStatisticsDB.dbo.industry
ORDER BY naics_code

SELECT * FROM


SELECT * FROM LaborStatisticsDB.dbo.industry
WHERE industry_name LIKE '%farm%'


SELECT * FROM LaborStatisticsDB.dbo.series
WHERE series_title LIKE 'All employees'

-- WHERE data_type_code IN (
--     SELECT data_type_code FROM LaborStatisticsDB.dbo.datatype
--     WHERE data_type_text = 'ALL EMPLOYEES')

SELECT CAST(ROUND(SUM(value), 0) as INT) FROM LaborStatisticsDB.dbo.annual_2016
WHERE series_id IN (
    SELECT series_id FROM LaborStatisticsDB.dbo.series
    WHERE series_title = 'Women employees'
)




SELECT *
    -- s.series_id,
    -- series_title,
    -- ss.supersector_name,
    -- i.industry_name,
    -- s.data_type_code,
    -- value,
    -- seasonal
    -- 1000*SUM(value)
FROM LaborStatisticsDB.dbo.annual_2016 AS a
LEFT JOIN LaborStatisticsDB.dbo.series AS s
    ON s.series_id = a.series_id
RIGHT JOIN LaborStatisticsDB.dbo.supersector AS ss
    ON s.supersector_code = ss.supersector_code
LEFT JOIN LaborStatisticsDB.dbo.datatype AS d
    ON s.data_type_code = d.data_type_code
LEFT JOIN LaborStatisticsDB.dbo.industry AS i
    ON s.industry_code = i.industry_code
WHERE 
    series_title LIKE 'all employees'
    AND LEN(i.naics_code) < 4
ORDER BY value DESC
-- ORDER BY i.naics_code

----------------------------------------------
SELECT 
    SUM(value)
FROM LaborStatisticsDB.dbo.annual_2016 AS a
LEFT JOIN LaborStatisticsDB.dbo.series AS s
    ON a.series_id = s.series_id
WHERE series_title LIKE 'all employees'
---------------------------------------------





SELECT CAST(ROUND(1000*SUM(value), 0) as INT)

SELECT *
FROM LaborStatisticsDB.dbo.industry AS i
LEFT JOIN LaborStatisticsDB.dbo.series AS s 
    ON i.industry_code = s.industry_code
LEFT JOIN LaborStatisticsDB.dbo.annual_2016 AS a
    ON a.series_id = s.series_id
WHERE industry_name LIKE 'Total nonfarm'
    AND original_file LIKE '%allcesseries%'
    AND data_type_code LIKE '6'

SELECT * FROM LaborStatisticsDB.dbo.datatype




SELECT *
FROM LaborStatisticsDB.dbo.annual_2016 AS a
LEFT JOIN LaborStatisticsDB.dbo.series AS s
    ON s.series_id = a.series_id
LEFT JOIN LaborStatisticsDB.dbo.industry AS i
    ON i.industry_code = s.industry_code
WHERE original_file LIKE '%allcesseries%'
    AND series_title LIKE 'Production and nonsupervisory employees'



SELECT ROUND(AVG(value), 1) AS 'Average weekly hours of production and nonsupervisory employees across industry'
FROM LaborStatisticsDB.dbo.january_2017 AS j
LEFT JOIN LaborStatisticsDB.dbo.series AS s
    ON s.series_id = j.series_id
WHERE series_title LIKE 'Average weekly hours of production and nonsupervisory employees'
    AND original_file LIKE '%allcesseries%'






SELECT SUM(value)
FROM LaborStatisticsDB.dbo.january_2017 AS j
LEFT JOIN LaborStatisticsDB.dbo.series AS s
    ON s.series_id = j.series_id
LEFT JOIN LaborStatisticsDB.dbo.industry AS i
    ON i.industry_code = s.industry_code
WHERE series_title LIKE 'aggregate%payroll%nonsupervisory%'
    AND original_file LIKE '%allcesseries%'
    AND LEN(i.naics_code) = 1
ORDER BY j.series_id



SELECT * FROM LaborStatisticsDB.dbo.industry ORDER BY naics_code
SELECT series_id, series_title, data_type_code FROM LaborStatisticsDB.dbo.series
SELECT * FROM LaborStatisticsDB.dbo.january_2017



-- Modular
-- SELECT j.series_id,series_title, j.value, naics_code, industry_name


SELECT FORMAT(SUM(value)*1000, 'N0')
FROM LaborStatisticsDB.dbo.january_2017 AS j
JOIN LaborStatisticsDB.dbo.series 
    AS s 
    ON j.series_id = s.series_id
JOIN LaborStatisticsDB.dbo.industry 
    AS i 
    ON s.industry_code = i.industry_code
WHERE original_file LIKE '%allcesseries%' 
    AND series_title LIKE 'Production and nonsupervisory employees'
    AND j.series_id LIKE '%CES%'
    AND LEN(naics_code) = 2



SELECT * FROM LaborStatisticsDB.dbo.seasonal






-- Q5
SELECT j.series_id,series_title, j.value, naics_code, industry_name
-- SELECT FORMAT(SUM(value), 'N0')
FROM LaborStatisticsDB.dbo.january_2017 AS j
JOIN LaborStatisticsDB.dbo.series 
    AS s 
    ON j.series_id = s.series_id
JOIN LaborStatisticsDB.dbo.industry 
    AS i 
    ON s.industry_code = i.industry_code
WHERE original_file LIKE '%allcesseries%' 
    AND series_title LIKE 'Aggregate weekly payrolls of production and nonsupervisory employees'
    AND j.series_id LIKE '%CES%'
    AND LEN(naics_code) = 4





-- Q6
SELECT TOP 1 industry_name, series_title, value
-- SELECT FORMAT(SUM(value), 'N0')
FROM LaborStatisticsDB.dbo.january_2017 AS j
JOIN LaborStatisticsDB.dbo.series 
    AS s 
    ON j.series_id = s.series_id
JOIN LaborStatisticsDB.dbo.industry 
    AS i 
    ON s.industry_code = i.industry_code
WHERE original_file LIKE '%allcesseries%' 
    AND series_title LIKE 'Average weekly hours of production and nonsupervisory employees'
    AND j.series_id LIKE '%CES%'
ORDER BY value ASC





SELECT TOP 1 industry_name, series_title, value
-- SELECT FORMAT(SUM(value), 'N0')

SELECT TOP 1 industry_name, series_title, FORMAT(value, 'N0')
FROM LaborStatisticsDB.dbo.january_2017 AS j
JOIN LaborStatisticsDB.dbo.series 
    AS s 
    ON j.series_id = s.series_id
JOIN LaborStatisticsDB.dbo.industry 
    AS i 
    ON s.industry_code = i.industry_code
WHERE original_file LIKE '%allcesseries%' 
    AND series_title LIKE 'Aggregate weekly payrolls of production and nonsupervisory employees'
    AND j.series_id LIKE '%CES%'
    AND LEN(naics_code) = 2
ORDER BY value ASC






-- JOIN SECTION
SELECT TOP 50 a.*
FROM LaborStatisticsDB.dbo.annual_2016 AS a
LEFT JOIN LaborStatisticsDB.dbo.series AS s
ON a.series_id = s.series_id
ORDER BY a.series_id





SELECT TOP 50 *
FROM LaborStatisticsDB.dbo.series AS s
LEFT JOIN LaborStatisticsDB.dbo.datatype AS d
ON s.data_type_code = d.data_type_code
ORDER BY series_id



--
SELECT j.series_id, i.industry_code, industry_name, (FORMAT(value, 'N0') + ' hours')
FROM LaborStatisticsDB.dbo.january_2017 AS j
LEFT JOIN LaborStatisticsDB.dbo.series AS s
    ON j.series_id = s.series_id
LEFT JOIN LaborStatisticsDB.dbo.industry AS i
    ON s.industry_code = i.industry_code
WHERE value > (
    SELECT AVG(value)
    FROM LaborStatisticsDB.dbo.annual_2016 AS a
    LEFT JOIN LaborStatisticsDB.dbo.series AS s
        ON a.series_id = s.series_id
    WHERE data_type_code = 82
)
AND data_type_code = 82
ORDER BY value DESC

SELECT * FROM LaborStatisticsDB.dbo.datatype;




WITH cte_data_82 
AS (
    SELECT 
        j.series_id
        ,i.industry_code
        ,industry_name
        ,value  
    FROM
       LaborStatisticsDB.dbo.january_2017 AS j
    LEFT JOIN LaborStatisticsDB.dbo.series AS s
        ON j.series_id = s.series_id
    LEFT JOIN LaborStatisticsDB.dbo.industry AS i
        ON s.industry_code = i.industry_code
    WHERE 
        s.data_type_code = 82
)

SELECT *
FROM cte_data_82
WHERE value > (
    SELECT AVG(value)
    FROM LaborStatisticsDB.dbo.annual_2016 AS a
    LEFT JOIN LaborStatisticsDB.dbo.series AS s
        ON a.series_id = s.series_id
    WHERE 
        data_type_code = 82
)


SELECT * FROM LaborStatisticsDB.dbo.datatype




SELECT * FROM LaborStatisticsDB.dbo.period
----------------------------------------------
DECLARE @seek_data_type INT = 30;
DECLARE @data_type_name VARCHAR(100);

SET @data_type_name = (
    SELECT TOP 1 series_title
    FROM LaborStatisticsDB.dbo.series
    WHERE data_type_code = @seek_data_type
)

SELECT 
    CONCAT('$',ROUND(AVG(value),2))
    ,p.month
    ,a.year
    ,@data_type_name
FROM LaborStatisticsDB.dbo.annual_2016 AS a
LEFT JOIN LaborStatisticsDB.dbo.period AS p
    ON a.period = p.period_code
WHERE series_id IN (
    SELECT series_id
    FROM LaborStatisticsDB.dbo.series
    WHERE data_type_code = @seek_data_type
)
GROUP BY p.[month],a.year

UNION

SELECT 
    CONCAT('$', ROUND(AVG(value),2))
    ,p.month
    ,j.year
    ,@data_type_name
FROM LaborStatisticsDB.dbo.january_2017 AS j
LEFT JOIN LaborStatisticsDB.dbo.period AS p
    ON j.period = p.period_code
WHERE j.series_id IN (
    SELECT series_id
    FROM LaborStatisticsDB.dbo.series
    WHERE data_type_code = @seek_data_type
)
GROUP BY p.[month],j.year






-------------------------------
SELECT TOP 1 industry_name, series_title, FORMAT(value, 'N0')
FROM LaborStatisticsDB.dbo.january_2017 AS j
JOIN LaborStatisticsDB.dbo.series 
    AS s 
    ON j.series_id = s.series_id
JOIN LaborStatisticsDB.dbo.industry 
    AS i 
    ON s.industry_code = i.industry_code
WHERE original_file LIKE '%allcesseries%' 
    AND series_title LIKE 'Aggregate weekly payrolls of production and nonsupervisory employees'
    AND j.series_id LIKE '%CES%'
    AND LEN(naics_code) = 2
ORDER BY value DESC;
GO

SELECT TOP 1 industry_name, series_title, FORMAT(value, 'N0')
FROM LaborStatisticsDB.dbo.january_2017 AS j
JOIN LaborStatisticsDB.dbo.series 
    AS s 
    ON j.series_id = s.series_id
JOIN LaborStatisticsDB.dbo.industry 
    AS i 
    ON s.industry_code = i.industry_code
WHERE original_file LIKE '%allcesseries%' 
    AND series_title LIKE 'Aggregate weekly payrolls of production and nonsupervisory employees'
    AND j.series_id LIKE '%CES%'
    AND LEN(naics_code) = 2
ORDER BY value ASC;
GO


-------------------------------------------------------------
-- Grab avg pay, avg hours
-- Periods 1-12 on year and then tack on Jan 2017

SELECT * FROM LaborStatisticsDB.dbo.datatype
-- 7: AVG weekly hours of production and nonsupervisory employees
-- 8,30,31,32: Average hourly earnings of production and nonsupervisory employees
-- 9: Average weekly overtime hours of production and nonsupervisory employees 

SELECT 
FROM LaborStatisticsDB.dbo.january_2017 

UNION







SELECT
    'Annual 2016'
    ,(
        SELECT AVG(value)
                FROM LaborStatisticsDB.dbo.annual_2016 AS a
        LEFT JOIN LaborStatisticsDB.dbo.series AS s
            ON a.series_id = s.series_id
        WHERE s.series_title = 'AVERAGE WEEKLY HOURS OF PRODUCTION AND NONSUPERVISORY EMPLOYEES'
            AND
            a.original_file LIKE '%AllCESSeries.csv%'
    ) AS 'AVG hours/wk'
    ,(
        SELECT AVG(value)
        FROM LaborStatisticsDB.dbo.annual_2016 AS a
        LEFT JOIN LaborStatisticsDB.dbo.series AS s
            ON a.series_id = s.series_id
        WHERE s.series_title = 'Average weekly earnings of production and nonsupervisory employees'
            AND
            a.original_file LIKE '%AllCESSeries.csv%'
    ) AS 'AVG earnings/wk'
    ,(
        SELECT AVG(value)
        FROM LaborStatisticsDB.dbo.annual_2016 AS a
        LEFT JOIN LaborStatisticsDB.dbo.series AS s
            ON a.series_id = s.series_id
        WHERE s.series_title = 'Average weekly overtime hours of production and nonsupervisory employees'
            AND
            a.original_file LIKE '%AllCESSeries.csv%'
    ) AS 'AVG overtime/wk'

UNION

SELECT 
    'Jan 2017'
    ,(
        SELECT AVG(value)
                FROM LaborStatisticsDB.dbo.january_2017 AS j
        LEFT JOIN LaborStatisticsDB.dbo.series AS s
            ON j.series_id = s.series_id
        WHERE s.series_title = 'AVERAGE WEEKLY HOURS OF PRODUCTION AND NONSUPERVISORY EMPLOYEES'
            AND
            j.original_file LIKE '%AllCESSeries.csv%'
    ) AS 'AVG hours/wk'
    ,(
        SELECT AVG(value)
        FROM LaborStatisticsDB.dbo.january_2017 AS j
        LEFT JOIN LaborStatisticsDB.dbo.series AS s
            ON j.series_id = s.series_id
        WHERE s.series_title = 'Average weekly earnings of production and nonsupervisory employees'
            AND
            j.original_file LIKE '%AllCESSeries.csv%'
    ) AS 'AVG earnings/wk'
    ,(
        SELECT AVG(value)
        FROM LaborStatisticsDB.dbo.january_2017 AS j
        LEFT JOIN LaborStatisticsDB.dbo.series AS s
            ON j.series_id = s.series_id
        WHERE s.series_title = 'Average weekly overtime hours of production and nonsupervisory employees'
            AND
            j.original_file LIKE '%AllCESSeries.csv%'
    ) AS 'AVG overtime/wk'

SELECT * FROM LaborStatisticsDB.dbo.datatype





------------------------------------

SELECT * 
FROM LaborStatisticsDB.dbo.annual_2016 AS a
LEFT JOIN LaborStatisticsDB.dbo.series AS s
    ON a.series_id = s.series_id
LEFT JOIN LaborStatisticsDB.dbo.industry AS i
    ON s.industry_code = i.industry_code
WHERE s.series_title = 'Average weekly earnings of production and nonsupervisory employees'
ORDER BY value

UNION 

SELECT LaborStatisticsDB.dbo.january_2017
WHERE 