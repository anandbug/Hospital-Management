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