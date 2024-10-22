###Sakila DB Questions

USE sakila;

# 1 - List all actors
SELECT * FROM actor;

# 2 - Find the surname of the actor with the forename 'John'
SELECT * FROM actor WHERE first_name = 'John';
# Suvari

# 3 - Find all actors with the surname 'Neeson'
SELECT * FROM actor WHERE last_name = 'Neeson';
# Christian & Jayne

# 4 - Find all actors with ID numbers divisible by 10
SELECT * FROM actor WHERE actor_id % 10 = 0;

# 5 - What is the description of the movie with an ID of 100?
SELECT description FROM film WHERE film_id = 100;
#A Beautiful Drama of a Dentist...

# 6 - Find every R-rated Movie
SELECT * FROM film WHERE rating = 'R';

# 7 - Find every non-R-rated movie
SELECT * FROM film WHERE rating != 'R'; 

# 8 - Find the 10 shortest movies
SELECT * FROM film ORDER BY length DESC LIMIT 10;

# 9 - Find the movies with the longest runtime without using LIMIT
SELECT * FROM film WHERE length = (SELECT MAX(length) FROM film);

# 10 - Find all movies that have deleted scenes
SELECT * FROM film WHERE special_features LIKE '%Deleted Scenes%';

# 11 - Using HAVING, reverse-alphabetically list the last names that are not repeated.
# SELECT DISTINCT last_name FROM actor ORDER BY last_name DESC; 
SELECT last_name FROM actor GROUP BY last_name HAVING COUNT(last_name) = 1 ORDER BY last_name DESC;

# 12 - Using HAVING, list the last names that appear more than once, from highest to lowest frequency.
SELECT last_name FROM actor GROUP BY last_name HAVING COUNT(last_name) > 1 ORDER BY COUNT(last_name) DESC;
# 1st - Kilmer
# Last - Wahlberg

# 13 - Which actor has appeared in the most films?
# film_actor - linking table between film and actor
# Count the highest actorId across filmIds
# Join first and last name of this id to name
#SELECT actor_id, count(*) AS film_count from film_actor GROUP BY actor_id ORDER BY film_count DESC LIMIT 1;

SELECT a.actor_id, a.first_name, a.last_name, COUNT(fa.film_id) AS film_count
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
GROUP BY a.actor_id
ORDER BY film_count DESC
LIMIT 1;

# 14 - When is 'Academy Dinosaur' due?
# Return the date of return for the film Academy Dinosaur

SELECT r.return_date FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
WHERE f.title = 'Academy Dinosaur'
ORDER BY return_date DESC
LIMIT 1;

# 15 - What is the average runtime of all films?
SELECT AVG(length) AS average_run_time FROM film;
# 115.2720

# 16 - List the average runtime for every film category.
SELECT c.name, AVG(f.length) AS average_run_time FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
JOIN film f ON fc.film_id = f.film_id
GROUP BY c.name;

# 17 - List of all movies featuring a robot
SELECT * FROM film WHERE description LIKE '%robot%';

# 18 - How many movies were released in 2010?
SELECT COUNT(release_year) AS twenty_ten_releases FROM film WHERE release_year = 2010;

# 19 - Find the titles of all the horror movies.
SELECT title FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
WHERE c.name = 'Horror';

# 20 - List the full name of the staff member with the ID of 2.
SELECT first_name, last_name FROM staff WHERE staff_id = 2;

# 21 - List all the movies that Fred Costner has appeared in.
SELECT title FROM film f
JOIN film_actor fa ON f.film_id = fa.film_id
JOIN actor a ON fa.actor_id = a.actor_id
WHERE a.first_name = 'Fred' AND a.last_name = 'Costner';

# 22 - How many distinct countries are there?
SELECT DISTINCT COUNT(country_id) FROM country;

# 23 - List the name of every language in reverse-alphabetical order.
SELECT DISTINCT name FROM language
ORDER BY name DESC;

# 24 - List the full names of every actor whose surname ends with '-son' in alphabetical order by their forename.

