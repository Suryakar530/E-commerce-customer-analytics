-- ============================================================
-- E-COMMERCE CUSTOMER ANALYTICS
-- PostgreSQL SQL Analysis
-- ============================================================
--
-- Project: E-commerce Customer Analytics
-- Database: PostgreSQL
-- Main Table: customers
--
-- Analysis approach: Each business question is followed
-- immediately by the SQL query used to answer it.
--
-- Sections:
-- 1. Data Quality Check
-- 2. Customer Demographics Analysis
-- 3. Geographic & Customer Analysis
-- 4. Customer Segmentation
-- 5. Customer Acquisition Cost Analysis
-- 6. Advanced SQL
-- 7. Business Insights
--
-- ============================================================

-- ============================================================
-- 1. DATA QUALITY CHECK
-- ============================================================

-- 1.1. Total records and unique customers
--
-- Business Question:
-- Total records and unique customers

SELECT
    COUNT(*) AS total_customers,
    COUNT(DISTINCT customer_id) AS unique_customer_ids
FROM customers;

-- 1.2.check missing values
--
-- Business Question:
-- check missing values

SELECT
    COUNT(*) - COUNT(customer_id) AS missing_customer_id,
    COUNT(*) - COUNT(customer_name) AS missing_customer_name,
    COUNT(*) - COUNT(customer_age) AS missing_age,
    COUNT(*) - COUNT(gender) AS missing_gender,
    COUNT(*) - COUNT(customer_segment) AS missing_segment,
    COUNT(*) - COUNT(customer_city) AS missing_city,
    COUNT(*) - COUNT(customer_state) AS missing_state,
    COUNT(*) - COUNT(customer_country) AS missing_country,
    COUNT(*) - COUNT(region) AS missing_region,
    COUNT(*) - COUNT(customer_postal_code) AS missing_postal_code,
    COUNT(*) - COUNT(customer_acquisition_cost) AS missing_acquisition_cost
FROM customers;

-- 1.3. check duplicates
--
-- Business Question:
-- check duplicates

SELECT
    customer_id,
    COUNT(*) AS duplicate_count
FROM customers
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- 1.4.check age range of customers
--
-- Business Question:
-- check age range of customers

SELECT
    MIN(customer_age) AS minimum_age,
    MAX(customer_age) AS maximum_age,
    ROUND(AVG(customer_age), 2) AS average_age
FROM customers;

-- 1.5. acquisition_cost range
--
-- Business Question:
-- acquisition_cost range

SELECT
    MIN(customer_acquisition_cost) AS minimum_cost,
    MAX(customer_acquisition_cost) AS maximum_cost,
    ROUND(AVG(customer_acquisition_cost), 2) AS average_cost
FROM customers;

-- ============================================================
-- 2. CUSTOMER DEMOGRAPHICS ANALYSIS
-- ============================================================

-- 2.1: Gender Distribution
--
-- Business Question:
-- Gender Distribution

select
      gender,
	  count(customer_id)as no_of_customers
from customers
group by gender;

-- 2.2: Age Groups
--
-- Business Question:
-- Age Groups

SELECT
    CASE
        WHEN customer_age < 25 THEN 'low_age'
        WHEN customer_age BETWEEN 25 AND 34 THEN 'peak_age'
        WHEN customer_age BETWEEN 35 AND 44 THEN 'mid_age'
        WHEN customer_age BETWEEN 45 AND 54 THEN 'mature_age'
        ELSE 'high_age'
    END AS age_table,
    COUNT(customer_id) AS no_of_customers
FROM customers
GROUP BY
    CASE
        WHEN customer_age < 25 THEN 'low_age'
        WHEN customer_age BETWEEN 25 AND 34 THEN 'peak_age'
        WHEN customer_age BETWEEN 35 AND 44 THEN 'mid_age'
        WHEN customer_age BETWEEN 45 AND 54 THEN 'mature_age'
        ELSE 'high_age'
    END
ORDER BY no_of_customers DESC;

-- 2.3: Customer Segments
--
-- Business Question:
-- Customer Segments

SELECT
    customer_segment,
    COUNT(customer_id) AS no_of_customers
FROM customers
GROUP BY customer_segment
ORDER BY no_of_customers DESC;

-- 2.4: Find the number of customers for each combination of gender and customer segment.
--
-- Business Question:
-- Find the number of customers for each combination of gender and customer segment.

select
   gender,
   customer_segment,
   count(*) as no_of_customers
from customers
group by 1,2;

-- 2.5: How many customers belong to each country?
--
-- Business Question:
-- How many customers belong to each country?

