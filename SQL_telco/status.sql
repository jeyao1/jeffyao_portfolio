SELECT COUNT(*) FROM status;
SELECT COUNT(DISTINCT Customer_id) FROM status;
SELECT * FROM status;



-- add foreign key
ALTER TABLE status
ADD CONSTRAINT fk_status_customer_id
FOREIGN KEY (customer_id)
REFERENCES demographic(customer_id);

SHOW CREATE TABLE status;



-- check customer status totals.
SELECT DISTINCT customer_status FROM status;
SELECT
	COUNT(CASE WHEN customer_status = 'Churned' THEN 1 END) Churned,
	COUNT(CASE WHEN customer_status = 'Joined' THEN 1 END) Joined,
	COUNT(CASE WHEN customer_status = 'Stayed' THEN 1 END) Stayed,
    (COUNT(CASE WHEN customer_status = 'Churned' THEN 1 END) + COUNT(CASE WHEN customer_status = 'Joined' THEN 1 END) + COUNT(CASE WHEN customer_status = 'Stayed' THEN 1 END)) cust_status_total,
	(SELECT COUNT(*) FROM status) original_total
FROM status;
