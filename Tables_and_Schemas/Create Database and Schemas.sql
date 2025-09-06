/*
=========================================================================
This script creates a database name "Pipeline" after checking if it 
already exists.

Additionaly, the script set up three schemas within the database: 

	'bronze'
	'silver'
	'gold'

Executing this will drop the database.
"PROCEED WITH CAUTION"
=========================================================================
*/

IF EXISTS (
			SELECT 1
			FROM sys.databases 
			WHERE name = 'Pipeline')
BEGIN 
	ALTER DATABASE pipeline SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE pipeline
END;
GO 


-- Creating database pipeline
CREATE DATABASE pipeline;

USE pipeline;
GO

-- Creating Schema for every layer
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO

-- GO: It seperate batches when working with multiple SQL statement.
