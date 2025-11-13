USE stock_market;

-- ======================================================
-- 1. TREND ANALYSIS (Percentage Change)
-- ======================================================
SELECT 'Eicher Motors' AS Stock, ((MAX(Closing_Price) - MIN(Closing_Price)) / MIN(Closing_Price)) * 100 AS Pct_Change FROM eicher_motors
UNION ALL
SELECT 'Bajaj Auto', ((MAX(Closing_Price) - MIN(Closing_Price)) / MIN(Closing_Price)) * 100 FROM bajaj_auto
UNION ALL
SELECT 'TCS', ((MAX(Closing_Price) - MIN(Closing_Price)) / MIN(Closing_Price)) * 100 FROM tcs
UNION ALL
SELECT 'TVS Motors', ((MAX(Closing_Price) - MIN(Closing_Price)) / MIN(Closing_Price)) * 100 FROM tvs_motors
UNION ALL
SELECT 'Hero Motocorp', ((MAX(Closing_Price) - MIN(Closing_Price)) / MIN(Closing_Price)) * 100 FROM hero_motocorp
UNION ALL
SELECT 'Infosys', ((MAX(Closing_Price) - MIN(Closing_Price)) / MIN(Closing_Price)) * 100 FROM infosys;

--