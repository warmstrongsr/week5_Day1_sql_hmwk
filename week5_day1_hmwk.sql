--Week 5 - Monday Questions

--1. How many actors are there with the last name ‘Wahlberg’?
SELECT COUNT(*) 
FROM actor
WHERE last_name = 'Wahlberg';
-- Answer: 2 Nick and Daryl

--2. How many payments were made between $3.99 and $5.99?
SELECT COUNT(amount)
FROM payment 
WHERE amount BETWEEN 3.99 AND 5.99;
-- Answer: 5607

--3. What films have exactly 7 copies? (search in inventory)
SELECT COUNT(*) 
FROM inventory 
WHERE film_id =7;

-- Answer: 5

--4. How many customers have the first name ‘Willie’?
SELECT COUNT(*) 
FROM customer
WHERE first_name LIKE 'Willie';
-- Answer: 2 

--5. What store employee (get the id) sold the most rentals (use the rental table)?
SELECT staff_id, SUM(staff_id) 
FROM rental 
GROUP BY staff_id
ORDER BY COUNT(*)DESC;
-- Answer: 2 w/ 16,008 rental 1 has 8,040.

--6. How many unique district names are there?
SELECT COUNT(DISTINCT district) AS district_count
FROM address;
-- Answer: district_count = 378

--7. What film has the most actors in it? (use film_actor table and get film_id)
SELECT COUNT(*), film_id
FROM film_actor
GROUP BY film_id
HAVING COUNT(*)>0
ORDER BY COUNT(*)DESC;
-- Answer: film_id 508 has a count of 15

--8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
SELECT COUNT(last_name), store_id 
FROM customer 
WHERE last_name LIKE '__%es'
GROUP BY store_id 
HAVING store_id = 1;
-- Answer: 13

--9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
--with ids between 380 and 430? (use group by and having > 250)
SELECT COUNT(amount)  
FROM payment
WHERE customer_id  BETWEEN 380 AND 430
GROUP BY amount  
HAVING COUNT(customer_id)  > 250
ORDER BY COUNT(customer_id)DESC; 
-- Answer: 3 (290, 281, 269)
--10. Within the film table, how many rating categories are there? And what rating has the most
SELECT COUNT(*), rating
FROM film
GROUP BY rating
HAVING COUNT(title) > 0
ORDER BY Count(*)DESC;
-- Answer: 5 and PG-13
--223	PG-13
--210	NC-17
--195	R
--194	PG
--178	G

