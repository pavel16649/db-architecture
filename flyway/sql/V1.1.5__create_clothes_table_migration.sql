CREATE TABLE IF NOT EXISTS clothes (
  item_id SERIAL PRIMARY KEY,
  item_name VARCHAR(255) NOT NULL,
  description TEXT NOT NULL,
  price INTEGER NOT NULL,
  available BOOLEAN NOT NULL,
  type INTEGER NOT NULL,
  level_required INTEGER NOT NULL
);

INSERT INTO clothes (item_name, description, price, available, type, level_required)
SELECT
    faker.word(),
    faker.paragraph(),
    floor(random() * 1000 + 50)::int,
    TRUE,
    floor(random() * 6 + 1)::int, -- enum clothes_type values start from 1
    floor(random() * 70 + 1)::int
FROM generate_series(1, ${numClothes});