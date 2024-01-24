SELECT DISTINCT name
FROM playlist
WHERE playlist_id NOT IN (
    SELECT DISTINCT playlist_id
    FROM playlist_track
    JOIN track ON playlist_track.track_id = track.track_id
    JOIN genre ON track.genre_id = genre.genre_id
    WHERE genre.name IN ('Rock', 'Blues')
) ;