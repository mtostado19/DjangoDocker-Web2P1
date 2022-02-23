-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.7.1-MariaDB-1:10.7.1+maria~focal - mariadb.org binary distribution
-- Server OS:                    debian-linux-gnu
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for apidatabase
CREATE DATABASE IF NOT EXISTS `apidatabase` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `apidatabase`;

-- Dumping structure for table apidatabase.api_categories
CREATE TABLE IF NOT EXISTS `api_categories` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table apidatabase.api_categories: ~2 rows (approximately)
/*!40000 ALTER TABLE `api_categories` DISABLE KEYS */;
INSERT INTO `api_categories` (`id`, `name`) VALUES
	(1, 'Accion'),
	(2, 'Aventura'),
	(3, 'Plataformer');
/*!40000 ALTER TABLE `api_categories` ENABLE KEYS */;

-- Dumping structure for table apidatabase.api_company
CREATE TABLE IF NOT EXISTS `api_company` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table apidatabase.api_company: ~2 rows (approximately)
/*!40000 ALTER TABLE `api_company` DISABLE KEYS */;
INSERT INTO `api_company` (`id`, `name`) VALUES
	(1, 'Nintendo'),
	(2, 'Sony'),
	(3, 'Microsoft');
/*!40000 ALTER TABLE `api_company` ENABLE KEYS */;

-- Dumping structure for table apidatabase.api_ratings
CREATE TABLE IF NOT EXISTS `api_ratings` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rate` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table apidatabase.api_ratings: ~2 rows (approximately)
/*!40000 ALTER TABLE `api_ratings` DISABLE KEYS */;
INSERT INTO `api_ratings` (`id`, `rate`) VALUES
	(1, 'E'),
	(2, 'T'),
	(3, 'M');
/*!40000 ALTER TABLE `api_ratings` ENABLE KEYS */;

-- Dumping structure for table apidatabase.api_videogames
CREATE TABLE IF NOT EXISTS `api_videogames` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `description` varchar(500) NOT NULL,
  `score` int(11) NOT NULL,
  `company_id` bigint(20) NOT NULL,
  `ratings_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `api_videogames_company_id_5f80bc39_fk_api_company_id` (`company_id`),
  KEY `api_videogames_ratings_id_491c10c1_fk_api_ratings_id` (`ratings_id`),
  CONSTRAINT `api_videogames_company_id_5f80bc39_fk_api_company_id` FOREIGN KEY (`company_id`) REFERENCES `api_company` (`id`),
  CONSTRAINT `api_videogames_ratings_id_491c10c1_fk_api_ratings_id` FOREIGN KEY (`ratings_id`) REFERENCES `api_ratings` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table apidatabase.api_videogames: ~2 rows (approximately)
/*!40000 ALTER TABLE `api_videogames` DISABLE KEYS */;
INSERT INTO `api_videogames` (`id`, `name`, `description`, `score`, `company_id`, `ratings_id`) VALUES
	(1, 'Halo', 'Es Halo xd', 9, 3, 2),
	(2, 'Kirby', 'Esta padre 10/10', 8, 1, 1),
	(3, 'God of War', 'Otro juego nuevo', 6, 2, 3);
/*!40000 ALTER TABLE `api_videogames` ENABLE KEYS */;

-- Dumping structure for table apidatabase.api_videogames_category
CREATE TABLE IF NOT EXISTS `api_videogames_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `videogames_id` bigint(20) NOT NULL,
  `categories_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `api_videogames_category_videogames_id_categories_8acd9ce8_uniq` (`videogames_id`,`categories_id`),
  KEY `api_videogames_categ_categories_id_79684639_fk_api_categ` (`categories_id`),
  CONSTRAINT `api_videogames_categ_categories_id_79684639_fk_api_categ` FOREIGN KEY (`categories_id`) REFERENCES `api_categories` (`id`),
  CONSTRAINT `api_videogames_categ_videogames_id_21ddf071_fk_api_video` FOREIGN KEY (`videogames_id`) REFERENCES `api_videogames` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table apidatabase.api_videogames_category: ~5 rows (approximately)
/*!40000 ALTER TABLE `api_videogames_category` DISABLE KEYS */;
INSERT INTO `api_videogames_category` (`id`, `videogames_id`, `categories_id`) VALUES
	(1, 1, 1),
	(2, 1, 2),
	(3, 2, 2),
	(4, 2, 3),
	(5, 3, 1),
	(7, 3, 2);
/*!40000 ALTER TABLE `api_videogames_category` ENABLE KEYS */;

