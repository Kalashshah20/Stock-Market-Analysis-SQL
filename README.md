# Stock Market Analysis with SQL

![Tech](https://img.shields.io/badge/Technology-MySQL-blue.svg)

## 1. Project Overview

This project analyzes historical stock data for six major companies (Eicher Motors, Bajaj Auto, TCS, TVS Motors, Hero Motocorp, and Infosys). The primary objective is to use SQL to perform a comprehensive analysis, including data cleaning, transformation, and insight generation.

The analysis identifies long-term trends, volatility, and potential buy/sell signals based on historical performance.

## 2. Technology Used

* **Database:** MySQL
* **Language:** SQL
* **Tools:** MySQL Workbench (for data import and querying)

## 3. Project Workflow

1.  **Data Loading:** Imported 6 separate CSV files (one for each company) into a new `stock_market` database in MySQL using the Table Data Import Wizard.
2.  **Data Cleaning (ETL):**
    * **Standardized Column Names:** Renamed various closing price columns (e.g., `Close Price`, `Close`) to a single standard: `Closing_Price`.
    * **Fixed Date Formats:** Transformed non-standard text dates (like `15-Jan-2015` and `31-July-2018`) into a SQL-readable `YYYY-MM-DD` format using `STR_TO_DATE()` and `COALESCE()`.
3.  **Data Analysis:** Ran complex SQL queries to aggregate and compare the cleaned data. This involved extensive use of `UNION ALL` to combine results from the 6 tables, as well as `MAX()`, `MIN()`, and `AVG()` functions.

## 4. Key Insights (from the Analysis)

* **Highest Potential Growth:** **TVS Motors** showed the highest volatility and profit potential, with a **+267.74%** gain from its lowest price to its highest.
* **Strong Performers:** **Infosys (+166.35%)** and **Eicher Motors (+128.95%)** also demonstrated significant potential returns.
* **Lower Growth:** **Bajaj Auto (+74.90%)** and **Hero Motocorp (+77.53%)** showed the least growth from their min-to-max prices in this dataset.

## 5. Files in this Repository

1.  **`Stock_Analysis_Report.pdf`**
    * The final, shareable PDF report that summarizes the project's findings and provides clear buy/sell recommendations.

2.  **`Assignment_Solutions.sql`**
    * The complete, commented SQL script used for all analysis. This includes queries for Trend Analysis, Max/Min Prices, and Buy/Sell Signal generation.
