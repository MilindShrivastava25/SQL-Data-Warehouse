# Information

The fact_sales table captures all transactional data (orders, amounts, dates, quantities, prices) and connects with two dimension tables:
   - dim_customers: stores detailed customer information like name, gender, marital status, and country.
   - dim_products: stores product-related details such as product name, category, subcategory, and cost.
This star schema makes reporting simple and efficient by separating facts (numbers to analyze) from dimensions (descriptive attributes), allowing clear insights into sales performance by customer and product.
