SELECT * FROM autor;

SELECT * FROM libro
JOIN Libro ON libro.id_autor=autor.id_autor
WHERE id_autor=6;

SELECT COUNT * FROM libro;

SELECT * FROM autor
WHERE id_autor NOT IN
(SELECT id_autor FROM libro);

SELECT a.nombre AS autor,l.titulo, FROM autor a
JOIN libro l ON a.id_autor=l.id_autor;

SELECT id_autor,COUNT(*) AS TotalLibros FROM libro GROUP
BY id_autor ORDER BY TotalLibros  DESC LIMIT 1;

UPDATE autor
SET nombre=¨pepa pig¨
WHERE id_autor=6;

DELETE FROM libro
WHERE titulo=