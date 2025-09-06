# Step 1 ->
## Create table for silver schema
	In this file:
		1. Table for files have been created.
		2. Data Type for each table have been set.

  # Step 2 ->
  ## checking consistency
 	 Script Purpose:
    	This script performs various quality checks for data consistency, accuracy, and standardization across the 'silver' layer. 
	 	It includes checks for:
		    - Null or duplicate primary keys.
		    - Unwanted spaces in string fields.
		    - Data standardization and consistency.
		    - Invalid date ranges and orders.
		    - Data consistency between related fields.

# Step 3 ->
## Inserting Transformed Data
	Stored Procedure: Load Silver Layer (Source -> Bronze)
		Script Purpose:
		This stored procedure loads data into the 'silver' schema and performing transfromation.
		It performs the following actions:
		Truncates the bronze tables before loading data.
		Uses the BULK INSERT command to load data from csv Files to silver tables.
