select * from payment;

select count(distinct payment_id) as n_payments
from payment
where amount > 5
;

select * from actor;

select count(distinct actor_id) as n_actors
from actor
where first_name like 'P%'
;

select * from address;

select count(distinct district) as n_districts
from address
;

select distinct district
from address
order by district
;

select * from film;

select count(distinct film_id) as n_films
from film
where rating = 'R'
    and replacement_cost >= 5
    and replacement_cost <= 15
;

select count(distinct film_id) as n_films
from film
where title like '%Truman%'
;