-- Dumping structure for table apidatabase.auth_group
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table apidatabase.auth_group: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;

-- Dumping structure for table apidatabase.auth_group_permissions
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table apidatabase.auth_group_permissions: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;

-- Dumping structure for table apidatabase.auth_permission
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table apidatabase.auth_permission: ~44 rows (approximately)
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
	(1, 'Can add log entry', 1, 'add_logentry'),
	(2, 'Can change log entry', 1, 'change_logentry'),
	(3, 'Can delete log entry', 1, 'delete_logentry'),
	(4, 'Can view log entry', 1, 'view_logentry'),
	(5, 'Can add permission', 2, 'add_permission'),
	(6, 'Can change permission', 2, 'change_permission'),
	(7, 'Can delete permission', 2, 'delete_permission'),
	(8, 'Can view permission', 2, 'view_permission'),
	(9, 'Can add group', 3, 'add_group'),
	(10, 'Can change group', 3, 'change_group'),
	(11, 'Can delete group', 3, 'delete_group'),
	(12, 'Can view group', 3, 'view_group'),
	(13, 'Can add user', 4, 'add_user'),
	(14, 'Can change user', 4, 'change_user'),
	(15, 'Can delete user', 4, 'delete_user'),
	(16, 'Can view user', 4, 'view_user'),
	(17, 'Can add content type', 5, 'add_contenttype'),
	(18, 'Can change content type', 5, 'change_contenttype'),
	(19, 'Can delete content type', 5, 'delete_contenttype'),
	(20, 'Can view content type', 5, 'view_contenttype'),
	(21, 'Can add session', 6, 'add_session'),
	(22, 'Can change session', 6, 'change_session'),
	(23, 'Can delete session', 6, 'delete_session'),
	(24, 'Can view session', 6, 'view_session'),
	(25, 'Can add categories', 7, 'add_categories'),
	(26, 'Can change categories', 7, 'change_categories'),
	(27, 'Can delete categories', 7, 'delete_categories'),
	(28, 'Can view categories', 7, 'view_categories'),
	(29, 'Can add company', 8, 'add_company'),
	(30, 'Can change company', 8, 'change_company'),
	(31, 'Can delete company', 8, 'delete_company'),
	(32, 'Can view company', 8, 'view_company'),
	(33, 'Can add ratings', 9, 'add_ratings'),
	(34, 'Can change ratings', 9, 'change_ratings'),
	(35, 'Can delete ratings', 9, 'delete_ratings'),
	(36, 'Can view ratings', 9, 'view_ratings'),
	(37, 'Can add videogames', 10, 'add_videogames'),
	(38, 'Can change videogames', 10, 'change_videogames'),
	(39, 'Can delete videogames', 10, 'delete_videogames'),
	(40, 'Can view videogames', 10, 'view_videogames'),
	(41, 'Can add API key', 11, 'add_apikey'),
	(42, 'Can change API key', 11, 'change_apikey'),
	(43, 'Can delete API key', 11, 'delete_apikey'),
	(44, 'Can view API key', 11, 'view_apikey');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;

-- Dumping structure for table apidatabase.auth_user
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table apidatabase.auth_user: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
	(1, 'pbkdf2_sha256$320000$TaxAfHmaRkbIx84XvnUvS8$Ds9oHWALCJch5owJRj0wTezL0yYeLCXt1wysik0Axuo=', '2022-02-23 06:55:47.547943', 1, 'admin', '', '', 'example@example.com', 1, 1, '2022-02-23 06:51:27.484415');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;

-- Dumping structure for table apidatabase.auth_user_groups
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table apidatabase.auth_user_groups: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;

-- Dumping structure for table apidatabase.auth_user_user_permissions
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table apidatabase.auth_user_user_permissions: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;

