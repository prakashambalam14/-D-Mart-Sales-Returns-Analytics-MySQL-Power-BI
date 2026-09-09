# D-Mart Sales & Returns Analytics — MySQL & Power BI

An end-to-end retail analytics project built using **MySQL, SQL, and Power BI**.

The project covers database creation, ER modeling, SQL business analysis, Power BI data modeling, DAX calculations, interactive reporting, and Row-Level Security (RLS).

## Project Overview

The project analyzes:

- Sales and net sales
- Monthly sales and MoM performance
- Sales by category and branch
- Customer sales performance
- Price bucket sales
- Product expiry status
- Return items and return reasons
- Return-rate performance
- Refund amount
- Payment method sales
- Branch status and regional performance

## Project Workflow

```text
MySQL Database
      ↓
ER Diagram & Table Relationships
      ↓
SQL Business Questions
      ↓
Power BI Data Import
      ↓
Data Model & Date Dimension
      ↓
DAX Measures & Calculated Columns
      ↓
3-Page Power BI Report
      ↓
Row-Level Security
```

---

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

The tables are connected through primary keys and foreign keys to support analysis across customers, orders, products, branches, payments, returns, reviews, and related entities.

### Database SQL

The complete database creation SQL is available in:

`SQL_FILES/dmart_database.sql`

This file contains the SQL used to create the D-Mart database and its tables.

---

## 2. ER Diagram

The ER diagram shows the database structure and how the 12 tables are connected.

Key relationships include:

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

The complete ER diagram is available in:

`ER_DIAGRAM/DMART-ER.pdf`

---

## 3. SQL Business Analysis

The database was used to solve business questions related to customers, products, branches, sales, and returns.

### Analysis Covered

- Top customers by total spending
- Customers with multiple orders
- Branch revenue and return rates
- Products that were never ordered
- Top-selling products
- Product ranking within categories
- Monthly revenue
- Month-over-month sales comparison
- Previous-month sales
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

### SQL Files

**Database creation:**

`SQL_FILES/dmart_database.sql`

**Business-question queries:**

`SQL_FILES/Question_Based_Query.sql`

**Database questions and solved analysis:**

`SQL_FILES/DATABASE_QA.pdf`

---

# 4. Power BI Report

The MySQL database was imported into Power BI and developed into a **3-page D-Mart Sales & Returns report**.

The report contains the following pages.

## Page 1 — D-Mart Sales & Returns Overview

This page provides the main sales and returns overview.

### KPI Cards

- Total Sales — **1.90M**
- Net Sales — **1.79M**
- Average Order — **2.72K**
- Item Sold Quantity — **3.6K**
- Total Return Items — **252**
- Item Return Rate — **7.0%**

### Visuals

**Monthly Sales Analysis**
- Total sales by month
- Previous-month sales
- Month-over-month (MoM) percentage

**Sales by Category**
- Electronics & Appliances
- Home & Kitchen
- Pet Care
- Apparel & Footwear
- Baby Care

**Sales by Branch Location**
- Branch-level sales comparison including Delhi, Mumbai, Chennai, Bangalore, Vadodara, Pune, Bhopal, and Nashik

**Branch Performance Table**
- Branch name
- Total sales
- Item return rate
- Branch status

The page also includes year filters for **2024, 2025, and 2026**.

---

## Page 2 — Business Insights & Sales Analysis

This page provides deeper business insights based on sales, returns, customers, products, and pricing.

### Branches with High Return Rate

The page identifies branches with comparatively high item return rates and shows common return reasons.

Examples shown in the report include:

- Navi-Mumbai (Vashi) — **13.7%**
- Gurugram Sector 14 — **13.0%**
- Lucknow Gomti Nagar — **13.6%**
- Bhopal - MP Nagar — **9.8%**
- Nagpur Wardha Road — **9.8%**

Common return reasons shown include:

- Product not as described
- Damage product
- Missing parts
- Size issue
- Wrong item delivered
- Quality not satisfied
- Better price found elsewhere
- Late delivery
- Change of mind

### Least Category Sales

The report highlights:

1. Fruits & Vegetable
2. Snacks
3. Household Care
4. Beverages

### Price Bucket Sales

Sales are divided into:

- Cheap — **970K (51.0%)**
- Budget — **597K (31.4%)**
- Premium — **337K (17.7%)**

### Sales by Category Insights

The page highlights category-level purchasing patterns, including:

- Kitchen & Home
- Electronics & Appliances
- Pet Care

It also relates category sales to price segments and discount levels.

### Customer Sales Table

A customer-level sales table highlights customers with higher total sales, including:

