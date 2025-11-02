-- Azure SQL query to grant database permissions to Microsoft Entra ID (or AD) groups.
-- Note: USE statement does not work in Azure SQL Database. Select the correct database in SSMS dropdown.

-- Run on master DB
CREATE USER [ACL_GrantLogin_CFP-SQLServer] FROM EXTERNAL PROVIDER;
GO

-- Run on your database (MyDatabase01)
CREATE USER [ACL_DBOwner_MyDatabase01] FROM EXTERNAL PROVIDER;
GO
ALTER ROLE db_owner ADD MEMBER [ACL_DBOwner_MyDatabase01];
GO

CREATE USER [ACL_DBWriter_MyDatabase01] FROM EXTERNAL PROVIDER;
GO
ALTER ROLE db_datawriter ADD MEMBER [ACL_DBWriter_MyDatabase01];
GO

CREATE USER [ACL_DBReader_MyDatabase01] FROM EXTERNAL PROVIDER;
GO
ALTER ROLE db_datareader ADD MEMBER [ACL_DBReader_MyDatabase01];
GO

-- Check permissions worked
SELECT name, type_desc, authentication_type_desc
FROM sys.database_principals
WHERE type IN ('E', 'X') -- E = EXTERNAL_USER, X = EXTERNAL_GROUPS
ORDER BY name;
GO
