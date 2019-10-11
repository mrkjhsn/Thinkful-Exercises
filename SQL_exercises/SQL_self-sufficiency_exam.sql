-- 1. Write a query that allows you to inspect the schema of the naep table.
SELECT column_name, data_type 
FROM information_schema.columns
WHERE table_name = 'neap';

-- 2. Write a query that returns the first 50 records of the naep table.
SELECT *
FROM public.naep
LIMIT 50

-- 3. Write a query that returns summary statistics for avg_math_4_score by state. 
-- Make sure to sort the results alphabetically by state name.

SELECT state 
	,count(avg_math_4_score)
	,round(avg(avg_math_4_score), 2) as average
	,min(avg_math_4_score)
	,max(avg_math_4_score)
FROM public.naep
GROUP BY state
ORDER BY state 

-- 4. Write a query that alters the previous query so that it returns only the summary 
-- statistics for avg_math_4_score by state with differences in max and min values that are greater than 30.

SELECT state 
	,round(avg(avg_math_4_score), 2)
	,count(avg_math_4_score)
	,min(avg_math_4_score)
	,max(avg_math_4_score)
FROM public.naep
GROUP BY state
HAVING max(avg_math_4_score) - min(avg_math_4_score) > 30
ORDER BY state 


-- 5. Write a query that returns a field called bottom_10_states that lists the states in the bottom 10 for avg_math_4_score in the year 2000.
SELECT state as bottom_10_states 
FROM public.naep
WHERE year = 2000
GROUP BY state
ORDER BY  avg(avg_math_4_score)
LIMIT 10


-- 6. Write a query that calculates the average avg_math_4_score rounded to the nearest 2 decimal places over all states in the year 2000.
SELECT round(avg(avg_math_4_score),2) as average
FROM public.naep
WHERE year = 2000


-- 7. Write a query that returns a field called below_average_states_y2000 that lists all states with 
-- an avg_math_4_score less than the average over all states in the year 2000.

SELECT state as below_average_states_y2000
FROM public.naep as neap
CROSS JOIN (select round(avg(avg_math_4_score),2) as average
		FROM public.naep
		WHERE year = 2000) as avg_
WHERE year = 2000
GROUP BY below_average_states_y2000, avg_.average
HAVING avg(neap.avg_math_4_score) < avg_.average
ORDER BY avg(neap.avg_math_4_score)


-- 8. Write a query that returns a field called scores_missing_y2000 that lists any states with missing values 
-- in the avg_math_4_score column of the naep data table for the year 2000.

SELECT state as scores_missing_y2000
FROM public.naep
WHERE avg_math_4_score is null and year = 2000
GROUP BY scores_missing_y2000


-- 9. Write a query that returns for the year 2000 the state, avg_math_4_score, and total_expenditure from the 
-- naep table left outer joined with the finance table, using id as the key and ordered by total_expenditure greatest 
-- to least. Be sure to round avg_math_4_score to the nearest 2 decimal places, and then filter out NULL 
-- avg_math_4_scores in order to see any correlation more clearly.

SELECT neap_.state
	,round(neap_.avg_math_4_score, 2) as avg_math_4_score
	,finance_.total_expenditure
FROM public.naep as neap_
LEFT OUTER JOIN public.finance as finance_
ON finance_.id = neap_.id
WHERE neap_.avg_math_4_score is not null and neap_.year = 2000
ORDER BY finance_.total_expenditure desc




