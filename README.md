# E-Commerce Customer Analytics

## Project Overview

This project analyzes an e-commerce customer dataset using **PostgreSQL** and **Microsoft Power BI**.

## 📊 Power BI Dashboard

[E-Commerce Customer Analytics Dashboard](E_Commerce_Customer_Analytics_Dashboard.png)

The objective is to explore customer demographics, geographic distribution, customer segments, and acquisition costs, and convert the analysis into meaningful business insights.

The project combines **SQL data analysis** with an interactive **Power BI dashboard** to provide a complete customer analytics solution.

## Business Objective

The main objectives of this project are:

- Analyze customer demographics
- Understand customer distribution across regions and cities
- Identify customer segments
- Analyze customer acquisition costs
- Compare acquisition costs across regions and segments
- Identify high-value and high-acquisition-cost customers
- Apply advanced SQL techniques for deeper analysis
- Present key findings through an interactive Power BI dashboard

##  Tools & Technologies

- **PostgreSQL** – Data analysis and SQL querying
- **Microsoft Power BI** – Interactive dashboard and visualization
- **SQL** – Data exploration, aggregation, CTEs, subqueries, window functions
- **GitHub** – Project documentation and version control

##  Dataset

The analysis is based on an e-commerce customer dataset containing customer-level information.

Key fields used in the analysis include:

- Customer ID
- Customer Age
- Gender
- Region
- City
- Customer Segment
- Customer Acquisition Cost

The dataset contains approximately **25,000 customers**

#  SQL Analysis

The PostgreSQL analysis is organized into the following sections:

### 1. Data Quality Check

The project begins with basic data-quality checks to understand the dataset and identify potential issues.

Examples include:

- Total customer records
- Duplicate customer IDs
- Missing values
- Data validation

### 2. Customer Demographics Analysis

This section analyzes customer characteristics such as:

- Gender distribution
- Age distribution
- Customer age groups
- Customer counts by demographic categories

Example business question:

> How are customers distributed across different demographic groups?

### 3. Geographic & Customer Analysis

This section explores customer distribution geographically.

Analysis includes:

- Customers by region
- Customers by city
- Top cities by customer count
- Average customer age by region
- Regional customer comparisons

Example business question:

> Which regions and cities have the highest concentration of customers?

### 4. Customer Segmentation

Customers are analyzed according to their assigned customer segments.

Analysis includes:

- Customer count by segment
- Average age by segment
- Gender distribution by segment
- Segment-level customer characteristics

Example business question:

> Which customer segments contain the largest number of customers?

### 5. Customer Acquisition Cost Analysis

Customer acquisition cost is analyzed across different customer groups.

Analysis includes:

- Average acquisition cost
- Minimum and maximum acquisition cost
- Acquisition cost by region
- Acquisition cost by customer segment
- Highest acquisition-cost customers

Example business question:

> Which regions and customer segments have the highest average acquisition cost?

### 6. Advanced SQL Analysis

Advanced SQL techniques were used to answer more complex business questions.

Techniques include:

- `CTE`
- `RANK()`
- `PARTITION BY`
- Window Functions
- Subqueries
- Aggregations
- Conditional logic using `CASE`
- Percentage calculations
- Top-N analysis

Examples include:

- Ranking customers by acquisition cost
- Ranking customer segments
- Ranking regions
- Finding the top cities within each region
- Identifying the highest-acquisition-cost customer within each segment

#  Power BI Dashboard

The SQL analysis was converted into an interactive Power BI dashboard.

### Key Dashboard KPIs

 KPI Value :
 Total Customers is 25,000 
 Average Customer Age is 45.91 
 Average Acquisition Cost is 42.16 
 Maximum Acquisition Cost is 79.99 

### Dashboard Analysis

The dashboard provides visual analysis of:

- Customer distribution by region
- Customer distribution by segment
- Average acquisition cost by segment
- Gender distribution
- Customer segmentation
- Key customer metrics

#  Key Business Insights

The analysis helps answer important business questions such as:

- Which customer segments represent the largest customer base?
- Which regions contribute the most customers?
- Which cities have the highest customer concentration?
- Which customer segments have higher acquisition costs?
- Which regions have higher average acquisition costs?
- Which customers have exceptionally high acquisition costs?
- How do customer demographics differ across segments and regions?

These insights can help businesses improve:

- Customer targeting
- Marketing strategies
- Customer segmentation
- Regional marketing decisions
- Customer acquisition strategies
- Marketing budget allocation



