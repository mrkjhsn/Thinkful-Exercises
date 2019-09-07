-- The IDs and durations for all trips of duration greater than 500, ordered by duration.
select  trip_id
,duration
from public.trips
where duration > 500

-- Every column of the stations table for station id 84.
select *
from PUBLIC.stations
where station_id = 84

-- The min temperatures of all the occurrences of rain in zip 94301.
select mintemperaturef
from public.weather
where zip = 94301

