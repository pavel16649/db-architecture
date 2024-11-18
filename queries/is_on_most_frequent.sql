SELECT DISTINCT ON (c.type) c.type, c.item_name, COUNT(*) AS frequency
FROM clothes c
         JOIN available_clothes ac ON c.item_id = ac.item_id
WHERE ac.is_on = true
GROUP BY c.type, c.item_name
ORDER BY c.type, frequency DESC;
