# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.27)
# Database: r5go
# Generation Time: 2020-04-29 00:31:53 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`),
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`)
VALUES
	(1,NULL,2,'Perfumaria','perfumaria','2020-04-28 22:33:45','2020-04-29 00:21:50'),
	(2,NULL,1,'Higiene','higiene','2020-04-28 22:33:45','2020-04-29 00:21:32');

/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table data_rows
# ------------------------------------------------------------

DROP TABLE IF EXISTS `data_rows`;

CREATE TABLE `data_rows` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_type_id` int(10) unsigned NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`),
  CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `data_rows` WRITE;
/*!40000 ALTER TABLE `data_rows` DISABLE KEYS */;

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`)
VALUES
	(1,1,'id','number','ID',1,0,0,0,0,0,NULL,1),
	(2,1,'name','text','Name',1,1,1,1,1,1,NULL,2),
	(3,1,'email','text','Email',1,1,1,1,1,1,NULL,3),
	(4,1,'password','password','Password',1,0,0,1,1,0,NULL,4),
	(5,1,'remember_token','text','Remember Token',0,0,0,0,0,0,NULL,5),
	(6,1,'created_at','timestamp','Created At',0,1,1,0,0,0,NULL,6),
	(7,1,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,7),
	(8,1,'avatar','image','Avatar',0,1,1,1,1,1,NULL,8),
	(9,1,'user_belongsto_role_relationship','relationship','Role',0,1,1,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}',10),
	(10,1,'user_belongstomany_role_relationship','relationship','Roles',0,1,1,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}',11),
	(11,1,'settings','hidden','Settings',0,0,0,0,0,0,NULL,12),
	(12,2,'id','number','ID',1,0,0,0,0,0,NULL,1),
	(13,2,'name','text','Name',1,1,1,1,1,1,NULL,2),
	(14,2,'created_at','timestamp','Created At',0,0,0,0,0,0,NULL,3),
	(15,2,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,4),
	(16,3,'id','number','ID',1,0,0,0,0,0,NULL,1),
	(17,3,'name','text','Name',1,1,1,1,1,1,NULL,2),
	(18,3,'created_at','timestamp','Created At',0,0,0,0,0,0,NULL,3),
	(19,3,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,4),
	(20,3,'display_name','text','Display Name',1,1,1,1,1,1,NULL,5),
	(21,1,'role_id','text','Role',1,1,1,1,1,1,NULL,9),
	(22,4,'id','number','ID',1,0,0,0,0,0,NULL,1),
	(23,4,'parent_id','select_dropdown','Parent',0,0,1,1,1,1,'{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}',2),
	(24,4,'order','text','Order',1,1,1,1,1,1,'{\"default\":1}',3),
	(25,4,'name','text','Name',1,1,1,1,1,1,NULL,4),
	(26,4,'slug','text','Slug',1,1,1,1,1,1,'{\"slugify\":{\"origin\":\"name\"}}',5),
	(27,4,'created_at','timestamp','Created At',0,0,1,0,0,0,NULL,6),
	(28,4,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,7),
	(44,11,'id','number','Id',1,0,0,0,0,0,'{}',1),
	(45,11,'author_id','number','Author Id',1,0,1,1,1,1,'{}',2),
	(46,11,'category_id','number','Category Id',0,1,1,1,1,1,'{}',3),
	(47,11,'title','text','Title',1,1,1,1,1,1,'{}',4),
	(48,11,'seo_title','text','Seo Title',0,0,1,1,1,1,'{}',5),
	(49,11,'excerpt','text_area','Excerpt',0,0,1,1,1,1,'{}',6),
	(50,11,'body','rich_text_box','Body',1,0,1,1,1,1,'{}',7),
	(51,11,'image','image','Image',0,1,1,1,1,1,'{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}',8),
	(52,11,'slug','text','Slug',1,0,1,1,1,1,'{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:products,slug\"}}',9),
	(53,11,'meta_description','text','Meta Description',0,0,1,1,1,1,'{}',10),
	(54,11,'meta_keywords','text','Meta Keywords',0,0,1,1,1,1,'{}',11),
	(55,11,'status','select_dropdown','Status',1,1,1,1,1,1,'{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}',12),
	(56,11,'featured','checkbox','Featured',1,0,1,1,1,1,'{}',13),
	(57,11,'created_at','timestamp','Created At',0,0,1,1,0,1,'{}',14),
	(58,11,'updated_at','timestamp','Updated At',0,0,1,1,0,1,'{}',15);

