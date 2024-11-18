CREATE TABLE IF NOT EXISTS quests (
  quest_id SERIAL PRIMARY KEY,
  quest_name VARCHAR(255) NOT NULL,
  description TEXT NOT NULL,
  level_required INTEGER NOT NULL,
  reward INTEGER NOT NULL,
  quest_location INTEGER NOT NULL,
  CONSTRAINT fk_quests_location FOREIGN KEY (quest_location) REFERENCES locations(location_id)
);

INSERT INTO quests (quest_name, description, level_required, reward, quest_location)
SELECT
    faker.word(),
    faker.paragraph(),
    floor(random() * 100 + 1)::int,
    floor(random() * 200 + 10)::int,
    (floor(random() * ${numLocations} + 1)::int)
FROM generate_series(1, ${numQuests});
