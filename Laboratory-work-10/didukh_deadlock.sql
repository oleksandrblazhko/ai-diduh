-- 2.4.1

BEGIN;

-- 1
LOCK TABLE person IN SHARE ROW EXCLUSIVE MODE;
SELECT * FROM person WHERE p_id = 1;
UPDATE person SET name = 'Name-1' WHERE p_id = 1;
-- Затримка
SELECT pg_sleep(10);

COMMIT;
-- 2
LOCK TABLE person IN SHARE ROW EXCLUSIVE MODE;
SELECT * FROM person WHERE p_id = 2;
UPDATE person SET name = 'Name2' WHERE p_id = 2;

COMMIT;
