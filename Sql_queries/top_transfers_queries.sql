-- Top 15 SQL Queries for Top 250 Transfers Dataset

-- 1. Top 10 most expensive transfers
SELECT TOP 10 Name, Team_from, Team_to, Transfer_fee
FROM top_transfers
ORDER BY Transfer_fee DESC;

-- 2. Club that spent the most money
SELECT TOP 1 Team_to, SUM(Transfer_fee) AS total_spent
FROM top_transfers
GROUP BY Team_to
ORDER BY total_spent DESC;

-- 3. Club that earned the most money
SELECT TOP 1 Team_from, SUM(Transfer_fee) AS total_earned
FROM top_transfers
GROUP BY Team_from
ORDER BY total_earned DESC;

-- 4. League that generated the most transfer income
SELECT TOP 1 League_from, SUM(Transfer_fee) AS total_generated
FROM top_transfers
GROUP BY League_from
ORDER BY total_generated DESC;

-- 5. League that spent the most money
SELECT TOP 1 League_to, SUM(Transfer_fee) AS total_spent
FROM top_transfers
GROUP BY League_to
ORDER BY total_spent DESC;

-- 6. Average transfer fee by position
SELECT Position, AVG(Transfer_fee) AS avg_fee
FROM top_transfers
GROUP BY Position
ORDER BY avg_fee DESC;

-- 7. Transfer fee by age groups
SELECT 
    CASE 
        WHEN Age < 21 THEN 'Under 21'
        WHEN Age BETWEEN 21 AND 25 THEN '21-25'
        WHEN Age BETWEEN 26 AND 30 THEN '26-30'
        ELSE 'Over 30'
    END AS age_group,
    AVG(Transfer_fee) AS avg_fee
FROM top_transfers
GROUP BY 
    CASE 
        WHEN Age < 21 THEN 'Under 21'
        WHEN Age BETWEEN 21 AND 25 THEN '21-25'
        WHEN Age BETWEEN 26 AND 30 THEN '26-30'
        ELSE 'Over 30'
    END
ORDER BY avg_fee DESC;

-- 8. Season with highest spending
SELECT TOP 1 Season, SUM(Transfer_fee) AS total
FROM top_transfers
GROUP BY Season
ORDER BY total DESC;

-- 9. Most transferred players (players with multiple transfers in dataset)
SELECT TOP 20 Name, COUNT(*) AS transfer_count
FROM top_transfers
GROUP BY Name
HAVING COUNT(*) > 1
ORDER BY transfer_count DESC;

-- 10. Clubs with most high-value transfers (Transfer Fee > 50M)
SELECT Team_to, COUNT(*) AS high_value_count
FROM top_transfers
WHERE Transfer_fee > 50000000
GROUP BY Team_to
ORDER BY high_value_count DESC;

-- 11. Most common position
SELECT TOP 1 Position, COUNT(*) AS frequency
FROM top_transfers
GROUP BY Position
ORDER BY frequency DESC;

-- 12. Highest 20 transfer fee per league (buying)
SELECT TOP 20 League_to, MAX(Transfer_fee) AS max_fee
FROM top_transfers
GROUP BY League_to
ORDER BY max_fee DESC;

-- 13. Highest 20 transfer fee paid by each club (buying)
SELECT TOP 20 Team_to, MAX(Transfer_fee) AS max_paid
FROM top_transfers
GROUP BY Team_to
ORDER BY max_paid DESC;

-- 14. Transfer count per buying Top 20 league
SELECT TOP 20 League_to, COUNT(*) AS transfer_count
FROM top_transfers
GROUP BY League_to
ORDER BY transfer_count DESC;

-- 15. Countries attracting the most players (Team_to_country)
SELECT TOP 10 Team_to, COUNT(*) AS player_count
FROM top_transfers
GROUP BY Team_to
ORDER BY player_count DESC;
