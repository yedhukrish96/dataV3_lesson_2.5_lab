USE sakila;

#1-
#Select all the actors with the first name ‘Scarlett’.
SELECT * FROM actor
WHERE first_name LIKE 'Scarlett';

#2-
#How many films (movies) are available for rent and how many films have been rented?


SELECT 
  (SELECT COUNT(*) FROM sakila.inventory) as films_available_for_rent,
  (SELECT COUNT(*) FROM sakila.rental) as films_rented;


#3-
#What are the shortest and longest movie duration? Name the values max_duration and min_duration-
SELECT * FROM film;

SELECT max(length) AS longest , min(length) AS shortest
FROM film;

#4-
#What's the average movie duration expressed in format (hours, minutes)? 

SELECT Sec_to_time(AVG(length*60)) 
FROM film;

#5
#How many distinct (different) actors last names are there?
SELECT COUNT(DISTINCT last_name)
FROM actor;

#6-
#Since how many days has the company been operating (check DATEDIFF() function)?
SELECT DATEDIFF(max(return_date),min(rental_date)) AS 'Operating days' 
from rental;

#7-
#Show rental info with additional columns month and weekday. Get 20 results.
SELECT * FROM rental;
SELECT *, MONTH(rental_date) as month, DAY(rental_date) as day
FROM rental
LIMIT 20;

#8-
#Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT *, IF(weekday(rental_date)<6,"workday","weekend") as day_type, WEEKDAY(rental_date) as checkday
FROM rental;

#9-
#Get release years.
SELECT release_year
from film;

#10-
#Get all films with ARMAGEDDON in the title-
SELECT title 
FROM film
WHERE title LIKE '%ARMAGEDDON' OR title LIKE 'ARMAGEDDON%';

#11-
#Get all films which title ends with APOLLO.
SELECT title
FROM film
WHERE title like '%APOLLO';

#12-
#Get 10 the longest films.
SELECT max(length)
FROM film
LIMIT 10;


#13-
#How many films include Behind the Scenes content?
SELECT special_features
FROM film
WHERE special_features LIKE '%Behind the Scenes' OR special_features LIKE 'Behind the Scenes%';






