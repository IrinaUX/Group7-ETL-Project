-- Check tables created from notebook tables
SELECT * FROM rating;
SELECT * FROM country;
SELECT * FROM actor;
SELECT * FROM company;
SELECT * FROM genre;
SELECT * FROM writer;
SELECT * FROM director;

SELECT * FROM movies;

SELECT COUNT(*) FROM company;
SELECT COUNT(*) FROM country;
SELECT COUNT(*) FROM director_movie;
SELECT COUNT(*) FROM domestic_gross_info;
SELECT COUNT(*) FROM movie_genre;
SELECT COUNT(*) FROM movie_rating;
SELECT COUNT(*) FROM star_actor;
SELECT COUNT(*) FROM total_gross_info;
SELECT COUNT(*) FROM writer;


-- DROP ALL TABLES 
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS ranking;
DROP TABLE IF EXISTS movies_rank;
DROP TABLE IF EXISTS domestic_revenue_usd;
DROP TABLE IF EXISTS international_revenue_usd;
DROP TABLE IF EXISTS total_gross_info;
DROP TABLE IF EXISTS domestic_gross_info;
DROP TABLE IF EXISTS combined_gross_info;

DROP TABLE IF EXISTS writer;
DROP TABLE IF EXISTS actor;
DROP TABLE IF EXISTS genre;
DROP TABLE IF EXISTS rating;
DROP TABLE IF EXISTS director;
DROP TABLE IF EXISTS star_actor;
DROP TABLE IF EXISTS movie_genre;
DROP TABLE IF EXISTS movie_rating;
DROP TABLE IF EXISTS company;
DROP TABLE IF EXISTS country;

DROP TABLE IF EXISTS director_movie;
DROP TABLE IF EXISTS fetched_missing;

-- Add missing director and star information
-- JOIN TABLES ON NAME
-- add directors column to total table
ALTER TABLE total_gross_info ADD COLUMN director_missing BIGINT;
CREATE TABLE movies_with_missing_directors AS
SELECT * FROM movies
LEFT JOIN fetched_missing
ON movies.name = fetched_missing.name_missing
ORDER BY rank ASC LIMIT 100;

-- Query Top 100 directors by rank
CREATE TABLE Top_100_directors
SELECT rank, director, name, star, total_revenue_usd FROM movies 
ORDER BY rank ASC LIMIT 100;

-- TEST
SELECT * FROM domestic_gross_info
