-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/hA0TtY
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "books" (
    "bookID" bigserial   NOT NULL,
    "title" varchar(750)   NOT NULL,
    "authors" varchar(750)   NOT NULL,
    "average_rating" numeric   NOT NULL,
    "language_code" varchar(50)   NOT NULL,
    "num_pages" int   NOT NULL,
    "ratings_count" int   NOT NULL,
    "publication_date" date   NOT NULL,
    "publisher" varchar(1000)   NOT NULL,
    CONSTRAINT "pk_books" PRIMARY KEY (
        "bookID"
     )
);

CREATE TABLE "Top_10_books" (
    "bookID" bigserial   NOT NULL,
    "title" varchar(750)   NOT NULL,
    "authors" varchar(750)   NOT NULL,
    "average_rating" numeric   NOT NULL,
    CONSTRAINT "pk_Top_10_books" PRIMARY KEY (
        "bookID"
     )
);

CREATE TABLE "Bottom_10_books" (
    "bookID" bigserial   NOT NULL,
    "title" varchar(750)   NOT NULL,
    "authors" varchar(750)   NOT NULL,
    "average_rating" numeric   NOT NULL,
    CONSTRAINT "pk_Bottom_10_books" PRIMARY KEY (
        "bookID"
     )
);

CREATE TABLE "highest_rate_count" (
    "bookID" bigserial   NOT NULL,
    "title" varchar(750)   NOT NULL,
    "authors" varchar(750)   NOT NULL,
    "ratings_count" int   NOT NULL,
    CONSTRAINT "pk_highest_rate_count" PRIMARY KEY (
        "bookID"
     )
);

CREATE TABLE "lowest_rate_count" (
    "bookID" bigserial   NOT NULL,
    "title" varchar(750)   NOT NULL,
    "authors" varchar(750)   NOT NULL,
    "ratings_count" int   NOT NULL,
    CONSTRAINT "pk_lowest_rate_count" PRIMARY KEY (
        "bookID"
     )
);

CREATE TABLE "publication_info" (
    "bookID" bigserial   NOT NULL,
    "title" varchar(750)   NOT NULL,
    "authors" varchar(750)   NOT NULL,
    "publication_date" date   NOT NULL,
    "publisher" varchar(1000)   NOT NULL,
    CONSTRAINT "pk_publication_info" PRIMARY KEY (
        "bookID"
     )
);

----------------------------------------

-- Addint information to the tables


-- Bottom 10 books by rating
INSERT INTO "Bottom_10_books"
SELECT "bookID", "title", "authors", "average_rating"
FROM "books";

SELECT *
FROM "Bottom_10_books";


-- Created a new table to keep the csv file name lowercase
SELECT *
INTO "bottom_10_books"
FROM "Bottom_10_books"
ORDER BY "average_rating" ASC
LIMIT 10;

SELECT *
FROM "bottom_10_books";




-- Top 10 books by rating
INSERT INTO "Top_10_books"
SELECT "bookID", "title", "authors", "average_rating"
FROM "books";

-- Deleting information that was not valid
DELETE FROM "Top_10_books" 
WHERE "bookID" = 19786;

DELETE FROM "Top_10_books" 
WHERE "bookID" = 19787;

DELETE FROM "Top_10_books" 
WHERE "bookID" = 19788;

-- Created new table to keep csv file name lowercase
SELECT *
INTO "top_10_books"
FROM "Top_10_books"
ORDER BY "average_rating" DESC
LIMIT 10;

SELECT *
FROM "top_10_books";




-- Highest rate count
INSERT INTO "highest_rate_count"
SELECT "bookID", "title", "authors", "ratings_count"
FROM "books";

-- Altering table to reorder my table
ALTER TABLE "highest_rate_count" 
RENAME TO "mytable_old";

CREATE TABLE "highest_rate_count" 
AS SELECT * 
FROM "mytable_old" 
ORDER BY ratings_count DESC
LIMIT 10;

SELECT *
FROM "highest_rate_count";



-- Lowest rate count
INSERT INTO "lowest_rate_count"
SELECT "bookID", "title", "authors", "ratings_count"
FROM "books"
ORDER BY "ratings_count" ASC
LIMIT 10;

SELECT *
FROM "lowest_rate_count";


-- Publication info
INSERT INTO "publication_info"
SELECT "bookID", "title", "authors", "publication_date", "publisher"
FROM "books";

SELECT *
FROM "publication_info";

-- Creating a larger table for the rating

CREATE TABLE "high_to_low" 
AS SELECT * 
FROM "books" 
ORDER BY "average_rating" DESC;

SELECT *
FROM "high_to_low";



CREATE TABLE "low_to_high" 
AS SELECT * 
FROM "books" 
ORDER BY "average_rating" ASC;

SELECT *
FROM "low_to_high";



















