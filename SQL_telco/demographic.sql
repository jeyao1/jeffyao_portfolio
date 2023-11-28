SELECT COUNT(*) FROM demographic; -- 7043
SELECT * FROM demographic;
DESC demographic;


-- converted to BOOLEAN: under_30, senior_citizen, married, dependents, number_of_dependents
UPDATE demographic
SET dependents = CASE dependents
				WHEN 'Yes' THEN 1
				WHEN 'No' THEN 0
				END;
SET SQL_SAFE_UPDATES = 1;

ALTER TABLE demographic
MODIFY COLUMN number_of_dependents BOOLEAN;



-- verified customer_id length/structure and optimized datatype.
SELECT 
	SUM(CASE
		WHEN LENGTH(customer_id) = 10 THEN 1
        ELSE 0
	END)
FROM demographic;

ALTER TABLE demographic
ADD CONSTRAINT checkValuePattern
CHECK (customer_id REGEXP '^[0-9]{4}-[A-Za-z]{5}$');

SHOW CREATE TABLE demographic;


