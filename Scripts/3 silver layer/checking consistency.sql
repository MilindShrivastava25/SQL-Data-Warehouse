
-- Check if primary key column is unique and not null
SELECT 
	cst_id,
	COUNT(*)
FROM bronze.crm_cust_info
GROUP BY cst_id
HAVING COUNT(*) > 1
OR cst_id IS NULL;


-- Check for unwanted spaces
SELECT 
	cst_firstname 
FROM bronze.crm_cust_info
WHERE cst_firstname != TRIM(cst_firstname);
 

-- Check gender column
SELECT 
	DISTINCT cst_gndr
FROM bronze.crm_cust_info;


-- Check marital status column
SELECT 
	DISTINCT cst_marital_status 
FROM bronze.crm_cust_info;




/*
=========================================================
	Performing transformation on crm_prd_info table
=========================================================
*/

-- Check if primary key column is unique and not null
SELECT 
	prd_id,
	COUNT(*)
FROM bronze.crm_prd_info
GROUP BY prd_id
HAVING COUNT(*) > 1
OR prd_id IS NULL;

-- Check for unwanted spaces
SELECT 
	prd_nm
FROM bronze.crm_prd_info
WHERE prd_nm != TRIM(prd_nm);

--checking for Null and negative values in prd_cost
SELECT 
	prd_cost 
FROM bronze.crm_prd_info
WHERE prd_cost < 0 OR prd_cost IS NULL;

-- Data Standardization and consistency
SELECT 
	DISTINCT prd_line 
FROM bronze.crm_prd_info;

-- Check for invalid Date column
SELECT *
FROM bronze.crm_prd_info
WHERE prd_end_dt < prd_start_dt;



/*
=========================================================
	Performing transformation on crm_prd_info table
=========================================================
*/

-- Check for extra space
SELECT 
	sls_ord_num 
FROM bronze.crm_sales_details
WHERE sls_ord_num != LEN(sls_ord_num);

-- Check for foreign key column
SELECT 
	sls_prd_key 
FROM bronze.crm_sales_details
WHERE sls_prd_key NOT IN (SELECT prd_key FROM silver.crm_prd_info);

SELECT
	sls_cust_id 
FROM bronze.crm_sales_details
WHERE sls_cust_id NOT IN (SELECT cst_id FROM silver.crm_cust_info);

-- Check invalid Date
SELECT 
	sls_order_dt
FROM bronze.crm_sales_details
WHERE sls_order_dt <= 0
OR LEN(sls_order_dt) != 8
OR sls_order_dt > 20500101;

SELECT 
	sls_ship_dt 
FROM bronze.crm_sales_details
WHERE sls_ship_dt <= 0
OR LEN(sls_ship_dt) != 8
OR sls_ship_dt > 20500101;

SELECT 
	sls_due_dt 
FROM bronze.crm_sales_details
WHERE sls_due_dt <= 0
OR LEN(sls_due_dt) != 8
OR sls_due_dt > 20500101;

-- Check Order Date is smaller than Ship Date and Due Date
SELECT *
FROM bronze.crm_sales_details
WHERE sls_order_dt > sls_ship_dt OR sls_order_dt > sls_due_dt;

-- Data Consistency between sales, quantity and price
-- Value must be zero, null or negative
SELECT
	sls_sales,
	sls_quantity,
	sls_price 
FROM bronze.crm_sales_details
WHERE sls_sales != sls_quantity * sls_price
OR sls_sales <= 0
OR sls_quantity <= 0
OR sls_price <= 0
OR sls_sales IS NULL
OR sls_quantity IS NULL
OR sls_price IS NULL
ORDER BY sls_sales,
sls_quantity, sls_price;

/*
Business Rule:
	If sales is negative, zero or null derive it using Quantity * Price.
	If price is zero or null, calculate it using Sales and Quantity.
	If price is negative, convert it to a positive value
*/



/*
=========================================================
	Performing transformation on crm_prd_info table
=========================================================
*/

-- primary key column
SELECT 
	cid
FROM bronze.erp_cust_az12
WHERE cid LIKE '%AW00011000%';

SELECT 
	CASE 
		WHEN cid LIKE 'NAS%' THEN SUBSTRING(cid, 4, LEN(cid))
		ELSE cid 
	END cid
FROM bronze.erp_cust_az12
WHERE CASE 
		WHEN cid LIKE 'NAS%' THEN SUBSTRING(cid, 4, LEN(cid))
		ELSE cid 
	END NOT IN 
	(SELECT DISTINCT cst_key
	FROM silver.crm_cust_info);


-- Checking Invalid date
SELECT 
	bdate 
FROM bronze.erp_cust_az12
WHERE bdate < '1924-01-01'
OR bdate > GETDATE();

-- Data Standaridation and consistency
SELECT 
	DISTINCT gen
FROM bronze.erp_cust_az12;


/*
=========================================================
	Performing transformation on erp_loc_a101 Table
=========================================================
*/

-- Check foreign key column
SELECT 
	cid
FROM bronze.erp_loc_a101;

SELECT 
	cst_key 
FROM silver.crm_cust_info;

-- Data consistency
SELECT 
	DISTINCT cntry 
FROM bronze.erp_loc_a101;

-- check for unwanted column
SELECT 
	cat,
	subcat,
	maintenance
FROM bronze.erp_px_cat_g1v2
WHERE TRIM(cat) != TRIM(cat)
OR TRIM(subcat) != TRIM(subcat)
OR TRIM(maintenance) != TRIM(maintenance);

-- data standardization and consistency
SELECT 
	DISTINCT cat
FROM bronze.erp_px_cat_g1v2	;

SELECT 
	DISTINCT subcat
FROM bronze.erp_px_cat_g1v2	;

SELECT 
	DISTINCT maintenance
FROM bronze.erp_px_cat_g1v2	;

