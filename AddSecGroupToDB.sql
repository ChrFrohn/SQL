-- Switch to the master database
use master;

-- Create a new login from a Windows account
create login [Domain\Group] from windows;

-- Switch to the DATABASENAME database
use DATABASENAME;

-- Create a new user in the DATABASENAME database
create user [Domain\Group] from login [Domain\Group];

-- Add the new user to the db_owner role
EXEC sp_addrolemember 'db_owner', [Domain\Group];
