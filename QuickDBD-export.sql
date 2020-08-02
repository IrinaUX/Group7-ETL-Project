-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


-- Physical
CREATE TABLE "movies" (
    "movie_id" SERIAL   NOT NULL,
    "country" VARCHAR(100)   NOT NULL,
    "genre_id" BIGINT   NOT NULL,
    "writer_id" BIGINT   NOT NULL,
    "rating_id" BIGINT   NOT NULL,
    "name" VARCHAR(100)   NOT NULL,
    "year" INTEGER   NOT NULL,
    "domestic_revenue_usd" BIGINT   NOT NULL,
    "international_revenue_usd" BIGINT   NOT NULL,
    "total_revenue_usd" BIGINT   NOT NULL,
    CONSTRAINT "pk_movies" PRIMARY KEY (
        "movie_id"
     )
);

CREATE TABLE "writer" (
    "writer_id" SERIAL   NOT NULL,
    "writer" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_writer" PRIMARY KEY (
        "writer_id"
     )
);

CREATE TABLE "director" (
    "director_id" SERIAL   NOT NULL,
    "director" VARCHAR(40)   NOT NULL,
    CONSTRAINT "pk_director" PRIMARY KEY (
        "director_id"
     )
);

CREATE TABLE "movie_director" (
    "director_id" BIGINT   NOT NULL,
    "movie_id" BIGINT   NOT NULL
);

CREATE TABLE "company_movie" (
    "company_id" BIGINT   NOT NULL,
    "movie_id" BIGINT   NOT NULL
);

CREATE TABLE "company" (
    "company_id" SERIAL   NOT NULL,
    "company" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_company" PRIMARY KEY (
        "company_id"
     )
);

CREATE TABLE "actor" (
    "actor_id" SERIAL   NOT NULL,
    "actor" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_actor" PRIMARY KEY (
        "actor_id"
     )
);

CREATE TABLE "movie_actor" (
    "actor_id" INT   NOT NULL,
    "movie_id" BIGINT   NOT NULL
);

CREATE TABLE "genre" (
    "genre_id" SERIAL   NOT NULL,
    "genre" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_genre" PRIMARY KEY (
        "genre_id"
     )
);

CREATE TABLE "rating" (
    "rating_id" SERIAL   NOT NULL,
    "rating" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_rating" PRIMARY KEY (
        "rating_id"
     )
);

ALTER TABLE "movies" ADD CONSTRAINT "fk_movies_genre_id" FOREIGN KEY("genre_id")
REFERENCES "genre" ("genre_id");

ALTER TABLE "movies" ADD CONSTRAINT "fk_movies_writer_id" FOREIGN KEY("writer_id")
REFERENCES "writer" ("writer_id");

ALTER TABLE "movies" ADD CONSTRAINT "fk_movies_rating_id" FOREIGN KEY("rating_id")
REFERENCES "rating" ("rating_id");

ALTER TABLE "movie_director" ADD CONSTRAINT "fk_movie_director_director_id" FOREIGN KEY("director_id")
REFERENCES "director" ("director_id");

ALTER TABLE "movie_director" ADD CONSTRAINT "fk_movie_director_movie_id" FOREIGN KEY("movie_id")
REFERENCES "movies" ("movie_id");

ALTER TABLE "company_movie" ADD CONSTRAINT "fk_company_movie_company_id" FOREIGN KEY("company_id")
REFERENCES "company" ("company_id");

ALTER TABLE "company_movie" ADD CONSTRAINT "fk_company_movie_movie_id" FOREIGN KEY("movie_id")
REFERENCES "movies" ("movie_id");

ALTER TABLE "movie_actor" ADD CONSTRAINT "fk_movie_actor_actor_id" FOREIGN KEY("actor_id")
REFERENCES "actor" ("actor_id");

ALTER TABLE "movie_actor" ADD CONSTRAINT "fk_movie_actor_movie_id" FOREIGN KEY("movie_id")
REFERENCES "movies" ("movie_id");

