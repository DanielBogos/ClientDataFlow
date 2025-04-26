-- Load customers data
-- This is a sample for the code structure. I created the same code for all the tables
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 9.3/Uploads/customers.csv'
INTO TABLE customers
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(customer_id, first_name, last_name, address_id);
