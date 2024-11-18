WITH counts AS (
    SELECT balance, COUNT(*) OVER (PARTITION BY balance) AS frequency
    FROM players
)
SELECT balance, frequency
FROM counts
ORDER BY frequency DESC
LIMIT 1;
