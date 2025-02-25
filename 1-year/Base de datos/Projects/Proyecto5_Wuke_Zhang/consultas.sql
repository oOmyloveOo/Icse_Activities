/* 1 - Publicaciones recientes */
SELECT *
FROM publicaciones
WHERE publicado = 1
ORDER BY creado DESC;

/* 2 - Publicaciones más antiguas */
SELECT id, titulo, contenido, publicado, creado
FROM publicaciones
WHERE publicado = 1
ORDER BY creado ASC;

/* 3 - Las 10 publicaciones más recientes */
SELECT *
FROM publicaciones
WHERE publicado = 1
ORDER BY creado DESC
LIMIT 10;

/* 4 - Publicaciones hechas entre un rango de fechas determinado */
-- Publicaciones hechas entre un este rango de fechas '2012-03-01 00:00:00' AND '2012-03-01 23:59:59'
SELECT id, titulo, contenido, publicado, creado
FROM publicaciones
WHERE creado BETWEEN '2012-03-01 00:00:00' AND '2012-03-01 23:59:59'
AND publicado = 1;

/* 5 - Publicaciones hechas por un usuario determinado (Dashawn Renner) */
SELECT id, titulo, contenido, publicado, creado
FROM publicaciones
WHERE usuario_id = (
    SELECT id
    FROM usuarios
    WHERE nombre = 'Dashawn Renner'
)
AND publicado = 1;

/* 6 - Publicaciones hechas con una serie de etiquetas (HTML y CSS) */
SELECT *
FROM publicaciones
WHERE id IN (
    SELECT publicacion_id
    FROM etiquetas_publicaciones
    WHERE etiqueta_id IN (
        SELECT id
        FROM etiquetas
        WHERE nombre IN ('HTML', 'CSS')
    )
);

/* 7 - Los 5 usuarios más activos (los que más publicaciones hayan hecho) */
SELECT u.nombre, COUNT(p.id) AS publicaciones
FROM usuarios u, publicaciones p
WHERE u.id = p.usuario_id
GROUP BY u.id
ORDER BY publicaciones DESC
LIMIT 5;

/* 8 - La cantidad de publicaciones que hay en total */
SELECT COUNT(*) AS  total_publicaciones
FROM  publicaciones;

/* 9 - Listar el nombre de los usuarios con la cantidad de publicaciones que ha hecho cada uno */
SELECT u.nombre, COUNT(p.id) as publicaciones_por_usuario
FROM usuarios u, publicaciones p
WHERE u.id = p.usuario_id
GROUP BY u.id, u.nombre;

/* 10 - Listar el nombre de los usuarios con su determinado rol */
SELECT u.nombre, r.nombre AS rol
FROM usuarios u, roles r
WHERE u.rol_id = r.id;

/* 11 - Listar las etiquetas ordenadas por la cantidad de publicaciones que tengan */
SELECT e.nombre, COUNT(ep.publicacion_id) AS cantidad_publicaciones
FROM etiquetas e, etiquetas_publicaciones ep
WHERE e.id = ep.etiqueta_id
GROUP BY e.id, e.nombre
ORDER BY cantidad_publicaciones DESC;