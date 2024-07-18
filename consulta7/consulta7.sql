/*Para cada usuario, muestra el número total de publicaciones (Posts), comentarios
(Comments) y medallas (Badges) que han realizado. Utiliza uniones (JOIN) para combinar
la información de las tablas Posts, Comments y Badges por usuario. Presenta los
resultados en una tabla mostrando el DisplayName del usuario junto con el total de
publicaciones, comentarios y medallas*/
WITH UserPosts AS (
    SELECT OwnerUserId, COUNT(DISTINCT Id) AS TotalPosts
    FROM Posts
    GROUP BY OwnerUserId
),
UserComments AS (
    SELECT UserId, COUNT(DISTINCT Id) AS TotalComments
    FROM Comments
    GROUP BY UserId
),
UserBadges AS (
    SELECT UserId, COUNT(DISTINCT Id) AS TotalBadges
    FROM Badges
    GROUP BY UserId
)
SELECT TOP 100
    Users.DisplayName, 
    ISNULL(UserPosts.TotalPosts, 0) AS TotalPosts,
    ISNULL(UserComments.TotalComments, 0) AS TotalComments,
    ISNULL(UserBadges.TotalBadges, 0) AS TotalBadges
FROM 
    Users
LEFT JOIN 
    UserPosts ON UserPosts.OwnerUserId = Users.Id
LEFT JOIN 
    UserComments ON UserComments.UserId = Users.Id
LEFT JOIN 
    UserBadges ON UserBadges.UserId = Users.Id
ORDER BY 
    Users.DisplayName;