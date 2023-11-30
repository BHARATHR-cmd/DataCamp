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


-- Sorting single fields
-- Select name from people and sort alphabetically
SELECT name FROM people order by name;

-- Select the title and duration from longest to shortest film
SELECT title, duration FROM films ORDER BY duration 



-- Sorting multiple fields
-- Select the release year, duration, and title sorted by release year and duration
SELECT release_year,duration,title FROM films ORDER BY release_year,duration

-- Select the certification, release year, and title sorted by certification and release year
SELECT certification,release_year,title FROM films ORDER BY certification,release_year



-- GROUP BY single fields

-- Find the release_year and film_count of each year
SELECT release_year,COUNT(title) AS film_count FROM films GROUP BY release_year; 

-- Find the release_year and average duration of films for each year
SELECT release_year,AVG(duration) as avg_duration FROM films GROUP BY release_year

-- Filter with HAVING



-- Select the country and distinct count of certification as certification_count
Select country,count(distinct(certification)) as certification_count from films
--  Group by country
Group by country
-- Filter results to countries with more than 10 different certifications
having count(distinct(certification)) > 10;


-- HAVING and sorting

-- Select the country and average_budget from films
Select country , AVG(budget) as average_budget from films
-- Group by country
Group by country
-- Filter to countries with an average_budget of more than one billion
having AVG(budget) > 1000000000
-- Order by descending order of the aggregated budget
order by average_budget desc;


-- All together now

SELECT release_year, AVG(budget) AS avg_budget, AVG(gross) AS avg_gross
FROM films
WHERE release_year > 1990
GROUP BY release_year
HAVING AVG(budget) > 60000000
-- Order the results from highest to lowest average gross and limit to one
Order by avg_gross desc limit 1;