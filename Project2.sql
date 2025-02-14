create database GrosseryStore;
use GrosseryStore;
select * from supermarket_sales;
/* Basic Level */
/* 1. Retrieve all transcations for a specific branch (e.g., 'A'). */
select * from supermarket_sales
where Branch='A';

/*2 . Find the total revenue generated from each product line. */
 select productLine,round(sum(Total),2) as Total_Revenue
 from supermarket_sales
 group by ProductLine;
 
 /* 3.Count the number of transactions made by male and female customers */
 select Gender,count(Payment) as Count_Transactions
 from supermarket_sales
 group by Gender;
 
 /*4.List the unique payment methods used in the dataset.*/
 select distinct(Payment) as Unique_method
 from supermarket_sales;
 
 /* 5.Find the highest and lowest unit price of products sold. */
 select Max(UnitPrice) as Highest_price ,
 MIN(UnitPrice) as Lowest_price
 from supermarket_sales;
 
 /* Intermediate Level */
 /* 6.Get the average rating given by customers for each product line */
 
 select productLine,avg(Rating) as Average_Rating
 from supermarket_sales
 group by ProductLine;
 
 /*7.Find the top 3 cities with the highest total sales.*/
 
 select city,Max(total) as Highest_sales
 from supermarket_sales
 group by city
 limit 3;
 
 /*8.Retrieve the total number of sales transactions made in the morning (before 12 PM) and evening (after 12 PM).*/
use grosserystore;
select * from supermarket_sales;

with AllTranscation as (
SELECT 
    CASE WHEN TIME(`Time`) < '12:00:00' THEN 1 else 0 END AS Morning_Sales,
    CASE WHEN TIME(`Time`) >= '12:00:00' THEN 1 else 0 END AS Evening_Sales
FROM supermarket_sales)

select sum(Morning_Sales) as Morning_sales,sum(Evening_sales) as Evening_sales
from AllTranscation;

/* 9. Identify the customer type (Member/Normal) that contributes the most revenue. */

select customerType,sum(total) as Most_revenu_CustomerType
from supermarket_sales
group by customerType;

/* 9.Find the most frequently purchased product line. */

select productLine,count(*) MostFrequent_ProductLine
from supermarket_sales
group by ProductLine
order by MostFrequent_ProductLine desc;

/* Advance Level */
/* 10.Calculate the daily revenue trend, showing total sales for each date. */

select date,count(*) as DailyTrend
from supermarket_sales
group by date
order by date;

/* 11.Find the most popular payment method for each city. */

select Payment,city,count(*) as MostPayment_Method
from supermarket_sales
group by Payment,city
order by MostPayment_Method desc;

/* 12.Determine the average gross income percentage for each product line. */

select ProductLine,round(avg(GrossMarginPercentage),4) as Average_GrossIncome_Percentage
from supermarket_sales
group by ProductLine;

/* 13.Analyze the peak shopping hours by counting transactions per hour. */

select Extract(hour from time) as Hours,count(*) as Transactions
from supermarket_sales
group by Hours
order by Transactions desc;

/* 14.Compare sales performance across branches by calculating total revenue and average customer rating for each branch. */

select Branch,round(sum(total),4) as TotalRevenue,round(Avg(rating),0) as CustomerRating
from supermarket_sales
group by Branch
order by TotalRevenue desc;

/* 15. Find the month with the highest total sales. */

select extract(month from Date) as Month_Sales , sum(total) as TotalSales
from supermarket_sales 
group by Month_Sales;

/* 16. Identify the top 3 best-selling product lines based on quantity sold. */

select productLine,count(Quantity) as Sold
from supermarket_Sales
group by ProductLine
limit 3;












