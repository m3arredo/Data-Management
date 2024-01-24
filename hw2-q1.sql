SELECT DISTINCT f.origin_city, f.dest_city, f.actual_time
from Flights f JOIN 
(SELECT origin_city, max(actual_time) max from Flights
GROUP by origin_city) c
ON c.origin_city = f.origin_city AND
f.actual_time = c.max ; 