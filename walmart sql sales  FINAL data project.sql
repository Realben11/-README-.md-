--- 
select * from WALMARTSALESDATA

----select distinct status 
select distinct Branch from WALMARTSALESDATA
--- BRANCH = 3 (A,B,C)
select distinct City from WALMARTSALESDATA
--CITY = 3 Mandalay, Yangon,Mandalay
select distinct Customer_type from WALMARTSALESDATA
---CUSTOMER_TYPE = 2  Normal, Member
select distinct Quantity from WALMARTSALESDATA
-- QUANTITY= 1-10
select distinct Payment from WALMARTSALESDATA
 ---PAYMENT = 3 Ewallet, Cash, Credit card
 select distinct Customer_type from WALMARTSALESDATA
 ---Customer_type = Normal, Member
 select distinct Gender from WALMARTSALESDATA
 ---- Gender = Male, Female
select distinct Product_line from WALMARTSALESDATA
----- product_line = Fashion,Health,Electronic accessoris,Food and beverages,Sports and travel,Home and lifestyle

 ------------Feature Engineering

 --- Let add Time of day column

		  UPDATE WALMARTSALESDATA
		  SET Time_of_day =
		   ( case 
        when Time between  '00:00:00' and '12:00:00' then 'Morning' 
		 when Time between  '12:01:00' and '16:00:00' then 'Afternoon'
		 else 'Evening'
		 end
		 )
		 select * from WALMARTSALESDATA

	
---------let create day_name column------------------
SELECT date,
	DATENAME(dw, [Date])as day_name
FROM WALMARTSALESDATA
drop table WALMARTSALESDATA drop day_name
ALTER TABLE WALMARTSALESDATA ADD day_name varchar(10)

update WALMARTSALESDATA
set day_name = DATENAME(dw, [Date])

--------month_name

	SELECT date,
	DATENAME(MONTH, [Date])as day_name
FROM WALMARTSALESDATA

ALTER TABLE  WALMARTSALESDATA ADD Month_name varchar(10)

update WALMARTSALESDATA
set month_name = DATENAME(MONTH, [Date])

----Generic Questions

-- How many unique cities does the data have?
SELECT 
	DISTINCT city
FROM WALMARTSALESDATA

-- In which city is each branch?
SELECT 
	DISTINCT city,
    branch
FROM WALMARTSALESDATA

----product analysis----------
-- What is the most selling product line
SELECT
	SUM(quantity) as qty,
    product_line
FROM WALMARTSALESDATA
GROUP BY product_line
ORDER BY qty DESC

----- What is the total revenue by month
SELECT
	month_name AS month,
	SUM(total) AS total_revenue
FROM WALMARTSALESDATA
GROUP BY month_name 
ORDER BY total_revenue

-- What month had the largest COGS?
SELECT
	month_name AS month,
	SUM(cogs) AS cogs
FROM WALMARTSALESDATA
GROUP BY month_name 
ORDER BY cogs


-- ----What product line had the largest revenue?
SELECT
	product_line,
	SUM(total) as total_revenue
FROM WALMARTSALESDATA
GROUP BY product_line
ORDER BY total_revenue DESC

-------- What is the city with the largest revenue?
SELECT
	branch,
	city,
	SUM(total) AS total_revenue
FROM WALMARTSALESDATA
GROUP BY city, branch 
ORDER BY total_revenue


-- What product line had the largest VAT?
SELECT
	product_line,
	AVG(VAT) as avg_tax
FROM WALMARTSALESDATA
GROUP BY product_line
ORDER BY avg_tax DESC



------- Fetch each product line and add a column to those product 
--------- line showing "Good", "Bad". Good if its greater than average sales

SELECT 
	AVG(quantity) AS avg_qnty
FROM WALMARTSALESDATA

SELECT
	product_line,
	CASE
		WHEN AVG(quantity) > 6 THEN 'Good'
        ELSE 'Bad'
    END AS remark
FROM WALMARTSALESDATA
GROUP BY product_line


-- Which branch sold more products than average product sold?
SELECT 
	branch, 
    SUM(quantity) AS qnty
