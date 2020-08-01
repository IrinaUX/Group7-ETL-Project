-- Check tables created from notebook tables
SELECT * FROM company;
SELECT COUNT(*) FROM company;
SELECT * FROM country;
SELECT COUNT(*) FROM country;
SELECT * FROM director_movie;
SELECT COUNT(*) FROM director_movie;
SELECT * FROM domestic_gross_info;
SELECT COUNT(*) FROM domestic_gross_info;
SELECT * FROM movie_genre;
SELECT COUNT(*) FROM movie_genre;
SELECT * FROM movie_rating;
SELECT COUNT(*) FROM movie_rating;
SELECT * FROM star_actor;
SELECT COUNT(*) FROM star_actor;
SELECT * FROM total_gross_info;
SELECT COUNT(*) FROM total_gross_info;
SELECT * FROM writer;
SELECT COUNT(*) FROM writer;

-- CREATE combined_gross_info table
-- JOIN TABLES ON NAME
CREATE TABLE combined_gross_info AS
SELECT * FROM domestic_gross_info 
LEFT JOIN total_gross_info 
ON domestic_gross_info.name = total_gross_info.name_total;

-- View combined table
SELECT * FROM combined_gross_info ORDER BY name ASC;
SELECT * FROM combined_gross_info WHERE rank=1;


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
SELECT rank, name, total_revenue_usd, domestic_revenue_usd, international_revenue_usd, release_date,
	country, company, genre, director, star, writer, rating
FROM combined_gross_info
ORDER BY total_revenue_usd DESC;

-- CREATE rank table
-- JOIN TABLES ON NAME
CREATE TABLE ranking AS
SELECT * FROM total_gross_info 
LEFT JOIN domestic_gross_info 
ON total_gross_info.name_total = domestic_gross_info.name;

-- View Ranking table
SELECT * FROM ranking;

-- Alter to add international_revenue_usd column
-- CREATE COLUMN 'international_revenue_usd' and compute from total minus domestic
ALTER TABLE ranking ADD COLUMN international_revenue_usd BIGINT;
UPDATE ranking SET international_revenue_usd = (total_revenue_usd - domestic_revenue_usd);

-- Replace null values with 0 in ranking
UPDATE ranking SET international_revenue_usd = 0 WHERE international_revenue_usd IS NULL;
UPDATE ranking SET domestic_revenue_usd = 0 WHERE domestic_revenue_usd IS NULL;

-- Create movies_rank table
CREATE TABLE movies_rank AS
SELECT rank, name_total, total_revenue_usd, domestic_revenue_usd, international_revenue_usd, release_date,
	country, company, genre, director, star, writer, rating
FROM ranking
ORDER BY total_revenue_usd DESC;

-- View movies_rank table
SELECT * FROM movies_rank;

-- TABLE movies
SELECT * FROM movies;
SELECT * FROM movies WHERE rank=1;

SELECT COUNT(*) FROM movies;

-- Table domestic_gross_info
SELECT * FROM domestic_gross_info;

-- Table total_gross_info
SELECT * FROM total_gross_info;

-- Table rating
SELECT * FROM movie_rating;
SELECT COUNT(*) FROM movie_rating;

-- Table country
SELECT * FROM country;

-- Table company
SELECT * FROM company;

-- Table movie_genre
SELECT * FROM movie_genre;

-- Table star_actor
SELECT * FROM star_actor;
SELECT COUNT(*) FROM star_actor;

-- Table star_actor
SELECT * FROM star_actor;

-- Table writer
SELECT * FROM writer;

-- DROP unnecessary tables
DROP TABLE IF EXISTS domestic_gross_info;
DROP TABLE IF EXISTS total_gross_info;
DROP TABLE IF EXISTS combined_gross_info;

-- OTHER TESTS
DROP TABLE IF EXISTS best_100_actors;
DROP TABLE IF EXISTS best_200_directors;

-- -- DROP ALL TABLES 
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS ranking;
DROP TABLE IF EXISTS movies_rank;
DROP TABLE IF EXISTS domestic_revenue_usd;
DROP TABLE IF EXISTS international_revenue_usd;
DROP TABLE IF EXISTS total_gross_info;
DROP TABLE IF EXISTS domestic_gross_info;
DROP TABLE IF EXISTS combined_gross_info;
DROP TABLE IF EXISTS writer;
DROP TABLE IF EXISTS director;
DROP TABLE IF EXISTS star_actor;
DROP TABLE IF EXISTS movie_genre;
DROP TABLE IF EXISTS movie_rating;
DROP TABLE IF EXISTS company;
DROP TABLE IF EXISTS country;
DROP TABLE IF EXISTS director_movie;

-- TEST
SELECT * FROM domestic_gross_info
WHERE rating IS NOT NULL;

SELECT name, country FROM domestic_gross_info WHERE country='USA';
ALTER TABLE country ADD FOREIGN KEY (total_revenue_usd.country); -- Add PRIMARY KEY contstraint
ALTER TABLE table_name DROP CONSTRAINT primary_key_constraint; -- Drop PK 
ALTER TABLE country ADD FOREIGN KEY (country) REFERENCES total_gross_info(country); -- Add FOREIGN KEY
