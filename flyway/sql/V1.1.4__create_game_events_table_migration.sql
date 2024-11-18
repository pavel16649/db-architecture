CREATE TABLE IF NOT EXISTS game_events (
  event_id SERIAL PRIMARY KEY,
  event_name VARCHAR(255) NOT NULL,
  description TEXT NOT NULL,
  event_date TIMESTAMP NOT NULL
);

INSERT INTO game_events (event_name, description, event_date)
SELECT
    faker.word(),
    faker.paragraph(),
    TIMESTAMP '2020-01-01' + random() * INTERVAL '1 year'
FROM generate_series(1, ${numGameEvents}) AS gs(i);
