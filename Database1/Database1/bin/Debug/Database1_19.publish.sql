﻿/*
Deployment script for Database1

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "Database1"
:setvar DefaultFilePrefix "Database1"
:setvar DefaultDataPath "C:\Users\Dhyan\AppData\Local\Microsoft\VisualStudio\SSDT\"
:setvar DefaultLogPath "C:\Users\Dhyan\AppData\Local\Microsoft\VisualStudio\SSDT\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [master];


GO

IF (DB_ID(N'$(DatabaseName)') IS NOT NULL) 
BEGIN
    ALTER DATABASE [$(DatabaseName)]
    SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [$(DatabaseName)];
END

GO
PRINT N'Creating $(DatabaseName)...'
GO
CREATE DATABASE [$(DatabaseName)]
    ON 
    PRIMARY(NAME = [$(DatabaseName)], FILENAME = N'$(DefaultDataPath)$(DefaultFilePrefix)_Primary.mdf')
    LOG ON (NAME = [$(DatabaseName)_log], FILENAME = N'$(DefaultLogPath)$(DefaultFilePrefix)_Primary.ldf') COLLATE SQL_Latin1_General_CP1_CI_AS
GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ANSI_NULLS ON,
                ANSI_PADDING ON,
                ANSI_WARNINGS ON,
                ARITHABORT ON,
                CONCAT_NULL_YIELDS_NULL ON,
                NUMERIC_ROUNDABORT OFF,
                QUOTED_IDENTIFIER ON,
                ANSI_NULL_DEFAULT ON,
                CURSOR_DEFAULT LOCAL,
                CURSOR_CLOSE_ON_COMMIT OFF,
                AUTO_CREATE_STATISTICS ON,
                AUTO_SHRINK OFF,
                AUTO_UPDATE_STATISTICS ON,
                RECURSIVE_TRIGGERS OFF 
            WITH ROLLBACK IMMEDIATE;
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CLOSE OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ALLOW_SNAPSHOT_ISOLATION OFF;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET READ_COMMITTED_SNAPSHOT OFF;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_UPDATE_STATISTICS_ASYNC OFF,
                PAGE_VERIFY NONE,
                DATE_CORRELATION_OPTIMIZATION OFF,
                DISABLE_BROKER,
                PARAMETERIZATION SIMPLE,
                SUPPLEMENTAL_LOGGING OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET TRUSTWORTHY OFF,
        DB_CHAINING OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'The database settings cannot be modified. You must be a SysAdmin to apply these settings.';
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET HONOR_BROKER_PRIORITY OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'The database settings cannot be modified. You must be a SysAdmin to apply these settings.';
    END


GO
ALTER DATABASE [$(DatabaseName)]
    SET TARGET_RECOVERY_TIME = 0 SECONDS 
    WITH ROLLBACK IMMEDIATE;


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET FILESTREAM(NON_TRANSACTED_ACCESS = OFF),
                CONTAINMENT = NONE 
            WITH ROLLBACK IMMEDIATE;
    END


GO
USE [$(DatabaseName)];


GO
IF fulltextserviceproperty(N'IsFulltextInstalled') = 1
    EXECUTE sp_fulltext_database 'enable';


GO
PRINT N'Creating [dbo].[appointment]...';


GO
CREATE TABLE [dbo].[appointment] (
    [anum]    INT      NOT NULL,
    [timings] DATETIME NOT NULL,
    [charge]  INT      NOT NULL,
    [did]     INT      NOT NULL,
    PRIMARY KEY CLUSTERED ([anum] ASC)
);


GO
PRINT N'Creating [dbo].[doctor]...';


GO
CREATE TABLE [dbo].[doctor] (
    [did]    INT            NOT NULL,
    [name]   NVARCHAR (50)  NOT NULL,
    [charge] MONEY          NOT NULL,
    [dep]    NVARCHAR (50)  NOT NULL,
    [desc]   NVARCHAR (MAX) NOT NULL,
    [sex]    NCHAR (10)     NOT NULL,
    PRIMARY KEY CLUSTERED ([did] ASC)
);


GO
PRINT N'Creating [dbo].[patient]...';


GO
CREATE TABLE [dbo].[patient] (
    [pid]     INT           NOT NULL,
    [sex]     NCHAR (10)    NOT NULL,
    [name]    NVARCHAR (50) NOT NULL,
    [address] NVARCHAR (50) NOT NULL,
    [age]     INT           NOT NULL,
    [did]     INT           NOT NULL,
    PRIMARY KEY CLUSTERED ([pid] ASC)
);


GO
PRINT N'Creating [dbo].[prescription]...';


GO
CREATE TABLE [dbo].[prescription] (
    [pid]          INT            NOT NULL,
    [did]          INT            NOT NULL,
    [prescription] NVARCHAR (MAX) NULL
);


GO
PRINT N'Creating fk_appointmenttodoctor...';


GO
ALTER TABLE [dbo].[appointment] WITH NOCHECK
    ADD CONSTRAINT [fk_appointmenttodoctor] FOREIGN KEY ([did]) REFERENCES [dbo].[doctor] ([did]);


GO
PRINT N'Creating fk_patienttodoctor...';


GO
ALTER TABLE [dbo].[patient] WITH NOCHECK
    ADD CONSTRAINT [fk_patienttodoctor] FOREIGN KEY ([did]) REFERENCES [dbo].[doctor] ([did]);


GO
PRINT N'Creating fk_prescription_doctor...';


GO
ALTER TABLE [dbo].[prescription] WITH NOCHECK
    ADD CONSTRAINT [fk_prescription_doctor] FOREIGN KEY ([did]) REFERENCES [dbo].[doctor] ([did]);


GO
PRINT N'Creating [dbo].[Function12]...';


GO
CREATE FUNCTION [dbo].[Function12]
(
	@param1 int,
	@param2 char(5)
)
RETURNS TABLE AS RETURN
(
	SELECT @param1 AS c1,
		   @param2 AS c2
)
GO
PRINT N'Creating [dbo].[function13]...';


GO
CREATE FUNCTION [dbo].[function13]
(
	@param1 int,
	@param2 char(5)
)
RETURNS TABLE AS RETURN
(
	SELECT @param1 AS c1,
		   @param2 AS c2
)
GO
PRINT N'Creating [dbo].[view_doc_rev_grp]...';


GO
CREATE VIEW [dbo].[view_doc_rev_grp]
	AS SELECT * FROM [doctor]
GO
PRINT N'Creating [dbo].[view_doc_revenue]...';


GO
CREATE VIEW [dbo].[view_doc_revenue]
	AS SELECT * FROM [doctor]
GO
PRINT N'Creating [dbo].[view_prescription]...';


GO
CREATE VIEW [dbo].[view_prescription]
	AS SELECT * FROM [prescription]
GO
PRINT N'Creating [dbo].[viewappointment]...';


GO
CREATE VIEW [dbo].[viewappointment]
	AS SELECT * FROM [appointment]
GO
PRINT N'Creating [dbo].[viewdoctor]...';


GO
CREATE VIEW [dbo].[viewdoctor]
	AS SELECT * FROM [doctor]
GO
PRINT N'Creating [dbo].[viewpatient]...';


GO
CREATE VIEW [dbo].[viewpatient]
	AS SELECT * FROM [patient]
GO
PRINT N'Creating [dbo].[newpatient]...';


GO
CREATE PROCEDURE [dbo].[newpatient]
	@pid int,
	@sex nchar(10),
	@name nvarchar(50),
	@address nvarchar(50),
	@age int,
	@did int
AS
	INSERT into dbo.patient(pid,sex,name,address,age,did) values(@pid,@sex,@name,@address,@age,@did);
RETURN 0
GO
PRINT N'Creating [dbo].[persistappointment]...';


GO
CREATE PROCEDURE [dbo].[persistappointment]
	@anum int,
	@timings datetime,
    @charge int,
    @did int
AS
	INSERT into dbo.appointment(anum,timings,charge,did) values(@anum,@timings,@charge,@did);
RETURN 0
GO
PRINT N'Creating [dbo].[persistprescription]...';


GO
CREATE PROCEDURE [dbo].[persistprescription]
	@pid int,
	@did int,
	@prescription nvarchar(MAX)
AS
	INSERT into dbo.prescription(pid,did,prescription) values(@pid,@did,@prescription);
RETURN 0
GO
PRINT N'Creating [dbo].[rm_appointment]...';


GO
CREATE PROCEDURE [dbo].[rm_appointment]
	@anum int
AS
	DELETE from dbo.appointment
	WHERE anum=@anum;
RETURN 0
GO
PRINT N'Creating [dbo].[rm_patient]...';


GO
CREATE PROCEDURE [dbo].[rm_patient]
	@pid int
AS
	DELETE from dbo.patient
	WHERE pid=@pid;
RETURN 0
GO
PRINT N'Creating [dbo].[rm_prescription]...';


GO
CREATE PROCEDURE [dbo].[rm_prescription]
	@pid int
AS
	DELETE from dbo.prescription
	WHERE pid=@pid;
RETURN 0
GO
PRINT N'Creating [dbo].[up_appointment]...';


GO
CREATE PROCEDURE [dbo].[up_appointment]
	@anum int,
	@timings datetime
AS
	UPDATE dbo.appointment
	SET timings=@timings
	WHERE anum=@anum;
RETURN 0
GO
PRINT N'Creating [dbo].[up_patient]...';


GO
CREATE PROCEDURE [dbo].[up_patient]
	@pid int,
	@name nvarchar(50),
	@address nvarchar(50)
AS
	UPDATE dbo.patient
	SET name=@name,address=@address
	WHERE pid=@pid;
RETURN 0
GO
PRINT N'Creating [dbo].[up_prescription]...';


GO
CREATE PROCEDURE [dbo].[up_prescription]
	@pid int,
	@prescription nvarchar(MAX)
AS
	UPDATE dbo.prescription
	SET prescription=@prescription
	WHERE pid=@pid;
RETURN 0
GO
-- Refactoring step to update target server with deployed transaction logs

IF OBJECT_ID(N'dbo.__RefactorLog') IS NULL
BEGIN
    CREATE TABLE [dbo].[__RefactorLog] (OperationKey UNIQUEIDENTIFIER NOT NULL PRIMARY KEY)
    EXEC sp_addextendedproperty N'microsoft_database_tools_support', N'refactoring log', N'schema', N'dbo', N'table', N'__RefactorLog'
END
GO
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'af742833-30f4-447d-925a-35d7e73d1781')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('af742833-30f4-447d-925a-35d7e73d1781')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '6fd09723-047d-40dc-a23b-58c2a6412f35')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('6fd09723-047d-40dc-a23b-58c2a6412f35')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '2b149704-9488-467c-a563-2e091fb2493c')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('2b149704-9488-467c-a563-2e091fb2493c')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '397e373e-8e1d-4f78-b673-75716ff74058')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('397e373e-8e1d-4f78-b673-75716ff74058')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'fca0f24e-5fa3-4d6f-bf7a-d89d9534be70')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('fca0f24e-5fa3-4d6f-bf7a-d89d9534be70')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '22e4edaa-20cd-4722-a33e-688b8be22c83')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('22e4edaa-20cd-4722-a33e-688b8be22c83')

GO

GO
/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
INSERT into dbo.doctor values('1','paras','500','physician','MBBS-MD','male');
INSERT into dbo.doctor values('2','nath','200','pedriatics','MBBS','male');
INSERT into dbo.doctor values('3','gobar','150','dentist','BDS','male');
INSERT into dbo.doctor values('4','mala','250','gynocologist','MBBS','female');

INSERT into dbo.patient values('1','male','luiii','bellandur','25','3');
INSERT into dbo.patient values('2','female','mortein','vijaynagar','24','4');
INSERT into dbo.patient values('3','male','pogo','hennur','27','2');
INSERT into dbo.patient values('4','male','topi','yelhanka','26','2');

INSERT into dbo.prescription values('1','3','live life happily');
INSERT into dbo.prescription values('2','4','go die');
INSERT into dbo.prescription values('3','2','jump from roof');
INSERT into dbo.prescription values('4','2','commit suicide by cynide');
INSERT into dbo.prescription values('1','3','eat more bananas');

INSERT into dbo.appointment values('1','2013-08-25 10:30:00','150','3');
INSERT into dbo.appointment values('2','2013-08-27 15:30:00','200','2');
INSERT into dbo.appointment values('3','2103-08-29 11::00:00','200','2');
INSERT into dbo.appointment values('4','2013-08-25 13:30:00','250','4');
INSERT into dbo.appointment values('5','2013-09-30 16:30:00','150','3');
GO

GO
PRINT N'Checking existing data against newly created constraints';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[appointment] WITH CHECK CHECK CONSTRAINT [fk_appointmenttodoctor];

ALTER TABLE [dbo].[patient] WITH CHECK CHECK CONSTRAINT [fk_patienttodoctor];

ALTER TABLE [dbo].[prescription] WITH CHECK CHECK CONSTRAINT [fk_prescription_doctor];


GO
DECLARE @VarDecimalSupported AS BIT;

SELECT @VarDecimalSupported = 0;

IF ((ServerProperty(N'EngineEdition') = 3)
    AND (((@@microsoftversion / power(2, 24) = 9)
          AND (@@microsoftversion & 0xffff >= 3024))
         OR ((@@microsoftversion / power(2, 24) = 10)
             AND (@@microsoftversion & 0xffff >= 1600))))
    SELECT @VarDecimalSupported = 1;

IF (@VarDecimalSupported > 0)
    BEGIN
        EXECUTE sp_db_vardecimal_storage_format N'$(DatabaseName)', 'ON';
    END


GO
PRINT N'Update complete.';


GO
