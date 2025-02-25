CREATE DATABASE TheRankerThatCantScapeRoom;
USE TheRankerThatCantScapeRoom;

--Creacion de tablas.

-- Tabla Rankers
CREATE TABLE Ranker (
    Id_Ranker INT PRIMARY KEY,
    Name VARCHAR(15),
    Age INT,
    Job VARCHAR(20)
);

-- Tabla Quest (necesaria antes de Dungeon)
CREATE TABLE Quest (
    Id_Quest INT PRIMARY KEY,
    Description VARCHAR(100),
    Status VARCHAR(20)
);

-- Tabla Dungeon
CREATE TABLE Dungeon (
    Id_Dungeon INT PRIMARY KEY,
    Ranker_Id INT,
    Quest_Id INT,
    Name VARCHAR(15),
    Difficulty VARCHAR(15),
    Capacity INT,
    FOREIGN KEY (Ranker_Id) REFERENCES Ranker(Id_Ranker) ON DELETE CASCADE,
    FOREIGN KEY (Quest_Id) REFERENCES Quest(Id_Quest)
);

-- Tabla Status_Window
CREATE TABLE Status_Window (
    Id_Status_Window INT PRIMARY KEY,
    Ranker_Id INT,
    Level INT,
    Status VARCHAR(20), 
    IQ INT,
    FOREIGN KEY (Ranker_Id) REFERENCES Ranker(Id_Ranker) ON DELETE SET NULL
);

-- Tabla Item
CREATE TABLE Item (
    Id_Item INT PRIMARY KEY,
    Name VARCHAR(15),
    Type VARCHAR(15),
    Effect VARCHAR(20)
);

-- Tabla Inventory (relación M:M entre Ranker e Item)
CREATE TABLE Inventory (
    Ranker_Id INT,
    Item_Id INT,
    PRIMARY KEY (Ranker_Id, Item_Id),
    FOREIGN KEY (Ranker_Id) REFERENCES Ranker(Id_Ranker) ON DELETE CASCADE,
    FOREIGN KEY (Item_Id) REFERENCES Item(Id_Item) ON DELETE CASCADE
);

-- Tabla Dungeon_Item (relación M:M entre Dungeon e Item)
CREATE TABLE Dungeon_Item (
    Dungeon_Id INT,
    Item_Id INT,
    PRIMARY KEY (Dungeon_Id, Item_Id),
    FOREIGN KEY (Dungeon_Id) REFERENCES Dungeon(Id_Dungeon) ON DELETE CASCADE,
    FOREIGN KEY (Item_Id) REFERENCES Item(Id_Item) ON DELETE CASCADE
);

--Inserts de prueba

-- Insertar datos en Quest primero
INSERT INTO Quest (Id_Quest, Description, Status) VALUES (1, 'Find the hidden treasure', 'Incomplete');
INSERT INTO Quest (Id_Quest, Description, Status) VALUES (2, 'Defeat the dragon', 'Incomplete');
INSERT INTO Quest (Id_Quest, Description, Status) VALUES (3, 'Rescue the trapped elf', 'Complete');

-- Insertar datos en Ranker
INSERT INTO Ranker (Id_Ranker, Name, Age, Job) VALUES (1, 'Jhosefer Franz Lorenz', 25, 'Hero');
INSERT INTO Ranker (Id_Ranker, Name, Age, Job) VALUES (2, 'Player2', 30, 'Mage');

-- Insertar datos en Dungeon
INSERT INTO Dungeon (Id_Dungeon, Ranker_Id, Quest_Id, Name, Difficulty, Capacity) VALUES (1, 1, 1, 'Dark Cave', 'Hard', 10);
INSERT INTO Dungeon (Id_Dungeon, Ranker_Id, Quest_Id, Name, Difficulty, Capacity) VALUES (2, 2, 2, 'Mystic Forest', 'Medium', 5);

-- Insertar datos en Status_Window
INSERT INTO Status_Window (Id_Status_Window, Ranker_Id, Level, Status, IQ) VALUES (1, 1, 5, 'Active', 120);
INSERT INTO Status_Window (Id_Status_Window, Ranker_Id, Level, Status, IQ) VALUES (2, 2, 3, 'Inactive', 110);

-- Insertar datos en Item
INSERT INTO Item (Id_Item, Name, Type, Effect) VALUES (1, 'Key', 'Tool', 'Unlock doors');
INSERT INTO Item (Id_Item, Name, Type, Effect) VALUES (2, 'Flashlight', 'Tool', 'Illuminate dark areas');

-- Insertar datos en Inventory
INSERT INTO Inventory (Ranker_Id, Item_Id) VALUES (1, 1);
INSERT INTO Inventory (Ranker_Id, Item_Id) VALUES (1, 2);
INSERT INTO Inventory (Ranker_Id, Item_Id) VALUES (2, 1);

