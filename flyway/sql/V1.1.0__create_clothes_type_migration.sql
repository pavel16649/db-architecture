CREATE TABLE IF NOT EXISTS clothes_type (
    clothes_type_id SERIAL PRIMARY KEY,
    clothes_type_name VARCHAR(255) NOT NULL UNIQUE
);

INSERT INTO clothes_type (clothes_type_name) VALUES
('hat'),
('glasses'),
('shirt'),
('jacket'),
('pants'),
('boots');
