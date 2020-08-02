-- Check tables created from notebook tables
SELECT * FROM actor;
SELECT * FROM company;
SELECT * FROM company_movie;
SELECT * FROM director;
SELECT * FROM genre;
SELECT * FROM movie_actor;
SELECT * FROM movie_director;
SELECT * FROM movies;
SELECT * FROM rating;
SELECT * FROM writer;


SELECT COUNT(*) FROM company_movie;
SELECT COUNT(*) FROM country;
SELECT COUNT(*) FROM director_movie;
SELECT COUNT(*) FROM domestic_gross_info;
SELECT COUNT(*) FROM movie_genre;
SELECT COUNT(*) FROM movie_rating;
SELECT COUNT(*) FROM star_actor;
SELECT COUNT(*) FROM total_gross_info;
SELECT COUNT(*) FROM writer;


-- DROP MAIN TABLES 
DROP TABLE IF EXISTS actor CASCADE;
DROP TABLE IF EXISTS company CASCADE;
DROP TABLE IF EXISTS company_movie CASCADE;
DROP TABLE IF EXISTS director CASCADE;
DROP TABLE IF EXISTS genre CASCADE;
DROP TABLE IF EXISTS movie_actor CASCADE;
DROP TABLE IF EXISTS movie_director CASCADE;
DROP TABLE IF EXISTS movies CASCADE;
DROP TABLE IF EXISTS rating CASCADE;
DROP TABLE IF EXISTS writer CASCADE;

-- DROP OTHER TABLES
DROP TABLE IF EXISTS genre CASCADE;
DROP TABLE IF EXISTS rating CASCADE;
DROP TABLE IF EXISTS director CASCADE;
DROP TABLE IF EXISTS star_actor CASCADE;
DROP TABLE IF EXISTS movie_genre CASCADE;
DROP TABLE IF EXISTS movie_rating CASCADE;
DROP TABLE IF EXISTS company CASCADE;
DROP TABLE IF EXISTS country CASCADE;
DROP TABLE IF EXISTS temp_movie_id_name CASCADE;
DROP TABLE IF EXISTS company_movie CASCADE;
DROP TABLE IF EXISTS movie_actor CASCADE;
DROP TABLE IF EXISTS movie_director CASCADE;
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
