/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : localhost:3306
 Source Schema         : traceability

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 18/02/2019 09:52:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ad_pic
-- ----------------------------
DROP TABLE IF EXISTS `ad_pic`;
CREATE TABLE `ad_pic`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NULL DEFAULT NULL COMMENT '类型',
  `smallpic` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '小广告图',
  `largepic` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '大广告图',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '广告标题',
  `description` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `isshow` bit(1) NULL DEFAULT NULL,
  `addtime` datetime(0) NULL DEFAULT NULL,
  `starttime` datetime(0) NULL DEFAULT NULL,
  `endtime` datetime(0) NULL DEFAULT NULL,
  `component` int(4) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 98 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for aliyun_monito_ossinfo
-- ----------------------------
DROP TABLE IF EXISTS `aliyun_monito_ossinfo`;
CREATE TABLE `aliyun_monito_ossinfo`  (
  `id` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `connectionUsage` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '连接数使用率',
  `usedConnection` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '已用连接数',
  `cpuUsage` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'CPU使用率',
  `cailedCount` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作失败数',
  `intranetIn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '写入网络带宽',
  `intranetInRatio` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '写入带宽使用率',
  `intranetOut` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '读取网络带宽',
  `intranetOutRatio` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '读取带宽使用率',
  `memoryUsage` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内存使用率',
  `usedMemory` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内存使用量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for aliyun_monito_rdsinfo
-- ----------------------------
DROP TABLE IF EXISTS `aliyun_monito_rdsinfo`;
CREATE TABLE `aliyun_monito_rdsinfo`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `cpuusage` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'CPU使用率',
  `diskusage` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '磁盘使用率',
  `iopsusage` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IOPS使用率',
  `connectionusage` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '连接数使用率',
  `datadelay` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '只读实例延迟',
  `memoryusage` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内存使用率',
  `mysql_networkinnew` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Mysql每秒网络入流量',
  `mysql_networkoutnew` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Mysql每秒网络出流量',
  `sqlserver_networkinnew` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'SQLServe每秒网络入流量',
  `sqlserver_networkoutnew` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'SQLServer每秒网络出流量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for api_product_purch
-- ----------------------------
DROP TABLE IF EXISTS `api_product_purch`;
CREATE TABLE `api_product_purch`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `client_customerid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `client_db` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `messageid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `apptoken` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `appkey` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `sign` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `timestamp` datetime(0) NULL DEFAULT NULL,
  `data` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bas_sku
-- ----------------------------
DROP TABLE IF EXISTS `bas_sku`;
CREATE TABLE `bas_sku`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sku` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '产品代码',
  `descr_c` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '中文描述',
  `descr_e` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '英文描述',
  `pack_descr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '包装描述',
  `sku_group3` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '存储环境(常温、冷冻、冷藏)',
  `receiving_uom` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '收货单位',
  `shipment_uom` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '发货单位',
  `qty_min` decimal(10, 2) NULL DEFAULT NULL COMMENT '库存下限',
  `qty_max` decimal(10, 2) NULL DEFAULT NULL COMMENT '库存上限',
  `freight_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '货物类型',
  `shelf_life` int(11) NULL DEFAULT NULL COMMENT '有效期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bn_article
-- ----------------------------
DROP TABLE IF EXISTS `bn_article`;
CREATE TABLE `bn_article`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_id` int(11) NULL DEFAULT NULL,
  `category_id` int(11) NULL DEFAULT NULL,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `link_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `img_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `seo_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `seo_keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `seo_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `sort_id` int(11) NULL DEFAULT NULL,
  `click` int(11) NULL DEFAULT NULL,
  `is_lock` tinyint(4) NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `add_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `PrimaryKey`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bn_article_albums
-- ----------------------------
DROP TABLE IF EXISTS `bn_article_albums`;
CREATE TABLE `bn_article_albums`  (
  `id` int(11) NOT NULL,
  `article_id` int(11) NULL DEFAULT NULL,
  `big_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `small_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  INDEX `id`(`id`) USING BTREE,
  INDEX `article_id`(`article_id`) USING BTREE,
  CONSTRAINT `bn_article_albums_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `bn_article` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bn_article_diggs
-- ----------------------------
DROP TABLE IF EXISTS `bn_article_diggs`;
CREATE TABLE `bn_article_diggs`  (
  `id` int(11) NOT NULL,
  `digg_good` int(11) NULL DEFAULT NULL,
  `digg_bad` int(11) NULL DEFAULT NULL,
  INDEX `dt_article_diggsid`(`id`) USING BTREE,
  CONSTRAINT `bn_article_diggs_ibfk_1` FOREIGN KEY (`id`) REFERENCES `bn_article` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bn_article_download
-- ----------------------------
DROP TABLE IF EXISTS `bn_article_download`;
CREATE TABLE `bn_article_download`  (
  `id` int(11) NOT NULL DEFAULT 0,
  `is_msg` tinyint(4) NULL DEFAULT NULL,
  `is_red` tinyint(4) NULL DEFAULT NULL,
  INDEX `dt_article_downloadid`(`id`) USING BTREE,
  CONSTRAINT `bn_article_download_ibfk_1` FOREIGN KEY (`id`) REFERENCES `bn_article` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bn_attributes
-- ----------------------------
DROP TABLE IF EXISTS `bn_attributes`;
CREATE TABLE `bn_attributes`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_id` int(11) NULL DEFAULT NULL,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `type` int(11) NULL DEFAULT NULL,
  `default_value` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `sort_id` int(11) NULL DEFAULT NULL,
  `add_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bn_distribution
-- ----------------------------
DROP TABLE IF EXISTS `bn_distribution`;
CREATE TABLE `bn_distribution`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `type` tinyint(4) NULL DEFAULT NULL,
  `amount` double NULL DEFAULT NULL,
  `sort_id` int(11) NULL DEFAULT NULL,
  `is_lock` tinyint(4) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bn_download_attach
-- ----------------------------
DROP TABLE IF EXISTS `bn_download_attach`;
CREATE TABLE `bn_download_attach`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `file_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `file_ext` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `file_size` int(11) NULL DEFAULT NULL,
  `down_num` int(11) NULL DEFAULT NULL,
  `point` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  INDEX `article_id`(`article_id`) USING BTREE,
  CONSTRAINT `bn_download_attach_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `bn_article` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bn_feedback
-- ----------------------------
DROP TABLE IF EXISTS `bn_feedback`;
CREATE TABLE `bn_feedback`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_tel` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_qq` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `add_time` datetime(0) NULL DEFAULT NULL,
  `reply_content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `reply_time` datetime(0) NULL DEFAULT NULL,
  `is_lock` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bn_link
-- ----------------------------
DROP TABLE IF EXISTS `bn_link`;
CREATE TABLE `bn_link`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `site_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `img_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_image` int(11) NULL DEFAULT NULL,
  `sort_id` int(11) NULL DEFAULT NULL,
  `is_red` int(11) NULL DEFAULT NULL,
  `is_lock` int(11) NULL DEFAULT NULL,
  `add_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bn_manager
-- ----------------------------
DROP TABLE IF EXISTS `bn_manager`;
CREATE TABLE `bn_manager`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NULL DEFAULT NULL,
  `role_type` int(11) NULL DEFAULT NULL,
  `user_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_pwd` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `real_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `telephone` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_lock` int(11) NULL DEFAULT NULL,
  `add_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  INDEX `role_id`(`role_id`) USING BTREE,
  CONSTRAINT `bn_manager_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `bn_manager_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bn_manager_log
-- ----------------------------
DROP TABLE IF EXISTS `bn_manager_log`;
CREATE TABLE `bn_manager_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `user_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `action_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `login_ip` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `login_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `bn_manager_log_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `bn_manager` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 968 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bn_manager_role
-- ----------------------------
DROP TABLE IF EXISTS `bn_manager_role`;
CREATE TABLE `bn_manager_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bn_manager_role_value
-- ----------------------------
DROP TABLE IF EXISTS `bn_manager_role_value`;
CREATE TABLE `bn_manager_role_value`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NULL DEFAULT NULL,
  `channel_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `channel_id` int(11) NULL DEFAULT NULL,
  `action_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  INDEX `role_id`(`role_id`) USING BTREE,
  CONSTRAINT `bn_manager_role_value_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `bn_manager_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bn_user_code
-- ----------------------------
DROP TABLE IF EXISTS `bn_user_code`;
CREATE TABLE `bn_user_code`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `user_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `str_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `count` int(11) NULL DEFAULT NULL,
  `status` tinyint(4) NULL DEFAULT NULL,
  `eff_time` datetime(0) NULL DEFAULT NULL,
  `add_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `bn_user_code_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `bn_users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bn_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `bn_user_groups`;
CREATE TABLE `bn_user_groups`  (
  `id` int(4) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bn_user_login_log
-- ----------------------------
DROP TABLE IF EXISTS `bn_user_login_log`;
CREATE TABLE `bn_user_login_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `user_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `login_time` datetime(0) NULL DEFAULT NULL,
  `login_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `bn_user_login_log_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `bn_users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 156 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bn_user_message
-- ----------------------------
DROP TABLE IF EXISTS `bn_user_message`;
CREATE TABLE `bn_user_message`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) NULL DEFAULT NULL,
  `post_user_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `accept_user_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_read` tinyint(4) NULL DEFAULT NULL,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `post_time` datetime(0) NULL DEFAULT NULL,
  `read_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bn_users
-- ----------------------------
DROP TABLE IF EXISTS `bn_users`;
CREATE TABLE `bn_users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NULL DEFAULT NULL,
  `user_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nick_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `birthday` datetime(0) NULL DEFAULT NULL,
  `telphone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `qq` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `safe_question` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `safe_answer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `amount` double NULL DEFAULT NULL,
  `point` int(11) NULL DEFAULT NULL,
  `exp` int(11) NULL DEFAULT NULL,
  `is_lock` tinyint(4) NULL DEFAULT NULL,
  `reg_time` datetime(0) NULL DEFAULT NULL,
  `reg_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  INDEX `group_id`(`group_id`) USING BTREE,
  CONSTRAINT `bn_users_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `bn_user_groups` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for crm_business
-- ----------------------------
DROP TABLE IF EXISTS `crm_business`;
CREATE TABLE `crm_business`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '代理商名称',
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '代理商账号',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` int(10) NULL DEFAULT NULL,
  `date` datetime(0) NULL DEFAULT NULL,
  `uid` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业务人员ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for crm_buyinfo
-- ----------------------------
DROP TABLE IF EXISTS `crm_buyinfo`;
CREATE TABLE `crm_buyinfo`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `date` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `uid` int(10) NULL DEFAULT NULL,
  `stocknum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stock` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `leavstock` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pid` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for crm_company
-- ----------------------------
DROP TABLE IF EXISTS `crm_company`;
CREATE TABLE `crm_company`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `number` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bid` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `date` datetime(0) NULL DEFAULT NULL,
  `uid` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1002 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for crm_complaints
-- ----------------------------
DROP TABLE IF EXISTS `crm_complaints`;
CREATE TABLE `crm_complaints`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cid` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `number` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `comdate` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `date` datetime(0) NULL DEFAULT NULL,
  `uid` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1183 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for crm_complaints_type
-- ----------------------------
DROP TABLE IF EXISTS `crm_complaints_type`;
CREATE TABLE `crm_complaints_type`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `add_datetime` datetime(0) NULL DEFAULT NULL,
  `uid` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `seq` int(11) NULL DEFAULT 0,
  `type` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1011 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for crm_contact
-- ----------------------------
DROP TABLE IF EXISTS `crm_contact`;
CREATE TABLE `crm_contact`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cid` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `date` datetime(0) NULL DEFAULT NULL,
  `uid` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type1` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gender` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tel` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `qq` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `wechat` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mail` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1003 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for crm_document
-- ----------------------------
DROP TABLE IF EXISTS `crm_document`;
CREATE TABLE `crm_document`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `documentid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `annex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `key` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uid` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `date` datetime(0) NULL DEFAULT NULL,
  `readuser` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for crm_document_type
-- ----------------------------
DROP TABLE IF EXISTS `crm_document_type`;
CREATE TABLE `crm_document_type`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `father` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `date` datetime(0) NULL DEFAULT NULL,
  `uid` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for crm_history
-- ----------------------------
DROP TABLE IF EXISTS `crm_history`;
CREATE TABLE `crm_history`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `date` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `uid` int(10) NULL DEFAULT NULL,
  `stock` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pid` int(10) NULL DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `number`(`number`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for crm_leaving_message
-- ----------------------------
DROP TABLE IF EXISTS `crm_leaving_message`;
CREATE TABLE `crm_leaving_message`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '代理商名称',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '代理商账号',
  `type` int(10) NULL DEFAULT NULL,
  `add_date` datetime(0) NULL DEFAULT NULL,
  `phone` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for crm_name
-- ----------------------------
DROP TABLE IF EXISTS `crm_name`;
CREATE TABLE `crm_name`  (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` int(20) NULL DEFAULT NULL,
  `date` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for crm_payment
-- ----------------------------
DROP TABLE IF EXISTS `crm_payment`;
CREATE TABLE `crm_payment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sid` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `perid` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `date` datetime(0) NULL DEFAULT NULL,
  `uid` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1004 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for crm_price
-- ----------------------------
DROP TABLE IF EXISTS `crm_price`;
CREATE TABLE `crm_price`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cid` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `viewid` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `date` datetime(0) NULL DEFAULT NULL,
  `uid` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1003 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for crm_product
-- ----------------------------
DROP TABLE IF EXISTS `crm_product`;
CREATE TABLE `crm_product`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `date` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `uid` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stocknum` int(10) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1101 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for crm_purchacse
-- ----------------------------
DROP TABLE IF EXISTS `crm_purchacse`;
CREATE TABLE `crm_purchacse`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采购编号',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `date` datetime(0) NULL DEFAULT NULL COMMENT '申请日期',
  `uid` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请人ID',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '采购产品单价',
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址',
  `is_approval` int(2) NULL DEFAULT NULL COMMENT '审批字段',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 264 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for crm_purchacse_item
-- ----------------------------
DROP TABLE IF EXISTS `crm_purchacse_item`;
CREATE TABLE `crm_purchacse_item`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采购编号',
  `num` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采购数量',
  `sid` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名称',
  `date` datetime(0) NULL DEFAULT NULL COMMENT '申请日期',
  `uid` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请人ID',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '采购产品单价',
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` int(20) NULL DEFAULT NULL COMMENT '产品类型',
  `stock_info_id` int(11) NULL DEFAULT 0 COMMENT '仓库ID',
  `snumber` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '商品编号',
  `logo` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '产品图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 175 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for crm_purchacse_push_log
-- ----------------------------
DROP TABLE IF EXISTS `crm_purchacse_push_log`;
CREATE TABLE `crm_purchacse_push_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采购编号',
  `add_date` datetime(0) NULL DEFAULT NULL COMMENT '申请日期',
  `push_time` datetime(0) NULL DEFAULT NULL,
  `push_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `push_type` int(11) NULL DEFAULT NULL,
  `push_status` int(11) NULL DEFAULT NULL COMMENT '状态  1为成功  0为失败',
  `again_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 183 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for crm_receipt_type
-- ----------------------------
DROP TABLE IF EXISTS `crm_receipt_type`;
CREATE TABLE `crm_receipt_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uid` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `seq` int(11) NULL DEFAULT 0,
  `add_datetime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '收据类型' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for crm_service_customers
-- ----------------------------
DROP TABLE IF EXISTS `crm_service_customers`;
CREATE TABLE `crm_service_customers`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cid` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司id',
  `type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uid` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '录入人员id',
  `follow_uid` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '指定回访人员id',
  `follow_purpose` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回访目的',
  `follow_datetime` datetime(0) NULL DEFAULT NULL COMMENT '回访时间',
  `specified_datetiime` datetime(0) NULL DEFAULT NULL COMMENT '指定回访时间',
  `follow_result` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回访目的',
  `add_datetime` datetime(0) NULL DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1003 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for crm_stock
-- ----------------------------
DROP TABLE IF EXISTS `crm_stock`;
CREATE TABLE `crm_stock`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stocknum` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `pid` int(16) NULL DEFAULT NULL,
  `type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `number` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `date` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `uid` int(16) NULL DEFAULT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `title` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sid` int(11) NULL DEFAULT NULL,
  `snumber` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `unit` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stock_info_id` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for crm_stock_inorout_log
-- ----------------------------
DROP TABLE IF EXISTS `crm_stock_inorout_log`;
CREATE TABLE `crm_stock_inorout_log`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `date` datetime(0) NULL DEFAULT NULL,
  `uid` int(10) NULL DEFAULT NULL,
  `takeuid` int(10) NULL DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for crm_stock_inorout_log_item
-- ----------------------------
DROP TABLE IF EXISTS `crm_stock_inorout_log_item`;
CREATE TABLE `crm_stock_inorout_log_item`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `date` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `uid` int(10) NULL DEFAULT NULL,
  `num` int(10) NULL DEFAULT NULL,
  `pid` int(10) NULL DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `inorout_log_no` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for crm_stock_type
-- ----------------------------
DROP TABLE IF EXISTS `crm_stock_type`;
CREATE TABLE `crm_stock_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uid` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `seq` int(11) NULL DEFAULT 0,
  `add_datetime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for crm_supplier
-- ----------------------------
DROP TABLE IF EXISTS `crm_supplier`;
CREATE TABLE `crm_supplier`  (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `supplier` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `contacts_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `tel` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `qq` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `zip_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职位',
  `mail` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `enable` bit(1) NULL DEFAULT NULL,
  `star_level` int(11) NULL DEFAULT NULL COMMENT '星级',
  `groupid` int(11) NULL DEFAULT NULL,
  `source_id` int(11) NULL DEFAULT NULL COMMENT '来源ID',
  `industry_id` int(11) NULL DEFAULT NULL COMMENT '所属行业id',
  `type` int(11) NULL DEFAULT NULL COMMENT '2企业客户   1个人客户',
  `enterprise_person` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '企业法人',
  `bank_type` int(11) NULL DEFAULT NULL COMMENT '银行类型',
  `bank_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行',
  `bank_card_number` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行卡号',
  `bank_account_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开户名称',
  `sex` int(11) NULL DEFAULT NULL,
  `position_id` int(11) NULL DEFAULT NULL COMMENT '职位',
  `office_phone` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for crm_supplier_price
-- ----------------------------
DROP TABLE IF EXISTS `crm_supplier_price`;
CREATE TABLE `crm_supplier_price`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `snumber` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品编号',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `unit` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sid` int(11) NULL DEFAULT NULL,
  `uid` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `seq` int(11) NULL DEFAULT NULL,
  `date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1092 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for crm_unit
-- ----------------------------
DROP TABLE IF EXISTS `crm_unit`;
CREATE TABLE `crm_unit`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `unit` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for crm_user
-- ----------------------------
DROP TABLE IF EXISTS `crm_user`;
CREATE TABLE `crm_user`  (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `user` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for crm_users_certificate
-- ----------------------------
DROP TABLE IF EXISTS `crm_users_certificate`;
CREATE TABLE `crm_users_certificate`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `startdate` datetime(0) NULL DEFAULT NULL,
  `enddate` datetime(0) NULL DEFAULT NULL,
  `appendix` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` int(11) NULL DEFAULT NULL,
  `age` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for device_screen
-- ----------------------------
DROP TABLE IF EXISTS `device_screen`;
CREATE TABLE `device_screen`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `series_no` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `imgurl` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` int(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `add_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `seriesNoUniq`(`series_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dingtalk_attendance_record
-- ----------------------------
DROP TABLE IF EXISTS `dingtalk_attendance_record`;
CREATE TABLE `dingtalk_attendance_record`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `groupId` int(10) NULL DEFAULT NULL COMMENT '考勤组ID',
  `planId` int(10) NULL DEFAULT NULL COMMENT '排班ID',
  `workDate` datetime(0) NULL DEFAULT NULL COMMENT '工作日',
  `userId` int(10) NULL DEFAULT NULL COMMENT '用户ID',
  `checkType` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '考勤类型',
  `sourceType` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据来源',
  `timeResult` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '时间结果',
  `locationResult` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '位置结果',
  `approveId` int(10) UNSIGNED ZEROFILL NULL DEFAULT NULL COMMENT '关联的审批id，当该字段非空时，表示打卡记录与请假、加班等审批有关',
  `procInstId` int(10) NULL DEFAULT NULL COMMENT '关联的审批实例id，当该字段非空时，表示打卡记录与请假、加班等审批有关。可以与获取单个审批数据配合使用',
  `baseCheckTime` datetime(0) NULL DEFAULT NULL COMMENT '计算迟到和早退，基准时间；也可作为排班打卡时间',
  `userCheckTime` datetime(0) NULL DEFAULT NULL COMMENT '实际打卡时间',
  `classId` int(10) NULL DEFAULT NULL COMMENT '考勤班次id，没有的话表示该次打卡不在排班内',
  `isLegal` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否合法，当timeResult和locationResult都为Normal时，该值为Y；否则为N',
  `locationMethod` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '定位方法',
  `deviceId` int(10) NULL DEFAULT NULL COMMENT '设备ID',
  `userAddress` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户打卡地址',
  `userLongitude` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户打卡经度',
  `userLatitude` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户打卡纬度',
  `userAccuracy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户打卡定位精度',
  `userSsid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户打卡wifi SSID',
  `userMacAddr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户打卡wifi Mac地址',
  `planCheckTime` datetime(0) NULL DEFAULT NULL COMMENT '排班打卡时间',
  `baseAddress` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '基准地址',
  `baseLongitude` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '基准经度',
  `baseLatitude` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '基准纬度',
  `baseAccuracy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '基准定位精度',
  `baseSsid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '基准wifi ssid',
  `baseMacAddr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '基准 Mac 地址',
  `outsideRemark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '打卡备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dingtalk_message_sendresult
-- ----------------------------
DROP TABLE IF EXISTS `dingtalk_message_sendresult`;
CREATE TABLE `dingtalk_message_sendresult`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `errcode` int(11) NULL DEFAULT NULL,
  `errmsg` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `send_result` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `invalid_user_id_list` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `forbidden_user_id_list` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `failed_user_id_list` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `read_user_id_list` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `unread_user_id_list` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `invalid_dept_id_list` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for food_info_type
-- ----------------------------
DROP TABLE IF EXISTS `food_info_type`;
CREATE TABLE `food_info_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `en_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `logo` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `adddate` datetime(0) NULL DEFAULT NULL COMMENT '录入日期时间',
  `editdate` datetime(0) NULL DEFAULT NULL COMMENT '修改日期时间',
  `parent_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for food_set_meal_item
-- ----------------------------
DROP TABLE IF EXISTS `food_set_meal_item`;
CREATE TABLE `food_set_meal_item`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `en_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `logo` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` int(11) NULL DEFAULT NULL,
  `unit` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单位',
  `adddate` datetime(0) NULL DEFAULT NULL COMMENT '录入日期时间',
  `editdate` datetime(0) NULL DEFAULT NULL COMMENT '修改日期时间',
  `used_val` double(16, 4) NULL DEFAULT 0.0000 COMMENT '用量(以克为单位)',
  `food_set_meal_id` int(100) NULL DEFAULT 0,
  `food_info_id` int(100) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for food_set_meal_item_type
-- ----------------------------
DROP TABLE IF EXISTS `food_set_meal_item_type`;
CREATE TABLE `food_set_meal_item_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `en_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `logo` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `adddate` datetime(0) NULL DEFAULT NULL COMMENT '录入日期时间',
  `editdate` datetime(0) NULL DEFAULT NULL COMMENT '修改日期时间',
  `parent_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fruit
-- ----------------------------
DROP TABLE IF EXISTS `fruit`;
CREATE TABLE `fruit`  (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `seq` int(10) NULL DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `unit` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` double(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 244 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for kitchen_device
-- ----------------------------
DROP TABLE IF EXISTS `kitchen_device`;
CREATE TABLE `kitchen_device`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `remark` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `author_key` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授权码',
  `kitchen_id` int(11) NULL DEFAULT NULL,
  `device_sn` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for kitchen_info
-- ----------------------------
DROP TABLE IF EXISTS `kitchen_info`;
CREATE TABLE `kitchen_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `logo` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `longitude` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `latitude` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `authorkey` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nick_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `enable` bit(1) NULL DEFAULT NULL,
  `contacts` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `last_login_date` datetime(0) NULL DEFAULT NULL,
  `last_login_ip` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `regist_date` datetime(0) NULL DEFAULT NULL,
  `regist_ip` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `notice` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mobile_msisdn_info
-- ----------------------------
DROP TABLE IF EXISTS `mobile_msisdn_info`;
CREATE TABLE `mobile_msisdn_info`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` int(10) NULL DEFAULT NULL COMMENT '返回结果类型 1.查询数据 2.数据下载地址(结果类型只返回1)',
  `msisdnInfoList` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '号码信号列表',
  `msisdnInfo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '号码信息',
  `msisdn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '号码',
  `iccid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '集成电路卡识别码',
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '查询结果：0 成功；1 失败；',
  `error` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '查询错误描述',
  `apnList` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'APN信息列表',
  `apnInfo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'APN信息',
  `apnName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'APN名称',
  `apnInfo_totalFlow` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '个人套餐总流量',
  `apnInfo_usedFlow` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '号码已用总流量',
  `apnInfo_restFlow` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '号码剩余总流量，查询成功必填 单位为：MB',
  `extraPkgFlow` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '套餐外流量 单位为：MB',
  `lastFlowTime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后一次流量发生时间 格式：yyyyMMddHHmmss',
  `pkgInfoList` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '套餐列表',
  `pkgInfo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '套餐流量',
  `pkgCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '套餐编码',
  `pkgName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '套餐名称',
  `subSprodId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品实例ID,为空显示“-”',
  `pkgInfo_totalFlow` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '套餐总流量 单位：MB',
  `pkgInfo_usedFlow` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '套餐剩余流量 单位：MB',
  `pkgInfo_restFlow` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '套餐剩余流量 单位为：MB',
  `pkgEffDate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '套餐生效日期 格式：yyyyMMddHHmmss',
  `pkgExpireDate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '套餐失效日期格式：yyyyMMddHHmmss',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for order_info_log
-- ----------------------------
DROP TABLE IF EXISTS `order_info_log`;
CREATE TABLE `order_info_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `info_datetime` datetime(0) NULL DEFAULT NULL,
  `submit_time` datetime(0) NULL DEFAULT NULL,
  `total_order` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `total_money` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `total_num` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `total_sun_num` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `backcash` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `backcash2` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `meal_time_normal`(`info_datetime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qa_question
-- ----------------------------
DROP TABLE IF EXISTS `qa_question`;
CREATE TABLE `qa_question`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `qtype` int(255) NULL DEFAULT NULL,
  `seq` int(11) NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `createtime` datetime(0) NULL DEFAULT NULL,
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `oid` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1087 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for restaurant_soft_info
-- ----------------------------
DROP TABLE IF EXISTS `restaurant_soft_info`;
CREATE TABLE `restaurant_soft_info`  (
  `name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `longitude` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `latitude` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `authorkey` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `enable` bit(1) NULL DEFAULT NULL,
  `last_login_date` datetime(0) NULL DEFAULT NULL,
  `last_login_ip` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `up_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `up_date` datetime(0) NULL DEFAULT NULL,
  `id` int(10) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for shiro_action_users_group
-- ----------------------------
DROP TABLE IF EXISTS `shiro_action_users_group`;
CREATE TABLE `shiro_action_users_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `enable` bit(1) NULL DEFAULT NULL,
  `add_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menuid` int(10) NOT NULL AUTO_INCREMENT,
  `menuname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `menuurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fatherid` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `menutype` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `menunum` int(25) NULL DEFAULT 9999,
  `menukey` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `keytable` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`menuid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 313 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_mobmsn_account
-- ----------------------------
DROP TABLE IF EXISTS `sys_mobmsn_account`;
CREATE TABLE `sys_mobmsn_account`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(11) NULL DEFAULT NULL,
  `user_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_users
-- ----------------------------
DROP TABLE IF EXISTS `sys_users`;
CREATE TABLE `sys_users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `enable` bit(1) NULL DEFAULT NULL,
  `regist_date` datetime(0) NULL DEFAULT NULL,
  `regist_ip` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_login_date` datetime(0) NULL DEFAULT NULL,
  `last_login_ip` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `salt` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `groupid` int(11) NULL DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_director` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_users_wx
-- ----------------------------
DROP TABLE IF EXISTS `sys_users_wx`;
CREATE TABLE `sys_users_wx`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `enable` bit(1) NULL DEFAULT NULL,
  `regist_date` datetime(0) NULL DEFAULT NULL,
  `regist_ip` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_login_date` datetime(0) NULL DEFAULT NULL,
  `last_login_ip` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `salt` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `groupid` int(11) NULL DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `weixin_no` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_partner_basic_info
-- ----------------------------
DROP TABLE IF EXISTS `t_partner_basic_info`;
CREATE TABLE `t_partner_basic_info`  (
  `partner_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID',
  `parent_partner_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上级运营商',
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '运营商编码',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '运营商名称',
  `province` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '所在地省',
  `city` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '所在地市',
  `district` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '所在地区县',
  `address` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '所在地详细地址',
  `contacter_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '联系人姓名',
  `contacter_mobile` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '联系人手机',
  `contacter_telephone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系人座机',
  `contacter_email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '联系人邮箱',
  `contacter_certificate_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系人证件类型',
  `contacter_certificate_no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系人证件号码',
  `property` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '运营商性质(个人|单位)',
  `trading_certificate` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '营业执照',
  `company_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构代码',
  `principal_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '负责人姓名',
  `principal_mobile` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '负责人手机',
  `principal_telephone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '负责人座机',
  `principal_email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '负责人邮箱',
  `principal_certificate_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '负责人证件类型',
  `principal_certificate_no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '负责人证件号码',
  `company_website` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '网址',
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_modify_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最后修改人',
  `last_modify_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`partner_id`) USING BTREE,
  UNIQUE INDEX `AK_uq_partner_basic_info_code`(`code`) USING BTREE,
  INDEX `idx_partner_basic_info_code`(`code`) USING BTREE,
  INDEX `idx_partner_basic_info_name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '运营商基础信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_red_packet
-- ----------------------------
DROP TABLE IF EXISTS `t_red_packet`;
CREATE TABLE `t_red_packet`  (
  `id` int(12) NOT NULL AUTO_INCREMENT COMMENT '红包编号',
  `user_id` int(12) NOT NULL COMMENT '发红包的用户id',
  `amount` decimal(16, 2) NOT NULL COMMENT '红包金额',
  `send_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '发红包日期',
  `total` int(12) NOT NULL COMMENT '红包总数',
  `unit_amount` decimal(12, 0) NOT NULL COMMENT '单个红包的金额',
  `stock` int(12) NOT NULL COMMENT '红包剩余个数',
  `version` int(12) NOT NULL DEFAULT 0 COMMENT '版本（为后续扩展用）',
  `note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_red_packet
-- ----------------------------
DROP TABLE IF EXISTS `t_user_red_packet`;
CREATE TABLE `t_user_red_packet`  (
  `id` int(12) NOT NULL AUTO_INCREMENT COMMENT '用户抢到的红包id',
  `red_packet_id` int(12) NOT NULL COMMENT '红包id',
  `user_id` int(12) NOT NULL COMMENT '抢红包用户的id',
  `amount` decimal(16, 2) NOT NULL COMMENT '抢到的红包金额',
  `grab_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '抢红包时间',
  `note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for toa_bbs_log
-- ----------------------------
DROP TABLE IF EXISTS `toa_bbs_log`;
CREATE TABLE `toa_bbs_log`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `bbsid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `author` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `enddate` datetime(0) NULL DEFAULT NULL,
  `uid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for toa_duty
-- ----------------------------
DROP TABLE IF EXISTS `toa_duty`;
CREATE TABLE `toa_duty`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `startdate` datetime(0) NULL DEFAULT NULL,
  `enddate` datetime(0) NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `appendix` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dkey` int(10) NULL DEFAULT NULL,
  `date` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `uid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` int(10) NULL DEFAULT NULL,
  `level` int(2) NULL DEFAULT 0 COMMENT '工单级别',
  `begintime` datetime(0) NULL DEFAULT NULL COMMENT '开始任务时间',
  `stoptime` datetime(0) NULL DEFAULT NULL COMMENT '完成时间',
  `departId` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `usersgroupid` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 500 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for toa_duty_cardinfo
-- ----------------------------
DROP TABLE IF EXISTS `toa_duty_cardinfo`;
CREATE TABLE `toa_duty_cardinfo`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `grade` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `classes` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `doorid` int(10) NULL DEFAULT NULL,
  `caseid` int(10) NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容',
  `cdmktime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '制卡日期',
  `ismk` int(2) NULL DEFAULT NULL COMMENT '是否制作',
  `mkuser` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '制卡人',
  `issuser` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发卡人',
  `cdisstime` datetime(0) NULL DEFAULT NULL COMMENT '发卡日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for toa_duty_depart
-- ----------------------------
DROP TABLE IF EXISTS `toa_duty_depart`;
CREATE TABLE `toa_duty_depart`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `depart` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for toa_duty_group
-- ----------------------------
DROP TABLE IF EXISTS `toa_duty_group`;
CREATE TABLE `toa_duty_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dutyid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `groupid` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 226703757 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for toa_duty_log
-- ----------------------------
DROP TABLE IF EXISTS `toa_duty_log`;
CREATE TABLE `toa_duty_log`  (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `dutyid` int(255) NULL DEFAULT NULL COMMENT '任务ID',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `progress` int(32) NULL DEFAULT 0 COMMENT '完成进度',
  `appendix` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `date` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `uid` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '执行人',
  `duid` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务执行人ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 516 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for toa_duty_user
-- ----------------------------
DROP TABLE IF EXISTS `toa_duty_user`;
CREATE TABLE `toa_duty_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dutyid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userid` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `startdate` datetime(0) NULL DEFAULT NULL,
  `enddate` datetime(0) NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `appendix` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dkey` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `begintime` datetime(0) NULL DEFAULT NULL,
  `stoptime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `dutyid`(`dutyid`, `userid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 490 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for toa_duty_username
-- ----------------------------
DROP TABLE IF EXISTS `toa_duty_username`;
CREATE TABLE `toa_duty_username`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `departid` int(10) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for traceability_point
-- ----------------------------
DROP TABLE IF EXISTS `traceability_point`;
CREATE TABLE `traceability_point`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `logo` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `longitude` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `latitude` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `authorkey` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `salt` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `enable` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for traceability_survey_report
-- ----------------------------
DROP TABLE IF EXISTS `traceability_survey_report`;
CREATE TABLE `traceability_survey_report`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `type` int(11) NULL DEFAULT NULL COMMENT '类型',
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `add_time` datetime(0) NULL DEFAULT NULL COMMENT '添加时间',
  `code_number` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '检验报告编码',
  `producer_id` int(11) NULL DEFAULT NULL COMMENT '生产者ID',
  `purchaser_id` int(11) NULL DEFAULT NULL COMMENT '购买者D',
  `status` int(11) NULL DEFAULT NULL COMMENT '检验结果 -1 不合格  1 合格   0为默认',
  `make_date` date NULL DEFAULT NULL COMMENT '生产日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '溯源产品检测报告' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for traceability_type
-- ----------------------------
DROP TABLE IF EXISTS `traceability_type`;
CREATE TABLE `traceability_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent_id` int(11) NULL DEFAULT NULL,
  `point_id` int(11) NULL DEFAULT 0,
  `type_id` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for yimi_news
-- ----------------------------
DROP TABLE IF EXISTS `yimi_news`;
CREATE TABLE `yimi_news`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `seoKeywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `seoDescribe` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `num` int(11) NULL DEFAULT NULL,
  `clicknum` int(11) NULL DEFAULT NULL,
  `creatime` datetime(0) NULL DEFAULT NULL,
  `uptime` datetime(0) NULL DEFAULT NULL,
  `istop` int(4) NULL DEFAULT 0,
  `type` int(10) NULL DEFAULT NULL COMMENT '新闻类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Procedure structure for 存储过程
-- ----------------------------
DROP PROCEDURE IF EXISTS `存储过程`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `存储过程`()
BEGIN
	DECLARE c_no int; #声明数据类型的方法
	DECLARE abc int;
	SELECT count(*) INTO c_no  #将一个结果存入一个变量
	from ad_pic
	where component=1;
	if c_no is not null then    #if......then......else.....end if
	SELECT number into abc  from crm_price
	WHERE id=1002;
		if abc<0 then 
		select *from toa_duty;
		ELSE
		SELECT '嘿嘿';
		END if;
	ELSE
	SELECT '哈哈';
	END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for 带事务的存储过程
-- ----------------------------
DROP PROCEDURE IF EXISTS `带事务的存储过程`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `带事务的存储过程`()
BEGIN
	declare id int;
	set id=1;
			WHILE(id<10000000) do
			INSERT INTO toa_duty_group VALUES (id,2,2);
			set id=id+1;
			end WHILE;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