-- Insertar datos en Dungeon_Item
INSERT INTO Dungeon_Item (Dungeon_Id, Item_Id) VALUES (1, 1);
INSERT INTO Dungeon_Item (Dungeon_Id, Item_Id) VALUES (1, 2);
INSERT INTO Dungeon_Item (Dungeon_Id, Item_Id) VALUES (2, 1);

--Updates

-- Actualizar edad del Ranker
UPDATE Ranker SET Age = 30 WHERE Id_Ranker = 1;

-- Actualizar dificultad de la Dungeon
UPDATE Dungeon SET Difficulty = 'Extreme' WHERE Id_Dungeon = 1;

-- Actualizar estado de la Status_Window
UPDATE Status_Window SET Status = 'Dead' WHERE Id_Status_Window = 2;

--Deletes

-- Eliminar un Ranker porque ha muerto
DELETE FROM Ranker WHERE Id_Ranker = 2;

-- Consultas con diferentes tipos de joins

-- Obtener los nombres de los jugadores y los nombres de las mazmorras en las que están asignados.
SELECT Ranker.Name AS Ranker_Name, Dungeon.Name AS Dungeon_Name
FROM Ranker
INNER JOIN Dungeon ON Ranker.Id_Ranker = Dungeon.Ranker_Id;

-- Obtener los nombres de los jugadores y los estados de sus ventanas de estado.
SELECT Ranker.Name AS Ranker_Name, Status_Window.Status AS Status
FROM Ranker
INNER JOIN Status_Window ON Ranker.Id_Ranker = Status_Window.Ranker_Id;

-- Obtener los nombres de los jugadores y los estados de sus ventanas de estado, incluyendo jugadores sin una ventana de estado.
SELECT Ranker.Name AS Ranker_Name, Status_Window.Status AS Status
FROM Ranker
LEFT JOIN Status_Window ON Ranker.Id_Ranker = Status_Window.Ranker_Id;

-- Obtener los nombres de las mazmorras y los nombres de los jugadores asignados, incluyendo mazmorras sin jugadores asignados.
SELECT Dungeon.Name AS Dungeon_Name, Ranker.Name AS Ranker_Name
FROM Dungeon
LEFT JOIN Ranker ON Dungeon.Ranker_Id = Ranker.Id_Ranker;

-- Obtener los nombres de los jugadores y los nombres de las mazmorras en las que están asignados, incluyendo mazmorras sin jugadores asignados.
SELECT Ranker.Name AS Ranker_Name, Dungeon.Name AS Dungeon_Name
FROM Ranker
RIGHT JOIN Dungeon ON Ranker.Id_Ranker = Dungeon.Ranker_Id;

-- Obtener los nombres de los ítems y los nombres de las mazmorras en las que están disponibles, incluyendo ítems no asignados a ninguna mazmorra.
SELECT Item.Name AS Item_Name, Dungeon.Name AS Dungeon_Name
FROM Item
RIGHT JOIN Dungeon_Item ON Item.Id_Item = Dungeon_Item.Item_Id
RIGHT JOIN Dungeon ON Dungeon_Item.Dungeon_Id = Dungeon.Id_Dungeon;

-- Utilizar dos veces las claúsulas group by, having, where y like.

-- Agrupar los jugadores por edad y contar cuántos jugadores hay en cada grupo de edad.
SELECT Age, COUNT(*) AS Num_Rankers
FROM Ranker
GROUP BY Age;

-- Agrupar las ventanas de estado por estado y contar cuántas ventanas de estado hay en cada grupo, mostrando solo los grupos con más de 1 ventana de estado.
SELECT Status, COUNT(*) AS Num_Status_Windows
FROM Status_Window
GROUP BY Status
HAVING COUNT(*) > 1;

-- Seleccionar todos los ítems cuyo nombre contenga 'Key'.
SELECT *
FROM Item
WHERE Name LIKE '%Key%';

-- Seleccionar todos los jugadores cuyo nombre comience con 'Player' y que sean mayores de 20 años.
SELECT *
FROM Ranker
WHERE Name LIKE 'Player%' AND Age > 20;

-- Agrupar las mazmorras por dificultad y contar cuántas mazmorras hay en cada grupo de dificultad, mostrando solo los grupos con capacidad mayor a 5.
SELECT Difficulty, COUNT(*) AS Num_Dungeons
FROM Dungeon
WHERE Capacity > 5
GROUP BY Difficulty;

-- Agrupar los ítems por tipo y contar cuántos ítems hay en cada grupo de tipo, mostrando solo los grupos con más de 1 ítem.
SELECT Type, COUNT(*) AS Num_Items
FROM Item
GROUP BY Type
HAVING COUNT(*) > 1;

-- Seleccionar todas las mazmorras cuyo nombre contenga 'Forest' y cuya dificultad sea 'Medium'.
SELECT *
FROM Dungeon
WHERE Name LIKE '%Forest%' AND Difficulty = 'Medium';

-- Seleccionar todas las misiones cuyo estado contenga 'Complete' y cuya descripción contenga 'treasure'.
SELECT *
FROM Quest
WHERE Status LIKE '%Complete%' AND Description LIKE '%treasure%';

