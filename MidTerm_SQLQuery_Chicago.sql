--Creating the Database
create database MidTerm_Group_19;

-- Using the created database
use MidTerm_Group_19;

-- Checking the stage table
select * from stg_MidTerm_Group_19;


-- Row count
SELECT COUNT(*) as Row_Count FROM stg_MidTerm_Group_19 ;

--Column Count
SELECT COUNT(*) as Column_Count FROM INFORMATION_SCHEMA.COLUMNS
--WHERE TABLE_NAME = 'dbo.stg_MidTerm_Group_19' AND TABLE_SCHEMA = 'dbo.INFORMATION_SCHEMA';

