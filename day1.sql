-- Intro into SQL, SELECT ALL FROM actor table
SELECT *
FROM actor;

-- Query for first_name and last_name
SELECT first_name, last_name
FROM actor;

-- Query first_name which equals 'Nick'
-- Using the WHERE clause
SELECT first_name, last_name
FROM actor
WHERE first_name = 'Nick';

-- Query being specific again
-- Using the LIKE clause
-- NOTE: ( = ) is looking for the literal string
-- while the LIKE clause allows for use with Wild Cards
SELECT last_name
FROM actor
WHERE first_name LIKE 'Nick';

-- Use LIKE clause and WILD CARD ( % )
-- Get all J names
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'J%';

-- Single character WILD CARD ( _ )
SELECT first_name, actor_id
FROM actor
WHERE first_name LIKE 'K___';


-- Query for all first_names that start with 'K__%' has two letters then anything goes
SELECT first_name
FROM actor
WHERE first_name LIKE 'K__%';

-- Comparing Operators:
-- = Equal To
-- > Greater Than
-- < Less Than
-- >= Greater Than or Equal To
-- <= Less Than or Equal To
-- <> Not Equals

SELECT *
FROM payment;

-- Query WHERE amount greater than $10
SELECT customer_id, amount
FROM payment
WHERE amount > 10;

-- Query amounts between $10-$15
-- NOTE: When using between both values are inclusive
SELECT customer_id, amount
FROM payment
WHERE amount BETWEEN 10 AND 15;

-- Order the payments by amount
-- Using ORDER BY
-- ASC for ascending ( Default )
-- DESC for descending
SELECT customer_id, amount
FROM payment
WHERE amount > 10
ORDER BY amount DESC;

-- Order the payments by date
SELECT customer_id, amount, payment_date
FROM payment
WHERE amount > 10
ORDER BY payment_date DESC;

-- Query all payments not equal to 2.99
SELECT customer_id, amount
FROM payment
WHERE amount <> 2.99
ORDER BY amount;

-- SQL Aggregations => SUM(), AVG(), COUNT(), MIN(), MAX()

-- QUERY to display the SUM of amounts greater than or equal to 5.99
SELECT SUM(amount)
FROM payment
WHERE amount >= 5.99;

-- Query to display the AVG of amounts greater than or equal to 5.99
SELECT AVG(amount)
FROM payment
WHERE amount >= 5.99;

-- Query to display the COUNT how many amounts paid greater than or equal to 5.99
SELECT COUNT(amount)
FROM payment
WHERE amount >= 5.99;

-- Query to display the count of DISTINCT amounts paid greater than or equal to 5.99
SELECT COUNT(DISTINCT amount)
FROM payment
where amount >= 5.99;

-- Query to display the MIN paid
SELECT MIN(amount) AS min_amount_paid
FROM payment
WHERE amount > 0;

-- Query to display the MAX paid
SELECT MAX(amount) AS max_amount_paid
FROM payment;

-- GROUP BY demonstration ( This works with aggragators )
SELECT amount
FROM payment
WHERE amount = 7.99;

SELECT customer_id
from payment;

SELECT customer_id, COUNT(amount)
FROM payment
WHERE amount = 7.99
GROUP BY customer_id;

-- Query the customer that paid the most
SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC
LIMIT 10;

-- Add more specificity to the aggregated result
-- HAVING clause
-- WHERE clause cannot be used with aggregates, but the HAVING clause can.
SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
HAVING SUM(amount) < 1000
ORDER BY SUM(amount) DESC
LIMIT 10;

-- Query to display the customer_id that shows up more than once by email
