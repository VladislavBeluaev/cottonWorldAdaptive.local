-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               5.7.19 - MySQL Community Server (GPL)
-- Операционная система:         Win64
-- HeidiSQL Версия:              9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Дамп структуры базы данных uzbolkab_cottonworld
CREATE DATABASE IF NOT EXISTS `uzbolkab_cottonworld` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `uzbolkab_cottonworld`;

-- Дамп структуры для таблица uzbolkab_cottonworld.colors
CREATE TABLE IF NOT EXISTS `colors` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `en_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rus_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы uzbolkab_cottonworld.colors: ~18 rows (приблизительно)
/*!40000 ALTER TABLE `colors` DISABLE KEYS */;
INSERT INTO `colors` (`id`, `en_name`, `rus_name`, `created_at`, `updated_at`) VALUES
	(1, 'white', 'белый', '2019-04-22 09:59:22', '2019-04-22 09:59:22'),
	(2, 'red', 'красный', '2019-04-22 09:59:22', '2019-04-22 09:59:22'),
	(3, 'burgundy', 'бордовый', '2019-04-22 09:59:22', '2019-04-22 09:59:22'),
	(4, 'crimson', 'малиновый', '2019-04-22 09:59:22', '2019-04-22 09:59:22'),
	(5, 'pink', 'розовый', '2019-04-22 09:59:22', '2019-04-22 09:59:22'),
	(6, 'beige', 'бежевый', '2019-04-22 09:59:22', '2019-04-22 09:59:22'),
	(7, 'orange', 'оранжевый', '2019-04-22 09:59:22', '2019-04-22 09:59:22'),
	(8, 'yellow', 'желтый', '2019-04-22 09:59:22', '2019-04-22 09:59:22'),
	(9, 'light-green', 'светло-зеленый', '2019-04-22 09:59:22', '2019-04-22 09:59:22'),
	(10, 'lime', 'салатовый', '2019-04-22 09:59:22', '2019-04-22 09:59:22'),
	(11, 'dark-green', 'темно-зеленый', '2019-04-22 09:59:22', '2019-04-22 09:59:22'),
	(12, 'turquoise', 'бирюзовый', '2019-04-22 09:59:22', '2019-04-22 09:59:22'),
	(13, 'blue', 'синий', '2019-04-22 09:59:22', '2019-04-22 09:59:22'),
	(14, 'dark-blue', 'темно-синий', '2019-04-22 09:59:22', '2019-04-22 09:59:22'),
	(15, 'black', 'черный', '2019-04-22 09:59:22', '2019-04-22 09:59:22'),
	(16, 'asphalt', 'асфальт', '2019-04-22 09:59:22', '2019-04-22 09:59:22'),
	(17, 'bluet', 'василек', '2019-05-20 10:37:56', '2019-05-20 10:37:58'),
	(18, 'grey', 'серый', '2019-05-20 11:48:28', '2019-05-20 11:48:29');
/*!40000 ALTER TABLE `colors` ENABLE KEYS */;

-- Дамп структуры для таблица uzbolkab_cottonworld.gender
CREATE TABLE IF NOT EXISTS `gender` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `en_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rus_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_prefix` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы uzbolkab_cottonworld.gender: ~3 rows (приблизительно)
/*!40000 ALTER TABLE `gender` DISABLE KEYS */;
INSERT INTO `gender` (`id`, `en_description`, `rus_description`, `url_prefix`, `created_at`, `updated_at`) VALUES
	(1, 'male', 'мужские', 'men', '2019-04-22 09:58:30', '2019-04-22 09:58:30'),
	(2, 'female', 'женские', 'women', '2019-04-22 09:58:30', '2019-04-22 09:58:30'),
	(3, 'children', 'детские', 'children', '2019-04-22 09:58:30', '2019-04-22 09:58:30');
/*!40000 ALTER TABLE `gender` ENABLE KEYS */;

-- Дамп структуры для процедура uzbolkab_cottonworld.getProductsForSliderMainPage
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `getProductsForSliderMainPage`()
    DETERMINISTIC
    COMMENT 'return products data for CardSlider on index page'
BEGIN
   select name,price,img_src,img_alt,routeKeyName,url_prefix from t_shirts t join gender g on g.id=t.gender_id join t_shirt_image
   t_s on t_s.t_shirt_id = t.id join images i on t_s.image_id = i.id where t.id in(1,6,10) order by rand() limit 8;
END//
DELIMITER ;

-- Дамп структуры для таблица uzbolkab_cottonworld.images
CREATE TABLE IF NOT EXISTS `images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `img_src` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `img_alt` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы uzbolkab_cottonworld.images: ~78 rows (приблизительно)
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` (`id`, `img_src`, `img_alt`, `color_id`, `created_at`, `updated_at`) VALUES
	(1, 'images/men/t_shirts/promo-futbolka_econom/1555783437.jpg', 'promo-futbolka_econom', 15, '2019-04-22 09:59:39', '2019-04-22 09:59:39'),
	(2, 'images/men/t_shirts/promo-futbolka_classic/1555783464.jpg', 'promo-futbolka_classic', 0, '2019-04-22 09:59:39', '2019-04-22 09:59:39'),
	(3, 'images/men/t_shirts/futbolka-long_sleeve/1555783482.jpg', 'futbolka-long_sleeve', 0, '2019-04-22 09:59:39', '2019-04-22 09:59:39'),
	(4, 'images/men/t_shirts/polo-short_sleeve/1555783498.jpg', 'polo-short_sleeve', 0, '2019-04-22 09:59:39', '2019-04-22 09:59:39'),
	(5, 'images/men/t_shirts/polo-long-sleeve/1555783543.jpg', 'polo-long-sleeve', 0, '2019-04-22 09:59:39', '2019-04-22 09:59:39'),
	(8, 'images/men/t_shirts/promo-futbolka_econom/1556530760.jpg', 'promo-futbolka_econom', 18, '2019-04-29 12:44:09', '2019-04-29 12:44:09'),
	(9, 'images/men/t_shirts/promo-futbolka_econom/1556530770.jpg', 'promo-futbolka_econom', 2, '2019-04-29 12:44:09', '2019-04-29 12:44:09'),
	(10, 'images/men/t_shirts/promo-futbolka_econom/1556530780.jpg', 'promo-futbolka_econom', 17, '2019-04-29 12:44:09', '2019-04-29 12:44:09'),
	(11, 'images/men/t_shirts/promo-futbolka_econom/1556530792.jpg', 'promo-futbolka_econom', 1, '2019-04-29 12:44:09', '2019-04-29 12:44:09'),
	(12, 'images/women/t_shirts/promo-futbolka_cotton_short_sleeve/1556567586.jpg', 'promo-futbolka_cotton_short_sleeve', 0, '2019-04-30 09:27:47', '2019-04-30 09:27:47'),
	(13, 'images/women/t_shirts/promo-futbolka_cotton_short_sleeve/1556568035.jpg', 'promo-futbolka_cotton_short_sleeve', 0, '2019-04-30 09:27:47', '2019-04-30 09:27:47'),
	(14, 'images/women/t_shirts/promo-futbolka_cotton_short_sleeve/1556568052.jpg', 'promo-futbolka_cotton_short_sleeve', 0, '2019-04-30 09:27:47', '2019-04-30 09:27:47'),
	(15, 'images/women/t_shirts/promo-futbolka_cotton_short_sleeve/1556568071.jpg', 'promo-futbolka_cotton_short_sleeve', 0, '2019-04-30 09:27:47', '2019-04-30 09:27:47'),
	(16, 'images/women/t_shirts/promo-futbolka_cotton_short_sleeve/1556568084.jpg', 'promo-futbolka_cotton_short_sleeve', 0, '2019-04-30 09:27:47', '2019-04-30 09:27:47'),
	(17, 'images/women/t_shirts/promo-futbolka_cotton_short_sleeve/1556568094.jpg', 'promo-futbolka_cotton_short_sleeve', 0, '2019-04-30 09:27:47', '2019-04-30 09:27:47'),
	(18, 'images/women/t_shirts/promo-futbolka_cotton_short_sleeve/1556568106.jpg', 'promo-futbolka_cotton_short_sleeve', 0, '2019-04-30 09:27:47', '2019-04-30 09:27:47'),
	(19, 'images/women/t_shirts/promo-futbolka_cotton_short_sleeve/1556568118.jpg', 'promo-futbolka_cotton_short_sleeve', 0, '2019-04-30 09:27:47', '2019-04-30 09:27:47'),
	(20, 'images/women/t_shirts/promo-futbolka_lycra_short_sleeve/1556568512.jpg', 'promo-futbolka_ lycra_short_sleeve', 0, '2019-04-30 09:27:47', '2019-04-30 09:27:47'),
	(21, 'images/women/t_shirts/promo-futbolka_ lycra_short_sleeve/1556568527.jpg', 'promo-futbolka_ lycra_short_sleeve', 0, '2019-04-30 09:27:47', '2019-04-30 09:27:47'),
	(22, 'images/women/t_shirts/promo-futbolka_lycra_short_sleeve/1556568542.jpg', 'promo-futbolka_ lycra_short_sleeve', 0, '2019-04-30 09:27:47', '2019-04-30 09:27:47'),
	(23, 'images/women/t_shirts/promo-futbolka_ lycra_short_sleeve/1556568552.jpg', 'promo-futbolka_ lycra_short_sleeve', 0, '2019-04-30 09:27:47', '2019-04-30 09:27:47'),
	(24, 'images/women/t_shirts/promo-futbolka_lycra_short_sleeve/1556568562.jpg', 'promo-futbolka_ lycra_short_sleeve', 0, '2019-04-30 09:27:47', '2019-04-30 09:27:47'),
	(25, 'images/women/t_shirts/promo-futbolka_ lycra_short_sleeve/1556568571.jpg', 'promo-futbolka_ lycra_short_sleeve', 0, '2019-04-30 09:27:47', '2019-04-30 09:27:47'),
	(26, 'images/women/t_shirts/promo-futbolka_lycra_short_sleeve/1556568581.jpg', 'promo-futbolka_ lycra_short_sleeve', 0, '2019-04-30 09:27:47', '2019-04-30 09:27:47'),
	(27, 'images/women/t_shirts/promo-futbolka_lycra_short_sleeve/1556568592.jpg', 'promo-futbolka_ lycra_short_sleeve', 0, '2019-04-30 09:27:47', '2019-04-30 09:27:47'),
	(28, 'images/women/t_shirts/promo-futbolka_lycra_long_sleeve/1556568750.jpg', 'promo-futbolka_lycra_long_sleeve', 0, '2019-04-30 13:01:55', '2019-04-30 13:01:55'),
	(29, 'images/women/t_shirts/promo-futbolka_lycra_long_sleeve/1556568763.jpg', 'promo-futbolka_lycra_long_sleeve', 0, '2019-04-30 13:01:55', '2019-04-30 13:01:55'),
	(30, 'images/women/t_shirts/polo_shirt_short_sleeve/1556569001.jpg', 'polo_shirt_short_sleeve', 1, '2019-04-30 13:03:02', '2019-04-30 13:03:02'),
	(31, 'images/women/t_shirts/polo_shirt_short_sleeve/1556569013.jpg', 'polo_shirt_short_sleeve', 15, '2019-04-30 13:03:02', '2019-04-30 13:03:02'),
	(32, 'images/women/t_shirts/polo_shirt_short_sleeve/1556569023.jpg', 'polo_shirt_short_sleeve', 2, '2019-04-30 13:03:02', '2019-04-30 13:03:02'),
	(33, 'images/women/t_shirts/polo_shirt_short_sleeve/1556569038.jpg', 'polo_shirt_short_sleeve', 8, '2019-04-30 13:03:02', '2019-04-30 13:03:02'),
	(34, 'images/women/t_shirts/polo_shirt_short_sleeve/1556569048.jpg', 'polo_shirt_short_sleeve', 7, '2019-04-30 13:03:02', '2019-04-30 13:03:02'),
	(35, 'images/women/t_shirts/polo_shirt_short_sleeve/1556569058.jpg', 'polo_shirt_short_sleeve', 13, '2019-04-30 13:03:02', '2019-04-30 13:03:02'),
	(36, 'images/men/t_shirts/futbolka-long_sleeve/1555783483.jpg', 'futbolka-long_sleeve', 0, '2019-05-03 22:33:11', '2019-05-03 22:33:11'),
	(37, 'images/men/t_shirts/futbolka-long_sleeve/1555783484.jpg', 'futbolka-long_sleeve', 0, '2019-05-03 22:33:11', '2019-05-03 22:33:11'),
	(38, 'images/men/t_shirts/futbolka-long_sleeve/1555783485.jpg', 'futbolka-long_sleeve', 0, '2019-05-03 22:33:11', '2019-05-03 22:33:11'),
	(39, 'images/men/t_shirts/futbolka-long_sleeve/1555783483.jpg', 'futbolka-long_sleeve', 0, '2019-05-03 22:38:27', '2019-05-03 22:38:27'),
	(40, 'images/men/t_shirts/futbolka-long_sleeve/1555783484.jpg', 'futbolka-long_sleeve', 0, '2019-05-03 22:38:27', '2019-05-03 22:38:27'),
	(41, 'images/men/t_shirts/futbolka-long_sleeve/1555783485.jpg', 'futbolka-long_sleeve', 0, '2019-05-03 22:38:27', '2019-05-03 22:38:27'),
	(42, 'images/men/t_shirts/polo-long-sleeve/1555783544.jpg', 'polo-long-sleeve', 0, '2019-05-03 23:16:07', '2019-05-03 23:16:07'),
	(43, 'images/men/t_shirts/polo-long-sleeve/1555783544.jpg', 'polo-long-sleeve', 0, '2019-05-03 23:16:11', '2019-05-03 23:16:11'),
	(44, 'images/men/t_shirts/promo-futbolka_classic/1555783465.jpg', 'promo-futbolka_classic', 0, '2019-05-06 10:32:49', '2019-05-06 10:32:49'),
	(45, 'images/men/t_shirts/promo-futbolka_classic/1555783466.jpg', 'promo-futbolka_classic', 0, '2019-05-06 10:32:49', '2019-05-06 10:32:49'),
	(46, 'images/men/t_shirts/promo-futbolka_classic/1555783467.jpg', 'promo-futbolka_classic', 0, '2019-05-06 10:32:49', '2019-05-06 10:32:49'),
	(47, 'images/men/t_shirts/promo-futbolka_classic/1555783468.jpg', 'promo-futbolka_classic', 0, '2019-05-06 10:32:49', '2019-05-06 10:32:49'),
	(48, 'images/men/t_shirts/promo-futbolka_classic/1555783469.jpg', 'promo-futbolka_classic', 0, '2019-05-06 10:32:49', '2019-05-06 10:32:49'),
	(49, 'images/men/t_shirts/promo-futbolka_classic/1555783470.jpg', 'promo-futbolka_classic', 0, '2019-05-06 10:32:49', '2019-05-06 10:32:49'),
	(50, 'images/men/t_shirts/promo-futbolka_classic/1555783471.jpg', 'promo-futbolka_classic', 0, '2019-05-06 10:32:49', '2019-05-06 10:32:49'),
	(51, 'images/men/t_shirts/promo-futbolka_classic/1555783472.jpg', 'promo-futbolka_classic', 0, '2019-05-06 10:32:49', '2019-05-06 10:32:49'),
	(52, 'images/men/t_shirts/promo-futbolka_classic/1555783473.jpg', 'promo-futbolka_classic', 0, '2019-05-06 10:32:49', '2019-05-06 10:32:49'),
	(53, 'images/men/t_shirts/promo-futbolka_classic/1555783474.jpg', 'promo-futbolka_classic', 0, '2019-05-06 10:32:49', '2019-05-06 10:32:49'),
	(54, 'images/men/t_shirts/promo-futbolka_classic/1555783475.jpg', 'promo-futbolka_classic', 0, '2019-05-06 10:32:49', '2019-05-06 10:32:49'),
	(55, 'images/men/t_shirts/promo-futbolka_classic/1555783476.jpg', 'promo-futbolka_classic', 0, '2019-05-06 10:32:49', '2019-05-06 10:32:49'),
	(56, 'images/men/t_shirts/promo-futbolka_classic/1555783477.jpg', 'promo-futbolka_classic', 0, '2019-05-06 10:32:49', '2019-05-06 10:32:49'),
	(57, 'images/men/t_shirts/promo-futbolka_classic/1555783478.jpg', 'promo-futbolka_classic', 0, '2019-05-06 10:32:49', '2019-05-06 10:32:49'),
	(58, 'images/men/t_shirts/promo-futbolka_classic/1555783479.jpg', 'promo-futbolka_classic', 0, '2019-05-06 10:32:49', '2019-05-06 10:32:49'),
	(59, 'images/men/t_shirts/promo-futbolka_classic/1555783480.jpg', 'promo-futbolka_classic', 0, '2019-05-06 10:32:49', '2019-05-06 10:32:49'),
	(60, 'images/men/t_shirts/promo-futbolka_classic/1555783481.jpg', 'promo-futbolka_classic', 0, '2019-05-06 10:32:49', '2019-05-06 10:32:49'),
	(61, 'images/men/t_shirts/promo-futbolka_classic/1555783482.jpg', 'promo-futbolka_classic', 0, '2019-05-06 10:32:49', '2019-05-06 10:32:49'),
	(62, 'images/men/t_shirts/polo-short_sleeve/1555783499.jpg', 'polo-short_sleeve', 0, '2019-05-06 10:34:08', '2019-05-06 10:34:08'),
	(63, 'images/men/t_shirts/polo-short_sleeve/1555783500.jpg', 'polo-short_sleeve', 0, '2019-05-06 10:34:08', '2019-05-06 10:34:08'),
	(64, 'images/men/t_shirts/polo-short_sleeve/1555783501.jpg', 'polo-short_sleeve', 0, '2019-05-06 10:34:08', '2019-05-06 10:34:08'),
	(65, 'images/men/t_shirts/polo-short_sleeve/1555783502.jpg', 'polo-short_sleeve', 0, '2019-05-06 10:34:08', '2019-05-06 10:34:08'),
	(66, 'images/men/t_shirts/polo-short_sleeve/1555783503.jpg', 'polo-short_sleeve', 0, '2019-05-06 10:34:08', '2019-05-06 10:34:08'),
	(67, 'images/men/t_shirts/polo-short_sleeve/1555783504.jpg', 'polo-short_sleeve', 0, '2019-05-06 10:34:08', '2019-05-06 10:34:08'),
	(68, 'images/men/t_shirts/polo-short_sleeve/1555783505.jpg', 'polo-short_sleeve', 0, '2019-05-06 10:34:08', '2019-05-06 10:34:08'),
	(69, 'images/men/t_shirts/polo-short_sleeve/1555783506.jpg', 'polo-short_sleeve', 0, '2019-05-06 10:34:08', '2019-05-06 10:34:08'),
	(70, 'images/men/t_shirts/polo-short_sleeve/1555783507.jpg', 'polo-short_sleeve', 0, '2019-05-06 10:34:08', '2019-05-06 10:34:08'),
	(71, 'images/men/t_shirts/polo-short_sleeve/1555783508.jpg', 'polo-short_sleeve', 0, '2019-05-06 10:34:08', '2019-05-06 10:34:08'),
	(72, 'images/men/t_shirts/polo-short_sleeve/1555783509.jpg', 'polo-short_sleeve', 0, '2019-05-06 10:34:08', '2019-05-06 10:34:08'),
	(73, 'images/men/t_shirts/polo-short_sleeve/1555783510.jpg', 'polo-short_sleeve', 0, '2019-05-06 10:34:08', '2019-05-06 10:34:08'),
	(74, 'images/men/t_shirts/polo-short_sleeve/1555783511.jpg', 'polo-short_sleeve', 0, '2019-05-06 10:34:08', '2019-05-06 10:34:08'),
	(75, 'images/children/children_t-shirt/1557159204.jpg', 'children_tshirt', 8, '2019-05-15 00:35:00', '2019-05-15 00:35:00'),
	(76, 'images/children/children_t-shirt/1557159237.jpg', 'children_tshirt', 3, '2019-05-15 00:36:57', '2019-05-15 00:36:57'),
	(77, 'images/children/children_t-shirt/1557159251.jpg', 'children_tshirt', 7, '2019-05-15 00:37:22', '2019-05-15 00:37:22'),
	(78, 'images/children/children_t-shirt/1557159266.jpg', 'children_tshirt', 17, '2019-05-15 00:37:24', '2019-05-15 00:37:24'),
	(79, 'images/children/children_t-shirt/1557159278.jpg', 'children_tshirt', 1, '2019-05-15 00:37:27', '2019-05-15 00:37:27'),
	(80, 'images/men/t_shirts/promo-futbolka_econom/1556530722.jpg', 'promo-futbolka_econom', 3, '2019-05-20 11:39:36', '2019-05-20 11:39:36');
/*!40000 ALTER TABLE `images` ENABLE KEYS */;

-- Дамп структуры для таблица uzbolkab_cottonworld.material_quality
CREATE TABLE IF NOT EXISTS `material_quality` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы uzbolkab_cottonworld.material_quality: ~4 rows (приблизительно)
/*!40000 ALTER TABLE `material_quality` DISABLE KEYS */;
INSERT INTO `material_quality` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'Эконом', '2019-04-22 09:58:46', '2019-04-22 09:58:46'),
	(2, 'Стандарт', '2019-04-22 09:58:47', '2019-04-22 09:58:47'),
	(3, 'Премиум', '2019-04-22 09:58:47', '2019-04-22 09:58:47'),
	(4, 'Акционные', '2019-04-22 09:58:47', '2019-04-22 09:58:47');
/*!40000 ALTER TABLE `material_quality` ENABLE KEYS */;

-- Дамп структуры для таблица uzbolkab_cottonworld.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы uzbolkab_cottonworld.migrations: ~23 rows (приблизительно)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2019_04_15_141600_create_t_shirts_types_table', 1),
	(4, '2019_04_15_141650_create_gender_table', 1),
	(5, '2019_04_15_141714_create_futbolki_table', 1),
	(6, '2019_04_15_141747_create_polo_table', 1),
	(7, '2019_04_16_225029_create_colors_table', 1),
	(8, '2019_04_16_225055_create_material_quality_table', 1),
	(9, '2019_04_16_225829_add_material_qualityFK_to_polo_table', 1),
	(10, '2019_04_16_230209_add_material_qualityFK_to_futbolki_table', 1),
	(11, '2019_04_16_230637_add_create_at_update_at_to_polo_table', 1),
	(12, '2019_04_20_164025_rename_table_futbolki_to_t_shirts', 2),
	(13, '2019_04_20_171709_create_t_shirt_sleeve_table', 2),
	(14, '2019_04_20_172043_add_t_shirt_sleeveFK_to_t_shirt', 2),
	(15, '2019_04_20_174626_create_images_table', 2),
	(16, '2019_04_20_175231_t_shirts_images_table', 2),
	(17, '2019_04_22_072918_t_shirts_colors_table', 3),
	(19, '2019_04_22_124826_add_column_URLPrefix_to_gender_table', 4),
	(20, '2019_04_25_071819_add_column_routeKeyName_to_t_shirts', 5),
	(21, '2019_04_30_130300_add_column_description_to_t_shirt_table', 6),
	(22, '2019_04_30_130732_add_columns_material_and_composition_to_t_shirt_table', 6),
	(23, '2019_05_20_071959_add_column_is_enable_to_t_shirt_color_table', 7),
	(24, '2019_05_31_091525_create_orders_table', 8);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Дамп структуры для таблица uzbolkab_cottonworld.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `t_shirt_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `t_shirt_color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `t_shirt_size` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `t_shirt_qty` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `t_shirt_totalPrice` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` char(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'новый',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы uzbolkab_cottonworld.orders: ~101 rows (приблизительно)
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` (`id`, `t_shirt_name`, `t_shirt_color`, `t_shirt_size`, `t_shirt_qty`, `t_shirt_totalPrice`, `customer_name`, `customer_phone`, `customer_email`, `status`, `created_at`, `updated_at`) VALUES
	(1, 'Футболка мужская', 'красный', '6xl', '4', '26', 'fffff', '+375222444333', 'd@d.com', 'новый', '2019-06-03 12:35:16', '2019-06-03 12:35:16'),
	(2, 'Футболка мужская', 'красный', 'l', '2', '13', 'sdsd', '+375555555555', 'okl@m.com', 'новый', '2019-06-03 12:37:00', '2019-06-03 12:37:00'),
	(3, 'Футболка мужская', 'красный', 's', '5', '32.5', 'd', '+375909090905', 'gt@daa.ru', 'новый', '2019-06-03 12:43:44', '2019-06-03 12:43:44'),
	(4, 'Футболка мужская', 'красный', 's', '2', '13', 'sdsdsd', '+375222323234', 'g@g.com', 'новый', '2019-06-03 17:54:30', '2019-06-03 17:54:30'),
	(5, 'Футболка мужская', 'красный', 'm', '2', '13', 'fdfdf', '+375343343434', 'm@m.com', 'новый', '2019-06-03 17:55:07', '2019-06-03 17:55:07'),
	(6, 'Футболка мужская', 'красный', 's', '2', '13', 'fgfgfgf', '+375454454545', 'gfg@g.com', 'новый', '2019-06-03 17:55:55', '2019-06-03 17:55:55'),
	(7, 'Футболка мужская', 'красный', 's', '2', '13', 'gfgfgfgfg', '+375545456789', 'fgf@gmail.cok', 'новый', '2019-06-03 17:57:16', '2019-06-03 17:57:16'),
	(8, 'Футболка мужская', 'красный', 'm', '3', '19.5', 'dfdfdfdfdfd', '+375343346789', 'sds@com.ya', 'новый', '2019-06-03 17:57:45', '2019-06-03 17:57:45'),
	(9, 'Футболка мужская', 'красный', 's', '7', '45.5', 'лдодлд', '+375676767678', 'а@f.com', 'новый', '2019-06-05 16:51:59', '2019-06-05 16:51:59'),
	(10, 'Футболка мужская', 'красный', 'm', '8', '52', 'klklklkl', '+375787876548', 'g@g.com', 'новый', '2019-06-05 16:52:47', '2019-06-05 16:52:47'),
	(11, 'Футболка мужская', 'красный', 'l', '3', '19.5', '45455', '+375234567891', 's@a.com', 'новый', '2019-06-05 16:58:20', '2019-06-05 16:58:20'),
	(12, 'Футболка мужская', 'красный', 'xl', '23', '149.5', 'f', '+375345674562', 'jh@s.com', 'новый', '2019-06-05 16:59:49', '2019-06-05 16:59:49'),
	(13, 'Футболка мужская', 'красный', 'xl', '3', '19.5', 'dfdfdfd', '+375245432145', 'gh@fg.com', 'новый', '2019-06-05 17:00:43', '2019-06-05 17:00:43'),
	(14, 'Футболка мужская', 'красный', 'm', '6', '39', 'fgfgfgfg', '+375789543267', 'ghgh@g.com', 'новый', '2019-06-05 17:05:45', '2019-06-05 17:05:45'),
	(15, 'Футболка мужская', 'красный', '2xl', '4', '26', 'fgfgfgf', '+375667854356', 'fgfg@h.com', 'новый', '2019-06-05 17:08:33', '2019-06-05 17:08:33'),
	(16, 'Футболка мужская', 'красный', 'xl', '7', '45.5', 'hjhjhjk', '+375908765490', 'hjhj@h.com', 'новый', '2019-06-05 17:09:17', '2019-06-05 17:09:17'),
	(17, 'Футболка мужская', 'красный', 'l', '8', '52', 'hjkhjhhj', '+375564356781', 'hjhj@h.com', 'новый', '2019-06-05 17:11:56', '2019-06-05 17:11:56'),
	(18, 'Футболка мужская', 'красный', '5xl', '8', '52', 'jkjkjkj', '+375897543567', 'jkjk@j.com', 'новый', '2019-06-05 17:17:52', '2019-06-05 17:17:52'),
	(19, 'Футболка мужская', 'красный', '2xl', '8', '52', 'jkjkjkjk', '+375875436783', 'jhj@g.com', 'новый', '2019-06-05 17:18:59', '2019-06-05 17:18:59'),
	(20, 'Футболка мужская', 'красный', 'l', '6', '39', 'hjhjhjhj', '+375676567890', 'fgf@a.com', 'новый', '2019-06-05 17:51:23', '2019-06-05 17:51:23'),
	(21, 'Футболка мужская', 'красный', 'xl', '3', '19.5', 'fdfdfdf', '+375767543789', 'ikkjjk@gmail.com', 'новый', '2019-06-05 17:52:43', '2019-06-05 17:52:43'),
	(22, 'Футболка мужская', 'красный', 'xl', '343', '2229.5', 'gfgfghgh', '+375096784327', 'hjkkj@g.com', 'новый', '2019-06-05 17:54:06', '2019-06-05 17:54:06'),
	(23, 'Футболка мужская', 'красный', '5xl', '45', '292.5', 'ghghghgh', '+375565432456', 'hghg@d.com', 'новый', '2019-06-05 17:55:55', '2019-06-05 17:55:55'),
	(24, 'Футболка мужская', 'красный', '5xl', '45', '292.5', 'ghghghgh', '+375565432456', 'hghg@d.com', 'новый', '2019-06-05 17:55:55', '2019-06-05 17:55:55'),
	(25, 'Футболка мужская', 'красный', '2xl', '233', '1514.5', '232323', '+375235684567', 'dfdf@h.com', 'новый', '2019-06-05 18:01:50', '2019-06-05 18:01:50'),
	(26, 'Футболка мужская', 'красный', 'm', '3', '19.5', 'rere', '+375675432345', 'ghg@a.com', 'новый', '2019-06-06 10:43:33', '2019-06-06 10:43:33'),
	(27, 'Футболка мужская', 'красный', 'l', '5', '32.5', 'gfgfgfg', '+375567432567', 'gfgf@gmail.com', 'новый', '2019-06-06 10:57:58', '2019-06-06 10:57:58'),
	(28, 'Футболка мужская', 'красный', 'm', '32', '208', 'dfdfdfdfd', '+375342345682', 'fdw@a.com', 'новый', '2019-06-06 11:01:56', '2019-06-06 11:01:56'),
	(29, 'Футболка мужская', 'красный', 'l', '4', '26', 'gfgfgf', '+375564345678', 'fgfgfgfgfhngn@gmail.com', 'новый', '2019-06-06 11:03:40', '2019-06-06 11:03:40'),
	(30, 'Футболка мужская', 'красный', 'm', '7', '45.5', 'Татьяна', '+375456785667', 'tat@tat.by', 'новый', '2019-06-06 11:04:51', '2019-06-06 11:04:51'),
	(31, 'Футболка мужская', 'красный', 'm', '6', '39', 'yyu', '+375565656678', 'yjyujy@ya.ru', 'новый', '2019-06-06 11:29:16', '2019-06-06 11:29:16'),
	(32, 'Футболка мужская', 'красный', 'm', '0', '0', '', '', '', 'новый', '2019-06-06 11:29:16', '2019-06-06 11:29:16'),
	(33, 'Футболка мужская', 'красный', 'l', '0', '0', 'hhnjhn', '+375878787657', 'lki@a.com', 'новый', '2019-06-06 11:29:53', '2019-06-06 11:29:53'),
	(34, 'Футболка мужская', 'красный', 'l', '0', '0', '', '', '', 'новый', '2019-06-06 11:29:53', '2019-06-06 11:29:53'),
	(35, 'Футболка мужская', 'красный', 's', '4', '26', '454545454', '+375567434567', 'gfggfg@gmail.com', 'новый', '2019-06-06 11:30:58', '2019-06-06 11:30:58'),
	(36, 'Футболка мужская', 'красный', 's', '0', '0', '', '', '', 'новый', '2019-06-06 11:30:58', '2019-06-06 11:30:58'),
	(37, 'Футболка мужская', 'красный', 's', '0', '0', 'hnhjhj', '+375678543456', 'kil@a.com', 'новый', '2019-06-06 11:32:35', '2019-06-06 11:32:35'),
	(38, 'Футболка мужская', 'красный', 'xl', '0', '0', 'uuikuik', '+375567894345', 'dfdfd@a.com', 'новый', '2019-06-06 11:45:13', '2019-06-06 11:45:13'),
	(39, 'Футболка мужская', 'красный', 'xl', '0', '0', '', '', '', 'новый', '2019-06-06 11:45:13', '2019-06-06 11:45:13'),
	(40, 'Футболка мужская', 'красный', 's', '0', '0', 'yhyhyhy', '+375678987656', 'jjjhj@a.com', 'новый', '2019-06-06 11:46:26', '2019-06-06 11:46:26'),
	(41, 'Футболка мужская', 'красный', 's', '0', '0', '', '', '', 'новый', '2019-06-06 11:46:26', '2019-06-06 11:46:26'),
	(42, 'Футболка мужская', 'красный', 's', '1', '6.5', 'jk,jkj', '+375567843256', 'dgfdf@a.com', 'новый', '2019-06-06 12:00:15', '2019-06-06 12:00:15'),
	(43, 'Футболка мужская', 'красный', 'xl', '6', '39', 'ghghghg', '+375678954345', 'dfdf@a.com', 'новый', '2019-06-06 12:00:43', '2019-06-06 12:00:43'),
	(44, 'Футболка мужская', 'красный', 's', '8', '52', 'jhjhhjhjh', '+375678976567', 'jujj@r.com', 'новый', '2019-06-06 16:03:41', '2019-06-06 16:03:41'),
	(45, 'Футболка мужская', 'красный', '2xl', '8', '52', 'fgfgtryty', '+375456432456', 'gfgfgfg@f.com', 'новый', '2019-06-06 16:50:28', '2019-06-06 16:50:28'),
	(46, 'Футболка мужская', 'красный', 'm', '3', '19.5', 'hyjhj', '+375676767667', 'klk@fgf.com', 'новый', '2019-06-06 16:52:18', '2019-06-06 16:52:18'),
	(47, 'Футболка мужская', 'красный', 'l', '4', '26', 'укукук', '+375456543456', 'dfdf@kd.com', 'новый', '2019-06-07 11:12:26', '2019-06-07 11:12:26'),
	(48, 'Футболка мужская', 'красный', 'xl', '2', '13', 'dfdfdf', '+375456434567', 'dfdfd@mail.com', 'новый', '2019-06-07 11:18:58', '2019-06-07 11:18:58'),
	(49, 'Футболка мужская', 'красный', 'l', '343', '2229.5', 'dfdfdfdfdfd', '+375456545345', 'dffdf@gmail.com', 'новый', '2019-06-07 11:20:29', '2019-06-07 11:20:29'),
	(50, 'Футболка мужская', 'красный', 'm', '3', '19.5', 'dfdfdfdf', '+375567890564', 'dfdfdf@mail.com', 'новый', '2019-06-07 11:21:05', '2019-06-07 11:21:05'),
	(51, 'Футболка мужская', 'красный', 'xl', '6', '39', 'апапапапап', '+375456732456', 'g@g.com', 'новый', '2019-06-07 11:23:12', '2019-06-07 11:23:12'),
	(52, 'Футболка мужская', 'красный', 'xl', '23', '149.5', 'dfdfdfdfdf', '+375456434567', 'dfdf@g.ocm', 'новый', '2019-06-07 11:23:34', '2019-06-07 11:23:34'),
	(53, 'Футболка мужская', 'красный', '4xl', '4', '26', 'fgfgfgfgfgf', '+375456344657', 'dfdfdfdf@m.com', 'новый', '2019-06-07 11:25:02', '2019-06-07 11:25:02'),
	(54, 'Футболка мужская', 'красный', 'xl', '6', '39', 'ghghghghgh', '+375567567843', 'fgfgf@k.ocm', 'новый', '2019-06-07 11:25:45', '2019-06-07 11:25:45'),
	(55, 'Футболка мужская', 'красный', 'xl', '3', '19.5', 'eerere', '+375345234561', 'a@a.com', 'новый', '2019-06-07 11:27:25', '2019-06-07 11:27:25'),
	(56, 'Футболка мужская', 'красный', 'xl', '45', '292.5', 'fgfgfgfg', '+375678543456', 'dfdf@a.com', 'новый', '2019-06-07 11:28:20', '2019-06-07 11:28:20'),
	(57, 'Футболка мужская', 'красный', 'l', '2', '13', 'fdfdfdfdf', '+375456345673', 'dfdf@a.com', 'новый', '2019-06-07 11:28:51', '2019-06-07 11:28:51'),
	(58, 'Футболка мужская', 'красный', 'm', '23', '149.5', 'dfdfdfdfdf', '+375456434569', 'fgfgf@o.ocm', 'новый', '2019-06-07 11:29:18', '2019-06-07 11:29:18'),
	(59, 'Футболка мужская', 'красный', 'l', '3', '19.5', 'fdfdfdf', '+375445678341', 'sdsdsd@a.com', 'новый', '2019-06-07 11:29:51', '2019-06-07 11:29:51'),
	(60, 'Футболка мужская', 'красный', 'l', '3', '19.5', 'fdfdfdf', '+375345673451', 'hkjklkl@gmail.com', 'новый', '2019-06-07 11:32:18', '2019-06-07 11:32:18'),
	(61, 'Футболка мужская', 'красный', '4xl', '3', '19.5', 'dfdff', '+375344563213', 'dsds@a.com', 'новый', '2019-06-10 11:14:55', '2019-06-10 11:14:55'),
	(62, 'Футболка мужская', 'красный', 'xl', '5', '32.5', 't', '+375567894563', 'dfd@a.com', 'новый', '2019-06-10 11:19:37', '2019-06-10 11:19:37'),
	(63, 'Футболка мужская', 'красный', 'l', '2', '13', 'fdfdfd', '+375345673452', 'sdsd@a.com', 'новый', '2019-06-10 11:25:04', '2019-06-10 11:25:04'),
	(64, 'Футболка мужская', 'красный', '2xl', '3', '19.5', 'dfdff', '+375345345612', 'sds@a.com', 'новый', '2019-06-10 11:26:43', '2019-06-10 11:26:43'),
	(65, 'Футболка мужская', 'красный', 'xl', '43', '279.5', 'fgfgfgfg', '+375456789345', 'dfdf@a.com', 'новый', '2019-06-10 11:27:44', '2019-06-10 11:27:44'),
	(66, 'Футболка мужская', 'красный', '3xl', '3', '19.5', 'fdfdfdf', '+375345672341', 'sds@a.com', 'новый', '2019-06-10 11:28:12', '2019-06-10 11:28:12'),
	(67, 'Футболка мужская', 'красный', '2xl', '2', '13', 'fdfdf', '+375234567843', 's@a.com', 'новый', '2019-06-10 11:31:18', '2019-06-10 11:31:18'),
	(68, 'Футболка мужская', 'красный', 'l', '1', '6.5', 'dsds', '+375234567342', 'sdsd@a.com', 'новый', '2019-06-10 11:38:40', '2019-06-10 11:38:40'),
	(69, 'Футболка мужская', 'красный', 'xl', '4', '26', 'dsdsds', '+375234562345', 'asa@a.com', 'новый', '2019-06-10 11:46:24', '2019-06-10 11:46:24'),
	(70, 'Футболка мужская', 'красный', '3xl', '3', '19.5', 'sdsdsd', '+375234567234', 'ddfdfdf@a.com', 'новый', '2019-06-10 11:48:22', '2019-06-10 11:48:22'),
	(71, 'Футболка мужская', 'красный', '3xl', '34', '221', 'dfdfds', '+375345678923', 'dsds@a.com', 'новый', '2019-06-10 11:50:07', '2019-06-10 11:50:07'),
	(72, 'Футболка мужская', 'красный', '2xl', '2', '13', 'sdsdsd', '+375345234123', 'fdfdf@a.com', 'новый', '2019-06-10 11:51:03', '2019-06-10 11:51:03'),
	(73, 'Футболка мужская', 'красный', 'l', '4', '26', 'fdfdf', '+375567891234', 'sdsdsd@a.com', 'новый', '2019-06-10 11:52:07', '2019-06-10 11:52:07'),
	(74, 'Футболка мужская', 'красный', 'xl', '3', '19.5', 'dfdfdfdf', '+375455665678', 'jkjkj@a.com', 'новый', '2019-06-10 11:52:53', '2019-06-10 11:52:53'),
	(75, 'Футболка мужская', 'красный', 'm', '7', '45.5', 'klklkl', '+375789045632', 'sdsd@a.com', 'новый', '2019-06-10 12:24:05', '2019-06-10 12:24:05'),
	(76, 'Футболка мужская', 'красный', 'm', '7', '45.5', 'klklkl', '+375789045632', 'sdsd@a.com', 'новый', '2019-06-10 12:24:08', '2019-06-10 12:24:08'),
	(77, 'Футболка мужская', 'красный', 'l', '7', '45.5', 'thtyh', '+375567854561', 'dfdf@a.com', 'новый', '2019-06-10 15:23:34', '2019-06-10 15:23:34'),
	(78, 'Футболка мужская', 'красный', '2xl', '4', '26', 'dfd', '+375567456431', 'sds@a.com', 'новый', '2019-06-10 15:24:56', '2019-06-10 15:24:56'),
	(79, 'Футболка мужская', 'красный', '3xl', '7', '45.5', 'hjhjhjhj', '+375678954321', 'dfdf@a.com', 'новый', '2019-06-10 15:26:03', '2019-06-10 15:26:03'),
	(80, 'Футболка мужская', 'красный', 'xl', '5', '32.5', 'ghghghg', '+375456784345', 'fgfgfg@a.com', 'новый', '2019-06-10 15:28:20', '2019-06-10 15:28:20'),
	(81, 'Футболка мужская', 'красный', 'xl', '2', '13', 'dsdsds', '+375234567124', 'sdsdd@a.com', 'новый', '2019-06-10 15:30:13', '2019-06-10 15:30:13'),
	(82, 'Футболка мужская', 'красный', 'xl', '6', '39', 'jhjhjhj', '+375678956743', 'gghh@sa.com', 'новый', '2019-06-10 15:31:09', '2019-06-10 15:31:09'),
	(83, 'Футболка мужская', 'красный', '2xl', '2', '13', 'sdsdsds', '+375234562341', 'dfdfdf@a.com', 'новый', '2019-06-10 15:31:36', '2019-06-10 15:31:36'),
	(84, 'Футболка мужская', 'красный', 'xl', '4', '26', 'dfdfdf', '+375456342344', 'dfdf@a.com', 'новый', '2019-06-10 15:33:18', '2019-06-10 15:33:18'),
	(85, 'Футболка мужская', 'красный', '2xl', '2', '13', 'dfdfdfd', '+375456556782', 'sdsds@a.com', 'новый', '2019-06-10 16:13:37', '2019-06-10 16:13:37'),
	(86, 'Футболка мужская', 'красный', 's', '2', '13', 'dfdfdfd', '+375345678451', 'sdsds@a.com', 'новый', '2019-06-10 16:17:55', '2019-06-10 16:17:55'),
	(87, 'Футболка мужская', 'красный', 'xl', '3', '19.5', 'sddsd', '+375234567341', 'sdsds@a.com', 'новый', '2019-06-10 16:25:35', '2019-06-10 16:25:35'),
	(88, 'Футболка мужская', 'красный', 'm', '5', '32.5', 'fgfgfg', '+375345632345', 'sdds@a.com', 'новый', '2019-06-10 16:26:19', '2019-06-10 16:26:19'),
	(89, 'Футболка мужская', 'красный', '4xl', '232', '1508', 'dfdfdfdbgbgb', '+375234567234', 'beluaevVladislav@gmail.com', 'новый', '2019-06-10 16:27:52', '2019-06-10 16:27:52'),
	(90, 'Футболка мужская', 'красный', 'xl', '3', '19.5', 'Денис Эдуардович', '+375456783451', 'beluaevVladislavbeluaevVladislav@gmail.com', 'новый', '2019-06-10 16:30:24', '2019-06-10 16:30:24'),
	(91, 'Футболка мужская', 'красный', 'm', '5', '32.5', 'прпрпрпр', '+375234567812', 'asa@a.com', 'новый', '2019-06-10 16:33:54', '2019-06-10 16:33:54'),
	(92, 'Футболка мужская', 'красный', '2xl', '45', '292.5', 'fgfgfgfgfgh', '+375567321345', 'fgfgfgnklgdf@a.com', 'новый', '2019-06-10 16:35:12', '2019-06-10 16:35:12'),
	(93, 'Футболка мужская', 'красный', '2xl', '5656', '36764', 'fghfhfhykhjm', '+375890675431', 'dfdfdf@sdfdf.com', 'новый', '2019-06-10 16:36:26', '2019-06-10 16:36:26'),
	(94, 'Футболка женская', 'красный', 'l', '6', '39', 'ghjhhj', '+375567893456', 'hjhjhj@a.ocm', 'новый', '2019-06-11 14:50:50', '2019-06-11 14:50:50'),
	(95, 'Футболка женская', 'красный', 'l', '6', '39', 'ghjhhj', '+375567893456', 'hjhjhj@a.ocm', 'новый', '2019-06-11 14:51:12', '2019-06-11 14:51:12'),
	(96, 'Футболка женская', 'красный', 'xl', '5', '32.5', 'ghghgh', '+375678943567', 'sdsd@a.com', 'новый', '2019-06-11 14:52:01', '2019-06-11 14:52:01'),
	(97, 'Футболка женская', 'красный', 'xl', '2', '13', 'sdsds', '+375345643451', 'dfdf@ac.omc', 'новый', '2019-06-11 14:52:54', '2019-06-11 14:52:54'),
	(98, 'Футболка женская', 'красный', 'm', '3', '19.5', 'sdsdsd', '+375234563234', 'dsds@a.con', 'новый', '2019-06-11 14:53:50', '2019-06-11 14:53:50'),
	(99, 'Футболка женская', 'красный', '2xl', '3', '19.5', 'dfdfdf', '+375456732345', '1dfdf@a.con', 'новый', '2019-06-11 14:58:43', '2019-06-11 14:58:43'),
	(100, 'Футболка мужская', 'красный', '6xl', '4', '26', 'fgfghg', '+375456783234', 'sdsdfbfv@a.com', 'новый', '2019-06-11 14:59:14', '2019-06-11 14:59:14'),
	(101, 'Детская футболка', 'красный', '2xl', '4', '26', 'df', '+375345672135', 'sdsd@a.com', 'новый', '2019-06-11 15:35:01', '2019-06-11 15:35:01');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;

-- Дамп структуры для таблица uzbolkab_cottonworld.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы uzbolkab_cottonworld.password_resets: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Дамп структуры для таблица uzbolkab_cottonworld.t_shirts
CREATE TABLE IF NOT EXISTS `t_shirts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `routeKeyName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `material` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `composition` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `density` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender_id` int(10) unsigned NOT NULL,
  `t_shirts_types_id` int(10) unsigned NOT NULL,
  `material_quality_id` int(10) unsigned NOT NULL,
  `t_shirt_sleeve_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `futbolki_gender_id_foreign` (`gender_id`),
  KEY `futbolki_t_shirts_types_id_foreign` (`t_shirts_types_id`),
  KEY `futbolki_material_quality_id_foreign` (`material_quality_id`),
  KEY `t_shirts_t_shirt_sleeve_id_foreign` (`t_shirt_sleeve_id`),
  CONSTRAINT `futbolki_gender_id_foreign` FOREIGN KEY (`gender_id`) REFERENCES `gender` (`id`) ON DELETE CASCADE,
  CONSTRAINT `futbolki_material_quality_id_foreign` FOREIGN KEY (`material_quality_id`) REFERENCES `material_quality` (`id`) ON DELETE CASCADE,
  CONSTRAINT `futbolki_t_shirts_types_id_foreign` FOREIGN KEY (`t_shirts_types_id`) REFERENCES `t_shirts_types` (`id`) ON DELETE CASCADE,
  CONSTRAINT `t_shirts_t_shirt_sleeve_id_foreign` FOREIGN KEY (`t_shirt_sleeve_id`) REFERENCES `t_shirt_sleeve` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы uzbolkab_cottonworld.t_shirts: ~10 rows (приблизительно)
/*!40000 ALTER TABLE `t_shirts` DISABLE KEYS */;
INSERT INTO `t_shirts` (`id`, `name`, `routeKeyName`, `description`, `material`, `composition`, `density`, `price`, `gender_id`, `t_shirts_types_id`, `material_quality_id`, `t_shirt_sleeve_id`, `created_at`, `updated_at`) VALUES
	(1, 'Футболка мужская', 'promo-futbolka_econom', 'Новая линейка мужских и женских футболок из 100% кольцепряжильной пряжи Ne30/1 (Nm 51/1). Плотность материала выпускаемого вида футболок немного ниже, чем у стандартных футболки CR и составляет 150 г/м2.', 'Кулирная гладь', '100% кольцепрядильная пряжа Ne30/1 (Nm 51/1).', '150-155 г/м2', '2,08', 1, 1, 1, 1, '2019-04-22 10:00:04', '2019-04-22 10:00:04'),
	(2, 'Промо футболки «Классик»', 'promo-futbolka_classic', 'Футболка мужская прямого покроя, рукав короткий втачной. По линии горловины втачен ворот из ластичного полотна с 5% добавлением лайкры. Росток и плечевые швы обтачены бейкой из основного полотна, в край проложена отделочная строчка. Низ изделия и рукава подогнуты и подшиты плоским швом.', 'Кулирная гладь', '100% х/б. Кольцепрядильная кардная пряжа Ne 24/1 (Nm 40/1).', '175-180 г/м2', '2,32', 1, 1, 2, 1, '2019-04-22 10:00:04', '2019-04-22 10:00:04'),
	(3, 'Футболка с длинным рукавом', 'futbolka-longSleeve', 'Трикотажная футболка мужская прямого покроя, рукав длинный втачной. Боковые швы стачены на четырёхниточном оверлоке. Горловина обработана бейкой из основного полотна на трёхниточной плоскошовной машине. Низ изделия и рукава подогнуты и подшиты плоским швом на трехниточной плоскошовной машине.', 'Трикотажное двухфонтурное полотно типа "Интерлок"', '100% х/б кольцепрядильная кардная пряжа №е24/1 на кругловязальной машине итальянской марки "Orizio" 32 дюйм, 26 класс.', '210-220 г/м2', '4,05', 1, 1, 3, 2, '2019-04-22 10:00:04', '2019-04-22 10:00:04'),
	(4, 'Поло с коротким рукавом', 'polo-shortSleeve', 'Трикотажная рубашка «Поло» прямого покроя, с коротким втачным рукавом, отложным в резинку воротником и планкой с застежкой из трех пуговиц. Росток и плечевые швы обтачены бейкой из основного полотна. Низ изделия и рукава подогнуты и подшиты плоским швом.', 'Пике', '100% х/б. Кольцепрядильная кардная пряжа Nе 30/1 (Nm51/1).', '180-185 г/м2', '4,27', 1, 2, 2, 1, '2019-04-22 10:00:04', '2019-04-22 10:00:04'),
	(5, 'Поло с длинным рукавом', 'polo-longSleeve', 'Трикотажная рубашка «Поло» прямого покроя, с длинным рукавом, отложным в резинку воротником и планкой с застежкой из трех пуговиц. Росток и плечевые швы обтачены бейкой из основного полотна. Низ изделия и рукава подогнуты и подшиты плоским швом.', 'Пике', '100% х/б. Кольцепрядильная кардная пряжа Nе 30/1 (Nm51/1).', '180-185 г/м2', '5,05', 1, 2, 2, 2, '2019-04-22 10:00:04', '2019-04-22 10:00:04'),
	(6, 'Футболка женская', 'promo-futbolka_cotton_short_sleeve', 'Трикотажная футболка женская приталенного покроя, рукав короткий втачной. Боковые швы стачены на четырёхниточном оверлоке. По линии горловины четырёхниточным оверлоком втачен ворот из ластичного полотна с 5% добавлением лайкры. Росток обтачен бейкой из основного полотна, в край проложена отделочная строчка. Низ изделия и рукава подогнуты и подшиты плоским швом на трехниточной плоскошовной машине.', 'Кулирная гладь', '100% х/б кольцепрядильной кардной пряжи №е24/1 на кругловязальной машине итальянской марки "Orizio" 32 дюйм, 28 класс.', '175-180 г/м2', '2,22', 2, 1, 1, 1, '2019-04-30 09:26:12', '2019-04-30 09:26:12'),
	(7, 'Промо футболка с лайкрой (короткий рукав)', 'promo-futbolka_lycra_short_sleeve', 'Трикотажная футболка женская приталенного покроя, рукав короткий втачной. Боковые швы стачены на четырёхниточном оверлоке. По линии горловины четырёхниточным оверлоком втачен ворот из ластичного полотна с 5% добавлением лайкры. Росток обтачен бейкой из основного полотна, в край проложена отделочная строчка. Низ изделия и рукава подогнуты и подшиты плоским швом на трехниточной плоскошовной машине.', 'Кулирная гладь', '96% х/б кольцепрядильной кардной пряжи №е24/1 с добавлением 4% лайкры (Spandex) на кругловязальной машине итальянской марки "Orizio" 32 дюйм, 28 класс.', '185-190 г/м2', '2,65', 2, 1, 2, 1, '2019-04-30 09:26:12', '2019-04-30 09:26:12'),
	(8, 'Промо футболка с лайкрой (длинный рукав)', 'promo-futbolka_lycra_long_sleeve', 'Трикотажная футболка женская приталенного покроя, рукав длинный втачной. Боковые швы стачены на четырёхниточном оверлоке. По линии горловины четырёхниточным оверлоком втачен ворот из ластичного полотна с 5% добавлением лайкры. Росток обтачен бейкой из основного полотна, в край проложена отделочная строчка. Низ изделия и рукава подогнуты и подшиты плоским швом на трехниточной плоскошовной машине.', 'Кулирная гладь', '96% х/б кольцепрядильной кардной пряжи №е24/1 с добавлением 4% лайкры(Spandex) на кругловязальной машине итальянской марки "Orizio" 32 дюйм, 28 класс.', '185-190 г/м2', '3,15', 2, 1, 2, 1, '2019-04-30 09:26:12', '2019-04-30 09:26:12'),
	(9, 'Рубашка поло женская с коротким рукавом', 'polo_shirt_short_sleeve', 'Трикотажная Рубашка «Поло» женская приталенного покроя, с коротким втачным рукавом, отложным в резинку воротником и планкой с застежкой из двух или трех пуговиц в тон полотна. Росток обтачен бейкой из основного полотна. Низ изделия и рукава подогнуты и подшиты плоским швом. Боковые швы стачены на четырёхниточном оверлоке. Планка отстрочена на одноигольной машине челночного стежка. Ворот стачен на четырёхниточном оверлоке. Низ изделия и рукавов подогнут и прошит на трёхигольной плоскошовной машине. Петли пробиты на автоматической петельной машине челночного стежка.', 'Пике', '100% х/б. Кольцепрядильной кардной пряжи №е 30/1 на кругловязальных машинах итальянской марки "Orizio" 32 дюйм, 24 класс.', '180-185 г/м2', '4,22', 2, 2, 2, 1, '2019-04-30 09:26:12', '2019-04-30 09:26:12'),
	(10, 'Детская футболка', 'children_t-shirt', 'Футболка детская прямого покроя, рукав короткий втачной. По линии горловины втачен ворот из ластичного полотна с 5% добавлением лайкры. Росток и плечевые швы обтачены бейкой из основного полотна, в край проложена отделочная строчка. Низ изделия и рукава подогнуты и подшиты плоским швом.', 'Кулирная гладь', '100% х/б. Кольцепрядильная кардная пряжа № 30/1.', '175-180 г/м2', '2,08', 3, 1, 2, 1, '2019-05-15 00:31:58', '2019-05-15 00:31:58');
/*!40000 ALTER TABLE `t_shirts` ENABLE KEYS */;

-- Дамп структуры для таблица uzbolkab_cottonworld.t_shirts_types
CREATE TABLE IF NOT EXISTS `t_shirts_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы uzbolkab_cottonworld.t_shirts_types: ~2 rows (приблизительно)
/*!40000 ALTER TABLE `t_shirts_types` DISABLE KEYS */;
INSERT INTO `t_shirts_types` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'футблока', '2019-04-22 09:59:00', '2019-04-22 09:59:00'),
	(2, 'поло', '2019-04-22 09:59:00', '2019-04-22 09:59:00');
