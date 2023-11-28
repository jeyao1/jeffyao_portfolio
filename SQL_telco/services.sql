SELECT * FROM services;
SELECT COUNT(*) FROM services;
DESC services;


-- Restrict quarters to 4 quarters.
ALTER TABLE services
ADD CONSTRAINT FourQuartersOnly CHECK (Quarter IN ('Q1','Q2','Q3','Q4'));
SHOW CREATE TABLE services;



-- Change variables with dollar values to FLOAT data types.
ALTER TABLE services
MODIFY Avg_Monthly_Long_Distance_Charges FLOAT,
MODIFY Monthly_Charge FLOAT,
MODIFY Total_Charges FLOAT,
MODIFY Total_Refunds FLOAT,
MODIFY Total_Extra_Data_Charges FLOAT,
MODIFY Total_Revenue FLOAT;

