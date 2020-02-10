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
-- Temporary table structure for view `v_goods`
--

DROP TABLE IF EXISTS `v_goods`;
/*!50001 DROP VIEW IF EXISTS `v_goods`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_goods` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `category`,
 1 AS `description`,
 1 AS `img`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_user_roles`
--

DROP TABLE IF EXISTS `v_user_roles`;
/*!50001 DROP VIEW IF EXISTS `v_user_roles`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_user_roles` AS SELECT 
 1 AS `login`,
 1 AS `password`,
 1 AS `role`*/;
SET character_set_client = @saved_cs_client;

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
-- Final view structure for view `v_goods`
--

/*!50001 DROP VIEW IF EXISTS `v_goods`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_goods` AS select `g`.`id` AS `id`,`g`.`name` AS `name`,`c`.`name` AS `category`,`g`.`description` AS `description`,`g`.`img` AS `img` from (`goods` `g` join `good_categories` `c` on((`c`.`id` = `g`.`category_id`))) order by `c`.`name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_user_roles`
--

/*!50001 DROP VIEW IF EXISTS `v_user_roles`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_user_roles` AS select `u`.`login` AS `login`,`u`.`password` AS `password`,`r`.`name` AS `role` from (`users` `u` join `user_roles` `r` on((`u`.`role_id` = `r`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-10 18:14:45
