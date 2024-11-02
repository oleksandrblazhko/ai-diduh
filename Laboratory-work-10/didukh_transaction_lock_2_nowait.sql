-- 2.3.6
BEGIN;
LOCK TABLE person IN SHARE MODE NOWAIT;
SELECT * FROM person WHERE p_id = 1;
UPDATE person SET name = 'Steve' WHERE p_id = 1;
SELECT * FROM person WHERE p_id = 1;
COMMIT;


BEGIN;
LOCK TABLE person IN SHARE MODE NOWAIT;
SELECT * FROM person WHERE p_id = 1;
UPDATE person SET name = 'Bill' WHERE p_id = 1;
SELECT * FROM person WHERE p_id = 1;
COMMIT;
