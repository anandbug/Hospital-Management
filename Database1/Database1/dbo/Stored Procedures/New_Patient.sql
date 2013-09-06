CREATE PROCEDURE [dbo].[New_Patient]
	@First_Name varchar(20),
	@Middle_Name varchar(20),
	@Last_Name varchar(20),
	@Sex varchar(20),
	@DOB varchar(20),
	@Patient_id int=0,
	@CreatedBy varchar(20),
	@Type_id int,
	@Value varchar(50)
AS
	INSERT INTO dbo.Patient(First_Name,Middle_Name,Last_Name,Sex,DOB,CreatedBy) values(@First_Name,@Middle_Name,@Last_Name,@Sex,@DOB,@CreatedBy);
	SELECT @Patient_id=SCOPE_IDENTITY();
	INSERT INTO dbo.Patient_Contact_Details(Patient_id,Typeid,Value,CreatedBy) values(@Patient_id,@Type_id,@Value,@CreatedBy);
RETURN 0