select
customer_country,
count(*)as no_of_customer
from customers
group by 1
order by 2 desc;

-- ============================================================
-- 3. GEOGRAPHIC & CUSTOMER ANALYSIS
-- ============================================================

-- 3.1 :How many customers belong to each region?
--
-- Business Question:
-- How many customers belong to each region?

select region,
count(*)as total_customer
from customers
group by region;

-- 3.2 :Find the 10 city with the highest number of customers.
--
-- Business Question:
-- Find the 10 city with the highest number of customers.

select customer_city,
       count(*)as num_of_cus
	   from customers
	   group by 1
	   order by 2 desc
	   limit 10;

-- 3.3: Find the 10 state with the highest number of customers.
--
-- Business Question:
-- Find the 10 state with the highest number of customers.

select customer_state,
       count(*)as num_of_cus
	   from customers
	   group by 1
	   order by 2 desc
	   limit 10;

-- 3.4:Find the number of customers for each combination of region and customer segment.
--
-- Business Question:
-- Find the number of customers for each combination of region and customer segment.

SELECT
    region,
    customer_segment,
    COUNT(*) AS num_of_customers
FROM customers
GROUP BY 1, 2
ORDER BY 1, 2;

-- 3.5:What is the average customer age for each region?
--
-- Business Question:
-- What is the average customer age for each region?

SELECT
    region,
    ROUND(AVG(customer_age), 2) AS average_age
FROM customers
GROUP BY region
ORDER BY average_age DESC;

-- 3.6:What is the average customer acquisition cost for each region?
--
-- Business Question:
-- What is the average customer acquisition cost for each region?

select
     region,
	 round(avg(customer_acquisition_cost),2)as acquisition_cost
	 FROM customers
GROUP BY region;

-- 3.7: Which region has the highest average customer acquisition cost?
--
-- Business Question:
-- Which region has the highest average customer acquisition cost?

select
     region,
	 round(avg(customer_acquisition_cost),2)as acquisition_cost
	 FROM customers
GROUP BY region
order by 2 desc
limit 1;

-- ============================================================
-- 4. CUSTOMER SEGMENTATION
-- ============================================================

-- 4.1: Customers by Segment
--
-- Business Question:
-- Customers by Segment

SELECT
    customer_segment,
    COUNT(*) AS total_customers
FROM customers
GROUP BY customer_segment
ORDER BY total_customers DESC;

-- 4.2: Average by segment
--
-- Business Question:
-- Average by segment

SELECT
    customer_segment,
    ROUND(AVG(customer_age), 2) AS average_age
FROM customers
GROUP BY customer_segment
ORDER BY average_age DESC;

-- 4.3: Average Acquisition Cost by Segment
--
-- Business Question:
-- Average Acquisition Cost by Segment

SELECT
    customer_segment,
    ROUND(AVG(customer_acquisition_cost), 2) AS avg_acquisition_cost
FROM customers
GROUP BY customer_segment
ORDER BY avg_acquisition_cost DESC;

-- 4.5: Segment with Highest Number of Customers
--
-- Business Question:
-- Segment with Highest Number of Customers

SELECT
    customer_segment,
    COUNT(*) AS total_customers
FROM customers
GROUP BY customer_segment
ORDER BY total_customers DESC
LIMIT 1;

-- 4.6: Segment with Highest Average Acquisition Cost
--
-- Business Question:
-- Segment with Highest Average Acquisition Cost

SELECT
    customer_segment,
    ROUND(AVG(customer_acquisition_cost), 2) AS avg_acquisition_cost
FROM customers
GROUP BY customer_segment
ORDER BY avg_acquisition_cost DESC
LIMIT 1;

-- ============================================================
-- 5. CUSTOMER ACQUISITION COST ANALYSIS
-- ============================================================

-- 5.1: What is the minimum, maximum, and average customer acquisition cost?
--
-- Business Question:
-- What is the minimum, maximum, and average customer acquisition cost?

select
min(customer_acquisition_cost)as min_cost,
max(customer_acquisition_cost)as max_cost,
round(avg(customer_acquisition_cost),2)as avg_cost
from customers;

-- 5.2: Average Cost by Customer Segment
--
-- Business Question:
-- Average Cost by Customer Segment

SELECT
    customer_segment,
    ROUND(AVG(customer_acquisition_cost), 2) AS avg_acquisition_cost
FROM customers
GROUP BY customer_segment
ORDER BY avg_acquisition_cost DESC;

-- 5.3: Average Cost by Gender
--
-- Business Question:
-- Average Cost by Gender

