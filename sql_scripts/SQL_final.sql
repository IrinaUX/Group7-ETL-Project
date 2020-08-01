-- CREATE combined_gross_info table
-- JOIN TABLES ON NAME
CREATE TABLE combined_gross_info AS
SELECT * FROM domestic_gross_info  
LEFT JOIN total_gross_info
ON total_gross_info.name = domestic_gross_info.name_domestic;

-- View combined_gross_info table
SELECT * FROM combined_gross_info;

-- Alter to add international_revenue_usd column
-- CREATE COLUMN 'international_revenue_usd' and compute from total minus domestic
ALTER TABLE combined_gross_info ADD COLUMN international_revenue_usd BIGINT;
UPDATE combined_gross_info SET international_revenue_usd = (total_revenue_usd - domestic_revenue_usd);


-- Replace null values with 0 in combined_gross_info
UPDATE combined_gross_info SET international_revenue_usd = 0 WHERE international_revenue_usd IS NULL;
UPDATE combined_gross_info SET domestic_revenue_usd = 0 WHERE domestic_revenue_usd IS NULL;
UPDATE combined_gross_info SET total_revenue_usd = 0 WHERE total_revenue_usd IS NULL;

-- Check combined_gross_info table
SELECT * FROM combined_gross_info;

-- Create movies table
CREATE TABLE movies AS
SELECT name, total_revenue_usd, domestic_revenue_usd, international_revenue_usd, release_date,
	genre,  writer, rating
FROM combined_gross_info
ORDER BY total_revenue_usd DESC;

-- Add primary key as id
ALTER TABLE movies ADD COLUMN movie_id SERIAL PRIMARY KEY;
ALTER TABLE rating ADD COLUMN rating_id SERIAL PRIMARY KEY;
ALTER TABLE country ADD COLUMN country_id SERIAL PRIMARY KEY;
ALTER TABLE actor ADD COLUMN actor_id SERIAL PRIMARY KEY;
ALTER TABLE company ADD COLUMN company_id SERIAL PRIMARY KEY;
ALTER TABLE genre ADD COLUMN genre_id SERIAL PRIMARY KEY;
ALTER TABLE writer ADD COLUMN writer_id SERIAL PRIMARY KEY;
ALTER TABLE director ADD COLUMN director_id SERIAL PRIMARY KEY;

-- Add transient tables by merging
SELECT movie_id, actor_id FROM movies, actor;

-- CREATE actor_movie table from movies table
CREATE TABLE actor_movie AS
SELECT movie_id FROM movies  
OUTER JOIN total_gross_info
ON total_gross_info.name = domestic_gross_info.name_domestic;



-- Examples of defining the PK and FK
ALTER TABLE test1 ADD COLUMN id SERIAL PRIMARY KEY;
SELECT name, country FROM domestic_gross_info WHERE country='USA';
ALTER TABLE country ADD FOREIGN KEY (total_revenue_usd.country); -- Add PRIMARY KEY contstraint
ALTER TABLE table_name DROP CONSTRAINT primary_key_constraint; -- Drop PK 
ALTER TABLE country ADD FOREIGN KEY (country) REFERENCES total_gross_info(country); -- Add FOREIGN KEY


-- Remove unnecessary table from schema
DROP TABLE IF EXISTS combined_gross_info;
DROP TABLE IF EXISTS total_gross_info;
DROP TABLE IF EXISTS domestic_gross_info;
DROP TABLE IF EXISTS fetched_missing;
