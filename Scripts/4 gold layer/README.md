# Step 1 ->
## Create Gold Views:
Script Purpose:
  - This script creates views for the Gold layer in the data warehouse.
  - The Gold layer represents the final dimension and fact tables (Star Schema).
  - Each view performs transformations and combines data from the Silver layer to produce a clean, enriched, and business-ready dataset.

# Step 2 ->
## Quality Checks

Script Purpose:
This script performs quality checks to validate the integrity, consistency, and accuracy of the Gold Layer. 
These checks ensure:
  - Uniqueness of surrogate keys in dimension tables.
  - Referential integrity between fact and dimension tables.
  - Validation of relationships in the data model for analytical purposes.
