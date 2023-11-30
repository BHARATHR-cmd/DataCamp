-- Practice with aggregate functions


-- Query the sum of film durations
SELECT SUM(duration) AS total_duration
FROM films;


-- Calculate the average duration of all films
SELECT AVG(duration) AS average_duration
FROM films;

-- Find the latest release_year
SELECT MAX(release_year) as latest_year
FROM films;

-- Find the duration of the shortest film
SELECT MIN(duration) as shortest_film
FROM films;


-- Combining aggregate functions with WHERE

-- Calculate the sum of gross from the year 2000 or later
SELECT SUM(gross) AS total_gross
FROM films 
WHERE release_year >= 2000;



-- Calculate the average gross of films that start with A
SELECT AVG(gross) as avg_gross_A
FROM films
WHERE title like 'A%';


-- Calculate the lowest gross film in 1994
SELECT MIN(gross) as lowest_gross
FROM films
WHERE release_year = 1994;


-- Calculate the highest gross film released between 2000-2012
SELECT MAX(gross) AS highest_gross
FROM films 
WHERE release_year BETWEEN 2000 and 2012;


-- Using ROUND()
-- Round the average number of facebook_likes to one decimal place
SELECT ROUND(AVG(facebook_likes),1) as avg_facebook_likes
FROM reviews;

-- ROUND() with a negative parameter
-- Calculate the average budget rounded to the thousands
SELECT ROUND(AVG(budget),-3) AS avg_budget_thousands
FROM films;

-- Aliasing with functions
-- Calculate the title and duration_hours from films
SELECT title, duration/60.0 AS duration_hours
FROM films;


-- Calculate the percentage of people who are no longer alive
SELECT  COUNT(deathdate)* 100.0 / COUNT(id) AS percentage_dead
FROM people;


-- Find the number of decades in the films table
SELECT (MAX(release_year)-MIN(release_year)) / 10.0 AS number_of_decades
FROM films;

-- Rounding results
-- Round duration_hours to two decimal places
SELECT title, ROUND(duration / 60.0,2) AS duration_hours
FROM films;