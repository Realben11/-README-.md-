# Walmart Sales Data Analysis Project

## About

The dataset was obtained from the Kaggle Walmart Sales Forecasting Competition. This dataset contains sales transactions from three different branches of Walmart, respectively located in Mandalay, Yangon, and Naypyitaw. The data contains 17 columns and 1000 rows:
| Column                   | Description                              
|--------------------------|-----------------------------------------
| invoice_id               | Invoice of the sales made               |
| branch                   | Branch at which sales were made         |
| city                     | The location of the branch              |
| customer_type            | The type of the customer                |
| gender                   | Gender of the customer making purchase  |
| product_line             | Product line of the product sold        |
| unit_price               | The price of each product               |
| quantity                 | The amount of the product sold          |
| VAT                      | The amount of tax on the purchase       |
| total                    | The total cost of the purchase          |
| date                     | The date on which the purchase was made |
| time                     | The time at which the purchase was made |
| payment_method           | The total amount paid                   |
| cogs                     | Cost Of Goods Sold                      |
| gross_margin_percentage  | Gross margin percentage                 |
| gross_income             | Gross Income                            |
| rating                   | Rating                                  |

## Product Analysis

Perform an analysis on the data to understand the various product lines, identify which product lines are performing best, and determine which ones need improvement.

## Sales Analysis

Analyze the sales data to identify trends and measure the effectiveness of each sales strategy. Use the results to determine what modifications are needed to increase sales.

## Customer Analysis

Conduct an analysis to uncover different customer segments, their purchase trends, and the profitability of each segment.

## Feature Engineering

- **Time of Day**: Add a new column named `time_of_day` to categorize sales into Morning, Afternoon, and Evening. This will provide insights into which part of the day generates the most sales.
- **Day of the Week**: Add a new column named `day_name` to record the day of the week (Mon, Tue, Wed, Thu, Fri) for each transaction. This will help determine which day of the week each branch is busiest.
- **Month of the Year**: Add a new column named `month_name` to indicate the month (Jan, Feb, Mar) of each transaction. This will help identify which month has the highest sales and profit.

## Exploratory Data Analysis (EDA)

Conduct exploratory data analysis to answer the project's key questions and objectives.

## Business Questions To Answer

### Generic Question

1. How many unique cities does the data have?
2. In which city is each branch?

### Product

3. What is the most selling product line?
4. What is the total revenue by month?
5. What month had the largest COGS?
6. What product line had the largest revenue?
7. What is the city with the largest revenue?
8. What product line had the largest VAT?
9. Which branch sold more products than average product sold?
10. What is the most common product line by gender?
11. What is the average rating of each product line?

### Customer

12. How many unique customer types does the data have?
13. How many unique payment methods does the data have?
14. What is the most common customer type?
15. Which customer type buys the most?
16. What is the gender of most of the customers?
17. What is the gender distribution per branch?
18. Which time of the day do customers give most ratings?
19. Which time of the day do customers give most ratings per branch?
20. Which day of the week has the best avg ratings?
21. Which day of the week has the best average ratings per branch?

### Sales

22. Number of sales made in each time of the day per weekday.
23. Which of the customer types brings the most revenue?
24. Which city has the largest tax percent/VAT (Value Added Tax)?
25. Which customer type pays the most in VAT?

## Revenue And Profit Calculations
 COGS = unit_price * quantity.
VAT = 5% * COGS.
total(gross_sales) = VAT + COGS.
grossProfit(grossIncome) = total(gross_sales) - COGS.
Gross Margin = (gross income / total revenue)  .
Unit Price = 45.79.
Quantity = 7.
COGS = 45.79 * 7 = 320.53.
VAT = 5% * COGS = 5% * 320.53 = 16.0265.
Total = VAT + COGS = 16.0265 + 320.53 = 336.5565.
Gross Margin Percentage = (gross income / total revenue) * 100 ≈ 4.76% . 

