/* Average housing price by year */
SELECT 
	region_name,
	year,
	ROUND(AVG(zhvi_all_homes), 0) AS avg_price
FROM housing_data
GROUP BY 1,2
ORDER BY 1,2;


/* Price growth percentage by region from 2018 to 2023 */
WITH yearly_avg AS (
	SELECT 
		region_name,
		year,
		ROUND(AVG(zhvi_all_homes), 0) AS avg_price
	FROM housing_data
	WHERE year IN (2018, 2023)
	GROUP BY 1,2
),
growth AS (
	SELECT
		a.region_name,
		ROUND((b.avg_price - a.avg_price) / a.avg_price * 100, 2) AS growth_percent
	FROM yearly_avg AS a
	INNER JOIN yearly_avg AS b
		ON a.region_name = b.region_name AND a.year = 2018 AND b.year = 2023
)
SELECT *
FROM growth
ORDER BY growth_percent DESC;


/* The impact of unemployment on housing prices */
SELECT 
	ROUND(unemployment_rate, 1) AS unemployment_bucket,
	ROUND(AVG(zhvi_all_homes), 0) AS avg_price
FROM housing_data
GROUP BY 1
ORDER BY 1;


/* The impact of tax levels on average price */
SELECT
	ROUND(sales_tax, 1) AS sales_tax,
	ROUND(income_tax, 1) AS income_tax,
	ROUND(AVG(zhvi_all_homes), 0) AS avg_price
FROM housing_data
GROUP BY 1, 2
ORDER BY 3 DESC;

/* The impact of median income on average price */
SELECT
	ROUND(median_income, -4) AS income_bucket,
	ROUND(AVG(zhvi_all_homes), 0) AS avg_price
FROM housing_data
GROUP BY 1
ORDER BY 1;