/*!40000 ALTER TABLE `t_shirts_types` ENABLE KEYS */;

-- Дамп структуры для таблица uzbolkab_cottonworld.t_shirt_color
CREATE TABLE IF NOT EXISTS `t_shirt_color` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `t_shirt_id` int(10) unsigned NOT NULL,
  `color_id` int(10) unsigned NOT NULL,
  `is_enable` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `t_shirt_color_t_shirt_id_foreign` (`t_shirt_id`),
  KEY `t_shirt_color_color_id_foreign` (`color_id`),
  CONSTRAINT `t_shirt_color_color_id_foreign` FOREIGN KEY (`color_id`) REFERENCES `colors` (`id`) ON DELETE CASCADE,
  CONSTRAINT `t_shirt_color_t_shirt_id_foreign` FOREIGN KEY (`t_shirt_id`) REFERENCES `t_shirts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы uzbolkab_cottonworld.t_shirt_color: ~82 rows (приблизительно)
/*!40000 ALTER TABLE `t_shirt_color` DISABLE KEYS */;
INSERT INTO `t_shirt_color` (`id`, `t_shirt_id`, `color_id`, `is_enable`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, 1, '2019-04-22 10:40:09', '2019-04-22 10:40:09'),
	(2, 1, 2, 1, '2019-04-22 10:40:09', '2019-04-22 10:40:09'),
	(3, 1, 5, 0, '2019-04-22 10:40:09', '2019-04-22 10:40:09'),
	(4, 1, 7, 0, '2019-04-22 10:40:09', '2019-04-22 10:40:09'),
	(5, 1, 8, 0, '2019-04-22 10:40:09', '2019-04-22 10:40:09'),
	(6, 1, 9, 0, '2019-04-22 10:40:09', '2019-04-22 10:40:09'),
	(7, 1, 10, 0, '2019-04-22 10:40:09', '2019-04-22 10:40:09'),
	(8, 1, 11, 0, '2019-04-22 10:40:09', '2019-04-22 10:40:09'),
	(9, 1, 12, 0, '2019-04-22 10:40:09', '2019-04-22 10:40:09'),
	(10, 1, 13, 0, '2019-04-22 10:40:09', '2019-04-22 10:40:09'),
	(11, 1, 15, 1, '2019-04-22 10:40:09', '2019-04-22 10:40:09'),
	(12, 1, 16, 0, '2019-04-22 10:40:09', '2019-04-22 10:40:09'),
	(13, 2, 1, 0, '2019-04-22 10:40:09', '2019-04-22 10:40:09'),
	(14, 2, 2, 0, '2019-04-22 10:40:09', '2019-04-22 10:40:09'),
	(15, 2, 3, 0, '2019-04-22 10:40:09', '2019-04-22 10:40:09'),
	(16, 2, 4, 0, '2019-04-22 10:40:09', '2019-04-22 10:40:09'),
	(17, 2, 5, 0, '2019-04-22 10:40:09', '2019-04-22 10:40:09'),
	(18, 2, 6, 0, '2019-04-22 10:40:09', '2019-04-22 10:40:09'),
	(19, 2, 7, 0, '2019-04-22 10:40:09', '2019-04-22 10:40:09'),
	(20, 2, 8, 0, '2019-04-22 10:40:09', '2019-04-22 10:40:09'),
	(21, 2, 9, 0, '2019-04-22 10:40:09', '2019-04-22 10:40:09'),
	(22, 2, 10, 0, '2019-04-22 10:40:09', '2019-04-22 10:40:09'),
	(23, 2, 11, 0, '2019-04-22 10:40:09', '2019-04-22 10:40:09'),
	(24, 2, 12, 0, '2019-04-22 10:40:09', '2019-04-22 10:40:09'),
	(25, 2, 13, 0, '2019-04-22 10:40:09', '2019-04-22 10:40:09'),
	(26, 2, 14, 0, '2019-04-22 10:40:09', '2019-04-22 10:40:09'),
	(27, 2, 15, 0, '2019-04-22 10:40:09', '2019-04-22 10:40:09'),
	(28, 2, 16, 0, '2019-04-22 10:40:09', '2019-04-22 10:40:09'),
	(29, 3, 1, 0, '2019-04-22 10:40:09', '2019-04-22 10:40:09'),
	(30, 3, 2, 0, '2019-04-22 10:40:09', '2019-04-22 10:40:09'),
	(31, 3, 13, 0, '2019-04-22 10:40:09', '2019-04-22 10:40:09'),
	(32, 3, 15, 0, '2019-04-22 10:40:09', '2019-04-22 10:40:09'),
	(33, 4, 1, 0, '2019-04-22 10:40:09', '2019-04-22 10:40:09'),
	(34, 4, 2, 0, '2019-04-22 10:40:09', '2019-04-22 10:40:09'),
	(35, 4, 3, 0, '2019-04-22 10:40:09', '2019-04-22 10:40:09'),
	(36, 4, 4, 0, '2019-04-22 10:40:10', '2019-04-22 10:40:10'),
	(37, 4, 5, 0, '2019-04-22 10:40:10', '2019-04-22 10:40:10'),
	(38, 4, 6, 0, '2019-04-22 10:40:10', '2019-04-22 10:40:10'),
	(39, 4, 7, 0, '2019-04-22 10:40:10', '2019-04-22 10:40:10'),
	(40, 4, 8, 0, '2019-04-22 10:40:10', '2019-04-22 10:40:10'),
	(41, 4, 9, 0, '2019-04-22 10:40:10', '2019-04-22 10:40:10'),
	(42, 4, 10, 0, '2019-04-22 10:40:10', '2019-04-22 10:40:10'),
	(43, 4, 11, 0, '2019-04-22 10:40:10', '2019-04-22 10:40:10'),
	(44, 4, 12, 0, '2019-04-22 10:40:10', '2019-04-22 10:40:10'),
	(45, 4, 13, 0, '2019-04-22 10:40:10', '2019-04-22 10:40:10'),
	(46, 4, 14, 0, '2019-04-22 10:40:10', '2019-04-22 10:40:10'),
	(47, 4, 15, 0, '2019-04-22 10:40:10', '2019-04-22 10:40:10'),
	(48, 4, 16, 0, '2019-04-22 10:40:10', '2019-04-22 10:40:10'),
	(49, 5, 1, 0, '2019-04-22 10:40:10', '2019-04-22 10:40:10'),
	(50, 5, 13, 0, '2019-04-22 10:40:10', '2019-04-22 10:40:10'),
	(51, 6, 1, 1, '2019-04-30 09:48:49', '2019-04-30 09:48:49'),
	(52, 6, 2, 1, '2019-04-30 09:48:49', '2019-04-30 09:48:49'),
	(53, 6, 8, 1, '2019-04-30 09:48:49', '2019-04-30 09:48:49'),
	(54, 6, 12, 0, '2019-04-30 09:48:49', '2019-04-30 09:48:49'),
	(55, 6, 13, 1, '2019-04-30 09:48:49', '2019-04-30 09:48:49'),
	(56, 6, 14, 0, '2019-04-30 09:48:49', '2019-04-30 09:48:49'),
	(57, 6, 15, 1, '2019-04-30 09:48:49', '2019-04-30 09:48:49'),
	(58, 7, 1, 0, '2019-04-30 09:48:49', '2019-04-30 09:48:49'),
	(59, 7, 2, 0, '2019-04-30 09:48:49', '2019-04-30 09:48:49'),
	(60, 7, 5, 0, '2019-04-30 09:48:49', '2019-04-30 09:48:49'),
	(61, 7, 7, 0, '2019-04-30 09:48:49', '2019-04-30 09:48:49'),
	(62, 7, 8, 0, '2019-04-30 09:48:49', '2019-04-30 09:48:49'),
	(63, 7, 12, 0, '2019-04-30 09:48:49', '2019-04-30 09:48:49'),
	(64, 7, 13, 0, '2019-04-30 09:48:49', '2019-04-30 09:48:49'),
	(65, 7, 15, 0, '2019-04-30 09:48:49', '2019-04-30 09:48:49'),
	(66, 8, 1, 0, '2019-04-30 09:48:49', '2019-04-30 09:48:49'),
	(67, 8, 15, 0, '2019-04-30 09:48:49', '2019-04-30 09:48:49'),
	(68, 9, 1, 0, '2019-04-30 09:48:49', '2019-04-30 09:48:49'),
	(69, 9, 2, 0, '2019-04-30 09:48:49', '2019-04-30 09:48:49'),
	(70, 9, 7, 0, '2019-04-30 09:48:49', '2019-04-30 09:48:49'),
	(71, 9, 8, 0, '2019-04-30 09:48:49', '2019-04-30 09:48:49'),
	(72, 9, 13, 0, '2019-04-30 09:48:49', '2019-04-30 09:48:49'),
	(73, 9, 15, 1, '2019-04-30 09:48:49', '2019-06-11 15:12:41'),
	(74, 10, 1, 1, '2019-05-15 00:49:13', '2019-06-11 15:12:37'),
	(75, 10, 3, 1, '2019-05-15 00:49:37', '2019-06-11 15:17:56'),
	(76, 10, 8, 1, '2019-05-15 00:49:44', '2019-06-11 15:12:56'),
	(77, 10, 7, 1, '2019-05-15 00:49:51', '2019-06-11 15:17:58'),
	(78, 10, 17, 1, '2019-05-15 00:49:58', '2019-06-11 15:18:00'),
	(81, 1, 3, 1, '2019-05-20 10:34:15', '2019-05-20 10:34:17'),
	(82, 1, 18, 1, '2019-05-20 10:38:38', '2019-05-20 10:38:39'),
	(83, 1, 17, 1, '2019-05-21 16:12:28', '2019-05-21 16:12:29'),
	(84, 6, 7, 1, '2019-06-11 10:06:13', '2019-06-11 10:06:13');
/*!40000 ALTER TABLE `t_shirt_color` ENABLE KEYS */;

-- Дамп структуры для таблица uzbolkab_cottonworld.t_shirt_image
CREATE TABLE IF NOT EXISTS `t_shirt_image` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `t_shirt_id` int(10) unsigned NOT NULL,
  `image_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `t_shirt_image_t_shirt_id_foreign` (`t_shirt_id`),
  KEY `t_shirt_image_image_id_foreign` (`image_id`),
  CONSTRAINT `t_shirt_image_image_id_foreign` FOREIGN KEY (`image_id`) REFERENCES `images` (`id`) ON DELETE CASCADE,
  CONSTRAINT `t_shirt_image_t_shirt_id_foreign` FOREIGN KEY (`t_shirt_id`) REFERENCES `t_shirts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы uzbolkab_cottonworld.t_shirt_image: ~76 rows (приблизительно)
/*!40000 ALTER TABLE `t_shirt_image` DISABLE KEYS */;
INSERT INTO `t_shirt_image` (`id`, `t_shirt_id`, `image_id`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, '2019-04-22 10:01:01', '2019-04-22 10:01:01'),
	(2, 2, 2, '2019-04-22 10:01:01', '2019-04-22 10:01:01'),
	(3, 3, 3, '2019-04-22 10:01:01', '2019-04-22 10:01:01'),
	(4, 4, 4, '2019-04-22 10:01:01', '2019-04-22 10:01:01'),
	(5, 5, 5, '2019-04-22 10:01:01', '2019-04-22 10:01:01'),
	(8, 1, 8, '2019-04-29 12:46:21', '2019-04-29 12:46:21'),
	(9, 1, 9, '2019-04-29 12:46:21', '2019-04-29 12:46:21'),
	(10, 1, 10, '2019-04-29 12:46:21', '2019-04-29 12:46:21'),
	(11, 1, 11, '2019-04-29 12:46:21', '2019-04-29 12:46:21'),
	(14, 6, 35, '2019-04-30 09:46:40', '2019-04-30 09:46:40'),
	(15, 6, 34, '2019-04-30 09:46:40', '2019-04-30 09:46:40'),
	(16, 6, 33, '2019-04-30 09:46:40', '2019-04-30 09:46:40'),
	(17, 6, 32, '2019-04-30 09:46:40', '2019-04-30 09:46:40'),
	(18, 6, 31, '2019-04-30 09:46:40', '2019-04-30 09:46:40'),
	(19, 6, 30, '2019-04-30 09:46:40', '2019-04-30 09:46:40'),
	(20, 7, 20, '2019-04-30 09:46:40', '2019-04-30 09:46:40'),
	(21, 7, 21, '2019-04-30 09:46:40', '2019-04-30 09:46:40'),
	(22, 7, 22, '2019-04-30 09:46:40', '2019-04-30 09:46:40'),
	(23, 7, 23, '2019-04-30 09:46:40', '2019-04-30 09:46:40'),
	(24, 7, 24, '2019-04-30 09:46:40', '2019-04-30 09:46:40'),
	(25, 7, 25, '2019-04-30 09:46:40', '2019-04-30 09:46:40'),
	(26, 7, 26, '2019-04-30 09:46:40', '2019-04-30 09:46:40'),
	(27, 7, 27, '2019-04-30 09:46:40', '2019-04-30 09:46:40'),
	(28, 8, 28, '2019-04-30 13:04:54', '2019-04-30 13:04:54'),
	(29, 8, 29, '2019-04-30 13:04:54', '2019-04-30 13:04:54'),
	(30, 9, 30, '2019-04-30 13:04:54', '2019-04-30 13:04:54'),
	(31, 9, 31, '2019-04-30 13:04:54', '2019-04-30 13:04:54'),
	(32, 9, 32, '2019-04-30 13:04:54', '2019-04-30 13:04:54'),
	(33, 9, 33, '2019-04-30 13:04:54', '2019-04-30 13:04:54'),
	(34, 9, 34, '2019-04-30 13:04:54', '2019-04-30 13:04:54'),
	(35, 9, 35, '2019-04-30 13:04:54', '2019-04-30 13:04:54'),
	(36, 3, 36, '2019-05-06 10:53:28', '2019-05-06 10:53:28'),
	(37, 3, 37, '2019-05-06 10:53:28', '2019-05-06 10:53:28'),
	(38, 3, 38, '2019-05-06 10:53:28', '2019-05-06 10:53:28'),
	(39, 3, 39, '2019-05-06 10:53:28', '2019-05-06 10:53:28'),
	(40, 3, 40, '2019-05-06 10:53:28', '2019-05-06 10:53:28'),
	(41, 3, 41, '2019-05-06 10:53:28', '2019-05-06 10:53:28'),
	(42, 5, 42, '2019-05-06 10:57:08', '2019-05-06 10:57:08'),
	(43, 5, 43, '2019-05-06 10:57:08', '2019-05-06 10:57:08'),
	(44, 2, 44, '2019-05-06 11:01:57', '2019-05-06 11:01:57'),
	(45, 2, 45, '2019-05-06 11:01:57', '2019-05-06 11:01:57'),
	(46, 2, 46, '2019-05-06 11:01:57', '2019-05-06 11:01:57'),
	(47, 2, 47, '2019-05-06 11:01:57', '2019-05-06 11:01:57'),
	(48, 2, 48, '2019-05-06 11:01:57', '2019-05-06 11:01:57'),
	(49, 2, 49, '2019-05-06 11:01:57', '2019-05-06 11:01:57'),
	(50, 2, 50, '2019-05-06 11:01:57', '2019-05-06 11:01:57'),
	(51, 2, 51, '2019-05-06 11:01:57', '2019-05-06 11:01:57'),
	(52, 2, 52, '2019-05-06 11:01:57', '2019-05-06 11:01:57'),
	(53, 2, 53, '2019-05-06 11:01:57', '2019-05-06 11:01:57'),
	(54, 2, 54, '2019-05-06 11:01:57', '2019-05-06 11:01:57'),
	(55, 2, 55, '2019-05-06 11:01:57', '2019-05-06 11:01:57'),
	(56, 2, 56, '2019-05-06 11:01:57', '2019-05-06 11:01:57'),
	(57, 2, 57, '2019-05-06 11:01:57', '2019-05-06 11:01:57'),
	(58, 2, 58, '2019-05-06 11:01:57', '2019-05-06 11:01:57'),
	(59, 2, 59, '2019-05-06 11:01:57', '2019-05-06 11:01:57'),
	(60, 2, 60, '2019-05-06 11:01:57', '2019-05-06 11:01:57'),
	(61, 2, 61, '2019-05-06 11:01:57', '2019-05-06 11:01:57'),
	(62, 4, 62, '2019-05-06 11:05:14', '2019-05-06 11:05:14'),
	(63, 4, 63, '2019-05-06 11:05:14', '2019-05-06 11:05:14'),
	(64, 4, 64, '2019-05-06 11:05:14', '2019-05-06 11:05:14'),
	(65, 4, 65, '2019-05-06 11:05:14', '2019-05-06 11:05:14'),
	(66, 4, 66, '2019-05-06 11:05:14', '2019-05-06 11:05:14'),
	(67, 4, 67, '2019-05-06 11:05:14', '2019-05-06 11:05:14'),
	(68, 4, 68, '2019-05-06 11:05:14', '2019-05-06 11:05:14'),
	(69, 4, 69, '2019-05-06 11:05:14', '2019-05-06 11:05:14'),
	(70, 4, 70, '2019-05-06 11:05:14', '2019-05-06 11:05:14'),
	(71, 4, 71, '2019-05-06 11:05:14', '2019-05-06 11:05:14'),
	(72, 4, 72, '2019-05-06 11:05:14', '2019-05-06 11:05:14'),
	(73, 4, 73, '2019-05-06 11:05:14', '2019-05-06 11:05:14'),
	(74, 4, 74, '2019-05-06 11:05:14', '2019-05-06 11:05:14'),
	(75, 10, 75, '2019-05-15 00:39:02', '2019-05-15 00:39:02'),
	(76, 10, 76, '2019-05-15 00:39:09', '2019-05-15 00:39:09'),
	(77, 10, 77, '2019-05-15 00:39:15', '2019-05-15 00:39:15'),
	(78, 10, 78, '2019-05-15 00:39:24', '2019-05-15 00:39:24'),
	(79, 10, 79, '2019-05-15 00:39:30', '2019-05-15 00:39:30'),
	(80, 1, 80, '2019-05-20 13:00:41', '2019-05-20 13:00:42');
/*!40000 ALTER TABLE `t_shirt_image` ENABLE KEYS */;

-- Дамп структуры для таблица uzbolkab_cottonworld.t_shirt_sleeve
CREATE TABLE IF NOT EXISTS `t_shirt_sleeve` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы uzbolkab_cottonworld.t_shirt_sleeve: ~2 rows (приблизительно)
/*!40000 ALTER TABLE `t_shirt_sleeve` DISABLE KEYS */;
INSERT INTO `t_shirt_sleeve` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'короткий рукав', NULL, NULL),
	(2, 'длинный рукав', NULL, NULL);
/*!40000 ALTER TABLE `t_shirt_sleeve` ENABLE KEYS */;

-- Дамп структуры для таблица uzbolkab_cottonworld.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы uzbolkab_cottonworld.users: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
