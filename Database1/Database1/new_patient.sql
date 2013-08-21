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
