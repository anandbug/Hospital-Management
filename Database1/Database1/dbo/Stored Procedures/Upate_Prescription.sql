CREATE PROCEDURE [dbo].[Upate_Prescription]
	@Consult_id int,
	@Treatment varchar(50),
	@ModifiedBy varchar(20)
AS
	UPDATE dbo.Prescription
	SET Treatment=@Treatment,ModifiedBy=@ModifiedBy,ModifiedTime=GETDATE()
	WHERE Consult_id=@Consult_id;
RETURN 0