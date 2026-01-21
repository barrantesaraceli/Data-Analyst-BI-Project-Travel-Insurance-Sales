--01_data_cleaning.sql

-- Note: Only representative examples of data cleaning are included here;
-- not all cleaning steps are shown, focusing on the most important transformations

-- =======================================================================================================
-- Step 1: Staging table for cleaning and normalizing raw CSV data
-- before inserting into final normalized tables: 
-- =======================================================================================================
CREATE TABLE clean (
    agency VARCHAR(255) NOT NULL,                       -- Name of agency
    agency_type VARCHAR(100),                           -- Type of travel insurance agency
    distribution_channel VARCHAR(100),                  -- Distribution channel
    product_name VARCHAR(255),                          -- Name of the travel insurance product
    claim ENUM('No','Yes') NOT NULL,                    -- Claim status
    duration INT,                                       -- Duration of travel in days
    destination VARCHAR(100),                           -- Destination of travel
    net_sales VARCHAR(30),                              -- Amount of sales of travel insurance policies
    commission VARCHAR(30),                             -- Commission received for agency
) ENGINE=InnoDB
CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

-- =======================================================================================================
-- Step 2: Check for leading/trailing spaces in string columns
-- =======================================================================================================
SELECT *
FROM clean
WHERE agency <> TRIM(agency)
   OR agency_type <> TRIM(agency_type)
   OR distribution_channel <> TRIM(distribution_channel)
   OR product_name <> TRIM(product_name)
   OR claim <> TRIM(claim)
   OR duration <> TRIM(duration)
   OR destination <> TRIM(destination)
   OR net_sales <> TRIM(net_sales)
   OR commission <> TRIM(commission) -- No results, so not performing any updates

-- =======================================================================================================
-- Step 3: Check for empty values in each column
-- =======================================================================================================
SELECT 
    SUM(CASE WHEN agency = '' THEN 1 ELSE 0 END) AS agency_empty,
    SUM(CASE WHEN agency_type = '' THEN 1 ELSE 0 END) AS agency_type_empty,
    SUM(CASE WHEN distribution_channel = '' THEN 1 ELSE 0 END) AS distribution_channel_empty,
    SUM(CASE WHEN product_name = '' THEN 1 ELSE 0 END) AS product_name_empty,
    SUM(CASE WHEN claim = '' THEN 1 ELSE 0 END) AS claim_empty,
    SUM(CASE WHEN duration = '' THEN 1 ELSE 0 END) AS duration_empty,
    SUM(CASE WHEN destination = '' THEN 1 ELSE 0 END) AS destination_empty,
    SUM(CASE WHEN net_sales = '' THEN 1 ELSE 0 END) AS net_sales_empty,
    SUM(CASE WHEN commission = '' THEN 1 ELSE 0 END) AS commission_empty,
FROM clean;

-- Empty values were identified in the net_sales and commission columns.
-- These values were set to 0 to ensure numerical consistency and
-- to simplify aggregations and calculations in Power BI.

-- Note: In a production environment, missing monetary values might require
-- further validation, but for analytical purposes they were treated as 0.

-- =======================================================================================================
-- Step 4: Convert columns to the correct data types
-- =======================================================================================================
ALTER TABLE clean
MODIFY COLUMN duration INT,
MODIFY COLUMN net_sales DECIMAL(12,2),
MODIFY COLUMN commission DECIMAL(10,2);

-- Verify changes
DESCRIBE clean;

-- =======================================================================================================
-- End of 01_data_cleaning.sql
-- The 'clean' table is now ready for insertion into final normalized tables
-- =======================================================================================================