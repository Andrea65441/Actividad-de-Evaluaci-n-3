docker run -d `
--env-file "$PSScriptRoot\.env" `
--network campus-network `
--name sqlserver-campuscloud `
-p 1433:1433 `
-v campuscloud-sql-data:/var/lib/sqlserver `
--restart always `
mcr.microsoft.com/mssql/server:2025-CU8-ubuntu-24.04