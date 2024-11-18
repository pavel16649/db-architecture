CREATE TABLE IF NOT EXISTS placed_furniture (
  owner_id INTEGER NOT NULL,
  item_id INTEGER NOT NULL,
  pos_x INTEGER NOT NULL,
  pos_y INTEGER NOT NULL,
  CONSTRAINT fk_placed_furniture_owner FOREIGN KEY (owner_id) REFERENCES players(id),
  CONSTRAINT fk_placed_furniture_item FOREIGN KEY (item_id) REFERENCES furniture(item_id)
);

INSERT INTO placed_furniture (owner_id, item_id, pos_x, pos_y)
SELECT
    (floor(random() * ${numPlayers} + 1)::int),
    (floor(random() * ${numFurniture} + 1)::int),
    (floor(random() * 100 + 1)::int),
    (floor(random() * 100 + 1)::int)
FROM generate_series(1, ${numPlacedFurniture});
