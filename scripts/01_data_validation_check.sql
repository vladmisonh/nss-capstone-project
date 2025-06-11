SELECT *
FROM housing_data
LIMIT 10;

SELECT 
	COUNT(*)
FROM housing_data;

SELECT
	DISTINCT year
FROM housing_data
ORDER BY year;

SELECT 
	COUNT(DISTINCT region_name)
FROM housing_data;
