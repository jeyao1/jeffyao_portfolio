SELECT COUNT(*) FROM location;
SELECT * FROM location;
DESC location;


-- add foreign key (customer_id and zip_code)
ALTER TABLE location
ADD CONSTRAINT fk_customer_id
FOREIGN KEY (customer_id)
REFERENCES demographic(customer_id);

ALTER TABLE location
ADD CONSTRAINT fk_zip_code
FOREIGN KEY (Zip_Code)
REFERENCES population(zip_code);

SHOW CREATE TABLE location;



-- LatLong, the concatenated column of Latitude and Longitude, seem to have rows that don't match
SELECT * FROM locationtest WHERE CONCAT(Latitude, ', ', Longitude) != LatLong;

-- There is a slight increase in the longitutde values in the concatenated latlong column
-- Though they are different, the difference is negligible (per Google Maps, every .00001 degree long/lat is ~5ft.)
SELECT    
	Latitude - SUBSTRING_INDEX(LatLong,', ', 1) LatDiff,
    Longitude - SUBSTRING_INDEX(LatLong,', ', -1) LongDiff
FROM
	location
ORDER BY
	1,2;

