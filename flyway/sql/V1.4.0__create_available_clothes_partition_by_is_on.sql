CREATE TABLE available_clothes_is_on (
    CHECK (is_on = true)
) INHERITS (available_clothes);
CREATE TABLE available_clothes_not_on (
    CHECK (is_on = false)
) INHERITS (available_clothes);

-- Создаем индексы для каждой партиции
CREATE INDEX idx_available_clothes_is_on_item_id ON available_clothes_is_on (item_id);
CREATE INDEX idx_available_clothes_not_on_item_id ON available_clothes_not_on (item_id);
