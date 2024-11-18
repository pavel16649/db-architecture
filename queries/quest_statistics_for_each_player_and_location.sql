SELECT p.id AS player_id, q.quest_location AS location_id, COUNT(qp.quest_id) AS completed_quests
FROM players p
         CROSS JOIN (SELECT DISTINCT quest_id, quest_location FROM quests) q
         LEFT JOIN quest_progress qp ON p.id = qp.player_id AND qp.is_completed = true AND qp.quest_id = q.quest_id
GROUP BY p.id, q.quest_location
ORDER BY p.id, q.quest_location;
