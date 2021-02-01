use sakila;
select title from sakila.film;

select name as 'language' from sakila.language;

select * from sakila.store;
select first_name  from sakila.staff;

select * from sakila.rental;

select * from sakila.actor
where first_name = 'Scarlett'; 
-- 2 female actresses

select * from sakila.actor
where last_name = 'Johansson'; 
-- 3 mate actors

select inventory_id from inventory; -- 4581 movies available for rent

select distinct inventory_id from sakila.rental; -- 4580 movies have been rented :/

select max(DATEDIFF(return_date, rental_date)) from sakila.rental; -- 10 days is the longest rental
#select min(rental_duration) from sakila.film;
select min(TIMEDIFF(return_date, rental_date)) from sakila.rental; -- 18h is the shortest rental

select max(length) as 'max_duration', min(length) as 'min_duration' from sakila.film; -- max is 185 min is 46

select avg(length) as average_time from sakila.film; -- 115.27 min is avergae duration
select CONCAT(FLOOR(avg(length)/60),'h ',MOD(avg(length),60),'m') from sakila.film; -- 1h55min

select title, length as more_than_3h from sakila.film
where length > 180;

select lower(email) from sakila.customer;
#SELECT SUBSTRING_INDEX(email,'@',1) from  sakila.customer;

select title from sakila.film
ORDER BY LENGTH(title) desc 
LIMIT 1; -- ARACHNOPHOBIA ROLLERCOASTER







