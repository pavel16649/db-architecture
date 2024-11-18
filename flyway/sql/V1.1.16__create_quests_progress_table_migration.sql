CREATE TABLE IF NOT EXISTS quest_progress (
  quest_id INTEGER NOT NULL,
  player_id INTEGER NOT NULL,
  is_completed BOOLEAN NOT NULL,
  CONSTRAINT fk_quest_progress_quest FOREIGN KEY (quest_id) REFERENCES quests(quest_id),
  CONSTRAINT fk_quest_progress_player FOREIGN KEY (player_id) REFERENCES players(id)
);

INSERT INTO quest_progress (quest_id, player_id, is_completed)
SELECT
    (floor(random() * ${numQuests} + 1)::int),
    (floor(random() * ${numPlayers} + 1)::int),
    (floor(random() * 2)::int)::boolean
FROM generate_series(1, ${numQuestsProgress});
