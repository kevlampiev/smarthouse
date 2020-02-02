-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Янв 29 2020 г., 10:08
-- Версия сервера: 10.3.13-MariaDB-log
-- Версия PHP: 7.1.32
USE smarthouse;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `smarthouse`
--

DELIMITER $$
--
-- Процедуры
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_to_cart` (`auser` VARCHAR(150), `agood_id` INT, `aamount` INT)  BEGIN 
	DECLARE numrows INT; 
	SELECT count(*) INTO numrows FROM cart WHERE user=auser AND good_id=agood_id; 
	IF numrows=0 
		THEN 
			INSERT INTO cart (user, good_id, amount) VALUES (auser, agood_id, GREATEST(0,aamount)); 
		ELSE 
			UPDATE cart SET amount= GREATEST(0,amount+aamount) WHERE user=auser AND good_id=agood_id; 
		END IF; 
END$$

CREATE DEFINER=`root`@`%` PROCEDURE `edit_cart_item` (IN `auser` VARCHAR(255), IN `agood_id` INT, IN `aamount` INT)  BEGIN 
	DECLARE numrows INT; 
	SELECT count(*) INTO numrows FROM cart WHERE user=auser AND good_id=agood_id; 
	IF numrows=0 
		THEN 
			INSERT INTO cart (user, good_id, amount) VALUES (auser, agood_id, GREATEST(0,aamount)); 
		ELSE 
			UPDATE cart SET amount= GREATEST(0,aamount) WHERE user=auser AND good_id=agood_id; 
		END IF; 
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Структура таблицы `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user` varchar(150) NOT NULL,
  `date_open` timestamp NOT NULL DEFAULT current_timestamp(),
  `good_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL DEFAULT 1,
  `order_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `cart`
--

INSERT INTO `cart` (`id`, `user`, `date_open`, `good_id`, `amount`, `order_id`) VALUES
(6, 'test3', '2020-01-22 05:26:26', 1, 3, NULL),
(7, 'test3', '2020-01-22 05:43:19', 3, 1, NULL),
(8, 'test3', '2020-01-22 06:35:30', 2, 2, NULL),
(9, 'test3', '2020-01-22 08:34:48', 4, 1, NULL),
(10, 'test4', '2020-01-22 09:44:54', 3, 3, NULL),
(11, 'test4', '2020-01-22 09:50:30', 2, 2, NULL),
(12, 'test4', '2020-01-22 09:50:54', 4, 7, NULL),
(13, 'test4', '2020-01-22 09:51:14', 1, 3, NULL),
(14, 'test10', '2020-01-25 16:36:15', 3, 1, NULL),
(15, 'test10', '2020-01-25 16:36:45', 1, 1, NULL),
(16, 'test11', '2020-01-25 16:53:40', 2, 2, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `currencies`
--

CREATE TABLE `currencies` (
  `currency` char(3) NOT NULL,
  `full_name` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `currencies`
--

INSERT INTO `currencies` (`currency`, `full_name`) VALUES
('EUR', 'Euro'),
('RUB', NULL),
('RUR', 'RUSSIAN RUBLE'),
('USD', 'US Dollar');

-- --------------------------------------------------------

--
-- Структура таблицы `delivery_types`
--

CREATE TABLE `delivery_types` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `feedbacks`
--

CREATE TABLE `feedbacks` (
  `id` int(11) NOT NULL,
  `user_name` varchar(150) NOT NULL,
  `email` varchar(100) NOT NULL,
  `date_open` timestamp NOT NULL DEFAULT current_timestamp(),
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `feedbacks`
--

INSERT INTO `feedbacks` (`id`, `user_name`, `email`, `date_open`, `message`) VALUES
(1, 'Art', 'kevlampiev@gmail.com', '2019-12-14 19:22:13', 'Something for you :)'),
(2, 'Subzero', 'kevlampiev@gmail.com', '2019-12-14 19:22:35', 'Something for you again'),
(3, 'Subzero', 'kevlampiev@gmail.com', '2019-12-14 19:26:24', 'Something for you again'),
(4, 'Subzero1112', 'kevlampiev@gmail.com', '2019-12-14 19:28:40', 'Something for you again'),
(5, 'Subzero1112', 'kevlampiev@gmail.com', '2019-12-14 19:35:43', 'Something for you again'),
(6, 'Rjycnfynby', 'kevlampiev@hotmail.com', '2019-12-14 19:39:21', 'Lolllllll age'),
(7, 'Артемка', 'art@mail.ru', '2019-12-14 20:10:53', 'MessageВсе что тут написано-редкостная фигня'),
(48, 'Rita', '', '2019-12-14 21:21:56', '');

-- --------------------------------------------------------

--
-- Структура таблицы `goods`
--

CREATE TABLE `goods` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `date_open` timestamp NOT NULL DEFAULT current_timestamp(),
  `description` text NOT NULL,
  `img` varchar(1024) NOT NULL,
  `date_close` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `goods`
--

INSERT INTO `goods` (`id`, `name`, `category_id`, `date_open`, `description`, `img`, `date_close`) VALUES
(1, 'leak detector', 1, '2019-12-15 16:33:19', 'leak detector description ', '1.jpg', NULL),
(2, 'motion sencor', 1, '2019-12-15 16:33:19', 'Датчик Движения (Motion Sensor) - электроустановка, служит источником сигнала. Можно скрафтить на верстаке после изучения навыка Наука (Science) > Переключатели и пусковые схемы (Switches and Triggers) до 3 уровня или купить у торговца. Для использования, необходимо подключить датчик к источнику питания Инструментом Электропроводки и настроить. При срабатывании пропускает сигнал на выход', '2.jpg', NULL),
(3, 'gas detector', 1, '2019-12-15 16:33:19', 'A gas detector is a device that detects the presence of gases in an area, often as part of a safety system. This type of equipment is used to detect a gas leak or other emissions and can interface with a control system so a process can be automatically shut down. A gas detector can sound an alarm to operators in the area where the leak is occurring, giving them the opportunity to leave.', '3.jpg', NULL),
(4, 'Smart house kit', 1, '2019-12-16 01:20:33', 'Xiaomi, или Сяоми (в русском произношении) - китайская компания образованная в 2010 году, ставшая известна благодаря своей прошивке MIUI, на базе Android и фирменным смартфонам. Ассортимент продукции стремительно рос, начиная от полотенец и ортопедических подушек, заканчивая бытовой техникой и электро-велосипедами. И вот в конце 2014 года Xiaomi представила систему домашней автоматизации, состоящую из умной розетки (Mi Smart Power Plug), камеры наблюдения (Yi Camera), умной лампочки (Yeelight LED) и инфракрасного блока управления бытовой техникой (IR Remote Controller).', '9.jpg', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `goods_photos`
--

CREATE TABLE `goods_photos` (
  `good_id` int(11) NOT NULL,
  `photo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Каталог дополнительных фото товаров (основное фото-прямо в таблице goods)';

