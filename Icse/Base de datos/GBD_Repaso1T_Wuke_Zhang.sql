CREATE DATABASE taller;

USE taller;

CREATE TABLE cars(
    id_car INT PRIMARY KEY AUTO_INCREMENT,
    brand VARCHAR (15) NOT NULL,
    model VARCHAR (15) NOT NULL,
    license VARCHAR (15) NOT NULL UNIQUE
);

CREATE TABLE mechanic(
    id_mechanic INT PRIMARY KEY AUTO_INCREMENT,
    speciality ENUM('electronic','mechanic') NOT NULL;
);

CREATE TABLE parts(
    id_part INT PRIMARY KEY AUTO_INCREMENT,
    id_mechanic INT NOT NULL,
    entry_date DATE NOT NULL,
    output_date DATE,
    cars_id INT NOT NULL,
    CONSTRAINT FK_parts_cars FOREIGN KEY (cars_id)
    REFERENCES cars(id_car)
    CONSTRAINT FK_parts_mechanic FOREIGN KEY(id_mechanic)
    REFERENCES mechanic(id_mechanic)
);

INSERT INTO cars (brand, model, license) 
VALUES('Renault', 'Megane', '9876DMG'),
('Nissan', 'Micra', '6785FXJ'),
('Toyota', 'Yaris', '3452HJM');

INSERT INTO mechanic(speciality)
VALUES (10,'electronic'),
(20,'mechanic'),
(30,'mechanic');

INSERT INTO parts (id_part,id_mechanic, entry_date, output_date,cars_id) 
VALUES(1,10, '2023-12-18', '2023-12-19',2),
(2,20,'17-12-2023',NULL,3),
(3,30, '2023-12-20',NULL,2);

SELECT * FROM parts
JOIN cars ON cars_id=id_car;

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
SET amount_stock = 95
WHERE id_refill_and_consumable = 1

UPDATE refill_and_consumable
SET amount_stock = 1
WHERE id_refill_and_consumable = 2

UPDATE refill_and_consumable
SET amount_stock = 1
WHERE id_refill_and_consumable = 3 

SELECT * FROM parts_refill_and_consumable
JOIN parts ON id_parts=id_part
JOIN refill_and_consumable ON parts_refill_and_consumable.id_refill_and_consumable=refill_and_consumable.id_refill_and_consumable
join cars ON id_car=cars_id;