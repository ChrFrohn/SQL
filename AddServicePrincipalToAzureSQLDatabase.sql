-- Add Microsoft Entra service principal to Azure SQL Database
-- Run on your target database (not master)
-- Select your database in SSMS database dropdown before running

CREATE USER [NameOfServicePrincipal] FROM EXTERNAL PROVIDER;
GO
ALTER ROLE db_owner ADD MEMBER [NameOfServicePrincipal];
GO
