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