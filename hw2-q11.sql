SELECT artist.name
FROM artist
INNER JOIN album ON artist.artist_id = album.artist_id
INNER JOIN track ON album.album_id = track.album_id
INNER JOIN genre ON track.genre_id = genre.genre_id
GROUP BY artist.name
HAVING COUNT(DISTINCT genre.name) >= 3
ORDER BY artist.name;