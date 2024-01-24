SELECT f.origin_city AS origin_city, 
  CASE WHEN c.ct IS NULL OR c.ct = 0 
    THEN NULL 
    ELSE ROUND(CAST(c.ct AS NUMERIC(10,2)) * 100 / CAST(COUNT(f.fid) AS NUMERIC(10,2)), 2) 
  END AS percentage
FROM Flights f
LEFT JOIN (
  SELECT origin_city, COUNT(fid) AS ct
  FROM Flights 
  WHERE actual_time < 180.0 OR actual_time IS NULL
  GROUP BY origin_city
) c ON f.origin_city = c.origin_city
GROUP BY f.origin_city, c.ct
ORDER BY percentage ASC;
