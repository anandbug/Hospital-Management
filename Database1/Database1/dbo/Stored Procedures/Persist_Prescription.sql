CREATE PROCEDURE [dbo].[Persist_Prescription]
	@Consult_id int,
	@Daignosis varchar(50),
	@Treatment varchar(50),
	@Prescription_id int=0,
	@Drug_Name varchar(20),
	@Frequency_id int,
	@CreatedBy varchar(20)
AS
	INSERT INTO dbo.Prescription(Consult_id,Daignosis,Treatment,CreatedBy) values(@Consult_id,@Daignosis,@Treatment,@CreatedBy);
	SELECT @Prescription_id=SCOPE_IDENTITY();
	INSERT INTO dbo.Drugs_Given(Prescription_id,Drug_Name,Frequency_id,CreatedBy) values(@Prescription_id,@Drug_Name,@Frequency_id,@CreatedBy);
RETURN 0