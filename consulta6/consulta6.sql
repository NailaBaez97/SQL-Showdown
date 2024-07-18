/*Elimina todos los comentarios realizados por usuarios con menos de 100 de reputación.
Utiliza una consulta de eliminación para eliminar todos los comentarios realizados y
muestra un mensaje indicando cuántos comentarios fueron eliminados*/
DECLARE @DeletedRows INT;

-- Elimina los comentarios y guarda el número de filas afectadas
DELETE FROM Comments
WHERE UserId IN (
    SELECT UserId
    FROM Users
    WHERE Reputation < 100
);

-- Guarda el número de filas eliminadas en la variable
SET @DeletedRows = @@ROWCOUNT;

-- Muestra un mensaje indicando cuántos comentarios fueron eliminados
PRINT CAST(@DeletedRows AS NVARCHAR(10)) + ' comentarios fueron eliminados';
