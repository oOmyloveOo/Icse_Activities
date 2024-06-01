CREATE DATABASE TheRankerThatCantScapeRoom;

CREATE TABLE Ranker (
    Ranker_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Level INT,
    Experience INT
);

CREATE TABLE Dungeon (
    Dungeon_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Difficulty VARCHAR(20),
    Capacity INT
);

CREATE TABLE Status_Window (
    Status_Window_ID INT PRIMARY KEY,
    Ranker_ID INT,
    Dungeon_ID INT,
    Status VARCHAR(20),
    Time_taken INT,
    FOREIGN KEY (Ranker_ID) REFERENCES Ranker(Ranker_ID) ON DELETE CASCADE,
    FOREIGN KEY (Dungeon_ID) REFERENCES Dungeon(Dungeon_ID) ON DELETE SET NULL
);

CREATE TABLE Item (
    Item_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Type VARCHAR(20),
    Effect VARCHAR(100)
);

CREATE TABLE Inventory (
    Ranker_ID INT,
    Item_ID INT,
    PRIMARY KEY (Ranker_ID, Item_ID),
    FOREIGN KEY (Ranker_ID) REFERENCES Ranker(Ranker_ID),
    FOREIGN KEY (Item_ID) REFERENCES Item(Item_ID)
);

CREATE TABLE Dungeon_Item (
    Dungeon_ID INT,
    Item_ID INT,
    PRIMARY KEY (Dungeon_ID, Item_ID),
    FOREIGN KEY (Dungeon_ID) REFERENCES Dungeon(Dungeon_ID),
    FOREIGN KEY (Item_ID) REFERENCES Item(Item_ID)
);

CREATE TABLE Quest (
    Quest_ID INT PRIMARY KEY,
    Dungeon_ID INT,
    Description VARCHAR(255),
    Status VARCHAR(20),
    FOREIGN KEY (Dungeon_ID) REFERENCES Dungeon(Dungeon_ID)
);
