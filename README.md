# Data Analysis & BI Project: Travel Insurance Sales
Data analysis project exploring a travel insurance company’s sales, agency and product performance, claims, and risk using MySQL and Power BI.

## 📎 Project Purpose 

This project was developed as part of a Data Analyst / Business Intelligence portfolio to demonstrate:

▪️End-to-end data analytics workflow.

▪️Strong SQL and relational modeling skills.

▪️Business-focused KPI analysis.

▪️Clear and actionable data visualization.

▪️Actionable insights to support data-driven decision-making.

## 🛠️ Tools & Technologies

MySQL – Data cleaning, transformation, normalization, and relational modeling.

SQL – Analytical queries and KPI calculations.

Power BI – Interactive dashboards and data storytelling.

DAX – Measures for sales, claims, commissions, and performance indicators.

## 📌 Project Overview

This project presents an end-to-end data analytics workflow, covering data cleaning, transformation, relational modeling, and visualization, applied to a travel insurance company during its first year of operations.

All data preparation and modeling were performed in MySQL, while Power BI was used to build interactive dashboards.

The objective is to deliver actionable business insights to support decisions related to agency management, product strategy, and risk optimization.

## 🗂️ Dataset Description

The dataset was sourced from a publicly available dataset on Kaggle and represents a third-party travel insurance servicing company based in Singapore. It includes information on:

▪️Travel insurance agencies and distribution channels

▪️Insurance products

▪️Travel duration and destinations

▪️Net sales and commissions

▪️Claim status (Yes / No) 

## 🧹 Data Cleaning & Modeling (MySQL) 

The raw CSV dataset was fully processed in MySQL, including:

▪️Data cleaning and standardization

▪️Handling missing and inconsistent values

▪️Creation of primary and foreign keys

▪️Normalization into relational tables

▪️Definition of relationships to enable analytical queries

Final Data Model:

The cleaned and structured database consists of:

▪️agencies: agency_id, agency_name, agency_type, distribution_channel

▪️products: product_id, product_name

▪️sales: sale_id, agency_id, product_id, claim_status, destination, duration, net_sales, commission

This relational model enables efficient analysis of sales, claims, commissions, and performance across agencies and products.

## 📈 Power BI Dashboard Structure 

The Power BI report is structured into the following sections:

1️⃣ Overview

Total Net Sales (≈ SGD 3M)

Total Policies Sold (63K)

Claim Rate (≈ 1.5%)

High-level assessment of overall business performance

2️⃣ Agency Performance

Sales volume and net revenue by agency

Claim rate comparison across agencies

Commission rate analysis

Identification of high-performing and high-risk agencies

3️⃣ Product Insights

Sales volume vs net revenue by product

Claim rate by product

Identification of profitable and high-risk insurance products

4️⃣ Conclusions & Recommendations

Key business KPIs

Top-performing segments

Lowest-performing and highest-risk segments

Strategic recommendations to improve profitability and risk control

## 🔍 Key Insights 

EPX is the top-performing agency, contributing ~45% of total net revenue and ~55% of total sales.

Overall claim volume remains low (~1.5%), indicating a healthy risk profile in the first year.

C2B combines high revenue with the highest claim rate, increasing operational risk.

CWT shows a very high commission rate (~75%), negatively impacting margins.

Products such as Annual Silver and Annual Gold Plans present elevated claim rates, while Cancellation Plan and 2 Way Comprehensive Plan show strong profitability with low risk.

## 🎯 Business Recommendations 

Strengthen focus on high-performing segments with strong revenue and low claim ratios.

Optimize high-risk agency relationships through stricter underwriting and commission renegotiation.

Improve product risk management by reassessing pricing, coverage, or segmentation for annual plans with high claim rates.


## ⚠️ Data Limitations & Assumptions 

- The analysis refers to the **first year of operations**, as no historical data was available for comparison. This assumption allows for benchmarking performance, but year-over-year trends cannot be assessed.
  
- No temporal breakdown (monthly or quarterly) is available; therefore, the analysis is performed on the dataset as a whole. If time-series data were available, it would be valuable to analyze trends, seasonality, and potential patterns across months.

- The dataset only includes **net sales and commission amounts**, without detailed information on operational costs, claim payouts, or margins.

- The **claim status variable is binary (Yes/No)** and does not include the monetary cost of claims. As a result, the analysis focuses on **claim frequency rather than claim severity**, and direct financial impact of claims could not be quantified.







