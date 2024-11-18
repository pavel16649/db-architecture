CREATE TABLE IF NOT EXISTS messages (
  message_id SERIAL PRIMARY KEY,
  sender_id INTEGER NOT NULL,
  receiver_id INTEGER NOT NULL,
  sent_at TIMESTAMP NOT NULL,
  content TEXT NOT NULL,
  CONSTRAINT fk_messages_sender FOREIGN KEY (sender_id) REFERENCES players(id),
  CONSTRAINT fk_messages_receiver FOREIGN KEY (receiver_id) REFERENCES players(id)
);

INSERT INTO messages (sender_id, receiver_id, sent_at, content)
SELECT
    (floor(random() * ${numPlayers} + 1)::int),
    (floor(random() * ${numPlayers} + 1)::int),
    faker.date_time_this_year()::timestamp,
    faker.paragraph()
FROM generate_series(1, ${numMessages});
