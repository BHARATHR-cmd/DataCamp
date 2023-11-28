-- Practice with COUNT()
-- Count the number of records in the people table
Select count(*) AS COUNT_RECORDS FROM PEOPLE


-- SELECT DISTINCT
-- Return the unique countries from the films table
Select distinct country from films

-- Debugging errors
-- Debug this code
SELECT certification
FROM films
LIMIT 5;


-- Debug this code
SELECT COUNT(birthdate) AS count_birthdays
FROM people;


-- Debug this code
SELECT film_id, imdb_score, num_votes
FROM reviews;


-- Formatting
-- Rewrite this query
SELECT person_id,role 
FROM roles 
LIMIT 10;