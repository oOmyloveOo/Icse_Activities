// 1. Muestra todas las partes junto con la información del coche al que están asociadas

select * from cars
join parts on id_car=cars_id

// 2. Muestra todas las partes y la información del coche al que están asociadas, incluso si
no hay coincidencias en la tabla coches.

select * from cars
LEFT join parts on id_car=cars_id

// 3. Muestra todas las partes y la información del coche al que están asociadas, incluso si
no hay coincidencias en la tabla partes.

select * from cars
RIGHT join parts on id_car=cars_id

// 4. Muestra todas las partes y la información del coche al que están asociadas, incluyendo
aquellas partes que no tienen un coche asociado y viceversa.

select * from cars 
LEFT join parts on id_car=cars_id 
WHERE cars_id is null 
UNION select * from cars 
RIGHT join parts on id_car=cars_id;

// 5. Muestra la información de los repuestos y la información del coche al que están
asociados.

SELECT id_car, brand, model, license, refill_and_consumable.id_refill_and_consumable, refill_and_consumable.name, .amount_stock
FROM cars 
JOIN parts ON id_car = cars_id 
JOIN parts_refill_and_consumable ON id_part = id_parts 
JOIN refill_and_consumable ON parts_refill_and_consumable.id_refill_and_consumable = refill_and_consumable.id_refill_and_consumable;

