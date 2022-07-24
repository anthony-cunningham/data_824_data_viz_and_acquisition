select * from cd.facilities;

select name, membercost
from cd.facilities
;

select *
from cd.facilities
where membercost > 0
;

select *
from cd.facilities
where facid in (1, 5)
;

select * from cd.members;

select memid, surname, firstname, joindate 
from cd.members
where joindate > '2012-09-01'
;

select distinct surname
from cd.members
order by surname
limit 10
;

select joindate 
from cd.members
order by joindate desc
limit 1
;

select count(distinct facid) as n_facilities
from cd.facilities
where guestcost > 10
;

select * from cd.bookings;

select facid, sum(slots) as n_slots
from cd.bookings
where to_char(starttime, 'YYYY-MM') = '2012-09'
group by facid
order by 2
;

select facid, sum(slots) as n_slots
from cd.bookings
group by facid
    having sum(slots) > 1000
order by facid
;

select b.starttime, c.name
from cd.bookings b
inner join cd.facilities c
    on c.facid = b.facid
        and lower(c.name) like '%tennis court%'
where to_char(b.starttime, 'YYYY-MM-DD') = '2012-09-21'
order by b.starttime
;

select b.starttime
from cd.bookings b
inner join cd.members m
    on m.memid = b.memid
        and lower(concat(m.firstname, ' ', m.surname)) = 'david farrell'
order by b.starttime
;