CREATE TABLE actividad1(

Id INT(15) PRIMARY KEY AUTO_INCREMENT,
Title VARCHAR(50) NOT NULL,
Release_Year INT(30) NOT NULL ,
Producer VARCHAR(35) NOT NULL,
Sypnosis VARCHAR(500) NOT NULL,
Rate ENUM("1 star", "2 star", "3 star") NOT NULL,
Seen_Or_Not_Seen ENUM("Yes", "No") NOT NULL,
MONETIZATION INT(255) NOT NULL

);

INSERT INTO actividad1 (Title,Release_Year,Producer,Sypnosis,Rate,Seen_Or_Not_Seen,Monetization)
VALUES ("Gladiador",2018,"Me","Sypnosis","3 star","Yes",20000),("Blancanieves",2000,"Fran","Synopsis","2 star","Yes",1000000),("Doraemon",2006,"Nobita","Sypnosis","2 star","Yes",80000),("Miércoles",2022,"Alvaro","Sypnosis","1 star","No",1200),("Juan Piz Stampede",2020,"Goda","Sypnosis","3 star","Yes",33300000);