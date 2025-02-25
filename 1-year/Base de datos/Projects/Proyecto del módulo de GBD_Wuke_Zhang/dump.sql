-- MariaDB dump 10.19  Distrib 10.4.28-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: TheRankerThatCantScapeRoom
-- ------------------------------------------------------
-- Server version	10.4.28-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `dungeon`
--

DROP TABLE IF EXISTS `dungeon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dungeon` (
  `Id_Dungeon` int(11) NOT NULL,
  `Ranker_Id` int(11) DEFAULT NULL,
  `Quest_Id` int(11) DEFAULT NULL,
  `Name` varchar(15) DEFAULT NULL,
  `Difficulty` varchar(15) DEFAULT NULL,
  `Capacity` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id_Dungeon`),
  KEY `Ranker_Id` (`Ranker_Id`),
  KEY `Quest_Id` (`Quest_Id`),
  CONSTRAINT `dungeon_ibfk_1` FOREIGN KEY (`Ranker_Id`) REFERENCES `ranker` (`Id_Ranker`) ON DELETE CASCADE,
  CONSTRAINT `dungeon_ibfk_2` FOREIGN KEY (`Quest_Id`) REFERENCES `quest` (`Id_Quest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dungeon`
--

LOCK TABLES `dungeon` WRITE;
/*!40000 ALTER TABLE `dungeon` DISABLE KEYS */;
INSERT INTO `dungeon` VALUES (1,1,1,'Dark Cave','Extreme',10);
/*!40000 ALTER TABLE `dungeon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dungeon_item`
--

DROP TABLE IF EXISTS `dungeon_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dungeon_item` (
  `Dungeon_Id` int(11) NOT NULL,
  `Item_Id` int(11) NOT NULL,
  PRIMARY KEY (`Dungeon_Id`,`Item_Id`),
  KEY `Item_Id` (`Item_Id`),
  CONSTRAINT `dungeon_item_ibfk_1` FOREIGN KEY (`Dungeon_Id`) REFERENCES `dungeon` (`Id_Dungeon`) ON DELETE CASCADE,
  CONSTRAINT `dungeon_item_ibfk_2` FOREIGN KEY (`Item_Id`) REFERENCES `item` (`Id_Item`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dungeon_item`
--

LOCK TABLES `dungeon_item` WRITE;
/*!40000 ALTER TABLE `dungeon_item` DISABLE KEYS */;
INSERT INTO `dungeon_item` VALUES (1,1),(1,2);
/*!40000 ALTER TABLE `dungeon_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory` (
  `Ranker_Id` int(11) NOT NULL,
  `Item_Id` int(11) NOT NULL,
  PRIMARY KEY (`Ranker_Id`,`Item_Id`),
  KEY `Item_Id` (`Item_Id`),
  CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`Ranker_Id`) REFERENCES `ranker` (`Id_Ranker`) ON DELETE CASCADE,
  CONSTRAINT `inventory_ibfk_2` FOREIGN KEY (`Item_Id`) REFERENCES `item` (`Id_Item`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES (1,1),(1,2);
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item` (
  `Id_Item` int(11) NOT NULL,
  `Name` varchar(15) DEFAULT NULL,
  `Type` varchar(15) DEFAULT NULL,
  `Effect` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Id_Item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,'Key','Tool','Unlock doors'),(2,'Flashlight','Tool','Illuminate dark area');
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quest`
--

DROP TABLE IF EXISTS `quest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quest` (
  `Id_Quest` int(11) NOT NULL,
  `Description` varchar(100) DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Id_Quest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quest`
--

LOCK TABLES `quest` WRITE;
/*!40000 ALTER TABLE `quest` DISABLE KEYS */;
INSERT INTO `quest` VALUES (1,'Find the hidden treasure','Incomplete'),(2,'Defeat the dragon','Incomplete'),(3,'Rescue the trapped elf','Complete');
/*!40000 ALTER TABLE `quest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ranker`
--

DROP TABLE IF EXISTS `ranker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ranker` (
  `Id_Ranker` int(11) NOT NULL,
  `Name` varchar(15) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `Job` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Id_Ranker`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ranker`
--

LOCK TABLES `ranker` WRITE;
/*!40000 ALTER TABLE `ranker` DISABLE KEYS */;
INSERT INTO `ranker` VALUES (1,'Jhosefer Franz ',30,'Hero');
/*!40000 ALTER TABLE `ranker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status_window`
--

DROP TABLE IF EXISTS `status_window`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status_window` (
  `Id_Status_Window` int(11) NOT NULL,
  `Ranker_Id` int(11) DEFAULT NULL,
  `Level` int(11) DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  `IQ` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id_Status_Window`),
  KEY `Ranker_Id` (`Ranker_Id`),
  CONSTRAINT `status_window_ibfk_1` FOREIGN KEY (`Ranker_Id`) REFERENCES `ranker` (`Id_Ranker`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_window`
--

LOCK TABLES `status_window` WRITE;
/*!40000 ALTER TABLE `status_window` DISABLE KEYS */;
INSERT INTO `status_window` VALUES (1,1,5,'Active',120),(2,NULL,3,'Dead',110);
/*!40000 ALTER TABLE `status_window` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-02  0:45:45
