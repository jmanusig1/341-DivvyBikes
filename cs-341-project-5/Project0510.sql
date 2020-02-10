-- Project0510.sql
-- 10.	Compute for each trip the average speed of the bicyclist, by taking the 
--  distance travelled computed in the previous question (which is in miles) and 
--  divide by the length in hours (the length is stored in seconds).  For the 10 
--  fastest trips, return the trip ID, bike ID, and the speed as mph.
SELECT TOP 10 TripID, BikeID,
      mph = ( (SQRT(SQUARE(69 *((
          SELECT Latitude 
          FROM Stations 
          WHERE FromStation = Stations.StationID)-
            (SELECT Latitude 
            FROM Stations 
            WHERE ToStation = Stations.StationID))) + 
                SQUARE(52*(
                (SELECT Longitude 
                FROM Stations 
                WHERE FromStation = Stations.StationID)-(
                    SELECT Longitude 
                    FROM Stations 
                    WHERE ToStation = Stations.StationID))))) / (TripDuration/ 3600.0) ) 
FROM Trips
ORDER BY mph DESC