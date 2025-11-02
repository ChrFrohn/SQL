SELECT 
    name, 
    type_desc, 
    authentication_type_desc
FROM sys.database_principals
WHERE type IN ('E', 'X')
ORDER BY name;
GO

SELECT 
    dp.name AS PrincipalName,
    dp.type_desc AS PrincipalType,
    r.name AS RoleName
FROM sys.database_principals dp
LEFT JOIN sys.database_role_members drm ON dp.principal_id = drm.member_principal_id
LEFT JOIN sys.database_principals r ON drm.role_principal_id = r.principal_id
WHERE dp.type IN ('E', 'X')
ORDER BY dp.name, r.name;
GO
