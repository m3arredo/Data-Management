SELECT DISTINCT name AS carrier
FROM Carriers
WHERE cid IN (
  SELECT DISTINCT carrier_id
  FROM Flights
  WHERE origin_city = '"San Diego CA"'
    AND dest_city = '"San Francisco CA"'
)
ORDER BY carrier ASC;