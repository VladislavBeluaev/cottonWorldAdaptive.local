-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               5.7.19 - MySQL Community Server (GPL)
-- Операционная система:         Win32
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

-- Дамп данных таблицы uzbolkab_cottonworld.colors: ~16 rows (приблизительно)
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
	(17, 'bluet', 'василек', '2019-05-21 22:23:57', '2019-05-21 22:23:58'),
	(18, 'grey', 'серый', '2019-05-21 22:24:01', '2019-05-21 22:24:02');
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
  `color_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы uzbolkab_cottonworld.images: ~77 rows (приблизительно)
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
	(30, 'images/women/t_shirts/polo_shirt_short_sleeve/1556569001.jpg', 'polo_shirt_short_sleeve', 0, '2019-04-30 13:03:02', '2019-04-30 13:03:02'),
	(31, 'images/women/t_shirts/polo_shirt_short_sleeve/1556569013.jpg', 'polo_shirt_short_sleeve', 0, '2019-04-30 13:03:02', '2019-04-30 13:03:02'),
	(32, 'images/women/t_shirts/polo_shirt_short_sleeve/1556569023.jpg', 'polo_shirt_short_sleeve', 0, '2019-04-30 13:03:02', '2019-04-30 13:03:02'),
	(33, 'images/women/t_shirts/polo_shirt_short_sleeve/1556569038.jpg', 'polo_shirt_short_sleeve', 0, '2019-04-30 13:03:02', '2019-04-30 13:03:02'),
	(34, 'images/women/t_shirts/polo_shirt_short_sleeve/1556569048.jpg', 'polo_shirt_short_sleeve', 0, '2019-04-30 13:03:02', '2019-04-30 13:03:02'),
	(35, 'images/women/t_shirts/polo_shirt_short_sleeve/1556569058.jpg', 'polo_shirt_short_sleeve', 0, '2019-04-30 13:03:02', '2019-04-30 13:03:02'),
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
	(75, 'images/children/children_t-shirt/1557159204.jpg', 'children_tshirt', 0, '2019-05-15 00:35:00', '2019-05-15 00:35:00'),
	(76, 'images/children/children_t-shirt/1557159237.jpg', 'children_tshirt', 0, '2019-05-15 00:36:57', '2019-05-15 00:36:57'),
	(77, 'images/children/children_t-shirt/1557159251.jpg', 'children_tshirt', 0, '2019-05-15 00:37:22', '2019-05-15 00:37:22'),
	(78, 'images/children/children_t-shirt/1557159266.jpg', 'children_tshirt', 0, '2019-05-15 00:37:24', '2019-05-15 00:37:24'),
	(79, 'images/children/children_t-shirt/1557159278.jpg', 'children_tshirt', 0, '2019-05-15 00:37:27', '2019-05-15 00:37:27'),
	(80, 'images/men/t_shirts/promo-futbolka_econom/1556530722.jpg', 'promo-futbolka_econom', 3, '2019-05-21 22:22:13', '2019-05-21 22:22:13');
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы uzbolkab_cottonworld.migrations: ~21 rows (приблизительно)
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
	(22, '2019_04_30_130732_add_columns_material_and_composition_to_t_shirt_table', 6);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

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
	(1, 'Футболка мужская', 'promo-futbolka_econom', 'Горловина обработана рибаной с эластаном, закрытый «росток», усиление плеч, двойная отстрочка по проймам и срезам рукавов. Футболки с длинным рукавом, с коротким рукавом, прямые и приталенные модели, классических и ярких цветов - продукция может быть использована для проведения промо-акций, для экипировки спортивных клубов и создания корпоративной одежды.', 'Кулирная гладь', '100% хб', '160 гр/м²', '2,08', 1, 1, 1, 1, '2019-04-22 10:00:04', '2019-04-22 10:00:04'),
	(2, 'Промо футболки «Классик»', 'promo-futbolka_classic', 'Футболка мужская прямого покроя, рукав короткий втачной. По линии горловины втачен ворот из ластичного полотна с 5% добавлением лайкры. Росток и плечевые швы обтачены бейкой из основного полотна, в край проложена отделочная строчка. Низ изделия и рукава подогнуты и подшиты плоским швом.', 'Кулирная гладь', '100% х/б. Кольцепрядильная кардная пряжа Ne 24/1 (Nm 40/1).', '175-180 г/м2', '2,32', 1, 1, 2, 1, '2019-04-22 10:00:04', '2019-04-22 10:00:04'),
	(3, 'Футболка с длинным рукавом', 'futbolka-longSleeve', 'Трикотажная футболка мужская прямого покроя, рукав длинный втачной. Боковые швы стачены на четырёхниточном оверлоке. Горловина обработана бейкой из основного полотна на трёхниточной плоскошовной машине. Низ изделия и рукава подогнуты и подшиты плоским швом на трехниточной плоскошовной машине.', 'Трикотажное двухфонтурное полотно типа "Интерлок"', '100% х/б кольцепрядильная кардная пряжа №е24/1 на кругловязальной машине итальянской марки "Orizio" 32 дюйм, 26 класс.', '210-220 г/м2', '4,05', 1, 1, 3, 2, '2019-04-22 10:00:04', '2019-04-22 10:00:04'),
	(4, 'Поло с коротким рукавом', 'polo-shortSleeve', 'Трикотажная рубашка «Поло» прямого покроя, с коротким втачным рукавом, отложным в резинку воротником и планкой с застежкой из трех пуговиц. Росток и плечевые швы обтачены бейкой из основного полотна. Низ изделия и рукава подогнуты и подшиты плоским швом.', 'Пике', '100% х/б. Кольцепрядильная кардная пряжа Nе 30/1 (Nm51/1).', '180-185 г/м2', '4,27', 1, 2, 2, 1, '2019-04-22 10:00:04', '2019-04-22 10:00:04'),
	(5, 'Поло с длинным рукавом', 'polo-longSleeve', 'Трикотажная рубашка «Поло» прямого покроя, с длинным рукавом, отложным в резинку воротником и планкой с застежкой из трех пуговиц. Росток и плечевые швы обтачены бейкой из основного полотна. Низ изделия и рукава подогнуты и подшиты плоским швом.', 'Пике', '100% х/б. Кольцепрядильная кардная пряжа Nе 30/1 (Nm51/1).', '180-185 г/м2', '5,05', 1, 2, 2, 2, '2019-04-22 10:00:04', '2019-04-22 10:00:04'),
	(6, 'Футболка женская', 'promo-futbolka_cotton_short_sleeve', 'Горловина обработана бейкой, двойная отстрочка по низу изделия и срезам рукавов Для изготовления женских футболок мы используем только высококачественное полотно состоящее из 100% хлопка и переплетенное кулирной гладью, что делает наши футболки приятными на ощупь и долговечными в носке. Лекала женских футболок фабрики "Дака-Текс" рассчитаны нашими конструкторами так, что бы футболка отлично сидела на любой фигуре.', 'Кулирная гладь', '100% х/б', '160 г/м2', '2,22', 2, 1, 1, 1, '2019-04-30 09:26:12', '2019-04-30 09:26:12'),
	(7, 'Промо футболка с лайкрой (короткий рукав)', 'promo-futbolka_lycra_short_sleeve', 'Трикотажная футболка женская приталенного покроя, рукав короткий втачной. Боковые швы стачены на четырёхниточном оверлоке. По линии горловины четырёхниточным оверлоком втачен ворот из ластичного полотна с 5% добавлением лайкры. Росток обтачен бейкой из основного полотна, в край проложена отделочная строчка. Низ изделия и рукава подогнуты и подшиты плоским швом на трехниточной плоскошовной машине.', 'Кулирная гладь', '96% х/б кольцепрядильной кардной пряжи №е24/1 с добавлением 4% лайкры (Spandex) на кругловязальной машине итальянской марки "Orizio" 32 дюйм, 28 класс.', '185-190 г/м2', '2,65', 2, 1, 2, 1, '2019-04-30 09:26:12', '2019-04-30 09:26:12'),
	(8, 'Промо футболка с лайкрой (длинный рукав)', 'promo-futbolka_lycra_long_sleeve', 'Трикотажная футболка женская приталенного покроя, рукав длинный втачной. Боковые швы стачены на четырёхниточном оверлоке. По линии горловины четырёхниточным оверлоком втачен ворот из ластичного полотна с 5% добавлением лайкры. Росток обтачен бейкой из основного полотна, в край проложена отделочная строчка. Низ изделия и рукава подогнуты и подшиты плоским швом на трехниточной плоскошовной машине.', 'Кулирная гладь', '96% х/б кольцепрядильной кардной пряжи №е24/1 с добавлением 4% лайкры(Spandex) на кругловязальной машине итальянской марки "Orizio" 32 дюйм, 28 класс.', '185-190 г/м2', '3,15', 2, 1, 2, 1, '2019-04-30 09:26:12', '2019-04-30 09:26:12'),
	(9, 'Рубашка поло женская с коротким рукавом', 'polo_shirt_short_sleeve', 'Трикотажная Рубашка «Поло» женская приталенного покроя, с коротким втачным рукавом, отложным в резинку воротником и планкой с застежкой из двух или трех пуговиц в тон полотна. Росток обтачен бейкой из основного полотна. Низ изделия и рукава подогнуты и подшиты плоским швом. Боковые швы стачены на четырёхниточном оверлоке. Планка отстрочена на одноигольной машине челночного стежка. Ворот стачен на четырёхниточном оверлоке. Низ изделия и рукавов подогнут и прошит на трёхигольной плоскошовной машине. Петли пробиты на автоматической петельной машине челночного стежка.', 'Пике', '100% х/б. Кольцепрядильной кардной пряжи №е 30/1 на кругловязальных машинах итальянской марки "Orizio" 32 дюйм, 24 класс.', '180-185 г/м2', '4,22', 2, 2, 2, 1, '2019-04-30 09:26:12', '2019-04-30 09:26:12'),
	(10, 'Детская футболка', 'children_t-shirt', 'Горловина обработана рибаной с эластаном, закрытый «росток», усиление плеч, двойная отстрочка по проймам и срезам рукавов.', 'Кулирная гладь', '100% х/б', '160 г/м2', '2,08', 3, 1, 2, 1, '2019-05-15 00:31:58', '2019-05-15 00:31:58');
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
  `is_enable` tinyint(4) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `t_shirt_color_t_shirt_id_foreign` (`t_shirt_id`),
  KEY `t_shirt_color_color_id_foreign` (`color_id`),
  CONSTRAINT `t_shirt_color_color_id_foreign` FOREIGN KEY (`color_id`) REFERENCES `colors` (`id`) ON DELETE CASCADE,
  CONSTRAINT `t_shirt_color_t_shirt_id_foreign` FOREIGN KEY (`t_shirt_id`) REFERENCES `t_shirts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы uzbolkab_cottonworld.t_shirt_color: ~80 rows (приблизительно)
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
	(51, 6, 1, 0, '2019-04-30 09:48:49', '2019-04-30 09:48:49'),
	(52, 6, 2, 0, '2019-04-30 09:48:49', '2019-04-30 09:48:49'),
	(53, 6, 8, 0, '2019-04-30 09:48:49', '2019-04-30 09:48:49'),
	(54, 6, 12, 0, '2019-04-30 09:48:49', '2019-04-30 09:48:49'),
	(55, 6, 13, 0, '2019-04-30 09:48:49', '2019-04-30 09:48:49'),
	(56, 6, 14, 0, '2019-04-30 09:48:49', '2019-04-30 09:48:49'),
	(57, 6, 15, 0, '2019-04-30 09:48:49', '2019-04-30 09:48:49'),
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
	(73, 9, 15, 0, '2019-04-30 09:48:49', '2019-04-30 09:48:49'),
	(74, 10, 1, 0, '2019-05-15 00:49:13', '2019-05-15 00:49:13'),
	(75, 10, 2, 0, '2019-05-15 00:49:37', '2019-05-15 00:49:37'),
	(76, 10, 8, 0, '2019-05-15 00:49:44', '2019-05-15 00:49:44'),
	(77, 10, 12, 0, '2019-05-15 00:49:51', '2019-05-15 00:49:51'),
	(78, 10, 13, 0, '2019-05-15 00:49:58', '2019-05-15 00:49:58'),
	(79, 10, 14, 0, '2019-05-15 00:50:05', '2019-05-15 00:50:05'),
	(80, 10, 15, 0, '2019-05-15 00:50:08', '2019-05-15 00:50:08'),
	(81, 1, 3, 1, '2019-05-21 22:29:02', '2019-05-21 22:29:03'),
	(82, 1, 17, 1, '2019-05-21 22:29:04', '2019-05-21 22:29:05'),
	(83, 1, 18, 1, '2019-05-21 22:28:58', '2019-05-21 22:28:59');
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
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы uzbolkab_cottonworld.t_shirt_image: ~77 rows (приблизительно)
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
	(12, 6, 12, '2019-04-30 09:46:40', '2019-04-30 09:46:40'),
	(13, 6, 13, '2019-04-30 09:46:40', '2019-04-30 09:46:40'),
	(14, 6, 14, '2019-04-30 09:46:40', '2019-04-30 09:46:40'),
	(15, 6, 15, '2019-04-30 09:46:40', '2019-04-30 09:46:40'),
	(16, 6, 16, '2019-04-30 09:46:40', '2019-04-30 09:46:40'),
	(17, 6, 17, '2019-04-30 09:46:40', '2019-04-30 09:46:40'),
	(18, 6, 18, '2019-04-30 09:46:40', '2019-04-30 09:46:40'),
	(19, 6, 19, '2019-04-30 09:46:40', '2019-04-30 09:46:40'),
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
	(86, 1, 80, NULL, NULL);
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
