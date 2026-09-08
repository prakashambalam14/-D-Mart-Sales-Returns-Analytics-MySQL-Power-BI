# D-Mart Sales & Returns Analytics — MySQL & Power BI

An end-to-end retail analytics project built using **MySQL, SQL, and Power BI**.

The project covers database creation, relational data modeling, SQL business analysis, Power BI data modeling, DAX calculations, dashboard development, and Row-Level Security (RLS).

## Project Overview

The project analyzes:

- Sales and net sales
- Monthly sales trends
- Customer performance
- Product and category performance
- Branch and regional performance
- Payments
- Returns and return reasons
- Refund amounts
- Product price and discount segments
- Product expiry status

## Project Workflow

```text
MySQL Database
      ↓
ER Diagram & Relationships
      ↓
SQL Business Analysis
      ↓
Power BI Data Connection
      ↓
Data Modeling & Date Table
      ↓
DAX Measures & Calculated Columns
      ↓
3-Page Power BI Report
      ↓
Row-Level Security
```

## 1. MySQL Database

The database was designed as a relational database with **12 related tables**.

### Tables

| # | Table |
|---|---|
| 1 | Customers |
| 2 | Orders |
| 3 | Order Items |
| 4 | Products |
| 5 | Categories |
| 6 | Brands |
| 7 | Branches |
| 8 | Payments |
| 9 | Returns |
| 10 | Return Reasons |
| 11 | Reviews |
| 12 | Branch Status |

The tables are connected using primary keys and foreign keys. These relationships allow customer, order, product, branch, payment, return, and review data to be analyzed together.

### Database Creation

The complete database creation SQL is available in:

`SQL_FILES/dmart_database.sql`

This file contains the SQL required to create the database and its tables.

## 2. ER Diagram

The ER diagram documents the database structure and the relationships between the 12 tables.

Main relationships include:

```text
Customers
    ↓
Orders
    ↓
Order Items → Products → Categories
                    └→ Brands

Orders → Payments

Orders / Order Items
    ↓
Returns → Return Reasons

Branches → Branch Status

Customers → Reviews
Products  → Reviews
```

The complete ER diagram is available at:

`ER_DIAGRAM/DMART-ER.pdf`

## 3. SQL Business Analysis

Business questions were solved using the D-Mart database.

The SQL analysis includes:

- Customer sales and spending analysis
- Top customers
- Order-based customer analysis
- Branch revenue and return analysis
- Products that were never ordered
- Top-selling products
- Product ranking by category
- Monthly revenue analysis
- Month-over-month comparisons
- Previous-month sales analysis
- Return-rate analysis

### SQL Concepts Used

- SELECT, WHERE, GROUP BY, HAVING
- ORDER BY
- INNER JOIN and LEFT JOIN
- Subqueries
- CTEs
- CASE statements
- Aggregate functions
- Window functions
- RANK()
- Date functions
- Conditional aggregation

### Question-Based SQL

The SQL queries used to solve the business questions are available in:

`SQL_FILES/Question_Based_Query.sql`

The complete list of database questions and the corresponding analysis is available in:

`SQL_FILES/DATABASE_QA.pdf`

## 4. Power BI Report

The MySQL database was imported into Power BI and used to create a **3-page interactive report**.

### Report Pages

#### Page 1 — Sales Overview

Focuses on overall sales performance, revenue trends, orders, quantity sold, and key sales KPIs.

#### Page 2 — Customer & Product Analysis

Focuses on customer performance, customer value, product performance, categories, brands, price segments, discounts, and expiry analysis.

#### Page 3 — Returns & Branch Analysis

Focuses on returned items, return rate, refund amount, return reasons, branch performance, and regional analysis.

### Power BI Files

| File | Description |
|---|---|
| `POWERBI_FILES/Dmartdb.pbix` | Complete Power BI report |
| `POWERBI_FILES/Dmartdb.pdf` | Complete report exported as PDF |
| `POWERBI_FILES/dmart1st_page.png` | Page 1 report image |
| `POWERBI_FILES/dmart2nd_page.png` | Page 2 report image |
| `POWERBI_FILES/dmart3rd_page.png` | Page 3 report image |

## 5. Power BI Data Model

A dedicated **Date Dimension** table was created for time-based analysis.

The Power BI model connects data across:

- Customers
- Orders
- Order Items
- Products
- Categories
- Brands
- Branches
- Payments
- Returns
- Return Reasons
- Reviews
- Dates

The model supports filtering and analysis across different business dimensions.

## 6. DAX and Calculated Columns

DAX measures were created for KPIs and time-based analysis, including:

- Total Sales
- Net Sales
- Total Orders
- Average Order
- Total Quantity Sold
- Total Return Items
- Item Return Rate
- Month-over-Month (MoM)
- Year-over-Year (YoY)
- Previous Month Sales
- Total Refund Amount
- Total Sales per Customer

Calculated/new columns were also created for business categorization and analysis, including customer information, return flags, price and discount buckets, category information, expiry analysis, branch return information, and return reason information.

## 7. Row-Level Security

Power BI Row-Level Security was implemented to restrict branch data by region.

### North Region

- Delhi
- Gurugram
- Noida
- Jaipur
- Lucknow

### South Region

- Bangalore
- Hyderabad
- Chennai
- Nagpur

### West Region

- Mumbai
- Navi Mumbai
- Thane
- Pune
- Nashik
- Ahmedabad
- Surat
- Vadodara
- Indore
- Bhopal

Each regional role can view only the branches assigned to that region.

## 8. Repository Structure

```text
D-Mart-Sales-Returns-Analytics-MySQL-Power-BI/
│
├── ER_DIAGRAM/
│   ├── DMART-ER.pdf
│   └── main
│
├── POWERBI_FILES/
│   ├── Dmartdb.pbix
│   ├── Dmartdb.pdf
│   ├── bifiles
│   ├── dmart1st_page.png
│   ├── dmart2nd_page.png
│   └── dmart3rd_page.png
│
├── SQL_FILES/
│   ├── DATABASE_QA.pdf
│   ├── Question_Based_Query.sql
│   ├── dmart_database.sql
│   └── main.sql
│
└── README.md
```

## 9. Tools Used

| Tool | Purpose |
|---|---|
| MySQL | Database creation and SQL analysis |
| SQL | Business question analysis |
| Power BI | Data modeling and dashboards |
| DAX | Measures and calculations |
| Power Query | Data transformation |
| GitHub | Project documentation and version control |

## 10. Key Skills Demonstrated

### SQL & Database

- Relational database design
- Primary and foreign keys
- Table relationships
- Joins
- CTEs
- Window functions
- Aggregations
- Date-based analysis
- Business-oriented SQL queries

### Power BI

- Data modeling
- Power Query
- DAX
- Measures
- Calculated columns
- Date dimension
- Time intelligence
- Interactive dashboards
- KPI development
- Row-Level Security

## Project Summary

This project demonstrates a complete retail analytics workflow:

**Database Design → SQL Analysis → Power BI Data Modeling → DAX → Dashboard Development → RLS**

It combines the database, SQL analysis, Power BI report, ER diagram, and supporting project files in one repository.
