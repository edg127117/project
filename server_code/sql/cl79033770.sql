-- MySQL dump 10.13  Distrib 5.7.44, for Linux (x86_64)
--
-- Host: localhost    Database: project
-- ------------------------------------------------------
-- Server version	5.7.44

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
-- Current Database: `project`
--

/*!40000 DROP DATABASE IF EXISTS `project`*/;

CREATE
DATABASE /*!32312 IF NOT EXISTS*/ `project` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE
`project`;

--
-- Table structure for table `aboutus`
--

DROP TABLE IF EXISTS `aboutus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aboutus`
(
    `id`       bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `addtime`  timestamp                               NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `title`    varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标题',
    `subtitle` varchar(200) COLLATE utf8mb4_unicode_ci          DEFAULT NULL COMMENT '副标题',
    `content`  longtext COLLATE utf8mb4_unicode_ci     NOT NULL COMMENT '内容',
    `picture1` longtext COLLATE utf8mb4_unicode_ci COMMENT '图片1',
    `picture2` longtext COLLATE utf8mb4_unicode_ci COMMENT '图片2',
    `picture3` longtext COLLATE utf8mb4_unicode_ci COMMENT '图片3',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='发展历程';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aboutus`
--

LOCK
TABLES `aboutus` WRITE;
/*!40000 ALTER TABLE `aboutus` DISABLE KEYS */;
INSERT INTO `aboutus`
VALUES (1, '2025-02-04 03:06:56', '发展历程', 'DEVELOPMENT HISTORY',
        '山川如画，水光潋滟。在这美丽的自然世界里，我们不禁沉醉于那迷人的风景。春天，花儿盛开，绿树成荫，仿佛置身于童话之中\n；夏天，阳光明媚，海风拂面，让人心旷神怡；秋天，枫叶满山，金色的稻田波光粼粼，令人流连忘返。',
        'file/aboutusPicture1.jpg', 'file/aboutusPicture2.jpg', 'file/aboutusPicture3.jpg');
/*!40000 ALTER TABLE `aboutus` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `chat`
--

DROP TABLE IF EXISTS `chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat`
(
    `id`      bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `adminid` bigint(20) DEFAULT NULL COMMENT '管理员id',
    `ask`     longtext COLLATE utf8mb4_unicode_ci COMMENT '提问内容',
    `reply`   longtext COLLATE utf8mb4_unicode_ci COMMENT '回复内容',
    `isreply` int(11) DEFAULT NULL COMMENT '是否回复',
    `userid`  bigint(20) NOT NULL COMMENT '用户id',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='客服聊天';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat`
--

LOCK
TABLES `chat` WRITE;
/*!40000 ALTER TABLE `chat` DISABLE KEYS */;
INSERT INTO `chat`
VALUES (1, '2025-02-04 03:06:56', 1, '提问内容1', '回复内容1', 1, 1),
       (2, '2025-02-04 03:06:56', 2, '提问内容2', '回复内容2', 2, 2),
       (3, '2025-02-04 03:06:56', 3, '提问内容3', '回复内容3', 3, 3),
       (4, '2025-02-04 03:06:56', 4, '提问内容4', '回复内容4', 4, 4),
       (5, '2025-02-04 03:06:56', 5, '提问内容5', '回复内容5', 5, 5),
       (6, '2025-02-04 03:06:56', 6, '提问内容6', '回复内容6', 6, 6),
       (7, '2025-02-04 03:06:56', 7, '提问内容7', '回复内容7', 7, 7),
       (8, '2025-02-04 03:06:56', 8, '提问内容8', '回复内容8', 8, 8),
       (9, '2025-02-04 03:06:56', 9, '提问内容9', '回复内容9', 9, 9),
       (10, '2025-02-04 03:06:56', 10, '提问内容10', '回复内容10', 10, 10);
/*!40000 ALTER TABLE `chat` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `chathelper`
--

DROP TABLE IF EXISTS `chathelper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chathelper`
(
    `id`      bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `addtime` timestamp NOT NULL                      DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `ask`     varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '提问内容',
    `reply`   longtext COLLATE utf8mb4_unicode_ci COMMENT '回复内容',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='聊天助手';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chathelper`
--

LOCK
TABLES `chathelper` WRITE;
/*!40000 ALTER TABLE `chathelper` DISABLE KEYS */;
INSERT INTO `chathelper`
VALUES (1, '2025-02-04 03:06:56', '提问内容1', '回复内容1'),
       (2, '2025-02-04 03:06:56', '提问内容2', '回复内容2'),
       (3, '2025-02-04 03:06:56', '提问内容3', '回复内容3'),
       (4, '2025-02-04 03:06:56', '提问内容4', '回复内容4'),
       (5, '2025-02-04 03:06:56', '提问内容5', '回复内容5'),
       (6, '2025-02-04 03:06:56', '提问内容6', '回复内容6'),
       (7, '2025-02-04 03:06:56', '提问内容7', '回复内容7'),
       (8, '2025-02-04 03:06:56', '提问内容8', '回复内容8'),
       (9, '2025-02-04 03:06:56', '提问内容9', '回复内容9'),
       (10, '2025-02-04 03:06:56', '提问内容10', '回复内容10');
/*!40000 ALTER TABLE `chathelper` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `cheliangxinxi`
--

DROP TABLE IF EXISTS `cheliangxinxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cheliangxinxi`
(
    `id`              bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `addtime`         timestamp NOT NULL                      DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `chepaihao`       varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '车牌号',
    `chexing`         varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '车型',
    `cheshenyanse`    varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '车身颜色',
    `cheliangtupian`  longtext COLLATE utf8mb4_unicode_ci COMMENT '车辆图片',
    `cheliangpinpai`  varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '车辆品牌',
    `cheliangxinghao` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '车辆型号',
    `yonghuzhanghao`  varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户账号',
    `yonghuxingming`  varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户姓名',
    `shoujihaoma`     varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号码',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='车辆信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cheliangxinxi`
--

LOCK
TABLES `cheliangxinxi` WRITE;
/*!40000 ALTER TABLE `cheliangxinxi` DISABLE KEYS */;
INSERT INTO `cheliangxinxi`
VALUES (1, '2025-02-04 03:06:55', '车牌号1', '车型1', '车身颜色1',
        'file/cheliangxinxiCheliangtupian1.jpg,file/cheliangxinxiCheliangtupian2.jpg,file/cheliangxinxiCheliangtupian3.jpg',
        '车辆品牌1', '车辆型号1', '用户账号1', '用户姓名1', '手机号码1'),
       (2, '2025-02-04 03:06:55', '车牌号2', '车型2', '车身颜色2',
        'file/cheliangxinxiCheliangtupian2.jpg,file/cheliangxinxiCheliangtupian3.jpg,file/cheliangxinxiCheliangtupian4.jpg',
        '车辆品牌2', '车辆型号2', '用户账号2', '用户姓名2', '手机号码2'),
       (3, '2025-02-04 03:06:55', '车牌号3', '车型3', '车身颜色3',
        'file/cheliangxinxiCheliangtupian3.jpg,file/cheliangxinxiCheliangtupian4.jpg,file/cheliangxinxiCheliangtupian5.jpg',
        '车辆品牌3', '车辆型号3', '用户账号3', '用户姓名3', '手机号码3'),
       (4, '2025-02-04 03:06:55', '车牌号4', '车型4', '车身颜色4',
        'file/cheliangxinxiCheliangtupian4.jpg,file/cheliangxinxiCheliangtupian5.jpg,file/cheliangxinxiCheliangtupian6.jpg',
        '车辆品牌4', '车辆型号4', '用户账号4', '用户姓名4', '手机号码4'),
       (5, '2025-02-04 03:06:55', '车牌号5', '车型5', '车身颜色5',
        'file/cheliangxinxiCheliangtupian5.jpg,file/cheliangxinxiCheliangtupian6.jpg,file/cheliangxinxiCheliangtupian7.jpg',
        '车辆品牌5', '车辆型号5', '用户账号5', '用户姓名5', '手机号码5'),
       (6, '2025-02-04 03:06:55', '车牌号6', '车型6', '车身颜色6',
        'file/cheliangxinxiCheliangtupian6.jpg,file/cheliangxinxiCheliangtupian7.jpg,file/cheliangxinxiCheliangtupian8.jpg',
        '车辆品牌6', '车辆型号6', '用户账号6', '用户姓名6', '手机号码6'),
       (7, '2025-02-04 03:06:55', '车牌号7', '车型7', '车身颜色7',
        'file/cheliangxinxiCheliangtupian7.jpg,file/cheliangxinxiCheliangtupian8.jpg,file/cheliangxinxiCheliangtupian9.jpg',
        '车辆品牌7', '车辆型号7', '用户账号7', '用户姓名7', '手机号码7'),
       (8, '2025-02-04 03:06:55', '车牌号8', '车型8', '车身颜色8',
        'file/cheliangxinxiCheliangtupian8.jpg,file/cheliangxinxiCheliangtupian9.jpg,file/cheliangxinxiCheliangtupian10.jpg',
        '车辆品牌8', '车辆型号8', '用户账号8', '用户姓名8', '手机号码8'),
       (9, '2025-02-04 03:06:55', '车牌号9', '车型9', '车身颜色9',
        'file/cheliangxinxiCheliangtupian9.jpg,file/cheliangxinxiCheliangtupian10.jpg,file/cheliangxinxiCheliangtupian11.jpg',
        '车辆品牌9', '车辆型号9', '用户账号9', '用户姓名9', '手机号码9'),
       (10, '2025-02-04 03:06:55', '车牌号10', '车型10', '车身颜色10',
        'file/cheliangxinxiCheliangtupian10.jpg,file/cheliangxinxiCheliangtupian11.jpg,file/cheliangxinxiCheliangtupian12.jpg',
        '车辆品牌10', '车辆型号10', '用户账号10', '用户姓名10', '手机号码10');
/*!40000 ALTER TABLE `cheliangxinxi` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config`
(
    `id`      bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `addtime` timestamp                               NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `name`    varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
    `value`   longtext COLLATE utf8mb4_unicode_ci COMMENT '值',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='轮播图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK
TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config`
VALUES (1, '2025-02-04 03:06:56', 'swiper1', 'file/swiperPicture1.jpg'),
       (2, '2025-02-04 03:06:56', 'swiper2', 'file/swiperPicture2.jpg'),
       (3, '2025-02-04 03:06:56', 'swiper3', 'file/swiperPicture3.jpg');
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `guzhangleixing`
--

DROP TABLE IF EXISTS `guzhangleixing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guzhangleixing`
(
    `id`             bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `addtime`        timestamp                               NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `guzhangleixing` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '故障类型',
    PRIMARY KEY (`id`),
    UNIQUE KEY `guzhangleixing` (`guzhangleixing`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='故障类型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guzhangleixing`
--

LOCK
TABLES `guzhangleixing` WRITE;
/*!40000 ALTER TABLE `guzhangleixing` DISABLE KEYS */;
INSERT INTO `guzhangleixing`
VALUES (1, '2025-02-04 03:06:55', '故障类型1'),
       (2, '2025-02-04 03:06:55', '故障类型2'),
       (3, '2025-02-04 03:06:55', '故障类型3'),
       (4, '2025-02-04 03:06:55', '故障类型4'),
       (5, '2025-02-04 03:06:55', '故障类型5'),
       (6, '2025-02-04 03:06:55', '故障类型6'),
       (7, '2025-02-04 03:06:55', '故障类型7'),
       (8, '2025-02-04 03:06:55', '故障类型8'),
       (9, '2025-02-04 03:06:55', '故障类型9'),
       (10, '2025-02-04 03:06:55', '故障类型10');
/*!40000 ALTER TABLE `guzhangleixing` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu`
(
    `id`       bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `addtime`  timestamp                           NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `menujson` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '菜单',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='菜单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK
TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu`
VALUES (1, '2025-02-04 03:06:56',
        '[{\"backMenu\":[{\"child\":[{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"appFrontIcon\":\"cuIcon-present\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"classname\":\"users\",\"menu\":\"管理员\",\"menuJump\":\"列表\",\"tableName\":\"users\"},{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"appFrontIcon\":\"cuIcon-pic\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"classname\":\"systemNotice\",\"menu\":\"系统公告\",\"menuJump\":\"列表\",\"tableName\":\"system_notice\"},{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"appFrontIcon\":\"cuIcon-keyboard\",\"buttons\":[\"查看\",\"修改\"],\"classname\":\"aboutus\",\"menu\":\"发展历程\",\"menuJump\":\"列表\",\"tableName\":\"aboutus\"},{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"appFrontIcon\":\"cuIcon-full\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"classname\":\"config\",\"menu\":\"轮播图\",\"menuJump\":\"列表\",\"tableName\":\"config\"}],\"fontClass\":\"icon-common44\",\"menu\":\"管理员管理\",\"unicode\":\"&#xef28;\"},{\"child\":[{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"appFrontIcon\":\"cuIcon-album\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"classname\":\"yonghu\",\"menu\":\"用户\",\"menuJump\":\"列表\",\"tableName\":\"yonghu\"},{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"审核\"],\"appFrontIcon\":\"cuIcon-brand\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"审核\"],\"classname\":\"weixiuyuan\",\"menu\":\"维修员\",\"menuJump\":\"列表\",\"tableName\":\"weixiuyuan\"}],\"fontClass\":\"icon-user3\",\"menu\":\"用户管理\",\"unicode\":\"&#xef99;\"},{\"child\":[{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"appFrontIcon\":\"cuIcon-present\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"classname\":\"guzhangleixing\",\"menu\":\"故障类型\",\"menuJump\":\"列表\",\"tableName\":\"guzhangleixing\"}],\"fontClass\":\"icon-common39\",\"menu\":\"故障类型管理\",\"unicode\":\"&#xeeba;\"},{\"child\":[{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"预约\"],\"appFrontIcon\":\"cuIcon-clothes\",\"buttons\":[\"查看\",\"删除\"],\"classname\":\"cheliangxinxi\",\"menu\":\"车辆信息\",\"menuJump\":\"列表\",\"tableName\":\"cheliangxinxi\"}],\"fontClass\":\"icon-common33\",\"menu\":\"车辆信息管理\",\"unicode\":\"&#xee6a;\"},{\"child\":[{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"审核\",\"预约次数\",\"首页总数\",\"首页统计\",\"取消\",\"分配\"],\"appFrontIcon\":\"cuIcon-discover\",\"buttons\":[\"查看\",\"删除\",\"审核\",\"预约次数\",\"首页总数\",\"首页统计\",\"分配\"],\"classname\":\"weixiuyuyue\",\"menu\":\"维修预约\",\"menuJump\":\"列表\",\"tableName\":\"weixiuyuyue\"},{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"支付\",\"维修收入\",\"维修次数\",\"首页总数\",\"首页统计\",\"评价\"],\"appFrontIcon\":\"cuIcon-phone\",\"buttons\":[\"查看\",\"删除\",\"维修收入\",\"维修次数\",\"首页总数\",\"首页统计\"],\"classname\":\"weixiuxinxi\",\"menu\":\"维修信息\",\"menuJump\":\"列表\",\"tableName\":\"weixiuxinxi\"},{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"客户满意度\",\"首页总数\",\"首页统计\"],\"appFrontIcon\":\"cuIcon-present\",\"buttons\":[\"查看\",\"删除\",\"客户满意度\",\"首页总数\",\"首页统计\"],\"classname\":\"weixiupingjia\",\"menu\":\"维修评价\",\"menuJump\":\"列表\",\"tableName\":\"weixiupingjia\"},{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"appFrontIcon\":\"cuIcon-cardboard\",\"buttons\":[\"查看\"],\"classname\":\"quxiaoyuyue\",\"menu\":\"取消预约\",\"menuJump\":\"列表\",\"tableName\":\"quxiaoyuyue\"},{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"维修\"],\"appFrontIcon\":\"cuIcon-link\",\"buttons\":[\"查看\",\"修改\",\"删除\"],\"classname\":\"weixiufenpei\",\"menu\":\"维修分配\",\"menuJump\":\"列表\",\"tableName\":\"weixiufenpei\"}],\"fontClass\":\"icon-common32\",\"menu\":\"维修预约管理\",\"unicode\":\"&#xee66;\"},{\"child\":[{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"appFrontIcon\":\"cuIcon-phone\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"classname\":\"shoufeibiaozhun\",\"menu\":\"收费标准\",\"menuJump\":\"列表\",\"tableName\":\"shoufeibiaozhun\"}],\"fontClass\":\"icon-common1\",\"menu\":\"收费标准管理\",\"unicode\":\"&#xeda3;\"},{\"child\":[{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"appFrontIcon\":\"cuIcon-copy\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"classname\":\"news\",\"menu\":\"汽车资讯\",\"menuJump\":\"列表\",\"tableName\":\"news\"}],\"fontClass\":\"icon-common16\",\"menu\":\"汽车资讯管理\",\"unicode\":\"&#xedfd;\"},{\"child\":[{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"appFrontIcon\":\"cuIcon-copy\",\"buttons\":[\"查看\",\"删除\"],\"classname\":\"chat\",\"menu\":\"客服聊天\",\"menuJump\":\"列表\",\"tableName\":\"chat\"},{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"appFrontIcon\":\"cuIcon-flashlightopen\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"classname\":\"chathelper\",\"menu\":\"聊天助手\",\"menuJump\":\"列表\",\"tableName\":\"chathelper\"}],\"fontClass\":\"icon-common15\",\"menu\":\"客服聊天管理\",\"unicode\":\"&#xedfc;\"}],\"frontMenu\":[{\"child\":[{\"appFrontIcon\":\"cuIcon-discover\",\"buttons\":[\"查看\"],\"classname\":\"shoufeibiaozhun\",\"menu\":\"收费标准\",\"menuJump\":\"列表\",\"tableName\":\"shoufeibiaozhun\"}],\"menu\":\"收费标准管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-goods\",\"buttons\":[\"查看\"],\"classname\":\"news\",\"menu\":\"汽车资讯\",\"menuJump\":\"列表\",\"tableName\":\"news\"}],\"menu\":\"新闻资讯管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-list\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"classname\":\"chat\",\"menu\":\"客服聊天\",\"menuJump\":\"列表\",\"tableName\":\"chat\"}],\"menu\":\"客服聊天管理\"}],\"hasBackLogin\":\"是\",\"hasBackRegister\":\"否\",\"hasFrontLogin\":\"否\",\"hasFrontRegister\":\"否\",\"pathName\":\"users\",\"roleName\":\"管理员\",\"tableName\":\"users\"},{\"backMenu\":[{\"child\":[{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"预约\"],\"appFrontIcon\":\"cuIcon-clothes\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"预约\"],\"classname\":\"cheliangxinxi\",\"menu\":\"车辆信息\",\"menuJump\":\"列表\",\"tableName\":\"cheliangxinxi\"}],\"fontClass\":\"icon-common33\",\"menu\":\"车辆信息管理\",\"unicode\":\"&#xee6a;\"},{\"child\":[{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"审核\",\"预约次数\",\"首页总数\",\"首页统计\",\"取消\",\"分配\"],\"appFrontIcon\":\"cuIcon-discover\",\"buttons\":[\"查看\",\"修改\",\"删除\",\"取消\"],\"classname\":\"weixiuyuyue\",\"menu\":\"维修预约\",\"menuJump\":\"列表\",\"tableName\":\"weixiuyuyue\"},{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"支付\",\"维修收入\",\"维修次数\",\"首页总数\",\"首页统计\",\"评价\"],\"appFrontIcon\":\"cuIcon-phone\",\"buttons\":[\"查看\",\"删除\",\"支付\",\"评价\"],\"classname\":\"weixiuxinxi\",\"menu\":\"维修信息\",\"menuJump\":\"列表\",\"tableName\":\"weixiuxinxi\"},{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"客户满意度\",\"首页总数\",\"首页统计\"],\"appFrontIcon\":\"cuIcon-present\",\"buttons\":[\"查看\",\"修改\",\"删除\"],\"classname\":\"weixiupingjia\",\"menu\":\"维修评价\",\"menuJump\":\"列表\",\"tableName\":\"weixiupingjia\"},{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"appFrontIcon\":\"cuIcon-cardboard\",\"buttons\":[\"查看\",\"修改\",\"删除\"],\"classname\":\"quxiaoyuyue\",\"menu\":\"取消预约\",\"menuJump\":\"列表\",\"tableName\":\"quxiaoyuyue\"},{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"维修\"],\"appFrontIcon\":\"cuIcon-link\",\"buttons\":[\"查看\",\"删除\"],\"classname\":\"weixiufenpei\",\"menu\":\"维修分配\",\"menuJump\":\"列表\",\"tableName\":\"weixiufenpei\"}],\"fontClass\":\"icon-common32\",\"menu\":\"维修预约管理\",\"unicode\":\"&#xee66;\"},{\"child\":[{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"appFrontIcon\":\"cuIcon-goods\",\"buttons\":[\"查看\"],\"classname\":\"storeup\",\"menu\":\"我的收藏\",\"menuJump\":\"1\",\"tableName\":\"storeup\"}],\"fontClass\":\"icon-common12\",\"menu\":\"我的收藏管理\",\"unicode\":\"&#xedf4;\"}],\"frontMenu\":[{\"child\":[{\"appFrontIcon\":\"cuIcon-discover\",\"buttons\":[\"查看\"],\"classname\":\"shoufeibiaozhun\",\"menu\":\"收费标准\",\"menuJump\":\"列表\",\"tableName\":\"shoufeibiaozhun\"}],\"menu\":\"收费标准管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-goods\",\"buttons\":[\"查看\"],\"classname\":\"news\",\"menu\":\"汽车资讯\",\"menuJump\":\"列表\",\"tableName\":\"news\"}],\"menu\":\"新闻资讯管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-list\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"classname\":\"chat\",\"menu\":\"客服聊天\",\"menuJump\":\"列表\",\"tableName\":\"chat\"}],\"menu\":\"客服聊天管理\"}],\"hasBackLogin\":\"否\",\"hasBackRegister\":\"否\",\"hasFrontLogin\":\"是\",\"hasFrontRegister\":\"是\",\"pathName\":\"yonghu\",\"roleName\":\"用户\",\"tableName\":\"yonghu\"},{\"backMenu\":[{\"child\":[{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"支付\",\"维修收入\",\"维修次数\",\"首页总数\",\"首页统计\",\"评价\"],\"appFrontIcon\":\"cuIcon-phone\",\"buttons\":[\"查看\",\"修改\",\"删除\",\"维修收入\",\"维修次数\",\"首页总数\",\"首页统计\"],\"classname\":\"weixiuxinxi\",\"menu\":\"维修信息\",\"menuJump\":\"列表\",\"tableName\":\"weixiuxinxi\"},{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"客户满意度\",\"首页总数\",\"首页统计\"],\"appFrontIcon\":\"cuIcon-present\",\"buttons\":[\"查看\",\"删除\",\"客户满意度\",\"首页总数\",\"首页统计\"],\"classname\":\"weixiupingjia\",\"menu\":\"维修评价\",\"menuJump\":\"列表\",\"tableName\":\"weixiupingjia\"},{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"维修\"],\"appFrontIcon\":\"cuIcon-link\",\"buttons\":[\"查看\",\"删除\",\"维修\"],\"classname\":\"weixiufenpei\",\"menu\":\"维修分配\",\"menuJump\":\"列表\",\"tableName\":\"weixiufenpei\"}],\"fontClass\":\"icon-common32\",\"menu\":\"维修预约管理\",\"unicode\":\"&#xee66;\"}],\"frontMenu\":[{\"child\":[{\"appFrontIcon\":\"cuIcon-discover\",\"buttons\":[\"查看\"],\"classname\":\"shoufeibiaozhun\",\"menu\":\"收费标准\",\"menuJump\":\"列表\",\"tableName\":\"shoufeibiaozhun\"}],\"menu\":\"收费标准管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-goods\",\"buttons\":[\"查看\"],\"classname\":\"news\",\"menu\":\"汽车资讯\",\"menuJump\":\"列表\",\"tableName\":\"news\"}],\"menu\":\"新闻资讯管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-list\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"classname\":\"chat\",\"menu\":\"客服聊天\",\"menuJump\":\"列表\",\"tableName\":\"chat\"}],\"menu\":\"客服聊天管理\"}],\"hasBackLogin\":\"是\",\"hasBackRegister\":\"是\",\"hasFrontLogin\":\"否\",\"hasFrontRegister\":\"否\",\"pathName\":\"weixiuyuan\",\"roleName\":\"维修员\",\"tableName\":\"weixiuyuan\"}]');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news`
(
    `id`           bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `addtime`      timestamp                               NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `title`        varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标题',
    `introduction` longtext COLLATE utf8mb4_unicode_ci COMMENT '简介',
    `picture`      longtext COLLATE utf8mb4_unicode_ci     NOT NULL COMMENT '图片',
    `content`      longtext COLLATE utf8mb4_unicode_ci     NOT NULL COMMENT '内容',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='汽车资讯';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK
TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news`
VALUES (1, '2025-02-04 03:06:56', '余生，愿你活出自己的精彩',
        '曾几何时，为了让自己显得合群，选择去做自己不喜欢的事;为了讨好喜欢的人，一次次地委屈自己;甚至，为了陌生人的一个眼神，就陷入了深深的自我怀疑。',
        'file/newsPicture1.jpg',
        '可是，这样小心翼翼的你，一定很累吧。你以为照顾了所有人的想法，就能得到他们的喜欢;你以为逼着自己合群，就能真的合群。直到后来才发现，在日复一日对自己的为难中，你逐渐弄丢了真实的自己.\n殊不知，人生在世，最不值得的事情，就是在别人的眼光中，迷失自己。其实，正如世界上没有十全十美的人，你也同样无法做到让每个人满意。\n世上没有不快乐的人，只有不肯让自己快乐的心。有一句话说:\n如果一段关系让你变得卑微，你可以选择抽身离去;如果一个人总是让你悲伤哭泣，你要学会放手。\n始终相信，每个人最初的样子，都是最美好的。真正喜欢你的人，会喜欢你原来的样子:真正爱你的从来不需要你的委曲求全。\n后半生，请把身上的枷锁，全部解除。去做喜欢的事，去听自己内心的声音。你会发现，这世上没有什么事情比活出自己更加幸福。\n要相信，真实的自己亦是一道风景线。你若盛开，清风自来。愿你此生尽兴，不负韶华，'),
       (2, '2025-02-04 03:06:56', '岁月无常，好好珍惜',
        '常听到这样的话，如果一切可以重新开始，我一定改掉任性，学会坚持，如果有下辈子，我一定好好珍惜，不会再弄丢原本属于自己的幸福。',
        'file/newsPicture2.jpg',
        '然而，世上有很多事情没有再来一次的机会，一旦错失就意味着无法弥补，正如人与人之间，有的只是一世的缘分，一旦转身，就意味着再无可能。\n这一生只活一次，有些人也只爱一回。\n所以，在拥有时就好好把握，对于来世，可以适当憧憬，但不要一昧去幻想，活着，唯有珍惜身边做好眼前事，才能让明天少一些遗憾。人，\n既然有幸来到这个世上，那就要努力把这辈子活好。岁月其实远没有想象中的那么漫长，若是能爱就好好爱，别让说好相伴一生的人，中途散走;若是当下能相知相守，就别去等待虚无缥缈的未来。\n就像一位网友留言说的:我从来不去期待下辈子，我要的只有今生，世事无常，来世是怎样的光景，谁都无法预知。对我来说，在有限的时光里，善待爱自己及自己爱的人，用心珍惜相聚的每一时刻，努力过好当下就足够了。\n时光匆匆，韶华似水，每个人都只有这短暂的一生。\n有些事，如果喜欢就坚定努力的去做，有些人，如果爱就真诚用心地去爱，别幻想着重来，别总是寄希望于下辈子。\n下辈子，彼此也许再也不会遇见，就算遇见了，谁还会记得谁，今生相互承诺的两个人，来生也许相见不相识。\n想起之前看过的一句话:人生没有假如，我们没有来世，下辈子，你我也许只是大千世界里互不相识的两个陌生人。\n的确，生命只有一次，今生有幸相遇的人，下辈子不一定能遇见，就算能遇见，谁能把谁陪伴，谁又是谁的谁?\n余生不长，趁着岁月未老，好好珍惜这辈子的缘分吧，别等到失去了才悔不该当初。'),
       (3, '2025-02-04 03:06:56', '与其背着烦恼活，不如带着美好过',
        '一直觉得，感情里，无疾而终并不可怕，可怕的是结束后，你还抱着回忆不肯放;岁月中，失去并不可怕，可怕的是失去后，你还揪着曾经不肯忘。\n有些事，明知道不应该继续，却始终没有转身的勇气;有些人，明知道已经成为过去，却还是舍不得放手;有时候，明知道纠缠于往事旧人只会徒增伤悲，却仍然执着的去回忆，去留恋。',
        'file/newsPicture3.jpg',
        '人生短短几十年，为什么要蹉跎浪费在无可挽回的失去上，为什么不酒脱一点，看开一点，活得轻松快乐一点。\n这世间，没有谁的人生是十全十美的，总要面对一些离别，总要经历一些失去，如果总对身边的一切执念太深，只会越活越累。\n时间不停向前，人也不可避免的要向前看。面对一些不如意、不顺心的事，该放的就放，该忘的就忘，别总把自己困在失败的悲伤中。\n生而为人，放不是无能，而是一种洒脱，忘更不是懦弱，而是一种智慧。\n在来去匆匆，聚散不定的现实里，放下不属于自己的感情，才能有新的开始，忘记心中的烦恼，才能收获愉快的心情。\n所以，有些离开的人，该放就放下吧，一直念念不忘，伤害的是自己，有些烦心事，该忘就忘了吧一直耿耿于怀，痛苦的是自己。\n-辈子本就不长，何必让自己活得那么累，过去的情就让它过去，别再留恋，想不通的事就算了，别再纠结。\n人生的旅途，总有些事让人烦，总有些情让人伤。只有学会忘记过往的不如意，忘记一些不必要的烦恼，以轻盈的身心重新出发，才不会被旧人旧事所累。\n记得，每个人心灵的空间都是有限的，当装多了纠结与伤感，就装不下自在与欢快了。要想日子过得简单轻松一点，就要懂得放下执念，忘掉痛苦，清除伤。'),
       (4, '2025-02-04 03:06:56', '理想很丰满，现实很骨感',
        '游戏里的你帅气无比，乘风御剑，通关杀敌无所不能，你满足于那其中的成就感，你满足于通关的畅快淋漓。',
        'file/newsPicture4.jpg',
        '年轻人，可那毕竟不是现实，理想很丰满，现实很骨感这不是玩笑，你不走出来，怎么会知\n你真的想等到某天喜欢上一个姑娘时，才去纠结咖啡钱电影钱你要如何与爸妈张口，才去苦恼为她买礼物你要怎样省吃俭用节衣缩食?\n你没有挥金如土的.魄力，没有殷实的家境，没有既定的光芒锦绣的前程，二十出头的年纪，你不努力，你想拿什么报答那个在你身边用最好的青春陪伴你的姑娘?你又拿什么报答含辛茹苦养育你这么多年的父母?\n生活不是游戏，不会给你那么多反复再来的机会，青春年少风华正茂，年轻人，你不努力，你想指望什么?\n年轻人，走出来奋斗吧!累也好苦也罢。如果你现在对自己各种放纵，你指望以后你用什么条件来放松?\n年轻人，你要努力赚钱，为了自己，也为了你爸妈。为了他们在以后逛商场的时候，可以给自己买东西像给你买东西一样毫不犹豫。为了他们可以在同老友谈起你时可以一脸安详，而不是想着，这个月，儿子交了房租还有钱吃饭么。我们这个年龄的人，已经像吸血鬼一样巴着父母活了二十多年了，还真的要继续吸着他们的血活下去么?\n年轻人，停止期望凡事简单容易。如果总是挑简单的事情做，那你永远成不了大器，生活总会在始料不及时考验你，所以你必须挑战困难，保持坚强，世上任何值得拥有的东西都需要付诸努力，勤奋与自律，倘若自甘平庸，那你就会变得庸碌无为。\n年轻人，与我们一起，挑战一下自己，拥抱一下梦想。你想要的生活，跳起来，一定够得到!'),
       (5, '2025-02-04 03:06:56', '理想是一种精神上的追求',
        '如果前方是一片黑暗，理想是否会黯淡?黑暗终究不能限制理想的步伐，只是需要时间。', 'file/newsPicture5.jpg',
        '是否会撕裂黑暗的结界?给理想一点时间，是否会完成理想的目标?太多时候，黑给黑暗一缕曙光，暗限制了理想的脚步，时间成了撕裂黑暗的曙光。社会的压抑，未知的迷茫，甚至是事实的打击，都成了所谓的黑暗。\n理想应该是一种精神上的追求，一种我们内心深处的渴望。也许理想的种类太多，不一样的人也有不一样的理想。但唯一的共同点就是我们在追求，追求自己精神上亦或是心中的目标。但总是不尽人意，一来存在太多不确定因素，二来时间还不够。理想并不是一而就的空话。\n想过放弃，因为理想与现实的差距。但又不想放弃，因为理想是精神上的追求心中的渴望。纠结了太多，却是否想过在纠结的时候，已经选择了错过。被刻意选择的错过是什么?是路过。我们在不经意间路过了多少理想，只是因为纠结。如果坚定自己的理想，用时间去行动，是否会少几次刻意的错过:-次，与一位朋友谈到如何乐观，然后追求理想。朋友想了一会儿，给我的回答是正能量与时间。他说，想要乐观就要不断给自己正能量。事物有阴阳两面，如果阳代表乐观，那在我们看待一件事时要看阳面千万别看阴面。这样自己不会消极，某种程度上来说就是一种正能量。想要追求理想，务必要花费时间。正如没有风平浪静的大海，想要追求理想，要时间。给理想一点时间，让自己去追求，不顾切的追求。\n点点滴滴的小事构成了我们的生活，点点滴滴的努力给理想铺平了路。每一次小成功都为理想迈进了一步。每一次失败，都告诉我们一些教训，反方向来说为下一次成功提供了经验。不要觉得失败是可怕的，长远来看，正是失败才有了成功。\n时间在流逝。如果安于现状，就会乐不思。理想需要时间不代表我们可以挥霍，我们能做的是珍惜时间，去为理想拼搏。\n间接意义上讲，理想的时间是我们的努力。\n如果正在路上，一直任性向前走，忘记时间不回头。'),
       (6, '2025-02-04 03:06:56', '人生如梦，梦想是帆',
        '人生如梦，梦想是帆，每个人都有一个只属于自己的梦，但我们同属一个国家，所以每个人的梦又与国家的兴衰荣辱紧密相连。先哲顾炎武曾说:天下兴亡，匹夫有责。只有国家好，大家才能好。',
        'file/newsPicture6.jpg',
        '我依然清楚的记得:\n当甲午战争战败，日寇无礼踏破中国的门户;当八国联军侵入北京，无情掠夺中国的财产:当七七事变发生，中国的老人、妇孺被残忍杀害的时候，我在想那时中国的梦是怎样的!\n我虽不曾亲眼看到，但那却是铁一般的事实。因为从老人们那深邃的眼神中可以感到无尽的愤懑;从他们干瘪的脸颊可以看到深情的泪水，从他们嘹亮的军歌中可以想到那奋勇杀敌时的豪迈;从他们激昂话语中听到那誓要捍卫家园振兴中华的誓言。作为新一代青年的我们难道不应该树立远大的理想，付之以踏实的行动，去继承先辈们的使命。去实现中华民族的伟大崛起和复兴吗?\n有梦才能使中国繁荣!\n在改革开放以来中国取得了一系列的可以载入中国史册的成就。香港、澳门的回归，经济特区的建立，使中国成为发展国家中的经济大国，科技先进国和军事强国。当中国成功举办奥运的时候，当神九飞天的时候，当蛟龙入海的时候，当航母下水的时候，当莫言荣获诺贝尔文学奖的时候。我相信每个人都感觉到了无比的自豪。但是现在的中国与其他发达国家还有很大差距。作为新一代的我们，难道不应该志存高远吗?\n我想有的人会说，我们的力量是有限的。的确个人的力量很渺小，但是中国梦就是因一个个微不足道的个人的梦一直汇集、汇集，然后凝聚成的一个巨大的梦。冯至在《十四行诗》中写道，我们准备着，深深领受，那些意想不到的奇迹，在漫长的岁月里，忽然有彗星的出现，狂风乍起。\n梦想是美丽的，它是美的期望;梦想是阳光的，它使人由浮躁走向踏实;梦想是充满力量的，它可以激发人身体里无限的潜能。我们期盼的是国泰民安、经济发展、政治清明、文化繁荣、社会和谐、生态良\n好、公平正义。这才是中国人伟大的梦'),
       (7, '2025-02-04 03:06:56', '若月亮没来-王宇宙Leto，乔浚丞',
        '《若月亮没来(若是月亮还没来)》是王宇宙Leto，乔浚丞演唱的歌曲，于2024年1月22日上线发行。', 'file/newsPicture7.jpg',
        '风吹过山 船靠了岸  风光呀 一点点看  我走向北 你去往南\n故事呀 一篇篇翻  好烦 又加班到很晚  你搭上空荡的 地铁已是末班\n好烦 很爱却要分开  恋爱谈不明白  好烦 接近理想好难 却又还很不甘\n如何拥抱平淡  如果 最难得到圆满  不如选择坦然 若是月亮还没来\n路灯也可照窗台  照着白色的山茶花微微开  若是晨风还没来\n晚风也可吹入怀  吹着那一地树影温柔摇摆  你总以为你不够好\n不够苗条和美貌  可是完美谁能达到  做你自己就很好\n烦恼烦恼拥有太少  没有房车没有钞票  可爱你的人永远会 \n把你当做心尖珍宝  我也懂大多数的时候  你只想逃离这世界\n我也懂太多的情绪在  一个人失眠的深夜 你可以是悲伤或者埋怨\n但请不要放弃明天  这一直灰暗的世界  我想看见你的笑脸\n若是月亮还没来  路灯也可照窗台  照着白色的山茶花微微开\n若是晨风还没来  晚风也可吹入怀  吹着那一地树影温柔摇摆\n若是月亮还没来  路灯也可照窗台  照着白色的山茶花微微开\n若是晨风还没来  晚风也可吹入怀  吹着那一地树影温柔摇摆\n李哲今年1月份创作了《若月亮没来》这首歌。随着歌曲的热度不断上升，约他写歌的人越来越多，他的工作变得更加繁忙。\n近年来，李哲凭借对音乐的热爱和不懈的努力，创作了几百首音乐作品，其中不乏广为人知的佳作，例如王栎鑫的《一个人》、何赛飞与叶炫清在央视演唱的《木兰诗》等歌曲，都是由李哲作曲。\n如今，李哲的音乐才华和努力得到了业界的广泛认可，他的音乐作品多次登上各大音乐平台的热歌榜，成为备受瞩目的新生代音乐人。现在，走在街头、坐在车里，经常会听到自己的作品。看到自己的音乐作品受到如此广泛的喜爱和认可，我感到非常有成就感。李哲笑着说，他会努力创作更多优秀音乐作品，为家乡争光。'),
       (8, '2025-02-04 03:06:56', '-米阳光传递一份温暖',
        '黑暗中跌倒，坚强里苦笑。只是因为青春还在，所以梦想一直在路上。当年华未曾老去，青春没有散场，留给幽暗的岁月，还有几分值得珍藏?孤独无助时、伤心难过时总爱恣意挥霍愤怒。伤了、痛了原本以为就都结束了;可是心里还不甘愿放弃，就只为一个理由，有梦想的人永不孤单。',
        'file/newsPicture8.jpg',
        '放进去了的青春，走不出来的悲伤却总是给年少时的我们留下太多无法割舍的情怀。记录岁月的足迹，聆听时光的故事。然轻吟浅唱出，青春嘉年华。\n故事里总会有，那些太多感慨于时间的无情，太多对往事的追忆，太多的太多，而今刻在了心里也停泻在了流年里。一段无法抹去的回忆，也只不过是一场烟火燃放的瞬间，却也一辈子在脑海里兜兜转转。很是怀念那些相遇的日子，邂逅了幸福也留在了时间轨迹里。时而想起，那些曾肩并肩奋斗的日子，那些写满感动与快乐的岁月。\n如今，我们似乎渐行渐远，彼此奋斗着青春的轮回。渐渐的，我们都长大了，时间改变了我们时刻分享彼此快乐与不快乐的习惯，青春的渐逝，岁月的更迭让我们变得都不再联系，身边的朋友也越来越少;那些欢笑，那些幸福的流年也随着我们的陌生而变得更加奢侈。也许多年以后，我们都有了自己的朋友，有了自己关心的人。那时，我们再细数那些癫狂在你生命里一辈子的记忆故事，蓦然发现一切都停留在了回忆里。'),
       (9, '2025-02-04 03:06:56', '自己的路自己走，自己的心自己懂',
        '岛上书店》中有句话:每个人的生命里，都有最艰难的那一年，将人生变得美好而辽阔。\n你有没有经历过那么一年，在走过的岁月中跋涉得异常艰难困苦，却仍无法灭前行的勇气。哪怕所有人都极力劝阻，也要不甘心地试一试;哪怕前方已没有道路，却还在坚定前行;哪怕再看不到任何希望，也要竭尽全力地为自己争取一个机会。',
        'file/newsPicture9.jpg',
        '你开始不动声色的扮演着一个大人，经历着生活日复一日的打。\n每天醒在天还没亮的五六点，挤过早高峰的地下铁，面对成山的工作，加班到深夜倒下就睡更成为了日常，还要应付各色的人际关系，逐渐开始接受努力也不一定有回报的道理。\n这段日子也许很长，但你没有放弃对生活的信心，始终相信人生总会变得一帆风顺，更坚信每件事的最后都会有一个好的结局，如果不是，说明还没到最后。\n于是你树立新的目标，让这一年的奔波更有方向。\n虽然永远无法预料明天是晴是雨，也无法预知你在乎的人是否还在身边，你一直以来的坚持究竟能换来什么。\n但你能决定的是，今天有没有备好雨伞，有没有好好爱人以及是否为自己追求的理想拼尽全力。\n永远不要只看见前方路途遥远而忘了从前的自己坚持了多久才走到了这里，\n今天拼尽全力虽然艰辛万分，在未来都将成为落在你身上的礼物。'),
       (10, '2025-02-04 03:06:56', '愿你有明天可奔赴，有过往可回头',
        '此去经年，用一张离家的车票，换一段有故事可说的人生。\n大概就是那时候怀揣着梦想，背上了行囊，一腔热血决定远行的你。独自拎着一只行李箱，背着双肩包在深夜抵达一个陌生的城市，站在人潮涌动的车站出口，望着宽敞公路上车水马龙的喧嚣，城市里亮如白昼的繁华。',
        'file/newsPicture10.jpg',
        '这世界上的人们都活的匆匆忙忙，每个人看起来都很焦虑，每个人都有自己的苦楚，却往往找不到人可以诉说。也许你的倾诉，对别人来说是一种打扰，而且别人没经历过你的经历，所以无法体会你的心情。我们总是在心情不好的时候拿着手机，翻翻通讯录，然后再默默放下手机，压住心中那股想要找人说说话的想法。\n等到低落的情绪慢慢有些好转，才开始明白，人这一生，无论是什么样的路，都是自己的选择，冲动也好，深思熟虑也罢，自己选的路，不管多难，都要自己走下去。心中的感受，不管是复杂还是简单，都只能自己来懂，别人帮不了你，也安慰不了你，顶多给你一些无济于事的劝告，最后还得靠自己想开。你选的幸福，你自己享受;你选的眼泪，你自己来流，生活就是如此，自己的路，自己走;自己的心，自己懂。');
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `quxiaoyuyue`
--

DROP TABLE IF EXISTS `quxiaoyuyue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quxiaoyuyue`
(
    `id`              bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `addtime`         timestamp NOT NULL                      DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `baoxiubianhao`   varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '报修编号',
    `chepaihao`       varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '车牌号',
    `chexing`         varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '车型',
    `cheliangpinpai`  varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '车辆品牌',
    `cheliangxinghao` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '车辆型号',
    `yonghuzhanghao`  varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户账号',
    `yonghuxingming`  varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户姓名',
    `guzhangleixing`  varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '故障类型',
    `baoxiubiaoti`    varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '报修标题',
    `quxiaoyuanyin`   varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '取消原因',
    `quxiaoshijian`   datetime                                DEFAULT NULL COMMENT '取消时间',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='取消预约';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quxiaoyuyue`
--

LOCK
TABLES `quxiaoyuyue` WRITE;
/*!40000 ALTER TABLE `quxiaoyuyue` DISABLE KEYS */;
INSERT INTO `quxiaoyuyue`
VALUES (1, '2025-02-04 03:06:56', '报修编号1', '车牌号1', '车型1', '车辆品牌1', '车辆型号1', '用户账号1', '用户姓名1',
        '故障类型1', '报修标题1', '取消原因1', '2025-02-04 11:06:56'),
       (2, '2025-02-04 03:06:56', '报修编号2', '车牌号2', '车型2', '车辆品牌2', '车辆型号2', '用户账号2', '用户姓名2',
        '故障类型2', '报修标题2', '取消原因2', '2025-02-04 11:06:56'),
       (3, '2025-02-04 03:06:56', '报修编号3', '车牌号3', '车型3', '车辆品牌3', '车辆型号3', '用户账号3', '用户姓名3',
        '故障类型3', '报修标题3', '取消原因3', '2025-02-04 11:06:56'),
       (4, '2025-02-04 03:06:56', '报修编号4', '车牌号4', '车型4', '车辆品牌4', '车辆型号4', '用户账号4', '用户姓名4',
        '故障类型4', '报修标题4', '取消原因4', '2025-02-04 11:06:56'),
       (5, '2025-02-04 03:06:56', '报修编号5', '车牌号5', '车型5', '车辆品牌5', '车辆型号5', '用户账号5', '用户姓名5',
        '故障类型5', '报修标题5', '取消原因5', '2025-02-04 11:06:56'),
       (6, '2025-02-04 03:06:56', '报修编号6', '车牌号6', '车型6', '车辆品牌6', '车辆型号6', '用户账号6', '用户姓名6',
        '故障类型6', '报修标题6', '取消原因6', '2025-02-04 11:06:56'),
       (7, '2025-02-04 03:06:56', '报修编号7', '车牌号7', '车型7', '车辆品牌7', '车辆型号7', '用户账号7', '用户姓名7',
        '故障类型7', '报修标题7', '取消原因7', '2025-02-04 11:06:56'),
       (8, '2025-02-04 03:06:56', '报修编号8', '车牌号8', '车型8', '车辆品牌8', '车辆型号8', '用户账号8', '用户姓名8',
        '故障类型8', '报修标题8', '取消原因8', '2025-02-04 11:06:56'),
       (9, '2025-02-04 03:06:56', '报修编号9', '车牌号9', '车型9', '车辆品牌9', '车辆型号9', '用户账号9', '用户姓名9',
        '故障类型9', '报修标题9', '取消原因9', '2025-02-04 11:06:56'),
       (10, '2025-02-04 03:06:56', '报修编号10', '车牌号10', '车型10', '车辆品牌10', '车辆型号10', '用户账号10',
        '用户姓名10', '故障类型10', '报修标题10', '取消原因10', '2025-02-04 11:06:56');
/*!40000 ALTER TABLE `quxiaoyuyue` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `shoufeibiaozhun`
--

DROP TABLE IF EXISTS `shoufeibiaozhun`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoufeibiaozhun`
(
    `id`               bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `addtime`          timestamp                               NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `shoufeixiangmu`   varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '收费项目',
    `fengmian`         longtext COLLATE utf8mb4_unicode_ci COMMENT '封面',
    `zhixingbiaozhun`  longtext COLLATE utf8mb4_unicode_ci COMMENT '执行标准',
    `shoufeixiangqing` longtext COLLATE utf8mb4_unicode_ci COMMENT '收费详情',
    `faburiqi`         date                                             DEFAULT NULL COMMENT '发布日期',
    `storeup_number`   int(11) DEFAULT NULL COMMENT '收藏数',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='收费标准';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoufeibiaozhun`
--

LOCK
TABLES `shoufeibiaozhun` WRITE;
/*!40000 ALTER TABLE `shoufeibiaozhun` DISABLE KEYS */;
INSERT INTO `shoufeibiaozhun`
VALUES (1, '2025-02-04 03:06:56', '收费项目1',
        'file/shoufeibiaozhunFengmian1.jpg,file/shoufeibiaozhunFengmian2.jpg,file/shoufeibiaozhunFengmian3.jpg',
        '执行标准1', '收费详情1', '2025-02-04', 1),
       (2, '2025-02-04 03:06:56', '收费项目2',
        'file/shoufeibiaozhunFengmian2.jpg,file/shoufeibiaozhunFengmian3.jpg,file/shoufeibiaozhunFengmian4.jpg',
        '执行标准2', '收费详情2', '2025-02-04', 2),
       (3, '2025-02-04 03:06:56', '收费项目3',
        'file/shoufeibiaozhunFengmian3.jpg,file/shoufeibiaozhunFengmian4.jpg,file/shoufeibiaozhunFengmian5.jpg',
        '执行标准3', '收费详情3', '2025-02-04', 3),
       (4, '2025-02-04 03:06:56', '收费项目4',
        'file/shoufeibiaozhunFengmian4.jpg,file/shoufeibiaozhunFengmian5.jpg,file/shoufeibiaozhunFengmian6.jpg',
        '执行标准4', '收费详情4', '2025-02-04', 4),
       (5, '2025-02-04 03:06:56', '收费项目5',
        'file/shoufeibiaozhunFengmian5.jpg,file/shoufeibiaozhunFengmian6.jpg,file/shoufeibiaozhunFengmian7.jpg',
        '执行标准5', '收费详情5', '2025-02-04', 5),
       (6, '2025-02-04 03:06:56', '收费项目6',
        'file/shoufeibiaozhunFengmian6.jpg,file/shoufeibiaozhunFengmian7.jpg,file/shoufeibiaozhunFengmian8.jpg',
        '执行标准6', '收费详情6', '2025-02-04', 6),
       (7, '2025-02-04 03:06:56', '收费项目7',
        'file/shoufeibiaozhunFengmian7.jpg,file/shoufeibiaozhunFengmian8.jpg,file/shoufeibiaozhunFengmian9.jpg',
        '执行标准7', '收费详情7', '2025-02-04', 7),
       (8, '2025-02-04 03:06:56', '收费项目8',
        'file/shoufeibiaozhunFengmian8.jpg,file/shoufeibiaozhunFengmian9.jpg,file/shoufeibiaozhunFengmian10.jpg',
        '执行标准8', '收费详情8', '2025-02-04', 8),
       (9, '2025-02-04 03:06:56', '收费项目9',
        'file/shoufeibiaozhunFengmian9.jpg,file/shoufeibiaozhunFengmian10.jpg,file/shoufeibiaozhunFengmian11.jpg',
        '执行标准9', '收费详情9', '2025-02-04', 9),
       (10, '2025-02-04 03:06:56', '收费项目10',
        'file/shoufeibiaozhunFengmian10.jpg,file/shoufeibiaozhunFengmian11.jpg,file/shoufeibiaozhunFengmian12.jpg',
        '执行标准10', '收费详情10', '2025-02-04', 10);
/*!40000 ALTER TABLE `shoufeibiaozhun` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `storeup`
--

DROP TABLE IF EXISTS `storeup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storeup`
(
    `id`        bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `addtime`   timestamp                               NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `refid`     bigint(20) DEFAULT NULL COMMENT 'refid',
    `tablename` varchar(200) COLLATE utf8mb4_unicode_ci          DEFAULT NULL COMMENT '表名',
    `name`      varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
    `picture`   longtext COLLATE utf8mb4_unicode_ci COMMENT '图片',
    `type`      varchar(200) COLLATE utf8mb4_unicode_ci          DEFAULT '1' COMMENT '类型(1:收藏,21:赞,22:踩,31:竞拍参与,41:关注)',
    `inteltype` varchar(200) COLLATE utf8mb4_unicode_ci          DEFAULT NULL COMMENT '推荐类型',
    `remark`    varchar(200) COLLATE utf8mb4_unicode_ci          DEFAULT NULL COMMENT '备注',
    `userid`    bigint(20) NOT NULL COMMENT '用户id',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='我的收藏';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storeup`
--

LOCK
TABLES `storeup` WRITE;
/*!40000 ALTER TABLE `storeup` DISABLE KEYS */;
/*!40000 ALTER TABLE `storeup` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `system_notice`
--

DROP TABLE IF EXISTS `system_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_notice`
(
    `id`      bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `content` longtext COLLATE utf8mb4_unicode_ci COMMENT '公告内容',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='系统公告';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_notice`
--

LOCK
TABLES `system_notice` WRITE;
/*!40000 ALTER TABLE `system_notice` DISABLE KEYS */;
INSERT INTO `system_notice`
VALUES (1, '2025-02-04 03:06:56', '公告信息...');
/*!40000 ALTER TABLE `system_notice` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `token`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `userid`        bigint(20) NOT NULL COMMENT '用户id',
    `username`      varchar(100) NOT NULL COMMENT '用户名',
    `tablename`     varchar(100)          DEFAULT NULL COMMENT '表名',
    `role`          varchar(100)          DEFAULT NULL COMMENT '角色',
    `token`         varchar(200) NOT NULL COMMENT '密码',
    `addtime`       timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
    `expiratedtime` timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='token表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK
TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
/*!40000 ALTER TABLE `token` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users`
(
    `id`       bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `addtime`  timestamp                               NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `username` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
    `password` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
    `role`     varchar(200) COLLATE utf8mb4_unicode_ci          DEFAULT NULL COMMENT '角色',
    `touxiang` longtext COLLATE utf8mb4_unicode_ci COMMENT '头像',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='管理员';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK
TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users`
VALUES (1, '2025-02-04 03:06:56', 'admin', 'admin', '管理员', NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `weixiufenpei`
--

DROP TABLE IF EXISTS `weixiufenpei`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weixiufenpei`
(
    `id`              bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `addtime`         timestamp NOT NULL                      DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `baoxiubianhao`   varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '报修编号',
    `chepaihao`       varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '车牌号',
    `chexing`         varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '车型',
    `cheliangpinpai`  varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '车辆品牌',
    `cheliangxinghao` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '车辆型号',
    `yonghuzhanghao`  varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户账号',
    `yonghuxingming`  varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户姓名',
    `guzhangleixing`  varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '故障类型',
    `baoxiubiaoti`    varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '报修标题',
    `baoxiuyuanyin`   longtext COLLATE utf8mb4_unicode_ci COMMENT '报修原因',
    `fenpeishijian`   datetime                                DEFAULT NULL COMMENT '分配时间',
    `weixiuzhanghao`  varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '维修账号',
    `weixiuxingming`  varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '维修姓名',
    `weixiuzhuangtai` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '维修状态',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='维修分配';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weixiufenpei`
--

LOCK
TABLES `weixiufenpei` WRITE;
/*!40000 ALTER TABLE `weixiufenpei` DISABLE KEYS */;
INSERT INTO `weixiufenpei`
VALUES (1, '2025-02-04 03:06:56', '报修编号1', '车牌号1', '车型1', '车辆品牌1', '车辆型号1', '用户账号1', '用户姓名1',
        '故障类型1', '报修标题1', '报修原因1', '2025-02-04 11:06:56', '维修账号1', '维修姓名1', '已维修'),
       (2, '2025-02-04 03:06:56', '报修编号2', '车牌号2', '车型2', '车辆品牌2', '车辆型号2', '用户账号2', '用户姓名2',
        '故障类型2', '报修标题2', '报修原因2', '2025-02-04 11:06:56', '维修账号2', '维修姓名2', '已维修'),
       (3, '2025-02-04 03:06:56', '报修编号3', '车牌号3', '车型3', '车辆品牌3', '车辆型号3', '用户账号3', '用户姓名3',
        '故障类型3', '报修标题3', '报修原因3', '2025-02-04 11:06:56', '维修账号3', '维修姓名3', '已维修'),
       (4, '2025-02-04 03:06:56', '报修编号4', '车牌号4', '车型4', '车辆品牌4', '车辆型号4', '用户账号4', '用户姓名4',
        '故障类型4', '报修标题4', '报修原因4', '2025-02-04 11:06:56', '维修账号4', '维修姓名4', '已维修'),
       (5, '2025-02-04 03:06:56', '报修编号5', '车牌号5', '车型5', '车辆品牌5', '车辆型号5', '用户账号5', '用户姓名5',
        '故障类型5', '报修标题5', '报修原因5', '2025-02-04 11:06:56', '维修账号5', '维修姓名5', '已维修'),
       (6, '2025-02-04 03:06:56', '报修编号6', '车牌号6', '车型6', '车辆品牌6', '车辆型号6', '用户账号6', '用户姓名6',
        '故障类型6', '报修标题6', '报修原因6', '2025-02-04 11:06:56', '维修账号6', '维修姓名6', '已维修'),
       (7, '2025-02-04 03:06:56', '报修编号7', '车牌号7', '车型7', '车辆品牌7', '车辆型号7', '用户账号7', '用户姓名7',
        '故障类型7', '报修标题7', '报修原因7', '2025-02-04 11:06:56', '维修账号7', '维修姓名7', '已维修'),
       (8, '2025-02-04 03:06:56', '报修编号8', '车牌号8', '车型8', '车辆品牌8', '车辆型号8', '用户账号8', '用户姓名8',
        '故障类型8', '报修标题8', '报修原因8', '2025-02-04 11:06:56', '维修账号8', '维修姓名8', '已维修'),
       (9, '2025-02-04 03:06:56', '报修编号9', '车牌号9', '车型9', '车辆品牌9', '车辆型号9', '用户账号9', '用户姓名9',
        '故障类型9', '报修标题9', '报修原因9', '2025-02-04 11:06:56', '维修账号9', '维修姓名9', '已维修'),
       (10, '2025-02-04 03:06:56', '报修编号10', '车牌号10', '车型10', '车辆品牌10', '车辆型号10', '用户账号10',
        '用户姓名10', '故障类型10', '报修标题10', '报修原因10', '2025-02-04 11:06:56', '维修账号10', '维修姓名10',
        '已维修');
/*!40000 ALTER TABLE `weixiufenpei` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `weixiupingjia`
--

DROP TABLE IF EXISTS `weixiupingjia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weixiupingjia`
(
    `id`              bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `addtime`         timestamp NOT NULL                      DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `chepaihao`       varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '车牌号',
    `chexing`         varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '车型',
    `cheliangpinpai`  varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '车辆品牌',
    `cheliangxinghao` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '车辆型号',
    `yonghuzhanghao`  varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户账号',
    `yonghuxingming`  varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户姓名',
    `baoxiubiaoti`    varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '报修标题',
    `weixiuzhanghao`  varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '维修账号',
    `weixiuxingming`  varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '维修姓名',
    `pingfen`         varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '评分',
    `pingyu`          longtext COLLATE utf8mb4_unicode_ci COMMENT '评语',
    `pingjiashijian`  datetime                                DEFAULT NULL COMMENT '评价时间',
    `crossuserid`     bigint(20) DEFAULT NULL COMMENT '跨表用户id',
    `crossrefid`      bigint(20) DEFAULT NULL COMMENT '跨表主键id',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='维修评价';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weixiupingjia`
--

LOCK
TABLES `weixiupingjia` WRITE;
/*!40000 ALTER TABLE `weixiupingjia` DISABLE KEYS */;
INSERT INTO `weixiupingjia`
VALUES (1, '2025-02-04 03:06:55', '车牌号1', '车型1', '车辆品牌1', '车辆型号1', '用户账号1', '用户姓名1', '报修标题1',
        '维修账号1', '维修姓名1', '1', '评语1', '2025-02-04 11:06:55', 1, 1),
       (2, '2025-02-04 03:06:55', '车牌号2', '车型2', '车辆品牌2', '车辆型号2', '用户账号2', '用户姓名2', '报修标题2',
        '维修账号2', '维修姓名2', '1', '评语2', '2025-02-04 11:06:55', 2, 2),
       (3, '2025-02-04 03:06:55', '车牌号3', '车型3', '车辆品牌3', '车辆型号3', '用户账号3', '用户姓名3', '报修标题3',
        '维修账号3', '维修姓名3', '1', '评语3', '2025-02-04 11:06:55', 3, 3),
       (4, '2025-02-04 03:06:55', '车牌号4', '车型4', '车辆品牌4', '车辆型号4', '用户账号4', '用户姓名4', '报修标题4',
        '维修账号4', '维修姓名4', '1', '评语4', '2025-02-04 11:06:55', 4, 4),
       (5, '2025-02-04 03:06:55', '车牌号5', '车型5', '车辆品牌5', '车辆型号5', '用户账号5', '用户姓名5', '报修标题5',
        '维修账号5', '维修姓名5', '1', '评语5', '2025-02-04 11:06:55', 5, 5),
       (6, '2025-02-04 03:06:55', '车牌号6', '车型6', '车辆品牌6', '车辆型号6', '用户账号6', '用户姓名6', '报修标题6',
        '维修账号6', '维修姓名6', '1', '评语6', '2025-02-04 11:06:55', 6, 6),
       (7, '2025-02-04 03:06:55', '车牌号7', '车型7', '车辆品牌7', '车辆型号7', '用户账号7', '用户姓名7', '报修标题7',
        '维修账号7', '维修姓名7', '1', '评语7', '2025-02-04 11:06:55', 7, 7),
       (8, '2025-02-04 03:06:55', '车牌号8', '车型8', '车辆品牌8', '车辆型号8', '用户账号8', '用户姓名8', '报修标题8',
        '维修账号8', '维修姓名8', '1', '评语8', '2025-02-04 11:06:55', 8, 8),
       (9, '2025-02-04 03:06:55', '车牌号9', '车型9', '车辆品牌9', '车辆型号9', '用户账号9', '用户姓名9', '报修标题9',
        '维修账号9', '维修姓名9', '1', '评语9', '2025-02-04 11:06:55', 9, 9),
       (10, '2025-02-04 03:06:55', '车牌号10', '车型10', '车辆品牌10', '车辆型号10', '用户账号10', '用户姓名10',
        '报修标题10', '维修账号10', '维修姓名10', '1', '评语10', '2025-02-04 11:06:55', 10, 10);
/*!40000 ALTER TABLE `weixiupingjia` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `weixiuxinxi`
--

DROP TABLE IF EXISTS `weixiuxinxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weixiuxinxi`
(
    `id`              bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `addtime`         timestamp NOT NULL                      DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `chepaihao`       varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '车牌号',
    `chexing`         varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '车型',
    `cheliangpinpai`  varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '车辆品牌',
    `cheliangxinghao` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '车辆型号',
    `yonghuzhanghao`  varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户账号',
    `yonghuxingming`  varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户姓名',
    `baoxiubiaoti`    varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '报修标题',
    `weixiuzhanghao`  varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '维修账号',
    `weixiuxingming`  varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '维修姓名',
    `ispay`           varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否支付',
    `guzhangweizhi`   varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '故障位置',
    `guzhangyuanyin`  varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '故障原因',
    `weixiufeiyong`   double                                  DEFAULT NULL COMMENT '维修费用',
    `weixiuneirong`   longtext COLLATE utf8mb4_unicode_ci COMMENT '维修内容',
    `jianchabaogao`   longtext COLLATE utf8mb4_unicode_ci COMMENT '检查报告',
    `jianyixinxi`     varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '建议信息',
    `weixiushijian`   datetime                                DEFAULT NULL COMMENT '维修时间',
    `weixiucishu`     int(11) DEFAULT NULL COMMENT '维修次数',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='维修信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weixiuxinxi`
--

LOCK
TABLES `weixiuxinxi` WRITE;
/*!40000 ALTER TABLE `weixiuxinxi` DISABLE KEYS */;
INSERT INTO `weixiuxinxi`
VALUES (1, '2025-02-04 03:06:55', '车牌号1', '车型1', '车辆品牌1', '车辆型号1', '用户账号1', '用户姓名1', '报修标题1',
        '维修账号1', '维修姓名1', '未支付', '故障位置1', '故障原因1', 1, '维修内容1', '', '建议信息1',
        '2025-02-04 11:06:55', 1),
       (2, '2025-02-04 03:06:55', '车牌号2', '车型2', '车辆品牌2', '车辆型号2', '用户账号2', '用户姓名2', '报修标题2',
        '维修账号2', '维修姓名2', '未支付', '故障位置2', '故障原因2', 2, '维修内容2', '', '建议信息2',
        '2025-02-04 11:06:55', 2),
       (3, '2025-02-04 03:06:55', '车牌号3', '车型3', '车辆品牌3', '车辆型号3', '用户账号3', '用户姓名3', '报修标题3',
        '维修账号3', '维修姓名3', '未支付', '故障位置3', '故障原因3', 3, '维修内容3', '', '建议信息3',
        '2025-02-04 11:06:55', 3),
       (4, '2025-02-04 03:06:55', '车牌号4', '车型4', '车辆品牌4', '车辆型号4', '用户账号4', '用户姓名4', '报修标题4',
        '维修账号4', '维修姓名4', '未支付', '故障位置4', '故障原因4', 4, '维修内容4', '', '建议信息4',
        '2025-02-04 11:06:55', 4),
       (5, '2025-02-04 03:06:55', '车牌号5', '车型5', '车辆品牌5', '车辆型号5', '用户账号5', '用户姓名5', '报修标题5',
        '维修账号5', '维修姓名5', '未支付', '故障位置5', '故障原因5', 5, '维修内容5', '', '建议信息5',
        '2025-02-04 11:06:55', 5),
       (6, '2025-02-04 03:06:55', '车牌号6', '车型6', '车辆品牌6', '车辆型号6', '用户账号6', '用户姓名6', '报修标题6',
        '维修账号6', '维修姓名6', '未支付', '故障位置6', '故障原因6', 6, '维修内容6', '', '建议信息6',
        '2025-02-04 11:06:55', 6),
       (7, '2025-02-04 03:06:55', '车牌号7', '车型7', '车辆品牌7', '车辆型号7', '用户账号7', '用户姓名7', '报修标题7',
        '维修账号7', '维修姓名7', '未支付', '故障位置7', '故障原因7', 7, '维修内容7', '', '建议信息7',
        '2025-02-04 11:06:55', 7),
       (8, '2025-02-04 03:06:55', '车牌号8', '车型8', '车辆品牌8', '车辆型号8', '用户账号8', '用户姓名8', '报修标题8',
        '维修账号8', '维修姓名8', '未支付', '故障位置8', '故障原因8', 8, '维修内容8', '', '建议信息8',
        '2025-02-04 11:06:55', 8),
       (9, '2025-02-04 03:06:55', '车牌号9', '车型9', '车辆品牌9', '车辆型号9', '用户账号9', '用户姓名9', '报修标题9',
        '维修账号9', '维修姓名9', '未支付', '故障位置9', '故障原因9', 9, '维修内容9', '', '建议信息9',
        '2025-02-04 11:06:55', 9),
       (10, '2025-02-04 03:06:55', '车牌号10', '车型10', '车辆品牌10', '车辆型号10', '用户账号10', '用户姓名10',
        '报修标题10', '维修账号10', '维修姓名10', '未支付', '故障位置10', '故障原因10', 10, '维修内容10', '',
        '建议信息10', '2025-02-04 11:06:55', 10);
/*!40000 ALTER TABLE `weixiuxinxi` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `weixiuyuan`
--

DROP TABLE IF EXISTS `weixiuyuan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weixiuyuan`
(
    `id`              bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `addtime`         timestamp                               NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `weixiuzhanghao`  varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '维修账号',
    `mima`            varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
    `weixiuxingming`  varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '维修姓名',
    `touxiang`        longtext COLLATE utf8mb4_unicode_ci COMMENT '头像',
    `xingbie`         varchar(200) COLLATE utf8mb4_unicode_ci          DEFAULT NULL COMMENT '性别',
    `lianxidianhua`   varchar(200) COLLATE utf8mb4_unicode_ci          DEFAULT NULL COMMENT '联系电话',
    `shenfenzhenghao` varchar(200) COLLATE utf8mb4_unicode_ci          DEFAULT NULL COMMENT '身份证号',
    `sfsh`            varchar(200) COLLATE utf8mb4_unicode_ci          DEFAULT NULL COMMENT '是否审核',
    `shhf`            longtext COLLATE utf8mb4_unicode_ci COMMENT '回复内容',
    PRIMARY KEY (`id`),
    UNIQUE KEY `weixiuzhanghao` (`weixiuzhanghao`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='维修员';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weixiuyuan`
--

LOCK
TABLES `weixiuyuan` WRITE;
/*!40000 ALTER TABLE `weixiuyuan` DISABLE KEYS */;
INSERT INTO `weixiuyuan`
VALUES (91, '2025-02-04 03:06:55', '维修账号1', '123456', '维修姓名1', 'file/weixiuyuanTouxiang1.jpg', '男',
        '19819881111', '441622200101010001', '是', ''),
       (92, '2025-02-04 03:06:55', '维修账号2', '123456', '维修姓名2', 'file/weixiuyuanTouxiang2.jpg', '男',
        '19819881112', '441622200202020002', '是', ''),
       (93, '2025-02-04 03:06:55', '维修账号3', '123456', '维修姓名3', 'file/weixiuyuanTouxiang3.jpg', '男',
        '19819881113', '441622200303030003', '是', ''),
       (94, '2025-02-04 03:06:55', '维修账号4', '123456', '维修姓名4', 'file/weixiuyuanTouxiang4.jpg', '男',
        '19819881114', '441622200404040004', '是', ''),
       (95, '2025-02-04 03:06:55', '维修账号5', '123456', '维修姓名5', 'file/weixiuyuanTouxiang5.jpg', '男',
        '19819881115', '441622200505050005', '是', ''),
       (96, '2025-02-04 03:06:55', '维修账号6', '123456', '维修姓名6', 'file/weixiuyuanTouxiang6.jpg', '男',
        '19819881116', '441622200606060006', '是', ''),
       (97, '2025-02-04 03:06:55', '维修账号7', '123456', '维修姓名7', 'file/weixiuyuanTouxiang7.jpg', '男',
        '19819881117', '441622200707070007', '是', ''),
       (98, '2025-02-04 03:06:55', '维修账号8', '123456', '维修姓名8', 'file/weixiuyuanTouxiang8.jpg', '男',
        '19819881118', '441622200808080008', '是', ''),
       (99, '2025-02-04 03:06:55', '维修账号9', '123456', '维修姓名9', 'file/weixiuyuanTouxiang9.jpg', '男',
        '19819881119', '441622200909090009', '是', ''),
       (100, '2025-02-04 03:06:55', '维修账号10', '123456', '维修姓名10', 'file/weixiuyuanTouxiang10.jpg', '男',
        '198198811110', '4416222001001001000010', '是', '');
/*!40000 ALTER TABLE `weixiuyuan` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `weixiuyuyue`
--

DROP TABLE IF EXISTS `weixiuyuyue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weixiuyuyue`
(
    `id`              bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `addtime`         timestamp NOT NULL                      DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `baoxiubianhao`   varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '报修编号',
    `chepaihao`       varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '车牌号',
    `chexing`         varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '车型',
    `cheliangpinpai`  varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '车辆品牌',
    `cheliangxinghao` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '车辆型号',
    `yonghuzhanghao`  varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户账号',
    `yonghuxingming`  varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户姓名',
    `guzhangleixing`  varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '故障类型',
    `yuyuecishu`      int(11) DEFAULT NULL COMMENT '预约次数',
    `baoxiubiaoti`    varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '报修标题',
    `baoxiuyuanyin`   varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '报修原因',
    `yuyueshijian`    datetime                                DEFAULT NULL COMMENT '预约时间',
    `sfsh`            varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否审核',
    `shhf`            longtext COLLATE utf8mb4_unicode_ci COMMENT '回复内容',
    `fenpeizhuangtai` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分配状态',
    `beizhu`          varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`),
    UNIQUE KEY `baoxiubianhao` (`baoxiubianhao`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='维修预约';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weixiuyuyue`
--

LOCK
TABLES `weixiuyuyue` WRITE;
/*!40000 ALTER TABLE `weixiuyuyue` DISABLE KEYS */;
INSERT INTO `weixiuyuyue`
VALUES (1, '2025-02-04 03:06:55', '1111111111', '车牌号1', '车型1', '车辆品牌1', '车辆型号1', '用户账号1', '用户姓名1',
        '故障类型1', 1, '报修标题1', '报修原因1', '2025-02-04 11:06:55', '是', '', '已分配', '备注1'),
       (2, '2025-02-04 03:06:55', '2222222222', '车牌号2', '车型2', '车辆品牌2', '车辆型号2', '用户账号2', '用户姓名2',
        '故障类型2', 2, '报修标题2', '报修原因2', '2025-02-04 11:06:55', '是', '', '已分配', '备注2'),
       (3, '2025-02-04 03:06:55', '3333333333', '车牌号3', '车型3', '车辆品牌3', '车辆型号3', '用户账号3', '用户姓名3',
        '故障类型3', 3, '报修标题3', '报修原因3', '2025-02-04 11:06:55', '是', '', '已分配', '备注3'),
       (4, '2025-02-04 03:06:55', '4444444444', '车牌号4', '车型4', '车辆品牌4', '车辆型号4', '用户账号4', '用户姓名4',
        '故障类型4', 4, '报修标题4', '报修原因4', '2025-02-04 11:06:55', '是', '', '已分配', '备注4'),
       (5, '2025-02-04 03:06:55', '5555555555', '车牌号5', '车型5', '车辆品牌5', '车辆型号5', '用户账号5', '用户姓名5',
        '故障类型5', 5, '报修标题5', '报修原因5', '2025-02-04 11:06:55', '是', '', '已分配', '备注5'),
       (6, '2025-02-04 03:06:55', '6666666666', '车牌号6', '车型6', '车辆品牌6', '车辆型号6', '用户账号6', '用户姓名6',
        '故障类型6', 6, '报修标题6', '报修原因6', '2025-02-04 11:06:55', '是', '', '已分配', '备注6'),
       (7, '2025-02-04 03:06:55', '7777777777', '车牌号7', '车型7', '车辆品牌7', '车辆型号7', '用户账号7', '用户姓名7',
        '故障类型7', 7, '报修标题7', '报修原因7', '2025-02-04 11:06:55', '是', '', '已分配', '备注7'),
       (8, '2025-02-04 03:06:55', '8888888888', '车牌号8', '车型8', '车辆品牌8', '车辆型号8', '用户账号8', '用户姓名8',
        '故障类型8', 8, '报修标题8', '报修原因8', '2025-02-04 11:06:55', '是', '', '已分配', '备注8'),
       (9, '2025-02-04 03:06:55', '9999999999', '车牌号9', '车型9', '车辆品牌9', '车辆型号9', '用户账号9', '用户姓名9',
        '故障类型9', 9, '报修标题9', '报修原因9', '2025-02-04 11:06:55', '是', '', '已分配', '备注9'),
       (10, '2025-02-04 03:06:55', '11111111110', '车牌号10', '车型10', '车辆品牌10', '车辆型号10', '用户账号10',
        '用户姓名10', '故障类型10', 10, '报修标题10', '报修原因10', '2025-02-04 11:06:55', '是', '', '已分配',
        '备注10');
/*!40000 ALTER TABLE `weixiuyuyue` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `yonghu`
--

DROP TABLE IF EXISTS `yonghu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yonghu`
(
    `id`             bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `addtime`        timestamp                               NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `yonghuzhanghao` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户账号',
    `yonghumima`     varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户密码',
    `yonghuxingming` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户姓名',
    `touxiang`       longtext COLLATE utf8mb4_unicode_ci COMMENT '头像',
    `xingbie`        varchar(200) COLLATE utf8mb4_unicode_ci          DEFAULT NULL COMMENT '性别',
    `shoujihaoma`    varchar(200) COLLATE utf8mb4_unicode_ci          DEFAULT NULL COMMENT '手机号码',
    PRIMARY KEY (`id`),
    UNIQUE KEY `yonghuzhanghao` (`yonghuzhanghao`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yonghu`
--

LOCK
TABLES `yonghu` WRITE;
/*!40000 ALTER TABLE `yonghu` DISABLE KEYS */;
INSERT INTO `yonghu`
VALUES (31, '2025-02-04 03:06:55', '用户账号1', '123456', '用户姓名1', 'file/yonghuTouxiang1.jpg', '男', '19819881111'),
       (32, '2025-02-04 03:06:55', '用户账号2', '123456', '用户姓名2', 'file/yonghuTouxiang2.jpg', '男', '19819881112'),
       (33, '2025-02-04 03:06:55', '用户账号3', '123456', '用户姓名3', 'file/yonghuTouxiang3.jpg', '男', '19819881113'),
       (34, '2025-02-04 03:06:55', '用户账号4', '123456', '用户姓名4', 'file/yonghuTouxiang4.jpg', '男', '19819881114'),
       (35, '2025-02-04 03:06:55', '用户账号5', '123456', '用户姓名5', 'file/yonghuTouxiang5.jpg', '男', '19819881115'),
       (36, '2025-02-04 03:06:55', '用户账号6', '123456', '用户姓名6', 'file/yonghuTouxiang6.jpg', '男', '19819881116'),
       (37, '2025-02-04 03:06:55', '用户账号7', '123456', '用户姓名7', 'file/yonghuTouxiang7.jpg', '男', '19819881117'),
       (38, '2025-02-04 03:06:55', '用户账号8', '123456', '用户姓名8', 'file/yonghuTouxiang8.jpg', '男', '19819881118'),
       (39, '2025-02-04 03:06:55', '用户账号9', '123456', '用户姓名9', 'file/yonghuTouxiang9.jpg', '男', '19819881119'),
       (40, '2025-02-04 03:06:55', '用户账号10', '123456', '用户姓名10', 'file/yonghuTouxiang10.jpg', '男',
        '198198811110');
/*!40000 ALTER TABLE `yonghu` ENABLE KEYS */;
UNLOCK
TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-08  9:36:16
