-- MySQL dump 10.13  Distrib 5.7.29, for Linux (x86_64)
--
-- Host: localhost    Database: smarthouse
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
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(150) NOT NULL,
  `date_open` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `good_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL DEFAULT '1',
  `order_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_2` (`user`,`good_id`),
  KEY `good_id` (`good_id`),
  KEY `user` (`user`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`good_id`) REFERENCES `goods` (`id`),
  CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`user`) REFERENCES `users` (`login`),
  CONSTRAINT `cart_ibfk_3` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (6,'test3','2020-01-22 05:26:26',1,3,NULL),(7,'test3','2020-01-22 05:43:19',3,1,NULL),(8,'test3','2020-01-22 06:35:30',2,2,NULL),(9,'test3','2020-01-22 08:34:48',4,1,NULL),(10,'test4','2020-01-22 09:44:54',3,3,NULL),(11,'test4','2020-01-22 09:50:30',2,2,NULL),(12,'test4','2020-01-22 09:50:54',4,7,NULL),(13,'test4','2020-01-22 09:51:14',1,3,NULL),(14,'test10','2020-01-25 16:36:15',3,1,NULL),(15,'test10','2020-01-25 16:36:45',1,1,NULL),(16,'test11','2020-01-25 16:53:40',2,2,NULL);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currencies` (
  `currency` char(3) NOT NULL,
  `full_name` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`currency`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT INTO `currencies` VALUES ('EUR','Euro'),('RUB',NULL),('RUR','RUSSIAN RUBLE'),('USD','US Dollar');
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_types`
--

DROP TABLE IF EXISTS `delivery_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delivery_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_types`
--

LOCK TABLES `delivery_types` WRITE;
/*!40000 ALTER TABLE `delivery_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `delivery_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedbacks`
--

DROP TABLE IF EXISTS `feedbacks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedbacks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(150) NOT NULL,
  `email` varchar(100) NOT NULL,
  `date_open` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `message` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedbacks`
--

LOCK TABLES `feedbacks` WRITE;
/*!40000 ALTER TABLE `feedbacks` DISABLE KEYS */;
INSERT INTO `feedbacks` VALUES (1,'Art','kevlampiev@gmail.com','2019-12-14 19:22:13','Something for you :)'),(2,'Subzero','kevlampiev@gmail.com','2019-12-14 19:22:35','Something for you again'),(3,'Subzero','kevlampiev@gmail.com','2019-12-14 19:26:24','Something for you again'),(4,'Subzero1112','kevlampiev@gmail.com','2019-12-14 19:28:40','Something for you again'),(5,'Subzero1112','kevlampiev@gmail.com','2019-12-14 19:35:43','Something for you again'),(6,'Rjycnfynby','kevlampiev@hotmail.com','2019-12-14 19:39:21','Lolllllll age'),(7,'Артемка','art@mail.ru','2019-12-14 20:10:53','MessageВсе что тут написано-редкостная фигня'),(48,'Rita','','2019-12-14 21:21:56','');
/*!40000 ALTER TABLE `feedbacks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `good_categories`
--

DROP TABLE IF EXISTS `good_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `good_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `good_categories`
--

LOCK TABLES `good_categories` WRITE;
/*!40000 ALTER TABLE `good_categories` DISABLE KEYS */;
INSERT INTO `good_categories` VALUES (9,'controllers'),(12,'kill me'),(4,'kits'),(2,'power supply'),(3,'security'),(10,'sensors'),(1,'smart house'),(11,'software');
/*!40000 ALTER TABLE `good_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods`
--

DROP TABLE IF EXISTS `goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `date_open` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `description` text NOT NULL,
  `img` varchar(1024) NOT NULL,
  `date_close` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `goods_ibfk_1` (`category_id`),
  CONSTRAINT `goods_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `good_categories` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods`
--

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` VALUES (1,'leak detector',1,'2019-12-15 16:33:19','leak detector description ','1.jpg',NULL),(2,'motion sencor',1,'2019-12-15 16:33:19','Датчик Движения (Motion Sensor) - электроустановка, служит источником сигнала. Можно скрафтить на верстаке после изучения навыка Наука (Science) > Переключатели и пусковые схемы (Switches and Triggers) до 3 уровня или купить у торговца. Для использования, необходимо подключить датчик к источнику питания Инструментом Электропроводки и настроить. При срабатывании пропускает сигнал на выход','2.jpg',NULL),(3,'gas detector',1,'2019-12-15 16:33:19','A gas detector is a device that detects the presence of gases in an area, often as part of a safety system. This type of equipment is used to detect a gas leak or other emissions and can interface with a control system so a process can be automatically shut down. A gas detector can sound an alarm to operators in the area where the leak is occurring, giving them the opportunity to leave.','3.jpg',NULL),(4,'Smart house kit',1,'2019-12-16 01:20:33','Xiaomi, или Сяоми (в русском произношении) - китайская компания образованная в 2010 году, ставшая известна благодаря своей прошивке MIUI, на базе Android и фирменным смартфонам. Ассортимент продукции стремительно рос, начиная от полотенец и ортопедических подушек, заканчивая бытовой техникой и электро-велосипедами. И вот в конце 2014 года Xiaomi представила систему домашней автоматизации, состоящую из умной розетки (Mi Smart Power Plug), камеры наблюдения (Yi Camera), умной лампочки (Yeelight LED) и инфракрасного блока управления бытовой техникой (IR Remote Controller).','9.jpg',NULL);
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_photos`
--

DROP TABLE IF EXISTS `goods_photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods_photos` (
  `good_id` int(11) NOT NULL,
  `photo_id` int(11) NOT NULL,
  PRIMARY KEY (`good_id`,`photo_id`),
  KEY `good_id` (`good_id`),
  KEY `photo_id` (`photo_id`),
  CONSTRAINT `goods_of_photo` FOREIGN KEY (`photo_id`) REFERENCES `photos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `photos_of_good` FOREIGN KEY (`good_id`) REFERENCES `goods` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Каталог дополнительных фото товаров (основное фото-прямо в таблице goods)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_photos`
--

LOCK TABLES `goods_photos` WRITE;
/*!40000 ALTER TABLE `goods_photos` DISABLE KEYS */;
/*!40000 ALTER TABLE `goods_photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hot_offers`
--

DROP TABLE IF EXISTS `hot_offers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hot_offers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_open` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_close` timestamp NULL DEFAULT NULL,
  `good_id` int(11) NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `good_id` (`good_id`),
  CONSTRAINT `hot_offers_ibfk_1` FOREIGN KEY (`good_id`) REFERENCES `goods` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Таблица горячих предложений товара без каких-либо скидок, просто для выведения на гравную страницу';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hot_offers`
--

LOCK TABLES `hot_offers` WRITE;
/*!40000 ALTER TABLE `hot_offers` DISABLE KEYS */;
INSERT INTO `hot_offers` VALUES (1,'2019-12-28 09:07:08',NULL,3,NULL),(2,'2019-12-28 09:07:20',NULL,2,NULL);
/*!40000 ALTER TABLE `hot_offers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_open` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `user` varchar(150) NOT NULL,
  `date_close` timestamp NULL DEFAULT NULL,
  `delivery_type_id` int(11) NOT NULL,
  `payment_type_id` int(11) NOT NULL,
  `delivery_address` text,
  PRIMARY KEY (`id`),
  KEY `user` (`user`),
  KEY `delivery_type_id` (`delivery_type_id`),
  KEY `payment_type_id` (`payment_type_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`delivery_type_id`) REFERENCES `delivery_types` (`id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`payment_type_id`) REFERENCES `payment_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_types`
--

DROP TABLE IF EXISTS `payment_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Перечисление типов платежей';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_types`
--

LOCK TABLES `payment_types` WRITE;
/*!40000 ALTER TABLE `payment_types` DISABLE KEYS */;
INSERT INTO `payment_types` VALUES (3,'банковской картой при получении'),(4,'оплата банковской картой на сайте'),(1,'Оплата наличными при получении');
/*!40000 ALTER TABLE `payment_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photos`
--

DROP TABLE IF EXISTS `photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(250) NOT NULL,
  `size` bigint(20) NOT NULL,
  `descript` varchar(150) DEFAULT NULL,
  `date_created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `number_of_views` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=244 DEFAULT CHARSET=utf8 COMMENT='Все картинки в системе, в т.ч. картнки товаров';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photos`
--

LOCK TABLES `photos` WRITE;
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
INSERT INTO `photos` VALUES (230,'001.jpg',0,'Файл №№1','2019-12-12 20:33:12',6),(231,'002.jpg',0,'Что-то полезное','2019-12-12 20:33:13',7),(232,'003.jpg',0,'Картинка №13','2019-12-12 20:33:13',6),(233,'004.jpg',0,'Big in JApan','2019-12-12 20:33:13',10),(234,'005.jpg',0,'Korea','2019-12-12 20:33:13',7),(235,'006.jpg',0,'Это еще одна картинка','2019-12-12 20:33:13',5),(236,'007.jpg',0,NULL,'2019-12-12 20:33:13',5),(237,'008.jpg',0,'Depeche mode','2019-12-12 20:33:13',6),(238,'009.jpg',0,'Obituary','2019-12-12 20:33:13',7),(239,'010.jpg',0,NULL,'2019-12-12 20:33:13',5),(240,'011.jpg',0,NULL,'2019-12-12 20:33:13',10),(241,'012.jpg',0,'I don\'t know','2019-12-12 20:33:13',10),(242,'motto.net.ua-87225.jpg',0,'uploaded by users','2019-12-16 15:38:31',2),(243,'utrecht-10.jpg',0,'uploaded by users','2019-12-18 13:28:19',0);
/*!40000 ALTER TABLE `photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prices`
--

DROP TABLE IF EXISTS `prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `good_id` int(11) NOT NULL,
  `price` float NOT NULL,
  `currency` char(3) NOT NULL,
  `date_open` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_close` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `currency` (`currency`),
  CONSTRAINT `prices_ibfk_1` FOREIGN KEY (`currency`) REFERENCES `currencies` (`currency`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Текущие цены на товар без учета скидок по акциям. Цена имеет начало своего действия date_open и окончание date_close';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prices`
--

LOCK TABLES `prices` WRITE;
/*!40000 ALTER TABLE `prices` DISABLE KEYS */;
INSERT INTO `prices` VALUES (1,3,167,'EUR','2019-12-15 16:35:55',NULL),(2,1,19,'EUR','2019-12-15 16:35:55',NULL),(3,2,73,'EUR','2019-12-15 16:35:55',NULL),(4,4,250,'EUR','2019-12-15 16:35:55',NULL);
/*!40000 ALTER TABLE `prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slider_info`
--

DROP TABLE IF EXISTS `slider_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slider_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(1024) NOT NULL,
  `description` varchar(1024) NOT NULL,
  `link` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='Таблица с параметрами изображений и спопровождающего текста для слайдера на первой странице';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slider_info`
--

LOCK TABLES `slider_info` WRITE;
/*!40000 ALTER TABLE `slider_info` DISABLE KEYS */;
INSERT INTO `slider_info` VALUES (1,'1.jpg','Central remote controller','https://google.com'),(2,'2.jpg','List of controlling systems',''),(5,'3.jpg','Control via phone','https://google.com'),(6,'4.jpg','keep your home','https://google.com'),(9,'5.jpg','Plumbs','https://mail.ru');
/*!40000 ALTER TABLE `slider_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_tokens`
--

DROP TABLE IF EXISTS `user_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(50) CHARACTER SET utf8 NOT NULL,
  `token_seria` varchar(120) CHARACTER SET utf8 NOT NULL,
  `token_number` varchar(120) CHARACTER SET utf8 NOT NULL,
  `last_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `login` (`login`),
  CONSTRAINT `user_tokens_ibfk_1` FOREIGN KEY (`login`) REFERENCES `users` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Таблица токенов для режима remember me';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_tokens`
--

LOCK TABLES `user_tokens` WRITE;
/*!40000 ALTER TABLE `user_tokens` DISABLE KEYS */;
INSERT INTO `user_tokens` VALUES (28,'test4','MfHokAm+pRfHQTHFeFjxELigjbgETZyDPGUZouSaiN7h/QgKlAU7ULx99PAefijSLkaRLixAMLSzNm4ov/XiUA==','2oMkkB+mqe+FgmAjoVdRp1kwy1uxbx4GumjPdFJElgxi9Csx0CZ5hEXiAWis9GaaEo9p1wuvKREZIBPRfeA4pA==','2020-01-11 14:38:34'),(37,'test2','E85JE2XNrYuZ/Cwv0KPl7Se4FogkYnnlASdxysSdLcdJQoP+FdlXmsySUYzbMyFtr1SxQ7brJlz9P0YbaaRu0Q==','2cm8TwK1fXi4370MZrgP8Cdzq5hG19l4Lx1zrRCb2wza83nJheBL+2tyHP/dh4/GSg2Bm+Uk3DzYjw2iIeJDcQ==','2020-01-12 14:39:49'),(44,'test5','ZK7Rj094vo5slSgx2cWR4OQIxwWkmqQC5n7Bz0kRhA2yOEjt5PTPdxVUjUdy8Yed5jrIHH86FLGdikPaLfJTqQ==','Tz2C3bkpI9vTgp8RVgS190jsS0FM3hBiYZPUVZdlx1IGYA2JyUGn5e+DQMEDclXjHoylv50bZ1tZ0AWm8HOXRg==','2020-01-12 18:38:25'),(72,'test3','o4Tuvqyp3Ckt+qlmTbZC6n57Fj/PqL3rGx+Jbc32Wb3eh84k4s1ghPvG6HxA4a5AOq0ImomKzrTu2sBugbHxDA==','vpuVTM0jo9VnhHJXMKGlzwKp7K7FSd64j8Yrgf0tz9kn4J8h350eriS4GpWlMH0NKmKWra2aB5/78iQw6LpDtQ==','2020-01-16 15:58:59'),(93,'test4','6zR3FMCzidpHENrF+SRFlTWuWqaZjTA0JOJnEnF8XXT/3DSbQyQjf6cPNZEVc1r8NMBd3krtpIX8qelSU3Mq3g==','PsJEXEenQD5ogXGksI25oj4LkgpOn9VleRBoeVEYBUkgXugH27aHJS2/zi8g0OcGpLcGXr8DWFFkzETJ+2Enqg==','2020-01-17 11:49:09'),(126,'test3','lABMU+mEBQpN7PIUyJ72k8zyeszGJbMuSXnUkLFaYH9D6aBbLCnDZf6r7kEbdowGHqzp8Gkq2zbzX4gb93oWhg==','ezMYW5VgHb95sN17Ub8RM0SPdCRjeFViamLpVSO48bmvo56oys9qjuMHu9b16Gs+/5JwucnmVyD/ut1gR+grOw==','2020-01-26 13:32:42');
/*!40000 ALTER TABLE `user_tokens` ENABLE KEYS */;
UNLOCK TABLES;

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
  `last_login` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`login`),
  UNIQUE KEY `email_idx` (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('a.evlampiev','783ac652c5f64ab07ccb3e410aa97fc09687cc33b48qf','Artyom Evlampiev','322223','artem@gmail.com','Moscow, Birulevskaya','Some additional info','2020-01-03 11:29:18',NULL),('admin','admin','Администратор системы',NULL,'kevlampiev@gmail.com',NULL,NULL,'2019-12-21 20:48:59',NULL),('alexa','alexa','Alexa Wood','','',NULL,NULL,'2019-12-22 04:47:25',NULL),('arhangel','783ac658c4205ec33d8f6caeaaaa0c10a14138c3b48qf','Arhangel Adrian','no phone','adrian@arhangel.com','Heaven','','2020-01-03 12:30:52',NULL),('arhimandrid','783ac652da6687edec690dece8c371cd1a9866d3b48qf','arhimandrid Eugeni','','arhimandrid@mail.com','','','2020-01-03 13:19:11',NULL),('jorn','783ac65d8578edf8458ce06fbc5bb76a58c5ca43b48qf','Jorn Landre','','jorn@mail.ru','','','2020-01-03 14:06:15',NULL),('kevlampiev','112','Константин Евлампиев','89632883655','kevlampiev@gmail.com',NULL,NULL,'2019-12-22 04:42:43',NULL),('leshiy','783ac6567dd010e56986a40d8a6695c36542bb53b48qf','Alex Fitness','89632883655','kevlampiev@gmail.com','','','2020-01-03 11:20:29',NULL),('Maxim','783ac6533fd8226b5c19530fa30444978894f113b48qf','Максим Евлампиев','','m.evlampiev@gmail.com','','','2020-01-05 12:10:59',NULL),('sho','783ac65cf57c97b62b5eda9144cc631dfa38eb63b48qf','Sho Gi Bop','89632883655','sho@mail.ru','','','2020-01-03 11:22:51',NULL),('Soso','$2y$10$xxMRcurs1xEedaOSVbfRf.TnfsnlxoHMn9PTp7ZxnZ98z6QF/wTrm','Константин Евлампиев','+7(963)2883655','kevlampiev@gmail.com','Бирюлевская ул, д.53/1','','2020-01-26 07:26:07','2020-01-26 07:26:07'),('test','783ac65098f6bcd4621d373cade4e832627b4f63b48qf','Test Test','','test@gmail.com','','','2020-01-05 14:36:49',NULL),('test10','$2y$10$LBIkzCtd1TjDtz2sJP3Nq.1bk6hLptjKK2EEKERgEr/M1nd8K9Zue','test10 10 10 Yeah!!!','322-223`','hook','dom 15 korp. 2 kv.424\r\nulitsa Gurievsky proezd','','2020-01-25 16:35:25',NULL),('test11','$2y$10$RmWjMBFJVxIY9HUYuuCpQu9vr2qBuuVRh1ng4HqFUXQwVsz2nw4.C','ye','6655511','ee','qq','','2020-01-25 16:39:15','2020-01-25 16:39:15'),('test12','$2y$10$6e6wKDU9xtPXWhPKapnVCeqz54JekUM1hcuvcOtZT5xr9b7T4/l9O','12 warrior','111','11','','','2020-01-25 16:44:44','2020-01-25 16:44:44'),('test2','$2y$10$W9TSA4MO4ZflSr/OQ9rs7u1hDDWwn9HgH0x7i03.dc4GC4342sMmi','Test2','Test2','test2@hotmail.com','','','2020-01-06 18:36:41',NULL),('test3','$2y$10$fR18VOzrlj/5cieGy2Q3ZeAhN.wWMRB7yL85.l0TD74cC9Ybaep6C','еуые3333','','tttttt','','','2020-01-06 18:51:48',NULL),('test4','$2y$10$nq8MULS3GnXhU58igSlWyuGt3mNTPB6fXId8jGGwtOHMMJkA4LoVW','test4 4 4','','test4','','','2020-01-06 18:56:12',NULL),('test5','$2y$10$l0lnjBQY9.Uzpqv6mYgYU.2sQKtgKeBQ0hrDTvp3gCjEyHtBpb/B.','test5','','test5','','','2020-01-07 03:31:06',NULL),('test66','$2y$10$Z8uGAeJwtUsDEJSJ000ofOBqnU48j4Wl3u.biq2migFYTaK4IeIRu','Tester from hell','+7(911)9110911','911@hell.com','','','2020-01-26 12:58:39','2020-01-26 12:58:39'),('test71','$2y$10$o8n.bor0w4HlF92byiZLIuH9a8BfTIf6AU9a1bynV5Y29iRuoICvm','1Tool','+7(988)8882211','888@help.sos','','','2020-01-26 13:08:31','2020-01-26 13:08:31'),('test77','$2y$10$cQOpR1ZdfbTEcecGQrBHweUibxrEgk3ON5uRPMvWmE3/BWVcu2/im','Heaven sent','+7(911)0911911','911@heaven.com','','','2020-01-26 13:00:29','2020-01-26 13:00:29');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `v_active_categories`
--

DROP TABLE IF EXISTS `v_active_categories`;
/*!50001 DROP VIEW IF EXISTS `v_active_categories`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_active_categories` AS SELECT 
 1 AS `id`,
 1 AS `name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_available_goods`
--

DROP TABLE IF EXISTS `v_available_goods`;
/*!50001 DROP VIEW IF EXISTS `v_available_goods`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_available_goods` AS SELECT 
 1 AS `id`,
 1 AS `category_id`,
 1 AS `name`,
 1 AS `category`,
 1 AS `description`,
 1 AS `price`,
 1 AS `currency`,
 1 AS `img`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_cart`
--

DROP TABLE IF EXISTS `v_cart`;
/*!50001 DROP VIEW IF EXISTS `v_cart`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_cart` AS SELECT 
 1 AS `id`,
 1 AS `user`,
 1 AS `good_id`,
 1 AS `amount`,
 1 AS `name`,
 1 AS `price`,
 1 AS `currency`,
 1 AS `img`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_hot_offer`
--

DROP TABLE IF EXISTS `v_hot_offer`;
/*!50001 DROP VIEW IF EXISTS `v_hot_offer`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_hot_offer` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `category`,
 1 AS `description`,
 1 AS `price`,
 1 AS `currency`,
 1 AS `img`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_usr_cart_stats`
--

DROP TABLE IF EXISTS `v_usr_cart_stats`;
/*!50001 DROP VIEW IF EXISTS `v_usr_cart_stats`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_usr_cart_stats` AS SELECT 
 1 AS `login`,
 1 AS `password`,
 1 AS `name`,
 1 AS `cart_count`,
 1 AS `cart_summ`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `v_active_categories`
--

/*!50001 DROP VIEW IF EXISTS `v_active_categories`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_active_categories` AS select distinct `v_available_goods`.`category_id` AS `id`,`v_available_goods`.`category` AS `name` from `v_available_goods` order by `v_available_goods`.`category_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_available_goods`
--

/*!50001 DROP VIEW IF EXISTS `v_available_goods`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_available_goods` AS select `g`.`id` AS `id`,`g`.`category_id` AS `category_id`,`g`.`name` AS `name`,`gc`.`name` AS `category`,`g`.`description` AS `description`,`p`.`price` AS `price`,`p`.`currency` AS `currency`,`g`.`img` AS `img` from ((`goods` `g` join `prices` `p` on((`g`.`id` = `p`.`good_id`))) join `good_categories` `gc` on((`g`.`category_id` = `gc`.`id`))) where ((`p`.`date_close` > now()) or isnull(`p`.`date_close`)) order by `gc`.`name`,`g`.`name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_cart`
--

/*!50001 DROP VIEW IF EXISTS `v_cart`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_cart` AS select `c`.`id` AS `id`,`c`.`user` AS `user`,`c`.`good_id` AS `good_id`,`c`.`amount` AS `amount`,`gs`.`name` AS `name`,`gs`.`price` AS `price`,`gs`.`currency` AS `currency`,`gs`.`img` AS `img` from (`cart` `c` join `v_available_goods` `gs` on((`gs`.`id` = `c`.`good_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_hot_offer`
--

/*!50001 DROP VIEW IF EXISTS `v_hot_offer`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_hot_offer` AS select `ag`.`id` AS `id`,`ag`.`name` AS `name`,`ag`.`category` AS `category`,`ag`.`description` AS `description`,`ag`.`price` AS `price`,`ag`.`currency` AS `currency`,`ag`.`img` AS `img` from (`v_available_goods` `ag` join `hot_offers` `ho` on((`ag`.`id` = `ho`.`good_id`))) where ((`ho`.`date_open` < now()) and ((`ho`.`date_close` > now()) or isnull(`ho`.`date_close`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_usr_cart_stats`
--

/*!50001 DROP VIEW IF EXISTS `v_usr_cart_stats`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_usr_cart_stats` AS select `users`.`login` AS `login`,`users`.`password` AS `password`,`users`.`name` AS `name`,0 AS `cart_count`,0 AS `cart_summ` from `users` where (not(`users`.`login` in (select distinct `cart`.`user` from `cart`))) union select `usr`.`login` AS `login`,`usr`.`password` AS `password`,`usr`.`name` AS `name`,sum(`c`.`amount`) AS `cart_count`,sum((`c`.`amount` * `c`.`price`)) AS `SUM(c.amount*c.price)` from (`users` `usr` join `v_cart` `c`) where (`c`.`user` = `usr`.`login`) group by `usr`.`login`,`usr`.`password`,`usr`.`name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-15  7:33:19
