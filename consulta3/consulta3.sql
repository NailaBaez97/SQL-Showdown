/*Calcula el promedio de Score de los Posts por cada usuario y muestra el DisplayName
del usuario junto con el promedio de Score.
Para esto agrupa los posts por OwnerUserId, calcula el promedio de Score para cada
usuario y muestra el resultado junto con el nombre del usuario. Presenta los resultados
en una tabla mostrando las columnas DisplayName y el promedio de Score*/
SELECT TOP 200 Users.DisplayName, AVG(Posts.Score) AS AVGScore
FROM Posts
JOIN Users ON Posts.OwnerUserId = Users.Id
GROUP BY Users.DisplayName