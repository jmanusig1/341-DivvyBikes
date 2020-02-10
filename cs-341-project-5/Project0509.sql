-- Project0509.sql
-- 9.	The station contains a location as latitude and longitude.  Compute for 
--  each trip the distance covered by that trip, using the following equation to 
--  approximate: sqrt( (69 miles * difference in latitude)^2 + (52 miles * 
--  difference in longitude)^2 ).  For this computation, use the SQRT function and 
--  SQUARE function in SQL.  For the 10 longest trips, return the trip ID, 
--  starting station ID, ending station ID, and distance travelled as Distance.

SELECT TOP 10 TripID, FromStation, ToStation,
    Distance = SQRT( SQUARE(69 * ( (
        SELECT Latitude 
        FROM Stations 
        WHERE FromStation = Stations.StationID) - (
            SELECT Latitude 
            FROM Stations 
        WHERE ToStation = Stations.StationID)) ) + SQUARE(52 * ( (
            SELECT Longitude 
            FROM Stations
        WHERE FromStation = Stations.StationID) - (
            SELECT Longitude 
            FROM Stations 
        WHERE ToStation = Stations.StationID) ) ) )  
FROM Trips
GROUP BY TripID, fromStation, ToStation
ORDER BY Distance DESC