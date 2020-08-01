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
DROP TABLE IF EXISTS director;
DROP TABLE IF EXISTS star_actor;
DROP TABLE IF EXISTS movie_genre;
DROP TABLE IF EXISTS movie_rating;
DROP TABLE IF EXISTS company;
DROP TABLE IF EXISTS country;
DROP TABLE IF EXISTS director_movie;
