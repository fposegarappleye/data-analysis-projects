-- SELECT 
--     CONCAT(d.forename, ' ', d.surname) AS 'Name'
--     , r.points AS 'Points'
--     , rc.name AS 'Race'
--     , rc.year AS 'Year'
-- FROM formula_one.dbo.results AS r
-- JOIN formula_one.dbo.drivers AS d
--     ON r.driverId = d.driverId
-- JOIN formula_one.dbo.races AS rc
--     ON r.raceId = rc.raceId;

-- Show all drivers, even if they don't have any results
-- SELECT
--     d.driverId
--     , CONCAT(d.forename, ' ', d.surname) AS 'Name'
--     , SUM(points) AS 'Career Points'
--     , d.nationality AS 'Nationality'
-- FROM formula_one.dbo.drivers AS d
-- LEFT JOIN formula_one.dbo.results AS r
--     ON d.driverId = r.driverId
-- GROUP BY d.forename, d.surname, d.driverId, d.nationality
-- ORDER BY SUM(points) DESC;


-- Which results belong to British drivers?
-- SELECT
--     re.raceId
--     , re.driverId
--     , re.points
--     , ra.name
-- FROM formula_one.dbo.results AS re
-- JOIN formula_one.dbo.races AS ra
--     ON ra.raceId = re.raceId
-- WHERE re.driverId IN (
--     SELECT driverId
--     FROM formula_one.dbo.drivers
--     WHERE nationality LIKE 'British'
-- )


-- Common Table Expressions
-- CTEs more readable - useful for more complex selections/filterings
-- TOP 10 British drivers by total points
;WITH british_drivers AS (
    SELECT 
        d.driverId,
        d.forename, 
        d.surname
    FROM formula_one.dbo.drivers AS d
    WHERE d.nationality = 'British'
),
british_results AS (
    SELECT
        bd.forename,
        bd.surname,
        res.points
    FROM formula_one.dbo.results As res
    JOIN british_drivers AS bd
        ON res.driverId = bd.driverId
)
SELECT TOP 10
    br.forename,
    br.surname
    SUM(br.points) AS total_points
FROM british_results AS br
GROUP BY
    br.forename, br.surname
ORDER BY 
    total_points DESC;