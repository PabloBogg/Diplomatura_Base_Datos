
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE cursosPorAlumnos 
	-- Add the parameters for the stored procedure here
	@idAlumnoEntrada INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT dsCurso FROM cursos, inscripciones 
	WHERE cursos.idCurso=inscripciones.idCurso AND inscripciones.idAlumno=@idAlumnoEntrada
END
GO
