/*Encuentra el DisplayName de los usuarios que han realizado más de 100 comentarios
en total. Para esto utiliza una subconsulta para calcular el total de comentarios por
usuario y luego filtra aquellos usuarios que hayan realizado más de 100 comentarios en
total. Presenta los resultados en una tabla mostrando el DisplayName de los usuarios*/
SELECT TOP 200 DisplayName
FROM Users
WHERE (SELECT COUNT(*) FROM Comments WHERE Comments.UserId = Users.Id) > 100;
