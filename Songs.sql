SELECT name FROM songs;
SELECT name from songs ORDER BY tempo asc
SELECT name from songs ORDER BY duration_ms desc LIMIT 5
SELECT name from songs WHERE danceability > 0.75 AND energy > 0.75 AND valence > 0.75
SELECT AVG(energy) FROM songs
SELECT name FROM songs WHERE artist_id = (
    SELECT id from artists WHERE name = "Post Malone"
);
SELECT AVG(energy) FROM songs WHERE artist_id = (
    SELECT id FROM artists WHERE name = "Drake"
)
SELECT * FROM songs where artist_id = (
    SELECT id FROM artists Where name = "%feat%"
)
