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

SET NAMES utf8mb4;
SET
FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for aboutus
-- ----------------------------
DROP TABLE IF EXISTS `aboutus`;
CREATE TABLE `aboutus`
(
    `id`       bigint                                                        NOT NULL AUTO_INCREMENT COMMENT '主键',
    `addtime`  timestamp                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `title`    varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标题',
    `subtitle` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci          DEFAULT NULL COMMENT '副标题',
    `content`  longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '内容',
    `picture1` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '图片1',
    `picture2` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '图片2',
    `picture3` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '图片3',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='发展历程';

-- ----------------------------
-- Records of aboutus
-- ----------------------------
BEGIN;
INSERT INTO `aboutus` (`id`, `addtime`, `title`, `subtitle`, `content`, `picture1`, `picture2`, `picture3`)
VALUES (1, '2025-02-04 11:06:56', '发展历程', 'DEVELOPMENT HISTORY',
        '<p><br></p><p style=\"text-align: start;\">汽车维修厂的发展历程在中国经历了从萌芽期、爆发期到技术重构与生态变革期的显著转变，以下是详细介绍：</p><h3 style=\"text-align: start;\">萌芽期（20世纪80年代末-90年代末）：国营体系打破与私人创业萌芽</h3><ul><li style=\"text-align: start;\"><strong>背景</strong>：在此之前，国内汽修行业的经营主体几乎清一色是国营单位，多以内部维修车间或班组的形式存在，服务对象也局限于自家单位的运输车辆。</li><li style=\"text-align: start;\"><strong>发展</strong>：随着国家改革开放的力度加大，国企改革的浪潮席卷而来，第一批社会化修理厂陆续破土而出。这些修理厂的创始人清一色来自国营维修厂或车间，他们带着过硬的技术和敢闯敢试的勇气“下海”，为中国汽车后市场埋下了第一颗种子。</li><li style=\"text-align: start;\"><strong>特点</strong>：整个90年代，初代社会化修理厂的发展之路并不平坦。一方面，2000年前中国汽车保有量有限，且大部分车辆仍由单位内部维修体系承接，社会修理厂的业务来源十分有限。另一方面，当时的汽配供应链远不如现在发达，既没有充足的配件选择，维修技术也相对粗糙，专业设备更是极度匮乏。</li></ul><h3 style=\"text-align: start;\">爆发期（2000年初-2013年末）：WTO红利与市场多元化发展</h3><ul><li style=\"text-align: start;\"><strong>背景</strong>：2000年后不久，国内最早的4S店开始出现，一二三类维修企业也如雨后春笋般涌现。洗美快保门店、轮胎专项店等形态各异的门店遍地开花，大小不一的社会化修理厂各展所长，形成了“百花齐放、百家争鸣”的热闹局面。</li><li style=\"text-align: start;\"><strong>发展</strong>：大量4S单店乃至集团化企业开始出现，并迅速崛起，为汽车维保领域注入新鲜血液。而社会化修理厂的加速发展，也为行业市场化带来了更多内生动力。两者相互补充、良性竞争，共同推动中国汽车后市场进入高速发展阶段。</li><li style=\"text-align: start;\"><strong>特点</strong>：这一时期的汽车维修厂不仅数量激增，而且服务内容和形式也更加多元化。同时，随着汽车技术的不断进步和消费者需求的升级，汽车维修厂也开始注重技术提升和服务优化。</li></ul>',
        'file/aboutusPicture1.jpg', 'file/aboutusPicture2.jpg', 'file/aboutusPicture3.jpg');
COMMIT;

-- ----------------------------
-- Table structure for chat
-- ----------------------------
DROP TABLE IF EXISTS `chat`;
CREATE TABLE `chat`
(
    `id`      bigint    NOT NULL AUTO_INCREMENT COMMENT '主键',
    `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `adminid` bigint             DEFAULT NULL COMMENT '管理员id',
    `ask`     longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '提问内容',
    `reply`   longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '回复内容',
    `isreply` int                DEFAULT NULL COMMENT '是否回复',
    `userid`  bigint    NOT NULL COMMENT '用户id',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='客服聊天';

-- ----------------------------
-- Records of chat
-- ----------------------------
BEGIN;
INSERT INTO `chat` (`id`, `addtime`, `adminid`, `ask`, `reply`, `isreply`, `userid`)
VALUES (1, '2025-02-04 11:06:56', 1, '提问内容1', '回复内容1', 1, 1);
INSERT INTO `chat` (`id`, `addtime`, `adminid`, `ask`, `reply`, `isreply`, `userid`)
VALUES (2, '2025-02-04 11:06:56', 2, '提问内容2', '回复内容2', 2, 2);
INSERT INTO `chat` (`id`, `addtime`, `adminid`, `ask`, `reply`, `isreply`, `userid`)
VALUES (3, '2025-02-04 11:06:56', 3, '提问内容3', '回复内容3', 3, 3);
INSERT INTO `chat` (`id`, `addtime`, `adminid`, `ask`, `reply`, `isreply`, `userid`)
VALUES (4, '2025-02-04 11:06:56', 4, '提问内容4', '回复内容4', 4, 4);
INSERT INTO `chat` (`id`, `addtime`, `adminid`, `ask`, `reply`, `isreply`, `userid`)
VALUES (5, '2025-02-04 11:06:56', 5, '提问内容5', '回复内容5', 5, 5);
INSERT INTO `chat` (`id`, `addtime`, `adminid`, `ask`, `reply`, `isreply`, `userid`)
VALUES (6, '2025-02-04 11:06:56', 6, '提问内容6', '回复内容6', 6, 6);
INSERT INTO `chat` (`id`, `addtime`, `adminid`, `ask`, `reply`, `isreply`, `userid`)
VALUES (7, '2025-02-04 11:06:56', 7, '提问内容7', '回复内容7', 7, 7);
INSERT INTO `chat` (`id`, `addtime`, `adminid`, `ask`, `reply`, `isreply`, `userid`)
VALUES (8, '2025-02-04 11:06:56', 8, '提问内容8', '回复内容8', 8, 8);
INSERT INTO `chat` (`id`, `addtime`, `adminid`, `ask`, `reply`, `isreply`, `userid`)
VALUES (9, '2025-02-04 11:06:56', 9, '提问内容9', '回复内容9', 9, 9);
INSERT INTO `chat` (`id`, `addtime`, `adminid`, `ask`, `reply`, `isreply`, `userid`)
VALUES (10, '2025-02-04 11:06:56', 10, '提问内容10', '回复内容10', 10, 10);
COMMIT;

-- ----------------------------
-- Table structure for chathelper
-- ----------------------------
DROP TABLE IF EXISTS `chathelper`;
CREATE TABLE `chathelper`
(
    `id`      bigint    NOT NULL AUTO_INCREMENT COMMENT '主键',
    `addtime` timestamp NOT NULL                                            DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `ask`     varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '提问内容',
    `reply`   longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '回复内容',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='聊天助手';

-- ----------------------------
-- Records of chathelper
-- ----------------------------
BEGIN;
INSERT INTO `chathelper` (`id`, `addtime`, `ask`, `reply`)
VALUES (1, '2025-02-04 11:06:56', '提问内容1', '回复内容1');
INSERT INTO `chathelper` (`id`, `addtime`, `ask`, `reply`)
VALUES (2, '2025-02-04 11:06:56', '提问内容2', '回复内容2');
INSERT INTO `chathelper` (`id`, `addtime`, `ask`, `reply`)
VALUES (3, '2025-02-04 11:06:56', '提问内容3', '回复内容3');
INSERT INTO `chathelper` (`id`, `addtime`, `ask`, `reply`)
VALUES (4, '2025-02-04 11:06:56', '提问内容4', '回复内容4');
INSERT INTO `chathelper` (`id`, `addtime`, `ask`, `reply`)
VALUES (5, '2025-02-04 11:06:56', '提问内容5', '回复内容5');
INSERT INTO `chathelper` (`id`, `addtime`, `ask`, `reply`)
VALUES (6, '2025-02-04 11:06:56', '提问内容6', '回复内容6');
INSERT INTO `chathelper` (`id`, `addtime`, `ask`, `reply`)
VALUES (7, '2025-02-04 11:06:56', '提问内容7', '回复内容7');
INSERT INTO `chathelper` (`id`, `addtime`, `ask`, `reply`)
VALUES (8, '2025-02-04 11:06:56', '提问内容8', '回复内容8');
INSERT INTO `chathelper` (`id`, `addtime`, `ask`, `reply`)
VALUES (9, '2025-02-04 11:06:56', '提问内容9', '回复内容9');
INSERT INTO `chathelper` (`id`, `addtime`, `ask`, `reply`)
VALUES (10, '2025-02-04 11:06:56', '提问内容10', '回复内容10');
COMMIT;

-- ----------------------------
-- Table structure for cheliangxinxi
-- ----------------------------
DROP TABLE IF EXISTS `cheliangxinxi`;
CREATE TABLE `cheliangxinxi`
(
    `id`              bigint    NOT NULL AUTO_INCREMENT COMMENT '主键',
    `addtime`         timestamp NOT NULL                                            DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `chepaihao`       varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '车牌号',
    `chexing`         varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '车型',
    `cheshenyanse`    varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '车身颜色',
    `cheliangtupian`  longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '车辆图片',
    `cheliangpinpai`  varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '车辆品牌',
    `cheliangxinghao` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '车辆型号',
    `yonghuzhanghao`  varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户账号',
    `yonghuxingming`  varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户姓名',
    `shoujihaoma`     varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号码',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='车辆信息';

-- ----------------------------
-- Records of cheliangxinxi
-- ----------------------------
BEGIN;
INSERT INTO `cheliangxinxi` (`id`, `addtime`, `chepaihao`, `chexing`, `cheshenyanse`, `cheliangtupian`,
                             `cheliangpinpai`, `cheliangxinghao`, `yonghuzhanghao`, `yonghuxingming`, `shoujihaoma`)
VALUES (1, '2025-02-04 11:06:55', '车牌号1', '车型1', '车身颜色1',
        'file/cheliangxinxiCheliangtupian1.jpg,file/cheliangxinxiCheliangtupian2.jpg,file/cheliangxinxiCheliangtupian3.jpg',
        '车辆品牌1', '车辆型号1', '用户账号1', '用户姓名1', '手机号码1');
INSERT INTO `cheliangxinxi` (`id`, `addtime`, `chepaihao`, `chexing`, `cheshenyanse`, `cheliangtupian`,
                             `cheliangpinpai`, `cheliangxinghao`, `yonghuzhanghao`, `yonghuxingming`, `shoujihaoma`)
VALUES (2, '2025-02-04 11:06:55', '车牌号2', '车型2', '车身颜色2',
        'file/cheliangxinxiCheliangtupian2.jpg,file/cheliangxinxiCheliangtupian3.jpg,file/cheliangxinxiCheliangtupian4.jpg',
        '车辆品牌2', '车辆型号2', '用户账号2', '用户姓名2', '手机号码2');
INSERT INTO `cheliangxinxi` (`id`, `addtime`, `chepaihao`, `chexing`, `cheshenyanse`, `cheliangtupian`,
                             `cheliangpinpai`, `cheliangxinghao`, `yonghuzhanghao`, `yonghuxingming`, `shoujihaoma`)
VALUES (3, '2025-02-04 11:06:55', '车牌号3', '车型3', '车身颜色3',
        'file/cheliangxinxiCheliangtupian3.jpg,file/cheliangxinxiCheliangtupian4.jpg,file/cheliangxinxiCheliangtupian5.jpg',
        '车辆品牌3', '车辆型号3', '用户账号3', '用户姓名3', '手机号码3');
INSERT INTO `cheliangxinxi` (`id`, `addtime`, `chepaihao`, `chexing`, `cheshenyanse`, `cheliangtupian`,
                             `cheliangpinpai`, `cheliangxinghao`, `yonghuzhanghao`, `yonghuxingming`, `shoujihaoma`)
VALUES (4, '2025-02-04 11:06:55', '车牌号4', '车型4', '车身颜色4',
        'file/cheliangxinxiCheliangtupian4.jpg,file/cheliangxinxiCheliangtupian5.jpg,file/cheliangxinxiCheliangtupian6.jpg',
        '车辆品牌4', '车辆型号4', '用户账号4', '用户姓名4', '手机号码4');
INSERT INTO `cheliangxinxi` (`id`, `addtime`, `chepaihao`, `chexing`, `cheshenyanse`, `cheliangtupian`,
                             `cheliangpinpai`, `cheliangxinghao`, `yonghuzhanghao`, `yonghuxingming`, `shoujihaoma`)
VALUES (5, '2025-02-04 11:06:55', '车牌号5', '车型5', '车身颜色5',
        'file/cheliangxinxiCheliangtupian5.jpg,file/cheliangxinxiCheliangtupian6.jpg,file/cheliangxinxiCheliangtupian7.jpg',
        '车辆品牌5', '车辆型号5', '用户账号5', '用户姓名5', '手机号码5');
INSERT INTO `cheliangxinxi` (`id`, `addtime`, `chepaihao`, `chexing`, `cheshenyanse`, `cheliangtupian`,
                             `cheliangpinpai`, `cheliangxinghao`, `yonghuzhanghao`, `yonghuxingming`, `shoujihaoma`)
VALUES (6, '2025-02-04 11:06:55', '车牌号6', '车型6', '车身颜色6',
        'file/cheliangxinxiCheliangtupian6.jpg,file/cheliangxinxiCheliangtupian7.jpg,file/cheliangxinxiCheliangtupian8.jpg',
        '车辆品牌6', '车辆型号6', '用户账号6', '用户姓名6', '手机号码6');
INSERT INTO `cheliangxinxi` (`id`, `addtime`, `chepaihao`, `chexing`, `cheshenyanse`, `cheliangtupian`,
                             `cheliangpinpai`, `cheliangxinghao`, `yonghuzhanghao`, `yonghuxingming`, `shoujihaoma`)
VALUES (7, '2025-02-04 11:06:55', '车牌号7', '车型7', '车身颜色7',
        'file/cheliangxinxiCheliangtupian7.jpg,file/cheliangxinxiCheliangtupian8.jpg,file/cheliangxinxiCheliangtupian9.jpg',
        '车辆品牌7', '车辆型号7', '用户账号7', '用户姓名7', '手机号码7');
INSERT INTO `cheliangxinxi` (`id`, `addtime`, `chepaihao`, `chexing`, `cheshenyanse`, `cheliangtupian`,
                             `cheliangpinpai`, `cheliangxinghao`, `yonghuzhanghao`, `yonghuxingming`, `shoujihaoma`)
VALUES (8, '2025-02-04 11:06:55', '车牌号8', '车型8', '车身颜色8',
        'file/cheliangxinxiCheliangtupian8.jpg,file/cheliangxinxiCheliangtupian9.jpg,file/cheliangxinxiCheliangtupian10.jpg',
        '车辆品牌8', '车辆型号8', '用户账号8', '用户姓名8', '手机号码8');
INSERT INTO `cheliangxinxi` (`id`, `addtime`, `chepaihao`, `chexing`, `cheshenyanse`, `cheliangtupian`,
                             `cheliangpinpai`, `cheliangxinghao`, `yonghuzhanghao`, `yonghuxingming`, `shoujihaoma`)
VALUES (9, '2025-02-04 11:06:55', '车牌号9', '车型9', '车身颜色9',
        'file/cheliangxinxiCheliangtupian9.jpg,file/cheliangxinxiCheliangtupian10.jpg,file/cheliangxinxiCheliangtupian11.jpg',
        '车辆品牌9', '车辆型号9', '用户账号9', '用户姓名9', '手机号码9');
INSERT INTO `cheliangxinxi` (`id`, `addtime`, `chepaihao`, `chexing`, `cheshenyanse`, `cheliangtupian`,
                             `cheliangpinpai`, `cheliangxinghao`, `yonghuzhanghao`, `yonghuxingming`, `shoujihaoma`)
VALUES (10, '2025-02-04 11:06:55', '车牌号10', '车型10', '车身颜色10',
        'file/cheliangxinxiCheliangtupian10.jpg,file/cheliangxinxiCheliangtupian11.jpg,file/cheliangxinxiCheliangtupian12.jpg',
        '车辆品牌10', '车辆型号10', '用户账号10', '用户姓名10', '手机号码10');
COMMIT;

-- ----------------------------
-- Table structure for config
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config`
(
    `id`      bigint                                                        NOT NULL AUTO_INCREMENT COMMENT '主键',
    `addtime` timestamp                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `name`    varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
    `value`   longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '值',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='轮播图';

-- ----------------------------
-- Records of config
-- ----------------------------
BEGIN;
INSERT INTO `config` (`id`, `addtime`, `name`, `value`)
VALUES (1, '2025-02-04 11:06:56', 'swiper1', 'file/1763341729933.jpg');
INSERT INTO `config` (`id`, `addtime`, `name`, `value`)
VALUES (2, '2025-02-04 11:06:56', 'swiper2', 'file/swiperPicture2.jpg');
INSERT INTO `config` (`id`, `addtime`, `name`, `value`)
VALUES (3, '2025-02-04 11:06:56', 'swiper3', 'file/swiperPicture3.jpg');
COMMIT;

-- ----------------------------
-- Table structure for guzhangleixing
-- ----------------------------
DROP TABLE IF EXISTS `guzhangleixing`;
CREATE TABLE `guzhangleixing`
(
    `id`             bigint                                                        NOT NULL AUTO_INCREMENT COMMENT '主键',
    `addtime`        timestamp                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `guzhangleixing` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '故障类型',
    PRIMARY KEY (`id`),
    UNIQUE KEY `guzhangleixing` (`guzhangleixing`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='故障类型';

-- ----------------------------
-- Records of guzhangleixing
-- ----------------------------
BEGIN;
INSERT INTO `guzhangleixing` (`id`, `addtime`, `guzhangleixing`)
VALUES (1, '2025-02-04 11:06:55', '故障类型1');
INSERT INTO `guzhangleixing` (`id`, `addtime`, `guzhangleixing`)
VALUES (2, '2025-02-04 11:06:55', '故障类型2');
INSERT INTO `guzhangleixing` (`id`, `addtime`, `guzhangleixing`)
VALUES (3, '2025-02-04 11:06:55', '故障类型3');
INSERT INTO `guzhangleixing` (`id`, `addtime`, `guzhangleixing`)
VALUES (4, '2025-02-04 11:06:55', '故障类型4');
INSERT INTO `guzhangleixing` (`id`, `addtime`, `guzhangleixing`)
VALUES (5, '2025-02-04 11:06:55', '故障类型5');
INSERT INTO `guzhangleixing` (`id`, `addtime`, `guzhangleixing`)
VALUES (6, '2025-02-04 11:06:55', '故障类型6');
INSERT INTO `guzhangleixing` (`id`, `addtime`, `guzhangleixing`)
VALUES (7, '2025-02-04 11:06:55', '故障类型7');
INSERT INTO `guzhangleixing` (`id`, `addtime`, `guzhangleixing`)
VALUES (8, '2025-02-04 11:06:55', '故障类型8');
INSERT INTO `guzhangleixing` (`id`, `addtime`, `guzhangleixing`)
VALUES (9, '2025-02-04 11:06:55', '故障类型9');
INSERT INTO `guzhangleixing` (`id`, `addtime`, `guzhangleixing`)
VALUES (10, '2025-02-04 11:06:55', '故障类型10');
COMMIT;

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`
(
    `id`       bigint    NOT NULL AUTO_INCREMENT COMMENT '主键',
    `addtime`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `menujson` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '菜单',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='菜单';

-- ----------------------------
-- Records of menu
-- ----------------------------
BEGIN;
INSERT INTO `menu` (`id`, `addtime`, `menujson`)
VALUES (1, '2025-02-04 11:06:56',
        '[{\"backMenu\":[{\"child\":[{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"appFrontIcon\":\"cuIcon-present\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"classname\":\"users\",\"menu\":\"管理员\",\"menuJump\":\"列表\",\"tableName\":\"users\"},{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"appFrontIcon\":\"cuIcon-pic\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"classname\":\"systemNotice\",\"menu\":\"系统公告\",\"menuJump\":\"列表\",\"tableName\":\"system_notice\"},{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"appFrontIcon\":\"cuIcon-keyboard\",\"buttons\":[\"查看\",\"修改\"],\"classname\":\"aboutus\",\"menu\":\"发展历程\",\"menuJump\":\"列表\",\"tableName\":\"aboutus\"},{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"appFrontIcon\":\"cuIcon-full\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"classname\":\"config\",\"menu\":\"轮播图\",\"menuJump\":\"列表\",\"tableName\":\"config\"}],\"fontClass\":\"icon-common44\",\"menu\":\"管理员管理\",\"unicode\":\"&#xef28;\"},{\"child\":[{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"appFrontIcon\":\"cuIcon-album\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"classname\":\"yonghu\",\"menu\":\"用户\",\"menuJump\":\"列表\",\"tableName\":\"yonghu\"},{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"审核\"],\"appFrontIcon\":\"cuIcon-brand\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"审核\"],\"classname\":\"weixiuyuan\",\"menu\":\"维修员\",\"menuJump\":\"列表\",\"tableName\":\"weixiuyuan\"}],\"fontClass\":\"icon-user3\",\"menu\":\"用户管理\",\"unicode\":\"&#xef99;\"},{\"child\":[{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"appFrontIcon\":\"cuIcon-present\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"classname\":\"guzhangleixing\",\"menu\":\"故障类型\",\"menuJump\":\"列表\",\"tableName\":\"guzhangleixing\"}],\"fontClass\":\"icon-common39\",\"menu\":\"故障类型管理\",\"unicode\":\"&#xeeba;\"},{\"child\":[{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"预约\"],\"appFrontIcon\":\"cuIcon-clothes\",\"buttons\":[\"查看\",\"删除\"],\"classname\":\"cheliangxinxi\",\"menu\":\"车辆信息\",\"menuJump\":\"列表\",\"tableName\":\"cheliangxinxi\"}],\"fontClass\":\"icon-common33\",\"menu\":\"车辆信息管理\",\"unicode\":\"&#xee6a;\"},{\"child\":[{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"审核\",\"预约次数\",\"首页总数\",\"首页统计\",\"取消\",\"分配\"],\"appFrontIcon\":\"cuIcon-discover\",\"buttons\":[\"查看\",\"删除\",\"审核\",\"预约次数\",\"首页总数\",\"首页统计\",\"分配\"],\"classname\":\"weixiuyuyue\",\"menu\":\"维修预约\",\"menuJump\":\"列表\",\"tableName\":\"weixiuyuyue\"},{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"支付\",\"维修收入\",\"维修次数\",\"首页总数\",\"首页统计\",\"评价\"],\"appFrontIcon\":\"cuIcon-phone\",\"buttons\":[\"查看\",\"删除\",\"维修收入\",\"维修次数\",\"首页总数\",\"首页统计\"],\"classname\":\"weixiuxinxi\",\"menu\":\"维修信息\",\"menuJump\":\"列表\",\"tableName\":\"weixiuxinxi\"},{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"客户满意度\",\"首页总数\",\"首页统计\"],\"appFrontIcon\":\"cuIcon-present\",\"buttons\":[\"查看\",\"删除\",\"客户满意度\",\"首页总数\",\"首页统计\"],\"classname\":\"weixiupingjia\",\"menu\":\"维修评价\",\"menuJump\":\"列表\",\"tableName\":\"weixiupingjia\"},{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"appFrontIcon\":\"cuIcon-cardboard\",\"buttons\":[\"查看\"],\"classname\":\"quxiaoyuyue\",\"menu\":\"取消预约\",\"menuJump\":\"列表\",\"tableName\":\"quxiaoyuyue\"},{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"维修\"],\"appFrontIcon\":\"cuIcon-link\",\"buttons\":[\"查看\",\"修改\",\"删除\"],\"classname\":\"weixiufenpei\",\"menu\":\"维修分配\",\"menuJump\":\"列表\",\"tableName\":\"weixiufenpei\"}],\"fontClass\":\"icon-common32\",\"menu\":\"维修预约管理\",\"unicode\":\"&#xee66;\"},{\"child\":[{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"appFrontIcon\":\"cuIcon-phone\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"classname\":\"shoufeibiaozhun\",\"menu\":\"收费标准\",\"menuJump\":\"列表\",\"tableName\":\"shoufeibiaozhun\"}],\"fontClass\":\"icon-common1\",\"menu\":\"收费标准管理\",\"unicode\":\"&#xeda3;\"},{\"child\":[{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"appFrontIcon\":\"cuIcon-copy\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"classname\":\"news\",\"menu\":\"汽车资讯\",\"menuJump\":\"列表\",\"tableName\":\"news\"}],\"fontClass\":\"icon-common16\",\"menu\":\"汽车资讯管理\",\"unicode\":\"&#xedfd;\"},{\"child\":[{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"appFrontIcon\":\"cuIcon-copy\",\"buttons\":[\"查看\",\"删除\"],\"classname\":\"chat\",\"menu\":\"客服聊天\",\"menuJump\":\"列表\",\"tableName\":\"chat\"},{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"appFrontIcon\":\"cuIcon-flashlightopen\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"classname\":\"chathelper\",\"menu\":\"聊天助手\",\"menuJump\":\"列表\",\"tableName\":\"chathelper\"}],\"fontClass\":\"icon-common15\",\"menu\":\"客服聊天管理\",\"unicode\":\"&#xedfc;\"}],\"frontMenu\":[{\"child\":[{\"appFrontIcon\":\"cuIcon-discover\",\"buttons\":[\"查看\"],\"classname\":\"shoufeibiaozhun\",\"menu\":\"收费标准\",\"menuJump\":\"列表\",\"tableName\":\"shoufeibiaozhun\"}],\"menu\":\"收费标准管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-goods\",\"buttons\":[\"查看\"],\"classname\":\"news\",\"menu\":\"汽车资讯\",\"menuJump\":\"列表\",\"tableName\":\"news\"}],\"menu\":\"新闻资讯管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-list\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"classname\":\"chat\",\"menu\":\"客服聊天\",\"menuJump\":\"列表\",\"tableName\":\"chat\"}],\"menu\":\"客服聊天管理\"}],\"hasBackLogin\":\"是\",\"hasBackRegister\":\"否\",\"hasFrontLogin\":\"否\",\"hasFrontRegister\":\"否\",\"pathName\":\"users\",\"roleName\":\"管理员\",\"tableName\":\"users\"},{\"backMenu\":[{\"child\":[{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"预约\"],\"appFrontIcon\":\"cuIcon-clothes\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"预约\"],\"classname\":\"cheliangxinxi\",\"menu\":\"车辆信息\",\"menuJump\":\"列表\",\"tableName\":\"cheliangxinxi\"}],\"fontClass\":\"icon-common33\",\"menu\":\"车辆信息管理\",\"unicode\":\"&#xee6a;\"},{\"child\":[{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"审核\",\"预约次数\",\"首页总数\",\"首页统计\",\"取消\",\"分配\"],\"appFrontIcon\":\"cuIcon-discover\",\"buttons\":[\"查看\",\"修改\",\"删除\",\"取消\"],\"classname\":\"weixiuyuyue\",\"menu\":\"维修预约\",\"menuJump\":\"列表\",\"tableName\":\"weixiuyuyue\"},{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"支付\",\"维修收入\",\"维修次数\",\"首页总数\",\"首页统计\",\"评价\"],\"appFrontIcon\":\"cuIcon-phone\",\"buttons\":[\"查看\",\"删除\",\"支付\",\"评价\"],\"classname\":\"weixiuxinxi\",\"menu\":\"维修信息\",\"menuJump\":\"列表\",\"tableName\":\"weixiuxinxi\"},{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"客户满意度\",\"首页总数\",\"首页统计\"],\"appFrontIcon\":\"cuIcon-present\",\"buttons\":[\"查看\",\"修改\",\"删除\"],\"classname\":\"weixiupingjia\",\"menu\":\"维修评价\",\"menuJump\":\"列表\",\"tableName\":\"weixiupingjia\"},{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"appFrontIcon\":\"cuIcon-cardboard\",\"buttons\":[\"查看\",\"修改\",\"删除\"],\"classname\":\"quxiaoyuyue\",\"menu\":\"取消预约\",\"menuJump\":\"列表\",\"tableName\":\"quxiaoyuyue\"},{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"维修\"],\"appFrontIcon\":\"cuIcon-link\",\"buttons\":[\"查看\",\"删除\"],\"classname\":\"weixiufenpei\",\"menu\":\"维修分配\",\"menuJump\":\"列表\",\"tableName\":\"weixiufenpei\"}],\"fontClass\":\"icon-common32\",\"menu\":\"维修预约管理\",\"unicode\":\"&#xee66;\"},{\"child\":[{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"appFrontIcon\":\"cuIcon-goods\",\"buttons\":[\"查看\"],\"classname\":\"storeup\",\"menu\":\"我的收藏\",\"menuJump\":\"1\",\"tableName\":\"storeup\"}],\"fontClass\":\"icon-common12\",\"menu\":\"我的收藏管理\",\"unicode\":\"&#xedf4;\"}],\"frontMenu\":[{\"child\":[{\"appFrontIcon\":\"cuIcon-discover\",\"buttons\":[\"查看\"],\"classname\":\"shoufeibiaozhun\",\"menu\":\"收费标准\",\"menuJump\":\"列表\",\"tableName\":\"shoufeibiaozhun\"}],\"menu\":\"收费标准管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-goods\",\"buttons\":[\"查看\"],\"classname\":\"news\",\"menu\":\"汽车资讯\",\"menuJump\":\"列表\",\"tableName\":\"news\"}],\"menu\":\"新闻资讯管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-list\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"classname\":\"chat\",\"menu\":\"客服聊天\",\"menuJump\":\"列表\",\"tableName\":\"chat\"}],\"menu\":\"客服聊天管理\"}],\"hasBackLogin\":\"否\",\"hasBackRegister\":\"否\",\"hasFrontLogin\":\"是\",\"hasFrontRegister\":\"是\",\"pathName\":\"yonghu\",\"roleName\":\"用户\",\"tableName\":\"yonghu\"},{\"backMenu\":[{\"child\":[{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"支付\",\"维修收入\",\"维修次数\",\"首页总数\",\"首页统计\",\"评价\"],\"appFrontIcon\":\"cuIcon-phone\",\"buttons\":[\"查看\",\"修改\",\"删除\",\"维修收入\",\"维修次数\",\"首页总数\",\"首页统计\"],\"classname\":\"weixiuxinxi\",\"menu\":\"维修信息\",\"menuJump\":\"列表\",\"tableName\":\"weixiuxinxi\"},{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"客户满意度\",\"首页总数\",\"首页统计\"],\"appFrontIcon\":\"cuIcon-present\",\"buttons\":[\"查看\",\"删除\",\"客户满意度\",\"首页总数\",\"首页统计\"],\"classname\":\"weixiupingjia\",\"menu\":\"维修评价\",\"menuJump\":\"列表\",\"tableName\":\"weixiupingjia\"},{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"维修\"],\"appFrontIcon\":\"cuIcon-link\",\"buttons\":[\"查看\",\"删除\",\"维修\"],\"classname\":\"weixiufenpei\",\"menu\":\"维修分配\",\"menuJump\":\"列表\",\"tableName\":\"weixiufenpei\"}],\"fontClass\":\"icon-common32\",\"menu\":\"维修预约管理\",\"unicode\":\"&#xee66;\"}],\"frontMenu\":[{\"child\":[{\"appFrontIcon\":\"cuIcon-discover\",\"buttons\":[\"查看\"],\"classname\":\"shoufeibiaozhun\",\"menu\":\"收费标准\",\"menuJump\":\"列表\",\"tableName\":\"shoufeibiaozhun\"}],\"menu\":\"收费标准管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-goods\",\"buttons\":[\"查看\"],\"classname\":\"news\",\"menu\":\"汽车资讯\",\"menuJump\":\"列表\",\"tableName\":\"news\"}],\"menu\":\"新闻资讯管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-list\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"classname\":\"chat\",\"menu\":\"客服聊天\",\"menuJump\":\"列表\",\"tableName\":\"chat\"}],\"menu\":\"客服聊天管理\"}],\"hasBackLogin\":\"是\",\"hasBackRegister\":\"是\",\"hasFrontLogin\":\"否\",\"hasFrontRegister\":\"否\",\"pathName\":\"weixiuyuan\",\"roleName\":\"维修员\",\"tableName\":\"weixiuyuan\"}]');
COMMIT;

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news`
(
    `id`           bigint                                                        NOT NULL AUTO_INCREMENT COMMENT '主键',
    `addtime`      timestamp                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `title`        varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标题',
    `introduction` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '简介',
    `picture`      longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '图片',
    `content`      longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '内容',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='汽车资讯';

-- ----------------------------
-- Records of news
-- ----------------------------
BEGIN;
INSERT INTO `news` (`id`, `addtime`, `title`, `introduction`, `picture`, `content`)
VALUES (1, '2025-02-04 11:06:56', '改色', '改色', 'file/1763341772771.png', '<p>改色</p>');
INSERT INTO `news` (`id`, `addtime`, `title`, `introduction`, `picture`, `content`)
VALUES (8, '2025-02-04 11:06:56', '贴膜', '贴膜', 'file/newsPicture8.jpg', '<p>贴膜</p>');
INSERT INTO `news` (`id`, `addtime`, `title`, `introduction`, `picture`, `content`)
VALUES (9, '2025-02-04 11:06:56', '轮胎更换', '轮胎更换', 'file/newsPicture9.jpg', '<p>轮胎更换</p>');
INSERT INTO `news` (`id`, `addtime`, `title`, `introduction`, `picture`, `content`)
VALUES (10, '2025-02-04 11:06:56', '洗车服务', '洗车服务', 'file/newsPicture10.jpg', '<p>洗车服务</p>');
COMMIT;

-- ----------------------------
-- Table structure for quxiaoyuyue
-- ----------------------------
DROP TABLE IF EXISTS `quxiaoyuyue`;
CREATE TABLE `quxiaoyuyue`
(
    `id`              bigint    NOT NULL AUTO_INCREMENT COMMENT '主键',
    `addtime`         timestamp NOT NULL                                            DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `baoxiubianhao`   varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '报修编号',
    `chepaihao`       varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '车牌号',
    `chexing`         varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '车型',
    `cheliangpinpai`  varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '车辆品牌',
    `cheliangxinghao` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '车辆型号',
    `yonghuzhanghao`  varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户账号',
    `yonghuxingming`  varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户姓名',
    `guzhangleixing`  varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '故障类型',
    `baoxiubiaoti`    varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '报修标题',
    `quxiaoyuanyin`   varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '取消原因',
    `quxiaoshijian`   datetime                                                      DEFAULT NULL COMMENT '取消时间',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='取消预约';

-- ----------------------------
-- Records of quxiaoyuyue
-- ----------------------------
BEGIN;
INSERT INTO `quxiaoyuyue` (`id`, `addtime`, `baoxiubianhao`, `chepaihao`, `chexing`, `cheliangpinpai`,
                           `cheliangxinghao`, `yonghuzhanghao`, `yonghuxingming`, `guzhangleixing`, `baoxiubiaoti`,
                           `quxiaoyuanyin`, `quxiaoshijian`)
VALUES (1, '2025-02-04 11:06:56', '报修编号1', '车牌号1', '车型1', '车辆品牌1', '车辆型号1', '用户账号1', '用户姓名1',
        '故障类型1', '报修标题1', '取消原因1', '2025-02-04 11:06:56');
INSERT INTO `quxiaoyuyue` (`id`, `addtime`, `baoxiubianhao`, `chepaihao`, `chexing`, `cheliangpinpai`,
                           `cheliangxinghao`, `yonghuzhanghao`, `yonghuxingming`, `guzhangleixing`, `baoxiubiaoti`,
                           `quxiaoyuanyin`, `quxiaoshijian`)
VALUES (2, '2025-02-04 11:06:56', '报修编号2', '车牌号2', '车型2', '车辆品牌2', '车辆型号2', '用户账号2', '用户姓名2',
        '故障类型2', '报修标题2', '取消原因2', '2025-02-04 11:06:56');
INSERT INTO `quxiaoyuyue` (`id`, `addtime`, `baoxiubianhao`, `chepaihao`, `chexing`, `cheliangpinpai`,
                           `cheliangxinghao`, `yonghuzhanghao`, `yonghuxingming`, `guzhangleixing`, `baoxiubiaoti`,
                           `quxiaoyuanyin`, `quxiaoshijian`)
VALUES (3, '2025-02-04 11:06:56', '报修编号3', '车牌号3', '车型3', '车辆品牌3', '车辆型号3', '用户账号3', '用户姓名3',
        '故障类型3', '报修标题3', '取消原因3', '2025-02-04 11:06:56');
INSERT INTO `quxiaoyuyue` (`id`, `addtime`, `baoxiubianhao`, `chepaihao`, `chexing`, `cheliangpinpai`,
                           `cheliangxinghao`, `yonghuzhanghao`, `yonghuxingming`, `guzhangleixing`, `baoxiubiaoti`,
                           `quxiaoyuanyin`, `quxiaoshijian`)
VALUES (4, '2025-02-04 11:06:56', '报修编号4', '车牌号4', '车型4', '车辆品牌4', '车辆型号4', '用户账号4', '用户姓名4',
        '故障类型4', '报修标题4', '取消原因4', '2025-02-04 11:06:56');
INSERT INTO `quxiaoyuyue` (`id`, `addtime`, `baoxiubianhao`, `chepaihao`, `chexing`, `cheliangpinpai`,
                           `cheliangxinghao`, `yonghuzhanghao`, `yonghuxingming`, `guzhangleixing`, `baoxiubiaoti`,
                           `quxiaoyuanyin`, `quxiaoshijian`)
VALUES (5, '2025-02-04 11:06:56', '报修编号5', '车牌号5', '车型5', '车辆品牌5', '车辆型号5', '用户账号5', '用户姓名5',
        '故障类型5', '报修标题5', '取消原因5', '2025-02-04 11:06:56');
INSERT INTO `quxiaoyuyue` (`id`, `addtime`, `baoxiubianhao`, `chepaihao`, `chexing`, `cheliangpinpai`,
                           `cheliangxinghao`, `yonghuzhanghao`, `yonghuxingming`, `guzhangleixing`, `baoxiubiaoti`,
                           `quxiaoyuanyin`, `quxiaoshijian`)
VALUES (6, '2025-02-04 11:06:56', '报修编号6', '车牌号6', '车型6', '车辆品牌6', '车辆型号6', '用户账号6', '用户姓名6',
        '故障类型6', '报修标题6', '取消原因6', '2025-02-04 11:06:56');
INSERT INTO `quxiaoyuyue` (`id`, `addtime`, `baoxiubianhao`, `chepaihao`, `chexing`, `cheliangpinpai`,
                           `cheliangxinghao`, `yonghuzhanghao`, `yonghuxingming`, `guzhangleixing`, `baoxiubiaoti`,
                           `quxiaoyuanyin`, `quxiaoshijian`)
VALUES (7, '2025-02-04 11:06:56', '报修编号7', '车牌号7', '车型7', '车辆品牌7', '车辆型号7', '用户账号7', '用户姓名7',
        '故障类型7', '报修标题7', '取消原因7', '2025-02-04 11:06:56');
INSERT INTO `quxiaoyuyue` (`id`, `addtime`, `baoxiubianhao`, `chepaihao`, `chexing`, `cheliangpinpai`,
                           `cheliangxinghao`, `yonghuzhanghao`, `yonghuxingming`, `guzhangleixing`, `baoxiubiaoti`,
                           `quxiaoyuanyin`, `quxiaoshijian`)
VALUES (8, '2025-02-04 11:06:56', '报修编号8', '车牌号8', '车型8', '车辆品牌8', '车辆型号8', '用户账号8', '用户姓名8',
        '故障类型8', '报修标题8', '取消原因8', '2025-02-04 11:06:56');
INSERT INTO `quxiaoyuyue` (`id`, `addtime`, `baoxiubianhao`, `chepaihao`, `chexing`, `cheliangpinpai`,
                           `cheliangxinghao`, `yonghuzhanghao`, `yonghuxingming`, `guzhangleixing`, `baoxiubiaoti`,
                           `quxiaoyuanyin`, `quxiaoshijian`)
VALUES (9, '2025-02-04 11:06:56', '报修编号9', '车牌号9', '车型9', '车辆品牌9', '车辆型号9', '用户账号9', '用户姓名9',
        '故障类型9', '报修标题9', '取消原因9', '2025-02-04 11:06:56');
INSERT INTO `quxiaoyuyue` (`id`, `addtime`, `baoxiubianhao`, `chepaihao`, `chexing`, `cheliangpinpai`,
                           `cheliangxinghao`, `yonghuzhanghao`, `yonghuxingming`, `guzhangleixing`, `baoxiubiaoti`,
                           `quxiaoyuanyin`, `quxiaoshijian`)
VALUES (10, '2025-02-04 11:06:56', '报修编号10', '车牌号10', '车型10', '车辆品牌10', '车辆型号10', '用户账号10',
        '用户姓名10', '故障类型10', '报修标题10', '取消原因10', '2025-02-04 11:06:56');
COMMIT;

-- ----------------------------
-- Table structure for shoufeibiaozhun
-- ----------------------------
DROP TABLE IF EXISTS `shoufeibiaozhun`;
CREATE TABLE `shoufeibiaozhun`
(
    `id`               bigint                                                        NOT NULL AUTO_INCREMENT COMMENT '主键',
    `addtime`          timestamp                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `shoufeixiangmu`   varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '收费项目',
    `fengmian`         longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '封面',
    `zhixingbiaozhun`  longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '执行标准',
    `shoufeixiangqing` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '收费详情',
    `faburiqi`         date                                                                   DEFAULT NULL COMMENT '发布日期',
    `storeup_number`   int                                                                    DEFAULT NULL COMMENT '收藏数',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='收费标准';

-- ----------------------------
-- Records of shoufeibiaozhun
-- ----------------------------
BEGIN;
INSERT INTO `shoufeibiaozhun` (`id`, `addtime`, `shoufeixiangmu`, `fengmian`, `zhixingbiaozhun`, `shoufeixiangqing`,
                               `faburiqi`, `storeup_number`)
VALUES (1, '2025-02-04 11:06:56', '洗车费用 30 ',
        'file/shoufeibiaozhunFengmian1.jpg,file/shoufeibiaozhunFengmian2.jpg,file/shoufeibiaozhunFengmian3.jpg',
        '选择合适场地\n避免在烈日下或风沙大的环境中洗车，防止水渍快速蒸发留下水痕，或灰尘二次附着。\n优先选择阴凉、通风的平坦地面，确保排水顺畅。\n工具与材料\n基础工具：水桶（2个，一个装清水，一个装泡沫）、洗车海绵/专用擦车布、软毛刷（用于轮毂）、高压水枪（或水管）。\n清洁剂：中性洗车液（避免酸性或碱性过强的清洁剂腐蚀车漆）。\n辅助工具：轮胎刷、玻璃清洁剂、吸尘器（清理内饰）、毛巾（干湿分开）。\n检查车辆状态\n关闭所有车窗、天窗，收起后视镜。\n检查车身是否有松动部件（如车牌、装饰条），避免洗车时脱落。',
        '<p><br></p><ol><li style=\"text-align: start;\"><strong>选择合适场地</strong></li><li style=\"text-align: start;\"><strong>工具与材料</strong></li><li style=\"text-align: start;\"><strong>检查车辆状态</strong></li></ol>',
        '2025-02-04', 30);
INSERT INTO `shoufeibiaozhun` (`id`, `addtime`, `shoufeixiangmu`, `fengmian`, `zhixingbiaozhun`, `shoufeixiangqing`,
                               `faburiqi`, `storeup_number`)
VALUES (2, '2025-02-04 11:06:56', '贴膜费用 4000',
        'file/shoufeibiaozhunFengmian2.jpg,file/shoufeibiaozhunFengmian3.jpg,file/shoufeibiaozhunFengmian4.jpg',
        '施工前准备：\n对车辆进行全方位清洗，特别要注重汽车玻璃表面清洁。\n选定品牌，根据车主喜好进行颜色的选择，并根据车辆本身的漆面颜色来进行适当的搭配。\n准备喷雾器、不起毛的擦洗布、棉毛巾、擦洗垫、刮刀和可替换刀片、清洁剂版和超级刮板、重型切刀、白塑料硬卡片等工具。\n检查无尘施工车间，确保施工环境干燥少尘。\n贴膜流程：\n内饰保护：用专用仪表盘罩遮盖在仪表台上，车内真皮座椅和高级座套也需用专用座椅套全部遮盖。\n玻璃清洗：玻璃表面清除胶粒、砂砾，除尘清洗三遍，贴膜前再清洗一次。清洗后挡风玻璃时务必小心加热丝的保护。\n裁膜：玻璃外侧表面套膜取样，掌握好尺寸，以方便下料，尽量做到不浪费材料。裁剪的边缘一定要平滑，不能参差不齐。\n定型：前挡风玻璃装贴前必须先定型，定性的手法要求“高温高速”。\n装贴：将膜材用配好的稀释剂均匀润湿后装贴在已经清洗好的玻璃上，将清水喷在膜的表面，用光滑的专用软性刮刀轻柔的将膜定位并把膜上的水分刮除。用较硬材质的专用刮刀用力将膜与玻璃之间的残留水分赶出来。\n施工完成后的检验：\n检查材料是否正确。\n检查前挡风玻璃、后挡风玻璃、侧面折痕是否符合标准。\n检查所有贴膜后的玻璃是否有水泡，水必须刮干净。\n检查侧玻璃窗贴膜裁切是否平直，侧窗玻璃升到顶部不能漏光，侧窗玻璃两边不能漏光。\n检查贴膜处玻璃是否有明显的划痕，侧窗胶条是否有新划痕。',
        '<p><br></p><ol><li style=\"text-align: start;\">施工前准备：对车辆进行全方位清洗，特别要注重汽车玻璃表面清洁。选定品牌，根据车主喜好进行颜色的选择，并根据车辆本身的漆面颜色来进行适当的搭配。准备喷雾器、不起毛的擦洗布、棉毛巾、擦洗垫、刮刀和可替换刀片、清洁剂版和超级刮板、重型切刀、白塑料硬卡片等工具。检查无尘施工车间，确保施工环境干燥少尘。</li><li style=\"text-align: start;\">贴膜流程：内饰保护：用专用仪表盘罩遮盖在仪表台上，车内真皮座椅和高级座套也需用专用座椅套全部遮盖。玻璃清洗：玻璃表面清除胶粒、砂砾，除尘清洗三遍，贴膜前再清洗一次。清洗后挡风玻璃时务必小心加热丝的保护。裁膜：玻璃外侧表面套膜取样，掌握好尺寸，以方便下料，尽量做到不浪费材料。裁剪的边缘一定要平滑，不能参差不齐。定型：前挡风玻璃装贴前必须先定型，定性的手法要求“高温高速”。装贴：将膜材用配好的稀释剂均匀润湿后装贴在已经清洗好的玻璃上，将清水喷在膜的表面，用光滑的专用软性刮刀轻柔的将膜定位并把膜上的水分刮除。用较硬材质的专用刮刀用力将膜与玻璃之间的残留水分赶出来。</li><li style=\"text-align: start;\">施工完成后的检验：检查材料是否正确。检查前挡风玻璃、后挡风玻璃、侧面折痕是否符合标准。检查所有贴膜后的玻璃是否有水泡，水必须刮干净。检查侧玻璃窗贴膜裁切是否平直，侧窗玻璃升到顶部不能漏光，侧窗玻璃两边不能漏光。检查贴膜处玻璃是否有明显的划痕，侧窗胶条是否有新划痕。</li></ol>',
        '2025-02-04', 4000);
INSERT INTO `shoufeibiaozhun` (`id`, `addtime`, `shoufeixiangmu`, `fengmian`, `zhixingbiaozhun`, `shoufeixiangqing`,
                               `faburiqi`, `storeup_number`)
VALUES (3, '2025-02-04 11:06:56', '换胎费用 100',
        'file/shoufeibiaozhunFengmian3.jpg,file/shoufeibiaozhunFengmian4.jpg,file/shoufeibiaozhunFengmian5.jpg',
        '安全环境确认\n将车辆停至平坦、坚硬且远离车流的地面（如应急车道或停车场），避免斜坡或松软地面。\n开启双闪灯，在车后50-100米处放置三角警示牌（夜间或高速路需延长至150米以上）。\n乘客全部撤离至安全区域，避免在车内或车旁停留。\n工具与材料检查\n必备工具：千斤顶、扳手（套筒扳手或十字扳手）、备胎（或新轮胎）、轮胎螺母套筒。\n辅助工具：手套、手电筒（夜间使用）、轮胎气压表、防滑垫（防止千斤顶滑动）。\n检查备胎：确认备胎气压正常（通常为2.0-2.5Bar），无裂纹或老化现象。',
        '<p><br></p><ol><li style=\"text-align: start;\"><strong>安全环境确认</strong></li><li style=\"text-align: start;\"><strong>工具与材料检查</strong></li></ol>',
        '2025-02-04', 3);
INSERT INTO `shoufeibiaozhun` (`id`, `addtime`, `shoufeixiangmu`, `fengmian`, `zhixingbiaozhun`, `shoufeixiangqing`,
                               `faburiqi`, `storeup_number`)
VALUES (6, '2025-02-04 11:06:56', '收费项目6',
        'file/shoufeibiaozhunFengmian6.jpg,file/shoufeibiaozhunFengmian7.jpg,file/shoufeibiaozhunFengmian8.jpg',
        '执行标准6', '收费详情6', '2025-02-04', 1000);
COMMIT;

-- ----------------------------
-- Table structure for storeup
-- ----------------------------
DROP TABLE IF EXISTS `storeup`;
CREATE TABLE `storeup`
(
    `id`        bigint                                                        NOT NULL AUTO_INCREMENT COMMENT '主键',
    `addtime`   timestamp                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `refid`     bigint                                                                 DEFAULT NULL COMMENT 'refid',
    `tablename` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci          DEFAULT NULL COMMENT '表名',
    `name`      varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
    `picture`   longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '图片',
    `type`      varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci          DEFAULT '1' COMMENT '类型(1:收藏,21:赞,22:踩,31:竞拍参与,41:关注)',
    `inteltype` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci          DEFAULT NULL COMMENT '推荐类型',
    `remark`    varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci          DEFAULT NULL COMMENT '备注',
    `userid`    bigint                                                        NOT NULL COMMENT '用户id',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='我的收藏';

-- ----------------------------
-- Records of storeup
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for system_notice
-- ----------------------------
DROP TABLE IF EXISTS `system_notice`;
CREATE TABLE `system_notice`
(
    `id`      bigint    NOT NULL AUTO_INCREMENT COMMENT '主键',
    `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '公告内容',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='系统公告';

-- ----------------------------
-- Records of system_notice
-- ----------------------------
BEGIN;
INSERT INTO `system_notice` (`id`, `addtime`, `content`)
VALUES (1, '2025-02-04 11:06:56', '公告信息...');
COMMIT;

-- ----------------------------
-- Table structure for token
-- ----------------------------
DROP TABLE IF EXISTS `token`;
CREATE TABLE `token`
(
    `id`            bigint       NOT NULL AUTO_INCREMENT COMMENT '主键',
    `userid`        bigint       NOT NULL COMMENT '用户id',
    `username`      varchar(100) NOT NULL COMMENT '用户名',
    `tablename`     varchar(100)          DEFAULT NULL COMMENT '表名',
    `role`          varchar(100)          DEFAULT NULL COMMENT '角色',
    `token`         varchar(200) NOT NULL COMMENT '密码',
    `addtime`       timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
    `expiratedtime` timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='token表';

-- ----------------------------
-- Records of token
-- ----------------------------
BEGIN;
INSERT INTO `token` (`id`, `userid`, `username`, `tablename`, `role`, `token`, `addtime`, `expiratedtime`)
VALUES (1, 1, 'admin', 'users', '管理员', 'r5r0fd255gsac491hbmf92fm4dei7h5q', '2025-11-17 09:07:40',
        '2025-11-17 10:07:41');
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`
(
    `id`       bigint                                                        NOT NULL AUTO_INCREMENT COMMENT '主键',
    `addtime`  timestamp                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `username` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
    `password` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
    `role`     varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci          DEFAULT NULL COMMENT '角色',
    `touxiang` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '头像',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='管理员';

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` (`id`, `addtime`, `username`, `password`, `role`, `touxiang`)
VALUES (1, '2025-02-04 11:06:56', 'admin', 'admin', '管理员', NULL);
COMMIT;

-- ----------------------------
-- Table structure for weixiufenpei
-- ----------------------------
DROP TABLE IF EXISTS `weixiufenpei`;
CREATE TABLE `weixiufenpei`
(
    `id`              bigint    NOT NULL AUTO_INCREMENT COMMENT '主键',
    `addtime`         timestamp NOT NULL                                            DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `baoxiubianhao`   varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '报修编号',
    `chepaihao`       varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '车牌号',
    `chexing`         varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '车型',
    `cheliangpinpai`  varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '车辆品牌',
    `cheliangxinghao` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '车辆型号',
    `yonghuzhanghao`  varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户账号',
    `yonghuxingming`  varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户姓名',
    `guzhangleixing`  varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '故障类型',
    `baoxiubiaoti`    varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '报修标题',
    `baoxiuyuanyin`   longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '报修原因',
    `fenpeishijian`   datetime                                                      DEFAULT NULL COMMENT '分配时间',
    `weixiuzhanghao`  varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '维修账号',
    `weixiuxingming`  varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '维修姓名',
    `weixiuzhuangtai` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '维修状态',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='维修分配';

-- ----------------------------
-- Records of weixiufenpei
-- ----------------------------
BEGIN;
INSERT INTO `weixiufenpei` (`id`, `addtime`, `baoxiubianhao`, `chepaihao`, `chexing`, `cheliangpinpai`,
                            `cheliangxinghao`, `yonghuzhanghao`, `yonghuxingming`, `guzhangleixing`, `baoxiubiaoti`,
                            `baoxiuyuanyin`, `fenpeishijian`, `weixiuzhanghao`, `weixiuxingming`, `weixiuzhuangtai`)
VALUES (1, '2025-02-04 11:06:56', '报修编号1', '车牌号1', '车型1', '车辆品牌1', '车辆型号1', '用户账号1', '用户姓名1',
        '故障类型1', '报修标题1', '报修原因1', '2025-02-04 11:06:56', '维修账号1', '维修姓名1', '已维修');
INSERT INTO `weixiufenpei` (`id`, `addtime`, `baoxiubianhao`, `chepaihao`, `chexing`, `cheliangpinpai`,
                            `cheliangxinghao`, `yonghuzhanghao`, `yonghuxingming`, `guzhangleixing`, `baoxiubiaoti`,
                            `baoxiuyuanyin`, `fenpeishijian`, `weixiuzhanghao`, `weixiuxingming`, `weixiuzhuangtai`)
VALUES (2, '2025-02-04 11:06:56', '报修编号2', '车牌号2', '车型2', '车辆品牌2', '车辆型号2', '用户账号2', '用户姓名2',
        '故障类型2', '报修标题2', '报修原因2', '2025-02-04 11:06:56', '维修账号2', '维修姓名2', '已维修');
INSERT INTO `weixiufenpei` (`id`, `addtime`, `baoxiubianhao`, `chepaihao`, `chexing`, `cheliangpinpai`,
                            `cheliangxinghao`, `yonghuzhanghao`, `yonghuxingming`, `guzhangleixing`, `baoxiubiaoti`,
                            `baoxiuyuanyin`, `fenpeishijian`, `weixiuzhanghao`, `weixiuxingming`, `weixiuzhuangtai`)
VALUES (3, '2025-02-04 11:06:56', '报修编号3', '车牌号3', '车型3', '车辆品牌3', '车辆型号3', '用户账号3', '用户姓名3',
        '故障类型3', '报修标题3', '报修原因3', '2025-02-04 11:06:56', '维修账号3', '维修姓名3', '已维修');
INSERT INTO `weixiufenpei` (`id`, `addtime`, `baoxiubianhao`, `chepaihao`, `chexing`, `cheliangpinpai`,
                            `cheliangxinghao`, `yonghuzhanghao`, `yonghuxingming`, `guzhangleixing`, `baoxiubiaoti`,
                            `baoxiuyuanyin`, `fenpeishijian`, `weixiuzhanghao`, `weixiuxingming`, `weixiuzhuangtai`)
VALUES (4, '2025-02-04 11:06:56', '报修编号4', '车牌号4', '车型4', '车辆品牌4', '车辆型号4', '用户账号4', '用户姓名4',
        '故障类型4', '报修标题4', '报修原因4', '2025-02-04 11:06:56', '维修账号4', '维修姓名4', '已维修');
INSERT INTO `weixiufenpei` (`id`, `addtime`, `baoxiubianhao`, `chepaihao`, `chexing`, `cheliangpinpai`,
                            `cheliangxinghao`, `yonghuzhanghao`, `yonghuxingming`, `guzhangleixing`, `baoxiubiaoti`,
                            `baoxiuyuanyin`, `fenpeishijian`, `weixiuzhanghao`, `weixiuxingming`, `weixiuzhuangtai`)
VALUES (5, '2025-02-04 11:06:56', '报修编号5', '车牌号5', '车型5', '车辆品牌5', '车辆型号5', '用户账号5', '用户姓名5',
        '故障类型5', '报修标题5', '报修原因5', '2025-02-04 11:06:56', '维修账号5', '维修姓名5', '已维修');
INSERT INTO `weixiufenpei` (`id`, `addtime`, `baoxiubianhao`, `chepaihao`, `chexing`, `cheliangpinpai`,
                            `cheliangxinghao`, `yonghuzhanghao`, `yonghuxingming`, `guzhangleixing`, `baoxiubiaoti`,
                            `baoxiuyuanyin`, `fenpeishijian`, `weixiuzhanghao`, `weixiuxingming`, `weixiuzhuangtai`)
VALUES (6, '2025-02-04 11:06:56', '报修编号6', '车牌号6', '车型6', '车辆品牌6', '车辆型号6', '用户账号6', '用户姓名6',
        '故障类型6', '报修标题6', '报修原因6', '2025-02-04 11:06:56', '维修账号6', '维修姓名6', '已维修');
INSERT INTO `weixiufenpei` (`id`, `addtime`, `baoxiubianhao`, `chepaihao`, `chexing`, `cheliangpinpai`,
                            `cheliangxinghao`, `yonghuzhanghao`, `yonghuxingming`, `guzhangleixing`, `baoxiubiaoti`,
                            `baoxiuyuanyin`, `fenpeishijian`, `weixiuzhanghao`, `weixiuxingming`, `weixiuzhuangtai`)
VALUES (7, '2025-02-04 11:06:56', '报修编号7', '车牌号7', '车型7', '车辆品牌7', '车辆型号7', '用户账号7', '用户姓名7',
        '故障类型7', '报修标题7', '报修原因7', '2025-02-04 11:06:56', '维修账号7', '维修姓名7', '已维修');
INSERT INTO `weixiufenpei` (`id`, `addtime`, `baoxiubianhao`, `chepaihao`, `chexing`, `cheliangpinpai`,
                            `cheliangxinghao`, `yonghuzhanghao`, `yonghuxingming`, `guzhangleixing`, `baoxiubiaoti`,
                            `baoxiuyuanyin`, `fenpeishijian`, `weixiuzhanghao`, `weixiuxingming`, `weixiuzhuangtai`)
VALUES (8, '2025-02-04 11:06:56', '报修编号8', '车牌号8', '车型8', '车辆品牌8', '车辆型号8', '用户账号8', '用户姓名8',
        '故障类型8', '报修标题8', '报修原因8', '2025-02-04 11:06:56', '维修账号8', '维修姓名8', '已维修');
INSERT INTO `weixiufenpei` (`id`, `addtime`, `baoxiubianhao`, `chepaihao`, `chexing`, `cheliangpinpai`,
                            `cheliangxinghao`, `yonghuzhanghao`, `yonghuxingming`, `guzhangleixing`, `baoxiubiaoti`,
                            `baoxiuyuanyin`, `fenpeishijian`, `weixiuzhanghao`, `weixiuxingming`, `weixiuzhuangtai`)
VALUES (9, '2025-02-04 11:06:56', '报修编号9', '车牌号9', '车型9', '车辆品牌9', '车辆型号9', '用户账号9', '用户姓名9',
        '故障类型9', '报修标题9', '报修原因9', '2025-02-04 11:06:56', '维修账号9', '维修姓名9', '已维修');
INSERT INTO `weixiufenpei` (`id`, `addtime`, `baoxiubianhao`, `chepaihao`, `chexing`, `cheliangpinpai`,
                            `cheliangxinghao`, `yonghuzhanghao`, `yonghuxingming`, `guzhangleixing`, `baoxiubiaoti`,
                            `baoxiuyuanyin`, `fenpeishijian`, `weixiuzhanghao`, `weixiuxingming`, `weixiuzhuangtai`)
VALUES (10, '2025-02-04 11:06:56', '报修编号10', '车牌号10', '车型10', '车辆品牌10', '车辆型号10', '用户账号10',
        '用户姓名10', '故障类型10', '报修标题10', '报修原因10', '2025-02-04 11:06:56', '维修账号10', '维修姓名10',
        '已维修');
COMMIT;

-- ----------------------------
-- Table structure for weixiupingjia
-- ----------------------------
DROP TABLE IF EXISTS `weixiupingjia`;
CREATE TABLE `weixiupingjia`
(
    `id`              bigint    NOT NULL AUTO_INCREMENT COMMENT '主键',
    `addtime`         timestamp NOT NULL                                            DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `chepaihao`       varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '车牌号',
    `chexing`         varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '车型',
    `cheliangpinpai`  varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '车辆品牌',
    `cheliangxinghao` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '车辆型号',
    `yonghuzhanghao`  varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户账号',
    `yonghuxingming`  varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户姓名',
    `baoxiubiaoti`    varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '报修标题',
    `weixiuzhanghao`  varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '维修账号',
    `weixiuxingming`  varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '维修姓名',
    `pingfen`         varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '评分',
    `pingyu`          longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '评语',
    `pingjiashijian`  datetime                                                      DEFAULT NULL COMMENT '评价时间',
    `crossuserid`     bigint                                                        DEFAULT NULL COMMENT '跨表用户id',
    `crossrefid`      bigint                                                        DEFAULT NULL COMMENT '跨表主键id',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='维修评价';

-- ----------------------------
-- Records of weixiupingjia
-- ----------------------------
BEGIN;
INSERT INTO `weixiupingjia` (`id`, `addtime`, `chepaihao`, `chexing`, `cheliangpinpai`, `cheliangxinghao`,
                             `yonghuzhanghao`, `yonghuxingming`, `baoxiubiaoti`, `weixiuzhanghao`, `weixiuxingming`,
                             `pingfen`, `pingyu`, `pingjiashijian`, `crossuserid`, `crossrefid`)
VALUES (1, '2025-02-04 11:06:55', '车牌号1', '车型1', '车辆品牌1', '车辆型号1', '用户账号1', '用户姓名1', '报修标题1',
        '维修账号1', '维修姓名1', '1', '评语1', '2025-02-04 11:06:55', 1, 1);
INSERT INTO `weixiupingjia` (`id`, `addtime`, `chepaihao`, `chexing`, `cheliangpinpai`, `cheliangxinghao`,
                             `yonghuzhanghao`, `yonghuxingming`, `baoxiubiaoti`, `weixiuzhanghao`, `weixiuxingming`,
                             `pingfen`, `pingyu`, `pingjiashijian`, `crossuserid`, `crossrefid`)
VALUES (2, '2025-02-04 11:06:55', '车牌号2', '车型2', '车辆品牌2', '车辆型号2', '用户账号2', '用户姓名2', '报修标题2',
        '维修账号2', '维修姓名2', '1', '评语2', '2025-02-04 11:06:55', 2, 2);
INSERT INTO `weixiupingjia` (`id`, `addtime`, `chepaihao`, `chexing`, `cheliangpinpai`, `cheliangxinghao`,
                             `yonghuzhanghao`, `yonghuxingming`, `baoxiubiaoti`, `weixiuzhanghao`, `weixiuxingming`,
                             `pingfen`, `pingyu`, `pingjiashijian`, `crossuserid`, `crossrefid`)
VALUES (3, '2025-02-04 11:06:55', '车牌号3', '车型3', '车辆品牌3', '车辆型号3', '用户账号3', '用户姓名3', '报修标题3',
        '维修账号3', '维修姓名3', '1', '评语3', '2025-02-04 11:06:55', 3, 3);
INSERT INTO `weixiupingjia` (`id`, `addtime`, `chepaihao`, `chexing`, `cheliangpinpai`, `cheliangxinghao`,
                             `yonghuzhanghao`, `yonghuxingming`, `baoxiubiaoti`, `weixiuzhanghao`, `weixiuxingming`,
                             `pingfen`, `pingyu`, `pingjiashijian`, `crossuserid`, `crossrefid`)
VALUES (4, '2025-02-04 11:06:55', '车牌号4', '车型4', '车辆品牌4', '车辆型号4', '用户账号4', '用户姓名4', '报修标题4',
        '维修账号4', '维修姓名4', '1', '评语4', '2025-02-04 11:06:55', 4, 4);
INSERT INTO `weixiupingjia` (`id`, `addtime`, `chepaihao`, `chexing`, `cheliangpinpai`, `cheliangxinghao`,
                             `yonghuzhanghao`, `yonghuxingming`, `baoxiubiaoti`, `weixiuzhanghao`, `weixiuxingming`,
                             `pingfen`, `pingyu`, `pingjiashijian`, `crossuserid`, `crossrefid`)
VALUES (5, '2025-02-04 11:06:55', '车牌号5', '车型5', '车辆品牌5', '车辆型号5', '用户账号5', '用户姓名5', '报修标题5',
        '维修账号5', '维修姓名5', '1', '评语5', '2025-02-04 11:06:55', 5, 5);
INSERT INTO `weixiupingjia` (`id`, `addtime`, `chepaihao`, `chexing`, `cheliangpinpai`, `cheliangxinghao`,
                             `yonghuzhanghao`, `yonghuxingming`, `baoxiubiaoti`, `weixiuzhanghao`, `weixiuxingming`,
                             `pingfen`, `pingyu`, `pingjiashijian`, `crossuserid`, `crossrefid`)
VALUES (6, '2025-02-04 11:06:55', '车牌号6', '车型6', '车辆品牌6', '车辆型号6', '用户账号6', '用户姓名6', '报修标题6',
        '维修账号6', '维修姓名6', '1', '评语6', '2025-02-04 11:06:55', 6, 6);
INSERT INTO `weixiupingjia` (`id`, `addtime`, `chepaihao`, `chexing`, `cheliangpinpai`, `cheliangxinghao`,
                             `yonghuzhanghao`, `yonghuxingming`, `baoxiubiaoti`, `weixiuzhanghao`, `weixiuxingming`,
                             `pingfen`, `pingyu`, `pingjiashijian`, `crossuserid`, `crossrefid`)
VALUES (7, '2025-02-04 11:06:55', '车牌号7', '车型7', '车辆品牌7', '车辆型号7', '用户账号7', '用户姓名7', '报修标题7',
        '维修账号7', '维修姓名7', '1', '评语7', '2025-02-04 11:06:55', 7, 7);
INSERT INTO `weixiupingjia` (`id`, `addtime`, `chepaihao`, `chexing`, `cheliangpinpai`, `cheliangxinghao`,
                             `yonghuzhanghao`, `yonghuxingming`, `baoxiubiaoti`, `weixiuzhanghao`, `weixiuxingming`,
                             `pingfen`, `pingyu`, `pingjiashijian`, `crossuserid`, `crossrefid`)
VALUES (8, '2025-02-04 11:06:55', '车牌号8', '车型8', '车辆品牌8', '车辆型号8', '用户账号8', '用户姓名8', '报修标题8',
        '维修账号8', '维修姓名8', '1', '评语8', '2025-02-04 11:06:55', 8, 8);
INSERT INTO `weixiupingjia` (`id`, `addtime`, `chepaihao`, `chexing`, `cheliangpinpai`, `cheliangxinghao`,
                             `yonghuzhanghao`, `yonghuxingming`, `baoxiubiaoti`, `weixiuzhanghao`, `weixiuxingming`,
                             `pingfen`, `pingyu`, `pingjiashijian`, `crossuserid`, `crossrefid`)
VALUES (9, '2025-02-04 11:06:55', '车牌号9', '车型9', '车辆品牌9', '车辆型号9', '用户账号9', '用户姓名9', '报修标题9',
        '维修账号9', '维修姓名9', '1', '评语9', '2025-02-04 11:06:55', 9, 9);
INSERT INTO `weixiupingjia` (`id`, `addtime`, `chepaihao`, `chexing`, `cheliangpinpai`, `cheliangxinghao`,
                             `yonghuzhanghao`, `yonghuxingming`, `baoxiubiaoti`, `weixiuzhanghao`, `weixiuxingming`,
                             `pingfen`, `pingyu`, `pingjiashijian`, `crossuserid`, `crossrefid`)
VALUES (10, '2025-02-04 11:06:55', '车牌号10', '车型10', '车辆品牌10', '车辆型号10', '用户账号10', '用户姓名10',
        '报修标题10', '维修账号10', '维修姓名10', '1', '评语10', '2025-02-04 11:06:55', 10, 10);
COMMIT;

-- ----------------------------
-- Table structure for weixiuxinxi
-- ----------------------------
DROP TABLE IF EXISTS `weixiuxinxi`;
CREATE TABLE `weixiuxinxi`
(
    `id`              bigint    NOT NULL AUTO_INCREMENT COMMENT '主键',
    `addtime`         timestamp NOT NULL                                            DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `chepaihao`       varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '车牌号',
    `chexing`         varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '车型',
    `cheliangpinpai`  varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '车辆品牌',
    `cheliangxinghao` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '车辆型号',
    `yonghuzhanghao`  varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户账号',
    `yonghuxingming`  varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户姓名',
    `baoxiubiaoti`    varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '报修标题',
    `weixiuzhanghao`  varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '维修账号',
    `weixiuxingming`  varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '维修姓名',
    `ispay`           varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否支付',
    `guzhangweizhi`   varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '故障位置',
    `guzhangyuanyin`  varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '故障原因',
    `weixiufeiyong`   double                                                        DEFAULT NULL COMMENT '维修费用',
    `weixiuneirong`   longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '维修内容',
    `jianchabaogao`   longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '检查报告',
    `jianyixinxi`     varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '建议信息',
    `weixiushijian`   datetime                                                      DEFAULT NULL COMMENT '维修时间',
    `weixiucishu`     int                                                           DEFAULT NULL COMMENT '维修次数',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='维修信息';

-- ----------------------------
-- Records of weixiuxinxi
-- ----------------------------
BEGIN;
INSERT INTO `weixiuxinxi` (`id`, `addtime`, `chepaihao`, `chexing`, `cheliangpinpai`, `cheliangxinghao`,
                           `yonghuzhanghao`, `yonghuxingming`, `baoxiubiaoti`, `weixiuzhanghao`, `weixiuxingming`,
                           `ispay`, `guzhangweizhi`, `guzhangyuanyin`, `weixiufeiyong`, `weixiuneirong`,
                           `jianchabaogao`, `jianyixinxi`, `weixiushijian`, `weixiucishu`)
VALUES (1, '2025-02-04 11:06:55', '车牌号1', '车型1', '车辆品牌1', '车辆型号1', '用户账号1', '用户姓名1', '报修标题1',
        '维修账号1', '维修姓名1', '未支付', '故障位置1', '故障原因1', 1, '维修内容1', '', '建议信息1',
        '2025-02-04 11:06:55', 1);
INSERT INTO `weixiuxinxi` (`id`, `addtime`, `chepaihao`, `chexing`, `cheliangpinpai`, `cheliangxinghao`,
                           `yonghuzhanghao`, `yonghuxingming`, `baoxiubiaoti`, `weixiuzhanghao`, `weixiuxingming`,
                           `ispay`, `guzhangweizhi`, `guzhangyuanyin`, `weixiufeiyong`, `weixiuneirong`,
                           `jianchabaogao`, `jianyixinxi`, `weixiushijian`, `weixiucishu`)
VALUES (2, '2025-02-04 11:06:55', '车牌号2', '车型2', '车辆品牌2', '车辆型号2', '用户账号2', '用户姓名2', '报修标题2',
        '维修账号2', '维修姓名2', '未支付', '故障位置2', '故障原因2', 2, '维修内容2', '', '建议信息2',
        '2025-02-04 11:06:55', 2);
INSERT INTO `weixiuxinxi` (`id`, `addtime`, `chepaihao`, `chexing`, `cheliangpinpai`, `cheliangxinghao`,
                           `yonghuzhanghao`, `yonghuxingming`, `baoxiubiaoti`, `weixiuzhanghao`, `weixiuxingming`,
                           `ispay`, `guzhangweizhi`, `guzhangyuanyin`, `weixiufeiyong`, `weixiuneirong`,
                           `jianchabaogao`, `jianyixinxi`, `weixiushijian`, `weixiucishu`)
VALUES (3, '2025-02-04 11:06:55', '车牌号3', '车型3', '车辆品牌3', '车辆型号3', '用户账号3', '用户姓名3', '报修标题3',
        '维修账号3', '维修姓名3', '未支付', '故障位置3', '故障原因3', 3, '维修内容3', '', '建议信息3',
        '2025-02-04 11:06:55', 3);
INSERT INTO `weixiuxinxi` (`id`, `addtime`, `chepaihao`, `chexing`, `cheliangpinpai`, `cheliangxinghao`,
                           `yonghuzhanghao`, `yonghuxingming`, `baoxiubiaoti`, `weixiuzhanghao`, `weixiuxingming`,
                           `ispay`, `guzhangweizhi`, `guzhangyuanyin`, `weixiufeiyong`, `weixiuneirong`,
                           `jianchabaogao`, `jianyixinxi`, `weixiushijian`, `weixiucishu`)
VALUES (4, '2025-02-04 11:06:55', '车牌号4', '车型4', '车辆品牌4', '车辆型号4', '用户账号4', '用户姓名4', '报修标题4',
        '维修账号4', '维修姓名4', '未支付', '故障位置4', '故障原因4', 4, '维修内容4', '', '建议信息4',
        '2025-02-04 11:06:55', 4);
INSERT INTO `weixiuxinxi` (`id`, `addtime`, `chepaihao`, `chexing`, `cheliangpinpai`, `cheliangxinghao`,
                           `yonghuzhanghao`, `yonghuxingming`, `baoxiubiaoti`, `weixiuzhanghao`, `weixiuxingming`,
                           `ispay`, `guzhangweizhi`, `guzhangyuanyin`, `weixiufeiyong`, `weixiuneirong`,
                           `jianchabaogao`, `jianyixinxi`, `weixiushijian`, `weixiucishu`)
VALUES (5, '2025-02-04 11:06:55', '车牌号5', '车型5', '车辆品牌5', '车辆型号5', '用户账号5', '用户姓名5', '报修标题5',
        '维修账号5', '维修姓名5', '未支付', '故障位置5', '故障原因5', 5, '维修内容5', '', '建议信息5',
        '2025-02-04 11:06:55', 5);
INSERT INTO `weixiuxinxi` (`id`, `addtime`, `chepaihao`, `chexing`, `cheliangpinpai`, `cheliangxinghao`,
                           `yonghuzhanghao`, `yonghuxingming`, `baoxiubiaoti`, `weixiuzhanghao`, `weixiuxingming`,
                           `ispay`, `guzhangweizhi`, `guzhangyuanyin`, `weixiufeiyong`, `weixiuneirong`,
                           `jianchabaogao`, `jianyixinxi`, `weixiushijian`, `weixiucishu`)
VALUES (6, '2025-02-04 11:06:55', '车牌号6', '车型6', '车辆品牌6', '车辆型号6', '用户账号6', '用户姓名6', '报修标题6',
        '维修账号6', '维修姓名6', '未支付', '故障位置6', '故障原因6', 6, '维修内容6', '', '建议信息6',
        '2025-02-04 11:06:55', 6);
INSERT INTO `weixiuxinxi` (`id`, `addtime`, `chepaihao`, `chexing`, `cheliangpinpai`, `cheliangxinghao`,
                           `yonghuzhanghao`, `yonghuxingming`, `baoxiubiaoti`, `weixiuzhanghao`, `weixiuxingming`,
                           `ispay`, `guzhangweizhi`, `guzhangyuanyin`, `weixiufeiyong`, `weixiuneirong`,
                           `jianchabaogao`, `jianyixinxi`, `weixiushijian`, `weixiucishu`)
VALUES (7, '2025-02-04 11:06:55', '车牌号7', '车型7', '车辆品牌7', '车辆型号7', '用户账号7', '用户姓名7', '报修标题7',
        '维修账号7', '维修姓名7', '未支付', '故障位置7', '故障原因7', 7, '维修内容7', '', '建议信息7',
        '2025-02-04 11:06:55', 7);
INSERT INTO `weixiuxinxi` (`id`, `addtime`, `chepaihao`, `chexing`, `cheliangpinpai`, `cheliangxinghao`,
                           `yonghuzhanghao`, `yonghuxingming`, `baoxiubiaoti`, `weixiuzhanghao`, `weixiuxingming`,
                           `ispay`, `guzhangweizhi`, `guzhangyuanyin`, `weixiufeiyong`, `weixiuneirong`,
                           `jianchabaogao`, `jianyixinxi`, `weixiushijian`, `weixiucishu`)
VALUES (8, '2025-02-04 11:06:55', '车牌号8', '车型8', '车辆品牌8', '车辆型号8', '用户账号8', '用户姓名8', '报修标题8',
        '维修账号8', '维修姓名8', '未支付', '故障位置8', '故障原因8', 8, '维修内容8', '', '建议信息8',
        '2025-02-04 11:06:55', 8);
INSERT INTO `weixiuxinxi` (`id`, `addtime`, `chepaihao`, `chexing`, `cheliangpinpai`, `cheliangxinghao`,
                           `yonghuzhanghao`, `yonghuxingming`, `baoxiubiaoti`, `weixiuzhanghao`, `weixiuxingming`,
                           `ispay`, `guzhangweizhi`, `guzhangyuanyin`, `weixiufeiyong`, `weixiuneirong`,
                           `jianchabaogao`, `jianyixinxi`, `weixiushijian`, `weixiucishu`)
VALUES (9, '2025-02-04 11:06:55', '车牌号9', '车型9', '车辆品牌9', '车辆型号9', '用户账号9', '用户姓名9', '报修标题9',
        '维修账号9', '维修姓名9', '未支付', '故障位置9', '故障原因9', 9, '维修内容9', '', '建议信息9',
        '2025-02-04 11:06:55', 9);
INSERT INTO `weixiuxinxi` (`id`, `addtime`, `chepaihao`, `chexing`, `cheliangpinpai`, `cheliangxinghao`,
                           `yonghuzhanghao`, `yonghuxingming`, `baoxiubiaoti`, `weixiuzhanghao`, `weixiuxingming`,
                           `ispay`, `guzhangweizhi`, `guzhangyuanyin`, `weixiufeiyong`, `weixiuneirong`,
                           `jianchabaogao`, `jianyixinxi`, `weixiushijian`, `weixiucishu`)
VALUES (10, '2025-02-04 11:06:55', '车牌号10', '车型10', '车辆品牌10', '车辆型号10', '用户账号10', '用户姓名10',
        '报修标题10', '维修账号10', '维修姓名10', '未支付', '故障位置10', '故障原因10', 10, '维修内容10', '',
        '建议信息10', '2025-02-04 11:06:55', 10);
COMMIT;

-- ----------------------------
-- Table structure for weixiuyuan
-- ----------------------------
DROP TABLE IF EXISTS `weixiuyuan`;
CREATE TABLE `weixiuyuan`
(
    `id`              bigint                                                        NOT NULL AUTO_INCREMENT COMMENT '主键',
    `addtime`         timestamp                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `weixiuzhanghao`  varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '维修账号',
    `mima`            varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
    `weixiuxingming`  varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '维修姓名',
    `touxiang`        longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '头像',
    `xingbie`         varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci          DEFAULT NULL COMMENT '性别',
    `lianxidianhua`   varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci          DEFAULT NULL COMMENT '联系电话',
    `shenfenzhenghao` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci          DEFAULT NULL COMMENT '身份证号',
    `sfsh`            varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci          DEFAULT NULL COMMENT '是否审核',
    `shhf`            longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '回复内容',
    PRIMARY KEY (`id`),
    UNIQUE KEY `weixiuzhanghao` (`weixiuzhanghao`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='维修员';

-- ----------------------------
-- Records of weixiuyuan
-- ----------------------------
BEGIN;
INSERT INTO `weixiuyuan` (`id`, `addtime`, `weixiuzhanghao`, `mima`, `weixiuxingming`, `touxiang`, `xingbie`,
                          `lianxidianhua`, `shenfenzhenghao`, `sfsh`, `shhf`)
VALUES (91, '2025-02-04 11:06:55', '维修账号1', '123456', '维修姓名1', 'file/weixiuyuanTouxiang1.jpg', '男',
        '19819881111', '441622200101010001', '是', '');
INSERT INTO `weixiuyuan` (`id`, `addtime`, `weixiuzhanghao`, `mima`, `weixiuxingming`, `touxiang`, `xingbie`,
                          `lianxidianhua`, `shenfenzhenghao`, `sfsh`, `shhf`)
VALUES (92, '2025-02-04 11:06:55', '维修账号2', '123456', '维修姓名2', 'file/weixiuyuanTouxiang2.jpg', '男',
        '19819881112', '441622200202020002', '是', '');
INSERT INTO `weixiuyuan` (`id`, `addtime`, `weixiuzhanghao`, `mima`, `weixiuxingming`, `touxiang`, `xingbie`,
                          `lianxidianhua`, `shenfenzhenghao`, `sfsh`, `shhf`)
VALUES (93, '2025-02-04 11:06:55', '维修账号3', '123456', '维修姓名3', 'file/weixiuyuanTouxiang3.jpg', '男',
        '19819881113', '441622200303030003', '是', '');
INSERT INTO `weixiuyuan` (`id`, `addtime`, `weixiuzhanghao`, `mima`, `weixiuxingming`, `touxiang`, `xingbie`,
                          `lianxidianhua`, `shenfenzhenghao`, `sfsh`, `shhf`)
VALUES (94, '2025-02-04 11:06:55', '维修账号4', '123456', '维修姓名4', 'file/weixiuyuanTouxiang4.jpg', '男',
        '19819881114', '441622200404040004', '是', '');
INSERT INTO `weixiuyuan` (`id`, `addtime`, `weixiuzhanghao`, `mima`, `weixiuxingming`, `touxiang`, `xingbie`,
                          `lianxidianhua`, `shenfenzhenghao`, `sfsh`, `shhf`)
VALUES (95, '2025-02-04 11:06:55', '维修账号5', '123456', '维修姓名5', 'file/weixiuyuanTouxiang5.jpg', '男',
        '19819881115', '441622200505050005', '是', '');
INSERT INTO `weixiuyuan` (`id`, `addtime`, `weixiuzhanghao`, `mima`, `weixiuxingming`, `touxiang`, `xingbie`,
                          `lianxidianhua`, `shenfenzhenghao`, `sfsh`, `shhf`)
VALUES (96, '2025-02-04 11:06:55', '维修账号6', '123456', '维修姓名6', 'file/weixiuyuanTouxiang6.jpg', '男',
        '19819881116', '441622200606060006', '是', '');
INSERT INTO `weixiuyuan` (`id`, `addtime`, `weixiuzhanghao`, `mima`, `weixiuxingming`, `touxiang`, `xingbie`,
                          `lianxidianhua`, `shenfenzhenghao`, `sfsh`, `shhf`)
VALUES (97, '2025-02-04 11:06:55', '维修账号7', '123456', '维修姓名7', 'file/weixiuyuanTouxiang7.jpg', '男',
        '19819881117', '441622200707070007', '是', '');
INSERT INTO `weixiuyuan` (`id`, `addtime`, `weixiuzhanghao`, `mima`, `weixiuxingming`, `touxiang`, `xingbie`,
                          `lianxidianhua`, `shenfenzhenghao`, `sfsh`, `shhf`)
VALUES (98, '2025-02-04 11:06:55', '维修账号8', '123456', '维修姓名8', 'file/weixiuyuanTouxiang8.jpg', '男',
        '19819881118', '441622200808080008', '是', '');
INSERT INTO `weixiuyuan` (`id`, `addtime`, `weixiuzhanghao`, `mima`, `weixiuxingming`, `touxiang`, `xingbie`,
                          `lianxidianhua`, `shenfenzhenghao`, `sfsh`, `shhf`)
VALUES (99, '2025-02-04 11:06:55', '维修账号9', '123456', '维修姓名9', 'file/weixiuyuanTouxiang9.jpg', '男',
        '19819881119', '441622200909090009', '是', '');
INSERT INTO `weixiuyuan` (`id`, `addtime`, `weixiuzhanghao`, `mima`, `weixiuxingming`, `touxiang`, `xingbie`,
                          `lianxidianhua`, `shenfenzhenghao`, `sfsh`, `shhf`)
VALUES (100, '2025-02-04 11:06:55', '维修账号10', '123456', '维修姓名10', 'file/weixiuyuanTouxiang10.jpg', '男',
        '198198811110', '4416222001001001000010', '是', '');
COMMIT;

-- ----------------------------
-- Table structure for weixiuyuyue
-- ----------------------------
DROP TABLE IF EXISTS `weixiuyuyue`;
CREATE TABLE `weixiuyuyue`
(
    `id`              bigint    NOT NULL AUTO_INCREMENT COMMENT '主键',
    `addtime`         timestamp NOT NULL                                            DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `baoxiubianhao`   varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '报修编号',
    `chepaihao`       varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '车牌号',
    `chexing`         varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '车型',
    `cheliangpinpai`  varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '车辆品牌',
    `cheliangxinghao` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '车辆型号',
    `yonghuzhanghao`  varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户账号',
    `yonghuxingming`  varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户姓名',
    `guzhangleixing`  varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '故障类型',
    `yuyuecishu`      int                                                           DEFAULT NULL COMMENT '预约次数',
    `baoxiubiaoti`    varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '报修标题',
    `baoxiuyuanyin`   varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '报修原因',
    `yuyueshijian`    datetime                                                      DEFAULT NULL COMMENT '预约时间',
    `sfsh`            varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否审核',
    `shhf`            longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '回复内容',
    `fenpeizhuangtai` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分配状态',
    `beizhu`          varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`),
    UNIQUE KEY `baoxiubianhao` (`baoxiubianhao`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='维修预约';

-- ----------------------------
-- Records of weixiuyuyue
-- ----------------------------
BEGIN;
INSERT INTO `weixiuyuyue` (`id`, `addtime`, `baoxiubianhao`, `chepaihao`, `chexing`, `cheliangpinpai`,
                           `cheliangxinghao`, `yonghuzhanghao`, `yonghuxingming`, `guzhangleixing`, `yuyuecishu`,
                           `baoxiubiaoti`, `baoxiuyuanyin`, `yuyueshijian`, `sfsh`, `shhf`, `fenpeizhuangtai`, `beizhu`)
VALUES (1, '2025-02-04 11:06:55', '1111111111', '车牌号1', '车型1', '车辆品牌1', '车辆型号1', '用户账号1', '用户姓名1',
        '故障类型1', 1, '报修标题1', '报修原因1', '2025-02-04 11:06:55', '是', '', '已分配', '备注1');
INSERT INTO `weixiuyuyue` (`id`, `addtime`, `baoxiubianhao`, `chepaihao`, `chexing`, `cheliangpinpai`,
                           `cheliangxinghao`, `yonghuzhanghao`, `yonghuxingming`, `guzhangleixing`, `yuyuecishu`,
                           `baoxiubiaoti`, `baoxiuyuanyin`, `yuyueshijian`, `sfsh`, `shhf`, `fenpeizhuangtai`, `beizhu`)
VALUES (2, '2025-02-04 11:06:55', '2222222222', '车牌号2', '车型2', '车辆品牌2', '车辆型号2', '用户账号2', '用户姓名2',
        '故障类型2', 2, '报修标题2', '报修原因2', '2025-02-04 11:06:55', '是', '', '已分配', '备注2');
INSERT INTO `weixiuyuyue` (`id`, `addtime`, `baoxiubianhao`, `chepaihao`, `chexing`, `cheliangpinpai`,
                           `cheliangxinghao`, `yonghuzhanghao`, `yonghuxingming`, `guzhangleixing`, `yuyuecishu`,
                           `baoxiubiaoti`, `baoxiuyuanyin`, `yuyueshijian`, `sfsh`, `shhf`, `fenpeizhuangtai`, `beizhu`)
VALUES (3, '2025-02-04 11:06:55', '3333333333', '车牌号3', '车型3', '车辆品牌3', '车辆型号3', '用户账号3', '用户姓名3',
        '故障类型3', 3, '报修标题3', '报修原因3', '2025-02-04 11:06:55', '是', '', '已分配', '备注3');
INSERT INTO `weixiuyuyue` (`id`, `addtime`, `baoxiubianhao`, `chepaihao`, `chexing`, `cheliangpinpai`,
                           `cheliangxinghao`, `yonghuzhanghao`, `yonghuxingming`, `guzhangleixing`, `yuyuecishu`,
                           `baoxiubiaoti`, `baoxiuyuanyin`, `yuyueshijian`, `sfsh`, `shhf`, `fenpeizhuangtai`, `beizhu`)
VALUES (4, '2025-02-04 11:06:55', '4444444444', '车牌号4', '车型4', '车辆品牌4', '车辆型号4', '用户账号4', '用户姓名4',
        '故障类型4', 4, '报修标题4', '报修原因4', '2025-02-04 11:06:55', '是', '', '已分配', '备注4');
INSERT INTO `weixiuyuyue` (`id`, `addtime`, `baoxiubianhao`, `chepaihao`, `chexing`, `cheliangpinpai`,
                           `cheliangxinghao`, `yonghuzhanghao`, `yonghuxingming`, `guzhangleixing`, `yuyuecishu`,
                           `baoxiubiaoti`, `baoxiuyuanyin`, `yuyueshijian`, `sfsh`, `shhf`, `fenpeizhuangtai`, `beizhu`)
VALUES (5, '2025-02-04 11:06:55', '5555555555', '车牌号5', '车型5', '车辆品牌5', '车辆型号5', '用户账号5', '用户姓名5',
        '故障类型5', 5, '报修标题5', '报修原因5', '2025-02-04 11:06:55', '是', '', '已分配', '备注5');
INSERT INTO `weixiuyuyue` (`id`, `addtime`, `baoxiubianhao`, `chepaihao`, `chexing`, `cheliangpinpai`,
                           `cheliangxinghao`, `yonghuzhanghao`, `yonghuxingming`, `guzhangleixing`, `yuyuecishu`,
                           `baoxiubiaoti`, `baoxiuyuanyin`, `yuyueshijian`, `sfsh`, `shhf`, `fenpeizhuangtai`, `beizhu`)
VALUES (6, '2025-02-04 11:06:55', '6666666666', '车牌号6', '车型6', '车辆品牌6', '车辆型号6', '用户账号6', '用户姓名6',
        '故障类型6', 6, '报修标题6', '报修原因6', '2025-02-04 11:06:55', '是', '', '已分配', '备注6');
INSERT INTO `weixiuyuyue` (`id`, `addtime`, `baoxiubianhao`, `chepaihao`, `chexing`, `cheliangpinpai`,
                           `cheliangxinghao`, `yonghuzhanghao`, `yonghuxingming`, `guzhangleixing`, `yuyuecishu`,
                           `baoxiubiaoti`, `baoxiuyuanyin`, `yuyueshijian`, `sfsh`, `shhf`, `fenpeizhuangtai`, `beizhu`)
VALUES (7, '2025-02-04 11:06:55', '7777777777', '车牌号7', '车型7', '车辆品牌7', '车辆型号7', '用户账号7', '用户姓名7',
        '故障类型7', 7, '报修标题7', '报修原因7', '2025-02-04 11:06:55', '是', '', '已分配', '备注7');
INSERT INTO `weixiuyuyue` (`id`, `addtime`, `baoxiubianhao`, `chepaihao`, `chexing`, `cheliangpinpai`,
                           `cheliangxinghao`, `yonghuzhanghao`, `yonghuxingming`, `guzhangleixing`, `yuyuecishu`,
                           `baoxiubiaoti`, `baoxiuyuanyin`, `yuyueshijian`, `sfsh`, `shhf`, `fenpeizhuangtai`, `beizhu`)
VALUES (8, '2025-02-04 11:06:55', '8888888888', '车牌号8', '车型8', '车辆品牌8', '车辆型号8', '用户账号8', '用户姓名8',
        '故障类型8', 8, '报修标题8', '报修原因8', '2025-02-04 11:06:55', '是', '', '已分配', '备注8');
INSERT INTO `weixiuyuyue` (`id`, `addtime`, `baoxiubianhao`, `chepaihao`, `chexing`, `cheliangpinpai`,
                           `cheliangxinghao`, `yonghuzhanghao`, `yonghuxingming`, `guzhangleixing`, `yuyuecishu`,
                           `baoxiubiaoti`, `baoxiuyuanyin`, `yuyueshijian`, `sfsh`, `shhf`, `fenpeizhuangtai`, `beizhu`)
VALUES (9, '2025-02-04 11:06:55', '9999999999', '车牌号9', '车型9', '车辆品牌9', '车辆型号9', '用户账号9', '用户姓名9',
        '故障类型9', 9, '报修标题9', '报修原因9', '2025-02-04 11:06:55', '是', '', '已分配', '备注9');
INSERT INTO `weixiuyuyue` (`id`, `addtime`, `baoxiubianhao`, `chepaihao`, `chexing`, `cheliangpinpai`,
                           `cheliangxinghao`, `yonghuzhanghao`, `yonghuxingming`, `guzhangleixing`, `yuyuecishu`,
                           `baoxiubiaoti`, `baoxiuyuanyin`, `yuyueshijian`, `sfsh`, `shhf`, `fenpeizhuangtai`, `beizhu`)
VALUES (10, '2025-02-04 11:06:55', '11111111110', '车牌号10', '车型10', '车辆品牌10', '车辆型号10', '用户账号10',
        '用户姓名10', '故障类型10', 10, '报修标题10', '报修原因10', '2025-02-04 11:06:55', '是', '', '已分配',
        '备注10');
COMMIT;

-- ----------------------------
-- Table structure for yonghu
-- ----------------------------
DROP TABLE IF EXISTS `yonghu`;
CREATE TABLE `yonghu`
(
    `id`             bigint                                                        NOT NULL AUTO_INCREMENT COMMENT '主键',
    `addtime`        timestamp                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `yonghuzhanghao` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户账号',
    `yonghumima`     varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户密码',
    `yonghuxingming` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户姓名',
    `touxiang`       longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '头像',
    `xingbie`        varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci          DEFAULT NULL COMMENT '性别',
    `shoujihaoma`    varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci          DEFAULT NULL COMMENT '手机号码',
    PRIMARY KEY (`id`),
    UNIQUE KEY `yonghuzhanghao` (`yonghuzhanghao`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户';

-- ----------------------------
-- Records of yonghu
-- ----------------------------
BEGIN;
INSERT INTO `yonghu` (`id`, `addtime`, `yonghuzhanghao`, `yonghumima`, `yonghuxingming`, `touxiang`, `xingbie`,
                      `shoujihaoma`)
VALUES (31, '2025-02-04 11:06:55', '用户账号1', '123456', '用户姓名1', 'file/yonghuTouxiang1.jpg', '男', '19819881111');
INSERT INTO `yonghu` (`id`, `addtime`, `yonghuzhanghao`, `yonghumima`, `yonghuxingming`, `touxiang`, `xingbie`,
                      `shoujihaoma`)
VALUES (32, '2025-02-04 11:06:55', '用户账号2', '123456', '用户姓名2', 'file/yonghuTouxiang2.jpg', '男', '19819881112');
INSERT INTO `yonghu` (`id`, `addtime`, `yonghuzhanghao`, `yonghumima`, `yonghuxingming`, `touxiang`, `xingbie`,
                      `shoujihaoma`)
VALUES (33, '2025-02-04 11:06:55', '用户账号3', '123456', '用户姓名3', 'file/yonghuTouxiang3.jpg', '男', '19819881113');
INSERT INTO `yonghu` (`id`, `addtime`, `yonghuzhanghao`, `yonghumima`, `yonghuxingming`, `touxiang`, `xingbie`,
                      `shoujihaoma`)
VALUES (34, '2025-02-04 11:06:55', '用户账号4', '123456', '用户姓名4', 'file/yonghuTouxiang4.jpg', '男', '19819881114');
INSERT INTO `yonghu` (`id`, `addtime`, `yonghuzhanghao`, `yonghumima`, `yonghuxingming`, `touxiang`, `xingbie`,
                      `shoujihaoma`)
VALUES (35, '2025-02-04 11:06:55', '用户账号5', '123456', '用户姓名5', 'file/yonghuTouxiang5.jpg', '男', '19819881115');
INSERT INTO `yonghu` (`id`, `addtime`, `yonghuzhanghao`, `yonghumima`, `yonghuxingming`, `touxiang`, `xingbie`,
                      `shoujihaoma`)
VALUES (36, '2025-02-04 11:06:55', '用户账号6', '123456', '用户姓名6', 'file/yonghuTouxiang6.jpg', '男', '19819881116');
INSERT INTO `yonghu` (`id`, `addtime`, `yonghuzhanghao`, `yonghumima`, `yonghuxingming`, `touxiang`, `xingbie`,
                      `shoujihaoma`)
VALUES (37, '2025-02-04 11:06:55', '用户账号7', '123456', '用户姓名7', 'file/yonghuTouxiang7.jpg', '男', '19819881117');
INSERT INTO `yonghu` (`id`, `addtime`, `yonghuzhanghao`, `yonghumima`, `yonghuxingming`, `touxiang`, `xingbie`,
                      `shoujihaoma`)
VALUES (38, '2025-02-04 11:06:55', '用户账号8', '123456', '用户姓名8', 'file/yonghuTouxiang8.jpg', '男', '19819881118');
INSERT INTO `yonghu` (`id`, `addtime`, `yonghuzhanghao`, `yonghumima`, `yonghuxingming`, `touxiang`, `xingbie`,
                      `shoujihaoma`)
VALUES (39, '2025-02-04 11:06:55', '用户账号9', '123456', '用户姓名9', 'file/yonghuTouxiang9.jpg', '男', '19819881119');
INSERT INTO `yonghu` (`id`, `addtime`, `yonghuzhanghao`, `yonghumima`, `yonghuxingming`, `touxiang`, `xingbie`,
                      `shoujihaoma`)
VALUES (40, '2025-02-04 11:06:55', '用户账号10', '123456', '用户姓名10', 'file/yonghuTouxiang10.jpg', '男',
        '198198811110');
COMMIT;

SET
FOREIGN_KEY_CHECKS = 1;
