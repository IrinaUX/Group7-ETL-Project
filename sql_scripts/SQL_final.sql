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

-- CREATE rank table
-- JOIN TABLES ON NAME
CREATE TABLE combined_gross_info AS
SELECT * FROM total_gross_info 
LEFT JOIN domestic_gross_info
ON total_gross_info.name_total = domestic_gross_info.name;

-- View combined_gross_info table
SELECT * FROM combined_gross_info WHERE rank=1;

-- Alter to add international_revenue_usd column
-- CREATE COLUMN 'international_revenue_usd' and compute from total minus domestic
ALTER TABLE combined_gross_info ADD COLUMN international_revenue_usd BIGINT;
UPDATE combined_gross_info SET international_revenue_usd = (total_revenue_usd - domestic_revenue_usd);

-- Replace null values with 0 in combined_gross_info
UPDATE combined_gross_info SET international_revenue_usd = 0 WHERE international_revenue_usd IS NULL;
UPDATE combined_gross_info SET domestic_revenue_usd = 0 WHERE domestic_revenue_usd IS NULL;

-- Check combined_gross_info table
SELECT * FROM combined_gross_info;
SELECT * FROM combined_gross_info WHERE rank=1;

-- Create movies table
CREATE TABLE movies AS
SELECT rank, name_total, total_revenue_usd, domestic_revenue_usd, international_revenue_usd, release_date,
	country, company, genre, director, star, writer, rating
FROM combined_gross_info
ORDER BY total_revenue_usd DESC;


-- TEST
SELECT * FROM domestic_gross_info
WHERE rating IS NOT NULL;

SELECT name, country FROM domestic_gross_info WHERE country='USA';
ALTER TABLE country ADD FOREIGN KEY (total_revenue_usd.country); -- Add PRIMARY KEY contstraint
ALTER TABLE table_name DROP CONSTRAINT primary_key_constraint; -- Drop PK 
ALTER TABLE country ADD FOREIGN KEY (country) REFERENCES total_gross_info(country); -- Add FOREIGN KEY
