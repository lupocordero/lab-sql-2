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

-- How many distinct (different) actors' last names are there?
select count(distinct last_name) from sakila.actor; -- 121

-- In how many different languages where the films originally produced? (Use the column language_id from the film table)
select count(distinct language_id) from sakila.film;

-- How many movies were released with "PG-13" rating?
select count(rating) from sakila.film
where rating = "PG-13";

-- Get 10 the longest movies from 2006.
select title, length from sakila.film
where release_year = '2006'
limit 10;

-- How many days has been the company operating (check DATEDIFF() function)?
select datediff(max(rental_date), min(rental_date)) from sakila.rental; -- 266

-- Show rental info with additional columns month and weekday. Get 20.
select date_format(convert(rental_date,date),'%M') as 'Rental Month', date_format(convert(rental_date, datetime), '%W') as 'Weekday' from rental
limit 20;

-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
select date_format(convert(rental_date,date),'%M') as 'Rental Month', date_format(convert(rental_date, datetime), '%W') as 'Weekday',
case
when date_format(convert(rental_date, datetime), '%W') = 'Saturday' or 'Sunday' then 'Weekend'
else 'Workday'
end as 'Day-Type'
from rental

-- How many rentals were in the last month of activity?
select count(rental_id) from sakila.rental
where date_format(convert(rental_date, date), '%M') = 'February' and date_format(convert(rental_date, date), '%Y') = '2006';








