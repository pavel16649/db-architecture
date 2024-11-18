CREATE TABLE IF NOT EXISTS available_furniture (
  owner_id INTEGER NOT NULL,
  item_id INTEGER NOT NULL,
  CONSTRAINT fk_available_furniture_owner FOREIGN KEY (owner_id) REFERENCES players(id),
  CONSTRAINT fk_available_furniture_item FOREIGN KEY (item_id) REFERENCES furniture(item_id)
);

INSERT INTO available_furniture (owner_id, item_id)
SELECT
    (floor(random() * ${numPlayers} + 1)::int),
    (floor(random() * ${numFurniture} + 1)::int)
FROM generate_series(1, ${numAvailableFurniture});
