-- Instructions
-- In this lab we will find the customers who were active in consecutive months of May and June. Follow the steps to complete the analysis.
-- Create a table rentals_may to store the data from rental table with information for the month of May.
use sakila;
CREATE TABLE rentals_may AS
SELECT *
FROM rental
WHERE MONTH(rental_date) = 5;
-- Insertar valores en la tabla rentals_may:
INSERT INTO rentals_may
SELECT *
FROM rental
WHERE MONTH(rental_date) = 5;
SElect *
From rentals_may;
-- Crear la tabla rentals_june:
CREATE TABLE rentals_june AS
-- Crear la tabla rentals_may si no existe
CREATE TABLE IF NOT EXISTS rentals_may LIKE rental;

-- Poblar la tabla rentals_may
INSERT INTO rentals_may
SELECT * FROM rental
WHERE MONTH(rental_date) = 5
ON DUPLICATE KEY UPDATE rentals_may.rental_id = rental.rental_id;

-- Crear la tabla rentals_june si no existe
CREATE TABLE IF NOT EXISTS rentals_june LIKE rental;

SELECT *
FROM rental
WHERE MONTH(rental_date) = 6;
SElect *
From rentals_june;
 -- nsertar valores en la tabla rentals_june:
INSERT INTO rentals_june
SELECT *
FROM rental
WHERE MONTH(rental_date) = 6;
SElect *
From rentals_june;
-- Contar el número de alquileres para cada cliente en mayo:
SELECT customer_id, COUNT(*) AS rentals_in_may
FROM rentals_may
GROUP BY customer_id;
-- Contar el número de alquileres para cada cliente en junio:
SELECT customer_id, COUNT(*) AS rentals_in_june
FROM rentals_june
GROUP BY customer_id;