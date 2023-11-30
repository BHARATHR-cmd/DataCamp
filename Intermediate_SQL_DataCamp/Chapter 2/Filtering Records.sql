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
-- Count the records with at least 100,000 votes
SELECT COUNT(*) AS films_over_100K_votes
FROM reviews
WHERE num_votes >= 100000 -- Using WHERE with text
    -- Count the Spanish-language films
SELECT COUNT(language) AS count_spanish
FROM films
WHERE language = 'Spanish';

-- Using AND

-- Select the title and release_year for all German-language films released before 200
SELECT title , release_year
FROM films
WHERE language='German' and  release_year<2000;


-- Update the query to see all German-language films released after 2000
SELECT title, release_year
FROM films
WHERE release_year > 2000
	AND language = 'German';


-- Select all records for German-language films released after 2000 and before 2010
SELECT * 
FROM films
WHERE release_year > 2000 
    AND release_year < 2010
    AND language='German';


-- Find the title and year of films from the 1990 or 1999

SELECT title , release_year 
FROM films
WHERE release_year = 1990 or release_year=1999;


SELECT title, release_year
FROM films
WHERE (release_year = 1990 OR release_year = 1999)
	AND (language = 'English' OR language = 'Spanish')
-- Filter films with more than $2,000,000 gross
	and (gross > 2000000);

-- Select the title and release_year for films released between 1990 and 2000
SELECT title, release_year 
FROM films
WHERE release_year BETWEEN 1990 and 2000;


SELECT title, release_year
FROM films
WHERE (release_year BETWEEN 1990 AND 2000)
-- Narrow down your query to films with budgets > $100 million
	AND (budget >100000000);


SELECT title, release_year
FROM films
WHERE release_year BETWEEN 1990 AND 2000
	AND budget > 100000000
-- Restrict the query to only Spanish-language films
	AND language='Spanish';

SELECT title, release_year
FROM films
WHERE release_year BETWEEN 1990 AND 2000
	AND budget > 100000000
-- Amend the query to include Spanish or French-language films
	AND (language='French' or language='Spanish');



-- LIKE and NOT LIKE
-- Select the names that start with B
SELECT name 
FROM people 
WHERE name like 'B%'

SELECT name
FROM people
-- Select the names that have r as the second letter
WHERE name like '_r%'


SELECT name
FROM people
-- Select names that don't start with A
WHERE name not like 'A%'


-- WHERE IN

-- Find the title and release_year for all films over two hours in length released in 1990 and 2000
SELECT title,release_year
FROM films
WHERE duration > 120 and release_year in (1990,2000)


-- Find the title and language of all films in English, Spanish, and French
SELECT title,language
FROM films
WHERE language in ('English', 'Spanish', 'French');



-- Find the title, certification, and language all films certified NC-17 or R that are in English, Italian, or Greek
SELECT title,certification,language
FROM films
WHERE certification in ('NC-17','R') and language in ( 'English', 'Italian',  'Greek');



-- Combining filtering and selecting

-- Count the unique titles
SELECT COUNT(DISTINCT title) AS nineties_english_films_for_teens
FROM films
-- Filter to release_years to between 1990 and 1999
WHERE release_year BETWEEN 1990 AND 1999
-- Filter to English-language films
	AND language ='English'
-- Narrow it down to G, PG, and PG-13 certifications
	AND certification in ('G','PG','PG-13');



-- Practice with NULLs


-- List all film titles with missing budgets

SELECT title  as no_budget_info
FROM films
WHERE budget IS NULL;

-- Count the number of films we have language data for
SELECT COUNT(language) as count_language_known
FROM films ;
