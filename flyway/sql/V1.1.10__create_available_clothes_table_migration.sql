CREATE TABLE IF NOT EXISTS available_clothes (
  owner_id INTEGER NOT NULL,
  item_id INTEGER NOT NULL,
  is_on BOOLEAN NOT NULL,
  CONSTRAINT fk_available_clothes_owner FOREIGN KEY (owner_id) REFERENCES players(id),
  CONSTRAINT fk_available_clothes_item FOREIGN KEY (item_id) REFERENCES clothes(item_id)
);

INSERT INTO available_clothes (owner_id, item_id, is_on)
SELECT
    (floor(random() * ${numPlayers} + 1)::int),
    (floor(random() * ${numClothes} + 1)::int),
    random() < 0.1
FROM generate_series(1, ${numAvailableClothes});
