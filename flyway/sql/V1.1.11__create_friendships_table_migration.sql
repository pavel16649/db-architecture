CREATE TABLE IF NOT EXISTS friendships (
  friendship_id SERIAL PRIMARY KEY,
  player1_id INTEGER NOT NULL,
  player2_id INTEGER NOT NULL,
  friendship_date TIMESTAMP NOT NULL,
  CONSTRAINT fk_friendships_player1 FOREIGN KEY (player1_id) REFERENCES players(id),
  CONSTRAINT fk_friendships_player2 FOREIGN KEY (player2_id) REFERENCES players(id)
);

INSERT INTO friendships (player1_id, player2_id, friendship_date)
SELECT
    (floor(random() * ${numPlayers} + 1)::int),
    (floor(random() * ${numPlayers} + 1)::int),
    faker.date_time_this_decade()::timestamp
FROM generate_series(1, ${numFriendships});
