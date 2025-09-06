/*
===============================================================
	This file is used to create table for bronze schema
	In this file:
		1. Table have been created.
		2. Data Type for each table have been set.
===============================================================
*/

-- ========================================================
-- Creating tables in bronze schema for crm system
-- ========================================================

DROP TABLE IF EXISTS bronze.crm_cust_info;
CREATE TABLE bronze.crm_cust_info(
	cst_id INT,
	cst_key VARCHAR(50),
	cst_firstname VARCHAR(50),
	cst_lastname VARCHAR(50),
	cst_marital_status VARCHAR(50),
	cst_gndr VARCHAR(50),
	cst_create_date DATE
);
GO

DROP TABLE IF EXISTS bronze.crm_prd_info;
CREATE TABLE bronze.crm_prd_info(
	prd_id INT,
	prd_key VARCHAR(200),
	prd_nm VARCHAR(200),
	prd_cost INT,
	prd_line VARCHAR(50),
	prd_start_dt DATE,
	prd_end_dt DATE
);
GO

DROP TABLE IF EXISTS bronze.crm_sales_details;
CREATE TABLE bronze.crm_sales_details(
	sls_ord_num VARCHAR(50),
	sls_prd_key VARCHAR(50),
	sls_cust_id INT,
	sls_order_dt INT,
	sls_ship_dt INT,
	sls_due_dt INT, 
	sls_sales INT,
	sls_quantity INT,
	sls_price INT
);
GO


-- ========================================================
-- Creating tables in bronze schema for erp system
-- ========================================================

DROP TABLE IF EXISTS bronze.cust_az12;
CREATE TABLE bronze.erp_cust_az12(
	cid VARCHAR(200),
	bdate DATE,
	gen VARCHAR(50)
);
GO

DROP TABLE IF EXISTS bronze.erp_loc_a101;
CREATE TABLE bronze.erp_loc_a101(
	cid VARCHAR(200),
	cntry VARCHAR(100)
);
GO

DROP TABLE IF EXISTS bronze.erp_px_cat_g1v2;
CREATE TABLE bronze.erp_px_cat_g1v2(
	id VARCHAR(50),
	cat VARCHAR(50),
	subcat VARCHAR(50),
	maintenance VARCHAR(50)
);
GO