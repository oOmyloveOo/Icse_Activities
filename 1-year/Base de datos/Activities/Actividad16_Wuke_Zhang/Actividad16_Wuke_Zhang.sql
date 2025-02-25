/*1 - Mostar el nombre de los dueños que tengan mascotas. */
SELECT DISTINCT owner.name 
FROM owner
JOIN pet ON owner.id = pet.owner_id;

/*2 - Mostar el nombre de los dueños que tengan mascotas que sean pájaros. */
SELECT DISTINCT owner.name
FROM owner
JOIN pet ON owner.id=pet.owner_id
WHERE pet.specie = 'bird';

/*3 - ¿Cuántos dueños tienen mascotas que sean pájaros? */
SELECT  COUNT(DISTINCT owner.id) AS  "Number of owners with birds"
FROM owner
JOIN pet ON owner.id = pet.owner_id
WHERE pet.specie='bird';

/*4 - Mostar el nombre de los dueños que tengan mascotas y el nombre de las mismas. */
SELECT  owner.name, pet.name
FROM    owner
INNER JOIN pet ON owner.id = pet.owner_id;

/*5 - Mostar el nombre de las mascotas que tengan dueños y el nombre de los mismos. */
SELECT   pet.name , owner.name
FROM     pet
INNER JOIN owner ON pet.owner_id = owner.id;

/*6 - Mostar el nombre de las mascotas que no tengan dueños. */
SELECT pet.name
FROM pet
WHERE pet.owner_id IS NULL;

/*7 - Mostrar los dueños que tengan gatos. */
SELECT  DISTINCT owner.name
FROM owner 
JOIN pet ON owner.id = pet.owner_id
WHERE pet.specie ='cat';

/*8 - Mostrar el dueño de la mascota llamada Connors. */
SELECT owner.name
FROM owner
JOIN pet ON owner.id = pet.owner_id
WHERE  pet.name = 'Connors';