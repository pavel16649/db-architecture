WITH x AS (
    DELETE FROM ONLY available_clothes
        WHERE is_on=true RETURNING *)
INSERT INTO available_clothes_is_on
       SELECT * FROM x;

WITH x AS (
    DELETE FROM ONLY available_clothes
        WHERE is_on=false RETURNING *)
INSERT INTO available_clothes_not_on
       SELECT * FROM x;