-- --------------------------------------------------------

--
-- Структура таблицы `good_categories`
--

CREATE TABLE `good_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `good_categories`
--

INSERT INTO `good_categories` (`id`, `name`) VALUES
(9, 'controllers'),
(12, 'kill me'),
(4, 'kits'),
(2, 'power supply'),
(3, 'security'),
(10, 'sensors'),
(1, 'smart house'),
(11, 'software');

-- --------------------------------------------------------

--
-- Структура таблицы `hot_offers`
--

CREATE TABLE `hot_offers` (
  `id` int(11) NOT NULL,
  `date_open` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_close` timestamp NULL DEFAULT NULL,
  `good_id` int(11) NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Таблица горячих предложений товара без каких-либо скидок, просто для выведения на гравную страницу';

--
-- Дамп данных таблицы `hot_offers`
--

INSERT INTO `hot_offers` (`id`, `date_open`, `date_close`, `good_id`, `comment`) VALUES
(1, '2019-12-28 09:07:08', NULL, 3, NULL),
(2, '2019-12-28 09:07:20', NULL, 2, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `date_open` timestamp NULL DEFAULT current_timestamp(),
  `user` varchar(150) NOT NULL,
  `date_close` timestamp NULL DEFAULT NULL,
  `delivery_type_id` int(11) NOT NULL,
  `payment_type_id` int(11) NOT NULL,
  `delivery_address` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `payment_types`
--

CREATE TABLE `payment_types` (
  `id` int(11) NOT NULL,
  `name` varchar(1024) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Перечисление типов платежей';

--
-- Дамп данных таблицы `payment_types`
--

INSERT INTO `payment_types` (`id`, `name`) VALUES
(3, 'банковской картой при получении'),
(4, 'оплата банковской картой на сайте'),
(1, 'Оплата наличными при получении');

-- --------------------------------------------------------

--
-- Структура таблицы `photos`
--

CREATE TABLE `photos` (
  `id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `size` bigint(20) NOT NULL,
  `descript` varchar(150) DEFAULT NULL,
  `date_created` timestamp NULL DEFAULT current_timestamp(),
  `number_of_views` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Все картинки в системе, в т.ч. картнки товаров';

--
-- Дамп данных таблицы `photos`
--

INSERT INTO `photos` (`id`, `title`, `size`, `descript`, `date_created`, `number_of_views`) VALUES
(230, '001.jpg', 0, 'Файл №№1', '2019-12-12 20:33:12', 6),
(231, '002.jpg', 0, 'Что-то полезное', '2019-12-12 20:33:13', 7),
(232, '003.jpg', 0, 'Картинка №13', '2019-12-12 20:33:13', 6),
(233, '004.jpg', 0, 'Big in JApan', '2019-12-12 20:33:13', 10),
(234, '005.jpg', 0, 'Korea', '2019-12-12 20:33:13', 7),
(235, '006.jpg', 0, 'Это еще одна картинка', '2019-12-12 20:33:13', 5),
(236, '007.jpg', 0, NULL, '2019-12-12 20:33:13', 5),
(237, '008.jpg', 0, 'Depeche mode', '2019-12-12 20:33:13', 6),
(238, '009.jpg', 0, 'Obituary', '2019-12-12 20:33:13', 7),
(239, '010.jpg', 0, NULL, '2019-12-12 20:33:13', 5),
(240, '011.jpg', 0, NULL, '2019-12-12 20:33:13', 10),
(241, '012.jpg', 0, 'I don\'t know', '2019-12-12 20:33:13', 10),
(242, 'motto.net.ua-87225.jpg', 0, 'uploaded by users', '2019-12-16 15:38:31', 2),
(243, 'utrecht-10.jpg', 0, 'uploaded by users', '2019-12-18 13:28:19', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `prices`
--

CREATE TABLE `prices` (
  `id` int(11) NOT NULL,
  `good_id` int(11) NOT NULL,
  `price` float NOT NULL,
  `currency` char(3) NOT NULL,
  `date_open` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_close` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Текущие цены на товар без учета скидок по акциям. Цена имеет начало своего действия date_open и окончание date_close';

--
-- Дамп данных таблицы `prices`
--

INSERT INTO `prices` (`id`, `good_id`, `price`, `currency`, `date_open`, `date_close`) VALUES
(1, 3, 167, 'EUR', '2019-12-15 16:35:55', NULL),
(2, 1, 19, 'EUR', '2019-12-15 16:35:55', NULL),
(3, 2, 73, 'EUR', '2019-12-15 16:35:55', NULL),
(4, 4, 250, 'EUR', '2019-12-15 16:35:55', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `slider_info`
--

CREATE TABLE `slider_info` (
  `id` int(11) NOT NULL,
  `img` varchar(1024) NOT NULL,
  `description` varchar(1024) NOT NULL,
  `link` varchar(1024) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Таблица с параметрами изображений и спопровождающего текста для слайдера на первой странице';

--
-- Дамп данных таблицы `slider_info`
--

INSERT INTO `slider_info` (`id`, `img`, `description`, `link`) VALUES
(1, '1.jpg', 'Central remote controller', 'https://google.com'),
(2, '2.jpg', 'List of controlling systems', ''),
(5, '3.jpg', 'Control via phone', 'https://google.com'),
(6, '4.jpg', 'keep your home', 'https://google.com'),
(9, '5.jpg', 'Plumbs', 'https://mail.ru');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `login` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(120) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `address` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_login` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`login`, `password`, `name`, `phone`, `email`, `address`, `description`, `date_created`, `last_login`) VALUES
('a.evlampiev', '783ac652c5f64ab07ccb3e410aa97fc09687cc33b48qf', 'Artyom Evlampiev', '322223', 'artem@gmail.com', 'Moscow, Birulevskaya', 'Some additional info', '2020-01-03 11:29:18', NULL),
('admin', 'admin', 'Администратор системы', NULL, 'kevlampiev@gmail.com', NULL, NULL, '2019-12-21 20:48:59', NULL),
('alexa', 'alexa', 'Alexa Wood', '', '', NULL, NULL, '2019-12-22 04:47:25', NULL),
('arhangel', '783ac658c4205ec33d8f6caeaaaa0c10a14138c3b48qf', 'Arhangel Adrian', 'no phone', 'adrian@arhangel.com', 'Heaven', '', '2020-01-03 12:30:52', NULL),
('arhimandrid', '783ac652da6687edec690dece8c371cd1a9866d3b48qf', 'arhimandrid Eugeni', '', 'arhimandrid@mail.com', '', '', '2020-01-03 13:19:11', NULL),
('jorn', '783ac65d8578edf8458ce06fbc5bb76a58c5ca43b48qf', 'Jorn Landre', '', 'jorn@mail.ru', '', '', '2020-01-03 14:06:15', NULL),
('kevlampiev', '112', 'Константин Евлампиев', '89632883655', 'kevlampiev@gmail.com', NULL, NULL, '2019-12-22 04:42:43', NULL),
('leshiy', '783ac6567dd010e56986a40d8a6695c36542bb53b48qf', 'Alex Fitness', '89632883655', 'kevlampiev@gmail.com', '', '', '2020-01-03 11:20:29', NULL),
('Maxim', '783ac6533fd8226b5c19530fa30444978894f113b48qf', 'Максим Евлампиев', '', 'm.evlampiev@gmail.com', '', '', '2020-01-05 12:10:59', NULL),
('sho', '783ac65cf57c97b62b5eda9144cc631dfa38eb63b48qf', 'Sho Gi Bop', '89632883655', 'sho@mail.ru', '', '', '2020-01-03 11:22:51', NULL),
('Soso', '$2y$10$xxMRcurs1xEedaOSVbfRf.TnfsnlxoHMn9PTp7ZxnZ98z6QF/wTrm', 'Константин Евлампиев', '+7(963)2883655', 'kevlampiev@gmail.com', 'Бирюлевская ул, д.53/1', '', '2020-01-26 07:26:07', '2020-01-26 07:26:07'),
('test', '783ac65098f6bcd4621d373cade4e832627b4f63b48qf', 'Test Test', '', 'test@gmail.com', '', '', '2020-01-05 14:36:49', NULL),
('test10', '$2y$10$LBIkzCtd1TjDtz2sJP3Nq.1bk6hLptjKK2EEKERgEr/M1nd8K9Zue', 'test10 10 10 Yeah!!!', '322-223`', 'hook', 'dom 15 korp. 2 kv.424\r\nulitsa Gurievsky proezd', '', '2020-01-25 16:35:25', NULL),
('test11', '$2y$10$RmWjMBFJVxIY9HUYuuCpQu9vr2qBuuVRh1ng4HqFUXQwVsz2nw4.C', 'ye', '6655511', 'ee', 'qq', '', '2020-01-25 16:39:15', '2020-01-25 16:39:15'),
('test12', '$2y$10$6e6wKDU9xtPXWhPKapnVCeqz54JekUM1hcuvcOtZT5xr9b7T4/l9O', '12 warrior', '111', '11', '', '', '2020-01-25 16:44:44', '2020-01-25 16:44:44'),
('test2', '$2y$10$W9TSA4MO4ZflSr/OQ9rs7u1hDDWwn9HgH0x7i03.dc4GC4342sMmi', 'Test2', 'Test2', 'test2@hotmail.com', '', '', '2020-01-06 18:36:41', NULL),
('test3', '$2y$10$fR18VOzrlj/5cieGy2Q3ZeAhN.wWMRB7yL85.l0TD74cC9Ybaep6C', 'еуые3333', '', 'tttttt', '', '', '2020-01-06 18:51:48', NULL),
('test4', '$2y$10$nq8MULS3GnXhU58igSlWyuGt3mNTPB6fXId8jGGwtOHMMJkA4LoVW', 'test4 4 4', '', 'test4', '', '', '2020-01-06 18:56:12', NULL),
('test5', '$2y$10$l0lnjBQY9.Uzpqv6mYgYU.2sQKtgKeBQ0hrDTvp3gCjEyHtBpb/B.', 'test5', '', 'test5', '', '', '2020-01-07 03:31:06', NULL),
('test66', '$2y$10$Z8uGAeJwtUsDEJSJ000ofOBqnU48j4Wl3u.biq2migFYTaK4IeIRu', 'Tester from hell', '+7(911)9110911', '911@hell.com', '', '', '2020-01-26 12:58:39', '2020-01-26 12:58:39'),
('test71', '$2y$10$o8n.bor0w4HlF92byiZLIuH9a8BfTIf6AU9a1bynV5Y29iRuoICvm', '1Tool', '+7(988)8882211', '888@help.sos', '', '', '2020-01-26 13:08:31', '2020-01-26 13:08:31'),
('test77', '$2y$10$cQOpR1ZdfbTEcecGQrBHweUibxrEgk3ON5uRPMvWmE3/BWVcu2/im', 'Heaven sent', '+7(911)0911911', '911@heaven.com', '', '', '2020-01-26 13:00:29', '2020-01-26 13:00:29');

-- --------------------------------------------------------

--
-- Структура таблицы `user_tokens`
--

CREATE TABLE `user_tokens` (
  `id` int(11) NOT NULL,
  `login` varchar(50) CHARACTER SET utf8 NOT NULL,
  `token_seria` varchar(120) CHARACTER SET utf8 NOT NULL,
  `token_number` varchar(120) CHARACTER SET utf8 NOT NULL,
  `last_login` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Таблица токенов для режима remember me';

--
-- Дамп данных таблицы `user_tokens`
--

INSERT INTO `user_tokens` (`id`, `login`, `token_seria`, `token_number`, `last_login`) VALUES
(28, 'test4', 'MfHokAm+pRfHQTHFeFjxELigjbgETZyDPGUZouSaiN7h/QgKlAU7ULx99PAefijSLkaRLixAMLSzNm4ov/XiUA==', '2oMkkB+mqe+FgmAjoVdRp1kwy1uxbx4GumjPdFJElgxi9Csx0CZ5hEXiAWis9GaaEo9p1wuvKREZIBPRfeA4pA==', '2020-01-11 14:38:34'),
(37, 'test2', 'E85JE2XNrYuZ/Cwv0KPl7Se4FogkYnnlASdxysSdLcdJQoP+FdlXmsySUYzbMyFtr1SxQ7brJlz9P0YbaaRu0Q==', '2cm8TwK1fXi4370MZrgP8Cdzq5hG19l4Lx1zrRCb2wza83nJheBL+2tyHP/dh4/GSg2Bm+Uk3DzYjw2iIeJDcQ==', '2020-01-12 14:39:49'),
(44, 'test5', 'ZK7Rj094vo5slSgx2cWR4OQIxwWkmqQC5n7Bz0kRhA2yOEjt5PTPdxVUjUdy8Yed5jrIHH86FLGdikPaLfJTqQ==', 'Tz2C3bkpI9vTgp8RVgS190jsS0FM3hBiYZPUVZdlx1IGYA2JyUGn5e+DQMEDclXjHoylv50bZ1tZ0AWm8HOXRg==', '2020-01-12 18:38:25'),
(72, 'test3', 'o4Tuvqyp3Ckt+qlmTbZC6n57Fj/PqL3rGx+Jbc32Wb3eh84k4s1ghPvG6HxA4a5AOq0ImomKzrTu2sBugbHxDA==', 'vpuVTM0jo9VnhHJXMKGlzwKp7K7FSd64j8Yrgf0tz9kn4J8h350eriS4GpWlMH0NKmKWra2aB5/78iQw6LpDtQ==', '2020-01-16 15:58:59'),
(93, 'test4', '6zR3FMCzidpHENrF+SRFlTWuWqaZjTA0JOJnEnF8XXT/3DSbQyQjf6cPNZEVc1r8NMBd3krtpIX8qelSU3Mq3g==', 'PsJEXEenQD5ogXGksI25oj4LkgpOn9VleRBoeVEYBUkgXugH27aHJS2/zi8g0OcGpLcGXr8DWFFkzETJ+2Enqg==', '2020-01-17 11:49:09'),
(126, 'test3', 'lABMU+mEBQpN7PIUyJ72k8zyeszGJbMuSXnUkLFaYH9D6aBbLCnDZf6r7kEbdowGHqzp8Gkq2zbzX4gb93oWhg==', 'ezMYW5VgHb95sN17Ub8RM0SPdCRjeFViamLpVSO48bmvo56oys9qjuMHu9b16Gs+/5JwucnmVyD/ut1gR+grOw==', '2020-01-26 13:32:42');

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `v_active_categories`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `v_active_categories` (
`id` int(11)
,`name` varchar(150)
);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `v_available_goods`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `v_available_goods` (
`id` int(11)
,`category_id` int(11)
,`name` varchar(255)
,`category` varchar(150)
,`description` text
,`price` float
,`currency` char(3)
,`img` varchar(1024)
);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `v_cart`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `v_cart` (
`id` int(11)
,`user` varchar(150)
,`good_id` int(11)
,`amount` int(11)
,`name` varchar(255)
,`price` float
,`currency` char(3)
,`img` varchar(1024)
);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `v_hot_offer`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `v_hot_offer` (
`id` int(11)
,`name` varchar(255)
,`category` varchar(150)
,`description` text
,`price` float
,`currency` char(3)
,`img` varchar(1024)
);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `v_usr_cart_stats`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `v_usr_cart_stats` (
`login` varchar(50)
,`password` varchar(255)
,`name` varchar(120)
,`cart_count` decimal(32,0)
,`cart_summ` double
);

-- --------------------------------------------------------

--
-- Структура для представления `v_active_categories`
--
DROP TABLE IF EXISTS `v_active_categories`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_active_categories`  AS  select distinct `v_available_goods`.`category_id` AS `id`,`v_available_goods`.`category` AS `name` from `v_available_goods` order by `v_available_goods`.`category_id` ;

-- --------------------------------------------------------

--
-- Структура для представления `v_available_goods`
--
DROP TABLE IF EXISTS `v_available_goods`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_available_goods`  AS  select `g`.`id` AS `id`,`g`.`category_id` AS `category_id`,`g`.`name` AS `name`,`gc`.`name` AS `category`,`g`.`description` AS `description`,`p`.`price` AS `price`,`p`.`currency` AS `currency`,`g`.`img` AS `img` from ((`goods` `g` join `prices` `p` on(`g`.`id` = `p`.`good_id`)) join `good_categories` `gc` on(`g`.`category_id` = `gc`.`id`)) where `p`.`date_close` > current_timestamp() or `p`.`date_close` is null order by `gc`.`name`,`g`.`name` ;

-- --------------------------------------------------------

--
-- Структура для представления `v_cart`
--
DROP TABLE IF EXISTS `v_cart`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_cart`  AS  select `c`.`id` AS `id`,`c`.`user` AS `user`,`c`.`good_id` AS `good_id`,`c`.`amount` AS `amount`,`gs`.`name` AS `name`,`gs`.`price` AS `price`,`gs`.`currency` AS `currency`,`gs`.`img` AS `img` from (`cart` `c` join `v_available_goods` `gs` on(`gs`.`id` = `c`.`good_id`)) ;

-- --------------------------------------------------------

--
-- Структура для представления `v_hot_offer`
--
DROP TABLE IF EXISTS `v_hot_offer`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_hot_offer`  AS  select `ag`.`id` AS `id`,`ag`.`name` AS `name`,`ag`.`category` AS `category`,`ag`.`description` AS `description`,`ag`.`price` AS `price`,`ag`.`currency` AS `currency`,`ag`.`img` AS `img` from (`v_available_goods` `ag` join `hot_offers` `ho` on(`ag`.`id` = `ho`.`good_id`)) where `ho`.`date_open` < current_timestamp() and (`ho`.`date_close` > current_timestamp() or `ho`.`date_close` is null) ;

-- --------------------------------------------------------

--
-- Структура для представления `v_usr_cart_stats`
--
DROP TABLE IF EXISTS `v_usr_cart_stats`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_usr_cart_stats`  AS  select `users`.`login` AS `login`,`users`.`password` AS `password`,`users`.`name` AS `name`,0 AS `cart_count`,0 AS `cart_summ` from `users` where !(`users`.`login` in (select distinct `cart`.`user` from `cart`)) union select `usr`.`login` AS `login`,`usr`.`password` AS `password`,`usr`.`name` AS `name`,sum(`c`.`amount`) AS `cart_count`,sum(`c`.`amount` * `c`.`price`) AS `SUM(c.amount*c.price)` from (`users` `usr` join `v_cart` `c`) where `c`.`user` = `usr`.`login` group by `usr`.`login`,`usr`.`password`,`usr`.`name` ;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_2` (`user`,`good_id`),
  ADD KEY `good_id` (`good_id`),
  ADD KEY `user` (`user`),
  ADD KEY `order_id` (`order_id`);

--
-- Индексы таблицы `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`currency`);

--
-- Индексы таблицы `delivery_types`
--
ALTER TABLE `delivery_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индексы таблицы `feedbacks`
--
ALTER TABLE `feedbacks`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `goods`
--
ALTER TABLE `goods`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `goods_ibfk_1` (`category_id`);

--
-- Индексы таблицы `goods_photos`
--
ALTER TABLE `goods_photos`
  ADD PRIMARY KEY (`good_id`,`photo_id`),
  ADD KEY `good_id` (`good_id`),
  ADD KEY `photo_id` (`photo_id`);

--
-- Индексы таблицы `good_categories`
--
ALTER TABLE `good_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индексы таблицы `hot_offers`
--
ALTER TABLE `hot_offers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `good_id` (`good_id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user` (`user`),
  ADD KEY `delivery_type_id` (`delivery_type_id`),
  ADD KEY `payment_type_id` (`payment_type_id`);

--
-- Индексы таблицы `payment_types`
--
ALTER TABLE `payment_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индексы таблицы `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`title`);

--
-- Индексы таблицы `prices`
--
ALTER TABLE `prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `currency` (`currency`);

--
-- Индексы таблицы `slider_info`
--
ALTER TABLE `slider_info`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`login`),
  ADD UNIQUE KEY `email_idx` (`login`);

--
-- Индексы таблицы `user_tokens`
--
ALTER TABLE `user_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `login` (`login`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT для таблицы `delivery_types`
--
ALTER TABLE `delivery_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `feedbacks`
--
ALTER TABLE `feedbacks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT для таблицы `goods`
--
ALTER TABLE `goods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `good_categories`
--
ALTER TABLE `good_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `hot_offers`
--
ALTER TABLE `hot_offers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `payment_types`
--
ALTER TABLE `payment_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `photos`
--
ALTER TABLE `photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=245;

--
-- AUTO_INCREMENT для таблицы `prices`
--
ALTER TABLE `prices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `slider_info`
--
ALTER TABLE `slider_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `user_tokens`
--
ALTER TABLE `user_tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`good_id`) REFERENCES `goods` (`id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`user`) REFERENCES `users` (`login`),
  ADD CONSTRAINT `cart_ibfk_3` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Ограничения внешнего ключа таблицы `goods`
--
ALTER TABLE `goods`
  ADD CONSTRAINT `goods_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `good_categories` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `goods_photos`
--
ALTER TABLE `goods_photos`
  ADD CONSTRAINT `goods_of_photo` FOREIGN KEY (`photo_id`) REFERENCES `photos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `photos_of_good` FOREIGN KEY (`good_id`) REFERENCES `goods` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `hot_offers`
--
ALTER TABLE `hot_offers`
  ADD CONSTRAINT `hot_offers_ibfk_1` FOREIGN KEY (`good_id`) REFERENCES `goods` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`delivery_type_id`) REFERENCES `delivery_types` (`id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`payment_type_id`) REFERENCES `payment_types` (`id`);

--
-- Ограничения внешнего ключа таблицы `prices`
--
ALTER TABLE `prices`
  ADD CONSTRAINT `prices_ibfk_1` FOREIGN KEY (`currency`) REFERENCES `currencies` (`currency`);

--
-- Ограничения внешнего ключа таблицы `user_tokens`
--
ALTER TABLE `user_tokens`
  ADD CONSTRAINT `user_tokens_ibfk_1` FOREIGN KEY (`login`) REFERENCES `users` (`login`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
