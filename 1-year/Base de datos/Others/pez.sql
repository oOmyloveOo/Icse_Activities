CREATE TABLE pescados(
    id_peces INT PRIMARY KEY AUTO_INCREMENT,
    type VARCHAR(15) NOT NULL,
    price VARCHAR(15) NOT NULL
);

CREATE TABLE pescaderias(
    id_pescaderia INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(15) NOT NULL,
    domicilio VARCHAR(15) NOT NULL
);

CREATE TABLE pescaderos(
    id_pescador INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(15) NOT NULL,
    dni VARCHAR(15) NOT NULL UNIQUE,
    id_pescaderia INT NOT NULL,
    CONSTRAINT FK_pescaderos_pescaderias FOREIGN KEY (id_pescaderia)
    REFERENCES (id_pescaderia)
);

CREATE TABLE pescados_pescaderia(
    id_pescado_pescaderia INT PRIMARY KEY AUTO_INCREMENT,
    id_peces INT NOT NULL,
    id_pescaderia INT NOT NULL,
    CONSTRAINT
);