/*!40000 ALTER TABLE `data_rows` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table data_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `data_types`;

CREATE TABLE `data_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `data_types` WRITE;
/*!40000 ALTER TABLE `data_types` DISABLE KEYS */;

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`)
VALUES
	(1,'users','users','User','Users','voyager-person','TCG\\Voyager\\Models\\User','TCG\\Voyager\\Policies\\UserPolicy','TCG\\Voyager\\Http\\Controllers\\VoyagerUserController','',1,0,NULL,'2020-04-28 22:33:44','2020-04-28 22:33:44'),
	(2,'menus','menus','Menu','Menus','voyager-list','TCG\\Voyager\\Models\\Menu',NULL,'','',1,0,NULL,'2020-04-28 22:33:44','2020-04-28 22:33:44'),
	(3,'roles','roles','Role','Roles','voyager-lock','TCG\\Voyager\\Models\\Role',NULL,'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController','',1,0,NULL,'2020-04-28 22:33:44','2020-04-28 22:33:44'),
	(4,'categories','categories','Category','Categories','voyager-categories','TCG\\Voyager\\Models\\Category',NULL,'','',1,0,NULL,'2020-04-28 22:33:45','2020-04-28 22:33:45'),
	(11,'products','products','Product','Products','voyager-tag','App\\Product',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2020-04-28 23:56:33','2020-04-29 00:19:45');

/*!40000 ALTER TABLE `data_types` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table failed_jobs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table menu_items
# ------------------------------------------------------------

DROP TABLE IF EXISTS `menu_items`;

CREATE TABLE `menu_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`),
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `menu_items` WRITE;
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`)
VALUES
	(1,1,'Dashboard','','_self','voyager-boat',NULL,NULL,1,'2020-04-28 22:33:44','2020-04-28 22:33:44','voyager.dashboard',NULL),
	(2,1,'Media','','_self','voyager-images',NULL,NULL,5,'2020-04-28 22:33:44','2020-04-28 22:33:44','voyager.media.index',NULL),
	(3,1,'Users','','_self','voyager-person',NULL,NULL,3,'2020-04-28 22:33:44','2020-04-28 22:33:44','voyager.users.index',NULL),
	(4,1,'Roles','','_self','voyager-lock',NULL,NULL,2,'2020-04-28 22:33:45','2020-04-28 22:33:45','voyager.roles.index',NULL),
	(5,1,'Tools','','_self','voyager-tools',NULL,NULL,9,'2020-04-28 22:33:45','2020-04-28 22:33:45',NULL,NULL),
	(6,1,'Menu Builder','','_self','voyager-list',NULL,5,10,'2020-04-28 22:33:45','2020-04-28 22:33:45','voyager.menus.index',NULL),
	(7,1,'Database','','_self','voyager-data',NULL,5,11,'2020-04-28 22:33:45','2020-04-28 22:33:45','voyager.database.index',NULL),
	(8,1,'Compass','','_self','voyager-compass',NULL,5,12,'2020-04-28 22:33:45','2020-04-28 22:33:45','voyager.compass.index',NULL),
	(9,1,'BREAD','','_self','voyager-bread',NULL,5,13,'2020-04-28 22:33:45','2020-04-28 22:33:45','voyager.bread.index',NULL),
	(11,1,'Categories','','_self','voyager-categories',NULL,NULL,8,'2020-04-28 22:33:45','2020-04-28 22:33:45','voyager.categories.index',NULL),
	(12,1,'Products','','_self','voyager-tag','#000000',NULL,6,'2020-04-28 22:33:46','2020-04-29 00:18:14','voyager.products.index','null'),
	(14,1,'Hooks','','_self','voyager-hook',NULL,5,13,'2020-04-28 22:33:46','2020-04-28 22:33:46','voyager.hooks',NULL),
	(15,1,'Settings','','_self','voyager-settings','#000000',NULL,10,'2020-04-28 23:27:34','2020-04-28 23:27:34','voyager.settings.index',NULL);

/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table menus
# ------------------------------------------------------------

DROP TABLE IF EXISTS `menus`;

CREATE TABLE `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`)
VALUES
	(1,'admin','2020-04-28 22:33:44','2020-04-28 22:33:44');