FROM WALMARTSALESDATA
GROUP BY branch
HAVING SUM(quantity) > (SELECT AVG(quantity) FROM WALMARTSALESDATA)


------- What is the most common product line by gender
SELECT
	gender,
    product_line,
    COUNT(gender) AS total_cnt
FROM WALMARTSALESDATA
GROUP BY gender, product_line
ORDER BY total_cnt DESC

-------- What is the average rating of each product line
SELECT
	ROUND(AVG(rating), 2) as avg_rating,
    product_line
FROM WALMARTSALESDATA
GROUP BY product_line
ORDER BY avg_rating DESC


------------------------------------------------------------------------
--------------------------------CUSTOMERS

-- How many unique customer types does the data have?
SELECT
	DISTINCT customer_type
FROM WALMARTSALESDATA

-- How many unique payment methods does the data have?
SELECT
	 payment,
	 COUNT(payment)as num
FROM WALMARTSALESDATA
Group by payment
order by num desc


-- What is the most common customer type?
SELECT
	customer_type,
	count(*) as count
FROM WALMARTSALESDATA
GROUP BY customer_type
ORDER BY count DESC

-- Which customer type buys the most?
SELECT
	customer_type,
    COUNT(*)
FROM WALMARTSALESDATA
GROUP BY customer_type

-- What is the gender of most of the customers?
SELECT
	gender,
	COUNT(*) as gender_cnt
FROM WALMARTSALESDATA
GROUP BY gender
ORDER BY gender_cnt DESC
-- Gender per branch is more or less the same hence, I don't think has
-- an effect of the sales per branch and other factors.

-- What is the gender distribution per branch?
SELECT
	branch,  gender,
	COUNT(*) as gender_cnt
FROM WALMARTSALESDATA
GROUP BY branch, gender
ORDER BY gender_cnt DESC

-- Which time of the day do customers give most ratings?
SELECT
	time_of_day,
	AVG(rating) AS avg_rating
FROM WALMARTSALESDATA
GROUP BY time_of_day
ORDER BY avg_rating DESC
-- Looks like time of the day does not really affect the rating, its
-- more or less the same rating each time of the day.alter

---- Which time of the day do customers give most ratings per branch?
SELECT
	time_of_day,
	AVG(rating) AS avg_rating
FROM WALMARTSALESDATA
WHERE branch ='C'
GROUP BY time_of_day
ORDER BY avg_rating DESC
-- Branch A and C are doing well in ratings, branch B needs to do a 
-- little more to get better ratings.


-- Which day oF the week has the best avg ratings?
SELECT
	day_name,
	AVG(rating) AS avg_rating
FROM WALMARTSALESDATA
GROUP BY day_name 
ORDER BY avg_rating DESC
-- Mon, Tue and Friday are the top best days for good ratings
-- why is that the case, how many sales are made on these days?



-- Which day of the week has the best average ratings per branch?
SELECT 
	day_name,
	COUNT(day_name)as total_sales
FROM WALMARTSALESDATA
WHERE branch = 'C'
GROUP BY day_name
ORDER BY total_sales DESC

---------------------------------------------
---------------------SALES ANALYSIS

-- Number of sales made in each time of the day per weekday 
SELECT
	time_of_day,
	COUNT(*) AS total_sales
FROM  WALMARTSALESDATA
WHERE day_name = 'SundaY'
GROUP BY time_of_day 
ORDER BY total_sales DESC
-- Evenings experience most sales, the stores are 
-- filled during the evening hours

-- Which of the customer types brings the most revenue?
SELECT
	customer_type,
	SUM(total) AS total_revenue
FROM  WALMARTSALESDATA
GROUP BY customer_type
ORDER BY total_revenue

-- Which city has the largest tax/VAT percent?
SELECT
	city,
    ROUND(AVG(VAT), 2) AS avg_tax_pct
FROM  WALMARTSALESDATA
GROUP BY city 
ORDER BY avg_tax_pct DESC

-- Which customer type pays the most in VAT?
SELECT
	customer_type,
	AVG(VAT) AS total_tax
FROM WALMARTSALESDATA
GROUP BY customer_type
ORDER BY total_tax







		

		




