create database Projects;
-- selecting the table
select * from  sales_data;

-- 2.	Identify and handle missing values in critical columns
select * from sales_data where Units_sold is null or Sale_price is null or Sales is null or Profit is null
or Year is null;

-- 3.	Data Standardization
update sales_data set Discounts = replace(Discounts,'$','');
update sales_data set Discounts = replace(Discounts,',','');
update sales_data set Discounts = replace(Discounts,'.','');

-- 1.	What is the total sales revenue for each year?
select Year, sum(sales) as Total_sales from sales_data group by Year order by Total_sales desc;

-- 2.	Which countries contribute the most to gross sales?
SELECT 
    country, SUM(Gross_sales) AS Total_Gross_sales
FROM
    sales_data
GROUP BY country
ORDER BY Total_Gross_sales desc;

-- 3.	Which segments (e.g., Government, Midmarket) generate the most profit?
SELECT 
    segment, SUM(profit) AS Total_profit
FROM
    sales_data
GROUP BY segment
ORDER BY Total_profit DESC;

-- 4.	Which products have the highest units sold?
SELECT 
    product, SUM(Units_Sold) Total_unit_sold
FROM
    sales_data
GROUP BY product
ORDER BY Total_unit_sold DESC;