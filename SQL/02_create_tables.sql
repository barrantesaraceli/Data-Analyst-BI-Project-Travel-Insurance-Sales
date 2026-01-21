--02_create_tables.sql

-- ===========================================================
-- Creation of normalized tables and relational data model
-- Agencies (1) ---- (N) Sales (N) ---- (1) Products
-- ===========================================================

-- Agencies dimension table
CREATE TABLE agencies (
    agency_id INT AUTO_INCREMENT PRIMARY KEY,
    agency_name VARCHAR(255),
    agency_type VARCHAR(100),
    distribution_channel VARCHAR(100)
) ENGINE=InnoDB;

-- Products dimension table
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255)
) ENGINE=InnoDB;

-- Sales fact table
CREATE TABLE sales (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    agency_id INT NOT NULL,
    product_id INT NOT NULL,
    claim_status ENUM('Yes','No'),
    net_sales DECIMAL(10,2),
    commission DECIMAL(10,2),
    destination VARCHAR(100),
    duration INT,
    FOREIGN KEY (agency_id) REFERENCES agencies(agency_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
) ENGINE=InnoDB;

-- ===========================================================
-- Indexes to improve query performance on joins and filters
-- ===========================================================
CREATE INDEX idx_sales_agency ON sales(agency_id);
CREATE INDEX idx_sales_product ON sales(product_id);
