/*
=====================================================================================================
	Stored Procedure: Load Bronze Layer (Source -> Bronze)

	Script Purpose:
	This stored procedure loads data into the 'bronze' schema from external CSV files.
	It performs the following actions:
	Truncates the bronze tables before loading data.
	Uses the BULK INSERT command to load data from csv Files to bronze tables.
=====================================================================================================
*/

-- -----------------------------
-- CREATING STORED PROCEDURE 
-- -----------------------------


CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN 
	BEGIN TRY
/*
-- ====================================================================
					 Inserting CRM source files
-- ====================================================================
*/
		TRUNCATE TABLE bronze.crm_cust_info;
		BULK INSERT bronze.crm_cust_info
		FROM 'F:\U\U-DA\Project\SQL\Pipeline Project\0 dataset\source_crm\cust_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ','
		);


		TRUNCATE TABLE bronze.crm_prd_info;
		BULK INSERT bronze.crm_prd_info
		FROM 'F:\U\U-DA\Project\SQL\Pipeline Project\0 dataset\source_crm\prd_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ','
		);


		TRUNCATE TABLE bronze.crm_sales_details;
		BULK INSERT bronze.crm_sales_details
		FROM 'F:\U\U-DA\Project\SQL\Pipeline Project\0 dataset\source_crm\sales_details.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);

/*
-- ====================================================================
					 Inserting ERP source files
-- ====================================================================
*/

		TRUNCATE TABLE bronze.erp_cust_az12;
		BULK INSERT bronze.erp_cust_az12
		FROM 'F:\U\U-DA\Project\SQL\Pipeline Project\0 dataset\source_erp\CUST_AZ12.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ','
		);

		TRUNCATE TABLE bronze.erp_loc_a101
		BULK INSERT  bronze.erp_loc_a101
		FROM 'F:\U\U-DA\Project\SQL\Pipeline Project\0 dataset\source_erp\LOC_A101.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ','
		);

		TRUNCATE TABLE bronze.erp_px_cat_g1v2
		BULK INSERT  bronze.erp_px_cat_g1v2
		FROM 'F:\U\U-DA\Project\SQL\Pipeline Project\0 dataset\source_erp\PX_CAT_G1V2.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ','
		);
	END TRY
	BEGIN CATCH
		PRINT 'Errro Message:' + ERROR_MESSAGE();
		PRINT 'Errro Message:' + CAST(ERROR_NUMBER() AS VARCHAR);
		PRINT 'Errro Message:' + CAST(ERROR_State() AS VARCHAR);
	END CATCH
END