SELECT
    gender,
    ROUND(AVG(customer_acquisition_cost), 2) AS avg_acquisition_cost
FROM customers
GROUP BY gender
ORDER BY avg_acquisition_cost DESC;

-- 5.4: Average Cost by Region
--
-- Business Question:
-- Average Cost by Region

SELECT
    region,
    ROUND(AVG(customer_acquisition_cost), 2) AS avg_acquisition_cost
FROM customers
GROUP BY region
ORDER BY avg_acquisition_cost DESC;

-- 5.5: Top 10 Customers by Acquisition Cost
--
-- Business Question:
-- Top 10 Customers by Acquisition Cost

SELECT
    customer_id,
    customer_name,
    customer_acquisition_cost
FROM customers
ORDER BY customer_acquisition_cost DESC
LIMIT 10;

-- 5.6: 10 Customers with Lowest Acquisition Cost
--
-- Business Question:
-- 10 Customers with Lowest Acquisition Cost

SELECT
    customer_id,
    customer_name,
    customer_acquisition_cost
FROM customers
ORDER BY customer_acquisition_cost
LIMIT 10;

-- 5.7: Which customer segment has the highest average acquisition cost?
--
-- Business Question:
-- Which customer segment has the highest average acquisition cost?

 select
      customer_segment,
      round(avg(customer_acquisition_cost),2)as avg_acquisition_cost
     from customers
 group by 1
 order by 2 desc
 limit 1;

-- ============================================================
-- 6. ADVANCED SQL
-- ============================================================

-- 6.1: Customers Above Overall Average Acquisition Cost
--
-- Business Question:
-- Customers Above Overall Average Acquisition Cost

SELECT
    customer_id,
    customer_name,
    customer_segment,
    customer_acquisition_cost
FROM customers
WHERE customer_acquisition_cost > (
    SELECT AVG(customer_acquisition_cost)
    FROM customers
)
ORDER BY customer_acquisition_cost DESC;

-- 6.2: Rank Customers by Acquisition Cost
--
-- Business Question:
-- Rank Customers by Acquisition Cost

SELECT
    customer_id,
    customer_name,
    customer_acquisition_cost,
    RANK() OVER (
        ORDER BY customer_acquisition_cost DESC
    ) AS cost_rank
FROM customers
ORDER BY cost_rank;

-- 6.3:Rank Customer Segments by Average Acquisition Cost
--
-- Business Question:
-- Rank Customer Segments by Average Acquisition Cost

SELECT
    customer_segment,
    ROUND(AVG(customer_acquisition_cost), 2) AS avg_acquisition_cost,
    RANK() OVER (
        ORDER BY AVG(customer_acquisition_cost) DESC
    ) AS segment_rank
FROM customers
GROUP BY customer_segment
ORDER BY segment_rank;

-- 6.4: Rank Regions by Customer Count
--
-- Business Question:
-- Rank Regions by Customer Count

select
    region,
	rank() over(order by count(*) desc)as rank_customers
	from customers
	group by region;

-- 6.5: Top 3 Cities Within Each Region
--
-- Business Question:
-- Top 3 Cities Within Each Region

WITH city_counts AS (
    SELECT
        region,
        customer_city,
        COUNT(*) AS total_customers
    FROM customers
    GROUP BY region, customer_city
),
ranked_cities AS (
    SELECT
        region,
        customer_city,
        total_customers,
        RANK() OVER (
            PARTITION BY region
            ORDER BY total_customers DESC
        ) AS city_rank
    FROM city_counts
)
SELECT
    region,
    customer_city,
    total_customers,
    city_rank
FROM ranked_cities
WHERE city_rank <= 3
ORDER BY region, city_rank;

-- 6.6: Highest Acquisition-Cost Customer in Each Segment
--
-- Business Question:
-- Highest Acquisition-Cost Customer in Each Segment

WITH ranked_customers AS (
    SELECT
        customer_id,
        customer_name,
        customer_segment,
        customer_acquisition_cost,
        RANK() OVER (
            PARTITION BY customer_segment
            ORDER BY customer_acquisition_cost DESC
        ) AS customer_rank
    FROM customers
)
SELECT
    customer_id,
    customer_name,
    customer_segment,
    customer_acquisition_cost
FROM ranked_customers
WHERE customer_rank = 1
ORDER BY customer_segment;

-- 6.7: Region Percentage Contribution to Total Customers
--
-- Business Question:
-- Region Percentage Contribution to Total Customers

SELECT
    region,
    COUNT(*) AS total_customers,
    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (),
        2
    ) AS percentage_of_total