- Pooja Ghosh — **41,090**
- Meera Kulkarni — **40,464**
- Swati Joshi — **37,465**
- Deepak Trivedi — **34,067**

### Return Improvement Recommendations

The report also contains recommendations focused on reducing common return problems, such as:

- Improve product quality
- Avoid damaged products
- Provide correct size availability
- Improve product descriptions
- Check missing parts
- Deliver the correct items

---

## Page 3 — Returns, Expiry & Payment Analysis

This page focuses on return performance, products approaching expiry, refunds, and payment methods.

### Products Expiring Within 50 Days

A day slicer from **0 to 50 days** is provided to identify products approaching expiry.

The report lists products and their remaining expiry days, including:

- Hindustan Unilever Baby Soap 3-Pack — 5 days
- Himalaya Baby Diapers Pack (L) — 8 days
- PepsiCo Green Tea 100g Pack — 10 days
- Tata Consumer Mango Drink 1L — 11 days
- Bikaji Cream Biscuits 150g — 23 days
- Everest Besan 1kg — 26 days
- Himalaya Baby Shampoo 200ml — 32 days
- Tata Consumer Sugar 1kg — 34 days
- Tata Consumer Poha 1kg — 38 days
- Hindustan Unilever Baby Diapers Pack (L) — 42 days
- Everest Garam Masala 100g — 46 days
- Haldiram's Namkeen Mix 400g — 48 days
- Everest Chana Dal 1kg — 49 days

The purpose is to identify stock that may need to be cleared before expiry.

### Return Analysis

- Total Return Items — **252**
- Total Refund Amount — **119K**

**Return items by reason:**

- Quality Not Satisfactory — 35
- Product Not as Described — 27
- Better Price Found Elsewhere — 25
- Other — 25
- Missing Parts — 23

### Payment Method Sales

Sales are shown by payment method:

- D-Mart Gift Card — **450K (23.62%)**
- Debit Card — **403K (21.19%)**
- Credit Card — **364K (19.09%)**
- Cash — **358K (18.8%)**
- UPI — **329K (17.3%)**

The page also highlights the observation that D-Mart Gift Card users have the highest sales among the displayed payment methods.

### Return Rate MoM

The page compares monthly return rate and total returned items for the available months, including:

- August — **12.50%**
- September — **16.67%**
- November — **20.00%**

---

## 5. Power BI Data Model

A dedicated **Date Dimension** was created in Power BI for time-based analysis.

The model supports analysis across:

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

The Date Dimension supports monthly analysis, MoM calculations, previous-month comparisons, year-based filtering, and other time-intelligence calculations.

---

## 6. DAX & Calculated Columns

DAX measures were created for KPI and analytical calculations, including:

- Total Sales
- Net Sales
- Total Orders
- Average Order
- Total Quantity Sold
- Total Return Items
- Item Return Rate
- MoM
- YoY
- Previous Month Sales
- Total Refund Amount
- Total Sales per Customer

Calculated/new columns were created to support business analysis, including:

- Customer information
- Customer value
- Return flag
- Date information
- Price bucket
- Discount bucket
- Category information
- Remaining days for expiry
- Branch return information
- Return reason information

---

## 7. Row-Level Security

Power BI Row-Level Security was implemented to restrict branch-level data by region.

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

Each regional role is configured to view only the branches assigned to that region.

---

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

---

## 9. Tools & Technologies

| Tool | Purpose |
|---|---|
| MySQL | Database creation |
| SQL | Business-question analysis |
| Power BI | Data modeling and reporting |
| DAX | Measures and calculations |
| Power Query | Data transformation |
| ER Diagram | Database structure and relationships |
| GitHub | Project documentation and version control |

---

## 10. Skills Demonstrated

### SQL & Database

- Relational database design
- Primary and foreign keys
- Table relationships
- Joins
- CTEs
- Window functions
- Aggregations
- Date functions
- Business-oriented SQL analysis

### Power BI

- Data modeling
- Power Query
- DAX
- Measures
- Calculated columns
- Date Dimension
- Time intelligence
- KPI development
- Interactive dashboards
- Row-Level Security

### Business Analytics

- Sales analysis
- Customer analysis
- Product and category analysis
- Branch analysis
- Return analysis
- Refund analysis
- Payment analysis
- Expiry-stock analysis
- Regional reporting

---

## Project Summary

This project demonstrates a complete retail BI workflow:

**Database Design → ER Modeling → SQL Business Analysis → Power BI Data Modeling → DAX → Dashboard Development → RLS**

The repository contains the complete database SQL, business-question queries, database Q&A document, ER diagram, Power BI report, PDF export, and individual dashboard page images.
