-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


-- Physical
CREATE TABLE "Movies" (
    "id" INT   NOT NULL,
    "budget" BIGINT   NOT NULL,
    "domestic_revenue_usd" BIGINT   NOT NULL,
    "international_revenue_usd" BIGINT   NOT NULL,
    "total_revenue_usd" BIGINT   NOT NULL,
    "name" VARCHAR(255)   NOT NULL,
    "released" DATE   NOT NULL,
    "runtime" INT   NOT NULL,
    "score" DOUBLE   NOT NULL,
    "votes" BIGINT   NOT NULL,
    "year" INT   NOT NULL,
    "rank" BIGINT   NOT NULL,
    CONSTRAINT "pk_Movies" PRIMARY KEY (
        "name"
     )
);

CREATE TABLE "Director" (
    "name" VARCHAR(255)   NOT NULL,
    "director" VARCHAR(255)   NOT NULL
);

CREATE TABLE "Movie_Rating" (
    "name" VARCHAR(255)   NOT NULL,
    "rating" BIGINT   NOT NULL
);

CREATE TABLE "Country" (
    "name" VARCHAR(255)   NOT NULL,
    "country" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_Country" PRIMARY KEY (
        "country"
     )
);

CREATE TABLE "Movie_Genre" (
    "name" VARCHAR(255)   NOT NULL,
    "genre" VARCHAR(255)   NOT NULL
);

CREATE TABLE "Company" (
    "name" VARCHAR(255)   NOT NULL,
    "company" VARCHAR(255)   NOT NULL
);

CREATE TABLE "Writer" (
    "name" VARCHAR(255)   NOT NULL,
    "writer" VARCHAR(255)   NOT NULL
);

CREATE TABLE "Star_actor" (
    "name" VARCHAR(255)   NOT NULL,
    "actor" VARCHAR(255)   NOT NULL
);

ALTER TABLE "Director" ADD CONSTRAINT "fk_Director_name" FOREIGN KEY("name")
REFERENCES "Movies" ("name");

ALTER TABLE "Movie_Rating" ADD CONSTRAINT "fk_Movie_Rating_name" FOREIGN KEY("name")
REFERENCES "Movies" ("name");

ALTER TABLE "Country" ADD CONSTRAINT "fk_Country_country" FOREIGN KEY("country")
REFERENCES "Movies" ("name");

ALTER TABLE "Movie_Genre" ADD CONSTRAINT "fk_Movie_Genre_name" FOREIGN KEY("name")
REFERENCES "Movies" ("name");

ALTER TABLE "Company" ADD CONSTRAINT "fk_Company_name" FOREIGN KEY("name")
REFERENCES "Movies" ("name");

ALTER TABLE "Writer" ADD CONSTRAINT "fk_Writer_name" FOREIGN KEY("name")
REFERENCES "Movies" ("name");

ALTER TABLE "Star_actor" ADD CONSTRAINT "fk_Star_actor_name" FOREIGN KEY("name")
REFERENCES "Movies" ("name");
