CREATE TABLE IF NOT EXISTS locations (
  location_id SERIAL PRIMARY KEY,
  location_name VARCHAR(255) NOT NULL,
  location_description TEXT NOT NULL
);

INSERT INTO locations (location_name, location_description)
SELECT
    faker.word(),
    faker.paragraph()
FROM generate_series(1, ${numLocations});
