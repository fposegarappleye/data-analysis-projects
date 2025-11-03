-- SELECT RIGHT(Base_Name, 3)
-- FROM RideShareDB.dbo.other_FHV_services_jan_aug_2015

-- SELECT CHARINDEX(' ', Number_of_Trips) AS 'Occurrence of first space'
-- FROM RideShareDB.dbo.other_FHV_services_jan_aug_2015

-- SELECT DATENAME(month, Pick_Up_Date) AS 'Month'
-- FROM RideShareDB.dbo.other_FHV_services_jan_aug_2015
-- ORDER BY Pick_Up_Date DESC

-- SELECT DATEPART(Day, Pick_Up_Date) AS 'Day', DATENAME(month, Pick_Up_Date) AS 'Month'
-- FROM RideShareDB.dbo.other_FHV_services_jan_aug_2015
-- ORDER BY 'Day' ASC

-- SELECT *
-- FROM RideShareDB.dbo.lyft
-- WHERE start_lng = (
--     SELECT MIN(start_lng) FROM RideShareDB.dbo.lyft
-- )

-- SELECT *
-- FROM RideShareDB.dbo.lyft
-- WHERE start_lat = (
--     SELECT MAX(start_lat) FROM RideShareDB.dbo.lyft
-- )

SELECT CONCAT(Base_Number, ": ", Base_Name)
FROM RideShareDB.dbo.other_FHV_services_jan_aug_2015