-- Dumping structure for table apidatabase.django_admin_log
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table apidatabase.django_admin_log: ~0 rows (approximately)
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
	(1, '2022-02-23 06:56:15.947900', 'ZcFurRU7.pbkdf2_sha256$320000$dHjNR9NBfxNDd354UpUnE6$LCvRNb8HMC7LaIyZNR+jntHI+4/v/+jna/8ilE6Cu+s=', 'Api1', 1, '[{"added": {}}]', 11, 1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;

-- Dumping structure for table apidatabase.django_content_type
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table apidatabase.django_content_type: ~11 rows (approximately)
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
	(1, 'admin', 'logentry'),
	(7, 'api', 'categories'),
	(8, 'api', 'company'),
	(9, 'api', 'ratings'),
	(10, 'api', 'videogames'),
	(3, 'auth', 'group'),
	(2, 'auth', 'permission'),
	(4, 'auth', 'user'),
	(5, 'contenttypes', 'contenttype'),
	(11, 'rest_framework_api_key', 'apikey'),
	(6, 'sessions', 'session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;

-- Dumping structure for table apidatabase.django_migrations
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table apidatabase.django_migrations: ~21 rows (approximately)
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
	(1, 'contenttypes', '0001_initial', '2022-02-23 06:46:13.319844'),
	(2, 'auth', '0001_initial', '2022-02-23 06:46:30.892915'),
	(3, 'admin', '0001_initial', '2022-02-23 06:46:32.672369'),
	(4, 'admin', '0002_logentry_remove_auto_add', '2022-02-23 06:46:32.714228'),
	(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-02-23 06:46:32.766589'),
	(6, 'contenttypes', '0002_remove_content_type_name', '2022-02-23 06:46:33.853663'),
	(7, 'auth', '0002_alter_permission_name_max_length', '2022-02-23 06:46:34.691030'),
	(8, 'auth', '0003_alter_user_email_max_length', '2022-02-23 06:46:35.173902'),
	(9, 'auth', '0004_alter_user_username_opts', '2022-02-23 06:46:35.230418'),
	(10, 'auth', '0005_alter_user_last_login_null', '2022-02-23 06:46:35.877312'),
	(11, 'auth', '0006_require_contenttypes_0002', '2022-02-23 06:46:35.916294'),
	(12, 'auth', '0007_alter_validators_add_error_messages', '2022-02-23 06:46:35.961767'),
	(13, 'auth', '0008_alter_user_username_max_length', '2022-02-23 06:46:36.508362'),
	(14, 'auth', '0009_alter_user_last_name_max_length', '2022-02-23 06:46:36.991292'),
	(15, 'auth', '0010_alter_group_name_max_length', '2022-02-23 06:46:37.483096'),
	(16, 'auth', '0011_update_proxy_permissions', '2022-02-23 06:46:37.523544'),
	(17, 'auth', '0012_alter_user_first_name_max_length', '2022-02-23 06:46:37.914519'),
	(18, 'rest_framework_api_key', '0001_initial', '2022-02-23 06:46:39.324567'),
	(19, 'rest_framework_api_key', '0002_auto_20190529_2243', '2022-02-23 06:46:39.693313'),
	(20, 'rest_framework_api_key', '0003_auto_20190623_1952', '2022-02-23 06:46:39.732845'),
	(21, 'rest_framework_api_key', '0004_prefix_hashed_key', '2022-02-23 06:46:42.196068'),
	(22, 'sessions', '0001_initial', '2022-02-23 06:46:42.990239'),
	(23, 'api', '0001_initial', '2022-02-23 06:49:41.596246');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;

-- Dumping structure for table apidatabase.django_session
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table apidatabase.django_session: ~1 rows (approximately)
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;

-- Dumping structure for table apidatabase.rest_framework_api_key_apikey
CREATE TABLE IF NOT EXISTS `rest_framework_api_key_apikey` (
  `id` varchar(100) NOT NULL,
  `created` datetime(6) NOT NULL,
  `name` varchar(50) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expiry_date` datetime(6) DEFAULT NULL,
  `hashed_key` varchar(100) NOT NULL,
  `prefix` varchar(8) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `prefix` (`prefix`),
  KEY `rest_framework_api_key_apikey_created_c61872d9` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table apidatabase.rest_framework_api_key_apikey: ~0 rows (approximately)
/*!40000 ALTER TABLE `rest_framework_api_key_apikey` DISABLE KEYS */;
INSERT INTO `rest_framework_api_key_apikey` (`id`, `created`, `name`, `revoked`, `expiry_date`, `hashed_key`, `prefix`) VALUES
	('ZcFurRU7.pbkdf2_sha256$320000$dHjNR9NBfxNDd354UpUnE6$LCvRNb8HMC7LaIyZNR+jntHI+4/v/+jna/8ilE6Cu+s=', '2022-02-23 06:56:15.947283', 'Api1', 0, NULL, 'pbkdf2_sha256$320000$dHjNR9NBfxNDd354UpUnE6$LCvRNb8HMC7LaIyZNR+jntHI+4/v/+jna/8ilE6Cu+s=', 'ZcFurRU7');
/*!40000 ALTER TABLE `rest_framework_api_key_apikey` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
