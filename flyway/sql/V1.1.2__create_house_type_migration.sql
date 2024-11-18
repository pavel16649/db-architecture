CREATE TABLE IF NOT EXISTS house_type (
    house_type_id SERIAL PRIMARY KEY,
    house_type_name VARCHAR(255) NOT NULL UNIQUE
);

INSERT INTO house_type (house_type_name) VALUES
('common'),
('tree'),
('pyramid'),
('club'),
('pink'),
('underwater');