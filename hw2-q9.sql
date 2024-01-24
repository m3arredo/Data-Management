SELECT DISTINCT name
FROM artist
WHERE artist_id NOT IN (
  SELECT DISTINCT artist_id
  FROM album
  JOIN track ON album.album_id = track.album_id
  WHERE track.genre_id = (
    SELECT genre_id
    FROM genre
    WHERE name = 'Blues'
  )
);
