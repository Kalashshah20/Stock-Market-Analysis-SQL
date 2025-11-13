/*
=============================================================================
PROJECT: Stock Market Analysis with SQL
AUTHOR: Kalash Shah
DATE: 13-Nov-2025

DESCRIPTION:
This project analyzes historical data for six major companies:
Eicher Motors, Bajaj Auto, TCS, TVS Motors, Hero Motocorp, and Infosys.

The analysis focuses on:
1. Calculating percentage price changes (Trend Analysis).
2. Identifying the highest and lowest recorded prices (Volatility).
3. Generating Buy/Sell signals based on Moving Averages.

DATA CLEANING PERFORMED:
- Imported raw CSV data into MySQL.
- Standardized column names to 'Closing_Price'.
- Converted text-based dates (dd-mm-yyyy) to SQL Date format (yyyy-mm-dd).
=============================================================================
*/

USE stock_market;

-- ==========================================================================
-- 1. TREND ANALYSIS (Percentage Change)
-- ==========================================================================
-- DESCRIPTION: 
-- This query calculates the growth (or decline) percentage for each stock 
-- over the entire recorded period. 
-- Formula: ((Max_Price - Min_Price) / Min_Price) * 100
-- Logic: We use UNION ALL to combine the calculation results from 6 separate tables.

SELECT 'Eicher Motors' AS Stock_Name, 
       ((MAX(Closing_Price) - MIN(Closing_Price)) / MIN(Closing_Price)) * 100 AS Percentage_Change 
FROM eicher_motors
UNION ALL
SELECT 'Bajaj Auto', 
       ((MAX(Closing_Price) - MIN(Closing_Price)) / MIN(Closing_Price)) * 100 
FROM bajaj_auto
UNION ALL
SELECT 'TCS', 
       ((MAX(Closing_Price) - MIN(Closing_Price)) / MIN(Closing_Price)) * 100 
FROM tcs
UNION ALL
SELECT 'TVS Motors', 
       ((MAX(Closing_Price) - MIN(Closing_Price)) / MIN(Closing_Price)) * 100 
FROM tvs_motors
UNION ALL
SELECT 'Hero Motocorp', 
       ((MAX(Closing_Price) - MIN(Closing_Price)) / MIN(Closing_Price)) * 100 
FROM hero_motocorp
UNION ALL
SELECT 'Infosys', 
       ((MAX(Closing_Price) - MIN(Closing_Price)) / MIN(Closing_Price)) * 100 
FROM infosys;


-- ==========================================================================
-- 2. EXTREME VALUE ANALYSIS (Highs & Lows)
-- ==========================================================================
-- DESCRIPTION: 
-- This identifies the volatility of each stock by finding the lowest (MIN) 
-- and highest (MAX) closing prices ever recorded in the dataset.

SELECT 'Eicher Motors' AS Stock_Name, 
       MAX(Closing_Price) AS Highest_Price, 
       MIN(Closing_Price) AS Lowest_Price 
FROM eicher_motors
UNION ALL
SELECT 'Bajaj Auto', MAX(Closing_Price), MIN(Closing_Price) FROM bajaj_auto
UNION ALL
SELECT 'TCS', MAX(Closing_Price), MIN(Closing_Price) FROM tcs
UNION ALL
SELECT 'TVS Motors', MAX(Closing_Price), MIN(Closing_Price) FROM tvs_motors
UNION ALL
SELECT 'Hero Motocorp', MAX(Closing_Price), MIN(Closing_Price) FROM hero_motocorp
UNION ALL
SELECT 'Infosys', MAX(Closing_Price), MIN(Closing_Price) FROM infosys;


-- ==========================================================================
-- 3. GENERATING BUY / SELL SIGNALS
-- ==========================================================================
-- DESCRIPTION: 
-- This query creates a trading strategy using a Moving Average.
-- Logic: 
-- 1. Calculate the average price of the stock over the entire period.
-- 2. If the daily price is BELOW average, it's a 'BUY' opportunity (Undervalued).
-- 3. If the daily price is ABOVE average, it's a 'SELL' signal (Overvalued).
-- Note: Analyzing Bajaj Auto as the primary example.

SELECT 
    Date, 
    Closing_Price,
    CASE
        WHEN Closing_Price < (SELECT AVG(Closing_Price) FROM bajaj_auto) THEN 'BUY'
        WHEN Closing_Price > (SELECT AVG(Closing_Price) FROM bajaj_auto) THEN 'SELL'
        ELSE 'HOLD'
    END AS Signal_Recommendation
FROM bajaj_auto
ORDER BY Date DESC 
LIMIT 20; -- Showing the last 20 records for brevity