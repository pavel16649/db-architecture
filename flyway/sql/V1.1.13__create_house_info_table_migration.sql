CREATE TABLE IF NOT EXISTS house_info (
  player_id INTEGER NOT NULL,
  type INTEGER NOT NULL,
  has_garage BOOLEAN NOT NULL,
  CONSTRAINT fk_house_info_player FOREIGN KEY (player_id) REFERENCES players(id)
);

INSERT INTO house_info (player_id, type, has_garage)
SELECT
    (floor(random() * ${numPlayers} + 1)::int),
    floor(random() * 6 + 1)::int, -- enum house_type values start from 1
    (floor(random() * 2)::int)::boolean
FROM generate_series(1, ${numPlayers});
