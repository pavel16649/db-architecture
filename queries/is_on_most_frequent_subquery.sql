SELECT DISTINCT ON (c.type) c.type, c.item_name, COUNT(*) AS frequency
FROM clothes c
         JOIN (SELECT item_id FROM available_clothes WHERE is_on = true) ac ON c.item_id = ac.item_id
GROUP BY c.type, c.item_name
ORDER BY c.type, frequency DESC;
