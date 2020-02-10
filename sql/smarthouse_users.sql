-- MySQL dump 10.13  Distrib 5.7.29, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: smarthouse
-- ------------------------------------------------------
-- Server version	5.7.29-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `login` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(120) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `address` text,
  `description` text,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_login` timestamp NULL DEFAULT NULL,
  `role_id` int(11) DEFAULT '1',
  PRIMARY KEY (`login`),
  UNIQUE KEY `email_idx` (`login`),
  KEY `fk_users_1_idx` (`role_id`),
  CONSTRAINT `fk_users_role` FOREIGN KEY (`role_id`) REFERENCES `user_roles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('a.evlampiev','783ac652c5f64ab07ccb3e410aa97fc09687cc33b48qf','Artyom Evlampiev','322223','artem@gmail.com','Moscow, Birulevskaya','Some additional info','2020-01-03 11:29:18',NULL,1),('admin','$2y$10$vpbf2pIYyrx0MJhqrA.VEelrzJ6zfEPOcB68uYuSGkrfJgrIIjNwa','Администратор системы',NULL,'kevlampiev@gmail.com',NULL,NULL,'2019-12-21 20:48:59',NULL,2),('alexa','alexa','Alexa Wood','','',NULL,NULL,'2019-12-22 04:47:25',NULL,1),('arhangel','783ac658c4205ec33d8f6caeaaaa0c10a14138c3b48qf','Arhangel Adrian','no phone','adrian@arhangel.com','Heaven','','2020-01-03 12:30:52',NULL,1),('arhimandrid','783ac652da6687edec690dece8c371cd1a9866d3b48qf','arhimandrid Eugeni','','arhimandrid@mail.com','','','2020-01-03 13:19:11',NULL,1),('jorn','783ac65d8578edf8458ce06fbc5bb76a58c5ca43b48qf','Jorn Landre','','jorn@mail.ru','','','2020-01-03 14:06:15',NULL,1),('kevlampiev','112','Константин Евлампиев','89632883655','kevlampiev@gmail.com',NULL,NULL,'2019-12-22 04:42:43',NULL,1),('leshiy','783ac6567dd010e56986a40d8a6695c36542bb53b48qf','Alex Fitness','89632883655','kevlampiev@gmail.com','','','2020-01-03 11:20:29',NULL,1),('Maxim','783ac6533fd8226b5c19530fa30444978894f113b48qf','Максим Евлампиев','','m.evlampiev@gmail.com','','','2020-01-05 12:10:59',NULL,1),('sho','783ac65cf57c97b62b5eda9144cc631dfa38eb63b48qf','Sho Gi Bop','89632883655','sho@mail.ru','','','2020-01-03 11:22:51',NULL,1),('test','783ac65098f6bcd4621d373cade4e832627b4f63b48qf','Test Test','','test@gmail.com','','','2020-01-05 14:36:49',NULL,1),('test3','$2y$10$vpbf2pIYyrx0MJhqrA.VEelrzJ6zfEPOcB68uYuSGkrfJgrIIjNwa',' Tester Number Three Crown','+7(983)221-0274','test3@gmail.com',' Somewhere ','','2020-01-30 15:58:29',NULL,1),('test4','$2y$10$FE8s9gzKHmFj7dnoxOppiOYsfAPvyjE0hRqz8dRc7Lfvd2es7uLIi','Tester Number 4','+7(983)221-0274','test4@gmail.com','','','2020-02-01 11:01:19',NULL,1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-10 18:14:45
