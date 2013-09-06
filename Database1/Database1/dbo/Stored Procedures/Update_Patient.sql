CREATE PROCEDURE [dbo].[Update_Patient]
	@Patient_id int,
	@First_Name varchar(20),
	@ModifiedBy Varchar(20)
AS
	UPDATE dbo.Patient
	SET First_Name=@First_Name,ModifiedBy=@ModifiedBy,ModifiedTime=GETDATE()
	WHERE Id=@Patient_id;
RETURN 0