/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(1,'2014_10_12_000000_create_users_table',1),
	(2,'2016_01_01_000000_add_voyager_user_fields',1),
	(3,'2016_01_01_000000_create_data_types_table',1),
	(4,'2016_05_19_173453_create_menu_table',1),
	(5,'2016_10_21_190000_create_roles_table',1),
	(6,'2016_10_21_190000_create_settings_table',1),
	(7,'2016_11_30_135954_create_permission_table',1),
	(8,'2016_11_30_141208_create_permission_role_table',1),
	(9,'2016_12_26_201236_data_types__add__server_side',1),
	(10,'2017_01_13_000000_add_route_to_menu_items_table',1),
	(11,'2017_01_14_005015_create_translations_table',1),
	(12,'2017_01_15_000000_make_table_name_nullable_in_permissions_table',1),
	(13,'2017_03_06_000000_add_controller_to_data_types_table',1),
	(14,'2017_04_21_000000_add_order_to_data_rows_table',1),
	(15,'2017_07_05_210000_add_policyname_to_data_types_table',1),
	(16,'2017_08_05_000000_add_group_to_settings_table',1),
	(17,'2017_11_26_013050_add_user_role_relationship',1),
	(18,'2017_11_26_015000_create_user_roles_table',1),
	(19,'2018_03_11_000000_add_user_settings',1),
	(20,'2018_03_14_000000_add_details_to_data_types_table',1),
	(21,'2018_03_16_000000_make_settings_value_nullable',1),
	(22,'2019_08_19_000000_create_failed_jobs_table',1),
	(23,'2016_01_01_000000_create_pages_table',2),
	(24,'2016_01_01_000000_create_posts_table',2),
	(25,'2016_02_15_204651_create_categories_table',2),
	(26,'2017_04_11_000000_alter_post_nullable_fields_table',2),
	(27,'2020_04_28_233232_change_posts_table_name',3);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table permission_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `permission_role`;

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `permission_role` WRITE;
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;

INSERT INTO `permission_role` (`permission_id`, `role_id`)
VALUES
	(1,1),
	(2,1),
	(3,1),
	(4,1),
	(5,1),
	(6,1),
	(7,1),
	(8,1),
	(9,1),
	(10,1),
	(11,1),
	(12,1),
	(13,1),
	(14,1),
	(15,1),
	(16,1),
	(17,1),
	(18,1),
	(19,1),
	(20,1),
	(21,1),
	(22,1),
	(23,1),
	(24,1),
	(25,1),
	(26,1),
	(27,1),
	(28,1),
	(29,1),
	(30,1),
	(47,1),
	(48,1),
	(49,1),
	(50,1),
	(51,1);

/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `permissions`;

CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`)
VALUES
	(1,'browse_admin',NULL,'2020-04-28 22:33:45','2020-04-28 22:33:45'),
	(2,'browse_bread',NULL,'2020-04-28 22:33:45','2020-04-28 22:33:45'),
	(3,'browse_database',NULL,'2020-04-28 22:33:45','2020-04-28 22:33:45'),
	(4,'browse_media',NULL,'2020-04-28 22:33:45','2020-04-28 22:33:45'),
	(5,'browse_compass',NULL,'2020-04-28 22:33:45','2020-04-28 22:33:45'),
	(6,'browse_menus','menus','2020-04-28 22:33:45','2020-04-28 22:33:45'),
	(7,'read_menus','menus','2020-04-28 22:33:45','2020-04-28 22:33:45'),
	(8,'edit_menus','menus','2020-04-28 22:33:45','2020-04-28 22:33:45'),
	(9,'add_menus','menus','2020-04-28 22:33:45','2020-04-28 22:33:45'),
	(10,'delete_menus','menus','2020-04-28 22:33:45','2020-04-28 22:33:45'),
	(11,'browse_roles','roles','2020-04-28 22:33:45','2020-04-28 22:33:45'),
	(12,'read_roles','roles','2020-04-28 22:33:45','2020-04-28 22:33:45'),
	(13,'edit_roles','roles','2020-04-28 22:33:45','2020-04-28 22:33:45'),
	(14,'add_roles','roles','2020-04-28 22:33:45','2020-04-28 22:33:45'),
	(15,'delete_roles','roles','2020-04-28 22:33:45','2020-04-28 22:33:45'),
	(16,'browse_users','users','2020-04-28 22:33:45','2020-04-28 22:33:45'),
	(17,'read_users','users','2020-04-28 22:33:45','2020-04-28 22:33:45'),
	(18,'edit_users','users','2020-04-28 22:33:45','2020-04-28 22:33:45'),
	(19,'add_users','users','2020-04-28 22:33:45','2020-04-28 22:33:45'),
	(20,'delete_users','users','2020-04-28 22:33:45','2020-04-28 22:33:45'),
	(21,'browse_settings','settings','2020-04-28 22:33:45','2020-04-28 22:33:45'),
	(22,'read_settings','settings','2020-04-28 22:33:45','2020-04-28 22:33:45'),
	(23,'edit_settings','settings','2020-04-28 22:33:45','2020-04-28 22:33:45'),
	(24,'add_settings','settings','2020-04-28 22:33:45','2020-04-28 22:33:45'),
	(25,'delete_settings','settings','2020-04-28 22:33:45','2020-04-28 22:33:45'),
	(26,'browse_categories','categories','2020-04-28 22:33:45','2020-04-28 22:33:45'),
	(27,'read_categories','categories','2020-04-28 22:33:45','2020-04-28 22:33:45'),
	(28,'edit_categories','categories','2020-04-28 22:33:45','2020-04-28 22:33:45'),
	(29,'add_categories','categories','2020-04-28 22:33:45','2020-04-28 22:33:45'),
	(30,'delete_categories','categories','2020-04-28 22:33:45','2020-04-28 22:33:45'),
	(31,'browse_posts','posts','2020-04-28 22:33:46','2020-04-28 22:33:46'),
	(32,'read_posts','posts','2020-04-28 22:33:46','2020-04-28 22:33:46'),
	(33,'edit_posts','posts','2020-04-28 22:33:46','2020-04-28 22:33:46'),
	(34,'add_posts','posts','2020-04-28 22:33:46','2020-04-28 22:33:46'),
	(35,'delete_posts','posts','2020-04-28 22:33:46','2020-04-28 22:33:46'),
	(41,'browse_hooks',NULL,'2020-04-28 22:33:46','2020-04-28 22:33:46'),
	(47,'browse_products','products','2020-04-28 23:56:33','2020-04-28 23:56:33'),
	(48,'read_products','products','2020-04-28 23:56:33','2020-04-28 23:56:33'),
	(49,'edit_products','products','2020-04-28 23:56:33','2020-04-28 23:56:33'),
	(50,'add_products','products','2020-04-28 23:56:33','2020-04-28 23:56:33'),
	(51,'delete_products','products','2020-04-28 23:56:33','2020-04-28 23:56:33');

/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table products
# ------------------------------------------------------------

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;

INSERT INTO `products` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`)
VALUES
	(6,1,1,'Kit com 2 Desodorantes Aerosol Dove Original 100g','Combo desodorante','Resuminho maroto...','<p>Kit com 2 Desodorantes Aerosol Dove Original 100g.</p>','products/April2020/fKYoHOfTh8Oyhnm5c999.jpg','kit-com-2-desodorantes-aerosol-dove-original-100g','Descrição do produto','teste, teste, teste','PUBLISHED',0,'2020-04-29 00:25:34','2020-04-29 00:25:34');

