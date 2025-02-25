--1 - Listar todos los pokemon de tipo agua (exclusivamente) de la primera generación (hasta el 151- mew).
SELECT p.id, p.identifier
FROM pokemon p
JOIN pokemon_type pt ON p.id = pt.pokemon_id
WHERE pt.type_id = 11
  AND p.id <= 151
GROUP BY p.id
HAVING COUNT(pt.pokemon_id) = 1;

--2 - Listar todos los pokemon de la segunda generación (exclusivamente). 
SELECT DISTINCT p.id, p.identifier
FROM pokemon p
WHERE p.id BETWEEN 152 AND 251;

--3 - Mostrar el peso medio de los pokemon de tipo planta de la primera generación. 
SELECT AVG(p.weight) AS "Peso Medio"
FROM pokemon p
JOIN  pokemon_type pt ON p.id = pt.pokemon_id
WHERE pt.type_id = 12
AND p.id <= 151;

--4 - ¿Cuántos pokemon de la primera generación de tipo planta superan esa media? 
-- Contar cuántos Pokémon de la primera generación de tipo planta superan un peso medio específico
SELECT p.identifier, COUNT(p.id) AS count_plant_pokemon_above_average
FROM pokemon p
JOIN pokemon_type pt ON p.id = pt.pokemon_id
JOIN type t ON pt.type_id = t.id
WHERE t.identifier = 'grass'
  AND p.id <= 151
  AND p.weight > 264.8571
GROUP BY p.identifier;

-- OR consulta anidada

SELECT p.identifier, COUNT(p.id) AS count_plant_pokemon_above_average
FROM pokemon p
JOIN pokemon_type pt ON p.id = pt.pokemon_id
JOIN type t ON pt.type_id = t.id
WHERE t.identifier = 'grass'
  AND p.id <= 151 
  AND p.weight > (
    SELECT AVG(p2.weight)
    FROM pokemon p2
    JOIN pokemon_type pt2 ON p2.id = pt2.pokemon_id
    JOIN type t2 ON pt2.type_id = t2.id
    WHERE t2.identifier = 'grass'
      AND p2.id <= 151 
  )
GROUP BY  p.identifier;

--5 - Mostrar la altura media de los pokemon de la primera generación y la altura media de los pokemon de segunda generación. 
SELECT
    CASE WHEN p.id <= 151 THEN 'Primera generación' ELSE 'Segunda generación' END AS generacion,
    AVG(p.height) AS promedio_altura
FROM pokemon p
GROUP BY generacion;

--6 - Mostrar los pokemon de la primera generación que sean de más de un tipo. 
SELECT p.identifier, GROUP_CONCAT(t.identifier ORDER BY t.identifier) AS types
FROM pokemon p
INNER JOIN pokemon_type pt ON p.id = pt.pokemon_id
INNER JOIN type t ON pt.type_id = t.id
WHERE p.id <= 151
GROUP BY p.id, p.identifier
HAVING COUNT(DISTINCT t.identifier) > 1;

--7 - Mostrar los 5 pokemon más grandes (mayor altura y peso) de la primera generación. 
SELECT  p.identifier, p.height, p.weight
FROM pokemon p
WHERE p.id <= 151
ORDER BY  height DESC, weight DESC LIMIT 5;

--8 - Mostrar cuántos pokemon hay de cada tipo. 
SELECT COUNT(*) AS total, t.identifier AS type
FROM pokemon p
INNER JOIN pokemon_type pt ON p.id = pt.pokemon_id
INNER JOIN type t ON pt.type_id = t.id
GROUP BY t.identifier;
