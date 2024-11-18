CREATE TABLE IF NOT EXISTS players (
  id SERIAL PRIMARY KEY,
  username VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  registration_date TIMESTAMP NOT NULL,
  level INTEGER NOT NULL,
  balance INTEGER NOT NULL,
  current_location INTEGER NOT NULL,
  CONSTRAINT fk_players_location FOREIGN KEY (current_location) REFERENCES locations(location_id)
);

INSERT INTO players (username, password, email, registration_date, level, balance, current_location)
SELECT
    faker.word(),
    faker.password(),
    faker.email(),
    faker.date_time_this_century()::timestamp,
    floor(random() * 100 + 1)::int,
    floor(random() * 10000 + 10)::int,
    floor(random() * 10 + 1)::int
FROM generate_series(1, ${numPlayers});
