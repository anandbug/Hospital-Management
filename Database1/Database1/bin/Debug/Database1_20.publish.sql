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
USE [$(DatabaseName)];


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
INSERT into dbo.appointment values('3','2103-08-29 11:00:00','200','2');
INSERT into dbo.appointment values('4','2013-08-25 13:30:00','250','4');
INSERT into dbo.appointment values('5','2013-09-30 16:30:00','150','3');
GO

GO
PRINT N'Update complete.';


GO
