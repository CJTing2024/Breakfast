-- --------------------------------------------------------
-- 主機:                           127.0.0.1
-- 伺服器版本:                        10.3.15-MariaDB - mariadb.org binary distribution
-- 伺服器操作系統:                      Win64
-- HeidiSQL 版本:                  9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- 傾印 breakfast 的資料庫結構
CREATE DATABASE IF NOT EXISTS `breakfast` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `breakfast`;

-- 傾印  表格 breakfast.branch 結構
CREATE TABLE IF NOT EXISTS `branch` (
  `branch_id` int(11) NOT NULL AUTO_INCREMENT,
  `branch_name` varchar(20) CHARACTER SET utf8 NOT NULL,
  `branch_head` bigint(20) DEFAULT NULL,
  `branch_tel` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch_city` int(11) DEFAULT NULL,
  `branch_district` int(11) DEFAULT NULL,
  `branch_address` varchar(80) CHARACTER SET utf8 DEFAULT NULL,
  `branch_googlemap` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在傾印表格  breakfast.branch 的資料：~0 rows (大約)
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;

-- 傾印  表格 breakfast.category 結構
CREATE TABLE IF NOT EXISTS `category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(20) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在傾印表格  breakfast.category 的資料：~0 rows (大約)
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
/*!40000 ALTER TABLE `category` ENABLE KEYS */;

-- 傾印  表格 breakfast.city 結構
CREATE TABLE IF NOT EXISTS `city` (
  `city_id` int(11) NOT NULL,
  `city_name` char(5) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在傾印表格  breakfast.city 的資料：~0 rows (大約)
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
/*!40000 ALTER TABLE `city` ENABLE KEYS */;

-- 傾印  表格 breakfast.csat 結構
CREATE TABLE IF NOT EXISTS `csat` (
  `csat_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(320) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meal_cs` tinyint(4) DEFAULT NULL,
  `service_cs` tinyint(4) DEFAULT NULL,
  `env_cs` tinyint(4) DEFAULT NULL,
  `overall_cs` tinyint(4) DEFAULT NULL,
  `feedback` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`csat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在傾印表格  breakfast.csat 的資料：~0 rows (大約)
/*!40000 ALTER TABLE `csat` DISABLE KEYS */;
/*!40000 ALTER TABLE `csat` ENABLE KEYS */;

-- 傾印  表格 breakfast.dept 結構
CREATE TABLE IF NOT EXISTS `dept` (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(20) CHARACTER SET utf8 NOT NULL,
  `dept_desc` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在傾印表格  breakfast.dept 的資料：~0 rows (大約)
/*!40000 ALTER TABLE `dept` DISABLE KEYS */;
/*!40000 ALTER TABLE `dept` ENABLE KEYS */;

-- 傾印  表格 breakfast.district 結構
CREATE TABLE IF NOT EXISTS `district` (
  `city_id` int(11) NOT NULL,
  `district_sn` int(11) NOT NULL,
  `district_name` char(5) CHARACTER SET utf8 NOT NULL,
  `postal_code` char(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`city_id`,`district_sn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在傾印表格  breakfast.district 的資料：~0 rows (大約)
/*!40000 ALTER TABLE `district` DISABLE KEYS */;
/*!40000 ALTER TABLE `district` ENABLE KEYS */;

-- 傾印  表格 breakfast.employee 結構
CREATE TABLE IF NOT EXISTS `employee` (
  `emp_no` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` int(11) DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL,
  `position_id` int(11) DEFAULT NULL,
  `emp_name` varchar(20) CHARACTER SET utf8 NOT NULL,
  `gender` tinyint(4) DEFAULT NULL,
  `supervisor_no` bigint(20) DEFAULT NULL,
  `tel` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(320) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city_id` int(11) DEFAULT NULL,
  `district_sn` int(11) DEFAULT NULL,
  `address` varchar(80) CHARACTER SET utf8 DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `identity_no` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `arrived_date` date DEFAULT NULL,
  `leave_date` date DEFAULT NULL,
  PRIMARY KEY (`emp_no`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在傾印表格  breakfast.employee 的資料：~0 rows (大約)
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;

-- 傾印  表格 breakfast.member 結構
CREATE TABLE IF NOT EXISTS `member` (
  `member_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `member_email` varchar(320) COLLATE utf8mb4_unicode_ci NOT NULL,
  `member_password` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `member_name` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `member_gender` tinyint(4) DEFAULT NULL,
  `member_birthday` date DEFAULT NULL,
  `member_tel` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `member_phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `district_sn` int(11) DEFAULT NULL,
  `address` varchar(80) CHARACTER SET utf8 DEFAULT NULL,
  `member_points` int(11) DEFAULT NULL,
  PRIMARY KEY (`member_id`),
  UNIQUE KEY `member_email` (`member_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在傾印表格  breakfast.member 的資料：~0 rows (大約)
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
/*!40000 ALTER TABLE `member` ENABLE KEYS */;

-- 傾印  表格 breakfast.order 結構
CREATE TABLE IF NOT EXISTS `order` (
  `order_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) DEFAULT NULL,
  `order_date` date NOT NULL,
  `order_state` enum('未支付','已支付','已退款') COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在傾印表格  breakfast.order 的資料：~0 rows (大約)
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;

-- 傾印  表格 breakfast.order_detail 結構
CREATE TABLE IF NOT EXISTS `order_detail` (
  `detail_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `product_price` decimal(10,2) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在傾印表格  breakfast.order_detail 的資料：~0 rows (大約)
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;

-- 傾印  表格 breakfast.position 結構
CREATE TABLE IF NOT EXISTS `position` (
  `position_id` int(11) NOT NULL AUTO_INCREMENT,
  `position_name` varchar(20) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`position_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在傾印表格  breakfast.position 的資料：~0 rows (大約)
/*!40000 ALTER TABLE `position` DISABLE KEYS */;
/*!40000 ALTER TABLE `position` ENABLE KEYS */;

-- 傾印  表格 breakfast.product 結構
CREATE TABLE IF NOT EXISTS `product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(20) CHARACTER SET utf8 NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `product_desc` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_price` decimal(10,2) NOT NULL,
  `product_unit` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `product_safe_quanity` int(10) unsigned DEFAULT NULL,
  `product_quanity` int(10) unsigned DEFAULT NULL,
  `product_image` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `logout_date` date DEFAULT NULL,
  `product_kcal` decimal(10,2) DEFAULT NULL,
  `protein` decimal(10,2) DEFAULT NULL,
  `fat` decimal(10,2) DEFAULT NULL,
  `saturated_fat` decimal(10,2) DEFAULT NULL,
  `trans_fat` decimal(10,2) DEFAULT NULL,
  `sugar` decimal(10,2) DEFAULT NULL,
  `sodium` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在傾印表格  breakfast.product 的資料：~0 rows (大約)
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;

-- 傾印  表格 breakfast.revenue 結構
CREATE TABLE IF NOT EXISTS `revenue` (
  `Revenue_id` int(11) NOT NULL AUTO_INCREMENT,
  `Revenue_date` date DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Revenue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在傾印表格  breakfast.revenue 的資料：~0 rows (大約)
/*!40000 ALTER TABLE `revenue` DISABLE KEYS */;
/*!40000 ALTER TABLE `revenue` ENABLE KEYS */;

-- 傾印  表格 breakfast.revenue_detail 結構
CREATE TABLE IF NOT EXISTS `revenue_detail` (
  `rd_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Revenue_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `total_quantity` int(11) DEFAULT NULL,
  `total_price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`rd_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在傾印表格  breakfast.revenue_detail 的資料：~0 rows (大約)
/*!40000 ALTER TABLE `revenue_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `revenue_detail` ENABLE KEYS */;

-- 傾印  表格 breakfast.voucher 結構
CREATE TABLE IF NOT EXISTS `voucher` (
  `voucher_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) DEFAULT NULL,
  `acquisition_date` date DEFAULT NULL,
  `exp_date` date DEFAULT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`voucher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在傾印表格  breakfast.voucher 的資料：~0 rows (大約)
/*!40000 ALTER TABLE `voucher` DISABLE KEYS */;
/*!40000 ALTER TABLE `voucher` ENABLE KEYS */;

-- 傾印  表格 breakfast.voucher_class 結構
CREATE TABLE IF NOT EXISTS `voucher_class` (
  `voucher_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `voucher_class_name` varchar(50) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`voucher_class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在傾印表格  breakfast.voucher_class 的資料：~0 rows (大約)
/*!40000 ALTER TABLE `voucher_class` DISABLE KEYS */;
/*!40000 ALTER TABLE `voucher_class` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
