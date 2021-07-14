/*
Navicat MySQL Data Transfer

Source Server         : mysql_master
Source Server Version : 80024
Source Host           : 192.168.63.131:3306
Source Database       : lmrs_2008_shops

Target Server Type    : MYSQL
Target Server Version : 80024
File Encoding         : 65001

Date: 2021-05-08 20:20:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for lmrs_user
-- ----------------------------
DROP TABLE IF EXISTS `lmrs_user`;
CREATE TABLE `lmrs_user` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(10) DEFAULT NULL,
  `passowrd` varchar(40) DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  `mobile` int DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `addr_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of lmrs_user
-- ----------------------------

-- ----------------------------
-- Table structure for lmrs_user_addr
-- ----------------------------
DROP TABLE IF EXISTS `lmrs_user_addr`;
CREATE TABLE `lmrs_user_addr` (
  `id` bigint NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `zip` bigint DEFAULT NULL,
  `province` bigint DEFAULT NULL,
  `city` bigint DEFAULT NULL,
  `area` bigint DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `is_default` tinyint DEFAULT NULL,
  `last_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of lmrs_user_addr
-- ----------------------------

-- ----------------------------
-- Table structure for lmrs_user_info
-- ----------------------------
DROP TABLE IF EXISTS `lmrs_user_info`;
CREATE TABLE `lmrs_user_info` (
  `id` bigint NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `name` varchar(10) DEFAULT NULL,
  `identity_card_type` tinyint(1) DEFAULT NULL,
  `identity_card_no` varchar(20) DEFAULT NULL,
  `gender` tinyint(1) DEFAULT NULL,
  `user_point` bigint DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `vip_level` bigint DEFAULT NULL,
  `age` int DEFAULT NULL,
  `last_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of lmrs_user_info
-- ----------------------------

-- ----------------------------
-- Table structure for lmrs_user_login_log
-- ----------------------------
DROP TABLE IF EXISTS `lmrs_user_login_log`;
CREATE TABLE `lmrs_user_login_log` (
  `id` bigint NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `login_time` datetime DEFAULT NULL,
  `login_ip` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `login_type` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of lmrs_user_login_log
-- ----------------------------

-- ----------------------------
-- Table structure for lmrs_user_point_log
-- ----------------------------
DROP TABLE IF EXISTS `lmrs_user_point_log`;
CREATE TABLE `lmrs_user_point_log` (
  `id` bigint NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `source` tinyint DEFAULT NULL,
  `refer_no` varchar(30) DEFAULT NULL,
  `update_point` bigint DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of lmrs_user_point_log
-- ----------------------------

-- ----------------------------
-- Table structure for lmrs_vip_level_info
-- ----------------------------
DROP TABLE IF EXISTS `lmrs_vip_level_info`;
CREATE TABLE `lmrs_vip_level_info` (
  `id` bigint NOT NULL,
  `name` varchar(10) DEFAULT NULL,
  `min_point` bigint DEFAULT NULL,
  `max_point` bigint DEFAULT NULL,
  `last_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of lmrs_vip_level_info
-- ----------------------------
