/*
Quality Checks

Scri Purpose:

This script performs quality checks to validate the integrity, consistency,
and accuracy of the Gold Layer. These checks ensure:

Uniqueness of surrogate keys in dimension tables.
Referential integrity between fact and dimension tables.
Validation of relationships in the data model for analytical purposes.
*/

-- Checking consistency for customer table
SELECT 
	ci.cst_id,
	ci.cst_key,
	ci.cst_firstname,
	ci.cst_lastname,
	ci.cst_marital_status,
	ci.cst_gndr,
	ci.cst_create_date,
	ca.bdate,
	ca.gen,
	la.cntry
FROM silver.crm_cust_info ci
LEFT JOIN silver.erp_cust_az12 ca
ON ci.cst_key = ca.cid
LEFT JOIN silver.erp_loc_a101 la
ON ci.cst_key = la.cid;

-- Data Intergration
SELECT DISTINCT 
	ci.cst_gndr,
	ca.gen,
	CASE 
		WHEN ci.cst_gndr != 'Unknown' THEN ci.cst_gndr 
		ELSE COALESCE(ca.gen, 'Unkown')
	END new_gndr
FROM silver.crm_cust_info ci
LEFT JOIN silver.erp_cust_az12 ca
ON ci.cst_key = ca.cid;


-- Checking consistency for product table
SELECT 
	pn.prd_id,
	pn.prd_key,
	pn.prd_nm,
	pn.prd_cost,
	pn.prd_line,
	pn.prd_start_dt,
	pn.prd_end_dt,
	pc.cat,
	pc.subcat,
	pc.maintenance
FROM silver.crm_prd_info pn
LEFT JOIN silver.erp_px_cat_g1v2 pc
ON pn.cat_id = pc.id
WHERE prd_end_dt IS NULL;


-- Checking consistency for Sals Tables
SELECT * 
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
ON c.customer_key = f.customer_key
WHERE c.customer_key IS NULL;


SELECT * 
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
ON p.product_key = f.product_key
WHERE p.product_key IS NULL;