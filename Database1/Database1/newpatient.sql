CREATE PROCEDURE [dbo].[newpatient]
	@pid int,
	@sex nchar(10),
	@name nchar(50),
	@address nchar(50),
	@age int,
	@did int,
	@anum int
AS
	INSERT into dbo.patient(pid,sex,name,address,age,did,anum) values(@pid,@sex,@name,@address,@age,@did,@anum);
RETURN 0