/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`)
VALUES
	(1,'admin','Administrator','2020-04-28 22:33:45','2020-04-28 22:33:45'),
	(2,'user','Normal User','2020-04-28 22:33:45','2020-04-28 22:33:45');

/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `settings`;

CREATE TABLE `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`)
VALUES
	(1,'site.title','Site Title','R5go','','text',1,'Site'),
	(2,'site.description','Site Description','B2W Solution','','text',2,'Site'),
	(3,'site.logo','Site Logo','settings/April2020/6JuiitV4Clm2NnfMnds5.png','','image',3,'Site'),
	(5,'admin.bg_image','Admin Background Image','settings/April2020/I2Pii86UzCYJsiJ3WqWC.jpg','','image',5,'Admin'),
	(6,'admin.title','Admin Title','R5go','','text',1,'Admin'),
	(7,'admin.description','Admin Description','B2W Solution Panel','','text',2,'Admin'),
	(8,'admin.loader','Admin Loader','','','image',3,'Admin'),
	(9,'admin.icon_image','Admin Icon Image','settings/April2020/Hnkx0I1vdFDZdhmF0pA7.png','','image',4,'Admin'),
	(10,'admin.google_analytics_client_id','Google Analytics Client ID (used for admin dashboard)',NULL,'','text',1,'Admin');

/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table translations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `translations`;

CREATE TABLE `translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `translations` WRITE;
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`)
VALUES
	(1,'data_types','display_name_singular',5,'pt','Post','2020-04-28 22:33:46','2020-04-28 22:33:46'),
	(2,'data_types','display_name_singular',6,'pt','Página','2020-04-28 22:33:46','2020-04-28 22:33:46'),
	(3,'data_types','display_name_singular',1,'pt','Utilizador','2020-04-28 22:33:46','2020-04-28 22:33:46'),
	(4,'data_types','display_name_singular',4,'pt','Categoria','2020-04-28 22:33:46','2020-04-28 22:33:46'),
	(5,'data_types','display_name_singular',2,'pt','Menu','2020-04-28 22:33:46','2020-04-28 22:33:46'),
	(6,'data_types','display_name_singular',3,'pt','Função','2020-04-28 22:33:46','2020-04-28 22:33:46'),
	(7,'data_types','display_name_plural',5,'pt','Posts','2020-04-28 22:33:46','2020-04-28 22:33:46'),
	(8,'data_types','display_name_plural',6,'pt','Páginas','2020-04-28 22:33:46','2020-04-28 22:33:46'),
	(9,'data_types','display_name_plural',1,'pt','Utilizadores','2020-04-28 22:33:46','2020-04-28 22:33:46'),
	(10,'data_types','display_name_plural',4,'pt','Categorias','2020-04-28 22:33:46','2020-04-28 22:33:46'),
	(11,'data_types','display_name_plural',2,'pt','Menus','2020-04-28 22:33:46','2020-04-28 22:33:46'),
	(12,'data_types','display_name_plural',3,'pt','Funções','2020-04-28 22:33:46','2020-04-28 22:33:46'),
	(13,'categories','slug',1,'pt','categoria-1','2020-04-28 22:33:46','2020-04-28 22:33:46'),
	(14,'categories','name',1,'pt','Categoria 1','2020-04-28 22:33:46','2020-04-28 22:33:46'),
	(15,'categories','slug',2,'pt','categoria-2','2020-04-28 22:33:46','2020-04-28 22:33:46'),
	(16,'categories','name',2,'pt','Categoria 2','2020-04-28 22:33:46','2020-04-28 22:33:46'),
	(17,'pages','title',1,'pt','Olá Mundo','2020-04-28 22:33:46','2020-04-28 22:33:46'),
	(18,'pages','slug',1,'pt','ola-mundo','2020-04-28 22:33:46','2020-04-28 22:33:46'),
	(19,'pages','body',1,'pt','<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>','2020-04-28 22:33:46','2020-04-28 22:33:46'),
	(20,'menu_items','title',1,'pt','Painel de Controle','2020-04-28 22:33:46','2020-04-28 22:33:46'),
	(21,'menu_items','title',2,'pt','Media','2020-04-28 22:33:46','2020-04-28 22:33:46'),
	(22,'menu_items','title',12,'pt','Publicações','2020-04-28 22:33:46','2020-04-28 22:33:46'),
	(23,'menu_items','title',3,'pt','Utilizadores','2020-04-28 22:33:46','2020-04-28 22:33:46'),
	(24,'menu_items','title',11,'pt','Categorias','2020-04-28 22:33:46','2020-04-28 22:33:46'),
	(25,'menu_items','title',13,'pt','Páginas','2020-04-28 22:33:46','2020-04-28 22:33:46'),
	(26,'menu_items','title',4,'pt','Funções','2020-04-28 22:33:46','2020-04-28 22:33:46'),
	(27,'menu_items','title',5,'pt','Ferramentas','2020-04-28 22:33:46','2020-04-28 22:33:46'),
	(28,'menu_items','title',6,'pt','Menus','2020-04-28 22:33:46','2020-04-28 22:33:46'),
	(29,'menu_items','title',7,'pt','Base de dados','2020-04-28 22:33:46','2020-04-28 22:33:46'),
	(30,'menu_items','title',10,'pt','Configurações','2020-04-28 22:33:46','2020-04-28 22:33:46');

/*!40000 ALTER TABLE `translations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_roles`;

CREATE TABLE `user_roles` (
  `user_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_user_id_index` (`user_id`),
  KEY `user_roles_role_id_index` (`role_id`),
  CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`)
VALUES
	(1,1,'Admin','admin@admin.com','users/default.png',NULL,'$2y$10$Vxv1EFpOTf7jzQ2Syogy6.nBCzvvgD02MtsVcP6iasG98j5tjJbJa','dk5zScCt408AaIK01AksAjUMhyFPNfDPYEJHX4RCbBIhoBUq08HzMZ1Wjvv5',NULL,'2020-04-28 22:33:45','2020-04-28 22:33:45');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
