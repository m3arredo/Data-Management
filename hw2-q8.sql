SELECT DISTINCT t.name
FROM track t
LEFT JOIN playlist_track pt ON t.track_id = pt.track_id
LEFT JOIN playlist p ON pt.playlist_id = p.playlist_id
WHERE p.name <> '90s Music' OR p.name IS NULL
ORDER BY t.name;