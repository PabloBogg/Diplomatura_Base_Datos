-- 6.5
SELECT * FROM alumnos;

-- 6.6
SELECT * FROM inscripciones;

-- 6.7
SELECT dsCurso "Nombre del Curso", count(idAlumno) "Cantidad de Alumnos" 
FROM cursos
JOIN inscripciones
ON cursos.idCurso=inscripciones.idCurso
GROUP BY dsCurso
ORDER BY count(idAlumno) DESC;

-- 6.9
exec dbo.cursosPorAlumnos 1;

-- 6.10
SELECT dbo.ultimaInscripcionCurso (2);

-- EXTRA
SELECT * FROM cursos;
SELECT * FROM inscripciones;
DELETE FROM cursos WHERE idCurso=1;