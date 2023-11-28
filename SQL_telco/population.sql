SELECT * FROM population;
SELECT COUNT(*) FROM population;
DESC population;

SHOW CREATE TABLE population;

-- zip codes shouldn't exceed 5 characters.
SELECT COUNT(*) from population
WHERE length(zip_code) > 5;

