# Ecommerce Profitability Analysis
#1- Total Sales by Region
create database dbecoms;
use dbecoms;
select region,sum(sales)as Total_Sales 
from ecommerce group by region;

#2- Total Sales by Category 
use dbecoms;
select category,sum(sales) as Total_Sales 
from ecommerce group by category;

#3- Top Customers 
use dbecoms;
select * from(
select customer_id,sum(sales) as Total_Sales,
dense_rank()over(order by sum(sales)desc) as SalesRankings 
from ecommerce group by customer_id)t 
where SalesRankings<=3;

#4- Monthly Trend 
use dbecoms;
select year(order_date) as Year,month(order_date) as Month,
sum(sales) as Total_Sales from ecommerce 
group by year(order_date),month(order_date);

#5- Rank Customers 
use dbecoms;
select customer_id,sum(sales)as Total_Sales,
dense_rank()over(order by sum(sales)desc) as SalesRankings 
from ecommerce group by customer_id;

#6- Row_Number per customer 
use dbecoms;
select customer_id,order_id,order_date,sum(sales) as Total_Sales 
,row_number()over(partition by customer_id order by order_date desc) as CustomerRankings
from ecommerce 
group by customer_id,order_id,order_date;






