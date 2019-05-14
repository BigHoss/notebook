# SQL Stuff (mainly MS SQL)

## reset Identity
```sql
declare @max int;  
select @max = max(key) from table;  
dbcc checkident(table,reseed,@max)
```
[Source](http://stackoverflow.com/questions/510121/reset-autoincrement-in-sql-server-after-delete)

## Save changes is not permitted
If you try to change i.e. column types and you get that error message.

**Tools -> Options -> Designers -> Table and Database Designers -> Prevent saving changes that require table re-creation**

## Reset whole DB
```sql
   USE [DatabaseName]
    EXEC sp_msforeachtable "ALTER TABLE ? NOCHECK CONSTRAINT all"       -- Disable All the constraints
    EXEC sp_MSForEachTable "DELETE FROM ?"    -- Delete All the Table data
    Exec sp_MSforeachtable 'DBCC CHECKIDENT(''?'', RESEED, 0)' -- Reseed All the table to 0
    Exec sp_msforeachtable "ALTER TABLE ? WITH CHECK CHECK CONSTRAINT all"  -- Enable All  the constraints back
-- You may ignore the errors that shows the table without Auto increment field.
```
[Source](http://stackoverflow.com/questions/510121/reset-autoincrement-in-sql-server-after-delete)


## Restore User mapping
```sql
EXEC sp_change_users_login auto_fix, '<DBUsername, string, user>'
```

## Show all tables
```sql
SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE='BASE TABLE'
```
[Source](http://stackoverflow.com/questions/3913620/get-all-table-names-of-a-particular-database-by-sql-query)

### Drop all tables
```sql
EXEC sp_msforeachtable "ALTER TABLE ? NOCHECK CONSTRAINT all"

EXEC sp_MSforeachtable @command1 = "DROP TABLE ?"
```

### Export Shema
```sql
select * from INFORMATION_SCHEMA.COLUMNS
```


## DBATools in Powershell
### Install DbaTools
`Install-Module dbatools`

### Database restore between Servers
`Copy-DbaDatabase -Source ch_kustr01\sqle2008 -Destination ch_kustr01\sqle2016 -BackupRestore -NetworkShare \\ch_kustr01\usr$ -Database %DBNAME%`


## Set Collation of db
```sql
ALTER DATABASE WINTRUCK63 SET SINGLE_USER WITH ROLLBACK IMMEDIATE; 
 
GO  
ALTER DATABASE WINTRUCK63  
COLLATE Latin1_General_CI_AS ;  
GO  

ALTER DATABASE WINTRUCK63 SET MULTI_USER; 

GO 

--Verify the collation setting.  
SELECT name, collation_name  
FROM sys.databases  
WHERE name = N'WINTRUCK63';  
GO  
```


## Escape SQL Strings in C#
```csharp
System.Security.SecurityElement.Escape(STRING);

System.Security.SecurityElement.FromString("<test>ESCAPEDSTRING</test>");
```

## Division by Zero
```sql
NULLIF()
```
