DROP TABLE IF EXISTS movies;
CREATE TABLE movies (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(10) NOT NULL,
    genre VARCHAR(10) NOT NULL,
    year INT NOT NULL,
    country VARCHAR(10) NOT NULL,
    price DECIMAL(5,1) NOT NULL
);

INSERT INTO movies (id, name, genre, year, country, price) VALUES
(1, 'El felpudo mágico', 'Comedia', 1995, 'Francia', 4.0),
(2, 'Two Much', 'Comedia', 1995, 'España', 3.5),
(3, 'El día de la bestia', 'Comedia', 1996, 'España', 3.0),
(4, 'Extasis', 'Drama', 1995, 'España', 4.0),
(5, 'Apolo 13', 'Suspense', 1995, 'España', 4.5),
(6, 'Desperado', 'Acción', 1995, 'EEUU', 3.0),
(7, 'Pena de muerte', 'Drama', 1996, 'EEUU', 3.0);

DROP TABLE IF EXISTS rentings;
DROP TABLE IF EXISTS members;
CREATE TABLE members (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    registerDay DATE NOT NULL,
    phone VARCHAR(10) NOT NULL,
    DNI VARCHAR(10) UNIQUE NOT NULL,
    address VARCHAR(10)
);

INSERT INTO members (id, name, registerDay, phone, DNI, address) VALUES
(1, 'Antonio Olmo García', '2010-01-20', '111111111', '45111111A', NULL),
(2, 'Miguel Armas Ruíz', '2010-05-23', '222222222', '45222222B', NULL),
(3, 'Antonio López Pérez', '2009-04-13', '333333333', '45333333C', NULL),
(4, 'Teresa Sánchez Sanz', '2009-08-22', '444444444', '45444444D', 'Baeza, 12, 5A\nLa Valeta, 25\nÁlamos, 23\nCerón, 3, 2B'),
(5, 'María Santana Santana', '2010-12-12', '555555555', '45555555E', 'Avd Marítima'),
(6, 'Nuria Marrero López', '2009-05-11', '666666666', '45666666F', 'La luna, 2'),
(7, 'Benito Pérez Galdós', '2010-11-02', '777777777', '45777777G', 'Falsa, 123');

DROP TABLE IF EXISTS rentings;
CREATE TABLE rentings (
    id INT PRIMARY KEY AUTO_INCREMENT,
    member_id INT NOT NULL,
    movie_id INT NOT NULL,
    dateOut DATE NOT NULL,
    dateln DATE,
    CONSTRAINT FK_rentings_members FOREIGN KEY(member_id) 
    REFERENCES members(id),
    CONSTRAINT  FK_rentings_movies FOREIGN KEY(movie_id)  
    REFERENCES movies(id)
);

INSERT INTO rentings (id, member_id, movie_id, dateOut, dateln) VALUES
(1, 1, 4, '2010-07-12', '2010-07-13'),
(2, 3, 7, '2010-09-11', NULL),
(3, 4, 3, '2011-01-24', '2011-01-25'),
(4, 4, 5, '2011-01-01', NULL),
(5, 2, 2, '2011-01-21', '2011-01-22'),
(6, 5, 1, '2011-01-24', '2011-01-27'),
(7, 1, 7, '2011-01-22', '2011-01-23');

/*1 - Consultar el código, nombre y fecha de ingreso en el videoclub de los socios con apellido
López.*/
SELECT id, name, registerDay
FROM members 
WHERE name LIKE "% López%";

/*2 - ¿Cuántas personas se hicieron socias en el último trimestre de 2010? */
SELECT COUNT(*) AS new_members_count
FROM members
WHERE YEAR(registerDay) = 2010 
AND QUARTER(registerDay) = 4;

/*3 - Consultar los datos de los socios ordenados por la fecha de ingreso. */
SELECT * 
FROM members
ORDER BY  registerDay ASC;

/*4 - ¿Cuál es el precio medio de una película en el videoclub? */
SELECT ROUND(AVG(price), 2) AS Average_Price
FROM movies;

/*5 - ¿Cuántas películas están por encima del precio medio?*/
SELECT COUNT(*)  AS Above_Average_Movies
FROM movies
WHERE price > (SELECT AVG(price) FROM movies);

/*6 - Consultar los préstamos que han tenido una duración superior a dos días, visualizando el
nombre del socio y el título de la película. */
SELECT members.name, movies.name
FROM rentings
INNER JOIN members ON rentings.member_id = members.id
INNER JOIN movies ON rentings.movie_id = movies.id
WHERE DATEDIFF(dateln, dateOut) > 2;

/*7 - Consultar el nombre de los socios que han alquilado la película “Desperado”. */
SELECT members.name
FROM rentings
INNER JOIN members ON rentings.member_id = members.id
INNER JOIN movies ON rentings.movie_id = movies.id
WHERE movies.name =  "Desperado";

/*8 - Mostrar la lista de socios y la cantidad de películas que han alquilado.*/
SELECT members.id, members.name, COUNT(rentings.id)
FROM rentings
RIGHT JOIN members ON  rentings.member_id = members.id
GROUP BY members.id, members.name;

/*9 - Mostrar el precio que ha pagado el socio número 1 al alquilar la película 4.*/
SELECT movies.price
FROM rentings
INNER JOIN members ON rentings.member_id = members.id
INNER JOIN movies ON rentings.movie_id = movies.id
WHERE rentings.member_id = 1 AND  rentings.movie_id = 4;

/*10 - Mostrar la lista de películas que no han sido alquiladas. */
SELECT *
FROM movies
LEFT JOIN rentings ON movies.id = rentings.movie_id
WHERE rentings.movie_id IS NULL;