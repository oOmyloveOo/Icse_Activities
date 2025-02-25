/*1 - Toda la información de las ciudades de España.*/
SELECT *  
FROM estado 
WHERE ubicacionpaisid = 28;

/*2 - El nombre de todas las ciudades de Francia.*/
SELECT estadonombre 
FROM estado 
JOIN pais ON pais.id = estado.ubicacionpaisid 
WHERE estado.ubicacionpaisid = 64 AND pais.paisnombre = 'Francia';

/*3 - Las 10 primeras ciudades de España ordenadas por orden alfabético.*/
SELECT DISTINCT  estadonombre 
FROM estado
JOIN pais ON pais.id = estado.ubicacionpaisid
WHERE pais.paisnombre = 'España'
ORDER BY estadonombre ASC LIMIT 10;

/*4 - Las 10 primeras ciudades de España que empiecen por ‘M’ pero que no esté Madrid.*/
SELECT DISTINCT estadonombre
FROM estado
JOIN pais ON pais.id=estado.ubicacionpaisid
Where estadonombre LIKE 'M%' and estadonombre != 'Madrid'
AND pais.paisnombre='España';

/*5 - Todas las ciudades que pertenezcan a España o a Francia que tengan menos de 5 letras.*/
SELECT DISTINCT estadonombre
FROM estado
JOIN pais ON pais.id=estado.ubicacionpaisid
WHERE (pais.paisnombre='España' OR pais.paisnombre='Francia') AND LENGTH(estadonombre)<5;

/*6 - Contar la cantidad de veces que está la ciudad de Madrid y Barcelona en la base de datos.*/
SELECT COUNT(*) AS cantidad
FROM estado
JOIN pais ON estado.ubicacionpaisid = pais.id
WHERE estado.estadonombre IN ('Madrid', 'Barcelona') AND pais.id = 28;

/*7 - Contar el número de países cuyo nombre son dos palabras o más.*/
SELECT COUNT(*) AS cantidad_paises
FROM pais
WHERE LENGTH(paisnombre) - LENGTH(REPLACE(paisnombre, ' ', '')) >= 1;


/*8 - El nombre de los países, cuyo nombre, empiezan y terminan por ‘A’.*/
SELECT *
FROM pais
WHERE pais.paisnombre LIKE 'A%A';

/*9 - El nombre de la ciudad cuyo id sea 250344.*/
SELECT estadonombre
FROM estado
JOIN  pais ON estado.ubicacionpaisid = pais.id
WHERE estado.id = 250344;

/*10 - Haciendo uso del INSERT, introduce en la base de datos un país inventado por ti con su
correspondiente código (también inventado) y añádele 5 ciudades (también inventadas por ti). */
INSERT INTO pais (paisnombre) VALUES ('Pacolandia');

INSERT INTO estado (ubicacionpaisid, estadonombre) VALUES
    ((SELECT id FROM pais WHERE paisnombre = 'Pacolandia'), 'Fantasilandia'),
    ((SELECT id FROM pais WHERE paisnombre = 'Pacolandia'), 'Juegotown'),
    ((SELECT id FROM pais WHERE paisnombre = 'Pacolandia'), 'Diversiónville'),
    ((SELECT id FROM pais WHERE paisnombre = 'Pacolandia'), 'Aventura City'),
    ((SELECT id FROM pais WHERE paisnombre = 'Pacolandia'), 'Emociónburg');
