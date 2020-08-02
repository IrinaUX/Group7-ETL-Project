-- Check tables created from notebook tables
SELECT * FROM movies;
SELECT * FROM writer;
SELECT * FROM director;
SELECT * FROM movie_director;
SELECT * FROM company_movie;
SELECT * FROM company;
SELECT * FROM actor;
SELECT * FROM movie_actor;
SELECT * FROM genre;
SELECT * FROM rating;


SELECT COUNT(*) FROM company_movie;
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
DROP TABLE IF EXISTS temp_movie_id_name;

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
