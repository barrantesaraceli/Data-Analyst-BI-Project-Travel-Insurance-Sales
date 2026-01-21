--03_insert_cleaned_data.sql

-- Note: This script shows representative examples of data insertion
-- from the staging table into the final normalized tables.

-- =======================================================================================================
-- Insert cleaned data from clean table to the normalized table: agencies, products, sales
-- =======================================================================================================
INSERT INTO agencies (agency_name, distribution_channel)
SELECT DISTINCT
    agency_name,
    distribution_channel
FROM clean;

-- Same process with products and sales

-- After this step, the database schema is completed
-- and ready for analytical queries and Power BI integration.