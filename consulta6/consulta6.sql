/*Elimina todos los comentarios realizados por usuarios con menos de 100 de reputaci�n.
Utiliza una consulta de eliminaci�n para eliminar todos los comentarios realizados y
muestra un mensaje indicando cu�ntos comentarios fueron eliminados*/
DECLARE @DeletedRows INT;

-- Elimina los comentarios y guarda el n�mero de filas afectadas
DELETE FROM Comments
WHERE UserId IN (
    SELECT UserId
    FROM Users
    WHERE Reputation < 100
);

-- Guarda el n�mero de filas eliminadas en la variable
SET @DeletedRows = @@ROWCOUNT;

-- Muestra un mensaje indicando cu�ntos comentarios fueron eliminados
PRINT CAST(@DeletedRows AS NVARCHAR(10)) + ' comentarios fueron eliminados';
