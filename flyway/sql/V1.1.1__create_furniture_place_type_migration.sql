CREATE TABLE IF NOT EXISTS furniture_place_type (
    furniture_place_type_id SERIAL PRIMARY KEY,
    furniture_place_type_name VARCHAR(255) NOT NULL UNIQUE
);

INSERT INTO furniture_place_type (furniture_place_type_name) VALUES
('floor'),
('wall'),
('on_table'),
('special');


