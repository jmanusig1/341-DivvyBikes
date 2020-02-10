-- Project0506.sql
-- 6.	For each age group (year) among customers, list the average 
--  ride duration among all trips customers of that age group took.  

SELECT TOP 10 (2019 - Users.BirthYear) AS Age, AVG(Trips.TripDuration) AS AverageTripDurationPerAgeGroup
FROM Users, Trips
WHERE Users.UserID = Trips.UserID
GROUP BY Users.BirthYear
ORDER BY AverageTripDurationPerAgeGroup DESC