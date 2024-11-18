CREATE TABLE IF NOT EXISTS furniture (
  item_id SERIAL PRIMARY KEY,
  item_name VARCHAR(255) NOT NULL,
  description TEXT NOT NULL,
  price INTEGER NOT NULL,
  available BOOLEAN NOT NULL,
  place_type INTEGER NOT NULL,
  level_required INTEGER NOT NULL
);

INSERT INTO furniture (item_name, description, price, available, place_type, level_required)
SELECT
    faker.word(),
    faker.paragraph(),
    floor(random() * 1000 + 50)::int,
    TRUE,
    floor(random() * 4 + 1)::int,
    floor(random() * 70 + 1)::int
FROM generate_series(1, ${numFurniture}) AS gs(i);
