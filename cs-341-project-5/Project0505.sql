-- Project0505.sql
-- 5.	For each customer list the number of trips they have taken.
--   Restrict the results to the 10 users who have taken the most trips.

SELECT TOP 10 UserID, COUNT(UserID) AS NumTrips
FROM Trips
GROUP BY USERID
ORDER BY NumTrips DESC