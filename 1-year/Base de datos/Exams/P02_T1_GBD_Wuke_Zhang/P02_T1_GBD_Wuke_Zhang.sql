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