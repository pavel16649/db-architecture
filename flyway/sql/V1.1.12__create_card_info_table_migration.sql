CREATE TABLE IF NOT EXISTS card_info (
  player_id INTEGER NOT NULL,
  date_of_purchase TIMESTAMP NOT NULL,
  date_of_expire TIMESTAMP NOT NULL,
  CONSTRAINT fk_card_info_player FOREIGN KEY (player_id) REFERENCES players(id)
);

INSERT INTO card_info (player_id, date_of_purchase, date_of_expire)
SELECT
    (floor(random() * ${numPlayers} + 1)::int),
    faker.date_time_this_decade()::timestamp,
    faker.date_time_this_decade()::timestamp
FROM generate_series(1, ${numPlayers});
