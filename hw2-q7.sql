SELECT DISTINCT t.name
FROM track t
LEFT JOIN invoice_line il ON t.track_id = il.track_id
WHERE il.invoice_line_id IS NULL
ORDER BY t.name ASC;