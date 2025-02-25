CREATE DATABASE taller;

USE taller;

CREATE TABLE cars(
    id_car INT PRIMARY KEY AUTO_INCREMENT,
    brand VARCHAR (15) NOT NULL,
    model VARCHAR (15) NOT NULL,
    license VARCHAR (15) NOT NULL UNIQUE
);

CREATE TABLE parts(
    id_part INT PRIMARY KEY AUTO_INCREMENT,
    id_mechanic INT not null,
    entry_date DATE NOT NULL,
    output_date DATE,
    cars_id INT NOT NULL,
    CONSTRAINT FK_parts_cars FOREIGN KEY (cars_id)
    REFERENCES cars(id_car)
    CONSTRAINT FK_parts_mechanic FOREIGN KEY(id_mechanic)
    REFERENCES mechanic(id_mechanic)
);

CREATE TABLE mechanic(
    id_mechanic INT PRIMARY KEY AUTO_INCREMENT,
    speciality ENUM('electronic','mechanic') NOT NULL;
);


INSERT INTO cars (brand, model, license) 
VALUES('Renault', 'Megane', '9876DMG'),
('Nissan', 'Micra', '6785FXJ'),
('Toyota', 'Yaris', '3452HJM');

INSERT INTO parts (id_mechanic, entry_date, output_date,cars_id) 
VALUES(10, '2023-12-18', '2023-12-19',2),
(20, DATE_FORMAT(STR_TO_DATE('17/12/2023', '%d/%m/%Y'), '%Y-%m-%d'),NULL,3),
(30, '2023-12-20',NULL,2);

SELECT * FROM parts
JOIN cars ON cars_id=id_cars;

CREATE TABLE refill_and_consumable(
    id_refill_and_consumable INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR (15) NOT NULL,
    amount_stock INT NOT NULL
);

INSERT INTO refill_and_consumable (name,amount_stock)
VALUES('oil 5w50', 100),
('water bomb', 3),
('Timing Belt Kit', 2);

CREATE TABLE parts_refill_and_consumable(
    id_parts_refill_and_consumable INT PRIMARY KEY AUTO_INCREMENT,
    id_parts INT NOT NULL,
    id_refill_and_consumable INT NOT NULL,
    CONSTRAINT FK_parts_refill_and_consumable_1 FOREIGN KEY (id_parts)
    REFERENCES parts(id_part) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_parts_refill_and_consumable_2 FOREIGN KEY (id_refill_and_consumable)
    REFERENCES refill_and_consumable(id_refill_and_consumable) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO parts_refill_and_consumable (id_parts,id_refill_and_consumable)
VALUES(1,1),
(3,2),
(2,2),
(2,3);

UPDATE refill_and_consumable
SET 

SELECT * FROM parts_refill_and_consumable
JOIN parts ON id_parts=id_part
JOIN refill_and_consumable ON parts_refill_and_consumable.id_refill_and_consumable=refill_and_consumable.id_refill_and_consumable
join cars ON id_car=cars_id;

SELECT brand FROM parts
LEFT JOIN cars on id_car=cars_id

select name from parts_refill_and_consumable
right JOIN refill_and_consumable ON refill_and_consumable.id_refill_and_consumable=parts_refill_and_consumable.id_parts_refill_and_consumable

SELECT license from parts_refill_and_consumable
LEFT JOIN cars ON id_car = cars.id_car
where id_car = 3

select output_date from cars
RIGHT JOIN parts ON id_car = cars_id
where id_mechanic = 10

SELECT id_car, id_mechanic 
FROM cars 
FULL JOIN parts ON id_car = cars_id
ORDER BY id_car;

SELECT id_car, id_mechanic 
FROM cars 
FULL JOIN parts ON id_car = cars_id 
WHERE model = 'Micra' OR id_mechanic = 20 1
ORDER BY id_car;

select * from cars
join parts on id_car=cars_id

select * from cars
LEFT join parts on id_car=cars_id

select * from cars
RIGHT join parts on id_car=cars_id
