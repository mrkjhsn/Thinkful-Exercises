-- What are the three longest trips on rainy days?

select T.duration
    ,T.trip_id
    ,date(T.start_date)

FROM trips as T
JOIN (select date(date) rain_date
      from weather
      WHERE events = 'Rain') as R

on R.rain_date = date(T.start_date)
ORDER BY T.duration desc
LIMIT 3

-- Which station is full most often?

with top_avail
as (
        SELECT status.station_id
        ,max(status.bikes_available)
    FROM public.status
    GROUP by status.station_id
    ORDER BY max(status.bikes_available) DESC
    LIMIT 1
)

SELECT public.stations.station_id
    ,stations.name
FROM public.stations
JOIN 
top_avail
ON
public.stations.station_id = top_avail.station_id 

-- Return a list of stations with a count of number of trips starting at that station but ordered by dock count.

SELECT trips.start_station
    ,stations.dockcount
    ,count(trips.start_station)
FROM trips
JOIN stations
on stations.name = trips.start_station
GROUP BY trips.start_station, stations.dockcount
ORDER BY stations.dockcount desc
 

-- (Challenge) What's the length of the longest trip for each day it rains anywhere?

SELECT
trip_id,
duration,
trips.start_date
FROM trips
JOIN (SELECT 
    date
    From weather
    WHERE events = 'Rain'
    GROUP BY date
) as rain_days on date(rain_days.date) = date(trips.start_date)
GROUP BY trips.start_date, trips.trip_id, trips.duration
ORDER BY trips.duration DESC
