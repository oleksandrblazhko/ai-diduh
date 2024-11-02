BEGIN;

-- Операція блокування
LOCK TABLE person IN EXCLUSIVE MODE;

-- Операція читання
SELECT * FROM person WHERE p_id = 1;

-- Операція зміни значення
UPDATE person SET name = 'Steve' WHERE p_id = 1;

-- Повторна операція читання
SELECT * FROM person WHERE p_id = 1;

-- Операція фіксації
COMMIT;

-- Транзакція №2
BEGIN;

-- Операція блокування
LOCK TABLE person IN EXCLUSIVE MODE;

-- Операція читання
SELECT * FROM person WHERE p_id = 1;

-- Операція зміни значення
UPDATE person SET name = 'Bill' WHERE p_id = 1;

-- Повторна операція читання
SELECT * FROM person WHERE p_id = 1;

-- Операція фіксації
COMMIT;
