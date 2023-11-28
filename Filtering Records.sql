-- Using WHERE with numbers
-- Select film_ids and imdb_score with an imdb_score over 7.0
SELECT film_id,
    imdb_score
FROM reviews
WHERE imdb_score > 7.0;
-- Select film_ids and facebook_likes for ten records with less than 1000 likes 
SELECT film_id,
    facebook_likes
FROM reviews
WHERE facebook_likes < 1000
LIMIT 10;