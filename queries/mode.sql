SELECT balance, COUNT(*) as frequency
FROM players
GROUP BY balance
ORDER BY frequency DESC
LIMIT 1;
