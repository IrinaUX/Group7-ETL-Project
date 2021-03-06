-- JOIN TABLES ON NAME
CREATE TABLE combined_gross_info AS
SELECT * FROM domestic_gross_info 
LEFT JOIN total_gross_info 
ON domestic_gross_info.name = total_gross_info.name_total;

-- CHECK NUMBER OF ROWS
SELECT COUNT(*) FROM domestic_gross_info;
SELECT COUNT(*) FROM total_gross_info;
SELECT COUNT(*) FROM combined_gross_info;

-- CREATE COLUMN 'international_revenue_usd' and compute from total minus domestic
ALTER TABLE combined_gross_info ADD COLUMN international_revenue_usd BIGINT;
UPDATE combined_gross_info SET international_revenue_usd = (total_revenue_usd - domestic_revenue_usd);

-- Replace null values with 0 in combined_gross_info
UPDATE combined_gross_info SET total_revenue_usd = 0 WHERE total_revenue_usd IS NULL;

-- Create movies table
CREATE TABLE movies AS
SELECT name, total_revenue_usd, domestic_revenue_usd, international_revenue_usd, release_date
FROM combined_gross_info
ORDER BY total_revenue_usd DESC;

-- SORT BY total_revenue_usd ind descending order
UPDATE movies 
SET Number = 1 
FROM movies
INNER JOIN 
(SELECT ID, row_number() OVER (ORDER BY ID DESC) as rowNumber
FROM Test) drRowNumbers ON drRowNumbers.ID = Test.ID


SELECT * FROM movies
ORDER BY total_revenue_usd DESC;

-- TABLE movies
SELECT * FROM movies;

-- Table country
SELECT * FROM country;

-- Table company
SELECT * FROM company;

-- Table movie_genre
SELECT * FROM movie_genre;

-- Table star_actor
SELECT * FROM star_actor;

-- Table rating
SELECT * FROM rating;

-- Table star_actor
SELECT * FROM star_actor;

-- Table writer
SELECT * FROM writer;

-- Table best_200_directors
SELECT * FROM best_200_directors;

-- Table total_gross_info
SELECT * FROM total_gross_info;

-- Table best_100_actors
SELECT * FROM best_100_actors;

-- DROP TABLE IF EXISTS domestic_gross_info;
-- DROP TABLE IF EXISTS total_gross_info;
-- DROP TABLE IF EXISTS combined_gross_info;
-- DROP TABLE IF EXISTS star_actor;
-- DROP TABLE IF EXISTS country;
-- DROP TABLE IF EXISTS company;
-- DROP TABLE IF EXISTS movie_genre;
-- DROP TABLE IF EXISTS writer;
-- DROP TABLE IF EXISTS ww_top_50_movies;
-- DROP TABLE IF EXISTS best_100_actors;

