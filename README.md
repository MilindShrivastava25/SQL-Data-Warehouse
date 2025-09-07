# SQL-Data-Warehouse.
## Modern Data Warehouse – Medallion Architecture (Framework Used: SQL SERVER).
### Project Overview.

This project demonstrates the implementation of a Modern Data Warehouse using the Medallion Architecture (Bronze → Silver → Gold).
The goal is to design a scalable, maintainable, and business-friendly data pipeline that transforms raw data into meaningful insights.


## Architecture Layers

### 🥉Bronze Layer (Raw Data)

Stores data in its original form, exactly as ingested.

Ensures traceability and lineage of data.


### 🥈Silver Layer (Clean & Standardized)

Applies ETL transformations (cleaning, standardization, and enrichment).

Ensures quality, consistency, and reliability of the data.


### 🥇Gold Layer (Business-Ready Views)
Data is presented using Views instead of physical tables.
Why Views?

  . Avoids duplicate storage.
  
  . Always reflects the latest data.
  
  . Makes business logic easy to maintain.
  
  . Exposes only the required information to users and dashboards.

### 📝Key Learnings
 . How to structure a data warehouse using Medallion layers.
 
 . Benefits of using Views for flexibility, performance abstraction, and security.
 
 . End-to-end pipeline design to support scalable analytics.

<img width="1537" height="794" alt="image" src="https://github.com/user-attachments/assets/935c5293-4122-4785-bbef-5a8acbafc013" />


 ## "Little About Me"
### I am Data Analyst and I enjoy transforming raw and complex dataset into clean and actionable insight using tools like "SQL", "Python", "Power BI" and "Excel" to help business take better data-driven     decisions.
