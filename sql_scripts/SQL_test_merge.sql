DROP TABLE IF EXISTS domestic_gross_info;
DROP TABLE IF EXISTS total_gross_info;
DROP TABLE IF EXISTS combined_gross_info;
DROP TABLE IF EXISTS star_actor;
DROP TABLE IF EXISTS country;
DROP TABLE IF EXISTS company;
DROP TABLE IF EXISTS movie_genre;
DROP TABLE IF EXISTS writer;
DROP TABLE IF EXISTS ww_top_50_movies;
DROP TABLE IF EXISTS best_100_actors;


-- TABLE -- DOMESTIC GROSS & INFORMATION
CREATE TABLE domestic_gross_info (
id SERIAL primary key,
budget INT,
company TEXT,
country TEXT,
director TEXT,
genre TEXT,
gross BIGINT,
name TEXT,
rating TEXT,
released TEXT,
runtime INT,
score NUMERIC,
star TEXT,
votes BIGINT,
writer TEXT,
year INT
);

SELECT * FROM domestic_gross_info;



-- TABLE -- TOTAL GROSS (Not International) & INFORMATION
CREATE TABLE total_gross_info (
rank INT,
name_international TEXT,
year INT,
international_revenue_usd BIGINT
);

ALTER TABLE total_gross_info DROP year;

ALTER TABLE total_gross_info
RENAME COLUMN international_revenue_usd TO total_revenue_usd;

ALTER TABLE total_gross_info
RENAME COLUMN name_international TO name_total;

SELECT * FROM total_gross_info;


-- ATTEMPT TO JOIN TABLES ON NAME
CREATE TABLE combined_gross_info AS
SELECT * FROM domestic_gross_info 
INNER JOIN total_gross_info 
ON domestic_gross_info.name = total_gross_info.name_total;

SELECT * FROM combined_gross_info;

-- CREATE COLUMN 'international_revenue_usd'
ALTER TABLE combined_gross_info ADD COLUMN international_revenue_usd BIGINT;
UPDATE combined_gross_info SET international_revenue_usd = (total_revenue_usd - gross);

-- RENAME GROSS to 'domestic_revenue_usd'
ALTER TABLE combined_gross_info
RENAME COLUMN gross TO domestic_revenue_usd;

-- DROP COLUMN 'name_total' --Redundant
ALTER TABLE combined_gross_info DROP name_total;

-- FINAL TABLE
SELECT * FROM combined_gross_info;

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

