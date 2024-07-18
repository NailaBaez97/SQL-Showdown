/*Actualiza la columna Location de la tabla Users cambiando todas las ubicaciones vacías
por "Desconocido". Utiliza una consulta de actualización para cambiar las ubicaciones
vacías. Muestra un mensaje indicando que la actualización se realizó correctamente.*/
BEGIN TRANSACTION;

UPDATE Users
SET Location = 'Desconocido'
WHERE Location IS NULL;

IF @@ROWCOUNT > 0
BEGIN
    PRINT 'La actualización se realizó correctamente';
END
ELSE
BEGIN
    PRINT 'No se realizaron cambios';
END

COMMIT TRANSACTION;