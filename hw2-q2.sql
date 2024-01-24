
SELECT DISTINCT f.origin_city as city
FROM Flights f
JOIN (SELECT origin_city, max(actual_time) max from Flights
        GROUP BY origin_city) c
ON c.origin_city = f.origin_city AND f.actual_time = c.max
WHERE f.actual_time < 180.0 ; --minutes 