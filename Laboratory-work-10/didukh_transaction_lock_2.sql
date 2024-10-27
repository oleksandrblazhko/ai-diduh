-- 2.3.5
BEGIN;
LOCK TABLE person IN SHARE MODE;
SELECT * FROM person WHERE p_id = 1;
UPDATE person SET name = 'Steve' WHERE p_id = 1;
SELECT * FROM person WHERE p_id = 1;
COMMIT;

BEGIN;
LOCK TABLE person IN SHARE MODE;
SELECT * FROM person WHERE p_id = 1;
UPDATE person SET name = 'Bill' WHERE p_id = 1;
SELECT * FROM person WHERE p_id = 1;
COMMIT;
