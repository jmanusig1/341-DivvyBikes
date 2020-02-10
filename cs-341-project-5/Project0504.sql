-- Project0504.sql
-- 4.	For each StationID, retrieve the number of trips taken 
-- from that station and to that station (as separate values).

SELECT TOP 10 StationID, 
NumTripsFrom = (SELECT COUNT(Trips.FromStation) 
    FROM Trips
    WHERE Trips.FromStation = StationID),
NumTripsTo = (SELECT COUNT(Trips.ToStation) 
    FROM Trips 
    WHERE Trips.ToStation = StationID)
FROM Stations
GROUP BY StationID
ORDER BY ((SELECT COUNT(Trips.FromStation) 
            FROM Trips 
            WHERE Trips.FromStation = StationID)+
            (SELECT COUNT(Trips.ToStation) 
            FROM Trips 
            WHERE Trips.ToStation = StationID)) DESC