-- 5.7
SELECT dsCurso "Nombre del Curso", count(idAlumno) "Cantidad de Alumnos" 
FROM cursos 
JOIN inscripciones 
ON cursos.idCurso=inscripciones.idCurso 
GROUP BY dsCurso;

-- 5.9
CALL CursosxAlumnos(1);
CALL CursosxAlumnos(2);
CALL CursosxAlumnos(3);

-- 5.10
UPDATE inscripciones SET fecha='2020-01-05' WHERE idCurso =2 AND idAlumno=1;
UPDATE inscripciones SET fecha='2023-01-10' WHERE idCurso =2 AND idAlumno=2;
UPDATE inscripciones SET fecha='2025-03-05' WHERE idCurso =3 AND idAlumno=2;
SELECT UltimaInscripcionCurso(3);

-- EXTRA
SELECT * FROM cursos;
SELECT * FROM inscripciones;
SET SQL_SAFE_UPDATES = 0;
DELETE FROM cursos WHERE idCurso=1;
