-- What was the hottest day in our data set? Where was that?
-- 134 degrees
-- 94063 zip code

select max(maxtemperaturef)
    ,zip
from public.weather
GROUP BY zip

-- How many trips started at each station?

SELECT count(start_station)
    ,start_station
from PUBLIC.trips
Group BY start_station

-- What's the shortest trip that happened?
-- 60 minutes

SELECT min(duration)
from public.trips

-- What is the average trip duration, by end station?

SELECT avg(duration)
    ,end_station
from public.trips
GROUP BY end_station