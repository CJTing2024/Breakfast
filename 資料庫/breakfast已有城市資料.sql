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

-- 正在傾印表格  breakfast.city 的資料：~24 rows (大約)
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
REPLACE INTO `city` (`city_id`, `city_name`) VALUES
	(1, '臺北市'),
	(2, '基隆市'),
	(3, '新北市'),
	(4, '連江縣'),
	(5, '宜蘭縣'),
	(6, '釣魚臺'),
	(7, '新竹市'),
	(8, '新竹縣'),
	(9, '桃園市'),
	(10, '苗栗縣'),
	(11, '臺中市'),
	(12, '彰化縣'),
	(13, '南投縣'),
	(14, '嘉義市'),
	(15, '嘉義縣'),
	(16, '雲林縣'),
	(17, '臺南市'),
	(18, '高雄市'),
	(19, '南海島'),
	(20, '澎湖縣'),
	(21, '金門縣'),
	(22, '屏東縣'),
	(23, '臺東縣'),
	(24, '花蓮縣');
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

-- 正在傾印表格  breakfast.district 的資料：~374 rows (大約)
/*!40000 ALTER TABLE `district` DISABLE KEYS */;
REPLACE INTO `district` (`city_id`, `district_sn`, `district_name`, `postal_code`) VALUES
	(1, 1, '中正區', '100'),
	(1, 2, '大同區', '103'),
	(1, 3, '中山區', '104'),
	(1, 4, '松山區', '105'),
	(1, 5, '大安區', '106'),
	(1, 6, '萬華區', '108'),
	(1, 7, '信義區', '110'),
	(1, 8, '士林區', '111'),
	(1, 9, '北投區', '112'),
	(1, 10, '內湖區', '114'),
	(1, 11, '南港區', '115'),
	(1, 12, '文山區', '116'),
	(2, 1, '仁愛區', '200'),
	(2, 2, '信義區', '201'),
	(2, 3, '中正區', '202'),
	(2, 4, '中山區', '203'),
	(2, 5, '安樂區', '204'),
	(2, 6, '暖暖區', '205'),
	(2, 7, '七堵區', '206'),
	(3, 1, '萬里區', '207'),
	(3, 2, '金山區', '208'),
	(3, 3, '板橋區', '220'),
	(3, 4, '汐止區', '221'),
	(3, 5, '深坑區', '222'),
	(3, 6, '石碇區', '223'),
	(3, 7, '瑞芳區', '224'),
	(3, 8, '平溪區', '226'),
	(3, 9, '雙溪區', '227'),
	(3, 10, '貢寮區', '228'),
	(3, 11, '新店區', '231'),
	(3, 12, '坪林區', '232'),
	(3, 13, '烏來區', '233'),
	(3, 14, '永和區', '234'),
	(3, 15, '中和區', '235'),
	(3, 16, '土城區', '236'),
	(3, 17, '三峽區', '237'),
	(3, 18, '樹林區', '238'),
	(3, 19, '鶯歌區', '239'),
	(3, 20, '三重區', '241'),
	(3, 21, '新莊區', '242'),
	(3, 22, '泰山區', '243'),
	(3, 23, '林口區', '244'),
	(3, 24, '蘆洲區', '247'),
	(3, 25, '五股區', '248'),
	(3, 26, '八里區', '249'),
	(3, 27, '淡水區', '251'),
	(3, 28, '三芝區', '252'),
	(3, 29, '石門區', '253'),
	(4, 1, '南竿鄉', '209'),
	(4, 2, '北竿鄉', '210'),
	(4, 3, '莒光鄉', '211'),
	(4, 4, '東引鄉', '212'),
	(5, 1, '宜蘭市', '260'),
	(5, 2, '壯圍鄉', '263'),
	(5, 3, '頭城鎮', '261'),
	(5, 4, '礁溪鄉', '262'),
	(5, 5, '員山鄉', '264'),
	(5, 6, '羅東鎮', '265'),
	(5, 7, '三星鄉', '266'),
	(5, 8, '大同鄉', '267'),
	(5, 9, '五結鄉', '268'),
	(5, 10, '冬山鄉', '269'),
	(5, 11, '蘇澳鎮', '270'),
	(5, 12, '南澳鄉', '272'),
	(5, 13, '釣魚臺', '290'),
	(6, 1, '釣魚臺', '290'),
	(7, 1, '東區', '300'),
	(7, 2, '北區', '300'),
	(7, 3, '香山區', '300'),
	(8, 1, '寶山鄉', '308'),
	(8, 2, '竹北市', '302'),
	(8, 3, '湖口鄉', '303'),
	(8, 4, '新豐鄉', '304'),
	(8, 5, '新埔鎮', '305'),
	(8, 6, '關西鎮', '306'),
	(8, 7, '芎林鄉', '307'),
	(8, 8, '竹東鎮', '310'),
	(8, 9, '五峰鄉', '311'),
	(8, 10, '橫山鄉', '312'),
	(8, 11, '尖石鄉', '313'),
	(8, 12, '北埔鄉', '314'),
	(8, 13, '峨眉鄉', '315'),
	(9, 1, '中壢區', '320'),
	(9, 2, '平鎮區', '324'),
	(9, 3, '龍潭區', '325'),
	(9, 4, '楊梅區', '326'),
	(9, 5, '新屋區', '327'),
	(9, 6, '觀音區', '328'),
	(9, 7, '桃園區', '330'),
	(9, 8, '龜山區', '333'),
	(9, 9, '八德區', '334'),
	(9, 10, '大溪區', '335'),
	(9, 11, '復興區', '336'),
	(9, 12, '大園區', '337'),
	(9, 13, '蘆竹區', '338'),
	(10, 1, '竹南鎮', '350'),
	(10, 2, '頭份市', '351'),
	(10, 3, '三灣鄉', '352'),
	(10, 4, '南庄鄉', '353'),
	(10, 5, '獅潭鄉', '354'),
	(10, 6, '後龍鎮', '356'),
	(10, 7, '通霄鎮', '357'),
	(10, 8, '苑裡鎮', '358'),
	(10, 9, '苗栗市', '360'),
	(10, 10, '造橋鄉', '361'),
	(10, 11, '頭屋鄉', '362'),
	(10, 12, '公館鄉', '363'),
	(10, 13, '大湖鄉', '364'),
	(10, 14, '泰安鄉', '365'),
	(10, 15, '銅鑼鄉', '366'),
	(10, 16, '三義鄉', '367'),
	(10, 17, '西湖鄉', '368'),
	(10, 18, '卓蘭鎮', '369'),
	(11, 1, '中區', '400'),
	(11, 2, '東區', '401'),
	(11, 3, '南區', '402'),
	(11, 4, '西區', '403'),
	(11, 5, '北區', '404'),
	(11, 6, '北屯區', '406'),
	(11, 7, '西屯區', '407'),
	(11, 8, '南屯區', '408'),
	(11, 9, '太平區', '411'),
	(11, 10, '大里區', '412'),
	(11, 11, '霧峰區', '413'),
	(11, 12, '烏日區', '414'),
	(11, 13, '豐原區', '420'),
	(11, 14, '后里區', '421'),
	(11, 15, '石岡區', '422'),
	(11, 16, '東勢區', '423'),
	(11, 17, '和平區', '424'),
	(11, 18, '新社區', '426'),
	(11, 19, '潭子區', '427'),
	(11, 20, '大雅區', '428'),
	(11, 21, '神岡區', '429'),
	(11, 22, '大肚區', '432'),
	(11, 23, '沙鹿區', '433'),
	(11, 24, '龍井區', '434'),
	(11, 25, '梧棲區', '435'),
	(11, 26, '清水區', '436'),
	(11, 27, '大甲區', '437'),
	(11, 28, '外埔區', '438'),
	(11, 29, '大安區', '439'),
	(12, 1, '彰化市', '500'),
	(12, 2, '芬園鄉', '502'),
	(12, 3, '花壇鄉', '503'),
	(12, 4, '秀水鄉', '504'),
	(12, 5, '鹿港鎮', '505'),
	(12, 6, '福興鄉', '506'),
	(12, 7, '線西鄉', '507'),
	(12, 8, '和美鎮', '508'),
	(12, 9, '伸港鄉', '509'),
	(12, 10, '員林市', '510'),
	(12, 11, '社頭鄉', '511'),
	(12, 12, '永靖鄉', '512'),
	(12, 13, '埔心鄉', '513'),
	(12, 14, '溪湖鎮', '514'),
	(12, 15, '大村鄉', '515'),
	(12, 16, '埔鹽鄉', '516'),
	(12, 17, '田中鎮', '520'),
	(12, 18, '北斗鎮', '521'),
	(12, 19, '田尾鄉', '522'),
	(12, 20, '埤頭鄉', '523'),
	(12, 21, '溪州鄉', '524'),
	(12, 22, '竹塘鄉', '525'),
	(12, 23, '二林鎮', '526'),
	(12, 24, '大城鄉', '527'),
	(12, 25, '芳苑鄉', '528'),
	(12, 26, '二水鄉', '530'),
	(13, 1, '南投市', '540'),
	(13, 2, '中寮鄉', '541'),
	(13, 3, '草屯鎮', '542'),
	(13, 4, '國姓鄉', '544'),
	(13, 5, '埔里鎮', '545'),
	(13, 6, '仁愛鄉', '546'),
	(13, 7, '名間鄉', '551'),
	(13, 8, '集集鎮', '552'),
	(13, 9, '水里鄉', '553'),
	(13, 10, '魚池鄉', '555'),
	(13, 11, '信義鄉', '556'),
	(13, 12, '竹山鎮', '557'),
	(13, 13, '鹿谷鄉', '558'),
	(14, 1, '西區', '600'),
	(14, 2, '東區', '600'),
	(15, 1, '番路鄉', '602'),
	(15, 2, '梅山鄉', '603'),
	(15, 3, '竹崎鄉', '604'),
	(15, 4, '阿里山鄉', '605'),
	(15, 5, '中埔鄉', '606'),
	(15, 6, '大埔鄉', '607'),
	(15, 7, '水上鄉', '608'),
	(15, 8, '鹿草鄉', '611'),
	(15, 9, '太保市', '612'),
	(15, 10, '朴子市', '613'),
	(15, 11, '東石鄉', '614'),
	(15, 12, '六腳鄉', '615'),
	(15, 13, '新港鄉', '616'),
	(15, 14, '民雄鄉', '621'),
	(15, 15, '大林鎮', '622'),
	(15, 16, '溪口鄉', '623'),
	(15, 17, '義竹鄉', '624'),
	(15, 18, '布袋鎮', '625'),
	(16, 1, '斗南鎮', '630'),
	(16, 2, '大埤鄉', '631'),
	(16, 3, '虎尾鎮', '632'),
	(16, 4, '土庫鎮', '633'),
	(16, 5, '褒忠鄉', '634'),
	(16, 6, '東勢鄉', '635'),
	(16, 7, '臺西鄉', '636'),
	(16, 8, '崙背鄉', '637'),
	(16, 9, '麥寮鄉', '638'),
	(16, 10, '斗六市', '640'),
	(16, 11, '林內鄉', '643'),
	(16, 12, '古坑鄉', '646'),
	(16, 13, '莿桐鄉', '647'),
	(16, 14, '西螺鎮', '648'),
	(16, 15, '二崙鄉', '649'),
	(16, 16, '北港鎮', '651'),
	(16, 17, '水林鄉', '652'),
	(16, 18, '口湖鄉', '653'),
	(16, 19, '四湖鄉', '654'),
	(16, 20, '元長鄉', '655'),
	(17, 1, '中西區', '700'),
	(17, 2, '東區', '701'),
	(17, 3, '南區', '702'),
	(17, 4, '北區', '704'),
	(17, 5, '安平區', '708'),
	(17, 6, '安南區', '709'),
	(17, 7, '永康區', '710'),
	(17, 8, '歸仁區', '711'),
	(17, 9, '新化區', '712'),
	(17, 10, '左鎮區', '713'),
	(17, 11, '玉井區', '714'),
	(17, 12, '楠西區', '715'),
	(17, 13, '南化區', '716'),
	(17, 14, '仁德區', '717'),
	(17, 15, '關廟區', '718'),
	(17, 16, '龍崎區', '719'),
	(17, 17, '官田區', '720'),
	(17, 18, '麻豆區', '721'),
	(17, 19, '佳里區', '722'),
	(17, 20, '西港區', '723'),
	(17, 21, '七股區', '724'),
	(17, 22, '將軍區', '725'),
	(17, 23, '學甲區', '726'),
	(17, 24, '北門區', '727'),
	(17, 25, '新營區', '730'),
	(17, 26, '後壁區', '731'),
	(17, 27, '白河區', '732'),
	(17, 28, '東山區', '733'),
	(17, 29, '六甲區', '734'),
	(17, 30, '下營區', '735'),
	(17, 31, '柳營區', '736'),
	(17, 32, '鹽水區', '737'),
	(17, 33, '善化區', '741'),
	(17, 34, '新市區', '744'),
	(17, 35, '大內區', '742'),
	(17, 36, '山上區', '743'),
	(17, 37, '安定區', '745'),
	(18, 1, '新興區', '800'),
	(18, 2, '前金區', '801'),
	(18, 3, '苓雅區', '802'),
	(18, 4, '鹽埕區', '803'),
	(18, 5, '鼓山區', '804'),
	(18, 6, '旗津區', '805'),
	(18, 7, '前鎮區', '806'),
	(18, 8, '三民區', '807'),
	(18, 9, '楠梓區', '811'),
	(18, 10, '小港區', '812'),
	(18, 11, '左營區', '813'),
	(18, 12, '仁武區', '814'),
	(18, 13, '大社區', '815'),
	(18, 14, '東沙群島', '817'),
	(18, 15, '南沙群島', '819'),
	(18, 16, '岡山區', '820'),
	(18, 17, '路竹區', '821'),
	(18, 18, '阿蓮區', '822'),
	(18, 19, '田寮區', '823'),
	(18, 20, '燕巢區', '824'),
	(18, 21, '橋頭區', '825'),
	(18, 22, '梓官區', '826'),
	(18, 23, '彌陀區', '827'),
	(18, 24, '永安區', '828'),
	(18, 25, '湖內區', '829'),
	(18, 26, '鳳山區', '830'),
	(18, 27, '大寮區', '831'),
	(18, 28, '林園區', '832'),
	(18, 29, '鳥松區', '833'),
	(18, 30, '大樹區', '840'),
	(18, 31, '旗山區', '842'),
	(18, 32, '美濃區', '843'),
	(18, 33, '六龜區', '844'),
	(18, 34, '內門區', '845'),
	(18, 35, '杉林區', '846'),
	(18, 36, '甲仙區', '847'),
	(18, 37, '桃源區', '848'),
	(18, 38, '那瑪夏區', '849'),
	(18, 39, '茂林區', '851'),
	(18, 40, '茄萣區', '852'),
	(19, 1, '東沙群島', '817'),
	(19, 2, '南沙群島', '819'),
	(20, 1, '馬公市', '880'),
	(20, 2, '西嶼鄉', '881'),
	(20, 3, '望安鄉', '882'),
	(20, 4, '七美鄉', '883'),
	(20, 5, '白沙鄉', '884'),
	(20, 6, '湖西鄉', '885'),
	(21, 1, '金沙鎮', '890'),
	(21, 2, '金湖鎮', '891'),
	(21, 3, '金寧鄉', '892'),
	(21, 4, '金城鎮', '893'),
	(21, 5, '烈嶼鄉', '894'),
	(21, 6, '烏坵鄉', '896'),
	(22, 1, '屏東市', '900'),
	(22, 2, '三地門鄉', '901'),
	(22, 3, '霧臺鄉', '902'),
	(22, 4, '瑪家鄉', '903'),
	(22, 5, '九如鄉', '904'),
	(22, 6, '里港鄉', '905'),
	(22, 7, '高樹鄉', '906'),
	(22, 8, '鹽埔鄉', '907'),
	(22, 9, '長治鄉', '908'),
	(22, 10, '麟洛鄉', '909'),
	(22, 11, '竹田鄉', '911'),
	(22, 12, '內埔鄉', '912'),
	(22, 13, '萬丹鄉', '913'),
	(22, 14, '潮州鎮', '920'),
	(22, 15, '泰武鄉', '921'),
	(22, 16, '來義鄉', '922'),
	(22, 17, '萬巒鄉', '923'),
	(22, 18, '崁頂鄉', '924'),
	(22, 19, '新埤鄉', '925'),
	(22, 20, '南州鄉', '926'),
	(22, 21, '林邊鄉', '927'),
	(22, 22, '東港鎮', '928'),
	(22, 23, '琉球鄉', '929'),
	(22, 24, '佳冬鄉', '931'),
	(22, 25, '新園鄉', '932'),
	(22, 26, '枋寮鄉', '940'),
	(22, 27, '枋山鄉', '941'),
	(22, 28, '春日鄉', '942'),
	(22, 29, '獅子鄉', '943'),
	(22, 30, '車城鄉', '944'),
	(22, 31, '牡丹鄉', '945'),
	(22, 32, '恆春鎮', '946'),
	(22, 33, '滿州鄉', '947'),
	(23, 1, '臺東市', '950'),
	(23, 2, '綠島鄉', '951'),
	(23, 3, '蘭嶼鄉', '952'),
	(23, 4, '延平鄉', '953'),
	(23, 5, '卑南鄉', '954'),
	(23, 6, '鹿野鄉', '955'),
	(23, 7, '關山鎮', '956'),
	(23, 8, '海端鄉', '957'),
	(23, 9, '池上鄉', '958'),
	(23, 10, '東河鄉', '959'),
	(23, 11, '成功鎮', '961'),
	(23, 12, '長濱鄉', '962'),
	(23, 13, '太麻里鄉', '963'),
	(23, 14, '金峰鄉', '964'),
	(23, 15, '大武鄉', '965'),
	(23, 16, '達仁鄉', '966'),
	(24, 1, '花蓮市', '970'),
	(24, 2, '新城鄉', '971'),
	(24, 3, '秀林鄉', '972'),
	(24, 4, '吉安鄉', '973'),
	(24, 5, '壽豐鄉', '974'),
	(24, 6, '鳳林鎮', '975'),
	(24, 7, '光復鄉', '976'),
	(24, 8, '豐濱鄉', '977'),
	(24, 9, '瑞穗鄉', '978'),
	(24, 10, '萬榮鄉', '979'),
	(24, 11, '玉里鎮', '981'),
	(24, 12, '卓溪鄉', '982'),
	(24, 13, '富里鄉', '983');
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
  `voucher_class_id` int(11) DEFAULT NULL,
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