FROM customers
GROUP BY region
ORDER BY percentage_of_total DESC;

-- 6.8: Regions With Above-Average Acquisition Cost
--
-- Business Question:
-- Regions With Above-Average Acquisition Cost

WITH regional_cost AS (
    SELECT
        region,
        ROUND(AVG(customer_acquisition_cost), 2) AS avg_acquisition_cost
    FROM customers
    GROUP BY region
)
SELECT
    region,
    avg_acquisition_cost
FROM regional_cost
WHERE avg_acquisition_cost > (
    SELECT AVG(avg_acquisition_cost)
    FROM regional_cost
)
ORDER BY avg_acquisition_cost DESC;

-- 6.9: This combines the major metrics:
--
-- Business Question:
-- This combines the major metrics:

--   Region
--   Customer segment
--   Customer count
--   Average age
--   Average acquisition cost
--   Ranking
WITH segment_summary AS (
    SELECT
        region,
        customer_segment,
        COUNT(*) AS total_customers,
        ROUND(AVG(customer_age), 2) AS average_age,
        ROUND(AVG(customer_acquisition_cost), 2) AS avg_acquisition_cost
    FROM customers
    GROUP BY region, customer_segment
)
SELECT
    region,
    customer_segment,
    total_customers,
    average_age,
    avg_acquisition_cost,
    RANK() OVER (
        ORDER BY total_customers DESC
    ) AS customer_count_rank,
    RANK() OVER (
        ORDER BY avg_acquisition_cost DESC
    ) AS acquisition_cost_rank
FROM segment_summary
ORDER BY customer_count_rank;

-- ============================================================
-- 7. BUSINESS INSIGHTS
-- ============================================================

-- 7.1: Which customer segment has the largest customer base?
--
-- Business Question:
-- Which customer segment has the largest customer base?

select
     customer_segment,
	 count(*)as no_of_customers
	 from customers
	group by 1
	order by 2 desc
	limit 1;

-- 7.2: Which customer segment has the highest average acquisition cost?
--
-- Business Question:
-- Which customer segment has the highest average acquisition cost?

select
    customer_segment,
	round(avg(customer_acquisition_cost),2)as avg_acquisition_cost
	 from customers
	 group by 1
	 order by 2 desc
	 limit 1;

-- 7.3: Region with largest customer base
--
-- Business Question:
-- Region with largest customer base

SELECT
    region,
    COUNT(*) AS no_of_customers
FROM customers
GROUP BY region
ORDER BY no_of_customers DESC
LIMIT 1;

-- 7.4: Region with highest average acquisition cost
--
-- Business Question:
-- Region with highest average acquisition cost

SELECT
    region,
    ROUND(AVG(customer_acquisition_cost), 2) AS avg_acquisition_cost
FROM customers
GROUP BY region
ORDER BY avg_acquisition_cost DESC
LIMIT 1;

-- 7.5: City with the largest customer base
--
-- Business Question:
-- City with the largest customer base

SELECT
    customer_city,
    COUNT(*) AS no_of_customers
FROM customers
GROUP BY customer_city
ORDER BY no_of_customers DESC
LIMIT 1;

-- 7.6: State with the largest customer base
--
-- Business Question:
-- State with the largest customer base

SELECT
    customer_state,
    COUNT(*) AS no_of_customers
FROM customers
GROUP BY customer_state
ORDER BY no_of_customers DESC
LIMIT 1;

-- 7.7: Which segment has both high customers and high acquisition cost?
--
-- Business Question:
-- Which segment has both high customers and high acquisition cost?

SELECT
    customer_segment,
    COUNT(*) AS no_of_customers,
    ROUND(AVG(customer_acquisition_cost), 2) AS avg_acquisition_cost
FROM customers
GROUP BY customer_segment
ORDER BY no_of_customers DESC, avg_acquisition_cost DESC;

-- 7.8: Which region contributes the highest percentage of customers?
--
-- Business Question:
-- Which region contributes the highest percentage of customers?

SELECT
    region,
    COUNT(*) AS total_customers,
    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (),
        2
    ) AS percentage_of_total
FROM customers
GROUP BY region
ORDER BY percentage_of_total DESC
LIMIT 1;

-- 7.9: final Business Summary
--
-- Business Question:
-- final Business Summary

SELECT
    region,
    customer_segment,
    COUNT(*) AS total_customers,
    ROUND(AVG(customer_age), 2) AS average_age,
    ROUND(AVG(customer_acquisition_cost), 2) AS avg_acquisition_cost
FROM customers
GROUP BY region, customer_segment
ORDER BY total_customers DESC;
