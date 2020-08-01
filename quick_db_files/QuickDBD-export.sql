-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


SET XACT_ABORT ON

BEGIN TRANSACTION QUICKDBD

-- Physical
CREATE TABLE [movies] (
    [movie_id] SERIAL  NOT NULL ,
    [rank] BIGINT  NOT NULL ,
    [domestic_revenue_usd] BIGINT  NOT NULL ,
    [international_revenue_usd] BIGINT  NOT NULL ,
    [total_revenue_usd] BIGINT  NOT NULL ,
    [name] VARCHAR(255)  NOT NULL ,
    [release_date] DATE  NOT NULL ,
    [director_name] VARCHAR(255)  NOT NULL ,
    [actor_name] VARCHAR(255)  NOT NULL ,
    [genre] VARCHAR(255)  NOT NULL ,
    [writer] VARCHAR(255)  NOT NULL ,
    [rating] VARCHAR(20)  NOT NULL ,
    CONSTRAINT [PK_movies] PRIMARY KEY CLUSTERED (
        [movie_id] ASC
    )
)

CREATE TABLE [movie_director] (
    [director_id] BIGINT  NOT NULL ,
    [movie_id] BIGINT  NOT NULL ,
    [director_name] VARCHAR(255)  NOT NULL 
)

CREATE TABLE [movie_rating] (
    [id] SERIAL  NOT NULL ,
    [movie_id] BIGINT  NOT NULL ,
    [rating] BIGINT  NOT NULL 
)

CREATE TABLE [country] (
    [id] SERIAL  NOT NULL ,
    [movie_id] BIGINT  NOT NULL ,
    [country] VARCHAR(255)  NOT NULL 
)

CREATE TABLE [movie_genre] (
    [id] SERIAL  NOT NULL ,
    [movie_id] BIGINT  NOT NULL ,
    [genre] VARCHAR(255)  NOT NULL 
)

CREATE TABLE [company] (
    [id] SERIAL  NOT NULL ,
    [movie_id] BIGINT  NOT NULL ,
    [company] VARCHAR(255)  NOT NULL 
)

CREATE TABLE [movie_writer] (
    [id] SERIAL  NOT NULL ,
    [movie_id] BIGINT  NOT NULL ,
    [writer] VARCHAR(255)  NOT NULL 
)

CREATE TABLE [movie_actor] (
    [id] SERIAL  NOT NULL ,
    [movie_id] BIGINT  NOT NULL ,
    [actor_name] VARCHAR(255)  NOT NULL 
)

ALTER TABLE [movie_director] WITH CHECK ADD CONSTRAINT [FK_movie_director_movie_id_director_name] FOREIGN KEY([movie_id], [director_name])
REFERENCES [movies] ([movie_id], [director_name])

ALTER TABLE [movie_director] CHECK CONSTRAINT [FK_movie_director_movie_id_director_name]

ALTER TABLE [movie_rating] WITH CHECK ADD CONSTRAINT [FK_movie_rating_movie_id_rating] FOREIGN KEY([movie_id], [rating])
REFERENCES [movies] ([movie_id], [rating])

ALTER TABLE [movie_rating] CHECK CONSTRAINT [FK_movie_rating_movie_id_rating]

ALTER TABLE [country] WITH CHECK ADD CONSTRAINT [FK_country_movie_id] FOREIGN KEY([movie_id])
REFERENCES [movies] ([movie_id])

ALTER TABLE [country] CHECK CONSTRAINT [FK_country_movie_id]

ALTER TABLE [movie_genre] WITH CHECK ADD CONSTRAINT [FK_movie_genre_movie_id_genre] FOREIGN KEY([movie_id], [genre])
REFERENCES [movies] ([movie_id], [genre])

ALTER TABLE [movie_genre] CHECK CONSTRAINT [FK_movie_genre_movie_id_genre]

ALTER TABLE [company] WITH CHECK ADD CONSTRAINT [FK_company_movie_id] FOREIGN KEY([movie_id])
REFERENCES [movies] ([movie_id])

ALTER TABLE [company] CHECK CONSTRAINT [FK_company_movie_id]

ALTER TABLE [movie_writer] WITH CHECK ADD CONSTRAINT [FK_movie_writer_movie_id_writer] FOREIGN KEY([movie_id], [writer])
REFERENCES [movies] ([movie_id], [writer])

ALTER TABLE [movie_writer] CHECK CONSTRAINT [FK_movie_writer_movie_id_writer]

ALTER TABLE [movie_actor] WITH CHECK ADD CONSTRAINT [FK_movie_actor_movie_id_actor_name] FOREIGN KEY([movie_id], [actor_name])
REFERENCES [movies] ([movie_id], [actor_name])

ALTER TABLE [movie_actor] CHECK CONSTRAINT [FK_movie_actor_movie_id_actor_name]

COMMIT TRANSACTION QUICKDBD