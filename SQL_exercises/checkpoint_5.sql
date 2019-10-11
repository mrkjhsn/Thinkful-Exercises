-- How many records are in the vehicles table? Provide the query you’d use to determine this as well as the answer to the question.

select count(*)
from vehicles
-- 33442

-- Write a query that returns all the records in the vehicles table.
select *
from vehicles

-- Write a query that returns the id, make, and model fields for all the records for 2010 vehicles.

select id
	,make
	,model
from vehicles
where year = 2010


-- Write a query that returns the count of vehicles from 2010. Also provide the answer.

select count(year)
from vehicles
group by year
having year = 2010
-- 1109

-- Write a query that returns the count of vehicles in the vehicles table between the years 2010 and 2015, inclusive. Provide the query as well as the answer.

select count(id)
from vehicles
where year between 2010 and 2015
-- 5995

-- Write a query that returns the count of vehicles from the years 1990, 2000, and 2010. Provide the query and the result.
select count(id)
from vehicles
where year = 1990 or year = 2010 or year = 2000
-- 3026

-- Write a query that returns the count of all records between 1987 and 2005, exclusive of the years 1990 and 2000.
select count(id)
from vehicles
where year < 1990 or year > 2000
-- 23035

-- Write a query that returns the year, make, model, and a field called average_mpg that calculates the average highway/city fuel consumption. (For example, if hwy is 24 and cty is 20, then average_mpg = (24 + 20)/ 2 = 22.)
select 
	year
	,make
	,model
	,(hwy + cty)/2 as average_mpg
from vehicles

-- Write a query that returns the year, make, model, and a text field displaying “X highway; Y city.” (For example, if hwy is 24 and cty is 20, then hwy_city is “24 highway; 20 city.”)
select 
	year
	,make
	,model
	,concat(hwy, ' highway; ', cty, ' city')
from vehicles

-- Write a query that returns the id, make, model, and year for all records that have NULL for either the cyl or displ fields.

select
	id
	,make
	,model
	,year
from vehicles
where cyl is null or
	displ is null

-- Write a query that returns all fields for records with rear-wheel drive and diesel vehicles since 2000, inclusive. Also sort by year and highway mileage, both descending. Hint: to view the distinct values in a field, you can use DISTINCT. For example, use SELECT DISTINCT(drive) FROM vehicles; to get the unique values that appear in that field, or use SELECT DISTINCT(fuel) FROM vehicles;.
select *
from vehicles
where drive = 'Rear-Wheel Drive'
    AND fuel = 'Diesel'
	and year > 1999
order by year, hwy DESC;

-- Write a query that counts the number of vehicles that are either Fords or Chevrolets and either compact cars or 2-seaters. Provide the query and the answer.
select count(*)
from vehicles
where make = 'Ford' or make = 'Chevrolets'
and class = 'Compact Cars' or class = 'Two-Seaters'

-- Write a query that returns the records for 10 vehicles with the highest highway fuel mileage.


-- Write a query that returns all the records of vehicles since the year 2000 whose model name starts with a capital X. Sort the list A through Z by make. What happens when you use a lowercase “x” instead?
-- Write a query that returns the count of records where the “cyl” field is NULL. Provide the query as well as the answer.
-- Write a query that returns the count of all records before the year 2000 that got more than 20 mpg hwy and had greater than 3 liters displacement (“displ” field). Provide the query as well as the answer.
-- Write a query that returns all records whose model name has a (capital) X in its 3rd position. Hint: make sure your wildcard operator accommodates for any characters after the “X”!