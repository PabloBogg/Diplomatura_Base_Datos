
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[ultimaInscripcionCurso]
(
	-- Add the parameters for the function here
	@entrada int
)
RETURNS date
AS
BEGIN
	-- Declare the return variable here
	DECLARE @fecha date

	-- Add the T-SQL statements to compute the return value here
	SET @fecha=(SELECT MAX(fechaInscripcion) FROM inscripciones WHERE idCurso=@entrada)

	-- Return the result of the function
	RETURN @fecha

END
GO

