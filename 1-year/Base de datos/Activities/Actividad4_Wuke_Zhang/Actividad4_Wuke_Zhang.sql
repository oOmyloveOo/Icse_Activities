CREATE TABLE sudaderas(

ID INT(15) PRIMARY KEY AUTO_INCREMENT,
NAME VARCHAR(15) NOT NULL,
SURNAME_1 VARCHAR(15) NOT NULL,
SURNAME_2 VARCHAR(15),
DNI VARCHAR(15) NOT NULL UNIQUE,
MAIL VARCHAR(15) NOT NULL,
SIZE ENUM("S","M","L","XL") NOT NULL DEFAULT 'L'

);

INSERT INTO sudaderas (NAME,SURNAME_1,SURNAME_2,DNI,MAIL,SIZE)
VALUES("Alvaro","Artiles","Hernández","c66587687i","alvarom@icloud.com","M"),
("Miguel","Medina","Castellano","i565654c","Mompi@gmail.com","S"),
("Iván","Hernández","Dominguero","n65492o","Ivanazo@hotmail.com","L");


INSERT INTO sudaderas (NAME,SURNAME_1,DNI,MAIL,SIZE) 
VALUES("Wuke","Zhang","i987456p","ukelele@icloud.com","L");

INSERT INTO sudaderas (NAME,SURNAME_1,DNI,MAIL)
VALUES("Rubén","Jonay","o85125e","Rubiales@outlook.com"); 