-- 2.3.4
BEGIN;
LOCK TABLE person IN EXCLUSIVE MODE;
SELECT * FROM person WHERE p_id = 1;
UPDATE person SET name = 'Steve' WHERE p_id = 1;
SELECT * FROM person WHERE p_id = 1;
ROLLBACK;


BEGIN;
LOCK TABLE person IN EXCLUSIVE MODE;
SELECT * FROM person WHERE p_id = 1;
UPDATE person SET name = 'Bill' WHERE p_id = 1;
SELECT * FROM person WHERE p_id = 1;
COMMIT;
