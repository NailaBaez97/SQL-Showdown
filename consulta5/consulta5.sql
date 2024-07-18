/*Actualiza la columna Location de la tabla Users cambiando todas las ubicaciones vac�as
por "Desconocido". Utiliza una consulta de actualizaci�n para cambiar las ubicaciones
vac�as. Muestra un mensaje indicando que la actualizaci�n se realiz� correctamente.*/
BEGIN TRANSACTION;

UPDATE Users
SET Location = 'Desconocido'
WHERE Location IS NULL;

IF @@ROWCOUNT > 0
BEGIN
    PRINT 'La actualizaci�n se realiz� correctamente';
END
ELSE
BEGIN
    PRINT 'No se realizaron cambios';
END

COMMIT TRANSACTION;