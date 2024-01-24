SELECT c.dest_city AS city
FROM Flights f
JOIN (SELECT origin_city, dest_city FROM Flights
    WHERE dest_city != '"San Diego CA"' 
    AND dest_city NOT IN 
        (SELECT dest_city
        FROM Flights
        WHERE origin_city = '"San Diego CA"')
    GROUP BY origin_city, dest_city) c
ON f.dest_city = c.origin_city
WHERE f.origin_city = '"San Diego CA"' 
GROUP BY c.dest_city
ORDER BY c.dest_city;
