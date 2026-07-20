-- Databricks notebook source

SELECT * FROM retail_sales.retail.retail_sales_data;---to see what I have in the data

Shift + L---Adding numbering

-- Checking for duplicates
SELECT `Customer ID`,
COUNT(*) AS Duplicate_count
FROM retail_sales.retail.retail_sales_data
GROUP BY `Customer ID`
ORDER BY duplicate_count DESC;


SELECT 
    SUM(`Total Amount`) AS `total revenue`
    FROM retail_sales.retail.retail_sales_data;
  
  SELECT  
        DATE_FORMAT(`Date`, 'yyyy-MM') AS sale_month,
        CASE WHEN `Gender` IN ('Male') THEN 'Male' ELSE 'Female' END AS gender,
        SUM(`Total Amount`) AS month_revenue,
        COUNT(*) AS monthly_transactions
        FROM retail_sales.retail.retail_sales_data
        GROUP BY DATE_FORMAT(`Date`, 'yyyy-MM'), gender
        ORDER BY DATE_FORMAT(`Date`, 'yyyy-MM'), gender;

SELECT 
    `Product Category`,
    `Gender`,
    SUM(`Total Amount`) AS total_revenue,
    COUNT(*) AS total_transactions
FROM retail_sales.retail.retail_sales_data
GROUP BY `Product Category`, `Gender`
ORDER BY `Product Category`, total_revenue DESC;
