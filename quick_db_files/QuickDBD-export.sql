-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


-- Physical
CREATE TABLE "movies" (
    "movie_id" SERIAL   NOT NULL,
    "country" VARCHAR(40)   NOT NULL,
    "company" VARCHAR(40)   NOT NULL,
    "genre" VARCHAR(40)   NOT NULL,
    "director" VARCHAR(40)   NOT NULL,
    "actor" VARCHAR(40)   NOT NULL,
    "writer" VARCHAR(40)   NOT NULL,
    "rating" VARCHAR(20)   NOT NULL,
    "name" VARCHAR(40)   NOT NULL,
    "release_date" DATE   NOT NULL,
    "domestic_revenue_usd" BIGINT   NOT NULL,
    "international_revenue_usd" BIGINT   NOT NULL,
    "total_revenue_usd" BIGINT   NOT NULL,
    CONSTRAINT "pk_movies" PRIMARY KEY (
        "movie_id"
     )
);

CREATE TABLE "director" (
    "director_id" SERIAL   NOT NULL,
    "movie_id" BIGINT   NOT NULL,
    "director" VARCHAR(40   NOT NULL,
    "director_rank" INT   NOT NULL,
    CONSTRAINT "pk_director" PRIMARY KEY (
        "director_id"
     )
);

CREATE TABLE "rating" (
    "rating_id" SERIAL   NOT NULL,
    "movie_id" BIGINT   NOT NULL,
    "rating" BIGINT   NOT NULL,
    CONSTRAINT "pk_rating" PRIMARY KEY (
        "rating_id"
     )
);

CREATE TABLE "country" (
    "country_id" SERIAL   NOT NULL,
    "movie_id" BIGINT   NOT NULL,
    "country" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_country" PRIMARY KEY (
        "country_id"
     )
);

CREATE TABLE "genre" (
    "genre_id" SERIAL   NOT NULL,
    "movie_id" SERIAL   NOT NULL,
    "genre" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_genre" PRIMARY KEY (
        "genre_id"
     )
);

CREATE TABLE "company" (
    "company_id" SERIAL   NOT NULL,
    "movie_id" BIGINT   NOT NULL,
    "company" VARCHAR(255)   NOT NULL,
    "company_rank" INT   NOT NULL,
    CONSTRAINT "pk_company" PRIMARY KEY (
        "company_id"
     )
);

CREATE TABLE "writer" (
    "writer_id" SERIAL   NOT NULL,
    "movie_id" BIGINT   NOT NULL,
    "writer" VARCHAR(255)   NOT NULL,
    "writer_rank" INT   NOT NULL,
    CONSTRAINT "pk_writer" PRIMARY KEY (
        "writer_id"
     )
);

CREATE TABLE "actor" (
    "actor_id" SERIAL   NOT NULL,
    "movie_id" BIGINT   NOT NULL,
    "actor" VARCHAR(255)   NOT NULL,
    "actor_rank" INT   NOT NULL,
    CONSTRAINT "pk_actor" PRIMARY KEY (
        "actor_id"
     )
);

ALTER TABLE "movies" ADD CONSTRAINT "fk_movies_country" FOREIGN KEY("country")
REFERENCES "country" ("country");

ALTER TABLE "movies" ADD CONSTRAINT "fk_movies_company" FOREIGN KEY("company")
REFERENCES "company" ("company");

ALTER TABLE "movies" ADD CONSTRAINT "fk_movies_genre" FOREIGN KEY("genre")
REFERENCES "genre" ("genre");

ALTER TABLE "movies" ADD CONSTRAINT "fk_movies_director" FOREIGN KEY("director")
REFERENCES "director" ("director");

ALTER TABLE "movies" ADD CONSTRAINT "fk_movies_actor" FOREIGN KEY("actor")
REFERENCES "actor" ("actor");

ALTER TABLE "movies" ADD CONSTRAINT "fk_movies_writer" FOREIGN KEY("writer")
REFERENCES "writer" ("writer");

ALTER TABLE "movies" ADD CONSTRAINT "fk_movies_rating" FOREIGN KEY("rating")
REFERENCES "rating" ("rating");

ALTER TABLE "director" ADD CONSTRAINT "fk_director_movie_id" FOREIGN KEY("movie_id")
REFERENCES "movies" ("movie_id");

ALTER TABLE "rating" ADD CONSTRAINT "fk_rating_movie_id" FOREIGN KEY("movie_id")
REFERENCES "movies" ("movie_id");

ALTER TABLE "country" ADD CONSTRAINT "fk_country_movie_id" FOREIGN KEY("movie_id")
REFERENCES "movies" ("movie_id");

ALTER TABLE "genre" ADD CONSTRAINT "fk_genre_movie_id" FOREIGN KEY("movie_id")
REFERENCES "movies" ("movie_id");

ALTER TABLE "company" ADD CONSTRAINT "fk_company_movie_id" FOREIGN KEY("movie_id")
REFERENCES "movies" ("movie_id");

ALTER TABLE "writer" ADD CONSTRAINT "fk_writer_movie_id" FOREIGN KEY("movie_id")
REFERENCES "movies" ("movie_id");

ALTER TABLE "actor" ADD CONSTRAINT "fk_actor_movie_id" FOREIGN KEY("movie_id")
REFERENCES "movies" ("movie_id");

