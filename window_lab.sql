-- Challenge 1
-- This challenge consists of three exercises that will test your ability to use the SQL RANK() function. You will use it to rank films by their length, their length within the rating category, and by the actor or actress who has acted in the greatest number of films.

-- 1. Rank films by their length and create an output table that includes the title, length, and rank columns only. Filter out any rows with null or zero values in the length column.

create table film_ranking as
select title, length
, rank () over (partition by length order by title) as "rank"
from film
where length > 0;

select * from film_ranking;

-- 2. Rank films by length within the rating category and create an output table that includes the title, length, rating and rank columns only. Filter out any rows with null or zero values in the length column.

select title, length, rating
,rank () over (partition by length order by rating) as "rank2"
from film 
where length > 0; 


-- 3. Produce a list that shows for each film in the Sakila database, the actor or actress who has acted in the greatest number of films, as well as the total number of films in which they have acted. Hint: Use temporary tables, CTEs, or Views when appropiate to simplify your queries.