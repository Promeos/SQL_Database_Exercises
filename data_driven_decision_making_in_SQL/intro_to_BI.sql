/*

Introduction to Business Intelligence for a Online Movie Rental Database

Course Outline:
- review SQL know-how
- Apply SQL know-how to extract business insights.
- Learn about new SQL statements to summarize data
    - OLAP extensions
    - Examples of OLAP extensions are: CUBE, ROLLUP, GROUPING SETS

Case Study: MovieNow an online movie rental company
- platform to steam movies
- additional information for each movie: genre, main actors, etc.
- customer information
- movie ratings

* Data-driven decision making achieves short-term and long-term goals.
short term goals: which actors generate viewership (which movies to buy), last months revenue
long term goals:  customer growth, demographics, long-term development of revenue to determine long-term investments

KPI's helps a company define and monitor success.
- total number of rentals: revenue
- average rating of all movies: customer satisfaction
- number of active customers: customer engagement

1. Exploring the Renting Table  */
SELECT *
FROM renting;

-- 1.1 Select columns to calculate the average rating
SELECT movie_id,
    rating
FROM renting;

-- 1.2 In which column of renting did you notice null values?
-- The rating column. Some customers do not leave a rating for the movie after watching it


/* Filtering and Ordering

WHERE clause
- certain rows are selected when a selection condition holds for example

Select all customers from Italy
*/
SELECT *
FROM customers
WHERE country = 'Italy';

/*
Operators in the WHERE clause

Equal = 
Not Equal <>
Less than <
Less than or equal to <=
Greater than >
Greater than or equal to >=

BETWEEN operator

IN operator
*/
-- Select all columns from movies where the genre is not Drama
SELECT *
FROM movies
WHERE genre <> 'Drama';

-- Select all columns of customers where the date when the account was created
-- is between 2018-01-01 and 2018-09-30;
SELECT *
FROM customers
WHERE date_account_start BETWEEN '2018-01-01' AND '2018-09-30';

-- Select all actors with the nationality USA or Australia
SELECT *
FROM actors
WHERE nationality IN ('USA', 'Australia');

-- NULL Operator: Missing values
-- Select all columns from renting where rating is NULL.
SELECT *
FROM renting
WHERE rating IS NULL;

-- Select all columns from renting where rating is not NULL.
SELECT *
FROM renting
WHERE rating IS NOT NULL;

-- Boolean operators AND/OR
-- Select customer name and the date when they created their account for
-- customers who are from Italy AND who created an account between 2018-01-01
-- and 2018-09-30.
SELECT name,
    date_account_start
FROM customers
WHERE country = 'Italy'
AND date_account_start BETWEEN '2018-01-01' AND '2018-09-30';

SELECT name,
    date_account_start
FROM customers
WHERE country = 'Italy'
OR date_account_start BETWEEN '2018-01-01' AND '2018-09-30';

-- ORDER BY DESC
SELECT name,
    date_account_start
FROM customers
WHERE country = 'Italy'
OR date_account_start BETWEEN '2018-01-01' AND '2018-09-30'
ORDER BY date_account_start DESC;

-- Select all movies rented on October 9th, 2018
SELECT *
FROM renting
WHERE date_renting = '2018-10-09';

-- Select all records of movie rentals between the beginning of April 2018 - August 2018
SELECT *
FROM renting
WHERE date_renting BETWEEN '2018-04-01' AND '2018-08-31';

-- Put the most recent records of movie rentals on top of the resulting table and
-- order them in descreasing order
SELECT *
FROM renting
WHERE date_renting BETWEEN '2018-04-01' AND '2018-08-31'
ORDER BY date_renting DESC;

-- Select all movies which are not dramas
SELECT *
FROM movies
WHERE genre <> 'Drama';

-- Select the movies 'Showtime', 'Love Actually', and 'The Fighter'
SELECT *
FROM movies
WHERE title IN ('Showtime', 'Love Actually', 'The Fighter');

-- Order the movies by increasing renting price
SELECT *
FROM movies
ORDER BY renting_price;

-- Select all movie rentals from 2018, filter records that have a rating
SELECT *
FROM renting
WHERE date_renting BETWEEN '2018-01-01' AND '2018-12-31'
    AND rating IS NOT NULL;