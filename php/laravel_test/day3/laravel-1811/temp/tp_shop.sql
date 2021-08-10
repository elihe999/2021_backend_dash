/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : tp_shop

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-11-06 15:26:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for login
-- ----------------------------
DROP TABLE IF EXISTS `login`;
CREATE TABLE `login` (
  `id` int(11) DEFAULT NULL,
  `name` varchar(10) DEFAULT NULL,
  `lastconnection` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of login
-- ----------------------------
INSERT INTO `login` VALUES (null, 'qw', '2018-09-30 15:54:52');
INSERT INTO `login` VALUES (null, null, '2018-09-30 15:54:53');

-- ----------------------------
-- Table structure for t
-- ----------------------------
DROP TABLE IF EXISTS `t`;
CREATE TABLE `t` (
  `ts1` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ts2` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t
-- ----------------------------
INSERT INTO `t` VALUES ('2018-08-08 15:51:26', '0000-00-00 00:00:00');
INSERT INTO `t` VALUES ('2018-09-14 15:51:59', '2018-09-30 15:52:04');
INSERT INTO `t` VALUES ('2018-09-30 15:52:07', '2018-09-30 15:52:09');
INSERT INTO `t` VALUES ('0000-00-00 00:00:00', '2018-09-30 15:52:10');

-- ----------------------------
-- Table structure for tp_account
-- ----------------------------
DROP TABLE IF EXISTS `tp_account`;
CREATE TABLE `tp_account` (
  `account_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '账户ID',
  `account_order_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单入账总额',
  `account_return` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '平台抽取利润总额',
  `account_withdraw` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商家提现总额',
  `account_deposit` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '保证金总额',
  `account_assistant` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '招商员支付总额',
  `account_user_withdraw` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '会员提现金额',
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192 COMMENT='商城资金统计';

-- ----------------------------
-- Records of tp_account
-- ----------------------------
INSERT INTO `tp_account` VALUES ('1', '3760.00', '188.00', '0.00', '0.00', '0.00', '0.00');

-- ----------------------------
-- Table structure for tp_account_order_records
-- ----------------------------
DROP TABLE IF EXISTS `tp_account_order_records`;
CREATE TABLE `tp_account_order_records` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `serial_no` varchar(50) NOT NULL DEFAULT '' COMMENT '流水号',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '对应金额',
  `account_type` tinyint(1) NOT NULL COMMENT '账户类型',
  `type_alis_id` int(11) NOT NULL COMMENT '关联ID',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '简介',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192 COMMENT='金额账户记录';

-- ----------------------------
-- Records of tp_account_order_records
-- ----------------------------
INSERT INTO `tp_account_order_records` VALUES ('1', '170721052056113', '1', '3760.00', '1', '2', '2017-07-21 17:20:56', '店铺订单支付金额3760元, 订单号为：20170721172001000000001, 支付方式【在线支付】。');

-- ----------------------------
-- Table structure for tp_account_period
-- ----------------------------
DROP TABLE IF EXISTS `tp_account_period`;
CREATE TABLE `tp_account_period` (
  `period_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '账户ID',
  `period_year` int(10) NOT NULL COMMENT '账期年份',
  `period_month` int(10) NOT NULL COMMENT '账期月份',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束时间',
  `account_profit` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '账期总营业额',
  `account_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '账期总发生余额',
  `account_return` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '账期利润总额',
  `account_deposit` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '账期保证金总额',
  `account_order` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '账期订单总额',
  `account_withdraw` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '账期店铺提现总额',
  `account_shop` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '账期店铺总发生额',
  `account_shop_withdraw` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '账期店铺总提现额',
  PRIMARY KEY (`period_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='商城账期结算表';

-- ----------------------------
-- Records of tp_account_period
-- ----------------------------

-- ----------------------------
-- Table structure for tp_account_records
-- ----------------------------
DROP TABLE IF EXISTS `tp_account_records`;
CREATE TABLE `tp_account_records` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `serial_no` varchar(50) NOT NULL DEFAULT '' COMMENT '流水号',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '对应金额',
  `account_type` tinyint(1) NOT NULL COMMENT '账户类型',
  `type_alis_id` int(11) NOT NULL COMMENT '关联ID',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '平台余额',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '简介',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1092 COMMENT='金额账户记录';

-- ----------------------------
-- Records of tp_account_records
-- ----------------------------
INSERT INTO `tp_account_records` VALUES ('1', '170721052056542', '1', '0', '商场订单支付成功!', '3760.00', '1', '2', '3760.00', '2017-07-21 17:20:56', '商场订单在线支付!');

-- ----------------------------
-- Table structure for tp_account_return_records
-- ----------------------------
DROP TABLE IF EXISTS `tp_account_return_records`;
CREATE TABLE `tp_account_return_records` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `serial_no` varchar(50) NOT NULL DEFAULT '' COMMENT '流水号',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '金额',
  `account_type` int(11) NOT NULL DEFAULT '0' COMMENT '提成类型',
  `type_alis_id` int(11) NOT NULL DEFAULT '0' COMMENT '关联id',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `remark` varchar(255) NOT NULL DEFAULT '0' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=910 COMMENT='平台的利润的记录';

-- ----------------------------
-- Records of tp_account_return_records
-- ----------------------------
INSERT INTO `tp_account_return_records` VALUES ('1', '170826050346894', '1', '188.00', '1', '1', '2017-08-26 17:03:46', '订单号为：20170721172001000000001的订单交易完成，订单实际付款金额为：3760.00元，平台抽取188.00');

-- ----------------------------
-- Table structure for tp_account_withdraw_records
-- ----------------------------
DROP TABLE IF EXISTS `tp_account_withdraw_records`;
CREATE TABLE `tp_account_withdraw_records` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `serial_no` varchar(50) NOT NULL DEFAULT '' COMMENT '流水号',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '对应金额',
  `account_type` tinyint(1) NOT NULL COMMENT '账户类型',
  `type_alis_id` int(11) NOT NULL COMMENT '关联ID',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '简介',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=3276 COMMENT='金额账户记录';

-- ----------------------------
-- Records of tp_account_withdraw_records
-- ----------------------------

-- ----------------------------
-- Table structure for tp_account_withdraw_user_records
-- ----------------------------
DROP TABLE IF EXISTS `tp_account_withdraw_user_records`;
CREATE TABLE `tp_account_withdraw_user_records` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `serial_no` varchar(50) NOT NULL DEFAULT '' COMMENT '流水号',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '对应金额',
  `account_type` tinyint(1) NOT NULL COMMENT '账户类型',
  `type_alis_id` int(11) NOT NULL COMMENT '关联ID',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '简介',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员提现记录表';

-- ----------------------------
-- Records of tp_account_withdraw_user_records
-- ----------------------------

-- ----------------------------
-- Table structure for tp_album_class
-- ----------------------------
DROP TABLE IF EXISTS `tp_album_class`;
CREATE TABLE `tp_album_class` (
  `album_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '相册id',
  `shop_id` int(10) NOT NULL DEFAULT '1' COMMENT '店铺id',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '上级相册ID',
  `album_name` varchar(100) NOT NULL COMMENT '相册名称',
  `album_cover` varchar(255) NOT NULL DEFAULT '' COMMENT '相册封面',
  `is_default` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为默认相册,1代表默认',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`album_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='相册表';

-- ----------------------------
-- Records of tp_album_class
-- ----------------------------
INSERT INTO `tp_album_class` VALUES ('30', '0', '0', '默认相册', '1609', '1', '2017-06-10 11:20:31', '4');
INSERT INTO `tp_album_class` VALUES ('31', '0', '0', '连衣裙', '1588', '0', '2017-06-10 14:28:53', '1');
INSERT INTO `tp_album_class` VALUES ('33', '41', '0', '默认相册', '', '1', '2017-07-14 10:07:40', '0');
INSERT INTO `tp_album_class` VALUES ('34', '42', '0', '默认相册', '', '1', '2017-07-17 20:03:00', '0');

-- ----------------------------
-- Table structure for tp_album_picture
-- ----------------------------
DROP TABLE IF EXISTS `tp_album_picture`;
CREATE TABLE `tp_album_picture` (
  `pic_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '相册图片表id',
  `shop_id` int(10) unsigned DEFAULT '1' COMMENT '所属实例id',
  `album_id` int(10) unsigned NOT NULL COMMENT '相册id',
  `is_wide` int(11) NOT NULL DEFAULT '0' COMMENT '是否宽屏',
  `pic_name` varchar(100) NOT NULL COMMENT '图片名称',
  `pic_tag` varchar(255) NOT NULL DEFAULT '' COMMENT '图片标签',
  `pic_cover` varchar(255) NOT NULL COMMENT '原图图片路径',
  `pic_size` varchar(255) NOT NULL COMMENT '原图大小',
  `pic_spec` varchar(100) NOT NULL COMMENT '原图规格',
  `pic_cover_big` varchar(255) NOT NULL DEFAULT '' COMMENT '大图路径',
  `pic_size_big` varchar(255) NOT NULL DEFAULT '0' COMMENT '大图大小',
  `pic_spec_big` varchar(100) NOT NULL DEFAULT '' COMMENT '大图规格',
  `pic_cover_mid` varchar(255) NOT NULL DEFAULT '' COMMENT '中图路径',
  `pic_size_mid` varchar(255) NOT NULL DEFAULT '0' COMMENT '中图大小',
  `pic_spec_mid` varchar(100) NOT NULL DEFAULT '' COMMENT '中图规格',
  `pic_cover_small` varchar(255) NOT NULL DEFAULT '' COMMENT '小图路径',
  `pic_size_small` varchar(255) NOT NULL DEFAULT '0' COMMENT '小图大小',
  `pic_spec_small` varchar(255) NOT NULL DEFAULT '' COMMENT '小图规格',
  `pic_cover_micro` varchar(255) NOT NULL DEFAULT '' COMMENT '微图路径',
  `pic_size_micro` varchar(255) NOT NULL DEFAULT '0' COMMENT '微图大小',
  `pic_spec_micro` varchar(255) NOT NULL DEFAULT '' COMMENT '微图规格',
  `upload_time` datetime NOT NULL COMMENT '图片上传时间',
  PRIMARY KEY (`pic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1881 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=204 COMMENT='相册图片表';

-- ----------------------------
-- Records of tp_album_picture
-- ----------------------------
INSERT INTO `tp_album_picture` VALUES ('738', '0', '31', '0', '1497076878', 'TB1U9rSRpXXXXbFXFXXXXXXXXXX_!!2-item_pic', 'upload/goods/1497076878.jpg', '400,400', '400,400', 'upload/goods/14970768781.jpg', '700,700', '700,700', 'upload/goods/14970768782.jpg', '360,360', '360,360', 'upload/goods/14970768783.jpg', '240,240', '240,240', 'upload/goods/14970768784.jpg', '60,60', '60,60', '2017-06-10 14:41:18');
INSERT INTO `tp_album_picture` VALUES ('739', '0', '31', '0', '1497080716', 'TB2pNs2gHXlpuFjSszfXXcSGXXa-356060330', 'upload/goods/1497080716.jpg', '1200,1200', '1200,1200', 'upload/goods/14970807171.jpg', '700,700', '700,700', 'upload/goods/14970807172.jpg', '360,360', '360,360', 'upload/goods/14970807173.jpg', '240,240', '240,240', 'upload/goods/14970807174.jpg', '60,60', '60,60', '2017-06-10 15:45:17');
INSERT INTO `tp_album_picture` VALUES ('740', '0', '31', '0', '1497080721', 'TB2pNs2gHXlpuFjSszfXXcSGXXa-356060330', 'upload/goods/1497080721.jpg', '430,430', '430,430', 'upload/goods/14970807211.jpg', '700,700', '700,700', 'upload/goods/14970807212.jpg', '360,360', '360,360', 'upload/goods/14970807213.jpg', '240,240', '240,240', 'upload/goods/14970807214.jpg', '60,60', '60,60', '2017-06-10 15:45:22');
INSERT INTO `tp_album_picture` VALUES ('743', '0', '30', '0', '1497082939', 'TB21QGblSBjpuFjSsplXXa5MVXa_!!468333872', 'upload/goods/1497082939.jpg', '430,430', '430,430', 'upload/goods/14970829391.jpg', '700,700', '700,700', 'upload/goods/14970829392.jpg', '360,360', '360,360', 'upload/goods/14970829393.jpg', '240,240', '240,240', 'upload/goods/14970829394.jpg', '60,60', '60,60', '2017-06-10 16:22:19');
INSERT INTO `tp_album_picture` VALUES ('744', '0', '31', '0', '1497104384', 'TB2k_XyfAqvpuFjSZFhXXaOgXXa_!!2002910652', 'upload/goods/1499913159.jpg', '1200,900', '1200,900', 'upload/goods/14999131593caddeebf49eb6ef4c7b50956859f2f21.jpg', '700,700', '700,700', 'upload/goods/14999131593caddeebf49eb6ef4c7b50956859f2f22.jpg', '360,360', '360,360', 'upload/goods/14999131593caddeebf49eb6ef4c7b50956859f2f23.jpg', '240,240', '240,240', 'upload/goods/14999131593caddeebf49eb6ef4c7b50956859f2f24.jpg', '60,60', '60,60', '2017-07-13 10:32:39');
INSERT INTO `tp_album_picture` VALUES ('745', '0', '30', '0', '1497104397', 'TB2r27NfipnpuFjSZFIXXXh2VXa_!!2002910652', 'upload/goods/1497104397.jpg', '800,800', '800,800', 'upload/goods/14971043971.jpg', '700,700', '700,700', 'upload/goods/14971043972.jpg', '360,360', '360,360', 'upload/goods/14971043973.jpg', '240,240', '240,240', 'upload/goods/14971043974.jpg', '60,60', '60,60', '2017-06-10 22:19:57');
INSERT INTO `tp_album_picture` VALUES ('746', '0', '30', '0', '1497104411', 'TB2r27NfipnpuFjSZFIXXXh2VXa_!!2002910652', 'upload/goods/1497104411.jpg', '800,800', '800,800', 'upload/goods/14971044111.jpg', '700,700', '700,700', 'upload/goods/14971044112.jpg', '360,360', '360,360', 'upload/goods/14971044113.jpg', '240,240', '240,240', 'upload/goods/14971044114.jpg', '60,60', '60,60', '2017-06-10 22:20:11');
INSERT INTO `tp_album_picture` VALUES ('1515', '0', '0', '0', '31498043509', '3', 'upload/goods/31498043509.png', '443,720', '443,720', 'upload/goods/149804350931.png', '700,700', '700,700', 'upload/goods/149804350932.png', '360,360', '360,360', 'upload/goods/149804350933.png', '240,240', '240,240', 'upload/goods/149804350934.png', '60,60', '60,60', '2017-06-21 19:11:50');
INSERT INTO `tp_album_picture` VALUES ('1516', '0', '0', '0', '21498043509', '2', 'upload/goods/21498043509.png', '395,815', '395,815', 'upload/goods/149804350921.png', '700,700', '700,700', 'upload/goods/149804350922.png', '360,360', '360,360', 'upload/goods/149804350923.png', '240,240', '240,240', 'upload/goods/149804350924.png', '60,60', '60,60', '2017-06-21 19:11:51');
INSERT INTO `tp_album_picture` VALUES ('1517', '0', '0', '0', '31498044075', '3', 'upload/goods/31498044075.png', '443,720', '443,720', 'upload/goods/149804407531.png', '700,700', '700,700', 'upload/goods/149804407532.png', '360,360', '360,360', 'upload/goods/149804407533.png', '240,240', '240,240', 'upload/goods/149804407534.png', '60,60', '60,60', '2017-06-21 19:21:16');
INSERT INTO `tp_album_picture` VALUES ('1518', '0', '0', '0', '11498044268', '1', 'upload/goods/11498044268.png', '516,964', '516,964', 'upload/goods/149804426811.png', '700,700', '700,700', 'upload/goods/149804426812.png', '360,360', '360,360', 'upload/goods/149804426813.png', '240,240', '240,240', 'upload/goods/149804426814.png', '60,60', '60,60', '2017-06-21 19:24:29');
INSERT INTO `tp_album_picture` VALUES ('1519', '0', '0', '0', '铂金21498044300', '铂金2', 'upload/goods/铂金21498044300.png', '120,120', '120,120', 'upload/goods/1498044300铂金21.png', '700,700', '700,700', 'upload/goods/1498044300铂金22.png', '360,360', '360,360', 'upload/goods/1498044300铂金23.png', '240,240', '240,240', 'upload/goods/1498044300铂金24.png', '60,60', '60,60', '2017-06-21 19:25:00');
INSERT INTO `tp_album_picture` VALUES ('1520', '0', '0', '0', '11498044409', '1', 'upload/goods/11498044409.png', '516,964', '516,964', 'upload/goods/149804440911.png', '700,700', '700,700', 'upload/goods/149804440912.png', '360,360', '360,360', 'upload/goods/149804440913.png', '240,240', '240,240', 'upload/goods/149804440914.png', '60,60', '60,60', '2017-06-21 19:26:50');
INSERT INTO `tp_album_picture` VALUES ('1521', '0', '0', '0', '31498044478', '3', 'upload/goods/31498044478.png', '443,720', '443,720', 'upload/goods/149804447831.png', '700,700', '700,700', 'upload/goods/149804447832.png', '360,360', '360,360', 'upload/goods/149804447833.png', '240,240', '240,240', 'upload/goods/149804447834.png', '60,60', '60,60', '2017-06-21 19:27:59');
INSERT INTO `tp_album_picture` VALUES ('1522', '0', '0', '0', '11498044511', '1', 'upload/goods/11498044511.png', '516,964', '516,964', 'upload/goods/149804451111.png', '700,700', '700,700', 'upload/goods/149804451112.png', '360,360', '360,360', 'upload/goods/149804451113.png', '240,240', '240,240', 'upload/goods/149804451114.png', '60,60', '60,60', '2017-06-21 19:28:32');
INSERT INTO `tp_album_picture` VALUES ('1523', '0', '0', '0', '21498044564', '2', 'upload/goods/21498044564.png', '395,815', '395,815', 'upload/goods/149804456421.png', '700,700', '700,700', 'upload/goods/149804456422.png', '360,360', '360,360', 'upload/goods/149804456423.png', '240,240', '240,240', 'upload/goods/149804456424.png', '60,60', '60,60', '2017-06-21 19:29:26');
INSERT INTO `tp_album_picture` VALUES ('1524', '0', '0', '0', '11498044676', '1', 'upload/goods/11498044676.png', '516,964', '516,964', 'upload/goods/149804467611.png', '700,700', '700,700', 'upload/goods/149804467612.png', '360,360', '360,360', 'upload/goods/149804467613.png', '240,240', '240,240', 'upload/goods/149804467614.png', '60,60', '60,60', '2017-06-21 19:31:17');
INSERT INTO `tp_album_picture` VALUES ('1525', '0', '0', '0', '铂金41498044700', '铂金4', 'upload/goods/铂金41498044700.png', '750,260', '750,260', 'upload/goods/1498044700铂金41.png', '700,700', '700,700', 'upload/goods/1498044700铂金42.png', '360,360', '360,360', 'upload/goods/1498044700铂金43.png', '240,240', '240,240', 'upload/goods/1498044700铂金44.png', '60,60', '60,60', '2017-06-21 19:31:42');
INSERT INTO `tp_album_picture` VALUES ('1526', '0', '0', '0', '铂金21498044724', '铂金2', 'upload/goods/铂金21498044724.png', '120,120', '120,120', 'upload/goods/1498044724铂金21.png', '700,700', '700,700', 'upload/goods/1498044724铂金22.png', '360,360', '360,360', 'upload/goods/1498044724铂金23.png', '240,240', '240,240', 'upload/goods/1498044724铂金24.png', '60,60', '60,60', '2017-06-21 19:32:04');
INSERT INTO `tp_album_picture` VALUES ('1527', '0', '0', '0', '铂金1498044724', '铂金', 'upload/goods/铂金1498044724.png', '34,34', '34,34', 'upload/goods/1498044724铂金1.png', '700,700', '700,700', 'upload/goods/1498044724铂金2.png', '360,360', '360,360', 'upload/goods/1498044724铂金3.png', '240,240', '240,240', 'upload/goods/1498044724铂金4.png', '60,60', '60,60', '2017-06-21 19:32:04');
INSERT INTO `tp_album_picture` VALUES ('1528', '0', '0', '0', '21498044833', '2', 'upload/goods/21498044833.png', '395,815', '395,815', 'upload/goods/149804483321.png', '700,700', '700,700', 'upload/goods/149804483322.png', '360,360', '360,360', 'upload/goods/149804483323.png', '240,240', '240,240', 'upload/goods/149804483324.png', '60,60', '60,60', '2017-06-21 19:33:55');
INSERT INTO `tp_album_picture` VALUES ('1529', '0', '0', '0', '21498044905', '2', 'upload/goods/21498044905.png', '395,815', '395,815', 'upload/goods/149804490521.png', '700,700', '700,700', 'upload/goods/149804490522.png', '360,360', '360,360', 'upload/goods/149804490523.png', '240,240', '240,240', 'upload/goods/149804490524.png', '60,60', '60,60', '2017-06-21 19:35:07');
INSERT INTO `tp_album_picture` VALUES ('1532', '0', '0', '0', '31498093561', '3', 'upload/goods/31498093561.png', '443,720', '443,720', 'upload/goods/149809356331.png', '700,700', '700,700', 'upload/goods/149809356332.png', '360,360', '360,360', 'upload/goods/149809356333.png', '240,240', '240,240', 'upload/goods/149809356334.png', '60,60', '60,60', '2017-06-22 09:06:04');
INSERT INTO `tp_album_picture` VALUES ('1533', '0', '0', '0', '11498094647', '1', 'upload/goods/11498094647.png', '516,964', '516,964', 'upload/goods/149809464711.png', '700,700', '700,700', 'upload/goods/149809464712.png', '360,360', '360,360', 'upload/goods/149809464713.png', '240,240', '240,240', 'upload/goods/149809464714.png', '60,60', '60,60', '2017-06-22 09:24:08');
INSERT INTO `tp_album_picture` VALUES ('1534', '0', '0', '0', '21498095628', '2', 'upload/goods/21498095628.png', '395,815', '395,815', 'upload/goods/149809562821.png', '700,700', '700,700', 'upload/goods/149809562822.png', '360,360', '360,360', 'upload/goods/149809562823.png', '240,240', '240,240', 'upload/goods/149809562824.png', '60,60', '60,60', '2017-06-22 09:40:30');
INSERT INTO `tp_album_picture` VALUES ('1535', '0', '0', '0', '21498095693', '2', 'upload/goods/21498095693.png', '395,815', '395,815', 'upload/goods/149809569421.png', '700,700', '700,700', 'upload/goods/149809569422.png', '360,360', '360,360', 'upload/goods/149809569423.png', '240,240', '240,240', 'upload/goods/149809569424.png', '60,60', '60,60', '2017-06-22 09:41:35');
INSERT INTO `tp_album_picture` VALUES ('1536', '0', '0', '0', '21498095758', '2', 'upload/goods/21498095758.png', '395,815', '395,815', 'upload/goods/149809575821.png', '700,700', '700,700', 'upload/goods/149809575822.png', '360,360', '360,360', 'upload/goods/149809575823.png', '240,240', '240,240', 'upload/goods/149809575824.png', '60,60', '60,60', '2017-06-22 09:42:40');
INSERT INTO `tp_album_picture` VALUES ('1537', '0', '0', '0', '21498095804', '2', 'upload/goods/21498095804.png', '395,815', '395,815', 'upload/goods/149809580421.png', '700,700', '700,700', 'upload/goods/149809580422.png', '360,360', '360,360', 'upload/goods/149809580423.png', '240,240', '240,240', 'upload/goods/149809580424.png', '60,60', '60,60', '2017-06-22 09:43:26');
INSERT INTO `tp_album_picture` VALUES ('1538', '0', '0', '0', '31498096229', '3', 'upload/goods/31498096229.png', '443,720', '443,720', 'upload/goods/149809622931.png', '700,700', '700,700', 'upload/goods/149809622932.png', '360,360', '360,360', 'upload/goods/149809622933.png', '240,240', '240,240', 'upload/goods/149809622934.png', '60,60', '60,60', '2017-06-22 09:50:30');
INSERT INTO `tp_album_picture` VALUES ('1539', '0', '0', '0', '21498096699', '2', 'upload/goods/21498096699.png', '395,815', '395,815', 'upload/goods/149809669921.png', '700,700', '700,700', 'upload/goods/149809669922.png', '360,360', '360,360', 'upload/goods/149809669923.png', '240,240', '240,240', 'upload/goods/149809669924.png', '60,60', '60,60', '2017-06-22 09:58:21');
INSERT INTO `tp_album_picture` VALUES ('1540', '0', '0', '0', '铂金21498096705', '铂金2', 'upload/goods/铂金21498096705.png', '120,120', '120,120', 'upload/goods/1498096705铂金21.png', '700,700', '700,700', 'upload/goods/1498096705铂金22.png', '360,360', '360,360', 'upload/goods/1498096705铂金23.png', '240,240', '240,240', 'upload/goods/1498096705铂金24.png', '60,60', '60,60', '2017-06-22 09:58:26');
INSERT INTO `tp_album_picture` VALUES ('1541', '0', '0', '0', '11498096711', '1', 'upload/goods/11498096711.png', '516,964', '516,964', 'upload/goods/149809671111.png', '700,700', '700,700', 'upload/goods/149809671112.png', '360,360', '360,360', 'upload/goods/149809671113.png', '240,240', '240,240', 'upload/goods/149809671114.png', '60,60', '60,60', '2017-06-22 09:58:32');
INSERT INTO `tp_album_picture` VALUES ('1542', '0', '0', '0', '21498096711', '2', 'upload/goods/21498096711.png', '395,815', '395,815', 'upload/goods/149809671121.png', '700,700', '700,700', 'upload/goods/149809671122.png', '360,360', '360,360', 'upload/goods/149809671123.png', '240,240', '240,240', 'upload/goods/149809671124.png', '60,60', '60,60', '2017-06-22 09:58:33');
INSERT INTO `tp_album_picture` VALUES ('1543', '0', '0', '0', 'head_img1498096733', 'head_img', 'upload/goods/head_img1498096733.png', '80,80', '80,80', 'upload/goods/1498096733head_img1.png', '700,700', '700,700', 'upload/goods/1498096733head_img2.png', '360,360', '360,360', 'upload/goods/1498096733head_img3.png', '240,240', '240,240', 'upload/goods/1498096733head_img4.png', '60,60', '60,60', '2017-06-22 09:58:53');
INSERT INTO `tp_album_picture` VALUES ('1544', '0', '0', '0', 'qrcode_11498096733', 'qrcode_1', 'upload/goods/qrcode_11498096733.png', '640,1134', '640,1134', 'upload/goods/1498096733qrcode_11.png', '700,700', '700,700', 'upload/goods/1498096733qrcode_12.png', '360,360', '360,360', 'upload/goods/1498096733qrcode_13.png', '240,240', '240,240', 'upload/goods/1498096733qrcode_14.png', '60,60', '60,60', '2017-06-22 09:58:55');
INSERT INTO `tp_album_picture` VALUES ('1545', '0', '0', '0', 'qrcode_11498097315', 'qrcode_1', 'upload/goods/qrcode_11498097315.png', '640,1134', '640,1134', 'upload/goods/1498097315qrcode_11.png', '700,700', '700,700', 'upload/goods/1498097315qrcode_12.png', '360,360', '360,360', 'upload/goods/1498097315qrcode_13.png', '240,240', '240,240', 'upload/goods/1498097315qrcode_14.png', '60,60', '60,60', '2017-06-22 10:08:38');
INSERT INTO `tp_album_picture` VALUES ('1546', '0', '0', '0', 'head_img1498097794', 'head_img', 'upload/goods/head_img1498097794.png', '80,80', '80,80', 'upload/goods/1498097794head_img1.png', '700,700', '700,700', 'upload/goods/1498097794head_img2.png', '360,360', '360,360', 'upload/goods/1498097794head_img3.png', '240,240', '240,240', 'upload/goods/1498097794head_img4.png', '60,60', '60,60', '2017-06-22 10:16:34');
INSERT INTO `tp_album_picture` VALUES ('1547', '0', '0', '0', 'qrcode_11498097794', 'qrcode_1', 'upload/goods/qrcode_11498097794.png', '640,1134', '640,1134', 'upload/goods/1498097794qrcode_11.png', '700,700', '700,700', 'upload/goods/1498097794qrcode_12.png', '360,360', '360,360', 'upload/goods/1498097794qrcode_13.png', '240,240', '240,240', 'upload/goods/1498097794qrcode_14.png', '60,60', '60,60', '2017-06-22 10:16:36');
INSERT INTO `tp_album_picture` VALUES ('1548', '0', '0', '0', 'qrcode_31498097838', 'qrcode_3', 'upload/goods/qrcode_31498097838.png', '640,1134', '640,1134', 'upload/goods/1498097838qrcode_31.png', '700,700', '700,700', 'upload/goods/1498097838qrcode_32.png', '360,360', '360,360', 'upload/goods/1498097838qrcode_33.png', '240,240', '240,240', 'upload/goods/1498097838qrcode_34.png', '60,60', '60,60', '2017-06-22 10:17:19');
INSERT INTO `tp_album_picture` VALUES ('1549', '0', '0', '0', 'qrcode_21498097838', 'qrcode_2', 'upload/goods/qrcode_21498097838.png', '640,1134', '640,1134', 'upload/goods/1498097838qrcode_21.png', '700,700', '700,700', 'upload/goods/1498097838qrcode_22.png', '360,360', '360,360', 'upload/goods/1498097838qrcode_23.png', '240,240', '240,240', 'upload/goods/1498097838qrcode_24.png', '60,60', '60,60', '2017-06-22 10:17:20');
INSERT INTO `tp_album_picture` VALUES ('1550', '0', '0', '0', 'qrcode_11498097838', 'qrcode_1', 'upload/goods/qrcode_11498097838.png', '640,1134', '640,1134', 'upload/goods/1498097838qrcode_11.png', '700,700', '700,700', 'upload/goods/1498097838qrcode_12.png', '360,360', '360,360', 'upload/goods/1498097838qrcode_13.png', '240,240', '240,240', 'upload/goods/1498097838qrcode_14.png', '60,60', '60,60', '2017-06-22 10:17:20');
INSERT INTO `tp_album_picture` VALUES ('1551', '0', '0', '0', 'head_img1498097850', 'head_img', 'upload/goods/head_img1498097850.png', '80,80', '80,80', 'upload/goods/1498097850head_img1.png', '700,700', '700,700', 'upload/goods/1498097850head_img2.png', '360,360', '360,360', 'upload/goods/1498097850head_img3.png', '240,240', '240,240', 'upload/goods/1498097850head_img4.png', '60,60', '60,60', '2017-06-22 10:17:31');
INSERT INTO `tp_album_picture` VALUES ('1552', '0', '0', '0', 'shop_qrcode_bg1498097850', 'shop_qrcode_bg', 'upload/goods/shop_qrcode_bg1498097850.png', '640,741', '640,741', 'upload/goods/1498097850shop_qrcode_bg1.png', '700,700', '700,700', 'upload/goods/1498097850shop_qrcode_bg2.png', '360,360', '360,360', 'upload/goods/1498097850shop_qrcode_bg3.png', '240,240', '240,240', 'upload/goods/1498097850shop_qrcode_bg4.png', '60,60', '60,60', '2017-06-22 10:17:32');
INSERT INTO `tp_album_picture` VALUES ('1553', '0', '0', '0', 'qrcode_21498098199', 'qrcode_2', 'upload/goods/qrcode_21498098199.png', '640,1134', '640,1134', 'upload/goods/1498098199qrcode_21.png', '700,700', '700,700', 'upload/goods/1498098199qrcode_22.png', '360,360', '360,360', 'upload/goods/1498098199qrcode_23.png', '240,240', '240,240', 'upload/goods/1498098199qrcode_24.png', '60,60', '60,60', '2017-06-22 10:23:20');
INSERT INTO `tp_album_picture` VALUES ('1554', '0', '0', '0', 'qrcode_11498098199', 'qrcode_1', 'upload/goods/qrcode_11498098199.png', '640,1134', '640,1134', 'upload/goods/1498098199qrcode_11.png', '700,700', '700,700', 'upload/goods/1498098199qrcode_12.png', '360,360', '360,360', 'upload/goods/1498098199qrcode_13.png', '240,240', '240,240', 'upload/goods/1498098199qrcode_14.png', '60,60', '60,60', '2017-06-22 10:23:21');
INSERT INTO `tp_album_picture` VALUES ('1555', '0', '0', '0', 'head_img1498099516', 'head_img', 'upload/goods/head_img1498099516.png', '80,80', '80,80', 'upload/goods/1498099516head_img1.png', '700,700', '700,700', 'upload/goods/1498099516head_img2.png', '360,360', '360,360', 'upload/goods/1498099516head_img3.png', '240,240', '240,240', 'upload/goods/1498099516head_img4.png', '60,60', '60,60', '2017-06-22 10:45:16');
INSERT INTO `tp_album_picture` VALUES ('1556', '0', '0', '0', 'qrcode_21498099516', 'qrcode_2', 'upload/goods/qrcode_21498099516.png', '640,1134', '640,1134', 'upload/goods/1498099516qrcode_21.png', '700,700', '700,700', 'upload/goods/1498099516qrcode_22.png', '360,360', '360,360', 'upload/goods/1498099516qrcode_23.png', '240,240', '240,240', 'upload/goods/1498099516qrcode_24.png', '60,60', '60,60', '2017-06-22 10:45:17');
INSERT INTO `tp_album_picture` VALUES ('1557', '0', '0', '0', 'qrcode_11498099516', 'qrcode_1', 'upload/goods/qrcode_11498099516.png', '640,1134', '640,1134', 'upload/goods/1498099516qrcode_11.png', '700,700', '700,700', 'upload/goods/1498099516qrcode_12.png', '360,360', '360,360', 'upload/goods/1498099516qrcode_13.png', '240,240', '240,240', 'upload/goods/1498099516qrcode_14.png', '60,60', '60,60', '2017-06-22 10:45:18');
INSERT INTO `tp_album_picture` VALUES ('1558', '0', '0', '0', 'head_img1498099639', 'head_img', 'upload/goods/head_img1498099639.png', '80,80', '80,80', 'upload/goods/1498099639head_img1.png', '700,700', '700,700', 'upload/goods/1498099639head_img2.png', '360,360', '360,360', 'upload/goods/1498099639head_img3.png', '240,240', '240,240', 'upload/goods/1498099639head_img4.png', '60,60', '60,60', '2017-06-22 10:47:19');
INSERT INTO `tp_album_picture` VALUES ('1559', '0', '0', '0', 'qrcode_11498099639', 'qrcode_1', 'upload/goods/qrcode_11498099639.png', '640,1134', '640,1134', 'upload/goods/1498099639qrcode_11.png', '700,700', '700,700', 'upload/goods/1498099639qrcode_12.png', '360,360', '360,360', 'upload/goods/1498099639qrcode_13.png', '240,240', '240,240', 'upload/goods/1498099639qrcode_14.png', '60,60', '60,60', '2017-06-22 10:47:21');
INSERT INTO `tp_album_picture` VALUES ('1560', '0', '0', '0', 'head_img1498099666', 'head_img', 'upload/goods/head_img1498099666.png', '80,80', '80,80', 'upload/goods/1498099666head_img1.png', '700,700', '700,700', 'upload/goods/1498099666head_img2.png', '360,360', '360,360', 'upload/goods/1498099666head_img3.png', '240,240', '240,240', 'upload/goods/1498099666head_img4.png', '60,60', '60,60', '2017-06-22 10:47:47');
INSERT INTO `tp_album_picture` VALUES ('1561', '0', '0', '0', 'qrcode_11498099666', 'qrcode_1', 'upload/goods/qrcode_11498099666.png', '640,1134', '640,1134', 'upload/goods/1498099666qrcode_11.png', '700,700', '700,700', 'upload/goods/1498099666qrcode_12.png', '360,360', '360,360', 'upload/goods/1498099666qrcode_13.png', '240,240', '240,240', 'upload/goods/1498099666qrcode_14.png', '60,60', '60,60', '2017-06-22 10:47:48');
INSERT INTO `tp_album_picture` VALUES ('1562', '0', '0', '0', 'head_img1498099792', 'head_img', 'upload/goods/head_img1498099792.png', '80,80', '80,80', 'upload/goods/1498099792head_img1.png', '700,700', '700,700', 'upload/goods/1498099792head_img2.png', '360,360', '360,360', 'upload/goods/1498099792head_img3.png', '240,240', '240,240', 'upload/goods/1498099792head_img4.png', '60,60', '60,60', '2017-06-22 10:49:52');
INSERT INTO `tp_album_picture` VALUES ('1563', '0', '0', '0', 'head_img1498100064', 'head_img', 'upload/goods/head_img1498100064.png', '80,80', '80,80', 'upload/goods/1498100064head_img1.png', '700,700', '700,700', 'upload/goods/1498100064head_img2.png', '360,360', '360,360', 'upload/goods/1498100064head_img3.png', '240,240', '240,240', 'upload/goods/1498100064head_img4.png', '60,60', '60,60', '2017-06-22 10:54:24');
INSERT INTO `tp_album_picture` VALUES ('1564', '0', '0', '0', 'head_img1498100127', 'head_img', 'upload/goods/head_img1498100127.png', '80,80', '80,80', 'upload/goods/1498100127head_img1.png', '700,700', '700,700', 'upload/goods/1498100127head_img2.png', '360,360', '360,360', 'upload/goods/1498100127head_img3.png', '240,240', '240,240', 'upload/goods/1498100127head_img4.png', '60,60', '60,60', '2017-06-22 10:55:28');
INSERT INTO `tp_album_picture` VALUES ('1565', '0', '0', '0', 'qrcode_11498100131', 'qrcode_1', 'upload/goods/qrcode_11498100131.png', '640,1134', '640,1134', 'upload/goods/1498100131qrcode_11.png', '700,700', '700,700', 'upload/goods/1498100131qrcode_12.png', '360,360', '360,360', 'upload/goods/1498100131qrcode_13.png', '240,240', '240,240', 'upload/goods/1498100131qrcode_14.png', '60,60', '60,60', '2017-06-22 10:55:34');
INSERT INTO `tp_album_picture` VALUES ('1566', '0', '0', '0', 'head_img1498100633', 'head_img', 'upload/goods/head_img1498100633.png', '80,80', '80,80', 'upload/goods/1498100633head_img1.png', '700,700', '700,700', 'upload/goods/1498100633head_img2.png', '360,360', '360,360', 'upload/goods/1498100633head_img3.png', '240,240', '240,240', 'upload/goods/1498100633head_img4.png', '60,60', '60,60', '2017-06-22 11:03:53');
INSERT INTO `tp_album_picture` VALUES ('1567', '0', '0', '0', 'head_img1498100639', 'head_img', 'upload/goods/head_img1498100639.png', '80,80', '80,80', 'upload/goods/1498100639head_img1.png', '700,700', '700,700', 'upload/goods/1498100639head_img2.png', '360,360', '360,360', 'upload/goods/1498100639head_img3.png', '240,240', '240,240', 'upload/goods/1498100639head_img4.png', '60,60', '60,60', '2017-06-22 11:04:00');
INSERT INTO `tp_album_picture` VALUES ('1568', '0', '0', '0', 'head_img1498102269', 'head_img', 'upload/goods/head_img1498102269.png', '80,80', '80,80', 'upload/goods/1498102269head_img1.png', '700,700', '700,700', 'upload/goods/1498102269head_img2.png', '360,360', '360,360', 'upload/goods/1498102269head_img3.png', '240,240', '240,240', 'upload/goods/1498102269head_img4.png', '60,60', '60,60', '2017-06-22 11:31:10');
INSERT INTO `tp_album_picture` VALUES ('1569', '0', '0', '0', 'qrcode_template_21498102716', 'qrcode_template_2', 'upload/goods/qrcode_template_21498102716.png', '640,1134', '640,1134', 'upload/goods/1498102716qrcode_template_21.png', '700,700', '700,700', 'upload/goods/1498102716qrcode_template_22.png', '360,360', '360,360', 'upload/goods/1498102716qrcode_template_23.png', '240,240', '240,240', 'upload/goods/1498102716qrcode_template_24.png', '60,60', '60,60', '2017-06-22 11:38:37');
INSERT INTO `tp_album_picture` VALUES ('1570', '0', '0', '0', 'qrcode_template_31498103855', 'qrcode_template_3', 'upload/goods/qrcode_template_31498103855.png', '640,1134', '640,1134', 'upload/goods/1498103855qrcode_template_31.png', '700,700', '700,700', 'upload/goods/1498103855qrcode_template_32.png', '360,360', '360,360', 'upload/goods/1498103855qrcode_template_33.png', '240,240', '240,240', 'upload/goods/1498103855qrcode_template_34.png', '60,60', '60,60', '2017-06-22 11:57:36');
INSERT INTO `tp_album_picture` VALUES ('1575', '0', '0', '0', 'head_img1498112971', 'head_img', 'upload/goods/head_img1498112971.png', '80,80', '80,80', 'upload/goods/1498112971head_img1.png', '700,700', '700,700', 'upload/goods/1498112971head_img2.png', '360,360', '360,360', 'upload/goods/1498112971head_img3.png', '240,240', '240,240', 'upload/goods/1498112971head_img4.png', '60,60', '60,60', '2017-06-22 14:29:32');
INSERT INTO `tp_album_picture` VALUES ('1576', '0', '0', '0', 'qrcode_31498112971', 'qrcode_3', 'upload/goods/qrcode_31498112971.png', '640,1134', '640,1134', 'upload/goods/1498112971qrcode_31.png', '700,700', '700,700', 'upload/goods/1498112971qrcode_32.png', '360,360', '360,360', 'upload/goods/1498112971qrcode_33.png', '240,240', '240,240', 'upload/goods/1498112971qrcode_34.png', '60,60', '60,60', '2017-06-22 14:29:33');
INSERT INTO `tp_album_picture` VALUES ('1577', '0', '0', '0', 'qrcode_21498112971', 'qrcode_2', 'upload/goods/qrcode_21498112971.png', '640,1134', '640,1134', 'upload/goods/1498112971qrcode_21.png', '700,700', '700,700', 'upload/goods/1498112971qrcode_22.png', '360,360', '360,360', 'upload/goods/1498112971qrcode_23.png', '240,240', '240,240', 'upload/goods/1498112971qrcode_24.png', '60,60', '60,60', '2017-06-22 14:29:33');
INSERT INTO `tp_album_picture` VALUES ('1578', '0', '0', '0', 'qrcode_11498112971', 'qrcode_1', 'upload/goods/qrcode_11498112971.png', '640,1134', '640,1134', 'upload/goods/1498112971qrcode_11.png', '700,700', '700,700', 'upload/goods/1498112971qrcode_12.png', '360,360', '360,360', 'upload/goods/1498112971qrcode_13.png', '240,240', '240,240', 'upload/goods/1498112971qrcode_14.png', '60,60', '60,60', '2017-06-22 14:29:33');
INSERT INTO `tp_album_picture` VALUES ('1579', '0', '0', '0', 'qrcode_11498115936', 'qrcode_1', 'upload/goods/qrcode_11498115936.png', '640,1134', '640,1134', 'upload/goods/1498115936qrcode_11.png', '700,700', '700,700', 'upload/goods/1498115936qrcode_12.png', '360,360', '360,360', 'upload/goods/1498115936qrcode_13.png', '240,240', '240,240', 'upload/goods/1498115936qrcode_14.png', '60,60', '60,60', '2017-06-22 15:18:58');
INSERT INTO `tp_album_picture` VALUES ('1580', '0', '0', '0', 'qrcode_template_31498116141', 'qrcode_template_3', 'upload/goods/qrcode_template_31498116141.png', '640,1134', '640,1134', 'upload/goods/1498116142qrcode_template_31.png', '700,700', '700,700', 'upload/goods/1498116142qrcode_template_32.png', '360,360', '360,360', 'upload/goods/1498116142qrcode_template_33.png', '240,240', '240,240', 'upload/goods/1498116142qrcode_template_34.png', '60,60', '60,60', '2017-06-22 15:22:23');
INSERT INTO `tp_album_picture` VALUES ('1583', '0', '0', '0', 'qrcode_31498118372', 'qrcode_3', 'upload/goods/qrcode_31498118372.png', '640,1134', '640,1134', 'upload/goods/1498118372qrcode_31.png', '700,700', '700,700', 'upload/goods/1498118372qrcode_32.png', '360,360', '360,360', 'upload/goods/1498118372qrcode_33.png', '240,240', '240,240', 'upload/goods/1498118372qrcode_34.png', '60,60', '60,60', '2017-06-22 15:59:33');
INSERT INTO `tp_album_picture` VALUES ('1584', '0', '0', '0', 'qrcode_21498118372', 'qrcode_2', 'upload/goods/qrcode_21498118372.png', '640,1134', '640,1134', 'upload/goods/1498118372qrcode_21.png', '700,700', '700,700', 'upload/goods/1498118372qrcode_22.png', '360,360', '360,360', 'upload/goods/1498118372qrcode_23.png', '240,240', '240,240', 'upload/goods/1498118372qrcode_24.png', '60,60', '60,60', '2017-06-22 15:59:33');
INSERT INTO `tp_album_picture` VALUES ('1590', '0', '0', '0', '22733065_150621981000_21498123957', '22733065_150621981000_2', 'upload/goods/22733065_150621981000_21498123957.jpg', '662,1024', '662,1024', 'upload/goods/149812395722733065_150621981000_21.jpg', '700,700', '700,700', 'upload/goods/149812395722733065_150621981000_22.jpg', '360,360', '360,360', 'upload/goods/149812395722733065_150621981000_23.jpg', '240,240', '240,240', 'upload/goods/149812395722733065_150621981000_24.jpg', '60,60', '60,60', '2017-06-22 17:32:37');
INSERT INTO `tp_album_picture` VALUES ('1591', '0', '0', '0', 'qrcode_11498124001', 'qrcode_1', 'upload/goods/qrcode_11498124001.png', '640,1134', '640,1134', 'upload/goods/1498124001qrcode_11.png', '700,700', '700,700', 'upload/goods/1498124001qrcode_12.png', '360,360', '360,360', 'upload/goods/1498124001qrcode_13.png', '240,240', '240,240', 'upload/goods/1498124001qrcode_14.png', '60,60', '60,60', '2017-06-22 17:33:23');
INSERT INTO `tp_album_picture` VALUES ('1592', '0', '0', '0', 'qrcode_add1498124014', 'qrcode_add', 'upload/goods/qrcode_add1498124014.png', '22,22', '22,22', 'upload/goods/1498124014qrcode_add1.png', '700,700', '700,700', 'upload/goods/1498124014qrcode_add2.png', '360,360', '360,360', 'upload/goods/1498124014qrcode_add3.png', '240,240', '240,240', 'upload/goods/1498124014qrcode_add4.png', '60,60', '60,60', '2017-06-22 17:33:35');
INSERT INTO `tp_album_picture` VALUES ('1593', '0', '0', '0', 'head_img1498124014', 'head_img', 'upload/goods/head_img1498124014.png', '80,80', '80,80', 'upload/goods/1498124014head_img1.png', '700,700', '700,700', 'upload/goods/1498124014head_img2.png', '360,360', '360,360', 'upload/goods/1498124014head_img3.png', '240,240', '240,240', 'upload/goods/1498124014head_img4.png', '60,60', '60,60', '2017-06-22 17:33:35');
INSERT INTO `tp_album_picture` VALUES ('1594', '0', '0', '0', 'qrcode_21498124014', 'qrcode_2', 'upload/goods/qrcode_21498124014.png', '640,1134', '640,1134', 'upload/goods/1498124014qrcode_21.png', '700,700', '700,700', 'upload/goods/1498124014qrcode_22.png', '360,360', '360,360', 'upload/goods/1498124014qrcode_23.png', '240,240', '240,240', 'upload/goods/1498124014qrcode_24.png', '60,60', '60,60', '2017-06-22 17:33:36');
INSERT INTO `tp_album_picture` VALUES ('1595', '0', '0', '0', 'qrcode_31498124014', 'qrcode_3', 'upload/goods/qrcode_31498124014.png', '640,1134', '640,1134', 'upload/goods/1498124014qrcode_31.png', '700,700', '700,700', 'upload/goods/1498124014qrcode_32.png', '360,360', '360,360', 'upload/goods/1498124014qrcode_33.png', '240,240', '240,240', 'upload/goods/1498124014qrcode_34.png', '60,60', '60,60', '2017-06-22 17:33:36');
INSERT INTO `tp_album_picture` VALUES ('1596', '0', '0', '0', 'qrcode_2 - 副本1498124014', 'qrcode_2 - 副本', 'upload/goods/qrcode_2 - 副本1498124014.png', '640,1134', '640,1134', 'upload/goods/1498124014qrcode_2 - 副本1.png', '700,700', '700,700', 'upload/goods/1498124014qrcode_2 - 副本2.png', '360,360', '360,360', 'upload/goods/1498124014qrcode_2 - 副本3.png', '240,240', '240,240', 'upload/goods/1498124014qrcode_2 - 副本4.png', '60,60', '60,60', '2017-06-22 17:33:36');
INSERT INTO `tp_album_picture` VALUES ('1597', '0', '0', '0', 'qrcode_11498124014', 'qrcode_1', 'upload/goods/qrcode_11498124014.png', '640,1134', '640,1134', 'upload/goods/1498124014qrcode_11.png', '700,700', '700,700', 'upload/goods/1498124014qrcode_12.png', '360,360', '360,360', 'upload/goods/1498124014qrcode_13.png', '240,240', '240,240', 'upload/goods/1498124014qrcode_14.png', '60,60', '60,60', '2017-06-22 17:33:37');
INSERT INTO `tp_album_picture` VALUES ('1598', '0', '0', '0', 'qrcode_template_31498124016', 'qrcode_template_3', 'upload/goods/qrcode_template_31498124016.png', '640,1134', '640,1134', 'upload/goods/1498124016qrcode_template_31.png', '700,700', '700,700', 'upload/goods/1498124016qrcode_template_32.png', '360,360', '360,360', 'upload/goods/1498124016qrcode_template_33.png', '240,240', '240,240', 'upload/goods/1498124016qrcode_template_34.png', '60,60', '60,60', '2017-06-22 17:33:37');
INSERT INTO `tp_album_picture` VALUES ('1599', '0', '0', '0', 'qrcode_template_21498124016', 'qrcode_template_2', 'upload/goods/qrcode_template_21498124016.png', '640,1134', '640,1134', 'upload/goods/1498124016qrcode_template_21.png', '700,700', '700,700', 'upload/goods/1498124016qrcode_template_22.png', '360,360', '360,360', 'upload/goods/1498124016qrcode_template_23.png', '240,240', '240,240', 'upload/goods/1498124016qrcode_template_24.png', '60,60', '60,60', '2017-06-22 17:33:38');
INSERT INTO `tp_album_picture` VALUES ('1600', '0', '0', '0', 'qrcode_template_11498124016', 'qrcode_template_1', 'upload/goods/qrcode_template_11498124016.png', '640,1134', '640,1134', 'upload/goods/1498124016qrcode_template_11.png', '700,700', '700,700', 'upload/goods/1498124016qrcode_template_12.png', '360,360', '360,360', 'upload/goods/1498124016qrcode_template_13.png', '240,240', '240,240', 'upload/goods/1498124016qrcode_template_14.png', '60,60', '60,60', '2017-06-22 17:33:38');
INSERT INTO `tp_album_picture` VALUES ('1601', '0', '0', '0', 'shop_qrcode_bg1498124016', 'shop_qrcode_bg', 'upload/goods/shop_qrcode_bg1498124016.png', '640,741', '640,741', 'upload/goods/1498124016shop_qrcode_bg1.png', '700,700', '700,700', 'upload/goods/1498124016shop_qrcode_bg2.png', '360,360', '360,360', 'upload/goods/1498124016shop_qrcode_bg3.png', '240,240', '240,240', 'upload/goods/1498124016shop_qrcode_bg4.png', '60,60', '60,60', '2017-06-22 17:33:38');
INSERT INTO `tp_album_picture` VALUES ('1602', '0', '0', '0', 'qrcode_11498124319', 'qrcode_1', 'upload/goods/qrcode_11498124319.png', '640,1134', '640,1134', 'upload/goods/1498124319qrcode_11.png', '700,700', '700,700', 'upload/goods/1498124319qrcode_12.png', '360,360', '360,360', 'upload/goods/1498124319qrcode_13.png', '240,240', '240,240', 'upload/goods/1498124319qrcode_14.png', '60,60', '60,60', '2017-06-22 17:38:41');
INSERT INTO `tp_album_picture` VALUES ('1603', '0', '0', '0', 'head_img1498124443', 'head_img', 'upload/goods/head_img1498124443.png', '80,80', '80,80', 'upload/goods/1498124443head_img1.png', '700,700', '700,700', 'upload/goods/1498124443head_img2.png', '360,360', '360,360', 'upload/goods/1498124443head_img3.png', '240,240', '240,240', 'upload/goods/1498124443head_img4.png', '60,60', '60,60', '2017-06-22 17:40:44');
INSERT INTO `tp_album_picture` VALUES ('1604', '0', '0', '0', 'qrcode_2 - 副本1498124443', 'qrcode_2 - 副本', 'upload/goods/qrcode_2 - 副本1498124443.png', '640,1134', '640,1134', 'upload/goods/1498124443qrcode_2 - 副本1.png', '700,700', '700,700', 'upload/goods/1498124443qrcode_2 - 副本2.png', '360,360', '360,360', 'upload/goods/1498124443qrcode_2 - 副本3.png', '240,240', '240,240', 'upload/goods/1498124443qrcode_2 - 副本4.png', '60,60', '60,60', '2017-06-22 17:40:45');
INSERT INTO `tp_album_picture` VALUES ('1605', '0', '0', '0', 'qrcode_21498124443', 'qrcode_2', 'upload/goods/qrcode_21498124443.png', '640,1134', '640,1134', 'upload/goods/1498124443qrcode_21.png', '700,700', '700,700', 'upload/goods/1498124443qrcode_22.png', '360,360', '360,360', 'upload/goods/1498124443qrcode_23.png', '240,240', '240,240', 'upload/goods/1498124443qrcode_24.png', '60,60', '60,60', '2017-06-22 17:40:45');
INSERT INTO `tp_album_picture` VALUES ('1616', '0', '0', '0', 'head_img1498128796', 'head_img', 'upload/goods/head_img1498128796.png', '80,80', '80,80', 'upload/goods/1498128796head_img1.png', '700,700', '700,700', 'upload/goods/1498128796head_img2.png', '360,360', '360,360', 'upload/goods/1498128796head_img3.png', '240,240', '240,240', 'upload/goods/1498128796head_img4.png', '60,60', '60,60', '2017-06-22 18:53:17');
INSERT INTO `tp_album_picture` VALUES ('1617', '0', '0', '0', 'head_img1498128989', 'head_img', 'upload/goods/head_img1498128989.png', '80,80', '80,80', 'upload/goods/1498128989head_img1.png', '700,700', '700,700', 'upload/goods/1498128989head_img2.png', '360,360', '360,360', 'upload/goods/1498128989head_img3.png', '240,240', '240,240', 'upload/goods/1498128989head_img4.png', '60,60', '60,60', '2017-06-22 18:56:30');
INSERT INTO `tp_album_picture` VALUES ('1622', '0', '0', '0', '医院详情1498186692', '医院详情', 'upload/goods/医院详情1498186692.png', '1920,1504', '1920,1504', 'upload/goods/1498186693医院详情1.png', '700,700', '700,700', 'upload/goods/1498186693医院详情2.png', '360,360', '360,360', 'upload/goods/1498186693医院详情3.png', '240,240', '240,240', 'upload/goods/1498186693医院详情4.png', '60,60', '60,60', '2017-06-23 10:58:14');
INSERT INTO `tp_album_picture` VALUES ('1623', '0', '0', '0', '22733065_150621981000_21498187065', '22733065_150621981000_2', 'upload/goods/22733065_150621981000_21498187065.jpg', '662,1024', '662,1024', 'upload/goods/149818706622733065_150621981000_21.jpg', '700,700', '700,700', 'upload/goods/149818706622733065_150621981000_22.jpg', '360,360', '360,360', 'upload/goods/149818706622733065_150621981000_23.jpg', '240,240', '240,240', 'upload/goods/149818706622733065_150621981000_24.jpg', '60,60', '60,60', '2017-06-23 11:04:28');
INSERT INTO `tp_album_picture` VALUES ('1624', '0', '0', '0', 'beauty_bg_v21498187160', 'beauty_bg_v2', 'upload/goods/beauty_bg_v21498187160.jpg', '570,366', '570,366', 'upload/goods/1498187160beauty_bg_v21.jpg', '700,700', '700,700', 'upload/goods/1498187160beauty_bg_v22.jpg', '360,360', '360,360', 'upload/goods/1498187160beauty_bg_v23.jpg', '240,240', '240,240', 'upload/goods/1498187160beauty_bg_v24.jpg', '60,60', '60,60', '2017-06-23 11:06:00');
INSERT INTO `tp_album_picture` VALUES ('1625', '0', '0', '0', '1498124014qrcode_121498188782', '1498124014qrcode_12', 'upload/goods/1498124014qrcode_121498188782.png', '360,360', '360,360', 'upload/goods/14981887831498124014qrcode_121.png', '700,700', '700,700', 'upload/goods/14981887831498124014qrcode_122.png', '360,360', '360,360', 'upload/goods/14981887831498124014qrcode_123.png', '240,240', '240,240', 'upload/goods/14981887831498124014qrcode_124.png', '60,60', '60,60', '2017-06-23 11:33:04');
INSERT INTO `tp_album_picture` VALUES ('1626', '0', '0', '0', 'upload_loading1498189142', 'upload_loading', 'upload/goods/upload_loading1498189142.gif', '146,8', '146,8', 'upload/goods/1498189142upload_loading1.gif', '700,700', '700,700', 'upload/goods/1498189142upload_loading2.gif', '360,360', '360,360', 'upload/goods/1498189142upload_loading3.gif', '240,240', '240,240', 'upload/goods/1498189142upload_loading4.gif', '60,60', '60,60', '2017-06-23 11:39:03');
INSERT INTO `tp_album_picture` VALUES ('1627', '0', '0', '0', 'default_goods_image_2401498189186', 'default_goods_image_240', 'upload/goods/default_goods_image_2401498189186.gif', '240,240', '240,240', 'upload/goods/1498189186default_goods_image_2401.gif', '700,700', '700,700', 'upload/goods/1498189186default_goods_image_2402.gif', '360,360', '360,360', 'upload/goods/1498189186default_goods_image_2403.gif', '240,240', '240,240', 'upload/goods/1498189186default_goods_image_2404.gif', '60,60', '60,60', '2017-06-23 11:39:46');
INSERT INTO `tp_album_picture` VALUES ('1628', '0', '0', '0', '1498124014qrcode_121498189229', '1498124014qrcode_12', 'upload/goods/1498124014qrcode_121498189229.png', '360,360', '360,360', 'upload/goods/14981892291498124014qrcode_121.png', '700,700', '700,700', 'upload/goods/14981892291498124014qrcode_122.png', '360,360', '360,360', 'upload/goods/14981892291498124014qrcode_123.png', '240,240', '240,240', 'upload/goods/14981892291498124014qrcode_124.png', '60,60', '60,60', '2017-06-23 11:40:31');
INSERT INTO `tp_album_picture` VALUES ('1629', '0', '0', '0', '1498124014qrcode_121498189311', '1498124014qrcode_12', 'upload/goods/1498124014qrcode_121498189311.png', '360,360', '360,360', 'upload/goods/14981893111498124014qrcode_121.png', '700,700', '700,700', 'upload/goods/14981893111498124014qrcode_122.png', '360,360', '360,360', 'upload/goods/14981893111498124014qrcode_123.png', '240,240', '240,240', 'upload/goods/14981893111498124014qrcode_124.png', '60,60', '60,60', '2017-06-23 11:41:53');
INSERT INTO `tp_album_picture` VALUES ('1630', '0', '0', '0', '1498124014qrcode_121498189427', '1498124014qrcode_12', 'upload/goods/1498124014qrcode_121498189427.png', '360,360', '360,360', 'upload/goods/14981894271498124014qrcode_121.png', '700,700', '700,700', 'upload/goods/14981894271498124014qrcode_122.png', '360,360', '360,360', 'upload/goods/14981894271498124014qrcode_123.png', '240,240', '240,240', 'upload/goods/14981894271498124014qrcode_124.png', '60,60', '60,60', '2017-06-23 11:43:49');
INSERT INTO `tp_album_picture` VALUES ('1631', '0', '0', '0', '1498124014qrcode_121498189452', '1498124014qrcode_12', 'upload/goods/1498124014qrcode_121498189452.png', '360,360', '360,360', 'upload/goods/14981894521498124014qrcode_121.png', '700,700', '700,700', 'upload/goods/14981894521498124014qrcode_122.png', '360,360', '360,360', 'upload/goods/14981894521498124014qrcode_123.png', '240,240', '240,240', 'upload/goods/14981894521498124014qrcode_124.png', '60,60', '60,60', '2017-06-23 11:44:14');
INSERT INTO `tp_album_picture` VALUES ('1632', '0', '0', '0', '1498124014qrcode_121498190561', '1498124014qrcode_12', 'upload/goods/1498124014qrcode_121498190561.png', '360,360', '360,360', 'upload/goods/14981905611498124014qrcode_121.png', '700,700', '700,700', 'upload/goods/14981905611498124014qrcode_122.png', '360,360', '360,360', 'upload/goods/14981905611498124014qrcode_123.png', '240,240', '240,240', 'upload/goods/14981905611498124014qrcode_124.png', '60,60', '60,60', '2017-06-23 12:02:43');
INSERT INTO `tp_album_picture` VALUES ('1633', '0', '0', '0', '1498124014qrcode_121498191193', '1498124014qrcode_12', 'upload/goods/1498124014qrcode_121498191193.png', '360,360', '360,360', 'upload/goods/14981911931498124014qrcode_121.png', '700,700', '700,700', 'upload/goods/14981911931498124014qrcode_122.png', '360,360', '360,360', 'upload/goods/14981911931498124014qrcode_123.png', '240,240', '240,240', 'upload/goods/14981911931498124014qrcode_124.png', '60,60', '60,60', '2017-06-23 12:13:15');
INSERT INTO `tp_album_picture` VALUES ('1634', '0', '0', '0', '1498124014qrcode_121498192351', '1498124014qrcode_12', 'upload/goods/1498124014qrcode_121498192351.png', '360,360', '360,360', 'upload/goods/14981923511498124014qrcode_121.png', '700,700', '700,700', 'upload/goods/14981923511498124014qrcode_122.png', '360,360', '360,360', 'upload/goods/14981923511498124014qrcode_123.png', '240,240', '240,240', 'upload/goods/14981923511498124014qrcode_124.png', '60,60', '60,60', '2017-06-23 12:32:33');
INSERT INTO `tp_album_picture` VALUES ('1635', '0', '0', '0', '22733065_150621981000_21498192380', '22733065_150621981000_2', 'upload/goods/22733065_150621981000_21498192380.jpg', '662,1024', '662,1024', 'upload/goods/149819238022733065_150621981000_21.jpg', '700,700', '700,700', 'upload/goods/149819238022733065_150621981000_22.jpg', '360,360', '360,360', 'upload/goods/149819238022733065_150621981000_23.jpg', '240,240', '240,240', 'upload/goods/149819238022733065_150621981000_24.jpg', '60,60', '60,60', '2017-06-23 12:33:00');
INSERT INTO `tp_album_picture` VALUES ('1636', '0', '0', '0', '1498124014qrcode_121498192473', '1498124014qrcode_12', 'upload/goods/1498124014qrcode_121498192473.png', '360,360', '360,360', 'upload/goods/14981924731498124014qrcode_121.png', '700,700', '700,700', 'upload/goods/14981924731498124014qrcode_122.png', '360,360', '360,360', 'upload/goods/14981924731498124014qrcode_123.png', '240,240', '240,240', 'upload/goods/14981924731498124014qrcode_124.png', '60,60', '60,60', '2017-06-23 12:34:34');
INSERT INTO `tp_album_picture` VALUES ('1637', '0', '0', '0', 'default_goods_image_2401498192531', 'default_goods_image_240', 'upload/goods/default_goods_image_2401498192531.gif', '240,240', '240,240', 'upload/goods/1498192532default_goods_image_2401.gif', '700,700', '700,700', 'upload/goods/1498192532default_goods_image_2402.gif', '360,360', '360,360', 'upload/goods/1498192532default_goods_image_2403.gif', '240,240', '240,240', 'upload/goods/1498192532default_goods_image_2404.gif', '60,60', '60,60', '2017-06-23 12:35:32');
INSERT INTO `tp_album_picture` VALUES ('1638', '0', '0', '0', '22733065_150621981000_21498192539', '22733065_150621981000_2', 'upload/goods/22733065_150621981000_21498192539.jpg', '662,1024', '662,1024', 'upload/goods/149819253922733065_150621981000_21.jpg', '700,700', '700,700', 'upload/goods/149819253922733065_150621981000_22.jpg', '360,360', '360,360', 'upload/goods/149819253922733065_150621981000_23.jpg', '240,240', '240,240', 'upload/goods/149819253922733065_150621981000_24.jpg', '60,60', '60,60', '2017-06-23 12:35:40');
INSERT INTO `tp_album_picture` VALUES ('1639', '0', '0', '0', '1498124014qrcode_121498192540', '1498124014qrcode_12', 'upload/goods/1498124014qrcode_121498192540.png', '360,360', '360,360', 'upload/goods/14981925401498124014qrcode_121.png', '700,700', '700,700', 'upload/goods/14981925401498124014qrcode_122.png', '360,360', '360,360', 'upload/goods/14981925401498124014qrcode_123.png', '240,240', '240,240', 'upload/goods/14981925401498124014qrcode_124.png', '60,60', '60,60', '2017-06-23 12:35:42');
INSERT INTO `tp_album_picture` VALUES ('1640', '0', '0', '0', '1498124014qrcode_121498198424', '1498124014qrcode_12', 'upload/goods/1498124014qrcode_121498198424.png', '360,360', '360,360', 'upload/goods/14981984251498124014qrcode_121.png', '700,700', '700,700', 'upload/goods/14981984251498124014qrcode_122.png', '360,360', '360,360', 'upload/goods/14981984251498124014qrcode_123.png', '240,240', '240,240', 'upload/goods/14981984251498124014qrcode_124.png', '60,60', '60,60', '2017-06-23 14:13:46');
INSERT INTO `tp_album_picture` VALUES ('1641', '0', '0', '0', 'default_goods_image_2401498198488', 'default_goods_image_240', 'upload/goods/default_goods_image_2401498198488.gif', '240,240', '240,240', 'upload/goods/1498198488default_goods_image_2401.gif', '700,700', '700,700', 'upload/goods/1498198488default_goods_image_2402.gif', '360,360', '360,360', 'upload/goods/1498198488default_goods_image_2403.gif', '240,240', '240,240', 'upload/goods/1498198488default_goods_image_2404.gif', '60,60', '60,60', '2017-06-23 14:14:48');
INSERT INTO `tp_album_picture` VALUES ('1642', '0', '0', '0', 'qrcode_2 - 副本1498198498', 'qrcode_2 - 副本', 'upload/goods/qrcode_2 - 副本1498198498.png', '640,1134', '640,1134', 'upload/goods/1498198498qrcode_2 - 副本1.png', '700,700', '700,700', 'upload/goods/1498198498qrcode_2 - 副本2.png', '360,360', '360,360', 'upload/goods/1498198498qrcode_2 - 副本3.png', '240,240', '240,240', 'upload/goods/1498198498qrcode_2 - 副本4.png', '60,60', '60,60', '2017-06-23 14:15:00');
INSERT INTO `tp_album_picture` VALUES ('1643', '0', '0', '0', 'qrcode_11498198498', 'qrcode_1', 'upload/goods/qrcode_11498198498.png', '640,1134', '640,1134', 'upload/goods/1498198498qrcode_11.png', '700,700', '700,700', 'upload/goods/1498198498qrcode_12.png', '360,360', '360,360', 'upload/goods/1498198498qrcode_13.png', '240,240', '240,240', 'upload/goods/1498198498qrcode_14.png', '60,60', '60,60', '2017-06-23 14:15:00');
INSERT INTO `tp_album_picture` VALUES ('1699', '0', '0', '0', '开源商城(1) (1) - 副本1498206553', '开源商城(1) (1) - 副本', 'upload/goods/开源商城(1) (1) - 副本1498206553.png', '420,90', '420,90', 'upload/goods/1498206553开源商城(1) (1) - 副本1.png', '700,700', '700,700', 'upload/goods/1498206553开源商城(1) (1) - 副本2.png', '360,360', '360,360', 'upload/goods/1498206553开源商城(1) (1) - 副本3.png', '240,240', '240,240', 'upload/goods/1498206553开源商城(1) (1) - 副本4.png', '60,60', '60,60', '2017-06-23 16:29:14');
INSERT INTO `tp_album_picture` VALUES ('1700', '0', '0', '0', '1498124014qrcode_121498206566', '1498124014qrcode_12', 'upload/goods/1498124014qrcode_121498206566.png', '360,360', '360,360', 'upload/goods/14982065671498124014qrcode_121.png', '700,700', '700,700', 'upload/goods/14982065671498124014qrcode_122.png', '360,360', '360,360', 'upload/goods/14982065671498124014qrcode_123.png', '240,240', '240,240', 'upload/goods/14982065671498124014qrcode_124.png', '60,60', '60,60', '2017-06-23 16:29:28');
INSERT INTO `tp_album_picture` VALUES ('1711', '0', '0', '0', 'shop_qrcode_bg1498295060', 'shop_qrcode_bg', 'upload/goods/shop_qrcode_bg1498295060.png', '640,741', '640,741', 'upload/goods/1498295060shop_qrcode_bg1.png', '700,700', '700,700', 'upload/goods/1498295060shop_qrcode_bg2.png', '360,360', '360,360', 'upload/goods/1498295060shop_qrcode_bg3.png', '240,240', '240,240', 'upload/goods/1498295060shop_qrcode_bg4.png', '60,60', '60,60', '2017-06-24 17:04:22');
INSERT INTO `tp_album_picture` VALUES ('1712', '0', '0', '0', 'qrcode_11498295060', 'qrcode_1', 'upload/goods/qrcode_11498295060.png', '640,1134', '640,1134', 'upload/goods/1498295060qrcode_11.png', '700,700', '700,700', 'upload/goods/1498295060qrcode_12.png', '360,360', '360,360', 'upload/goods/1498295060qrcode_13.png', '240,240', '240,240', 'upload/goods/1498295060qrcode_14.png', '60,60', '60,60', '2017-06-24 17:04:22');
INSERT INTO `tp_album_picture` VALUES ('1727', '0', '0', '0', 'no_photo_male1498477414', 'no_photo_male', 'upload/goods/no_photo_male1498477414.png', '140,140', '140,140', 'upload/goods/1498477414no_photo_male1.png', '700,700', '700,700', 'upload/goods/1498477414no_photo_male2.png', '360,360', '360,360', 'upload/goods/1498477414no_photo_male3.png', '240,240', '240,240', 'upload/goods/1498477414no_photo_male4.png', '60,60', '60,60', '2017-06-26 19:43:35');
INSERT INTO `tp_album_picture` VALUES ('1728', '0', '0', '0', 'TB1S0eTLpXXXXavXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q901498478252', 'TB1S0eTLpXXXXavXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90', 'upload/goods/TB1S0eTLpXXXXavXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q901498478252.jpg', '430,430', '430,430', 'upload/goods/1498478252TB1S0eTLpXXXXavXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q901.jpg', '700,700', '700,700', 'upload/goods/1498478252TB1S0eTLpXXXXavXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q902.jpg', '360,360', '360,360', 'upload/goods/1498478252TB1S0eTLpXXXXavXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q903.jpg', '240,240', '240,240', 'upload/goods/1498478252TB1S0eTLpXXXXavXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q904.jpg', '60,60', '60,60', '2017-06-26 19:57:32');
INSERT INTO `tp_album_picture` VALUES ('1729', '0', '0', '0', 'TB1tyk8JFXXXXb1XFXXXXXXXXXX_!!0-item_pic.jpg_430x430q901498478266', 'TB1tyk8JFXXXXb1XFXXXXXXXXXX_!!0-item_pic.jpg_430x430q90', 'upload/goods/TB1tyk8JFXXXXb1XFXXXXXXXXXX_!!0-item_pic.jpg_430x430q901498478266.jpg', '430,430', '430,430', 'upload/goods/1498478266TB1tyk8JFXXXXb1XFXXXXXXXXXX_!!0-item_pic.jpg_430x430q901.jpg', '700,700', '700,700', 'upload/goods/1498478266TB1tyk8JFXXXXb1XFXXXXXXXXXX_!!0-item_pic.jpg_430x430q902.jpg', '360,360', '360,360', 'upload/goods/1498478266TB1tyk8JFXXXXb1XFXXXXXXXXXX_!!0-item_pic.jpg_430x430q903.jpg', '240,240', '240,240', 'upload/goods/1498478266TB1tyk8JFXXXXb1XFXXXXXXXXXX_!!0-item_pic.jpg_430x430q904.jpg', '60,60', '60,60', '2017-06-26 19:57:46');
INSERT INTO `tp_album_picture` VALUES ('1730', '0', '0', '0', 'TB2PmcsfFXXXXatXXXXXXXXXXXX_!!2146727028.jpg_430x430q901498478268', 'TB2PmcsfFXXXXatXXXXXXXXXXXX_!!2146727028.jpg_430x430q90', 'upload/goods/TB2PmcsfFXXXXatXXXXXXXXXXXX_!!2146727028.jpg_430x430q901498478268.jpg', '430,430', '430,430', 'upload/goods/1498478268TB2PmcsfFXXXXatXXXXXXXXXXXX_!!2146727028.jpg_430x430q901.jpg', '700,700', '700,700', 'upload/goods/1498478268TB2PmcsfFXXXXatXXXXXXXXXXXX_!!2146727028.jpg_430x430q902.jpg', '360,360', '360,360', 'upload/goods/1498478268TB2PmcsfFXXXXatXXXXXXXXXXXX_!!2146727028.jpg_430x430q903.jpg', '240,240', '240,240', 'upload/goods/1498478268TB2PmcsfFXXXXatXXXXXXXXXXXX_!!2146727028.jpg_430x430q904.jpg', '60,60', '60,60', '2017-06-26 19:57:48');
INSERT INTO `tp_album_picture` VALUES ('1731', '0', '0', '0', 'TB1S0eTLpXXXXavXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q901498478271', 'TB1S0eTLpXXXXavXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90', 'upload/goods/TB1S0eTLpXXXXavXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q901498478271.jpg', '430,430', '430,430', 'upload/goods/1498478271TB1S0eTLpXXXXavXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q901.jpg', '700,700', '700,700', 'upload/goods/1498478271TB1S0eTLpXXXXavXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q902.jpg', '360,360', '360,360', 'upload/goods/1498478271TB1S0eTLpXXXXavXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q903.jpg', '240,240', '240,240', 'upload/goods/1498478271TB1S0eTLpXXXXavXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q904.jpg', '60,60', '60,60', '2017-06-26 19:57:51');
INSERT INTO `tp_album_picture` VALUES ('1732', '0', '0', '0', 'TB1S0eTLpXXXXavXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q901498478273', 'TB1S0eTLpXXXXavXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90', 'upload/goods/TB1S0eTLpXXXXavXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q901498478273.jpg', '430,430', '430,430', 'upload/goods/1498478273TB1S0eTLpXXXXavXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q901.jpg', '700,700', '700,700', 'upload/goods/1498478273TB1S0eTLpXXXXavXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q902.jpg', '360,360', '360,360', 'upload/goods/1498478273TB1S0eTLpXXXXavXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q903.jpg', '240,240', '240,240', 'upload/goods/1498478273TB1S0eTLpXXXXavXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q904.jpg', '60,60', '60,60', '2017-06-26 19:57:53');
INSERT INTO `tp_album_picture` VALUES ('1733', '0', '0', '0', 'TB1S0eTLpXXXXavXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q901498478276', 'TB1S0eTLpXXXXavXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90', 'upload/goods/TB1S0eTLpXXXXavXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q901498478276.jpg', '430,430', '430,430', 'upload/goods/1498478276TB1S0eTLpXXXXavXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q901.jpg', '700,700', '700,700', 'upload/goods/1498478276TB1S0eTLpXXXXavXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q902.jpg', '360,360', '360,360', 'upload/goods/1498478276TB1S0eTLpXXXXavXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q903.jpg', '240,240', '240,240', 'upload/goods/1498478276TB1S0eTLpXXXXavXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q904.jpg', '60,60', '60,60', '2017-06-26 19:57:56');
INSERT INTO `tp_album_picture` VALUES ('1734', '0', '0', '0', 'TB1S0eTLpXXXXavXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q901498478281', 'TB1S0eTLpXXXXavXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90', 'upload/goods/TB1S0eTLpXXXXavXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q901498478281.jpg', '430,430', '430,430', 'upload/goods/1498478281TB1S0eTLpXXXXavXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q901.jpg', '700,700', '700,700', 'upload/goods/1498478281TB1S0eTLpXXXXavXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q902.jpg', '360,360', '360,360', 'upload/goods/1498478281TB1S0eTLpXXXXavXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q903.jpg', '240,240', '240,240', 'upload/goods/1498478281TB1S0eTLpXXXXavXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q904.jpg', '60,60', '60,60', '2017-06-26 19:58:02');
INSERT INTO `tp_album_picture` VALUES ('1735', '0', '0', '0', 'TB1tyk8JFXXXXb1XFXXXXXXXXXX_!!0-item_pic.jpg_430x430q901498478284', 'TB1tyk8JFXXXXb1XFXXXXXXXXXX_!!0-item_pic.jpg_430x430q90', 'upload/goods/TB1tyk8JFXXXXb1XFXXXXXXXXXX_!!0-item_pic.jpg_430x430q901498478284.jpg', '430,430', '430,430', 'upload/goods/1498478284TB1tyk8JFXXXXb1XFXXXXXXXXXX_!!0-item_pic.jpg_430x430q901.jpg', '700,700', '700,700', 'upload/goods/1498478284TB1tyk8JFXXXXb1XFXXXXXXXXXX_!!0-item_pic.jpg_430x430q902.jpg', '360,360', '360,360', 'upload/goods/1498478284TB1tyk8JFXXXXb1XFXXXXXXXXXX_!!0-item_pic.jpg_430x430q903.jpg', '240,240', '240,240', 'upload/goods/1498478284TB1tyk8JFXXXXb1XFXXXXXXXXXX_!!0-item_pic.jpg_430x430q904.jpg', '60,60', '60,60', '2017-06-26 19:58:04');
INSERT INTO `tp_album_picture` VALUES ('1736', '0', '0', '0', 'TB1S0eTLpXXXXavXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q901498478285', 'TB1S0eTLpXXXXavXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90', 'upload/goods/TB1S0eTLpXXXXavXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q901498478285.jpg', '430,430', '430,430', 'upload/goods/1498478285TB1S0eTLpXXXXavXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q901.jpg', '700,700', '700,700', 'upload/goods/1498478285TB1S0eTLpXXXXavXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q902.jpg', '360,360', '360,360', 'upload/goods/1498478285TB1S0eTLpXXXXavXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q903.jpg', '240,240', '240,240', 'upload/goods/1498478285TB1S0eTLpXXXXavXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q904.jpg', '60,60', '60,60', '2017-06-26 19:58:06');
INSERT INTO `tp_album_picture` VALUES ('1737', '0', '0', '0', 'TB1S0eTLpXXXXavXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q901498478289', 'TB1S0eTLpXXXXavXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90', 'upload/goods/TB1S0eTLpXXXXavXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q901498478289.jpg', '430,430', '430,430', 'upload/goods/1498478289TB1S0eTLpXXXXavXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q901.jpg', '700,700', '700,700', 'upload/goods/1498478289TB1S0eTLpXXXXavXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q902.jpg', '360,360', '360,360', 'upload/goods/1498478289TB1S0eTLpXXXXavXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q903.jpg', '240,240', '240,240', 'upload/goods/1498478289TB1S0eTLpXXXXavXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q904.jpg', '60,60', '60,60', '2017-06-26 19:58:09');
INSERT INTO `tp_album_picture` VALUES ('1738', '0', '0', '0', 'TB1tyk8JFXXXXb1XFXXXXXXXXXX_!!0-item_pic.jpg_430x430q901498478291', 'TB1tyk8JFXXXXb1XFXXXXXXXXXX_!!0-item_pic.jpg_430x430q90', 'upload/goods/TB1tyk8JFXXXXb1XFXXXXXXXXXX_!!0-item_pic.jpg_430x430q901498478291.jpg', '430,430', '430,430', 'upload/goods/1498478291TB1tyk8JFXXXXb1XFXXXXXXXXXX_!!0-item_pic.jpg_430x430q901.jpg', '700,700', '700,700', 'upload/goods/1498478291TB1tyk8JFXXXXb1XFXXXXXXXXXX_!!0-item_pic.jpg_430x430q902.jpg', '360,360', '360,360', 'upload/goods/1498478291TB1tyk8JFXXXXb1XFXXXXXXXXXX_!!0-item_pic.jpg_430x430q903.jpg', '240,240', '240,240', 'upload/goods/1498478291TB1tyk8JFXXXXb1XFXXXXXXXXXX_!!0-item_pic.jpg_430x430q904.jpg', '60,60', '60,60', '2017-06-26 19:58:12');
INSERT INTO `tp_album_picture` VALUES ('1739', '0', '0', '0', 'TB1tyk8JFXXXXb1XFXXXXXXXXXX_!!0-item_pic.jpg_430x430q901498478293', 'TB1tyk8JFXXXXb1XFXXXXXXXXXX_!!0-item_pic.jpg_430x430q90', 'upload/goods/TB1tyk8JFXXXXb1XFXXXXXXXXXX_!!0-item_pic.jpg_430x430q901498478293.jpg', '430,430', '430,430', 'upload/goods/1498478293TB1tyk8JFXXXXb1XFXXXXXXXXXX_!!0-item_pic.jpg_430x430q901.jpg', '700,700', '700,700', 'upload/goods/1498478293TB1tyk8JFXXXXb1XFXXXXXXXXXX_!!0-item_pic.jpg_430x430q902.jpg', '360,360', '360,360', 'upload/goods/1498478293TB1tyk8JFXXXXb1XFXXXXXXXXXX_!!0-item_pic.jpg_430x430q903.jpg', '240,240', '240,240', 'upload/goods/1498478293TB1tyk8JFXXXXb1XFXXXXXXXXXX_!!0-item_pic.jpg_430x430q904.jpg', '60,60', '60,60', '2017-06-26 19:58:14');
INSERT INTO `tp_album_picture` VALUES ('1740', '0', '0', '0', 'QQ图片201706241046131498554151', 'QQ图片20170624104613', 'upload/goods/QQ图片201706241046131498554151.jpg', '640,1138', '640,1138', 'upload/goods/1498554151QQ图片201706241046131.jpg', '700,700', '700,700', 'upload/goods/1498554151QQ图片201706241046132.jpg', '360,360', '360,360', 'upload/goods/1498554151QQ图片201706241046133.jpg', '240,240', '240,240', 'upload/goods/1498554151QQ图片201706241046134.jpg', '60,60', '60,60', '2017-06-27 17:02:32');
INSERT INTO `tp_album_picture` VALUES ('1741', '0', '0', '0', 'ceshi1498556168', 'ceshi', 'upload/goods/ceshi1498556168.png', '228,193', '228,193', 'upload/goods/1498556169ceshi1.png', '700,700', '700,700', 'upload/goods/1498556169ceshi2.png', '360,360', '360,360', 'upload/goods/1498556169ceshi3.png', '240,240', '240,240', 'upload/goods/1498556169ceshi4.png', '60,60', '60,60', '2017-06-27 17:36:10');
INSERT INTO `tp_album_picture` VALUES ('1742', '0', '0', '0', '55decb37234731498557993', '55decb3723473', 'upload/goods/55decb37234731498557993.jpg', '1000,364', '1000,364', 'upload/goods/149855799355decb37234731.jpg', '700,700', '700,700', 'upload/goods/149855799355decb37234732.jpg', '360,360', '360,360', 'upload/goods/149855799355decb37234733.jpg', '240,240', '240,240', 'upload/goods/149855799355decb37234734.jpg', '60,60', '60,60', '2017-06-27 18:06:34');
INSERT INTO `tp_album_picture` VALUES ('1743', '0', '0', '0', '55decb37234731498558397', '55decb3723473', 'upload/goods/55decb37234731498558397.jpg', '1000,364', '1000,364', 'upload/goods/149855839755decb37234731.jpg', '700,700', '700,700', 'upload/goods/149855839755decb37234732.jpg', '360,360', '360,360', 'upload/goods/149855839755decb37234733.jpg', '240,240', '240,240', 'upload/goods/149855839755decb37234734.jpg', '60,60', '60,60', '2017-06-27 18:13:18');
INSERT INTO `tp_album_picture` VALUES ('1744', '0', '0', '0', '55decb37234731498559937', '55decb3723473', 'upload/goods/55decb37234731498559937.jpg', '1000,364', '1000,364', 'upload/goods/149855993755decb37234731.jpg', '700,700', '700,700', 'upload/goods/149855993755decb37234732.jpg', '360,360', '360,360', 'upload/goods/149855993755decb37234733.jpg', '240,240', '240,240', 'upload/goods/149855993755decb37234734.jpg', '60,60', '60,60', '2017-06-27 18:38:57');
INSERT INTO `tp_album_picture` VALUES ('1745', '0', '0', '0', 'ceshi1498561646', 'ceshi', 'upload/goods/ceshi1498561646.png', '228,193', '228,193', 'upload/goods/1498561646ceshi1.png', '700,700', '700,700', 'upload/goods/1498561646ceshi2.png', '360,360', '360,360', 'upload/goods/1498561646ceshi3.png', '240,240', '240,240', 'upload/goods/1498561646ceshi4.png', '60,60', '60,60', '2017-06-27 19:07:28');
INSERT INTO `tp_album_picture` VALUES ('1746', '0', '0', '0', '55decb37234731498564001', '55decb3723473', 'upload/goods/55decb37234731498564001.jpg', '1000,364', '1000,364', 'upload/goods/149856400255decb37234731.jpg', '700,700', '700,700', 'upload/goods/149856400255decb37234732.jpg', '360,360', '360,360', 'upload/goods/149856400255decb37234733.jpg', '240,240', '240,240', 'upload/goods/149856400255decb37234734.jpg', '60,60', '60,60', '2017-06-27 19:46:43');
INSERT INTO `tp_album_picture` VALUES ('1747', '0', '0', '0', '55decb37234731498566190', '55decb3723473', 'upload/goods/55decb37234731498566190.jpg', '1000,364', '1000,364', 'upload/goods/149856619055decb37234731.jpg', '700,700', '700,700', 'upload/goods/149856619055decb37234732.jpg', '360,360', '360,360', 'upload/goods/149856619055decb37234733.jpg', '240,240', '240,240', 'upload/goods/149856619055decb37234734.jpg', '60,60', '60,60', '2017-06-27 20:23:11');
INSERT INTO `tp_album_picture` VALUES ('1748', '0', '0', '0', '55decb37234731498566341', '55decb3723473', 'upload/goods/55decb37234731498566341.jpg', '1000,364', '1000,364', 'upload/goods/149856634255decb37234731.jpg', '700,700', '700,700', 'upload/goods/149856634255decb37234732.jpg', '360,360', '360,360', 'upload/goods/149856634255decb37234733.jpg', '240,240', '240,240', 'upload/goods/149856634255decb37234734.jpg', '60,60', '60,60', '2017-06-27 20:25:42');
INSERT INTO `tp_album_picture` VALUES ('1749', '0', '0', '0', '55decb37234731498566531', '55decb3723473', 'upload/goods/55decb37234731498566531.jpg', '1000,364', '1000,364', 'upload/goods/149856653155decb37234731.jpg', '700,700', '700,700', 'upload/goods/149856653155decb37234732.jpg', '360,360', '360,360', 'upload/goods/149856653155decb37234733.jpg', '240,240', '240,240', 'upload/goods/149856653155decb37234734.jpg', '60,60', '60,60', '2017-06-27 20:28:52');
INSERT INTO `tp_album_picture` VALUES ('1750', '0', '0', '0', 'banner1498567115', 'banner', 'upload/goods/banner1498567115.jpg', '1350,443', '1350,443', 'upload/goods/1498567115banner1.jpg', '700,700', '700,700', 'upload/goods/1498567115banner2.jpg', '360,360', '360,360', 'upload/goods/1498567115banner3.jpg', '240,240', '240,240', 'upload/goods/1498567115banner4.jpg', '60,60', '60,60', '2017-06-27 20:38:36');
INSERT INTO `tp_album_picture` VALUES ('1751', '0', '0', '0', 'banner1498567143', 'banner', 'upload/goods/banner1498567143.jpg', '1350,443', '1350,443', 'upload/goods/1498567143banner1.jpg', '700,700', '700,700', 'upload/goods/1498567143banner2.jpg', '360,360', '360,360', 'upload/goods/1498567143banner3.jpg', '240,240', '240,240', 'upload/goods/1498567143banner4.jpg', '60,60', '60,60', '2017-06-27 20:39:04');
INSERT INTO `tp_album_picture` VALUES ('1752', '0', '0', '0', '531498567154', '53', 'upload/goods/531498567154.png', '66,609', '66,609', 'upload/goods/1498567154531.png', '700,700', '700,700', 'upload/goods/1498567154532.png', '360,360', '360,360', 'upload/goods/1498567154533.png', '240,240', '240,240', 'upload/goods/1498567154534.png', '60,60', '60,60', '2017-06-27 20:39:15');
INSERT INTO `tp_album_picture` VALUES ('1753', '0', '0', '0', ')R[ROTYN$B9D~5X$PG49AR51498567154', ')R[ROTYN$B9D~5X$PG49AR5', 'upload/goods/)R[ROTYN$B9D~5X$PG49AR51498567154.jpg', '500,69', '500,69', 'upload/goods/1498567154)R[ROTYN$B9D~5X$PG49AR51.jpg', '700,700', '700,700', 'upload/goods/1498567154)R[ROTYN$B9D~5X$PG49AR52.jpg', '360,360', '360,360', 'upload/goods/1498567154)R[ROTYN$B9D~5X$PG49AR53.jpg', '240,240', '240,240', 'upload/goods/1498567154)R[ROTYN$B9D~5X$PG49AR54.jpg', '60,60', '60,60', '2017-06-27 20:39:15');
INSERT INTO `tp_album_picture` VALUES ('1754', '0', '0', '0', '55decb37234731498567154', '55decb3723473', 'upload/goods/55decb37234731498567154.jpg', '1000,364', '1000,364', 'upload/goods/149856715455decb37234731.jpg', '700,700', '700,700', 'upload/goods/149856715455decb37234732.jpg', '360,360', '360,360', 'upload/goods/149856715455decb37234733.jpg', '240,240', '240,240', 'upload/goods/149856715455decb37234734.jpg', '60,60', '60,60', '2017-06-27 20:39:15');
INSERT INTO `tp_album_picture` VALUES ('1755', '0', '0', '0', 'banner1498567154', 'banner', 'upload/goods/banner1498567154.jpg', '1350,443', '1350,443', 'upload/goods/1498567154banner1.jpg', '700,700', '700,700', 'upload/goods/1498567154banner2.jpg', '360,360', '360,360', 'upload/goods/1498567154banner3.jpg', '240,240', '240,240', 'upload/goods/1498567154banner4.jpg', '60,60', '60,60', '2017-06-27 20:39:15');
INSERT INTO `tp_album_picture` VALUES ('1756', '0', '0', '0', '1167511498567154', '116751', 'upload/goods/1167511498567154.png', '1199,129', '1199,129', 'upload/goods/14985671541167511.png', '700,700', '700,700', 'upload/goods/14985671541167512.png', '360,360', '360,360', 'upload/goods/14985671541167513.png', '240,240', '240,240', 'upload/goods/14985671541167514.png', '60,60', '60,60', '2017-06-27 20:39:16');
INSERT INTO `tp_album_picture` VALUES ('1757', '0', '0', '0', 'banner1498632362', 'banner', 'upload/goods/banner1498632362.jpg', '1350,443', '1350,443', 'upload/goods/1498632362banner1.jpg', '700,700', '700,700', 'upload/goods/1498632362banner2.jpg', '360,360', '360,360', 'upload/goods/1498632362banner3.jpg', '240,240', '240,240', 'upload/goods/1498632362banner4.jpg', '60,60', '60,60', '2017-06-28 14:46:02');
INSERT INTO `tp_album_picture` VALUES ('1758', '0', '0', '0', 'share_logo1498640147', 'share_logo', 'upload/goods/share_logo1498640147.png', '600,600', '600,600', 'upload/goods/1498640147share_logo1.png', '700,700', '700,700', 'upload/goods/1498640147share_logo2.png', '360,360', '360,360', 'upload/goods/1498640147share_logo3.png', '240,240', '240,240', 'upload/goods/1498640147share_logo4.png', '60,60', '60,60', '2017-06-28 16:55:47');
INSERT INTO `tp_album_picture` VALUES ('1759', '0', '0', '0', '1983168ef3564e9d0a9edc7a7e955ee11498640167', '1983168ef3564e9d0a9edc7a7e955ee1', 'upload/goods/1983168ef3564e9d0a9edc7a7e955ee11498640167.jpg', '1132,830', '1132,830', 'upload/goods/14986401681983168ef3564e9d0a9edc7a7e955ee11.jpg', '700,700', '700,700', 'upload/goods/14986401681983168ef3564e9d0a9edc7a7e955ee12.jpg', '360,360', '360,360', 'upload/goods/14986401681983168ef3564e9d0a9edc7a7e955ee13.jpg', '240,240', '240,240', 'upload/goods/14986401681983168ef3564e9d0a9edc7a7e955ee14.jpg', '60,60', '60,60', '2017-06-28 16:56:08');
INSERT INTO `tp_album_picture` VALUES ('1760', '0', '0', '0', '55decb37234731498640839', '55decb3723473', 'upload/goods/55decb37234731498640839.jpg', '1000,364', '1000,364', 'upload/goods/149864084055decb37234731.jpg', '700,700', '700,700', 'upload/goods/149864084055decb37234732.jpg', '360,360', '360,360', 'upload/goods/149864084055decb37234733.jpg', '240,240', '240,240', 'upload/goods/149864084055decb37234734.jpg', '60,60', '60,60', '2017-06-28 17:07:20');
INSERT INTO `tp_album_picture` VALUES ('1761', '0', '0', '0', '2(7)1498640918', '2(7)', 'upload/goods/2(7)1498640918.png', '240,360', '240,360', 'upload/goods/14986409182(7)1.png', '700,700', '700,700', 'upload/goods/14986409182(7)2.png', '360,360', '360,360', 'upload/goods/14986409182(7)3.png', '240,240', '240,240', 'upload/goods/14986409182(7)4.png', '60,60', '60,60', '2017-06-28 17:08:40');
INSERT INTO `tp_album_picture` VALUES ('1762', '0', '0', '0', '55decb37234731498640925', '55decb3723473', 'upload/goods/55decb37234731498640925.jpg', '1000,364', '1000,364', 'upload/goods/149864092555decb37234731.jpg', '700,700', '700,700', 'upload/goods/149864092555decb37234732.jpg', '360,360', '360,360', 'upload/goods/149864092555decb37234733.jpg', '240,240', '240,240', 'upload/goods/149864092555decb37234734.jpg', '60,60', '60,60', '2017-06-28 17:08:46');
INSERT INTO `tp_album_picture` VALUES ('1766', '0', '30', '0', 'johnwhite1498648162', 'johnwhite', 'upload/goods/johnwhite1498648162.png', '198,265', '198,265', 'upload/goods/1498648162johnwhite1.png', '700,700', '700,700', 'upload/goods/1498648162johnwhite2.png', '360,360', '360,360', 'upload/goods/1498648162johnwhite3.png', '240,240', '240,240', 'upload/goods/1498648162johnwhite4.png', '60,60', '60,60', '2017-06-28 19:09:23');
INSERT INTO `tp_album_picture` VALUES ('1820', '0', '0', '0', '4f5165d01be80ec3a97cff5d975b23841500100153', '4f5165d01be80ec3a97cff5d975b2384', 'upload/goods/4f5165d01be80ec3a97cff5d975b23841500100153.jpg', '1100,1390', '1100,1390', 'upload/goods/15001001534f5165d01be80ec3a97cff5d975b23841.jpg', '700,700', '700,700', 'upload/goods/15001001534f5165d01be80ec3a97cff5d975b23842.jpg', '360,360', '360,360', 'upload/goods/15001001534f5165d01be80ec3a97cff5d975b23843.jpg', '240,240', '240,240', 'upload/goods/15001001534f5165d01be80ec3a97cff5d975b23844.jpg', '60,60', '60,60', '2017-07-15 14:29:14');
INSERT INTO `tp_album_picture` VALUES ('1821', '0', '33', '0', '148758575411500111993', '14875857541', 'upload/goods/148758575411500111993.jpg', '800,800', '800,800', 'upload/goods/1500111993148758575411.jpg', '700,700', '700,700', 'upload/goods/1500111993148758575412.jpg', '360,360', '360,360', 'upload/goods/1500111993148758575413.jpg', '240,240', '240,240', 'upload/goods/1500111993148758575414.jpg', '60,60', '60,60', '2017-07-15 17:46:33');
INSERT INTO `tp_album_picture` VALUES ('1822', '0', '33', '0', '14875740921500112502', '1487574092', 'upload/goods/14875740921500112502.jpg', '452,307', '452,307', 'upload/goods/150011250214875740921.jpg', '700,700', '700,700', 'upload/goods/150011250214875740922.jpg', '360,360', '360,360', 'upload/goods/150011250214875740923.jpg', '240,240', '240,240', 'upload/goods/150011250214875740924.jpg', '60,60', '60,60', '2017-07-15 17:55:02');
INSERT INTO `tp_album_picture` VALUES ('1823', '0', '30', '0', '440edaad4c2a1283edba6e15e6e8dc59_14970679601500458575', '440edaad4c2a1283edba6e15e6e8dc59_1497067960', 'upload/goods/440edaad4c2a1283edba6e15e6e8dc59_14970679601500458575.png', '242,140', '242,140', 'upload/goods/1500458575440edaad4c2a1283edba6e15e6e8dc59_14970679601.png', '700,700', '700,700', 'upload/goods/1500458575440edaad4c2a1283edba6e15e6e8dc59_14970679602.png', '360,360', '360,360', 'upload/goods/1500458575440edaad4c2a1283edba6e15e6e8dc59_14970679603.png', '240,240', '240,240', 'upload/goods/1500458575440edaad4c2a1283edba6e15e6e8dc59_14970679604.png', '60,60', '60,60', '2017-07-19 18:02:55');
INSERT INTO `tp_album_picture` VALUES ('1824', '0', '30', '0', '148758575411500458973', '14875857541', 'upload/goods/148758575411500458973.jpg', '800,800', '800,800', 'upload/goods/1500458973148758575411.jpg', '700,700', '700,700', 'upload/goods/1500458973148758575412.jpg', '360,360', '360,360', 'upload/goods/1500458973148758575413.jpg', '240,240', '240,240', 'upload/goods/1500458973148758575414.jpg', '60,60', '60,60', '2017-07-19 18:09:33');
INSERT INTO `tp_album_picture` VALUES ('1825', '0', '30', '0', '440edaad4c2a1283edba6e15e6e8dc59_14970679601500459398', '440edaad4c2a1283edba6e15e6e8dc59_1497067960', 'upload/goods/440edaad4c2a1283edba6e15e6e8dc59_14970679601500459398.png', '242,140', '242,140', 'upload/goods/1500459398440edaad4c2a1283edba6e15e6e8dc59_14970679601.png', '700,700', '700,700', 'upload/goods/1500459398440edaad4c2a1283edba6e15e6e8dc59_14970679602.png', '360,360', '360,360', 'upload/goods/1500459398440edaad4c2a1283edba6e15e6e8dc59_14970679603.png', '240,240', '240,240', 'upload/goods/1500459398440edaad4c2a1283edba6e15e6e8dc59_14970679604.png', '60,60', '60,60', '2017-07-19 18:16:38');
INSERT INTO `tp_album_picture` VALUES ('1826', '0', '30', '0', '148758575411500461644', '14875857541', 'upload/goods/148758575411500461644.jpg', '800,800', '800,800', 'upload/goods/1500461644148758575411.jpg', '700,700', '700,700', 'upload/goods/1500461644148758575412.jpg', '360,360', '360,360', 'upload/goods/1500461644148758575413.jpg', '240,240', '240,240', 'upload/goods/1500461644148758575414.jpg', '60,60', '60,60', '2017-07-19 18:54:04');
INSERT INTO `tp_album_picture` VALUES ('1827', '0', '30', '0', '501500547407', '50', 'upload/goods/501500547407.jpg', '800,800', '800,800', 'upload/goods/1500547407501.jpg', '700,700', '700,700', 'upload/goods/1500547407502.jpg', '360,360', '360,360', 'upload/goods/1500547407503.jpg', '240,240', '240,240', 'upload/goods/1500547407504.jpg', '60,60', '60,60', '2017-07-20 18:43:28');
INSERT INTO `tp_album_picture` VALUES ('1828', '0', '30', '0', '511500547414', '51', 'upload/goods/511500547414.jpg', '800,800', '800,800', 'upload/goods/1500547414511.jpg', '700,700', '700,700', 'upload/goods/1500547414512.jpg', '360,360', '360,360', 'upload/goods/1500547414513.jpg', '240,240', '240,240', 'upload/goods/1500547414514.jpg', '60,60', '60,60', '2017-07-20 18:43:35');
INSERT INTO `tp_album_picture` VALUES ('1829', '0', '30', '0', '521500547416', '52', 'upload/goods/521500547416.jpg', '800,800', '800,800', 'upload/goods/1500547416521.jpg', '700,700', '700,700', 'upload/goods/1500547416522.jpg', '360,360', '360,360', 'upload/goods/1500547416523.jpg', '240,240', '240,240', 'upload/goods/1500547416524.jpg', '60,60', '60,60', '2017-07-20 18:43:37');
INSERT INTO `tp_album_picture` VALUES ('1830', '0', '34', '0', '531500547939', '53', 'upload/goods/531500547939.jpg', '430,430', '430,430', 'upload/goods/1500547939531.jpg', '700,700', '700,700', 'upload/goods/1500547939532.jpg', '360,360', '360,360', 'upload/goods/1500547939533.jpg', '240,240', '240,240', 'upload/goods/1500547939534.jpg', '60,60', '60,60', '2017-07-20 18:52:20');
INSERT INTO `tp_album_picture` VALUES ('1831', '0', '34', '0', '541500548556', '54', 'upload/goods/541500548556.jpg', '430,430', '430,430', 'upload/goods/1500548556541.jpg', '700,700', '700,700', 'upload/goods/1500548556542.jpg', '360,360', '360,360', 'upload/goods/1500548556543.jpg', '240,240', '240,240', 'upload/goods/1500548556544.jpg', '60,60', '60,60', '2017-07-20 19:02:37');
INSERT INTO `tp_album_picture` VALUES ('1832', '0', '33', '0', '551500549320', '55', 'upload/goods/551500549320.jpg', '800,800', '800,800', 'upload/goods/1500549320551.jpg', '700,700', '700,700', 'upload/goods/1500549320552.jpg', '360,360', '360,360', 'upload/goods/1500549320553.jpg', '240,240', '240,240', 'upload/goods/1500549320554.jpg', '60,60', '60,60', '2017-07-20 19:15:21');
INSERT INTO `tp_album_picture` VALUES ('1833', '0', '33', '0', '561500549323', '56', 'upload/goods/561500549323.jpg', '800,800', '800,800', 'upload/goods/1500549323561.jpg', '700,700', '700,700', 'upload/goods/1500549323562.jpg', '360,360', '360,360', 'upload/goods/1500549323563.jpg', '240,240', '240,240', 'upload/goods/1500549323564.jpg', '60,60', '60,60', '2017-07-20 19:15:23');
INSERT INTO `tp_album_picture` VALUES ('1834', '0', '33', '0', '571500549392', '57', 'upload/goods/571500549392.jpg', '800,800', '800,800', 'upload/goods/1500549392571.jpg', '700,700', '700,700', 'upload/goods/1500549392572.jpg', '360,360', '360,360', 'upload/goods/1500549392573.jpg', '240,240', '240,240', 'upload/goods/1500549392574.jpg', '60,60', '60,60', '2017-07-20 19:16:33');
INSERT INTO `tp_album_picture` VALUES ('1835', '0', '33', '0', '581500549394', '58', 'upload/goods/581500549394.png', '496,551', '496,551', 'upload/goods/1500549394581.png', '700,700', '700,700', 'upload/goods/1500549394582.png', '360,360', '360,360', 'upload/goods/1500549394583.png', '240,240', '240,240', 'upload/goods/1500549394584.png', '60,60', '60,60', '2017-07-20 19:16:36');
INSERT INTO `tp_album_picture` VALUES ('1836', '0', '0', '0', '581500549586', '58', 'upload/goods/581500549586.png', '496,551', '496,551', 'upload/goods/1500549586581.png', '700,700', '700,700', 'upload/goods/1500549586582.png', '360,360', '360,360', 'upload/goods/1500549586583.png', '240,240', '240,240', 'upload/goods/1500549586584.png', '60,60', '60,60', '2017-07-20 19:19:48');
INSERT INTO `tp_album_picture` VALUES ('1837', '0', '0', '0', '591500549702', '59', 'upload/goods/591500549702.jpg', '800,800', '800,800', 'upload/goods/1500549702591.jpg', '700,700', '700,700', 'upload/goods/1500549702592.jpg', '360,360', '360,360', 'upload/goods/1500549702593.jpg', '240,240', '240,240', 'upload/goods/1500549702594.jpg', '60,60', '60,60', '2017-07-20 19:21:42');
INSERT INTO `tp_album_picture` VALUES ('1838', '0', '0', '0', '601500549706', '60', 'upload/goods/601500549706.jpg', '800,800', '800,800', 'upload/goods/1500549706601.jpg', '700,700', '700,700', 'upload/goods/1500549706602.jpg', '360,360', '360,360', 'upload/goods/1500549706603.jpg', '240,240', '240,240', 'upload/goods/1500549706604.jpg', '60,60', '60,60', '2017-07-20 19:21:46');
INSERT INTO `tp_album_picture` VALUES ('1839', '0', '30', '0', '621500600673', '62', 'upload/goods/621500600673.jpg', '585,600', '585,600', 'upload/goods/1500600673621.jpg', '700,700', '700,700', 'upload/goods/1500600673622.jpg', '360,360', '360,360', 'upload/goods/1500600673623.jpg', '240,240', '240,240', 'upload/goods/1500600673624.jpg', '60,60', '60,60', '2017-07-21 09:31:14');
INSERT INTO `tp_album_picture` VALUES ('1840', '0', '30', '0', '611500600675', '61', 'upload/goods/611500600675.jpg', '700,700', '700,700', 'upload/goods/1500600675611.jpg', '700,700', '700,700', 'upload/goods/1500600675612.jpg', '360,360', '360,360', 'upload/goods/1500600675613.jpg', '240,240', '240,240', 'upload/goods/1500600675614.jpg', '60,60', '60,60', '2017-07-21 09:31:16');
INSERT INTO `tp_album_picture` VALUES ('1841', '0', '30', '0', '631500600767', '63', 'upload/goods/631500600767.jpg', '800,800', '800,800', 'upload/goods/1500600767631.jpg', '700,700', '700,700', 'upload/goods/1500600767632.jpg', '360,360', '360,360', 'upload/goods/1500600767633.jpg', '240,240', '240,240', 'upload/goods/1500600767634.jpg', '60,60', '60,60', '2017-07-21 09:32:47');
INSERT INTO `tp_album_picture` VALUES ('1842', '0', '30', '0', '641500600769', '64', 'upload/goods/641500600769.jpg', '800,800', '800,800', 'upload/goods/1500600769641.jpg', '700,700', '700,700', 'upload/goods/1500600769642.jpg', '360,360', '360,360', 'upload/goods/1500600769643.jpg', '240,240', '240,240', 'upload/goods/1500600769644.jpg', '60,60', '60,60', '2017-07-21 09:32:50');
INSERT INTO `tp_album_picture` VALUES ('1843', '0', '30', '0', '651500600772', '65', 'upload/goods/651500600772.jpg', '800,800', '800,800', 'upload/goods/1500600772651.jpg', '700,700', '700,700', 'upload/goods/1500600772652.jpg', '360,360', '360,360', 'upload/goods/1500600772653.jpg', '240,240', '240,240', 'upload/goods/1500600772654.jpg', '60,60', '60,60', '2017-07-21 09:32:52');
INSERT INTO `tp_album_picture` VALUES ('1844', '0', '33', '0', '701500601152', '70', 'upload/goods/701500601152.jpg', '750,750', '750,750', 'upload/goods/1500601152701.jpg', '700,700', '700,700', 'upload/goods/1500601152702.jpg', '360,360', '360,360', 'upload/goods/1500601152703.jpg', '240,240', '240,240', 'upload/goods/1500601152704.jpg', '60,60', '60,60', '2017-07-21 09:39:12');
INSERT INTO `tp_album_picture` VALUES ('1845', '0', '33', '0', '711500601154', '71', 'upload/goods/711500601154.jpg', '750,750', '750,750', 'upload/goods/1500601154711.jpg', '700,700', '700,700', 'upload/goods/1500601154712.jpg', '360,360', '360,360', 'upload/goods/1500601154713.jpg', '240,240', '240,240', 'upload/goods/1500601154714.jpg', '60,60', '60,60', '2017-07-21 09:39:14');
INSERT INTO `tp_album_picture` VALUES ('1846', '0', '33', '0', '721500601156', '72', 'upload/goods/721500601156.jpg', '750,750', '750,750', 'upload/goods/1500601156721.jpg', '700,700', '700,700', 'upload/goods/1500601156722.jpg', '360,360', '360,360', 'upload/goods/1500601156723.jpg', '240,240', '240,240', 'upload/goods/1500601156724.jpg', '60,60', '60,60', '2017-07-21 09:39:17');
INSERT INTO `tp_album_picture` VALUES ('1847', '0', '33', '0', '741500601296', '74', 'upload/goods/741500601296.jpg', '2612,2612', '2612,2612', 'upload/goods/1500601296741.jpg', '700,700', '700,700', 'upload/goods/1500601296742.jpg', '360,360', '360,360', 'upload/goods/1500601296743.jpg', '240,240', '240,240', 'upload/goods/1500601296744.jpg', '60,60', '60,60', '2017-07-21 09:41:38');
INSERT INTO `tp_album_picture` VALUES ('1848', '0', '33', '0', '751500601301', '75', 'upload/goods/751500601301.jpg', '900,900', '900,900', 'upload/goods/1500601302751.jpg', '700,700', '700,700', 'upload/goods/1500601302752.jpg', '360,360', '360,360', 'upload/goods/1500601302753.jpg', '240,240', '240,240', 'upload/goods/1500601302754.jpg', '60,60', '60,60', '2017-07-21 09:41:42');
INSERT INTO `tp_album_picture` VALUES ('1849', '0', '33', '0', '801500601381', '80', 'upload/goods/801500601381.jpg', '800,800', '800,800', 'upload/goods/1500601381801.jpg', '700,700', '700,700', 'upload/goods/1500601381802.jpg', '360,360', '360,360', 'upload/goods/1500601381803.jpg', '240,240', '240,240', 'upload/goods/1500601381804.jpg', '60,60', '60,60', '2017-07-21 09:43:02');
INSERT INTO `tp_album_picture` VALUES ('1850', '0', '33', '0', '811500601385', '81', 'upload/goods/811500601385.jpg', '800,800', '800,800', 'upload/goods/1500601385811.jpg', '700,700', '700,700', 'upload/goods/1500601385812.jpg', '360,360', '360,360', 'upload/goods/1500601385813.jpg', '240,240', '240,240', 'upload/goods/1500601385814.jpg', '60,60', '60,60', '2017-07-21 09:43:06');
INSERT INTO `tp_album_picture` VALUES ('1851', '0', '0', '0', '901500601495', '90', 'upload/goods/901500601495.jpg', '800,800', '800,800', 'upload/goods/1500601496901.jpg', '700,700', '700,700', 'upload/goods/1500601496902.jpg', '360,360', '360,360', 'upload/goods/1500601496903.jpg', '240,240', '240,240', 'upload/goods/1500601496904.jpg', '60,60', '60,60', '2017-07-21 09:44:56');
INSERT INTO `tp_album_picture` VALUES ('1852', '0', '0', '0', '911500601500', '91', 'upload/goods/911500601500.jpg', '800,800', '800,800', 'upload/goods/1500601500911.jpg', '700,700', '700,700', 'upload/goods/1500601500912.jpg', '360,360', '360,360', 'upload/goods/1500601500913.jpg', '240,240', '240,240', 'upload/goods/1500601500914.jpg', '60,60', '60,60', '2017-07-21 09:45:00');
INSERT INTO `tp_album_picture` VALUES ('1853', '0', '0', '0', '951500601571', '95', 'upload/goods/951500601571.jpg', '800,800', '800,800', 'upload/goods/1500601571951.jpg', '700,700', '700,700', 'upload/goods/1500601571952.jpg', '360,360', '360,360', 'upload/goods/1500601571953.jpg', '240,240', '240,240', 'upload/goods/1500601571954.jpg', '60,60', '60,60', '2017-07-21 09:46:12');
INSERT INTO `tp_album_picture` VALUES ('1854', '0', '0', '0', '961500601574', '96', 'upload/goods/961500601574.jpg', '800,800', '800,800', 'upload/goods/1500601574961.jpg', '700,700', '700,700', 'upload/goods/1500601574962.jpg', '360,360', '360,360', 'upload/goods/1500601574963.jpg', '240,240', '240,240', 'upload/goods/1500601574964.jpg', '60,60', '60,60', '2017-07-21 09:46:15');
INSERT INTO `tp_album_picture` VALUES ('1855', '0', '0', '0', '971500601655', '97', 'upload/goods/971500601655.jpg', '500,500', '500,500', 'upload/goods/1500601655971.jpg', '700,700', '700,700', 'upload/goods/1500601655972.jpg', '360,360', '360,360', 'upload/goods/1500601655973.jpg', '240,240', '240,240', 'upload/goods/1500601655974.jpg', '60,60', '60,60', '2017-07-21 09:47:36');
INSERT INTO `tp_album_picture` VALUES ('1856', '0', '0', '0', '981500601659', '98', 'upload/goods/981500601659.jpg', '800,800', '800,800', 'upload/goods/1500601659981.jpg', '700,700', '700,700', 'upload/goods/1500601659982.jpg', '360,360', '360,360', 'upload/goods/1500601659983.jpg', '240,240', '240,240', 'upload/goods/1500601659984.jpg', '60,60', '60,60', '2017-07-21 09:47:40');
INSERT INTO `tp_album_picture` VALUES ('1857', '0', '34', '0', '1011500601787', '101', 'upload/goods/1011500601787.jpg', '800,800', '800,800', 'upload/goods/15006017871011.jpg', '700,700', '700,700', 'upload/goods/15006017871012.jpg', '360,360', '360,360', 'upload/goods/15006017871013.jpg', '240,240', '240,240', 'upload/goods/15006017871014.jpg', '60,60', '60,60', '2017-07-21 09:49:48');
INSERT INTO `tp_album_picture` VALUES ('1858', '0', '34', '0', '1021500601791', '102', 'upload/goods/1021500601791.jpg', '800,800', '800,800', 'upload/goods/15006017911021.jpg', '700,700', '700,700', 'upload/goods/15006017911022.jpg', '360,360', '360,360', 'upload/goods/15006017911023.jpg', '240,240', '240,240', 'upload/goods/15006017911024.jpg', '60,60', '60,60', '2017-07-21 09:49:51');
INSERT INTO `tp_album_picture` VALUES ('1859', '0', '34', '0', '1051500601849', '105', 'upload/goods/1051500601849.jpg', '800,800', '800,800', 'upload/goods/15006018501051.jpg', '700,700', '700,700', 'upload/goods/15006018501052.jpg', '360,360', '360,360', 'upload/goods/15006018501053.jpg', '240,240', '240,240', 'upload/goods/15006018501054.jpg', '60,60', '60,60', '2017-07-21 09:50:50');
INSERT INTO `tp_album_picture` VALUES ('1860', '0', '34', '0', '1061500601853', '106', 'upload/goods/1061500601853.jpg', '800,800', '800,800', 'upload/goods/15006018531061.jpg', '700,700', '700,700', 'upload/goods/15006018531062.jpg', '360,360', '360,360', 'upload/goods/15006018531063.jpg', '240,240', '240,240', 'upload/goods/15006018531064.jpg', '60,60', '60,60', '2017-07-21 09:50:54');
INSERT INTO `tp_album_picture` VALUES ('1861', '0', '34', '0', '1101500601925', '110', 'upload/goods/1101500601925.jpg', '800,800', '800,800', 'upload/goods/15006019251101.jpg', '700,700', '700,700', 'upload/goods/15006019251102.jpg', '360,360', '360,360', 'upload/goods/15006019251103.jpg', '240,240', '240,240', 'upload/goods/15006019251104.jpg', '60,60', '60,60', '2017-07-21 09:52:05');
INSERT INTO `tp_album_picture` VALUES ('1862', '0', '34', '0', '1111500601928', '111', 'upload/goods/1111500601928.jpg', '800,800', '800,800', 'upload/goods/15006019281111.jpg', '700,700', '700,700', 'upload/goods/15006019281112.jpg', '360,360', '360,360', 'upload/goods/15006019281113.jpg', '240,240', '240,240', 'upload/goods/15006019281114.jpg', '60,60', '60,60', '2017-07-21 09:52:09');
INSERT INTO `tp_album_picture` VALUES ('1877', '1', '30', '0', 'share1541087468', 'share', '', '', '', 'upload/goods/92276aa0b523247d0aa6204c727818221.jpg', '700,700', '', 'upload/goods/918af622c1af0732420f2f7cbb7426952.jpg', '360,360', '', '', '0', '', '', '0', '', '2018-11-01 11:51:09');
INSERT INTO `tp_album_picture` VALUES ('1878', '1', '30', '0', 'share1541087508', 'share', '', '', '', 'upload/goods/0e9622f8e1fd5a42933408b725f8f9411.jpg', '700,700', '', 'upload/goods/6bdc87c76ddf18758e3f9c2318c535f02.jpg', '360,360', '', '', '0', '', '', '0', '', '2018-11-01 11:51:48');
INSERT INTO `tp_album_picture` VALUES ('1879', '1', '30', '0', 'share1541087805', 'share', '', '', '', 'upload/goods/7f2edb1eba8920fa217375586f0e6ad51.jpg', '700,700', '', 'upload/goods/64000bafdbf01b9871b5408917752c0a2.jpg', '360,360', '', '', '0', '', '', '0', '', '2018-11-01 11:56:45');
INSERT INTO `tp_album_picture` VALUES ('1880', '1', '30', '0', 'share1541087955', 'share', '', '', '', 'upload/goods/fefe0245f9f086e64f87e83dc25db5001.jpg', '700,700', '', 'upload/goods/688d679b71891c2bf079efc21acd5fa72.jpg', '360,360', '', '', '0', '', '', '0', '', '2018-11-01 11:59:15');

-- ----------------------------
-- Table structure for tp_area
-- ----------------------------
DROP TABLE IF EXISTS `tp_area`;
CREATE TABLE `tp_area` (
  `area_id` int(11) NOT NULL AUTO_INCREMENT,
  `area_name` varchar(50) NOT NULL DEFAULT '',
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`area_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=2048 COMMENT='全部区域表';

-- ----------------------------
-- Records of tp_area
-- ----------------------------
INSERT INTO `tp_area` VALUES ('1', '华东', '0');
INSERT INTO `tp_area` VALUES ('2', '华北', '0');
INSERT INTO `tp_area` VALUES ('3', '华南', '0');
INSERT INTO `tp_area` VALUES ('4', '华中', '0');
INSERT INTO `tp_area` VALUES ('5', '东北', '0');
INSERT INTO `tp_area` VALUES ('6', '西北', '0');
INSERT INTO `tp_area` VALUES ('7', '西南', '0');
INSERT INTO `tp_area` VALUES ('8', '港澳台', '0');
INSERT INTO `tp_area` VALUES ('9', '其他', '0');

-- ----------------------------
-- Table structure for tp_arrival_guide
-- ----------------------------
DROP TABLE IF EXISTS `tp_arrival_guide`;
CREATE TABLE `tp_arrival_guide` (
  `guide_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id编\n\n\n\n号',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `sort` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '图片',
  `content` text NOT NULL COMMENT '内容',
  `modify_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  PRIMARY KEY (`guide_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=4096;

-- ----------------------------
-- Records of tp_arrival_guide
-- ----------------------------

-- ----------------------------
-- Table structure for tp_attribute
-- ----------------------------
DROP TABLE IF EXISTS `tp_attribute`;
CREATE TABLE `tp_attribute` (
  `attr_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品属性ID',
  `attr_name` varchar(255) NOT NULL DEFAULT '' COMMENT '属性名称',
  `is_use` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否使用',
  `spec_id_array` varchar(255) NOT NULL DEFAULT '' COMMENT '关联规格',
  `sort` int(11) DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `modify_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`attr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='商品相关属性';

-- ----------------------------
-- Records of tp_attribute
-- ----------------------------
INSERT INTO `tp_attribute` VALUES ('28', '衣服', '1', '110,137,126,125,115,170', '255', '2017-06-10 14:03:46', '2017-06-22 15:18:34');
INSERT INTO `tp_attribute` VALUES ('30', '手机', '1', '111,110,115', '255', '2017-06-12 15:12:20', '2017-06-16 16:08:51');
INSERT INTO `tp_attribute` VALUES ('32', '鞋子', '1', '112,113,117', '255', '2017-06-12 18:29:04', '2017-06-13 12:00:11');

-- ----------------------------
-- Table structure for tp_attribute_value
-- ----------------------------
DROP TABLE IF EXISTS `tp_attribute_value`;
CREATE TABLE `tp_attribute_value` (
  `attr_value_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '属性值ID',
  `attr_value_name` varchar(50) NOT NULL DEFAULT '' COMMENT '属性值名称',
  `attr_id` int(11) NOT NULL COMMENT '属性ID',
  `value` varchar(1000) NOT NULL DEFAULT '' COMMENT '属性对应相关数据',
  `type` int(11) NOT NULL DEFAULT '1' COMMENT '属性对应输入类型1.直接2.单选3.多选',
  `sort` int(11) NOT NULL DEFAULT '1999' COMMENT '排序号',
  `is_search` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否使用',
  PRIMARY KEY (`attr_value_id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=4096 COMMENT='商品属性值';

-- ----------------------------
-- Records of tp_attribute_value
-- ----------------------------
INSERT INTO `tp_attribute_value` VALUES ('74', '风格', '28', '', '1', '0', '1');
INSERT INTO `tp_attribute_value` VALUES ('76', '裙长', '28', '短款,中款,长款', '3', '2', '0');
INSERT INTO `tp_attribute_value` VALUES ('77', '款式', '28', '韩版,休闲,欧美,复古,传统', '3', '3', '1');
INSERT INTO `tp_attribute_value` VALUES ('83', '内存', '30', '2G,4G,8G', '2', '1', '1');
INSERT INTO `tp_attribute_value` VALUES ('84', '操作系统', '30', '', '2', '2', '0');
INSERT INTO `tp_attribute_value` VALUES ('85', '尺寸', '30', '4寸,4.2寸,5寸,5.5寸', '2', '2', '1');
INSERT INTO `tp_attribute_value` VALUES ('87', '鞋跟高度', '32', '1-2cm,5-8cm,8-10cm,大于10cm', '2', '2', '1');
INSERT INTO `tp_attribute_value` VALUES ('93', '男女款式', '32', '', '1', '2', '1');
INSERT INTO `tp_attribute_value` VALUES ('96', '鞋头款式', '32', '平头,尖头', '3', '4', '1');
INSERT INTO `tp_attribute_value` VALUES ('104', '材质', '32', '皮鞋,布鞋', '2', '255', '1');
INSERT INTO `tp_attribute_value` VALUES ('120', '', '28', '', '1', '255', '1');

-- ----------------------------
-- Table structure for tp_cart
-- ----------------------------
DROP TABLE IF EXISTS `tp_cart`;
CREATE TABLE `tp_cart` (
  `cart_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '购物车id',
  `buyer_id` int(11) NOT NULL DEFAULT '0' COMMENT '买家id',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `shop_name` varchar(100) NOT NULL DEFAULT '' COMMENT '店铺名称',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品id',
  `goods_name` varchar(200) NOT NULL COMMENT '商品名称',
  `sku_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品的skuid',
  `sku_name` varchar(200) NOT NULL DEFAULT '' COMMENT '商品的sku名称',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品价格',
  `num` smallint(5) NOT NULL DEFAULT '1' COMMENT '购买商品数量',
  `goods_picture` int(11) NOT NULL DEFAULT '0' COMMENT '商品图片',
  `bl_id` mediumint(8) NOT NULL DEFAULT '0' COMMENT '组合套装ID',
  PRIMARY KEY (`cart_id`),
  KEY `member_id` (`buyer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1170 COMMENT='购物车表';

-- ----------------------------
-- Records of tp_cart
-- ----------------------------
INSERT INTO `tp_cart` VALUES ('1', '87', '41', '乔丹旗舰店', '385', '春季包头中粗跟尖头浅口单鞋女夏2017新款百搭韩版侧空低跟单鞋子', '1484', '', '215.20', '1', '1849', '0');
INSERT INTO `tp_cart` VALUES ('2', '294', '0', 'niushop开源商城', '382', 'M Queen独立制衣 优雅V领褶皱飘带系带修身长裙A字吊带连衣裙8915', '1481', '', '369.00', '1', '1841', '0');

-- ----------------------------
-- Table structure for tp_city
-- ----------------------------
DROP TABLE IF EXISTS `tp_city`;
CREATE TABLE `tp_city` (
  `city_id` int(11) NOT NULL AUTO_INCREMENT,
  `province_id` int(11) NOT NULL DEFAULT '0',
  `city_name` varchar(255) NOT NULL DEFAULT '',
  `zipcode` varchar(6) NOT NULL DEFAULT '',
  `sort` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`city_id`),
  KEY `IDX_g_city_CityName` (`city_name`)
) ENGINE=InnoDB AUTO_INCREMENT=362 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=135;

-- ----------------------------
-- Records of tp_city
-- ----------------------------
INSERT INTO `tp_city` VALUES ('1', '1', '北京市', '100000', '1');
INSERT INTO `tp_city` VALUES ('2', '2', '天津市', '100000', '0');
INSERT INTO `tp_city` VALUES ('3', '3', '石家庄市', '050000', '0');
INSERT INTO `tp_city` VALUES ('4', '3', '唐山市', '063000', '0');
INSERT INTO `tp_city` VALUES ('5', '3', '秦皇岛市', '066000', '0');
INSERT INTO `tp_city` VALUES ('6', '3', '邯郸市', '056000', '0');
INSERT INTO `tp_city` VALUES ('7', '3', '邢台市', '054000', '0');
INSERT INTO `tp_city` VALUES ('8', '3', '保定市', '071000', '0');
INSERT INTO `tp_city` VALUES ('9', '3', '张家口市', '075000', '0');
INSERT INTO `tp_city` VALUES ('10', '3', '承德市', '067000', '0');
INSERT INTO `tp_city` VALUES ('11', '3', '沧州市', '061000', '0');
INSERT INTO `tp_city` VALUES ('12', '3', '廊坊市', '065000', '0');
INSERT INTO `tp_city` VALUES ('13', '3', '衡水市', '053000', '0');
INSERT INTO `tp_city` VALUES ('14', '4', '太原市', '030000', '0');
INSERT INTO `tp_city` VALUES ('15', '4', '大同市', '037000', '0');
INSERT INTO `tp_city` VALUES ('16', '4', '阳泉市', '045000', '0');
INSERT INTO `tp_city` VALUES ('17', '4', '长治市', '046000', '0');
INSERT INTO `tp_city` VALUES ('18', '4', '晋城市', '048000', '0');
INSERT INTO `tp_city` VALUES ('19', '4', '朔州市', '036000', '0');
INSERT INTO `tp_city` VALUES ('20', '4', '晋中市', '030600', '0');
INSERT INTO `tp_city` VALUES ('21', '4', '运城市', '044000', '0');
INSERT INTO `tp_city` VALUES ('22', '4', '忻州市', '034000', '0');
INSERT INTO `tp_city` VALUES ('23', '4', '临汾市', '041000', '0');
INSERT INTO `tp_city` VALUES ('24', '4', '吕梁市', '030500', '0');
INSERT INTO `tp_city` VALUES ('25', '5', '呼和浩特市', '010000', '0');
INSERT INTO `tp_city` VALUES ('26', '5', '包头市', '014000', '0');
INSERT INTO `tp_city` VALUES ('27', '5', '乌海市', '016000', '0');
INSERT INTO `tp_city` VALUES ('28', '5', '赤峰市', '024000', '0');
INSERT INTO `tp_city` VALUES ('29', '5', '通辽市', '028000', '0');
INSERT INTO `tp_city` VALUES ('30', '5', '鄂尔多斯市', '010300', '0');
INSERT INTO `tp_city` VALUES ('31', '5', '呼伦贝尔市', '021000', '0');
INSERT INTO `tp_city` VALUES ('32', '5', '巴彦淖尔市', '014400', '0');
INSERT INTO `tp_city` VALUES ('33', '5', '乌兰察布市', '011800', '0');
INSERT INTO `tp_city` VALUES ('34', '5', '兴安盟', '137500', '0');
INSERT INTO `tp_city` VALUES ('35', '5', '锡林郭勒盟', '011100', '0');
INSERT INTO `tp_city` VALUES ('36', '5', '阿拉善盟', '016000', '0');
INSERT INTO `tp_city` VALUES ('37', '6', '沈阳市', '110000', '0');
INSERT INTO `tp_city` VALUES ('38', '6', '大连市', '116000', '0');
INSERT INTO `tp_city` VALUES ('39', '6', '鞍山市', '114000', '0');
INSERT INTO `tp_city` VALUES ('40', '6', '抚顺市', '113000', '0');
INSERT INTO `tp_city` VALUES ('41', '6', '本溪市', '117000', '0');
INSERT INTO `tp_city` VALUES ('42', '6', '丹东市', '118000', '0');
INSERT INTO `tp_city` VALUES ('43', '6', '锦州市', '121000', '0');
INSERT INTO `tp_city` VALUES ('44', '6', '营口市', '115000', '0');
INSERT INTO `tp_city` VALUES ('45', '6', '阜新市', '123000', '0');
INSERT INTO `tp_city` VALUES ('46', '6', '辽阳市', '111000', '0');
INSERT INTO `tp_city` VALUES ('47', '6', '盘锦市', '124000', '0');
INSERT INTO `tp_city` VALUES ('48', '6', '铁岭市', '112000', '0');
INSERT INTO `tp_city` VALUES ('49', '6', '朝阳市', '122000', '0');
INSERT INTO `tp_city` VALUES ('50', '6', '葫芦岛市', '125000', '0');
INSERT INTO `tp_city` VALUES ('51', '7', '长春市', '130000', '0');
INSERT INTO `tp_city` VALUES ('52', '7', '吉林市', '132000', '0');
INSERT INTO `tp_city` VALUES ('53', '7', '四平市', '136000', '0');
INSERT INTO `tp_city` VALUES ('54', '7', '辽源市', '136200', '0');
INSERT INTO `tp_city` VALUES ('55', '7', '通化市', '134000', '0');
INSERT INTO `tp_city` VALUES ('56', '7', '白山市', '134300', '0');
INSERT INTO `tp_city` VALUES ('57', '7', '松原市', '131100', '0');
INSERT INTO `tp_city` VALUES ('58', '7', '白城市', '137000', '0');
INSERT INTO `tp_city` VALUES ('59', '7', '延边朝鲜族自治州', '133000', '0');
INSERT INTO `tp_city` VALUES ('60', '8', '哈尔滨市', '150000', '0');
INSERT INTO `tp_city` VALUES ('61', '8', '齐齐哈尔市', '161000', '0');
INSERT INTO `tp_city` VALUES ('62', '8', '鸡西市', '158100', '0');
INSERT INTO `tp_city` VALUES ('63', '8', '鹤岗市', '154100', '0');
INSERT INTO `tp_city` VALUES ('64', '8', '双鸭山市', '155100', '0');
INSERT INTO `tp_city` VALUES ('65', '8', '大庆市', '163000', '0');
INSERT INTO `tp_city` VALUES ('66', '8', '伊春市', '152300', '0');
INSERT INTO `tp_city` VALUES ('67', '8', '佳木斯市', '154000', '0');
INSERT INTO `tp_city` VALUES ('68', '8', '七台河市', '154600', '0');
INSERT INTO `tp_city` VALUES ('69', '8', '牡丹江市', '157000', '0');
INSERT INTO `tp_city` VALUES ('70', '8', '黑河市', '164300', '0');
INSERT INTO `tp_city` VALUES ('71', '8', '绥化市', '152000', '0');
INSERT INTO `tp_city` VALUES ('72', '8', '大兴安岭地区', '165000', '0');
INSERT INTO `tp_city` VALUES ('73', '9', '上海市', '200000', '0');
INSERT INTO `tp_city` VALUES ('74', '10', '南京市', '210000', '0');
INSERT INTO `tp_city` VALUES ('75', '10', '无锡市', '214000', '0');
INSERT INTO `tp_city` VALUES ('76', '10', '徐州市', '221000', '0');
INSERT INTO `tp_city` VALUES ('77', '10', '常州市', '213000', '0');
INSERT INTO `tp_city` VALUES ('78', '10', '苏州市', '215000', '0');
INSERT INTO `tp_city` VALUES ('79', '10', '南通市', '226000', '0');
INSERT INTO `tp_city` VALUES ('80', '10', '连云港市', '222000', '0');
INSERT INTO `tp_city` VALUES ('81', '10', '淮安市', '223200', '0');
INSERT INTO `tp_city` VALUES ('82', '10', '盐城市', '224000', '0');
INSERT INTO `tp_city` VALUES ('83', '10', '扬州市', '225000', '0');
INSERT INTO `tp_city` VALUES ('84', '10', '镇江市', '212000', '0');
INSERT INTO `tp_city` VALUES ('85', '10', '泰州市', '225300', '0');
INSERT INTO `tp_city` VALUES ('86', '10', '宿迁市', '223800', '0');
INSERT INTO `tp_city` VALUES ('87', '11', '杭州市', '310000', '0');
INSERT INTO `tp_city` VALUES ('88', '11', '宁波市', '315000', '0');
INSERT INTO `tp_city` VALUES ('89', '11', '温州市', '325000', '0');
INSERT INTO `tp_city` VALUES ('90', '11', '嘉兴市', '314000', '0');
INSERT INTO `tp_city` VALUES ('91', '11', '湖州市', '313000', '0');
INSERT INTO `tp_city` VALUES ('92', '11', '绍兴市', '312000', '0');
INSERT INTO `tp_city` VALUES ('93', '11', '金华市', '321000', '0');
INSERT INTO `tp_city` VALUES ('94', '11', '衢州市', '324000', '0');
INSERT INTO `tp_city` VALUES ('95', '11', '舟山市', '316000', '0');
INSERT INTO `tp_city` VALUES ('96', '11', '台州市', '318000', '0');
INSERT INTO `tp_city` VALUES ('97', '11', '丽水市', '323000', '0');
INSERT INTO `tp_city` VALUES ('98', '12', '合肥市', '230000', '0');
INSERT INTO `tp_city` VALUES ('99', '12', '芜湖市', '241000', '0');
INSERT INTO `tp_city` VALUES ('100', '12', '蚌埠市', '233000', '0');
INSERT INTO `tp_city` VALUES ('101', '12', '淮南市', '232000', '0');
INSERT INTO `tp_city` VALUES ('102', '12', '马鞍山市', '243000', '0');
INSERT INTO `tp_city` VALUES ('103', '12', '淮北市', '235000', '0');
INSERT INTO `tp_city` VALUES ('104', '12', '铜陵市', '244000', '0');
INSERT INTO `tp_city` VALUES ('105', '12', '安庆市', '246000', '0');
INSERT INTO `tp_city` VALUES ('106', '12', '黄山市', '242700', '0');
INSERT INTO `tp_city` VALUES ('107', '12', '滁州市', '239000', '0');
INSERT INTO `tp_city` VALUES ('108', '12', '阜阳市', '236100', '0');
INSERT INTO `tp_city` VALUES ('109', '12', '宿州市', '234100', '0');
INSERT INTO `tp_city` VALUES ('110', '12', '巢湖市', '238000', '0');
INSERT INTO `tp_city` VALUES ('111', '12', '六安市', '237000', '0');
INSERT INTO `tp_city` VALUES ('112', '12', '亳州市', '236800', '0');
INSERT INTO `tp_city` VALUES ('113', '12', '池州市', '247100', '0');
INSERT INTO `tp_city` VALUES ('114', '12', '宣城市', '366000', '0');
INSERT INTO `tp_city` VALUES ('115', '13', '福州市', '350000', '0');
INSERT INTO `tp_city` VALUES ('116', '13', '厦门市', '361000', '0');
INSERT INTO `tp_city` VALUES ('117', '13', '莆田市', '351100', '0');
INSERT INTO `tp_city` VALUES ('118', '13', '三明市', '365000', '0');
INSERT INTO `tp_city` VALUES ('119', '13', '泉州市', '362000', '0');
INSERT INTO `tp_city` VALUES ('120', '13', '漳州市', '363000', '0');
INSERT INTO `tp_city` VALUES ('121', '13', '南平市', '353000', '0');
INSERT INTO `tp_city` VALUES ('122', '13', '龙岩市', '364000', '0');
INSERT INTO `tp_city` VALUES ('123', '13', '宁德市', '352100', '0');
INSERT INTO `tp_city` VALUES ('124', '14', '南昌市', '330000', '0');
INSERT INTO `tp_city` VALUES ('125', '14', '景德镇市', '333000', '0');
INSERT INTO `tp_city` VALUES ('126', '14', '萍乡市', '337000', '0');
INSERT INTO `tp_city` VALUES ('127', '14', '九江市', '332000', '0');
INSERT INTO `tp_city` VALUES ('128', '14', '新余市', '338000', '0');
INSERT INTO `tp_city` VALUES ('129', '14', '鹰潭市', '335000', '0');
INSERT INTO `tp_city` VALUES ('130', '14', '赣州市', '341000', '0');
INSERT INTO `tp_city` VALUES ('131', '14', '吉安市', '343000', '0');
INSERT INTO `tp_city` VALUES ('132', '14', '宜春市', '336000', '0');
INSERT INTO `tp_city` VALUES ('133', '14', '抚州市', '332900', '0');
INSERT INTO `tp_city` VALUES ('134', '14', '上饶市', '334000', '0');
INSERT INTO `tp_city` VALUES ('135', '15', '济南市', '250000', '0');
INSERT INTO `tp_city` VALUES ('136', '15', '青岛市', '266000', '0');
INSERT INTO `tp_city` VALUES ('137', '15', '淄博市', '255000', '0');
INSERT INTO `tp_city` VALUES ('138', '15', '枣庄市', '277100', '0');
INSERT INTO `tp_city` VALUES ('139', '15', '东营市', '257000', '0');
INSERT INTO `tp_city` VALUES ('140', '15', '烟台市', '264000', '0');
INSERT INTO `tp_city` VALUES ('141', '15', '潍坊市', '261000', '0');
INSERT INTO `tp_city` VALUES ('142', '15', '济宁市', '272100', '0');
INSERT INTO `tp_city` VALUES ('143', '15', '泰安市', '271000', '0');
INSERT INTO `tp_city` VALUES ('144', '15', '威海市', '265700', '0');
INSERT INTO `tp_city` VALUES ('145', '15', '日照市', '276800', '0');
INSERT INTO `tp_city` VALUES ('146', '15', '莱芜市', '271100', '0');
INSERT INTO `tp_city` VALUES ('147', '15', '临沂市', '276000', '0');
INSERT INTO `tp_city` VALUES ('148', '15', '德州市', '253000', '0');
INSERT INTO `tp_city` VALUES ('149', '15', '聊城市', '252000', '0');
INSERT INTO `tp_city` VALUES ('150', '15', '滨州市', '256600', '0');
INSERT INTO `tp_city` VALUES ('151', '15', '荷泽市', '255000', '0');
INSERT INTO `tp_city` VALUES ('152', '16', '郑州市', '450000', '0');
INSERT INTO `tp_city` VALUES ('153', '16', '开封市', '475000', '0');
INSERT INTO `tp_city` VALUES ('154', '16', '洛阳市', '471000', '0');
INSERT INTO `tp_city` VALUES ('155', '16', '平顶山市', '467000', '0');
INSERT INTO `tp_city` VALUES ('156', '16', '安阳市', '454900', '0');
INSERT INTO `tp_city` VALUES ('157', '16', '鹤壁市', '456600', '0');
INSERT INTO `tp_city` VALUES ('158', '16', '新乡市', '453000', '0');
INSERT INTO `tp_city` VALUES ('159', '16', '焦作市', '454100', '0');
INSERT INTO `tp_city` VALUES ('160', '16', '濮阳市', '457000', '0');
INSERT INTO `tp_city` VALUES ('161', '16', '许昌市', '461000', '0');
INSERT INTO `tp_city` VALUES ('162', '16', '漯河市', '462000', '0');
INSERT INTO `tp_city` VALUES ('163', '16', '三门峡市', '472000', '0');
INSERT INTO `tp_city` VALUES ('164', '16', '南阳市', '473000', '0');
INSERT INTO `tp_city` VALUES ('165', '16', '商丘市', '476000', '0');
INSERT INTO `tp_city` VALUES ('166', '16', '信阳市', '464000', '0');
INSERT INTO `tp_city` VALUES ('167', '16', '周口市', '466000', '0');
INSERT INTO `tp_city` VALUES ('168', '16', '驻马店市', '463000', '0');
INSERT INTO `tp_city` VALUES ('169', '17', '武汉市', '430000', '0');
INSERT INTO `tp_city` VALUES ('170', '17', '黄石市', '435000', '0');
INSERT INTO `tp_city` VALUES ('171', '17', '十堰市', '442000', '0');
INSERT INTO `tp_city` VALUES ('172', '17', '宜昌市', '443000', '0');
INSERT INTO `tp_city` VALUES ('173', '17', '襄樊市', '441000', '0');
INSERT INTO `tp_city` VALUES ('174', '17', '鄂州市', '436000', '0');
INSERT INTO `tp_city` VALUES ('175', '17', '荆门市', '448000', '0');
INSERT INTO `tp_city` VALUES ('176', '17', '孝感市', '432100', '0');
INSERT INTO `tp_city` VALUES ('177', '17', '荆州市', '434000', '0');
INSERT INTO `tp_city` VALUES ('178', '17', '黄冈市', '438000', '0');
INSERT INTO `tp_city` VALUES ('179', '17', '咸宁市', '437000', '0');
INSERT INTO `tp_city` VALUES ('180', '17', '随州市', '441300', '0');
INSERT INTO `tp_city` VALUES ('181', '17', '恩施土家族苗族自治州', '445000', '0');
INSERT INTO `tp_city` VALUES ('182', '17', '神农架', '442400', '0');
INSERT INTO `tp_city` VALUES ('183', '18', '长沙市', '410000', '0');
INSERT INTO `tp_city` VALUES ('184', '18', '株洲市', '412000', '0');
INSERT INTO `tp_city` VALUES ('185', '18', '湘潭市', '411100', '0');
INSERT INTO `tp_city` VALUES ('186', '18', '衡阳市', '421000', '0');
INSERT INTO `tp_city` VALUES ('187', '18', '邵阳市', '422000', '0');
INSERT INTO `tp_city` VALUES ('188', '18', '岳阳市', '414000', '0');
INSERT INTO `tp_city` VALUES ('189', '18', '常德市', '415000', '0');
INSERT INTO `tp_city` VALUES ('190', '18', '张家界市', '427000', '0');
INSERT INTO `tp_city` VALUES ('191', '18', '益阳市', '413000', '0');
INSERT INTO `tp_city` VALUES ('192', '18', '郴州市', '423000', '0');
INSERT INTO `tp_city` VALUES ('193', '18', '永州市', '425000', '0');
INSERT INTO `tp_city` VALUES ('194', '18', '怀化市', '418000', '0');
INSERT INTO `tp_city` VALUES ('195', '18', '娄底市', '417000', '0');
INSERT INTO `tp_city` VALUES ('196', '18', '湘西土家族苗族自治州', '416000', '0');
INSERT INTO `tp_city` VALUES ('197', '19', '广州市', '510000', '0');
INSERT INTO `tp_city` VALUES ('198', '19', '韶关市', '521000', '0');
INSERT INTO `tp_city` VALUES ('199', '19', '深圳市', '518000', '0');
INSERT INTO `tp_city` VALUES ('200', '19', '珠海市', '519000', '0');
INSERT INTO `tp_city` VALUES ('201', '19', '汕头市', '515000', '0');
INSERT INTO `tp_city` VALUES ('202', '19', '佛山市', '528000', '0');
INSERT INTO `tp_city` VALUES ('203', '19', '江门市', '529000', '0');
INSERT INTO `tp_city` VALUES ('204', '19', '湛江市', '524000', '0');
INSERT INTO `tp_city` VALUES ('205', '19', '茂名市', '525000', '0');
INSERT INTO `tp_city` VALUES ('206', '19', '肇庆市', '526000', '0');
INSERT INTO `tp_city` VALUES ('207', '19', '惠州市', '516000', '0');
INSERT INTO `tp_city` VALUES ('208', '19', '梅州市', '514000', '0');
INSERT INTO `tp_city` VALUES ('209', '19', '汕尾市', '516600', '1');
INSERT INTO `tp_city` VALUES ('210', '19', '河源市', '517000', '0');
INSERT INTO `tp_city` VALUES ('211', '19', '阳江市', '529500', '0');
INSERT INTO `tp_city` VALUES ('212', '19', '清远市', '511500', '0');
INSERT INTO `tp_city` VALUES ('213', '19', '东莞市', '511700', '0');
INSERT INTO `tp_city` VALUES ('214', '19', '中山市', '528400', '0');
INSERT INTO `tp_city` VALUES ('215', '19', '潮州市', '515600', '0');
INSERT INTO `tp_city` VALUES ('216', '19', '揭阳市', '522000', '0');
INSERT INTO `tp_city` VALUES ('217', '19', '云浮市', '527300', '0');
INSERT INTO `tp_city` VALUES ('218', '20', '南宁市', '530000', '0');
INSERT INTO `tp_city` VALUES ('219', '20', '柳州市', '545000', '0');
INSERT INTO `tp_city` VALUES ('220', '20', '桂林市', '541000', '0');
INSERT INTO `tp_city` VALUES ('221', '20', '梧州市', '543000', '0');
INSERT INTO `tp_city` VALUES ('222', '20', '北海市', '536000', '0');
INSERT INTO `tp_city` VALUES ('223', '20', '防城港市', '538000', '0');
INSERT INTO `tp_city` VALUES ('224', '20', '钦州市', '535000', '0');
INSERT INTO `tp_city` VALUES ('225', '20', '贵港市', '537100', '0');
INSERT INTO `tp_city` VALUES ('226', '20', '玉林市', '537000', '0');
INSERT INTO `tp_city` VALUES ('227', '20', '百色市', '533000', '0');
INSERT INTO `tp_city` VALUES ('228', '20', '贺州市', '542800', '0');
INSERT INTO `tp_city` VALUES ('229', '20', '河池市', '547000', '0');
INSERT INTO `tp_city` VALUES ('230', '20', '来宾市', '546100', '0');
INSERT INTO `tp_city` VALUES ('231', '20', '崇左市', '532200', '0');
INSERT INTO `tp_city` VALUES ('232', '21', '海口市', '570000', '0');
INSERT INTO `tp_city` VALUES ('233', '21', '三亚市', '572000', '0');
INSERT INTO `tp_city` VALUES ('234', '22', '重庆市', '400000', '0');
INSERT INTO `tp_city` VALUES ('235', '23', '成都市', '610000', '0');
INSERT INTO `tp_city` VALUES ('236', '23', '自贡市', '643000', '0');
INSERT INTO `tp_city` VALUES ('237', '23', '攀枝花市', '617000', '0');
INSERT INTO `tp_city` VALUES ('238', '23', '泸州市', '646100', '0');
INSERT INTO `tp_city` VALUES ('239', '23', '德阳市', '618000', '0');
INSERT INTO `tp_city` VALUES ('240', '23', '绵阳市', '621000', '0');
INSERT INTO `tp_city` VALUES ('241', '23', '广元市', '628000', '0');
INSERT INTO `tp_city` VALUES ('242', '23', '遂宁市', '629000', '0');
INSERT INTO `tp_city` VALUES ('243', '23', '内江市', '641000', '0');
INSERT INTO `tp_city` VALUES ('244', '23', '乐山市', '614000', '0');
INSERT INTO `tp_city` VALUES ('245', '23', '南充市', '637000', '0');
INSERT INTO `tp_city` VALUES ('246', '23', '眉山市', '612100', '0');
INSERT INTO `tp_city` VALUES ('247', '23', '宜宾市', '644000', '0');
INSERT INTO `tp_city` VALUES ('248', '23', '广安市', '638000', '0');
INSERT INTO `tp_city` VALUES ('249', '23', '达州市', '635000', '0');
INSERT INTO `tp_city` VALUES ('250', '23', '雅安市', '625000', '0');
INSERT INTO `tp_city` VALUES ('251', '23', '巴中市', '635500', '0');
INSERT INTO `tp_city` VALUES ('252', '23', '资阳市', '641300', '0');
INSERT INTO `tp_city` VALUES ('253', '23', '阿坝藏族羌族自治州', '624600', '0');
INSERT INTO `tp_city` VALUES ('254', '23', '甘孜藏族自治州', '626000', '0');
INSERT INTO `tp_city` VALUES ('255', '23', '凉山彝族自治州', '615000', '0');
INSERT INTO `tp_city` VALUES ('256', '24', '贵阳市', '55000', '0');
INSERT INTO `tp_city` VALUES ('257', '24', '六盘水市', '553000', '0');
INSERT INTO `tp_city` VALUES ('258', '24', '遵义市', '563000', '0');
INSERT INTO `tp_city` VALUES ('259', '24', '安顺市', '561000', '0');
INSERT INTO `tp_city` VALUES ('260', '24', '铜仁地区', '554300', '0');
INSERT INTO `tp_city` VALUES ('261', '24', '黔西南布依族苗族自治州', '551500', '0');
INSERT INTO `tp_city` VALUES ('262', '24', '毕节地区', '551700', '0');
INSERT INTO `tp_city` VALUES ('263', '24', '黔东南苗族侗族自治州', '551500', '0');
INSERT INTO `tp_city` VALUES ('264', '24', '黔南布依族苗族自治州', '550100', '0');
INSERT INTO `tp_city` VALUES ('265', '25', '昆明市', '650000', '0');
INSERT INTO `tp_city` VALUES ('266', '25', '曲靖市', '655000', '0');
INSERT INTO `tp_city` VALUES ('267', '25', '玉溪市', '653100', '0');
INSERT INTO `tp_city` VALUES ('268', '25', '保山市', '678000', '0');
INSERT INTO `tp_city` VALUES ('269', '25', '昭通市', '657000', '0');
INSERT INTO `tp_city` VALUES ('270', '25', '丽江市', '674100', '0');
INSERT INTO `tp_city` VALUES ('271', '25', '思茅市', '665000', '0');
INSERT INTO `tp_city` VALUES ('272', '25', '临沧市', '677000', '0');
INSERT INTO `tp_city` VALUES ('273', '25', '楚雄彝族自治州', '675000', '0');
INSERT INTO `tp_city` VALUES ('274', '25', '红河哈尼族彝族自治州', '654400', '0');
INSERT INTO `tp_city` VALUES ('275', '25', '文山壮族苗族自治州', '663000', '0');
INSERT INTO `tp_city` VALUES ('276', '25', '西双版纳傣族自治州', '666200', '0');
INSERT INTO `tp_city` VALUES ('277', '25', '大理白族自治州', '671000', '0');
INSERT INTO `tp_city` VALUES ('278', '25', '德宏傣族景颇族自治州', '678400', '0');
INSERT INTO `tp_city` VALUES ('279', '25', '怒江傈僳族自治州', '671400', '0');
INSERT INTO `tp_city` VALUES ('280', '25', '迪庆藏族自治州', '674400', '0');
INSERT INTO `tp_city` VALUES ('281', '26', '拉萨市', '850000', '0');
INSERT INTO `tp_city` VALUES ('282', '26', '昌都地区', '854000', '0');
INSERT INTO `tp_city` VALUES ('283', '26', '山南地区', '856000', '0');
INSERT INTO `tp_city` VALUES ('284', '26', '日喀则地区', '857000', '0');
INSERT INTO `tp_city` VALUES ('285', '26', '那曲地区', '852000', '0');
INSERT INTO `tp_city` VALUES ('286', '26', '阿里地区', '859100', '0');
INSERT INTO `tp_city` VALUES ('287', '26', '林芝地区', '860100', '0');
INSERT INTO `tp_city` VALUES ('288', '27', '西安市', '710000', '0');
INSERT INTO `tp_city` VALUES ('289', '27', '铜川市', '727000', '0');
INSERT INTO `tp_city` VALUES ('290', '27', '宝鸡市', '721000', '0');
INSERT INTO `tp_city` VALUES ('291', '27', '咸阳市', '712000', '0');
INSERT INTO `tp_city` VALUES ('292', '27', '渭南市', '714000', '0');
INSERT INTO `tp_city` VALUES ('293', '27', '延安市', '716000', '0');
INSERT INTO `tp_city` VALUES ('294', '27', '汉中市', '723000', '0');
INSERT INTO `tp_city` VALUES ('295', '27', '榆林市', '719000', '0');
INSERT INTO `tp_city` VALUES ('296', '27', '安康市', '725000', '0');
INSERT INTO `tp_city` VALUES ('297', '27', '商洛市', '711500', '0');
INSERT INTO `tp_city` VALUES ('298', '28', '兰州市', '730000', '0');
INSERT INTO `tp_city` VALUES ('299', '28', '嘉峪关市', '735100', '0');
INSERT INTO `tp_city` VALUES ('300', '28', '金昌市', '737100', '0');
INSERT INTO `tp_city` VALUES ('301', '28', '白银市', '730900', '0');
INSERT INTO `tp_city` VALUES ('302', '28', '天水市', '741000', '0');
INSERT INTO `tp_city` VALUES ('303', '28', '武威市', '733000', '0');
INSERT INTO `tp_city` VALUES ('304', '28', '张掖市', '734000', '0');
INSERT INTO `tp_city` VALUES ('305', '28', '平凉市', '744000', '0');
INSERT INTO `tp_city` VALUES ('306', '28', '酒泉市', '735000', '0');
INSERT INTO `tp_city` VALUES ('307', '28', '庆阳市', '744500', '0');
INSERT INTO `tp_city` VALUES ('308', '28', '定西市', '743000', '0');
INSERT INTO `tp_city` VALUES ('309', '28', '陇南市', '742100', '0');
INSERT INTO `tp_city` VALUES ('310', '28', '临夏回族自治州', '731100', '0');
INSERT INTO `tp_city` VALUES ('311', '28', '甘南藏族自治州', '747000', '0');
INSERT INTO `tp_city` VALUES ('312', '29', '西宁市', '810000', '0');
INSERT INTO `tp_city` VALUES ('313', '29', '海东地区', '810600', '0');
INSERT INTO `tp_city` VALUES ('314', '29', '海北藏族自治州', '810300', '0');
INSERT INTO `tp_city` VALUES ('315', '29', '黄南藏族自治州', '811300', '0');
INSERT INTO `tp_city` VALUES ('316', '29', '海南藏族自治州', '813000', '0');
INSERT INTO `tp_city` VALUES ('317', '29', '果洛藏族自治州', '814000', '0');
INSERT INTO `tp_city` VALUES ('318', '29', '玉树藏族自治州', '815000', '0');
INSERT INTO `tp_city` VALUES ('319', '29', '海西蒙古族藏族自治州', '817000', '0');
INSERT INTO `tp_city` VALUES ('320', '30', '银川市', '750000', '0');
INSERT INTO `tp_city` VALUES ('321', '30', '石嘴山市', '753000', '0');
INSERT INTO `tp_city` VALUES ('322', '30', '吴忠市', '751100', '0');
INSERT INTO `tp_city` VALUES ('323', '30', '固原市', '756000', '0');
INSERT INTO `tp_city` VALUES ('324', '30', '中卫市', '751700', '0');
INSERT INTO `tp_city` VALUES ('325', '31', '乌鲁木齐市', '830000', '0');
INSERT INTO `tp_city` VALUES ('326', '31', '克拉玛依市', '834000', '0');
INSERT INTO `tp_city` VALUES ('327', '31', '吐鲁番地区', '838000', '0');
INSERT INTO `tp_city` VALUES ('328', '31', '哈密地区', '839000', '0');
INSERT INTO `tp_city` VALUES ('329', '31', '昌吉回族自治州', '831100', '0');
INSERT INTO `tp_city` VALUES ('330', '31', '博尔塔拉蒙古自治州', '833400', '0');
INSERT INTO `tp_city` VALUES ('331', '31', '巴音郭楞蒙古自治州', '841000', '0');
INSERT INTO `tp_city` VALUES ('332', '31', '阿克苏地区', '843000', '0');
INSERT INTO `tp_city` VALUES ('333', '31', '克孜勒苏柯尔克孜自治州', '835600', '0');
INSERT INTO `tp_city` VALUES ('334', '31', '喀什地区', '844000', '0');
INSERT INTO `tp_city` VALUES ('335', '31', '和田地区', '848000', '0');
INSERT INTO `tp_city` VALUES ('336', '31', '伊犁哈萨克自治州', '833200', '0');
INSERT INTO `tp_city` VALUES ('337', '31', '塔城地区', '834700', '0');
INSERT INTO `tp_city` VALUES ('338', '31', '阿勒泰地区', '836500', '0');
INSERT INTO `tp_city` VALUES ('339', '31', '石河子市', '832000', '0');
INSERT INTO `tp_city` VALUES ('340', '31', '阿拉尔市', '843300', '0');
INSERT INTO `tp_city` VALUES ('341', '31', '图木舒克市', '843900', '0');
INSERT INTO `tp_city` VALUES ('342', '31', '五家渠市', '831300', '0');
INSERT INTO `tp_city` VALUES ('343', '32', '香港特别行政区', '000000', '0');
INSERT INTO `tp_city` VALUES ('344', '33', '澳门特别行政区', '000000', '0');
INSERT INTO `tp_city` VALUES ('345', '34', '台北', '000000', '0');
INSERT INTO `tp_city` VALUES ('356', '34', '高雄', '000021', '1');
INSERT INTO `tp_city` VALUES ('358', '0', 'qq2', '', '0');
INSERT INTO `tp_city` VALUES ('359', '357', '22', '22', '0');
INSERT INTO `tp_city` VALUES ('360', '0', 'gqgqg', '', '0');
INSERT INTO `tp_city` VALUES ('361', '0', 'qwr', '', '0');

-- ----------------------------
-- Table structure for tp_cms_article
-- ----------------------------
DROP TABLE IF EXISTS `tp_cms_article`;
CREATE TABLE `tp_cms_article` (
  `article_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章编号',
  `title` varchar(50) NOT NULL COMMENT '文章标题',
  `class_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章分类编号',
  `short_title` varchar(50) NOT NULL DEFAULT '' COMMENT '文章短标题',
  `source` varchar(50) NOT NULL DEFAULT '' COMMENT '文章来源',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '文章来源链接',
  `author` varchar(50) NOT NULL COMMENT '文章作者',
  `summary` varchar(140) NOT NULL DEFAULT '' COMMENT '文章摘要',
  `content` text NOT NULL COMMENT '文章正文',
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '文章标题图片',
  `keyword` varchar(255) NOT NULL DEFAULT '' COMMENT '文章关键字',
  `article_id_array` varchar(255) NOT NULL DEFAULT '' COMMENT '相关文章',
  `click` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章点击量',
  `sort` int(11) DEFAULT NULL,
  `commend_flag` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '文章推荐标志0-未推荐，1-已推荐',
  `comment_flag` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '文章是否允许评论1-允许，0-不允许',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '0-草稿、1-待审核、2-已发布、-1-回收站',
  `attachment_path` text NOT NULL COMMENT '文章附件路径',
  `tag` varchar(255) NOT NULL DEFAULT '' COMMENT '文章标签',
  `comment_count` int(10) unsigned NOT NULL COMMENT '文章评论数',
  `last_comment_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最新评论时间',
  `share_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章分享数',
  `publisher_name` varchar(50) NOT NULL COMMENT '发布者用户名 ',
  `uid` int(10) unsigned NOT NULL COMMENT '发布者编号',
  `public_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '发布时间',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '文章发布时间',
  `modify_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '文章修改时间',
  PRIMARY KEY (`article_id`)
) ENGINE=InnoDB AUTO_INCREMENT=180 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=6553 COMMENT='CMS文章表';

-- ----------------------------
-- Records of tp_cms_article
-- ----------------------------
INSERT INTO `tp_cms_article` VALUES ('169', '六星开源商城招商活动进行中', '22', '招商', '', '', '路飞', '', '六星开源', '', '招商', '', '10', '1', '0', '0', '2', '', '招商', '0', '0000-00-00 00:00:00', '0', '2', '2', '2017-02-20 14:43:41', '2017-02-20 14:43:41', '2017-02-20 14:50:48');
INSERT INTO `tp_cms_article` VALUES ('170', '关于假冒客服诈骗的声明', '13', '假冒客服诈骗', '', '', '路飞', '假冒客服诈骗', '六星开源', '', '诈骗', '', '20', '2', '0', '1', '2', '', '诈骗', '0', '0000-00-00 00:00:00', '0', '2', '2', '2017-02-20 14:54:07', '2017-02-20 14:54:07', '0000-00-00 00:00:00');
INSERT INTO `tp_cms_article` VALUES ('171', '购物流程', '15', '流程', '', '', '路飞', '购物流程', '六星开源', '', '购物', '', '50', '3', '0', '0', '2', '', '购物', '0', '0000-00-00 00:00:00', '0', '2', '2', '2017-02-20 15:13:01', '2017-02-20 15:13:01', '2017-03-09 18:55:39');
INSERT INTO `tp_cms_article` VALUES ('172', '六星开源商城论坛技术支持', '13', '送货', '', '', '路飞', '送货上门', '六星开源', '', '送货', '', '0', '5', '0', '0', '2', '', '送货', '0', '0000-00-00 00:00:00', '0', '1', '1', '2017-02-20 15:42:56', '2017-02-20 15:42:56', '2017-06-10 16:07:32');
INSERT INTO `tp_cms_article` VALUES ('173', '六星开源商城开发团队简介', '14', '免邮', '', '', '路飞', '满百免邮', '六星开源', '', '邮费', '', '45', '6', '0', '1', '2', '', '免邮', '0', '0000-00-00 00:00:00', '0', '87', '87', '2017-02-20 15:59:25', '2017-02-20 15:59:25', '2017-06-16 18:59:20');
INSERT INTO `tp_cms_article` VALUES ('174', '六星开源商城授权服务', '19', '注册', '', '', '路飞', '会员注册', '六星开源', '', '会员', '', '100', '7', '0', '0', '2', '', '会员', '0', '0000-00-00 00:00:00', '0', '87', '87', '2017-02-20 16:10:34', '2017-02-20 16:10:34', '2017-07-10 16:24:51');
INSERT INTO `tp_cms_article` VALUES ('175', '六星开源商城开发手册', '13', '商城上线啦！', '', '', '', '', '六星开源', '', '', '', '0', '1', '0', '1', '2', '', '', '0', '0000-00-00 00:00:00', '0', '87', '87', '2017-02-20 16:14:35', '2017-02-20 16:14:35', '2017-06-24 18:09:23');
INSERT INTO `tp_cms_article` VALUES ('176', '六星开源商城测试版震撼发布', '13', '招商', '', '', '路飞', '招商入驻', '六星开源', '', '招商', '', '200', '4', '0', '1', '2', '', '招商', '0', '0000-00-00 00:00:00', '12', '1', '1', '2017-02-20 16:15:19', '2017-02-20 16:15:19', '2017-06-07 11:33:35');
INSERT INTO `tp_cms_article` VALUES ('177', '六星开源官网', '13', '', '', '', '', '', '\n	反对上述答复 \n\n\n	\n		\n			\n				\n					\n				\n				\n					\n				\n			\n			\n				\n					\n				\n				\n					\n				\n			\n			\n				\n					\n				\n				\n					\n				\n			\n		\n	\n', 'upload/common/1499740466.png', '232132', '', '0', '0', '0', '0', '2', '', '', '0', '0000-00-00 00:00:00', '0', '1', '1', '2017-02-20 17:54:46', '2017-02-20 17:54:46', '2017-07-11 14:36:53');
INSERT INTO `tp_cms_article` VALUES ('178', '用户注册协议', '24', '', '', '', '', '六星开源商城用户注册协议', '牛酷商城用户注册协议本协议是您与牛酷商城网站（简称\"本站\"）所有者（以下简称为\"牛酷商城\"）之间就牛酷商城网站服务等相关事宜所订立的契约，请您仔细阅读本注册协议，您点击\"同意并继续\"按钮后，本协议即构成对双方有约束力的法律文件。第1条 本站服务条款的确认和接纳1.1本站的各项电子服务的所有权和运作权归牛酷商城所有。用户同意所有注册协议条款并完成注册程序，才能成为本站的正式用户。用户确认：本协议条款是处理双方权利义务的契约，始终有效，法律另有强制性规定或双方另有特别约定的，依其规定。1.2用户点击同意本协议的，即视为用户确认自己具有享受本站服务、下单购物等相应的权利能力和行为能力，能够独立承担法律责任。1.3如果您在18周岁以下，您只能在父母或监护人的监护参与下才能使用本站。第2条 本站服务2.1牛酷商城通过互联网依法为用户提供互联网信息等服务，用户在完全同意本协议及本站规定的情况下，方有权使用本站的相关服务。2.2用户必须自行准备如下设备和承担如下开支：（1）上网设备，包括并不限于电脑或者其他上网终端、调制解调器及其他必备的上网装置；（2）上网开支，包括并不限于网络接入费、上网设备租用费、手机流量费等。第3条 用户信息3.1用户应自行诚信向本站提供注册资料，用户同意其提供的注册资料真实、准确、完整、合法有效，用户注册资料如有变动的，应及时更新其注册资料。如果用户提供的注册资料不合法、不真实、不准确、不详尽的，用户需承担因此引起的相应责任及后果，并且牛酷商城保留终止用户使用牛酷商城各项服务的权利。3.2用户在本站进行浏览、下单购物等活动时，涉及用户真实姓名/名称、通信地址、联系电话、电子邮箱等隐私信息的，本站将予以严格保密，除非得到用户的授权或法律另有规定，本站不会向外界披露用户隐私信息。第4条 用户依法言行义务本协议依据国家相关法律法规规章制定，用户同意严格遵守以下义务：（1）不得传输或发表：煽动抗拒、破坏宪法和法律、行政法规实施的言论，煽动颠覆国家政权，推翻社会主义制度的言论，煽动分裂国家、破坏国家统一的的言论，煽动民族仇恨、民族歧视、破坏民族团结的言论；（2）从中国大陆向境外传输资料信息时必须符合中国有关法规；第5条 其他5.1牛酷商城网站所有者是指在政府部门依法许可或备案的牛酷商城网站经营主体。5.2您点击本协议下方的\"同意并继续\"按钮即视为您完全接受本协议，在点击之前请您再次确认已知悉并完全理解本协议的全部内容。', '', '', '', '0', '4', '0', '0', '2', '文章附件', '用户注册协议', '0', '0000-00-00 00:00:00', '0', '87', '87', '2017-03-03 10:48:33', '2017-03-03 10:48:33', '2017-06-19 19:32:10');
INSERT INTO `tp_cms_article` VALUES ('179', '六星开源', '8', '', '', '', '', '', '', '', '', '', '0', '1', '0', '0', '2', '', '', '0', '0000-00-00 00:00:00', '0', '87', '87', '2017-06-19 19:48:03', '2017-06-19 19:48:03', '2017-06-19 20:50:13');

-- ----------------------------
-- Table structure for tp_cms_article_class
-- ----------------------------
DROP TABLE IF EXISTS `tp_cms_article_class`;
CREATE TABLE `tp_cms_article_class` (
  `class_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类编号 ',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '上级分类',
  `name` varchar(50) NOT NULL COMMENT '分类名称',
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1170 COMMENT='cms文章分类表';

-- ----------------------------
-- Records of tp_cms_article_class
-- ----------------------------
INSERT INTO `tp_cms_article_class` VALUES ('8', '0', '新手上路', '1');
INSERT INTO `tp_cms_article_class` VALUES ('9', '0', '支付方式', '2');
INSERT INTO `tp_cms_article_class` VALUES ('10', '0', '配送服务', '3');
INSERT INTO `tp_cms_article_class` VALUES ('11', '0', '售后服务', '4');
INSERT INTO `tp_cms_article_class` VALUES ('12', '0', '商家合作', '5');
INSERT INTO `tp_cms_article_class` VALUES ('13', '8', '常见问题', '1');
INSERT INTO `tp_cms_article_class` VALUES ('14', '8', '订单查询', '2');
INSERT INTO `tp_cms_article_class` VALUES ('15', '8', '购物流程', '3');
INSERT INTO `tp_cms_article_class` VALUES ('16', '9', '网上支付', '0');
INSERT INTO `tp_cms_article_class` VALUES ('17', '9', '货到付款', '9');
INSERT INTO `tp_cms_article_class` VALUES ('18', '10', '验货签收', '1');
INSERT INTO `tp_cms_article_class` VALUES ('19', '10', '订单进度查询', '9');
INSERT INTO `tp_cms_article_class` VALUES ('20', '11', '验货签收', '19');
INSERT INTO `tp_cms_article_class` VALUES ('21', '11', '订单进度查询', '2');
INSERT INTO `tp_cms_article_class` VALUES ('22', '12', '商家入驻', '1');
INSERT INTO `tp_cms_article_class` VALUES ('23', '0', '用户协议', '6');
INSERT INTO `tp_cms_article_class` VALUES ('24', '23', '用户注册协议', '2');
INSERT INTO `tp_cms_article_class` VALUES ('25', '10', '111', '0');

-- ----------------------------
-- Table structure for tp_cms_comment
-- ----------------------------
DROP TABLE IF EXISTS `tp_cms_comment`;
CREATE TABLE `tp_cms_comment` (
  `comment_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论编号',
  `text` varchar(2000) NOT NULL COMMENT '评论内容',
  `uid` int(10) unsigned NOT NULL COMMENT '评论人编号',
  `quote_comment_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '评论引用',
  `up` int(10) unsigned NOT NULL COMMENT '点赞数量',
  `comment_time` int(10) unsigned NOT NULL COMMENT '评论时间',
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192 COMMENT='CMS评论表';

-- ----------------------------
-- Records of tp_cms_comment
-- ----------------------------

-- ----------------------------
-- Table structure for tp_cms_topic
-- ----------------------------
DROP TABLE IF EXISTS `tp_cms_topic`;
CREATE TABLE `tp_cms_topic` (
  `topic_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '专题编号',
  `instance_id` int(10) NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `title` varchar(255) NOT NULL COMMENT '专题标题',
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '专题封面',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '专题状态  0草稿  1发布',
  `content` text NOT NULL COMMENT '专题内容',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `modify_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`topic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192 COMMENT='专题';

-- ----------------------------
-- Records of tp_cms_topic
-- ----------------------------
INSERT INTO `tp_cms_topic` VALUES ('1', '0', '演示专题', 'upload/common/1499502037.png', '1', '<p><img src=\"/niushop_b2c_demo/upload/ueditor/php/upload/image/20170711/1499736429547966.png\" title=\"1499736429547966.png\" alt=\"4.png\"/>演示专题</p>', '2017-06-23 09:18:55', '2017-07-11 09:27:12');

-- ----------------------------
-- Table structure for tp_complain
-- ----------------------------
DROP TABLE IF EXISTS `tp_complain`;
CREATE TABLE `tp_complain` (
  `complain_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '投诉id',
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `order_goods_id` int(10) unsigned DEFAULT '0' COMMENT '订单商品ID',
  `accuser_id` int(11) NOT NULL COMMENT '原告id',
  `accuser_name` varchar(50) NOT NULL COMMENT '原告名称',
  `accused_id` int(11) NOT NULL COMMENT '被告id',
  `accused_name` varchar(50) NOT NULL COMMENT '被告名称',
  `complain_subject_content` varchar(50) NOT NULL COMMENT '投诉主题',
  `complain_subject_id` int(11) NOT NULL COMMENT '投诉主题id',
  `complain_content` varchar(255) NOT NULL COMMENT '投诉内容',
  `complain_pic1` varchar(100) NOT NULL COMMENT '投诉图片1',
  `complain_pic2` varchar(100) NOT NULL COMMENT '投诉图片2',
  `complain_pic3` varchar(100) NOT NULL COMMENT '投诉图片3',
  `complain_datetime` int(11) NOT NULL COMMENT '投诉时间',
  `complain_handle_datetime` int(11) NOT NULL COMMENT '投诉处理时间',
  `complain_handle_member_id` int(11) NOT NULL COMMENT '投诉处理人id',
  `appeal_message` varchar(255) NOT NULL COMMENT '申诉内容',
  `appeal_datetime` int(11) NOT NULL COMMENT '申诉时间',
  `appeal_pic1` varchar(100) NOT NULL COMMENT '申诉图片1',
  `appeal_pic2` varchar(100) NOT NULL COMMENT '申诉图片2',
  `appeal_pic3` varchar(100) NOT NULL COMMENT '申诉图片3',
  `final_handle_message` varchar(255) NOT NULL COMMENT '最终处理意见',
  `final_handle_datetime` int(11) NOT NULL COMMENT '最终处理时间',
  `final_handle_member_id` int(11) NOT NULL COMMENT '最终处理人id',
  `complain_state` tinyint(4) NOT NULL COMMENT '投诉状态(10-新投诉/20-\n\n\n\n投诉通过转给被投诉人/30-被投诉人已申诉/40-提交仲裁/99-已关闭)',
  `complain_active` tinyint(4) NOT NULL DEFAULT '1' COMMENT '投诉是否通\n\n\n\n过平台审批(1未通过/2通过)',
  PRIMARY KEY (`complain_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='投诉表';

-- ----------------------------
-- Records of tp_complain
-- ----------------------------

-- ----------------------------
-- Table structure for tp_complain_subject
-- ----------------------------
DROP TABLE IF EXISTS `tp_complain_subject`;
CREATE TABLE `tp_complain_subject` (
  `complain_subject_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '投诉\n\n\n\n主题id',
  `complain_subject_content` varchar(50) NOT NULL COMMENT '投诉主题',
  `complain_subject_desc` varchar(100) NOT NULL COMMENT '投诉主题描\n\n\n\n述',
  `complain_subject_state` tinyint(4) NOT NULL COMMENT '投诉主题状态\n\n\n\n(1-有效/2-失效)',
  PRIMARY KEY (`complain_subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=5461 COMMENT='投诉主题表';

-- ----------------------------
-- Records of tp_complain_subject
-- ----------------------------

-- ----------------------------
-- Table structure for tp_complain_talk
-- ----------------------------
DROP TABLE IF EXISTS `tp_complain_talk`;
CREATE TABLE `tp_complain_talk` (
  `talk_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '投诉对话id',
  `complain_id` int(11) NOT NULL COMMENT '投诉id',
  `talk_member_id` int(11) NOT NULL COMMENT '发言人id',
  `talk_member_name` varchar(50) NOT NULL COMMENT '发言人名称',
  `talk_member_type` varchar(10) NOT NULL COMMENT '发言人类型(1-投诉人\n\n\n\n/2-被投诉人/3-平台)',
  `talk_content` varchar(255) NOT NULL COMMENT '发言内容',
  `talk_state` tinyint(4) NOT NULL COMMENT '发言状态(1-显示/2-不显\n\n\n\n示)',
  `talk_admin` int(11) NOT NULL DEFAULT '0' COMMENT '对话管理员，屏蔽对\n\n\n\n话人的id',
  `talk_datetime` int(11) NOT NULL COMMENT '对话发表时间',
  PRIMARY KEY (`talk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='投诉对话表';

-- ----------------------------
-- Records of tp_complain_talk
-- ----------------------------

-- ----------------------------
-- Table structure for tp_config
-- ----------------------------
DROP TABLE IF EXISTS `tp_config`;
CREATE TABLE `tp_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `instance_id` int(11) NOT NULL DEFAULT '1' COMMENT '实例ID',
  `key` varchar(255) NOT NULL DEFAULT '' COMMENT '配置项WCHAT,QQ,WPAY,ALIPAY...',
  `value` varchar(1000) NOT NULL DEFAULT '' COMMENT '配置值json',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `modify_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `desc` varchar(1000) NOT NULL DEFAULT '' COMMENT '描述',
  `is_use` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否启用 1启用 0不启用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1571 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=963 COMMENT='第三方配置表';

-- ----------------------------
-- Records of tp_config
-- ----------------------------
INSERT INTO `tp_config` VALUES ('12', '0', 'USERNOTICE', '\"\\u611f\\u8c22\\u8bbf\\u95eeniushop\\u5546\\u57ce\"', '2017-02-23 14:08:01', '2017-07-14 10:19:20', '', '1');
INSERT INTO `tp_config` VALUES ('13', '0', 'HOTKEY', '[\"\\u8863\\u670d\\uff0c\\u978b\\u5b50\"]', '2017-02-23 14:35:49', '2017-07-17 18:07:04', '', '1');
INSERT INTO `tp_config` VALUES ('14', '0', 'DEFAULTKEY', '\"1231231231\"', '2017-02-23 14:36:28', '2017-07-11 11:35:43', '', '1');
INSERT INTO `tp_config` VALUES ('17', '0', 'QQLOGIN', '{\"APP_KEY\":\"jggg\",\"APP_SECRET\":\"uu\",\"AUTHORIZE\":\"http:\\/\\/localhost\",\"CALLBACK\":\"http:\\/\\/localhost\\/niushop_b2b2c\\/wap\\/login\\/callback\"}', '2017-03-01 14:48:45', '2017-07-04 18:03:44', 'qq', '1');
INSERT INTO `tp_config` VALUES ('18', '0', 'WCHAT', '{\"APP_KEY\":\"6\",\"APP_SECRET\":\"11116677\",\"AUTHORIZE\":\"http:\\/\\/localhost\",\"CALLBACK\":\"http:\\/\\/localhost\\/niushop_b2b2c\\/wap\\/Login\\/callback\"}', '2017-03-01 14:49:07', '2017-07-10 19:18:16', '微信', '1');
INSERT INTO `tp_config` VALUES ('21', '0', 'ALIPAY', '{\"ali_partnerid\":\"23123sdfsdfsdfsdfsdf\",\"ali_seller\":\"2222222255\",\"ali_key\":\"2222266\"}', '2017-03-02 16:18:17', '2017-07-15 11:47:44', '', '1');
INSERT INTO `tp_config` VALUES ('22', '0', 'EMAILMESSAGE', '{\"email_host\":\"smtp.163.com\",\"email_port\":\"587\",\"email_addr\":\"liguang2567@163.com\",\"email_id\":\"admin\",\"email_pass\":\"123456\"}', '2017-03-03 15:00:50', '2017-07-11 15:19:17', '', '0');
INSERT INTO `tp_config` VALUES ('27', '0', 'WXOPENPLATFORM', '', '2017-03-30 11:52:59', '2017-06-08 14:34:32', '', '1');
INSERT INTO `tp_config` VALUES ('28', '0', 'LOGINVERIFYCODE', '{\"platform\":\"0\",\"admin\":\"0\",\"pc\":\"0\"}', '2017-04-01 10:48:19', '2017-07-11 14:13:39', '', '1');
INSERT INTO `tp_config` VALUES ('31', '0', 'COIN_CONFIG', '', '2017-04-17 10:36:33', '2017-06-08 14:34:32', '购物币现金转化关系', '1');
INSERT INTO `tp_config` VALUES ('38', '0', 'ORDER_BUY_CLOSE_TIME', '600', '0000-00-00 00:00:00', '2017-07-14 11:39:21', '订单自动关闭时间', '1');
INSERT INTO `tp_config` VALUES ('39', '0', 'ORDER_DELIVERY_COMPLETE_TIME', '3', '0000-00-00 00:00:00', '2017-07-14 11:39:20', '收货后多长时间自动完成', '1');
INSERT INTO `tp_config` VALUES ('40', '0', 'ORDER_AUTO_DELIVERY', '100', '0000-00-00 00:00:00', '2017-07-14 11:39:20', '订单多长时间自动完成', '1');
INSERT INTO `tp_config` VALUES ('41', '0', 'ORDER_BALANCE_PAY', '1', '0000-00-00 00:00:00', '2017-07-14 11:39:20', '是否开启余额支付', '1');
INSERT INTO `tp_config` VALUES ('42', '0', 'ORDER_INVOICE_TAX', '10', '0000-00-00 00:00:00', '2017-07-14 11:39:20', '发票税率', '1');
INSERT INTO `tp_config` VALUES ('43', '0', 'ORDER_INVOICE_CONTENT', '办公,建材', '0000-00-00 00:00:00', '2017-07-14 11:39:21', '发票内容', '1');
INSERT INTO `tp_config` VALUES ('44', '0', 'ORDER_SHOW_BUY_RECORD', '0', '0000-00-00 00:00:00', '2017-07-14 11:39:20', '是否显示购买记录', '1');
INSERT INTO `tp_config` VALUES ('45', '0', 'SEO_TITLE', '六星开源商城', '2017-06-06 20:13:14', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('46', '0', 'SEO_META', '六星开源商城', '2017-06-06 20:13:14', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('47', '0', 'SEO_DESC', '六星开源商城', '2017-06-06 20:13:14', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('48', '0', 'SEO_OTHER', '六星开源商城', '2017-06-06 20:13:14', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('107', '0', 'ORDER_DELIVERY_PAY', '1', '2017-06-07 16:51:06', '2017-07-14 11:39:21', '是否开启货到付款', '1');
INSERT INTO `tp_config` VALUES ('108', '0', 'WITHDRAW_BALANCE', '{\"withdraw_cash_min\":\"0.01\",\"withdraw_multiple\":\"1\",\"withdraw_poundage\":0,\"withdraw_message\":\"\\u53ef\\u63d0\\u73b0\\u91d1\\u989d\\u4e3a\\u4ea4\\u6613\\u6210\\u529f\\u540e7\\u5929\\u4e14\\u672a\\u63d0\\u73b0\\u7684\\u91d1\\u989d!\"}', '2017-06-07 18:18:36', '2017-07-13 09:47:11', '会员余额提现设置', '1');
INSERT INTO `tp_config` VALUES ('109', '0', 'REGISTER_INTEGRAL', '1', '2017-06-09 12:17:57', '2017-07-04 19:24:56', '注册送积分', '1');
INSERT INTO `tp_config` VALUES ('111', '0', 'SHARE_INTEGRAL', '0', '2017-06-09 12:17:57', '2017-07-04 19:24:56', '分享送积分', '1');
INSERT INTO `tp_config` VALUES ('112', '0', 'SIGN_INTEGRAL', '0', '2017-06-09 12:42:50', '2017-07-04 19:24:56', '签到送积分', '1');
INSERT INTO `tp_config` VALUES ('113', '0', 'MOBILEMESSAGE', '{\"appKey\":\"LTAIlauazm5VpsfJ\",\"secretKey\":\"r2r4NCU2gmWsis3AcDI5h3NjddMGHT\",\"freeSignName\":\"\\u963f\\u91cc\\u4e91\\u77ed\\u4fe1\\u6d4b\\u8bd5\\u4e13\\u7528\",\"user_type\":\"0\"}', '2017-06-10 15:35:08', '2017-07-11 09:17:32', '', '1');
INSERT INTO `tp_config` VALUES ('116', '0', 'LOGINVERIFYCODE', '{\"platform\":\"0\",\"admin\":\"0\",\"pc\":\"0\"}', '2017-06-10 17:02:51', '2017-07-11 14:13:39', '', '1');
INSERT INTO `tp_config` VALUES ('122', '0', 'HOTKEY', '[\"\\u8863\\u670d\\uff0c\\u978b\\u5b50\"]', '2017-06-10 17:39:26', '2017-07-17 18:07:04', '', '1');
INSERT INTO `tp_config` VALUES ('123', '0', 'DEFAULTKEY', '\"1231231231\"', '2017-06-10 17:39:42', '2017-07-11 11:35:43', '', '1');
INSERT INTO `tp_config` VALUES ('125', '0', 'WPAY', '{\"appid\":\"324234234234\",\"appkey\":\"11111111111\",\"mch_id\":\"111111\",\"mch_key\":\"11111111111\"}', '2017-06-10 17:32:03', '2017-07-11 11:36:35', '', '1');
INSERT INTO `tp_config` VALUES ('127', '0', 'SHOPWCHAT', '{\"appid\":\"\",\"appsecret\":\"\"}', '2017-06-10 17:48:10', '2017-07-21 17:41:50', '', '1');
INSERT INTO `tp_config` VALUES ('129', '0', 'BUYER_SELF_LIFTING', '0', '2017-06-20 18:29:56', '2017-07-14 11:39:21', '是否开启买家自提', '1');
INSERT INTO `tp_config` VALUES ('132', '0', 'ORDER_EXPRESS_MESSAGE', '{\"appid\":\"1292843\",\"appkey\":\"9a2a7c02-1e14-42f2-b3d0-fb131eb47692\",\"back_url\":\"http:\\/\\/\\u57df\\u540d\\/\"}', '2017-06-21 16:36:30', '2017-06-21 18:40:12', '物流跟踪配置信息', '1');
INSERT INTO `tp_config` VALUES ('134', '0', 'ORDER_SELLER_DISPATCHING', '1', '2017-06-27 11:50:56', '2017-07-14 11:39:21', '是否开启商家配送', '1');
INSERT INTO `tp_config` VALUES ('135', '0', 'SHOPPING_BACK_POINTS', '2', '2017-06-28 10:33:33', '2017-07-14 11:39:21', '购物返积分设置', '1');
INSERT INTO `tp_config` VALUES ('137', '0', 'REGISTERANDVISIT', '{\"is_register\":\"1\",\"register_info\":\"plain,email\",\"name_keyword\":\"q,e,k\",\"pwd_len\":\"6\",\"pwd_complexity\":\"number\",\"terms_of_service\":\"\"}', '2017-07-01 15:21:12', '2017-07-12 14:52:11', '', '1');
INSERT INTO `tp_config` VALUES ('138', '1', 'SEO_TITLE', '', '2017-07-11 19:37:41', '0000-00-00 00:00:00', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('139', '1', 'SEO_META', '', '2017-07-11 19:37:41', '0000-00-00 00:00:00', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('140', '1', 'SEO_DESC', '', '2017-07-11 19:37:41', '0000-00-00 00:00:00', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('141', '1', 'SEO_OTHER', '', '2017-07-11 19:37:41', '0000-00-00 00:00:00', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('142', '0', 'SEO_TITLE', '六星开源商城', '2017-07-12 14:44:47', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('143', '0', 'SEO_META', '六星开源商城', '2017-07-12 14:44:47', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('144', '0', 'SEO_DESC', '六星开源商城', '2017-07-12 14:44:47', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('145', '0', 'SEO_OTHER', '六星开源商城', '2017-07-12 14:44:47', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('146', '0', 'SEO_TITLE', '六星开源商城', '2017-07-12 14:44:48', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('147', '0', 'SEO_META', '六星开源商城', '2017-07-12 14:44:48', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('148', '0', 'SEO_DESC', '六星开源商城', '2017-07-12 14:44:48', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('149', '0', 'SEO_OTHER', '六星开源商城', '2017-07-12 14:44:48', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('150', '0', 'SEO_TITLE', '六星开源商城', '2017-07-12 14:44:50', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('151', '0', 'SEO_META', '六星开源商城', '2017-07-12 14:44:50', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('152', '0', 'SEO_DESC', '六星开源商城', '2017-07-12 14:44:50', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('153', '0', 'SEO_OTHER', '六星开源商城', '2017-07-12 14:44:50', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('154', '0', 'SEO_TITLE', '六星开源商城', '2017-07-12 14:44:52', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('155', '0', 'SEO_META', '六星开源商城', '2017-07-12 14:44:52', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('156', '0', 'SEO_DESC', '六星开源商城', '2017-07-12 14:44:52', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('157', '0', 'SEO_OTHER', '六星开源商城', '2017-07-12 14:44:52', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('158', '0', 'SEO_TITLE', '六星开源商城', '2017-07-12 14:44:59', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('159', '0', 'SEO_META', '六星开源商城', '2017-07-12 14:44:59', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('160', '0', 'SEO_DESC', '六星开源商城', '2017-07-12 14:44:59', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('161', '0', 'SEO_OTHER', '六星开源商城', '2017-07-12 14:44:59', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('162', '0', 'SEO_TITLE', '六星开源商城', '2017-07-12 14:44:59', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('163', '0', 'SEO_META', '六星开源商城', '2017-07-12 14:44:59', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('164', '0', 'SEO_DESC', '六星开源商城', '2017-07-12 14:44:59', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('165', '0', 'SEO_OTHER', '六星开源商城', '2017-07-12 14:44:59', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('166', '0', 'SEO_TITLE', '六星开源商城', '2017-07-12 14:45:07', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('167', '0', 'SEO_META', '六星开源商城', '2017-07-12 14:45:07', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('168', '0', 'SEO_DESC', '六星开源商城', '2017-07-12 14:45:07', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('169', '0', 'SEO_OTHER', '六星开源商城', '2017-07-12 14:45:07', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('170', '0', 'SEO_TITLE', '六星开源商城', '2017-07-12 14:45:08', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('171', '0', 'SEO_META', '六星开源商城', '2017-07-12 14:45:08', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('172', '0', 'SEO_DESC', '六星开源商城', '2017-07-12 14:45:08', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('173', '0', 'SEO_OTHER', '六星开源商城', '2017-07-12 14:45:08', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('174', '0', 'SEO_TITLE', '六星开源商城', '2017-07-12 14:46:35', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('175', '0', 'SEO_META', '六星开源商城', '2017-07-12 14:46:35', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('176', '0', 'SEO_DESC', '六星开源商城', '2017-07-12 14:46:35', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('177', '0', 'SEO_OTHER', '六星开源商城', '2017-07-12 14:46:35', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('178', '0', 'SEO_TITLE', '六星开源商城', '2017-07-12 14:46:43', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('179', '0', 'SEO_META', '六星开源商城', '2017-07-12 14:46:43', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('180', '0', 'SEO_DESC', '六星开源商城', '2017-07-12 14:46:43', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('181', '0', 'SEO_OTHER', '六星开源商城', '2017-07-12 14:46:43', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('182', '0', 'SEO_TITLE', '六星开源商城', '2017-07-12 14:46:48', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('183', '0', 'SEO_META', '六星开源商城', '2017-07-12 14:46:48', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('184', '0', 'SEO_DESC', '六星开源商城', '2017-07-12 14:46:48', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('185', '0', 'SEO_OTHER', '六星开源商城', '2017-07-12 14:46:48', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('186', '0', 'SEO_TITLE', '六星开源商城', '2017-07-12 14:46:50', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('187', '0', 'SEO_META', '六星开源商城', '2017-07-12 14:46:51', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('188', '0', 'SEO_DESC', '六星开源商城', '2017-07-12 14:46:51', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('189', '0', 'SEO_OTHER', '六星开源商城', '2017-07-12 14:46:51', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('190', '0', 'SEO_TITLE', '六星开源商城', '2017-07-12 14:46:52', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('191', '0', 'SEO_META', '六星开源商城', '2017-07-12 14:46:52', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('192', '0', 'SEO_DESC', '六星开源商城', '2017-07-12 14:46:52', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('193', '0', 'SEO_OTHER', '六星开源商城', '2017-07-12 14:46:52', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('194', '0', 'SEO_TITLE', '六星开源商城', '2017-07-12 14:46:54', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('195', '0', 'SEO_META', '六星开源商城', '2017-07-12 14:46:54', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('196', '0', 'SEO_DESC', '六星开源商城', '2017-07-12 14:46:54', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('197', '0', 'SEO_OTHER', '六星开源商城', '2017-07-12 14:46:54', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('198', '0', 'SEO_TITLE', '六星开源商城', '2017-07-12 14:46:55', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('199', '0', 'SEO_META', '六星开源商城', '2017-07-12 14:46:55', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('200', '0', 'SEO_DESC', '六星开源商城', '2017-07-12 14:46:55', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('201', '0', 'SEO_OTHER', '六星开源商城', '2017-07-12 14:46:55', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('202', '0', 'SEO_TITLE', '六星开源商城', '2017-07-12 14:46:59', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('203', '0', 'SEO_META', '六星开源商城', '2017-07-12 14:46:59', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('204', '0', 'SEO_DESC', '六星开源商城', '2017-07-12 14:46:59', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('205', '0', 'SEO_OTHER', '六星开源商城', '2017-07-12 14:46:59', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('206', '0', 'SEO_TITLE', '六星开源商城', '2017-07-12 14:47:00', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('207', '0', 'SEO_META', '六星开源商城', '2017-07-12 14:47:00', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('208', '0', 'SEO_DESC', '六星开源商城', '2017-07-12 14:47:00', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('209', '0', 'SEO_OTHER', '六星开源商城', '2017-07-12 14:47:00', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('210', '0', 'SEO_TITLE', '六星开源商城', '2017-07-12 14:47:02', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('211', '0', 'SEO_META', '六星开源商城', '2017-07-12 14:47:02', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('212', '0', 'SEO_DESC', '六星开源商城', '2017-07-12 14:47:02', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('213', '0', 'SEO_OTHER', '六星开源商城', '2017-07-12 14:47:02', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('214', '0', 'SEO_TITLE', '六星开源商城', '2017-07-12 14:47:03', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('215', '0', 'SEO_META', '六星开源商城', '2017-07-12 14:47:03', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('216', '0', 'SEO_DESC', '六星开源商城', '2017-07-12 14:47:03', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('217', '0', 'SEO_OTHER', '六星开源商城', '2017-07-12 14:47:03', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('218', '0', 'SEO_TITLE', '六星开源商城', '2017-07-12 14:47:04', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('219', '0', 'SEO_META', '六星开源商城', '2017-07-12 14:47:04', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('220', '0', 'SEO_DESC', '六星开源商城', '2017-07-12 14:47:04', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('221', '0', 'SEO_OTHER', '六星开源商城', '2017-07-12 14:47:04', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('222', '0', 'SEO_TITLE', '六星开源商城', '2017-07-12 14:47:05', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('223', '0', 'SEO_META', '六星开源商城', '2017-07-12 14:47:05', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('224', '0', 'SEO_DESC', '六星开源商城', '2017-07-12 14:47:05', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('225', '0', 'SEO_OTHER', '六星开源商城', '2017-07-12 14:47:05', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('226', '0', 'SEO_TITLE', '六星开源商城', '2017-07-12 14:47:32', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('227', '0', 'SEO_META', '六星开源商城', '2017-07-12 14:47:32', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('228', '0', 'SEO_DESC', '六星开源商城', '2017-07-12 14:47:32', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('229', '0', 'SEO_OTHER', '六星开源商城', '2017-07-12 14:47:32', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('230', '0', 'SEO_TITLE', '六星开源商城', '2017-07-12 14:47:33', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('231', '0', 'SEO_META', '六星开源商城', '2017-07-12 14:47:33', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('232', '0', 'SEO_DESC', '六星开源商城', '2017-07-12 14:47:33', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('233', '0', 'SEO_OTHER', '六星开源商城', '2017-07-12 14:47:33', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('234', '0', 'SEO_TITLE', '六星开源商城', '2017-07-12 14:47:35', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('235', '0', 'SEO_META', '六星开源商城', '2017-07-12 14:47:35', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('236', '0', 'SEO_DESC', '六星开源商城', '2017-07-12 14:47:36', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('237', '0', 'SEO_OTHER', '六星开源商城', '2017-07-12 14:47:36', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('238', '0', 'SEO_TITLE', '六星开源商城', '2017-07-12 14:47:37', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('239', '0', 'SEO_META', '六星开源商城', '2017-07-12 14:47:37', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('240', '0', 'SEO_DESC', '六星开源商城', '2017-07-12 14:47:37', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('241', '0', 'SEO_OTHER', '六星开源商城', '2017-07-12 14:47:37', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('242', '0', 'SEO_TITLE', '六星开源商城', '2017-07-12 14:50:45', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('243', '0', 'SEO_META', '六星开源商城', '2017-07-12 14:50:45', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('244', '0', 'SEO_DESC', '六星开源商城', '2017-07-12 14:50:45', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('245', '0', 'SEO_OTHER', '六星开源商城', '2017-07-12 14:50:45', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('246', '0', 'SEO_TITLE', '六星开源商城', '2017-07-12 14:50:46', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('247', '0', 'SEO_META', '六星开源商城', '2017-07-12 14:50:46', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('248', '0', 'SEO_DESC', '六星开源商城', '2017-07-12 14:50:46', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('249', '0', 'SEO_OTHER', '六星开源商城', '2017-07-12 14:50:46', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('250', '0', 'SEO_TITLE', '六星开源商城', '2017-07-12 14:50:48', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('251', '0', 'SEO_META', '六星开源商城', '2017-07-12 14:50:48', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('252', '0', 'SEO_DESC', '六星开源商城', '2017-07-12 14:50:48', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('253', '0', 'SEO_OTHER', '六星开源商城', '2017-07-12 14:50:48', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('254', '0', 'SEO_TITLE', '六星开源商城', '2017-07-12 14:50:50', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('255', '0', 'SEO_META', '六星开源商城', '2017-07-12 14:50:50', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('256', '0', 'SEO_DESC', '六星开源商城', '2017-07-12 14:50:50', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('257', '0', 'SEO_OTHER', '六星开源商城', '2017-07-12 14:50:50', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('258', '0', 'SEO_TITLE', '六星开源商城', '2017-07-12 14:50:54', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('259', '0', 'SEO_META', '六星开源商城', '2017-07-12 14:50:54', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('260', '0', 'SEO_DESC', '六星开源商城', '2017-07-12 14:50:54', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('261', '0', 'SEO_OTHER', '六星开源商城', '2017-07-12 14:50:54', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('262', '0', 'SEO_TITLE', '六星开源商城', '2017-07-12 15:46:12', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('263', '0', 'SEO_META', '六星开源商城', '2017-07-12 15:46:12', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('264', '0', 'SEO_DESC', '六星开源商城', '2017-07-12 15:46:12', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('265', '0', 'SEO_OTHER', '六星开源商城', '2017-07-12 15:46:12', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('266', '0', 'SEO_TITLE', '六星开源商城', '2017-07-12 15:46:13', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('267', '0', 'SEO_META', '六星开源商城', '2017-07-12 15:46:13', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('268', '0', 'SEO_DESC', '六星开源商城', '2017-07-12 15:46:13', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('269', '0', 'SEO_OTHER', '六星开源商城', '2017-07-12 15:46:13', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('270', '0', 'SEO_TITLE', '六星开源商城', '2017-07-12 15:46:15', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('271', '0', 'SEO_META', '六星开源商城', '2017-07-12 15:46:15', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('272', '0', 'SEO_DESC', '六星开源商城', '2017-07-12 15:46:15', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('273', '0', 'SEO_OTHER', '六星开源商城', '2017-07-12 15:46:15', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('274', '0', 'SEO_TITLE', '六星开源商城', '2017-07-12 15:46:21', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('275', '0', 'SEO_META', '六星开源商城', '2017-07-12 15:46:21', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('276', '0', 'SEO_DESC', '六星开源商城', '2017-07-12 15:46:21', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('277', '0', 'SEO_OTHER', '六星开源商城', '2017-07-12 15:46:21', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('278', '0', 'SEO_TITLE', '六星开源商城', '2017-07-12 15:46:22', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('279', '0', 'SEO_META', '六星开源商城', '2017-07-12 15:46:22', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('280', '0', 'SEO_DESC', '六星开源商城', '2017-07-12 15:46:22', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('281', '0', 'SEO_OTHER', '六星开源商城', '2017-07-12 15:46:22', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('282', '0', 'SEO_TITLE', '六星开源商城', '2017-07-12 15:46:24', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('283', '0', 'SEO_META', '六星开源商城', '2017-07-12 15:46:24', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('284', '0', 'SEO_DESC', '六星开源商城', '2017-07-12 15:46:24', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('285', '0', 'SEO_OTHER', '六星开源商城', '2017-07-12 15:46:24', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('286', '0', 'SEO_TITLE', '六星开源商城', '2017-07-12 15:46:25', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('287', '0', 'SEO_META', '六星开源商城', '2017-07-12 15:46:25', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('288', '0', 'SEO_DESC', '六星开源商城', '2017-07-12 15:46:26', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('289', '0', 'SEO_OTHER', '六星开源商城', '2017-07-12 15:46:26', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('290', '0', 'SEO_TITLE', '六星开源商城', '2017-07-12 16:07:23', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('291', '0', 'SEO_META', '六星开源商城', '2017-07-12 16:07:23', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('292', '0', 'SEO_DESC', '六星开源商城', '2017-07-12 16:07:23', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('293', '0', 'SEO_OTHER', '六星开源商城', '2017-07-12 16:07:23', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('294', '0', 'SEO_TITLE', '六星开源商城', '2017-07-12 16:07:32', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('295', '0', 'SEO_META', '六星开源商城', '2017-07-12 16:07:32', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('296', '0', 'SEO_DESC', '六星开源商城', '2017-07-12 16:07:32', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('297', '0', 'SEO_OTHER', '六星开源商城', '2017-07-12 16:07:32', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('298', '0', 'SEO_TITLE', '六星开源商城', '2017-07-13 09:11:42', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('299', '0', 'SEO_META', '六星开源商城', '2017-07-13 09:11:42', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('300', '0', 'SEO_DESC', '六星开源商城', '2017-07-13 09:11:42', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('301', '0', 'SEO_OTHER', '六星开源商城', '2017-07-13 09:11:42', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('302', '0', 'SEO_TITLE', '六星开源商城', '2017-07-13 09:11:47', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('303', '0', 'SEO_META', '六星开源商城', '2017-07-13 09:11:47', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('304', '0', 'SEO_DESC', '六星开源商城', '2017-07-13 09:11:47', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('305', '0', 'SEO_OTHER', '六星开源商城', '2017-07-13 09:11:47', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('306', '0', 'SEO_TITLE', '六星开源商城', '2017-07-13 09:11:48', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('307', '0', 'SEO_META', '六星开源商城', '2017-07-13 09:11:48', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('308', '0', 'SEO_DESC', '六星开源商城', '2017-07-13 09:11:48', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('309', '0', 'SEO_OTHER', '六星开源商城', '2017-07-13 09:11:48', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('310', '0', 'SEO_TITLE', '六星开源商城', '2017-07-13 09:11:49', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('311', '0', 'SEO_META', '六星开源商城', '2017-07-13 09:11:49', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('312', '0', 'SEO_DESC', '六星开源商城', '2017-07-13 09:11:49', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('313', '0', 'SEO_OTHER', '六星开源商城', '2017-07-13 09:11:50', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('314', '0', 'SEO_TITLE', '六星开源商城', '2017-07-13 09:11:58', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('315', '0', 'SEO_META', '六星开源商城', '2017-07-13 09:11:58', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('316', '0', 'SEO_DESC', '六星开源商城', '2017-07-13 09:11:58', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('317', '0', 'SEO_OTHER', '六星开源商城', '2017-07-13 09:11:58', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('318', '0', 'SEO_TITLE', '六星开源商城', '2017-07-13 09:11:59', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('319', '0', 'SEO_META', '六星开源商城', '2017-07-13 09:11:59', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('320', '0', 'SEO_DESC', '六星开源商城', '2017-07-13 09:11:59', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('321', '0', 'SEO_OTHER', '六星开源商城', '2017-07-13 09:11:59', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('322', '0', 'SEO_TITLE', '六星开源商城', '2017-07-13 09:12:01', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('323', '0', 'SEO_META', '六星开源商城', '2017-07-13 09:12:01', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('324', '0', 'SEO_DESC', '六星开源商城', '2017-07-13 09:12:01', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('325', '0', 'SEO_OTHER', '六星开源商城', '2017-07-13 09:12:01', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('326', '0', 'SEO_TITLE', '六星开源商城', '2017-07-13 09:12:02', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('327', '0', 'SEO_META', '六星开源商城', '2017-07-13 09:12:02', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('328', '0', 'SEO_DESC', '六星开源商城', '2017-07-13 09:12:03', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('329', '0', 'SEO_OTHER', '六星开源商城', '2017-07-13 09:12:03', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('330', '0', 'SEO_TITLE', '六星开源商城', '2017-07-13 09:13:27', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('331', '0', 'SEO_META', '六星开源商城', '2017-07-13 09:13:27', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('332', '0', 'SEO_DESC', '六星开源商城', '2017-07-13 09:13:27', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('333', '0', 'SEO_OTHER', '六星开源商城', '2017-07-13 09:13:27', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('334', '0', 'SEO_TITLE', '六星开源商城', '2017-07-13 09:13:43', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('335', '0', 'SEO_META', '六星开源商城', '2017-07-13 09:13:43', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('336', '0', 'SEO_DESC', '六星开源商城', '2017-07-13 09:13:43', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('337', '0', 'SEO_OTHER', '六星开源商城', '2017-07-13 09:13:43', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('338', '0', 'SEO_TITLE', '六星开源商城', '2017-07-13 09:13:44', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('339', '0', 'SEO_META', '六星开源商城', '2017-07-13 09:13:44', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('340', '0', 'SEO_DESC', '六星开源商城', '2017-07-13 09:13:44', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('341', '0', 'SEO_OTHER', '六星开源商城', '2017-07-13 09:13:44', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('342', '0', 'SEO_TITLE', '六星开源商城', '2017-07-13 09:13:46', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('343', '0', 'SEO_META', '六星开源商城', '2017-07-13 09:13:46', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('344', '0', 'SEO_DESC', '六星开源商城', '2017-07-13 09:13:46', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('345', '0', 'SEO_OTHER', '六星开源商城', '2017-07-13 09:13:46', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('346', '0', 'SEO_TITLE', '六星开源商城', '2017-07-13 09:13:48', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('347', '0', 'SEO_META', '六星开源商城', '2017-07-13 09:13:48', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('348', '0', 'SEO_DESC', '六星开源商城', '2017-07-13 09:13:48', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('349', '0', 'SEO_OTHER', '六星开源商城', '2017-07-13 09:13:48', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('350', '0', 'SEO_TITLE', '六星开源商城', '2017-07-13 17:18:48', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('351', '0', 'SEO_META', '六星开源商城', '2017-07-13 17:18:48', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('352', '0', 'SEO_DESC', '六星开源商城', '2017-07-13 17:18:48', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('353', '0', 'SEO_OTHER', '六星开源商城', '2017-07-13 17:18:48', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('354', '0', 'SEO_TITLE', '六星开源商城', '2017-07-13 17:18:49', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('355', '0', 'SEO_META', '六星开源商城', '2017-07-13 17:18:49', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('356', '0', 'SEO_DESC', '六星开源商城', '2017-07-13 17:18:49', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('357', '0', 'SEO_OTHER', '六星开源商城', '2017-07-13 17:18:49', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('358', '0', 'SEO_TITLE', '六星开源商城', '2017-07-13 17:34:18', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('359', '0', 'SEO_META', '六星开源商城', '2017-07-13 17:34:18', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('360', '0', 'SEO_DESC', '六星开源商城', '2017-07-13 17:34:18', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('361', '0', 'SEO_OTHER', '六星开源商城', '2017-07-13 17:34:18', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('362', '0', 'SEO_TITLE', '六星开源商城', '2017-07-13 17:34:20', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('363', '0', 'SEO_META', '六星开源商城', '2017-07-13 17:34:20', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('364', '0', 'SEO_DESC', '六星开源商城', '2017-07-13 17:34:20', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('365', '0', 'SEO_OTHER', '六星开源商城', '2017-07-13 17:34:20', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('366', '0', 'SEO_TITLE', '六星开源商城', '2017-07-13 17:34:22', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('367', '0', 'SEO_META', '六星开源商城', '2017-07-13 17:34:22', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('368', '0', 'SEO_DESC', '六星开源商城', '2017-07-13 17:34:22', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('369', '0', 'SEO_OTHER', '六星开源商城', '2017-07-13 17:34:22', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('370', '0', 'SEO_TITLE', '六星开源商城', '2017-07-13 17:34:23', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('371', '0', 'SEO_META', '六星开源商城', '2017-07-13 17:34:23', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('372', '0', 'SEO_DESC', '六星开源商城', '2017-07-13 17:34:24', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('373', '0', 'SEO_OTHER', '六星开源商城', '2017-07-13 17:34:24', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('374', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 09:21:50', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('375', '0', 'SEO_META', '六星开源商城', '2017-07-14 09:21:50', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('376', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 09:21:50', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('377', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 09:21:50', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('378', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 09:21:51', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('379', '0', 'SEO_META', '六星开源商城', '2017-07-14 09:21:51', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('380', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 09:21:51', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('381', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 09:21:51', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('382', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 10:02:40', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('383', '0', 'SEO_META', '六星开源商城', '2017-07-14 10:02:40', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('384', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 10:02:40', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('385', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 10:02:40', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('386', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 10:02:41', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('387', '0', 'SEO_META', '六星开源商城', '2017-07-14 10:02:42', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('388', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 10:02:42', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('389', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 10:02:42', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('390', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 10:02:43', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('391', '0', 'SEO_META', '六星开源商城', '2017-07-14 10:02:44', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('392', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 10:02:44', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('393', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 10:02:44', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('394', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 10:02:45', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('395', '0', 'SEO_META', '六星开源商城', '2017-07-14 10:02:45', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('396', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 10:02:45', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('397', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 10:02:45', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('398', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 10:08:38', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('399', '0', 'SEO_META', '六星开源商城', '2017-07-14 10:08:38', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('400', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 10:08:38', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('401', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 10:08:38', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('402', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 10:08:39', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('403', '0', 'SEO_META', '六星开源商城', '2017-07-14 10:08:39', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('404', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 10:08:39', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('405', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 10:08:39', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('406', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 10:08:41', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('407', '0', 'SEO_META', '六星开源商城', '2017-07-14 10:08:41', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('408', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 10:08:41', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('409', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 10:08:41', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('410', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 10:08:42', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('411', '0', 'SEO_META', '六星开源商城', '2017-07-14 10:08:42', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('412', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 10:08:42', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('413', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 10:08:43', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('414', '41', 'SEO_TITLE', '', '2017-07-14 10:08:50', '0000-00-00 00:00:00', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('415', '41', 'SEO_META', '', '2017-07-14 10:08:50', '0000-00-00 00:00:00', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('416', '41', 'SEO_DESC', '', '2017-07-14 10:08:50', '0000-00-00 00:00:00', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('417', '41', 'SEO_OTHER', '', '2017-07-14 10:08:50', '0000-00-00 00:00:00', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('418', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 10:20:03', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('419', '0', 'SEO_META', '六星开源商城', '2017-07-14 10:20:03', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('420', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 10:20:03', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('421', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 10:20:03', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('422', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 10:20:09', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('423', '0', 'SEO_META', '六星开源商城', '2017-07-14 10:20:09', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('424', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 10:20:10', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('425', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 10:20:10', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('426', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 10:21:59', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('427', '0', 'SEO_META', '六星开源商城', '2017-07-14 10:21:59', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('428', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 10:21:59', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('429', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 10:21:59', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('430', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 10:15:34', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('431', '0', 'SEO_META', '六星开源商城', '2017-07-14 10:15:35', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('432', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 10:15:35', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('433', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 10:15:35', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('434', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 10:15:36', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('435', '0', 'SEO_META', '六星开源商城', '2017-07-14 10:15:37', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('436', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 10:15:37', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('437', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 10:15:37', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('438', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 10:15:39', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('439', '0', 'SEO_META', '六星开源商城', '2017-07-14 10:15:39', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('440', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 10:15:40', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('441', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 10:15:40', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('442', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 10:15:42', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('443', '0', 'SEO_META', '六星开源商城', '2017-07-14 10:15:42', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('444', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 10:15:42', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('445', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 10:15:42', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('446', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 10:16:33', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('447', '0', 'SEO_META', '六星开源商城', '2017-07-14 10:16:33', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('448', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 10:16:33', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('449', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 10:16:33', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('450', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 10:27:46', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('451', '0', 'SEO_META', '六星开源商城', '2017-07-14 10:27:46', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('452', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 10:27:46', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('453', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 10:27:46', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('454', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 10:27:46', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('455', '0', 'SEO_META', '六星开源商城', '2017-07-14 10:27:46', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('456', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 10:27:46', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('457', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 10:27:46', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('458', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 10:53:40', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('459', '0', 'SEO_META', '六星开源商城', '2017-07-14 10:53:40', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('460', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 10:53:40', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('461', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 10:53:41', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('462', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 10:53:42', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('463', '0', 'SEO_META', '六星开源商城', '2017-07-14 10:53:42', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('464', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 10:53:42', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('465', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 10:53:42', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('466', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 10:53:44', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('467', '0', 'SEO_META', '六星开源商城', '2017-07-14 10:53:44', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('468', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 10:53:44', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('469', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 10:53:44', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('470', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 10:53:45', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('471', '0', 'SEO_META', '六星开源商城', '2017-07-14 10:53:45', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('472', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 10:53:45', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('473', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 10:53:45', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('474', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 10:59:25', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('475', '0', 'SEO_META', '六星开源商城', '2017-07-14 10:59:25', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('476', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 10:59:25', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('477', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 10:59:25', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('478', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 10:59:26', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('479', '0', 'SEO_META', '六星开源商城', '2017-07-14 10:59:26', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('480', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 10:59:26', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('481', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 10:59:26', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('482', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 10:59:29', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('483', '0', 'SEO_META', '六星开源商城', '2017-07-14 10:59:29', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('484', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 10:59:29', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('485', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 10:59:29', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('486', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 10:59:30', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('487', '0', 'SEO_META', '六星开源商城', '2017-07-14 10:59:30', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('488', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 10:59:30', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('489', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 10:59:30', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('490', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 11:01:36', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('491', '0', 'SEO_META', '六星开源商城', '2017-07-14 11:01:36', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('492', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 11:01:36', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('493', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 11:01:36', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('494', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 11:01:37', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('495', '0', 'SEO_META', '六星开源商城', '2017-07-14 11:01:37', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('496', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 11:01:37', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('497', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 11:01:37', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('498', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 11:25:24', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('499', '0', 'SEO_META', '六星开源商城', '2017-07-14 11:25:24', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('500', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 11:25:24', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('501', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 11:25:25', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('502', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 11:25:34', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('503', '0', 'SEO_META', '六星开源商城', '2017-07-14 11:25:34', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('504', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 11:25:34', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('505', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 11:25:34', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('506', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 11:25:35', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('507', '0', 'SEO_META', '六星开源商城', '2017-07-14 11:25:35', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('508', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 11:25:35', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('509', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 11:25:35', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('510', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 11:25:38', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('511', '0', 'SEO_META', '六星开源商城', '2017-07-14 11:25:38', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('512', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 11:25:38', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('513', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 11:25:38', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('514', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 11:25:39', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('515', '0', 'SEO_META', '六星开源商城', '2017-07-14 11:25:39', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('516', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 11:25:39', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('517', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 11:25:39', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('518', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 16:07:16', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('519', '0', 'SEO_META', '六星开源商城', '2017-07-14 16:07:16', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('520', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 16:07:16', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('521', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 16:07:17', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('522', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 16:07:18', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('523', '0', 'SEO_META', '六星开源商城', '2017-07-14 16:07:18', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('524', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 16:07:18', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('525', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 16:07:18', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('526', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 16:07:20', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('527', '0', 'SEO_META', '六星开源商城', '2017-07-14 16:07:20', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('528', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 16:07:20', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('529', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 16:07:20', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('530', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 16:07:21', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('531', '0', 'SEO_META', '六星开源商城', '2017-07-14 16:07:21', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('532', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 16:07:21', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('533', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 16:07:22', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('534', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 16:20:07', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('535', '0', 'SEO_META', '六星开源商城', '2017-07-14 16:20:07', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('536', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 16:20:07', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('537', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 16:20:08', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('538', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 16:20:12', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('539', '0', 'SEO_META', '六星开源商城', '2017-07-14 16:20:12', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('540', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 16:20:12', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('541', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 16:20:12', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('542', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 16:20:21', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('543', '0', 'SEO_META', '六星开源商城', '2017-07-14 16:20:21', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('544', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 16:20:21', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('545', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 16:20:21', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('546', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 16:20:22', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('547', '0', 'SEO_META', '六星开源商城', '2017-07-14 16:20:22', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('548', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 16:20:22', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('549', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 16:20:22', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('550', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 16:20:24', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('551', '0', 'SEO_META', '六星开源商城', '2017-07-14 16:20:24', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('552', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 16:20:24', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('553', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 16:20:24', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('554', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 16:20:25', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('555', '0', 'SEO_META', '六星开源商城', '2017-07-14 16:20:25', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('556', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 16:20:26', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('557', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 16:20:26', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('558', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 16:32:48', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('559', '0', 'SEO_META', '六星开源商城', '2017-07-14 16:32:48', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('560', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 16:32:48', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('561', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 16:32:48', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('562', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 16:32:54', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('563', '0', 'SEO_META', '六星开源商城', '2017-07-14 16:32:54', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('564', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 16:32:55', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('565', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 16:32:55', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('566', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 16:32:55', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('567', '0', 'SEO_META', '六星开源商城', '2017-07-14 16:32:56', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('568', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 16:32:56', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('569', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 16:32:56', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('570', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 16:32:57', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('571', '0', 'SEO_META', '六星开源商城', '2017-07-14 16:32:57', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('572', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 16:32:57', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('573', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 16:32:57', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('574', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 16:32:59', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('575', '0', 'SEO_META', '六星开源商城', '2017-07-14 16:32:59', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('576', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 16:32:59', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('577', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 16:32:59', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('578', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 16:46:16', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('579', '0', 'SEO_META', '六星开源商城', '2017-07-14 16:46:16', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('580', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 16:46:16', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('581', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 16:46:16', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('582', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 16:46:17', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('583', '0', 'SEO_META', '六星开源商城', '2017-07-14 16:46:17', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('584', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 16:46:17', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('585', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 16:46:17', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('586', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 16:46:19', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('587', '0', 'SEO_META', '六星开源商城', '2017-07-14 16:46:19', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('588', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 16:46:19', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('589', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 16:46:19', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('590', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 16:46:20', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('591', '0', 'SEO_META', '六星开源商城', '2017-07-14 16:46:20', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('592', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 16:46:20', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('593', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 16:46:20', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('594', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 16:46:53', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('595', '0', 'SEO_META', '六星开源商城', '2017-07-14 16:46:53', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('596', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 16:46:53', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('597', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 16:46:53', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('598', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 16:46:54', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('599', '0', 'SEO_META', '六星开源商城', '2017-07-14 16:46:54', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('600', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 16:46:54', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('601', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 16:46:54', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('602', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 16:46:56', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('603', '0', 'SEO_META', '六星开源商城', '2017-07-14 16:46:56', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('604', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 16:46:56', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('605', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 16:46:56', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('606', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 16:46:58', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('607', '0', 'SEO_META', '六星开源商城', '2017-07-14 16:46:58', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('608', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 16:46:58', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('609', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 16:46:58', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('610', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 18:13:01', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('611', '0', 'SEO_META', '六星开源商城', '2017-07-14 18:13:01', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('612', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 18:13:01', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('613', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 18:13:01', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('614', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 18:13:06', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('615', '0', 'SEO_META', '六星开源商城', '2017-07-14 18:13:06', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('616', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 18:13:06', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('617', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 18:13:06', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('618', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 18:13:11', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('619', '0', 'SEO_META', '六星开源商城', '2017-07-14 18:13:11', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('620', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 18:13:11', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('621', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 18:13:11', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('622', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 18:13:14', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('623', '0', 'SEO_META', '六星开源商城', '2017-07-14 18:13:14', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('624', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 18:13:14', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('625', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 18:13:14', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('626', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 18:13:26', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('627', '0', 'SEO_META', '六星开源商城', '2017-07-14 18:13:26', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('628', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 18:13:26', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('629', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 18:13:26', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('630', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 18:13:32', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('631', '0', 'SEO_META', '六星开源商城', '2017-07-14 18:13:32', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('632', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 18:13:32', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('633', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 18:13:32', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('634', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 18:13:43', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('635', '0', 'SEO_META', '六星开源商城', '2017-07-14 18:13:43', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('636', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 18:13:43', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('637', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 18:13:43', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('638', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 18:13:44', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('639', '0', 'SEO_META', '六星开源商城', '2017-07-14 18:13:45', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('640', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 18:13:45', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('641', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 18:13:45', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('642', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 18:14:01', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('643', '0', 'SEO_META', '六星开源商城', '2017-07-14 18:14:01', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('644', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 18:14:02', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('645', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 18:14:02', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('646', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 18:14:12', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('647', '0', 'SEO_META', '六星开源商城', '2017-07-14 18:14:12', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('648', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 18:14:12', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('649', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 18:14:12', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('650', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 18:14:33', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('651', '0', 'SEO_META', '六星开源商城', '2017-07-14 18:14:33', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('652', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 18:14:33', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('653', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 18:14:33', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('654', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 18:14:35', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('655', '0', 'SEO_META', '六星开源商城', '2017-07-14 18:14:35', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('656', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 18:14:35', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('657', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 18:14:35', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('658', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 18:14:38', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('659', '0', 'SEO_META', '六星开源商城', '2017-07-14 18:14:39', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('660', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 18:14:39', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('661', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 18:14:39', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('662', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 18:14:41', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('663', '0', 'SEO_META', '六星开源商城', '2017-07-14 18:14:41', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('664', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 18:14:41', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('665', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 18:14:41', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('666', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 18:15:24', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('667', '0', 'SEO_META', '六星开源商城', '2017-07-14 18:15:24', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('668', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 18:15:24', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('669', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 18:15:24', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('670', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 18:15:26', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('671', '0', 'SEO_META', '六星开源商城', '2017-07-14 18:15:26', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('672', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 18:15:27', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('673', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 18:15:27', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('674', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 18:15:39', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('675', '0', 'SEO_META', '六星开源商城', '2017-07-14 18:15:39', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('676', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 18:15:39', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('677', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 18:15:39', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('678', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 18:15:40', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('679', '0', 'SEO_META', '六星开源商城', '2017-07-14 18:15:40', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('680', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 18:15:40', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('681', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 18:15:40', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('682', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 18:15:51', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('683', '0', 'SEO_META', '六星开源商城', '2017-07-14 18:15:51', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('684', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 18:15:51', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('685', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 18:15:51', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('686', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 18:15:52', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('687', '0', 'SEO_META', '六星开源商城', '2017-07-14 18:15:52', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('688', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 18:15:52', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('689', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 18:15:52', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('690', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 18:16:13', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('691', '0', 'SEO_META', '六星开源商城', '2017-07-14 18:16:13', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('692', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 18:16:13', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('693', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 18:16:13', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('694', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 18:16:17', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('695', '0', 'SEO_META', '六星开源商城', '2017-07-14 18:16:17', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('696', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 18:16:17', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('697', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 18:16:17', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('698', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 18:16:21', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('699', '0', 'SEO_META', '六星开源商城', '2017-07-14 18:16:21', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('700', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 18:16:21', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('701', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 18:16:21', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('702', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 18:16:26', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('703', '0', 'SEO_META', '六星开源商城', '2017-07-14 18:16:26', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('704', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 18:16:26', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('705', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 18:16:26', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('706', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 18:16:32', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('707', '0', 'SEO_META', '六星开源商城', '2017-07-14 18:16:32', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('708', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 18:16:32', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('709', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 18:16:32', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('710', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 18:16:38', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('711', '0', 'SEO_META', '六星开源商城', '2017-07-14 18:16:38', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('712', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 18:16:38', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('713', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 18:16:38', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('714', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 18:17:17', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('715', '0', 'SEO_META', '六星开源商城', '2017-07-14 18:17:17', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('716', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 18:17:17', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('717', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 18:17:17', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('718', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 18:17:22', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('719', '0', 'SEO_META', '六星开源商城', '2017-07-14 18:17:22', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('720', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 18:17:22', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('721', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 18:17:22', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('722', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 18:17:27', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('723', '0', 'SEO_META', '六星开源商城', '2017-07-14 18:17:27', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('724', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 18:17:27', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('725', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 18:17:27', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('726', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 18:17:31', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('727', '0', 'SEO_META', '六星开源商城', '2017-07-14 18:17:31', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('728', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 18:17:31', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('729', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 18:17:31', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('730', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 18:17:43', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('731', '0', 'SEO_META', '六星开源商城', '2017-07-14 18:17:43', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('732', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 18:17:43', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('733', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 18:17:43', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('734', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 18:17:44', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('735', '0', 'SEO_META', '六星开源商城', '2017-07-14 18:17:45', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('736', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 18:17:45', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('737', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 18:17:45', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('738', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 18:17:56', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('739', '0', 'SEO_META', '六星开源商城', '2017-07-14 18:17:56', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('740', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 18:17:56', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('741', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 18:17:56', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('742', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 18:18:24', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('743', '0', 'SEO_META', '六星开源商城', '2017-07-14 18:18:24', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('744', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 18:18:24', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('745', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 18:18:24', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('746', '0', 'SEO_TITLE', '六星开源商城', '2017-07-14 18:26:46', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('747', '0', 'SEO_META', '六星开源商城', '2017-07-14 18:26:46', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('748', '0', 'SEO_DESC', '六星开源商城', '2017-07-14 18:26:46', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('749', '0', 'SEO_OTHER', '六星开源商城', '2017-07-14 18:26:46', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('750', '0', 'SEO_TITLE', '六星开源商城', '2017-07-15 09:05:56', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('751', '0', 'SEO_META', '六星开源商城', '2017-07-15 09:05:56', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('752', '0', 'SEO_DESC', '六星开源商城', '2017-07-15 09:05:56', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('753', '0', 'SEO_OTHER', '六星开源商城', '2017-07-15 09:05:56', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('754', '0', 'SEO_TITLE', '六星开源商城', '2017-07-15 09:06:00', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('755', '0', 'SEO_META', '六星开源商城', '2017-07-15 09:06:00', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('756', '0', 'SEO_DESC', '六星开源商城', '2017-07-15 09:06:00', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('757', '0', 'SEO_OTHER', '六星开源商城', '2017-07-15 09:06:00', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('758', '0', 'SEO_TITLE', '六星开源商城', '2017-07-15 09:06:02', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('759', '0', 'SEO_META', '六星开源商城', '2017-07-15 09:06:02', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('760', '0', 'SEO_DESC', '六星开源商城', '2017-07-15 09:06:02', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('761', '0', 'SEO_OTHER', '六星开源商城', '2017-07-15 09:06:02', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('762', '0', 'SEO_TITLE', '六星开源商城', '2017-07-15 09:06:03', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('763', '0', 'SEO_META', '六星开源商城', '2017-07-15 09:06:04', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('764', '0', 'SEO_DESC', '六星开源商城', '2017-07-15 09:06:04', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('765', '0', 'SEO_OTHER', '六星开源商城', '2017-07-15 09:06:04', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('766', '0', 'SEO_TITLE', '六星开源商城', '2017-07-15 09:46:46', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('767', '0', 'SEO_META', '六星开源商城', '2017-07-15 09:46:46', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('768', '0', 'SEO_DESC', '六星开源商城', '2017-07-15 09:46:46', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('769', '0', 'SEO_OTHER', '六星开源商城', '2017-07-15 09:46:46', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('770', '0', 'SEO_TITLE', '六星开源商城', '2017-07-15 09:46:48', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('771', '0', 'SEO_META', '六星开源商城', '2017-07-15 09:46:48', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('772', '0', 'SEO_DESC', '六星开源商城', '2017-07-15 09:46:48', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('773', '0', 'SEO_OTHER', '六星开源商城', '2017-07-15 09:46:48', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('774', '0', 'SEO_TITLE', '六星开源商城', '2017-07-15 09:47:53', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('775', '0', 'SEO_META', '六星开源商城', '2017-07-15 09:47:53', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('776', '0', 'SEO_DESC', '六星开源商城', '2017-07-15 09:47:53', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('777', '0', 'SEO_OTHER', '六星开源商城', '2017-07-15 09:47:53', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('778', '0', 'SEO_TITLE', '六星开源商城', '2017-07-15 09:47:53', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('779', '0', 'SEO_META', '六星开源商城', '2017-07-15 09:47:53', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('780', '0', 'SEO_DESC', '六星开源商城', '2017-07-15 09:47:54', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('781', '0', 'SEO_OTHER', '六星开源商城', '2017-07-15 09:47:54', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('782', '0', 'SEO_TITLE', '六星开源商城', '2017-07-15 09:49:34', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('783', '0', 'SEO_META', '六星开源商城', '2017-07-15 09:49:34', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('784', '0', 'SEO_DESC', '六星开源商城', '2017-07-15 09:49:34', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('785', '0', 'SEO_OTHER', '六星开源商城', '2017-07-15 09:49:34', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('786', '0', 'SEO_TITLE', '六星开源商城', '2017-07-15 09:49:35', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('787', '0', 'SEO_META', '六星开源商城', '2017-07-15 09:49:35', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('788', '0', 'SEO_DESC', '六星开源商城', '2017-07-15 09:49:35', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('789', '0', 'SEO_OTHER', '六星开源商城', '2017-07-15 09:49:35', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('790', '0', 'SEO_TITLE', '六星开源商城', '2017-07-15 16:31:50', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('791', '0', 'SEO_META', '六星开源商城', '2017-07-15 16:31:50', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('792', '0', 'SEO_DESC', '六星开源商城', '2017-07-15 16:31:50', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('793', '0', 'SEO_OTHER', '六星开源商城', '2017-07-15 16:31:50', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('794', '0', 'SEO_TITLE', '六星开源商城', '2017-07-17 09:10:20', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('795', '0', 'SEO_META', '六星开源商城', '2017-07-17 09:10:20', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('796', '0', 'SEO_DESC', '六星开源商城', '2017-07-17 09:10:20', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('797', '0', 'SEO_OTHER', '六星开源商城', '2017-07-17 09:10:20', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('798', '0', 'SEO_TITLE', '六星开源商城', '2017-07-17 09:10:21', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('799', '0', 'SEO_META', '六星开源商城', '2017-07-17 09:10:21', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('800', '0', 'SEO_DESC', '六星开源商城', '2017-07-17 09:10:21', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('801', '0', 'SEO_OTHER', '六星开源商城', '2017-07-17 09:10:21', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('802', '0', 'SEO_TITLE', '六星开源商城', '2017-07-17 09:12:48', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('803', '0', 'SEO_META', '六星开源商城', '2017-07-17 09:12:48', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('804', '0', 'SEO_DESC', '六星开源商城', '2017-07-17 09:12:48', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('805', '0', 'SEO_OTHER', '六星开源商城', '2017-07-17 09:12:48', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('806', '0', 'SEO_TITLE', '六星开源商城', '2017-07-17 09:12:49', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('807', '0', 'SEO_META', '六星开源商城', '2017-07-17 09:12:49', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('808', '0', 'SEO_DESC', '六星开源商城', '2017-07-17 09:12:49', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('809', '0', 'SEO_OTHER', '六星开源商城', '2017-07-17 09:12:49', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('810', '0', 'SEO_TITLE', '六星开源商城', '2017-07-17 11:07:30', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('811', '0', 'SEO_META', '六星开源商城', '2017-07-17 11:07:30', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('812', '0', 'SEO_DESC', '六星开源商城', '2017-07-17 11:07:30', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('813', '0', 'SEO_OTHER', '六星开源商城', '2017-07-17 11:07:30', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('814', '0', 'SEO_TITLE', '六星开源商城', '2017-07-17 11:07:43', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('815', '0', 'SEO_META', '六星开源商城', '2017-07-17 11:07:43', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('816', '0', 'SEO_DESC', '六星开源商城', '2017-07-17 11:07:43', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('817', '0', 'SEO_OTHER', '六星开源商城', '2017-07-17 11:07:43', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('818', '0', 'SEO_TITLE', '六星开源商城', '2017-07-17 11:07:54', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('819', '0', 'SEO_META', '六星开源商城', '2017-07-17 11:07:54', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('820', '0', 'SEO_DESC', '六星开源商城', '2017-07-17 11:07:54', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('821', '0', 'SEO_OTHER', '六星开源商城', '2017-07-17 11:07:54', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('822', '0', 'SEO_TITLE', '六星开源商城', '2017-07-17 12:09:19', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('823', '0', 'SEO_META', '六星开源商城', '2017-07-17 12:09:19', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('824', '0', 'SEO_DESC', '六星开源商城', '2017-07-17 12:09:19', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('825', '0', 'SEO_OTHER', '六星开源商城', '2017-07-17 12:09:19', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('826', '0', 'SEO_TITLE', '六星开源商城', '2017-07-17 12:09:20', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('827', '0', 'SEO_META', '六星开源商城', '2017-07-17 12:09:20', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('828', '0', 'SEO_DESC', '六星开源商城', '2017-07-17 12:09:21', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('829', '0', 'SEO_OTHER', '六星开源商城', '2017-07-17 12:09:21', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('830', '0', 'SEO_TITLE', '六星开源商城', '2017-07-17 12:09:23', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('831', '0', 'SEO_META', '六星开源商城', '2017-07-17 12:09:23', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('832', '0', 'SEO_DESC', '六星开源商城', '2017-07-17 12:09:23', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('833', '0', 'SEO_OTHER', '六星开源商城', '2017-07-17 12:09:23', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('834', '0', 'SEO_TITLE', '六星开源商城', '2017-07-17 12:09:27', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('835', '0', 'SEO_META', '六星开源商城', '2017-07-17 12:09:27', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('836', '0', 'SEO_DESC', '六星开源商城', '2017-07-17 12:09:27', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('837', '0', 'SEO_OTHER', '六星开源商城', '2017-07-17 12:09:27', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('838', '0', 'SEO_TITLE', '六星开源商城', '2017-07-17 12:09:32', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('839', '0', 'SEO_META', '六星开源商城', '2017-07-17 12:09:32', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('840', '0', 'SEO_DESC', '六星开源商城', '2017-07-17 12:09:33', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('841', '0', 'SEO_OTHER', '六星开源商城', '2017-07-17 12:09:33', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('842', '0', 'SEO_TITLE', '六星开源商城', '2017-07-17 12:13:06', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('843', '0', 'SEO_META', '六星开源商城', '2017-07-17 12:13:06', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('844', '0', 'SEO_DESC', '六星开源商城', '2017-07-17 12:13:06', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('845', '0', 'SEO_OTHER', '六星开源商城', '2017-07-17 12:13:06', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('846', '0', 'SEO_TITLE', '六星开源商城', '2017-07-17 12:13:10', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('847', '0', 'SEO_META', '六星开源商城', '2017-07-17 12:13:10', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('848', '0', 'SEO_DESC', '六星开源商城', '2017-07-17 12:13:10', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('849', '0', 'SEO_OTHER', '六星开源商城', '2017-07-17 12:13:10', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('850', '0', 'SEO_TITLE', '六星开源商城', '2017-07-17 12:13:16', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('851', '0', 'SEO_META', '六星开源商城', '2017-07-17 12:13:17', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('852', '0', 'SEO_DESC', '六星开源商城', '2017-07-17 12:13:17', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('853', '0', 'SEO_OTHER', '六星开源商城', '2017-07-17 12:13:17', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('854', '0', 'SEO_TITLE', '六星开源商城', '2017-07-17 12:13:19', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('855', '0', 'SEO_META', '六星开源商城', '2017-07-17 12:13:19', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('856', '0', 'SEO_DESC', '六星开源商城', '2017-07-17 12:13:19', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('857', '0', 'SEO_OTHER', '六星开源商城', '2017-07-17 12:13:19', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('858', '0', 'SEO_TITLE', '六星开源商城', '2017-07-17 12:14:31', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('859', '0', 'SEO_META', '六星开源商城', '2017-07-17 12:14:31', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('860', '0', 'SEO_DESC', '六星开源商城', '2017-07-17 12:14:31', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('861', '0', 'SEO_OTHER', '六星开源商城', '2017-07-17 12:14:31', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('862', '0', 'SEO_TITLE', '六星开源商城', '2017-07-17 12:14:32', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('863', '0', 'SEO_META', '六星开源商城', '2017-07-17 12:14:32', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('864', '0', 'SEO_DESC', '六星开源商城', '2017-07-17 12:14:32', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('865', '0', 'SEO_OTHER', '六星开源商城', '2017-07-17 12:14:32', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('866', '0', 'SEO_TITLE', '六星开源商城', '2017-07-17 12:14:33', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('867', '0', 'SEO_META', '六星开源商城', '2017-07-17 12:14:33', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('868', '0', 'SEO_DESC', '六星开源商城', '2017-07-17 12:14:33', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('869', '0', 'SEO_OTHER', '六星开源商城', '2017-07-17 12:14:33', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('870', '0', 'SEO_TITLE', '六星开源商城', '2017-07-17 12:14:34', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('871', '0', 'SEO_META', '六星开源商城', '2017-07-17 12:14:35', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('872', '0', 'SEO_DESC', '六星开源商城', '2017-07-17 12:14:35', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('873', '0', 'SEO_OTHER', '六星开源商城', '2017-07-17 12:14:35', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('874', '0', 'SEO_TITLE', '六星开源商城', '2017-07-17 12:14:36', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('875', '0', 'SEO_META', '六星开源商城', '2017-07-17 12:14:36', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('876', '0', 'SEO_DESC', '六星开源商城', '2017-07-17 12:14:36', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('877', '0', 'SEO_OTHER', '六星开源商城', '2017-07-17 12:14:36', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('878', '0', 'SEO_TITLE', '六星开源商城', '2017-07-17 12:14:37', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('879', '0', 'SEO_META', '六星开源商城', '2017-07-17 12:14:37', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('880', '0', 'SEO_DESC', '六星开源商城', '2017-07-17 12:14:37', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('881', '0', 'SEO_OTHER', '六星开源商城', '2017-07-17 12:14:37', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('882', '0', 'SEO_TITLE', '六星开源商城', '2017-07-17 12:14:38', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('883', '0', 'SEO_META', '六星开源商城', '2017-07-17 12:14:38', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('884', '0', 'SEO_DESC', '六星开源商城', '2017-07-17 12:14:38', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('885', '0', 'SEO_OTHER', '六星开源商城', '2017-07-17 12:14:38', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('886', '0', 'SEO_TITLE', '六星开源商城', '2017-07-17 12:14:39', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('887', '0', 'SEO_META', '六星开源商城', '2017-07-17 12:14:39', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('888', '0', 'SEO_DESC', '六星开源商城', '2017-07-17 12:14:39', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('889', '0', 'SEO_OTHER', '六星开源商城', '2017-07-17 12:14:39', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('890', '0', 'SEO_TITLE', '六星开源商城', '2017-07-17 12:17:49', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('891', '0', 'SEO_META', '六星开源商城', '2017-07-17 12:17:49', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('892', '0', 'SEO_DESC', '六星开源商城', '2017-07-17 12:17:49', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('893', '0', 'SEO_OTHER', '六星开源商城', '2017-07-17 12:17:49', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('894', '0', 'SEO_TITLE', '六星开源商城', '2017-07-17 12:17:50', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('895', '0', 'SEO_META', '六星开源商城', '2017-07-17 12:17:50', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('896', '0', 'SEO_DESC', '六星开源商城', '2017-07-17 12:17:50', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('897', '0', 'SEO_OTHER', '六星开源商城', '2017-07-17 12:17:50', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('898', '0', 'SEO_TITLE', '六星开源商城', '2017-07-17 12:17:52', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('899', '0', 'SEO_META', '六星开源商城', '2017-07-17 12:17:52', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('900', '0', 'SEO_DESC', '六星开源商城', '2017-07-17 12:17:52', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('901', '0', 'SEO_OTHER', '六星开源商城', '2017-07-17 12:17:52', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('902', '0', 'SEO_TITLE', '六星开源商城', '2017-07-17 12:17:54', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('903', '0', 'SEO_META', '六星开源商城', '2017-07-17 12:17:54', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('904', '0', 'SEO_DESC', '六星开源商城', '2017-07-17 12:17:54', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('905', '0', 'SEO_OTHER', '六星开源商城', '2017-07-17 12:17:54', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('906', '0', 'SEO_TITLE', '六星开源商城', '2017-07-17 12:19:28', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('907', '0', 'SEO_META', '六星开源商城', '2017-07-17 12:19:29', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('908', '0', 'SEO_DESC', '六星开源商城', '2017-07-17 12:19:29', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('909', '0', 'SEO_OTHER', '六星开源商城', '2017-07-17 12:19:29', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('910', '0', 'SEO_TITLE', '六星开源商城', '2017-07-17 12:19:30', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('911', '0', 'SEO_META', '六星开源商城', '2017-07-17 12:19:30', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('912', '0', 'SEO_DESC', '六星开源商城', '2017-07-17 12:19:30', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('913', '0', 'SEO_OTHER', '六星开源商城', '2017-07-17 12:19:30', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('914', '0', 'SEO_TITLE', '六星开源商城', '2017-07-17 12:19:32', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('915', '0', 'SEO_META', '六星开源商城', '2017-07-17 12:19:32', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('916', '0', 'SEO_DESC', '六星开源商城', '2017-07-17 12:19:32', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('917', '0', 'SEO_OTHER', '六星开源商城', '2017-07-17 12:19:32', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('918', '0', 'SEO_TITLE', '六星开源商城', '2017-07-17 12:19:33', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('919', '0', 'SEO_META', '六星开源商城', '2017-07-17 12:19:33', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('920', '0', 'SEO_DESC', '六星开源商城', '2017-07-17 12:19:33', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('921', '0', 'SEO_OTHER', '六星开源商城', '2017-07-17 12:19:33', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('922', '0', 'SEO_TITLE', '六星开源商城', '2017-07-17 12:25:52', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('923', '0', 'SEO_META', '六星开源商城', '2017-07-17 12:25:52', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('924', '0', 'SEO_DESC', '六星开源商城', '2017-07-17 12:25:52', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('925', '0', 'SEO_OTHER', '六星开源商城', '2017-07-17 12:25:53', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('926', '0', 'SEO_TITLE', '六星开源商城', '2017-07-17 12:25:54', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('927', '0', 'SEO_META', '六星开源商城', '2017-07-17 12:25:54', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('928', '0', 'SEO_DESC', '六星开源商城', '2017-07-17 12:25:54', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('929', '0', 'SEO_OTHER', '六星开源商城', '2017-07-17 12:25:54', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('930', '0', 'SEO_TITLE', '六星开源商城', '2017-07-17 12:25:56', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('931', '0', 'SEO_META', '六星开源商城', '2017-07-17 12:25:56', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('932', '0', 'SEO_DESC', '六星开源商城', '2017-07-17 12:25:56', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('933', '0', 'SEO_OTHER', '六星开源商城', '2017-07-17 12:25:56', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('934', '0', 'SEO_TITLE', '六星开源商城', '2017-07-17 12:25:57', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('935', '0', 'SEO_META', '六星开源商城', '2017-07-17 12:25:57', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('936', '0', 'SEO_DESC', '六星开源商城', '2017-07-17 12:25:57', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('937', '0', 'SEO_OTHER', '六星开源商城', '2017-07-17 12:25:57', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('938', '0', 'SEO_TITLE', '六星开源商城', '2017-07-17 12:26:22', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('939', '0', 'SEO_META', '六星开源商城', '2017-07-17 12:26:22', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('940', '0', 'SEO_DESC', '六星开源商城', '2017-07-17 12:26:22', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('941', '0', 'SEO_OTHER', '六星开源商城', '2017-07-17 12:26:22', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('942', '0', 'SEO_TITLE', '六星开源商城', '2017-07-17 14:28:03', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('943', '0', 'SEO_META', '六星开源商城', '2017-07-17 14:28:03', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('944', '0', 'SEO_DESC', '六星开源商城', '2017-07-17 14:28:03', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('945', '0', 'SEO_OTHER', '六星开源商城', '2017-07-17 14:28:03', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('946', '0', 'SEO_TITLE', '六星开源商城', '2017-07-17 14:28:05', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('947', '0', 'SEO_META', '六星开源商城', '2017-07-17 14:28:05', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('948', '0', 'SEO_DESC', '六星开源商城', '2017-07-17 14:28:05', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('949', '0', 'SEO_OTHER', '六星开源商城', '2017-07-17 14:28:05', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('950', '0', 'SEO_TITLE', '六星开源商城', '2017-07-17 14:28:07', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('951', '0', 'SEO_META', '六星开源商城', '2017-07-17 14:28:07', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('952', '0', 'SEO_DESC', '六星开源商城', '2017-07-17 14:28:07', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('953', '0', 'SEO_OTHER', '六星开源商城', '2017-07-17 14:28:07', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('954', '0', 'SEO_TITLE', '六星开源商城', '2017-07-17 14:28:08', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('955', '0', 'SEO_META', '六星开源商城', '2017-07-17 14:28:08', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('956', '0', 'SEO_DESC', '六星开源商城', '2017-07-17 14:28:08', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('957', '0', 'SEO_OTHER', '六星开源商城', '2017-07-17 14:28:08', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('958', '0', 'SEO_TITLE', '六星开源商城', '2017-07-17 14:28:47', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('959', '0', 'SEO_META', '六星开源商城', '2017-07-17 14:28:47', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('960', '0', 'SEO_DESC', '六星开源商城', '2017-07-17 14:28:47', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('961', '0', 'SEO_OTHER', '六星开源商城', '2017-07-17 14:28:47', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('962', '0', 'SEO_TITLE', '六星开源商城', '2017-07-17 14:28:48', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('963', '0', 'SEO_META', '六星开源商城', '2017-07-17 14:28:48', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('964', '0', 'SEO_DESC', '六星开源商城', '2017-07-17 14:28:48', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('965', '0', 'SEO_OTHER', '六星开源商城', '2017-07-17 14:28:48', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('966', '0', 'SEO_TITLE', '六星开源商城', '2017-07-17 14:28:50', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('967', '0', 'SEO_META', '六星开源商城', '2017-07-17 14:28:51', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('968', '0', 'SEO_DESC', '六星开源商城', '2017-07-17 14:28:51', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('969', '0', 'SEO_OTHER', '六星开源商城', '2017-07-17 14:28:51', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('970', '0', 'SEO_TITLE', '六星开源商城', '2017-07-17 14:28:52', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('971', '0', 'SEO_META', '六星开源商城', '2017-07-17 14:28:52', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('972', '0', 'SEO_DESC', '六星开源商城', '2017-07-17 14:28:52', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('973', '0', 'SEO_OTHER', '六星开源商城', '2017-07-17 14:28:52', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('974', '0', 'SEO_TITLE', '六星开源商城', '2017-07-17 14:31:33', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('975', '0', 'SEO_META', '六星开源商城', '2017-07-17 14:31:33', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('976', '0', 'SEO_DESC', '六星开源商城', '2017-07-17 14:31:33', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('977', '0', 'SEO_OTHER', '六星开源商城', '2017-07-17 14:31:34', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('978', '0', 'SEO_TITLE', '六星开源商城', '2017-07-17 14:31:34', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('979', '0', 'SEO_META', '六星开源商城', '2017-07-17 14:31:34', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('980', '0', 'SEO_DESC', '六星开源商城', '2017-07-17 14:31:35', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('981', '0', 'SEO_OTHER', '六星开源商城', '2017-07-17 14:31:35', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('982', '0', 'SEO_TITLE', '六星开源商城', '2017-07-17 14:31:36', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('983', '0', 'SEO_META', '六星开源商城', '2017-07-17 14:31:37', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('984', '0', 'SEO_DESC', '六星开源商城', '2017-07-17 14:31:37', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('985', '0', 'SEO_OTHER', '六星开源商城', '2017-07-17 14:31:37', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('986', '0', 'SEO_TITLE', '六星开源商城', '2017-07-17 15:14:54', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('987', '0', 'SEO_META', '六星开源商城', '2017-07-17 15:14:54', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('988', '0', 'SEO_DESC', '六星开源商城', '2017-07-17 15:14:54', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('989', '0', 'SEO_OTHER', '六星开源商城', '2017-07-17 15:14:54', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('990', '0', 'SEO_TITLE', '六星开源商城', '2017-07-17 15:14:56', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('991', '0', 'SEO_META', '六星开源商城', '2017-07-17 15:14:56', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('992', '0', 'SEO_DESC', '六星开源商城', '2017-07-17 15:14:56', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('993', '0', 'SEO_OTHER', '六星开源商城', '2017-07-17 15:14:56', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('994', '0', 'SEO_TITLE', '六星开源商城', '2017-07-17 15:14:57', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('995', '0', 'SEO_META', '六星开源商城', '2017-07-17 15:14:57', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('996', '0', 'SEO_DESC', '六星开源商城', '2017-07-17 15:14:57', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('997', '0', 'SEO_OTHER', '六星开源商城', '2017-07-17 15:14:57', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('998', '0', 'SEO_TITLE', '六星开源商城', '2017-07-17 15:14:59', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('999', '0', 'SEO_META', '六星开源商城', '2017-07-17 15:14:59', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1000', '0', 'SEO_DESC', '六星开源商城', '2017-07-17 15:14:59', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1001', '0', 'SEO_OTHER', '六星开源商城', '2017-07-17 15:14:59', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1002', '0', 'SEO_TITLE', '六星开源商城', '2017-07-17 15:15:10', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1003', '0', 'SEO_META', '六星开源商城', '2017-07-17 15:15:10', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1004', '0', 'SEO_DESC', '六星开源商城', '2017-07-17 15:15:10', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1005', '0', 'SEO_OTHER', '六星开源商城', '2017-07-17 15:15:10', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1006', '0', 'SEO_TITLE', '六星开源商城', '2017-07-17 15:15:11', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1007', '0', 'SEO_META', '六星开源商城', '2017-07-17 15:15:11', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1008', '0', 'SEO_DESC', '六星开源商城', '2017-07-17 15:15:11', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1009', '0', 'SEO_OTHER', '六星开源商城', '2017-07-17 15:15:11', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1010', '0', 'SEO_TITLE', '六星开源商城', '2017-07-17 15:15:13', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1011', '0', 'SEO_META', '六星开源商城', '2017-07-17 15:15:13', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1012', '0', 'SEO_DESC', '六星开源商城', '2017-07-17 15:15:13', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1013', '0', 'SEO_OTHER', '六星开源商城', '2017-07-17 15:15:13', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1014', '0', 'SEO_TITLE', '六星开源商城', '2017-07-17 15:15:14', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1015', '0', 'SEO_META', '六星开源商城', '2017-07-17 15:15:14', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1016', '0', 'SEO_DESC', '六星开源商城', '2017-07-17 15:15:14', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1017', '0', 'SEO_OTHER', '六星开源商城', '2017-07-17 15:15:14', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1018', '0', 'SEO_TITLE', '六星开源商城', '2017-07-17 16:30:36', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1019', '0', 'SEO_META', '六星开源商城', '2017-07-17 16:30:36', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1020', '0', 'SEO_DESC', '六星开源商城', '2017-07-17 16:30:36', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1021', '0', 'SEO_OTHER', '六星开源商城', '2017-07-17 16:30:36', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1022', '0', 'SEO_TITLE', '六星开源商城', '2017-07-17 16:30:37', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1023', '0', 'SEO_META', '六星开源商城', '2017-07-17 16:30:37', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1024', '0', 'SEO_DESC', '六星开源商城', '2017-07-17 16:30:37', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1025', '0', 'SEO_OTHER', '六星开源商城', '2017-07-17 16:30:37', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1026', '0', 'SEO_TITLE', '六星开源商城', '2017-07-17 16:30:39', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1027', '0', 'SEO_META', '六星开源商城', '2017-07-17 16:30:39', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1028', '0', 'SEO_DESC', '六星开源商城', '2017-07-17 16:30:39', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1029', '0', 'SEO_OTHER', '六星开源商城', '2017-07-17 16:30:39', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1030', '0', 'SEO_TITLE', '六星开源商城', '2017-07-17 16:30:46', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1031', '0', 'SEO_META', '六星开源商城', '2017-07-17 16:30:46', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1032', '0', 'SEO_DESC', '六星开源商城', '2017-07-17 16:30:46', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1033', '0', 'SEO_OTHER', '六星开源商城', '2017-07-17 16:30:46', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1034', '0', 'SEO_TITLE', '六星开源商城', '2017-07-17 16:30:47', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1035', '0', 'SEO_META', '六星开源商城', '2017-07-17 16:30:47', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1036', '0', 'SEO_DESC', '六星开源商城', '2017-07-17 16:30:47', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1037', '0', 'SEO_OTHER', '六星开源商城', '2017-07-17 16:30:47', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1038', '0', 'SEO_TITLE', '六星开源商城', '2017-07-17 16:30:49', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1039', '0', 'SEO_META', '六星开源商城', '2017-07-17 16:30:49', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1040', '0', 'SEO_DESC', '六星开源商城', '2017-07-17 16:30:49', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1041', '0', 'SEO_OTHER', '六星开源商城', '2017-07-17 16:30:49', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1042', '0', 'SEO_TITLE', '六星开源商城', '2017-07-17 16:30:50', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1043', '0', 'SEO_META', '六星开源商城', '2017-07-17 16:30:50', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1044', '0', 'SEO_DESC', '六星开源商城', '2017-07-17 16:30:50', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1045', '0', 'SEO_OTHER', '六星开源商城', '2017-07-17 16:30:50', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1046', '0', 'SEO_TITLE', '六星开源商城', '2017-07-17 16:43:19', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1047', '0', 'SEO_META', '六星开源商城', '2017-07-17 16:43:20', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1048', '0', 'SEO_DESC', '六星开源商城', '2017-07-17 16:43:20', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1049', '0', 'SEO_OTHER', '六星开源商城', '2017-07-17 16:43:20', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1050', '0', 'SEO_TITLE', '六星开源商城', '2017-07-17 16:43:21', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1051', '0', 'SEO_META', '六星开源商城', '2017-07-17 16:43:21', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1052', '0', 'SEO_DESC', '六星开源商城', '2017-07-17 16:43:21', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1053', '0', 'SEO_OTHER', '六星开源商城', '2017-07-17 16:43:21', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1054', '0', 'SEO_TITLE', '六星开源商城', '2017-07-17 16:43:23', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1055', '0', 'SEO_META', '六星开源商城', '2017-07-17 16:43:23', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1056', '0', 'SEO_DESC', '六星开源商城', '2017-07-17 16:43:23', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1057', '0', 'SEO_OTHER', '六星开源商城', '2017-07-17 16:43:23', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1058', '0', 'SEO_TITLE', '六星开源商城', '2017-07-17 17:39:45', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1059', '0', 'SEO_META', '六星开源商城', '2017-07-17 17:39:45', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1060', '0', 'SEO_DESC', '六星开源商城', '2017-07-17 17:39:45', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1061', '0', 'SEO_OTHER', '六星开源商城', '2017-07-17 17:39:45', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1062', '0', 'SEO_TITLE', '六星开源商城', '2017-07-17 17:39:46', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1063', '0', 'SEO_META', '六星开源商城', '2017-07-17 17:39:46', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1064', '0', 'SEO_DESC', '六星开源商城', '2017-07-17 17:39:46', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1065', '0', 'SEO_OTHER', '六星开源商城', '2017-07-17 17:39:47', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1066', '0', 'SEO_TITLE', '六星开源商城', '2017-07-17 17:39:48', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1067', '0', 'SEO_META', '六星开源商城', '2017-07-17 17:39:48', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1068', '0', 'SEO_DESC', '六星开源商城', '2017-07-17 17:39:48', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1069', '0', 'SEO_OTHER', '六星开源商城', '2017-07-17 17:39:48', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1070', '0', 'SEO_TITLE', '六星开源商城', '2017-07-17 17:39:50', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1071', '0', 'SEO_META', '六星开源商城', '2017-07-17 17:39:50', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1072', '0', 'SEO_DESC', '六星开源商城', '2017-07-17 17:39:50', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1073', '0', 'SEO_OTHER', '六星开源商城', '2017-07-17 17:39:50', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1074', '0', 'SEO_TITLE', '六星开源商城', '2017-07-17 17:39:04', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1075', '0', 'SEO_META', '六星开源商城', '2017-07-17 17:39:04', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1076', '0', 'SEO_DESC', '六星开源商城', '2017-07-17 17:39:04', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1077', '0', 'SEO_OTHER', '六星开源商城', '2017-07-17 17:39:04', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1078', '0', 'SEO_TITLE', '六星开源商城', '2017-07-17 17:39:11', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1079', '0', 'SEO_META', '六星开源商城', '2017-07-17 17:39:11', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1080', '0', 'SEO_DESC', '六星开源商城', '2017-07-17 17:39:11', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1081', '0', 'SEO_OTHER', '六星开源商城', '2017-07-17 17:39:11', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1082', '0', 'SEO_TITLE', '六星开源商城', '2017-07-17 17:41:32', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1083', '0', 'SEO_META', '六星开源商城', '2017-07-17 17:41:32', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1084', '0', 'SEO_DESC', '六星开源商城', '2017-07-17 17:41:32', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1085', '0', 'SEO_OTHER', '六星开源商城', '2017-07-17 17:41:33', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1086', '0', 'SEO_TITLE', '六星开源商城', '2017-07-17 17:41:34', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1087', '0', 'SEO_META', '六星开源商城', '2017-07-17 17:41:34', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1088', '0', 'SEO_DESC', '六星开源商城', '2017-07-17 17:41:34', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1089', '0', 'SEO_OTHER', '六星开源商城', '2017-07-17 17:41:34', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1090', '0', 'SEO_TITLE', '六星开源商城', '2017-07-17 17:41:35', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1091', '0', 'SEO_META', '六星开源商城', '2017-07-17 17:41:35', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1092', '0', 'SEO_DESC', '六星开源商城', '2017-07-17 17:41:35', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1093', '0', 'SEO_OTHER', '六星开源商城', '2017-07-17 17:41:35', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1094', '0', 'SEO_TITLE', '六星开源商城', '2017-07-17 17:41:37', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1095', '0', 'SEO_META', '六星开源商城', '2017-07-17 17:41:37', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1096', '0', 'SEO_DESC', '六星开源商城', '2017-07-17 17:41:37', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1097', '0', 'SEO_OTHER', '六星开源商城', '2017-07-17 17:41:37', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1098', '0', 'SEO_TITLE', '六星开源商城', '2017-07-17 18:34:49', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1099', '0', 'SEO_META', '六星开源商城', '2017-07-17 18:34:49', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1100', '0', 'SEO_DESC', '六星开源商城', '2017-07-17 18:34:49', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1101', '0', 'SEO_OTHER', '六星开源商城', '2017-07-17 18:34:49', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1102', '0', 'SEO_TITLE', '六星开源商城', '2017-07-17 18:34:50', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1103', '0', 'SEO_META', '六星开源商城', '2017-07-17 18:34:50', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1104', '0', 'SEO_DESC', '六星开源商城', '2017-07-17 18:34:50', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1105', '0', 'SEO_OTHER', '六星开源商城', '2017-07-17 18:34:50', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1106', '0', 'SEO_TITLE', '六星开源商城', '2017-07-17 19:46:11', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1107', '0', 'SEO_META', '六星开源商城', '2017-07-17 19:46:11', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1108', '0', 'SEO_DESC', '六星开源商城', '2017-07-17 19:46:11', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1109', '0', 'SEO_OTHER', '六星开源商城', '2017-07-17 19:46:11', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1110', '0', 'SEO_TITLE', '六星开源商城', '2017-07-17 19:46:12', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1111', '0', 'SEO_META', '六星开源商城', '2017-07-17 19:46:12', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1112', '0', 'SEO_DESC', '六星开源商城', '2017-07-17 19:46:12', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1113', '0', 'SEO_OTHER', '六星开源商城', '2017-07-17 19:46:12', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1114', '0', 'SEO_TITLE', '六星开源商城', '2017-07-17 19:46:14', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1115', '0', 'SEO_META', '六星开源商城', '2017-07-17 19:46:14', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1116', '0', 'SEO_DESC', '六星开源商城', '2017-07-17 19:46:14', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1117', '0', 'SEO_OTHER', '六星开源商城', '2017-07-17 19:46:14', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1118', '0', 'SEO_TITLE', '六星开源商城', '2017-07-17 19:46:15', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1119', '0', 'SEO_META', '六星开源商城', '2017-07-17 19:46:15', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1120', '0', 'SEO_DESC', '六星开源商城', '2017-07-17 19:46:15', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1121', '0', 'SEO_OTHER', '六星开源商城', '2017-07-17 19:46:15', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1122', '0', 'SEO_TITLE', '六星开源商城', '2017-07-18 09:12:17', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1123', '0', 'SEO_META', '六星开源商城', '2017-07-18 09:12:17', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1124', '0', 'SEO_DESC', '六星开源商城', '2017-07-18 09:12:17', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1125', '0', 'SEO_OTHER', '六星开源商城', '2017-07-18 09:12:17', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1126', '0', 'SEO_TITLE', '六星开源商城', '2017-07-18 09:12:23', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1127', '0', 'SEO_META', '六星开源商城', '2017-07-18 09:12:23', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1128', '0', 'SEO_DESC', '六星开源商城', '2017-07-18 09:12:23', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1129', '0', 'SEO_OTHER', '六星开源商城', '2017-07-18 09:12:23', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1130', '0', 'SEO_TITLE', '六星开源商城', '2017-07-18 09:12:25', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1131', '0', 'SEO_META', '六星开源商城', '2017-07-18 09:12:25', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1132', '0', 'SEO_DESC', '六星开源商城', '2017-07-18 09:12:25', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1133', '0', 'SEO_OTHER', '六星开源商城', '2017-07-18 09:12:25', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1134', '0', 'SEO_TITLE', '六星开源商城', '2017-07-18 09:12:28', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1135', '0', 'SEO_META', '六星开源商城', '2017-07-18 09:12:28', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1136', '0', 'SEO_DESC', '六星开源商城', '2017-07-18 09:12:28', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1137', '0', 'SEO_OTHER', '六星开源商城', '2017-07-18 09:12:28', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1138', '0', 'SEO_TITLE', '六星开源商城', '2017-07-18 09:12:29', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1139', '0', 'SEO_META', '六星开源商城', '2017-07-18 09:12:29', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1140', '0', 'SEO_DESC', '六星开源商城', '2017-07-18 09:12:29', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1141', '0', 'SEO_OTHER', '六星开源商城', '2017-07-18 09:12:29', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1142', '0', 'SEO_TITLE', '六星开源商城', '2017-07-18 09:12:31', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1143', '0', 'SEO_META', '六星开源商城', '2017-07-18 09:12:31', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1144', '0', 'SEO_DESC', '六星开源商城', '2017-07-18 09:12:31', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1145', '0', 'SEO_OTHER', '六星开源商城', '2017-07-18 09:12:31', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1146', '0', 'SEO_TITLE', '六星开源商城', '2017-07-18 09:12:32', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1147', '0', 'SEO_META', '六星开源商城', '2017-07-18 09:12:33', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1148', '0', 'SEO_DESC', '六星开源商城', '2017-07-18 09:12:33', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1149', '0', 'SEO_OTHER', '六星开源商城', '2017-07-18 09:12:33', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1150', '0', 'SEO_TITLE', '六星开源商城', '2017-07-18 09:16:21', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1151', '0', 'SEO_META', '六星开源商城', '2017-07-18 09:16:21', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1152', '0', 'SEO_DESC', '六星开源商城', '2017-07-18 09:16:21', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1153', '0', 'SEO_OTHER', '六星开源商城', '2017-07-18 09:16:21', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1154', '0', 'SEO_TITLE', '六星开源商城', '2017-07-18 09:14:15', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1155', '0', 'SEO_META', '六星开源商城', '2017-07-18 09:14:15', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1156', '0', 'SEO_DESC', '六星开源商城', '2017-07-18 09:14:15', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1157', '0', 'SEO_OTHER', '六星开源商城', '2017-07-18 09:14:15', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1158', '0', 'SEO_TITLE', '六星开源商城', '2017-07-18 09:16:23', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1159', '0', 'SEO_META', '六星开源商城', '2017-07-18 09:16:23', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1160', '0', 'SEO_DESC', '六星开源商城', '2017-07-18 09:16:23', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1161', '0', 'SEO_OTHER', '六星开源商城', '2017-07-18 09:16:23', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1162', '0', 'SEO_TITLE', '六星开源商城', '2017-07-18 09:16:25', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1163', '0', 'SEO_META', '六星开源商城', '2017-07-18 09:16:25', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1164', '0', 'SEO_DESC', '六星开源商城', '2017-07-18 09:16:25', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1165', '0', 'SEO_OTHER', '六星开源商城', '2017-07-18 09:16:25', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1166', '0', 'SEO_TITLE', '六星开源商城', '2017-07-18 09:16:27', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1167', '0', 'SEO_META', '六星开源商城', '2017-07-18 09:16:27', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1168', '0', 'SEO_DESC', '六星开源商城', '2017-07-18 09:16:27', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1169', '0', 'SEO_OTHER', '六星开源商城', '2017-07-18 09:16:27', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1170', '0', 'SEO_TITLE', '六星开源商城', '2017-07-20 08:58:44', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1171', '0', 'SEO_META', '六星开源商城', '2017-07-20 08:58:44', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1172', '0', 'SEO_DESC', '六星开源商城', '2017-07-20 08:58:44', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1173', '0', 'SEO_OTHER', '六星开源商城', '2017-07-20 08:58:44', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1174', '0', 'SEO_TITLE', '六星开源商城', '2017-07-20 08:58:48', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1175', '0', 'SEO_META', '六星开源商城', '2017-07-20 08:58:48', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1176', '0', 'SEO_DESC', '六星开源商城', '2017-07-20 08:58:48', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1177', '0', 'SEO_OTHER', '六星开源商城', '2017-07-20 08:58:48', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1178', '0', 'SEO_TITLE', '六星开源商城', '2017-07-20 08:58:50', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1179', '0', 'SEO_META', '六星开源商城', '2017-07-20 08:58:50', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1180', '0', 'SEO_DESC', '六星开源商城', '2017-07-20 08:58:50', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1181', '0', 'SEO_OTHER', '六星开源商城', '2017-07-20 08:58:50', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1182', '0', 'SEO_TITLE', '六星开源商城', '2017-07-20 08:58:51', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1183', '0', 'SEO_META', '六星开源商城', '2017-07-20 08:58:51', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1184', '0', 'SEO_DESC', '六星开源商城', '2017-07-20 08:58:51', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1185', '0', 'SEO_OTHER', '六星开源商城', '2017-07-20 08:58:51', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1186', '0', 'SEO_TITLE', '六星开源商城', '2017-07-20 08:59:33', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1187', '0', 'SEO_META', '六星开源商城', '2017-07-20 08:59:34', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1188', '0', 'SEO_DESC', '六星开源商城', '2017-07-20 08:59:34', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1189', '0', 'SEO_OTHER', '六星开源商城', '2017-07-20 08:59:34', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1190', '0', 'SEO_TITLE', '六星开源商城', '2017-07-20 08:59:37', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1191', '0', 'SEO_META', '六星开源商城', '2017-07-20 08:59:37', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1192', '0', 'SEO_DESC', '六星开源商城', '2017-07-20 08:59:38', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1193', '0', 'SEO_OTHER', '六星开源商城', '2017-07-20 08:59:38', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1194', '1', 'REGISTER_INTEGRAL', '', '2017-07-20 10:15:47', '0000-00-00 00:00:00', '注册送积分', '1');
INSERT INTO `tp_config` VALUES ('1195', '1', 'SIGN_INTEGRAL', '', '2017-07-20 10:15:47', '0000-00-00 00:00:00', '签到送积分', '1');
INSERT INTO `tp_config` VALUES ('1196', '1', 'SHARE_INTEGRAL', '', '2017-07-20 10:15:47', '0000-00-00 00:00:00', '分享送积分', '1');
INSERT INTO `tp_config` VALUES ('1197', '1', 'WITHDRAW_BALANCE', '{\"withdraw_cash_min\":0,\"withdraw_multiple\":0,\"withdraw_poundage\":0,\"withdraw_message\":\"\"}', '2017-07-20 10:16:03', '0000-00-00 00:00:00', '会员余额提现设置', '0');
INSERT INTO `tp_config` VALUES ('1198', '0', 'SEO_TITLE', '六星开源商城', '2017-07-20 11:57:33', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1199', '0', 'SEO_META', '六星开源商城', '2017-07-20 11:57:33', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1200', '0', 'SEO_DESC', '六星开源商城', '2017-07-20 11:57:33', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1201', '0', 'SEO_OTHER', '六星开源商城', '2017-07-20 11:57:33', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1202', '0', 'SEO_TITLE', '六星开源商城', '2017-07-20 11:57:34', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1203', '0', 'SEO_META', '六星开源商城', '2017-07-20 11:57:34', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1204', '0', 'SEO_DESC', '六星开源商城', '2017-07-20 11:57:34', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1205', '0', 'SEO_OTHER', '六星开源商城', '2017-07-20 11:57:34', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1206', '0', 'SEO_TITLE', '六星开源商城', '2017-07-20 11:57:35', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1207', '0', 'SEO_META', '六星开源商城', '2017-07-20 11:57:35', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1208', '0', 'SEO_DESC', '六星开源商城', '2017-07-20 11:57:35', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1209', '0', 'SEO_OTHER', '六星开源商城', '2017-07-20 11:57:35', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1210', '0', 'SEO_TITLE', '六星开源商城', '2017-07-20 11:57:37', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1211', '0', 'SEO_META', '六星开源商城', '2017-07-20 11:57:37', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1212', '0', 'SEO_DESC', '六星开源商城', '2017-07-20 11:57:37', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1213', '0', 'SEO_OTHER', '六星开源商城', '2017-07-20 11:57:37', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1214', '0', 'SEO_TITLE', '六星开源商城', '2017-07-20 12:17:15', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1215', '0', 'SEO_META', '六星开源商城', '2017-07-20 12:17:15', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1216', '0', 'SEO_DESC', '六星开源商城', '2017-07-20 12:17:15', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1217', '0', 'SEO_OTHER', '六星开源商城', '2017-07-20 12:17:15', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1218', '0', 'SEO_TITLE', '六星开源商城', '2017-07-20 12:17:16', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1219', '0', 'SEO_META', '六星开源商城', '2017-07-20 12:17:17', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1220', '0', 'SEO_DESC', '六星开源商城', '2017-07-20 12:17:17', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1221', '0', 'SEO_OTHER', '六星开源商城', '2017-07-20 12:17:17', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1222', '0', 'SEO_TITLE', '六星开源商城', '2017-07-20 12:17:19', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1223', '0', 'SEO_META', '六星开源商城', '2017-07-20 12:17:19', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1224', '0', 'SEO_DESC', '六星开源商城', '2017-07-20 12:17:19', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1225', '0', 'SEO_OTHER', '六星开源商城', '2017-07-20 12:17:19', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1226', '0', 'SEO_TITLE', '六星开源商城', '2017-07-20 12:20:27', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1227', '0', 'SEO_META', '六星开源商城', '2017-07-20 12:20:27', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1228', '0', 'SEO_DESC', '六星开源商城', '2017-07-20 12:20:27', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1229', '0', 'SEO_OTHER', '六星开源商城', '2017-07-20 12:20:27', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1230', '0', 'SEO_TITLE', '六星开源商城', '2017-07-20 12:20:28', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1231', '0', 'SEO_META', '六星开源商城', '2017-07-20 12:20:28', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1232', '0', 'SEO_DESC', '六星开源商城', '2017-07-20 12:20:28', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1233', '0', 'SEO_OTHER', '六星开源商城', '2017-07-20 12:20:28', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1234', '0', 'SEO_TITLE', '六星开源商城', '2017-07-20 12:20:30', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1235', '0', 'SEO_META', '六星开源商城', '2017-07-20 12:20:30', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1236', '0', 'SEO_DESC', '六星开源商城', '2017-07-20 12:20:30', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1237', '0', 'SEO_OTHER', '六星开源商城', '2017-07-20 12:20:31', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1238', '0', 'SEO_TITLE', '六星开源商城', '2017-07-20 12:20:32', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1239', '0', 'SEO_META', '六星开源商城', '2017-07-20 12:20:32', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1240', '0', 'SEO_DESC', '六星开源商城', '2017-07-20 12:20:32', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1241', '0', 'SEO_OTHER', '六星开源商城', '2017-07-20 12:20:32', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1242', '0', 'SEO_TITLE', '六星开源商城', '2017-07-20 16:19:14', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1243', '0', 'SEO_META', '六星开源商城', '2017-07-20 16:19:14', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1244', '0', 'SEO_DESC', '六星开源商城', '2017-07-20 16:19:14', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1245', '0', 'SEO_OTHER', '六星开源商城', '2017-07-20 16:19:15', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1246', '0', 'SEO_TITLE', '六星开源商城', '2017-07-20 16:19:18', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1247', '0', 'SEO_META', '六星开源商城', '2017-07-20 16:19:18', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1248', '0', 'SEO_DESC', '六星开源商城', '2017-07-20 16:19:18', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1249', '0', 'SEO_OTHER', '六星开源商城', '2017-07-20 16:19:18', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1250', '0', 'SEO_TITLE', '六星开源商城', '2017-07-20 16:23:40', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1251', '0', 'SEO_META', '六星开源商城', '2017-07-20 16:23:40', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1252', '0', 'SEO_DESC', '六星开源商城', '2017-07-20 16:23:40', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1253', '0', 'SEO_OTHER', '六星开源商城', '2017-07-20 16:23:40', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1254', '0', 'SEO_TITLE', '六星开源商城', '2017-07-20 16:23:43', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1255', '0', 'SEO_META', '六星开源商城', '2017-07-20 16:23:43', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1256', '0', 'SEO_DESC', '六星开源商城', '2017-07-20 16:23:43', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1257', '0', 'SEO_OTHER', '六星开源商城', '2017-07-20 16:23:43', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1258', '0', 'SEO_TITLE', '六星开源商城', '2017-07-20 16:23:46', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1259', '0', 'SEO_META', '六星开源商城', '2017-07-20 16:23:47', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1260', '0', 'SEO_DESC', '六星开源商城', '2017-07-20 16:23:47', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1261', '0', 'SEO_OTHER', '六星开源商城', '2017-07-20 16:23:47', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1262', '0', 'SEO_TITLE', '六星开源商城', '2017-07-20 16:26:00', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1263', '0', 'SEO_META', '六星开源商城', '2017-07-20 16:26:00', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1264', '0', 'SEO_DESC', '六星开源商城', '2017-07-20 16:26:00', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1265', '0', 'SEO_OTHER', '六星开源商城', '2017-07-20 16:26:00', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1266', '0', 'SEO_TITLE', '六星开源商城', '2017-07-20 16:26:58', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1267', '0', 'SEO_META', '六星开源商城', '2017-07-20 16:26:58', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1268', '0', 'SEO_DESC', '六星开源商城', '2017-07-20 16:26:58', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1269', '0', 'SEO_OTHER', '六星开源商城', '2017-07-20 16:26:58', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1270', '0', 'SEO_TITLE', '六星开源商城', '2017-07-20 16:27:02', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1271', '0', 'SEO_META', '六星开源商城', '2017-07-20 16:27:02', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1272', '0', 'SEO_DESC', '六星开源商城', '2017-07-20 16:27:02', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1273', '0', 'SEO_OTHER', '六星开源商城', '2017-07-20 16:27:02', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1274', '0', 'SEO_TITLE', '六星开源商城', '2017-07-20 16:27:03', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1275', '0', 'SEO_META', '六星开源商城', '2017-07-20 16:27:03', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1276', '0', 'SEO_DESC', '六星开源商城', '2017-07-20 16:27:03', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1277', '0', 'SEO_OTHER', '六星开源商城', '2017-07-20 16:27:04', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1278', '0', 'SEO_TITLE', '六星开源商城', '2017-07-20 18:34:14', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1279', '0', 'SEO_META', '六星开源商城', '2017-07-20 18:34:14', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1280', '0', 'SEO_DESC', '六星开源商城', '2017-07-20 18:34:14', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1281', '0', 'SEO_OTHER', '六星开源商城', '2017-07-20 18:34:14', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1282', '42', 'SEO_TITLE', '', '2017-07-20 18:50:47', '0000-00-00 00:00:00', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1283', '42', 'SEO_META', '', '2017-07-20 18:50:47', '0000-00-00 00:00:00', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1284', '42', 'SEO_DESC', '', '2017-07-20 18:50:47', '0000-00-00 00:00:00', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1285', '42', 'SEO_OTHER', '', '2017-07-20 18:50:47', '0000-00-00 00:00:00', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1286', '0', 'SEO_TITLE', '六星开源商城', '2017-07-21 09:33:55', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1287', '0', 'SEO_META', '六星开源商城', '2017-07-21 09:33:55', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1288', '0', 'SEO_DESC', '六星开源商城', '2017-07-21 09:33:55', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1289', '0', 'SEO_OTHER', '六星开源商城', '2017-07-21 09:33:55', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1290', '0', 'SEO_TITLE', '六星开源商城', '2017-07-21 09:33:59', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1291', '0', 'SEO_META', '六星开源商城', '2017-07-21 09:33:59', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1292', '0', 'SEO_DESC', '六星开源商城', '2017-07-21 09:33:59', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1293', '0', 'SEO_OTHER', '六星开源商城', '2017-07-21 09:33:59', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1294', '0', 'SEO_TITLE', '六星开源商城', '2017-07-21 09:34:09', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1295', '0', 'SEO_META', '六星开源商城', '2017-07-21 09:34:09', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1296', '0', 'SEO_DESC', '六星开源商城', '2017-07-21 09:34:09', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1297', '0', 'SEO_OTHER', '六星开源商城', '2017-07-21 09:34:09', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1298', '0', 'SEO_TITLE', '六星开源商城', '2017-07-21 09:36:40', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1299', '0', 'SEO_META', '六星开源商城', '2017-07-21 09:36:40', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1300', '0', 'SEO_DESC', '六星开源商城', '2017-07-21 09:36:40', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1301', '0', 'SEO_OTHER', '六星开源商城', '2017-07-21 09:36:40', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1302', '0', 'SEO_TITLE', '六星开源商城', '2017-07-21 09:52:23', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1303', '0', 'SEO_META', '六星开源商城', '2017-07-21 09:52:23', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1304', '0', 'SEO_DESC', '六星开源商城', '2017-07-21 09:52:23', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1305', '0', 'SEO_OTHER', '六星开源商城', '2017-07-21 09:52:23', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1306', '0', 'SEO_TITLE', '六星开源商城', '2017-07-21 09:52:27', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1307', '0', 'SEO_META', '六星开源商城', '2017-07-21 09:52:27', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1308', '0', 'SEO_DESC', '六星开源商城', '2017-07-21 09:52:27', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1309', '0', 'SEO_OTHER', '六星开源商城', '2017-07-21 09:52:28', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1310', '0', 'SEO_TITLE', '六星开源商城', '2017-07-21 09:52:35', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1311', '0', 'SEO_META', '六星开源商城', '2017-07-21 09:52:35', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1312', '0', 'SEO_DESC', '六星开源商城', '2017-07-21 09:52:35', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1313', '0', 'SEO_OTHER', '六星开源商城', '2017-07-21 09:52:35', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1314', '0', 'SEO_TITLE', '六星开源商城', '2017-07-21 09:52:37', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1315', '0', 'SEO_META', '六星开源商城', '2017-07-21 09:52:38', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1316', '0', 'SEO_DESC', '六星开源商城', '2017-07-21 09:52:38', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1317', '0', 'SEO_OTHER', '六星开源商城', '2017-07-21 09:52:38', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1318', '0', 'SEO_TITLE', '六星开源商城', '2017-07-21 09:52:41', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1319', '0', 'SEO_META', '六星开源商城', '2017-07-21 09:52:41', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1320', '0', 'SEO_DESC', '六星开源商城', '2017-07-21 09:52:41', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1321', '0', 'SEO_OTHER', '六星开源商城', '2017-07-21 09:52:41', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1322', '0', 'SEO_TITLE', '六星开源商城', '2017-07-21 09:52:45', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1323', '0', 'SEO_META', '六星开源商城', '2017-07-21 09:52:45', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1324', '0', 'SEO_DESC', '六星开源商城', '2017-07-21 09:52:45', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1325', '0', 'SEO_OTHER', '六星开源商城', '2017-07-21 09:52:45', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1326', '0', 'SEO_TITLE', '六星开源商城', '2017-07-21 09:52:47', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1327', '0', 'SEO_META', '六星开源商城', '2017-07-21 09:52:47', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1328', '0', 'SEO_DESC', '六星开源商城', '2017-07-21 09:52:47', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1329', '0', 'SEO_OTHER', '六星开源商城', '2017-07-21 09:52:47', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1330', '0', 'SEO_TITLE', '六星开源商城', '2017-07-21 09:52:48', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1331', '0', 'SEO_META', '六星开源商城', '2017-07-21 09:52:48', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1332', '0', 'SEO_DESC', '六星开源商城', '2017-07-21 09:52:48', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1333', '0', 'SEO_OTHER', '六星开源商城', '2017-07-21 09:52:48', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1334', '0', 'SEO_TITLE', '六星开源商城', '2017-07-21 09:52:59', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1335', '0', 'SEO_META', '六星开源商城', '2017-07-21 09:52:59', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1336', '0', 'SEO_DESC', '六星开源商城', '2017-07-21 09:52:59', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1337', '0', 'SEO_OTHER', '六星开源商城', '2017-07-21 09:52:59', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1338', '0', 'SEO_TITLE', '六星开源商城', '2017-07-21 09:56:10', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1339', '0', 'SEO_META', '六星开源商城', '2017-07-21 09:56:10', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1340', '0', 'SEO_DESC', '六星开源商城', '2017-07-21 09:56:10', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1341', '0', 'SEO_OTHER', '六星开源商城', '2017-07-21 09:56:10', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1342', '0', 'SEO_TITLE', '六星开源商城', '2017-07-21 09:56:11', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1343', '0', 'SEO_META', '六星开源商城', '2017-07-21 09:56:11', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1344', '0', 'SEO_DESC', '六星开源商城', '2017-07-21 09:56:11', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1345', '0', 'SEO_OTHER', '六星开源商城', '2017-07-21 09:56:11', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1346', '0', 'SEO_TITLE', '六星开源商城', '2017-07-21 09:56:13', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1347', '0', 'SEO_META', '六星开源商城', '2017-07-21 09:56:13', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1348', '0', 'SEO_DESC', '六星开源商城', '2017-07-21 09:56:13', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1349', '0', 'SEO_OTHER', '六星开源商城', '2017-07-21 09:56:13', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1350', '0', 'SEO_TITLE', '六星开源商城', '2017-07-21 09:56:14', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1351', '0', 'SEO_META', '六星开源商城', '2017-07-21 09:56:14', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1352', '0', 'SEO_DESC', '六星开源商城', '2017-07-21 09:56:14', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1353', '0', 'SEO_OTHER', '六星开源商城', '2017-07-21 09:56:14', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1354', '0', 'SEO_TITLE', '六星开源商城', '2017-07-21 09:56:15', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1355', '0', 'SEO_META', '六星开源商城', '2017-07-21 09:56:15', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1356', '0', 'SEO_DESC', '六星开源商城', '2017-07-21 09:56:15', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1357', '0', 'SEO_OTHER', '六星开源商城', '2017-07-21 09:56:15', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1358', '0', 'SEO_TITLE', '六星开源商城', '2017-07-21 09:56:18', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1359', '0', 'SEO_META', '六星开源商城', '2017-07-21 09:56:18', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1360', '0', 'SEO_DESC', '六星开源商城', '2017-07-21 09:56:18', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1361', '0', 'SEO_OTHER', '六星开源商城', '2017-07-21 09:56:18', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1362', '0', 'SEO_TITLE', '六星开源商城', '2017-07-21 11:21:46', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1363', '0', 'SEO_META', '六星开源商城', '2017-07-21 11:21:46', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1364', '0', 'SEO_DESC', '六星开源商城', '2017-07-21 11:21:46', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1365', '0', 'SEO_OTHER', '六星开源商城', '2017-07-21 11:21:46', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1366', '0', 'SEO_TITLE', '六星开源商城', '2017-07-21 11:21:47', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1367', '0', 'SEO_META', '六星开源商城', '2017-07-21 11:21:47', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1368', '0', 'SEO_DESC', '六星开源商城', '2017-07-21 11:21:47', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1369', '0', 'SEO_OTHER', '六星开源商城', '2017-07-21 11:21:47', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1370', '0', 'SEO_TITLE', '六星开源商城', '2017-07-21 11:21:49', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1371', '0', 'SEO_META', '六星开源商城', '2017-07-21 11:21:49', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1372', '0', 'SEO_DESC', '六星开源商城', '2017-07-21 11:21:49', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1373', '0', 'SEO_OTHER', '六星开源商城', '2017-07-21 11:21:49', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1374', '0', 'SEO_TITLE', '六星开源商城', '2017-07-21 15:38:21', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1375', '0', 'SEO_META', '六星开源商城', '2017-07-21 15:38:21', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1376', '0', 'SEO_DESC', '六星开源商城', '2017-07-21 15:38:21', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1377', '0', 'SEO_OTHER', '六星开源商城', '2017-07-21 15:38:21', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1378', '0', 'SEO_TITLE', '六星开源商城', '2017-07-21 15:38:22', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1379', '0', 'SEO_META', '六星开源商城', '2017-07-21 15:38:22', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1380', '0', 'SEO_DESC', '六星开源商城', '2017-07-21 15:38:22', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1381', '0', 'SEO_OTHER', '六星开源商城', '2017-07-21 15:38:22', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1382', '0', 'SEO_TITLE', '六星开源商城', '2017-07-21 15:38:24', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1383', '0', 'SEO_META', '六星开源商城', '2017-07-21 15:38:24', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1384', '0', 'SEO_DESC', '六星开源商城', '2017-07-21 15:38:24', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1385', '0', 'SEO_OTHER', '六星开源商城', '2017-07-21 15:38:24', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1386', '0', 'SEO_TITLE', '六星开源商城', '2017-07-21 15:40:55', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1387', '0', 'SEO_META', '六星开源商城', '2017-07-21 15:40:55', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1388', '0', 'SEO_DESC', '六星开源商城', '2017-07-21 15:40:55', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1389', '0', 'SEO_OTHER', '六星开源商城', '2017-07-21 15:40:55', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1390', '0', 'SEO_TITLE', '六星开源商城', '2017-07-21 15:40:56', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1391', '0', 'SEO_META', '六星开源商城', '2017-07-21 15:40:56', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1392', '0', 'SEO_DESC', '六星开源商城', '2017-07-21 15:40:56', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1393', '0', 'SEO_OTHER', '六星开源商城', '2017-07-21 15:40:56', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1394', '0', 'SEO_TITLE', '六星开源商城', '2017-07-21 15:41:19', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1395', '0', 'SEO_META', '六星开源商城', '2017-07-21 15:41:19', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1396', '0', 'SEO_DESC', '六星开源商城', '2017-07-21 15:41:19', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1397', '0', 'SEO_OTHER', '六星开源商城', '2017-07-21 15:41:19', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1398', '0', 'SEO_TITLE', '六星开源商城', '2017-07-21 15:41:20', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1399', '0', 'SEO_META', '六星开源商城', '2017-07-21 15:41:20', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1400', '0', 'SEO_DESC', '六星开源商城', '2017-07-21 15:41:20', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1401', '0', 'SEO_OTHER', '六星开源商城', '2017-07-21 15:41:20', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1402', '0', 'SEO_TITLE', '六星开源商城', '2017-07-21 15:51:24', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1403', '0', 'SEO_META', '六星开源商城', '2017-07-21 15:51:24', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1404', '0', 'SEO_DESC', '六星开源商城', '2017-07-21 15:51:24', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1405', '0', 'SEO_OTHER', '六星开源商城', '2017-07-21 15:51:24', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1406', '0', 'SEO_TITLE', '六星开源商城', '2017-07-21 16:13:13', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1407', '0', 'SEO_META', '六星开源商城', '2017-07-21 16:13:13', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1408', '0', 'SEO_DESC', '六星开源商城', '2017-07-21 16:13:13', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1409', '0', 'SEO_OTHER', '六星开源商城', '2017-07-21 16:13:13', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1410', '0', 'SEO_TITLE', '六星开源商城', '2017-07-21 16:13:14', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1411', '0', 'SEO_META', '六星开源商城', '2017-07-21 16:13:14', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1412', '0', 'SEO_DESC', '六星开源商城', '2017-07-21 16:13:14', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1413', '0', 'SEO_OTHER', '六星开源商城', '2017-07-21 16:13:14', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1414', '0', 'SEO_TITLE', '六星开源商城', '2017-07-21 16:13:15', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1415', '0', 'SEO_META', '六星开源商城', '2017-07-21 16:13:15', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1416', '0', 'SEO_DESC', '六星开源商城', '2017-07-21 16:13:15', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1417', '0', 'SEO_OTHER', '六星开源商城', '2017-07-21 16:13:15', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1418', '0', 'SEO_TITLE', '六星开源商城', '2017-07-21 16:13:17', '2017-07-21 17:46:22', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1419', '0', 'SEO_META', '六星开源商城', '2017-07-21 16:13:17', '2017-07-21 17:46:22', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1420', '0', 'SEO_DESC', '六星开源商城', '2017-07-21 16:13:17', '2017-07-21 17:46:23', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1421', '0', 'SEO_OTHER', '六星开源商城', '2017-07-21 16:13:17', '2017-07-21 17:46:23', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1422', '0', 'SEO_TITLE', '', '2017-08-26 17:03:44', '0000-00-00 00:00:00', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1423', '0', 'SEO_META', '', '2017-08-26 17:03:44', '0000-00-00 00:00:00', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1424', '0', 'SEO_DESC', '', '2017-08-26 17:03:44', '0000-00-00 00:00:00', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1425', '0', 'SEO_OTHER', '', '2017-08-26 17:03:44', '0000-00-00 00:00:00', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1426', '0', 'OPERATE_CONFIG', '{\"is_discount_open\":0,\"is_discount_toExamine\":0,\"is_mansong_open\":0,\"is_mansong_toExamine\":0,\"is_groups_open\":0,\"is_groups_toExamine\":0,\"is_pickuPpoint_open\":0}', '2017-08-26 17:03:46', '0000-00-00 00:00:00', '运营配置信息', '1');
INSERT INTO `tp_config` VALUES ('1427', '0', 'SEO_TITLE', '', '2017-08-26 17:04:09', '0000-00-00 00:00:00', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1428', '0', 'SEO_META', '', '2017-08-26 17:04:09', '0000-00-00 00:00:00', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1429', '0', 'SEO_DESC', '', '2017-08-26 17:04:09', '0000-00-00 00:00:00', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1430', '0', 'SEO_OTHER', '', '2017-08-26 17:04:09', '0000-00-00 00:00:00', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1431', '0', 'SEO_TITLE', '', '2017-08-26 17:04:13', '0000-00-00 00:00:00', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1432', '0', 'SEO_META', '', '2017-08-26 17:04:13', '0000-00-00 00:00:00', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1433', '0', 'SEO_DESC', '', '2017-08-26 17:04:13', '0000-00-00 00:00:00', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1434', '0', 'SEO_OTHER', '', '2017-08-26 17:04:13', '0000-00-00 00:00:00', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1435', '0', 'SEO_TITLE', '', '2017-08-26 19:52:47', '0000-00-00 00:00:00', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1436', '0', 'SEO_META', '', '2017-08-26 19:52:47', '0000-00-00 00:00:00', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1437', '0', 'SEO_DESC', '', '2017-08-26 19:52:47', '0000-00-00 00:00:00', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1438', '0', 'SEO_OTHER', '', '2017-08-26 19:52:47', '0000-00-00 00:00:00', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1439', '0', 'SEO_TITLE', '', '2017-08-30 20:19:46', '0000-00-00 00:00:00', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1440', '0', 'SEO_META', '', '2017-08-30 20:19:46', '0000-00-00 00:00:00', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1441', '0', 'SEO_DESC', '', '2017-08-30 20:19:46', '0000-00-00 00:00:00', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1442', '0', 'SEO_OTHER', '', '2017-08-30 20:19:46', '0000-00-00 00:00:00', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1443', '0', 'SEO_TITLE', '', '2017-08-30 20:25:09', '0000-00-00 00:00:00', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1444', '0', 'SEO_META', '', '2017-08-30 20:25:09', '0000-00-00 00:00:00', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1445', '0', 'SEO_DESC', '', '2017-08-30 20:25:09', '0000-00-00 00:00:00', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1446', '0', 'SEO_OTHER', '', '2017-08-30 20:25:09', '0000-00-00 00:00:00', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1447', '0', 'SEO_TITLE', '', '2017-08-31 19:36:18', '0000-00-00 00:00:00', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1448', '0', 'SEO_META', '', '2017-08-31 19:36:18', '0000-00-00 00:00:00', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1449', '0', 'SEO_DESC', '', '2017-08-31 19:36:18', '0000-00-00 00:00:00', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1450', '0', 'SEO_OTHER', '', '2017-08-31 19:36:18', '0000-00-00 00:00:00', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1451', '0', 'SEO_TITLE', '', '2017-09-23 14:32:10', '0000-00-00 00:00:00', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1452', '0', 'SEO_META', '', '2017-09-23 14:32:10', '0000-00-00 00:00:00', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1453', '0', 'SEO_DESC', '', '2017-09-23 14:32:10', '0000-00-00 00:00:00', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1454', '0', 'SEO_OTHER', '', '2017-09-23 14:32:10', '0000-00-00 00:00:00', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1455', '0', 'SEO_TITLE', '', '2017-09-23 14:33:44', '0000-00-00 00:00:00', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1456', '0', 'SEO_META', '', '2017-09-23 14:33:44', '0000-00-00 00:00:00', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1457', '0', 'SEO_DESC', '', '2017-09-23 14:33:44', '0000-00-00 00:00:00', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1458', '0', 'SEO_OTHER', '', '2017-09-23 14:33:44', '0000-00-00 00:00:00', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1459', '0', 'SEO_TITLE', '', '2017-09-23 14:34:26', '0000-00-00 00:00:00', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1460', '0', 'SEO_META', '', '2017-09-23 14:34:26', '0000-00-00 00:00:00', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1461', '0', 'SEO_DESC', '', '2017-09-23 14:34:26', '0000-00-00 00:00:00', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1462', '0', 'SEO_OTHER', '', '2017-09-23 14:34:26', '0000-00-00 00:00:00', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1463', '0', 'SEO_TITLE', '', '2017-09-23 14:43:13', '0000-00-00 00:00:00', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1464', '0', 'SEO_META', '', '2017-09-23 14:43:13', '0000-00-00 00:00:00', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1465', '0', 'SEO_DESC', '', '2017-09-23 14:43:13', '0000-00-00 00:00:00', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1466', '0', 'SEO_OTHER', '', '2017-09-23 14:43:13', '0000-00-00 00:00:00', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1467', '0', 'SEO_TITLE', '', '2017-09-23 14:43:46', '0000-00-00 00:00:00', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1468', '0', 'SEO_META', '', '2017-09-23 14:43:46', '0000-00-00 00:00:00', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1469', '0', 'SEO_DESC', '', '2017-09-23 14:43:46', '0000-00-00 00:00:00', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1470', '0', 'SEO_OTHER', '', '2017-09-23 14:43:46', '0000-00-00 00:00:00', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1471', '0', 'SEO_TITLE', '', '2017-09-23 14:44:30', '0000-00-00 00:00:00', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1472', '0', 'SEO_META', '', '2017-09-23 14:44:30', '0000-00-00 00:00:00', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1473', '0', 'SEO_DESC', '', '2017-09-23 14:44:30', '0000-00-00 00:00:00', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1474', '0', 'SEO_OTHER', '', '2017-09-23 14:44:30', '0000-00-00 00:00:00', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1475', '0', 'SEO_TITLE', '', '2017-09-23 14:45:06', '0000-00-00 00:00:00', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1476', '0', 'SEO_META', '', '2017-09-23 14:45:06', '0000-00-00 00:00:00', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1477', '0', 'SEO_DESC', '', '2017-09-23 14:45:06', '0000-00-00 00:00:00', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1478', '0', 'SEO_OTHER', '', '2017-09-23 14:45:06', '0000-00-00 00:00:00', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1479', '0', 'SEO_TITLE', '', '2017-09-23 15:31:04', '0000-00-00 00:00:00', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1480', '0', 'SEO_META', '', '2017-09-23 15:31:04', '0000-00-00 00:00:00', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1481', '0', 'SEO_DESC', '', '2017-09-23 15:31:04', '0000-00-00 00:00:00', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1482', '0', 'SEO_OTHER', '', '2017-09-23 15:31:04', '0000-00-00 00:00:00', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1483', '0', 'SEO_TITLE', '', '2017-09-23 15:32:23', '0000-00-00 00:00:00', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1484', '0', 'SEO_META', '', '2017-09-23 15:32:23', '0000-00-00 00:00:00', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1485', '0', 'SEO_DESC', '', '2017-09-23 15:32:23', '0000-00-00 00:00:00', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1486', '0', 'SEO_OTHER', '', '2017-09-23 15:32:23', '0000-00-00 00:00:00', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1487', '0', 'SEO_TITLE', '', '2017-09-23 15:33:14', '0000-00-00 00:00:00', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1488', '0', 'SEO_META', '', '2017-09-23 15:33:14', '0000-00-00 00:00:00', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1489', '0', 'SEO_DESC', '', '2017-09-23 15:33:14', '0000-00-00 00:00:00', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1490', '0', 'SEO_OTHER', '', '2017-09-23 15:33:14', '0000-00-00 00:00:00', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1491', '0', 'SEO_TITLE', '', '2017-09-23 15:35:01', '0000-00-00 00:00:00', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1492', '0', 'SEO_META', '', '2017-09-23 15:35:01', '0000-00-00 00:00:00', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1493', '0', 'SEO_DESC', '', '2017-09-23 15:35:01', '0000-00-00 00:00:00', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1494', '0', 'SEO_OTHER', '', '2017-09-23 15:35:01', '0000-00-00 00:00:00', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1495', '0', 'SEO_TITLE', '', '2017-09-23 15:35:19', '0000-00-00 00:00:00', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1496', '0', 'SEO_META', '', '2017-09-23 15:35:19', '0000-00-00 00:00:00', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1497', '0', 'SEO_DESC', '', '2017-09-23 15:35:19', '0000-00-00 00:00:00', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1498', '0', 'SEO_OTHER', '', '2017-09-23 15:35:19', '0000-00-00 00:00:00', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1499', '0', 'SEO_TITLE', '', '2017-09-23 15:35:22', '0000-00-00 00:00:00', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1500', '0', 'SEO_META', '', '2017-09-23 15:35:22', '0000-00-00 00:00:00', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1501', '0', 'SEO_DESC', '', '2017-09-23 15:35:22', '0000-00-00 00:00:00', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1502', '0', 'SEO_OTHER', '', '2017-09-23 15:35:22', '0000-00-00 00:00:00', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1503', '0', 'SEO_TITLE', '', '2017-09-23 15:35:25', '0000-00-00 00:00:00', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1504', '0', 'SEO_META', '', '2017-09-23 15:35:25', '0000-00-00 00:00:00', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1505', '0', 'SEO_DESC', '', '2017-09-23 15:35:25', '0000-00-00 00:00:00', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1506', '0', 'SEO_OTHER', '', '2017-09-23 15:35:25', '0000-00-00 00:00:00', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1507', '0', 'SEO_TITLE', '', '2017-09-23 15:35:27', '0000-00-00 00:00:00', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1508', '0', 'SEO_META', '', '2017-09-23 15:35:27', '0000-00-00 00:00:00', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1509', '0', 'SEO_DESC', '', '2017-09-23 15:35:27', '0000-00-00 00:00:00', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1510', '0', 'SEO_OTHER', '', '2017-09-23 15:35:27', '0000-00-00 00:00:00', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1511', '0', 'SEO_TITLE', '', '2017-09-23 15:35:31', '0000-00-00 00:00:00', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1512', '0', 'SEO_META', '', '2017-09-23 15:35:31', '0000-00-00 00:00:00', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1513', '0', 'SEO_DESC', '', '2017-09-23 15:35:31', '0000-00-00 00:00:00', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1514', '0', 'SEO_OTHER', '', '2017-09-23 15:35:31', '0000-00-00 00:00:00', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1515', '0', 'SEO_TITLE', '', '2017-09-23 15:35:33', '0000-00-00 00:00:00', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1516', '0', 'SEO_META', '', '2017-09-23 15:35:33', '0000-00-00 00:00:00', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1517', '0', 'SEO_DESC', '', '2017-09-23 15:35:33', '0000-00-00 00:00:00', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1518', '0', 'SEO_OTHER', '', '2017-09-23 15:35:33', '0000-00-00 00:00:00', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1519', '0', 'SEO_TITLE', '', '2018-06-19 17:09:12', '0000-00-00 00:00:00', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1520', '0', 'SEO_META', '', '2018-06-19 17:09:12', '0000-00-00 00:00:00', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1521', '0', 'SEO_DESC', '', '2018-06-19 17:09:12', '0000-00-00 00:00:00', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1522', '0', 'SEO_OTHER', '', '2018-06-19 17:09:12', '0000-00-00 00:00:00', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1523', '0', 'SEO_TITLE', '', '2018-06-25 13:31:02', '0000-00-00 00:00:00', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1524', '0', 'SEO_META', '', '2018-06-25 13:31:02', '0000-00-00 00:00:00', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1525', '0', 'SEO_DESC', '', '2018-06-25 13:31:02', '0000-00-00 00:00:00', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1526', '0', 'SEO_OTHER', '', '2018-06-25 13:31:02', '0000-00-00 00:00:00', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1527', '0', 'SEO_TITLE', '', '2018-06-25 13:31:10', '0000-00-00 00:00:00', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1528', '0', 'SEO_META', '', '2018-06-25 13:31:10', '0000-00-00 00:00:00', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1529', '0', 'SEO_DESC', '', '2018-06-25 13:31:10', '0000-00-00 00:00:00', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1530', '0', 'SEO_OTHER', '', '2018-06-25 13:31:10', '0000-00-00 00:00:00', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1531', '0', 'SEO_TITLE', '', '2018-06-27 17:20:36', '0000-00-00 00:00:00', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1532', '0', 'SEO_META', '', '2018-06-27 17:20:36', '0000-00-00 00:00:00', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1533', '0', 'SEO_DESC', '', '2018-06-27 17:20:36', '0000-00-00 00:00:00', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1534', '0', 'SEO_OTHER', '', '2018-06-27 17:20:36', '0000-00-00 00:00:00', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1535', '0', 'SEO_TITLE', '', '2018-06-27 17:23:40', '0000-00-00 00:00:00', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1536', '0', 'SEO_META', '', '2018-06-27 17:23:40', '0000-00-00 00:00:00', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1537', '0', 'SEO_DESC', '', '2018-06-27 17:23:40', '0000-00-00 00:00:00', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1538', '0', 'SEO_OTHER', '', '2018-06-27 17:23:40', '0000-00-00 00:00:00', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1539', '0', 'SEO_TITLE', '', '2018-06-27 17:23:40', '0000-00-00 00:00:00', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1540', '0', 'SEO_META', '', '2018-06-27 17:23:40', '0000-00-00 00:00:00', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1541', '0', 'SEO_DESC', '', '2018-06-27 17:23:40', '0000-00-00 00:00:00', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1542', '0', 'SEO_OTHER', '', '2018-06-27 17:23:40', '0000-00-00 00:00:00', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1543', '0', 'SEO_TITLE', '', '2018-06-27 17:23:43', '0000-00-00 00:00:00', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1544', '0', 'SEO_META', '', '2018-06-27 17:23:43', '0000-00-00 00:00:00', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1545', '0', 'SEO_DESC', '', '2018-06-27 17:23:43', '0000-00-00 00:00:00', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1546', '0', 'SEO_OTHER', '', '2018-06-27 17:23:43', '0000-00-00 00:00:00', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1547', '0', 'SEO_TITLE', '', '2018-06-29 13:06:05', '0000-00-00 00:00:00', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1548', '0', 'SEO_META', '', '2018-06-29 13:06:05', '0000-00-00 00:00:00', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1549', '0', 'SEO_DESC', '', '2018-06-29 13:06:05', '0000-00-00 00:00:00', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1550', '0', 'SEO_OTHER', '', '2018-06-29 13:06:05', '0000-00-00 00:00:00', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1551', '0', 'SEO_TITLE', '', '2018-06-29 13:14:15', '0000-00-00 00:00:00', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1552', '0', 'SEO_META', '', '2018-06-29 13:14:15', '0000-00-00 00:00:00', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1553', '0', 'SEO_DESC', '', '2018-06-29 13:14:15', '0000-00-00 00:00:00', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1554', '0', 'SEO_OTHER', '', '2018-06-29 13:14:15', '0000-00-00 00:00:00', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1555', '0', 'SEO_TITLE', '', '2018-06-29 13:14:18', '0000-00-00 00:00:00', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1556', '0', 'SEO_META', '', '2018-06-29 13:14:18', '0000-00-00 00:00:00', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1557', '0', 'SEO_DESC', '', '2018-06-29 13:14:18', '0000-00-00 00:00:00', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1558', '0', 'SEO_OTHER', '', '2018-06-29 13:14:18', '0000-00-00 00:00:00', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1559', '0', 'SEO_TITLE', '', '2018-07-02 21:55:31', '0000-00-00 00:00:00', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1560', '0', 'SEO_META', '', '2018-07-02 21:55:32', '0000-00-00 00:00:00', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1561', '0', 'SEO_DESC', '', '2018-07-02 21:55:32', '0000-00-00 00:00:00', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1562', '0', 'SEO_OTHER', '', '2018-07-02 21:55:32', '0000-00-00 00:00:00', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1563', '0', 'SEO_TITLE', '', '2018-07-02 22:32:05', '0000-00-00 00:00:00', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1564', '0', 'SEO_META', '', '2018-07-02 22:32:05', '0000-00-00 00:00:00', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1565', '0', 'SEO_DESC', '', '2018-07-02 22:32:05', '0000-00-00 00:00:00', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1566', '0', 'SEO_OTHER', '', '2018-07-02 22:32:05', '0000-00-00 00:00:00', '其他页头信息', '1');
INSERT INTO `tp_config` VALUES ('1567', '0', 'SEO_TITLE', '', '2018-07-04 15:16:00', '0000-00-00 00:00:00', '标题附加字', '1');
INSERT INTO `tp_config` VALUES ('1568', '0', 'SEO_META', '', '2018-07-04 15:16:00', '0000-00-00 00:00:00', '商城关键词', '1');
INSERT INTO `tp_config` VALUES ('1569', '0', 'SEO_DESC', '', '2018-07-04 15:16:01', '0000-00-00 00:00:00', '关键词描述', '1');
INSERT INTO `tp_config` VALUES ('1570', '0', 'SEO_OTHER', '', '2018-07-04 15:16:01', '0000-00-00 00:00:00', '其他页头信息', '1');

-- ----------------------------
-- Table structure for tp_consult
-- ----------------------------
DROP TABLE IF EXISTS `tp_consult`;
CREATE TABLE `tp_consult` (
  `consult_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '咨询编号',
  `goods_id` int(11) unsigned DEFAULT '0' COMMENT '商品编号',
  `goods_name` varchar(100) NOT NULL COMMENT '商品名称',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '咨询发布者会员编号(0：游客)',
  `member_name` varchar(100) NOT NULL DEFAULT '' COMMENT '会员名称',
  `shop_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '店铺编号',
  `shop_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `ct_id` int(10) unsigned NOT NULL COMMENT '咨询类型',
  `consult_content` varchar(255) NOT NULL DEFAULT '' COMMENT '咨询内容',
  `consult_addtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '咨询发布时间',
  `consult_reply` varchar(255) NOT NULL DEFAULT '' COMMENT '咨询回复内容',
  `consult_reply_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '咨询回复时间',
  `isanonymous` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0表示不匿名 1表示匿名',
  PRIMARY KEY (`consult_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1638 COMMENT='咨询类型表';

-- ----------------------------
-- Records of tp_consult
-- ----------------------------

-- ----------------------------
-- Table structure for tp_consult_type
-- ----------------------------
DROP TABLE IF EXISTS `tp_consult_type`;
CREATE TABLE `tp_consult_type` (
  `ct_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '咨询类型id',
  `ct_name` varchar(50) NOT NULL DEFAULT '' COMMENT '咨询类型名称',
  `ct_introduce` text NOT NULL COMMENT '咨询类型详细介绍',
  `ct_sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`ct_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192 COMMENT='咨询类型表';

-- ----------------------------
-- Records of tp_consult_type
-- ----------------------------

-- ----------------------------
-- Table structure for tp_coupon
-- ----------------------------
DROP TABLE IF EXISTS `tp_coupon`;
CREATE TABLE `tp_coupon` (
  `coupon_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '优惠券id',
  `coupon_type_id` int(11) NOT NULL COMMENT '优惠券类型id',
  `shop_id` int(11) NOT NULL COMMENT '店铺Id',
  `coupon_code` varchar(255) NOT NULL DEFAULT '' COMMENT '优惠券编码',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '领用人',
  `use_order_id` int(11) NOT NULL DEFAULT '0' COMMENT '优惠券使用订单id',
  `create_order_id` int(11) NOT NULL DEFAULT '0' COMMENT '创建订单id(优惠券只有是完成订单发放的优惠券时才有值)',
  `money` decimal(10,2) NOT NULL COMMENT '面额',
  `fetch_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '领取时间',
  `use_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '使用时间',
  `state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '优惠券状态 0未领用 1已领用（未使用） 2已使用 3已过期',
  `start_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '有效期开始时间',
  `end_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '有效期结束时间',
  `get_type` int(11) NOT NULL DEFAULT '0' COMMENT '获取方式1订单2.首页领取',
  PRIMARY KEY (`coupon_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=148 COMMENT='优惠券表';

-- ----------------------------
-- Records of tp_coupon
-- ----------------------------

-- ----------------------------
-- Table structure for tp_coupon_goods
-- ----------------------------
DROP TABLE IF EXISTS `tp_coupon_goods`;
CREATE TABLE `tp_coupon_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_type_id` int(11) NOT NULL COMMENT '优惠券类型id',
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=606 COMMENT='优惠券使用商品表';

-- ----------------------------
-- Records of tp_coupon_goods
-- ----------------------------

-- ----------------------------
-- Table structure for tp_coupon_type
-- ----------------------------
DROP TABLE IF EXISTS `tp_coupon_type`;
CREATE TABLE `tp_coupon_type` (
  `coupon_type_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '优惠券类型Id',
  `shop_id` int(11) NOT NULL DEFAULT '1' COMMENT '店铺ID',
  `coupon_name` varchar(50) NOT NULL DEFAULT '' COMMENT '优惠券名称',
  `money` decimal(10,2) NOT NULL COMMENT '发放面额',
  `count` int(11) NOT NULL COMMENT '发放数量',
  `max_fetch` int(11) NOT NULL DEFAULT '0' COMMENT '每人最大领取个数 0无限制',
  `at_least` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '满多少元使用 0代表无限制',
  `need_user_level` tinyint(4) NOT NULL DEFAULT '0' COMMENT '领取人会员等级',
  `range_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '使用范围0部分产品使用 1全场产品使用',
  `start_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '有效日期开始时间',
  `end_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '有效日期结束时间',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `is_show` int(11) NOT NULL DEFAULT '0' COMMENT '是否允许首页显示0不显示1显示',
  PRIMARY KEY (`coupon_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1365 COMMENT='优惠券类型表';

-- ----------------------------
-- Records of tp_coupon_type
-- ----------------------------

-- ----------------------------
-- Table structure for tp_district
-- ----------------------------
DROP TABLE IF EXISTS `tp_district`;
CREATE TABLE `tp_district` (
  `district_id` int(11) NOT NULL AUTO_INCREMENT,
  `city_id` int(11) DEFAULT '0',
  `district_name` varchar(255) NOT NULL DEFAULT '',
  `sort` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`district_id`),
  KEY `IDX_g_district_DistrictName` (`district_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2867 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=50;

-- ----------------------------
-- Records of tp_district
-- ----------------------------
INSERT INTO `tp_district` VALUES ('1', '1', '东城区', '0');
INSERT INTO `tp_district` VALUES ('2', '1', '西城区', '0');
INSERT INTO `tp_district` VALUES ('3', '1', '崇文区', '0');
INSERT INTO `tp_district` VALUES ('4', '1', '宣武区', '0');
INSERT INTO `tp_district` VALUES ('5', '1', '朝阳区', '0');
INSERT INTO `tp_district` VALUES ('6', '1', '丰台区', '0');
INSERT INTO `tp_district` VALUES ('7', '1', '石景山区', '0');
INSERT INTO `tp_district` VALUES ('8', '1', '海淀区', '0');
INSERT INTO `tp_district` VALUES ('9', '1', '门头沟区', '0');
INSERT INTO `tp_district` VALUES ('10', '1', '房山区', '0');
INSERT INTO `tp_district` VALUES ('11', '1', '通州区', '0');
INSERT INTO `tp_district` VALUES ('12', '1', '顺义区', '0');
INSERT INTO `tp_district` VALUES ('13', '1', '昌平区', '0');
INSERT INTO `tp_district` VALUES ('14', '1', '大兴区', '0');
INSERT INTO `tp_district` VALUES ('15', '1', '怀柔区', '0');
INSERT INTO `tp_district` VALUES ('16', '1', '平谷区', '0');
INSERT INTO `tp_district` VALUES ('17', '1', '密云县', '0');
INSERT INTO `tp_district` VALUES ('18', '1', '延庆县', '0');
INSERT INTO `tp_district` VALUES ('19', '2', '和平区', '0');
INSERT INTO `tp_district` VALUES ('20', '2', '河东区', '0');
INSERT INTO `tp_district` VALUES ('21', '2', '河西区', '0');
INSERT INTO `tp_district` VALUES ('22', '2', '南开区', '0');
INSERT INTO `tp_district` VALUES ('23', '2', '河北区', '0');
INSERT INTO `tp_district` VALUES ('24', '2', '红桥区', '0');
INSERT INTO `tp_district` VALUES ('25', '2', '塘沽区', '0');
INSERT INTO `tp_district` VALUES ('26', '2', '汉沽区', '0');
INSERT INTO `tp_district` VALUES ('27', '2', '大港区', '0');
INSERT INTO `tp_district` VALUES ('28', '2', '东丽区', '0');
INSERT INTO `tp_district` VALUES ('29', '2', '西青区', '0');
INSERT INTO `tp_district` VALUES ('30', '2', '津南区', '0');
INSERT INTO `tp_district` VALUES ('31', '2', '北辰区', '0');
INSERT INTO `tp_district` VALUES ('32', '2', '武清区', '0');
INSERT INTO `tp_district` VALUES ('33', '2', '宝坻区', '0');
INSERT INTO `tp_district` VALUES ('34', '2', '宁河县', '0');
INSERT INTO `tp_district` VALUES ('35', '2', '静海县', '0');
INSERT INTO `tp_district` VALUES ('36', '2', '蓟县', '0');
INSERT INTO `tp_district` VALUES ('37', '3', '长安区', '0');
INSERT INTO `tp_district` VALUES ('38', '3', '桥东区', '0');
INSERT INTO `tp_district` VALUES ('39', '3', '桥西区', '0');
INSERT INTO `tp_district` VALUES ('40', '3', '新华区', '0');
INSERT INTO `tp_district` VALUES ('41', '3', '井陉矿区', '0');
INSERT INTO `tp_district` VALUES ('42', '3', '裕华区', '0');
INSERT INTO `tp_district` VALUES ('43', '3', '井陉县', '0');
INSERT INTO `tp_district` VALUES ('44', '3', '正定县', '0');
INSERT INTO `tp_district` VALUES ('45', '3', '栾城县', '0');
INSERT INTO `tp_district` VALUES ('46', '3', '行唐县', '0');
INSERT INTO `tp_district` VALUES ('47', '3', '灵寿县', '0');
INSERT INTO `tp_district` VALUES ('48', '3', '高邑县', '0');
INSERT INTO `tp_district` VALUES ('49', '3', '深泽县', '0');
INSERT INTO `tp_district` VALUES ('50', '3', '赞皇县', '0');
INSERT INTO `tp_district` VALUES ('51', '3', '无极县', '0');
INSERT INTO `tp_district` VALUES ('52', '3', '平山县', '0');
INSERT INTO `tp_district` VALUES ('53', '3', '元氏县', '0');
INSERT INTO `tp_district` VALUES ('54', '3', '赵县', '0');
INSERT INTO `tp_district` VALUES ('55', '3', '辛集市', '0');
INSERT INTO `tp_district` VALUES ('56', '3', '藁城市', '0');
INSERT INTO `tp_district` VALUES ('57', '3', '晋州市', '0');
INSERT INTO `tp_district` VALUES ('58', '3', '新乐市', '0');
INSERT INTO `tp_district` VALUES ('59', '3', '鹿泉市', '0');
INSERT INTO `tp_district` VALUES ('60', '4', '路南区', '0');
INSERT INTO `tp_district` VALUES ('61', '4', '路北区', '0');
INSERT INTO `tp_district` VALUES ('62', '4', '古冶区', '0');
INSERT INTO `tp_district` VALUES ('63', '4', '开平区', '0');
INSERT INTO `tp_district` VALUES ('64', '4', '丰南区', '0');
INSERT INTO `tp_district` VALUES ('65', '4', '丰润区', '0');
INSERT INTO `tp_district` VALUES ('66', '4', '滦县', '0');
INSERT INTO `tp_district` VALUES ('67', '4', '滦南县', '0');
INSERT INTO `tp_district` VALUES ('68', '4', '乐亭县', '0');
INSERT INTO `tp_district` VALUES ('69', '4', '迁西县', '0');
INSERT INTO `tp_district` VALUES ('70', '4', '玉田县', '0');
INSERT INTO `tp_district` VALUES ('71', '4', '唐海县', '0');
INSERT INTO `tp_district` VALUES ('72', '4', '遵化市', '0');
INSERT INTO `tp_district` VALUES ('73', '4', '迁安市', '0');
INSERT INTO `tp_district` VALUES ('74', '5', '海港区', '0');
INSERT INTO `tp_district` VALUES ('75', '5', '山海关区', '0');
INSERT INTO `tp_district` VALUES ('76', '5', '北戴河区', '0');
INSERT INTO `tp_district` VALUES ('77', '5', '青龙满族自治县', '0');
INSERT INTO `tp_district` VALUES ('78', '5', '昌黎县', '0');
INSERT INTO `tp_district` VALUES ('79', '5', '抚宁县', '0');
INSERT INTO `tp_district` VALUES ('80', '5', '卢龙县', '0');
INSERT INTO `tp_district` VALUES ('81', '6', '邯山区', '0');
INSERT INTO `tp_district` VALUES ('82', '6', '丛台区', '0');
INSERT INTO `tp_district` VALUES ('83', '6', '复兴区', '0');
INSERT INTO `tp_district` VALUES ('84', '6', '峰峰矿区', '0');
INSERT INTO `tp_district` VALUES ('85', '6', '邯郸县', '0');
INSERT INTO `tp_district` VALUES ('86', '6', '临漳县', '0');
INSERT INTO `tp_district` VALUES ('87', '6', '成安县', '0');
INSERT INTO `tp_district` VALUES ('88', '6', '大名县', '0');
INSERT INTO `tp_district` VALUES ('89', '6', '涉县', '0');
INSERT INTO `tp_district` VALUES ('90', '6', '磁县', '0');
INSERT INTO `tp_district` VALUES ('91', '6', '肥乡县', '0');
INSERT INTO `tp_district` VALUES ('92', '6', '永年县', '0');
INSERT INTO `tp_district` VALUES ('93', '6', '邱县', '0');
INSERT INTO `tp_district` VALUES ('94', '6', '鸡泽县', '0');
INSERT INTO `tp_district` VALUES ('95', '6', '广平县', '0');
INSERT INTO `tp_district` VALUES ('96', '6', '馆陶县', '0');
INSERT INTO `tp_district` VALUES ('97', '6', '魏县', '0');
INSERT INTO `tp_district` VALUES ('98', '6', '曲周县', '0');
INSERT INTO `tp_district` VALUES ('99', '6', '武安市', '0');
INSERT INTO `tp_district` VALUES ('100', '7', '桥东区', '0');
INSERT INTO `tp_district` VALUES ('101', '7', '桥西区', '0');
INSERT INTO `tp_district` VALUES ('102', '7', '邢台县', '0');
INSERT INTO `tp_district` VALUES ('103', '7', '临城县', '0');
INSERT INTO `tp_district` VALUES ('104', '7', '内丘县', '0');
INSERT INTO `tp_district` VALUES ('105', '7', '柏乡县', '0');
INSERT INTO `tp_district` VALUES ('106', '7', '隆尧县', '0');
INSERT INTO `tp_district` VALUES ('107', '7', '任县', '0');
INSERT INTO `tp_district` VALUES ('108', '7', '南和县', '0');
INSERT INTO `tp_district` VALUES ('109', '7', '宁晋县', '0');
INSERT INTO `tp_district` VALUES ('110', '7', '巨鹿县', '0');
INSERT INTO `tp_district` VALUES ('111', '7', '新河县', '0');
INSERT INTO `tp_district` VALUES ('112', '7', '广宗县', '0');
INSERT INTO `tp_district` VALUES ('113', '7', '平乡县', '0');
INSERT INTO `tp_district` VALUES ('114', '7', '威县', '0');
INSERT INTO `tp_district` VALUES ('115', '7', '清河县', '0');
INSERT INTO `tp_district` VALUES ('116', '7', '临西县', '0');
INSERT INTO `tp_district` VALUES ('117', '7', '南宫市', '0');
INSERT INTO `tp_district` VALUES ('118', '7', '沙河市', '0');
INSERT INTO `tp_district` VALUES ('119', '8', '新市区', '0');
INSERT INTO `tp_district` VALUES ('120', '8', '北市区', '0');
INSERT INTO `tp_district` VALUES ('121', '8', '南市区', '0');
INSERT INTO `tp_district` VALUES ('122', '8', '满城县', '0');
INSERT INTO `tp_district` VALUES ('123', '8', '清苑县', '0');
INSERT INTO `tp_district` VALUES ('124', '8', '涞水县', '0');
INSERT INTO `tp_district` VALUES ('125', '8', '阜平县', '0');
INSERT INTO `tp_district` VALUES ('126', '8', '徐水县', '0');
INSERT INTO `tp_district` VALUES ('127', '8', '定兴县', '0');
INSERT INTO `tp_district` VALUES ('128', '8', '唐县', '0');
INSERT INTO `tp_district` VALUES ('129', '8', '高阳县', '0');
INSERT INTO `tp_district` VALUES ('130', '8', '容城县', '0');
INSERT INTO `tp_district` VALUES ('131', '8', '涞源县', '0');
INSERT INTO `tp_district` VALUES ('132', '8', '望都县', '0');
INSERT INTO `tp_district` VALUES ('133', '8', '安新县', '0');
INSERT INTO `tp_district` VALUES ('134', '8', '易县', '0');
INSERT INTO `tp_district` VALUES ('135', '8', '曲阳县', '0');
INSERT INTO `tp_district` VALUES ('136', '8', '蠡县', '0');
INSERT INTO `tp_district` VALUES ('137', '8', '顺平县', '0');
INSERT INTO `tp_district` VALUES ('138', '8', '博野县', '0');
INSERT INTO `tp_district` VALUES ('139', '8', '雄县', '0');
INSERT INTO `tp_district` VALUES ('140', '8', '涿州市', '0');
INSERT INTO `tp_district` VALUES ('141', '8', '定州市', '0');
INSERT INTO `tp_district` VALUES ('142', '8', '安国市', '0');
INSERT INTO `tp_district` VALUES ('143', '8', '高碑店市', '0');
INSERT INTO `tp_district` VALUES ('144', '9', '桥东区', '0');
INSERT INTO `tp_district` VALUES ('145', '9', '桥西区', '0');
INSERT INTO `tp_district` VALUES ('146', '9', '宣化区', '0');
INSERT INTO `tp_district` VALUES ('147', '9', '下花园区', '0');
INSERT INTO `tp_district` VALUES ('148', '9', '宣化县', '0');
INSERT INTO `tp_district` VALUES ('149', '9', '张北县', '0');
INSERT INTO `tp_district` VALUES ('150', '9', '康保县', '0');
INSERT INTO `tp_district` VALUES ('151', '9', '沽源县', '0');
INSERT INTO `tp_district` VALUES ('152', '9', '尚义县', '0');
INSERT INTO `tp_district` VALUES ('153', '9', '蔚县', '0');
INSERT INTO `tp_district` VALUES ('154', '9', '阳原县', '0');
INSERT INTO `tp_district` VALUES ('155', '9', '怀安县', '0');
INSERT INTO `tp_district` VALUES ('156', '9', '万全县', '0');
INSERT INTO `tp_district` VALUES ('157', '9', '怀来县', '0');
INSERT INTO `tp_district` VALUES ('158', '9', '涿鹿县', '0');
INSERT INTO `tp_district` VALUES ('159', '9', '赤城县', '0');
INSERT INTO `tp_district` VALUES ('160', '9', '崇礼县', '0');
INSERT INTO `tp_district` VALUES ('161', '10', '双桥区', '0');
INSERT INTO `tp_district` VALUES ('162', '10', '双滦区', '0');
INSERT INTO `tp_district` VALUES ('163', '10', '鹰手营子矿区', '0');
INSERT INTO `tp_district` VALUES ('164', '10', '承德县', '0');
INSERT INTO `tp_district` VALUES ('165', '10', '兴隆县', '0');
INSERT INTO `tp_district` VALUES ('166', '10', '平泉县', '0');
INSERT INTO `tp_district` VALUES ('167', '10', '滦平县', '0');
INSERT INTO `tp_district` VALUES ('168', '10', '隆化县', '0');
INSERT INTO `tp_district` VALUES ('169', '10', '丰宁满族自治县', '0');
INSERT INTO `tp_district` VALUES ('170', '10', '宽城满族自治县', '0');
INSERT INTO `tp_district` VALUES ('171', '10', '围场满族蒙古族自治县', '0');
INSERT INTO `tp_district` VALUES ('172', '11', '新华区', '0');
INSERT INTO `tp_district` VALUES ('173', '11', '运河区', '0');
INSERT INTO `tp_district` VALUES ('174', '11', '沧县', '0');
INSERT INTO `tp_district` VALUES ('175', '11', '青县', '0');
INSERT INTO `tp_district` VALUES ('176', '11', '东光县', '0');
INSERT INTO `tp_district` VALUES ('177', '11', '海兴县', '0');
INSERT INTO `tp_district` VALUES ('178', '11', '盐山县', '0');
INSERT INTO `tp_district` VALUES ('179', '11', '肃宁县', '0');
INSERT INTO `tp_district` VALUES ('180', '11', '南皮县', '0');
INSERT INTO `tp_district` VALUES ('181', '11', '吴桥县', '0');
INSERT INTO `tp_district` VALUES ('182', '11', '献县', '0');
INSERT INTO `tp_district` VALUES ('183', '11', '孟村回族自治县', '0');
INSERT INTO `tp_district` VALUES ('184', '11', '泊头市', '0');
INSERT INTO `tp_district` VALUES ('185', '11', '任丘市', '0');
INSERT INTO `tp_district` VALUES ('186', '11', '黄骅市', '0');
INSERT INTO `tp_district` VALUES ('187', '11', '河间市', '0');
INSERT INTO `tp_district` VALUES ('188', '12', '安次区', '0');
INSERT INTO `tp_district` VALUES ('189', '12', '广阳区', '0');
INSERT INTO `tp_district` VALUES ('190', '12', '固安县', '0');
INSERT INTO `tp_district` VALUES ('191', '12', '永清县', '0');
INSERT INTO `tp_district` VALUES ('192', '12', '香河县', '0');
INSERT INTO `tp_district` VALUES ('193', '12', '大城县', '0');
INSERT INTO `tp_district` VALUES ('194', '12', '文安县', '0');
INSERT INTO `tp_district` VALUES ('195', '12', '大厂回族自治县', '0');
INSERT INTO `tp_district` VALUES ('196', '12', '霸州市', '0');
INSERT INTO `tp_district` VALUES ('197', '12', '三河市', '0');
INSERT INTO `tp_district` VALUES ('198', '13', '桃城区', '0');
INSERT INTO `tp_district` VALUES ('199', '13', '枣强县', '0');
INSERT INTO `tp_district` VALUES ('200', '13', '武邑县', '0');
INSERT INTO `tp_district` VALUES ('201', '13', '武强县', '0');
INSERT INTO `tp_district` VALUES ('202', '13', '饶阳县', '0');
INSERT INTO `tp_district` VALUES ('203', '13', '安平县', '0');
INSERT INTO `tp_district` VALUES ('204', '13', '故城县', '0');
INSERT INTO `tp_district` VALUES ('205', '13', '景县', '0');
INSERT INTO `tp_district` VALUES ('206', '13', '阜城县', '0');
INSERT INTO `tp_district` VALUES ('207', '13', '冀州市', '0');
INSERT INTO `tp_district` VALUES ('208', '13', '深州市', '0');
INSERT INTO `tp_district` VALUES ('209', '14', '小店区', '0');
INSERT INTO `tp_district` VALUES ('210', '14', '迎泽区', '0');
INSERT INTO `tp_district` VALUES ('211', '14', '杏花岭区', '0');
INSERT INTO `tp_district` VALUES ('212', '14', '尖草坪区', '0');
INSERT INTO `tp_district` VALUES ('213', '14', '万柏林区', '0');
INSERT INTO `tp_district` VALUES ('214', '14', '晋源区', '0');
INSERT INTO `tp_district` VALUES ('215', '14', '清徐县', '0');
INSERT INTO `tp_district` VALUES ('216', '14', '阳曲县', '0');
INSERT INTO `tp_district` VALUES ('217', '14', '娄烦县', '0');
INSERT INTO `tp_district` VALUES ('218', '14', '古交市', '0');
INSERT INTO `tp_district` VALUES ('219', '15', '城区', '0');
INSERT INTO `tp_district` VALUES ('220', '15', '矿区', '0');
INSERT INTO `tp_district` VALUES ('221', '15', '南郊区', '0');
INSERT INTO `tp_district` VALUES ('222', '15', '新荣区', '0');
INSERT INTO `tp_district` VALUES ('223', '15', '阳高县', '0');
INSERT INTO `tp_district` VALUES ('224', '15', '天镇县', '0');
INSERT INTO `tp_district` VALUES ('225', '15', '广灵县', '0');
INSERT INTO `tp_district` VALUES ('226', '15', '灵丘县', '0');
INSERT INTO `tp_district` VALUES ('227', '15', '浑源县', '0');
INSERT INTO `tp_district` VALUES ('228', '15', '左云县', '0');
INSERT INTO `tp_district` VALUES ('229', '15', '大同县', '0');
INSERT INTO `tp_district` VALUES ('230', '16', '城区', '0');
INSERT INTO `tp_district` VALUES ('231', '16', '矿区', '0');
INSERT INTO `tp_district` VALUES ('232', '16', '郊区', '0');
INSERT INTO `tp_district` VALUES ('233', '16', '平定县', '0');
INSERT INTO `tp_district` VALUES ('234', '16', '盂县', '0');
INSERT INTO `tp_district` VALUES ('235', '17', '城区', '0');
INSERT INTO `tp_district` VALUES ('236', '17', '郊区', '0');
INSERT INTO `tp_district` VALUES ('237', '17', '长治县', '0');
INSERT INTO `tp_district` VALUES ('238', '17', '襄垣县', '0');
INSERT INTO `tp_district` VALUES ('239', '17', '屯留县', '0');
INSERT INTO `tp_district` VALUES ('240', '17', '平顺县', '0');
INSERT INTO `tp_district` VALUES ('241', '17', '黎城县', '0');
INSERT INTO `tp_district` VALUES ('242', '17', '壶关县', '0');
INSERT INTO `tp_district` VALUES ('243', '17', '长子县', '0');
INSERT INTO `tp_district` VALUES ('244', '17', '武乡县', '0');
INSERT INTO `tp_district` VALUES ('245', '17', '沁县', '0');
INSERT INTO `tp_district` VALUES ('246', '17', '沁源县', '0');
INSERT INTO `tp_district` VALUES ('247', '17', '潞城市', '0');
INSERT INTO `tp_district` VALUES ('248', '18', '城区', '0');
INSERT INTO `tp_district` VALUES ('249', '18', '沁水县', '0');
INSERT INTO `tp_district` VALUES ('250', '18', '阳城县', '0');
INSERT INTO `tp_district` VALUES ('251', '18', '陵川县', '0');
INSERT INTO `tp_district` VALUES ('252', '18', '泽州县', '0');
INSERT INTO `tp_district` VALUES ('253', '18', '高平市', '0');
INSERT INTO `tp_district` VALUES ('254', '19', '朔城区', '0');
INSERT INTO `tp_district` VALUES ('255', '19', '平鲁区', '0');
INSERT INTO `tp_district` VALUES ('256', '19', '山阴县', '0');
INSERT INTO `tp_district` VALUES ('257', '19', '应县', '0');
INSERT INTO `tp_district` VALUES ('258', '19', '右玉县', '0');
INSERT INTO `tp_district` VALUES ('259', '19', '怀仁县', '0');
INSERT INTO `tp_district` VALUES ('260', '20', '榆次区', '0');
INSERT INTO `tp_district` VALUES ('261', '20', '榆社县', '0');
INSERT INTO `tp_district` VALUES ('262', '20', '左权县', '0');
INSERT INTO `tp_district` VALUES ('263', '20', '和顺县', '0');
INSERT INTO `tp_district` VALUES ('264', '20', '昔阳县', '0');
INSERT INTO `tp_district` VALUES ('265', '20', '寿阳县', '0');
INSERT INTO `tp_district` VALUES ('266', '20', '太谷县', '0');
INSERT INTO `tp_district` VALUES ('267', '20', '祁县', '0');
INSERT INTO `tp_district` VALUES ('268', '20', '平遥县', '0');
INSERT INTO `tp_district` VALUES ('269', '20', '灵石县', '0');
INSERT INTO `tp_district` VALUES ('270', '20', '介休市', '0');
INSERT INTO `tp_district` VALUES ('271', '21', '盐湖区', '0');
INSERT INTO `tp_district` VALUES ('272', '21', '临猗县', '0');
INSERT INTO `tp_district` VALUES ('273', '21', '万荣县', '0');
INSERT INTO `tp_district` VALUES ('274', '21', '闻喜县', '0');
INSERT INTO `tp_district` VALUES ('275', '21', '稷山县', '0');
INSERT INTO `tp_district` VALUES ('276', '21', '新绛县', '0');
INSERT INTO `tp_district` VALUES ('277', '21', '绛县', '0');
INSERT INTO `tp_district` VALUES ('278', '21', '垣曲县', '0');
INSERT INTO `tp_district` VALUES ('279', '21', '夏县', '0');
INSERT INTO `tp_district` VALUES ('280', '21', '平陆县', '0');
INSERT INTO `tp_district` VALUES ('281', '21', '芮城县', '0');
INSERT INTO `tp_district` VALUES ('282', '21', '永济市', '0');
INSERT INTO `tp_district` VALUES ('283', '21', '河津市', '0');
INSERT INTO `tp_district` VALUES ('284', '22', '忻府区', '0');
INSERT INTO `tp_district` VALUES ('285', '22', '定襄县', '0');
INSERT INTO `tp_district` VALUES ('286', '22', '五台县', '0');
INSERT INTO `tp_district` VALUES ('287', '22', '代县', '0');
INSERT INTO `tp_district` VALUES ('288', '22', '繁峙县', '0');
INSERT INTO `tp_district` VALUES ('289', '22', '宁武县', '0');
INSERT INTO `tp_district` VALUES ('290', '22', '静乐县', '0');
INSERT INTO `tp_district` VALUES ('291', '22', '神池县', '0');
INSERT INTO `tp_district` VALUES ('292', '22', '五寨县', '0');
INSERT INTO `tp_district` VALUES ('293', '22', '岢岚县', '0');
INSERT INTO `tp_district` VALUES ('294', '22', '河曲县', '0');
INSERT INTO `tp_district` VALUES ('295', '22', '保德县', '0');
INSERT INTO `tp_district` VALUES ('296', '22', '偏关县', '0');
INSERT INTO `tp_district` VALUES ('297', '22', '原平市', '0');
INSERT INTO `tp_district` VALUES ('298', '23', '尧都区', '0');
INSERT INTO `tp_district` VALUES ('299', '23', '曲沃县', '0');
INSERT INTO `tp_district` VALUES ('300', '23', '翼城县', '0');
INSERT INTO `tp_district` VALUES ('301', '23', '襄汾县', '0');
INSERT INTO `tp_district` VALUES ('302', '23', '洪洞县', '0');
INSERT INTO `tp_district` VALUES ('303', '23', '古县', '0');
INSERT INTO `tp_district` VALUES ('304', '23', '安泽县', '0');
INSERT INTO `tp_district` VALUES ('305', '23', '浮山县', '0');
INSERT INTO `tp_district` VALUES ('306', '23', '吉县', '0');
INSERT INTO `tp_district` VALUES ('307', '23', '乡宁县', '0');
INSERT INTO `tp_district` VALUES ('308', '23', '大宁县', '0');
INSERT INTO `tp_district` VALUES ('309', '23', '隰县', '0');
INSERT INTO `tp_district` VALUES ('310', '23', '永和县', '0');
INSERT INTO `tp_district` VALUES ('311', '23', '蒲县', '0');
INSERT INTO `tp_district` VALUES ('312', '23', '汾西县', '0');
INSERT INTO `tp_district` VALUES ('313', '23', '侯马市', '0');
INSERT INTO `tp_district` VALUES ('314', '23', '霍州市', '0');
INSERT INTO `tp_district` VALUES ('315', '24', '离石区', '0');
INSERT INTO `tp_district` VALUES ('316', '24', '文水县', '0');
INSERT INTO `tp_district` VALUES ('317', '24', '交城县', '0');
INSERT INTO `tp_district` VALUES ('318', '24', '兴县', '0');
INSERT INTO `tp_district` VALUES ('319', '24', '临县', '0');
INSERT INTO `tp_district` VALUES ('320', '24', '柳林县', '0');
INSERT INTO `tp_district` VALUES ('321', '24', '石楼县', '0');
INSERT INTO `tp_district` VALUES ('322', '24', '岚县', '0');
INSERT INTO `tp_district` VALUES ('323', '24', '方山县', '0');
INSERT INTO `tp_district` VALUES ('324', '24', '中阳县', '0');
INSERT INTO `tp_district` VALUES ('325', '24', '交口县', '0');
INSERT INTO `tp_district` VALUES ('326', '24', '孝义市', '0');
INSERT INTO `tp_district` VALUES ('327', '24', '汾阳市', '0');
INSERT INTO `tp_district` VALUES ('328', '25', '新城区', '0');
INSERT INTO `tp_district` VALUES ('329', '25', '回民区', '0');
INSERT INTO `tp_district` VALUES ('330', '25', '玉泉区', '0');
INSERT INTO `tp_district` VALUES ('331', '25', '赛罕区', '0');
INSERT INTO `tp_district` VALUES ('332', '25', '土默特左旗', '0');
INSERT INTO `tp_district` VALUES ('333', '25', '托克托县', '0');
INSERT INTO `tp_district` VALUES ('334', '25', '和林格尔县', '0');
INSERT INTO `tp_district` VALUES ('335', '25', '清水河县', '0');
INSERT INTO `tp_district` VALUES ('336', '25', '武川县', '0');
INSERT INTO `tp_district` VALUES ('337', '26', '东河区', '0');
INSERT INTO `tp_district` VALUES ('338', '26', '昆都仑区', '0');
INSERT INTO `tp_district` VALUES ('339', '26', '青山区', '0');
INSERT INTO `tp_district` VALUES ('340', '26', '石拐区', '0');
INSERT INTO `tp_district` VALUES ('341', '26', '白云矿区', '0');
INSERT INTO `tp_district` VALUES ('342', '26', '九原区', '0');
INSERT INTO `tp_district` VALUES ('343', '26', '土默特右旗', '0');
INSERT INTO `tp_district` VALUES ('344', '26', '固阳县', '0');
INSERT INTO `tp_district` VALUES ('345', '26', '达尔罕茂明安联合旗', '0');
INSERT INTO `tp_district` VALUES ('346', '27', '海勃湾区', '0');
INSERT INTO `tp_district` VALUES ('347', '27', '海南区', '0');
INSERT INTO `tp_district` VALUES ('348', '27', '乌达区', '0');
INSERT INTO `tp_district` VALUES ('349', '28', '红山区', '0');
INSERT INTO `tp_district` VALUES ('350', '28', '元宝山区', '0');
INSERT INTO `tp_district` VALUES ('351', '28', '松山区', '0');
INSERT INTO `tp_district` VALUES ('352', '28', '阿鲁科尔沁旗', '0');
INSERT INTO `tp_district` VALUES ('353', '28', '巴林左旗', '0');
INSERT INTO `tp_district` VALUES ('354', '28', '巴林右旗', '0');
INSERT INTO `tp_district` VALUES ('355', '28', '林西县', '0');
INSERT INTO `tp_district` VALUES ('356', '28', '克什克腾旗', '0');
INSERT INTO `tp_district` VALUES ('357', '28', '翁牛特旗', '0');
INSERT INTO `tp_district` VALUES ('358', '28', '喀喇沁旗', '0');
INSERT INTO `tp_district` VALUES ('359', '28', '宁城县', '0');
INSERT INTO `tp_district` VALUES ('360', '28', '敖汉旗', '0');
INSERT INTO `tp_district` VALUES ('361', '29', '科尔沁区', '0');
INSERT INTO `tp_district` VALUES ('362', '29', '科尔沁左翼中旗', '0');
INSERT INTO `tp_district` VALUES ('363', '29', '科尔沁左翼后旗', '0');
INSERT INTO `tp_district` VALUES ('364', '29', '开鲁县', '0');
INSERT INTO `tp_district` VALUES ('365', '29', '库伦旗', '0');
INSERT INTO `tp_district` VALUES ('366', '29', '奈曼旗', '0');
INSERT INTO `tp_district` VALUES ('367', '29', '扎鲁特旗', '0');
INSERT INTO `tp_district` VALUES ('368', '29', '霍林郭勒市', '0');
INSERT INTO `tp_district` VALUES ('369', '30', '东胜区', '0');
INSERT INTO `tp_district` VALUES ('370', '30', '达拉特旗', '0');
INSERT INTO `tp_district` VALUES ('371', '30', '准格尔旗', '0');
INSERT INTO `tp_district` VALUES ('372', '30', '鄂托克前旗', '0');
INSERT INTO `tp_district` VALUES ('373', '30', '鄂托克旗', '0');
INSERT INTO `tp_district` VALUES ('374', '30', '杭锦旗', '0');
INSERT INTO `tp_district` VALUES ('375', '30', '乌审旗', '0');
INSERT INTO `tp_district` VALUES ('376', '30', '伊金霍洛旗', '0');
INSERT INTO `tp_district` VALUES ('377', '31', '海拉尔区', '0');
INSERT INTO `tp_district` VALUES ('378', '31', '阿荣旗', '0');
INSERT INTO `tp_district` VALUES ('379', '31', '莫力达瓦达斡尔族自治旗', '0');
INSERT INTO `tp_district` VALUES ('380', '31', '鄂伦春自治旗', '0');
INSERT INTO `tp_district` VALUES ('381', '31', '鄂温克族自治旗', '0');
INSERT INTO `tp_district` VALUES ('382', '31', '陈巴尔虎旗', '0');
INSERT INTO `tp_district` VALUES ('383', '31', '新巴尔虎左旗', '0');
INSERT INTO `tp_district` VALUES ('384', '31', '新巴尔虎右旗', '0');
INSERT INTO `tp_district` VALUES ('385', '31', '满洲里市', '0');
INSERT INTO `tp_district` VALUES ('386', '31', '牙克石市', '0');
INSERT INTO `tp_district` VALUES ('387', '31', '扎兰屯市', '0');
INSERT INTO `tp_district` VALUES ('388', '31', '额尔古纳市', '0');
INSERT INTO `tp_district` VALUES ('389', '31', '根河市', '0');
INSERT INTO `tp_district` VALUES ('390', '32', '临河区', '0');
INSERT INTO `tp_district` VALUES ('391', '32', '五原县', '0');
INSERT INTO `tp_district` VALUES ('392', '32', '磴口县', '0');
INSERT INTO `tp_district` VALUES ('393', '32', '乌拉特前旗', '0');
INSERT INTO `tp_district` VALUES ('394', '32', '乌拉特中旗', '0');
INSERT INTO `tp_district` VALUES ('395', '32', '乌拉特后旗', '0');
INSERT INTO `tp_district` VALUES ('396', '32', '杭锦后旗', '0');
INSERT INTO `tp_district` VALUES ('397', '33', '集宁区', '0');
INSERT INTO `tp_district` VALUES ('398', '33', '卓资县', '0');
INSERT INTO `tp_district` VALUES ('399', '33', '化德县', '0');
INSERT INTO `tp_district` VALUES ('400', '33', '商都县', '0');
INSERT INTO `tp_district` VALUES ('401', '33', '兴和县', '0');
INSERT INTO `tp_district` VALUES ('402', '33', '凉城县', '0');
INSERT INTO `tp_district` VALUES ('403', '33', '察哈尔右翼前旗', '0');
INSERT INTO `tp_district` VALUES ('404', '33', '察哈尔右翼中旗', '0');
INSERT INTO `tp_district` VALUES ('405', '33', '察哈尔右翼后旗', '0');
INSERT INTO `tp_district` VALUES ('406', '33', '四子王旗', '0');
INSERT INTO `tp_district` VALUES ('407', '33', '丰镇市', '0');
INSERT INTO `tp_district` VALUES ('408', '34', '乌兰浩特市', '0');
INSERT INTO `tp_district` VALUES ('409', '34', '阿尔山市', '0');
INSERT INTO `tp_district` VALUES ('410', '34', '科尔沁右翼前旗', '0');
INSERT INTO `tp_district` VALUES ('411', '34', '科尔沁右翼中旗', '0');
INSERT INTO `tp_district` VALUES ('412', '34', '扎赉特旗', '0');
INSERT INTO `tp_district` VALUES ('413', '34', '突泉县', '0');
INSERT INTO `tp_district` VALUES ('414', '35', '二连浩特市', '0');
INSERT INTO `tp_district` VALUES ('415', '35', '锡林浩特市', '0');
INSERT INTO `tp_district` VALUES ('416', '35', '阿巴嘎旗', '0');
INSERT INTO `tp_district` VALUES ('417', '35', '苏尼特左旗', '0');
INSERT INTO `tp_district` VALUES ('418', '35', '苏尼特右旗', '0');
INSERT INTO `tp_district` VALUES ('419', '35', '东乌珠穆沁旗', '0');
INSERT INTO `tp_district` VALUES ('420', '35', '西乌珠穆沁旗', '0');
INSERT INTO `tp_district` VALUES ('421', '35', '太仆寺旗', '0');
INSERT INTO `tp_district` VALUES ('422', '35', '镶黄旗', '0');
INSERT INTO `tp_district` VALUES ('423', '35', '正镶白旗', '0');
INSERT INTO `tp_district` VALUES ('424', '35', '正蓝旗', '0');
INSERT INTO `tp_district` VALUES ('425', '35', '多伦县', '0');
INSERT INTO `tp_district` VALUES ('426', '36', '阿拉善左旗', '0');
INSERT INTO `tp_district` VALUES ('427', '36', '阿拉善右旗', '0');
INSERT INTO `tp_district` VALUES ('428', '36', '额济纳旗', '0');
INSERT INTO `tp_district` VALUES ('429', '37', '和平区', '0');
INSERT INTO `tp_district` VALUES ('430', '37', '沈河区', '0');
INSERT INTO `tp_district` VALUES ('431', '37', '大东区', '0');
INSERT INTO `tp_district` VALUES ('432', '37', '皇姑区', '0');
INSERT INTO `tp_district` VALUES ('433', '37', '铁西区', '0');
INSERT INTO `tp_district` VALUES ('434', '37', '苏家屯区', '0');
INSERT INTO `tp_district` VALUES ('435', '37', '东陵区', '0');
INSERT INTO `tp_district` VALUES ('436', '37', '新城子区', '0');
INSERT INTO `tp_district` VALUES ('437', '37', '于洪区', '0');
INSERT INTO `tp_district` VALUES ('438', '37', '辽中县', '0');
INSERT INTO `tp_district` VALUES ('439', '37', '康平县', '0');
INSERT INTO `tp_district` VALUES ('440', '37', '法库县', '0');
INSERT INTO `tp_district` VALUES ('441', '37', '新民市', '0');
INSERT INTO `tp_district` VALUES ('442', '38', '中山区', '0');
INSERT INTO `tp_district` VALUES ('443', '38', '西岗区', '0');
INSERT INTO `tp_district` VALUES ('444', '38', '沙河口区', '0');
INSERT INTO `tp_district` VALUES ('445', '38', '甘井子区', '0');
INSERT INTO `tp_district` VALUES ('446', '38', '旅顺口区', '0');
INSERT INTO `tp_district` VALUES ('447', '38', '金州区', '0');
INSERT INTO `tp_district` VALUES ('448', '38', '长海县', '0');
INSERT INTO `tp_district` VALUES ('449', '38', '瓦房店市', '0');
INSERT INTO `tp_district` VALUES ('450', '38', '普兰店市', '0');
INSERT INTO `tp_district` VALUES ('451', '38', '庄河市', '0');
INSERT INTO `tp_district` VALUES ('452', '39', '铁东区', '0');
INSERT INTO `tp_district` VALUES ('453', '39', '铁西区', '0');
INSERT INTO `tp_district` VALUES ('454', '39', '立山区', '0');
INSERT INTO `tp_district` VALUES ('455', '39', '千山区', '0');
INSERT INTO `tp_district` VALUES ('456', '39', '台安县', '0');
INSERT INTO `tp_district` VALUES ('457', '39', '岫岩满族自治县', '0');
INSERT INTO `tp_district` VALUES ('458', '39', '海城市', '0');
INSERT INTO `tp_district` VALUES ('459', '40', '新抚区', '0');
INSERT INTO `tp_district` VALUES ('460', '40', '东洲区', '0');
INSERT INTO `tp_district` VALUES ('461', '40', '望花区', '0');
INSERT INTO `tp_district` VALUES ('462', '40', '顺城区', '0');
INSERT INTO `tp_district` VALUES ('463', '40', '抚顺县', '0');
INSERT INTO `tp_district` VALUES ('464', '40', '新宾满族自治县', '0');
INSERT INTO `tp_district` VALUES ('465', '40', '清原满族自治县', '0');
INSERT INTO `tp_district` VALUES ('466', '41', '平山区', '0');
INSERT INTO `tp_district` VALUES ('467', '41', '溪湖区', '0');
INSERT INTO `tp_district` VALUES ('468', '41', '明山区', '0');
INSERT INTO `tp_district` VALUES ('469', '41', '南芬区', '0');
INSERT INTO `tp_district` VALUES ('470', '41', '本溪满族自治县', '0');
INSERT INTO `tp_district` VALUES ('471', '41', '桓仁满族自治县', '0');
INSERT INTO `tp_district` VALUES ('472', '42', '元宝区', '0');
INSERT INTO `tp_district` VALUES ('473', '42', '振兴区', '0');
INSERT INTO `tp_district` VALUES ('474', '42', '振安区', '0');
INSERT INTO `tp_district` VALUES ('475', '42', '宽甸满族自治县', '0');
INSERT INTO `tp_district` VALUES ('476', '42', '东港市', '0');
INSERT INTO `tp_district` VALUES ('477', '42', '凤城市', '0');
INSERT INTO `tp_district` VALUES ('478', '43', '古塔区', '0');
INSERT INTO `tp_district` VALUES ('479', '43', '凌河区', '0');
INSERT INTO `tp_district` VALUES ('480', '43', '太和区', '0');
INSERT INTO `tp_district` VALUES ('481', '43', '黑山县', '0');
INSERT INTO `tp_district` VALUES ('482', '43', '义县', '0');
INSERT INTO `tp_district` VALUES ('483', '43', '凌海市', '0');
INSERT INTO `tp_district` VALUES ('484', '43', '北宁市', '0');
INSERT INTO `tp_district` VALUES ('485', '44', '站前区', '0');
INSERT INTO `tp_district` VALUES ('486', '44', '西市区', '0');
INSERT INTO `tp_district` VALUES ('487', '44', '鲅鱼圈区', '0');
INSERT INTO `tp_district` VALUES ('488', '44', '老边区', '0');
INSERT INTO `tp_district` VALUES ('489', '44', '盖州市', '0');
INSERT INTO `tp_district` VALUES ('490', '44', '大石桥市', '0');
INSERT INTO `tp_district` VALUES ('491', '45', '海州区', '0');
INSERT INTO `tp_district` VALUES ('492', '45', '新邱区', '0');
INSERT INTO `tp_district` VALUES ('493', '45', '太平区', '0');
INSERT INTO `tp_district` VALUES ('494', '45', '清河门区', '0');
INSERT INTO `tp_district` VALUES ('495', '45', '细河区', '0');
INSERT INTO `tp_district` VALUES ('496', '45', '阜新蒙古族自治县', '0');
INSERT INTO `tp_district` VALUES ('497', '45', '彰武县', '0');
INSERT INTO `tp_district` VALUES ('498', '46', '白塔区', '0');
INSERT INTO `tp_district` VALUES ('499', '46', '文圣区', '0');
INSERT INTO `tp_district` VALUES ('500', '46', '宏伟区', '0');
INSERT INTO `tp_district` VALUES ('501', '46', '弓长岭区', '0');
INSERT INTO `tp_district` VALUES ('502', '46', '太子河区', '0');
INSERT INTO `tp_district` VALUES ('503', '46', '辽阳县', '0');
INSERT INTO `tp_district` VALUES ('504', '46', '灯塔市', '0');
INSERT INTO `tp_district` VALUES ('505', '47', '双台子区', '0');
INSERT INTO `tp_district` VALUES ('506', '47', '兴隆台区', '0');
INSERT INTO `tp_district` VALUES ('507', '47', '大洼县', '0');
INSERT INTO `tp_district` VALUES ('508', '47', '盘山县', '0');
INSERT INTO `tp_district` VALUES ('509', '48', '银州区', '0');
INSERT INTO `tp_district` VALUES ('510', '48', '清河区', '0');
INSERT INTO `tp_district` VALUES ('511', '48', '铁岭县', '0');
INSERT INTO `tp_district` VALUES ('512', '48', '西丰县', '0');
INSERT INTO `tp_district` VALUES ('513', '48', '昌图县', '0');
INSERT INTO `tp_district` VALUES ('514', '48', '调兵山市', '0');
INSERT INTO `tp_district` VALUES ('515', '48', '开原市', '0');
INSERT INTO `tp_district` VALUES ('516', '49', '双塔区', '0');
INSERT INTO `tp_district` VALUES ('517', '49', '龙城区', '0');
INSERT INTO `tp_district` VALUES ('518', '49', '朝阳县', '0');
INSERT INTO `tp_district` VALUES ('519', '49', '建平县', '0');
INSERT INTO `tp_district` VALUES ('520', '49', '喀喇沁左翼蒙古族自治县', '0');
INSERT INTO `tp_district` VALUES ('521', '49', '北票市', '0');
INSERT INTO `tp_district` VALUES ('522', '49', '凌源市', '0');
INSERT INTO `tp_district` VALUES ('523', '50', '连山区', '0');
INSERT INTO `tp_district` VALUES ('524', '50', '龙港区', '0');
INSERT INTO `tp_district` VALUES ('525', '50', '南票区', '0');
INSERT INTO `tp_district` VALUES ('526', '50', '绥中县', '0');
INSERT INTO `tp_district` VALUES ('527', '50', '建昌县', '0');
INSERT INTO `tp_district` VALUES ('528', '50', '兴城市', '0');
INSERT INTO `tp_district` VALUES ('529', '51', '南关区', '0');
INSERT INTO `tp_district` VALUES ('530', '51', '宽城区', '0');
INSERT INTO `tp_district` VALUES ('531', '51', '朝阳区', '0');
INSERT INTO `tp_district` VALUES ('532', '51', '二道区', '0');
INSERT INTO `tp_district` VALUES ('533', '51', '绿园区', '0');
INSERT INTO `tp_district` VALUES ('534', '51', '双阳区', '0');
INSERT INTO `tp_district` VALUES ('535', '51', '农安县', '0');
INSERT INTO `tp_district` VALUES ('536', '51', '九台市', '0');
INSERT INTO `tp_district` VALUES ('537', '51', '榆树市', '0');
INSERT INTO `tp_district` VALUES ('538', '51', '德惠市', '0');
INSERT INTO `tp_district` VALUES ('539', '52', '昌邑区', '0');
INSERT INTO `tp_district` VALUES ('540', '52', '龙潭区', '0');
INSERT INTO `tp_district` VALUES ('541', '52', '船营区', '0');
INSERT INTO `tp_district` VALUES ('542', '52', '丰满区', '0');
INSERT INTO `tp_district` VALUES ('543', '52', '永吉县', '0');
INSERT INTO `tp_district` VALUES ('544', '52', '蛟河市', '0');
INSERT INTO `tp_district` VALUES ('545', '52', '桦甸市', '0');
INSERT INTO `tp_district` VALUES ('546', '52', '舒兰市', '0');
INSERT INTO `tp_district` VALUES ('547', '52', '磐石市', '0');
INSERT INTO `tp_district` VALUES ('548', '53', '铁西区', '0');
INSERT INTO `tp_district` VALUES ('549', '53', '铁东区', '0');
INSERT INTO `tp_district` VALUES ('550', '53', '梨树县', '0');
INSERT INTO `tp_district` VALUES ('551', '53', '伊通满族自治县', '0');
INSERT INTO `tp_district` VALUES ('552', '53', '公主岭市', '0');
INSERT INTO `tp_district` VALUES ('553', '53', '双辽市', '0');
INSERT INTO `tp_district` VALUES ('554', '54', '龙山区', '0');
INSERT INTO `tp_district` VALUES ('555', '54', '西安区', '0');
INSERT INTO `tp_district` VALUES ('556', '54', '东丰县', '0');
INSERT INTO `tp_district` VALUES ('557', '54', '东辽县', '0');
INSERT INTO `tp_district` VALUES ('558', '55', '东昌区', '0');
INSERT INTO `tp_district` VALUES ('559', '55', '二道江区', '0');
INSERT INTO `tp_district` VALUES ('560', '55', '通化县', '0');
INSERT INTO `tp_district` VALUES ('561', '55', '辉南县', '0');
INSERT INTO `tp_district` VALUES ('562', '55', '柳河县', '0');
INSERT INTO `tp_district` VALUES ('563', '55', '梅河口市', '0');
INSERT INTO `tp_district` VALUES ('564', '55', '集安市', '0');
INSERT INTO `tp_district` VALUES ('565', '56', '八道江区', '0');
INSERT INTO `tp_district` VALUES ('566', '56', '抚松县', '0');
INSERT INTO `tp_district` VALUES ('567', '56', '靖宇县', '0');
INSERT INTO `tp_district` VALUES ('568', '56', '长白朝鲜族自治县', '0');
INSERT INTO `tp_district` VALUES ('569', '56', '江源县', '0');
INSERT INTO `tp_district` VALUES ('570', '56', '临江市', '0');
INSERT INTO `tp_district` VALUES ('571', '57', '宁江区', '0');
INSERT INTO `tp_district` VALUES ('572', '57', '前郭尔罗斯蒙古族自治县', '0');
INSERT INTO `tp_district` VALUES ('573', '57', '长岭县', '0');
INSERT INTO `tp_district` VALUES ('574', '57', '乾安县', '0');
INSERT INTO `tp_district` VALUES ('575', '57', '扶余县', '0');
INSERT INTO `tp_district` VALUES ('576', '58', '洮北区', '0');
INSERT INTO `tp_district` VALUES ('577', '58', '镇赉县', '0');
INSERT INTO `tp_district` VALUES ('578', '58', '通榆县', '0');
INSERT INTO `tp_district` VALUES ('579', '58', '洮南市', '0');
INSERT INTO `tp_district` VALUES ('580', '58', '大安市', '0');
INSERT INTO `tp_district` VALUES ('581', '59', '延吉市', '0');
INSERT INTO `tp_district` VALUES ('582', '59', '图们市', '0');
INSERT INTO `tp_district` VALUES ('583', '59', '敦化市', '0');
INSERT INTO `tp_district` VALUES ('584', '59', '珲春市', '0');
INSERT INTO `tp_district` VALUES ('585', '59', '龙井市', '0');
INSERT INTO `tp_district` VALUES ('586', '59', '和龙市', '0');
INSERT INTO `tp_district` VALUES ('587', '59', '汪清县', '0');
INSERT INTO `tp_district` VALUES ('588', '59', '安图县', '0');
INSERT INTO `tp_district` VALUES ('589', '60', '道里区', '0');
INSERT INTO `tp_district` VALUES ('590', '60', '南岗区', '0');
INSERT INTO `tp_district` VALUES ('591', '60', '道外区', '0');
INSERT INTO `tp_district` VALUES ('592', '60', '香坊区', '0');
INSERT INTO `tp_district` VALUES ('593', '60', '动力区', '0');
INSERT INTO `tp_district` VALUES ('594', '60', '平房区', '0');
INSERT INTO `tp_district` VALUES ('595', '60', '松北区', '0');
INSERT INTO `tp_district` VALUES ('596', '60', '呼兰区', '0');
INSERT INTO `tp_district` VALUES ('597', '60', '依兰县', '0');
INSERT INTO `tp_district` VALUES ('598', '60', '方正县', '0');
INSERT INTO `tp_district` VALUES ('599', '60', '宾县', '0');
INSERT INTO `tp_district` VALUES ('600', '60', '巴彦县', '0');
INSERT INTO `tp_district` VALUES ('601', '60', '木兰县', '0');
INSERT INTO `tp_district` VALUES ('602', '60', '通河县', '0');
INSERT INTO `tp_district` VALUES ('603', '60', '延寿县', '0');
INSERT INTO `tp_district` VALUES ('604', '60', '阿城市', '0');
INSERT INTO `tp_district` VALUES ('605', '60', '双城市', '0');
INSERT INTO `tp_district` VALUES ('606', '60', '尚志市', '0');
INSERT INTO `tp_district` VALUES ('607', '60', '五常市', '0');
INSERT INTO `tp_district` VALUES ('608', '61', '龙沙区', '0');
INSERT INTO `tp_district` VALUES ('609', '61', '建华区', '0');
INSERT INTO `tp_district` VALUES ('610', '61', '铁锋区', '0');
INSERT INTO `tp_district` VALUES ('611', '61', '昂昂溪区', '0');
INSERT INTO `tp_district` VALUES ('612', '61', '富拉尔基区', '0');
INSERT INTO `tp_district` VALUES ('613', '61', '碾子山区', '0');
INSERT INTO `tp_district` VALUES ('614', '61', '梅里斯达斡尔族区', '0');
INSERT INTO `tp_district` VALUES ('615', '61', '龙江县', '0');
INSERT INTO `tp_district` VALUES ('616', '61', '依安县', '0');
INSERT INTO `tp_district` VALUES ('617', '61', '泰来县', '0');
INSERT INTO `tp_district` VALUES ('618', '61', '甘南县', '0');
INSERT INTO `tp_district` VALUES ('619', '61', '富裕县', '0');
INSERT INTO `tp_district` VALUES ('620', '61', '克山县', '0');
INSERT INTO `tp_district` VALUES ('621', '61', '克东县', '0');
INSERT INTO `tp_district` VALUES ('622', '61', '拜泉县', '0');
INSERT INTO `tp_district` VALUES ('623', '61', '讷河市', '0');
INSERT INTO `tp_district` VALUES ('624', '62', '鸡冠区', '0');
INSERT INTO `tp_district` VALUES ('625', '62', '恒山区', '0');
INSERT INTO `tp_district` VALUES ('626', '62', '滴道区', '0');
INSERT INTO `tp_district` VALUES ('627', '62', '梨树区', '0');
INSERT INTO `tp_district` VALUES ('628', '62', '城子河区', '0');
INSERT INTO `tp_district` VALUES ('629', '62', '麻山区', '0');
INSERT INTO `tp_district` VALUES ('630', '62', '鸡东县', '0');
INSERT INTO `tp_district` VALUES ('631', '62', '虎林市', '0');
INSERT INTO `tp_district` VALUES ('632', '62', '密山市', '0');
INSERT INTO `tp_district` VALUES ('633', '63', '向阳区', '0');
INSERT INTO `tp_district` VALUES ('634', '63', '工农区', '0');
INSERT INTO `tp_district` VALUES ('635', '63', '南山区', '0');
INSERT INTO `tp_district` VALUES ('636', '63', '兴安区', '0');
INSERT INTO `tp_district` VALUES ('637', '63', '东山区', '0');
INSERT INTO `tp_district` VALUES ('638', '63', '兴山区', '0');
INSERT INTO `tp_district` VALUES ('639', '63', '萝北县', '0');
INSERT INTO `tp_district` VALUES ('640', '63', '绥滨县', '0');
INSERT INTO `tp_district` VALUES ('641', '64', '尖山区', '0');
INSERT INTO `tp_district` VALUES ('642', '64', '岭东区', '0');
INSERT INTO `tp_district` VALUES ('643', '64', '四方台区', '0');
INSERT INTO `tp_district` VALUES ('644', '64', '宝山区', '0');
INSERT INTO `tp_district` VALUES ('645', '64', '集贤县', '0');
INSERT INTO `tp_district` VALUES ('646', '64', '友谊县', '0');
INSERT INTO `tp_district` VALUES ('647', '64', '宝清县', '0');
INSERT INTO `tp_district` VALUES ('648', '64', '饶河县', '0');
INSERT INTO `tp_district` VALUES ('649', '65', '萨尔图区', '0');
INSERT INTO `tp_district` VALUES ('650', '65', '龙凤区', '0');
INSERT INTO `tp_district` VALUES ('651', '65', '让胡路区', '0');
INSERT INTO `tp_district` VALUES ('652', '65', '红岗区', '0');
INSERT INTO `tp_district` VALUES ('653', '65', '大同区', '0');
INSERT INTO `tp_district` VALUES ('654', '65', '肇州县', '0');
INSERT INTO `tp_district` VALUES ('655', '65', '肇源县', '0');
INSERT INTO `tp_district` VALUES ('656', '65', '林甸县', '0');
INSERT INTO `tp_district` VALUES ('657', '65', '杜尔伯特蒙古族自治县', '0');
INSERT INTO `tp_district` VALUES ('658', '66', '伊春区', '0');
INSERT INTO `tp_district` VALUES ('659', '66', '南岔区', '0');
INSERT INTO `tp_district` VALUES ('660', '66', '友好区', '0');
INSERT INTO `tp_district` VALUES ('661', '66', '西林区', '0');
INSERT INTO `tp_district` VALUES ('662', '66', '翠峦区', '0');
INSERT INTO `tp_district` VALUES ('663', '66', '新青区', '0');
INSERT INTO `tp_district` VALUES ('664', '66', '美溪区', '0');
INSERT INTO `tp_district` VALUES ('665', '66', '金山屯区', '0');
INSERT INTO `tp_district` VALUES ('666', '66', '五营区', '0');
INSERT INTO `tp_district` VALUES ('667', '66', '乌马河区', '0');
INSERT INTO `tp_district` VALUES ('668', '66', '汤旺河区', '0');
INSERT INTO `tp_district` VALUES ('669', '66', '带岭区', '0');
INSERT INTO `tp_district` VALUES ('670', '66', '乌伊岭区', '0');
INSERT INTO `tp_district` VALUES ('671', '66', '红星区', '0');
INSERT INTO `tp_district` VALUES ('672', '66', '上甘岭区', '0');
INSERT INTO `tp_district` VALUES ('673', '66', '嘉荫县', '0');
INSERT INTO `tp_district` VALUES ('674', '66', '铁力市', '0');
INSERT INTO `tp_district` VALUES ('675', '67', '永红区', '0');
INSERT INTO `tp_district` VALUES ('676', '67', '向阳区', '0');
INSERT INTO `tp_district` VALUES ('677', '67', '前进区', '0');
INSERT INTO `tp_district` VALUES ('678', '67', '东风区', '0');
INSERT INTO `tp_district` VALUES ('679', '67', '郊区', '0');
INSERT INTO `tp_district` VALUES ('680', '67', '桦南县', '0');
INSERT INTO `tp_district` VALUES ('681', '67', '桦川县', '0');
INSERT INTO `tp_district` VALUES ('682', '67', '汤原县', '0');
INSERT INTO `tp_district` VALUES ('683', '67', '抚远县', '0');
INSERT INTO `tp_district` VALUES ('684', '67', '同江市', '0');
INSERT INTO `tp_district` VALUES ('685', '67', '富锦市', '0');
INSERT INTO `tp_district` VALUES ('686', '68', '新兴区', '0');
INSERT INTO `tp_district` VALUES ('687', '68', '桃山区', '0');
INSERT INTO `tp_district` VALUES ('688', '68', '茄子河区', '0');
INSERT INTO `tp_district` VALUES ('689', '68', '勃利县', '0');
INSERT INTO `tp_district` VALUES ('690', '69', '东安区', '0');
INSERT INTO `tp_district` VALUES ('691', '69', '阳明区', '0');
INSERT INTO `tp_district` VALUES ('692', '69', '爱民区', '0');
INSERT INTO `tp_district` VALUES ('693', '69', '西安区', '0');
INSERT INTO `tp_district` VALUES ('694', '69', '东宁县', '0');
INSERT INTO `tp_district` VALUES ('695', '69', '林口县', '0');
INSERT INTO `tp_district` VALUES ('696', '69', '绥芬河市', '0');
INSERT INTO `tp_district` VALUES ('697', '69', '海林市', '0');
INSERT INTO `tp_district` VALUES ('698', '69', '宁安市', '0');
INSERT INTO `tp_district` VALUES ('699', '69', '穆棱市', '0');
INSERT INTO `tp_district` VALUES ('700', '70', '爱辉区', '0');
INSERT INTO `tp_district` VALUES ('701', '70', '嫩江县', '0');
INSERT INTO `tp_district` VALUES ('702', '70', '逊克县', '0');
INSERT INTO `tp_district` VALUES ('703', '70', '孙吴县', '0');
INSERT INTO `tp_district` VALUES ('704', '70', '北安市', '0');
INSERT INTO `tp_district` VALUES ('705', '70', '五大连池市', '0');
INSERT INTO `tp_district` VALUES ('706', '71', '北林区', '0');
INSERT INTO `tp_district` VALUES ('707', '71', '望奎县', '0');
INSERT INTO `tp_district` VALUES ('708', '71', '兰西县', '0');
INSERT INTO `tp_district` VALUES ('709', '71', '青冈县', '0');
INSERT INTO `tp_district` VALUES ('710', '71', '庆安县', '0');
INSERT INTO `tp_district` VALUES ('711', '71', '明水县', '0');
INSERT INTO `tp_district` VALUES ('712', '71', '绥棱县', '0');
INSERT INTO `tp_district` VALUES ('713', '71', '安达市', '0');
INSERT INTO `tp_district` VALUES ('714', '71', '肇东市', '0');
INSERT INTO `tp_district` VALUES ('715', '71', '海伦市', '0');
INSERT INTO `tp_district` VALUES ('716', '72', '呼玛县', '0');
INSERT INTO `tp_district` VALUES ('717', '72', '塔河县', '0');
INSERT INTO `tp_district` VALUES ('718', '72', '漠河县', '0');
INSERT INTO `tp_district` VALUES ('719', '73', '黄浦区', '0');
INSERT INTO `tp_district` VALUES ('720', '73', '卢湾区', '0');
INSERT INTO `tp_district` VALUES ('721', '73', '徐汇区', '0');
INSERT INTO `tp_district` VALUES ('722', '73', '长宁区', '0');
INSERT INTO `tp_district` VALUES ('723', '73', '静安区', '0');
INSERT INTO `tp_district` VALUES ('724', '73', '普陀区', '0');
INSERT INTO `tp_district` VALUES ('725', '73', '闸北区', '0');
INSERT INTO `tp_district` VALUES ('726', '73', '虹口区', '0');
INSERT INTO `tp_district` VALUES ('727', '73', '杨浦区', '0');
INSERT INTO `tp_district` VALUES ('728', '73', '闵行区', '0');
INSERT INTO `tp_district` VALUES ('729', '73', '宝山区', '0');
INSERT INTO `tp_district` VALUES ('730', '73', '嘉定区', '0');
INSERT INTO `tp_district` VALUES ('731', '73', '浦东新区', '0');
INSERT INTO `tp_district` VALUES ('732', '73', '金山区', '0');
INSERT INTO `tp_district` VALUES ('733', '73', '松江区', '0');
INSERT INTO `tp_district` VALUES ('734', '73', '青浦区', '0');
INSERT INTO `tp_district` VALUES ('735', '73', '南汇区', '0');
INSERT INTO `tp_district` VALUES ('736', '73', '奉贤区', '0');
INSERT INTO `tp_district` VALUES ('737', '73', '崇明县', '0');
INSERT INTO `tp_district` VALUES ('738', '74', '玄武区', '0');
INSERT INTO `tp_district` VALUES ('739', '74', '白下区', '0');
INSERT INTO `tp_district` VALUES ('740', '74', '秦淮区', '0');
INSERT INTO `tp_district` VALUES ('741', '74', '建邺区', '0');
INSERT INTO `tp_district` VALUES ('742', '74', '鼓楼区', '0');
INSERT INTO `tp_district` VALUES ('743', '74', '下关区', '0');
INSERT INTO `tp_district` VALUES ('744', '74', '浦口区', '0');
INSERT INTO `tp_district` VALUES ('745', '74', '栖霞区', '0');
INSERT INTO `tp_district` VALUES ('746', '74', '雨花台区', '0');
INSERT INTO `tp_district` VALUES ('747', '74', '江宁区', '0');
INSERT INTO `tp_district` VALUES ('748', '74', '六合区', '0');
INSERT INTO `tp_district` VALUES ('749', '74', '溧水县', '0');
INSERT INTO `tp_district` VALUES ('750', '74', '高淳县', '0');
INSERT INTO `tp_district` VALUES ('751', '75', '崇安区', '0');
INSERT INTO `tp_district` VALUES ('752', '75', '南长区', '0');
INSERT INTO `tp_district` VALUES ('753', '75', '北塘区', '0');
INSERT INTO `tp_district` VALUES ('754', '75', '锡山区', '0');
INSERT INTO `tp_district` VALUES ('755', '75', '惠山区', '0');
INSERT INTO `tp_district` VALUES ('756', '75', '滨湖区', '0');
INSERT INTO `tp_district` VALUES ('757', '75', '江阴市', '0');
INSERT INTO `tp_district` VALUES ('758', '75', '宜兴市', '0');
INSERT INTO `tp_district` VALUES ('759', '76', '鼓楼区', '0');
INSERT INTO `tp_district` VALUES ('760', '76', '云龙区', '0');
INSERT INTO `tp_district` VALUES ('761', '76', '九里区', '0');
INSERT INTO `tp_district` VALUES ('762', '76', '贾汪区', '0');
INSERT INTO `tp_district` VALUES ('763', '76', '泉山区', '0');
INSERT INTO `tp_district` VALUES ('764', '76', '丰县', '0');
INSERT INTO `tp_district` VALUES ('765', '76', '沛县', '0');
INSERT INTO `tp_district` VALUES ('766', '76', '铜山县', '0');
INSERT INTO `tp_district` VALUES ('767', '76', '睢宁县', '0');
INSERT INTO `tp_district` VALUES ('768', '76', '新沂市', '0');
INSERT INTO `tp_district` VALUES ('769', '76', '邳州市', '0');
INSERT INTO `tp_district` VALUES ('770', '77', '天宁区', '0');
INSERT INTO `tp_district` VALUES ('771', '77', '钟楼区', '0');
INSERT INTO `tp_district` VALUES ('772', '77', '戚墅堰区', '0');
INSERT INTO `tp_district` VALUES ('773', '77', '新北区', '0');
INSERT INTO `tp_district` VALUES ('774', '77', '武进区', '0');
INSERT INTO `tp_district` VALUES ('775', '77', '溧阳市', '0');
INSERT INTO `tp_district` VALUES ('776', '77', '金坛市', '0');
INSERT INTO `tp_district` VALUES ('777', '78', '沧浪区', '0');
INSERT INTO `tp_district` VALUES ('778', '78', '平江区', '0');
INSERT INTO `tp_district` VALUES ('779', '78', '金阊区', '0');
INSERT INTO `tp_district` VALUES ('780', '78', '虎丘区', '0');
INSERT INTO `tp_district` VALUES ('781', '78', '吴中区', '0');
INSERT INTO `tp_district` VALUES ('782', '78', '相城区', '0');
INSERT INTO `tp_district` VALUES ('783', '78', '常熟市', '0');
INSERT INTO `tp_district` VALUES ('784', '78', '张家港市', '0');
INSERT INTO `tp_district` VALUES ('785', '78', '昆山市', '0');
INSERT INTO `tp_district` VALUES ('786', '78', '吴江市', '0');
INSERT INTO `tp_district` VALUES ('787', '78', '太仓市', '0');
INSERT INTO `tp_district` VALUES ('788', '79', '崇川区', '0');
INSERT INTO `tp_district` VALUES ('789', '79', '港闸区', '0');
INSERT INTO `tp_district` VALUES ('790', '79', '海安县', '0');
INSERT INTO `tp_district` VALUES ('791', '79', '如东县', '0');
INSERT INTO `tp_district` VALUES ('792', '79', '启东市', '0');
INSERT INTO `tp_district` VALUES ('793', '79', '如皋市', '0');
INSERT INTO `tp_district` VALUES ('794', '79', '通州市', '0');
INSERT INTO `tp_district` VALUES ('795', '79', '海门市', '0');
INSERT INTO `tp_district` VALUES ('796', '80', '连云区', '0');
INSERT INTO `tp_district` VALUES ('797', '80', '新浦区', '0');
INSERT INTO `tp_district` VALUES ('798', '80', '海州区', '0');
INSERT INTO `tp_district` VALUES ('799', '80', '赣榆县', '0');
INSERT INTO `tp_district` VALUES ('800', '80', '东海县', '0');
INSERT INTO `tp_district` VALUES ('801', '80', '灌云县', '0');
INSERT INTO `tp_district` VALUES ('802', '80', '灌南县', '0');
INSERT INTO `tp_district` VALUES ('803', '81', '清河区', '0');
INSERT INTO `tp_district` VALUES ('804', '81', '楚州区', '0');
INSERT INTO `tp_district` VALUES ('805', '81', '淮阴区', '0');
INSERT INTO `tp_district` VALUES ('806', '81', '清浦区', '0');
INSERT INTO `tp_district` VALUES ('807', '81', '涟水县', '0');
INSERT INTO `tp_district` VALUES ('808', '81', '洪泽县', '0');
INSERT INTO `tp_district` VALUES ('809', '81', '盱眙县', '0');
INSERT INTO `tp_district` VALUES ('810', '81', '金湖县', '0');
INSERT INTO `tp_district` VALUES ('811', '82', '亭湖区', '0');
INSERT INTO `tp_district` VALUES ('812', '82', '盐都区', '0');
INSERT INTO `tp_district` VALUES ('813', '82', '响水县', '0');
INSERT INTO `tp_district` VALUES ('814', '82', '滨海县', '0');
INSERT INTO `tp_district` VALUES ('815', '82', '阜宁县', '0');
INSERT INTO `tp_district` VALUES ('816', '82', '射阳县', '0');
INSERT INTO `tp_district` VALUES ('817', '82', '建湖县', '0');
INSERT INTO `tp_district` VALUES ('818', '82', '东台市', '0');
INSERT INTO `tp_district` VALUES ('819', '82', '大丰市', '0');
INSERT INTO `tp_district` VALUES ('820', '83', '广陵区', '0');
INSERT INTO `tp_district` VALUES ('821', '83', '邗江区', '0');
INSERT INTO `tp_district` VALUES ('822', '83', '维扬区', '0');
INSERT INTO `tp_district` VALUES ('823', '83', '宝应县', '0');
INSERT INTO `tp_district` VALUES ('824', '83', '仪征市', '0');
INSERT INTO `tp_district` VALUES ('825', '83', '高邮市', '0');
INSERT INTO `tp_district` VALUES ('826', '83', '江都市', '0');
INSERT INTO `tp_district` VALUES ('827', '84', '京口区', '0');
INSERT INTO `tp_district` VALUES ('828', '84', '润州区', '0');
INSERT INTO `tp_district` VALUES ('829', '84', '丹徒区', '0');
INSERT INTO `tp_district` VALUES ('830', '84', '丹阳市', '0');
INSERT INTO `tp_district` VALUES ('831', '84', '扬中市', '0');
INSERT INTO `tp_district` VALUES ('832', '84', '句容市', '0');
INSERT INTO `tp_district` VALUES ('833', '85', '海陵区', '0');
INSERT INTO `tp_district` VALUES ('834', '85', '高港区', '0');
INSERT INTO `tp_district` VALUES ('835', '85', '兴化市', '0');
INSERT INTO `tp_district` VALUES ('836', '85', '靖江市', '0');
INSERT INTO `tp_district` VALUES ('837', '85', '泰兴市', '0');
INSERT INTO `tp_district` VALUES ('838', '85', '姜堰市', '0');
INSERT INTO `tp_district` VALUES ('839', '86', '宿城区', '0');
INSERT INTO `tp_district` VALUES ('840', '86', '宿豫区', '0');
INSERT INTO `tp_district` VALUES ('841', '86', '沭阳县', '0');
INSERT INTO `tp_district` VALUES ('842', '86', '泗阳县', '0');
INSERT INTO `tp_district` VALUES ('843', '86', '泗洪县', '0');
INSERT INTO `tp_district` VALUES ('844', '87', '上城区', '0');
INSERT INTO `tp_district` VALUES ('845', '87', '下城区', '0');
INSERT INTO `tp_district` VALUES ('846', '87', '江干区', '0');
INSERT INTO `tp_district` VALUES ('847', '87', '拱墅区', '0');
INSERT INTO `tp_district` VALUES ('848', '87', '西湖区', '0');
INSERT INTO `tp_district` VALUES ('849', '87', '滨江区', '0');
INSERT INTO `tp_district` VALUES ('850', '87', '萧山区', '0');
INSERT INTO `tp_district` VALUES ('851', '87', '余杭区', '0');
INSERT INTO `tp_district` VALUES ('852', '87', '桐庐县', '0');
INSERT INTO `tp_district` VALUES ('853', '87', '淳安县', '0');
INSERT INTO `tp_district` VALUES ('854', '87', '建德市', '0');
INSERT INTO `tp_district` VALUES ('855', '87', '富阳市', '0');
INSERT INTO `tp_district` VALUES ('856', '87', '临安市', '0');
INSERT INTO `tp_district` VALUES ('857', '88', '海曙区', '0');
INSERT INTO `tp_district` VALUES ('858', '88', '江东区', '0');
INSERT INTO `tp_district` VALUES ('859', '88', '江北区', '0');
INSERT INTO `tp_district` VALUES ('860', '88', '北仑区', '0');
INSERT INTO `tp_district` VALUES ('861', '88', '镇海区', '0');
INSERT INTO `tp_district` VALUES ('862', '88', '鄞州区', '0');
INSERT INTO `tp_district` VALUES ('863', '88', '象山县', '0');
INSERT INTO `tp_district` VALUES ('864', '88', '宁海县', '0');
INSERT INTO `tp_district` VALUES ('865', '88', '余姚市', '0');
INSERT INTO `tp_district` VALUES ('866', '88', '慈溪市', '0');
INSERT INTO `tp_district` VALUES ('867', '88', '奉化市', '0');
INSERT INTO `tp_district` VALUES ('868', '89', '鹿城区', '0');
INSERT INTO `tp_district` VALUES ('869', '89', '龙湾区', '0');
INSERT INTO `tp_district` VALUES ('870', '89', '瓯海区', '0');
INSERT INTO `tp_district` VALUES ('871', '89', '洞头县', '0');
INSERT INTO `tp_district` VALUES ('872', '89', '永嘉县', '0');
INSERT INTO `tp_district` VALUES ('873', '89', '平阳县', '0');
INSERT INTO `tp_district` VALUES ('874', '89', '苍南县', '0');
INSERT INTO `tp_district` VALUES ('875', '89', '文成县', '0');
INSERT INTO `tp_district` VALUES ('876', '89', '泰顺县', '0');
INSERT INTO `tp_district` VALUES ('877', '89', '瑞安市', '0');
INSERT INTO `tp_district` VALUES ('878', '89', '乐清市', '0');
INSERT INTO `tp_district` VALUES ('879', '90', '秀城区', '0');
INSERT INTO `tp_district` VALUES ('880', '90', '秀洲区', '0');
INSERT INTO `tp_district` VALUES ('881', '90', '嘉善县', '0');
INSERT INTO `tp_district` VALUES ('882', '90', '海盐县', '0');
INSERT INTO `tp_district` VALUES ('883', '90', '海宁市', '0');
INSERT INTO `tp_district` VALUES ('884', '90', '平湖市', '0');
INSERT INTO `tp_district` VALUES ('885', '90', '桐乡市', '0');
INSERT INTO `tp_district` VALUES ('886', '91', '吴兴区', '0');
INSERT INTO `tp_district` VALUES ('887', '91', '南浔区', '0');
INSERT INTO `tp_district` VALUES ('888', '91', '德清县', '0');
INSERT INTO `tp_district` VALUES ('889', '91', '长兴县', '0');
INSERT INTO `tp_district` VALUES ('890', '91', '安吉县', '0');
INSERT INTO `tp_district` VALUES ('891', '92', '越城区', '0');
INSERT INTO `tp_district` VALUES ('892', '92', '绍兴县', '0');
INSERT INTO `tp_district` VALUES ('893', '92', '新昌县', '0');
INSERT INTO `tp_district` VALUES ('894', '92', '诸暨市', '0');
INSERT INTO `tp_district` VALUES ('895', '92', '上虞市', '0');
INSERT INTO `tp_district` VALUES ('896', '92', '嵊州市', '0');
INSERT INTO `tp_district` VALUES ('897', '93', '婺城区', '0');
INSERT INTO `tp_district` VALUES ('898', '93', '金东区', '0');
INSERT INTO `tp_district` VALUES ('899', '93', '武义县', '0');
INSERT INTO `tp_district` VALUES ('900', '93', '浦江县', '0');
INSERT INTO `tp_district` VALUES ('901', '93', '磐安县', '0');
INSERT INTO `tp_district` VALUES ('902', '93', '兰溪市', '0');
INSERT INTO `tp_district` VALUES ('903', '93', '义乌市', '0');
INSERT INTO `tp_district` VALUES ('904', '93', '东阳市', '0');
INSERT INTO `tp_district` VALUES ('905', '93', '永康市', '0');
INSERT INTO `tp_district` VALUES ('906', '94', '柯城区', '0');
INSERT INTO `tp_district` VALUES ('907', '94', '衢江区', '0');
INSERT INTO `tp_district` VALUES ('908', '94', '常山县', '0');
INSERT INTO `tp_district` VALUES ('909', '94', '开化县', '0');
INSERT INTO `tp_district` VALUES ('910', '94', '龙游县', '0');
INSERT INTO `tp_district` VALUES ('911', '94', '江山市', '0');
INSERT INTO `tp_district` VALUES ('912', '95', '定海区', '0');
INSERT INTO `tp_district` VALUES ('913', '95', '普陀区', '0');
INSERT INTO `tp_district` VALUES ('914', '95', '岱山县', '0');
INSERT INTO `tp_district` VALUES ('915', '95', '嵊泗县', '0');
INSERT INTO `tp_district` VALUES ('916', '96', '椒江区', '0');
INSERT INTO `tp_district` VALUES ('917', '96', '黄岩区', '0');
INSERT INTO `tp_district` VALUES ('918', '96', '路桥区', '0');
INSERT INTO `tp_district` VALUES ('919', '96', '玉环县', '0');
INSERT INTO `tp_district` VALUES ('920', '96', '三门县', '0');
INSERT INTO `tp_district` VALUES ('921', '96', '天台县', '0');
INSERT INTO `tp_district` VALUES ('922', '96', '仙居县', '0');
INSERT INTO `tp_district` VALUES ('923', '96', '温岭市', '0');
INSERT INTO `tp_district` VALUES ('924', '96', '临海市', '0');
INSERT INTO `tp_district` VALUES ('925', '97', '莲都区', '0');
INSERT INTO `tp_district` VALUES ('926', '97', '青田县', '0');
INSERT INTO `tp_district` VALUES ('927', '97', '缙云县', '0');
INSERT INTO `tp_district` VALUES ('928', '97', '遂昌县', '0');
INSERT INTO `tp_district` VALUES ('929', '97', '松阳县', '0');
INSERT INTO `tp_district` VALUES ('930', '97', '云和县', '0');
INSERT INTO `tp_district` VALUES ('931', '97', '庆元县', '0');
INSERT INTO `tp_district` VALUES ('932', '97', '景宁畲族自治县', '0');
INSERT INTO `tp_district` VALUES ('933', '97', '龙泉市', '0');
INSERT INTO `tp_district` VALUES ('934', '98', '瑶海区', '0');
INSERT INTO `tp_district` VALUES ('935', '98', '庐阳区', '0');
INSERT INTO `tp_district` VALUES ('936', '98', '蜀山区', '0');
INSERT INTO `tp_district` VALUES ('937', '98', '包河区', '0');
INSERT INTO `tp_district` VALUES ('938', '98', '长丰县', '0');
INSERT INTO `tp_district` VALUES ('939', '98', '肥东县', '0');
INSERT INTO `tp_district` VALUES ('940', '98', '肥西县', '0');
INSERT INTO `tp_district` VALUES ('941', '99', '镜湖区', '0');
INSERT INTO `tp_district` VALUES ('942', '99', '马塘区', '0');
INSERT INTO `tp_district` VALUES ('943', '99', '新芜区', '0');
INSERT INTO `tp_district` VALUES ('944', '99', '鸠江区', '0');
INSERT INTO `tp_district` VALUES ('945', '99', '芜湖县', '0');
INSERT INTO `tp_district` VALUES ('946', '99', '繁昌县', '0');
INSERT INTO `tp_district` VALUES ('947', '99', '南陵县', '0');
INSERT INTO `tp_district` VALUES ('948', '100', '龙子湖区', '0');
INSERT INTO `tp_district` VALUES ('949', '100', '蚌山区', '0');
INSERT INTO `tp_district` VALUES ('950', '100', '禹会区', '0');
INSERT INTO `tp_district` VALUES ('951', '100', '淮上区', '0');
INSERT INTO `tp_district` VALUES ('952', '100', '怀远县', '0');
INSERT INTO `tp_district` VALUES ('953', '100', '五河县', '0');
INSERT INTO `tp_district` VALUES ('954', '100', '固镇县', '0');
INSERT INTO `tp_district` VALUES ('955', '101', '大通区', '0');
INSERT INTO `tp_district` VALUES ('956', '101', '田家庵区', '0');
INSERT INTO `tp_district` VALUES ('957', '101', '谢家集区', '0');
INSERT INTO `tp_district` VALUES ('958', '101', '八公山区', '0');
INSERT INTO `tp_district` VALUES ('959', '101', '潘集区', '0');
INSERT INTO `tp_district` VALUES ('960', '101', '凤台县', '0');
INSERT INTO `tp_district` VALUES ('961', '102', '金家庄区', '0');
INSERT INTO `tp_district` VALUES ('962', '102', '花山区', '0');
INSERT INTO `tp_district` VALUES ('963', '102', '雨山区', '0');
INSERT INTO `tp_district` VALUES ('964', '102', '当涂县', '0');
INSERT INTO `tp_district` VALUES ('965', '103', '杜集区', '0');
INSERT INTO `tp_district` VALUES ('966', '103', '相山区', '0');
INSERT INTO `tp_district` VALUES ('967', '103', '烈山区', '0');
INSERT INTO `tp_district` VALUES ('968', '103', '濉溪县', '0');
INSERT INTO `tp_district` VALUES ('969', '104', '铜官山区', '0');
INSERT INTO `tp_district` VALUES ('970', '104', '狮子山区', '0');
INSERT INTO `tp_district` VALUES ('971', '104', '郊区', '0');
INSERT INTO `tp_district` VALUES ('972', '104', '铜陵县', '0');
INSERT INTO `tp_district` VALUES ('973', '105', '迎江区', '0');
INSERT INTO `tp_district` VALUES ('974', '105', '大观区', '0');
INSERT INTO `tp_district` VALUES ('975', '105', '郊区', '0');
INSERT INTO `tp_district` VALUES ('976', '105', '怀宁县', '0');
INSERT INTO `tp_district` VALUES ('977', '105', '枞阳县', '0');
INSERT INTO `tp_district` VALUES ('978', '105', '潜山县', '0');
INSERT INTO `tp_district` VALUES ('979', '105', '太湖县', '0');
INSERT INTO `tp_district` VALUES ('980', '105', '宿松县', '0');
INSERT INTO `tp_district` VALUES ('981', '105', '望江县', '0');
INSERT INTO `tp_district` VALUES ('982', '105', '岳西县', '0');
INSERT INTO `tp_district` VALUES ('983', '105', '桐城市', '0');
INSERT INTO `tp_district` VALUES ('984', '106', '屯溪区', '0');
INSERT INTO `tp_district` VALUES ('985', '106', '黄山区', '0');
INSERT INTO `tp_district` VALUES ('986', '106', '徽州区', '0');
INSERT INTO `tp_district` VALUES ('987', '106', '歙县', '0');
INSERT INTO `tp_district` VALUES ('988', '106', '休宁县', '0');
INSERT INTO `tp_district` VALUES ('989', '106', '黟县', '0');
INSERT INTO `tp_district` VALUES ('990', '106', '祁门县', '0');
INSERT INTO `tp_district` VALUES ('991', '107', '琅琊区', '0');
INSERT INTO `tp_district` VALUES ('992', '107', '南谯区', '0');
INSERT INTO `tp_district` VALUES ('993', '107', '来安县', '0');
INSERT INTO `tp_district` VALUES ('994', '107', '全椒县', '0');
INSERT INTO `tp_district` VALUES ('995', '107', '定远县', '0');
INSERT INTO `tp_district` VALUES ('996', '107', '凤阳县', '0');
INSERT INTO `tp_district` VALUES ('997', '107', '天长市', '0');
INSERT INTO `tp_district` VALUES ('998', '107', '明光市', '0');
INSERT INTO `tp_district` VALUES ('999', '108', '颍州区', '0');
INSERT INTO `tp_district` VALUES ('1000', '108', '颍东区', '0');
INSERT INTO `tp_district` VALUES ('1001', '108', '颍泉区', '0');
INSERT INTO `tp_district` VALUES ('1002', '108', '临泉县', '0');
INSERT INTO `tp_district` VALUES ('1003', '108', '太和县', '0');
INSERT INTO `tp_district` VALUES ('1004', '108', '阜南县', '0');
INSERT INTO `tp_district` VALUES ('1005', '108', '颍上县', '0');
INSERT INTO `tp_district` VALUES ('1006', '108', '界首市', '0');
INSERT INTO `tp_district` VALUES ('1007', '109', '埇桥区', '0');
INSERT INTO `tp_district` VALUES ('1008', '109', '砀山县', '0');
INSERT INTO `tp_district` VALUES ('1009', '109', '萧县', '0');
INSERT INTO `tp_district` VALUES ('1010', '109', '灵璧县', '0');
INSERT INTO `tp_district` VALUES ('1011', '109', '泗县', '0');
INSERT INTO `tp_district` VALUES ('1012', '110', '居巢区', '0');
INSERT INTO `tp_district` VALUES ('1013', '110', '庐江县', '0');
INSERT INTO `tp_district` VALUES ('1014', '110', '无为县', '0');
INSERT INTO `tp_district` VALUES ('1015', '110', '含山县', '0');
INSERT INTO `tp_district` VALUES ('1016', '110', '和县', '0');
INSERT INTO `tp_district` VALUES ('1017', '111', '金安区', '0');
INSERT INTO `tp_district` VALUES ('1018', '111', '裕安区', '0');
INSERT INTO `tp_district` VALUES ('1019', '111', '寿县', '0');
INSERT INTO `tp_district` VALUES ('1020', '111', '霍邱县', '0');
INSERT INTO `tp_district` VALUES ('1021', '111', '舒城县', '0');
INSERT INTO `tp_district` VALUES ('1022', '111', '金寨县', '0');
INSERT INTO `tp_district` VALUES ('1023', '111', '霍山县', '0');
INSERT INTO `tp_district` VALUES ('1024', '112', '谯城区', '0');
INSERT INTO `tp_district` VALUES ('1025', '112', '涡阳县', '0');
INSERT INTO `tp_district` VALUES ('1026', '112', '蒙城县', '0');
INSERT INTO `tp_district` VALUES ('1027', '112', '利辛县', '0');
INSERT INTO `tp_district` VALUES ('1028', '113', '贵池区', '0');
INSERT INTO `tp_district` VALUES ('1029', '113', '东至县', '0');
INSERT INTO `tp_district` VALUES ('1030', '113', '石台县', '0');
INSERT INTO `tp_district` VALUES ('1031', '113', '青阳县', '0');
INSERT INTO `tp_district` VALUES ('1032', '114', '宣州区', '0');
INSERT INTO `tp_district` VALUES ('1033', '114', '郎溪县', '0');
INSERT INTO `tp_district` VALUES ('1034', '114', '广德县', '0');
INSERT INTO `tp_district` VALUES ('1035', '114', '泾县', '0');
INSERT INTO `tp_district` VALUES ('1036', '114', '绩溪县', '0');
INSERT INTO `tp_district` VALUES ('1037', '114', '旌德县', '0');
INSERT INTO `tp_district` VALUES ('1038', '114', '宁国市', '0');
INSERT INTO `tp_district` VALUES ('1039', '115', '鼓楼区', '0');
INSERT INTO `tp_district` VALUES ('1040', '115', '台江区', '0');
INSERT INTO `tp_district` VALUES ('1041', '115', '仓山区', '0');
INSERT INTO `tp_district` VALUES ('1042', '115', '马尾区', '0');
INSERT INTO `tp_district` VALUES ('1043', '115', '晋安区', '0');
INSERT INTO `tp_district` VALUES ('1044', '115', '闽侯县', '0');
INSERT INTO `tp_district` VALUES ('1045', '115', '连江县', '0');
INSERT INTO `tp_district` VALUES ('1046', '115', '罗源县', '0');
INSERT INTO `tp_district` VALUES ('1047', '115', '闽清县', '0');
INSERT INTO `tp_district` VALUES ('1048', '115', '永泰县', '0');
INSERT INTO `tp_district` VALUES ('1049', '115', '平潭县', '0');
INSERT INTO `tp_district` VALUES ('1050', '115', '福清市', '0');
INSERT INTO `tp_district` VALUES ('1051', '115', '长乐市', '0');
INSERT INTO `tp_district` VALUES ('1052', '116', '思明区', '0');
INSERT INTO `tp_district` VALUES ('1053', '116', '海沧区', '0');
INSERT INTO `tp_district` VALUES ('1054', '116', '湖里区', '0');
INSERT INTO `tp_district` VALUES ('1055', '116', '集美区', '0');
INSERT INTO `tp_district` VALUES ('1056', '116', '同安区', '0');
INSERT INTO `tp_district` VALUES ('1057', '116', '翔安区', '0');
INSERT INTO `tp_district` VALUES ('1058', '117', '城厢区', '0');
INSERT INTO `tp_district` VALUES ('1059', '117', '涵江区', '0');
INSERT INTO `tp_district` VALUES ('1060', '117', '荔城区', '0');
INSERT INTO `tp_district` VALUES ('1061', '117', '秀屿区', '0');
INSERT INTO `tp_district` VALUES ('1062', '117', '仙游县', '0');
INSERT INTO `tp_district` VALUES ('1063', '118', '梅列区', '0');
INSERT INTO `tp_district` VALUES ('1064', '118', '三元区', '0');
INSERT INTO `tp_district` VALUES ('1065', '118', '明溪县', '0');
INSERT INTO `tp_district` VALUES ('1066', '118', '清流县', '0');
INSERT INTO `tp_district` VALUES ('1067', '118', '宁化县', '0');
INSERT INTO `tp_district` VALUES ('1068', '118', '大田县', '0');
INSERT INTO `tp_district` VALUES ('1069', '118', '尤溪县', '0');
INSERT INTO `tp_district` VALUES ('1070', '118', '沙县', '0');
INSERT INTO `tp_district` VALUES ('1071', '118', '将乐县', '0');
INSERT INTO `tp_district` VALUES ('1072', '118', '泰宁县', '0');
INSERT INTO `tp_district` VALUES ('1073', '118', '建宁县', '0');
INSERT INTO `tp_district` VALUES ('1074', '118', '永安市', '0');
INSERT INTO `tp_district` VALUES ('1075', '119', '鲤城区', '0');
INSERT INTO `tp_district` VALUES ('1076', '119', '丰泽区', '0');
INSERT INTO `tp_district` VALUES ('1077', '119', '洛江区', '0');
INSERT INTO `tp_district` VALUES ('1078', '119', '泉港区', '0');
INSERT INTO `tp_district` VALUES ('1079', '119', '惠安县', '0');
INSERT INTO `tp_district` VALUES ('1080', '119', '安溪县', '0');
INSERT INTO `tp_district` VALUES ('1081', '119', '永春县', '0');
INSERT INTO `tp_district` VALUES ('1082', '119', '德化县', '0');
INSERT INTO `tp_district` VALUES ('1083', '119', '金门县', '0');
INSERT INTO `tp_district` VALUES ('1084', '119', '石狮市', '0');
INSERT INTO `tp_district` VALUES ('1085', '119', '晋江市', '0');
INSERT INTO `tp_district` VALUES ('1086', '119', '南安市', '0');
INSERT INTO `tp_district` VALUES ('1087', '120', '芗城区', '0');
INSERT INTO `tp_district` VALUES ('1088', '120', '龙文区', '0');
INSERT INTO `tp_district` VALUES ('1089', '120', '云霄县', '0');
INSERT INTO `tp_district` VALUES ('1090', '120', '漳浦县', '0');
INSERT INTO `tp_district` VALUES ('1091', '120', '诏安县', '0');
INSERT INTO `tp_district` VALUES ('1092', '120', '长泰县', '0');
INSERT INTO `tp_district` VALUES ('1093', '120', '东山县', '0');
INSERT INTO `tp_district` VALUES ('1094', '120', '南靖县', '0');
INSERT INTO `tp_district` VALUES ('1095', '120', '平和县', '0');
INSERT INTO `tp_district` VALUES ('1096', '120', '华安县', '0');
INSERT INTO `tp_district` VALUES ('1097', '120', '龙海市', '0');
INSERT INTO `tp_district` VALUES ('1098', '121', '延平区', '0');
INSERT INTO `tp_district` VALUES ('1099', '121', '顺昌县', '0');
INSERT INTO `tp_district` VALUES ('1100', '121', '浦城县', '0');
INSERT INTO `tp_district` VALUES ('1101', '121', '光泽县', '0');
INSERT INTO `tp_district` VALUES ('1102', '121', '松溪县', '0');
INSERT INTO `tp_district` VALUES ('1103', '121', '政和县', '0');
INSERT INTO `tp_district` VALUES ('1104', '121', '邵武市', '0');
INSERT INTO `tp_district` VALUES ('1105', '121', '武夷山市', '0');
INSERT INTO `tp_district` VALUES ('1106', '121', '建瓯市', '0');
INSERT INTO `tp_district` VALUES ('1107', '121', '建阳市', '0');
INSERT INTO `tp_district` VALUES ('1108', '122', '新罗区', '0');
INSERT INTO `tp_district` VALUES ('1109', '122', '长汀县', '0');
INSERT INTO `tp_district` VALUES ('1110', '122', '永定县', '0');
INSERT INTO `tp_district` VALUES ('1111', '122', '上杭县', '0');
INSERT INTO `tp_district` VALUES ('1112', '122', '武平县', '0');
INSERT INTO `tp_district` VALUES ('1113', '122', '连城县', '0');
INSERT INTO `tp_district` VALUES ('1114', '122', '漳平市', '0');
INSERT INTO `tp_district` VALUES ('1115', '123', '蕉城区', '0');
INSERT INTO `tp_district` VALUES ('1116', '123', '霞浦县', '0');
INSERT INTO `tp_district` VALUES ('1117', '123', '古田县', '0');
INSERT INTO `tp_district` VALUES ('1118', '123', '屏南县', '0');
INSERT INTO `tp_district` VALUES ('1119', '123', '寿宁县', '0');
INSERT INTO `tp_district` VALUES ('1120', '123', '周宁县', '0');
INSERT INTO `tp_district` VALUES ('1121', '123', '柘荣县', '0');
INSERT INTO `tp_district` VALUES ('1122', '123', '福安市', '0');
INSERT INTO `tp_district` VALUES ('1123', '123', '福鼎市', '0');
INSERT INTO `tp_district` VALUES ('1124', '124', '东湖区', '0');
INSERT INTO `tp_district` VALUES ('1125', '124', '西湖区', '0');
INSERT INTO `tp_district` VALUES ('1126', '124', '青云谱区', '0');
INSERT INTO `tp_district` VALUES ('1127', '124', '湾里区', '0');
INSERT INTO `tp_district` VALUES ('1128', '124', '青山湖区', '0');
INSERT INTO `tp_district` VALUES ('1129', '124', '南昌县', '0');
INSERT INTO `tp_district` VALUES ('1130', '124', '新建县', '0');
INSERT INTO `tp_district` VALUES ('1131', '124', '安义县', '0');
INSERT INTO `tp_district` VALUES ('1132', '124', '进贤县', '0');
INSERT INTO `tp_district` VALUES ('1133', '125', '昌江区', '0');
INSERT INTO `tp_district` VALUES ('1134', '125', '珠山区', '0');
INSERT INTO `tp_district` VALUES ('1135', '125', '浮梁县', '0');
INSERT INTO `tp_district` VALUES ('1136', '125', '乐平市', '0');
INSERT INTO `tp_district` VALUES ('1137', '126', '安源区', '0');
INSERT INTO `tp_district` VALUES ('1138', '126', '湘东区', '0');
INSERT INTO `tp_district` VALUES ('1139', '126', '莲花县', '0');
INSERT INTO `tp_district` VALUES ('1140', '126', '上栗县', '0');
INSERT INTO `tp_district` VALUES ('1141', '126', '芦溪县', '0');
INSERT INTO `tp_district` VALUES ('1142', '127', '庐山区', '0');
INSERT INTO `tp_district` VALUES ('1143', '127', '浔阳区', '0');
INSERT INTO `tp_district` VALUES ('1144', '127', '九江县', '0');
INSERT INTO `tp_district` VALUES ('1145', '127', '武宁县', '0');
INSERT INTO `tp_district` VALUES ('1146', '127', '修水县', '0');
INSERT INTO `tp_district` VALUES ('1147', '127', '永修县', '0');
INSERT INTO `tp_district` VALUES ('1148', '127', '德安县', '0');
INSERT INTO `tp_district` VALUES ('1149', '127', '星子县', '0');
INSERT INTO `tp_district` VALUES ('1150', '127', '都昌县', '0');
INSERT INTO `tp_district` VALUES ('1151', '127', '湖口县', '0');
INSERT INTO `tp_district` VALUES ('1152', '127', '彭泽县', '0');
INSERT INTO `tp_district` VALUES ('1153', '127', '瑞昌市', '0');
INSERT INTO `tp_district` VALUES ('1154', '128', '渝水区', '0');
INSERT INTO `tp_district` VALUES ('1155', '128', '分宜县', '0');
INSERT INTO `tp_district` VALUES ('1156', '129', '月湖区', '0');
INSERT INTO `tp_district` VALUES ('1157', '129', '余江县', '0');
INSERT INTO `tp_district` VALUES ('1158', '129', '贵溪市', '0');
INSERT INTO `tp_district` VALUES ('1159', '130', '章贡区', '0');
INSERT INTO `tp_district` VALUES ('1160', '130', '赣县', '0');
INSERT INTO `tp_district` VALUES ('1161', '130', '信丰县', '0');
INSERT INTO `tp_district` VALUES ('1162', '130', '大余县', '0');
INSERT INTO `tp_district` VALUES ('1163', '130', '上犹县', '0');
INSERT INTO `tp_district` VALUES ('1164', '130', '崇义县', '0');
INSERT INTO `tp_district` VALUES ('1165', '130', '安远县', '0');
INSERT INTO `tp_district` VALUES ('1166', '130', '龙南县', '0');
INSERT INTO `tp_district` VALUES ('1167', '130', '定南县', '0');
INSERT INTO `tp_district` VALUES ('1168', '130', '全南县', '0');
INSERT INTO `tp_district` VALUES ('1169', '130', '宁都县', '0');
INSERT INTO `tp_district` VALUES ('1170', '130', '于都县', '0');
INSERT INTO `tp_district` VALUES ('1171', '130', '兴国县', '0');
INSERT INTO `tp_district` VALUES ('1172', '130', '会昌县', '0');
INSERT INTO `tp_district` VALUES ('1173', '130', '寻乌县', '0');
INSERT INTO `tp_district` VALUES ('1174', '130', '石城县', '0');
INSERT INTO `tp_district` VALUES ('1175', '130', '瑞金市', '0');
INSERT INTO `tp_district` VALUES ('1176', '130', '南康市', '0');
INSERT INTO `tp_district` VALUES ('1177', '131', '吉州区', '0');
INSERT INTO `tp_district` VALUES ('1178', '131', '青原区', '0');
INSERT INTO `tp_district` VALUES ('1179', '131', '吉安县', '0');
INSERT INTO `tp_district` VALUES ('1180', '131', '吉水县', '0');
INSERT INTO `tp_district` VALUES ('1181', '131', '峡江县', '0');
INSERT INTO `tp_district` VALUES ('1182', '131', '新干县', '0');
INSERT INTO `tp_district` VALUES ('1183', '131', '永丰县', '0');
INSERT INTO `tp_district` VALUES ('1184', '131', '泰和县', '0');
INSERT INTO `tp_district` VALUES ('1185', '131', '遂川县', '0');
INSERT INTO `tp_district` VALUES ('1186', '131', '万安县', '0');
INSERT INTO `tp_district` VALUES ('1187', '131', '安福县', '0');
INSERT INTO `tp_district` VALUES ('1188', '131', '永新县', '0');
INSERT INTO `tp_district` VALUES ('1189', '131', '井冈山市', '0');
INSERT INTO `tp_district` VALUES ('1190', '132', '袁州区', '0');
INSERT INTO `tp_district` VALUES ('1191', '132', '奉新县', '0');
INSERT INTO `tp_district` VALUES ('1192', '132', '万载县', '0');
INSERT INTO `tp_district` VALUES ('1193', '132', '上高县', '0');
INSERT INTO `tp_district` VALUES ('1194', '132', '宜丰县', '0');
INSERT INTO `tp_district` VALUES ('1195', '132', '靖安县', '0');
INSERT INTO `tp_district` VALUES ('1196', '132', '铜鼓县', '0');
INSERT INTO `tp_district` VALUES ('1197', '132', '丰城市', '0');
INSERT INTO `tp_district` VALUES ('1198', '132', '樟树市', '0');
INSERT INTO `tp_district` VALUES ('1199', '132', '高安市', '0');
INSERT INTO `tp_district` VALUES ('1200', '133', '临川区', '0');
INSERT INTO `tp_district` VALUES ('1201', '133', '南城县', '0');
INSERT INTO `tp_district` VALUES ('1202', '133', '黎川县', '0');
INSERT INTO `tp_district` VALUES ('1203', '133', '南丰县', '0');
INSERT INTO `tp_district` VALUES ('1204', '133', '崇仁县', '0');
INSERT INTO `tp_district` VALUES ('1205', '133', '乐安县', '0');
INSERT INTO `tp_district` VALUES ('1206', '133', '宜黄县', '0');
INSERT INTO `tp_district` VALUES ('1207', '133', '金溪县', '0');
INSERT INTO `tp_district` VALUES ('1208', '133', '资溪县', '0');
INSERT INTO `tp_district` VALUES ('1209', '133', '东乡县', '0');
INSERT INTO `tp_district` VALUES ('1210', '133', '广昌县', '0');
INSERT INTO `tp_district` VALUES ('1211', '134', '信州区', '0');
INSERT INTO `tp_district` VALUES ('1212', '134', '上饶县', '0');
INSERT INTO `tp_district` VALUES ('1213', '134', '广丰县', '0');
INSERT INTO `tp_district` VALUES ('1214', '134', '玉山县', '0');
INSERT INTO `tp_district` VALUES ('1215', '134', '铅山县', '0');
INSERT INTO `tp_district` VALUES ('1216', '134', '横峰县', '0');
INSERT INTO `tp_district` VALUES ('1217', '134', '弋阳县', '0');
INSERT INTO `tp_district` VALUES ('1218', '134', '余干县', '0');
INSERT INTO `tp_district` VALUES ('1219', '134', '鄱阳县', '0');
INSERT INTO `tp_district` VALUES ('1220', '134', '万年县', '0');
INSERT INTO `tp_district` VALUES ('1221', '134', '婺源县', '0');
INSERT INTO `tp_district` VALUES ('1222', '134', '德兴市', '0');
INSERT INTO `tp_district` VALUES ('1223', '135', '历下区', '0');
INSERT INTO `tp_district` VALUES ('1224', '135', '市中区', '0');
INSERT INTO `tp_district` VALUES ('1225', '135', '槐荫区', '0');
INSERT INTO `tp_district` VALUES ('1226', '135', '天桥区', '0');
INSERT INTO `tp_district` VALUES ('1227', '135', '历城区', '0');
INSERT INTO `tp_district` VALUES ('1228', '135', '长清区', '0');
INSERT INTO `tp_district` VALUES ('1229', '135', '平阴县', '0');
INSERT INTO `tp_district` VALUES ('1230', '135', '济阳县', '0');
INSERT INTO `tp_district` VALUES ('1231', '135', '商河县', '0');
INSERT INTO `tp_district` VALUES ('1232', '135', '章丘市', '0');
INSERT INTO `tp_district` VALUES ('1233', '136', '市南区', '0');
INSERT INTO `tp_district` VALUES ('1234', '136', '市北区', '0');
INSERT INTO `tp_district` VALUES ('1235', '136', '四方区', '0');
INSERT INTO `tp_district` VALUES ('1236', '136', '黄岛区', '0');
INSERT INTO `tp_district` VALUES ('1237', '136', '崂山区', '0');
INSERT INTO `tp_district` VALUES ('1238', '136', '李沧区', '0');
INSERT INTO `tp_district` VALUES ('1239', '136', '城阳区', '0');
INSERT INTO `tp_district` VALUES ('1240', '136', '胶州市', '0');
INSERT INTO `tp_district` VALUES ('1241', '136', '即墨市', '0');
INSERT INTO `tp_district` VALUES ('1242', '136', '平度市', '0');
INSERT INTO `tp_district` VALUES ('1243', '136', '胶南市', '0');
INSERT INTO `tp_district` VALUES ('1244', '136', '莱西市', '0');
INSERT INTO `tp_district` VALUES ('1245', '137', '淄川区', '0');
INSERT INTO `tp_district` VALUES ('1246', '137', '张店区', '0');
INSERT INTO `tp_district` VALUES ('1247', '137', '博山区', '0');
INSERT INTO `tp_district` VALUES ('1248', '137', '临淄区', '0');
INSERT INTO `tp_district` VALUES ('1249', '137', '周村区', '0');
INSERT INTO `tp_district` VALUES ('1250', '137', '桓台县', '0');
INSERT INTO `tp_district` VALUES ('1251', '137', '高青县', '0');
INSERT INTO `tp_district` VALUES ('1252', '137', '沂源县', '0');
INSERT INTO `tp_district` VALUES ('1253', '138', '市中区', '0');
INSERT INTO `tp_district` VALUES ('1254', '138', '薛城区', '0');
INSERT INTO `tp_district` VALUES ('1255', '138', '峄城区', '0');
INSERT INTO `tp_district` VALUES ('1256', '138', '台儿庄区', '0');
INSERT INTO `tp_district` VALUES ('1257', '138', '山亭区', '0');
INSERT INTO `tp_district` VALUES ('1258', '138', '滕州市', '0');
INSERT INTO `tp_district` VALUES ('1259', '139', '东营区', '0');
INSERT INTO `tp_district` VALUES ('1260', '139', '河口区', '0');
INSERT INTO `tp_district` VALUES ('1261', '139', '垦利县', '0');
INSERT INTO `tp_district` VALUES ('1262', '139', '利津县', '0');
INSERT INTO `tp_district` VALUES ('1263', '139', '广饶县', '0');
INSERT INTO `tp_district` VALUES ('1264', '140', '芝罘区', '0');
INSERT INTO `tp_district` VALUES ('1265', '140', '福山区', '0');
INSERT INTO `tp_district` VALUES ('1266', '140', '牟平区', '0');
INSERT INTO `tp_district` VALUES ('1267', '140', '莱山区', '0');
INSERT INTO `tp_district` VALUES ('1268', '140', '长岛县', '0');
INSERT INTO `tp_district` VALUES ('1269', '140', '龙口市', '0');
INSERT INTO `tp_district` VALUES ('1270', '140', '莱阳市', '0');
INSERT INTO `tp_district` VALUES ('1271', '140', '莱州市', '0');
INSERT INTO `tp_district` VALUES ('1272', '140', '蓬莱市', '0');
INSERT INTO `tp_district` VALUES ('1273', '140', '招远市', '0');
INSERT INTO `tp_district` VALUES ('1274', '140', '栖霞市', '0');
INSERT INTO `tp_district` VALUES ('1275', '140', '海阳市', '0');
INSERT INTO `tp_district` VALUES ('1276', '141', '潍城区', '0');
INSERT INTO `tp_district` VALUES ('1277', '141', '寒亭区', '0');
INSERT INTO `tp_district` VALUES ('1278', '141', '坊子区', '0');
INSERT INTO `tp_district` VALUES ('1279', '141', '奎文区', '0');
INSERT INTO `tp_district` VALUES ('1280', '141', '临朐县', '0');
INSERT INTO `tp_district` VALUES ('1281', '141', '昌乐县', '0');
INSERT INTO `tp_district` VALUES ('1282', '141', '青州市', '0');
INSERT INTO `tp_district` VALUES ('1283', '141', '诸城市', '0');
INSERT INTO `tp_district` VALUES ('1284', '141', '寿光市', '0');
INSERT INTO `tp_district` VALUES ('1285', '141', '安丘市', '0');
INSERT INTO `tp_district` VALUES ('1286', '141', '高密市', '0');
INSERT INTO `tp_district` VALUES ('1287', '141', '昌邑市', '0');
INSERT INTO `tp_district` VALUES ('1288', '142', '市中区', '0');
INSERT INTO `tp_district` VALUES ('1289', '142', '任城区', '0');
INSERT INTO `tp_district` VALUES ('1290', '142', '微山县', '0');
INSERT INTO `tp_district` VALUES ('1291', '142', '鱼台县', '0');
INSERT INTO `tp_district` VALUES ('1292', '142', '金乡县', '0');
INSERT INTO `tp_district` VALUES ('1293', '142', '嘉祥县', '0');
INSERT INTO `tp_district` VALUES ('1294', '142', '汶上县', '0');
INSERT INTO `tp_district` VALUES ('1295', '142', '泗水县', '0');
INSERT INTO `tp_district` VALUES ('1296', '142', '梁山县', '0');
INSERT INTO `tp_district` VALUES ('1297', '142', '曲阜市', '0');
INSERT INTO `tp_district` VALUES ('1298', '142', '兖州市', '0');
INSERT INTO `tp_district` VALUES ('1299', '142', '邹城市', '0');
INSERT INTO `tp_district` VALUES ('1300', '143', '泰山区', '0');
INSERT INTO `tp_district` VALUES ('1301', '143', '岱岳区', '0');
INSERT INTO `tp_district` VALUES ('1302', '143', '宁阳县', '0');
INSERT INTO `tp_district` VALUES ('1303', '143', '东平县', '0');
INSERT INTO `tp_district` VALUES ('1304', '143', '新泰市', '0');
INSERT INTO `tp_district` VALUES ('1305', '143', '肥城市', '0');
INSERT INTO `tp_district` VALUES ('1306', '144', '环翠区', '0');
INSERT INTO `tp_district` VALUES ('1307', '144', '文登市', '0');
INSERT INTO `tp_district` VALUES ('1308', '144', '荣成市', '0');
INSERT INTO `tp_district` VALUES ('1309', '144', '乳山市', '0');
INSERT INTO `tp_district` VALUES ('1310', '145', '东港区', '0');
INSERT INTO `tp_district` VALUES ('1311', '145', '岚山区', '0');
INSERT INTO `tp_district` VALUES ('1312', '145', '五莲县', '0');
INSERT INTO `tp_district` VALUES ('1313', '145', '莒县', '0');
INSERT INTO `tp_district` VALUES ('1314', '146', '莱城区', '0');
INSERT INTO `tp_district` VALUES ('1315', '146', '钢城区', '0');
INSERT INTO `tp_district` VALUES ('1316', '147', '兰山区', '0');
INSERT INTO `tp_district` VALUES ('1317', '147', '罗庄区', '0');
INSERT INTO `tp_district` VALUES ('1318', '147', '河东区', '0');
INSERT INTO `tp_district` VALUES ('1319', '147', '沂南县', '0');
INSERT INTO `tp_district` VALUES ('1320', '147', '郯城县', '0');
INSERT INTO `tp_district` VALUES ('1321', '147', '沂水县', '0');
INSERT INTO `tp_district` VALUES ('1322', '147', '苍山县', '0');
INSERT INTO `tp_district` VALUES ('1323', '147', '费县', '0');
INSERT INTO `tp_district` VALUES ('1324', '147', '平邑县', '0');
INSERT INTO `tp_district` VALUES ('1325', '147', '莒南县', '0');
INSERT INTO `tp_district` VALUES ('1326', '147', '蒙阴县', '0');
INSERT INTO `tp_district` VALUES ('1327', '147', '临沭县', '0');
INSERT INTO `tp_district` VALUES ('1328', '148', '德城区', '0');
INSERT INTO `tp_district` VALUES ('1329', '148', '陵县', '0');
INSERT INTO `tp_district` VALUES ('1330', '148', '宁津县', '0');
INSERT INTO `tp_district` VALUES ('1331', '148', '庆云县', '0');
INSERT INTO `tp_district` VALUES ('1332', '148', '临邑县', '0');
INSERT INTO `tp_district` VALUES ('1333', '148', '齐河县', '0');
INSERT INTO `tp_district` VALUES ('1334', '148', '平原县', '0');
INSERT INTO `tp_district` VALUES ('1335', '148', '夏津县', '0');
INSERT INTO `tp_district` VALUES ('1336', '148', '武城县', '0');
INSERT INTO `tp_district` VALUES ('1337', '148', '乐陵市', '0');
INSERT INTO `tp_district` VALUES ('1338', '148', '禹城市', '0');
INSERT INTO `tp_district` VALUES ('1339', '149', '东昌府区', '0');
INSERT INTO `tp_district` VALUES ('1340', '149', '阳谷县', '0');
INSERT INTO `tp_district` VALUES ('1341', '149', '莘县', '0');
INSERT INTO `tp_district` VALUES ('1342', '149', '茌平县', '0');
INSERT INTO `tp_district` VALUES ('1343', '149', '东阿县', '0');
INSERT INTO `tp_district` VALUES ('1344', '149', '冠县', '0');
INSERT INTO `tp_district` VALUES ('1345', '149', '高唐县', '0');
INSERT INTO `tp_district` VALUES ('1346', '149', '临清市', '0');
INSERT INTO `tp_district` VALUES ('1347', '150', '滨城区', '0');
INSERT INTO `tp_district` VALUES ('1348', '150', '惠民县', '0');
INSERT INTO `tp_district` VALUES ('1349', '150', '阳信县', '0');
INSERT INTO `tp_district` VALUES ('1350', '150', '无棣县', '0');
INSERT INTO `tp_district` VALUES ('1351', '150', '沾化县', '0');
INSERT INTO `tp_district` VALUES ('1352', '150', '博兴县', '0');
INSERT INTO `tp_district` VALUES ('1353', '150', '邹平县', '0');
INSERT INTO `tp_district` VALUES ('1354', '151', '牡丹区', '0');
INSERT INTO `tp_district` VALUES ('1355', '151', '曹县', '0');
INSERT INTO `tp_district` VALUES ('1356', '151', '单县', '0');
INSERT INTO `tp_district` VALUES ('1357', '151', '成武县', '0');
INSERT INTO `tp_district` VALUES ('1358', '151', '巨野县', '0');
INSERT INTO `tp_district` VALUES ('1359', '151', '郓城县', '0');
INSERT INTO `tp_district` VALUES ('1360', '151', '鄄城县', '0');
INSERT INTO `tp_district` VALUES ('1361', '151', '定陶县', '0');
INSERT INTO `tp_district` VALUES ('1362', '151', '东明县', '0');
INSERT INTO `tp_district` VALUES ('1363', '152', '中原区', '0');
INSERT INTO `tp_district` VALUES ('1364', '152', '二七区', '0');
INSERT INTO `tp_district` VALUES ('1365', '152', '管城回族区', '0');
INSERT INTO `tp_district` VALUES ('1366', '152', '金水区', '0');
INSERT INTO `tp_district` VALUES ('1367', '152', '上街区', '0');
INSERT INTO `tp_district` VALUES ('1368', '152', '惠济区', '0');
INSERT INTO `tp_district` VALUES ('1369', '152', '中牟县', '0');
INSERT INTO `tp_district` VALUES ('1370', '152', '巩义市', '0');
INSERT INTO `tp_district` VALUES ('1371', '152', '荥阳市', '0');
INSERT INTO `tp_district` VALUES ('1372', '152', '新密市', '0');
INSERT INTO `tp_district` VALUES ('1373', '152', '新郑市', '0');
INSERT INTO `tp_district` VALUES ('1374', '152', '登封市', '0');
INSERT INTO `tp_district` VALUES ('1375', '153', '龙亭区', '0');
INSERT INTO `tp_district` VALUES ('1376', '153', '顺河回族区', '0');
INSERT INTO `tp_district` VALUES ('1377', '153', '鼓楼区', '0');
INSERT INTO `tp_district` VALUES ('1378', '153', '南关区', '0');
INSERT INTO `tp_district` VALUES ('1379', '153', '郊区', '0');
INSERT INTO `tp_district` VALUES ('1380', '153', '杞县', '0');
INSERT INTO `tp_district` VALUES ('1381', '153', '通许县', '0');
INSERT INTO `tp_district` VALUES ('1382', '153', '尉氏县', '0');
INSERT INTO `tp_district` VALUES ('1383', '153', '开封县', '0');
INSERT INTO `tp_district` VALUES ('1384', '153', '兰考县', '0');
INSERT INTO `tp_district` VALUES ('1385', '154', '老城区', '0');
INSERT INTO `tp_district` VALUES ('1386', '154', '西工区', '0');
INSERT INTO `tp_district` VALUES ('1387', '154', '廛河回族区', '0');
INSERT INTO `tp_district` VALUES ('1388', '154', '涧西区', '0');
INSERT INTO `tp_district` VALUES ('1389', '154', '吉利区', '0');
INSERT INTO `tp_district` VALUES ('1390', '154', '洛龙区', '0');
INSERT INTO `tp_district` VALUES ('1391', '154', '孟津县', '0');
INSERT INTO `tp_district` VALUES ('1392', '154', '新安县', '0');
INSERT INTO `tp_district` VALUES ('1393', '154', '栾川县', '0');
INSERT INTO `tp_district` VALUES ('1394', '154', '嵩县', '0');
INSERT INTO `tp_district` VALUES ('1395', '154', '汝阳县', '0');
INSERT INTO `tp_district` VALUES ('1396', '154', '宜阳县', '0');
INSERT INTO `tp_district` VALUES ('1397', '154', '洛宁县', '0');
INSERT INTO `tp_district` VALUES ('1398', '154', '伊川县', '0');
INSERT INTO `tp_district` VALUES ('1399', '154', '偃师市', '0');
INSERT INTO `tp_district` VALUES ('1400', '155', '新华区', '0');
INSERT INTO `tp_district` VALUES ('1401', '155', '卫东区', '0');
INSERT INTO `tp_district` VALUES ('1402', '155', '石龙区', '0');
INSERT INTO `tp_district` VALUES ('1403', '155', '湛河区', '0');
INSERT INTO `tp_district` VALUES ('1404', '155', '宝丰县', '0');
INSERT INTO `tp_district` VALUES ('1405', '155', '叶县', '0');
INSERT INTO `tp_district` VALUES ('1406', '155', '鲁山县', '0');
INSERT INTO `tp_district` VALUES ('1407', '155', '郏县', '0');
INSERT INTO `tp_district` VALUES ('1408', '155', '舞钢市', '0');
INSERT INTO `tp_district` VALUES ('1409', '155', '汝州市', '0');
INSERT INTO `tp_district` VALUES ('1410', '156', '文峰区', '0');
INSERT INTO `tp_district` VALUES ('1411', '156', '北关区', '0');
INSERT INTO `tp_district` VALUES ('1412', '156', '殷都区', '0');
INSERT INTO `tp_district` VALUES ('1413', '156', '龙安区', '0');
INSERT INTO `tp_district` VALUES ('1414', '156', '安阳县', '0');
INSERT INTO `tp_district` VALUES ('1415', '156', '汤阴县', '0');
INSERT INTO `tp_district` VALUES ('1416', '156', '滑县', '0');
INSERT INTO `tp_district` VALUES ('1417', '156', '内黄县', '0');
INSERT INTO `tp_district` VALUES ('1418', '156', '林州市', '0');
INSERT INTO `tp_district` VALUES ('1419', '157', '鹤山区', '0');
INSERT INTO `tp_district` VALUES ('1420', '157', '山城区', '0');
INSERT INTO `tp_district` VALUES ('1421', '157', '淇滨区', '0');
INSERT INTO `tp_district` VALUES ('1422', '157', '浚县', '0');
INSERT INTO `tp_district` VALUES ('1423', '157', '淇县', '0');
INSERT INTO `tp_district` VALUES ('1424', '158', '红旗区', '0');
INSERT INTO `tp_district` VALUES ('1425', '158', '卫滨区', '0');
INSERT INTO `tp_district` VALUES ('1426', '158', '凤泉区', '0');
INSERT INTO `tp_district` VALUES ('1427', '158', '牧野区', '0');
INSERT INTO `tp_district` VALUES ('1428', '158', '新乡县', '0');
INSERT INTO `tp_district` VALUES ('1429', '158', '获嘉县', '0');
INSERT INTO `tp_district` VALUES ('1430', '158', '原阳县', '0');
INSERT INTO `tp_district` VALUES ('1431', '158', '延津县', '0');
INSERT INTO `tp_district` VALUES ('1432', '158', '封丘县', '0');
INSERT INTO `tp_district` VALUES ('1433', '158', '长垣县', '0');
INSERT INTO `tp_district` VALUES ('1434', '158', '卫辉市', '0');
INSERT INTO `tp_district` VALUES ('1435', '158', '辉县市', '0');
INSERT INTO `tp_district` VALUES ('1436', '159', '解放区', '0');
INSERT INTO `tp_district` VALUES ('1437', '159', '中站区', '0');
INSERT INTO `tp_district` VALUES ('1438', '159', '马村区', '0');
INSERT INTO `tp_district` VALUES ('1439', '159', '山阳区', '0');
INSERT INTO `tp_district` VALUES ('1440', '159', '修武县', '0');
INSERT INTO `tp_district` VALUES ('1441', '159', '博爱县', '0');
INSERT INTO `tp_district` VALUES ('1442', '159', '武陟县', '0');
INSERT INTO `tp_district` VALUES ('1443', '159', '温县', '0');
INSERT INTO `tp_district` VALUES ('1444', '159', '济源市', '0');
INSERT INTO `tp_district` VALUES ('1445', '159', '沁阳市', '0');
INSERT INTO `tp_district` VALUES ('1446', '159', '孟州市', '0');
INSERT INTO `tp_district` VALUES ('1447', '160', '华龙区', '0');
INSERT INTO `tp_district` VALUES ('1448', '160', '清丰县', '0');
INSERT INTO `tp_district` VALUES ('1449', '160', '南乐县', '0');
INSERT INTO `tp_district` VALUES ('1450', '160', '范县', '0');
INSERT INTO `tp_district` VALUES ('1451', '160', '台前县', '0');
INSERT INTO `tp_district` VALUES ('1452', '160', '濮阳县', '0');
INSERT INTO `tp_district` VALUES ('1453', '161', '魏都区', '0');
INSERT INTO `tp_district` VALUES ('1454', '161', '许昌县', '0');
INSERT INTO `tp_district` VALUES ('1455', '161', '鄢陵县', '0');
INSERT INTO `tp_district` VALUES ('1456', '161', '襄城县', '0');
INSERT INTO `tp_district` VALUES ('1457', '161', '禹州市', '0');
INSERT INTO `tp_district` VALUES ('1458', '161', '长葛市', '0');
INSERT INTO `tp_district` VALUES ('1459', '162', '源汇区', '0');
INSERT INTO `tp_district` VALUES ('1460', '162', '郾城区', '0');
INSERT INTO `tp_district` VALUES ('1461', '162', '召陵区', '0');
INSERT INTO `tp_district` VALUES ('1462', '162', '舞阳县', '0');
INSERT INTO `tp_district` VALUES ('1463', '162', '临颍县', '0');
INSERT INTO `tp_district` VALUES ('1464', '163', '市辖区', '0');
INSERT INTO `tp_district` VALUES ('1465', '163', '湖滨区', '0');
INSERT INTO `tp_district` VALUES ('1466', '163', '渑池县', '0');
INSERT INTO `tp_district` VALUES ('1467', '163', '陕县', '0');
INSERT INTO `tp_district` VALUES ('1468', '163', '卢氏县', '0');
INSERT INTO `tp_district` VALUES ('1469', '163', '义马市', '0');
INSERT INTO `tp_district` VALUES ('1470', '163', '灵宝市', '0');
INSERT INTO `tp_district` VALUES ('1471', '164', '宛城区', '0');
INSERT INTO `tp_district` VALUES ('1472', '164', '卧龙区', '0');
INSERT INTO `tp_district` VALUES ('1473', '164', '南召县', '0');
INSERT INTO `tp_district` VALUES ('1474', '164', '方城县', '0');
INSERT INTO `tp_district` VALUES ('1475', '164', '西峡县', '0');
INSERT INTO `tp_district` VALUES ('1476', '164', '镇平县', '0');
INSERT INTO `tp_district` VALUES ('1477', '164', '内乡县', '0');
INSERT INTO `tp_district` VALUES ('1478', '164', '淅川县', '0');
INSERT INTO `tp_district` VALUES ('1479', '164', '社旗县', '0');
INSERT INTO `tp_district` VALUES ('1480', '164', '唐河县', '0');
INSERT INTO `tp_district` VALUES ('1481', '164', '新野县', '0');
INSERT INTO `tp_district` VALUES ('1482', '164', '桐柏县', '0');
INSERT INTO `tp_district` VALUES ('1483', '164', '邓州市', '0');
INSERT INTO `tp_district` VALUES ('1484', '165', '梁园区', '0');
INSERT INTO `tp_district` VALUES ('1485', '165', '睢阳区', '0');
INSERT INTO `tp_district` VALUES ('1486', '165', '民权县', '0');
INSERT INTO `tp_district` VALUES ('1487', '165', '睢县', '0');
INSERT INTO `tp_district` VALUES ('1488', '165', '宁陵县', '0');
INSERT INTO `tp_district` VALUES ('1489', '165', '柘城县', '0');
INSERT INTO `tp_district` VALUES ('1490', '165', '虞城县', '0');
INSERT INTO `tp_district` VALUES ('1491', '165', '夏邑县', '0');
INSERT INTO `tp_district` VALUES ('1492', '165', '永城市', '0');
INSERT INTO `tp_district` VALUES ('1493', '166', '浉河区', '0');
INSERT INTO `tp_district` VALUES ('1494', '166', '平桥区', '0');
INSERT INTO `tp_district` VALUES ('1495', '166', '罗山县', '0');
INSERT INTO `tp_district` VALUES ('1496', '166', '光山县', '0');
INSERT INTO `tp_district` VALUES ('1497', '166', '新县', '0');
INSERT INTO `tp_district` VALUES ('1498', '166', '商城县', '0');
INSERT INTO `tp_district` VALUES ('1499', '166', '固始县', '0');
INSERT INTO `tp_district` VALUES ('1500', '166', '潢川县', '0');
INSERT INTO `tp_district` VALUES ('1501', '166', '淮滨县', '0');
INSERT INTO `tp_district` VALUES ('1502', '166', '息县', '0');
INSERT INTO `tp_district` VALUES ('1503', '167', '川汇区', '0');
INSERT INTO `tp_district` VALUES ('1504', '167', '扶沟县', '0');
INSERT INTO `tp_district` VALUES ('1505', '167', '西华县', '0');
INSERT INTO `tp_district` VALUES ('1506', '167', '商水县', '0');
INSERT INTO `tp_district` VALUES ('1507', '167', '沈丘县', '0');
INSERT INTO `tp_district` VALUES ('1508', '167', '郸城县', '0');
INSERT INTO `tp_district` VALUES ('1509', '167', '淮阳县', '0');
INSERT INTO `tp_district` VALUES ('1510', '167', '太康县', '0');
INSERT INTO `tp_district` VALUES ('1511', '167', '鹿邑县', '0');
INSERT INTO `tp_district` VALUES ('1512', '167', '项城市', '0');
INSERT INTO `tp_district` VALUES ('1513', '168', '驿城区', '0');
INSERT INTO `tp_district` VALUES ('1514', '168', '西平县', '0');
INSERT INTO `tp_district` VALUES ('1515', '168', '上蔡县', '0');
INSERT INTO `tp_district` VALUES ('1516', '168', '平舆县', '0');
INSERT INTO `tp_district` VALUES ('1517', '168', '正阳县', '0');
INSERT INTO `tp_district` VALUES ('1518', '168', '确山县', '0');
INSERT INTO `tp_district` VALUES ('1519', '168', '泌阳县', '0');
INSERT INTO `tp_district` VALUES ('1520', '168', '汝南县', '0');
INSERT INTO `tp_district` VALUES ('1521', '168', '遂平县', '0');
INSERT INTO `tp_district` VALUES ('1522', '168', '新蔡县', '0');
INSERT INTO `tp_district` VALUES ('1523', '169', '江岸区', '0');
INSERT INTO `tp_district` VALUES ('1524', '169', '江汉区', '0');
INSERT INTO `tp_district` VALUES ('1525', '169', '硚口区', '0');
INSERT INTO `tp_district` VALUES ('1526', '169', '汉阳区', '0');
INSERT INTO `tp_district` VALUES ('1527', '169', '武昌区', '0');
INSERT INTO `tp_district` VALUES ('1528', '169', '青山区', '0');
INSERT INTO `tp_district` VALUES ('1529', '169', '洪山区', '0');
INSERT INTO `tp_district` VALUES ('1530', '169', '东西湖区', '0');
INSERT INTO `tp_district` VALUES ('1531', '169', '汉南区', '0');
INSERT INTO `tp_district` VALUES ('1532', '169', '蔡甸区', '0');
INSERT INTO `tp_district` VALUES ('1533', '169', '江夏区', '0');
INSERT INTO `tp_district` VALUES ('1534', '169', '黄陂区', '0');
INSERT INTO `tp_district` VALUES ('1535', '169', '新洲区', '0');
INSERT INTO `tp_district` VALUES ('1536', '170', '黄石港区', '0');
INSERT INTO `tp_district` VALUES ('1537', '170', '西塞山区', '0');
INSERT INTO `tp_district` VALUES ('1538', '170', '下陆区', '0');
INSERT INTO `tp_district` VALUES ('1539', '170', '铁山区', '0');
INSERT INTO `tp_district` VALUES ('1540', '170', '阳新县', '0');
INSERT INTO `tp_district` VALUES ('1541', '170', '大冶市', '0');
INSERT INTO `tp_district` VALUES ('1542', '171', '茅箭区', '0');
INSERT INTO `tp_district` VALUES ('1543', '171', '张湾区', '0');
INSERT INTO `tp_district` VALUES ('1544', '171', '郧县', '0');
INSERT INTO `tp_district` VALUES ('1545', '171', '郧西县', '0');
INSERT INTO `tp_district` VALUES ('1546', '171', '竹山县', '0');
INSERT INTO `tp_district` VALUES ('1547', '171', '竹溪县', '0');
INSERT INTO `tp_district` VALUES ('1548', '171', '房县', '0');
INSERT INTO `tp_district` VALUES ('1549', '171', '丹江口市', '0');
INSERT INTO `tp_district` VALUES ('1550', '172', '西陵区', '0');
INSERT INTO `tp_district` VALUES ('1551', '172', '伍家岗区', '0');
INSERT INTO `tp_district` VALUES ('1552', '172', '点军区', '0');
INSERT INTO `tp_district` VALUES ('1553', '172', '猇亭区', '0');
INSERT INTO `tp_district` VALUES ('1554', '172', '夷陵区', '0');
INSERT INTO `tp_district` VALUES ('1555', '172', '远安县', '0');
INSERT INTO `tp_district` VALUES ('1556', '172', '兴山县', '0');
INSERT INTO `tp_district` VALUES ('1557', '172', '秭归县', '0');
INSERT INTO `tp_district` VALUES ('1558', '172', '长阳土家族自治县', '0');
INSERT INTO `tp_district` VALUES ('1559', '172', '五峰土家族自治县', '0');
INSERT INTO `tp_district` VALUES ('1560', '172', '宜都市', '0');
INSERT INTO `tp_district` VALUES ('1561', '172', '当阳市', '0');
INSERT INTO `tp_district` VALUES ('1562', '172', '枝江市', '0');
INSERT INTO `tp_district` VALUES ('1563', '173', '襄城区', '0');
INSERT INTO `tp_district` VALUES ('1564', '173', '樊城区', '0');
INSERT INTO `tp_district` VALUES ('1565', '173', '襄阳区', '0');
INSERT INTO `tp_district` VALUES ('1566', '173', '南漳县', '0');
INSERT INTO `tp_district` VALUES ('1567', '173', '谷城县', '0');
INSERT INTO `tp_district` VALUES ('1568', '173', '保康县', '0');
INSERT INTO `tp_district` VALUES ('1569', '173', '老河口市', '0');
INSERT INTO `tp_district` VALUES ('1570', '173', '枣阳市', '0');
INSERT INTO `tp_district` VALUES ('1571', '173', '宜城市', '0');
INSERT INTO `tp_district` VALUES ('1572', '174', '梁子湖区', '0');
INSERT INTO `tp_district` VALUES ('1573', '174', '华容区', '0');
INSERT INTO `tp_district` VALUES ('1574', '174', '鄂城区', '0');
INSERT INTO `tp_district` VALUES ('1575', '175', '东宝区', '0');
INSERT INTO `tp_district` VALUES ('1576', '175', '掇刀区', '0');
INSERT INTO `tp_district` VALUES ('1577', '175', '京山县', '0');
INSERT INTO `tp_district` VALUES ('1578', '175', '沙洋县', '0');
INSERT INTO `tp_district` VALUES ('1579', '175', '钟祥市', '0');
INSERT INTO `tp_district` VALUES ('1580', '176', '孝南区', '0');
INSERT INTO `tp_district` VALUES ('1581', '176', '孝昌县', '0');
INSERT INTO `tp_district` VALUES ('1582', '176', '大悟县', '0');
INSERT INTO `tp_district` VALUES ('1583', '176', '云梦县', '0');
INSERT INTO `tp_district` VALUES ('1584', '176', '应城市', '0');
INSERT INTO `tp_district` VALUES ('1585', '176', '安陆市', '0');
INSERT INTO `tp_district` VALUES ('1586', '176', '汉川市', '0');
INSERT INTO `tp_district` VALUES ('1587', '177', '沙市区', '0');
INSERT INTO `tp_district` VALUES ('1588', '177', '荆州区', '0');
INSERT INTO `tp_district` VALUES ('1589', '177', '公安县', '0');
INSERT INTO `tp_district` VALUES ('1590', '177', '监利县', '0');
INSERT INTO `tp_district` VALUES ('1591', '177', '江陵县', '0');
INSERT INTO `tp_district` VALUES ('1592', '177', '石首市', '0');
INSERT INTO `tp_district` VALUES ('1593', '177', '洪湖市', '0');
INSERT INTO `tp_district` VALUES ('1594', '177', '松滋市', '0');
INSERT INTO `tp_district` VALUES ('1595', '178', '黄州区', '0');
INSERT INTO `tp_district` VALUES ('1596', '178', '团风县', '0');
INSERT INTO `tp_district` VALUES ('1597', '178', '红安县', '0');
INSERT INTO `tp_district` VALUES ('1598', '178', '罗田县', '0');
INSERT INTO `tp_district` VALUES ('1599', '178', '英山县', '0');
INSERT INTO `tp_district` VALUES ('1600', '178', '浠水县', '0');
INSERT INTO `tp_district` VALUES ('1601', '178', '蕲春县', '0');
INSERT INTO `tp_district` VALUES ('1602', '178', '黄梅县', '0');
INSERT INTO `tp_district` VALUES ('1603', '178', '麻城市', '0');
INSERT INTO `tp_district` VALUES ('1604', '178', '武穴市', '0');
INSERT INTO `tp_district` VALUES ('1605', '179', '咸安区', '0');
INSERT INTO `tp_district` VALUES ('1606', '179', '嘉鱼县', '0');
INSERT INTO `tp_district` VALUES ('1607', '179', '通城县', '0');
INSERT INTO `tp_district` VALUES ('1608', '179', '崇阳县', '0');
INSERT INTO `tp_district` VALUES ('1609', '179', '通山县', '0');
INSERT INTO `tp_district` VALUES ('1610', '179', '赤壁市', '0');
INSERT INTO `tp_district` VALUES ('1611', '180', '曾都区', '0');
INSERT INTO `tp_district` VALUES ('1612', '180', '广水市', '0');
INSERT INTO `tp_district` VALUES ('1613', '181', '恩施市', '0');
INSERT INTO `tp_district` VALUES ('1614', '181', '利川市', '0');
INSERT INTO `tp_district` VALUES ('1615', '181', '建始县', '0');
INSERT INTO `tp_district` VALUES ('1616', '181', '巴东县', '0');
INSERT INTO `tp_district` VALUES ('1617', '181', '宣恩县', '0');
INSERT INTO `tp_district` VALUES ('1618', '181', '咸丰县', '0');
INSERT INTO `tp_district` VALUES ('1619', '181', '来凤县', '0');
INSERT INTO `tp_district` VALUES ('1620', '181', '鹤峰县', '0');
INSERT INTO `tp_district` VALUES ('1621', '182', '仙桃市', '0');
INSERT INTO `tp_district` VALUES ('1622', '182', '潜江市', '0');
INSERT INTO `tp_district` VALUES ('1623', '182', '天门市', '0');
INSERT INTO `tp_district` VALUES ('1624', '182', '神农架林区', '0');
INSERT INTO `tp_district` VALUES ('1625', '183', '芙蓉区', '0');
INSERT INTO `tp_district` VALUES ('1626', '183', '天心区', '0');
INSERT INTO `tp_district` VALUES ('1627', '183', '岳麓区', '0');
INSERT INTO `tp_district` VALUES ('1628', '183', '开福区', '0');
INSERT INTO `tp_district` VALUES ('1629', '183', '雨花区', '0');
INSERT INTO `tp_district` VALUES ('1630', '183', '长沙县', '0');
INSERT INTO `tp_district` VALUES ('1631', '183', '望城县', '0');
INSERT INTO `tp_district` VALUES ('1632', '183', '宁乡县', '0');
INSERT INTO `tp_district` VALUES ('1633', '183', '浏阳市', '0');
INSERT INTO `tp_district` VALUES ('1634', '184', '荷塘区', '0');
INSERT INTO `tp_district` VALUES ('1635', '184', '芦淞区', '0');
INSERT INTO `tp_district` VALUES ('1636', '184', '石峰区', '0');
INSERT INTO `tp_district` VALUES ('1637', '184', '天元区', '0');
INSERT INTO `tp_district` VALUES ('1638', '184', '株洲县', '0');
INSERT INTO `tp_district` VALUES ('1639', '184', '攸县', '0');
INSERT INTO `tp_district` VALUES ('1640', '184', '茶陵县', '0');
INSERT INTO `tp_district` VALUES ('1641', '184', '炎陵县', '0');
INSERT INTO `tp_district` VALUES ('1642', '184', '醴陵市', '0');
INSERT INTO `tp_district` VALUES ('1643', '185', '雨湖区', '0');
INSERT INTO `tp_district` VALUES ('1644', '185', '岳塘区', '0');
INSERT INTO `tp_district` VALUES ('1645', '185', '湘潭县', '0');
INSERT INTO `tp_district` VALUES ('1646', '185', '湘乡市', '0');
INSERT INTO `tp_district` VALUES ('1647', '185', '韶山市', '0');
INSERT INTO `tp_district` VALUES ('1648', '186', '珠晖区', '0');
INSERT INTO `tp_district` VALUES ('1649', '186', '雁峰区', '0');
INSERT INTO `tp_district` VALUES ('1650', '186', '石鼓区', '0');
INSERT INTO `tp_district` VALUES ('1651', '186', '蒸湘区', '0');
INSERT INTO `tp_district` VALUES ('1652', '186', '南岳区', '0');
INSERT INTO `tp_district` VALUES ('1653', '186', '衡阳县', '0');
INSERT INTO `tp_district` VALUES ('1654', '186', '衡南县', '0');
INSERT INTO `tp_district` VALUES ('1655', '186', '衡山县', '0');
INSERT INTO `tp_district` VALUES ('1656', '186', '衡东县', '0');
INSERT INTO `tp_district` VALUES ('1657', '186', '祁东县', '0');
INSERT INTO `tp_district` VALUES ('1658', '186', '耒阳市', '0');
INSERT INTO `tp_district` VALUES ('1659', '186', '常宁市', '0');
INSERT INTO `tp_district` VALUES ('1660', '187', '双清区', '0');
INSERT INTO `tp_district` VALUES ('1661', '187', '大祥区', '0');
INSERT INTO `tp_district` VALUES ('1662', '187', '北塔区', '0');
INSERT INTO `tp_district` VALUES ('1663', '187', '邵东县', '0');
INSERT INTO `tp_district` VALUES ('1664', '187', '新邵县', '0');
INSERT INTO `tp_district` VALUES ('1665', '187', '邵阳县', '0');
INSERT INTO `tp_district` VALUES ('1666', '187', '隆回县', '0');
INSERT INTO `tp_district` VALUES ('1667', '187', '洞口县', '0');
INSERT INTO `tp_district` VALUES ('1668', '187', '绥宁县', '0');
INSERT INTO `tp_district` VALUES ('1669', '187', '新宁县', '0');
INSERT INTO `tp_district` VALUES ('1670', '187', '城步苗族自治县', '0');
INSERT INTO `tp_district` VALUES ('1671', '187', '武冈市', '0');
INSERT INTO `tp_district` VALUES ('1672', '188', '岳阳楼区', '0');
INSERT INTO `tp_district` VALUES ('1673', '188', '云溪区', '0');
INSERT INTO `tp_district` VALUES ('1674', '188', '君山区', '0');
INSERT INTO `tp_district` VALUES ('1675', '188', '岳阳县', '0');
INSERT INTO `tp_district` VALUES ('1676', '188', '华容县', '0');
INSERT INTO `tp_district` VALUES ('1677', '188', '湘阴县', '0');
INSERT INTO `tp_district` VALUES ('1678', '188', '平江县', '0');
INSERT INTO `tp_district` VALUES ('1679', '188', '汨罗市', '0');
INSERT INTO `tp_district` VALUES ('1680', '188', '临湘市', '0');
INSERT INTO `tp_district` VALUES ('1681', '189', '武陵区', '0');
INSERT INTO `tp_district` VALUES ('1682', '189', '鼎城区', '0');
INSERT INTO `tp_district` VALUES ('1683', '189', '安乡县', '0');
INSERT INTO `tp_district` VALUES ('1684', '189', '汉寿县', '0');
INSERT INTO `tp_district` VALUES ('1685', '189', '澧县', '0');
INSERT INTO `tp_district` VALUES ('1686', '189', '临澧县', '0');
INSERT INTO `tp_district` VALUES ('1687', '189', '桃源县', '0');
INSERT INTO `tp_district` VALUES ('1688', '189', '石门县', '0');
INSERT INTO `tp_district` VALUES ('1689', '189', '津市市', '0');
INSERT INTO `tp_district` VALUES ('1690', '190', '永定区', '0');
INSERT INTO `tp_district` VALUES ('1691', '190', '武陵源区', '0');
INSERT INTO `tp_district` VALUES ('1692', '190', '慈利县', '0');
INSERT INTO `tp_district` VALUES ('1693', '190', '桑植县', '0');
INSERT INTO `tp_district` VALUES ('1694', '191', '资阳区', '0');
INSERT INTO `tp_district` VALUES ('1695', '191', '赫山区', '0');
INSERT INTO `tp_district` VALUES ('1696', '191', '南县', '0');
INSERT INTO `tp_district` VALUES ('1697', '191', '桃江县', '0');
INSERT INTO `tp_district` VALUES ('1698', '191', '安化县', '0');
INSERT INTO `tp_district` VALUES ('1699', '191', '沅江市', '0');
INSERT INTO `tp_district` VALUES ('1700', '192', '北湖区', '0');
INSERT INTO `tp_district` VALUES ('1701', '192', '苏仙区', '0');
INSERT INTO `tp_district` VALUES ('1702', '192', '桂阳县', '0');
INSERT INTO `tp_district` VALUES ('1703', '192', '宜章县', '0');
INSERT INTO `tp_district` VALUES ('1704', '192', '永兴县', '0');
INSERT INTO `tp_district` VALUES ('1705', '192', '嘉禾县', '0');
INSERT INTO `tp_district` VALUES ('1706', '192', '临武县', '0');
INSERT INTO `tp_district` VALUES ('1707', '192', '汝城县', '0');
INSERT INTO `tp_district` VALUES ('1708', '192', '桂东县', '0');
INSERT INTO `tp_district` VALUES ('1709', '192', '安仁县', '0');
INSERT INTO `tp_district` VALUES ('1710', '192', '资兴市', '0');
INSERT INTO `tp_district` VALUES ('1711', '193', '芝山区', '0');
INSERT INTO `tp_district` VALUES ('1712', '193', '冷水滩区', '0');
INSERT INTO `tp_district` VALUES ('1713', '193', '祁阳县', '0');
INSERT INTO `tp_district` VALUES ('1714', '193', '东安县', '0');
INSERT INTO `tp_district` VALUES ('1715', '193', '双牌县', '0');
INSERT INTO `tp_district` VALUES ('1716', '193', '道县', '0');
INSERT INTO `tp_district` VALUES ('1717', '193', '江永县', '0');
INSERT INTO `tp_district` VALUES ('1718', '193', '宁远县', '0');
INSERT INTO `tp_district` VALUES ('1719', '193', '蓝山县', '0');
INSERT INTO `tp_district` VALUES ('1720', '193', '新田县', '0');
INSERT INTO `tp_district` VALUES ('1721', '193', '江华瑶族自治县', '0');
INSERT INTO `tp_district` VALUES ('1722', '194', '鹤城区', '0');
INSERT INTO `tp_district` VALUES ('1723', '194', '中方县', '0');
INSERT INTO `tp_district` VALUES ('1724', '194', '沅陵县', '0');
INSERT INTO `tp_district` VALUES ('1725', '194', '辰溪县', '0');
INSERT INTO `tp_district` VALUES ('1726', '194', '溆浦县', '0');
INSERT INTO `tp_district` VALUES ('1727', '194', '会同县', '0');
INSERT INTO `tp_district` VALUES ('1728', '194', '麻阳苗族自治县', '0');
INSERT INTO `tp_district` VALUES ('1729', '194', '新晃侗族自治县', '0');
INSERT INTO `tp_district` VALUES ('1730', '194', '芷江侗族自治县', '0');
INSERT INTO `tp_district` VALUES ('1731', '194', '靖州苗族侗族自治县', '0');
INSERT INTO `tp_district` VALUES ('1732', '194', '通道侗族自治县', '0');
INSERT INTO `tp_district` VALUES ('1733', '194', '洪江市', '0');
INSERT INTO `tp_district` VALUES ('1734', '195', '娄星区', '0');
INSERT INTO `tp_district` VALUES ('1735', '195', '双峰县', '0');
INSERT INTO `tp_district` VALUES ('1736', '195', '新化县', '0');
INSERT INTO `tp_district` VALUES ('1737', '195', '冷水江市', '0');
INSERT INTO `tp_district` VALUES ('1738', '195', '涟源市', '0');
INSERT INTO `tp_district` VALUES ('1739', '196', '吉首市', '0');
INSERT INTO `tp_district` VALUES ('1740', '196', '泸溪县', '0');
INSERT INTO `tp_district` VALUES ('1741', '196', '凤凰县', '0');
INSERT INTO `tp_district` VALUES ('1742', '196', '花垣县', '0');
INSERT INTO `tp_district` VALUES ('1743', '196', '保靖县', '0');
INSERT INTO `tp_district` VALUES ('1744', '196', '古丈县', '0');
INSERT INTO `tp_district` VALUES ('1745', '196', '永顺县', '0');
INSERT INTO `tp_district` VALUES ('1746', '196', '龙山县', '0');
INSERT INTO `tp_district` VALUES ('1747', '197', '东山区', '0');
INSERT INTO `tp_district` VALUES ('1748', '197', '荔湾区', '0');
INSERT INTO `tp_district` VALUES ('1749', '197', '越秀区', '0');
INSERT INTO `tp_district` VALUES ('1750', '197', '海珠区', '0');
INSERT INTO `tp_district` VALUES ('1751', '197', '天河区', '0');
INSERT INTO `tp_district` VALUES ('1752', '197', '芳村区', '0');
INSERT INTO `tp_district` VALUES ('1753', '197', '白云区', '0');
INSERT INTO `tp_district` VALUES ('1754', '197', '黄埔区', '0');
INSERT INTO `tp_district` VALUES ('1755', '197', '番禺区', '0');
INSERT INTO `tp_district` VALUES ('1756', '197', '花都区', '0');
INSERT INTO `tp_district` VALUES ('1757', '197', '增城市', '0');
INSERT INTO `tp_district` VALUES ('1759', '198', '武江区', '0');
INSERT INTO `tp_district` VALUES ('1760', '198', '浈江区', '0');
INSERT INTO `tp_district` VALUES ('1761', '198', '曲江区', '0');
INSERT INTO `tp_district` VALUES ('1762', '198', '始兴县', '0');
INSERT INTO `tp_district` VALUES ('1763', '198', '仁化县', '0');
INSERT INTO `tp_district` VALUES ('1764', '198', '翁源县', '0');
INSERT INTO `tp_district` VALUES ('1765', '198', '乳源瑶族自治县', '0');
INSERT INTO `tp_district` VALUES ('1766', '198', '新丰县', '0');
INSERT INTO `tp_district` VALUES ('1767', '198', '乐昌市', '0');
INSERT INTO `tp_district` VALUES ('1768', '198', '南雄市', '0');
INSERT INTO `tp_district` VALUES ('1769', '199', '罗湖区', '0');
INSERT INTO `tp_district` VALUES ('1770', '199', '福田区', '0');
INSERT INTO `tp_district` VALUES ('1771', '199', '南山区', '0');
INSERT INTO `tp_district` VALUES ('1772', '199', '宝安区', '0');
INSERT INTO `tp_district` VALUES ('1773', '199', '龙岗区', '0');
INSERT INTO `tp_district` VALUES ('1774', '199', '盐田区', '0');
INSERT INTO `tp_district` VALUES ('1775', '200', '香洲区', '0');
INSERT INTO `tp_district` VALUES ('1776', '200', '斗门区', '0');
INSERT INTO `tp_district` VALUES ('1777', '200', '金湾区', '0');
INSERT INTO `tp_district` VALUES ('1778', '201', '龙湖区', '0');
INSERT INTO `tp_district` VALUES ('1779', '201', '金平区', '0');
INSERT INTO `tp_district` VALUES ('1780', '201', '濠江区', '0');
INSERT INTO `tp_district` VALUES ('1781', '201', '潮阳区', '0');
INSERT INTO `tp_district` VALUES ('1782', '201', '潮南区', '0');
INSERT INTO `tp_district` VALUES ('1783', '201', '澄海区', '0');
INSERT INTO `tp_district` VALUES ('1784', '201', '南澳县', '0');
INSERT INTO `tp_district` VALUES ('1785', '202', '禅城区', '0');
INSERT INTO `tp_district` VALUES ('1786', '202', '南海区', '0');
INSERT INTO `tp_district` VALUES ('1787', '202', '顺德区', '0');
INSERT INTO `tp_district` VALUES ('1788', '202', '三水区', '0');
INSERT INTO `tp_district` VALUES ('1789', '202', '高明区', '0');
INSERT INTO `tp_district` VALUES ('1790', '203', '蓬江区', '0');
INSERT INTO `tp_district` VALUES ('1791', '203', '江海区', '0');
INSERT INTO `tp_district` VALUES ('1792', '203', '新会区', '0');
INSERT INTO `tp_district` VALUES ('1793', '203', '台山市', '0');
INSERT INTO `tp_district` VALUES ('1794', '203', '开平市', '0');
INSERT INTO `tp_district` VALUES ('1795', '203', '鹤山市', '0');
INSERT INTO `tp_district` VALUES ('1796', '203', '恩平市', '0');
INSERT INTO `tp_district` VALUES ('1797', '204', '赤坎区', '0');
INSERT INTO `tp_district` VALUES ('1798', '204', '霞山区', '0');
INSERT INTO `tp_district` VALUES ('1799', '204', '坡头区', '0');
INSERT INTO `tp_district` VALUES ('1800', '204', '麻章区', '0');
INSERT INTO `tp_district` VALUES ('1801', '204', '遂溪县', '0');
INSERT INTO `tp_district` VALUES ('1802', '204', '徐闻县', '0');
INSERT INTO `tp_district` VALUES ('1803', '204', '廉江市', '0');
INSERT INTO `tp_district` VALUES ('1804', '204', '雷州市', '0');
INSERT INTO `tp_district` VALUES ('1805', '204', '吴川市', '0');
INSERT INTO `tp_district` VALUES ('1806', '205', '茂南区', '0');
INSERT INTO `tp_district` VALUES ('1807', '205', '茂港区', '0');
INSERT INTO `tp_district` VALUES ('1808', '205', '电白县', '0');
INSERT INTO `tp_district` VALUES ('1809', '205', '高州市', '0');
INSERT INTO `tp_district` VALUES ('1810', '205', '化州市', '0');
INSERT INTO `tp_district` VALUES ('1811', '205', '信宜市', '0');
INSERT INTO `tp_district` VALUES ('1812', '206', '端州区', '0');
INSERT INTO `tp_district` VALUES ('1813', '206', '鼎湖区', '0');
INSERT INTO `tp_district` VALUES ('1814', '206', '广宁县', '0');
INSERT INTO `tp_district` VALUES ('1815', '206', '怀集县', '0');
INSERT INTO `tp_district` VALUES ('1816', '206', '封开县', '0');
INSERT INTO `tp_district` VALUES ('1817', '206', '德庆县', '0');
INSERT INTO `tp_district` VALUES ('1818', '206', '高要市', '0');
INSERT INTO `tp_district` VALUES ('1819', '206', '四会市', '0');
INSERT INTO `tp_district` VALUES ('1820', '207', '惠城区', '0');
INSERT INTO `tp_district` VALUES ('1821', '207', '惠阳区', '0');
INSERT INTO `tp_district` VALUES ('1822', '207', '博罗县', '0');
INSERT INTO `tp_district` VALUES ('1823', '207', '惠东县', '0');
INSERT INTO `tp_district` VALUES ('1824', '207', '龙门县', '0');
INSERT INTO `tp_district` VALUES ('1825', '208', '梅江区', '0');
INSERT INTO `tp_district` VALUES ('1826', '208', '梅县', '0');
INSERT INTO `tp_district` VALUES ('1827', '208', '大埔县', '0');
INSERT INTO `tp_district` VALUES ('1828', '208', '丰顺县', '0');
INSERT INTO `tp_district` VALUES ('1829', '208', '五华县', '0');
INSERT INTO `tp_district` VALUES ('1830', '208', '平远县', '0');
INSERT INTO `tp_district` VALUES ('1831', '208', '蕉岭县', '0');
INSERT INTO `tp_district` VALUES ('1832', '208', '兴宁市', '0');
INSERT INTO `tp_district` VALUES ('1833', '209', '城区', '0');
INSERT INTO `tp_district` VALUES ('1834', '209', '海丰县', '0');
INSERT INTO `tp_district` VALUES ('1835', '209', '陆河县', '0');
INSERT INTO `tp_district` VALUES ('1836', '209', '陆丰市', '0');
INSERT INTO `tp_district` VALUES ('1837', '210', '源城区', '0');
INSERT INTO `tp_district` VALUES ('1838', '210', '紫金县', '0');
INSERT INTO `tp_district` VALUES ('1839', '210', '龙川县', '0');
INSERT INTO `tp_district` VALUES ('1840', '210', '连平县', '0');
INSERT INTO `tp_district` VALUES ('1841', '210', '和平县', '0');
INSERT INTO `tp_district` VALUES ('1842', '210', '东源县', '0');
INSERT INTO `tp_district` VALUES ('1843', '211', '江城区', '0');
INSERT INTO `tp_district` VALUES ('1844', '211', '阳西县', '0');
INSERT INTO `tp_district` VALUES ('1845', '211', '阳东县', '0');
INSERT INTO `tp_district` VALUES ('1846', '211', '阳春市', '0');
INSERT INTO `tp_district` VALUES ('1847', '212', '清城区', '0');
INSERT INTO `tp_district` VALUES ('1848', '212', '佛冈县', '0');
INSERT INTO `tp_district` VALUES ('1849', '212', '阳山县', '0');
INSERT INTO `tp_district` VALUES ('1850', '212', '连山壮族瑶族自治县', '0');
INSERT INTO `tp_district` VALUES ('1851', '212', '连南瑶族自治县', '0');
INSERT INTO `tp_district` VALUES ('1852', '212', '清新县', '0');
INSERT INTO `tp_district` VALUES ('1853', '212', '英德市', '0');
INSERT INTO `tp_district` VALUES ('1854', '212', '连州市', '0');
INSERT INTO `tp_district` VALUES ('1855', '215', '湘桥区', '0');
INSERT INTO `tp_district` VALUES ('1856', '215', '潮安县', '0');
INSERT INTO `tp_district` VALUES ('1857', '215', '饶平县', '0');
INSERT INTO `tp_district` VALUES ('1858', '216', '榕城区', '0');
INSERT INTO `tp_district` VALUES ('1859', '216', '揭东县', '0');
INSERT INTO `tp_district` VALUES ('1860', '216', '揭西县', '0');
INSERT INTO `tp_district` VALUES ('1861', '216', '惠来县', '0');
INSERT INTO `tp_district` VALUES ('1862', '216', '普宁市', '0');
INSERT INTO `tp_district` VALUES ('1863', '217', '云城区', '0');
INSERT INTO `tp_district` VALUES ('1864', '217', '新兴县', '0');
INSERT INTO `tp_district` VALUES ('1865', '217', '郁南县', '0');
INSERT INTO `tp_district` VALUES ('1866', '217', '云安县', '0');
INSERT INTO `tp_district` VALUES ('1867', '217', '罗定市', '0');
INSERT INTO `tp_district` VALUES ('1868', '218', '兴宁区', '0');
INSERT INTO `tp_district` VALUES ('1869', '218', '青秀区', '0');
INSERT INTO `tp_district` VALUES ('1870', '218', '江南区', '0');
INSERT INTO `tp_district` VALUES ('1871', '218', '西乡塘区', '0');
INSERT INTO `tp_district` VALUES ('1872', '218', '良庆区', '0');
INSERT INTO `tp_district` VALUES ('1873', '218', '邕宁区', '0');
INSERT INTO `tp_district` VALUES ('1874', '218', '武鸣县', '0');
INSERT INTO `tp_district` VALUES ('1875', '218', '隆安县', '0');
INSERT INTO `tp_district` VALUES ('1876', '218', '马山县', '0');
INSERT INTO `tp_district` VALUES ('1877', '218', '上林县', '0');
INSERT INTO `tp_district` VALUES ('1878', '218', '宾阳县', '0');
INSERT INTO `tp_district` VALUES ('1879', '218', '横县', '0');
INSERT INTO `tp_district` VALUES ('1880', '219', '城中区', '0');
INSERT INTO `tp_district` VALUES ('1881', '219', '鱼峰区', '0');
INSERT INTO `tp_district` VALUES ('1882', '219', '柳南区', '0');
INSERT INTO `tp_district` VALUES ('1883', '219', '柳北区', '0');
INSERT INTO `tp_district` VALUES ('1884', '219', '柳江县', '0');
INSERT INTO `tp_district` VALUES ('1885', '219', '柳城县', '0');
INSERT INTO `tp_district` VALUES ('1886', '219', '鹿寨县', '0');
INSERT INTO `tp_district` VALUES ('1887', '219', '融安县', '0');
INSERT INTO `tp_district` VALUES ('1888', '219', '融水苗族自治县', '0');
INSERT INTO `tp_district` VALUES ('1889', '219', '三江侗族自治县', '0');
INSERT INTO `tp_district` VALUES ('1890', '220', '秀峰区', '0');
INSERT INTO `tp_district` VALUES ('1891', '220', '叠彩区', '0');
INSERT INTO `tp_district` VALUES ('1892', '220', '象山区', '0');
INSERT INTO `tp_district` VALUES ('1893', '220', '七星区', '0');
INSERT INTO `tp_district` VALUES ('1894', '220', '雁山区', '0');
INSERT INTO `tp_district` VALUES ('1895', '220', '阳朔县', '0');
INSERT INTO `tp_district` VALUES ('1896', '220', '临桂县', '0');
INSERT INTO `tp_district` VALUES ('1897', '220', '灵川县', '0');
INSERT INTO `tp_district` VALUES ('1898', '220', '全州县', '0');
INSERT INTO `tp_district` VALUES ('1899', '220', '兴安县', '0');
INSERT INTO `tp_district` VALUES ('1900', '220', '永福县', '0');
INSERT INTO `tp_district` VALUES ('1901', '220', '灌阳县', '0');
INSERT INTO `tp_district` VALUES ('1902', '220', '龙胜各族自治县', '0');
INSERT INTO `tp_district` VALUES ('1903', '220', '资源县', '0');
INSERT INTO `tp_district` VALUES ('1904', '220', '平乐县', '0');
INSERT INTO `tp_district` VALUES ('1905', '220', '荔蒲县', '0');
INSERT INTO `tp_district` VALUES ('1906', '220', '恭城瑶族自治县', '0');
INSERT INTO `tp_district` VALUES ('1907', '221', '万秀区', '0');
INSERT INTO `tp_district` VALUES ('1908', '221', '蝶山区', '0');
INSERT INTO `tp_district` VALUES ('1909', '221', '长洲区', '0');
INSERT INTO `tp_district` VALUES ('1910', '221', '苍梧县', '0');
INSERT INTO `tp_district` VALUES ('1911', '221', '藤县', '0');
INSERT INTO `tp_district` VALUES ('1912', '221', '蒙山县', '0');
INSERT INTO `tp_district` VALUES ('1913', '221', '岑溪市', '0');
INSERT INTO `tp_district` VALUES ('1914', '222', '海城区', '0');
INSERT INTO `tp_district` VALUES ('1915', '222', '银海区', '0');
INSERT INTO `tp_district` VALUES ('1916', '222', '铁山港区', '0');
INSERT INTO `tp_district` VALUES ('1917', '222', '合浦县', '0');
INSERT INTO `tp_district` VALUES ('1918', '223', '港口区', '0');
INSERT INTO `tp_district` VALUES ('1919', '223', '防城区', '0');
INSERT INTO `tp_district` VALUES ('1920', '223', '上思县', '0');
INSERT INTO `tp_district` VALUES ('1921', '223', '东兴市', '0');
INSERT INTO `tp_district` VALUES ('1922', '224', '钦南区', '0');
INSERT INTO `tp_district` VALUES ('1923', '224', '钦北区', '0');
INSERT INTO `tp_district` VALUES ('1924', '224', '灵山县', '0');
INSERT INTO `tp_district` VALUES ('1925', '224', '浦北县', '0');
INSERT INTO `tp_district` VALUES ('1926', '225', '港北区', '0');
INSERT INTO `tp_district` VALUES ('1927', '225', '港南区', '0');
INSERT INTO `tp_district` VALUES ('1928', '225', '覃塘区', '0');
INSERT INTO `tp_district` VALUES ('1929', '225', '平南县', '0');
INSERT INTO `tp_district` VALUES ('1930', '225', '桂平市', '0');
INSERT INTO `tp_district` VALUES ('1931', '226', '玉州区', '0');
INSERT INTO `tp_district` VALUES ('1932', '226', '容县', '0');
INSERT INTO `tp_district` VALUES ('1933', '226', '陆川县', '0');
INSERT INTO `tp_district` VALUES ('1934', '226', '博白县', '0');
INSERT INTO `tp_district` VALUES ('1935', '226', '兴业县', '0');
INSERT INTO `tp_district` VALUES ('1936', '226', '北流市', '0');
INSERT INTO `tp_district` VALUES ('1937', '227', '右江区', '0');
INSERT INTO `tp_district` VALUES ('1938', '227', '田阳县', '0');
INSERT INTO `tp_district` VALUES ('1939', '227', '田东县', '0');
INSERT INTO `tp_district` VALUES ('1940', '227', '平果县', '0');
INSERT INTO `tp_district` VALUES ('1941', '227', '德保县', '0');
INSERT INTO `tp_district` VALUES ('1942', '227', '靖西县', '0');
INSERT INTO `tp_district` VALUES ('1943', '227', '那坡县', '0');
INSERT INTO `tp_district` VALUES ('1944', '227', '凌云县', '0');
INSERT INTO `tp_district` VALUES ('1945', '227', '乐业县', '0');
INSERT INTO `tp_district` VALUES ('1946', '227', '田林县', '0');
INSERT INTO `tp_district` VALUES ('1947', '227', '西林县', '0');
INSERT INTO `tp_district` VALUES ('1948', '227', '隆林各族自治县', '0');
INSERT INTO `tp_district` VALUES ('1949', '228', '八步区', '0');
INSERT INTO `tp_district` VALUES ('1950', '228', '昭平县', '0');
INSERT INTO `tp_district` VALUES ('1951', '228', '钟山县', '0');
INSERT INTO `tp_district` VALUES ('1952', '228', '富川瑶族自治县', '0');
INSERT INTO `tp_district` VALUES ('1953', '229', '金城江区', '0');
INSERT INTO `tp_district` VALUES ('1954', '229', '南丹县', '0');
INSERT INTO `tp_district` VALUES ('1955', '229', '天峨县', '0');
INSERT INTO `tp_district` VALUES ('1956', '229', '凤山县', '0');
INSERT INTO `tp_district` VALUES ('1957', '229', '东兰县', '0');
INSERT INTO `tp_district` VALUES ('1958', '229', '罗城仫佬族自治县', '0');
INSERT INTO `tp_district` VALUES ('1959', '229', '环江毛南族自治县', '0');
INSERT INTO `tp_district` VALUES ('1960', '229', '巴马瑶族自治县', '0');
INSERT INTO `tp_district` VALUES ('1961', '229', '都安瑶族自治县', '0');
INSERT INTO `tp_district` VALUES ('1962', '229', '大化瑶族自治县', '0');
INSERT INTO `tp_district` VALUES ('1963', '229', '宜州市', '0');
INSERT INTO `tp_district` VALUES ('1964', '230', '兴宾区', '0');
INSERT INTO `tp_district` VALUES ('1965', '230', '忻城县', '0');
INSERT INTO `tp_district` VALUES ('1966', '230', '象州县', '0');
INSERT INTO `tp_district` VALUES ('1967', '230', '武宣县', '0');
INSERT INTO `tp_district` VALUES ('1968', '230', '金秀瑶族自治县', '0');
INSERT INTO `tp_district` VALUES ('1969', '230', '合山市', '0');
INSERT INTO `tp_district` VALUES ('1970', '231', '江洲区', '0');
INSERT INTO `tp_district` VALUES ('1971', '231', '扶绥县', '0');
INSERT INTO `tp_district` VALUES ('1972', '231', '宁明县', '0');
INSERT INTO `tp_district` VALUES ('1973', '231', '龙州县', '0');
INSERT INTO `tp_district` VALUES ('1974', '231', '大新县', '0');
INSERT INTO `tp_district` VALUES ('1975', '231', '天等县', '0');
INSERT INTO `tp_district` VALUES ('1976', '231', '凭祥市', '0');
INSERT INTO `tp_district` VALUES ('1977', '232', '秀英区', '0');
INSERT INTO `tp_district` VALUES ('1978', '232', '龙华区', '0');
INSERT INTO `tp_district` VALUES ('1979', '232', '琼山区', '0');
INSERT INTO `tp_district` VALUES ('1980', '232', '美兰区', '0');
INSERT INTO `tp_district` VALUES ('1981', '233', '五指山市', '0');
INSERT INTO `tp_district` VALUES ('1982', '233', '琼海市', '0');
INSERT INTO `tp_district` VALUES ('1983', '233', '儋州市', '0');
INSERT INTO `tp_district` VALUES ('1984', '233', '文昌市', '0');
INSERT INTO `tp_district` VALUES ('1985', '233', '万宁市', '0');
INSERT INTO `tp_district` VALUES ('1986', '233', '东方市', '0');
INSERT INTO `tp_district` VALUES ('1987', '233', '定安县', '0');
INSERT INTO `tp_district` VALUES ('1988', '233', '屯昌县', '0');
INSERT INTO `tp_district` VALUES ('1989', '233', '澄迈县', '0');
INSERT INTO `tp_district` VALUES ('1990', '233', '临高县', '0');
INSERT INTO `tp_district` VALUES ('1991', '233', '白沙黎族自治县', '0');
INSERT INTO `tp_district` VALUES ('1992', '233', '昌江黎族自治县', '0');
INSERT INTO `tp_district` VALUES ('1993', '233', '乐东黎族自治县', '0');
INSERT INTO `tp_district` VALUES ('1994', '233', '陵水黎族自治县', '0');
INSERT INTO `tp_district` VALUES ('1995', '233', '保亭黎族苗族自治县', '0');
INSERT INTO `tp_district` VALUES ('1996', '233', '琼中黎族苗族自治县', '0');
INSERT INTO `tp_district` VALUES ('1997', '233', '西沙群岛', '0');
INSERT INTO `tp_district` VALUES ('1998', '233', '南沙群岛', '0');
INSERT INTO `tp_district` VALUES ('1999', '233', '中沙群岛的岛礁及其海域', '0');
INSERT INTO `tp_district` VALUES ('2000', '234', '万州区', '0');
INSERT INTO `tp_district` VALUES ('2001', '234', '涪陵区', '0');
INSERT INTO `tp_district` VALUES ('2002', '234', '渝中区', '0');
INSERT INTO `tp_district` VALUES ('2003', '234', '大渡口区', '0');
INSERT INTO `tp_district` VALUES ('2004', '234', '江北区', '0');
INSERT INTO `tp_district` VALUES ('2005', '234', '沙坪坝区', '0');
INSERT INTO `tp_district` VALUES ('2006', '234', '九龙坡区', '0');
INSERT INTO `tp_district` VALUES ('2007', '234', '南岸区', '0');
INSERT INTO `tp_district` VALUES ('2008', '234', '北碚区', '0');
INSERT INTO `tp_district` VALUES ('2009', '234', '万盛区', '0');
INSERT INTO `tp_district` VALUES ('2010', '234', '双桥区', '0');
INSERT INTO `tp_district` VALUES ('2011', '234', '渝北区', '0');
INSERT INTO `tp_district` VALUES ('2012', '234', '巴南区', '0');
INSERT INTO `tp_district` VALUES ('2013', '234', '黔江区', '0');
INSERT INTO `tp_district` VALUES ('2014', '234', '长寿区', '0');
INSERT INTO `tp_district` VALUES ('2015', '234', '綦江县', '0');
INSERT INTO `tp_district` VALUES ('2016', '234', '潼南县', '0');
INSERT INTO `tp_district` VALUES ('2017', '234', '铜梁县', '0');
INSERT INTO `tp_district` VALUES ('2018', '234', '大足县', '0');
INSERT INTO `tp_district` VALUES ('2019', '234', '荣昌县', '0');
INSERT INTO `tp_district` VALUES ('2020', '234', '璧山县', '0');
INSERT INTO `tp_district` VALUES ('2021', '234', '梁平县', '0');
INSERT INTO `tp_district` VALUES ('2022', '234', '城口县', '0');
INSERT INTO `tp_district` VALUES ('2023', '234', '丰都县', '0');
INSERT INTO `tp_district` VALUES ('2024', '234', '垫江县', '0');
INSERT INTO `tp_district` VALUES ('2025', '234', '武隆县', '0');
INSERT INTO `tp_district` VALUES ('2026', '234', '忠县', '0');
INSERT INTO `tp_district` VALUES ('2027', '234', '开县', '0');
INSERT INTO `tp_district` VALUES ('2028', '234', '云阳县', '0');
INSERT INTO `tp_district` VALUES ('2029', '234', '奉节县', '0');
INSERT INTO `tp_district` VALUES ('2030', '234', '巫山县', '0');
INSERT INTO `tp_district` VALUES ('2031', '234', '巫溪县', '0');
INSERT INTO `tp_district` VALUES ('2032', '234', '石柱土家族自治县', '0');
INSERT INTO `tp_district` VALUES ('2033', '234', '秀山土家族苗族自治县', '0');
INSERT INTO `tp_district` VALUES ('2034', '234', '酉阳土家族苗族自治县', '0');
INSERT INTO `tp_district` VALUES ('2035', '234', '彭水苗族土家族自治县', '0');
INSERT INTO `tp_district` VALUES ('2036', '234', '江津市', '0');
INSERT INTO `tp_district` VALUES ('2037', '234', '合川市', '0');
INSERT INTO `tp_district` VALUES ('2038', '234', '永川市', '0');
INSERT INTO `tp_district` VALUES ('2039', '234', '南川市', '0');
INSERT INTO `tp_district` VALUES ('2040', '235', '锦江区', '0');
INSERT INTO `tp_district` VALUES ('2041', '235', '青羊区', '0');
INSERT INTO `tp_district` VALUES ('2042', '235', '金牛区', '0');
INSERT INTO `tp_district` VALUES ('2043', '235', '武侯区', '0');
INSERT INTO `tp_district` VALUES ('2044', '235', '成华区', '0');
INSERT INTO `tp_district` VALUES ('2045', '235', '龙泉驿区', '0');
INSERT INTO `tp_district` VALUES ('2046', '235', '青白江区', '0');
INSERT INTO `tp_district` VALUES ('2047', '235', '新都区', '0');
INSERT INTO `tp_district` VALUES ('2048', '235', '温江区', '0');
INSERT INTO `tp_district` VALUES ('2049', '235', '金堂县', '0');
INSERT INTO `tp_district` VALUES ('2050', '235', '双流县', '0');
INSERT INTO `tp_district` VALUES ('2051', '235', '郫县', '0');
INSERT INTO `tp_district` VALUES ('2052', '235', '大邑县', '0');
INSERT INTO `tp_district` VALUES ('2053', '235', '蒲江县', '0');
INSERT INTO `tp_district` VALUES ('2054', '235', '新津县', '0');
INSERT INTO `tp_district` VALUES ('2055', '235', '都江堰市', '0');
INSERT INTO `tp_district` VALUES ('2056', '235', '彭州市', '0');
INSERT INTO `tp_district` VALUES ('2057', '235', '邛崃市', '0');
INSERT INTO `tp_district` VALUES ('2058', '235', '崇州市', '0');
INSERT INTO `tp_district` VALUES ('2059', '236', '自流井区', '0');
INSERT INTO `tp_district` VALUES ('2060', '236', '贡井区', '0');
INSERT INTO `tp_district` VALUES ('2061', '236', '大安区', '0');
INSERT INTO `tp_district` VALUES ('2062', '236', '沿滩区', '0');
INSERT INTO `tp_district` VALUES ('2063', '236', '荣县', '0');
INSERT INTO `tp_district` VALUES ('2064', '236', '富顺县', '0');
INSERT INTO `tp_district` VALUES ('2065', '237', '东区', '0');
INSERT INTO `tp_district` VALUES ('2066', '237', '西区', '0');
INSERT INTO `tp_district` VALUES ('2067', '237', '仁和区', '0');
INSERT INTO `tp_district` VALUES ('2068', '237', '米易县', '0');
INSERT INTO `tp_district` VALUES ('2069', '237', '盐边县', '0');
INSERT INTO `tp_district` VALUES ('2070', '238', '江阳区', '0');
INSERT INTO `tp_district` VALUES ('2071', '238', '纳溪区', '0');
INSERT INTO `tp_district` VALUES ('2072', '238', '龙马潭区', '0');
INSERT INTO `tp_district` VALUES ('2073', '238', '泸县', '0');
INSERT INTO `tp_district` VALUES ('2074', '238', '合江县', '0');
INSERT INTO `tp_district` VALUES ('2075', '238', '叙永县', '0');
INSERT INTO `tp_district` VALUES ('2076', '238', '古蔺县', '0');
INSERT INTO `tp_district` VALUES ('2077', '239', '旌阳区', '0');
INSERT INTO `tp_district` VALUES ('2078', '239', '中江县', '0');
INSERT INTO `tp_district` VALUES ('2079', '239', '罗江县', '0');
INSERT INTO `tp_district` VALUES ('2080', '239', '广汉市', '0');
INSERT INTO `tp_district` VALUES ('2081', '239', '什邡市', '0');
INSERT INTO `tp_district` VALUES ('2082', '239', '绵竹市', '0');
INSERT INTO `tp_district` VALUES ('2083', '240', '涪城区', '0');
INSERT INTO `tp_district` VALUES ('2084', '240', '游仙区', '0');
INSERT INTO `tp_district` VALUES ('2085', '240', '三台县', '0');
INSERT INTO `tp_district` VALUES ('2086', '240', '盐亭县', '0');
INSERT INTO `tp_district` VALUES ('2087', '240', '安县', '0');
INSERT INTO `tp_district` VALUES ('2088', '240', '梓潼县', '0');
INSERT INTO `tp_district` VALUES ('2089', '240', '北川羌族自治县', '0');
INSERT INTO `tp_district` VALUES ('2090', '240', '平武县', '0');
INSERT INTO `tp_district` VALUES ('2091', '240', '江油市', '0');
INSERT INTO `tp_district` VALUES ('2092', '241', '市中区', '0');
INSERT INTO `tp_district` VALUES ('2093', '241', '元坝区', '0');
INSERT INTO `tp_district` VALUES ('2094', '241', '朝天区', '0');
INSERT INTO `tp_district` VALUES ('2095', '241', '旺苍县', '0');
INSERT INTO `tp_district` VALUES ('2096', '241', '青川县', '0');
INSERT INTO `tp_district` VALUES ('2097', '241', '剑阁县', '0');
INSERT INTO `tp_district` VALUES ('2098', '241', '苍溪县', '0');
INSERT INTO `tp_district` VALUES ('2099', '242', '船山区', '0');
INSERT INTO `tp_district` VALUES ('2100', '242', '安居区', '0');
INSERT INTO `tp_district` VALUES ('2101', '242', '蓬溪县', '0');
INSERT INTO `tp_district` VALUES ('2102', '242', '射洪县', '0');
INSERT INTO `tp_district` VALUES ('2103', '242', '大英县', '0');
INSERT INTO `tp_district` VALUES ('2104', '243', '市中区', '0');
INSERT INTO `tp_district` VALUES ('2105', '243', '东兴区', '0');
INSERT INTO `tp_district` VALUES ('2106', '243', '威远县', '0');
INSERT INTO `tp_district` VALUES ('2107', '243', '资中县', '0');
INSERT INTO `tp_district` VALUES ('2108', '243', '隆昌县', '0');
INSERT INTO `tp_district` VALUES ('2109', '244', '市中区', '0');
INSERT INTO `tp_district` VALUES ('2110', '244', '沙湾区', '0');
INSERT INTO `tp_district` VALUES ('2111', '244', '五通桥区', '0');
INSERT INTO `tp_district` VALUES ('2112', '244', '金口河区', '0');
INSERT INTO `tp_district` VALUES ('2113', '244', '犍为县', '0');
INSERT INTO `tp_district` VALUES ('2114', '244', '井研县', '0');
INSERT INTO `tp_district` VALUES ('2115', '244', '夹江县', '0');
INSERT INTO `tp_district` VALUES ('2116', '244', '沐川县', '0');
INSERT INTO `tp_district` VALUES ('2117', '244', '峨边彝族自治县', '0');
INSERT INTO `tp_district` VALUES ('2118', '244', '马边彝族自治县', '0');
INSERT INTO `tp_district` VALUES ('2119', '244', '峨眉山市', '0');
INSERT INTO `tp_district` VALUES ('2120', '245', '顺庆区', '0');
INSERT INTO `tp_district` VALUES ('2121', '245', '高坪区', '0');
INSERT INTO `tp_district` VALUES ('2122', '245', '嘉陵区', '0');
INSERT INTO `tp_district` VALUES ('2123', '245', '南部县', '0');
INSERT INTO `tp_district` VALUES ('2124', '245', '营山县', '0');
INSERT INTO `tp_district` VALUES ('2125', '245', '蓬安县', '0');
INSERT INTO `tp_district` VALUES ('2126', '245', '仪陇县', '0');
INSERT INTO `tp_district` VALUES ('2127', '245', '西充县', '0');
INSERT INTO `tp_district` VALUES ('2128', '245', '阆中市', '0');
INSERT INTO `tp_district` VALUES ('2129', '246', '东坡区', '0');
INSERT INTO `tp_district` VALUES ('2130', '246', '仁寿县', '0');
INSERT INTO `tp_district` VALUES ('2131', '246', '彭山县', '0');
INSERT INTO `tp_district` VALUES ('2132', '246', '洪雅县', '0');
INSERT INTO `tp_district` VALUES ('2133', '246', '丹棱县', '0');
INSERT INTO `tp_district` VALUES ('2134', '246', '青神县', '0');
INSERT INTO `tp_district` VALUES ('2135', '247', '翠屏区', '0');
INSERT INTO `tp_district` VALUES ('2136', '247', '宜宾县', '0');
INSERT INTO `tp_district` VALUES ('2137', '247', '南溪县', '0');
INSERT INTO `tp_district` VALUES ('2138', '247', '江安县', '0');
INSERT INTO `tp_district` VALUES ('2139', '247', '长宁县', '0');
INSERT INTO `tp_district` VALUES ('2140', '247', '高县', '0');
INSERT INTO `tp_district` VALUES ('2141', '247', '珙县', '0');
INSERT INTO `tp_district` VALUES ('2142', '247', '筠连县', '0');
INSERT INTO `tp_district` VALUES ('2143', '247', '兴文县', '0');
INSERT INTO `tp_district` VALUES ('2144', '247', '屏山县', '0');
INSERT INTO `tp_district` VALUES ('2145', '248', '广安区', '0');
INSERT INTO `tp_district` VALUES ('2146', '248', '岳池县', '0');
INSERT INTO `tp_district` VALUES ('2147', '248', '武胜县', '0');
INSERT INTO `tp_district` VALUES ('2148', '248', '邻水县', '0');
INSERT INTO `tp_district` VALUES ('2149', '248', '华蓥市', '0');
INSERT INTO `tp_district` VALUES ('2150', '249', '通川区', '0');
INSERT INTO `tp_district` VALUES ('2151', '249', '达县', '0');
INSERT INTO `tp_district` VALUES ('2152', '249', '宣汉县', '0');
INSERT INTO `tp_district` VALUES ('2153', '249', '开江县', '0');
INSERT INTO `tp_district` VALUES ('2154', '249', '大竹县', '0');
INSERT INTO `tp_district` VALUES ('2155', '249', '渠县', '0');
INSERT INTO `tp_district` VALUES ('2156', '249', '万源市', '0');
INSERT INTO `tp_district` VALUES ('2157', '250', '雨城区', '0');
INSERT INTO `tp_district` VALUES ('2158', '250', '名山县', '0');
INSERT INTO `tp_district` VALUES ('2159', '250', '荥经县', '0');
INSERT INTO `tp_district` VALUES ('2160', '250', '汉源县', '0');
INSERT INTO `tp_district` VALUES ('2161', '250', '石棉县', '0');
INSERT INTO `tp_district` VALUES ('2162', '250', '天全县', '0');
INSERT INTO `tp_district` VALUES ('2163', '250', '芦山县', '0');
INSERT INTO `tp_district` VALUES ('2164', '250', '宝兴县', '0');
INSERT INTO `tp_district` VALUES ('2165', '251', '巴州区', '0');
INSERT INTO `tp_district` VALUES ('2166', '251', '通江县', '0');
INSERT INTO `tp_district` VALUES ('2167', '251', '南江县', '0');
INSERT INTO `tp_district` VALUES ('2168', '251', '平昌县', '0');
INSERT INTO `tp_district` VALUES ('2169', '252', '雁江区', '0');
INSERT INTO `tp_district` VALUES ('2170', '252', '安岳县', '0');
INSERT INTO `tp_district` VALUES ('2171', '252', '乐至县', '0');
INSERT INTO `tp_district` VALUES ('2172', '252', '简阳市', '0');
INSERT INTO `tp_district` VALUES ('2173', '253', '汶川县', '0');
INSERT INTO `tp_district` VALUES ('2174', '253', '理县', '0');
INSERT INTO `tp_district` VALUES ('2175', '253', '茂县', '0');
INSERT INTO `tp_district` VALUES ('2176', '253', '松潘县', '0');
INSERT INTO `tp_district` VALUES ('2177', '253', '九寨沟县', '0');
INSERT INTO `tp_district` VALUES ('2178', '253', '金川县', '0');
INSERT INTO `tp_district` VALUES ('2179', '253', '小金县', '0');
INSERT INTO `tp_district` VALUES ('2180', '253', '黑水县', '0');
INSERT INTO `tp_district` VALUES ('2181', '253', '马尔康县', '0');
INSERT INTO `tp_district` VALUES ('2182', '253', '壤塘县', '0');
INSERT INTO `tp_district` VALUES ('2183', '253', '阿坝县', '0');
INSERT INTO `tp_district` VALUES ('2184', '253', '若尔盖县', '0');
INSERT INTO `tp_district` VALUES ('2185', '253', '红原县', '0');
INSERT INTO `tp_district` VALUES ('2186', '254', '康定县', '0');
INSERT INTO `tp_district` VALUES ('2187', '254', '泸定县', '0');
INSERT INTO `tp_district` VALUES ('2188', '254', '丹巴县', '0');
INSERT INTO `tp_district` VALUES ('2189', '254', '九龙县', '0');
INSERT INTO `tp_district` VALUES ('2190', '254', '雅江县', '0');
INSERT INTO `tp_district` VALUES ('2191', '254', '道孚县', '0');
INSERT INTO `tp_district` VALUES ('2192', '254', '炉霍县', '0');
INSERT INTO `tp_district` VALUES ('2193', '254', '甘孜县', '0');
INSERT INTO `tp_district` VALUES ('2194', '254', '新龙县', '0');
INSERT INTO `tp_district` VALUES ('2195', '254', '德格县', '0');
INSERT INTO `tp_district` VALUES ('2196', '254', '白玉县', '0');
INSERT INTO `tp_district` VALUES ('2197', '254', '石渠县', '0');
INSERT INTO `tp_district` VALUES ('2198', '254', '色达县', '0');
INSERT INTO `tp_district` VALUES ('2199', '254', '理塘县', '0');
INSERT INTO `tp_district` VALUES ('2200', '254', '巴塘县', '0');
INSERT INTO `tp_district` VALUES ('2201', '254', '乡城县', '0');
INSERT INTO `tp_district` VALUES ('2202', '254', '稻城县', '0');
INSERT INTO `tp_district` VALUES ('2203', '254', '得荣县', '0');
INSERT INTO `tp_district` VALUES ('2204', '255', '西昌市', '0');
INSERT INTO `tp_district` VALUES ('2205', '255', '木里藏族自治县', '0');
INSERT INTO `tp_district` VALUES ('2206', '255', '盐源县', '0');
INSERT INTO `tp_district` VALUES ('2207', '255', '德昌县', '0');
INSERT INTO `tp_district` VALUES ('2208', '255', '会理县', '0');
INSERT INTO `tp_district` VALUES ('2209', '255', '会东县', '0');
INSERT INTO `tp_district` VALUES ('2210', '255', '宁南县', '0');
INSERT INTO `tp_district` VALUES ('2211', '255', '普格县', '0');
INSERT INTO `tp_district` VALUES ('2212', '255', '布拖县', '0');
INSERT INTO `tp_district` VALUES ('2213', '255', '金阳县', '0');
INSERT INTO `tp_district` VALUES ('2214', '255', '昭觉县', '0');
INSERT INTO `tp_district` VALUES ('2215', '255', '喜德县', '0');
INSERT INTO `tp_district` VALUES ('2216', '255', '冕宁县', '0');
INSERT INTO `tp_district` VALUES ('2217', '255', '越西县', '0');
INSERT INTO `tp_district` VALUES ('2218', '255', '甘洛县', '0');
INSERT INTO `tp_district` VALUES ('2219', '255', '美姑县', '0');
INSERT INTO `tp_district` VALUES ('2220', '255', '雷波县', '0');
INSERT INTO `tp_district` VALUES ('2221', '256', '南明区', '0');
INSERT INTO `tp_district` VALUES ('2222', '256', '云岩区', '0');
INSERT INTO `tp_district` VALUES ('2223', '256', '花溪区', '0');
INSERT INTO `tp_district` VALUES ('2224', '256', '乌当区', '0');
INSERT INTO `tp_district` VALUES ('2225', '256', '白云区', '0');
INSERT INTO `tp_district` VALUES ('2226', '256', '小河区', '0');
INSERT INTO `tp_district` VALUES ('2227', '256', '开阳县', '0');
INSERT INTO `tp_district` VALUES ('2228', '256', '息烽县', '0');
INSERT INTO `tp_district` VALUES ('2229', '256', '修文县', '0');
INSERT INTO `tp_district` VALUES ('2230', '256', '清镇市', '0');
INSERT INTO `tp_district` VALUES ('2231', '257', '钟山区', '0');
INSERT INTO `tp_district` VALUES ('2232', '257', '六枝特区', '0');
INSERT INTO `tp_district` VALUES ('2233', '257', '水城县', '0');
INSERT INTO `tp_district` VALUES ('2234', '257', '盘县', '0');
INSERT INTO `tp_district` VALUES ('2235', '258', '红花岗区', '0');
INSERT INTO `tp_district` VALUES ('2236', '258', '汇川区', '0');
INSERT INTO `tp_district` VALUES ('2237', '258', '遵义县', '0');
INSERT INTO `tp_district` VALUES ('2238', '258', '桐梓县', '0');
INSERT INTO `tp_district` VALUES ('2239', '258', '绥阳县', '0');
INSERT INTO `tp_district` VALUES ('2240', '258', '正安县', '0');
INSERT INTO `tp_district` VALUES ('2241', '258', '道真仡佬族苗族自治县', '0');
INSERT INTO `tp_district` VALUES ('2242', '258', '务川仡佬族苗族自治县', '0');
INSERT INTO `tp_district` VALUES ('2243', '258', '凤冈县', '0');
INSERT INTO `tp_district` VALUES ('2244', '258', '湄潭县', '0');
INSERT INTO `tp_district` VALUES ('2245', '258', '余庆县', '0');
INSERT INTO `tp_district` VALUES ('2246', '258', '习水县', '0');
INSERT INTO `tp_district` VALUES ('2247', '258', '赤水市', '0');
INSERT INTO `tp_district` VALUES ('2248', '258', '仁怀市', '0');
INSERT INTO `tp_district` VALUES ('2249', '259', '西秀区', '0');
INSERT INTO `tp_district` VALUES ('2250', '259', '平坝县', '0');
INSERT INTO `tp_district` VALUES ('2251', '259', '普定县', '0');
INSERT INTO `tp_district` VALUES ('2252', '259', '镇宁布依族苗族自治县', '0');
INSERT INTO `tp_district` VALUES ('2253', '259', '关岭布依族苗族自治县', '0');
INSERT INTO `tp_district` VALUES ('2254', '259', '紫云苗族布依族自治县', '0');
INSERT INTO `tp_district` VALUES ('2255', '260', '铜仁市', '0');
INSERT INTO `tp_district` VALUES ('2256', '260', '江口县', '0');
INSERT INTO `tp_district` VALUES ('2257', '260', '玉屏侗族自治县', '0');
INSERT INTO `tp_district` VALUES ('2258', '260', '石阡县', '0');
INSERT INTO `tp_district` VALUES ('2259', '260', '思南县', '0');
INSERT INTO `tp_district` VALUES ('2260', '260', '印江土家族苗族自治县', '0');
INSERT INTO `tp_district` VALUES ('2261', '260', '德江县', '0');
INSERT INTO `tp_district` VALUES ('2262', '260', '沿河土家族自治县', '0');
INSERT INTO `tp_district` VALUES ('2263', '260', '松桃苗族自治县', '0');
INSERT INTO `tp_district` VALUES ('2264', '260', '万山特区', '0');
INSERT INTO `tp_district` VALUES ('2265', '261', '兴义市', '0');
INSERT INTO `tp_district` VALUES ('2266', '261', '兴仁县', '0');
INSERT INTO `tp_district` VALUES ('2267', '261', '普安县', '0');
INSERT INTO `tp_district` VALUES ('2268', '261', '晴隆县', '0');
INSERT INTO `tp_district` VALUES ('2269', '261', '贞丰县', '0');
INSERT INTO `tp_district` VALUES ('2270', '261', '望谟县', '0');
INSERT INTO `tp_district` VALUES ('2271', '261', '册亨县', '0');
INSERT INTO `tp_district` VALUES ('2272', '261', '安龙县', '0');
INSERT INTO `tp_district` VALUES ('2273', '262', '毕节市', '0');
INSERT INTO `tp_district` VALUES ('2274', '262', '大方县', '0');
INSERT INTO `tp_district` VALUES ('2275', '262', '黔西县', '0');
INSERT INTO `tp_district` VALUES ('2276', '262', '金沙县', '0');
INSERT INTO `tp_district` VALUES ('2277', '262', '织金县', '0');
INSERT INTO `tp_district` VALUES ('2278', '262', '纳雍县', '0');
INSERT INTO `tp_district` VALUES ('2279', '262', '威宁彝族回族苗族自治县', '0');
INSERT INTO `tp_district` VALUES ('2280', '262', '赫章县', '0');
INSERT INTO `tp_district` VALUES ('2281', '263', '凯里市', '0');
INSERT INTO `tp_district` VALUES ('2282', '263', '黄平县', '0');
INSERT INTO `tp_district` VALUES ('2283', '263', '施秉县', '0');
INSERT INTO `tp_district` VALUES ('2284', '263', '三穗县', '0');
INSERT INTO `tp_district` VALUES ('2285', '263', '镇远县', '0');
INSERT INTO `tp_district` VALUES ('2286', '263', '岑巩县', '0');
INSERT INTO `tp_district` VALUES ('2287', '263', '天柱县', '0');
INSERT INTO `tp_district` VALUES ('2288', '263', '锦屏县', '0');
INSERT INTO `tp_district` VALUES ('2289', '263', '剑河县', '0');
INSERT INTO `tp_district` VALUES ('2290', '263', '台江县', '0');
INSERT INTO `tp_district` VALUES ('2291', '263', '黎平县', '0');
INSERT INTO `tp_district` VALUES ('2292', '263', '榕江县', '0');
INSERT INTO `tp_district` VALUES ('2293', '263', '从江县', '0');
INSERT INTO `tp_district` VALUES ('2294', '263', '雷山县', '0');
INSERT INTO `tp_district` VALUES ('2295', '263', '麻江县', '0');
INSERT INTO `tp_district` VALUES ('2296', '263', '丹寨县', '0');
INSERT INTO `tp_district` VALUES ('2297', '264', '都匀市', '0');
INSERT INTO `tp_district` VALUES ('2298', '264', '福泉市', '0');
INSERT INTO `tp_district` VALUES ('2299', '264', '荔波县', '0');
INSERT INTO `tp_district` VALUES ('2300', '264', '贵定县', '0');
INSERT INTO `tp_district` VALUES ('2301', '264', '瓮安县', '0');
INSERT INTO `tp_district` VALUES ('2302', '264', '独山县', '0');
INSERT INTO `tp_district` VALUES ('2303', '264', '平塘县', '0');
INSERT INTO `tp_district` VALUES ('2304', '264', '罗甸县', '0');
INSERT INTO `tp_district` VALUES ('2305', '264', '长顺县', '0');
INSERT INTO `tp_district` VALUES ('2306', '264', '龙里县', '0');
INSERT INTO `tp_district` VALUES ('2307', '264', '惠水县', '0');
INSERT INTO `tp_district` VALUES ('2308', '264', '三都水族自治县', '0');
INSERT INTO `tp_district` VALUES ('2309', '265', '五华区', '0');
INSERT INTO `tp_district` VALUES ('2310', '265', '盘龙区', '0');
INSERT INTO `tp_district` VALUES ('2311', '265', '官渡区', '0');
INSERT INTO `tp_district` VALUES ('2312', '265', '西山区', '0');
INSERT INTO `tp_district` VALUES ('2313', '265', '东川区', '0');
INSERT INTO `tp_district` VALUES ('2314', '265', '呈贡县', '0');
INSERT INTO `tp_district` VALUES ('2315', '265', '晋宁县', '0');
INSERT INTO `tp_district` VALUES ('2316', '265', '富民县', '0');
INSERT INTO `tp_district` VALUES ('2317', '265', '宜良县', '0');
INSERT INTO `tp_district` VALUES ('2318', '265', '石林彝族自治县', '0');
INSERT INTO `tp_district` VALUES ('2319', '265', '嵩明县', '0');
INSERT INTO `tp_district` VALUES ('2320', '265', '禄劝彝族苗族自治县', '0');
INSERT INTO `tp_district` VALUES ('2321', '265', '寻甸回族彝族自治县', '0');
INSERT INTO `tp_district` VALUES ('2322', '265', '安宁市', '0');
INSERT INTO `tp_district` VALUES ('2323', '266', '麒麟区', '0');
INSERT INTO `tp_district` VALUES ('2324', '266', '马龙县', '0');
INSERT INTO `tp_district` VALUES ('2325', '266', '陆良县', '0');
INSERT INTO `tp_district` VALUES ('2326', '266', '师宗县', '0');
INSERT INTO `tp_district` VALUES ('2327', '266', '罗平县', '0');
INSERT INTO `tp_district` VALUES ('2328', '266', '富源县', '0');
INSERT INTO `tp_district` VALUES ('2329', '266', '会泽县', '0');
INSERT INTO `tp_district` VALUES ('2330', '266', '沾益县', '0');
INSERT INTO `tp_district` VALUES ('2331', '266', '宣威市', '0');
INSERT INTO `tp_district` VALUES ('2332', '267', '红塔区', '0');
INSERT INTO `tp_district` VALUES ('2333', '267', '江川县', '0');
INSERT INTO `tp_district` VALUES ('2334', '267', '澄江县', '0');
INSERT INTO `tp_district` VALUES ('2335', '267', '通海县', '0');
INSERT INTO `tp_district` VALUES ('2336', '267', '华宁县', '0');
INSERT INTO `tp_district` VALUES ('2337', '267', '易门县', '0');
INSERT INTO `tp_district` VALUES ('2338', '267', '峨山彝族自治县', '0');
INSERT INTO `tp_district` VALUES ('2339', '267', '新平彝族傣族自治县', '0');
INSERT INTO `tp_district` VALUES ('2340', '267', '元江哈尼族彝族傣族自治县', '0');
INSERT INTO `tp_district` VALUES ('2341', '268', '隆阳区', '0');
INSERT INTO `tp_district` VALUES ('2342', '268', '施甸县', '0');
INSERT INTO `tp_district` VALUES ('2343', '268', '腾冲县', '0');
INSERT INTO `tp_district` VALUES ('2344', '268', '龙陵县', '0');
INSERT INTO `tp_district` VALUES ('2345', '268', '昌宁县', '0');
INSERT INTO `tp_district` VALUES ('2346', '269', '昭阳区', '0');
INSERT INTO `tp_district` VALUES ('2347', '269', '鲁甸县', '0');
INSERT INTO `tp_district` VALUES ('2348', '269', '巧家县', '0');
INSERT INTO `tp_district` VALUES ('2349', '269', '盐津县', '0');
INSERT INTO `tp_district` VALUES ('2350', '269', '大关县', '0');
INSERT INTO `tp_district` VALUES ('2351', '269', '永善县', '0');
INSERT INTO `tp_district` VALUES ('2352', '269', '绥江县', '0');
INSERT INTO `tp_district` VALUES ('2353', '269', '镇雄县', '0');
INSERT INTO `tp_district` VALUES ('2354', '269', '彝良县', '0');
INSERT INTO `tp_district` VALUES ('2355', '269', '威信县', '0');
INSERT INTO `tp_district` VALUES ('2356', '269', '水富县', '0');
INSERT INTO `tp_district` VALUES ('2357', '270', '古城区', '0');
INSERT INTO `tp_district` VALUES ('2358', '270', '玉龙纳西族自治县', '0');
INSERT INTO `tp_district` VALUES ('2359', '270', '永胜县', '0');
INSERT INTO `tp_district` VALUES ('2360', '270', '华坪县', '0');
INSERT INTO `tp_district` VALUES ('2361', '270', '宁蒗彝族自治县', '0');
INSERT INTO `tp_district` VALUES ('2362', '271', '翠云区', '0');
INSERT INTO `tp_district` VALUES ('2363', '271', '普洱哈尼族彝族自治县', '0');
INSERT INTO `tp_district` VALUES ('2364', '271', '墨江哈尼族自治县', '0');
INSERT INTO `tp_district` VALUES ('2365', '271', '景东彝族自治县', '0');
INSERT INTO `tp_district` VALUES ('2366', '271', '景谷傣族彝族自治县', '0');
INSERT INTO `tp_district` VALUES ('2367', '271', '镇沅彝族哈尼族拉祜族自治县', '0');
INSERT INTO `tp_district` VALUES ('2368', '271', '江城哈尼族彝族自治县', '0');
INSERT INTO `tp_district` VALUES ('2369', '271', '孟连傣族拉祜族佤族自治县', '0');
INSERT INTO `tp_district` VALUES ('2370', '271', '澜沧拉祜族自治县', '0');
INSERT INTO `tp_district` VALUES ('2371', '271', '西盟佤族自治县', '0');
INSERT INTO `tp_district` VALUES ('2372', '272', '临翔区', '0');
INSERT INTO `tp_district` VALUES ('2373', '272', '凤庆县', '0');
INSERT INTO `tp_district` VALUES ('2374', '272', '云县', '0');
INSERT INTO `tp_district` VALUES ('2375', '272', '永德县', '0');
INSERT INTO `tp_district` VALUES ('2376', '272', '镇康县', '0');
INSERT INTO `tp_district` VALUES ('2377', '272', '双江拉祜族佤族布朗族傣族自治县', '0');
INSERT INTO `tp_district` VALUES ('2378', '272', '耿马傣族佤族自治县', '0');
INSERT INTO `tp_district` VALUES ('2379', '272', '沧源佤族自治县', '0');
INSERT INTO `tp_district` VALUES ('2380', '273', '楚雄市', '0');
INSERT INTO `tp_district` VALUES ('2381', '273', '双柏县', '0');
INSERT INTO `tp_district` VALUES ('2382', '273', '牟定县', '0');
INSERT INTO `tp_district` VALUES ('2383', '273', '南华县', '0');
INSERT INTO `tp_district` VALUES ('2384', '273', '姚安县', '0');
INSERT INTO `tp_district` VALUES ('2385', '273', '大姚县', '0');
INSERT INTO `tp_district` VALUES ('2386', '273', '永仁县', '0');
INSERT INTO `tp_district` VALUES ('2387', '273', '元谋县', '0');
INSERT INTO `tp_district` VALUES ('2388', '273', '武定县', '0');
INSERT INTO `tp_district` VALUES ('2389', '273', '禄丰县', '0');
INSERT INTO `tp_district` VALUES ('2390', '274', '个旧市', '0');
INSERT INTO `tp_district` VALUES ('2391', '274', '开远市', '0');
INSERT INTO `tp_district` VALUES ('2392', '274', '蒙自县', '0');
INSERT INTO `tp_district` VALUES ('2393', '274', '屏边苗族自治县', '0');
INSERT INTO `tp_district` VALUES ('2394', '274', '建水县', '0');
INSERT INTO `tp_district` VALUES ('2395', '274', '石屏县', '0');
INSERT INTO `tp_district` VALUES ('2396', '274', '弥勒县', '0');
INSERT INTO `tp_district` VALUES ('2397', '274', '泸西县', '0');
INSERT INTO `tp_district` VALUES ('2398', '274', '元阳县', '0');
INSERT INTO `tp_district` VALUES ('2399', '274', '红河县', '0');
INSERT INTO `tp_district` VALUES ('2400', '274', '金平苗族瑶族傣族自治县', '0');
INSERT INTO `tp_district` VALUES ('2401', '274', '绿春县', '0');
INSERT INTO `tp_district` VALUES ('2402', '274', '河口瑶族自治县', '0');
INSERT INTO `tp_district` VALUES ('2403', '275', '文山县', '0');
INSERT INTO `tp_district` VALUES ('2404', '275', '砚山县', '0');
INSERT INTO `tp_district` VALUES ('2405', '275', '西畴县', '0');
INSERT INTO `tp_district` VALUES ('2406', '275', '麻栗坡县', '0');
INSERT INTO `tp_district` VALUES ('2407', '275', '马关县', '0');
INSERT INTO `tp_district` VALUES ('2408', '275', '丘北县', '0');
INSERT INTO `tp_district` VALUES ('2409', '275', '广南县', '0');
INSERT INTO `tp_district` VALUES ('2410', '275', '富宁县', '0');
INSERT INTO `tp_district` VALUES ('2411', '276', '景洪市', '0');
INSERT INTO `tp_district` VALUES ('2412', '276', '勐海县', '0');
INSERT INTO `tp_district` VALUES ('2413', '276', '勐腊县', '0');
INSERT INTO `tp_district` VALUES ('2414', '277', '大理市', '0');
INSERT INTO `tp_district` VALUES ('2415', '277', '漾濞彝族自治县', '0');
INSERT INTO `tp_district` VALUES ('2416', '277', '祥云县', '0');
INSERT INTO `tp_district` VALUES ('2417', '277', '宾川县', '0');
INSERT INTO `tp_district` VALUES ('2418', '277', '弥渡县', '0');
INSERT INTO `tp_district` VALUES ('2419', '277', '南涧彝族自治县', '0');
INSERT INTO `tp_district` VALUES ('2420', '277', '巍山彝族回族自治县', '0');
INSERT INTO `tp_district` VALUES ('2421', '277', '永平县', '0');
INSERT INTO `tp_district` VALUES ('2422', '277', '云龙县', '0');
INSERT INTO `tp_district` VALUES ('2423', '277', '洱源县', '0');
INSERT INTO `tp_district` VALUES ('2424', '277', '剑川县', '0');
INSERT INTO `tp_district` VALUES ('2425', '277', '鹤庆县', '0');
INSERT INTO `tp_district` VALUES ('2426', '278', '瑞丽市', '0');
INSERT INTO `tp_district` VALUES ('2427', '278', '潞西市', '0');
INSERT INTO `tp_district` VALUES ('2428', '278', '梁河县', '0');
INSERT INTO `tp_district` VALUES ('2429', '278', '盈江县', '0');
INSERT INTO `tp_district` VALUES ('2430', '278', '陇川县', '0');
INSERT INTO `tp_district` VALUES ('2431', '279', '泸水县', '0');
INSERT INTO `tp_district` VALUES ('2432', '279', '福贡县', '0');
INSERT INTO `tp_district` VALUES ('2433', '279', '贡山独龙族怒族自治县', '0');
INSERT INTO `tp_district` VALUES ('2434', '279', '兰坪白族普米族自治县', '0');
INSERT INTO `tp_district` VALUES ('2435', '280', '香格里拉县', '0');
INSERT INTO `tp_district` VALUES ('2436', '280', '德钦县', '0');
INSERT INTO `tp_district` VALUES ('2437', '280', '维西傈僳族自治县', '0');
INSERT INTO `tp_district` VALUES ('2438', '281', '城关区', '0');
INSERT INTO `tp_district` VALUES ('2439', '281', '林周县', '0');
INSERT INTO `tp_district` VALUES ('2440', '281', '当雄县', '0');
INSERT INTO `tp_district` VALUES ('2441', '281', '尼木县', '0');
INSERT INTO `tp_district` VALUES ('2442', '281', '曲水县', '0');
INSERT INTO `tp_district` VALUES ('2443', '281', '堆龙德庆县', '0');
INSERT INTO `tp_district` VALUES ('2444', '281', '达孜县', '0');
INSERT INTO `tp_district` VALUES ('2445', '281', '墨竹工卡县', '0');
INSERT INTO `tp_district` VALUES ('2446', '282', '昌都县', '0');
INSERT INTO `tp_district` VALUES ('2447', '282', '江达县', '0');
INSERT INTO `tp_district` VALUES ('2448', '282', '贡觉县', '0');
INSERT INTO `tp_district` VALUES ('2449', '282', '类乌齐县', '0');
INSERT INTO `tp_district` VALUES ('2450', '282', '丁青县', '0');
INSERT INTO `tp_district` VALUES ('2451', '282', '察雅县', '0');
INSERT INTO `tp_district` VALUES ('2452', '282', '八宿县', '0');
INSERT INTO `tp_district` VALUES ('2453', '282', '左贡县', '0');
INSERT INTO `tp_district` VALUES ('2454', '282', '芒康县', '0');
INSERT INTO `tp_district` VALUES ('2455', '282', '洛隆县', '0');
INSERT INTO `tp_district` VALUES ('2456', '282', '边坝县', '0');
INSERT INTO `tp_district` VALUES ('2457', '283', '乃东县', '0');
INSERT INTO `tp_district` VALUES ('2458', '283', '扎囊县', '0');
INSERT INTO `tp_district` VALUES ('2459', '283', '贡嘎县', '0');
INSERT INTO `tp_district` VALUES ('2460', '283', '桑日县', '0');
INSERT INTO `tp_district` VALUES ('2461', '283', '琼结县', '0');
INSERT INTO `tp_district` VALUES ('2462', '283', '曲松县', '0');
INSERT INTO `tp_district` VALUES ('2463', '283', '措美县', '0');
INSERT INTO `tp_district` VALUES ('2464', '283', '洛扎县', '0');
INSERT INTO `tp_district` VALUES ('2465', '283', '加查县', '0');
INSERT INTO `tp_district` VALUES ('2466', '283', '隆子县', '0');
INSERT INTO `tp_district` VALUES ('2467', '283', '错那县', '0');
INSERT INTO `tp_district` VALUES ('2468', '283', '浪卡子县', '0');
INSERT INTO `tp_district` VALUES ('2469', '284', '日喀则市', '0');
INSERT INTO `tp_district` VALUES ('2470', '284', '南木林县', '0');
INSERT INTO `tp_district` VALUES ('2471', '284', '江孜县', '0');
INSERT INTO `tp_district` VALUES ('2472', '284', '定日县', '0');
INSERT INTO `tp_district` VALUES ('2473', '284', '萨迦县', '0');
INSERT INTO `tp_district` VALUES ('2474', '284', '拉孜县', '0');
INSERT INTO `tp_district` VALUES ('2475', '284', '昂仁县', '0');
INSERT INTO `tp_district` VALUES ('2476', '284', '谢通门县', '0');
INSERT INTO `tp_district` VALUES ('2477', '284', '白朗县', '0');
INSERT INTO `tp_district` VALUES ('2478', '284', '仁布县', '0');
INSERT INTO `tp_district` VALUES ('2479', '284', '康马县', '0');
INSERT INTO `tp_district` VALUES ('2480', '284', '定结县', '0');
INSERT INTO `tp_district` VALUES ('2481', '284', '仲巴县', '0');
INSERT INTO `tp_district` VALUES ('2482', '284', '亚东县', '0');
INSERT INTO `tp_district` VALUES ('2483', '284', '吉隆县', '0');
INSERT INTO `tp_district` VALUES ('2484', '284', '聂拉木县', '0');
INSERT INTO `tp_district` VALUES ('2485', '284', '萨嘎县', '0');
INSERT INTO `tp_district` VALUES ('2486', '284', '岗巴县', '0');
INSERT INTO `tp_district` VALUES ('2487', '285', '那曲县', '0');
INSERT INTO `tp_district` VALUES ('2488', '285', '嘉黎县', '0');
INSERT INTO `tp_district` VALUES ('2489', '285', '比如县', '0');
INSERT INTO `tp_district` VALUES ('2490', '285', '聂荣县', '0');
INSERT INTO `tp_district` VALUES ('2491', '285', '安多县', '0');
INSERT INTO `tp_district` VALUES ('2492', '285', '申扎县', '0');
INSERT INTO `tp_district` VALUES ('2493', '285', '索县', '0');
INSERT INTO `tp_district` VALUES ('2494', '285', '班戈县', '0');
INSERT INTO `tp_district` VALUES ('2495', '285', '巴青县', '0');
INSERT INTO `tp_district` VALUES ('2496', '285', '尼玛县', '0');
INSERT INTO `tp_district` VALUES ('2497', '286', '普兰县', '0');
INSERT INTO `tp_district` VALUES ('2498', '286', '札达县', '0');
INSERT INTO `tp_district` VALUES ('2499', '286', '噶尔县', '0');
INSERT INTO `tp_district` VALUES ('2500', '286', '日土县', '0');
INSERT INTO `tp_district` VALUES ('2501', '286', '革吉县', '0');
INSERT INTO `tp_district` VALUES ('2502', '286', '改则县', '0');
INSERT INTO `tp_district` VALUES ('2503', '286', '措勤县', '0');
INSERT INTO `tp_district` VALUES ('2504', '287', '林芝县', '0');
INSERT INTO `tp_district` VALUES ('2505', '287', '工布江达县', '0');
INSERT INTO `tp_district` VALUES ('2506', '287', '米林县', '0');
INSERT INTO `tp_district` VALUES ('2507', '287', '墨脱县', '0');
INSERT INTO `tp_district` VALUES ('2508', '287', '波密县', '0');
INSERT INTO `tp_district` VALUES ('2509', '287', '察隅县', '0');
INSERT INTO `tp_district` VALUES ('2510', '287', '朗县', '0');
INSERT INTO `tp_district` VALUES ('2511', '288', '新城区', '0');
INSERT INTO `tp_district` VALUES ('2512', '288', '碑林区', '0');
INSERT INTO `tp_district` VALUES ('2513', '288', '莲湖区', '0');
INSERT INTO `tp_district` VALUES ('2514', '288', '灞桥区', '0');
INSERT INTO `tp_district` VALUES ('2515', '288', '未央区', '0');
INSERT INTO `tp_district` VALUES ('2516', '288', '雁塔区', '0');
INSERT INTO `tp_district` VALUES ('2517', '288', '阎良区', '0');
INSERT INTO `tp_district` VALUES ('2518', '288', '临潼区', '0');
INSERT INTO `tp_district` VALUES ('2519', '288', '长安区', '0');
INSERT INTO `tp_district` VALUES ('2520', '288', '蓝田县', '0');
INSERT INTO `tp_district` VALUES ('2521', '288', '周至县', '0');
INSERT INTO `tp_district` VALUES ('2522', '288', '户县', '0');
INSERT INTO `tp_district` VALUES ('2523', '288', '高陵县', '0');
INSERT INTO `tp_district` VALUES ('2524', '289', '王益区', '0');
INSERT INTO `tp_district` VALUES ('2525', '289', '印台区', '0');
INSERT INTO `tp_district` VALUES ('2526', '289', '耀州区', '0');
INSERT INTO `tp_district` VALUES ('2527', '289', '宜君县', '0');
INSERT INTO `tp_district` VALUES ('2528', '290', '渭滨区', '0');
INSERT INTO `tp_district` VALUES ('2529', '290', '金台区', '0');
INSERT INTO `tp_district` VALUES ('2530', '290', '陈仓区', '0');
INSERT INTO `tp_district` VALUES ('2531', '290', '凤翔县', '0');
INSERT INTO `tp_district` VALUES ('2532', '290', '岐山县', '0');
INSERT INTO `tp_district` VALUES ('2533', '290', '扶风县', '0');
INSERT INTO `tp_district` VALUES ('2534', '290', '眉县', '0');
INSERT INTO `tp_district` VALUES ('2535', '290', '陇县', '0');
INSERT INTO `tp_district` VALUES ('2536', '290', '千阳县', '0');
INSERT INTO `tp_district` VALUES ('2537', '290', '麟游县', '0');
INSERT INTO `tp_district` VALUES ('2538', '290', '凤县', '0');
INSERT INTO `tp_district` VALUES ('2539', '290', '太白县', '0');
INSERT INTO `tp_district` VALUES ('2540', '291', '秦都区', '0');
INSERT INTO `tp_district` VALUES ('2541', '291', '杨凌区', '0');
INSERT INTO `tp_district` VALUES ('2542', '291', '渭城区', '0');
INSERT INTO `tp_district` VALUES ('2543', '291', '三原县', '0');
INSERT INTO `tp_district` VALUES ('2544', '291', '泾阳县', '0');
INSERT INTO `tp_district` VALUES ('2545', '291', '乾县', '0');
INSERT INTO `tp_district` VALUES ('2546', '291', '礼泉县', '0');
INSERT INTO `tp_district` VALUES ('2547', '291', '永寿县', '0');
INSERT INTO `tp_district` VALUES ('2548', '291', '彬县', '0');
INSERT INTO `tp_district` VALUES ('2549', '291', '长武县', '0');
INSERT INTO `tp_district` VALUES ('2550', '291', '旬邑县', '0');
INSERT INTO `tp_district` VALUES ('2551', '291', '淳化县', '0');
INSERT INTO `tp_district` VALUES ('2552', '291', '武功县', '0');
INSERT INTO `tp_district` VALUES ('2553', '291', '兴平市', '0');
INSERT INTO `tp_district` VALUES ('2554', '292', '临渭区', '0');
INSERT INTO `tp_district` VALUES ('2555', '292', '华县', '0');
INSERT INTO `tp_district` VALUES ('2556', '292', '潼关县', '0');
INSERT INTO `tp_district` VALUES ('2557', '292', '大荔县', '0');
INSERT INTO `tp_district` VALUES ('2558', '292', '合阳县', '0');
INSERT INTO `tp_district` VALUES ('2559', '292', '澄城县', '0');
INSERT INTO `tp_district` VALUES ('2560', '292', '蒲城县', '0');
INSERT INTO `tp_district` VALUES ('2561', '292', '白水县', '0');
INSERT INTO `tp_district` VALUES ('2562', '292', '富平县', '0');
INSERT INTO `tp_district` VALUES ('2563', '292', '韩城市', '0');
INSERT INTO `tp_district` VALUES ('2564', '292', '华阴市', '0');
INSERT INTO `tp_district` VALUES ('2565', '293', '宝塔区', '0');
INSERT INTO `tp_district` VALUES ('2566', '293', '延长县', '0');
INSERT INTO `tp_district` VALUES ('2567', '293', '延川县', '0');
INSERT INTO `tp_district` VALUES ('2568', '293', '子长县', '0');
INSERT INTO `tp_district` VALUES ('2569', '293', '安塞县', '0');
INSERT INTO `tp_district` VALUES ('2570', '293', '志丹县', '0');
INSERT INTO `tp_district` VALUES ('2571', '293', '吴旗县', '0');
INSERT INTO `tp_district` VALUES ('2572', '293', '甘泉县', '0');
INSERT INTO `tp_district` VALUES ('2573', '293', '富县', '0');
INSERT INTO `tp_district` VALUES ('2574', '293', '洛川县', '0');
INSERT INTO `tp_district` VALUES ('2575', '293', '宜川县', '0');
INSERT INTO `tp_district` VALUES ('2576', '293', '黄龙县', '0');
INSERT INTO `tp_district` VALUES ('2577', '293', '黄陵县', '0');
INSERT INTO `tp_district` VALUES ('2578', '294', '汉台区', '0');
INSERT INTO `tp_district` VALUES ('2579', '294', '南郑县', '0');
INSERT INTO `tp_district` VALUES ('2580', '294', '城固县', '0');
INSERT INTO `tp_district` VALUES ('2581', '294', '洋县', '0');
INSERT INTO `tp_district` VALUES ('2582', '294', '西乡县', '0');
INSERT INTO `tp_district` VALUES ('2583', '294', '勉县', '0');
INSERT INTO `tp_district` VALUES ('2584', '294', '宁强县', '0');
INSERT INTO `tp_district` VALUES ('2585', '294', '略阳县', '0');
INSERT INTO `tp_district` VALUES ('2586', '294', '镇巴县', '0');
INSERT INTO `tp_district` VALUES ('2587', '294', '留坝县', '0');
INSERT INTO `tp_district` VALUES ('2588', '294', '佛坪县', '0');
INSERT INTO `tp_district` VALUES ('2589', '295', '榆阳区', '0');
INSERT INTO `tp_district` VALUES ('2590', '295', '神木县', '0');
INSERT INTO `tp_district` VALUES ('2591', '295', '府谷县', '0');
INSERT INTO `tp_district` VALUES ('2592', '295', '横山县', '0');
INSERT INTO `tp_district` VALUES ('2593', '295', '靖边县', '0');
INSERT INTO `tp_district` VALUES ('2594', '295', '定边县', '0');
INSERT INTO `tp_district` VALUES ('2595', '295', '绥德县', '0');
INSERT INTO `tp_district` VALUES ('2596', '295', '米脂县', '0');
INSERT INTO `tp_district` VALUES ('2597', '295', '佳县', '0');
INSERT INTO `tp_district` VALUES ('2598', '295', '吴堡县', '0');
INSERT INTO `tp_district` VALUES ('2599', '295', '清涧县', '0');
INSERT INTO `tp_district` VALUES ('2600', '295', '子洲县', '0');
INSERT INTO `tp_district` VALUES ('2601', '296', '汉滨区', '0');
INSERT INTO `tp_district` VALUES ('2602', '296', '汉阴县', '0');
INSERT INTO `tp_district` VALUES ('2603', '296', '石泉县', '0');
INSERT INTO `tp_district` VALUES ('2604', '296', '宁陕县', '0');
INSERT INTO `tp_district` VALUES ('2605', '296', '紫阳县', '0');
INSERT INTO `tp_district` VALUES ('2606', '296', '岚皋县', '0');
INSERT INTO `tp_district` VALUES ('2607', '296', '平利县', '0');
INSERT INTO `tp_district` VALUES ('2608', '296', '镇坪县', '0');
INSERT INTO `tp_district` VALUES ('2609', '296', '旬阳县', '0');
INSERT INTO `tp_district` VALUES ('2610', '296', '白河县', '0');
INSERT INTO `tp_district` VALUES ('2611', '297', '商州区', '0');
INSERT INTO `tp_district` VALUES ('2612', '297', '洛南县', '0');
INSERT INTO `tp_district` VALUES ('2613', '297', '丹凤县', '0');
INSERT INTO `tp_district` VALUES ('2614', '297', '商南县', '0');
INSERT INTO `tp_district` VALUES ('2615', '297', '山阳县', '0');
INSERT INTO `tp_district` VALUES ('2616', '297', '镇安县', '0');
INSERT INTO `tp_district` VALUES ('2617', '297', '柞水县', '0');
INSERT INTO `tp_district` VALUES ('2618', '298', '城关区', '0');
INSERT INTO `tp_district` VALUES ('2619', '298', '七里河区', '0');
INSERT INTO `tp_district` VALUES ('2620', '298', '西固区', '0');
INSERT INTO `tp_district` VALUES ('2621', '298', '安宁区', '0');
INSERT INTO `tp_district` VALUES ('2622', '298', '红古区', '0');
INSERT INTO `tp_district` VALUES ('2623', '298', '永登县', '0');
INSERT INTO `tp_district` VALUES ('2624', '298', '皋兰县', '0');
INSERT INTO `tp_district` VALUES ('2625', '298', '榆中县', '0');
INSERT INTO `tp_district` VALUES ('2626', '300', '金川区', '0');
INSERT INTO `tp_district` VALUES ('2627', '300', '永昌县', '0');
INSERT INTO `tp_district` VALUES ('2628', '301', '白银区', '0');
INSERT INTO `tp_district` VALUES ('2629', '301', '平川区', '0');
INSERT INTO `tp_district` VALUES ('2630', '301', '靖远县', '0');
INSERT INTO `tp_district` VALUES ('2631', '301', '会宁县', '0');
INSERT INTO `tp_district` VALUES ('2632', '301', '景泰县', '0');
INSERT INTO `tp_district` VALUES ('2633', '302', '秦城区', '0');
INSERT INTO `tp_district` VALUES ('2634', '302', '北道区', '0');
INSERT INTO `tp_district` VALUES ('2635', '302', '清水县', '0');
INSERT INTO `tp_district` VALUES ('2636', '302', '秦安县', '0');
INSERT INTO `tp_district` VALUES ('2637', '302', '甘谷县', '0');
INSERT INTO `tp_district` VALUES ('2638', '302', '武山县', '0');
INSERT INTO `tp_district` VALUES ('2639', '302', '张家川回族自治县', '0');
INSERT INTO `tp_district` VALUES ('2640', '303', '凉州区', '0');
INSERT INTO `tp_district` VALUES ('2641', '303', '民勤县', '0');
INSERT INTO `tp_district` VALUES ('2642', '303', '古浪县', '0');
INSERT INTO `tp_district` VALUES ('2643', '303', '天祝藏族自治县', '0');
INSERT INTO `tp_district` VALUES ('2644', '304', '甘州区', '0');
INSERT INTO `tp_district` VALUES ('2645', '304', '肃南裕固族自治县', '0');
INSERT INTO `tp_district` VALUES ('2646', '304', '民乐县', '0');
INSERT INTO `tp_district` VALUES ('2647', '304', '临泽县', '0');
INSERT INTO `tp_district` VALUES ('2648', '304', '高台县', '0');
INSERT INTO `tp_district` VALUES ('2649', '304', '山丹县', '0');
INSERT INTO `tp_district` VALUES ('2650', '305', '崆峒区', '0');
INSERT INTO `tp_district` VALUES ('2651', '305', '泾川县', '0');
INSERT INTO `tp_district` VALUES ('2652', '305', '灵台县', '0');
INSERT INTO `tp_district` VALUES ('2653', '305', '崇信县', '0');
INSERT INTO `tp_district` VALUES ('2654', '305', '华亭县', '0');
INSERT INTO `tp_district` VALUES ('2655', '305', '庄浪县', '0');
INSERT INTO `tp_district` VALUES ('2656', '305', '静宁县', '0');
INSERT INTO `tp_district` VALUES ('2657', '306', '肃州区', '0');
INSERT INTO `tp_district` VALUES ('2658', '306', '金塔县', '0');
INSERT INTO `tp_district` VALUES ('2659', '306', '安西县', '0');
INSERT INTO `tp_district` VALUES ('2660', '306', '肃北蒙古族自治县', '0');
INSERT INTO `tp_district` VALUES ('2661', '306', '阿克塞哈萨克族自治县', '0');
INSERT INTO `tp_district` VALUES ('2662', '306', '玉门市', '0');
INSERT INTO `tp_district` VALUES ('2663', '306', '敦煌市', '0');
INSERT INTO `tp_district` VALUES ('2664', '307', '西峰区', '0');
INSERT INTO `tp_district` VALUES ('2665', '307', '庆城县', '0');
INSERT INTO `tp_district` VALUES ('2666', '307', '环县', '0');
INSERT INTO `tp_district` VALUES ('2667', '307', '华池县', '0');
INSERT INTO `tp_district` VALUES ('2668', '307', '合水县', '0');
INSERT INTO `tp_district` VALUES ('2669', '307', '正宁县', '0');
INSERT INTO `tp_district` VALUES ('2670', '307', '宁县', '0');
INSERT INTO `tp_district` VALUES ('2671', '307', '镇原县', '0');
INSERT INTO `tp_district` VALUES ('2672', '308', '安定区', '0');
INSERT INTO `tp_district` VALUES ('2673', '308', '通渭县', '0');
INSERT INTO `tp_district` VALUES ('2674', '308', '陇西县', '0');
INSERT INTO `tp_district` VALUES ('2675', '308', '渭源县', '0');
INSERT INTO `tp_district` VALUES ('2676', '308', '临洮县', '0');
INSERT INTO `tp_district` VALUES ('2677', '308', '漳县', '0');
INSERT INTO `tp_district` VALUES ('2678', '308', '岷县', '0');
INSERT INTO `tp_district` VALUES ('2679', '309', '武都区', '0');
INSERT INTO `tp_district` VALUES ('2680', '309', '成县', '0');
INSERT INTO `tp_district` VALUES ('2681', '309', '文县', '0');
INSERT INTO `tp_district` VALUES ('2682', '309', '宕昌县', '0');
INSERT INTO `tp_district` VALUES ('2683', '309', '康县', '0');
INSERT INTO `tp_district` VALUES ('2684', '309', '西和县', '0');
INSERT INTO `tp_district` VALUES ('2685', '309', '礼县', '0');
INSERT INTO `tp_district` VALUES ('2686', '309', '徽县', '0');
INSERT INTO `tp_district` VALUES ('2687', '309', '两当县', '0');
INSERT INTO `tp_district` VALUES ('2688', '310', '临夏市', '0');
INSERT INTO `tp_district` VALUES ('2689', '310', '临夏县', '0');
INSERT INTO `tp_district` VALUES ('2690', '310', '康乐县', '0');
INSERT INTO `tp_district` VALUES ('2691', '310', '永靖县', '0');
INSERT INTO `tp_district` VALUES ('2692', '310', '广河县', '0');
INSERT INTO `tp_district` VALUES ('2693', '310', '和政县', '0');
INSERT INTO `tp_district` VALUES ('2694', '310', '东乡族自治县', '0');
INSERT INTO `tp_district` VALUES ('2695', '310', '积石山保安族东乡族撒拉族自治县', '0');
INSERT INTO `tp_district` VALUES ('2696', '311', '合作市', '0');
INSERT INTO `tp_district` VALUES ('2697', '311', '临潭县', '0');
INSERT INTO `tp_district` VALUES ('2698', '311', '卓尼县', '0');
INSERT INTO `tp_district` VALUES ('2699', '311', '舟曲县', '0');
INSERT INTO `tp_district` VALUES ('2700', '311', '迭部县', '0');
INSERT INTO `tp_district` VALUES ('2701', '311', '玛曲县', '0');
INSERT INTO `tp_district` VALUES ('2702', '311', '碌曲县', '0');
INSERT INTO `tp_district` VALUES ('2703', '311', '夏河县', '0');
INSERT INTO `tp_district` VALUES ('2704', '312', '城东区', '0');
INSERT INTO `tp_district` VALUES ('2705', '312', '城中区', '0');
INSERT INTO `tp_district` VALUES ('2706', '312', '城西区', '0');
INSERT INTO `tp_district` VALUES ('2707', '312', '城北区', '0');
INSERT INTO `tp_district` VALUES ('2708', '312', '大通回族土族自治县', '0');
INSERT INTO `tp_district` VALUES ('2709', '312', '湟中县', '0');
INSERT INTO `tp_district` VALUES ('2710', '312', '湟源县', '0');
INSERT INTO `tp_district` VALUES ('2711', '313', '平安县', '0');
INSERT INTO `tp_district` VALUES ('2712', '313', '民和回族土族自治县', '0');
INSERT INTO `tp_district` VALUES ('2713', '313', '乐都县', '0');
INSERT INTO `tp_district` VALUES ('2714', '313', '互助土族自治县', '0');
INSERT INTO `tp_district` VALUES ('2715', '313', '化隆回族自治县', '0');
INSERT INTO `tp_district` VALUES ('2716', '313', '循化撒拉族自治县', '0');
INSERT INTO `tp_district` VALUES ('2717', '314', '门源回族自治县', '0');
INSERT INTO `tp_district` VALUES ('2718', '314', '祁连县', '0');
INSERT INTO `tp_district` VALUES ('2719', '314', '海晏县', '0');
INSERT INTO `tp_district` VALUES ('2720', '314', '刚察县', '0');
INSERT INTO `tp_district` VALUES ('2721', '315', '同仁县', '0');
INSERT INTO `tp_district` VALUES ('2722', '315', '尖扎县', '0');
INSERT INTO `tp_district` VALUES ('2723', '315', '泽库县', '0');
INSERT INTO `tp_district` VALUES ('2724', '315', '河南蒙古族自治县', '0');
INSERT INTO `tp_district` VALUES ('2725', '316', '共和县', '0');
INSERT INTO `tp_district` VALUES ('2726', '316', '同德县', '0');
INSERT INTO `tp_district` VALUES ('2727', '316', '贵德县', '0');
INSERT INTO `tp_district` VALUES ('2728', '316', '兴海县', '0');
INSERT INTO `tp_district` VALUES ('2729', '316', '贵南县', '0');
INSERT INTO `tp_district` VALUES ('2730', '317', '玛沁县', '0');
INSERT INTO `tp_district` VALUES ('2731', '317', '班玛县', '0');
INSERT INTO `tp_district` VALUES ('2732', '317', '甘德县', '0');
INSERT INTO `tp_district` VALUES ('2733', '317', '达日县', '0');
INSERT INTO `tp_district` VALUES ('2734', '317', '久治县', '0');
INSERT INTO `tp_district` VALUES ('2735', '317', '玛多县', '0');
INSERT INTO `tp_district` VALUES ('2736', '318', '玉树县', '0');
INSERT INTO `tp_district` VALUES ('2737', '318', '杂多县', '0');
INSERT INTO `tp_district` VALUES ('2738', '318', '称多县', '0');
INSERT INTO `tp_district` VALUES ('2739', '318', '治多县', '0');
INSERT INTO `tp_district` VALUES ('2740', '318', '囊谦县', '0');
INSERT INTO `tp_district` VALUES ('2741', '318', '曲麻莱县', '0');
INSERT INTO `tp_district` VALUES ('2742', '319', '格尔木市', '0');
INSERT INTO `tp_district` VALUES ('2743', '319', '德令哈市', '0');
INSERT INTO `tp_district` VALUES ('2744', '319', '乌兰县', '0');
INSERT INTO `tp_district` VALUES ('2745', '319', '都兰县', '0');
INSERT INTO `tp_district` VALUES ('2746', '319', '天峻县', '0');
INSERT INTO `tp_district` VALUES ('2747', '320', '兴庆区', '0');
INSERT INTO `tp_district` VALUES ('2748', '320', '西夏区', '0');
INSERT INTO `tp_district` VALUES ('2749', '320', '金凤区', '0');
INSERT INTO `tp_district` VALUES ('2750', '320', '永宁县', '0');
INSERT INTO `tp_district` VALUES ('2751', '320', '贺兰县', '0');
INSERT INTO `tp_district` VALUES ('2752', '320', '灵武市', '0');
INSERT INTO `tp_district` VALUES ('2753', '321', '大武口区', '0');
INSERT INTO `tp_district` VALUES ('2754', '321', '惠农区', '0');
INSERT INTO `tp_district` VALUES ('2755', '321', '平罗县', '0');
INSERT INTO `tp_district` VALUES ('2756', '322', '利通区', '0');
INSERT INTO `tp_district` VALUES ('2757', '322', '盐池县', '0');
INSERT INTO `tp_district` VALUES ('2758', '322', '同心县', '0');
INSERT INTO `tp_district` VALUES ('2759', '322', '青铜峡市', '0');
INSERT INTO `tp_district` VALUES ('2760', '323', '原州区', '0');
INSERT INTO `tp_district` VALUES ('2761', '323', '西吉县', '0');
INSERT INTO `tp_district` VALUES ('2762', '323', '隆德县', '0');
INSERT INTO `tp_district` VALUES ('2763', '323', '泾源县', '0');
INSERT INTO `tp_district` VALUES ('2764', '323', '彭阳县', '0');
INSERT INTO `tp_district` VALUES ('2765', '324', '沙坡头区', '0');
INSERT INTO `tp_district` VALUES ('2766', '324', '中宁县', '0');
INSERT INTO `tp_district` VALUES ('2767', '324', '海原县', '0');
INSERT INTO `tp_district` VALUES ('2768', '325', '天山区', '0');
INSERT INTO `tp_district` VALUES ('2769', '325', '沙依巴克区', '0');
INSERT INTO `tp_district` VALUES ('2770', '325', '新市区', '0');
INSERT INTO `tp_district` VALUES ('2771', '325', '水磨沟区', '0');
INSERT INTO `tp_district` VALUES ('2772', '325', '头屯河区', '0');
INSERT INTO `tp_district` VALUES ('2773', '325', '达坂城区', '0');
INSERT INTO `tp_district` VALUES ('2774', '325', '东山区', '0');
INSERT INTO `tp_district` VALUES ('2775', '325', '乌鲁木齐县', '0');
INSERT INTO `tp_district` VALUES ('2776', '326', '独山子区', '0');
INSERT INTO `tp_district` VALUES ('2777', '326', '克拉玛依区', '0');
INSERT INTO `tp_district` VALUES ('2778', '326', '白碱滩区', '0');
INSERT INTO `tp_district` VALUES ('2779', '326', '乌尔禾区', '0');
INSERT INTO `tp_district` VALUES ('2780', '327', '吐鲁番市', '0');
INSERT INTO `tp_district` VALUES ('2781', '327', '鄯善县', '0');
INSERT INTO `tp_district` VALUES ('2782', '327', '托克逊县', '0');
INSERT INTO `tp_district` VALUES ('2783', '328', '哈密市', '0');
INSERT INTO `tp_district` VALUES ('2784', '328', '巴里坤哈萨克自治县', '0');
INSERT INTO `tp_district` VALUES ('2785', '328', '伊吾县', '0');
INSERT INTO `tp_district` VALUES ('2786', '329', '昌吉市', '0');
INSERT INTO `tp_district` VALUES ('2787', '329', '阜康市', '0');
INSERT INTO `tp_district` VALUES ('2788', '329', '米泉市', '0');
INSERT INTO `tp_district` VALUES ('2789', '329', '呼图壁县', '0');
INSERT INTO `tp_district` VALUES ('2790', '329', '玛纳斯县', '0');
INSERT INTO `tp_district` VALUES ('2791', '329', '奇台县', '0');
INSERT INTO `tp_district` VALUES ('2792', '329', '吉木萨尔县', '0');
INSERT INTO `tp_district` VALUES ('2793', '329', '木垒哈萨克自治县', '0');
INSERT INTO `tp_district` VALUES ('2794', '330', '博乐市', '0');
INSERT INTO `tp_district` VALUES ('2795', '330', '精河县', '0');
INSERT INTO `tp_district` VALUES ('2796', '330', '温泉县', '0');
INSERT INTO `tp_district` VALUES ('2797', '331', '库尔勒市', '0');
INSERT INTO `tp_district` VALUES ('2798', '331', '轮台县', '0');
INSERT INTO `tp_district` VALUES ('2799', '331', '尉犁县', '0');
INSERT INTO `tp_district` VALUES ('2800', '331', '若羌县', '0');
INSERT INTO `tp_district` VALUES ('2801', '331', '且末县', '0');
INSERT INTO `tp_district` VALUES ('2802', '331', '焉耆回族自治县', '0');
INSERT INTO `tp_district` VALUES ('2803', '331', '和静县', '0');
INSERT INTO `tp_district` VALUES ('2804', '331', '和硕县', '0');
INSERT INTO `tp_district` VALUES ('2805', '331', '博湖县', '0');
INSERT INTO `tp_district` VALUES ('2806', '332', '阿克苏市', '0');
INSERT INTO `tp_district` VALUES ('2807', '332', '温宿县', '0');
INSERT INTO `tp_district` VALUES ('2808', '332', '库车县', '0');
INSERT INTO `tp_district` VALUES ('2809', '332', '沙雅县', '0');
INSERT INTO `tp_district` VALUES ('2810', '332', '新和县', '0');
INSERT INTO `tp_district` VALUES ('2811', '332', '拜城县', '0');
INSERT INTO `tp_district` VALUES ('2812', '332', '乌什县', '0');
INSERT INTO `tp_district` VALUES ('2813', '332', '阿瓦提县', '0');
INSERT INTO `tp_district` VALUES ('2814', '332', '柯坪县', '0');
INSERT INTO `tp_district` VALUES ('2815', '333', '阿图什市', '0');
INSERT INTO `tp_district` VALUES ('2816', '333', '阿克陶县', '0');
INSERT INTO `tp_district` VALUES ('2817', '333', '阿合奇县', '0');
INSERT INTO `tp_district` VALUES ('2818', '333', '乌恰县', '0');
INSERT INTO `tp_district` VALUES ('2819', '334', '喀什市', '0');
INSERT INTO `tp_district` VALUES ('2820', '334', '疏附县', '0');
INSERT INTO `tp_district` VALUES ('2821', '334', '疏勒县', '0');
INSERT INTO `tp_district` VALUES ('2822', '334', '英吉沙县', '0');
INSERT INTO `tp_district` VALUES ('2823', '334', '泽普县', '0');
INSERT INTO `tp_district` VALUES ('2824', '334', '莎车县', '0');
INSERT INTO `tp_district` VALUES ('2825', '334', '叶城县', '0');
INSERT INTO `tp_district` VALUES ('2826', '334', '麦盖提县', '0');
INSERT INTO `tp_district` VALUES ('2827', '334', '岳普湖县', '0');
INSERT INTO `tp_district` VALUES ('2828', '334', '伽师县', '0');
INSERT INTO `tp_district` VALUES ('2829', '334', '巴楚县', '0');
INSERT INTO `tp_district` VALUES ('2830', '334', '塔什库尔干塔吉克自治县', '0');
INSERT INTO `tp_district` VALUES ('2831', '335', '和田市', '0');
INSERT INTO `tp_district` VALUES ('2832', '335', '和田县', '0');
INSERT INTO `tp_district` VALUES ('2833', '335', '墨玉县', '0');
INSERT INTO `tp_district` VALUES ('2834', '335', '皮山县', '0');
INSERT INTO `tp_district` VALUES ('2835', '335', '洛浦县', '0');
INSERT INTO `tp_district` VALUES ('2836', '335', '策勒县', '0');
INSERT INTO `tp_district` VALUES ('2837', '335', '于田县', '0');
INSERT INTO `tp_district` VALUES ('2838', '335', '民丰县', '0');
INSERT INTO `tp_district` VALUES ('2839', '336', '伊宁市', '0');
INSERT INTO `tp_district` VALUES ('2840', '336', '奎屯市', '0');
INSERT INTO `tp_district` VALUES ('2841', '336', '伊宁县', '0');
INSERT INTO `tp_district` VALUES ('2842', '336', '察布查尔锡伯自治县', '0');
INSERT INTO `tp_district` VALUES ('2843', '336', '霍城县', '0');
INSERT INTO `tp_district` VALUES ('2844', '336', '巩留县', '0');
INSERT INTO `tp_district` VALUES ('2845', '336', '新源县', '0');
INSERT INTO `tp_district` VALUES ('2846', '336', '昭苏县', '0');
INSERT INTO `tp_district` VALUES ('2847', '336', '特克斯县', '0');
INSERT INTO `tp_district` VALUES ('2848', '336', '尼勒克县', '0');
INSERT INTO `tp_district` VALUES ('2849', '337', '塔城市', '0');
INSERT INTO `tp_district` VALUES ('2850', '337', '乌苏市', '0');
INSERT INTO `tp_district` VALUES ('2851', '337', '额敏县', '0');
INSERT INTO `tp_district` VALUES ('2852', '337', '沙湾县', '0');
INSERT INTO `tp_district` VALUES ('2853', '337', '托里县', '0');
INSERT INTO `tp_district` VALUES ('2854', '337', '裕民县', '0');
INSERT INTO `tp_district` VALUES ('2855', '337', '和布克赛尔蒙古自治县', '0');
INSERT INTO `tp_district` VALUES ('2856', '338', '阿勒泰市', '0');
INSERT INTO `tp_district` VALUES ('2857', '338', '布尔津县', '0');
INSERT INTO `tp_district` VALUES ('2858', '338', '富蕴县', '0');
INSERT INTO `tp_district` VALUES ('2859', '338', '福海县', '0');
INSERT INTO `tp_district` VALUES ('2860', '338', '哈巴河县', '0');
INSERT INTO `tp_district` VALUES ('2861', '338', '青河县', '0');
INSERT INTO `tp_district` VALUES ('2862', '338', '吉木乃县', '0');
INSERT INTO `tp_district` VALUES ('2865', '345', '台北', '0');
INSERT INTO `tp_district` VALUES ('2866', '356', '高雄', '0');

-- ----------------------------
-- Table structure for tp_express_company
-- ----------------------------
DROP TABLE IF EXISTS `tp_express_company`;
CREATE TABLE `tp_express_company` (
  `co_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表序号',
  `shop_id` int(11) DEFAULT NULL COMMENT '商铺id',
  `company_name` varchar(50) NOT NULL DEFAULT '' COMMENT '物流公司名称',
  `express_no` varchar(20) NOT NULL DEFAULT '' COMMENT '物流编号',
  `is_enabled` int(11) NOT NULL DEFAULT '1' COMMENT '使用状态',
  `image` varchar(255) DEFAULT '' COMMENT '物流公司模版图片',
  `phone` varchar(50) NOT NULL DEFAULT '' COMMENT '联系电话',
  `orders` int(11) DEFAULT NULL,
  `express_logo` varchar(255) DEFAULT '' COMMENT '公司logo',
  `is_default` int(11) NOT NULL DEFAULT '0' COMMENT '是否设置为默认 0未设置 1 默认',
  PRIMARY KEY (`co_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7410 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=420 COMMENT='物流公司';

-- ----------------------------
-- Records of tp_express_company
-- ----------------------------
INSERT INTO `tp_express_company` VALUES ('7405', '0', '申通', 'YD', '1', '', '', '1', '', '0');
INSERT INTO `tp_express_company` VALUES ('7406', '0', '京东物流', '000000', '1', '', '15263254521', '2', '', '1');
INSERT INTO `tp_express_company` VALUES ('7407', '41', '韵达', 'yd', '1', '', '', '0', '', '0');
INSERT INTO `tp_express_company` VALUES ('7408', '1', '菜鸟', 'cn', '1', '', '', '0', '', '0');
INSERT INTO `tp_express_company` VALUES ('7409', '0', '11', '111111111111', '1', '', '1111111111111', '0', '', '0');

-- ----------------------------
-- Table structure for tp_express_shipping
-- ----------------------------
DROP TABLE IF EXISTS `tp_express_shipping`;
CREATE TABLE `tp_express_shipping` (
  `sid` int(11) NOT NULL AUTO_INCREMENT COMMENT '运单模版id',
  `shop_id` int(11) NOT NULL COMMENT '店铺id',
  `template_name` varchar(255) NOT NULL DEFAULT '' COMMENT '模版名称',
  `co_id` int(11) NOT NULL DEFAULT '0' COMMENT '物流公司 id',
  `size_type` smallint(6) NOT NULL DEFAULT '1' COMMENT '尺寸类型 1像素px  2毫米mm',
  `width` smallint(6) NOT NULL DEFAULT '0' COMMENT '宽度',
  `height` smallint(6) NOT NULL DEFAULT '0' COMMENT '长度',
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '快递单图片',
  PRIMARY KEY (`sid`),
  KEY `IDX_express_shipping_co_id` (`co_id`),
  KEY `IDX_express_shipping_shopId` (`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11232 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=5461 COMMENT='运单模板';

-- ----------------------------
-- Records of tp_express_shipping
-- ----------------------------
INSERT INTO `tp_express_shipping` VALUES ('11218', '0', '申通', '7405', '1', '869', '480', 'upload/express/1497094431.JPG');
INSERT INTO `tp_express_shipping` VALUES ('11219', '0', '京东物流', '7406', '1', '869', '480', 'upload/express/1497354985.png');
INSERT INTO `tp_express_shipping` VALUES ('11220', '0', '安达', '7407', '1', '0', '0', '');
INSERT INTO `tp_express_shipping` VALUES ('11221', '0', '安达', '7408', '1', '0', '0', '');
INSERT INTO `tp_express_shipping` VALUES ('11222', '0', '圆通', '7407', '1', '0', '0', '');
INSERT INTO `tp_express_shipping` VALUES ('11223', '0', '1', '7408', '1', '0', '0', '');
INSERT INTO `tp_express_shipping` VALUES ('11224', '0', '11', '7409', '1', '0', '0', '');
INSERT INTO `tp_express_shipping` VALUES ('11225', '0', '11', '7410', '1', '0', '0', '');
INSERT INTO `tp_express_shipping` VALUES ('11226', '0', '111', '7417', '1', '0', '0', '');
INSERT INTO `tp_express_shipping` VALUES ('11227', '0', '22', '7418', '1', '0', '0', '');
INSERT INTO `tp_express_shipping` VALUES ('11228', '0', '测试物流公司', '7419', '1', '0', '0', '');
INSERT INTO `tp_express_shipping` VALUES ('11229', '41', '韵达', '7407', '1', '0', '0', '');
INSERT INTO `tp_express_shipping` VALUES ('11230', '1', '菜鸟', '7408', '1', '0', '0', '');
INSERT INTO `tp_express_shipping` VALUES ('11231', '0', '11', '7409', '1', '0', '0', '');

-- ----------------------------
-- Table structure for tp_express_shipping_items
-- ----------------------------
DROP TABLE IF EXISTS `tp_express_shipping_items`;
CREATE TABLE `tp_express_shipping_items` (
  `sid` int(11) NOT NULL DEFAULT '0' COMMENT '运单模版id',
  `field_name` varchar(30) NOT NULL COMMENT '字段名称',
  `field_display_name` varchar(255) NOT NULL COMMENT '打印项名称',
  `is_print` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否打印',
  `x` int(11) NOT NULL DEFAULT '0' COMMENT 'x',
  `y` int(11) NOT NULL DEFAULT '0' COMMENT 'y',
  PRIMARY KEY (`sid`,`field_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=420 COMMENT='物流模板打印项';

-- ----------------------------
-- Records of tp_express_shipping_items
-- ----------------------------
INSERT INTO `tp_express_shipping_items` VALUES ('11218', 'A1', '订单编号', '1', '146', '67');
INSERT INTO `tp_express_shipping_items` VALUES ('11218', 'A10', '收件人邮编', '1', '445', '226');
INSERT INTO `tp_express_shipping_items` VALUES ('11218', 'A11', '货到付款物流编号', '1', '338', '164');
INSERT INTO `tp_express_shipping_items` VALUES ('11218', 'A12', '代收金额', '1', '698', '13');
INSERT INTO `tp_express_shipping_items` VALUES ('11218', 'A13', '备注', '1', '583', '253');
INSERT INTO `tp_express_shipping_items` VALUES ('11218', 'A2', '发件人公司', '1', '84', '131');
INSERT INTO `tp_express_shipping_items` VALUES ('11218', 'A3', '发件人地址', '1', '263', '307');
INSERT INTO `tp_express_shipping_items` VALUES ('11218', 'A4', '发件人姓名', '1', '87', '183');
INSERT INTO `tp_express_shipping_items` VALUES ('11218', 'A5', '发件人电话', '1', '378', '248');
INSERT INTO `tp_express_shipping_items` VALUES ('11218', 'A6', '发件人邮编', '1', '369', '85');
INSERT INTO `tp_express_shipping_items` VALUES ('11218', 'A7', '收件人地址', '1', '405', '345');
INSERT INTO `tp_express_shipping_items` VALUES ('11218', 'A8', '收件人姓名', '1', '579', '154');
INSERT INTO `tp_express_shipping_items` VALUES ('11218', 'A9', '收件人电话', '1', '127', '301');
INSERT INTO `tp_express_shipping_items` VALUES ('11219', 'A1', '订单编号', '0', '-3', '94');
INSERT INTO `tp_express_shipping_items` VALUES ('11219', 'A10', '收件人邮编', '1', '4', '56');
INSERT INTO `tp_express_shipping_items` VALUES ('11219', 'A11', '货到付款物流编号', '1', '10', '297');
INSERT INTO `tp_express_shipping_items` VALUES ('11219', 'A12', '代收金额', '1', '10', '197');
INSERT INTO `tp_express_shipping_items` VALUES ('11219', 'A13', '备注', '1', '0', '246');
INSERT INTO `tp_express_shipping_items` VALUES ('11219', 'A2', '发件人公司', '1', '350', '146');
INSERT INTO `tp_express_shipping_items` VALUES ('11219', 'A3', '发件人地址', '1', '410', '194');
INSERT INTO `tp_express_shipping_items` VALUES ('11219', 'A4', '发件人姓名', '1', '0', '158');
INSERT INTO `tp_express_shipping_items` VALUES ('11219', 'A5', '发件人电话', '1', '337', '263');
INSERT INTO `tp_express_shipping_items` VALUES ('11219', 'A6', '发件人邮编', '1', '342', '251');
INSERT INTO `tp_express_shipping_items` VALUES ('11219', 'A7', '收件人地址', '1', '1', '367');
INSERT INTO `tp_express_shipping_items` VALUES ('11219', 'A8', '收件人姓名', '1', '499', '232');
INSERT INTO `tp_express_shipping_items` VALUES ('11219', 'A9', '收件人电话', '1', '280', '245');
INSERT INTO `tp_express_shipping_items` VALUES ('11220', 'A1', '订单编号', '1', '10', '11');
INSERT INTO `tp_express_shipping_items` VALUES ('11220', 'A10', '收件人邮编', '1', '10', '86');
INSERT INTO `tp_express_shipping_items` VALUES ('11220', 'A11', '货到付款物流编号', '1', '10', '286');
INSERT INTO `tp_express_shipping_items` VALUES ('11220', 'A12', '代收金额', '1', '10', '186');
INSERT INTO `tp_express_shipping_items` VALUES ('11220', 'A13', '备注', '1', '10', '311');
INSERT INTO `tp_express_shipping_items` VALUES ('11220', 'A2', '发件人公司', '1', '10', '36');
INSERT INTO `tp_express_shipping_items` VALUES ('11220', 'A3', '发件人地址', '1', '10', '136');
INSERT INTO `tp_express_shipping_items` VALUES ('11220', 'A4', '发件人姓名', '1', '10', '111');
INSERT INTO `tp_express_shipping_items` VALUES ('11220', 'A5', '发件人电话', '1', '10', '211');
INSERT INTO `tp_express_shipping_items` VALUES ('11220', 'A6', '发件人邮编', '1', '10', '236');
INSERT INTO `tp_express_shipping_items` VALUES ('11220', 'A7', '收件人地址', '1', '10', '261');
INSERT INTO `tp_express_shipping_items` VALUES ('11220', 'A8', '收件人姓名', '1', '10', '61');
INSERT INTO `tp_express_shipping_items` VALUES ('11220', 'A9', '收件人电话', '1', '10', '161');
INSERT INTO `tp_express_shipping_items` VALUES ('11221', 'A1', '订单编号', '1', '10', '11');
INSERT INTO `tp_express_shipping_items` VALUES ('11221', 'A10', '收件人邮编', '1', '10', '86');
INSERT INTO `tp_express_shipping_items` VALUES ('11221', 'A11', '货到付款物流编号', '1', '10', '286');
INSERT INTO `tp_express_shipping_items` VALUES ('11221', 'A12', '代收金额', '1', '10', '186');
INSERT INTO `tp_express_shipping_items` VALUES ('11221', 'A13', '备注', '1', '10', '311');
INSERT INTO `tp_express_shipping_items` VALUES ('11221', 'A2', '发件人公司', '1', '10', '36');
INSERT INTO `tp_express_shipping_items` VALUES ('11221', 'A3', '发件人地址', '1', '10', '136');
INSERT INTO `tp_express_shipping_items` VALUES ('11221', 'A4', '发件人姓名', '1', '10', '111');
INSERT INTO `tp_express_shipping_items` VALUES ('11221', 'A5', '发件人电话', '1', '10', '211');
INSERT INTO `tp_express_shipping_items` VALUES ('11221', 'A6', '发件人邮编', '1', '10', '236');
INSERT INTO `tp_express_shipping_items` VALUES ('11221', 'A7', '收件人地址', '1', '10', '261');
INSERT INTO `tp_express_shipping_items` VALUES ('11221', 'A8', '收件人姓名', '1', '10', '61');
INSERT INTO `tp_express_shipping_items` VALUES ('11221', 'A9', '收件人电话', '1', '10', '161');
INSERT INTO `tp_express_shipping_items` VALUES ('11222', 'A1', '订单编号', '1', '10', '11');
INSERT INTO `tp_express_shipping_items` VALUES ('11222', 'A10', '收件人邮编', '1', '10', '86');
INSERT INTO `tp_express_shipping_items` VALUES ('11222', 'A11', '货到付款物流编号', '1', '10', '286');
INSERT INTO `tp_express_shipping_items` VALUES ('11222', 'A12', '代收金额', '1', '10', '186');
INSERT INTO `tp_express_shipping_items` VALUES ('11222', 'A13', '备注', '1', '10', '311');
INSERT INTO `tp_express_shipping_items` VALUES ('11222', 'A2', '发件人公司', '1', '10', '36');
INSERT INTO `tp_express_shipping_items` VALUES ('11222', 'A3', '发件人地址', '1', '10', '136');
INSERT INTO `tp_express_shipping_items` VALUES ('11222', 'A4', '发件人姓名', '1', '10', '111');
INSERT INTO `tp_express_shipping_items` VALUES ('11222', 'A5', '发件人电话', '1', '10', '211');
INSERT INTO `tp_express_shipping_items` VALUES ('11222', 'A6', '发件人邮编', '1', '10', '236');
INSERT INTO `tp_express_shipping_items` VALUES ('11222', 'A7', '收件人地址', '1', '10', '261');
INSERT INTO `tp_express_shipping_items` VALUES ('11222', 'A8', '收件人姓名', '1', '10', '61');
INSERT INTO `tp_express_shipping_items` VALUES ('11222', 'A9', '收件人电话', '1', '10', '161');
INSERT INTO `tp_express_shipping_items` VALUES ('11223', 'A1', '订单编号', '1', '10', '11');
INSERT INTO `tp_express_shipping_items` VALUES ('11223', 'A10', '收件人邮编', '1', '10', '86');
INSERT INTO `tp_express_shipping_items` VALUES ('11223', 'A11', '货到付款物流编号', '1', '10', '286');
INSERT INTO `tp_express_shipping_items` VALUES ('11223', 'A12', '代收金额', '1', '10', '186');
INSERT INTO `tp_express_shipping_items` VALUES ('11223', 'A13', '备注', '1', '10', '311');
INSERT INTO `tp_express_shipping_items` VALUES ('11223', 'A2', '发件人公司', '1', '10', '36');
INSERT INTO `tp_express_shipping_items` VALUES ('11223', 'A3', '发件人地址', '1', '10', '136');
INSERT INTO `tp_express_shipping_items` VALUES ('11223', 'A4', '发件人姓名', '1', '10', '111');
INSERT INTO `tp_express_shipping_items` VALUES ('11223', 'A5', '发件人电话', '1', '10', '211');
INSERT INTO `tp_express_shipping_items` VALUES ('11223', 'A6', '发件人邮编', '1', '10', '236');
INSERT INTO `tp_express_shipping_items` VALUES ('11223', 'A7', '收件人地址', '1', '10', '261');
INSERT INTO `tp_express_shipping_items` VALUES ('11223', 'A8', '收件人姓名', '1', '10', '61');
INSERT INTO `tp_express_shipping_items` VALUES ('11223', 'A9', '收件人电话', '1', '10', '161');
INSERT INTO `tp_express_shipping_items` VALUES ('11224', 'A1', '订单编号', '1', '10', '11');
INSERT INTO `tp_express_shipping_items` VALUES ('11224', 'A10', '收件人邮编', '1', '10', '86');
INSERT INTO `tp_express_shipping_items` VALUES ('11224', 'A11', '货到付款物流编号', '1', '10', '286');
INSERT INTO `tp_express_shipping_items` VALUES ('11224', 'A12', '代收金额', '1', '10', '186');
INSERT INTO `tp_express_shipping_items` VALUES ('11224', 'A13', '备注', '1', '10', '311');
INSERT INTO `tp_express_shipping_items` VALUES ('11224', 'A2', '发件人公司', '1', '10', '36');
INSERT INTO `tp_express_shipping_items` VALUES ('11224', 'A3', '发件人地址', '1', '10', '136');
INSERT INTO `tp_express_shipping_items` VALUES ('11224', 'A4', '发件人姓名', '1', '10', '111');
INSERT INTO `tp_express_shipping_items` VALUES ('11224', 'A5', '发件人电话', '1', '10', '211');
INSERT INTO `tp_express_shipping_items` VALUES ('11224', 'A6', '发件人邮编', '1', '10', '236');
INSERT INTO `tp_express_shipping_items` VALUES ('11224', 'A7', '收件人地址', '1', '10', '261');
INSERT INTO `tp_express_shipping_items` VALUES ('11224', 'A8', '收件人姓名', '1', '10', '61');
INSERT INTO `tp_express_shipping_items` VALUES ('11224', 'A9', '收件人电话', '1', '10', '161');
INSERT INTO `tp_express_shipping_items` VALUES ('11225', 'A1', '订单编号', '1', '10', '11');
INSERT INTO `tp_express_shipping_items` VALUES ('11225', 'A10', '收件人邮编', '1', '10', '86');
INSERT INTO `tp_express_shipping_items` VALUES ('11225', 'A11', '货到付款物流编号', '1', '10', '286');
INSERT INTO `tp_express_shipping_items` VALUES ('11225', 'A12', '代收金额', '1', '10', '186');
INSERT INTO `tp_express_shipping_items` VALUES ('11225', 'A13', '备注', '1', '10', '311');
INSERT INTO `tp_express_shipping_items` VALUES ('11225', 'A2', '发件人公司', '1', '10', '36');
INSERT INTO `tp_express_shipping_items` VALUES ('11225', 'A3', '发件人地址', '1', '10', '136');
INSERT INTO `tp_express_shipping_items` VALUES ('11225', 'A4', '发件人姓名', '1', '10', '111');
INSERT INTO `tp_express_shipping_items` VALUES ('11225', 'A5', '发件人电话', '1', '10', '211');
INSERT INTO `tp_express_shipping_items` VALUES ('11225', 'A6', '发件人邮编', '1', '10', '236');
INSERT INTO `tp_express_shipping_items` VALUES ('11225', 'A7', '收件人地址', '1', '10', '261');
INSERT INTO `tp_express_shipping_items` VALUES ('11225', 'A8', '收件人姓名', '1', '10', '61');
INSERT INTO `tp_express_shipping_items` VALUES ('11225', 'A9', '收件人电话', '1', '10', '161');
INSERT INTO `tp_express_shipping_items` VALUES ('11226', 'A1', '订单编号', '1', '10', '11');
INSERT INTO `tp_express_shipping_items` VALUES ('11226', 'A10', '收件人邮编', '1', '10', '86');
INSERT INTO `tp_express_shipping_items` VALUES ('11226', 'A11', '货到付款物流编号', '1', '10', '286');
INSERT INTO `tp_express_shipping_items` VALUES ('11226', 'A12', '代收金额', '1', '10', '186');
INSERT INTO `tp_express_shipping_items` VALUES ('11226', 'A13', '备注', '1', '10', '311');
INSERT INTO `tp_express_shipping_items` VALUES ('11226', 'A2', '发件人公司', '1', '10', '36');
INSERT INTO `tp_express_shipping_items` VALUES ('11226', 'A3', '发件人地址', '1', '10', '136');
INSERT INTO `tp_express_shipping_items` VALUES ('11226', 'A4', '发件人姓名', '1', '10', '111');
INSERT INTO `tp_express_shipping_items` VALUES ('11226', 'A5', '发件人电话', '1', '10', '211');
INSERT INTO `tp_express_shipping_items` VALUES ('11226', 'A6', '发件人邮编', '1', '10', '236');
INSERT INTO `tp_express_shipping_items` VALUES ('11226', 'A7', '收件人地址', '1', '10', '261');
INSERT INTO `tp_express_shipping_items` VALUES ('11226', 'A8', '收件人姓名', '1', '10', '61');
INSERT INTO `tp_express_shipping_items` VALUES ('11226', 'A9', '收件人电话', '1', '10', '161');
INSERT INTO `tp_express_shipping_items` VALUES ('11227', 'A1', '订单编号', '1', '10', '11');
INSERT INTO `tp_express_shipping_items` VALUES ('11227', 'A10', '收件人邮编', '1', '10', '86');
INSERT INTO `tp_express_shipping_items` VALUES ('11227', 'A11', '货到付款物流编号', '1', '10', '286');
INSERT INTO `tp_express_shipping_items` VALUES ('11227', 'A12', '代收金额', '1', '10', '186');
INSERT INTO `tp_express_shipping_items` VALUES ('11227', 'A13', '备注', '1', '10', '311');
INSERT INTO `tp_express_shipping_items` VALUES ('11227', 'A2', '发件人公司', '1', '10', '36');
INSERT INTO `tp_express_shipping_items` VALUES ('11227', 'A3', '发件人地址', '1', '10', '136');
INSERT INTO `tp_express_shipping_items` VALUES ('11227', 'A4', '发件人姓名', '1', '10', '111');
INSERT INTO `tp_express_shipping_items` VALUES ('11227', 'A5', '发件人电话', '1', '10', '211');
INSERT INTO `tp_express_shipping_items` VALUES ('11227', 'A6', '发件人邮编', '1', '10', '236');
INSERT INTO `tp_express_shipping_items` VALUES ('11227', 'A7', '收件人地址', '1', '10', '261');
INSERT INTO `tp_express_shipping_items` VALUES ('11227', 'A8', '收件人姓名', '1', '10', '61');
INSERT INTO `tp_express_shipping_items` VALUES ('11227', 'A9', '收件人电话', '1', '10', '161');
INSERT INTO `tp_express_shipping_items` VALUES ('11228', 'A1', '订单编号', '1', '10', '11');
INSERT INTO `tp_express_shipping_items` VALUES ('11228', 'A10', '收件人邮编', '1', '10', '86');
INSERT INTO `tp_express_shipping_items` VALUES ('11228', 'A11', '货到付款物流编号', '1', '10', '286');
INSERT INTO `tp_express_shipping_items` VALUES ('11228', 'A12', '代收金额', '1', '10', '186');
INSERT INTO `tp_express_shipping_items` VALUES ('11228', 'A13', '备注', '1', '10', '311');
INSERT INTO `tp_express_shipping_items` VALUES ('11228', 'A2', '发件人公司', '1', '10', '36');
INSERT INTO `tp_express_shipping_items` VALUES ('11228', 'A3', '发件人地址', '1', '10', '136');
INSERT INTO `tp_express_shipping_items` VALUES ('11228', 'A4', '发件人姓名', '1', '10', '111');
INSERT INTO `tp_express_shipping_items` VALUES ('11228', 'A5', '发件人电话', '1', '10', '211');
INSERT INTO `tp_express_shipping_items` VALUES ('11228', 'A6', '发件人邮编', '1', '10', '236');
INSERT INTO `tp_express_shipping_items` VALUES ('11228', 'A7', '收件人地址', '1', '10', '261');
INSERT INTO `tp_express_shipping_items` VALUES ('11228', 'A8', '收件人姓名', '1', '10', '61');
INSERT INTO `tp_express_shipping_items` VALUES ('11228', 'A9', '收件人电话', '1', '10', '161');
INSERT INTO `tp_express_shipping_items` VALUES ('11231', 'A1', '订单编号', '1', '10', '11');
INSERT INTO `tp_express_shipping_items` VALUES ('11231', 'A10', '收件人邮编', '1', '10', '86');
INSERT INTO `tp_express_shipping_items` VALUES ('11231', 'A11', '货到付款物流编号', '1', '10', '286');
INSERT INTO `tp_express_shipping_items` VALUES ('11231', 'A12', '代收金额', '1', '10', '186');
INSERT INTO `tp_express_shipping_items` VALUES ('11231', 'A13', '备注', '1', '10', '311');
INSERT INTO `tp_express_shipping_items` VALUES ('11231', 'A2', '发件人公司', '1', '10', '36');
INSERT INTO `tp_express_shipping_items` VALUES ('11231', 'A3', '发件人地址', '1', '10', '136');
INSERT INTO `tp_express_shipping_items` VALUES ('11231', 'A4', '发件人姓名', '1', '10', '111');
INSERT INTO `tp_express_shipping_items` VALUES ('11231', 'A5', '发件人电话', '1', '10', '211');
INSERT INTO `tp_express_shipping_items` VALUES ('11231', 'A6', '发件人邮编', '1', '10', '236');
INSERT INTO `tp_express_shipping_items` VALUES ('11231', 'A7', '收件人地址', '1', '10', '261');
INSERT INTO `tp_express_shipping_items` VALUES ('11231', 'A8', '收件人姓名', '1', '10', '61');
INSERT INTO `tp_express_shipping_items` VALUES ('11231', 'A9', '收件人电话', '1', '10', '161');

-- ----------------------------
-- Table structure for tp_express_shipping_items_library
-- ----------------------------
DROP TABLE IF EXISTS `tp_express_shipping_items_library`;
CREATE TABLE `tp_express_shipping_items_library` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '物流模版打印项库ID',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `field_name` varchar(50) NOT NULL COMMENT '字段名',
  `field_display_name` varchar(50) NOT NULL COMMENT '字段显示名',
  `is_enabled` bit(1) NOT NULL DEFAULT b'1' COMMENT '是否启用',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1260 COMMENT='物流模版打印项库';

-- ----------------------------
-- Records of tp_express_shipping_items_library
-- ----------------------------
INSERT INTO `tp_express_shipping_items_library` VALUES ('1', '0', 'A1', '订单编号', '');
INSERT INTO `tp_express_shipping_items_library` VALUES ('2', '0', 'A2', '发件人公司', '');
INSERT INTO `tp_express_shipping_items_library` VALUES ('3', '0', 'A8', '收件人姓名', '');
INSERT INTO `tp_express_shipping_items_library` VALUES ('4', '0', 'A10', '收件人邮编', '');
INSERT INTO `tp_express_shipping_items_library` VALUES ('5', '0', 'A4', '发件人姓名', '');
INSERT INTO `tp_express_shipping_items_library` VALUES ('6', '0', 'A3', '发件人地址', '');
INSERT INTO `tp_express_shipping_items_library` VALUES ('7', '0', 'A9', '收件人电话', '');
INSERT INTO `tp_express_shipping_items_library` VALUES ('8', '0', 'A12', '代收金额', '');
INSERT INTO `tp_express_shipping_items_library` VALUES ('9', '0', 'A5', '发件人电话', '');
INSERT INTO `tp_express_shipping_items_library` VALUES ('10', '0', 'A6', '发件人邮编', '');
INSERT INTO `tp_express_shipping_items_library` VALUES ('11', '0', 'A7', '收件人地址', '');
INSERT INTO `tp_express_shipping_items_library` VALUES ('12', '0', 'A11', '货到付款物流编号', '');
INSERT INTO `tp_express_shipping_items_library` VALUES ('13', '0', 'A13', '备注', '');

-- ----------------------------
-- Table structure for tp_gift_grant_records
-- ----------------------------
DROP TABLE IF EXISTS `tp_gift_grant_records`;
CREATE TABLE `tp_gift_grant_records` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `gift_id` int(11) NOT NULL COMMENT '赠送活动ID',
  `goods_id` int(11) NOT NULL COMMENT '赠送商品ID',
  `goods_name` varchar(50) NOT NULL DEFAULT '' COMMENT '赠送商品名称',
  `goods_img` varchar(255) NOT NULL DEFAULT '' COMMENT '赠送商品图片',
  `num` int(11) NOT NULL DEFAULT '1' COMMENT '赠送数量',
  `type` int(11) NOT NULL DEFAULT '1' COMMENT '发放方式',
  `type_id` int(11) NOT NULL DEFAULT '0' COMMENT '发放相关ID',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '赠送时间',
  `memo` text NOT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='赠品发放记录';

-- ----------------------------
-- Records of tp_gift_grant_records
-- ----------------------------

-- ----------------------------
-- Table structure for tp_goods
-- ----------------------------
DROP TABLE IF EXISTS `tp_goods`;
CREATE TABLE `tp_goods` (
  `goods_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品id(SKU)',
  `goods_name` varchar(255) NOT NULL DEFAULT '' COMMENT '商品名称',
  `shop_id` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '店铺id',
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品分类id',
  `category_id_1` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '一级分类id',
  `category_id_2` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '二级分类id',
  `category_id_3` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '三级分类id',
  `brand_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '品牌id',
  `group_id_array` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺分类id 首尾用,隔开',
  `promotion_type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '促销类型 0无促销，1团购，2限时折扣',
  `promote_id` int(11) NOT NULL DEFAULT '0' COMMENT '促销活动ID',
  `goods_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '实物或虚拟商品标志 1实物商品 0 虚拟商品 2 F码商品',
  `market_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '市场价',
  `price` decimal(19,2) NOT NULL DEFAULT '0.00' COMMENT '商品原价格',
  `promotion_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品促销价格',
  `cost_price` decimal(19,2) NOT NULL DEFAULT '0.00' COMMENT '成本价',
  `point_exchange_type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '积分兑换类型 0 非积分兑换 1 只能积分兑换 ',
  `point_exchange` int(11) NOT NULL DEFAULT '0' COMMENT '积分兑换',
  `give_point` int(11) NOT NULL DEFAULT '0' COMMENT '购买商品赠送积分',
  `is_member_discount` int(1) NOT NULL DEFAULT '0' COMMENT '参与会员折扣',
  `shipping_fee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '运费 0为免运费',
  `shipping_fee_id` int(11) NOT NULL DEFAULT '0' COMMENT '售卖区域id 物流模板id  tp_order_shipping_fee 表id',
  `stock` int(10) NOT NULL DEFAULT '0' COMMENT '商品库存',
  `max_buy` int(11) NOT NULL DEFAULT '0' COMMENT '限购 0 不限购',
  `clicks` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品点击数量',
  `min_stock_alarm` int(11) NOT NULL DEFAULT '0' COMMENT '库存预警值',
  `sales` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '销售数量',
  `collects` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏数量',
  `star` tinyint(3) unsigned NOT NULL DEFAULT '5' COMMENT '好评星级',
  `evaluates` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评价数',
  `shares` int(11) NOT NULL DEFAULT '0' COMMENT '分享数',
  `province_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '一级地区id',
  `city_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '二级地区id',
  `picture` int(11) NOT NULL DEFAULT '0' COMMENT '商品主图',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '商品关键词',
  `introduction` varchar(255) NOT NULL DEFAULT '' COMMENT '商品简介，促销语',
  `description` text NOT NULL COMMENT '商品详情',
  `QRcode` varchar(255) NOT NULL DEFAULT '' COMMENT '商品二维码',
  `code` varchar(50) NOT NULL DEFAULT '' COMMENT '商家编号',
  `is_stock_visible` int(1) NOT NULL DEFAULT '0' COMMENT '页面不显示库存',
  `is_hot` int(1) NOT NULL DEFAULT '0' COMMENT '是否热销商品',
  `is_recommend` int(1) NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `is_new` int(1) NOT NULL DEFAULT '0' COMMENT '是否新品',
  `is_pre_sale` int(1) NOT NULL DEFAULT '0' COMMENT '是否预售',
  `is_bill` int(1) NOT NULL DEFAULT '0' COMMENT '是否开具增值税发票 1是，0否',
  `state` tinyint(3) NOT NULL DEFAULT '1' COMMENT '商品状态 0下架，1正常，10违规（禁售）',
  `sale_date` datetime NOT NULL COMMENT '上下架时间',
  `create_time` datetime NOT NULL COMMENT '商品添加时间',
  `update_time` datetime DEFAULT NULL COMMENT '商品编辑时间',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `img_id_array` varchar(1000) DEFAULT NULL COMMENT '商品图片序列',
  `sku_img_array` varchar(1000) DEFAULT NULL COMMENT '商品sku应用图片列表  属性,属性值，图片ID',
  `match_point` float(10,2) DEFAULT NULL COMMENT '实物与描述相符（根据评价计算）',
  `match_ratio` float(10,2) DEFAULT NULL COMMENT '实物与描述相符（根据评价计算）百分比',
  `real_sales` int(10) NOT NULL DEFAULT '0' COMMENT '实际销量',
  `goods_attribute_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品类型',
  `goods_spec_format` text NOT NULL COMMENT '商品规格',
  `goods_weight` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '商品重量',
  `goods_volume` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '商品体积',
  `shipping_fee_type` int(11) NOT NULL DEFAULT '1' COMMENT '计价方式1.重量2.体积3.计件',
  `extend_category_id` varchar(255) DEFAULT NULL,
  `extend_category_id_1` varchar(255) DEFAULT NULL,
  `extend_category_id_2` varchar(255) DEFAULT NULL,
  `extend_category_id_3` varchar(255) DEFAULT NULL,
  `supplier_id` int(11) NOT NULL DEFAULT '0' COMMENT '供货商id',
  PRIMARY KEY (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=392 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16554 COMMENT='商品表';

-- ----------------------------
-- Records of tp_goods
-- ----------------------------
INSERT INTO `tp_goods` VALUES ('383', '单鞋细高跟防水台鱼嘴女凉鞋2017春夏季新款复古刺绣高跟鞋40-42', '41', '312', '312', '0', '0', '0', '', '0', '0', '1', '0.00', '345.00', '345.00', '0.00', '0', '0', '0', '0', '0.00', '0', '999', '0', '0', '100', '1', '0', '0', '0', '0', '0', '0', '1844', '', '', '<ul class=\"attributes-list list-paddingleft-2\" style=\"list-style-type: none;\"><li><p>里料材质:&nbsp;超纤皮</p></li><li><p>鞋垫材质:&nbsp;超纤皮</p></li><li><p>品牌:&nbsp;嫚汐</p></li><li><p>货号:&nbsp;070771012470</p></li><li><p>上市年份季节:&nbsp;2017年夏季</p></li><li><p>风格:&nbsp;民族风</p></li><li><p>帮面材质:&nbsp;超细纤维</p></li><li><p>皮质特征:&nbsp;印花</p></li><li><p>鞋底材质:&nbsp;橡胶</p></li><li><p>鞋头款式:&nbsp;鱼嘴</p></li><li><p>后跟高:&nbsp;高跟(5-8cm)</p></li><li><p>跟底款式:&nbsp;细跟</p></li><li><p>鞋帮高度:&nbsp;低帮</p></li><li><p>流行元素:&nbsp;洞洞款</p></li><li><p>颜色分类:&nbsp;白色（普通版） 红色（普通版） 黑色（普通版） 白色（防滑耐磨底） 红色（防滑耐磨底） 黑色（防滑耐磨底）</p></li><li><p>尺码:&nbsp;32（定做不退换） 33（定做不退换） 40（定做不退换） 41（定做不退换） 42（定做不退换） 34 35 36 37 38 39</p></li><li><p>后帮:&nbsp;包跟</p></li><li><p>侧帮:&nbsp;满帮</p></li><li><p>闭合方式:&nbsp;套脚</p></li><li><p>图案:&nbsp;植物花卉</p></li><li><p>鞋制作工艺:&nbsp;胶粘鞋</p></li><li><p>适合场合:&nbsp;日常</p></li></ul><p><span style=\"line-height: 1.5; font-size: 18px;\"><strong>帮面材质: 超细纤维 内里材质: 超细纤维 皮质特征: 印花&nbsp;</strong></span></p><p>&nbsp;</p><p><span style=\"line-height: 1.5; font-size: 18px;\"><strong>鞋底材质: 防滑耐磨橡胶 开口深度:浅口 鞋头款式: 鱼嘴&nbsp;</strong></span></p><p>&nbsp;</p><p><span style=\"line-height: 1.5; font-size: 18px;\"><strong>跟形状: 粗跟 跟高:超高跟（大于8cm） 颜色分类: 黑色 红色 白色&nbsp;</strong></span></p><p>&nbsp;</p><p><span style=\"line-height: 1.5; font-size: 18px;\"><strong>闭合方式：套脚 制作工艺: 胶粘鞋 尺码: 32 33 34 35 36 37 38 39 40 41 42</strong></span><span style=\"line-height: 1.5; font-size: 18px;\"><strong>&nbsp; &nbsp; 大小码[订做不退换]</strong></span><span style=\"line-height: 1.5; font-size: 18px;\"></span></p><p><img src=\"https://img.alicdn.com/imgextra/i1/2638511401/TB2umgOAtFopuFjSZFHXXbSlXXa_!!2638511401.jpg\" style=\"border: 0px; vertical-align: middle;\"/></p><p><img src=\"https://img.alicdn.com/imgextra/i3/2638511401/TB24eNIwbVkpuFjSspcXXbSMVXa_!!2638511401.jpg\" style=\"border: 0px; vertical-align: middle;\"/></p><p><img src=\"https://img.alicdn.com/imgextra/i2/2638511401/TB2IsiIwmFjpuFjSszhXXaBuVXa_!!2638511401.jpg\" style=\"border: 0px; vertical-align: middle;\"/></p><p><img src=\"https://img.alicdn.com/imgextra/i2/2638511401/TB2.I.xv30kpuFjSspdXXX4YXXa_!!2638511401.jpg\" style=\"border: 0px; vertical-align: middle;\"/></p><p><img src=\"https://img.alicdn.com/imgextra/i1/2638511401/TB2kTEZAt0opuFjSZFxXXaDNVXa_!!2638511401.jpg\" class=\"\" width=\"750\" height=\"750\" style=\"border: 0px; vertical-align: middle;\"/></p><p><img src=\"https://img.alicdn.com/imgextra/i1/2638511401/TB2IgQLv3NlpuFjy0FfXXX3CpXa_!!2638511401.jpg\" class=\"\" width=\"750\" height=\"750\" style=\"border: 0px; vertical-align: middle;\"/></p><p><img src=\"https://img.alicdn.com/imgextra/i4/2638511401/TB27vclACVmpuFjSZFFXXcZApXa_!!2638511401.jpg\" class=\"\" width=\"750\" height=\"750\" style=\"border: 0px; vertical-align: middle;\"/></p><p><img src=\"https://img.alicdn.com/imgextra/i4/2638511401/TB2GwjTArBnpuFjSZFGXXX51pXa_!!2638511401.jpg\" class=\"\" width=\"750\" height=\"750\" style=\"border: 0px; vertical-align: middle;\"/></p><p><br/></p>', 'upload/goods_qrcode/goods_qrcode_3831540908117.png', '', '1', '0', '0', '0', '0', '0', '1', '2017-07-21 09:40:23', '2017-07-21 09:40:23', null, '0', '1844,1845,1846', '', null, null, '1', '32', '[]', '0.00', '0.00', '3', '', '', '', '', '0');
INSERT INTO `tp_goods` VALUES ('384', '【葡萄妈】studiolee 小方跟方扣单鞋4.5cm 附赠贴底', '41', '312', '312', '0', '0', '0', '', '0', '0', '1', '0.00', '269.00', '269.00', '0.00', '0', '0', '0', '0', '0.00', '0', '988', '0', '0', '100', '12', '0', '0', '0', '0', '0', '0', '1847', '', '', '<ul class=\"attributes-list list-paddingleft-2\" style=\"list-style-type: none;\"><li><p>品牌:&nbsp;Studiolee selection</p></li><li><p>上市年份季节:&nbsp;2017年夏季</p></li><li><p>帮面材质:&nbsp;漆皮</p></li><li><p>内里材质:&nbsp;羊皮</p></li><li><p>开口深度:&nbsp;浅口</p></li><li><p>鞋头款式:&nbsp;方头</p></li><li><p>后跟高:&nbsp;中跟(3-5cm)</p></li><li><p>跟底款式:&nbsp;方跟</p></li><li><p>颜色分类:&nbsp;黑色 预售约35天发 大象灰 预售约35天发 雾霾灰 预售约35天发 波尔多红 预售约35天发</p></li><li><p>尺码:&nbsp;33 34 35 36 37 38 39 40</p></li></ul><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i4/2089352068/TB2W5RxwCXlpuFjy0FeXXcJbFXa_!!2089352068.jpg\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i2/2089352068/TB2zBO1AAqvpuFjSZFhXXaOgXXa_!!2089352068.jpg\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i1/2089352068/TB2XlS1AAqvpuFjSZFhXXaOgXXa_!!2089352068.jpg\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i4/2089352068/TB2rGwyv84lpuFjy1zjXXcAKpXa_!!2089352068.jpg\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i2/2089352068/TB2WBF3AHBnpuFjSZFGXXX51pXa_!!2089352068.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"4687\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><br/><img src=\"https://img.alicdn.com/imgextra/i2/2089352068/TB29rfdAHlmpuFjSZFlXXbdQXXa_!!2089352068.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"5906\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/></p><p><br/></p>', 'upload/goods_qrcode/goods_qrcode_384.png', '', '1', '0', '0', '0', '0', '0', '1', '2017-07-21 09:42:00', '2017-07-21 09:42:00', null, '0', '1847,1848', '', null, null, '12', '32', '[]', '0.00', '0.00', '3', '', '', '', '', '0');
INSERT INTO `tp_goods` VALUES ('385', '春季包头中粗跟尖头浅口单鞋女夏2017新款百搭韩版侧空低跟单鞋子', '41', '312', '312', '0', '0', '0', '', '0', '0', '1', '0.00', '269.00', '269.00', '0.00', '0', '0', '0', '0', '0.00', '0', '999', '0', '0', '100', '1', '0', '0', '0', '0', '0', '0', '1849', '', '', '<ul class=\"attributes-list list-paddingleft-2\" style=\"list-style-type: none;\"><li><p>鞋垫材质:&nbsp;PU</p></li><li><p>品牌:&nbsp;other/其他</p></li><li><p>货号:&nbsp;新款推</p></li><li><p>上市年份季节:&nbsp;2017年夏季</p></li><li><p>风格:&nbsp;韩版</p></li><li><p>帮面材质:&nbsp;PU</p></li><li><p>内里材质:&nbsp;PU</p></li><li><p>皮质特征:&nbsp;修面</p></li><li><p>鞋底材质:&nbsp;橡胶</p></li><li><p>开口深度:&nbsp;浅口</p></li><li><p>鞋头款式:&nbsp;尖头</p></li><li><p>后跟高:&nbsp;低跟(1-3cm)</p></li><li><p>跟底款式:&nbsp;粗跟</p></li><li><p>流行元素:&nbsp;浅口 粗跟 罗马风格</p></li><li><p>闭合方式:&nbsp;一字式扣带</p></li><li><p>颜色分类:&nbsp;杏色 驼色</p></li><li><p>尺码:&nbsp;34 35 36 37 38 39</p></li><li><p>鞋制作工艺:&nbsp;胶粘鞋</p></li><li><p>图案:&nbsp;纯色</p></li></ul><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\"><img src=\"https://img.alicdn.com/imgextra/i2/1604535035/TB2R26XXk7OyuJjSspbXXXZuXXa_!!1604535035.jpg\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\"><img src=\"https://img.alicdn.com/imgextra/i4/1604535035/TB2mJuUwxlmpuFjSZPfXXc9iXXa_!!1604535035.jpg\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\"><img src=\"https://img.alicdn.com/imgextra/i4/1604535035/TB2imRslH_0UKFjy1XaXXbKfXXa_!!1604535035.jpg\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i3/1604535035/TB2dFF1gZPRfKJjSZFOXXbKEVXa_!!1604535035.jpg\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i2/1604535035/TB2k12QAtRopuFjSZFtXXcanpXa_!!1604535035.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"989\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i1/1604535035/TB2SmaWAAqvpuFjSZFhXXaOgXXa_!!1604535035.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"1254\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i1/1604535035/TB2VLGkuthvOuFjSZFBXXcZgFXa_!!1604535035.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"1000\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i3/1604535035/TB2N3ayArBnpuFjSZFGXXX51pXa_!!1604535035.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"1014\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/></p><p><br/></p>', 'upload/goods_qrcode/goods_qrcode_385.png', '', '1', '0', '0', '0', '0', '0', '1', '2017-07-21 09:43:19', '2017-07-21 09:43:19', null, '0', '1849,1850', '', null, null, '1', '32', '[]', '0.00', '0.00', '3', '', '', '', '', '0');
INSERT INTO `tp_goods` VALUES ('386', 'GREFU/格莱富C141超薄笔记本电脑四核14.1寸游戏办公上网本WIFI', '1', '315', '315', '0', '0', '0', '', '0', '0', '1', '0.00', '5999.00', '5999.00', '0.00', '0', '0', '0', '0', '0.00', '0', '1000', '0', '0', '100', '0', '0', '0', '0', '0', '0', '0', '1851', '', '', '<ul class=\"attributes-list list-paddingleft-2\" style=\"list-style-type: none;\"><li><p>CC证书编号:&nbsp;<a href=\"https://baike.taobao.com/view.htm?wd=2016010902868746&ac=29\" target=\"blank\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\">2016010902868746</a></p></li><li><p>厚度:&nbsp;10.0mm以下</p></li><li><p>屏幕类型:&nbsp;宽屏</p></li><li><p>是否PC平板二合一:&nbsp;否</p></li><li><p>机身重量（含电池）:&nbsp;1.38kg</p></li><li><p>版本类型:&nbsp;中国大陆</p></li><li><p>能效等级:&nbsp;一级</p></li><li><p>品牌:&nbsp;GREFU/格莱富</p></li><li><p>屏幕尺寸:&nbsp;14.1英寸</p></li><li><p>屏幕比例:&nbsp;16:9</p></li><li><p>CPU:&nbsp;英特尔 凌动 x5-Z8350</p></li><li><p>显卡类型:&nbsp;英特尔 HD Graphics (Bay Trail)</p></li><li><p>显存容量:&nbsp;共享内存容量</p></li><li><p>机械硬盘容量:&nbsp;无机械硬盘</p></li><li><p>固态硬盘:&nbsp;64G eMMC</p></li><li><p>内存容量:&nbsp;4G</p></li><li><p>光驱类型:&nbsp;无光驱</p></li><li><p>适用场景:&nbsp;移动工作站 家庭影音 女性定位 轻薄便携 学生 商务办公 高清游戏 尊贵旗舰 家庭娱乐</p></li><li><p>重量:&nbsp;1kg(含)-1.5kg(不含)</p></li><li><p>售后服务:&nbsp;店铺三包</p></li><li><p>颜色分类:&nbsp;羽毛白（2G+32G） 羽毛白（4G+64G）</p></li><li><p>上市时间:&nbsp;2016年8月</p></li><li><p>操作系统:&nbsp;windows 10</p></li><li><p>通信技术类型:&nbsp;无线网卡 蓝牙</p></li><li><p>输入设备:&nbsp;触摸板</p></li><li><p>套餐类型:&nbsp;官方标配</p></li><li><p>是否超极本:&nbsp;是</p></li><li><p>分辨率:&nbsp;1366x768</p></li><li><p>是否触摸屏:&nbsp;非触摸屏</p></li></ul><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i2/2921467918/TB23jN0tXXXXXbUXpXXXXXXXXXX_!!2921467918.jpg\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i1/2921467918/TB2YmIWiwRkpuFjy1zeXXc.6FXa_!!2921467918.jpg\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i3/2921467918/TB2qACUmq8lpuFjy0FpXXaGrpXa_!!2921467918.jpg\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i3/2921467918/TB2A6Wbmr0kpuFjy0FjXXcBbVXa_!!2921467918.jpg\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i3/2921467918/TB2362amCJjpuFjy0FdXXXmoFXa_!!2921467918.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"663\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i2/2921467918/TB2J3yhmxXkpuFjy0FiXXbUfFXa_!!2921467918.jpg_q90.jpg\" class=\"\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i3/2921467918/TB2_lGImB0kpuFjSsppXXcGTXXa_!!2921467918.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"1071\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i2/2921467918/TB24xl4mwNlpuFjy0FfXXX3CpXa_!!2921467918.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"874\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i2/2921467918/TB24KCwmwxlpuFjSszbXXcSVpXa_!!2921467918.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"1032\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/></p><p><br/></p>', 'upload/goods_qrcode/goods_qrcode_386.png', '', '1', '0', '0', '0', '0', '0', '1', '2017-07-21 09:45:22', '2017-07-21 09:45:22', null, '0', '1851,1852', '', null, null, '0', '0', '[]', '0.00', '0.00', '3', '', '', '', '', '0');
INSERT INTO `tp_goods` VALUES ('387', 'T-bao/天宝 R8 四核固态超极本超薄笔记本电脑15.6英寸分期包邮', '1', '315', '315', '0', '0', '0', '', '0', '0', '1', '0.00', '4999.00', '4999.00', '0.00', '0', '0', '0', '0', '0.00', '0', '11000', '0', '0', '100', '0', '0', '0', '0', '0', '0', '0', '1853', '', '', '<ul class=\"attributes-list list-paddingleft-2\" style=\"list-style-type: none;\"><li><p>CCC证书编号:&nbsp;<a href=\"https://baike.taobao.com/view.htm?wd=2017010902945753&ac=29\" target=\"blank\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\">2017010902945753</a></p></li><li><p>厚度:&nbsp;10.0mm以下</p></li><li><p>机身重量（含电池）:&nbsp;1.87kg</p></li><li><p>版本类型:&nbsp;中国大陆</p></li><li><p>品牌:&nbsp;T-bao</p></li><li><p>屏幕尺寸:&nbsp;15.6英寸</p></li><li><p>屏幕比例:&nbsp;16:9</p></li><li><p>CPU:&nbsp;英特尔 凌动 x5-Z8350</p></li><li><p>显卡类型:&nbsp;英特尔 HD Graphics (Braswell)</p></li><li><p>显存容量:&nbsp;共享系统内存</p></li><li><p>机械硬盘容量:&nbsp;无机械硬盘</p></li><li><p>固态硬盘:&nbsp;64g</p></li><li><p>内存容量:&nbsp;4G</p></li><li><p>适用场景:&nbsp;移动工作站 家庭影音 女性定位 轻薄便携 学生 商务办公 高清游戏 家庭娱乐</p></li><li><p>售后服务:&nbsp;店铺三包</p></li><li><p>颜色分类:&nbsp;皓月白 宝蓝色</p></li><li><p>上市时间:&nbsp;2016年8月份</p></li><li><p>操作系统:&nbsp;windows 10</p></li><li><p>通信技术类型:&nbsp;无线网卡 蓝牙</p></li><li><p>套餐类型:&nbsp;官方标配</p></li><li><p>是否超极本:&nbsp;是</p></li><li><p>分辨率:&nbsp;1920x1080</p></li><li><p>是否触摸屏:&nbsp;非触摸屏</p></li></ul><table width=\"750\" height=\"370\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" background=\"https://img.alicdn.com/imgextra/i2/95723640/TB2yTc4ppXXXXcyXXXXXXXXXXXX-95723640.jpg\"><tbody><tr class=\"firstRow\"><td height=\"23\" colspan=\"5\" style=\"margin: 0px; padding: 0px;\"><br/></td></tr><tr><td width=\"14\" height=\"320\" style=\"margin: 0px; padding: 0px;\"><br/></td><td width=\"280\" valign=\"top\" style=\"margin: 0px; padding: 0px;\"><br/></td><td width=\"399\" valign=\"top\" style=\"margin: 0px; padding: 0px;\">&nbsp;&nbsp;T-bao/天宝 Tbook 4 超薄14英…&nbsp;1599.00&nbsp;￥2000.008.0￥401.00&nbsp;1624&nbsp;&nbsp;</td><td width=\"17\" style=\"margin: 0px; padding: 0px;\"><br/></td><td width=\"17\" style=\"margin: 0px; padding: 0px;\"><br/></td></tr></tbody></table><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i2/888785548/TB2dmK6X3ojyKJjy0FaXXakspXa_!!888785548.jpg\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i3/888785548/TB2M8YjcbtlpuFjSspoXXbcDpXa_!!888785548.jpg\" class=\"\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i3/888785548/TB2RDCpawhJc1FjSZFDXXbvnFXa_!!888785548.jpg\" class=\"\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i4/888785548/TB2KSNdBC0mpuFjSZPiXXbssVXa_!!888785548.jpg\" class=\"\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i3/888785548/TB28L0ycmiK.eBjSZFsXXbxZpXa_!!888785548.jpg\" class=\"\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i2/888785548/TB23sNwcX5N.eBjSZFKXXX_QVXa_!!888785548.jpg\" class=\"\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i2/888785548/TB2ePxvcXOP.eBjSZFHXXXQnpXa_!!888785548.jpg\" class=\"\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i3/888785548/TB2nGJCcfSM.eBjSZFNXXbgYpXa_!!888785548.jpg\" class=\"\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/></p><p><br/></p>', 'upload/goods_qrcode/goods_qrcode_387.png', '', '1', '0', '0', '0', '0', '0', '1', '2017-07-21 09:46:30', '2017-07-21 09:46:30', null, '0', '1853,1854', '', null, null, '0', '0', '[]', '0.00', '0.00', '3', '', '', '', '', '0');
INSERT INTO `tp_goods` VALUES ('388', '神舟战神 T6-S5D1独显4G四核i5高清15.6英寸游戏本笔记本电脑正品', '1', '315', '315', '0', '0', '0', '', '0', '0', '1', '0.00', '4700.00', '4700.00', '0.00', '0', '0', '0', '0', '0.00', '0', '999', '0', '0', '100', '1', '0', '0', '0', '0', '0', '0', '1855', '', '', '<ul class=\"attributes-list list-paddingleft-2\" style=\"list-style-type: none;\"><li><p>CCC证书编号:&nbsp;<a href=\"https://baike.taobao.com/view.htm?wd=2014010902694496&ac=29\" target=\"blank\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\">2014010902694496</a></p></li><li><p>屏幕类型:&nbsp;FHD IPS LED背光显示屏</p></li><li><p>是否PC平板二合一:&nbsp;否</p></li><li><p>机身重量（含电池）:&nbsp;2.89kg</p></li><li><p>版本类型:&nbsp;中国大陆</p></li><li><p>能效等级:&nbsp;一级</p></li><li><p>品牌:&nbsp;Hasee/神舟</p></li><li><p>神舟系列型号:&nbsp;战神系列</p></li><li><p>型号:&nbsp;K650C-i7 D3</p></li><li><p>屏幕尺寸:&nbsp;15.6英寸</p></li><li><p>屏幕比例:&nbsp;16:9</p></li><li><p>CPU:&nbsp;英特尔 酷睿 i5-6440HQ</p></li><li><p>显卡类型:&nbsp;NVIDIA GeForce GTX960M</p></li><li><p>显存容量:&nbsp;4G</p></li><li><p>机械硬盘容量:&nbsp;1TB</p></li><li><p>固态硬盘:&nbsp;可定制</p></li><li><p>内存容量:&nbsp;8GB</p></li><li><p>光驱类型:&nbsp;无光驱</p></li><li><p>适用场景:&nbsp;家庭影音 轻薄便携 学生 商务办公 高清游戏 家庭娱乐</p></li><li><p>售后服务:&nbsp;全国联保</p></li><li><p>颜色分类:&nbsp;T6-S5D1（i5-6400） T6-S5D1（标配+128G固态）</p></li><li><p>上市时间:&nbsp;2016</p></li><li><p>操作系统:&nbsp;windows 10</p></li><li><p>通信技术类型:&nbsp;无线网卡</p></li><li><p>输入设备:&nbsp;触摸板</p></li><li><p>套餐类型:&nbsp;官方标配</p></li><li><p>是否超极本:&nbsp;否</p></li><li><p>分辨率:&nbsp;1920x1080</p></li><li><p>是否触摸屏:&nbsp;非触摸屏</p></li></ul><p><img src=\"https://img.alicdn.com/imgextra/i4/3002862063/TB2RZzcltBopuFjSZPcXXc9EpXa_!!3002862063.jpg\" alt=\"\" width=\"750\" height=\"999\" usemap=\"#dfdfdsfafewrewfsfwerf\" border=\"0\" style=\"border: 0px; vertical-align: middle;\"/><map name=\"dfdfdsfafewrewfsfwerf\"><area shape=\"rect\" coords=\"3,4,746,364\" href=\"https://item.taobao.com/item.htm?spm=a1z10.3-c-s.w4002-15787669131.181.bHC3pq&id=539829424991\"/><area shape=\"rect\" coords=\"9,379,231,642\" href=\"https://item.taobao.com/item.htm?spm=a1z10.3-c-s.w4002-15787669131.31.bHC3pq&id=545808502537\"/><area shape=\"rect\" coords=\"261,379,490,647\" href=\"https://item.taobao.com/item.htm?spm=a1z10.3-c-s.w4002-15787669131.81.bHC3pq&id=545173657668\"/><area shape=\"rect\" coords=\"516,379,735,641\" href=\"https://item.taobao.com/item.htm?spm=a1z10.3-c-s.w4002-15787669131.131.bHC3pq&id=547098338689\"/><area shape=\"rect\" coords=\"7,692,233,962\" href=\"https://item.taobao.com/item.htm?spm=a1z10.3-c-s.w4002-15787669131.231.bHC3pq&id=544912916925\"/><area shape=\"rect\" coords=\"260,692,489,962\" href=\"https://item.taobao.com/item.htm?spm=a1z10.3-c-s.w4002-15787669131.331.bHC3pq&id=546334390499\"/><area shape=\"rect\" coords=\"515,691,744,967\" href=\"https://item.taobao.com/item.htm?spm=a1z10.3-c-s.w4002-15787669131.581.bHC3pq&id=547184703839\"/></map></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><a href=\"https://item.taobao.com/item.htm?spm=a1z10.3-c.w4002-15204577568.359.RZzV61&id=541748021033\" target=\"_blank\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i4/3002862063/TB2Gi2ybxtmpuFjSZFqXXbHFpXa_!!3002862063.jpg\" style=\"border: 0px; vertical-align: top;\"/></a><br/><a href=\"https://item.taobao.com/item.htm?spm=a1z10.3-c.w4002-15204577568.124.RZzV61&id=541736004575\" target=\"_blank\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i3/3002862063/TB27gnLbxlmpuFjSZPfXXc9iXXa_!!3002862063.jpg\" style=\"border: 0px; vertical-align: top;\"/></a><br/><a href=\"https://item.taobao.com/item.htm?spm=a1z10.3-c.w4002-15204577568.218.RZzV61&id=539743901628\" target=\"_blank\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i3/3002862063/TB2hpHJbtXnpuFjSZFoXXXLcpXa_!!3002862063.jpg\" style=\"border: 0px; vertical-align: top;\"/></a></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i1/3002862063/TB2c5OVexaK.eBjSZFwXXXjsFXa_!!3002862063.gif\" class=\"\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i2/3002862063/TB29ai3esCO.eBjSZFzXXaRiVXa_!!3002862063.jpg\" class=\"\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i3/3002862063/TB2NxL9XZoa61BjSspdXXajFVXa_!!3002862063.jpg\" class=\"\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i2/3002862063/TB2n_uTcKtTMeFjSZFOXXaTiVXa_!!3002862063.jpg\" class=\"\" alt=\" 未标题-2.jpg\" width=\"750\" height=\"300\" style=\"border: 0px; vertical-align: top;\"/></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><span style=\"font-size: 36px;\"><span style=\"font-family: &#39;microsoft yahei&#39;;\"><strong>神舟战神T6-S5D1参数配置（官方标配）：</strong></span></span></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><span style=\"font-size: 24px;\"><span style=\"font-family: &#39;microsoft yahei&#39;;\"><strong>cpu：酷睿i5-6400（桌面级处理器，主频2.7GHZ，动态加速&nbsp;&nbsp;&nbsp;&nbsp;</strong></span></span></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><span style=\"font-size: 24px;\"><span style=\"font-family: &#39;microsoft yahei&#39;;\"><strong>3.3GHz，14nm工艺，6M缓存），</strong></span></span></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><span style=\"font-size: 24px;\"><span style=\"font-family: &#39;microsoft yahei&#39;;\"><strong>显卡：英伟达GTX960M 4G GDDR5 玩家级独显，</strong></span></span></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><span style=\"font-size: 24px;\"><span style=\"font-family: &#39;microsoft yahei&#39;;\"><strong>硬盘：1TB机械硬盘（需要加固态联系店家），</strong></span></span></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><span style=\"font-size: 24px;\"><span style=\"font-family: &#39;microsoft yahei&#39;;\"><strong>内存：8G DDR4 内存，</strong></span></span></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><span style=\"font-size: 24px;\"><span style=\"font-family: &#39;microsoft yahei&#39;;\"><strong>屏幕：15.6英寸1920*1080全高清屏幕。</strong></span></span></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><span style=\"font-size: 24px;\"><span style=\"font-family: &#39;microsoft yahei&#39;;\"><strong>全新未拆封，行货正品，山东总代理货源全国联保！</strong></span></span></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\">--------------------------------------------------------------------------------------------------------------------------------------------------------</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><span style=\"font-size: 36px;\"><span style=\"font-family: &#39;microsoft yahei&#39;;\"><strong>神舟战神T6-S5D1参数配置（荣耀版）：</strong></span></span></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><span style=\"font-size: 24px;\"><span style=\"font-family: &#39;microsoft yahei&#39;;\"><strong>cpu：酷睿i5-6400（桌面级处理器，主频2.7GHZ，动态加速&nbsp;&nbsp;&nbsp;&nbsp;</strong></span></span></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><span style=\"font-size: 24px;\"><span style=\"font-family: &#39;microsoft yahei&#39;;\"><strong>3.3GHz，14nm工艺，6M缓存），</strong></span></span></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><span style=\"font-size: 24px;\"><span style=\"font-family: &#39;microsoft yahei&#39;;\"><strong>显卡：英伟达GTX960M 4G GDDR5 玩家级独显，</strong></span></span></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><span style=\"font-size: 24px;\"><span style=\"font-family: &#39;microsoft yahei&#39;;\"><strong>硬盘：120G固态硬盘+500G机械硬盘，</strong></span></span></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><span style=\"font-size: 24px;\"><span style=\"font-family: &#39;microsoft yahei&#39;;\"><strong>内存：8G DDR4 内存，</strong></span></span></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><span style=\"font-size: 24px;\"><span style=\"font-family: &#39;microsoft yahei&#39;;\"><strong>屏幕：15.6英寸1920*1080全高清屏幕。</strong></span></span></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><span style=\"font-size: 24px;\"><span style=\"font-family: &#39;microsoft yahei&#39;;\"><strong>全新未拆封，行货正品，山东总代理货源全国联保！</strong></span></span></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i3/3002862063/TB2oPvDXnAX61Bjy0FcXXaSlFXa_!!3002862063.jpg\" class=\"\" align=\"absmiddle\" width=\"748\" height=\"828\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i1/3002862063/TB2oI_CXhQa61Bjy0FhXXaalFXa_!!3002862063.jpg\" class=\"\" align=\"absmiddle\" width=\"748\" height=\"631\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i4/3002862063/TB2_wGXbbFlpuFjy0FgXXbRBVXa_!!3002862063.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"733\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/></p><p><br/></p>', 'upload/goods_qrcode/goods_qrcode_388.png', '', '1', '0', '0', '0', '0', '0', '1', '2017-07-21 09:47:50', '2017-07-21 09:47:50', null, '0', '1855,1856', '', null, null, '1', '0', '[]', '0.00', '0.00', '3', '', '', '', '', '0');
INSERT INTO `tp_goods` VALUES ('389', '小熊养生壶全自动加厚玻璃 多功能煮花茶壶正品官方煮茶器 养生杯', '42', '319', '317', '318', '319', '0', '', '0', '0', '1', '0.00', '288.00', '288.00', '0.00', '0', '0', '0', '0', '0.00', '0', '1000', '0', '0', '100', '0', '0', '0', '0', '0', '0', '0', '1857', '', '', '<p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; line-height: 21px; white-space: normal; background-color: rgb(255, 255, 255);\"><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/2730531117/TB2FAElkrJmpuFjSZFwXXaE4VXa_!!2730531117.jpg\" style=\"border: 0px; vertical-align: top; float: none; margin: 0px;\"/><img usemap=\"#Map1\" src=\"https://img.alicdn.com/imgextra/i4/2730531117/TB2qOQDabBnpuFjSZFGXXX51pXa_!!2730531117.jpg\" style=\"border: 0px; vertical-align: top;\"/></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; line-height: 21px; white-space: normal; background-color: rgb(255, 255, 255);\"><img usemap=\"#Map2\" border=\"0\" src=\"https://img.alicdn.com/imgextra/i1/2730531117/TB2ra0IamBjpuFjSsplXXa5MVXa_!!2730531117.jpg\" style=\"border: 0px; vertical-align: top;\"/><map name=\"Map2\"><area shape=\"rect\" coords=\"12,647,375,872\" href=\"https://item.taobao.com/item.htm?spm=a1z10.1-c-s.w5003-15435154225.16.5UCzVd&id=538326187717&scene=taobao_shop\"/><area shape=\"rect\" coords=\"377,647,737,873\" href=\"https://item.taobao.com/item.htm?spm=a1z10.1-c-s.w5003-15435154225.17.5UCzVd&id=532016426337&scene=taobao_shop\"/><area shape=\"rect\" coords=\"12,873,372,1105\" href=\"https://item.taobao.com/item.htm?spm=a1z10.1-c-s.w5003-15435154225.18.5UCzVd&id=539014743268&scene=taobao_shop\"/><area shape=\"rect\" coords=\"377,875,739,1106\" href=\"https://item.taobao.com/item.htm?spm=a1z10.1-c-s.w5003-15435154225.27.5UCzVd&id=525271350941&scene=taobao_shop\"/></map></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; line-height: 21px; white-space: normal; background-color: rgb(255, 255, 255);\"><img usemap=\"#Map3\" border=\"0\" src=\"https://img.alicdn.com/imgextra/i2/2730531117/TB2ChYHmYBmpuFjSZFAXXaQ0pXa_!!2730531117.jpg\" style=\"border: 0px; vertical-align: top;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/2730531117/TB2ZHLXxypnpuFjSZFIXXXh2VXa_!!2730531117.jpg\" class=\"\" width=\"750\" height=\"684\" style=\"border: 0px; vertical-align: top;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/2730531117/TB2dDrdxylnpuFjSZFgXXbi7FXa_!!2730531117.jpg\" class=\"\" width=\"750\" height=\"703\" style=\"border: 0px; vertical-align: top;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/2730531117/TB2pYPhxEhnpuFjSZFEXXX0PFXa_!!2730531117.jpg\" class=\"\" width=\"750\" height=\"1080\" style=\"border: 0px; vertical-align: top;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/2730531117/TB2tRrscRU4h1JjSZFLXXaFMpXa_!!2730531117.jpg\" class=\"\" width=\"750\" height=\"1037\" style=\"border: 0px; vertical-align: top;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/2730531117/TB2fn6dxylnpuFjSZFgXXbi7FXa_!!2730531117.jpg\" class=\"\" width=\"750\" height=\"760\" style=\"border: 0px; vertical-align: top;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/2730531117/TB27voHtChlpuFjSspkXXa1ApXa_!!2730531117.jpg\" class=\"\" width=\"750\" height=\"651\" style=\"border: 0px; vertical-align: top;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/2730531117/TB28p0OtR8lpuFjSspaXXXJKpXa_!!2730531117.jpg\" class=\"\" width=\"750\" height=\"611\" style=\"border: 0px; vertical-align: top;\"/></p><p><br/></p>', 'upload/goods_qrcode/goods_qrcode_389.png', '', '1', '0', '0', '0', '0', '0', '1', '2017-07-21 09:50:05', '2017-07-21 09:50:05', null, '0', '1857,1858', '', null, null, '0', '0', '[]', '0.00', '0.00', '3', '', '', '', '', '0');
INSERT INTO `tp_goods` VALUES ('390', '飞利浦空气炸锅HD9233家用智能无油多功能电炸锅大容量HD9627正品', '42', '319', '317', '318', '319', '0', '', '0', '0', '1', '0.00', '266.00', '266.00', '0.00', '0', '0', '0', '0', '0.00', '0', '1000', '0', '0', '100', '0', '0', '0', '0', '0', '0', '0', '1859', '', '', '<ul class=\"attributes-list list-paddingleft-2\" style=\"list-style-type: none;\"><li><p>CCC证书编号:&nbsp;<a href=\"https://baike.taobao.com/view.htm?wd=2013010712631704&ac=29\" target=\"blank\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\">2013010712631704</a></p></li><li><p>产品名称:&nbsp;Philips/飞利浦 HD9233</p></li><li><p>品牌:&nbsp;Philips/飞利浦</p></li><li><p>型号:&nbsp;HD9233</p></li><li><p>采购地:&nbsp;中国大陆</p></li><li><p>颜色分类:&nbsp;HD9233白色</p></li><li><p>电炸锅类型:&nbsp;空气炸锅</p></li></ul><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i4/55859635/TB2TrPWA5pnpuFjSZFIXXXh2VXa_!!55859635.jpg\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i3/55859635/TB2ox0vXVgkyKJjSspoXXcOPpXa_!!55859635.jpg\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top;\"/><img src=\"https://img.alicdn.com/imgextra/i3/55859635/TB2ONuvugNlpuFjy0FfXXX3CpXa_!!55859635.jpg\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i4/55859635/TB2RO5Uul0kpuFjSsziXXa.oVXa_!!55859635.jpg\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i1/55859635/TB2B8bjugRkpuFjy1zeXXc.6FXa_!!55859635.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"688\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i2/55859635/TB2ks6AueJ8puFjy1XbXXagqVXa_!!55859635.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"1038\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i4/55859635/TB2Xua_ubFlpuFjy0FgXXbRBVXa_!!55859635.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"786\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i1/55859635/TB2HNeQXHXlpuFjy1zbXXb_qpXa_!!55859635.jpg\" class=\"\" alt=\" HD9233优化11_19.jpg\" width=\"750\" height=\"939\" style=\"border: 0px; vertical-align: top;\"/><img src=\"https://img.alicdn.com/imgextra/i3/55859635/TB2DZnVub8kpuFjy0FcXXaUhpXa_!!55859635.png\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"552\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i3/55859635/TB2_63OugxlpuFjy0FoXXa.lXXa_!!55859635.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"1288\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i1/55859635/TB2fv5Pul0lpuFjSszdXXcdxFXa_!!55859635.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"1010\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i3/55859635/TB21NGvugNlpuFjy0FfXXX3CpXa_!!55859635.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"981\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i2/55859635/TB27VOSubtlpuFjSspfXXXLUpXa_!!55859635.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"815\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i3/55859635/TB2TwgGmr_0UKFjy1XaXXbKfXXa_!!55859635.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"1359\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/></p><p><br/></p>', 'upload/goods_qrcode/goods_qrcode_390.png', '', '1', '0', '0', '0', '0', '0', '1', '2017-07-21 09:51:09', '2017-07-21 09:51:09', null, '0', '1859,1860', '', null, null, '0', '0', '[]', '0.00', '0.00', '3', '', '', '', '', '0');
INSERT INTO `tp_goods` VALUES ('391', '德国brita碧然德即热净水吧家用厨房自来水过滤壶电热直饮净水器', '42', '319', '317', '318', '319', '0', '', '0', '0', '1', '0.00', '199.00', '199.00', '0.00', '0', '0', '0', '0', '0.00', '0', '2000', '0', '0', '100', '0', '0', '0', '0', '0', '0', '0', '1861', '', '', '<ul class=\"attributes-list list-paddingleft-2\" style=\"list-style-type: none;\"><li><p>产品名称:&nbsp;BRITA/碧然德 即热净水吧</p></li><li><p>净水器品牌:&nbsp;BRITA/碧然德</p></li><li><p>型号:&nbsp;即热净水吧</p></li><li><p>分类:&nbsp;净水壶 过滤水壶 净水杯 净水设备</p></li><li><p>智能类型:&nbsp;阿里小智</p></li><li><p>货号:&nbsp;BRD0032</p></li><li><p>颜色分类:&nbsp;即热净水吧（一机一芯）顺丰包邮 即热净水吧（一机一芯）圆通包邮</p></li><li><p>额定出水量:&nbsp;60L/h</p></li><li><p>工作原理:&nbsp;活性炭</p></li><li><p>滤芯:&nbsp;活性炭+超滤</p></li><li><p>使用位置:&nbsp;终端净水</p></li><li><p>功效:&nbsp;直饮</p></li></ul><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\"><span style=\"font-size: 18px;\"><span style=\"color: rgb(255, 0, 0);\"></span></span></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><span style=\"font-size: 24px;\">（可开正规机打发票，开票需联系客服，或订单留言发票抬头和税号）</span></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\"><span style=\"font-size: 18px; line-height: 1.5;\">&nbsp; &nbsp; &nbsp; &nbsp;备注：没有联系客服和未留言发票抬头默认不开票哦</span></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\"><strong><strong style=\"line-height: 1.5; color: rgb(0, 0, 255);\"><span style=\"font-size: 24px;\">净水吧凭发票和质保卡可享受碧然德官方一年免费质保</span></strong></strong></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i3/753957799/TB24pq3ct4opuFjSZFLXXX8mXXa-753957799.jpg\" alt=\" 750-500.jpg\" style=\"border: 0px; vertical-align: top;\"/></p><p><a href=\"https://item.taobao.com/item.htm?spm=a1z10.5-c-s.w4002-14464934839.27.qusgMV&id=543745667439\" target=\"_blank\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i2/753957799/TB2LhIRgR0lpuFjSszdXXcdxFXa-753957799.jpg\" align=\"absmiddle\" style=\"border: 0px; vertical-align: middle;\"/></a><a href=\"https://item.taobao.com/item.htm?spm=a1z10.5-c-s.w4002-14464934839.39.qusgMV&id=543730750070\" target=\"_blank\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i3/753957799/TB2MimKidFopuFjSZFHXXbSlXXa-753957799.jpg\" align=\"absmiddle\" style=\"border: 0px; vertical-align: middle;\"/></a><a href=\"https://item.taobao.com/item.htm?spm=2013.1.w5001-14464934798.2.n07e26&id=528384353675&scene=taobao_shop\" target=\"_blank\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i1/753957799/TB2Aqe7ib4npuFjSZFmXXXl4FXa-753957799.jpg\" align=\"absmiddle\" style=\"border: 0px; vertical-align: middle;\"/><img src=\"https://img.alicdn.com/imgextra/i4/753957799/TB2c.oaxblmpuFjSZFlXXbdQXXa_!!753957799.jpg\" class=\"\" align=\"absmiddle\" width=\"375\" height=\"328\" style=\"border: 0px; vertical-align: middle;\"/></a><br/></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i3/753957799/TB2_wcOwbJkpuFjy1zcXXa5FFXa-753957799.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"683\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i2/753957799/TB2fP7DAItnpuFjSZFKXXalFFXa-753957799.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"908\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i2/753957799/TB2OyLvyCVmpuFjSZFFXXcZApXa_!!753957799.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"433\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i1/753957799/TB2UbkfystnpuFjSZFvXXbcTpXa_!!753957799.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"269\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i1/753957799/TB2ef.Rf9FjpuFjSspbXXXagVXa-753957799.jpg_q90.jpg\" class=\"\" style=\"border: 0px; vertical-align: top;\"/><br/><img src=\"https://img.alicdn.com/imgextra/i2/753957799/TB2UGY5yypnpuFjSZFIXXXh2VXa_!!753957799.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"250\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i1/753957799/TB2FtjsyAqvpuFjSZFhXXaOgXXa_!!753957799.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"738\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i1/753957799/TB2wIGxeZPRfKJjSZFOXXbKEVXa_!!753957799.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"759\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/></p><p><a target=\"_blank\" href=\"https://purewaylife.taobao.com/category-402114160.htm?spm=a1z10.1-c.w5002-4731072012.3.bQuFzA&search=y&catName=%5B%B5%C2%5DBrita%B1%CC%C8%BB%B5%C2\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px; text-align: center;\"></a></p><p><span style=\"line-height: 1.5;\"><img src=\"https://img.alicdn.com/imgextra/i2/753957799/TB2Zwoff3JkpuFjSszcXXXfsFXa-753957799.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"536\" style=\"border: 0px; vertical-align: middle; max-width: 750px;\"/></span></p><p><br/></p>', 'upload/goods_qrcode/goods_qrcode_391.png', '', '1', '0', '0', '0', '0', '0', '1', '2017-07-21 09:52:12', '2017-07-21 09:52:12', null, '0', '1861,1862', '', null, null, '0', '0', '[]', '0.00', '0.00', '3', '', '', '', '', '0');

-- ----------------------------
-- Table structure for tp_goods_attribute
-- ----------------------------
DROP TABLE IF EXISTS `tp_goods_attribute`;
CREATE TABLE `tp_goods_attribute` (
  `attr_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `attr_value_id` int(11) NOT NULL COMMENT '属性值id',
  `attr_value` varchar(255) NOT NULL DEFAULT '' COMMENT '属性值名称',
  `attr_value_name` varchar(255) NOT NULL DEFAULT '' COMMENT '属性值对应数据值',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` varchar(255) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  PRIMARY KEY (`attr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=315 COMMENT='商品属性表';

-- ----------------------------
-- Records of tp_goods_attribute
-- ----------------------------
INSERT INTO `tp_goods_attribute` VALUES ('20', '383', '41', '93', '男女款式', '', '0', '2017-07-21 09:40:23');
INSERT INTO `tp_goods_attribute` VALUES ('21', '383', '41', '87', '鞋跟高度', '8-10cm', '0', '2017-07-21 09:40:23');
INSERT INTO `tp_goods_attribute` VALUES ('22', '383', '41', '104', '材质', '布鞋', '0', '2017-07-21 09:40:23');
INSERT INTO `tp_goods_attribute` VALUES ('23', '383', '41', '96', '鞋头款式', '平头', '0', '2017-07-21 09:40:23');
INSERT INTO `tp_goods_attribute` VALUES ('24', '383', '41', '96', '鞋头款式', '尖头', '0', '2017-07-21 09:40:23');
INSERT INTO `tp_goods_attribute` VALUES ('25', '384', '41', '93', '男女款式', '', '0', '2017-07-21 09:42:00');
INSERT INTO `tp_goods_attribute` VALUES ('26', '384', '41', '87', '鞋跟高度', '8-10cm', '0', '2017-07-21 09:42:00');
INSERT INTO `tp_goods_attribute` VALUES ('27', '384', '41', '104', '材质', '皮鞋', '0', '2017-07-21 09:42:00');
INSERT INTO `tp_goods_attribute` VALUES ('28', '384', '41', '96', '鞋头款式', '尖头', '0', '2017-07-21 09:42:00');
INSERT INTO `tp_goods_attribute` VALUES ('29', '385', '41', '93', '男女款式', '', '0', '2017-07-21 09:43:19');
INSERT INTO `tp_goods_attribute` VALUES ('30', '385', '41', '87', '鞋跟高度', '8-10cm', '0', '2017-07-21 09:43:19');
INSERT INTO `tp_goods_attribute` VALUES ('31', '385', '41', '96', '鞋头款式', '尖头', '0', '2017-07-21 09:43:19');

-- ----------------------------
-- Table structure for tp_goods_attribute_deleted
-- ----------------------------
DROP TABLE IF EXISTS `tp_goods_attribute_deleted`;
CREATE TABLE `tp_goods_attribute_deleted` (
  `attr_id` int(10) NOT NULL,
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `attr_value_id` int(11) NOT NULL COMMENT '属性值id',
  `attr_value` varchar(255) NOT NULL DEFAULT '' COMMENT '属性值名称',
  `attr_value_name` varchar(255) NOT NULL DEFAULT '' COMMENT '属性值对应数据值',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` varchar(255) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=315 COMMENT='被删除的商品属性表';

-- ----------------------------
-- Records of tp_goods_attribute_deleted
-- ----------------------------
INSERT INTO `tp_goods_attribute_deleted` VALUES ('14', '382', '0', '74', '风格', '', '0', '2017-07-21 09:32:55');
INSERT INTO `tp_goods_attribute_deleted` VALUES ('15', '382', '0', '76', '裙长', '中款', '0', '2017-07-21 09:32:55');
INSERT INTO `tp_goods_attribute_deleted` VALUES ('16', '382', '0', '76', '裙长', '长款', '0', '2017-07-21 09:32:55');
INSERT INTO `tp_goods_attribute_deleted` VALUES ('17', '382', '0', '77', '款式', '休闲', '0', '2017-07-21 09:32:55');
INSERT INTO `tp_goods_attribute_deleted` VALUES ('18', '382', '0', '77', '款式', '复古', '0', '2017-07-21 09:32:55');
INSERT INTO `tp_goods_attribute_deleted` VALUES ('19', '382', '0', '77', '款式', '传统', '0', '2017-07-21 09:32:55');
INSERT INTO `tp_goods_attribute_deleted` VALUES ('8', '381', '0', '74', '风格', '', '0', '2017-07-21 09:31:32');
INSERT INTO `tp_goods_attribute_deleted` VALUES ('9', '381', '0', '76', '裙长', '短款', '0', '2017-07-21 09:31:32');
INSERT INTO `tp_goods_attribute_deleted` VALUES ('10', '381', '0', '76', '裙长', '中款', '0', '2017-07-21 09:31:32');
INSERT INTO `tp_goods_attribute_deleted` VALUES ('11', '381', '0', '77', '款式', '韩版', '0', '2017-07-21 09:31:32');
INSERT INTO `tp_goods_attribute_deleted` VALUES ('12', '381', '0', '77', '款式', '休闲', '0', '2017-07-21 09:31:32');
INSERT INTO `tp_goods_attribute_deleted` VALUES ('13', '381', '0', '77', '款式', '欧美', '0', '2017-07-21 09:31:32');
INSERT INTO `tp_goods_attribute_deleted` VALUES ('1', '380', '0', '74', '风格', '', '0', '2017-07-21 09:29:51');
INSERT INTO `tp_goods_attribute_deleted` VALUES ('2', '380', '0', '76', '裙长', '短款', '0', '2017-07-21 09:29:51');
INSERT INTO `tp_goods_attribute_deleted` VALUES ('3', '380', '0', '76', '裙长', '中款', '0', '2017-07-21 09:29:51');
INSERT INTO `tp_goods_attribute_deleted` VALUES ('4', '380', '0', '76', '裙长', '长款', '0', '2017-07-21 09:29:51');
INSERT INTO `tp_goods_attribute_deleted` VALUES ('5', '380', '0', '77', '款式', '韩版', '0', '2017-07-21 09:29:51');
INSERT INTO `tp_goods_attribute_deleted` VALUES ('6', '380', '0', '77', '款式', '休闲', '0', '2017-07-21 09:29:51');
INSERT INTO `tp_goods_attribute_deleted` VALUES ('7', '380', '0', '77', '款式', '欧美', '0', '2017-07-21 09:29:51');

-- ----------------------------
-- Table structure for tp_goods_attribute_value
-- ----------------------------
DROP TABLE IF EXISTS `tp_goods_attribute_value`;
CREATE TABLE `tp_goods_attribute_value` (
  `attr_value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品属性值ID',
  `attr_id` int(11) NOT NULL COMMENT '商品属性ID',
  `attr_value` varchar(255) NOT NULL DEFAULT '' COMMENT '值名称',
  `is_visible` bit(1) NOT NULL DEFAULT b'1' COMMENT '是否可视',
  `sort` int(11) DEFAULT NULL,
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`attr_value_id`),
  KEY `IDX_category_propvalues_c_pId` (`attr_id`),
  KEY `IDX_category_propvalues_orders` (`sort`),
  KEY `IDX_category_propvalues_value` (`attr_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1092 COMMENT='商品规格值模版表';

-- ----------------------------
-- Records of tp_goods_attribute_value
-- ----------------------------

-- ----------------------------
-- Table structure for tp_goods_brand
-- ----------------------------
DROP TABLE IF EXISTS `tp_goods_brand`;
CREATE TABLE `tp_goods_brand` (
  `brand_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '索引ID',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `brand_name` varchar(100) NOT NULL COMMENT '品牌名称',
  `brand_initial` varchar(1) NOT NULL COMMENT '品牌首字母',
  `brand_pic` varchar(100) NOT NULL DEFAULT '' COMMENT '图片',
  `brand_recommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '推荐，0为否，1为是，默认为0',
  `sort` int(11) DEFAULT NULL,
  `brand_category_name` varchar(50) NOT NULL DEFAULT '' COMMENT '类别名称',
  `category_id_array` varchar(1000) NOT NULL DEFAULT '' COMMENT '所属分类id组',
  `brand_ads` varchar(255) NOT NULL DEFAULT '' COMMENT '品牌推荐广告',
  `category_name` varchar(50) NOT NULL DEFAULT '' COMMENT '品牌所属分类名称',
  `category_id_1` int(11) NOT NULL DEFAULT '0' COMMENT '一级分类ID',
  `category_id_2` int(11) NOT NULL DEFAULT '0' COMMENT '二级分类ID',
  `category_id_3` int(11) NOT NULL DEFAULT '0' COMMENT '三级分类ID',
  PRIMARY KEY (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1024 COMMENT='品牌表';

-- ----------------------------
-- Records of tp_goods_brand
-- ----------------------------
INSERT INTO `tp_goods_brand` VALUES ('10', '0', '乐视', 'l', 'upload/common/1499755184.png', '1', '1', '', '', 'upload/common/1499755191.png', '测试分类', '311', '313', '320');

-- ----------------------------
-- Table structure for tp_goods_category
-- ----------------------------
DROP TABLE IF EXISTS `tp_goods_category`;
CREATE TABLE `tp_goods_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `category_name` varchar(50) NOT NULL DEFAULT '' COMMENT '分类名称',
  `short_name` varchar(50) NOT NULL DEFAULT '' COMMENT '商品分类简称 ',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '父级id',
  `level` tinyint(4) NOT NULL DEFAULT '0' COMMENT '分类等级',
  `is_visible` int(11) DEFAULT '1' COMMENT '是否显示  1 显示 0 不显示',
  `attr_id` int(11) NOT NULL DEFAULT '0' COMMENT '关联商品类型ID',
  `attr_name` varchar(255) NOT NULL DEFAULT '' COMMENT '关联类型名称',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键词',
  `description` varchar(255) DEFAULT '' COMMENT '描述',
  `sort` int(11) DEFAULT NULL,
  `category_pic` varchar(255) NOT NULL DEFAULT '' COMMENT '商品分类图片',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=327 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=244 COMMENT='商品分类表';

-- ----------------------------
-- Records of tp_goods_category
-- ----------------------------
INSERT INTO `tp_goods_category` VALUES ('311', '女装/男装/内衣', '女装', '0', '1', '1', '28', '衣服', '衣服', '', '12', 'upload/common/1500620933.jpg');
INSERT INTO `tp_goods_category` VALUES ('312', '鞋/箱包/配件', '配饰', '0', '1', '1', '32', '鞋子', '鞋靴/箱包/配件', '', '55', 'upload/common/1500621005.jpg');
INSERT INTO `tp_goods_category` VALUES ('313', '女装', '女装', '311', '2', '1', '28', '连衣裙', '女装', '', '0', '');
INSERT INTO `tp_goods_category` VALUES ('314', '连衣裙', '连衣裙', '311', '2', '1', '28', '衣服', '连衣裙', '', '111', 'upload/goods_category/1497086116.jpg');
INSERT INTO `tp_goods_category` VALUES ('315', '手机数码', '手机数码', '0', '1', '1', '30', '手机', '手机，数码，印象制品', '手机，数码，印象制品', '123', 'upload/common/1500620960.jpg');
INSERT INTO `tp_goods_category` VALUES ('316', '迷你连衣裙', '连衣裙', '314', '3', '1', '28', '连衣裙', '外套', '外套', '0', '');
INSERT INTO `tp_goods_category` VALUES ('317', '家用电器', '家用电器', '0', '1', '1', '0', '', '家用电器', '家用电器', '123', 'upload/common/1500620884.jpg');
INSERT INTO `tp_goods_category` VALUES ('318', '小电器', '小电器', '317', '2', '1', '0', '', '小电器', '小电器', '1', '');
INSERT INTO `tp_goods_category` VALUES ('319', '高压锅', '高压锅', '318', '3', '1', '0', '', '高压锅', '高压锅', '1', '');
INSERT INTO `tp_goods_category` VALUES ('320', '蕾丝短袖', '短袖', '313', '3', '1', '28', '衣服', '', '', '0', '');
INSERT INTO `tp_goods_category` VALUES ('322', '针织短袖', '短袖', '313', '3', '1', '28', '衣服', '短袖', '1111', '2', '');
INSERT INTO `tp_goods_category` VALUES ('323', '', '', '0', '0', '1', '0', '', '', '', null, '');
INSERT INTO `tp_goods_category` VALUES ('324', '', '', '0', '0', '1', '0', '', '', '', null, '');
INSERT INTO `tp_goods_category` VALUES ('325', '', '', '0', '0', '1', '0', '', '', '', null, '');
INSERT INTO `tp_goods_category` VALUES ('326', '', '', '0', '0', '1', '0', '', '', '', null, '');

-- ----------------------------
-- Table structure for tp_goods_deleted
-- ----------------------------
DROP TABLE IF EXISTS `tp_goods_deleted`;
CREATE TABLE `tp_goods_deleted` (
  `goods_id` int(10) NOT NULL COMMENT '商品id(SKU)',
  `goods_name` varchar(50) NOT NULL DEFAULT '' COMMENT '商品名称',
  `shop_id` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '店铺id',
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品分类id',
  `category_id_1` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '一级分类id',
  `category_id_2` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '二级分类id',
  `category_id_3` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '三级分类id',
  `brand_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '品牌id',
  `group_id_array` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺分类id 首尾用,隔开',
  `promotion_type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '促销类型 0无促销，1团购，2限时折扣',
  `promote_id` int(11) NOT NULL DEFAULT '0' COMMENT '促销活动ID',
  `goods_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '实物或虚拟商品标志 1实物商品 0 虚拟商品 2 F码商品',
  `market_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '市场价',
  `price` decimal(19,2) NOT NULL DEFAULT '0.00' COMMENT '商品原价格',
  `promotion_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品促销价格',
  `cost_price` decimal(19,2) NOT NULL DEFAULT '0.00' COMMENT '成本价',
  `point_exchange_type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '积分兑换类型 0 非积分兑换 1 只能积分兑换 ',
  `point_exchange` int(11) NOT NULL DEFAULT '0' COMMENT '积分兑换',
  `give_point` int(11) NOT NULL DEFAULT '0' COMMENT '购买商品赠送积分',
  `is_member_discount` int(1) NOT NULL DEFAULT '0' COMMENT '参与会员折扣',
  `shipping_fee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '运费 0为免运费',
  `shipping_fee_id` int(11) NOT NULL DEFAULT '0' COMMENT '售卖区域id 物流模板id  tp_order_shipping_fee 表id',
  `stock` int(10) NOT NULL DEFAULT '0' COMMENT '商品库存',
  `max_buy` int(11) NOT NULL DEFAULT '0' COMMENT '限购 0 不限购',
  `clicks` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品点击数量',
  `min_stock_alarm` int(11) NOT NULL DEFAULT '0' COMMENT '库存预警值',
  `sales` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '销售数量',
  `collects` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏数量',
  `star` tinyint(3) unsigned NOT NULL DEFAULT '5' COMMENT '好评星级',
  `evaluates` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评价数',
  `shares` int(11) NOT NULL DEFAULT '0' COMMENT '分享数',
  `province_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '一级地区id',
  `city_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '二级地区id',
  `picture` int(11) NOT NULL DEFAULT '0' COMMENT '商品主图',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '商品关键词',
  `introduction` varchar(255) NOT NULL DEFAULT '' COMMENT '商品简介，促销语',
  `description` text NOT NULL COMMENT '商品详情',
  `QRcode` varchar(255) NOT NULL DEFAULT '' COMMENT '商品二维码',
  `code` varchar(50) NOT NULL DEFAULT '' COMMENT '商家编号',
  `is_stock_visible` int(1) NOT NULL DEFAULT '0' COMMENT '页面不显示库存',
  `is_hot` int(1) NOT NULL DEFAULT '0' COMMENT '是否热销商品',
  `is_recommend` int(1) NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `is_new` int(1) NOT NULL DEFAULT '0' COMMENT '是否新品',
  `is_pre_sale` int(1) NOT NULL DEFAULT '0' COMMENT '是否预售',
  `is_bill` int(1) NOT NULL DEFAULT '0' COMMENT '是否开具增值税发票 1是，0否',
  `state` tinyint(3) NOT NULL DEFAULT '1' COMMENT '商品状态 0下架，1正常，10违规（禁售）',
  `sale_date` datetime NOT NULL COMMENT '上下架时间',
  `create_time` datetime NOT NULL COMMENT '商品添加时间',
  `update_time` datetime DEFAULT NULL COMMENT '商品编辑时间',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `img_id_array` varchar(1000) DEFAULT NULL COMMENT '商品图片序列',
  `sku_img_array` varchar(1000) DEFAULT NULL COMMENT '商品sku应用图片列表  属性,属性值，图片ID',
  `match_point` float(10,2) DEFAULT NULL COMMENT '实物与描述相符（根据评价计算）',
  `match_ratio` float(10,2) DEFAULT NULL COMMENT '实物与描述相符（根据评价计算）百分比',
  `real_sales` int(10) NOT NULL DEFAULT '0' COMMENT '实际销量',
  `goods_attribute_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品类型',
  `goods_spec_format` text NOT NULL COMMENT '商品规格',
  `goods_weight` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '商品重量',
  `goods_volume` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '商品体积',
  `shipping_fee_type` int(11) NOT NULL DEFAULT '1' COMMENT '计价方式1.重量2.体积3.计件',
  `extend_category_id` varchar(255) DEFAULT NULL,
  `extend_category_id_1` varchar(255) DEFAULT NULL,
  `extend_category_id_2` varchar(255) DEFAULT NULL,
  `extend_category_id_3` varchar(255) DEFAULT NULL,
  `supplier_id` int(11) NOT NULL DEFAULT '0' COMMENT '供货商id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=712 COMMENT='商品回收站表';

-- ----------------------------
-- Records of tp_goods_deleted
-- ----------------------------
INSERT INTO `tp_goods_deleted` VALUES ('372', '2017新款女装夏装修身长款连衣裙女雪纺灯笼袖中袖裙雪纺刺绣长裙', '0', '316', '311', '314', '316', '0', '0', '0', '0', '0', '1.00', '0.00', '0.00', '265.00', '0', '0', '0', '0', '0.00', '0', '0', '1000', '100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1827', '', '', 'upload/goods_qrcode/goods_qrcode_372.png', '', '0', '0', '0', '0', '0', '0', '0', '2017-07-20 18:44:06', '2017-07-20 18:44:06', '2017-07-20 06:44:55', '0', '0', '1', '0.00', '0.00', '0', '0', '[{&quot;attr_value_id&quot;:&quot;74&quot;,&quot;attr_value&quot;:&quot;风格&quot;,&quot;attr_value_name&quot;:&quot;&quot;,&quot;sort&quot;:0},{&quot;attr_value_id&quot;:&quot;76&quot;,&quot;attr_value&quot;:&quot;裙长&quot;,&quot;attr_value_name&quot;:&quot;中款&quot;,&quot;sort&quot;:0},{&quot;attr_value_id&quot;:&quot;76&quot;,&quot;attr_value&quot;:&quot;裙长&quot;,&quot;attr_value_name&quot;:&quot;长款&quot;,&quot;sort&quot;:0},{&quot;attr_value_id&quot;:&quot;77&quot;,&quot;attr_value&quot;:&quot;款式&quot;,&quot;attr_value_name&quot;:&quot;韩版&quot;,&quot;sort&quot;:0},{&quot;attr_value_id&quot;:&quot;77&quot;,&quot;attr_value&quot;:&quot;款式&quot;,&quot;attr_value_name&quot;:&quot;休闲&quot;,&quot;sort&quot;:0},{&quot;attr_value_id&quot;:&quot;77&quot;,&quot;attr_value&quot;:&quot;款式&quot;,&quot;attr_value_name&quot;:&quot;欧美&quot;,&quot;sort&quot;:0}]', '0.00', '0.00', '0', '3', '0', '0', '0', '0');
INSERT INTO `tp_goods_deleted` VALUES ('382', 'M Queen独立制衣 优雅V领褶皱飘带系带修身长裙A字吊带连衣裙8915', '0', '316', '311', '314', '316', '0', '', '0', '0', '1', '0.00', '369.00', '369.00', '0.00', '0', '0', '0', '0', '0.00', '0', '1000', '0', '0', '100', '0', '0', '0', '0', '0', '0', '0', '1841', '', '', '<ul class=\"attributes-list list-paddingleft-2\" style=\"list-style-type: none;\"><li><p>廓形:&nbsp;A型</p></li><li><p>货号:&nbsp;8915</p></li><li><p>风格:&nbsp;通勤</p></li><li><p>通勤:&nbsp;简约</p></li><li><p>组合形式:&nbsp;单件</p></li><li><p>裙长:&nbsp;中长裙</p></li><li><p>款式:&nbsp;吊带</p></li><li><p>袖长:&nbsp;无袖</p></li><li><p>领型:&nbsp;V领</p></li><li><p>腰型:&nbsp;高腰</p></li><li><p>衣门襟:&nbsp;套头</p></li><li><p>裙型:&nbsp;A字裙</p></li><li><p>图案:&nbsp;纯色</p></li><li><p>流行元素/工艺:&nbsp;褶皱 绑带</p></li><li><p>面料:&nbsp;针织</p></li><li><p>成分含量:&nbsp;95%以上</p></li><li><p>材质:&nbsp;涤纶</p></li><li><p>年份季节:&nbsp;2017年夏季</p></li><li><p>颜色分类:&nbsp;浅紫灰 芥末绿 芥末绿第二批预售7月24日 浅紫灰第二批预售7月24日</p></li><li><p>尺码:&nbsp;S M</p></li></ul><table width=\"750\" height=\"740\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr class=\"firstRow\"><td style=\"margin: 0px; padding: 0px;\"><a href=\"https://item.taobao.com/item.htm?spm=a1z10.3-c.w4002-10065573524.32.425c430WzpVbR&id=550984248787\" target=\"_blank\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i2/35612257/TB2iKiCwb8kpuFjy0FcXXaUhpXa_!!35612257.jpg\" width=\"188\" height=\"409\" alt=\"\" style=\"border: 0px; vertical-align: top;\"/></a></td><td style=\"margin: 0px; padding: 0px;\"><a href=\"https://item.taobao.com/item.htm?spm=a1z10.3-c.w4002-10065573524.44.425c430WzpVbR&id=550985456830\" target=\"_blank\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i1/35612257/TB26LRiwbBkpuFjy1zkXXbSpFXa_!!35612257.jpg\" width=\"188\" height=\"409\" alt=\"\" style=\"border: 0px; vertical-align: top;\"/></a></td><td style=\"margin: 0px; padding: 0px;\"><a href=\"https://item.taobao.com/item.htm?spm=a1z10.3-c.w4002-10065573524.38.425c430WzpVbR&id=549802228314\" target=\"_blank\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i3/35612257/TB2Ra39v9XlpuFjy0FeXXcJbFXa_!!35612257.jpg\" width=\"185\" height=\"409\" alt=\"\" style=\"border: 0px; vertical-align: top;\"/></a></td><td style=\"margin: 0px; padding: 0px;\"><a href=\"https://item.taobao.com/item.htm?spm=a1z10.3-c.w4002-10065573524.35.425c430WzpVbR&id=549802812279\" target=\"_blank\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i1/35612257/TB2ppQpAtBopuFjSZPcXXc9EpXa_!!35612257.jpg\" width=\"189\" height=\"409\" alt=\"\" style=\"border: 0px; vertical-align: top;\"/></a></td></tr><tr><td style=\"margin: 0px; padding: 0px;\"><a href=\"https://item.taobao.com/item.htm?spm=a1z10.3-c.w4002-10065573524.47.425c430WzpVbR&id=551068710615\" target=\"_blank\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i3/35612257/TB2TtlCwbXlpuFjSszfXXcSGXXa_!!35612257.jpg\" class=\"\" width=\"188\" height=\"331\" alt=\"\" style=\"border: 0px; vertical-align: top;\"/></a></td><td style=\"margin: 0px; padding: 0px;\"><a href=\"https://item.taobao.com/item.htm?spm=a1z10.3-c.w4002-10065573524.53.425c430WzpVbR&id=549910923808\" target=\"_blank\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i2/35612257/TB2jZiuviC9MuFjSZFoXXbUzFXa_!!35612257.jpg\" class=\"\" width=\"188\" height=\"331\" alt=\"\" style=\"border: 0px; vertical-align: top;\"/></a></td><td style=\"margin: 0px; padding: 0px;\"><a href=\"https://item.taobao.com/item.htm?spm=a1z10.3-c.w4002-10065573524.50.425c430WzpVbR&id=533107354438\" target=\"_blank\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i3/35612257/TB2xciuviC9MuFjSZFoXXbUzFXa_!!35612257.jpg\" class=\"\" width=\"185\" height=\"331\" alt=\"\" style=\"border: 0px; vertical-align: top;\"/></a></td><td style=\"margin: 0px; padding: 0px;\"><a href=\"https://item.taobao.com/item.htm?spm=a1z10.3-c.w4002-10065573524.41.425c430WzpVbR&id=548212247820\" target=\"_blank\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i1/35612257/TB2eJpAAOlnpuFjSZFgXXbi7FXa_!!35612257.jpg\" class=\"\" width=\"189\" height=\"331\" alt=\"\" style=\"border: 0px; vertical-align: top;\"/></a></td></tr></tbody></table><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i1/35612257/TB2WeMlrxhmpuFjSZFyXXcLdFXa_!!35612257.jpg\" class=\"\" width=\"750\" height=\"361\" style=\"border: 0px; vertical-align: top;\"/></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\"><img src=\"https://img.alicdn.com/imgextra/i4/35612257/TB2I2Oqu30kpuFjSspdXXX4YXXa_!!35612257.jpg\" class=\"\" align=\"absmiddle\" width=\"732\" height=\"870\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i1/35612257/TB2KkENzrBmpuFjSZFAXXaQ0pXa_!!35612257.jpg\" class=\"\" align=\"absmiddle\" width=\"650\" height=\"451\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i2/35612257/TB21vo9uHJkpuFjy1zcXXa5FFXa_!!35612257.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"4625\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i2/35612257/TB2FaRJu3JlpuFjSspjXXcT.pXa_!!35612257.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"5203\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/></p><p><br/></p>', 'upload/goods_qrcode/goods_qrcode_382.png', '', '1', '0', '0', '0', '0', '0', '1', '2017-07-21 09:32:55', '2017-07-21 09:32:55', '2017-09-23 03:17:59', '0', '1841,1842,1843', '', '0.00', '0.00', '0', '28', '[]', '0.00', '0.00', '3', '', '', '', '', '0');
INSERT INTO `tp_goods_deleted` VALUES ('381', '2016夏装新款夜店豹纹性感露背低胸女装超短裙抹胸紧身包臀连衣裙', '0', '316', '311', '314', '316', '0', '', '0', '0', '1', '0.00', '426.00', '426.00', '0.00', '0', '0', '0', '0', '0.00', '0', '1000', '0', '0', '100', '0', '0', '0', '0', '0', '0', '0', '1839', '', '', '<ul class=\"attributes-list list-paddingleft-2\" style=\"list-style-type: none;\"><li><p>风格:&nbsp;通勤</p></li><li><p>通勤:&nbsp;韩版</p></li><li><p>组合形式:&nbsp;单件</p></li><li><p>裙长:&nbsp;短裙</p></li><li><p>款式:&nbsp;裹胸</p></li><li><p>袖长:&nbsp;无袖</p></li><li><p>领型:&nbsp;其他</p></li><li><p>袖型:&nbsp;其他</p></li><li><p>腰型:&nbsp;松紧腰</p></li><li><p>衣门襟:&nbsp;套头</p></li><li><p>裙型:&nbsp;蛋糕裙</p></li><li><p>图案:&nbsp;豹纹</p></li><li><p>流行元素/工艺:&nbsp;拼接</p></li><li><p>面料:&nbsp;其他</p></li><li><p>成分含量:&nbsp;31%(含)-50%(含)</p></li><li><p>材质:&nbsp;其他</p></li><li><p>年份季节:&nbsp;2016年夏季</p></li><li><p>颜色分类:&nbsp;豹纹 白色</p></li><li><p>尺码:&nbsp;均码</p></li></ul><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; line-height: 21px; white-space: normal; background-color: rgb(255, 255, 255);\">裙长；58</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; line-height: 21px; white-space: normal; background-color: rgb(255, 255, 255);\">胸围;33</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; line-height: 21px; white-space: normal; background-color: rgb(255, 255, 255);\">&nbsp;</p><p><img src=\"https://img.alicdn.com/imgextra/i1/1608473399/T2k7foXp8aXXXXXXXX-1608473399.jpg\" class=\"\" width=\"526\" height=\"600\" style=\"border: 0px; vertical-align: middle;\"/><br/><br/><img src=\"https://img.alicdn.com/imgextra/i2/1608473399/T2F8PpXtJXXXXXXXXX-1608473399.jpg\" class=\"\" width=\"585\" height=\"600\" style=\"border: 0px; vertical-align: middle;\"/></p><p><br/><img src=\"https://img.alicdn.com/imgextra/i2/1608473399/T26.npXsNXXXXXXXXX-1608473399.jpg\" class=\"\" width=\"640\" height=\"960\" style=\"border: 0px; vertical-align: middle;\"/></p><p><img src=\"https://img.alicdn.com/imgextra/i3/1608473399/T23QLoXD4XXXXXXXXX-1608473399.jpg\" class=\"\" width=\"561\" height=\"600\" style=\"border: 0px; vertical-align: middle;\"/></p><p><br/><br/><br/><br/><img src=\"https://img.alicdn.com/imgextra/i3/1608473399/T23QLoXD4XXXXXXXXX-1608473399.jpg\" class=\"\" width=\"561\" height=\"600\" style=\"border: 0px; vertical-align: middle;\"/><br/><br/><img src=\"https://img.alicdn.com/imgextra/i1/1608473399/T28oHoXCJXXXXXXXXX-1608473399.jpg\" class=\"\" width=\"640\" height=\"506\" style=\"border: 0px; vertical-align: middle;\"/><br/><br/><img src=\"https://img.alicdn.com/imgextra/i1/1608473399/T2BtPpXzhXXXXXXXXX-1608473399.jpg\" class=\"\" width=\"605\" height=\"600\" style=\"border: 0px; vertical-align: middle;\"/><br/><br/><img src=\"https://img.alicdn.com/imgextra/i4/1608473399/T2LTrpXsRXXXXXXXXX-1608473399.jpg\" class=\"\" width=\"640\" height=\"960\" style=\"border: 0px; vertical-align: middle;\"/><br/><br/><img src=\"https://img.alicdn.com/imgextra/i4/1608473399/T2vjToXqlaXXXXXXXX-1608473399.jpg\" class=\"\" width=\"640\" height=\"960\" style=\"border: 0px; vertical-align: middle;\"/></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; line-height: 21px; white-space: normal; background-color: rgb(255, 255, 255);\">&nbsp;</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; line-height: 21px; white-space: normal; background-color: rgb(255, 255, 255);\">&nbsp;</p><p><a style=\"color: rgb(51, 102, 204); outline: 0px; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; line-height: 21px; white-space: normal; background-color: rgb(255, 255, 255);\" name=\"2start2740964\"></a><a href=\"https://shop102555670.taobao.com/?l=27409640\" target=\"_blank\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; line-height: 21px; white-space: normal; background-color: rgb(255, 255, 255);\"><img alt=\" T26slxXv8aXXXXXXXX_!!1788918413.jpg\" src=\"https://img.alicdn.com/imgextra/i3/1608473399/TB29tvpaFXXXXbhXXXXXXXXXXXX_!!1608473399.jpg\" class=\"\" width=\"750\" height=\"1027\" style=\"border: 0px; vertical-align: middle;\"/></a></p><p><br/></p>', 'upload/goods_qrcode/goods_qrcode_381.png', '', '1', '0', '0', '0', '0', '0', '1', '2017-07-21 09:31:32', '2017-07-21 09:31:32', '2017-09-23 03:18:02', '0', '1839,1840', '', '0.00', '0.00', '0', '28', '[]', '0.00', '0.00', '3', '', '', '', '', '0');
INSERT INTO `tp_goods_deleted` VALUES ('380', '印花显瘦A字碎花真丝连衣裙女夏季2017新款欧洲站气质裙子女装潮', '0', '316', '311', '314', '316', '0', '', '0', '0', '1', '0.00', '359.00', '359.00', '0.00', '0', '0', '0', '0', '0.00', '0', '1000', '0', '0', '100', '0', '0', '0', '0', '0', '0', '0', '1827', '', '', '<p class=\"attr-list-hd tm-clear\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 5px 20px; line-height: 22px; color: rgb(153, 153, 153); font-family: tahoma, arial, 微软雅黑, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; font-weight: 700; float: left;\">产品参数：</span></p><ul id=\"J_AttrUL\" style=\"list-style-type: none;\" class=\" list-paddingleft-2\"><li><p>廓形:&nbsp;A型</p></li><li><p>材质成分:&nbsp;桑蚕丝100%</p></li><li><p>销售渠道类型:&nbsp;纯电商(只在线上销售)</p></li><li><p>货号:&nbsp;V6394AAA</p></li><li><p>风格:&nbsp;街头</p></li><li><p>街头:&nbsp;欧美</p></li><li><p>组合形式:&nbsp;单件</p></li><li><p>裙长:&nbsp;短裙</p></li><li><p>款式:&nbsp;裹胸</p></li><li><p>袖长:&nbsp;短袖</p></li><li><p>领型:&nbsp;V领</p></li><li><p>袖型:&nbsp;喇叭袖</p></li><li><p>腰型:&nbsp;中腰</p></li><li><p>衣门襟:&nbsp;套头</p></li><li><p>裙型:&nbsp;A字裙</p></li><li><p>图案:&nbsp;花色</p></li><li><p>流行元素/工艺:&nbsp;印花</p></li><li><p>品牌:&nbsp;vileanx/威琳诗</p></li><li><p>适用年龄:&nbsp;25-29周岁</p></li><li><p>年份季节:&nbsp;2017年夏季</p></li><li><p>颜色分类:&nbsp;花色</p></li><li><p>尺码:&nbsp;S&nbsp;M&nbsp;L&nbsp;XL</p></li></ul><table cellspacing=\"0\" cellpadding=\"0\" align=\"center\" bgcolor=\"#000000\" width=\"790\" style=\"width: 751px;\"><tbody style=\"margin: 0px; padding: 0px;\"><tr style=\"margin: 0px; padding: 0px;\" class=\"firstRow\"><td style=\"margin: 0px; padding: 0px; border-color: rgb(0, 0, 0);\"><a href=\"https://favorite.taobao.com/popup/add_collection.htm?spm=a1z10.1-b-s.w7566866-14552158213.1.dCZ1Zg&id=106858909&itemid=106858909&itemtype=0&ownerid=d6897baa34b6b782dad74a9ded95cdc3&itemtype=0&scjjc=2&ownerid=&_tb_token_=X8a3fiVaiec0bh&scene=taobao_shop\" target=\"_blank\" style=\"margin: 0px; padding: 0px; text-decoration: none; color: rgb(51, 85, 170); outline: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i2/1857068113/TB2ODBWaVXXXXXDXpXXXXXXXXXX_!!1857068113.png\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: top; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; display: block;\"/></a></td></tr><tr style=\"margin: 0px; padding: 0px;\"><td style=\"margin: 0px; padding-right: 18px; padding-left: 18px; border-width: 0px; border-color: rgb(229, 229, 229); color: rgb(0, 0, 0); font-stretch: normal; font-size: 12px; line-height: normal; font-family: &#39;microsoft yahei&#39;;\">产品信息/INFOMATION产品品牌：Vileanx产品款号：6394产品颜色：花色产品材质：100%真丝适合季节：夏季产品尺码：S-XL商 场 价 ：￥668产品特点：无弹力，有内衬，有腰带，无拉链，印花工艺洗涤建议：单独轻洗，分色洗涤模特参数：身高173CM，体重96斤 ， 试穿S尺码说明：测量方法不同尺码会有差异，误差2厘米左右色差说明：因光线环境不同，显示器差异，可能会有一点色差，属正常产品指数/INICATOR弹性:无弹微弹中弹高弹超弹厚度:薄偏薄中等较厚厚柔软:软偏软中软偏硬硬版型：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;紧身修身合身宽松</td></tr><tr height=\"20\" style=\"margin: 0px; padding: 0px;\"><td style=\"margin: 0px; padding: 0px; border-color: rgb(0, 0, 0);\"><br/></td></tr><tr height=\"10\" style=\"margin: 0px; padding: 0px;\"><td style=\"margin: 0px; padding: 0px; border-color: rgb(0, 0, 0);\"><br/></td></tr><tr style=\"margin: 0px; padding: 0px;\"><td style=\"margin: 0px; padding: 0px 15px; border-width: 0px; border-color: rgb(204, 204, 204); color: rgb(0, 0, 0); text-align: center; font-stretch: normal; font-size: 12px; line-height: normal; font-family: &#39;microsoft yahei&#39;;\"><p>尺码胸围腰围臀围袖长衣长仅供参考其他S86腰带调节不计2682建议100斤以内选-M90腰带调节不计2682建议100-110斤选-L94&nbsp;腰带调节不计2783建议110-120斤选-XL98腰带调节不计2783建议120-130斤选-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></td></tr><tr height=\"10\" style=\"margin: 0px; padding: 0px;\"><td style=\"margin: 0px; padding: 0px; border-color: rgb(0, 0, 0);\"><br/></td></tr><tr style=\"margin: 0px; padding: 0px; font-size: 0px; height: 0px;\"><td style=\"margin: 0px; padding: 0px; border-color: rgb(0, 0, 0);\"><br/></td></tr></tbody></table><p><a href=\"https://favorite.taobao.com/popup/add_collection.htm?spm=a1z10.1-b-s.w7566866-14552158213.1.dCZ1Zg&id=106858909&itemid=106858909&itemtype=0&ownerid=d6897baa34b6b782dad74a9ded95cdc3&itemtype=0&scjjc=2&ownerid=&_tb_token_=X8a3fiVaiec0bh&scene=taobao_shop\" target=\"_blank\" style=\"margin: 0px; padding: 0px; text-decoration: none; color: rgb(51, 85, 170); outline: 0px; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; line-height: 21px; text-align: -webkit-center; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"https://img.alicdn.com/imgextra/i1/1857068113/TB205X2aVXXXXaxXXXXXXXXXXXX_!!1857068113.png\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; display: block;\"/></a><img src=\"https://img.alicdn.com/imgextra/i3/1857068113/TB2vD3ZrbtlpuFjSspfXXXLUpXa_!!1857068113.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; line-height: 21px; text-align: -webkit-center; white-space: normal; background-color: rgb(255, 255, 255);\"/><img src=\"https://img.alicdn.com/imgextra/i3/1857068113/TB2S1o4rhXkpuFjy0FiXXbUfFXa_!!1857068113.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; line-height: 21px; text-align: -webkit-center; white-space: normal; background-color: rgb(255, 255, 255);\"/><img src=\"https://img.alicdn.com/imgextra/i3/1857068113/TB2AIYWuNxmpuFjSZFNXXXrRXXa_!!1857068113.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; line-height: 21px; text-align: -webkit-center; white-space: normal; background-color: rgb(255, 255, 255);\"/><img src=\"https://img.alicdn.com/imgextra/i3/1857068113/TB2kFgOrhXlpuFjSsphXXbJOXXa_!!1857068113.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; line-height: 21px; text-align: -webkit-center; white-space: normal; background-color: rgb(255, 255, 255);\"/><img src=\"https://img.alicdn.com/imgextra/i4/1857068113/TB21LsnuH4npuFjSZFmXXXl4FXa_!!1857068113.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; line-height: 21px; text-align: -webkit-center; white-space: normal; background-color: rgb(255, 255, 255);\"/><img src=\"https://img.alicdn.com/imgextra/i4/1857068113/TB2ibMiuHBmpuFjSZFuXXaG_XXa_!!1857068113.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; line-height: 21px; text-align: -webkit-center; white-space: normal; background-color: rgb(255, 255, 255);\"/><a href=\"https://favorite.taobao.com/popup/add_collection.htm?spm=a1z10.1-b-s.w7566866-14552158213.1.dCZ1Zg&id=106858909&itemid=106858909&itemtype=0&ownerid=d6897baa34b6b782dad74a9ded95cdc3&itemtype=0&scjjc=2&ownerid=&_tb_token_=X8a3fiVaiec0bh&scene=taobao_shop\" target=\"_blank\" style=\"margin: 0px; padding: 0px; text-decoration: none; color: rgb(51, 85, 170); outline: 0px; font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; line-height: 21px; text-align: -webkit-center; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"https://img.alicdn.com/imgextra/i4/1857068113/TB2gPh2aVXXXXatXXXXXXXXXXXX_!!1857068113.png\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; display: block;\"/></a><img src=\"https://img.alicdn.com/imgextra/i1/1857068113/TB2j9udu.lnpuFjSZFjXXXTaVXa_!!1857068113.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; line-height: 21px; text-align: -webkit-center; white-space: normal; background-color: rgb(255, 255, 255);\"/><img src=\"https://img.alicdn.com/imgextra/i3/1857068113/TB2X4Kvu5pnpuFjSZFIXXXh2VXa_!!1857068113.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; line-height: 21px; text-align: -webkit-center; white-space: normal; background-color: rgb(255, 255, 255);\"/></p><p><br/></p>', 'upload/goods_qrcode/goods_qrcode_380.png', '', '1', '0', '0', '0', '0', '0', '1', '2017-07-21 09:29:50', '2017-07-21 09:29:50', '2017-09-23 03:18:04', '0', '1827,1828,1829', '', '0.00', '0.00', '0', '28', '[]', '0.00', '0.00', '3', '', '', '', '', '0');

-- ----------------------------
-- Table structure for tp_goods_evaluate
-- ----------------------------
DROP TABLE IF EXISTS `tp_goods_evaluate`;
CREATE TABLE `tp_goods_evaluate` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评价ID',
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `order_no` bigint(20) unsigned NOT NULL COMMENT '订单编号',
  `order_goods_id` int(11) NOT NULL COMMENT '订单项ID',
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `goods_name` varchar(100) NOT NULL COMMENT '商品名称',
  `goods_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品价格',
  `goods_image` varchar(255) NOT NULL DEFAULT '' COMMENT '商品图片',
  `shop_id` int(11) NOT NULL COMMENT '店铺ID',
  `shop_name` varchar(100) NOT NULL COMMENT '店铺名称',
  `content` varchar(255) NOT NULL DEFAULT '' COMMENT '评价内容',
  `addtime` datetime DEFAULT NULL COMMENT '评价时间',
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '评价图片',
  `explain_first` varchar(255) NOT NULL DEFAULT '' COMMENT '解释内容',
  `member_name` varchar(100) NOT NULL DEFAULT '' COMMENT '评价人名称',
  `uid` int(11) NOT NULL COMMENT '评价人编号',
  `is_anonymous` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0表示不是 1表示是匿名评价',
  `scores` tinyint(1) NOT NULL COMMENT '评分1-5分',
  `again_content` varchar(255) NOT NULL DEFAULT '' COMMENT '追加评价内容',
  `again_addtime` datetime DEFAULT NULL COMMENT '追加评价时间',
  `again_image` varchar(255) NOT NULL DEFAULT '' COMMENT '追加评价图片',
  `again_explain` varchar(255) NOT NULL DEFAULT '' COMMENT '追加解释内容',
  `explain_type` int(11) DEFAULT '0' COMMENT '1好评2中评3差评',
  `is_show` int(1) DEFAULT '1' COMMENT '1显示 0隐藏',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1489 COMMENT='商品评价表';

-- ----------------------------
-- Records of tp_goods_evaluate
-- ----------------------------

-- ----------------------------
-- Table structure for tp_goods_group
-- ----------------------------
DROP TABLE IF EXISTS `tp_goods_group`;
CREATE TABLE `tp_goods_group` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `shop_id` int(11) NOT NULL COMMENT '店铺ID',
  `group_name` varchar(50) NOT NULL DEFAULT '' COMMENT '分类名称',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '上级id 最多2级',
  `level` tinyint(4) NOT NULL DEFAULT '0' COMMENT '级别',
  `is_visible` int(1) NOT NULL DEFAULT '1' COMMENT '是否可视',
  `group_pic` varchar(100) NOT NULL DEFAULT '' COMMENT '图片',
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=160 COMMENT='商品分组表';

-- ----------------------------
-- Records of tp_goods_group
-- ----------------------------
INSERT INTO `tp_goods_group` VALUES ('107', '0', ' 女装', '0', '1', '1', '', '0');
INSERT INTO `tp_goods_group` VALUES ('108', '0', '连衣裙', '107', '2', '1', '', '0');
INSERT INTO `tp_goods_group` VALUES ('109', '0', '男装', '0', '1', '1', '', '0');
INSERT INTO `tp_goods_group` VALUES ('110', '0', '手机', '0', '1', '1', '', '1');
INSERT INTO `tp_goods_group` VALUES ('111', '0', '分组添加测试', '0', '1', '1', '', '3');

-- ----------------------------
-- Table structure for tp_goods_sku
-- ----------------------------
DROP TABLE IF EXISTS `tp_goods_sku`;
CREATE TABLE `tp_goods_sku` (
  `sku_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表序号',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品编号',
  `sku_name` varchar(500) NOT NULL DEFAULT '' COMMENT 'SKU名称',
  `attr_value_items` varchar(255) NOT NULL DEFAULT '' COMMENT '属性和属性值 id串 attribute + attribute value 表ID分号分隔',
  `attr_value_items_format` varchar(500) NOT NULL DEFAULT '' COMMENT '属性和属性值id串组合json格式',
  `market_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '市场价',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '价格',
  `promote_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '促销价格',
  `cost_price` decimal(19,2) NOT NULL DEFAULT '0.00' COMMENT '成本价',
  `stock` int(11) NOT NULL DEFAULT '0' COMMENT '库存',
  `picture` int(11) NOT NULL DEFAULT '0' COMMENT '如果是第一个sku编码, 可以加图片',
  `code` varchar(255) NOT NULL DEFAULT '' COMMENT '商家编码',
  `QRcode` varchar(255) NOT NULL DEFAULT '' COMMENT '商品二维码',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`sku_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1491 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=481 COMMENT='商品skui规格价格库存信息表';

-- ----------------------------
-- Records of tp_goods_sku
-- ----------------------------
INSERT INTO `tp_goods_sku` VALUES ('1482', '383', '', '', '', '0.00', '345.00', '345.00', '0.00', '1000', '0', '', '', '2017-07-21 09:40:23', null);
INSERT INTO `tp_goods_sku` VALUES ('1483', '384', '', '', '', '0.00', '269.00', '269.00', '0.00', '998', '0', '', '', '2017-07-21 09:42:00', null);
INSERT INTO `tp_goods_sku` VALUES ('1484', '385', '', '', '', '0.00', '269.00', '269.00', '0.00', '1000', '0', '', '', '2017-07-21 09:43:19', null);
INSERT INTO `tp_goods_sku` VALUES ('1485', '386', '', '', '', '0.00', '5999.00', '5999.00', '0.00', '1000', '0', '', '', '2017-07-21 09:45:22', null);
INSERT INTO `tp_goods_sku` VALUES ('1486', '387', '', '', '', '0.00', '4999.00', '4999.00', '0.00', '11000', '0', '', '', '2017-07-21 09:46:30', null);
INSERT INTO `tp_goods_sku` VALUES ('1487', '388', '', '', '', '0.00', '4700.00', '4700.00', '0.00', '999', '0', '', '', '2017-07-21 09:47:50', null);
INSERT INTO `tp_goods_sku` VALUES ('1488', '389', '', '', '', '0.00', '288.00', '288.00', '0.00', '1000', '0', '', '', '2017-07-21 09:50:05', null);
INSERT INTO `tp_goods_sku` VALUES ('1489', '390', '', '', '', '0.00', '266.00', '266.00', '0.00', '1000', '0', '', '', '2017-07-21 09:51:09', null);
INSERT INTO `tp_goods_sku` VALUES ('1490', '391', '', '', '', '0.00', '199.00', '199.00', '0.00', '2000', '0', '', '', '2017-07-21 09:52:12', null);

-- ----------------------------
-- Table structure for tp_goods_sku_deleted
-- ----------------------------
DROP TABLE IF EXISTS `tp_goods_sku_deleted`;
CREATE TABLE `tp_goods_sku_deleted` (
  `sku_id` int(11) NOT NULL DEFAULT '0' COMMENT '表序号',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品编号',
  `sku_name` varchar(500) NOT NULL DEFAULT '' COMMENT 'SKU名称',
  `attr_value_items` varchar(255) NOT NULL DEFAULT '' COMMENT '属性和属性值 id串 attribute + attribute value 表ID分号分隔',
  `attr_value_items_format` varchar(500) NOT NULL DEFAULT '' COMMENT '属性和属性值id串组合json格式',
  `market_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '市场价',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '价格',
  `promote_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '促销价格',
  `cost_price` decimal(19,2) NOT NULL DEFAULT '0.00' COMMENT '成本价',
  `stock` int(11) NOT NULL DEFAULT '0' COMMENT '库存',
  `picture` int(11) NOT NULL DEFAULT '0' COMMENT '如果是第一个sku编码, 可以加图片',
  `code` varchar(255) NOT NULL DEFAULT '' COMMENT '商家编码',
  `QRcode` varchar(255) NOT NULL DEFAULT '' COMMENT '商品二维码',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=372 COMMENT='商品skui规格价格库存信息回收站表';

-- ----------------------------
-- Records of tp_goods_sku_deleted
-- ----------------------------
INSERT INTO `tp_goods_sku_deleted` VALUES ('1471', '372', ' ', '1827,1828,1829', '1827,1828,1829', '0.00', '0.00', '0.00', '0.00', '0', '0', '', '', '2017-07-20 18:44:06', '2017-07-20 06:44:55');
INSERT INTO `tp_goods_sku_deleted` VALUES ('1481', '382', '', '', '', '0.00', '369.00', '369.00', '0.00', '1000', '0', '', '', '2017-07-21 09:32:55', '2017-09-23 03:17:59');
INSERT INTO `tp_goods_sku_deleted` VALUES ('1480', '381', '', '', '', '0.00', '426.00', '426.00', '0.00', '1000', '0', '', '', '2017-07-21 09:31:32', '2017-09-23 03:18:02');
INSERT INTO `tp_goods_sku_deleted` VALUES ('1479', '380', '', '', '', '0.00', '359.00', '359.00', '0.00', '1000', '0', '', '', '2017-07-21 09:29:51', '2017-09-23 03:18:04');

-- ----------------------------
-- Table structure for tp_goods_sku_picture
-- ----------------------------
DROP TABLE IF EXISTS `tp_goods_sku_picture`;
CREATE TABLE `tp_goods_sku_picture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品id',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `spec_id` int(11) NOT NULL DEFAULT '0' COMMENT '主规格id',
  `spec_value_id` int(11) NOT NULL DEFAULT '0' COMMENT '规格值id',
  `sku_img_array` varchar(1000) NOT NULL DEFAULT '' COMMENT '图片id 多\n\n\n\n个用逗号隔开',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品sku多图';

-- ----------------------------
-- Records of tp_goods_sku_picture
-- ----------------------------

-- ----------------------------
-- Table structure for tp_goods_sku_picture_delete
-- ----------------------------
DROP TABLE IF EXISTS `tp_goods_sku_picture_delete`;
CREATE TABLE `tp_goods_sku_picture_delete` (
  `id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品id',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `spec_id` int(11) NOT NULL DEFAULT '0' COMMENT '主规格id',
  `spec_value_id` int(11) NOT NULL DEFAULT '0' COMMENT '规格值id',
  `sku_img_array` varchar(1000) NOT NULL DEFAULT '' COMMENT '图片id 多\n\n\n\n个用逗号隔开',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=4096 COMMENT='商品sku多图';

-- ----------------------------
-- Records of tp_goods_sku_picture_delete
-- ----------------------------

-- ----------------------------
-- Table structure for tp_goods_spec
-- ----------------------------
DROP TABLE IF EXISTS `tp_goods_spec`;
CREATE TABLE `tp_goods_spec` (
  `spec_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '属性ID',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `spec_name` varchar(255) NOT NULL DEFAULT '' COMMENT '属性名称',
  `is_visible` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否可视',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` datetime NOT NULL COMMENT '创建日期',
  `show_type` int(11) NOT NULL DEFAULT '1' COMMENT '展示方式 1 文字 2 颜色 3 图片',
  PRIMARY KEY (`spec_id`),
  KEY `IDX_category_props_categoryId` (`shop_id`),
  KEY `IDX_category_props_orders` (`sort`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=3276 COMMENT='商品属性（规格）表';

-- ----------------------------
-- Records of tp_goods_spec
-- ----------------------------

-- ----------------------------
-- Table structure for tp_goods_spec_value
-- ----------------------------
DROP TABLE IF EXISTS `tp_goods_spec_value`;
CREATE TABLE `tp_goods_spec_value` (
  `spec_value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品属性值ID',
  `spec_id` int(11) NOT NULL COMMENT '商品属性ID',
  `spec_value_name` varchar(255) NOT NULL DEFAULT '' COMMENT '商品属性值名称',
  `spec_value_data` varchar(255) NOT NULL DEFAULT '' COMMENT '商品属性值数据',
  `is_visible` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否可视',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`spec_value_id`),
  KEY `IDX_category_propvalues_c_pId` (`spec_id`),
  KEY `IDX_category_propvalues_orders` (`sort`),
  KEY `IDX_category_propvalues_value` (`spec_value_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1092 COMMENT='商品规格值模版表';

-- ----------------------------
-- Records of tp_goods_spec_value
-- ----------------------------

-- ----------------------------
-- Table structure for tp_inform
-- ----------------------------
DROP TABLE IF EXISTS `tp_inform`;
CREATE TABLE `tp_inform` (
  `inform_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '举报id',
  `inform_member_id` int(11) NOT NULL COMMENT '举报人id',
  `inform_member_name` varchar(50) NOT NULL COMMENT '举报人会员名',
  `inform_goods_id` int(11) NOT NULL COMMENT '被举报的商品id',
  `inform_goods_name` varchar(100) NOT NULL COMMENT '被举报的商品名\n\n\n\n称',
  `inform_subject_id` int(11) NOT NULL COMMENT '举报主题id',
  `inform_subject_content` varchar(50) NOT NULL COMMENT '举报主题',
  `inform_content` varchar(100) NOT NULL COMMENT '举报信息',
  `inform_pic1` varchar(100) NOT NULL COMMENT '图片1',
  `inform_pic2` varchar(100) NOT NULL COMMENT '图片2',
  `inform_pic3` varchar(100) NOT NULL COMMENT '图片3',
  `inform_datetime` int(11) NOT NULL COMMENT '举报时间',
  `inform_store_id` int(11) NOT NULL COMMENT '被举报商品的店铺id',
  `inform_state` tinyint(4) NOT NULL COMMENT '举报状态(1未处理/2已处理\n\n\n\n)',
  `inform_handle_type` tinyint(4) NOT NULL COMMENT '举报处理结果(1无效\n\n\n\n举报/2恶意举报/3有效举报)',
  `inform_handle_message` varchar(100) NOT NULL COMMENT '举报处理信\n\n\n\n息',
  `inform_handle_datetime` int(11) NOT NULL DEFAULT '0' COMMENT '举报处\n\n\n\n理时间',
  `inform_handle_member_id` int(11) NOT NULL DEFAULT '0' COMMENT '管理员\n\n\n\nid',
  `inform_goods_image` varchar(150) DEFAULT NULL COMMENT '商品图',
  `inform_store_name` varchar(100) DEFAULT NULL COMMENT '店铺名',
  PRIMARY KEY (`inform_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='举报表';

-- ----------------------------
-- Records of tp_inform
-- ----------------------------

-- ----------------------------
-- Table structure for tp_inform_subject
-- ----------------------------
DROP TABLE IF EXISTS `tp_inform_subject`;
CREATE TABLE `tp_inform_subject` (
  `inform_subject_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '举报主\n\n\n\n题id',
  `inform_subject_content` varchar(100) NOT NULL COMMENT '举报主题内容\n\n\n\n',
  `inform_subject_type_id` int(11) NOT NULL COMMENT '举报类型id',
  `inform_subject_type_name` varchar(50) NOT NULL COMMENT '举报类型名\n\n\n\n称 ',
  `inform_subject_state` tinyint(11) NOT NULL COMMENT '举报主题状态(1\n\n\n\n可用/2失效)',
  PRIMARY KEY (`inform_subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=3276 COMMENT='举报主题表';

-- ----------------------------
-- Records of tp_inform_subject
-- ----------------------------

-- ----------------------------
-- Table structure for tp_inform_subject_type
-- ----------------------------
DROP TABLE IF EXISTS `tp_inform_subject_type`;
CREATE TABLE `tp_inform_subject_type` (
  `inform_type_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '举报类型\n\n\n\nid',
  `inform_type_name` varchar(50) NOT NULL COMMENT '举报类型名称 ',
  `inform_type_desc` varchar(100) NOT NULL COMMENT '举报类型描述',
  `inform_type_state` tinyint(4) NOT NULL COMMENT '举报类型状态(1有\n\n\n\n效/2失效)',
  PRIMARY KEY (`inform_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192 COMMENT='举报类型表';

-- ----------------------------
-- Records of tp_inform_subject_type
-- ----------------------------

-- ----------------------------
-- Table structure for tp_instance
-- ----------------------------
DROP TABLE IF EXISTS `tp_instance`;
CREATE TABLE `tp_instance` (
  `instance_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `instance_name` varchar(50) NOT NULL DEFAULT '' COMMENT '实例名',
  `instance_typeid` int(11) NOT NULL DEFAULT '2' COMMENT '实例类型ID',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `qrcode` varchar(255) NOT NULL DEFAULT '' COMMENT '实例二维码',
  `remark` text COMMENT '实例简介',
  PRIMARY KEY (`instance_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1365 COMMENT='系统实例表';

-- ----------------------------
-- Records of tp_instance
-- ----------------------------
INSERT INTO `tp_instance` VALUES ('19', 'Niushop开源商城', '1', '2016-10-27 12:03:38', '', '\'\'');
INSERT INTO `tp_instance` VALUES ('41', '店小二', '1', '2017-07-14 10:07:39', '', null);
INSERT INTO `tp_instance` VALUES ('42', '苏泊尔家电', '1', '2017-07-17 20:02:59', '', null);

-- ----------------------------
-- Table structure for tp_instance_type
-- ----------------------------
DROP TABLE IF EXISTS `tp_instance_type`;
CREATE TABLE `tp_instance_type` (
  `instance_typeid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '实例类型ID',
  `type_name` varchar(50) NOT NULL DEFAULT '' COMMENT '实例类型名称',
  `type_module_array` text NOT NULL COMMENT '实例类型权限',
  `type_desc` text NOT NULL COMMENT '实例类型说明',
  `type_sort` int(11) NOT NULL DEFAULT '1' COMMENT '排序号',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `modify_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`instance_typeid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192 COMMENT='实例类型';

-- ----------------------------
-- Records of tp_instance_type
-- ----------------------------
INSERT INTO `tp_instance_type` VALUES ('1', '直营店铺', '120,121,122,123,129,126,127,144,360,128,133,149,139,169,151,171,172,210,334,478,516,517,179,180,186,187,195,196,197,198,199,200,201,202,203,446,469,184,185,190,194,189,191,192,487,533,534,471,472,528,529,530,218,418,474,678,679,680,10006,409,403,405,454,457,459,462,463,460,684,726,727,729,730,732,467,515', '', '1', '0000-00-00 00:00:00', '2017-07-10 14:49:04');
INSERT INTO `tp_instance_type` VALUES ('2', '加盟店铺', '120,121,122,123,129,126,127,144,360,128,133,149,139,169,151,171,172,210,334,478,516,517,179,180,186,187,195,196,197,198,199,200,201,202,203,446,469,184,185,190,194,189,191,192,487,533,534,471,472,528,529,530,218,418,474,678,679,680,10006,409,403,405,454,457,459,462,463,460,684,726,727,729,730,732,467,515', '', '2', '2017-07-10 14:48:28', '2017-07-13 11:58:23');

-- ----------------------------
-- Table structure for tp_member
-- ----------------------------
DROP TABLE IF EXISTS `tp_member`;
CREATE TABLE `tp_member` (
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `member_name` varchar(50) NOT NULL DEFAULT '' COMMENT '前台用户名',
  `member_level` int(11) NOT NULL DEFAULT '0' COMMENT '会员等级',
  `reg_time` datetime NOT NULL COMMENT '注册时间',
  `memo` varchar(1000) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=147 COMMENT='前台用户表';

-- ----------------------------
-- Records of tp_member
-- ----------------------------
INSERT INTO `tp_member` VALUES ('63', 'lg', '3', '2017-06-13 19:56:30', null);
INSERT INTO `tp_member` VALUES ('85', 'admin123', '47', '2017-06-14 16:15:05', null);
INSERT INTO `tp_member` VALUES ('87', 'admin', '3', '2017-06-14 17:16:40', null);
INSERT INTO `tp_member` VALUES ('94', '库管小李', '47', '2017-06-14 19:40:13', null);
INSERT INTO `tp_member` VALUES ('97', 'aaa', '2', '2017-06-15 14:14:03', null);
INSERT INTO `tp_member` VALUES ('98', 'gaowei654', '47', '2017-06-15 14:57:36', null);
INSERT INTO `tp_member` VALUES ('101', '45sdfsdf', '47', '2017-06-15 18:47:59', null);
INSERT INTO `tp_member` VALUES ('102', 'wyc123', '47', '2017-06-15 18:51:44', null);
INSERT INTO `tp_member` VALUES ('103', 'wzy', '47', '2017-06-16 18:41:32', null);
INSERT INTO `tp_member` VALUES ('139', '187abc', '47', '2017-06-20 12:35:55', null);
INSERT INTO `tp_member` VALUES ('140', 'aaa123', '47', '2017-06-20 14:18:56', null);
INSERT INTO `tp_member` VALUES ('141', '', '47', '2017-06-20 18:18:50', null);
INSERT INTO `tp_member` VALUES ('142', 'wyctest', '47', '2017-06-20 18:19:21', null);
INSERT INTO `tp_member` VALUES ('143', 'gaowei222333', '47', '2017-06-20 18:15:46', null);
INSERT INTO `tp_member` VALUES ('144', 'gaowei5555', '47', '2017-06-20 18:16:30', null);
INSERT INTO `tp_member` VALUES ('145', '', '47', '2017-06-20 18:25:32', null);
INSERT INTO `tp_member` VALUES ('149', '11111111111111111', '2', '2017-06-20 19:08:40', null);
INSERT INTO `tp_member` VALUES ('150', '33333333333333', '2', '2017-06-20 19:08:57', null);
INSERT INTO `tp_member` VALUES ('151', '44444444444', '2', '2017-06-20 19:09:44', null);
INSERT INTO `tp_member` VALUES ('152', '', '47', '2017-06-20 19:06:49', null);
INSERT INTO `tp_member` VALUES ('153', 'abc123', '47', '2017-06-20 19:27:50', null);
INSERT INTO `tp_member` VALUES ('154', '', '47', '2017-06-20 19:33:19', null);
INSERT INTO `tp_member` VALUES ('155', '', '47', '2017-06-20 19:37:09', null);
INSERT INTO `tp_member` VALUES ('156', '', '47', '2017-06-20 19:38:18', null);
INSERT INTO `tp_member` VALUES ('157', '', '47', '2017-06-20 19:50:08', null);
INSERT INTO `tp_member` VALUES ('158', '', '47', '2017-06-20 19:52:27', null);
INSERT INTO `tp_member` VALUES ('159', '', '47', '2017-06-20 20:20:43', null);
INSERT INTO `tp_member` VALUES ('160', '', '47', '2017-06-20 20:27:42', null);
INSERT INTO `tp_member` VALUES ('161', '', '47', '2017-06-20 20:33:03', null);
INSERT INTO `tp_member` VALUES ('162', '', '47', '2017-06-20 20:53:08', null);
INSERT INTO `tp_member` VALUES ('163', '', '47', '2017-06-20 20:55:27', null);
INSERT INTO `tp_member` VALUES ('164', '', '47', '2017-06-20 20:57:24', null);
INSERT INTO `tp_member` VALUES ('165', '', '47', '2017-06-20 21:02:19', null);
INSERT INTO `tp_member` VALUES ('166', '', '47', '2017-06-20 21:06:15', null);
INSERT INTO `tp_member` VALUES ('167', '', '47', '2017-06-20 21:07:26', null);
INSERT INTO `tp_member` VALUES ('168', '', '47', '2017-06-20 21:08:06', null);
INSERT INTO `tp_member` VALUES ('169', '', '47', '2017-06-20 21:09:04', null);
INSERT INTO `tp_member` VALUES ('170', '', '47', '2017-06-20 21:10:02', null);
INSERT INTO `tp_member` VALUES ('171', '', '47', '2017-06-20 21:10:38', null);
INSERT INTO `tp_member` VALUES ('172', '', '47', '2017-06-20 21:13:10', null);
INSERT INTO `tp_member` VALUES ('173', '', '47', '2017-06-20 21:15:41', null);
INSERT INTO `tp_member` VALUES ('174', '', '47', '2017-06-20 21:18:38', null);
INSERT INTO `tp_member` VALUES ('175', '', '47', '2017-06-20 21:19:25', null);
INSERT INTO `tp_member` VALUES ('176', '', '47', '2017-06-21 08:54:39', null);
INSERT INTO `tp_member` VALUES ('177', '', '47', '2017-06-21 11:44:09', null);
INSERT INTO `tp_member` VALUES ('178', '', '47', '2017-06-21 12:03:31', null);
INSERT INTO `tp_member` VALUES ('179', '', '47', '2017-06-21 12:06:48', null);
INSERT INTO `tp_member` VALUES ('180', '', '47', '2017-06-21 12:08:47', null);
INSERT INTO `tp_member` VALUES ('185', '', '47', '2017-06-21 17:40:05', null);
INSERT INTO `tp_member` VALUES ('186', '', '22', '2017-06-22 09:59:07', null);
INSERT INTO `tp_member` VALUES ('187', 'jjjjj', '47', '2017-06-22 11:21:41', null);
INSERT INTO `tp_member` VALUES ('188', 'gaowei123', '47', '2017-06-22 14:45:15', null);
INSERT INTO `tp_member` VALUES ('189', 'de3', '47', '2017-06-22 14:51:22', null);
INSERT INTO `tp_member` VALUES ('190', '', '47', '2017-06-22 14:53:08', null);
INSERT INTO `tp_member` VALUES ('191', 'wyctest123', '47', '2017-06-22 15:01:54', null);
INSERT INTO `tp_member` VALUES ('192', '', '47', '2017-06-22 15:04:14', null);
INSERT INTO `tp_member` VALUES ('193', '', '47', '2017-06-22 15:01:33', null);
INSERT INTO `tp_member` VALUES ('194', '', '47', '2017-06-22 15:14:40', null);
INSERT INTO `tp_member` VALUES ('195', '', '47', '2017-06-22 15:27:42', null);
INSERT INTO `tp_member` VALUES ('196', 'gaowei1233', '47', '2017-06-22 15:42:09', null);
INSERT INTO `tp_member` VALUES ('197', 'wyc321', '47', '2017-06-22 16:13:06', null);
INSERT INTO `tp_member` VALUES ('198', 'wyc321123', '47', '2017-06-22 16:13:53', null);
INSERT INTO `tp_member` VALUES ('199', 'wyctest10', '47', '2017-06-22 16:14:47', null);
INSERT INTO `tp_member` VALUES ('200', 'wyctext1', '47', '2017-06-22 16:15:37', null);
INSERT INTO `tp_member` VALUES ('201', 'wyctext2', '47', '2017-06-22 16:16:22', null);
INSERT INTO `tp_member` VALUES ('202', 'wyctext3', '47', '2017-06-22 16:17:15', null);
INSERT INTO `tp_member` VALUES ('203', 'wyctest5', '47', '2017-06-22 16:18:58', null);
INSERT INTO `tp_member` VALUES ('204', '', '47', '2017-06-22 16:24:51', null);
INSERT INTO `tp_member` VALUES ('205', 'gaowei789', '47', '2017-06-22 16:17:02', null);
INSERT INTO `tp_member` VALUES ('206', '', '47', '2017-06-22 16:18:42', null);
INSERT INTO `tp_member` VALUES ('207', '', '47', '2017-06-22 16:48:31', null);
INSERT INTO `tp_member` VALUES ('208', 'test', '47', '2017-06-22 17:08:19', null);
INSERT INTO `tp_member` VALUES ('209', '', '47', '2017-06-22 16:58:23', null);
INSERT INTO `tp_member` VALUES ('210', '', '47', '2017-06-22 17:00:49', null);
INSERT INTO `tp_member` VALUES ('211', '', '47', '2017-06-22 17:01:35', null);
INSERT INTO `tp_member` VALUES ('212', '', '47', '2017-06-22 17:03:12', null);
INSERT INTO `tp_member` VALUES ('213', '', '47', '2017-06-22 17:03:43', null);
INSERT INTO `tp_member` VALUES ('214', '', '47', '2017-06-22 17:05:05', null);
INSERT INTO `tp_member` VALUES ('218', 'ceshiyonghuming', '2', '2017-06-22 17:41:40', null);
INSERT INTO `tp_member` VALUES ('219', '', '47', '2017-06-22 17:49:39', null);
INSERT INTO `tp_member` VALUES ('220', 'yonghuming2', '2', '2017-06-22 18:01:38', null);
INSERT INTO `tp_member` VALUES ('221', '', '47', '2017-06-22 17:56:20', null);
INSERT INTO `tp_member` VALUES ('222', '', '47', '2017-06-22 18:06:03', null);
INSERT INTO `tp_member` VALUES ('223', '', '47', '2017-06-22 18:12:20', null);
INSERT INTO `tp_member` VALUES ('224', 'gw333333', '3', '2017-06-22 18:24:06', null);
INSERT INTO `tp_member` VALUES ('225', 'gw888', '47', '2017-06-22 18:43:46', null);
INSERT INTO `tp_member` VALUES ('226', '', '47', '2017-06-22 18:45:53', null);
INSERT INTO `tp_member` VALUES ('227', '', '47', '2017-06-22 18:49:10', null);
INSERT INTO `tp_member` VALUES ('228', '111111111111111', '47', '2017-06-22 19:31:18', null);
INSERT INTO `tp_member` VALUES ('229', '18734824089aaa', '47', '2017-06-22 19:35:04', null);
INSERT INTO `tp_member` VALUES ('232', 'zhuoqiyu', '2', '2017-06-23 19:32:38', null);
INSERT INTO `tp_member` VALUES ('233', '', '47', '2017-06-28 09:29:01', null);
INSERT INTO `tp_member` VALUES ('234', 'gw', '2', '2017-06-28 10:53:24', null);
INSERT INTO `tp_member` VALUES ('248', 'gg333333', '47', '2017-06-29 12:25:50', null);
INSERT INTO `tp_member` VALUES ('255', 'qw11111', '47', '2017-06-30 10:24:18', null);
INSERT INTO `tp_member` VALUES ('256', 'ggggg122121', '47', '2017-06-30 10:27:40', null);
INSERT INTO `tp_member` VALUES ('257', 'dfgdfgdf', '47', '2017-06-30 12:22:32', null);
INSERT INTO `tp_member` VALUES ('258', 'sdfsdfdsf', '47', '2017-06-30 12:23:33', null);
INSERT INTO `tp_member` VALUES ('259', 'fghgfhgf', '47', '2017-06-30 12:25:05', null);
INSERT INTO `tp_member` VALUES ('260', 'sfdsfsdf', '47', '2017-06-30 12:25:52', null);
INSERT INTO `tp_member` VALUES ('261', 'sadsad', '47', '2017-06-30 12:26:49', null);
INSERT INTO `tp_member` VALUES ('262', 'fgsgsdfsd', '47', '2017-06-30 12:27:27', null);
INSERT INTO `tp_member` VALUES ('263', 'dfgdfg', '47', '2017-06-30 12:28:14', null);
INSERT INTO `tp_member` VALUES ('264', '', '47', '2017-06-30 12:29:25', null);
INSERT INTO `tp_member` VALUES ('265', 'jkgjghj', '47', '2017-06-30 12:32:06', null);
INSERT INTO `tp_member` VALUES ('266', 'ghj', '47', '2017-06-30 12:33:40', null);
INSERT INTO `tp_member` VALUES ('268', 'sdfsdf', '47', '2017-06-30 12:40:54', null);
INSERT INTO `tp_member` VALUES ('269', 'fdsfdsa', '47', '2017-06-30 14:19:19', null);
INSERT INTO `tp_member` VALUES ('270', 'sdfuu', '47', '2017-06-30 14:46:39', null);
INSERT INTO `tp_member` VALUES ('271', 'gaowei123456', '47', '2017-06-30 15:53:36', null);
INSERT INTO `tp_member` VALUES ('272', '', '47', '2017-06-30 15:55:10', null);
INSERT INTO `tp_member` VALUES ('273', 'dsfgsdf', '47', '2017-06-30 17:48:15', null);
INSERT INTO `tp_member` VALUES ('274', '', '47', '2017-06-30 19:14:28', null);
INSERT INTO `tp_member` VALUES ('275', 'asd5', '47', '2017-06-30 19:19:12', null);
INSERT INTO `tp_member` VALUES ('276', 'xcvxcvxcvxcv', '47', '2017-06-30 19:42:32', null);
INSERT INTO `tp_member` VALUES ('277', 'zkfuser', '47', '2017-07-01 15:34:14', null);
INSERT INTO `tp_member` VALUES ('278', 'adminzkf', '47', '2017-07-01 15:46:32', null);
INSERT INTO `tp_member` VALUES ('279', 'fdgsfg', '47', '2017-07-01 15:54:26', null);
INSERT INTO `tp_member` VALUES ('280', 'zkfadmin', '47', '2017-07-01 15:54:51', null);
INSERT INTO `tp_member` VALUES ('281', 'zzzshop', '47', '2017-07-01 16:00:51', null);
INSERT INTO `tp_member` VALUES ('282', 'aaaaaaa', '47', '2017-07-01 16:03:13', null);
INSERT INTO `tp_member` VALUES ('283', 'bbbbbbbb', '47', '2017-07-01 17:30:23', null);
INSERT INTO `tp_member` VALUES ('284', 'lg111', '47', '2017-07-04 18:23:02', null);
INSERT INTO `tp_member` VALUES ('285', 'kkkkkk', '2', '2017-07-10 18:11:05', null);
INSERT INTO `tp_member` VALUES ('290', 'abc123', '47', '2017-07-12 14:52:38', null);
INSERT INTO `tp_member` VALUES ('291', 'ccc123', '47', '2017-07-14 10:59:48', null);
INSERT INTO `tp_member` VALUES ('292', 'cc123', '47', '2017-07-17 19:46:32', null);
INSERT INTO `tp_member` VALUES ('293', 'admin', '47', '2017-08-26 09:03:27', '');
INSERT INTO `tp_member` VALUES ('294', 'asdfg', '47', '2017-08-31 19:36:49', null);

-- ----------------------------
-- Table structure for tp_member_account
-- ----------------------------
DROP TABLE IF EXISTS `tp_member_account`;
CREATE TABLE `tp_member_account` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '会员uid',
  `shop_id` int(11) NOT NULL COMMENT '店铺ID',
  `point` int(11) NOT NULL DEFAULT '0' COMMENT '会员积分',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '余额',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '购物币',
  `member_cunsum` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '会员消费',
  `member_sum_point` int(11) NOT NULL DEFAULT '0' COMMENT '会员累计积分',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=3276 COMMENT='会员账户统计表';

-- ----------------------------
-- Records of tp_member_account
-- ----------------------------
INSERT INTO `tp_member_account` VALUES ('27', '87', '0', '1220', '194711.56', '0', '9186.80', '2281');
INSERT INTO `tp_member_account` VALUES ('29', '98', '0', '1000', '0.00', '0', '0.00', '1000');
INSERT INTO `tp_member_account` VALUES ('30', '63', '0', '790', '9992.00', '0', '4000.00', '1000');
INSERT INTO `tp_member_account` VALUES ('31', '113', '0', '10', '0.00', '0', '0.00', '20');
INSERT INTO `tp_member_account` VALUES ('32', '110', '0', '19', '0.02', '0', '0.00', '20');
INSERT INTO `tp_member_account` VALUES ('33', '180', '0', '10', '0.00', '0', '0.00', '10');
INSERT INTO `tp_member_account` VALUES ('35', '208', '0', '99', '0.00', '0', '510.00', '179');
INSERT INTO `tp_member_account` VALUES ('36', '210', '0', '5', '0.00', '0', '0.00', '5');
INSERT INTO `tp_member_account` VALUES ('37', '227', '0', '0', '1.00', '0', '0.00', '0');
INSERT INTO `tp_member_account` VALUES ('38', '226', '0', '12', '0.00', '0', '0.00', '12');
INSERT INTO `tp_member_account` VALUES ('39', '1', '0', '0', '0.00', '0', '0.00', '0');
INSERT INTO `tp_member_account` VALUES ('40', '48', '0', '0', '0.00', '0', '0.00', '0');
INSERT INTO `tp_member_account` VALUES ('41', '103', '0', '0', '0.00', '0', '0.00', '0');
INSERT INTO `tp_member_account` VALUES ('42', '233', '0', '100', '500.00', '0', '0.00', '100');
INSERT INTO `tp_member_account` VALUES ('45', '290', '0', '35', '10.00', '0', '0.00', '35');
INSERT INTO `tp_member_account` VALUES ('46', '291', '0', '90', '90.00', '0', '0.00', '100');
INSERT INTO `tp_member_account` VALUES ('47', '292', '0', '10', '0.00', '0', '0.00', '10');
INSERT INTO `tp_member_account` VALUES ('48', '294', '0', '10', '0.00', '0', '0.00', '10');

-- ----------------------------
-- Table structure for tp_member_account_records
-- ----------------------------
DROP TABLE IF EXISTS `tp_member_account_records`;
CREATE TABLE `tp_member_account_records` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `account_type` int(11) NOT NULL DEFAULT '1' COMMENT '账户类型1.积分2.余额3.购物币',
  `sign` smallint(6) NOT NULL DEFAULT '1' COMMENT '正负号',
  `number` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '数量',
  `from_type` smallint(6) NOT NULL DEFAULT '0' COMMENT '产生方式1.商城订单2.订单退还3.兑换4.充值5.签到6.分享7.注册8.提现9提现退还',
  `data_id` int(11) NOT NULL DEFAULT '0' COMMENT '相关表的数据ID',
  `text` varchar(255) NOT NULL DEFAULT '' COMMENT '数据相关内容描述文本',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=690 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=108 COMMENT='会员流水账表';

-- ----------------------------
-- Records of tp_member_account_records
-- ----------------------------
INSERT INTO `tp_member_account_records` VALUES ('421', '87', '0', '1', '1', '10.00', '4', '0', '', '2017-06-12 09:48:16');
INSERT INTO `tp_member_account_records` VALUES ('422', '87', '0', '2', '1', '10.00', '4', '0', '', '2017-06-12 09:48:28');
INSERT INTO `tp_member_account_records` VALUES ('423', '87', '0', '1', '1', '20.00', '4', '0', '20', '2017-06-12 14:31:18');
INSERT INTO `tp_member_account_records` VALUES ('424', '87', '0', '1', '1', '10.00', '10', '0', '测试', '2017-06-12 14:41:09');
INSERT INTO `tp_member_account_records` VALUES ('425', '87', '0', '2', '1', '-10.00', '10', '0', '测试调整', '2017-06-12 14:44:04');
INSERT INTO `tp_member_account_records` VALUES ('426', '87', '0', '2', '1', '100.00', '10', '0', '测试', '2017-06-12 18:22:28');
INSERT INTO `tp_member_account_records` VALUES ('427', '87', '0', '2', '0', '-0.01', '1', '555', '商城订单', '2017-06-12 18:27:53');
INSERT INTO `tp_member_account_records` VALUES ('428', '87', '0', '1', '1', '0.00', '1', '534', '订单商品赠送积分', '2017-06-13 15:39:28');
INSERT INTO `tp_member_account_records` VALUES ('429', '87', '0', '2', '1', '200000.00', '10', '0', '', '2017-06-13 15:49:59');
INSERT INTO `tp_member_account_records` VALUES ('430', '87', '0', '2', '0', '-100.00', '1', '568', '商城订单', '2017-06-13 15:50:14');
INSERT INTO `tp_member_account_records` VALUES ('431', '87', '0', '1', '1', '0.00', '1', '568', '订单商品赠送积分', '2017-06-13 15:54:47');
INSERT INTO `tp_member_account_records` VALUES ('432', '87', '0', '2', '0', '-100.00', '8', '1', '会员余额提现', '2017-06-13 16:55:13');
INSERT INTO `tp_member_account_records` VALUES ('433', '87', '0', '2', '0', '-100.00', '8', '2', '会员余额提现', '2017-06-13 18:31:44');
INSERT INTO `tp_member_account_records` VALUES ('434', '87', '0', '2', '0', '-1000.00', '8', '3', '会员余额提现', '2017-06-13 18:57:55');
INSERT INTO `tp_member_account_records` VALUES ('438', '87', '0', '1', '1', '0.00', '1', '588', '订单商品赠送积分', '2017-06-15 11:44:55');
INSERT INTO `tp_member_account_records` VALUES ('439', '87', '0', '1', '1', '0.00', '1', '585', '订单商品赠送积分', '2017-06-15 12:07:18');
INSERT INTO `tp_member_account_records` VALUES ('441', '87', '0', '2', '0', '-360.00', '1', '593', '商城订单', '2017-06-15 15:01:48');
INSERT INTO `tp_member_account_records` VALUES ('442', '87', '0', '2', '0', '-100.00', '1', '596', '商城订单', '2017-06-15 15:44:18');
INSERT INTO `tp_member_account_records` VALUES ('443', '87', '0', '2', '0', '-360.00', '1', '597', '商城订单', '2017-06-15 15:48:22');
INSERT INTO `tp_member_account_records` VALUES ('444', '87', '0', '1', '1', '100.00', '2', '596', '商城订单关闭返还平台余额', '2017-06-15 15:56:36');
INSERT INTO `tp_member_account_records` VALUES ('445', '98', '0', '1', '1', '1000.00', '10', '0', '', '2017-06-15 16:04:43');
INSERT INTO `tp_member_account_records` VALUES ('446', '63', '0', '1', '1', '1000.00', '10', '0', '', '2017-06-15 16:05:31');
INSERT INTO `tp_member_account_records` VALUES ('447', '63', '0', '1', '0', '-200.00', '3', '0', '积分兑换余额', '2017-06-15 16:06:34');
INSERT INTO `tp_member_account_records` VALUES ('448', '63', '0', '2', '1', '0.00', '3', '0', '积分兑换余额', '2017-06-15 16:06:34');
INSERT INTO `tp_member_account_records` VALUES ('449', '87', '0', '1', '0', '-10.00', '3', '0', '积分兑换余额', '2017-06-15 16:16:33');
INSERT INTO `tp_member_account_records` VALUES ('450', '87', '0', '2', '1', '0.10', '3', '0', '积分兑换余额', '2017-06-15 16:16:34');
INSERT INTO `tp_member_account_records` VALUES ('451', '87', '0', '1', '0', '-1.00', '3', '0', '积分兑换余额', '2017-06-15 16:19:27');
INSERT INTO `tp_member_account_records` VALUES ('452', '87', '0', '2', '1', '0.01', '3', '0', '积分兑换余额', '2017-06-15 16:19:27');
INSERT INTO `tp_member_account_records` VALUES ('453', '87', '0', '1', '0', '-9.00', '3', '0', '积分兑换余额', '2017-06-15 16:23:16');
INSERT INTO `tp_member_account_records` VALUES ('454', '87', '0', '2', '1', '0.09', '3', '0', '积分兑换余额', '2017-06-15 16:23:16');
INSERT INTO `tp_member_account_records` VALUES ('455', '87', '0', '1', '0', '-1.00', '3', '0', '积分兑换余额', '2017-06-15 16:24:25');
INSERT INTO `tp_member_account_records` VALUES ('456', '87', '0', '2', '1', '0.01', '3', '0', '积分兑换余额', '2017-06-15 16:24:26');
INSERT INTO `tp_member_account_records` VALUES ('457', '87', '0', '1', '0', '-1.00', '3', '0', '积分兑换余额', '2017-06-15 16:31:44');
INSERT INTO `tp_member_account_records` VALUES ('458', '87', '0', '2', '1', '0.01', '3', '0', '积分兑换余额', '2017-06-15 16:31:45');
INSERT INTO `tp_member_account_records` VALUES ('459', '87', '0', '1', '0', '-10.00', '1', '602', '商城订单', '2017-06-15 16:51:56');
INSERT INTO `tp_member_account_records` VALUES ('460', '87', '0', '1', '1', '10.00', '2', '602', '订单关闭返还积分', '2017-06-15 17:03:36');
INSERT INTO `tp_member_account_records` VALUES ('461', '87', '0', '1', '1', '10.00', '5', '0', '签到赠送积分', '2017-06-15 17:17:10');
INSERT INTO `tp_member_account_records` VALUES ('462', '87', '0', '2', '0', '-1.00', '1', '603', '商城订单', '2017-06-15 17:52:06');
INSERT INTO `tp_member_account_records` VALUES ('463', '87', '0', '1', '1', '1.00', '2', '603', '商城订单关闭返还平台余额', '2017-06-15 17:57:22');
INSERT INTO `tp_member_account_records` VALUES ('464', '87', '0', '2', '0', '-710.00', '1', '607', '商城订单', '2017-06-15 18:06:08');
INSERT INTO `tp_member_account_records` VALUES ('465', '87', '0', '2', '0', '-358.00', '1', '612', '商城订单', '2017-06-16 09:58:56');
INSERT INTO `tp_member_account_records` VALUES ('466', '87', '0', '2', '0', '-358.00', '1', '613', '商城订单', '2017-06-16 09:59:19');
INSERT INTO `tp_member_account_records` VALUES ('467', '87', '0', '2', '1', '358.00', '2', '612', '商城订单关闭返还平台余额', '2017-06-16 10:04:28');
INSERT INTO `tp_member_account_records` VALUES ('468', '87', '0', '2', '1', '358.00', '2', '613', '商城订单关闭返还平台余额', '2017-06-16 10:04:28');
INSERT INTO `tp_member_account_records` VALUES ('469', '87', '0', '1', '1', '0.00', '1', '655', '订单商品赠送积分', '2017-06-16 15:37:19');
INSERT INTO `tp_member_account_records` VALUES ('470', '87', '0', '2', '0', '-80.00', '1', '660', '商城订单', '2017-06-16 17:48:03');
INSERT INTO `tp_member_account_records` VALUES ('472', '87', '0', '1', '1', '10.00', '5', '0', '签到赠送积分', '2017-06-17 11:47:34');
INSERT INTO `tp_member_account_records` VALUES ('473', '87', '0', '1', '0', '-10.00', '1', '670', '商城订单', '2017-06-17 14:43:11');
INSERT INTO `tp_member_account_records` VALUES ('474', '87', '0', '2', '0', '-2.00', '1', '670', '商城订单', '2017-06-17 14:43:11');
INSERT INTO `tp_member_account_records` VALUES ('475', '87', '0', '1', '1', '10.00', '2', '670', '订单关闭返还积分', '2017-06-17 14:48:28');
INSERT INTO `tp_member_account_records` VALUES ('476', '87', '0', '1', '1', '2.00', '2', '670', '商城订单关闭返还平台余额', '2017-06-17 14:48:28');
INSERT INTO `tp_member_account_records` VALUES ('477', '87', '0', '2', '0', '-290.00', '1', '671', '商城订单', '2017-06-17 15:25:58');
INSERT INTO `tp_member_account_records` VALUES ('478', '87', '0', '2', '0', '-10.00', '1', '673', '商城订单', '2017-06-17 15:27:51');
INSERT INTO `tp_member_account_records` VALUES ('479', '87', '0', '1', '1', '10.00', '2', '673', '商城订单关闭返还平台余额', '2017-06-17 15:32:53');
INSERT INTO `tp_member_account_records` VALUES ('480', '87', '0', '1', '0', '-10.00', '1', '674', '商城订单', '2017-06-17 15:39:29');
INSERT INTO `tp_member_account_records` VALUES ('481', '87', '0', '1', '1', '10.00', '2', '674', '订单关闭返还积分', '2017-06-17 15:44:59');
INSERT INTO `tp_member_account_records` VALUES ('482', '87', '0', '2', '0', '-100.00', '8', '4', '会员余额提现', '2017-06-17 16:27:43');
INSERT INTO `tp_member_account_records` VALUES ('483', '87', '0', '2', '0', '-100.00', '8', '5', '会员余额提现', '2017-06-17 16:27:53');
INSERT INTO `tp_member_account_records` VALUES ('484', '87', '0', '1', '0', '-10.00', '1', '677', '商城订单', '2017-06-17 17:19:30');
INSERT INTO `tp_member_account_records` VALUES ('485', '87', '0', '1', '1', '10.00', '2', '677', '订单关闭返还积分', '2017-06-17 17:24:41');
INSERT INTO `tp_member_account_records` VALUES ('486', '63', '0', '1', '1', '0.00', '1', '678', '订单商品赠送积分', '2017-06-17 17:28:56');
INSERT INTO `tp_member_account_records` VALUES ('487', '63', '0', '1', '1', '0.00', '1', '679', '订单商品赠送积分', '2017-06-17 17:42:05');
INSERT INTO `tp_member_account_records` VALUES ('488', '63', '0', '1', '1', '0.00', '1', '678', '订单商品赠送积分', '2017-06-17 17:44:55');
INSERT INTO `tp_member_account_records` VALUES ('489', '63', '0', '1', '1', '0.00', '1', '679', '订单商品赠送积分', '2017-06-17 17:50:52');
INSERT INTO `tp_member_account_records` VALUES ('490', '63', '0', '1', '1', '0.00', '1', '679', '订单商品赠送积分', '2017-06-17 17:52:04');
INSERT INTO `tp_member_account_records` VALUES ('491', '63', '0', '1', '1', '0.00', '1', '679', '订单商品赠送积分', '2017-06-17 17:56:24');
INSERT INTO `tp_member_account_records` VALUES ('492', '63', '0', '1', '1', '0.00', '1', '679', '订单商品赠送积分', '2017-06-17 17:57:20');
INSERT INTO `tp_member_account_records` VALUES ('493', '63', '0', '1', '1', '0.00', '1', '678', '订单商品赠送积分', '2017-06-17 17:58:25');
INSERT INTO `tp_member_account_records` VALUES ('494', '63', '0', '1', '1', '0.00', '1', '678', '订单商品赠送积分', '2017-06-17 18:00:13');
INSERT INTO `tp_member_account_records` VALUES ('495', '63', '0', '1', '1', '0.00', '1', '679', '订单商品赠送积分', '2017-06-17 18:00:13');
INSERT INTO `tp_member_account_records` VALUES ('496', '63', '0', '1', '1', '0.00', '1', '678', '订单商品赠送积分', '2017-06-17 18:01:16');
INSERT INTO `tp_member_account_records` VALUES ('497', '63', '0', '1', '1', '0.00', '1', '679', '订单商品赠送积分', '2017-06-17 18:01:16');
INSERT INTO `tp_member_account_records` VALUES ('498', '63', '0', '1', '1', '0.00', '1', '678', '订单商品赠送积分', '2017-06-17 18:04:13');
INSERT INTO `tp_member_account_records` VALUES ('499', '63', '0', '1', '1', '0.00', '1', '679', '订单商品赠送积分', '2017-06-17 18:04:14');
INSERT INTO `tp_member_account_records` VALUES ('500', '87', '0', '1', '0', '-10.00', '1', '680', '商城订单', '2017-06-17 19:02:36');
INSERT INTO `tp_member_account_records` VALUES ('501', '87', '0', '1', '1', '10.00', '2', '680', '订单关闭返还积分', '2017-06-17 19:07:43');
INSERT INTO `tp_member_account_records` VALUES ('502', '87', '0', '2', '0', '-500.00', '8', '6', '会员余额提现', '2017-06-17 19:35:14');
INSERT INTO `tp_member_account_records` VALUES ('503', '87', '0', '1', '0', '-10.00', '1', '686', '商城订单', '2017-06-17 19:41:28');
INSERT INTO `tp_member_account_records` VALUES ('504', '63', '0', '1', '1', '0.00', '1', '685', '订单商品赠送积分', '2017-06-17 19:41:44');
INSERT INTO `tp_member_account_records` VALUES ('505', '63', '0', '1', '1', '0.00', '1', '687', '订单商品赠送积分', '2017-06-17 19:44:41');
INSERT INTO `tp_member_account_records` VALUES ('506', '87', '0', '1', '1', '80.00', '2', '660', '商城订单关闭返还平台余额', '2017-06-17 19:44:50');
INSERT INTO `tp_member_account_records` VALUES ('507', '63', '0', '1', '1', '0.00', '1', '687', '订单商品赠送积分', '2017-06-17 19:46:28');
INSERT INTO `tp_member_account_records` VALUES ('508', '87', '0', '1', '1', '10.00', '2', '686', '订单关闭返还积分', '2017-06-17 20:10:27');
INSERT INTO `tp_member_account_records` VALUES ('509', '87', '0', '2', '0', '-50.00', '1', '688', '商城订单', '2017-06-17 20:10:51');
INSERT INTO `tp_member_account_records` VALUES ('510', '87', '0', '2', '1', '50.00', '2', '688', '商城订单关闭返还平台余额', '2017-06-17 20:11:12');
INSERT INTO `tp_member_account_records` VALUES ('511', '87', '0', '2', '0', '-1.00', '8', '7', '会员余额提现', '2017-06-17 20:19:33');
INSERT INTO `tp_member_account_records` VALUES ('512', '63', '0', '1', '1', '0.00', '1', '687', '订单商品赠送积分', '2017-06-19 11:06:22');
INSERT INTO `tp_member_account_records` VALUES ('513', '87', '0', '2', '0', '-250.00', '1', '696', '商城订单', '2017-06-19 11:49:48');
INSERT INTO `tp_member_account_records` VALUES ('514', '87', '0', '2', '0', '-250.00', '1', '697', '商城订单', '2017-06-19 11:51:04');
INSERT INTO `tp_member_account_records` VALUES ('515', '87', '0', '2', '0', '-1.00', '1', '699', '商城订单', '2017-06-19 15:23:10');
INSERT INTO `tp_member_account_records` VALUES ('516', '87', '0', '2', '0', '-70.00', '1', '700', '商城订单', '2017-06-19 15:28:16');
INSERT INTO `tp_member_account_records` VALUES ('517', '87', '0', '2', '0', '-80.00', '1', '701', '商城订单', '2017-06-19 15:28:37');
INSERT INTO `tp_member_account_records` VALUES ('518', '87', '0', '1', '1', '10.00', '5', '0', '签到赠送积分', '2017-06-19 15:32:56');
INSERT INTO `tp_member_account_records` VALUES ('519', '87', '0', '2', '0', '-140.00', '1', '702', '商城订单', '2017-06-19 15:55:21');
INSERT INTO `tp_member_account_records` VALUES ('520', '87', '0', '2', '1', '1.00', '2', '699', '商城订单关闭返还平台余额', '2017-06-19 16:24:01');
INSERT INTO `tp_member_account_records` VALUES ('521', '87', '0', '2', '0', '-170.00', '1', '705', '商城订单', '2017-06-19 16:24:11');
INSERT INTO `tp_member_account_records` VALUES ('522', '113', '0', '1', '1', '10.00', '5', '0', '签到赠送积分', '2017-06-19 16:34:27');
INSERT INTO `tp_member_account_records` VALUES ('523', '87', '0', '2', '0', '-250.00', '1', '706', '商城订单', '2017-06-19 16:48:12');
INSERT INTO `tp_member_account_records` VALUES ('524', '87', '0', '2', '0', '-140.00', '1', '707', '商城订单', '2017-06-19 16:51:38');
INSERT INTO `tp_member_account_records` VALUES ('525', '87', '0', '2', '0', '-230.00', '1', '710', '商城订单', '2017-06-19 17:06:50');
INSERT INTO `tp_member_account_records` VALUES ('526', '87', '0', '2', '0', '-140.00', '1', '711', '商城订单', '2017-06-19 17:07:14');
INSERT INTO `tp_member_account_records` VALUES ('527', '87', '0', '2', '0', '-90.00', '1', '712', '商城订单', '2017-06-19 17:10:14');
INSERT INTO `tp_member_account_records` VALUES ('528', '113', '0', '1', '0', '-10.00', '1', '714', '商城订单', '2017-06-19 17:24:48');
INSERT INTO `tp_member_account_records` VALUES ('529', '87', '0', '1', '1', '0.00', '1', '704', '订单商品赠送积分', '2017-06-19 17:39:34');
INSERT INTO `tp_member_account_records` VALUES ('530', '110', '0', '1', '1', '10.00', '5', '0', '签到赠送积分', '2017-06-19 18:23:02');
INSERT INTO `tp_member_account_records` VALUES ('531', '113', '0', '1', '1', '10.00', '2', '714', '订单关闭返还积分', '2017-06-19 18:26:25');
INSERT INTO `tp_member_account_records` VALUES ('532', '87', '0', '1', '1', '10.00', '5', '0', '签到赠送积分', '2017-06-20 09:07:24');
INSERT INTO `tp_member_account_records` VALUES ('533', '87', '0', '1', '0', '-10.00', '1', '719', '商城订单', '2017-06-20 09:30:32');
INSERT INTO `tp_member_account_records` VALUES ('534', '87', '0', '2', '0', '-8.00', '1', '719', '商城订单', '2017-06-20 09:30:33');
INSERT INTO `tp_member_account_records` VALUES ('535', '87', '0', '2', '0', '-222.20', '1', '727', '商城订单', '2017-06-20 14:59:11');
INSERT INTO `tp_member_account_records` VALUES ('536', '110', '0', '1', '0', '-1.00', '3', '0', '积分兑换余额', '2017-06-20 16:53:04');
INSERT INTO `tp_member_account_records` VALUES ('537', '110', '0', '2', '1', '0.02', '3', '0', '积分兑换余额', '2017-06-20 16:53:05');
INSERT INTO `tp_member_account_records` VALUES ('538', '110', '0', '1', '1', '10.00', '5', '0', '签到赠送积分', '2017-06-20 17:05:15');
INSERT INTO `tp_member_account_records` VALUES ('539', '87', '0', '2', '0', '-6.00', '1', '730', '商城订单', '2017-06-20 17:22:37');
INSERT INTO `tp_member_account_records` VALUES ('540', '87', '0', '2', '0', '-6.00', '1', '731', '商城订单', '2017-06-20 18:21:40');
INSERT INTO `tp_member_account_records` VALUES ('541', '87', '0', '2', '1', '6.00', '2', '730', '商城订单关闭返还平台余额', '2017-06-20 18:24:10');
INSERT INTO `tp_member_account_records` VALUES ('542', '87', '0', '2', '0', '-6.06', '1', '732', '商城订单', '2017-06-20 18:26:09');
INSERT INTO `tp_member_account_records` VALUES ('543', '87', '0', '1', '0', '-10.00', '1', '735', '商城订单', '2017-06-21 09:31:22');
INSERT INTO `tp_member_account_records` VALUES ('544', '87', '0', '1', '1', '10.00', '2', '735', '订单关闭返还积分', '2017-06-21 09:44:13');
INSERT INTO `tp_member_account_records` VALUES ('545', '87', '0', '1', '0', '-10.00', '1', '736', '商城订单', '2017-06-21 09:44:49');
INSERT INTO `tp_member_account_records` VALUES ('546', '87', '0', '1', '0', '-10.00', '1', '737', '商城订单', '2017-06-21 09:45:08');
INSERT INTO `tp_member_account_records` VALUES ('547', '87', '0', '1', '0', '-11.00', '3', '0', '积分兑换余额', '2017-06-21 09:48:17');
INSERT INTO `tp_member_account_records` VALUES ('548', '87', '0', '2', '1', '0.22', '3', '0', '积分兑换余额', '2017-06-21 09:48:18');
INSERT INTO `tp_member_account_records` VALUES ('549', '87', '0', '1', '1', '10.00', '5', '0', '签到赠送积分', '2017-06-21 14:05:21');
INSERT INTO `tp_member_account_records` VALUES ('550', '87', '0', '1', '1', '0.00', '1', '732', '订单商品赠送积分', '2017-06-21 15:44:28');
INSERT INTO `tp_member_account_records` VALUES ('551', '87', '0', '1', '1', '0.00', '1', '739', '订单商品赠送积分', '2017-06-21 15:44:29');
INSERT INTO `tp_member_account_records` VALUES ('552', '87', '0', '1', '1', '0.00', '1', '740', '订单商品赠送积分', '2017-06-21 15:44:29');
INSERT INTO `tp_member_account_records` VALUES ('553', '87', '0', '2', '0', '-16.60', '1', '749', '商城订单', '2017-06-21 19:59:31');
INSERT INTO `tp_member_account_records` VALUES ('554', '180', '0', '1', '1', '10.00', '5', '0', '签到赠送积分', '2017-06-22 09:56:18');
INSERT INTO `tp_member_account_records` VALUES ('555', '87', '0', '2', '0', '-10.00', '8', '8', '会员余额提现', '2017-06-22 14:26:48');
INSERT INTO `tp_member_account_records` VALUES ('565', '208', '0', '1', '1', '99.00', '10', '0', '', '2017-06-22 17:53:53');
INSERT INTO `tp_member_account_records` VALUES ('566', '208', '0', '1', '0', '-10.00', '1', '782', '商城订单', '2017-06-22 17:54:05');
INSERT INTO `tp_member_account_records` VALUES ('567', '208', '0', '1', '0', '-40.00', '1', '783', '商城订单', '2017-06-22 17:58:52');
INSERT INTO `tp_member_account_records` VALUES ('568', '208', '0', '1', '0', '-30.00', '1', '784', '商城订单', '2017-06-22 18:00:23');
INSERT INTO `tp_member_account_records` VALUES ('569', '208', '0', '1', '1', '10.00', '2', '782', '订单关闭返还积分', '2017-06-22 18:05:06');
INSERT INTO `tp_member_account_records` VALUES ('570', '208', '0', '1', '1', '40.00', '2', '783', '订单关闭返还积分', '2017-06-22 18:09:55');
INSERT INTO `tp_member_account_records` VALUES ('571', '208', '0', '1', '1', '30.00', '2', '784', '订单关闭返还积分', '2017-06-22 18:12:31');
INSERT INTO `tp_member_account_records` VALUES ('572', '87', '0', '1', '0', '-10.00', '1', '801', '商城订单', '2017-06-23 09:38:13');
INSERT INTO `tp_member_account_records` VALUES ('573', '87', '0', '1', '0', '-10.00', '1', '802', '商城订单', '2017-06-23 09:39:23');
INSERT INTO `tp_member_account_records` VALUES ('574', '87', '0', '1', '0', '-10.00', '1', '807', '商城订单', '2017-06-23 11:24:08');
INSERT INTO `tp_member_account_records` VALUES ('575', '63', '0', '2', '1', '10000.00', '10', '0', '', '2017-06-23 11:41:05');
INSERT INTO `tp_member_account_records` VALUES ('576', '63', '0', '1', '0', '-10.00', '1', '808', '商城订单', '2017-06-23 11:41:37');
INSERT INTO `tp_member_account_records` VALUES ('577', '63', '0', '2', '0', '-8.00', '1', '808', '商城订单', '2017-06-23 11:41:37');
INSERT INTO `tp_member_account_records` VALUES ('578', '87', '0', '1', '1', '0.00', '1', '742', '订单商品赠送积分', '2017-06-23 16:44:02');
INSERT INTO `tp_member_account_records` VALUES ('582', '87', '0', '1', '1', '0.00', '1', '745', '订单商品赠送积分', '2017-06-23 17:21:59');
INSERT INTO `tp_member_account_records` VALUES ('583', '87', '0', '1', '1', '0.00', '1', '747', '订单商品赠送积分', '2017-06-23 18:10:39');
INSERT INTO `tp_member_account_records` VALUES ('584', '210', '0', '1', '1', '5.00', '10', '0', '', '2017-06-23 18:01:33');
INSERT INTO `tp_member_account_records` VALUES ('585', '87', '0', '1', '1', '0.00', '1', '748', '订单商品赠送积分', '2017-06-23 18:15:14');
INSERT INTO `tp_member_account_records` VALUES ('587', '87', '0', '1', '0', '-10.00', '1', '837', '商城订单', '2017-06-23 18:18:39');
INSERT INTO `tp_member_account_records` VALUES ('588', '227', '0', '2', '1', '1.00', '10', '0', '', '2017-06-23 18:48:52');
INSERT INTO `tp_member_account_records` VALUES ('589', '226', '0', '1', '1', '1.00', '10', '0', '', '2017-06-23 18:49:31');
INSERT INTO `tp_member_account_records` VALUES ('590', '226', '0', '1', '1', '11.00', '10', '0', '', '2017-06-23 18:49:35');
INSERT INTO `tp_member_account_records` VALUES ('591', '1', '0', '1', '1', '0.00', '1', '529', '订单商品赠送积分', '2017-06-24 10:35:56');
INSERT INTO `tp_member_account_records` VALUES ('592', '48', '0', '1', '1', '0.00', '1', '558', '订单商品赠送积分', '2017-06-24 10:35:57');
INSERT INTO `tp_member_account_records` VALUES ('593', '103', '0', '1', '1', '0.00', '1', '663', '订单商品赠送积分', '2017-06-24 10:35:57');
INSERT INTO `tp_member_account_records` VALUES ('594', '103', '0', '1', '1', '0.00', '1', '664', '订单商品赠送积分', '2017-06-24 10:35:57');
INSERT INTO `tp_member_account_records` VALUES ('595', '103', '0', '1', '1', '0.00', '1', '667', '订单商品赠送积分', '2017-06-24 10:35:57');
INSERT INTO `tp_member_account_records` VALUES ('596', '87', '0', '1', '1', '0.00', '1', '706', '订单商品赠送积分', '2017-06-24 10:35:57');
INSERT INTO `tp_member_account_records` VALUES ('597', '87', '0', '1', '1', '0.00', '1', '707', '订单商品赠送积分', '2017-06-24 10:35:57');
INSERT INTO `tp_member_account_records` VALUES ('598', '87', '0', '1', '1', '0.00', '1', '725', '订单商品赠送积分', '2017-06-24 10:35:57');
INSERT INTO `tp_member_account_records` VALUES ('599', '87', '0', '1', '1', '0.00', '1', '737', '订单商品赠送积分', '2017-06-24 10:35:57');
INSERT INTO `tp_member_account_records` VALUES ('600', '87', '0', '1', '0', '-100.00', '3', '0', '积分兑换余额', '2017-06-24 12:21:14');
INSERT INTO `tp_member_account_records` VALUES ('601', '87', '0', '2', '1', '2.00', '3', '0', '积分兑换余额', '2017-06-24 12:21:14');
INSERT INTO `tp_member_account_records` VALUES ('602', '63', '0', '1', '1', '0.00', '1', '808', '订单商品赠送积分', '2017-06-26 09:04:33');
INSERT INTO `tp_member_account_records` VALUES ('603', '87', '0', '2', '0', '-1.00', '8', '9', '会员余额提现', '2017-06-26 10:49:07');
INSERT INTO `tp_member_account_records` VALUES ('604', '87', '0', '1', '1', '0.00', '1', '837', '订单商品赠送积分', '2017-06-26 14:01:58');
INSERT INTO `tp_member_account_records` VALUES ('605', '87', '0', '1', '1', '0.00', '1', '841', '订单商品赠送积分', '2017-06-26 14:18:06');
INSERT INTO `tp_member_account_records` VALUES ('606', '87', '0', '1', '1', '0.00', '1', '842', '订单商品赠送积分', '2017-06-26 15:50:15');
INSERT INTO `tp_member_account_records` VALUES ('607', '87', '0', '1', '1', '0.00', '1', '800', '订单商品赠送积分', '2017-06-26 15:51:38');
INSERT INTO `tp_member_account_records` VALUES ('608', '87', '0', '2', '1', '100.00', '9', '4', '会员余额提现退回', '2017-06-26 18:45:33');
INSERT INTO `tp_member_account_records` VALUES ('609', '87', '0', '1', '0', '-66.89', '3', '0', '积分兑换余额', '2017-06-27 14:17:00');
INSERT INTO `tp_member_account_records` VALUES ('610', '87', '0', '2', '1', '1.34', '3', '0', '积分兑换余额', '2017-06-27 14:17:00');
INSERT INTO `tp_member_account_records` VALUES ('611', '87', '0', '1', '0', '-1.11', '3', '0', '积分兑换余额', '2017-06-27 14:49:46');
INSERT INTO `tp_member_account_records` VALUES ('612', '87', '0', '2', '1', '0.02', '3', '0', '积分兑换余额', '2017-06-27 14:49:46');
INSERT INTO `tp_member_account_records` VALUES ('613', '87', '0', '1', '0', '-1.55', '3', '0', '积分兑换余额', '2017-06-27 14:54:09');
INSERT INTO `tp_member_account_records` VALUES ('614', '87', '0', '2', '1', '0.03', '3', '0', '积分兑换余额', '2017-06-27 14:54:09');
INSERT INTO `tp_member_account_records` VALUES ('615', '1', '0', '87', '1', '100.00', '10', '0', '商城订单完成支付赠送积分', '2017-06-28 16:34:30');
INSERT INTO `tp_member_account_records` VALUES ('617', '1', '0', '87', '1', '50.00', '10', '0', '商城订单完成收货赠送积分', '2017-06-28 17:33:08');
INSERT INTO `tp_member_account_records` VALUES ('618', '87', '0', '1', '0', '-10.00', '3', '0', '积分兑换余额', '2017-06-28 17:51:57');
INSERT INTO `tp_member_account_records` VALUES ('619', '87', '0', '2', '1', '0.20', '3', '0', '积分兑换余额', '2017-06-28 17:51:57');
INSERT INTO `tp_member_account_records` VALUES ('620', '87', '0', '1', '1', '50.00', '1', '851', '订单商品赠送积分', '2017-06-28 17:54:03');
INSERT INTO `tp_member_account_records` VALUES ('621', '1', '0', '87', '1', '50.00', '10', '0', '商城订单完成收货赠送积分', '2017-06-28 18:00:56');
INSERT INTO `tp_member_account_records` VALUES ('622', '87', '0', '1', '1', '50.00', '1', '854', '订单商品赠送积分', '2017-06-28 18:04:24');
INSERT INTO `tp_member_account_records` VALUES ('628', '1', '0', '87', '1', '50.00', '10', '0', '商城订单完成支付赠送积分', '2017-06-28 18:16:48');
INSERT INTO `tp_member_account_records` VALUES ('636', '1', '0', '87', '1', '50.00', '10', '0', '商城订单完成支付赠送积分', '2017-06-28 18:24:09');
INSERT INTO `tp_member_account_records` VALUES ('637', '233', '0', '1', '1', '100.00', '10', '0', '', '2017-06-28 18:33:23');
INSERT INTO `tp_member_account_records` VALUES ('638', '87', '0', '1', '1', '50.00', '1', '858', '订单商品赠送积分', '2017-06-28 18:31:43');
INSERT INTO `tp_member_account_records` VALUES ('640', '1', '0', '87', '1', '50.00', '10', '0', '商城订单完成收货赠送积分', '2017-06-28 18:33:55');
INSERT INTO `tp_member_account_records` VALUES ('641', '87', '0', '1', '1', '50.00', '1', '857', '订单商品赠送积分', '2017-06-28 18:38:07');
INSERT INTO `tp_member_account_records` VALUES ('642', '87', '0', '1', '1', '50.00', '1', '855', '订单商品赠送积分', '2017-06-28 18:44:39');
INSERT INTO `tp_member_account_records` VALUES ('643', '87', '0', '1', '1', '50.00', '1', '856', '订单商品赠送积分', '2017-06-28 18:41:59');
INSERT INTO `tp_member_account_records` VALUES ('644', '1', '0', '87', '1', '100.00', '10', '0', '商城订单完成收货赠送积分', '2017-06-28 18:46:42');
INSERT INTO `tp_member_account_records` VALUES ('645', '87', '0', '1', '1', '100.00', '1', '849', '订单商品赠送积分', '2017-06-28 18:50:11');
INSERT INTO `tp_member_account_records` VALUES ('646', '87', '0', '1', '1', '100.00', '1', '849', '订单商品赠送积分', '2017-06-28 18:50:23');
INSERT INTO `tp_member_account_records` VALUES ('647', '87', '0', '1', '1', '0.00', '1', '830', '订单商品赠送积分', '2017-06-28 18:55:00');
INSERT INTO `tp_member_account_records` VALUES ('648', '87', '0', '1', '1', '0.00', '1', '807', '订单商品赠送积分', '2017-06-28 19:03:50');
INSERT INTO `tp_member_account_records` VALUES ('649', '87', '0', '1', '1', '50.00', '1', '866', '商城订单完成支付赠送积分', '2017-06-28 19:06:17');
INSERT INTO `tp_member_account_records` VALUES ('650', '87', '0', '1', '1', '50.00', '1', '867', '商城订单完成支付赠送积分', '2017-06-28 19:13:24');
INSERT INTO `tp_member_account_records` VALUES ('651', '87', '0', '1', '1', '50.00', '1', '869', '商城订单完成支付赠送积分', '2017-06-28 19:23:55');
INSERT INTO `tp_member_account_records` VALUES ('652', '87', '0', '1', '1', '50.00', '1', '870', '商城订单完成支付赠送积分', '2017-06-28 19:27:23');
INSERT INTO `tp_member_account_records` VALUES ('653', '87', '0', '1', '1', '50.00', '1', '870', '商城订单完成收货赠送积分', '2017-06-28 19:30:29');
INSERT INTO `tp_member_account_records` VALUES ('654', '87', '0', '1', '1', '50.00', '1', '871', '商城订单完成赠送积分', '2017-06-28 19:36:01');
INSERT INTO `tp_member_account_records` VALUES ('655', '233', '0', '2', '1', '1000.00', '10', '0', '', '2017-06-28 19:42:00');
INSERT INTO `tp_member_account_records` VALUES ('656', '233', '0', '2', '1', '-500.00', '10', '0', '', '2017-06-28 19:42:13');
INSERT INTO `tp_member_account_records` VALUES ('657', '87', '0', '1', '0', '50.00', '1', '705', '退款成功,扣除已发放的积分', '2017-06-28 20:14:53');
INSERT INTO `tp_member_account_records` VALUES ('658', '87', '0', '1', '1', '50.00', '1', '874', '商城订单完成支付赠送积分', '2017-06-28 20:18:12');
INSERT INTO `tp_member_account_records` VALUES ('659', '87', '0', '1', '1', '50.00', '1', '875', '商城订单完成支付赠送积分', '2017-06-28 20:19:43');
INSERT INTO `tp_member_account_records` VALUES ('660', '87', '0', '1', '1', '50.00', '1', '875', '商城订单完成收货赠送积分', '2017-06-28 20:21:58');
INSERT INTO `tp_member_account_records` VALUES ('661', '87', '0', '1', '1', '50.00', '1', '876', '商城订单完成收货赠送积分', '2017-06-28 20:35:21');
INSERT INTO `tp_member_account_records` VALUES ('662', '87', '0', '1', '1', '100.00', '1', '878', '商城订单完成支付赠送积分', '2017-06-28 21:02:50');
INSERT INTO `tp_member_account_records` VALUES ('664', '87', '0', '1', '0', '40.00', '1', '878', '退款成功,扣除已发放的积分', '2017-06-28 21:05:18');
INSERT INTO `tp_member_account_records` VALUES ('665', '87', '0', '1', '0', '50.00', '1', '885', '退款成功,扣除已发放的积分', '2017-06-29 11:18:25');
INSERT INTO `tp_member_account_records` VALUES ('666', '87', '0', '1', '0', '-2.00', '1', '892', '商城订单', '2017-06-29 22:05:52');
INSERT INTO `tp_member_account_records` VALUES ('667', '87', '0', '1', '1', '2.00', '2', '892', '订单关闭返还积分', '2017-06-30 09:13:53');
INSERT INTO `tp_member_account_records` VALUES ('668', '87', '0', '1', '0', '0.00', '1', '896', '退款成功,扣除已发放的积分', '2017-06-30 16:22:33');
INSERT INTO `tp_member_account_records` VALUES ('669', '87', '0', '1', '0', '-10.00', '3', '0', '积分兑换余额', '2017-06-30 17:27:31');
INSERT INTO `tp_member_account_records` VALUES ('670', '87', '0', '2', '1', '0.20', '3', '0', '积分兑换余额', '2017-06-30 17:27:31');
INSERT INTO `tp_member_account_records` VALUES ('671', '87', '0', '1', '0', '-10.00', '3', '0', '积分兑换余额', '2017-06-30 17:31:59');
INSERT INTO `tp_member_account_records` VALUES ('672', '87', '0', '2', '1', '0.20', '3', '0', '积分兑换余额', '2017-06-30 17:31:59');
INSERT INTO `tp_member_account_records` VALUES ('673', '87', '0', '2', '1', '1.00', '9', '7', '会员余额提现退回', '2017-07-07 18:03:20');
INSERT INTO `tp_member_account_records` VALUES ('678', '290', '0', '1', '1', '10.00', '7', '0', '注册会员赠送积分', '2017-07-12 14:52:38');
INSERT INTO `tp_member_account_records` VALUES ('679', '290', '0', '1', '1', '10.00', '10', '0', '', '2017-07-13 16:54:47');
INSERT INTO `tp_member_account_records` VALUES ('680', '290', '0', '1', '1', '15.00', '10', '0', '', '2017-07-14 09:57:00');
INSERT INTO `tp_member_account_records` VALUES ('681', '290', '0', '2', '1', '10.00', '10', '0', '', '2017-07-14 09:57:18');
INSERT INTO `tp_member_account_records` VALUES ('682', '291', '0', '1', '1', '10.00', '7', '0', '注册会员赠送积分', '2017-07-14 10:59:48');
INSERT INTO `tp_member_account_records` VALUES ('683', '87', '0', '2', '1', '500.00', '9', '6', '会员余额提现退回', '2017-07-15 14:15:01');
INSERT INTO `tp_member_account_records` VALUES ('684', '291', '0', '2', '1', '100.00', '10', '0', '', '2017-07-15 16:16:02');
INSERT INTO `tp_member_account_records` VALUES ('685', '291', '0', '2', '1', '-10.00', '10', '0', '', '2017-07-15 16:16:12');
INSERT INTO `tp_member_account_records` VALUES ('686', '291', '0', '1', '1', '90.00', '10', '0', '', '2017-07-15 16:19:56');
INSERT INTO `tp_member_account_records` VALUES ('687', '291', '0', '1', '1', '-10.00', '10', '0', '', '2017-07-15 16:20:08');
INSERT INTO `tp_member_account_records` VALUES ('688', '292', '0', '1', '1', '10.00', '7', '0', '注册会员赠送积分', '2017-07-17 19:46:33');
INSERT INTO `tp_member_account_records` VALUES ('689', '294', '0', '1', '1', '10.00', '7', '0', '注册会员赠送积分', '2017-08-31 19:36:49');

-- ----------------------------
-- Table structure for tp_member_balance_withdraw
-- ----------------------------
DROP TABLE IF EXISTS `tp_member_balance_withdraw`;
CREATE TABLE `tp_member_balance_withdraw` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL COMMENT '店铺编号',
  `withdraw_no` varchar(255) NOT NULL DEFAULT '' COMMENT '提现流水号',
  `uid` int(11) NOT NULL COMMENT '会员id',
  `bank_name` varchar(50) NOT NULL COMMENT '提现银行名称',
  `account_number` varchar(50) NOT NULL COMMENT '提现银行账号',
  `realname` varchar(10) NOT NULL COMMENT '提现账户姓名',
  `mobile` varchar(20) NOT NULL COMMENT '手机',
  `cash` decimal(10,2) NOT NULL COMMENT '提现金额',
  `ask_for_date` datetime NOT NULL COMMENT '提现日期',
  `payment_date` datetime DEFAULT NULL COMMENT '到账日期',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT '当前状态 0已申请(等待处理) 1已同意 -1 已拒绝',
  `memo` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `modify_date` datetime DEFAULT NULL COMMENT '修改日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=4096 COMMENT='会员余额提现记录表';

-- ----------------------------
-- Records of tp_member_balance_withdraw
-- ----------------------------
INSERT INTO `tp_member_balance_withdraw` VALUES ('4', '0', '1497688063222', '87', '中国银行', '622222222222222222', 'aa', '15263254521', '100.00', '2017-06-17 16:27:43', null, '0', '', '2017-06-17 16:27:43');
INSERT INTO `tp_member_balance_withdraw` VALUES ('5', '0', '1497688073911', '87', '中国银行', '622222222222222222', 'aa', '15263254523', '100.00', '2017-06-17 16:27:53', null, '1', '', '2017-06-17 16:27:53');
INSERT INTO `tp_member_balance_withdraw` VALUES ('6', '0', '1497699313245', '87', '中国银行', '622222222222222222', 'aa', '13994263845', '500.00', '2017-06-17 19:35:13', null, '-1', '', '2017-06-17 19:35:13');
INSERT INTO `tp_member_balance_withdraw` VALUES ('7', '0', '1497701972666', '87', '中国银行', '622222222222222222', 'aa', '15263254521', '1.00', '2017-06-17 20:19:33', null, '0', '', '2017-06-17 20:19:33');
INSERT INTO `tp_member_balance_withdraw` VALUES ('8', '0', '1498112807710', '87', '中国银行', '622222222222222222', 'aa', '15263254521', '10.00', '2017-06-22 14:26:47', null, '1', '', '2017-06-22 14:26:47');
INSERT INTO `tp_member_balance_withdraw` VALUES ('9', '0', '1498445347201', '87', '中国银行', '622222222222222222', 'aa', '15263254521', '1.00', '2017-06-26 10:49:07', null, '1', '', '2017-06-26 10:49:07');

-- ----------------------------
-- Table structure for tp_member_bank_account
-- ----------------------------
DROP TABLE IF EXISTS `tp_member_bank_account`;
CREATE TABLE `tp_member_bank_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '会员id',
  `bank_type` varchar(50) NOT NULL DEFAULT '1' COMMENT '账号类型 1银行卡2支付宝',
  `branch_bank_name` varchar(50) DEFAULT NULL COMMENT '支行信息',
  `realname` varchar(50) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `account_number` varchar(50) NOT NULL DEFAULT '' COMMENT '银行账号',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  `is_default` int(11) NOT NULL DEFAULT '0' COMMENT '是否默认账号',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `modify_date` datetime DEFAULT NULL COMMENT '修改日期',
  PRIMARY KEY (`id`),
  KEY `IDX_member_bank_account_uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='会员提现账号';

-- ----------------------------
-- Records of tp_member_bank_account
-- ----------------------------
INSERT INTO `tp_member_bank_account` VALUES ('3', '48', '银行卡', '建设银行', '发发发', '65232145222111111', '15263254521', '0', '2017-06-13 14:10:22', '2017-06-13 14:10:22');
INSERT INTO `tp_member_bank_account` VALUES ('5', '48', '银行卡', '中国银行升水', '真实', '6222222222222222', '15263254521', '0', '2017-06-13 14:41:58', '2017-06-13 16:02:51');
INSERT INTO `tp_member_bank_account` VALUES ('7', '48', '银行卡', '浦发银行', '22', '688888888888888', '18652452412', '0', '2017-06-13 14:46:55', '2017-06-13 14:46:55');
INSERT INTO `tp_member_bank_account` VALUES ('8', '48', '银行卡', '建设银行', '33', '6222222222222', '18752452145', '0', '2017-06-13 14:47:20', '2017-06-13 14:47:20');
INSERT INTO `tp_member_bank_account` VALUES ('10', '48', '银行卡', '农业银行', '44方法', '62222222222222', '15263254521', '0', '2017-06-13 14:55:24', '2017-06-13 17:48:20');
INSERT INTO `tp_member_bank_account` VALUES ('12', '48', '银行卡', '人民银行', '测测测测测规格', '622848523525514524', '18734824089', '1', '2017-06-13 17:55:29', '2017-06-13 18:13:26');
INSERT INTO `tp_member_bank_account` VALUES ('22', '87', '银行卡', '中国银行', 'aa', '622222222222222222', '15263254521', '1', '2017-06-17 15:48:56', '2017-06-17 15:48:56');
INSERT INTO `tp_member_bank_account` VALUES ('23', '110', '银行卡', 'fdssa', 'fdsa', '21123', '15113333333', '1', '2017-06-23 18:25:04', '2017-06-23 18:25:04');

-- ----------------------------
-- Table structure for tp_member_express_address
-- ----------------------------
DROP TABLE IF EXISTS `tp_member_express_address`;
CREATE TABLE `tp_member_express_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '会员基本资料表ID',
  `consigner` varchar(255) NOT NULL DEFAULT '' COMMENT '收件人',
  `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '手机',
  `phone` varchar(20) NOT NULL DEFAULT '' COMMENT '固定电话',
  `province` int(11) NOT NULL DEFAULT '0' COMMENT '省',
  `city` int(11) NOT NULL DEFAULT '0' COMMENT '市',
  `district` int(11) NOT NULL DEFAULT '0' COMMENT '区县',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '详细地址',
  `zip_code` varchar(6) NOT NULL DEFAULT '' COMMENT '邮编',
  `alias` varchar(50) NOT NULL DEFAULT '' COMMENT '地址别名',
  `is_default` int(11) NOT NULL DEFAULT '0' COMMENT '默认收货地址',
  PRIMARY KEY (`id`),
  KEY `IDX_member_express_address_uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=2340 COMMENT='会员收货地址管理';

-- ----------------------------
-- Records of tp_member_express_address
-- ----------------------------
INSERT INTO `tp_member_express_address` VALUES ('123', '48', '左骐羽', '13754927904', '--', '19', '210', '1838', '山西省北美金棕榈 8号楼', '1', '', '0');
INSERT INTO `tp_member_express_address` VALUES ('124', '1', '小李', '13838385426', '--', '4', '14', '209', '南屯', '', '', '1');
INSERT INTO `tp_member_express_address` VALUES ('129', '48', 'ces', '15235165131', '', '23', '247', '2143', '1', '', '', '1');
INSERT INTO `tp_member_express_address` VALUES ('130', '63', '马越', '13754927904', '', '26', '283', '2462', '你找不到', '', '', '1');
INSERT INTO `tp_member_express_address` VALUES ('134', '103', 'wzy', '13546422891', '', '4', '14', '209', '晋阳街体育路', '', '', '1');
INSERT INTO `tp_member_express_address` VALUES ('139', '113', 'rewef', '15111111111', '', '19', '208', '1825', 'fds', '', '', '1');
INSERT INTO `tp_member_express_address` VALUES ('148', '110', 'zx', '14332222222', '', '21', '232', '1979', 'sf', '', '', '1');
INSERT INTO `tp_member_express_address` VALUES ('150', '87', 'kk', '15222222222', '', '32', '343', '-1', '11', '', '', '0');
INSERT INTO `tp_member_express_address` VALUES ('152', '208', '小学生', '15235165131', '', '21', '233', '1998', '小学生', '', '', '1');
INSERT INTO `tp_member_express_address` VALUES ('153', '87', 'xx', '15235165131', '', '4', '14', '213', 'xxx', '', '', '0');
INSERT INTO `tp_member_express_address` VALUES ('154', '87', 'asdasd', '15234567898', '', '1', '1', '1', '12121', '1212', '', '1');
INSERT INTO `tp_member_express_address` VALUES ('155', '294', 'ss', '13212341234', '', '20', '230', '1964', '11111111', '', '', '1');
INSERT INTO `tp_member_express_address` VALUES ('156', '293', '1', '13212341234', '11', '19', '208', '1827', '11', '', '', '1');

-- ----------------------------
-- Table structure for tp_member_favorites
-- ----------------------------
DROP TABLE IF EXISTS `tp_member_favorites`;
CREATE TABLE `tp_member_favorites` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `fav_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品或店铺ID',
  `fav_type` varchar(20) NOT NULL DEFAULT 'goods' COMMENT '类型:goods为商品,shop为店铺,默认为商品',
  `fav_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '收藏时间',
  `shop_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `shop_name` varchar(20) NOT NULL DEFAULT '' COMMENT '店铺名称',
  `shop_logo` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺logo',
  `goods_name` varchar(50) NOT NULL DEFAULT '' COMMENT '商品名称',
  `goods_image` varchar(100) NOT NULL DEFAULT '' COMMENT '商品图片',
  `log_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品收藏时价格',
  `log_msg` varchar(1000) NOT NULL DEFAULT '' COMMENT '收藏备注',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192 COMMENT='收藏表';

-- ----------------------------
-- Records of tp_member_favorites
-- ----------------------------
INSERT INTO `tp_member_favorites` VALUES ('1', '91', '334', 'goods', '2017-06-23 17:34:19', '0', 'niushop开源商城', 'upload/common/1497923663.jpg', '测试商品', 'upload/goods/1498112971qrcode_23.png', '10.00', '测试商品');
INSERT INTO `tp_member_favorites` VALUES ('13', '1', '0', 'shop', '2017-07-13 17:28:30', '0', '官方直营店', 'template/shop/default/public/images/temp_14653489106946.jpg', '', '', '0.00', '');
INSERT INTO `tp_member_favorites` VALUES ('17', '63', '322', 'goods', '2017-07-13 19:13:49', '0', '', '', '男士衬衫1', 'upload/goods/14970768783.jpg', '12.00', '男士衬衫1');
INSERT INTO `tp_member_favorites` VALUES ('33', '87', '344', 'goods', '2017-07-17 14:20:30', '0', '', '', '牛仔裤', 'upload/goods/149856653155decb37234733.jpg', '100.00', '牛仔裤');

-- ----------------------------
-- Table structure for tp_member_feedback
-- ----------------------------
DROP TABLE IF EXISTS `tp_member_feedback`;
CREATE TABLE `tp_member_feedback` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `uid` int(10) unsigned NOT NULL COMMENT '会员id',
  `opinion` text NOT NULL COMMENT '建议内容',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `reply` text NOT NULL COMMENT '回复内容',
  `reply_time` int(10) NOT NULL DEFAULT '0' COMMENT '回复时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192;

-- ----------------------------
-- Records of tp_member_feedback
-- ----------------------------

-- ----------------------------
-- Table structure for tp_member_gift
-- ----------------------------
DROP TABLE IF EXISTS `tp_member_gift`;
CREATE TABLE `tp_member_gift` (
  `gift_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int(11) NOT NULL COMMENT '会员ID',
  `promotion_gift_id` int(11) NOT NULL COMMENT '赠品活动ID',
  `goods_id` int(11) NOT NULL COMMENT '赠品ID',
  `goods_name` varchar(255) NOT NULL DEFAULT '' COMMENT '赠品名称',
  `goods_picture` int(11) NOT NULL DEFAULT '0' COMMENT '赠品图片',
  `num` int(11) NOT NULL DEFAULT '1' COMMENT '赠品数量',
  `get_type` int(11) NOT NULL DEFAULT '1' COMMENT '获取方式',
  `get_type_id` int(11) NOT NULL COMMENT '获取方式对应ID',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `desc` text NOT NULL COMMENT '说明',
  PRIMARY KEY (`gift_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员赠品表';

-- ----------------------------
-- Records of tp_member_gift
-- ----------------------------

-- ----------------------------
-- Table structure for tp_member_level
-- ----------------------------
DROP TABLE IF EXISTS `tp_member_level`;
CREATE TABLE `tp_member_level` (
  `level_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '等级ID',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `level_name` varchar(50) NOT NULL DEFAULT '' COMMENT '等级名称',
  `min_integral` int(11) NOT NULL DEFAULT '0' COMMENT '累计积分',
  `goods_discount` decimal(3,2) NOT NULL DEFAULT '1.00' COMMENT '折扣率',
  `desc` varchar(1000) NOT NULL DEFAULT '' COMMENT '等级描述',
  `is_default` int(11) NOT NULL DEFAULT '0' COMMENT '是否是默认',
  `quota` int(11) NOT NULL DEFAULT '0' COMMENT '消费额度',
  `upgrade` int(11) NOT NULL COMMENT '升级条件  1.累计积分 2.消费额度 3.同时满足',
  `relation` int(11) NOT NULL DEFAULT '1' COMMENT '1.或 2. 且',
  PRIMARY KEY (`level_id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='会员等级';

-- ----------------------------
-- Records of tp_member_level
-- ----------------------------
INSERT INTO `tp_member_level` VALUES ('2', '0', '黄金会员', '10', '0.80', '黄金会员', '0', '100', '3', '1');
INSERT INTO `tp_member_level` VALUES ('3', '0', '钻石会员', '500', '0.80', '钻石会员', '0', '500', '3', '2');
INSERT INTO `tp_member_level` VALUES ('47', '0', '普通会员', '0', '1.00', '', '1', '0', '1', '2');

-- ----------------------------
-- Table structure for tp_member_recharge
-- ----------------------------
DROP TABLE IF EXISTS `tp_member_recharge`;
CREATE TABLE `tp_member_recharge` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `recharge_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '支付金额',
  `uid` varchar(255) NOT NULL COMMENT '用户uid',
  `out_trade_no` varchar(255) NOT NULL DEFAULT '' COMMENT '支付流水号',
  `create_time` varchar(255) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `is_pay` varchar(255) NOT NULL DEFAULT '0' COMMENT '是否支付',
  `status` varchar(255) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=910 COMMENT='会员充值余额记录';

-- ----------------------------
-- Records of tp_member_recharge
-- ----------------------------

-- ----------------------------
-- Table structure for tp_module
-- ----------------------------
DROP TABLE IF EXISTS `tp_module`;
CREATE TABLE `tp_module` (
  `module_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '模块ID',
  `module_name` varchar(50) NOT NULL DEFAULT '' COMMENT '模块标题',
  `module` varchar(255) NOT NULL DEFAULT 'admin' COMMENT '项目名',
  `controller` varchar(255) NOT NULL DEFAULT '' COMMENT '控制器名',
  `method` varchar(255) NOT NULL DEFAULT '' COMMENT '方法名',
  `pid` int(10) NOT NULL DEFAULT '0' COMMENT '上级模块ID',
  `level` int(11) NOT NULL DEFAULT '1' COMMENT '深度等级',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `is_menu` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否是菜单',
  `is_dev` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否仅开发者模式可见',
  `sort` int(10) NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL,
  `desc` text COMMENT '模块描述',
  `is_control_auth` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否控制权限',
  PRIMARY KEY (`module_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10027 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=606 COMMENT='系统模块表';

-- ----------------------------
-- Records of tp_module
-- ----------------------------
INSERT INTO `tp_module` VALUES ('120', '系统', 'admin', 'system', 'modulelist', '0', '1', 'system/modulelist', '1', '0', '999', '2016-10-26 11:55:52', '2017-06-30 15:53:50', '\'\'', '1');
INSERT INTO `tp_module` VALUES ('121', '模块列表', 'admin', 'system', 'modulelist', '120', '2', 'system/modulelist', '1', '0', '2', '0000-00-00 00:00:00', null, '\'\'', '1');
INSERT INTO `tp_module` VALUES ('122', '添加模块', 'admin', 'system', 'addmodule', '121', '3', 'system/addmodule', '0', '0', '1', '0000-00-00 00:00:00', '2016-11-24 16:36:37', '添加模块', '1');
INSERT INTO `tp_module` VALUES ('123', '修改模块', 'admin', 'system', 'editmodule', '121', '3', 'system/editmodule', '0', '0', '2', '0000-00-00 00:00:00', '2016-11-24 16:37:26', '修改模块', '1');
INSERT INTO `tp_module` VALUES ('126', '用户', 'admin', 'auth', 'userlist', '0', '1', 'auth/userlist', '1', '0', '9', '0000-00-00 00:00:00', '2017-01-17 18:57:43', '', '1');
INSERT INTO `tp_module` VALUES ('127', '用户列表', 'admin', 'auth', 'userlist', '126', '2', 'auth/userlist', '1', '0', '0', '0000-00-00 00:00:00', null, null, '1');
INSERT INTO `tp_module` VALUES ('128', '用户组列表', 'admin', 'auth', 'authgrouplist', '126', '2', 'auth/authgrouplist', '1', '0', '0', '0000-00-00 00:00:00', '2016-11-24 16:41:59', '用户组', '1');
INSERT INTO `tp_module` VALUES ('129', '删除模块', 'admin', 'system', 'delmodule', '121', '3', 'system/delmodule', '0', '0', '0', '2016-10-28 09:32:30', '2016-11-24 16:38:43', '模块列表', '1');
INSERT INTO `tp_module` VALUES ('133', '添加用户组', 'admin', 'auth', 'addusergroup', '128', '3', 'auth/addusergroup', '0', '0', '2', '2016-10-28 12:22:24', '2016-11-24 16:43:28', '用户组', '1');
INSERT INTO `tp_module` VALUES ('139', '相册管理', 'admin', 'system', 'albumlist', '149', '2', 'system/albumlist', '1', '0', '10', '2016-11-03 15:28:14', '2017-06-07 15:13:30', '相册管理', '1');
INSERT INTO `tp_module` VALUES ('144', '编辑用户', 'admin', 'auth', 'edituser', '127', '3', 'auth/edituser', '0', '0', '5', '2016-11-11 12:10:47', '2016-11-24 16:42:43', '用户', '1');
INSERT INTO `tp_module` VALUES ('149', '商品', 'admin', 'goods', 'goodslist', '0', '1', 'goods/goodslist', '1', '0', '1', '2016-11-16 11:49:08', '2017-05-05 16:32:47', '商品模块', '1');
INSERT INTO `tp_module` VALUES ('150', '商品列表', 'admin', 'goods', 'goodslist', '149', '2', 'goods/goodslist', '1', '0', '1', '2016-11-16 11:50:36', '2017-04-11 16:18:45', '商品列表', '0');
INSERT INTO `tp_module` VALUES ('151', '商品发布', 'admin', 'goods', 'addgoods', '149', '2', 'goods/addgoods', '1', '0', '2', '2016-11-16 11:51:47', null, '商品发布', '1');
INSERT INTO `tp_module` VALUES ('169', '图片管理', 'admin', 'system', 'albumpicturelist', '139', '3', 'system/albumpicturelist', '0', '0', '5', '2016-11-18 18:25:08', '2016-11-24 16:39:50', 'sfgsdf', '1');
INSERT INTO `tp_module` VALUES ('171', '商品标签', 'admin', 'goods', 'goodsgrouplist', '149', '2', 'goods/goodsgrouplist', '1', '0', '3', '2016-11-23 11:54:58', '2016-11-24 12:03:02', '商品分组', '1');
INSERT INTO `tp_module` VALUES ('172', '添加商品标签', 'admin', 'goods', 'addgoodsgroup', '171', '3', 'goods/addgoodsgroup', '0', '0', '6', '2016-11-23 11:57:04', '2016-11-24 12:04:03', '添加商品分组', '1');
INSERT INTO `tp_module` VALUES ('179', '营销', 'admin', 'promotion', 'coupontypelist', '0', '1', 'promotion/coupontypelist', '1', '0', '3', '2016-11-30 15:40:52', '2016-11-30 15:42:05', '优惠券类型列表', '1');
INSERT INTO `tp_module` VALUES ('180', '优惠券', 'admin', 'promotion', 'coupontypelist', '179', '2', 'promotion/coupontypelist', '1', '0', '1', '2016-11-30 15:44:06', null, '优惠券类型列表', '1');
INSERT INTO `tp_module` VALUES ('184', '订单', 'admin', 'order', 'orderlist', '0', '1', 'order/orderlist', '1', '0', '2', '2016-12-01 11:32:17', null, '订单列表', '1');
INSERT INTO `tp_module` VALUES ('185', '订单列表', 'admin', 'order', 'orderlist', '184', '2', 'order/orderlist', '1', '0', '1', '2016-12-01 11:33:30', null, '订单列表', '1');
INSERT INTO `tp_module` VALUES ('186', '添加优惠券', 'admin', 'promotion', 'addcoupontype', '180', '3', 'promotion/addcoupontype', '1', '0', '2', '2016-12-01 14:19:31', null, '添加优惠券类型', '1');
INSERT INTO `tp_module` VALUES ('187', '修改优惠券', 'admin', 'promotion', 'updatecoupontype', '180', '3', 'promotion/updatecoupontype', '1', '0', '3', '2016-12-05 10:29:03', null, '修改优惠券类型', '1');
INSERT INTO `tp_module` VALUES ('189', '物流公司', 'admin', 'express', 'expresscompany', '184', '2', 'express/expresscompany', '1', '0', '4', '2016-12-09 11:41:06', '2017-01-20 14:39:04', '物流公司', '1');
INSERT INTO `tp_module` VALUES ('190', '订单详情', 'admin', 'order', 'orderdetail', '185', '3', 'order/orderdetail', '0', '0', '1', '2016-12-09 12:36:13', null, '订单详情', '1');
INSERT INTO `tp_module` VALUES ('191', '添加物流公司', 'admin', 'express', 'addexpresscompany', '189', '3', 'express/addexpresscompany', '1', '0', '3', '2016-12-09 15:17:08', null, '添加物流公司', '1');
INSERT INTO `tp_module` VALUES ('192', '物流公司修改', 'admin', 'express', 'updateexpresscompany', '189', '3', 'express/updateexpresscompany', '1', '0', '4', '2016-12-09 16:23:28', null, '物流公司修改排序', '1');
INSERT INTO `tp_module` VALUES ('194', '退款详情', 'admin', 'order', 'orderrefunddetail', '185', '3', 'order/orderrefunddetail', '0', '0', '2', '2016-12-16 15:07:54', null, '退款详情', '1');
INSERT INTO `tp_module` VALUES ('195', '赠品', 'admin', 'promotion', 'giftlist', '179', '2', 'promotion/giftlist', '0', '0', '3', '2016-12-19 10:04:34', '2017-05-08 11:59:48', '', '1');
INSERT INTO `tp_module` VALUES ('196', '添加赠品', 'admin', 'promotion', 'addgift', '195', '3', 'promotion/addgift', '1', '0', '0', '2016-12-19 10:14:24', '2016-12-19 11:18:59', '添加赠品', '1');
INSERT INTO `tp_module` VALUES ('197', '修改赠品', 'admin', 'promotion', 'updategift', '195', '3', 'promotion/updategift', '1', '0', '0', '2016-12-19 10:15:15', '2016-12-19 11:19:18', '修改赠品', '1');
INSERT INTO `tp_module` VALUES ('198', '满减送', 'admin', 'promotion', 'mansonglist', '179', '2', 'promotion/mansonglist', '1', '0', '4', '2016-12-19 17:09:40', '2016-12-19 17:09:57', '满减送', '1');
INSERT INTO `tp_module` VALUES ('199', '添加满减满送', 'admin', 'promotion', 'addmansong', '198', '3', 'promotion/addmansong', '1', '0', '0', '2016-12-19 17:38:31', null, '满减送', '1');
INSERT INTO `tp_module` VALUES ('200', '编辑满减送', 'admin', 'promotion', 'updatemansong', '198', '3', 'promotion/updatemansong', '1', '0', '1', '2016-12-28 14:37:39', null, '编辑满减送', '1');
INSERT INTO `tp_module` VALUES ('201', '限时折扣', 'admin', 'promotion', 'getdiscountlist', '179', '2', 'promotion/getdiscountlist', '1', '0', '5', '2017-01-09 16:08:03', null, '限时折扣', '1');
INSERT INTO `tp_module` VALUES ('202', '添加限时折扣', 'admin', 'promotion', 'adddiscount', '201', '3', 'promotion/adddiscount', '1', '0', '0', '2017-01-09 16:38:24', null, '添加限时折扣', '1');
INSERT INTO `tp_module` VALUES ('203', '修改限时折扣', 'admin', 'promotion', 'updatediscount', '201', '3', 'promotion/updatediscount', '1', '0', '1', '2017-01-09 16:39:11', '2017-01-09 18:40:51', '修改限时折扣', '1');
INSERT INTO `tp_module` VALUES ('210', '修改商品标签', 'admin', 'goods', 'updategoodsgroup', '171', '3', 'goods/updategoodsgroup', '0', '0', '2', '2017-01-11 15:38:18', '2017-01-11 17:11:57', '修改商品分组', '1');
INSERT INTO `tp_module` VALUES ('218', '店铺', 'admin', 'shop', 'shopconfig', '0', '1', 'shop/shopconfig', '1', '0', '6', '2017-01-17 09:42:35', '2017-07-04 11:35:19', '店铺设置', '1');
INSERT INTO `tp_module` VALUES ('334', '咨询管理', 'admin', 'saleservice', 'consultlist', '149', '2', 'saleservice/consultlist', '1', '0', '8', '2017-03-07 16:35:02', '2017-06-02 16:35:53', '咨询管理，未回复咨询，已回复咨询', '1');
INSERT INTO `tp_module` VALUES ('360', '添加用户', 'admin', 'auth', 'adduser', '127', '3', 'auth/adduser', '0', '0', '1', '2017-03-23 10:38:51', null, '添加用户', '1');
INSERT INTO `tp_module` VALUES ('398', '个人资料', 'admin', 'auth', 'userdetail', '126', '2', 'auth/userdetail', '1', '0', '0', '2017-04-01 14:59:55', '2017-05-09 10:54:50', '个人资料', '0');
INSERT INTO `tp_module` VALUES ('403', '销售排行', 'admin', 'account', 'shopgoodssalesrank', '409', '2', 'account/shopgoodssalesrank', '1', '0', '9', '2017-04-01 17:48:10', '2017-06-07 15:15:01', '商品销售排行', '1');
INSERT INTO `tp_module` VALUES ('405', '商品销售统计', 'admin', 'account', 'shopgoodsaccountlist', '403', '3', 'account/shopgoodsaccountlist', '0', '0', '6', '2017-04-01 18:32:22', null, '商品销售统计', '1');
INSERT INTO `tp_module` VALUES ('409', '资产', 'admin', 'account', 'shopaccount', '0', '1', 'account/shopsalesaccount', '1', '0', '11', '2017-04-27 16:24:48', '2017-05-05 16:53:32', '资产', '1');
INSERT INTO `tp_module` VALUES ('418', '店铺设置', 'admin', 'shop', 'shopconfig', '218', '2', 'shop/shopconfig', '1', '0', '1', '2017-04-21 14:10:47', '2017-07-04 11:34:48', '', '1');
INSERT INTO `tp_module` VALUES ('430', '友情链接', 'admin', 'config', 'linklist', '477', '2', 'config/linklist', '1', '0', '13', '2017-04-21 17:01:09', '2017-06-01 20:39:10', '友情链接', '1');
INSERT INTO `tp_module` VALUES ('445', '首页公告', 'admin', 'config', 'usernotice', '477', '2', 'config/usernotice', '1', '0', '19', '2017-04-26 19:30:56', '2017-06-01 20:45:21', 'userNotice', '1');
INSERT INTO `tp_module` VALUES ('446', '积分管理', 'admin', 'promotion', 'pointconfig', '179', '2', 'promotion/pointconfig', '0', '0', '1', '2017-04-26 19:35:30', '2017-07-20 16:04:04', '1', '1');
INSERT INTO `tp_module` VALUES ('447', '粉丝列表', 'admin', 'member', 'weixinfanslist', '137', '2', 'member/weixinfanslist', '1', '0', '2', '2017-04-27 15:38:22', null, '粉丝列表', '1');
INSERT INTO `tp_module` VALUES ('450', '修改消息素材', 'admin', 'wchat', 'updatemedia', '342', '3', 'wchat/updatemedia', '1', '0', '1', '2017-04-27 16:34:38', '2017-04-27 16:38:17', '', '1');
INSERT INTO `tp_module` VALUES ('451', '添加消息素材', 'admin', 'wchat', 'addmedia', '342', '3', 'wchat/addmedia', '1', '0', '1', '2017-04-27 16:39:31', null, '', '1');
INSERT INTO `tp_module` VALUES ('454', '销售统计', 'admin', 'account', 'orderaccountcount', '409', '2', 'account/orderaccountcount', '0', '0', '6', '2017-04-27 18:46:01', '2017-05-05 18:55:04', '', '1');
INSERT INTO `tp_module` VALUES ('457', '销售明细', 'admin', 'account', 'orderrecordslist', '454', '3', 'account/orderrecordslist', '0', '0', '2', '2017-05-02 14:04:40', '2017-05-02 14:10:19', '', '1');
INSERT INTO `tp_module` VALUES ('459', '销售概况', 'admin', 'account', 'shopsalesaccount', '409', '2', 'account/shopsalesaccount', '1', '0', '1', '2017-05-03 09:46:41', '2017-05-05 16:52:01', '', '1');
INSERT INTO `tp_module` VALUES ('460', '热卖商品', 'admin', 'account', 'bestsellergoods', '463', '3', 'account/bestsellergoods', '0', '0', '1', '2017-05-04 11:05:20', '2017-05-05 16:16:30', '', '1');
INSERT INTO `tp_module` VALUES ('461', '同行热卖', 'admin', 'account', 'shopgoodsgroupsalecount', '409', '2', 'account/shopgoodsgroupsalecount', '0', '0', '4', '2017-05-05 09:10:58', '2017-06-17 14:08:57', '', '0');
INSERT INTO `tp_module` VALUES ('462', '运营报告', 'admin', 'account', 'shopreport', '409', '2', 'account/shopreport', '1', '0', '5', '2017-05-05 09:23:32', null, '', '1');
INSERT INTO `tp_module` VALUES ('463', '商品分析', 'admin', 'account', 'shopgoodssaleslist', '409', '2', 'account/shopgoodssaleslist', '1', '0', '2', '2017-05-05 10:03:19', null, '', '1');
INSERT INTO `tp_module` VALUES ('467', '首页', 'admin', 'index', 'index', '0', '1', 'index/index', '1', '0', '0', '2017-05-11 14:53:32', '2017-06-24 10:13:42', '', '1');
INSERT INTO `tp_module` VALUES ('469', '满额包邮', 'admin', 'promotion', 'fullshipping', '179', '2', 'promotion/fullshipping', '1', '0', '6', '2017-05-16 17:49:22', null, '满额包邮设置', '1');
INSERT INTO `tp_module` VALUES ('471', '商家地址', 'admin', 'order', 'returnsetting', '184', '2', 'order/returnsetting', '1', '0', '5', '2017-05-31 15:29:20', '2017-05-31 15:34:06', '退货设置', '1');
INSERT INTO `tp_module` VALUES ('472', '添加或修改', 'admin', 'order', 'addreturn', '471', '3', 'order/addreturn', '1', '0', '1', '2017-05-31 15:31:32', '2017-05-31 15:34:27', '添加退货', '1');
INSERT INTO `tp_module` VALUES ('474', '首页公告', 'admin', 'config', 'updatenotice', '218', '2', 'config/updatenotice', '1', '0', '15', '2017-06-01 12:32:47', '2017-06-01 20:39:26', '公告', '1');
INSERT INTO `tp_module` VALUES ('478', '商品评价', 'admin', 'goods', 'goodscomment', '149', '2', 'goods/goodscomment', '1', '0', '8', '2017-06-01 17:55:14', null, '', '1');
INSERT INTO `tp_module` VALUES ('487', '模板编辑', 'admin', 'express', 'expresstemplate', '189', '3', 'express/expresstemplate', '0', '0', '1', '2017-06-03 11:19:53', null, '', '1');
INSERT INTO `tp_module` VALUES ('506', '模板管理', 'admin', 'config', 'notifytemplate', '439', '3', 'config/notifytemplate', '0', '0', '0', '2017-06-08 09:48:59', '2017-06-09 10:11:08', '', '1');
INSERT INTO `tp_module` VALUES ('508', '积分奖励', 'admin', 'promotion', 'integral', '446', '3', 'promotion/integral', '0', '0', '0', '2017-06-08 12:30:01', '2017-07-20 11:05:44', '', '0');
INSERT INTO `tp_module` VALUES ('509', '积分管理', 'admin', 'member', 'pointlist', '137', '2', 'member/pointlist', '1', '0', '5', '2017-06-08 15:13:27', '2017-06-08 15:17:02', '', '1');
INSERT INTO `tp_module` VALUES ('515', '欢迎页', 'admin', 'index', 'index', '467', '2', 'index/index', '1', '0', '0', '2017-06-09 11:31:02', null, '欢迎页', '1');
INSERT INTO `tp_module` VALUES ('516', '商品回收站', 'admin', 'goods', 'recycle', '149', '2', 'goods/recyclelist', '1', '0', '11', '2017-06-14 10:31:50', '2017-06-14 16:02:21', '', '1');
INSERT INTO `tp_module` VALUES ('517', '回收站列表', 'admin', 'goods', 'recyclelist', '516', '3', 'goods/recyclelist', '0', '0', '0', '2017-06-14 10:35:26', '2017-06-14 10:41:52', '', '1');
INSERT INTO `tp_module` VALUES ('519', '货到付款区域', 'admin', 'config', 'distributionareamanagement', '218', '2', 'config/distributionareamanagement', '0', '0', '24', '2017-06-14 14:15:52', '2017-07-20 10:54:07', '', '0');
INSERT INTO `tp_module` VALUES ('528', '自提点管理', 'admin', 'shop', 'pickuppointlist', '184', '2', 'shop/pickuppointlist', '1', '0', '6', '2017-06-20 14:33:51', '2017-06-20 16:37:40', '', '1');
INSERT INTO `tp_module` VALUES ('529', '添加自提点', 'admin', 'shop', 'addpickuppoint', '528', '3', 'shop/addpickuppoint', '0', '0', '0', '2017-06-20 14:51:26', '2017-06-20 20:20:29', '', '1');
INSERT INTO `tp_module` VALUES ('530', '修改自提点', 'admin', 'shop', 'updatepickuppoint', '528', '3', 'shop/updatepickuppoint', '0', '0', '0', '2017-06-20 17:39:37', null, '', '1');
INSERT INTO `tp_module` VALUES ('532', '在线更新', 'admin', 'upgrade', 'onlineupdate', '477', '2', 'upgrade/onlineupdate', '1', '0', '30', '2017-06-26 19:22:24', '2017-06-27 09:24:14', '在线更新', '1');
INSERT INTO `tp_module` VALUES ('533', '运费模板列表', 'admin', 'express', 'freighttemplatelist', '189', '3', 'express/freighttemplatelist', '0', '0', '0', '2017-06-27 14:19:23', null, '', '1');
INSERT INTO `tp_module` VALUES ('534', '编辑运费模板', 'admin', 'express', 'freighttemplateedit', '189', '3', 'express/freighttemplateedit', '0', '0', '2', '2017-06-27 14:22:36', null, '', '1');
INSERT INTO `tp_module` VALUES ('535', '系统', 'platform', 'system', 'modulelist', '0', '1', 'system/modulelist', '1', '0', '166', '2016-10-26 11:55:52', '2017-05-01 12:52:41', '\'\'', '0');
INSERT INTO `tp_module` VALUES ('536', '修改模块', 'platform', 'system', 'editmodule', '537', '3', 'system/editmodule', '0', '0', '2', '0000-00-00 00:00:00', '2017-05-09 10:47:02', '修改模块', '1');
INSERT INTO `tp_module` VALUES ('537', '模块列表', 'platform', 'system', 'modulelist', '535', '2', 'system/modulelist', '1', '0', '2', '0000-00-00 00:00:00', null, '\'\'', '1');
INSERT INTO `tp_module` VALUES ('538', '添加模块', 'platform', 'system', 'addmodule', '537', '3', 'system/addmodule', '0', '0', '2', '2017-02-06 12:21:57', null, '添加模块', '1');
INSERT INTO `tp_module` VALUES ('539', '用户', 'platform', 'auth', 'userlist', '0', '1', 'auth/userlist', '1', '0', '2', '0000-00-00 00:00:00', '2017-05-10 18:10:11', '该页面显示所有用户的相关信息。///可以对用户进行添加、修改操作。', '1');
INSERT INTO `tp_module` VALUES ('540', '用户列表', 'platform', 'auth', 'userlist', '539', '2', 'auth/userlist', '1', '0', '0', '0000-00-00 00:00:00', null, null, '1');
INSERT INTO `tp_module` VALUES ('541', '用户组列表', 'platform', 'auth', 'authgrouplist', '539', '2', 'auth/authgrouplist', '1', '0', '0', '0000-00-00 00:00:00', '2017-05-10 18:11:30', '该页面显示所有用户组的相关信息。///可以对用户组进行添加、修改等操作。', '1');
INSERT INTO `tp_module` VALUES ('542', '添加用户组', 'platform', 'Auth', 'addAuthGroup', '541', '3', 'Auth/addAuthGroup', '0', '0', '0', '2016-10-28 12:22:24', '2017-07-15 10:26:53', '用户组', '1');
INSERT INTO `tp_module` VALUES ('543', '编辑用户', 'platform', 'auth', 'edituser', '540', '3', 'auth/edituser', '0', '0', '5', '2016-11-11 12:10:47', '2017-07-07 14:57:20', '标识“&lt;em&gt;*&lt;/em&gt;”的选项为必填项，其余为选填项。', '1');
INSERT INTO `tp_module` VALUES ('544', '会员管理', 'platform', 'member', 'memberlist', '590', '2', 'member/memberlist', '1', '0', '3', '2016-11-01 18:05:17', '2017-05-08 18:51:36', '', '1');
INSERT INTO `tp_module` VALUES ('545', '会员列表', 'platform', 'member', 'memberlist', '544', '2', 'member/memberlist', '1', '0', '0', '2016-11-11 14:35:13', '2016-11-11 14:36:43', '', '1');
INSERT INTO `tp_module` VALUES ('546', '文章', 'platform', 'cms', 'articlelist', '0', '1', 'cms/articlelist', '1', '0', '5', '2017-01-10 10:08:48', '2017-05-10 19:05:07', '该页面显示所有文章列表。///可以对文章进行添加、修改、删除操作。///可以通过关键字进行搜索。<br>', '1');
INSERT INTO `tp_module` VALUES ('547', '平台', 'platform', 'index', 'index', '0', '1', 'index/index', '1', '0', '0', '2016-11-02 10:20:32', '2017-05-08 18:49:20', '', '1');
INSERT INTO `tp_module` VALUES ('548', '第三方登录', 'platform', 'config', 'partylogin', '652', '3', 'config/partylogin', '1', '0', '3', '2016-11-03 18:28:59', '2017-07-04 15:16:44', '', '1');
INSERT INTO `tp_module` VALUES ('549', '微信登录设置', 'platform', 'config', 'loginweixinconfig', '243', '3', 'config/loginweixinconfig', '0', '0', '2', '2016-11-15 15:44:17', '2017-04-18 10:22:38', '微信登录配置', '1');
INSERT INTO `tp_module` VALUES ('550', '添加广告位', 'platform', 'config', 'addplatformadvposition', '659', '3', 'config/addplatformadvposition', '0', '0', '0', '2017-01-14 13:54:35', '2017-02-08 16:41:21', '添加广告', '1');
INSERT INTO `tp_module` VALUES ('551', '编辑广告位', 'platform', 'config', 'updateplatformadvposition', '659', '3', 'config/updateplatformadvposition', '0', '0', '1', '2017-01-14 13:55:20', '2017-02-09 14:37:00', '编辑广告', '1');
INSERT INTO `tp_module` VALUES ('552', '导航管理', 'platform', 'config', 'shopnavigationlist', '547', '2', 'config/shopnavigationlist', '1', '0', '6', '2017-01-18 17:08:52', null, '导航管理', '1');
INSERT INTO `tp_module` VALUES ('553', '添加导航', 'platform', 'config', 'addshopnavigation', '552', '3', 'config/addshopnavigation', '0', '0', '3', '2017-01-18 17:29:39', null, '添加导航', '1');
INSERT INTO `tp_module` VALUES ('554', '修改导航', 'platform', 'config', 'updateshopnavigation', '552', '3', 'config/updateshopnavigation', '0', '0', '3', '2017-01-18 18:48:32', null, '修改导航', '1');
INSERT INTO `tp_module` VALUES ('555', '网站设置', 'platform', 'config', 'webconfig', '652', '3', 'config/webconfig', '1', '0', '0', '2016-11-02 10:20:32', '2017-05-09 11:18:15', '网站设置网站二维码设置，网站logo，网站基础设置。///网站提示测试查询', '1');
INSERT INTO `tp_module` VALUES ('556', '店铺管理', 'platform', 'shop', 'shoplist', '590', '2', 'shop/shoplist', '1', '0', '4', '2017-02-06 17:09:40', '2017-05-10 17:53:19', '展示了所有店铺的相关信息。///可以根据店铺的关键字搜索店铺。///可以修改店铺信息。', '1');
INSERT INTO `tp_module` VALUES ('557', '文章列表', 'platform', 'cms', 'articlelist', '546', '2', 'cms/articlelist', '1', '0', '1', '2017-02-08 15:25:33', '2017-05-10 19:07:55', '该页面显示所有文章列表。///可以对文章进行添加、修改、删除操作。///可以通过关键字进行搜索。', '1');
INSERT INTO `tp_module` VALUES ('558', '商品管理', 'platform', 'goods', 'goodslist', '590', '2', 'goods/goodslist', '1', '0', '0', '2017-02-08 15:31:54', '2017-05-10 17:13:28', '该页面展示了商城所有的商品信息，可对商品进行编辑修改操作。///可输入商品名称关键字进行搜索，侧边栏进行高级搜索。', '1');
INSERT INTO `tp_module` VALUES ('559', '商品分类', 'platform', 'goods', 'goodscategorylist', '558', '3', 'goods/goodscategorylist', '1', '0', '1', '2017-02-08 15:33:20', '2017-05-10 17:28:47', '展示了平台所有的商品分类。///可在列表直接增加下一级分类。///可在商品分类列表进行转移分类下的商品。///鼠标移动“设置”位置，可新增下一级分类、查看下一级分类、转移商品等操作。<br>', '1');
INSERT INTO `tp_module` VALUES ('560', '添加商品分类', 'platform', 'goods', 'addgoodscategory', '558', '3', 'goods/addgoodscategory', '0', '0', '3', '2017-02-08 15:35:04', null, '添加商品分类', '1');
INSERT INTO `tp_module` VALUES ('561', '修改商品分类', 'platform', 'goods', 'updategoodscategory', '558', '3', 'goods/updategoodscategory', '0', '0', '1', '2017-02-08 15:37:12', '2017-02-08 15:37:27', '修改商品分类', '1');
INSERT INTO `tp_module` VALUES ('562', '商品品牌', 'platform', 'goods', 'goodsbrandlist', '558', '3', 'goods/goodsbrandlist', '1', '0', '1', '2017-02-08 15:40:11', '2017-05-10 17:29:56', '展示了商城自营品牌的相关信息。///可以通过品牌关键字搜索相关品牌信息。', '1');
INSERT INTO `tp_module` VALUES ('563', '添加商品品牌', 'platform', 'goods', 'addgoodsbrand', '558', '3', 'goods/addgoodsbrand', '0', '0', '1', '2017-02-08 15:41:17', '2017-05-10 19:15:45', '带*为必填项，其余为选填项。', '1');
INSERT INTO `tp_module` VALUES ('564', '修改商品品牌', 'platform', 'goods', 'updategoodsbrand', '259', '3', 'goods/updategoodsbrand', '0', '0', '3', '2017-02-08 15:42:37', '2017-02-21 14:19:48', '修改品牌', '1');
INSERT INTO `tp_module` VALUES ('565', '店铺列表', 'platform', 'shop', 'shoplist', '556', '3', 'shop/shoplist', '1', '0', '1', '2017-02-08 15:45:55', '2017-05-10 17:40:39', '展示了所有店铺的相关信息。///可以根据店铺的关键字搜索店铺。', '1');
INSERT INTO `tp_module` VALUES ('566', '店铺审核', 'platform', 'shop', 'shopapplylist', '556', '3', 'shop/shopapplylist', '1', '0', '2', '2017-02-08 15:47:23', '2017-05-10 17:45:42', '该页面展示了所有店铺的信息。///可对店铺进行审核操作。', '1');
INSERT INTO `tp_module` VALUES ('567', '店铺等级', 'platform', 'shop', 'shoplevellist', '556', '3', 'shop/shoplevellist', '1', '0', '1', '2017-02-08 15:51:31', '2017-05-10 18:00:07', '该页面展示所有店铺等级的信息。///可以添加店铺等级、编辑店铺等级。', '1');
INSERT INTO `tp_module` VALUES ('568', '店铺分组', 'platform', 'shop', 'shopgrouplist', '556', '3', 'shop/shopgrouplist', '1', '0', '3', '2017-02-08 15:52:27', '2017-05-10 18:02:46', '该页面展示所有的店铺的分组。///可以通过关键字对分组进行查询。///可以添加、修改、删除分组。', '1');
INSERT INTO `tp_module` VALUES ('569', '友情链接', 'platform', 'config', 'linklist', '547', '2', 'config/linklist', '1', '0', '7', '2017-02-10 12:26:22', null, '友情链接', '1');
INSERT INTO `tp_module` VALUES ('570', '添加友情链接', 'platform', 'config', 'addlink', '569', '3', 'config/addlink', '0', '0', '0', '2017-02-10 12:28:16', null, '添加友情链接', '1');
INSERT INTO `tp_module` VALUES ('571', '修改友情链接', 'platform', 'config', 'updatelink', '569', '3', 'config/updatelink', '0', '0', '2', '2017-02-10 14:25:59', null, '修改友情链接', '1');
INSERT INTO `tp_module` VALUES ('572', '搜索设置', 'platform', 'config', 'searchconfig', '547', '2', 'config/searchconfig', '1', '0', '8', '2017-02-10 14:51:34', '2017-02-22 17:24:24', '搜索设置', '1');
INSERT INTO `tp_module` VALUES ('575', '分类列表', 'platform', 'cms', 'articleclasslist', '546', '2', 'cms/articleclasslist', '1', '0', '2', '2017-02-10 18:09:36', '2017-05-10 19:13:58', '该页面显示所有文章分类列表。///可以对文章进行添加、修改、删除操作。///可以通过关键字进行搜索。', '1');
INSERT INTO `tp_module` VALUES ('577', '首页版块', 'platform', 'config', 'blocklist', '656', '3', 'config/blocklist', '1', '0', '0', '2017-02-14 11:34:41', '2017-05-08 18:39:25', '首页版块', '1');
INSERT INTO `tp_module` VALUES ('580', '商品管理', 'platform', 'goods', 'goodslist', '558', '3', 'goods/goodslist', '1', '0', '0', '2017-02-15 16:59:33', '2017-05-10 17:11:36', '该页面展示了商城所有的商品信息，可对商品进行编辑修改操作。///可输入商品名称关键字进行搜索，侧边栏进行高级搜索。', '1');
INSERT INTO `tp_module` VALUES ('581', '支付配置', 'platform', 'config', 'paymentconfig', '652', '3', 'config/paymentconfig', '1', '0', '2', '2017-02-16 10:17:41', '2017-07-04 12:19:50', '支付配置，微信，支付宝', '1');
INSERT INTO `tp_module` VALUES ('582', '订单管理', 'platform', 'order', 'orderlist', '590', '2', 'order/orderlist', '1', '0', '1', '2017-02-16 16:38:00', '2017-05-10 17:30:58', '商城所有的订单列表，包括平台自营和入驻商家的订单。///点击订单号即可进入详情页面对订单进行操作。///Tab切换不同状态下的订单，便于分类订单。', '1');
INSERT INTO `tp_module` VALUES ('583', '订单列表', 'platform', 'order', 'orderlist', '582', '2', 'order/orderlist', '0', '0', '3', '2017-02-16 16:38:41', null, '订单列表', '1');
INSERT INTO `tp_module` VALUES ('584', '添加店铺分组', 'platform', 'shop', 'addshopgroup', '556', '3', 'shop/addshopgroup', '0', '0', '1', '2017-02-17 10:56:17', '2017-05-10 18:04:54', '标识“<em>*</em>”的选项为必填项，其余为选填项。', '1');
INSERT INTO `tp_module` VALUES ('585', '修改店铺分组', 'platform', 'shop', 'updateshopgroup', '556', '3', 'shop/updateshopgroup', '0', '0', '1', '2017-02-17 10:57:33', '2017-05-10 18:04:29', '标识“<em>*</em>”的选项为必填项，其余为选填项。', '1');
INSERT INTO `tp_module` VALUES ('586', '添加店铺等级', 'platform', 'shop', 'addshoplevel', '556', '3', 'shop/addshoplevel', '0', '0', '1', '2017-02-17 12:18:32', '2017-05-10 17:58:24', '标识“<em>*</em>”的选项为必填项，其余为选填项。', '1');
INSERT INTO `tp_module` VALUES ('587', '审核详情', 'platform', 'shop', 'shopverify', '566', '3', 'shop/shopverify', '0', '0', '1', '2017-02-17 16:33:21', '2017-02-17 16:34:33', '店铺审核详情', '1');
INSERT INTO `tp_module` VALUES ('588', '帮助类型', 'platform', 'config', 'helpclass', '653', '3', 'config/helpclass', '1', '0', '2', '2017-02-17 16:59:26', '2017-05-08 18:32:31', '', '1');
INSERT INTO `tp_module` VALUES ('589', '帮助内容', 'platform', 'config', 'helpdocument', '653', '3', 'config/helpdocument', '1', '0', '1', '2017-02-17 17:08:42', '2017-05-08 18:33:03', '', '1');
INSERT INTO `tp_module` VALUES ('590', '商城', 'platform', 'goods', 'goodslist', '0', '1', 'goods/goodslist', '1', '0', '1', '2017-02-21 10:54:59', '2017-05-08 18:47:54', '控制台，首页', '1');
INSERT INTO `tp_module` VALUES ('591', '促销版块', 'platform', 'config', 'goodsrecommendclass', '656', '3', 'config/goodsrecommendclass', '1', '0', '1', '2017-02-22 09:44:35', '2017-05-08 18:39:59', '促销版块', '1');
INSERT INTO `tp_module` VALUES ('592', '首页公告', 'platform', 'config', 'usernotice', '547', '2', 'config/usernotice', '1', '0', '19', '2017-02-23 14:10:30', null, '用户通知，显示在商城前台个人中心', '1');
INSERT INTO `tp_module` VALUES ('593', '统计', 'platform', 'statistics', 'userstat', '0', '1', 'statistics/userstat', '1', '0', '4', '2017-02-24 11:37:07', '2017-07-21 12:30:10', '统计，包括会员统计，店铺统计，销量统计，商品分析', '1');
INSERT INTO `tp_module` VALUES ('594', '会员统计', 'platform', 'statistics', 'userstat', '593', '2', 'statistics/userstat', '1', '0', '1', '2017-02-24 11:38:27', '2017-05-10 19:18:32', '会员统计并用走势图直观呈现', '1');
INSERT INTO `tp_module` VALUES ('595', '店铺统计', 'platform', 'statistics', 'shopaccountlist', '593', '2', 'statistics/shopaccountlist', '1', '0', '1', '2017-02-24 11:40:34', '2017-05-10 19:18:18', '店铺统计并用走势图直观呈现', '1');
INSERT INTO `tp_module` VALUES ('596', '订单统计', 'platform', 'statistics', 'orderstat', '593', '2', 'statistics/orderstat', '1', '0', '2', '2017-02-24 11:45:00', '2017-05-10 19:19:17', '订单统计并用走势图直观呈现', '1');
INSERT INTO `tp_module` VALUES ('597', '商品分析', 'platform', 'statistics', 'goodsstat', '593', '2', 'statistics/goodsstat', '0', '0', '3', '2017-02-24 11:46:48', '2017-07-21 17:41:09', '商品分析统计并用走势图直观呈现', '1');
INSERT INTO `tp_module` VALUES ('598', '售后分析', 'platform', 'statistics', 'aftersale', '593', '2', 'statistics/aftersale', '0', '0', '4', '2017-02-24 11:50:03', '2017-05-10 19:20:19', '售后分析统计并用走势图直观呈现', '1');
INSERT INTO `tp_module` VALUES ('599', '统计概述', 'platform', 'statistics', 'statgeneral', '593', '2', 'statistics/statgeneral', '0', '0', '0', '2017-02-24 11:53:07', '2017-07-21 12:29:38', '统计并用走势图直观呈现', '0');
INSERT INTO `tp_module` VALUES ('605', '积分设置', 'platform', 'config', 'pointconfig', '652', '3', 'config/pointconfig', '1', '0', '9', '2017-03-01 10:24:47', '2017-07-04 18:39:33', '积分设置', '1');
INSERT INTO `tp_module` VALUES ('606', '添加用户', 'platform', 'auth', 'adduser', '540', '3', 'auth/adduser', '0', '0', '0', '2017-03-02 14:24:00', '2017-05-10 18:08:31', '标识“<em>*</em>”的选项为必填项，其余为选填项。', '1');
INSERT INTO `tp_module` VALUES ('607', '修改用户组', 'platform', 'Auth', 'updateAuthGroup', '541', '3', 'Auth/updateAuthGroup', '0', '0', '3', '2017-03-02 14:35:18', '2017-07-15 10:27:27', '修改用户组', '1');
INSERT INTO `tp_module` VALUES ('608', '邮箱短信', 'platform', 'config', 'notifyindex', '652', '3', 'config/notifyindex', '1', '0', '7', '2017-03-03 14:06:10', '2017-07-04 16:41:53', '邮箱设置，短信设置', '1');
INSERT INTO `tp_module` VALUES ('636', '微信', 'platform', 'wchat', 'config', '0', '1', 'wchat/config', '1', '0', '3', '2017-03-27 10:17:48', '2017-05-10 18:15:16', '该页面显示微信公众号的相关配置信息。', '1');
INSERT INTO `tp_module` VALUES ('637', '公众号管理', 'platform', 'wchat', 'config', '636', '2', 'wchat/config', '1', '0', '0', '2017-03-27 16:04:58', '2017-05-10 18:16:04', '该页面显示微信公众号的相关配置信息。', '1');
INSERT INTO `tp_module` VALUES ('638', '微信菜单', 'platform', 'wchat', 'menu', '636', '2', 'wchat/menu', '1', '0', '0', '2017-03-27 16:11:22', '2017-05-10 18:17:18', '该页面显示微信菜单的全部信息。', '1');
INSERT INTO `tp_module` VALUES ('639', '推广二维码', 'platform', 'wchat', 'weixinqrcodetemplate', '636', '2', 'wchat/weixinqrcodetemplate', '1', '0', '0', '2017-03-27 16:15:55', '2017-05-10 18:18:54', '该页面显示已推广的所有二维码。///可以添加、修改、删除以及设为默认二维码。', '1');
INSERT INTO `tp_module` VALUES ('640', '回复设置', 'platform', 'wchat', 'replayconfig', '636', '2', 'wchat/replayconfig', '1', '0', '0', '2017-03-27 16:16:58', '2017-05-10 18:22:10', '该页面展示了所有的回复设置信息。///可以对回复进行添加、修改、删除操作。<br>', '1');
INSERT INTO `tp_module` VALUES ('641', '消息素材', 'platform', 'wchat', 'materialmessage', '636', '2', 'wchat/materialmessage', '1', '0', '0', '2017-03-27 16:17:50', '2017-05-10 18:24:29', '该页面展示了所有素材消息。//可以对素材进行添加、修改、删除操作。///可以通过关键字进行搜索。', '1');
INSERT INTO `tp_module` VALUES ('643', '分享内容', 'platform', 'wchat', 'shareconfig', '636', '2', 'wchat/shareconfig', '1', '0', '0', '2017-03-27 16:19:37', '2017-05-10 18:28:02', '该页面展示了分享内容的流程。', '1');
INSERT INTO `tp_module` VALUES ('644', '账务统计', 'platform', 'statistics', 'platformaccountrecordscountlist', '593', '2', 'statistics/platformaccountrecordscountlist', '0', '0', '7', '2017-03-29 11:40:43', '2017-05-10 19:20:34', '账务统计并用走势图直观呈现', '1');
INSERT INTO `tp_module` VALUES ('645', '店铺提现', 'platform', 'shop', 'shopaccountwithdrawlist', '556', '3', 'shop/shopaccountwithdrawlist', '1', '0', '4', '2017-03-29 11:59:09', '2017-05-10 18:07:05', '显示所有提现的店铺的相关信息以及提现信息。///可以对体现店铺进行查看等操作。', '1');
INSERT INTO `tp_module` VALUES ('646', '开放平台', 'platform', 'wchat', 'weixinopenplatformconfig', '636', '2', 'wchat/weixinopenplatformconfig', '0', '0', '0', '2017-03-30 11:17:32', '2017-07-04 10:34:09', '该页面显示了微信开放平台的相关信息。', '0');
INSERT INTO `tp_module` VALUES ('647', '验证码设置', 'platform', 'config', 'codeconfig', '652', '3', 'config/codeconfig', '1', '0', '6', '2017-04-01 09:28:19', '2017-05-08 18:28:23', '', '1');
INSERT INTO `tp_module` VALUES ('648', '店铺销售明细', 'platform', 'account', 'shoporderaccountrecordslist', '297', '3', 'account/shoporderaccountrecordslist', '0', '0', '1', '2017-04-01 16:17:39', '2017-05-10 19:18:47', '店铺销售明细统计并用走势图直观呈现', '1');
INSERT INTO `tp_module` VALUES ('649', '商品销售明细', 'platform', 'account', 'shopordergoodsaccountrecordslist', '597', '3', 'account/shopordergoodsaccountrecordslist', '0', '0', '1', '2017-04-01 16:18:58', '2017-05-10 19:20:00', '商品销售明细统计并用走势图直观呈现', '1');
INSERT INTO `tp_module` VALUES ('650', '商品分类销售', 'platform', 'statistics', 'goodscategorysalenumrank', '593', '2', 'statistics/goodscategorysalenumrank', '1', '0', '8', '2017-04-02 14:34:58', '2017-05-10 19:20:53', '商品分类销售分销统计并用走势图直观呈现', '1');
INSERT INTO `tp_module` VALUES ('651', '平台统计', 'platform', 'statistics', 'platformaccountmonthrecored', '593', '2', 'statistics/platformaccountmonthrecored', '1', '0', '1', '2017-04-02 14:58:12', '2017-05-10 19:19:04', '平台统计并用走势图直观呈现', '1');
INSERT INTO `tp_module` VALUES ('652', '基础设置', 'platform', 'config', 'webconfig', '547', '2', 'config/webconfig', '1', '0', '1', '2017-05-08 18:24:12', null, '基础设置', '1');
INSERT INTO `tp_module` VALUES ('653', '帮助设置', 'platform', 'config', 'helpdocument', '547', '2', 'config/helpdocument', '1', '0', '3', '2017-05-08 18:31:58', '2017-05-08 18:33:36', '', '1');
INSERT INTO `tp_module` VALUES ('654', '添加内容', 'platform', 'config', 'adddocument', '653', '3', 'config/adddocument', '0', '0', '0', '2017-05-08 18:35:13', null, '', '1');
INSERT INTO `tp_module` VALUES ('655', '编辑内容', 'platform', 'config', 'updatedocument', '653', '3', 'config/updatedocument', '0', '0', '0', '2017-05-08 18:36:17', null, '', '1');
INSERT INTO `tp_module` VALUES ('656', '版块设置', 'platform', 'config', 'blocklist', '547', '2', 'config/blocklist', '1', '0', '4', '2017-05-08 18:38:58', null, '', '1');
INSERT INTO `tp_module` VALUES ('657', '控制台', 'platform', 'index', 'index', '547', '2', 'index/index', '1', '0', '0', '2017-05-08 18:48:53', null, '', '1');
INSERT INTO `tp_module` VALUES ('658', '添加帮助类型', 'platform', 'config', 'addhelpclass', '653', '3', 'config/addhelpclass', '0', '0', '11', '2017-05-09 09:42:10', null, '', '1');
INSERT INTO `tp_module` VALUES ('659', '广告设置', 'platform', 'config', 'platformadvpositionlist', '547', '2', 'config/platformadvpositionlist', '1', '0', '5', '2017-05-09 10:02:51', null, '', '1');
INSERT INTO `tp_module` VALUES ('660', '广告管理', 'platform', 'config', 'platformadvlist', '659', '3', 'config/platformadvlist', '0', '0', '4', '2017-05-09 10:11:02', null, '', '1');
INSERT INTO `tp_module` VALUES ('661', '添加广告', 'platform', 'config', 'addplatformadv', '659', '3', 'config/addplatformadv', '0', '0', '5', '2017-05-09 10:11:56', null, '', '1');
INSERT INTO `tp_module` VALUES ('662', '编辑广告', 'platform', 'config', 'updateplatformadv', '659', '3', 'config/updateplatformadv', '0', '0', '6', '2017-05-09 10:13:09', null, '', '1');
INSERT INTO `tp_module` VALUES ('663', '订单详情', 'platform', 'order', 'orderdetail', '582', '3', 'order/orderdetail', '0', '0', '0', '2017-05-09 10:19:53', null, '', '1');
INSERT INTO `tp_module` VALUES ('664', '修改店铺', 'platform', 'shop', 'updateshop', '556', '3', 'shop/updateshop', '0', '0', '0', '2017-05-09 10:26:55', '2017-05-10 17:48:27', '<br>', '1');
INSERT INTO `tp_module` VALUES ('665', '修改店铺等级', 'platform', 'shop', 'updateshoplevel', '556', '3', 'shop/updateshoplevel', '0', '0', '0', '2017-05-09 10:30:01', '2017-05-10 17:51:25', '展示了对应等级下的所有权限。//勾选操作可以对该等级设置权限。', '1');
INSERT INTO `tp_module` VALUES ('666', '添加自定义模板', 'platform', 'wchat', 'qrcode', '639', '3', 'wchat/qrcode', '0', '0', '0', '2017-05-09 10:33:25', null, '', '1');
INSERT INTO `tp_module` VALUES ('671', '商品规格', 'platform', 'goods', 'goodsspeclist', '558', '1', 'goods/goodsspeclist', '1', '0', '6', '2017-06-01 18:47:58', '2017-07-12 12:09:30', '商品规格', '1');
INSERT INTO `tp_module` VALUES ('673', '添加商品规格', 'platform', 'goods', 'addgoodsspec', '671', '3', 'goods/addgoodsspec', '0', '0', '1', '2017-06-02 10:01:35', null, '', '1');
INSERT INTO `tp_module` VALUES ('674', '修改商品规格', 'platform', 'goods', 'updategoodsspec', '671', '3', 'goods/updategoodsspec', '0', '0', '0', '2017-06-02 15:02:35', null, '', '1');
INSERT INTO `tp_module` VALUES ('678', '广告管理', 'admin', 'config', 'shopadlist', '218', '2', 'config/shopadlist', '1', '0', '2', '2017-07-04 11:50:27', null, '', '1');
INSERT INTO `tp_module` VALUES ('679', '添加广告', 'admin', 'config', 'addshopad', '678', '3', 'config/addshopad', '1', '0', '1', '2017-07-04 11:52:26', null, '', '1');
INSERT INTO `tp_module` VALUES ('680', '修改广告', 'admin', 'config', 'updateshopad', '678', '3', 'config/updateshopad', '1', '0', '0', '2017-07-04 11:54:01', null, '', '1');
INSERT INTO `tp_module` VALUES ('681', 'seo设置', 'platform', 'config', 'seoConfig', '652', '3', 'config/seoconfig', '1', '0', '1', '2017-07-04 12:14:06', null, '', '1');
INSERT INTO `tp_module` VALUES ('682', '支付宝支付', 'platform', 'config', 'payaliconfig', '652', '3', 'config/payaliconfig', '0', '0', '3', '2017-07-04 12:24:10', '2017-07-04 14:52:21', '', '1');
INSERT INTO `tp_module` VALUES ('683', '微信支付', 'platform', 'config', 'payconfig', '652', '3', 'config/payconfig', '0', '0', '4', '2017-07-04 14:09:42', '2017-07-04 14:53:12', '', '1');
INSERT INTO `tp_module` VALUES ('684', '店铺收入', 'admin', 'account', 'shopaccount', '409', '2', 'account/shopaccount', '1', '0', '0', '2017-07-04 14:14:57', null, '', '1');
INSERT INTO `tp_module` VALUES ('687', '微信登录', 'platform', 'config', 'loginwchatconfig', '652', '3', 'config/loginwchatconfig', '0', '0', '5', '2017-07-04 16:33:27', '2017-07-04 17:54:32', '', '1');
INSERT INTO `tp_module` VALUES ('689', '邮件通知', 'platform', 'config', 'messageemailconfig', '652', '3', 'config/messageemailconfig', '0', '0', '0', '2017-07-04 16:54:52', '2017-07-04 17:22:45', '', '1');
INSERT INTO `tp_module` VALUES ('690', '短信通知', 'platform', 'config', 'messagesmsconfig', '652', '3', 'config/messagesmsconfig', '0', '0', '0', '2017-07-04 17:23:24', null, '', '1');
INSERT INTO `tp_module` VALUES ('691', 'qq登录', 'platform', 'config', 'loginqqsetconfig', '652', '3', 'config/loginqqsetconfig', '0', '0', '0', '2017-07-04 17:55:49', null, '', '1');
INSERT INTO `tp_module` VALUES ('695', '积分管理', 'platform', 'config', 'pointConfig', '652', '3', 'config/pointconfig', '0', '0', '0', '2017-07-04 18:22:27', null, '', '1');
INSERT INTO `tp_module` VALUES ('696', '积分奖励', 'platform', 'config', 'integral', '652', '3', 'config/integral', '0', '0', '0', '2017-07-04 18:23:00', null, '', '1');
INSERT INTO `tp_module` VALUES ('697', '邮件模板', 'platform', 'config', 'notifyemailtemplate', '652', '3', 'config/notifyemailtemplate', '0', '0', '0', '2017-07-05 09:19:10', null, '', '1');
INSERT INTO `tp_module` VALUES ('698', '短信模板', 'platform', 'config', 'notifysmstemplate', '652', '3', 'config/notifysmstemplate', '0', '0', '0', '2017-07-05 09:19:46', null, '', '1');
INSERT INTO `tp_module` VALUES ('699', '首页公告', 'platform', 'config', 'updatenotice', '547', '2', 'config/updatenotice', '1', '0', '9', '2017-07-05 16:08:02', null, '', '1');
INSERT INTO `tp_module` VALUES ('701', '修改版块', 'platform', 'config', 'updateBlock', '656', '3', 'config/updateblock', '0', '0', '0', '2017-07-05 17:57:48', null, '', '1');
INSERT INTO `tp_module` VALUES ('702', '积分明细', 'platform', 'member', 'pointdetail', '544', '3', 'member/pointdetail', '0', '0', '0', '2017-07-07 14:32:44', null, '', '1');
INSERT INTO `tp_module` VALUES ('703', '余额明细', 'platform', 'member', 'accountdetail', '544', '3', 'member/accountdetail', '0', '0', '0', '2017-07-07 14:33:27', '2017-07-15 15:17:28', '余额明细', '1');
INSERT INTO `tp_module` VALUES ('705', '会员等级', 'platform', 'Member', 'memberLevelList', '544', '3', 'member/memberlevellist', '1', '0', '1', '2017-07-07 15:20:52', null, '会员等级管理', '1');
INSERT INTO `tp_module` VALUES ('706', '购物设置', 'platform', 'config', 'shopset', '590', '2', 'config/shopset', '1', '0', '5', '2017-07-07 15:22:38', '2017-07-07 15:23:04', '', '1');
INSERT INTO `tp_module` VALUES ('707', '会员提现', 'platform', 'Member', 'userCommissionWithdrawList', '544', '3', 'member/usercommissionwithdrawlist', '1', '0', '2', '2017-07-07 15:22:15', null, '会员提现列表', '1');
INSERT INTO `tp_module` VALUES ('708', '粉丝列表', 'platform', 'member', 'weixinfanslist', '544', '3', 'member/weixinfanslist', '1', '0', '6', '2017-07-07 17:38:54', null, '', '1');
INSERT INTO `tp_module` VALUES ('709', '积分管理', 'platform', 'member', 'pointlist', '544', '3', 'member/pointlist', '1', '0', '4', '2017-07-07 18:17:50', null, '', '1');
INSERT INTO `tp_module` VALUES ('710', '专题列表', 'platform', 'Cms', 'topicList', '546', '2', 'cms/topiclist', '1', '0', '3', '2017-07-07 18:16:00', null, '专题列表', '1');
INSERT INTO `tp_module` VALUES ('711', '余额管理', 'platform', 'member', 'accountlist', '544', '3', 'member/accountlist', '1', '0', '5', '2017-07-07 18:18:26', null, '', '1');
INSERT INTO `tp_module` VALUES ('713', '提现设置', 'platform', 'config', 'memberwithdrawsetting', '590', '2', 'config/memberwithdrawsetting', '1', '0', '7', '2017-07-10 10:51:04', '2017-07-10 11:08:04', '', '1');
INSERT INTO `tp_module` VALUES ('714', '注册与访问', 'platform', 'Config', 'registerAndVisit', '547', '2', 'config/registerandvisit', '1', '0', '2', '2017-07-10 11:41:26', '2017-07-12 19:35:08', '注册与访问', '1');
INSERT INTO `tp_module` VALUES ('715', '模板消息设置', 'platform', 'Wchat', 'messageTemplate', '636', '2', 'wchat/messagetemplate', '1', '0', '7', '2017-07-10 14:58:24', null, '模板消息设置', '1');
INSERT INTO `tp_module` VALUES ('717', '添加版块', 'platform', 'config', 'addblock', '656', '3', 'config/addblock', '0', '0', '0', '2017-07-11 17:56:41', null, '添加版块', '1');
INSERT INTO `tp_module` VALUES ('720', '商品类型', 'platform', 'goods', 'attributelist', '558', '3', 'goods/attributelist', '1', '0', '3', '2017-07-12 12:12:50', '2017-07-12 12:13:51', '', '1');
INSERT INTO `tp_module` VALUES ('723', '添加商品类型', 'platform', 'goods', 'addattributeservice', '558', '3', 'goods/addattributeservice', '0', '0', '3', '2017-07-12 18:19:01', null, '', '1');
INSERT INTO `tp_module` VALUES ('725', '修改商品类型', 'platform', 'goods', 'updategoodsattribute', '558', '3', 'goods/updategoodsattribute', '0', '0', '3', '2017-07-12 18:20:38', null, '', '1');
INSERT INTO `tp_module` VALUES ('726', '提现', 'admin', 'Account', 'applyshopaccountwithdraw', '684', '3', 'Account/applyShopAccountWithdraw', '1', '0', '0', '2017-07-13 16:19:01', null, '提现', '1');
INSERT INTO `tp_module` VALUES ('727', '添加账户', 'admin', 'Account', 'addShopAccountBank', '684', '3', 'Account/addShopAccountBank', '1', '0', '1', '2017-07-13 16:24:24', null, '添加账户', '1');
INSERT INTO `tp_module` VALUES ('729', '账户列表', 'admin', 'Account', 'shopBankAccountList', '684', '3', 'Account/shopBankAccountList', '1', '0', '0', '2017-07-13 16:26:49', null, '账户列表', '1');
INSERT INTO `tp_module` VALUES ('730', '修改账户', 'admin', 'Account', 'updateBankAccount', '684', '3', 'Account/updateBankAccount', '1', '0', '0', '2017-07-13 16:36:46', null, '修改账户', '1');
INSERT INTO `tp_module` VALUES ('732', '提现列表', 'admin', 'account', 'shopAccountWithdrawList', '684', '3', 'account/shopAccountWithdrawList', '1', '0', '0', '2017-07-13 16:51:49', null, '提现列表', '1');
INSERT INTO `tp_module` VALUES ('733', '地区管理', 'platform', 'Config', 'areaManagement', '590', '2', 'Config/areaManagement', '1', '0', '8', '2017-07-13 18:00:52', null, '地区管理', '1');
INSERT INTO `tp_module` VALUES ('734', '添加等级', 'platform', 'Member', 'addMemberLevel', '544', '3', 'Member/addMemberLevel', '0', '0', '6', '2017-07-15 10:17:05', null, '添加等级', '1');
INSERT INTO `tp_module` VALUES ('735', '修改等级', 'platform', 'Member', 'updateMemberLevel', '544', '3', 'Member/updateMemberLevel', '0', '0', '9', '2017-07-15 10:18:26', null, '修改等级', '1');
INSERT INTO `tp_module` VALUES ('737', '添加素材', 'platform', 'Wchat', 'addMedia', '641', '3', 'Wchat/addMedia', '0', '0', '0', '2017-07-15 10:44:44', null, '添加素材', '1');
INSERT INTO `tp_module` VALUES ('738', '修改素材', 'platform', 'Wchat', 'updateMedia', '641', '3', 'Wchat/updateMedia', '0', '0', '0', '2017-07-15 10:45:25', null, '修改素材', '1');
INSERT INTO `tp_module` VALUES ('739', '添加文章', 'platform', 'Cms', 'addArticle', '557', '3', 'Cms/addArticle', '0', '0', '0', '2017-07-15 10:49:47', null, '添加文章', '1');
INSERT INTO `tp_module` VALUES ('740', '修改文章', 'platform', 'Cms', 'updateArticle', '557', '3', 'Cms/updateArticle', '0', '0', '0', '2017-07-15 10:50:30', null, '修改文章', '1');
INSERT INTO `tp_module` VALUES ('741', '添加分类', 'platform', 'Cms', 'addArticleClass', '575', '3', 'Cms/addArticleClass', '0', '0', '1', '2017-07-15 10:51:17', null, '添加分类', '1');
INSERT INTO `tp_module` VALUES ('742', '修改分类', 'platform', 'Cms', 'updateArticleClass', '575', '3', 'Cms/updateArticleClass', '0', '0', '1', '2017-07-15 10:50:54', null, '修改分类', '1');
INSERT INTO `tp_module` VALUES ('743', '添加专题', 'platform', 'Cms', 'addTopic', '710', '3', 'Cms/addTopic', '0', '0', '2', '2017-07-15 10:51:58', null, '添加专题', '1');
INSERT INTO `tp_module` VALUES ('744', '修改专题', 'platform', 'Cms', 'updateTopic', '710', '3', 'Cms/updateTopic', '0', '0', '2', '2017-07-15 10:52:33', null, '修改专题', '1');
INSERT INTO `tp_module` VALUES ('745', '添加回复', 'platform', 'Wchat', 'addOrUpdateKeyReplay', '640', '3', 'Wchat/addOrUpdateKeyReplay', '0', '0', '0', '2017-07-15 11:40:02', null, '添加回复或修改', '1');
INSERT INTO `tp_module` VALUES ('10001', '供货商', 'admin', 'member', 'supplierlist', '137', '2', 'member/supplierlist', '1', '0', '7', '2017-07-12 17:52:00', '2017-07-12 17:52:00', '', '1');
INSERT INTO `tp_module` VALUES ('10002', '添加供货商', 'admin', 'member', 'addsupplier', '10001', '3', 'member/addsupplier', '1', '0', '0', '2017-07-12 17:52:00', '2017-07-12 17:52:00', '', '1');
INSERT INTO `tp_module` VALUES ('10003', '修改供货商', 'admin', 'member', 'updatesupplier', '10001', '3', 'member/updatesupplier', '1', '0', '1', '2017-07-12 17:52:00', '2017-07-12 17:52:00', '', '1');
INSERT INTO `tp_module` VALUES ('10004', '店铺统计详情', 'platform', 'account', 'shopaccountrecordslist', '595', '3', 'account/shopaccountrecordslist', '0', '0', '0', '2017-07-18 15:40:41', '2017-07-18 15:45:13', '', '1');
INSERT INTO `tp_module` VALUES ('10005', '货到付款区域', 'platform', 'config', 'distributionareamanagement', '590', '2', 'config/distributionareamanagement', '1', '0', '9', '2017-07-19 11:51:40', '2017-07-19 19:02:47', '', '1');
INSERT INTO `tp_module` VALUES ('10006', '促销版块', 'admin', 'System', 'goodsRecommendClass', '218', '2', 'System/goodsRecommendClass', '1', '0', '2', '2017-07-20 09:45:20', '2017-07-20 10:20:27', '促销版块', '1');
INSERT INTO `tp_module` VALUES ('10007', '供货商', 'admin', 'goods', 'supplierlist', '149', '2', 'goods/supplierlist', '1', '0', '12', '2017-07-24 10:46:32', null, '', '1');
INSERT INTO `tp_module` VALUES ('10008', '添加供货商', 'admin', 'goods', 'addsupplier', '10007', '3', 'goods/addsupplier', '0', '0', '0', '2017-07-24 10:49:45', '2017-07-24 10:50:08', '', '1');
INSERT INTO `tp_module` VALUES ('10009', '修改供货商', 'admin', 'goods', 'updatesupplier', '10007', '3', 'goods/updatesupplier', '0', '0', '1', '2017-07-24 10:52:03', null, '', '1');
INSERT INTO `tp_module` VALUES ('10010', '店铺添加', 'platform', 'shop', 'addPlatformShop', '556', '3', 'shop/addPlatformShop', '1', '0', '5', '2017-07-24 15:45:09', '2017-07-24 17:39:09', '', '1');
INSERT INTO `tp_module` VALUES ('10011', '满减送管理', 'platform', 'promotion', 'mansonglist', '10013', '2', 'promotion/mansonglist', '1', '0', '10', '2017-07-25 12:01:31', '2017-07-26 09:39:45', '', '1');
INSERT INTO `tp_module` VALUES ('10012', '限时折扣管理', 'platform', 'promotion', 'getdiscountlist', '10013', '2', 'promotion/getdiscountlist', '1', '0', '11', '2017-07-25 12:02:27', '2017-07-26 09:40:07', '', '1');
INSERT INTO `tp_module` VALUES ('10013', '运营', 'platform', 'Operate', 'index', '0', '1', 'Operate/index', '1', '0', '6', '2017-07-25 14:47:44', '2017-07-25 14:53:44', '', '1');
INSERT INTO `tp_module` VALUES ('10015', '基本设置', 'platform', 'Operate', 'index', '10013', '2', 'Operate/index', '1', '0', '0', '2017-07-25 15:00:37', null, '', '1');
INSERT INTO `tp_module` VALUES ('10016', '查看满减送活动详情', 'platform', 'promotion', 'promotioninfo', '10011', '3', 'promotion/promotioninfo', '0', '0', '3', '2017-07-25 17:07:17', null, '', '1');
INSERT INTO `tp_module` VALUES ('10017', '查看限时折扣详情', 'platform', 'promotion', 'discountinfo', '10012', '3', 'promotion/discountinfo', '0', '0', '0', '2017-07-25 19:12:24', null, '', '1');
INSERT INTO `tp_module` VALUES ('10018', '入驻指南', 'platform', 'Shop', 'arrivalGuide', '556', '3', 'Shop/arrivalGuide', '1', '0', '6', '2017-07-27 10:15:51', '2017-07-27 10:17:29', '入驻指南', '1');
INSERT INTO `tp_module` VALUES ('10019', '添加内容', 'platform', 'Shop', 'addGuide', '556', '3', 'Shop/addGuide', '0', '0', '1', '2017-07-28 10:04:10', null, '添加内容', '1');
INSERT INTO `tp_module` VALUES ('10020', '修改内容', 'platform', 'Shop', 'updateGuide', '556', '3', 'Shop/updateGuide', '0', '0', '2', '2017-07-28 10:04:53', null, '修改内容', '1');
INSERT INTO `tp_module` VALUES ('10021', '意见反馈', 'platform', 'Member', 'feedbackList', '544', '3', 'Member/feedbackList', '1', '0', '7', '2017-07-28 14:40:58', null, '意见反馈列表', '1');
INSERT INTO `tp_module` VALUES ('10022', '导航管理', 'admin', 'Config', 'shopNavigationList', '218', '2', 'Config/shopNavigationList', '1', '0', '4', '2017-07-29 11:24:37', '2017-07-29 11:27:32', '导航管理', '1');
INSERT INTO `tp_module` VALUES ('10023', '添加导航', 'admin', 'Config', 'addShopNavigation', '10022', '3', 'Config/addShopNavigation', '1', '0', '0', '2017-07-29 11:42:01', null, '添加导航', '1');
INSERT INTO `tp_module` VALUES ('10024', '修改导航', 'admin', 'Config', 'updateShopNavigation', '10022', '3', 'Config/updateShopNavigation', '1', '0', '0', '2017-07-29 11:45:21', null, '修改导航', '1');
INSERT INTO `tp_module` VALUES ('10025', '线下店铺', 'admin', 'Shop', 'offlineStore', '218', '2', 'Shop/offlineStore', '1', '0', '4', '2017-07-29 14:44:18', '2017-07-29 14:44:56', '线下店铺', '1');
INSERT INTO `tp_module` VALUES ('10026', '修改用户组', 'admin', 'auth', 'updateusergroup', '128', '3', 'auth/updateusergroup', '0', '0', '2', '2018-10-27 23:09:59', null, '用户组', '1');

-- ----------------------------
-- Table structure for tp_notice
-- ----------------------------
DROP TABLE IF EXISTS `tp_notice`;
CREATE TABLE `tp_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `shopid` int(11) NOT NULL COMMENT '店铺ID（单店版为0）',
  `notice_message` varchar(255) DEFAULT '' COMMENT '公告内容',
  `is_enable` tinyint(1) DEFAULT '0' COMMENT '是否启用（0：隐藏，1：显示）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='网站公告';

-- ----------------------------
-- Records of tp_notice
-- ----------------------------
INSERT INTO `tp_notice` VALUES ('7', '0', '手机端首页公告', '1');
INSERT INTO `tp_notice` VALUES ('8', '42', '', '0');
INSERT INTO `tp_notice` VALUES ('9', '1', '', '0');
INSERT INTO `tp_notice` VALUES ('10', '41', '', '0');

-- ----------------------------
-- Table structure for tp_notice_template
-- ----------------------------
DROP TABLE IF EXISTS `tp_notice_template`;
CREATE TABLE `tp_notice_template` (
  `template_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '模板id',
  `template_type` varchar(50) NOT NULL DEFAULT '' COMMENT '模板类型',
  `instance_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `template_code` varchar(50) NOT NULL DEFAULT '' COMMENT '模板编号',
  `template_title` varchar(50) NOT NULL DEFAULT '' COMMENT '模板编号',
  `template_content` text NOT NULL COMMENT '模板名称',
  `sign_name` varchar(50) NOT NULL DEFAULT '' COMMENT '签名',
  `is_enable` int(11) NOT NULL DEFAULT '0' COMMENT '是否开启',
  `modify_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`template_id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1170 COMMENT='通知模版设置';

-- ----------------------------
-- Records of tp_notice_template
-- ----------------------------
INSERT INTO `tp_notice_template` VALUES ('41', 'sms', '0', 'after_register', '2嘎嘎嘎', '', '2222拒绝', '1', '2017-07-14 18:17:48');
INSERT INTO `tp_notice_template` VALUES ('42', 'sms', '0', 'register_validate', 'SMS_75080025', '', '阿里云短信测试专用', '0', '2017-07-14 18:17:48');
INSERT INTO `tp_notice_template` VALUES ('43', 'sms', '0', 'recharge_success', '1112', '', '1112', '0', '2017-07-14 18:17:48');
INSERT INTO `tp_notice_template` VALUES ('44', 'sms', '0', 'confirm_order', '', '', '', '0', '2017-07-14 18:17:48');
INSERT INTO `tp_notice_template` VALUES ('45', 'sms', '0', 'pay_success', '2', '', '2222', '0', '2017-07-14 18:17:48');
INSERT INTO `tp_notice_template` VALUES ('46', 'sms', '0', 'create_order', 'ww', '', 'ww', '0', '2017-07-14 18:17:48');
INSERT INTO `tp_notice_template` VALUES ('47', 'sms', '0', 'order_deliver', '11', '', '111', '0', '2017-07-14 18:17:48');
INSERT INTO `tp_notice_template` VALUES ('48', 'email', '0', 'after_register', '111', '注册\n', '', '1', '2017-07-15 16:54:40');
INSERT INTO `tp_notice_template` VALUES ('49', 'email', '0', 'register_validate', '商场验证', '注册苏烟{验证码}\n', '', '0', '2017-07-15 16:54:40');
INSERT INTO `tp_notice_template` VALUES ('50', 'email', '0', 'recharge_success', 'hhh', 'hhh\n', '', '1', '2017-07-15 16:54:40');
INSERT INTO `tp_notice_template` VALUES ('51', 'email', '0', 'confirm_order', '', 'hhhhhh\n', '', '0', '2017-07-15 16:54:40');
INSERT INTO `tp_notice_template` VALUES ('52', 'email', '0', 'pay_success', '', '\n', '', '0', '2017-07-15 16:54:41');
INSERT INTO `tp_notice_template` VALUES ('53', 'email', '0', 'create_order', '', '\n', '', '0', '2017-07-15 16:54:41');
INSERT INTO `tp_notice_template` VALUES ('54', 'email', '0', 'order_deliver', '', '\n', '', '0', '2017-07-15 16:54:41');
INSERT INTO `tp_notice_template` VALUES ('55', 'email', '0', 'forgot_password', '六星开源找回密码', '找回密码{验证码}\n', '', '0', '2017-07-15 16:54:41');
INSERT INTO `tp_notice_template` VALUES ('56', 'sms', '0', 'forgot_password', 'SMS_70250233', '', '六星开源商城', '1', '2017-07-14 18:17:48');
INSERT INTO `tp_notice_template` VALUES ('57', 'sms', '0', 'bind_mobile', 'SMS_70250233', '', '六星开源商城', '1', '2017-07-14 18:17:48');
INSERT INTO `tp_notice_template` VALUES ('58', 'email', '0', 'bind_email', '六星开源商城邮箱绑定', '尊敬的{用户名称}，您正在进行六星开源商城绑定邮箱操作，您的验证码为{验证码}。\n六星开源', '', '0', '2017-07-15 16:54:41');

-- ----------------------------
-- Table structure for tp_notice_template_item
-- ----------------------------
DROP TABLE IF EXISTS `tp_notice_template_item`;
CREATE TABLE `tp_notice_template_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_name` varchar(50) NOT NULL DEFAULT '' COMMENT '项名称',
  `show_name` varchar(50) NOT NULL DEFAULT '' COMMENT '显示名称',
  `replace_name` varchar(50) NOT NULL DEFAULT '' COMMENT '替换字段名字',
  `type_ids` varchar(255) NOT NULL COMMENT '关联type类型',
  `order` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1820 COMMENT='通知模板项';

-- ----------------------------
-- Records of tp_notice_template_item
-- ----------------------------
INSERT INTO `tp_notice_template_item` VALUES ('1', '商场名称', '{商场名称}', 'shop_name', 'after_register,recharge_success,create_order,pay_success,confirm_order,order_deliver', '0');
INSERT INTO `tp_notice_template_item` VALUES ('2', '用户名称', '{用户名称}', 'user_name', 'after_register,recharge_success,create_order,pay_success,confirm_order,order_deliver,bind_mobile,bind_email', '1');
INSERT INTO `tp_notice_template_item` VALUES ('5', '商品名称', '{商品名称}', 'goods_name', 'order_deliver', '4');
INSERT INTO `tp_notice_template_item` VALUES ('6', '商品规格', '{商品规格}', 'goods_sku', 'order_deliver', '5');
INSERT INTO `tp_notice_template_item` VALUES ('7', '主订单号', '{主订单号}', 'order_no', 'create_order,pay_success,confirm_order,order_deliver', '6');
INSERT INTO `tp_notice_template_item` VALUES ('8', '订单金额', '{订单金额}', 'order_money', 'create_order,pay_success,confirm_order,order_deliver', '7');
INSERT INTO `tp_notice_template_item` VALUES ('9', '商品金额', '{商品金额}', 'goods_money', 'create_order,pay_success,order_deliver', '8');
INSERT INTO `tp_notice_template_item` VALUES ('10', '验证码', '{验证码}', 'number', 'register_validate,forgot_password,bind_mobile,bind_email', '9');
INSERT INTO `tp_notice_template_item` VALUES ('11', '充值金额', '{充值金额}', 'recharge_money', 'recharge_success', '0');
INSERT INTO `tp_notice_template_item` VALUES ('12', '物流公司', '{物流公司}', 'express_company', 'order_deliver', '0');
INSERT INTO `tp_notice_template_item` VALUES ('14', '快递编号', '{快递编号}', 'express_no', 'order_deliver', '0');

-- ----------------------------
-- Table structure for tp_notice_template_type
-- ----------------------------
DROP TABLE IF EXISTS `tp_notice_template_type`;
CREATE TABLE `tp_notice_template_type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `template_name` varchar(50) NOT NULL DEFAULT '' COMMENT '模板名称',
  `template_code` varchar(50) NOT NULL DEFAULT '' COMMENT '模板编号',
  `template_type` varchar(50) NOT NULL DEFAULT '' COMMENT '模板类型',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=2340 COMMENT='通知模板类型';

-- ----------------------------
-- Records of tp_notice_template_type
-- ----------------------------
INSERT INTO `tp_notice_template_type` VALUES ('1', '注册成功', 'after_register', 'all');
INSERT INTO `tp_notice_template_type` VALUES ('2', '注册验证', 'register_validate', 'all');
INSERT INTO `tp_notice_template_type` VALUES ('3', '充值成功', 'recharge_success', 'all');
INSERT INTO `tp_notice_template_type` VALUES ('4', '确认订单', 'confirm_order', 'all');
INSERT INTO `tp_notice_template_type` VALUES ('5', '付款成功', 'pay_success', 'all');
INSERT INTO `tp_notice_template_type` VALUES ('6', '下单成功', 'create_order', 'all');
INSERT INTO `tp_notice_template_type` VALUES ('7', '订单发货', 'order_deliver', 'all');
INSERT INTO `tp_notice_template_type` VALUES ('8', '找回密码', 'forgot_password', 'all');
INSERT INTO `tp_notice_template_type` VALUES ('10', '手机绑定', 'bind_mobile', 'sms');
INSERT INTO `tp_notice_template_type` VALUES ('11', '邮箱绑定', 'bind_email', 'email');

-- ----------------------------
-- Table structure for tp_offpay_area
-- ----------------------------
DROP TABLE IF EXISTS `tp_offpay_area`;
CREATE TABLE `tp_offpay_area` (
  `shop_id` int(11) DEFAULT NULL COMMENT '店铺Id',
  `province_id` text COMMENT '省Id组合',
  `city_id` text COMMENT '市Id组合',
  `district_id` text COMMENT '县Id组合'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='货到付款支持地区表';

-- ----------------------------
-- Records of tp_offpay_area
-- ----------------------------
INSERT INTO `tp_offpay_area` VALUES ('0', '34,19,23,24,25,4', '345,356,197,198,199,200,201,202,203,204,205,206,207,208,210,211,212,213,214,215,216,217,209,235,238,241,256,259,262,265,14,15,16,17,18,19,20,21,22,23,24', '209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,239,240,241,242,243,244,245,246,247,248,249,250,251,252,253,254,255,256,257,258,259,260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,296,297,298,299,300,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,316,317,318,319,320,321,322,323,324,325,326,327,2319,2320,2322,2040,2041,2042,2043,2044,2045,2046,2047,2048,2049,2050,2051,2052,2053,2054,2055,2056,2057,2058,2070,2071,2072,2073,2074,2075,2076,2092,2093,2094,2095,2096,2097,2098,2221,2222,2223,2224,2225,2226,2227,2228,2229,2230,2249,2250,2251,2252,2253,2254,2273,2274,2275,2276,2277,2278,2279,2280,2309,2311,2314,2317,1747,1748,1749,1750,1751,1752,1753,1754,1755,1756,1757,1759,1760,1761,1762,1763,1764,1765,1766,1767,1768,1769,1770,1771,1772,1773,1774,1775,1776,1777,1778,1779,1780,1781,1782,1783,1784,1785,1786,1787,1788,1789,1790,1791,1792,1793,1794,1795,1796,1797,1798,1799,1800,1801,1802,1803,1804,1805,1806,1807,1808,1809,1810,1811,1812,1813,1814,1815,1816,1817,1818,1819,1820,1821,1822,1823,1824,1825,1826,1827,1828,1829,1830,1831,1832,1833,1834,1835,1836,1837,1838,1839,1840,1841,1842,1843,1844,1845,1846,1847,1848,1849,1850,1851,1852,1853,1854,1855,1856,1857,1858,1859,1860,1861,1862,1863,1864,1865,1866,1867');
INSERT INTO `tp_offpay_area` VALUES ('1', '34,19', '345,356,197,198,199,200,201,202,203,204,205,206,207,208,210,211,212,213,214,215,216,217,209', '1747,1748,1749,1750,1751,1752,1753,1754,1755,1756,1757,1759,1760,1761,1762,1763,1764,1765,1766,1767,1768,1769,1770,1771,1772,1773,1774,1775,1776,1777,1778,1779,1780,1781,1782,1783,1784,1785,1786,1787,1788,1789,1790,1791,1792,1793,1794,1795,1796,1797,1798,1799,1800,1801,1802,1803,1804,1805,1806,1807,1808,1809,1810,1811,1812,1813,1814,1815,1816,1817,1818,1819,1820,1821,1822,1823,1824,1825,1826,1827,1828,1829,1830,1831,1832,1833,1834,1835,1836,1837,1838,1839,1840,1841,1842,1843,1844,1845,1846,1847,1848,1849,1850,1851,1852,1853,1854,1855,1856,1857,1858,1859,1860,1861,1862,1863,1864,1865,1866,1867');

-- ----------------------------
-- Table structure for tp_order
-- ----------------------------
DROP TABLE IF EXISTS `tp_order`;
CREATE TABLE `tp_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `order_no` varchar(255) DEFAULT '' COMMENT '订单编号',
  `out_trade_no` varchar(100) NOT NULL DEFAULT '0' COMMENT '外部交易号',
  `order_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '订单类型',
  `payment_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '支付类型。取值范围：\n\nWEIXIN (微信自有支付)\n\nWEIXIN_DAIXIAO (微信代销支付)\n\nALIPAY (支付宝支付)',
  `shipping_type` tinyint(4) DEFAULT '1' COMMENT '订单配送方式',
  `shipping_company_id` int(11) NOT NULL DEFAULT '0' COMMENT '配送物流公司ID',
  `order_from` varchar(255) NOT NULL DEFAULT '' COMMENT '订单来源',
  `buyer_id` int(11) NOT NULL COMMENT '买家id',
  `user_name` varchar(50) NOT NULL DEFAULT '' COMMENT '买家会员名称',
  `pay_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '订单付款时间',
  `buyer_ip` varchar(20) NOT NULL DEFAULT '' COMMENT '买家ip',
  `buyer_message` varchar(255) NOT NULL DEFAULT '' COMMENT '买家附言',
  `buyer_invoice` varchar(255) NOT NULL DEFAULT '' COMMENT '买家发票信息',
  `shipping_time` datetime NOT NULL COMMENT '买家要求配送时间',
  `sign_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '买家签收时间',
  `receiver_mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '收货人的手机号码',
  `receiver_province` int(11) NOT NULL COMMENT '收货人所在省',
  `receiver_city` int(11) NOT NULL COMMENT '收货人所在城市',
  `receiver_district` int(11) NOT NULL COMMENT '收货人所在街道',
  `receiver_address` varchar(255) NOT NULL DEFAULT '' COMMENT '收货人详细地址',
  `receiver_zip` varchar(6) NOT NULL DEFAULT '' COMMENT '收货人邮编',
  `receiver_name` varchar(50) NOT NULL DEFAULT '' COMMENT '收货人姓名',
  `shop_id` int(11) NOT NULL COMMENT '卖家店铺id',
  `shop_name` varchar(100) NOT NULL DEFAULT '' COMMENT '卖家店铺名称',
  `seller_star` tinyint(4) NOT NULL DEFAULT '0' COMMENT '卖家对订单的标注星标',
  `seller_memo` varchar(255) NOT NULL DEFAULT '' COMMENT '卖家对订单的备注',
  `consign_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '卖家发货时间',
  `consign_time_adjust` int(11) NOT NULL DEFAULT '0' COMMENT '卖家延迟发货时间',
  `goods_money` decimal(19,2) NOT NULL COMMENT '商品总价',
  `tax_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '税费',
  `order_money` decimal(10,2) NOT NULL COMMENT '订单总价',
  `point` int(11) NOT NULL COMMENT '订单消耗积分',
  `point_money` decimal(10,2) NOT NULL COMMENT '订单消耗积分抵多少钱',
  `coupon_money` decimal(10,2) NOT NULL COMMENT '订单代金券支付金额',
  `coupon_id` int(11) NOT NULL COMMENT '订单代金券id',
  `user_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单余额支付金额',
  `user_platform_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '用户平台余额支付',
  `promotion_money` decimal(10,2) NOT NULL COMMENT '订单优惠活动金额',
  `shipping_money` decimal(10,2) NOT NULL COMMENT '订单运费',
  `pay_money` decimal(10,2) NOT NULL COMMENT '订单实付金额',
  `refund_money` decimal(10,2) NOT NULL COMMENT '订单退款金额',
  `coin_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '购物币金额',
  `give_point` int(11) NOT NULL COMMENT '订单赠送积分',
  `give_coin` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单成功之后返购物币',
  `order_status` tinyint(4) NOT NULL COMMENT '订单状态',
  `pay_status` tinyint(4) NOT NULL COMMENT '订单付款状态',
  `shipping_status` tinyint(4) NOT NULL COMMENT '订单配送状态',
  `review_status` tinyint(4) NOT NULL COMMENT '订单评价状态',
  `feedback_status` tinyint(4) NOT NULL COMMENT '订单维权状态',
  `is_evaluate` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否评价 0为未评价 1为已评价 2为已追评',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '订单创建时间',
  `finish_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '订单完成时间',
  `give_point_type` int(11) NOT NULL DEFAULT '1' COMMENT '积分返还类型 1 订单完成  2 订单收货 3  支付订单',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=440 COMMENT='订单表';

-- ----------------------------
-- Records of tp_order
-- ----------------------------
INSERT INTO `tp_order` VALUES ('1', '20170721171923000000001', '1500628762493', '1', '0', '1', '7407', '3', '63', 'lg', '0000-00-00 00:00:00', '1', '', '', '2017-07-21 17:19:22', '0000-00-00 00:00:00', '13754927904', '26', '283', '2462', '你找不到', '', '马越', '41', '乔丹旗舰店', '0', '', '0000-00-00 00:00:00', '0', '215.20', '0.00', '215.20', '0', '0.00', '0.00', '0', '0.00', '0.00', '0.00', '0.00', '215.20', '0.00', '0.00', '0', '0.00', '5', '0', '0', '0', '0', '0', '2017-07-21 17:19:23', '0000-00-00 00:00:00', '0');
INSERT INTO `tp_order` VALUES ('2', '20170721172001000000001', '1500628855690', '1', '10', '1', '7408', '3', '63', 'lg', '2017-07-21 17:20:55', '1', '', '', '2017-07-21 17:20:01', '2017-07-21 17:21:47', '13754927904', '26', '283', '2462', '你找不到', '', '马越', '1', '海尔加盟店', '0', '', '2017-07-21 17:21:35', '0', '3760.00', '0.00', '3760.00', '0', '0.00', '0.00', '0', '0.00', '0.00', '0.00', '0.00', '3760.00', '0.00', '0.00', '0', '0.00', '4', '2', '2', '0', '0', '0', '2017-07-21 17:20:01', '2017-08-26 17:03:46', '0');
INSERT INTO `tp_order` VALUES ('3', '20180627172410000000001', '153009145040411000', '1', '0', '1', '7407', '3', '293', 'admin', '0000-00-00 00:00:00', '1', '', '', '2018-06-27 17:24:10', '0000-00-00 00:00:00', '13212341234', '19', '208', '1827', '11', '', '1', '41', '乔丹旗舰店', '0', '', '0000-00-00 00:00:00', '0', '883.00', '0.00', '883.00', '0', '0.00', '0.00', '0', '0.00', '0.00', '0.00', '0.00', '883.00', '0.00', '0.00', '0', '0.00', '5', '0', '0', '0', '0', '0', '2018-06-27 17:24:10', '0000-00-00 00:00:00', '0');
INSERT INTO `tp_order` VALUES ('4', '20180629131506000000001', '153024930689181000', '1', '0', '1', '7407', '3', '293', 'admin', '0000-00-00 00:00:00', '1', '', '', '2018-06-29 13:15:06', '0000-00-00 00:00:00', '13212341234', '19', '208', '1827', '11', '', '1', '41', '乔丹旗舰店', '0', '', '0000-00-00 00:00:00', '0', '538.00', '0.00', '538.00', '0', '0.00', '0.00', '0', '0.00', '0.00', '0.00', '0.00', '538.00', '0.00', '0.00', '0', '0.00', '5', '0', '0', '0', '0', '0', '2018-06-29 13:15:06', '0000-00-00 00:00:00', '0');
INSERT INTO `tp_order` VALUES ('5', '20180629131757000000002', '153024947720881000', '1', '0', '1', '7407', '3', '293', 'admin', '0000-00-00 00:00:00', '1', '', '', '2018-06-29 13:17:57', '0000-00-00 00:00:00', '13212341234', '19', '208', '1827', '11', '', '1', '41', '乔丹旗舰店', '0', '', '0000-00-00 00:00:00', '0', '269.00', '0.00', '269.00', '0', '0.00', '0.00', '0', '0.00', '0.00', '0.00', '0.00', '269.00', '0.00', '0.00', '0', '0.00', '5', '0', '0', '0', '0', '0', '2018-06-29 13:17:57', '0000-00-00 00:00:00', '0');
INSERT INTO `tp_order` VALUES ('6', '20180629163423000000003', '153026126294471000', '1', '0', '1', '7407', '3', '293', 'admin', '0000-00-00 00:00:00', '1', '', '', '2018-06-29 16:34:22', '0000-00-00 00:00:00', '13212341234', '19', '208', '1827', '11', '', '1', '41', '乔丹旗舰店', '0', '', '0000-00-00 00:00:00', '0', '269.00', '0.00', '269.00', '0', '0.00', '0.00', '0', '0.00', '0.00', '0.00', '0.00', '269.00', '0.00', '0.00', '0', '0.00', '5', '0', '0', '0', '0', '0', '2018-06-29 16:34:23', '0000-00-00 00:00:00', '0');
INSERT INTO `tp_order` VALUES ('7', '20180702220906000000001', '153054053119151000', '1', '0', '1', '7407', '3', '293', 'admin', '0000-00-00 00:00:00', '1', '', '', '2018-07-02 22:09:02', '0000-00-00 00:00:00', '13212341234', '19', '208', '1827', '11', '', '1', '41', '乔丹旗舰店', '0', '', '0000-00-00 00:00:00', '0', '538.00', '0.00', '538.00', '0', '0.00', '0.00', '0', '0.00', '0.00', '0.00', '0.00', '538.00', '0.00', '0.00', '0', '0.00', '5', '0', '0', '0', '0', '0', '2018-07-02 22:09:06', '0000-00-00 00:00:00', '0');
INSERT INTO `tp_order` VALUES ('8', '20180702223330000000002', '153054201073261000', '1', '0', '1', '7407', '3', '293', 'admin', '0000-00-00 00:00:00', '1', '', '', '2018-07-02 22:33:30', '0000-00-00 00:00:00', '13212341234', '19', '208', '1827', '11', '', '1', '41', '乔丹旗舰店', '0', '', '0000-00-00 00:00:00', '0', '538.00', '0.00', '538.00', '0', '0.00', '0.00', '0', '0.00', '0.00', '0.00', '0.00', '538.00', '0.00', '0.00', '0', '0.00', '5', '0', '0', '0', '0', '0', '2018-07-02 22:33:30', '0000-00-00 00:00:00', '0');
INSERT INTO `tp_order` VALUES ('9', '20180704151742000000001', '153068866161011000', '1', '0', '1', '7407', '3', '293', 'admin', '0000-00-00 00:00:00', '1', '', '', '2018-07-04 15:17:41', '0000-00-00 00:00:00', '13212341234', '19', '208', '1827', '11', '', '1', '41', '乔丹旗舰店', '0', '', '0000-00-00 00:00:00', '0', '269.00', '0.00', '269.00', '0', '0.00', '0.00', '0', '0.00', '0.00', '0.00', '0.00', '269.00', '0.00', '0.00', '0', '0.00', '0', '0', '0', '0', '0', '0', '2018-07-04 15:17:42', '0000-00-00 00:00:00', '0');
INSERT INTO `tp_order` VALUES ('10', '20180704222717000000002', '153071443631231000', '1', '0', '1', '7407', '3', '293', 'admin', '0000-00-00 00:00:00', '1', '', '', '2018-07-04 22:27:16', '0000-00-00 00:00:00', '13212341234', '19', '208', '1827', '11', '', '1', '41', '乔丹旗舰店', '0', '', '0000-00-00 00:00:00', '0', '269.00', '0.00', '269.00', '0', '0.00', '0.00', '0', '0.00', '0.00', '0.00', '0.00', '269.00', '0.00', '0.00', '0', '0.00', '0', '0', '0', '0', '0', '0', '2018-07-04 22:27:17', '0000-00-00 00:00:00', '0');

-- ----------------------------
-- Table structure for tp_order_action
-- ----------------------------
DROP TABLE IF EXISTS `tp_order_action`;
CREATE TABLE `tp_order_action` (
  `action_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '动作id',
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `action` varchar(255) NOT NULL DEFAULT '' COMMENT '动作内容',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '操作人id',
  `user_name` varchar(50) NOT NULL DEFAULT '' COMMENT '操作人',
  `order_status` int(11) NOT NULL COMMENT '订单大状态',
  `order_status_text` varchar(255) NOT NULL DEFAULT '' COMMENT '订单状态名称',
  `action_time` datetime NOT NULL COMMENT '操作时间',
  PRIMARY KEY (`action_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1706 COMMENT='订单操作表';

-- ----------------------------
-- Records of tp_order_action
-- ----------------------------

-- ----------------------------
-- Table structure for tp_order_goods
-- ----------------------------
DROP TABLE IF EXISTS `tp_order_goods`;
CREATE TABLE `tp_order_goods` (
  `order_goods_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单项ID',
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `goods_name` varchar(50) NOT NULL COMMENT '商品名称',
  `sku_id` int(11) NOT NULL COMMENT 'skuID',
  `sku_name` varchar(50) NOT NULL COMMENT 'sku名称',
  `price` decimal(19,2) NOT NULL DEFAULT '0.00' COMMENT '商品价格',
  `cost_price` decimal(19,2) NOT NULL DEFAULT '0.00' COMMENT '商品成本价',
  `num` varchar(255) NOT NULL DEFAULT '0' COMMENT '购买数量',
  `adjust_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '调整金额',
  `goods_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品总价',
  `goods_picture` int(11) NOT NULL DEFAULT '0' COMMENT '商品图片',
  `shop_id` int(11) NOT NULL DEFAULT '1' COMMENT '店铺ID',
  `buyer_id` int(11) NOT NULL DEFAULT '0' COMMENT '购买人ID',
  `point_exchange_type` int(11) NOT NULL DEFAULT '0' COMMENT '积分兑换类型0.非积分兑换1.积分兑换',
  `goods_type` varchar(255) NOT NULL DEFAULT '1' COMMENT '商品类型',
  `promotion_id` int(11) NOT NULL DEFAULT '0' COMMENT '促销ID',
  `promotion_type_id` int(11) NOT NULL DEFAULT '0' COMMENT '促销类型',
  `order_type` int(11) NOT NULL DEFAULT '1' COMMENT '订单类型',
  `order_status` int(11) NOT NULL DEFAULT '0' COMMENT '订单状态',
  `give_point` int(11) NOT NULL DEFAULT '0' COMMENT '积分数量',
  `shipping_status` int(11) NOT NULL DEFAULT '0' COMMENT '物流状态',
  `refund_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '退款时间',
  `refund_type` int(11) NOT NULL DEFAULT '1' COMMENT '退款方式',
  `refund_require_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '退款金额',
  `refund_reason` varchar(255) NOT NULL DEFAULT '' COMMENT '退款原因',
  `refund_shipping_code` varchar(255) NOT NULL DEFAULT '' COMMENT '退款物流单号',
  `refund_shipping_company` varchar(255) NOT NULL DEFAULT '0' COMMENT '退款物流公司名称',
  `refund_real_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '实际退款金额',
  `refund_status` int(1) NOT NULL DEFAULT '0' COMMENT '退款状态',
  `memo` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `is_evaluate` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否评价 0为未评价 1为已评价 2为已追评',
  PRIMARY KEY (`order_goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=289 COMMENT='订单商品表';

-- ----------------------------
-- Records of tp_order_goods
-- ----------------------------
INSERT INTO `tp_order_goods` VALUES ('1', '1', '385', '春季包头中粗跟尖头浅口单鞋女夏2017新款百搭韩版侧空低跟单鞋子', '1484', '', '215.20', '0.00', '1', '0.00', '215.20', '1849', '1', '63', '0', '1', '0', '0', '1', '0', '0', '0', '0000-00-00 00:00:00', '1', '0.00', '', '', '0', '0.00', '0', '', '0');
INSERT INTO `tp_order_goods` VALUES ('2', '2', '388', '神舟战神 T6-S5D1独显4G四核i5高清15.6英寸游戏本笔记本电脑正品', '1487', '', '3760.00', '0.00', '1', '0.00', '3760.00', '1855', '1', '63', '0', '1', '0', '0', '1', '0', '0', '1', '0000-00-00 00:00:00', '1', '0.00', '', '', '0', '0.00', '0', '', '0');
INSERT INTO `tp_order_goods` VALUES ('3', '3', '383', '单鞋细高跟防水台鱼嘴女凉鞋2017春夏季新款复古刺绣高跟鞋40-42', '1482', '', '345.00', '0.00', '1', '0.00', '345.00', '1844', '0', '293', '0', '1', '0', '0', '1', '0', '0', '0', '0000-00-00 00:00:00', '1', '0.00', '', '', '0', '0.00', '0', '', '0');
INSERT INTO `tp_order_goods` VALUES ('4', '3', '384', '【葡萄妈】studiolee 小方跟方扣单鞋4.5cm 附赠贴底', '1483', '', '269.00', '0.00', '2', '0.00', '538.00', '1847', '0', '293', '0', '1', '0', '0', '1', '0', '0', '0', '0000-00-00 00:00:00', '1', '0.00', '', '', '0', '0.00', '0', '', '0');
INSERT INTO `tp_order_goods` VALUES ('5', '4', '384', '【葡萄妈】studiolee 小方跟方扣单鞋4.5cm 附赠贴底', '1483', '', '269.00', '0.00', '2', '0.00', '538.00', '1847', '0', '293', '0', '1', '0', '0', '1', '0', '0', '0', '0000-00-00 00:00:00', '1', '0.00', '', '', '0', '0.00', '0', '', '0');
INSERT INTO `tp_order_goods` VALUES ('6', '5', '384', '【葡萄妈】studiolee 小方跟方扣单鞋4.5cm 附赠贴底', '1483', '', '269.00', '0.00', '1', '0.00', '269.00', '1847', '0', '293', '0', '1', '0', '0', '1', '0', '0', '0', '0000-00-00 00:00:00', '1', '0.00', '', '', '0', '0.00', '0', '', '0');
INSERT INTO `tp_order_goods` VALUES ('7', '6', '384', '【葡萄妈】studiolee 小方跟方扣单鞋4.5cm 附赠贴底', '1483', '', '269.00', '0.00', '1', '0.00', '269.00', '1847', '0', '293', '0', '1', '0', '0', '1', '0', '0', '0', '0000-00-00 00:00:00', '1', '0.00', '', '', '0', '0.00', '0', '', '0');
INSERT INTO `tp_order_goods` VALUES ('8', '7', '384', '【葡萄妈】studiolee 小方跟方扣单鞋4.5cm 附赠贴底', '1483', '', '269.00', '0.00', '2', '0.00', '538.00', '1847', '0', '293', '0', '1', '0', '0', '1', '0', '0', '0', '0000-00-00 00:00:00', '1', '0.00', '', '', '0', '0.00', '0', '', '0');
INSERT INTO `tp_order_goods` VALUES ('9', '8', '384', '【葡萄妈】studiolee 小方跟方扣单鞋4.5cm 附赠贴底', '1483', '', '269.00', '0.00', '2', '0.00', '538.00', '1847', '0', '293', '0', '1', '0', '0', '1', '0', '0', '0', '0000-00-00 00:00:00', '1', '0.00', '', '', '0', '0.00', '0', '', '0');
INSERT INTO `tp_order_goods` VALUES ('10', '9', '384', '【葡萄妈】studiolee 小方跟方扣单鞋4.5cm 附赠贴底', '1483', '', '269.00', '0.00', '1', '0.00', '269.00', '1847', '0', '293', '0', '1', '0', '0', '1', '0', '0', '0', '0000-00-00 00:00:00', '1', '0.00', '', '', '0', '0.00', '0', '', '0');
INSERT INTO `tp_order_goods` VALUES ('11', '10', '384', '【葡萄妈】studiolee 小方跟方扣单鞋4.5cm 附赠贴底', '1483', '', '269.00', '0.00', '1', '0.00', '269.00', '1847', '0', '293', '0', '1', '0', '0', '1', '0', '0', '0', '0000-00-00 00:00:00', '1', '0.00', '', '', '0', '0.00', '0', '', '0');

-- ----------------------------
-- Table structure for tp_order_goods_express
-- ----------------------------
DROP TABLE IF EXISTS `tp_order_goods_express`;
CREATE TABLE `tp_order_goods_express` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `order_goods_id_array` varchar(255) NOT NULL COMMENT '订单项商品组合列表',
  `express_name` varchar(50) NOT NULL DEFAULT '' COMMENT '包裹名称  （包裹- 1 包裹 - 2）',
  `shipping_type` tinyint(4) NOT NULL COMMENT '发货方式1 需要物流 0无需物流',
  `express_company_id` int(11) NOT NULL COMMENT '快递公司id',
  `express_company` varchar(255) NOT NULL DEFAULT '' COMMENT '物流公司名称',
  `express_no` varchar(50) NOT NULL COMMENT '运单编号',
  `shipping_time` datetime NOT NULL COMMENT '发货时间',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `user_name` varchar(50) NOT NULL COMMENT '用户名',
  `memo` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=606 COMMENT='商品订单物流信息表（多次发货）';

-- ----------------------------
-- Records of tp_order_goods_express
-- ----------------------------
INSERT INTO `tp_order_goods_express` VALUES ('1', '2', '2', '菜鸟', '1', '7408', '菜鸟', '233223', '2017-07-21 17:21:35', '63', 'lg', '');

-- ----------------------------
-- Table structure for tp_order_goods_promotion_details
-- ----------------------------
DROP TABLE IF EXISTS `tp_order_goods_promotion_details`;
CREATE TABLE `tp_order_goods_promotion_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `sku_id` int(11) NOT NULL COMMENT '商品skuid',
  `promotion_type` varbinary(255) NOT NULL COMMENT '优惠类型规则ID（满减对应规则）',
  `promotion_id` int(11) NOT NULL COMMENT '优惠ID',
  `discount_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '优惠的金额，单位：元，精确到小数点后两位',
  `used_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '使用时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192 COMMENT='订单商品优惠详情';

-- ----------------------------
-- Records of tp_order_goods_promotion_details
-- ----------------------------

-- ----------------------------
-- Table structure for tp_order_payment
-- ----------------------------
DROP TABLE IF EXISTS `tp_order_payment`;
CREATE TABLE `tp_order_payment` (
  `out_trade_no` varchar(30) NOT NULL COMMENT '支付单编号',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '执行支付的相关店铺ID（0平台）',
  `type` int(11) NOT NULL DEFAULT '1' COMMENT '订单类型1.商城订单2.交易商支付',
  `type_alis_id` int(11) NOT NULL DEFAULT '0' COMMENT '订单类型关联ID',
  `pay_body` varchar(255) NOT NULL DEFAULT '' COMMENT '订单支付简介',
  `pay_detail` varchar(1000) NOT NULL DEFAULT '' COMMENT '订单支付详情',
  `pay_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '支付金额',
  `pay_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '支付状态',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `pay_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '支付时间',
  `pay_type` int(11) NOT NULL DEFAULT '1' COMMENT '支付方式'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=963 COMMENT='订单支付表';

-- ----------------------------
-- Records of tp_order_payment
-- ----------------------------
INSERT INTO `tp_order_payment` VALUES ('1500628762493', '41', '1', '1', '乔丹旗舰店订单', '乔丹旗舰店订单', '215.20', '0', '2017-07-21 17:19:23', '0000-00-00 00:00:00', '1');
INSERT INTO `tp_order_payment` VALUES ('1500628855690', '1', '1', '2', '海尔加盟店订单', '海尔加盟店订单', '3760.00', '1', '2017-07-21 17:20:01', '2017-07-21 17:20:55', '10');
INSERT INTO `tp_order_payment` VALUES ('153009145040411000', '41', '1', '3', '乔丹旗舰店订单', '乔丹旗舰店订单', '883.00', '0', '2018-06-27 17:24:10', '0000-00-00 00:00:00', '1');
INSERT INTO `tp_order_payment` VALUES ('153024930689181000', '41', '1', '4', '乔丹旗舰店订单', '乔丹旗舰店订单', '538.00', '0', '2018-06-29 13:15:06', '0000-00-00 00:00:00', '1');
INSERT INTO `tp_order_payment` VALUES ('153024947720881000', '41', '1', '5', '乔丹旗舰店订单', '乔丹旗舰店订单', '269.00', '0', '2018-06-29 13:17:57', '0000-00-00 00:00:00', '1');
INSERT INTO `tp_order_payment` VALUES ('153026126294471000', '41', '1', '6', '乔丹旗舰店订单', '乔丹旗舰店订单', '269.00', '0', '2018-06-29 16:34:23', '0000-00-00 00:00:00', '1');
INSERT INTO `tp_order_payment` VALUES ('153054053119151000', '41', '1', '7', '乔丹旗舰店订单', '乔丹旗舰店订单', '538.00', '0', '2018-07-02 22:09:06', '0000-00-00 00:00:00', '1');
INSERT INTO `tp_order_payment` VALUES ('153054201073261000', '41', '1', '8', '乔丹旗舰店订单', '乔丹旗舰店订单', '538.00', '0', '2018-07-02 22:33:30', '0000-00-00 00:00:00', '1');
INSERT INTO `tp_order_payment` VALUES ('153068866161011000', '41', '1', '9', '乔丹旗舰店订单', '乔丹旗舰店订单', '269.00', '0', '2018-07-04 15:17:42', '0000-00-00 00:00:00', '1');
INSERT INTO `tp_order_payment` VALUES ('153071443631231000', '41', '1', '10', '乔丹旗舰店订单', '乔丹旗舰店订单', '269.00', '0', '2018-07-04 22:27:17', '0000-00-00 00:00:00', '1');

-- ----------------------------
-- Table structure for tp_order_pickup
-- ----------------------------
DROP TABLE IF EXISTS `tp_order_pickup`;
CREATE TABLE `tp_order_pickup` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) NOT NULL DEFAULT '0' COMMENT '订单ID',
  `name` varchar(255) NOT NULL COMMENT '自提点名称',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '自提点地址',
  `contact` varchar(255) NOT NULL DEFAULT '' COMMENT '联系人',
  `phone` varchar(255) NOT NULL DEFAULT '' COMMENT '联系电话',
  `city_id` int(11) NOT NULL COMMENT '市ID',
  `province_id` int(11) NOT NULL COMMENT '省ID',
  `district_id` int(11) NOT NULL COMMENT '区县ID',
  `supplier_id` int(11) NOT NULL DEFAULT '0' COMMENT '供应门店ID',
  `longitude` varchar(255) NOT NULL DEFAULT '' COMMENT '经度',
  `latitude` varchar(255) NOT NULL DEFAULT '' COMMENT '维度',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `buyer_name` varchar(50) NOT NULL DEFAULT '' COMMENT '提货人姓名',
  `buyer_mobile` varchar(255) NOT NULL DEFAULT '' COMMENT '提货人电话',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '提货备注信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=528 COMMENT='订单自提点管理';

-- ----------------------------
-- Records of tp_order_pickup
-- ----------------------------

-- ----------------------------
-- Table structure for tp_order_promotion_details
-- ----------------------------
DROP TABLE IF EXISTS `tp_order_promotion_details`;
CREATE TABLE `tp_order_promotion_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `promotion_type_id` int(11) NOT NULL COMMENT '优惠类型规则ID（满减对应规则）',
  `promotion_id` int(11) NOT NULL COMMENT '优惠ID',
  `promotion_type` varchar(255) NOT NULL COMMENT '优惠类型',
  `promotion_name` varchar(50) NOT NULL COMMENT '该优惠活动的名称',
  `promotion_condition` varchar(255) NOT NULL DEFAULT '' COMMENT '优惠使用条件说明',
  `discount_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '优惠的金额，单位：元，精确到小数点后两位',
  `used_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '使用时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=364 COMMENT='订单优惠详情';

-- ----------------------------
-- Records of tp_order_promotion_details
-- ----------------------------

-- ----------------------------
-- Table structure for tp_order_refund
-- ----------------------------
DROP TABLE IF EXISTS `tp_order_refund`;
CREATE TABLE `tp_order_refund` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `order_goods_id` int(11) NOT NULL COMMENT '订单商品表id',
  `refund_status` varchar(255) NOT NULL COMMENT '操作状态\n\n\n\n流程状态(refund_status)	状态名称(refund_status_name)	操作时间\n\n1	买家申请	发起了退款申请,等待卖家处理\n\n2	等待买家退货	卖家已同意退款申请,等待买家退货\n\n3	等待卖家确认收货	买家已退货,等待卖家确认收货\n\n4	等待卖家确认退款	卖家同意退款\n\n0	退款已成功	卖家退款给买家，本次维权结束\n\n-1	退款已拒绝	卖家拒绝本次退款，本次维权结束\n\n-2	退款已关闭	主动撤销退款，退款关闭\n\n-3	退款申请不通过	拒绝了本次退款申请,等待买家修改\n\n',
  `action` varchar(255) NOT NULL COMMENT '退款操作内容描述',
  `action_way` tinyint(4) NOT NULL DEFAULT '0' COMMENT '操作方 1 买家 2 卖家',
  `action_userid` varchar(255) NOT NULL DEFAULT '0' COMMENT '操作人id',
  `action_username` varchar(255) NOT NULL DEFAULT '' COMMENT '操作人姓名',
  `action_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=108 COMMENT='订单商品退货退款操作表';

-- ----------------------------
-- Records of tp_order_refund
-- ----------------------------

-- ----------------------------
-- Table structure for tp_order_shipping_fee
-- ----------------------------
DROP TABLE IF EXISTS `tp_order_shipping_fee`;
CREATE TABLE `tp_order_shipping_fee` (
  `shipping_fee_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '运费模板ID',
  `shipping_fee_name` varchar(30) NOT NULL DEFAULT '' COMMENT '运费模板名称',
  `is_default` int(11) NOT NULL DEFAULT '0' COMMENT '是否是默认模板',
  `co_id` int(11) NOT NULL DEFAULT '0' COMMENT '物流公司ID',
  `shop_id` int(11) NOT NULL COMMENT '店铺ID',
  `province_id_array` text NOT NULL COMMENT '省ID组',
  `city_id_array` text NOT NULL COMMENT '市ID组',
  `weight_is_use` int(11) NOT NULL DEFAULT '1' COMMENT '是否启用重量运费',
  `weight_snum` decimal(8,2) NOT NULL DEFAULT '1.00' COMMENT '首重',
  `weight_sprice` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '首重运费',
  `weight_xnum` decimal(8,2) NOT NULL DEFAULT '1.00' COMMENT '续重',
  `weight_xprice` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '续重运费',
  `volume_is_use` int(11) NOT NULL DEFAULT '1' COMMENT '是否启用体积计算运费',
  `volume_snum` decimal(8,2) NOT NULL DEFAULT '1.00' COMMENT '首体积量',
  `volume_sprice` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '首体积运费',
  `volume_xnum` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '续体积量',
  `volume_xprice` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '续体积运费',
  `bynum_is_use` int(11) NOT NULL DEFAULT '1' COMMENT '是否启用计件方式运费',
  `bynum_snum` int(11) NOT NULL DEFAULT '0' COMMENT '首件',
  `bynum_sprice` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '首件运费',
  `bynum_xnum` int(11) NOT NULL DEFAULT '1' COMMENT '续件',
  `bynum_xprice` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '续件运费',
  `create_time` datetime NOT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`shipping_fee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=5461 COMMENT='运费模板';

-- ----------------------------
-- Records of tp_order_shipping_fee
-- ----------------------------
INSERT INTO `tp_order_shipping_fee` VALUES ('1', '默认', '1', '7407', '41', '', '', '1', '1.00', '1.00', '1.00', '1.00', '1', '2.00', '2.00', '2.00', '2.00', '1', '1', '2.00', '1', '1.00', '2017-07-21 17:18:03', null);
INSERT INTO `tp_order_shipping_fee` VALUES ('2', '默认', '1', '7408', '1', '', '', '1', '2.00', '1.00', '2.00', '1.00', '1', '2.00', '1.00', '1.00', '1.00', '1', '1', '1.00', '1', '1.00', '2017-07-21 17:19:03', null);

-- ----------------------------
-- Table structure for tp_order_shop_return
-- ----------------------------
DROP TABLE IF EXISTS `tp_order_shop_return`;
CREATE TABLE `tp_order_shop_return` (
  `shop_id` int(11) NOT NULL,
  `shop_address` varchar(255) NOT NULL DEFAULT '' COMMENT '商家地址',
  `seller_name` varchar(50) NOT NULL DEFAULT '' COMMENT '收件人',
  `seller_mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '收件人手机号',
  `seller_zipcode` varchar(20) NOT NULL DEFAULT '' COMMENT '邮编',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='店铺退货设置';

-- ----------------------------
-- Records of tp_order_shop_return
-- ----------------------------
INSERT INTO `tp_order_shop_return` VALUES ('0', '', '', '', '', '2017-09-23 14:48:37', null);

-- ----------------------------
-- Table structure for tp_pickup_point
-- ----------------------------
DROP TABLE IF EXISTS `tp_pickup_point`;
CREATE TABLE `tp_pickup_point` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `name` varchar(255) NOT NULL COMMENT '自提点名称',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '自提点地址',
  `contact` varchar(255) NOT NULL DEFAULT '' COMMENT '联系人',
  `phone` varchar(255) NOT NULL DEFAULT '' COMMENT '联系电话',
  `city_id` int(11) NOT NULL COMMENT '市ID',
  `province_id` int(11) NOT NULL COMMENT '省ID',
  `district_id` int(11) NOT NULL COMMENT '区县ID',
  `supplier_id` int(11) NOT NULL DEFAULT '0' COMMENT '供应门店ID',
  `longitude` varchar(255) NOT NULL DEFAULT '' COMMENT '经度',
  `latitude` varchar(255) NOT NULL DEFAULT '' COMMENT '维度',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=4096 COMMENT='自提点管理';

-- ----------------------------
-- Records of tp_pickup_point
-- ----------------------------
INSERT INTO `tp_pickup_point` VALUES ('4', '0', '升水11111', '111搜索jj', '111', '11111', '229', '20', '1960', '0', '', '', '2017-06-20 17:38:17');
INSERT INTO `tp_pickup_point` VALUES ('5', '0', '454545', '1111111111111', '11', '13622222222', '1', '1', '1', '0', '', '', '2017-06-20 17:41:08');
INSERT INTO `tp_pickup_point` VALUES ('6', '0', 'qq', 'qq', 'yy', '15232512145', '208', '19', '1825', '0', '', '', '2017-06-20 19:21:27');
INSERT INTO `tp_pickup_point` VALUES ('7', '0', 'hhhh', 'qqqq', '', '15236521452', '230', '20', '1965', '0', '', '', '2017-06-21 10:23:07');

-- ----------------------------
-- Table structure for tp_platform_adv
-- ----------------------------
DROP TABLE IF EXISTS `tp_platform_adv`;
CREATE TABLE `tp_platform_adv` (
  `adv_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '广告自增标识编号',
  `ap_id` mediumint(8) unsigned NOT NULL COMMENT '广告位id',
  `adv_title` varchar(255) NOT NULL DEFAULT '' COMMENT '广告内容描述',
  `adv_url` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `adv_image` varchar(1000) NOT NULL DEFAULT '' COMMENT '广告内容图片',
  `slide_sort` int(11) DEFAULT NULL COMMENT '幻灯片排序',
  `click_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '广告点击率',
  `background` varchar(255) NOT NULL DEFAULT '#FFFFFF' COMMENT '背景色',
  PRIMARY KEY (`adv_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1044 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1170 COMMENT='广告表';

-- ----------------------------
-- Records of tp_platform_adv
-- ----------------------------
INSERT INTO `tp_platform_adv` VALUES ('942', '1051', '商城推广图', 'http://www.niushop.com.cn', 'upload/advertising/1497067441.png', '0', '0', '#ff8080');
INSERT INTO `tp_platform_adv` VALUES ('943', '1052', '商城logo后的小广告', 'http://www.niushop.com.cn', 'upload/advertising/1497067657.png', '0', '0', '#ffffff');
INSERT INTO `tp_platform_adv` VALUES ('944', '1052', 'logo栏右侧广告', 'http://www.niushop.com.cn', 'upload/advertising/1497068024.png', '1', '0', '#ffffff');
INSERT INTO `tp_platform_adv` VALUES ('945', '1053', 'NIUSHOP开源商城', '#', 'upload/advertising/1497067819.png', '0', '0', '#c0c0c0');
INSERT INTO `tp_platform_adv` VALUES ('947', '1053', '滚动图3', '#', 'upload/advertising/1497067855.jpg', '2', '0', '#ffffff');
INSERT INTO `tp_platform_adv` VALUES ('948', '1054', '广告栏一图片1', 'javascript:;', 'upload/advertising/1497067960.png', '0', '0', '#ffffff');
INSERT INTO `tp_platform_adv` VALUES ('949', '1054', '广告栏一图片2', 'javascript:;', 'upload/advertising/1497068146.png', '1', '0', '#ffffff');
INSERT INTO `tp_platform_adv` VALUES ('951', '1054', '广告栏一图片4', 'javascript:;', 'upload/advertising/1497085006.png', '3', '0', '#ffffff');
INSERT INTO `tp_platform_adv` VALUES ('952', '1054', '广告栏一图片5', 'javascript:;', 'upload/advertising/1497068187.png', '4', '0', '#ffffff');
INSERT INTO `tp_platform_adv` VALUES ('954', '1056', '滚动一', '#', 'upload/advertising/1497068837.png', '0', '0', '#ffffff');
INSERT INTO `tp_platform_adv` VALUES ('955', '1056', '滚动二', '#', 'upload/advertising/1497068854.png', '1', '0', '#ffffff');
INSERT INTO `tp_platform_adv` VALUES ('956', '1056', '滚动三', '#', 'upload/advertising/1497068869.png', '2', '0', '#ffffff');
INSERT INTO `tp_platform_adv` VALUES ('957', '1057', '推荐楼层1楼——单图广告图', '#', 'upload/advertising/1497068896.png', '0', '0', '#ffffff');
INSERT INTO `tp_platform_adv` VALUES ('958', '1058', '推荐楼层1楼——轮播图1', '#', 'upload/advertising/1497069144.png', '0', '0', '#ffffff');
INSERT INTO `tp_platform_adv` VALUES ('959', '1058', '推荐楼层1楼——轮播图2', '#', 'upload/advertising/1497069159.png', '1', '0', '#ffffff');
INSERT INTO `tp_platform_adv` VALUES ('960', '1058', '推荐楼层1楼——轮播图3', '#', 'upload/advertising/1497069175.png', '2', '0', '#ffffff');
INSERT INTO `tp_platform_adv` VALUES ('961', '1059', '推荐楼层1楼——多图1', '#', 'upload/advertising/1497069290.png', '0', '0', '#ffffff');
INSERT INTO `tp_platform_adv` VALUES ('962', '1059', '推荐楼层1楼——多图2', '#', 'upload/advertising/1497069302.png', '1', '0', '#ffffff');
INSERT INTO `tp_platform_adv` VALUES ('963', '1059', '推荐楼层1楼——多图3', '#', 'upload/advertising/1497069321.png', '2', '0', '#ffffff');
INSERT INTO `tp_platform_adv` VALUES ('964', '1059', '推荐楼层1楼——多图4', '#', 'upload/advertising/1497069393.png', '3', '0', '#ffffff');
INSERT INTO `tp_platform_adv` VALUES ('965', '1059', '推荐楼层1楼——多图5', '#', 'upload/advertising/1497069408.png', '4', '0', '#ffffff');
INSERT INTO `tp_platform_adv` VALUES ('967', '1060', '推荐楼层2楼——单图广告图', '#', 'upload/advertising/1497069441.png', '0', '0', '#ffffff');
INSERT INTO `tp_platform_adv` VALUES ('968', '1063', '推荐楼层3楼——单图广告图', '#', 'upload/advertising/1497069606.png', '0', '0', '#ffffff');
INSERT INTO `tp_platform_adv` VALUES ('970', '1064', '推荐楼层4楼——单图广告图', '#', 'upload/advertising/1497069629.png', '0', '0', '#ffffff');
INSERT INTO `tp_platform_adv` VALUES ('971', '1065', '推荐楼层5楼——单图广告图', '#', 'upload/advertising/1497069657.png', '0', '0', '#ffffff');
INSERT INTO `tp_platform_adv` VALUES ('972', '1066', '推荐楼层6楼——单图广告图', '#', 'upload/advertising/1497069679.png', '0', '0', '#ffffff');
INSERT INTO `tp_platform_adv` VALUES ('973', '1050', '推荐楼层2楼——轮播图1', '#', 'upload/admin/common/1487673767.png', '1', '0', '#FFFFFF');
INSERT INTO `tp_platform_adv` VALUES ('974', '1050', '推荐楼层2楼——轮播图2', '#', 'upload/admin/common/1487673796.png', '2', '0', '#FFFFFF');
INSERT INTO `tp_platform_adv` VALUES ('975', '1050', '推荐楼层2楼——轮播图3', '#', 'upload/admin/common/1487673822.png', '3', '0', '#FFFFFF');
INSERT INTO `tp_platform_adv` VALUES ('976', '1061', '推荐楼层2楼——轮播图1', '#', 'upload/advertising/1497069460.png', '1', '0', '#ffffff');
INSERT INTO `tp_platform_adv` VALUES ('977', '1061', '推荐楼层2楼——轮播图2', '#', 'upload/advertising/1497069501.png', '2', '0', '#ffffff');
INSERT INTO `tp_platform_adv` VALUES ('978', '1061', '推荐楼层2楼——轮播图3', '#', 'upload/advertising/1497069514.png', '3', '0', '#ffffff');
INSERT INTO `tp_platform_adv` VALUES ('982', '1068', '推荐楼层4楼——轮播图1', '#', 'upload/advertising/1497069758.png', '0', '0', '#ffffff');
INSERT INTO `tp_platform_adv` VALUES ('983', '1068', '推荐楼层4楼——轮播图2', '#', 'upload/advertising/1497069771.png', '1', '0', '#ffffff');
INSERT INTO `tp_platform_adv` VALUES ('984', '1068', '推荐楼层4楼——轮播图3', '#', 'upload/advertising/1497069786.png', '2', '0', '#ffffff');
INSERT INTO `tp_platform_adv` VALUES ('985', '1069', '推荐楼层5楼——轮播图1', '#', 'upload/advertising/1497069806.png', '0', '0', '#ffffff');
INSERT INTO `tp_platform_adv` VALUES ('986', '1069', '推荐楼层5楼——轮播图2', '#', 'upload/advertising/1497069818.png', '1', '0', '#ffffff');
INSERT INTO `tp_platform_adv` VALUES ('987', '1069', '推荐楼层5楼——轮播图3', '#', 'upload/advertising/1497069833.png', '2', '0', '#ffffff');
INSERT INTO `tp_platform_adv` VALUES ('988', '1070', '推荐楼层6楼——轮播图1', '#', 'upload/advertising/1497069853.png', '0', '0', '#ffffff');
INSERT INTO `tp_platform_adv` VALUES ('989', '1070', '推荐楼层6楼——轮播图2', '#', 'upload/advertising/1497069865.png', '1', '0', '#ffffff');
INSERT INTO `tp_platform_adv` VALUES ('990', '1070', '推荐楼层6楼——轮播图3', '#', 'upload/advertising/1497069876.png', '2', '0', '#ffffff');
INSERT INTO `tp_platform_adv` VALUES ('991', '1062', '推荐楼层2楼——多图1', '#', 'upload/advertising/1497069535.png', '0', '0', '#ffffff');
INSERT INTO `tp_platform_adv` VALUES ('992', '1062', '推荐楼层2楼——多图2', '#', 'upload/advertising/1497069549.png', '1', '0', '#ffffff');
INSERT INTO `tp_platform_adv` VALUES ('993', '1062', '推荐楼层2楼——多图3', '#', 'upload/advertising/1497069561.png', '2', '0', '#ffffff');
INSERT INTO `tp_platform_adv` VALUES ('994', '1062', '推荐楼层2楼——多图4', '#', 'upload/advertising/1497069575.png', '3', '0', '#ffffff');
INSERT INTO `tp_platform_adv` VALUES ('995', '1062', '推荐楼层2楼——多图5', '#', 'upload/advertising/1497069587.png', '4', '0', '#ffffff');
INSERT INTO `tp_platform_adv` VALUES ('996', '1071', '推荐楼层3楼——多图1', '#', 'upload/advertising/1498707817.png', '0', '0', '#ffffff');
INSERT INTO `tp_platform_adv` VALUES ('997', '1071', '推荐楼层3楼——多图2', '#', 'upload/advertising/1497069906.png', '1', '0', '#ffffff');
INSERT INTO `tp_platform_adv` VALUES ('998', '1071', '推荐楼层3楼——多图3', '#', 'upload/advertising/1497069923.png', '2', '0', '#ffffff');
INSERT INTO `tp_platform_adv` VALUES ('999', '1071', '推荐楼层3楼——多图4', '#', 'upload/advertising/1497070037.png', '3', '0', '#ffffff');
INSERT INTO `tp_platform_adv` VALUES ('1000', '1071', '推荐楼层3楼——多图5', '#', 'upload/advertising/1497070051.png', '4', '0', '#ffffff');
INSERT INTO `tp_platform_adv` VALUES ('1001', '1072', '推荐楼层4楼——多图1', '#', 'upload/advertising/1497070074.png', '0', '0', '#ffffff');
INSERT INTO `tp_platform_adv` VALUES ('1002', '1072', '推荐楼层4楼——多图2', '#', 'upload/advertising/1497070086.png', '1', '0', '#ffffff');
INSERT INTO `tp_platform_adv` VALUES ('1003', '1072', '推荐楼层4楼——多图3', '#', 'upload/advertising/1497070098.png', '2', '0', '#ffffff');
INSERT INTO `tp_platform_adv` VALUES ('1004', '1072', '推荐楼层4楼——多图4', '#', 'upload/advertising/1497070109.png', '4', '0', '#ffffff');
INSERT INTO `tp_platform_adv` VALUES ('1005', '1072', '推荐楼层4楼——多图5', '#', 'upload/advertising/1497070120.png', '5', '0', '#ffffff');
INSERT INTO `tp_platform_adv` VALUES ('1006', '1073', '推荐楼层5楼——多图1', '#', 'upload/advertising/1497070139.png', '0', '0', '#ffffff');
INSERT INTO `tp_platform_adv` VALUES ('1007', '1073', '推荐楼层5楼——多图2', '#', 'upload/advertising/1497070151.png', '1', '0', '#ffffff');
INSERT INTO `tp_platform_adv` VALUES ('1008', '1073', '推荐楼层5楼——多图3', '#', 'upload/advertising/1497070191.png', '2', '0', '#ffffff');
INSERT INTO `tp_platform_adv` VALUES ('1009', '1073', '推荐楼层5楼——多图4', '#', 'upload/advertising/1497070203.png', '3', '0', '#ffffff');
INSERT INTO `tp_platform_adv` VALUES ('1010', '1073', '推荐楼层5楼——多图5', '#', 'upload/advertising/1497070217.png', '4', '0', '#ffffff');
INSERT INTO `tp_platform_adv` VALUES ('1011', '1074', '推荐楼层6楼——多图1', '#', 'upload/advertising/1497070237.png', '0', '0', '#ffffff');
INSERT INTO `tp_platform_adv` VALUES ('1012', '1074', '推荐楼层6楼——多图2', '#', 'upload/advertising/1497070248.png', '1', '0', '#ffffff');
INSERT INTO `tp_platform_adv` VALUES ('1013', '1074', '推荐楼层6楼——多图3', '#', 'upload/advertising/1497070260.png', '2', '0', '#ffffff');
INSERT INTO `tp_platform_adv` VALUES ('1014', '1074', '推荐楼层6楼——多图4', '#', 'upload/advertising/1497070272.png', '3', '0', '#ffffff');
INSERT INTO `tp_platform_adv` VALUES ('1015', '1074', '推荐楼层6楼——多图5', '#', 'upload/advertising/1497070289.png', '4', '0', '#ffffff');
INSERT INTO `tp_platform_adv` VALUES ('1016', '1075', '轮播图1', '#', 'upload/advertising/1497070321.png', '1', '0', '#22334d');
INSERT INTO `tp_platform_adv` VALUES ('1017', '1076', 'banner图一', '#', 'upload/advertising/1497070389.jpg', '0', '0', '#ffffff');
INSERT INTO `tp_platform_adv` VALUES ('1018', '1102', '默认广告', '', 'upload/advertising/1497070577.jpg', '1', '0', '#ffffff');
INSERT INTO `tp_platform_adv` VALUES ('1019', '1075', '轮播图2', '#', 'upload/advertising/1497070334.png', '2', '0', '#130f09');
INSERT INTO `tp_platform_adv` VALUES ('1020', '1075', '轮播图3', '#', 'upload/advertising/1497070349.png', '3', '0', '#a9dff9');
INSERT INTO `tp_platform_adv` VALUES ('1021', '1076', '牛酷logo', '#', 'upload/advertising/1497070514.jpg', '1', '0', '#ffffff');
INSERT INTO `tp_platform_adv` VALUES ('1022', '1076', 'banner图2', '#', 'upload/advertising/1497070493.jpg', '2', '0', '#ffffff');
INSERT INTO `tp_platform_adv` VALUES ('1023', '1076', 'banner图3', '#', 'upload/advertising/1497070540.jpg', '3', '0', '#ffffff');
INSERT INTO `tp_platform_adv` VALUES ('1024', '1053', '广告3', '#', 'upload/advertising/1497067871.png', '2', '0', '#ff8000');
INSERT INTO `tp_platform_adv` VALUES ('1025', '1053', '广告4', '#', 'upload/advertising/1497067886.png', '3', '0', '#ff0080');
INSERT INTO `tp_platform_adv` VALUES ('1028', '1103', '轮播3', 'javascript:;', 'upload/common/1500524135.png', '3', '0', '#ff8080');
INSERT INTO `tp_platform_adv` VALUES ('1032', '1107', '店铺推广中心广告位1', '#', 'upload/advertising/1497070700.png', '0', '0', '#ff0000');
INSERT INTO `tp_platform_adv` VALUES ('1033', '1152', '平台会员中心中间广告位', '#', 'upload/advertising/1497070745.png', '0', '0', '#000000');
INSERT INTO `tp_platform_adv` VALUES ('1034', '1153', '店铺会员中心广告位', '#', 'upload/advertising/1497070769.png', '0', '0', '#000000');
INSERT INTO `tp_platform_adv` VALUES ('1038', '1162', '品牌专区广告位', '#', 'upload/advertising/1497070819.png', '0', '0', '#000000');
INSERT INTO `tp_platform_adv` VALUES ('1040', '1164', '手机端商城热卖', '#', 'upload/advertising/1497070853.png', '1', '0', '#000000');
INSERT INTO `tp_platform_adv` VALUES ('1041', '1165', '积分中心广告', '#', 'upload/advertising/1497070872.png', '1', '0', '#000000');
INSERT INTO `tp_platform_adv` VALUES ('1042', '1071', '广告7', '122', 'upload/advertising/1498707837.png', '0', '0', '#000000');
INSERT INTO `tp_platform_adv` VALUES ('1043', '1168', '11', 'b', 'upload/common/1499747308.png', '3', '0', '#000000');

-- ----------------------------
-- Table structure for tp_platform_adv_position
-- ----------------------------
DROP TABLE IF EXISTS `tp_platform_adv_position`;
CREATE TABLE `tp_platform_adv_position` (
  `ap_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '广告位置id',
  `ap_name` varchar(100) NOT NULL COMMENT '广告位置名',
  `ap_intro` varchar(255) NOT NULL COMMENT '广告位简介',
  `ap_class` smallint(1) unsigned NOT NULL COMMENT '广告类别：0图片1文字2幻灯3Flash',
  `ap_display` smallint(1) unsigned NOT NULL COMMENT '广告展示方式：0幻灯片1多广告展示2单广告展示',
  `is_use` smallint(1) unsigned NOT NULL COMMENT '广告位是否启用：0不启用1启用',
  `ap_height` int(10) NOT NULL COMMENT '广告位高度',
  `ap_width` int(10) NOT NULL COMMENT '广告位宽度',
  `ap_price` int(10) unsigned DEFAULT NULL COMMENT '广告位单价',
  `adv_num` int(10) unsigned DEFAULT NULL COMMENT '拥有的广告数',
  `click_num` int(10) unsigned DEFAULT NULL COMMENT '广告位点击率',
  `default_content` varchar(100) NOT NULL COMMENT '广告位默认内容',
  `ap_background_color` varchar(50) NOT NULL DEFAULT '#FFFFFF' COMMENT '广告位背景色 默认白色',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '广告位所在位置类型   1 pc端  2 手机端',
  `instance_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `is_del` int(11) NOT NULL DEFAULT '0' COMMENT '是否可以删除 0可以 1不可删除',
  PRIMARY KEY (`ap_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1169 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1489 COMMENT='广告位表';

-- ----------------------------
-- Records of tp_platform_adv_position
-- ----------------------------
INSERT INTO `tp_platform_adv_position` VALUES ('1051', '平台首页最顶部广告栏', '平台首页最顶部广告栏', '0', '2', '1', '60', '1200', null, null, null, 'upload/advertising/1497067441.png', '#000000', '1', '0', '1');
INSERT INTO `tp_platform_adv_position` VALUES ('1052', '商城logo栏小广告', '商城logo栏小广告', '0', '2', '1', '90', '170', null, null, null, 'upload/advertising/1497067657.png', '#FFFFFF', '1', '0', '0');
INSERT INTO `tp_platform_adv_position` VALUES ('1053', '商城首页滚动图片栏', '商城首页滚动图片栏', '0', '2', '1', '443', '800', null, null, null, 'upload/advertising/1497067819.png', '#FFFFFF', '1', '0', '0');
INSERT INTO `tp_platform_adv_position` VALUES ('1054', '广告栏一', '广告栏一', '0', '2', '1', '140', '242', null, null, null, 'upload/advertising/1497067960.png', '', '1', '0', '0');
INSERT INTO `tp_platform_adv_position` VALUES ('1055', '广告栏二——店铺街', '广告栏二——店铺街', '0', '2', '1', '278', '400', null, null, null, 'upload/advertising/1486697351.jpg', '#ffffff', '1', '0', '0');
INSERT INTO `tp_platform_adv_position` VALUES ('1056', '限时折扣轮播图', '限时折扣轮播图', '0', '2', '1', '443', '1903', null, null, null, 'upload/advertising/1497068837.png', '#FFFFFF', '1', '0', '0');
INSERT INTO `tp_platform_adv_position` VALUES ('1057', '推荐楼层1楼——单图广告位', '推荐楼层1楼——单图广告位', '0', '2', '1', '485', '210', null, null, null, 'upload/advertising/1497068896.png', '#ffffff', '1', '0', '0');
INSERT INTO `tp_platform_adv_position` VALUES ('1058', '推荐楼层1楼——轮播图广告位', '推荐楼层1楼——轮播图广告位', '0', '0', '1', '485', '390', null, null, null, 'upload/advertising/1497069144.png', '#FFFFFF', '1', '0', '0');
INSERT INTO `tp_platform_adv_position` VALUES ('1059', '推荐楼层1楼——多图广告位', '推荐楼层1楼——多图广告位', '0', '1', '1', '300', '202', null, null, null, 'upload/advertising/1497069290.png', '#FFFFFF', '1', '0', '0');
INSERT INTO `tp_platform_adv_position` VALUES ('1060', '推荐楼层2楼——单图广告位', '推荐楼层2楼——单图广告位', '0', '2', '1', '485', '210', null, null, null, 'upload/advertising/1497069441.png', '#ffffff', '1', '0', '0');
INSERT INTO `tp_platform_adv_position` VALUES ('1061', '推荐楼层2楼——轮播图广告位', '推荐楼层2楼——轮播图广告位', '0', '0', '1', '485', '390', null, null, null, 'upload/advertising/1497069460.png', '#ffffff', '1', '0', '0');
INSERT INTO `tp_platform_adv_position` VALUES ('1062', '推荐楼层2楼——多图广告位', '推荐楼层2楼——多图广告位', '0', '1', '1', '300', '202', null, null, null, 'upload/advertising/1497069549.png', '#FFFFFF', '1', '0', '0');
INSERT INTO `tp_platform_adv_position` VALUES ('1063', '推荐楼层3楼——单图广告位', '推荐楼层3楼——单图广告位', '0', '2', '1', '485', '210', null, null, null, 'upload/advertising/1497069606.png', '#FFFFFF', '1', '0', '0');
INSERT INTO `tp_platform_adv_position` VALUES ('1064', '推荐楼层4楼——单图广告位', '推荐楼层4楼——单图广告位', '0', '2', '1', '485', '210', null, null, null, 'upload/advertising/1497069629.png', '#FFFFFF', '1', '0', '0');
INSERT INTO `tp_platform_adv_position` VALUES ('1065', '推荐楼层5楼——单图广告位', '推荐楼层5楼——单图广告位', '0', '2', '1', '485', '210', null, null, null, 'upload/advertising/1497069657.png', '#FFFFFF', '1', '0', '0');
INSERT INTO `tp_platform_adv_position` VALUES ('1066', '推荐楼层6楼——单图广告位', '推荐楼层6楼——单图广告位', '0', '2', '1', '485', '210', null, null, null, 'upload/advertising/1497069679.png', '#FFFFFF', '1', '0', '0');
INSERT INTO `tp_platform_adv_position` VALUES ('1067', '推荐楼层3楼——轮播图广告位', '推荐楼层3楼——轮播图广告位', '0', '0', '1', '485', '390', null, null, null, '', '#ffffff', '1', '0', '0');
INSERT INTO `tp_platform_adv_position` VALUES ('1068', '推荐楼层4楼——轮播图广告位', '推荐楼层4楼——轮播图广告位', '0', '0', '1', '485', '390', null, null, null, 'upload/advertising/1497069758.png', '#FFFFFF', '1', '0', '0');
INSERT INTO `tp_platform_adv_position` VALUES ('1069', '推荐楼层5楼——轮播图广告位', '推荐楼层5楼——轮播图广告位', '0', '0', '1', '485', '390', null, null, null, 'upload/advertising/1497069806.png', '#FFFFFF', '1', '0', '0');
INSERT INTO `tp_platform_adv_position` VALUES ('1070', '推荐楼层6楼——轮播图广告位', '推荐楼层6楼——轮播图广告位', '0', '0', '1', '485', '390', null, null, null, 'upload/advertising/1497069853.png', '#FFFFFF', '1', '0', '0');
INSERT INTO `tp_platform_adv_position` VALUES ('1071', '推荐楼层3楼——多图广告位', '推荐楼层3楼——多图广告位', '0', '1', '1', '300', '202', null, null, null, 'upload/advertising/1497069893.png', '#FFFFFF', '1', '0', '0');
INSERT INTO `tp_platform_adv_position` VALUES ('1072', '推荐楼层4楼——多图广告位', '推荐楼层4楼——多图广告位', '0', '1', '1', '300', '202', null, null, null, 'upload/advertising/1497070074.png', '#FFFFFF', '1', '0', '0');
INSERT INTO `tp_platform_adv_position` VALUES ('1073', '推荐楼层5楼——多图广告位', '推荐楼层5楼——多图广告位', '0', '1', '1', '300', '202', null, null, null, 'upload/advertising/1497070139.png', '#FFFFFF', '1', '0', '0');
INSERT INTO `tp_platform_adv_position` VALUES ('1074', '推荐楼层6楼——多图广告位', '推荐楼层6楼——多图广告位', '0', '1', '1', '300', '202', null, null, null, 'upload/advertising/1497070237.png', '#FFFFFF', '1', '0', '0');
INSERT INTO `tp_platform_adv_position` VALUES ('1075', '品牌专区banana轮播图', '品牌专区banana轮播图', '0', '0', '1', '443', '1210', null, null, null, 'upload/advertising/1497070321.png', '#000000', '1', '0', '0');
INSERT INTO `tp_platform_adv_position` VALUES ('1076', '积分中心', '积分中心banana图', '0', '2', '1', '320', '910', null, null, null, 'upload/advertising/1497070389.jpg', '#000000', '1', '0', '0');
INSERT INTO `tp_platform_adv_position` VALUES ('1102', '积分商场广告位2', '长条广告', '0', '2', '1', '60', '1210', null, null, null, 'upload/advertising/1497070577.jpg', '#000000', '1', '0', '0');
INSERT INTO `tp_platform_adv_position` VALUES ('1103', '登录页面轮播图', '登录页面轮播图', '0', '0', '1', '0', '0', null, null, null, 'upload/advertising/1497070612.png', '', '1', '0', '0');
INSERT INTO `tp_platform_adv_position` VALUES ('1105', '手机端首页最顶部广告栏', '', '0', '0', '1', '175', '320', null, null, null, 'upload/advertising/1497070640.png', '#000000', '2', '0', '1');
INSERT INTO `tp_platform_adv_position` VALUES ('1107', '店铺推广中心广告', '店铺推广中心广告111', '0', '2', '1', '188', '750', null, null, null, 'upload/advertising/1497070700.png', '', '2', '0', '0');
INSERT INTO `tp_platform_adv_position` VALUES ('1152', '平台会员中心广告位', '平台会员中心广告位1', '0', '2', '1', '100', '750', null, null, null, 'upload/advertising/1497070745.png', '', '2', '0', '0');
INSERT INTO `tp_platform_adv_position` VALUES ('1153', '店铺会员中心广告位', '店铺会员中心广告位', '0', '2', '1', '100', '750', null, null, null, 'upload/advertising/1497070769.png', '', '2', '0', '0');
INSERT INTO `tp_platform_adv_position` VALUES ('1162', '品牌专区广告', '品牌专区广告', '0', '2', '1', '192', '720', null, null, null, 'upload/advertising/1497070819.png', '#000000', '2', '0', '0');
INSERT INTO `tp_platform_adv_position` VALUES ('1163', '限时折扣专区广告位', '限时折扣专区广告位', '0', '2', '1', '130', '720', null, null, null, 'upload/advertising/1498133844.png', '#000000', '2', '0', '0');
INSERT INTO `tp_platform_adv_position` VALUES ('1164', '手机端商城热卖', '手机端商城热卖', '0', '2', '1', '100', '100', null, null, null, 'upload/advertising/1497070853.png', '#000000', '2', '0', '0');
INSERT INTO `tp_platform_adv_position` VALUES ('1165', '积分中心广告位', '积分中心广告位', '0', '2', '0', '100', '100', null, null, null, 'upload/advertising/1497070872.png', '#000000', '2', '0', '0');
INSERT INTO `tp_platform_adv_position` VALUES ('1167', '首页限时折扣广告位', '首页限时折扣广告位', '0', '2', '0', '130', '720', null, null, null, 'upload/advertising/1497949107.png', '#000000', '2', '0', '0');
INSERT INTO `tp_platform_adv_position` VALUES ('1168', '1', '1', '0', '2', '0', '0', '0', null, null, null, '', '', '1', '0', '0');

-- ----------------------------
-- Table structure for tp_platform_block
-- ----------------------------
DROP TABLE IF EXISTS `tp_platform_block`;
CREATE TABLE `tp_platform_block` (
  `block_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_display` smallint(4) NOT NULL DEFAULT '1' COMMENT '是否显示',
  `block_color` varchar(255) NOT NULL COMMENT '颜色风格',
  `sort` int(11) DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `modify_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `block_name` varchar(50) NOT NULL DEFAULT '' COMMENT '板块名称',
  `block_short_name` varchar(50) DEFAULT NULL COMMENT '板块简称',
  `recommend_ad_image_name` varchar(50) NOT NULL DEFAULT '' COMMENT '推荐单图广告位名称',
  `recommend_ad_image` int(11) NOT NULL DEFAULT '0' COMMENT '推荐单图广告位',
  `recommend_ad_slide_name` varchar(50) NOT NULL DEFAULT '' COMMENT '推荐幻灯广告位名称',
  `recommend_ad_slide` int(11) NOT NULL COMMENT '推荐幻灯广告位',
  `recommend_ad_images_name` varchar(255) NOT NULL DEFAULT '0' COMMENT '推荐多图广告位名称',
  `recommend_ad_images` int(11) NOT NULL DEFAULT '0' COMMENT '推荐多图广告位',
  `recommend_brands` varchar(255) NOT NULL DEFAULT '' COMMENT '推荐品牌',
  `recommend_categorys` varchar(255) NOT NULL DEFAULT '' COMMENT '推荐商品分类',
  `recommend_goods_category_name_1` varchar(50) NOT NULL DEFAULT '' COMMENT '推荐分类商品别名',
  `recommend_goods_category_1` int(11) NOT NULL DEFAULT '0' COMMENT '推荐显示商品分类',
  `recommend_goods_category_name_2` varchar(50) NOT NULL DEFAULT '' COMMENT '推荐分类商品别名',
  `recommend_goods_category_2` int(11) NOT NULL DEFAULT '0' COMMENT '推荐显示商品分类',
  `recommend_goods_category_name_3` varchar(50) NOT NULL DEFAULT '' COMMENT '推荐分类商品别名',
  `recommend_goods_category_3` int(11) NOT NULL DEFAULT '0' COMMENT '推荐显示商品分类',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `block_data` longtext COMMENT '板块数据',
  PRIMARY KEY (`block_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=2340 COMMENT='首页促销板块';

-- ----------------------------
-- Records of tp_platform_block
-- ----------------------------
INSERT INTO `tp_platform_block` VALUES ('22', '1', '#00ffff', '1', '2017-06-30 15:38:14', '2017-07-15 14:12:49', '食品生鲜', '生鲜', '单图广告位', '1063', '幻灯片广告位', '1058', '新品推荐', '1072', '10', '311,312', '进口食品', '320', '进口水果', '319', '爱吃日', '320', '0', null);

-- ----------------------------
-- Table structure for tp_platform_goods_recommend
-- ----------------------------
DROP TABLE IF EXISTS `tp_platform_goods_recommend`;
CREATE TABLE `tp_platform_goods_recommend` (
  `recommend_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `goods_id` int(11) NOT NULL COMMENT '推荐商品ID',
  `state` int(11) NOT NULL DEFAULT '1' COMMENT '推荐状态',
  `class_id` int(11) NOT NULL DEFAULT '1' COMMENT '推荐类型',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `modify_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`recommend_id`)
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=442 COMMENT='平台商品推荐';

-- ----------------------------
-- Records of tp_platform_goods_recommend
-- ----------------------------
INSERT INTO `tp_platform_goods_recommend` VALUES ('46', '358', '1', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tp_platform_goods_recommend` VALUES ('48', '351', '0', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tp_platform_goods_recommend` VALUES ('49', '351', '1', '2', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tp_platform_goods_recommend` VALUES ('56', '349', '0', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tp_platform_goods_recommend` VALUES ('64', '332', '1', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tp_platform_goods_recommend` VALUES ('65', '341', '1', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tp_platform_goods_recommend` VALUES ('66', '347', '1', '2', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tp_platform_goods_recommend` VALUES ('67', '266', '1', '2', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tp_platform_goods_recommend` VALUES ('68', '266', '1', '3', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tp_platform_goods_recommend` VALUES ('69', '324', '1', '3', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tp_platform_goods_recommend` VALUES ('70', '324', '1', '2', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tp_platform_goods_recommend` VALUES ('71', '344', '1', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tp_platform_goods_recommend` VALUES ('72', '344', '1', '2', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tp_platform_goods_recommend` VALUES ('73', '344', '1', '3', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tp_platform_goods_recommend` VALUES ('74', '339', '1', '3', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tp_platform_goods_recommend` VALUES ('75', '340', '1', '2', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tp_platform_goods_recommend` VALUES ('77', '341', '1', '3', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tp_platform_goods_recommend` VALUES ('101', '358', '1', '2', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tp_platform_goods_recommend` VALUES ('102', '358', '1', '3', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tp_platform_goods_recommend` VALUES ('103', '350', '1', '2', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tp_platform_goods_recommend` VALUES ('110', '349', '1', '2', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tp_platform_goods_recommend` VALUES ('136', '380', '1', '38', '2017-07-21 09:55:35', '2017-07-21 09:55:35');
INSERT INTO `tp_platform_goods_recommend` VALUES ('137', '382', '1', '38', '2017-07-21 09:55:35', '2017-07-21 09:55:35');
INSERT INTO `tp_platform_goods_recommend` VALUES ('138', '381', '1', '38', '2017-07-21 09:55:35', '2017-07-21 09:55:35');
INSERT INTO `tp_platform_goods_recommend` VALUES ('139', '383', '1', '38', '2017-07-21 09:55:35', '2017-07-21 09:55:35');
INSERT INTO `tp_platform_goods_recommend` VALUES ('140', '384', '1', '38', '2017-07-21 09:55:35', '2017-07-21 09:55:35');
INSERT INTO `tp_platform_goods_recommend` VALUES ('141', '386', '1', '41', '2017-07-21 15:24:38', '2017-07-21 15:24:38');
INSERT INTO `tp_platform_goods_recommend` VALUES ('142', '387', '1', '41', '2017-07-21 15:24:38', '2017-07-21 15:24:38');
INSERT INTO `tp_platform_goods_recommend` VALUES ('143', '388', '1', '41', '2017-07-21 15:24:38', '2017-07-21 15:24:38');
INSERT INTO `tp_platform_goods_recommend` VALUES ('144', '383', '1', '42', '2017-07-21 18:16:41', '2017-07-21 18:16:41');
INSERT INTO `tp_platform_goods_recommend` VALUES ('145', '384', '1', '42', '2017-07-21 18:16:41', '2017-07-21 18:16:41');
INSERT INTO `tp_platform_goods_recommend` VALUES ('146', '385', '1', '42', '2017-07-21 18:16:41', '2017-07-21 18:16:41');
INSERT INTO `tp_platform_goods_recommend` VALUES ('147', '391', '1', '43', '2017-07-21 18:28:37', '2017-07-21 18:28:37');
INSERT INTO `tp_platform_goods_recommend` VALUES ('148', '390', '1', '43', '2017-07-21 18:28:37', '2017-07-21 18:28:37');
INSERT INTO `tp_platform_goods_recommend` VALUES ('149', '389', '1', '43', '2017-07-21 18:28:37', '2017-07-21 18:28:37');

-- ----------------------------
-- Table structure for tp_platform_goods_recommend_class
-- ----------------------------
DROP TABLE IF EXISTS `tp_platform_goods_recommend_class`;
CREATE TABLE `tp_platform_goods_recommend_class` (
  `class_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `class_name` varchar(50) NOT NULL DEFAULT '' COMMENT '类型名称',
  `class_type` int(11) NOT NULL DEFAULT '1' COMMENT '推荐模块1.系统固有模块2.平台增加模块',
  `is_use` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否使用',
  `sort` int(11) NOT NULL DEFAULT '255' COMMENT '排序号',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=2340 COMMENT='店铺商品推荐类别';

-- ----------------------------
-- Records of tp_platform_goods_recommend_class
-- ----------------------------
INSERT INTO `tp_platform_goods_recommend_class` VALUES ('1', '新品推荐', '1', '1', '255', '0');
INSERT INTO `tp_platform_goods_recommend_class` VALUES ('2', '精品推荐', '1', '1', '255', '0');
INSERT INTO `tp_platform_goods_recommend_class` VALUES ('3', '热卖商品', '1', '1', '255', '0');
INSERT INTO `tp_platform_goods_recommend_class` VALUES ('38', '清凉一夏', '2', '1', '0', '0');
INSERT INTO `tp_platform_goods_recommend_class` VALUES ('41', '新品推荐', '2', '1', '0', '1');
INSERT INTO `tp_platform_goods_recommend_class` VALUES ('42', '商城促销', '2', '1', '0', '41');
INSERT INTO `tp_platform_goods_recommend_class` VALUES ('43', '促销', '2', '1', '1', '42');

-- ----------------------------
-- Table structure for tp_platform_help_class
-- ----------------------------
DROP TABLE IF EXISTS `tp_platform_help_class`;
CREATE TABLE `tp_platform_help_class` (
  `class_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表主键',
  `type` int(11) NOT NULL DEFAULT '1' COMMENT '1.帮助类别2.会员协议类别3.开店协议类别',
  `class_name` varchar(50) NOT NULL DEFAULT '' COMMENT '类型名称',
  `parent_class_id` int(11) NOT NULL DEFAULT '0' COMMENT '上级ID',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序号',
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=4096 COMMENT='平台说明类型';

-- ----------------------------
-- Records of tp_platform_help_class
-- ----------------------------
INSERT INTO `tp_platform_help_class` VALUES ('1', '1', '新手上路', '0', '1');
INSERT INTO `tp_platform_help_class` VALUES ('2', '1', '配送与支付', '0', '2');
INSERT INTO `tp_platform_help_class` VALUES ('3', '1', '会员中心', '0', '3');
INSERT INTO `tp_platform_help_class` VALUES ('4', '1', '服务保证', '0', '4');
INSERT INTO `tp_platform_help_class` VALUES ('5', '1', '联系我们', '0', '5');

-- ----------------------------
-- Table structure for tp_platform_help_document
-- ----------------------------
DROP TABLE IF EXISTS `tp_platform_help_document`;
CREATE TABLE `tp_platform_help_document` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '表主键',
  `uid` int(11) NOT NULL COMMENT '最后修改人ID',
  `class_id` int(11) NOT NULL COMMENT '所属说明类型ID',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '主题',
  `link_url` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序号',
  `content` text NOT NULL COMMENT '内容',
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '图片',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `modufy_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1489 COMMENT='平台说明内容';

-- ----------------------------
-- Records of tp_platform_help_document
-- ----------------------------
INSERT INTO `tp_platform_help_document` VALUES ('2', '2', '2', '支付方式说明', '', '5', '<p>支付方式说明</p>', '', '0000-00-00 00:00:00', '2017-05-03 19:15:55');
INSERT INTO `tp_platform_help_document` VALUES ('3', '87', '3', '售后流程', '', '0', '<p>1212124545</p>', '', '0000-00-00 00:00:00', '2017-07-11 11:37:22');
INSERT INTO `tp_platform_help_document` VALUES ('5', '2', '3', '资金管理', '', '6', '<p>资金管理</p>', '', '0000-00-00 00:00:00', '2017-05-05 14:10:39');
INSERT INTO `tp_platform_help_document` VALUES ('6', '2', '3', '我的收藏', '', '7', '<p>我的收藏</p>', '', '0000-00-00 00:00:00', '2017-05-03 19:00:15');
INSERT INTO `tp_platform_help_document` VALUES ('7', '2', '2', '货到付款区域', '', '3', '<p>货到付款区域</p>', '', '2017-02-20 11:05:01', '2017-05-03 19:15:13');
INSERT INTO `tp_platform_help_document` VALUES ('8', '87', '1', '配送支付智能查询', '', '4', '<p>jjjjjjjjjjjjjjjjjjjjj<br/></p>', '', '2017-02-20 11:05:42', '2017-07-05 15:56:13');
INSERT INTO `tp_platform_help_document` VALUES ('9', '2', '4', '退换货原则', '', '9', '<p>退换货原则</p>', '', '2017-02-20 11:10:38', '2017-05-03 19:03:26');
INSERT INTO `tp_platform_help_document` VALUES ('10', '2', '4', '售后服务保证', '', '9', '<p>售后服务保证</p>', '', '2017-02-20 11:11:03', '2017-05-03 19:03:47');
INSERT INTO `tp_platform_help_document` VALUES ('11', '2', '4', '产品质量保证', '', '10', '<p>产品质量保证</p>', '', '2017-02-20 11:11:36', '2017-05-03 19:04:03');
INSERT INTO `tp_platform_help_document` VALUES ('12', '2', '5', '网站故障报告', '', '11', '<p>网站故障报告</p>', '', '2017-02-20 11:12:18', '2017-05-03 19:05:46');
INSERT INTO `tp_platform_help_document` VALUES ('14', '1', '3', '我的订单', '', '8', '<p>我的订单</p>', '', '2017-05-03 18:57:46', '2017-06-10 21:55:58');
INSERT INTO `tp_platform_help_document` VALUES ('15', '2', '5', '选机咨询', '', '12', '<p>选机咨询</p>', '', '2017-05-03 19:04:42', '2017-05-03 19:06:05');
INSERT INTO `tp_platform_help_document` VALUES ('16', '2', '5', '投诉与建议', '', '13', '<p>投诉与建议</p>', '', '2017-05-03 19:05:11', '2017-05-05 14:12:01');
INSERT INTO `tp_platform_help_document` VALUES ('18', '87', '1', '有问题请找我', '', '2', '<p><img src=\"/niushop_b2c_demo/upload/ueditor/php/upload/image/20170705/1499237044135722.png\" style=\"\"/></p><p><img src=\"/niushop_b2c_demo/upload/ueditor/php/upload/image/20170614/1497425490572839.jpg\" style=\"\"/></p><p><br/></p>', '', '2017-07-05 14:53:50', '2017-07-05 14:53:50');

-- ----------------------------
-- Table structure for tp_platform_link
-- ----------------------------
DROP TABLE IF EXISTS `tp_platform_link`;
CREATE TABLE `tp_platform_link` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '索引id',
  `link_title` varchar(100) NOT NULL COMMENT '标题',
  `link_url` varchar(100) NOT NULL COMMENT '链接',
  `link_pic` varchar(100) NOT NULL COMMENT '图片',
  `link_sort` int(11) DEFAULT NULL,
  `is_blank` int(11) NOT NULL DEFAULT '0' COMMENT '是否新窗口打开 1.是 0.否',
  `is_show` int(11) NOT NULL DEFAULT '0' COMMENT '是否显示 1.是 0.否',
  PRIMARY KEY (`link_id`)
) ENGINE=MyISAM AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=50 COMMENT='友情链接表';

-- ----------------------------
-- Records of tp_platform_link
-- ----------------------------

-- ----------------------------
-- Table structure for tp_point_config
-- ----------------------------
DROP TABLE IF EXISTS `tp_point_config`;
CREATE TABLE `tp_point_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `shop_id` int(11) NOT NULL COMMENT '店铺ID',
  `is_open` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否启动',
  `convert_rate` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '1积分对应金额',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `modify_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `desc` text NOT NULL COMMENT '积分说明',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='积分设置表';

-- ----------------------------
-- Records of tp_point_config
-- ----------------------------
INSERT INTO `tp_point_config` VALUES ('4', '0', '0', '0.11', '2017-06-10 09:49:45', '2017-07-19 14:30:10', '111');
INSERT INTO `tp_point_config` VALUES ('5', '1', '0', '0.00', '2017-07-13 14:05:44', '0000-00-00 00:00:00', '');
INSERT INTO `tp_point_config` VALUES ('6', '41', '0', '0.00', '2017-07-20 16:03:40', '0000-00-00 00:00:00', '');

-- ----------------------------
-- Table structure for tp_promotion_bundling
-- ----------------------------
DROP TABLE IF EXISTS `tp_promotion_bundling`;
CREATE TABLE `tp_promotion_bundling` (
  `bl_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '组合ID',
  `bl_name` varchar(50) NOT NULL COMMENT '组合名称',
  `shop_id` int(11) NOT NULL COMMENT '店铺id',
  `shop_name` varchar(100) NOT NULL COMMENT '店铺名称',
  `bl_price` decimal(10,2) NOT NULL COMMENT '商品组合价格',
  `shipping_fee_type` tinyint(1) NOT NULL COMMENT '运费承担方式 1卖家承担运费 2买家承担运费',
  `shipping_fee` decimal(10,2) NOT NULL COMMENT '运费',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '组合状态 0-关闭/1-开启',
  PRIMARY KEY (`bl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组合销售活动表';

-- ----------------------------
-- Records of tp_promotion_bundling
-- ----------------------------

-- ----------------------------
-- Table structure for tp_promotion_bundling_goods
-- ----------------------------
DROP TABLE IF EXISTS `tp_promotion_bundling_goods`;
CREATE TABLE `tp_promotion_bundling_goods` (
  `bl_goods_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '组合商品id',
  `bl_id` int(11) NOT NULL COMMENT '组合id',
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品id',
  `goods_name` varchar(50) NOT NULL COMMENT '商品名称',
  `goods_picture` varchar(100) NOT NULL COMMENT '商品图片',
  `bl_goods_price` decimal(10,2) NOT NULL COMMENT '商品组合价格',
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`bl_goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组合销售活动商品表';

-- ----------------------------
-- Records of tp_promotion_bundling_goods
-- ----------------------------

-- ----------------------------
-- Table structure for tp_promotion_discount
-- ----------------------------
DROP TABLE IF EXISTS `tp_promotion_discount`;
CREATE TABLE `tp_promotion_discount` (
  `discount_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `shop_id` int(11) NOT NULL DEFAULT '1' COMMENT '店铺ID',
  `shop_name` varchar(50) NOT NULL DEFAULT '' COMMENT '店铺名称',
  `discount_name` varchar(255) NOT NULL DEFAULT '' COMMENT '活动名称',
  `start_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '开始时间',
  `end_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '结束时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '活动状态(0-未发布/1-正常/3-关闭/4-结束)',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `modify_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `remark` text NOT NULL COMMENT '备注',
  `examine_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '审核状态(0-待审核/1-审核通过/2-审核拒绝)',
  PRIMARY KEY (`discount_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=4096 COMMENT='限时折扣';

-- ----------------------------
-- Records of tp_promotion_discount
-- ----------------------------

-- ----------------------------
-- Table structure for tp_promotion_discount_goods
-- ----------------------------
DROP TABLE IF EXISTS `tp_promotion_discount_goods`;
CREATE TABLE `tp_promotion_discount_goods` (
  `discount_goods_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `discount_id` int(11) NOT NULL COMMENT '对应活动',
  `start_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '开始时间',
  `end_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '结束时间',
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `discount` decimal(10,2) NOT NULL COMMENT '活动折扣或者减现信息',
  `goods_name` varchar(255) NOT NULL DEFAULT '' COMMENT '商品名称',
  `goods_picture` int(11) NOT NULL COMMENT '商品图片',
  PRIMARY KEY (`discount_goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=712 COMMENT='限时折扣商品列表';

-- ----------------------------
-- Records of tp_promotion_discount_goods
-- ----------------------------

-- ----------------------------
-- Table structure for tp_promotion_full_mail
-- ----------------------------
DROP TABLE IF EXISTS `tp_promotion_full_mail`;
CREATE TABLE `tp_promotion_full_mail` (
  `mail_id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `is_open` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否开启 0未开启 1已开启',
  `full_mail_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '包邮所需订单金额',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `modify_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  PRIMARY KEY (`mail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='满额包邮';

-- ----------------------------
-- Records of tp_promotion_full_mail
-- ----------------------------
INSERT INTO `tp_promotion_full_mail` VALUES ('2', '0', '0', '50.00', '2017-06-10 09:49:51', '2017-06-22 18:05:26');
INSERT INTO `tp_promotion_full_mail` VALUES ('3', '1', '0', '0.00', '2017-07-19 16:28:41', '0000-00-00 00:00:00');
INSERT INTO `tp_promotion_full_mail` VALUES ('4', '41', '0', '0.00', '2017-07-21 17:16:06', '0000-00-00 00:00:00');
INSERT INTO `tp_promotion_full_mail` VALUES ('5', '0', '0', '0.00', '2017-08-31 19:37:02', '0000-00-00 00:00:00');
INSERT INTO `tp_promotion_full_mail` VALUES ('6', '0', '0', '0.00', '2017-08-31 19:38:55', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for tp_promotion_gift
-- ----------------------------
DROP TABLE IF EXISTS `tp_promotion_gift`;
CREATE TABLE `tp_promotion_gift` (
  `gift_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '赠品活动id ',
  `start_time` datetime NOT NULL COMMENT '赠品有效期开始时间',
  `days` int(10) unsigned NOT NULL COMMENT '领取有效期(多少天)',
  `end_time` datetime NOT NULL COMMENT '赠品有效期结束时间',
  `max_num` varchar(50) NOT NULL COMMENT '领取限制(次/人 (0表示不限领取次数))',
  `shop_id` varchar(100) NOT NULL COMMENT '店铺id',
  `gift_name` varchar(255) NOT NULL COMMENT '赠品活动名称',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`gift_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192 COMMENT='赠品活动表';

-- ----------------------------
-- Records of tp_promotion_gift
-- ----------------------------

-- ----------------------------
-- Table structure for tp_promotion_gift_goods
-- ----------------------------
DROP TABLE IF EXISTS `tp_promotion_gift_goods`;
CREATE TABLE `tp_promotion_gift_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id ',
  `gift_id` int(10) unsigned NOT NULL COMMENT '赠品id ',
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品id',
  `goods_name` varchar(50) NOT NULL COMMENT '商品名称',
  `goods_picture` varchar(100) NOT NULL COMMENT '商品图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192 COMMENT='商品赠品表';

-- ----------------------------
-- Records of tp_promotion_gift_goods
-- ----------------------------

-- ----------------------------
-- Table structure for tp_promotion_mansong
-- ----------------------------
DROP TABLE IF EXISTS `tp_promotion_mansong`;
CREATE TABLE `tp_promotion_mansong` (
  `mansong_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '满送活动编号',
  `mansong_name` varchar(50) NOT NULL COMMENT '活动名称',
  `start_time` datetime NOT NULL COMMENT '活动开始时间',
  `end_time` datetime NOT NULL COMMENT '活动结束时间',
  `shop_id` int(10) unsigned NOT NULL COMMENT '店铺编号',
  `shop_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `status` tinyint(1) unsigned NOT NULL COMMENT '活动状态(0-未发布/1-正常/3-关闭/4-结束)',
  `remark` varchar(200) NOT NULL COMMENT '备注',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1.普通优惠  2.多级优惠',
  `range_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1全部商品 0部分商品',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `examine_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '审核状态(0-待审核/1-审核通过/2-审核拒绝)',
  PRIMARY KEY (`mansong_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1638 COMMENT='满减送活动表';

-- ----------------------------
-- Records of tp_promotion_mansong
-- ----------------------------
INSERT INTO `tp_promotion_mansong` VALUES ('1', 'aaaa', '2017-07-22 11:48:51', '2017-07-31 11:48:54', '42', '苏泊尔家电', '4', '', '1', '1', '2017-07-21 11:49:23', '0000-00-00 00:00:00', '0');

-- ----------------------------
-- Table structure for tp_promotion_mansong_goods
-- ----------------------------
DROP TABLE IF EXISTS `tp_promotion_mansong_goods`;
CREATE TABLE `tp_promotion_mansong_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `mansong_id` int(11) NOT NULL COMMENT '满减送ID',
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `goods_name` varchar(50) NOT NULL DEFAULT '' COMMENT '商品名称',
  `goods_picture` varchar(255) NOT NULL DEFAULT '' COMMENT '商品图片',
  `start_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '开始时间',
  `end_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '结束时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '活动状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1489 COMMENT='满减送商品';

-- ----------------------------
-- Records of tp_promotion_mansong_goods
-- ----------------------------

-- ----------------------------
-- Table structure for tp_promotion_mansong_rule
-- ----------------------------
DROP TABLE IF EXISTS `tp_promotion_mansong_rule`;
CREATE TABLE `tp_promotion_mansong_rule` (
  `rule_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则编号',
  `mansong_id` int(10) unsigned NOT NULL COMMENT '活动编号',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '级别价格(满多少)',
  `discount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '减现金优惠金额（减多少金额）',
  `free_shipping` tinyint(4) NOT NULL DEFAULT '0' COMMENT '免邮费',
  `give_point` int(11) NOT NULL DEFAULT '0' COMMENT '送积分数量（0表示不送）',
  `give_coupon` int(11) NOT NULL DEFAULT '0' COMMENT '送优惠券的id（0表示不送）',
  `gift_id` int(11) NOT NULL COMMENT '礼品(赠品)id',
  PRIMARY KEY (`rule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1170 COMMENT='满就送活动规则表';

-- ----------------------------
-- Records of tp_promotion_mansong_rule
-- ----------------------------
INSERT INTO `tp_promotion_mansong_rule` VALUES ('1', '1', '100.00', '10.00', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for tp_province
-- ----------------------------
DROP TABLE IF EXISTS `tp_province`;
CREATE TABLE `tp_province` (
  `province_id` int(11) NOT NULL AUTO_INCREMENT,
  `area_id` tinyint(4) NOT NULL DEFAULT '0',
  `province_name` varchar(255) NOT NULL DEFAULT '',
  `sort` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`province_id`),
  KEY `IDX_g_province_ProvinceName` (`province_name`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=481;

-- ----------------------------
-- Records of tp_province
-- ----------------------------
INSERT INTO `tp_province` VALUES ('1', '2', '北京市', '1');
INSERT INTO `tp_province` VALUES ('2', '2', '天津市', '0');
INSERT INTO `tp_province` VALUES ('3', '2', '河北省', '0');
INSERT INTO `tp_province` VALUES ('4', '2', '山西省', '0');
INSERT INTO `tp_province` VALUES ('5', '2', '内蒙古自治区', '0');
INSERT INTO `tp_province` VALUES ('6', '5', '辽宁省', '0');
INSERT INTO `tp_province` VALUES ('7', '5', '吉林省', '0');
INSERT INTO `tp_province` VALUES ('8', '5', '黑龙江省', '0');
INSERT INTO `tp_province` VALUES ('9', '1', '上海市', '0');
INSERT INTO `tp_province` VALUES ('10', '1', '江苏省', '0');
INSERT INTO `tp_province` VALUES ('11', '1', '浙江省', '0');
INSERT INTO `tp_province` VALUES ('12', '1', '安徽省', '0');
INSERT INTO `tp_province` VALUES ('13', '3', '福建省', '0');
INSERT INTO `tp_province` VALUES ('14', '1', '江西省', '0');
INSERT INTO `tp_province` VALUES ('15', '2', '山东省', '0');
INSERT INTO `tp_province` VALUES ('16', '4', '河南省', '0');
INSERT INTO `tp_province` VALUES ('17', '4', '湖北省', '0');
INSERT INTO `tp_province` VALUES ('18', '4', '湖南省', '0');
INSERT INTO `tp_province` VALUES ('19', '3', '广东省', '0');
INSERT INTO `tp_province` VALUES ('20', '3', '广西壮族自治区', '0');
INSERT INTO `tp_province` VALUES ('21', '3', '海南省', '0');
INSERT INTO `tp_province` VALUES ('22', '7', '重庆市', '0');
INSERT INTO `tp_province` VALUES ('23', '7', '四川省', '0');
INSERT INTO `tp_province` VALUES ('24', '7', '贵州省', '0');
INSERT INTO `tp_province` VALUES ('25', '7', '云南省', '0');
INSERT INTO `tp_province` VALUES ('26', '7', '西藏自治区', '0');
INSERT INTO `tp_province` VALUES ('27', '6', '陕西省', '0');
INSERT INTO `tp_province` VALUES ('28', '6', '甘肃省', '0');
INSERT INTO `tp_province` VALUES ('29', '6', '青海省', '0');
INSERT INTO `tp_province` VALUES ('30', '6', '宁夏回族自治区', '0');
INSERT INTO `tp_province` VALUES ('31', '6', '新疆维吾尔自治区', '0');
INSERT INTO `tp_province` VALUES ('32', '8', '香港特别行政区', '0');
INSERT INTO `tp_province` VALUES ('33', '8', '澳门特别行政区', '0');
INSERT INTO `tp_province` VALUES ('34', '8', '台湾省', '0');

-- ----------------------------
-- Table structure for tp_reward_rule
-- ----------------------------
DROP TABLE IF EXISTS `tp_reward_rule`;
CREATE TABLE `tp_reward_rule` (
  `shop_id` int(10) unsigned NOT NULL,
  `sign_point` int(11) NOT NULL DEFAULT '0' COMMENT '签到送积分',
  `share_point` int(11) NOT NULL DEFAULT '0' COMMENT '分享送积分',
  `reg_member_self_point` int(11) NOT NULL DEFAULT '0' COMMENT '注册会员 自己获得的积分',
  `reg_member_one_point` int(11) NOT NULL DEFAULT '0' COMMENT '注册会员 上级获得的积分',
  `reg_member_two_point` int(11) NOT NULL DEFAULT '0' COMMENT '注册会员 上上级获得的积分',
  `reg_member_three_point` int(11) NOT NULL DEFAULT '0' COMMENT '注册会员 上上上级获得的积分',
  `reg_promoter_self_point` int(11) NOT NULL DEFAULT '0' COMMENT '成为推广员 自己获得的积分',
  `reg_promoter_one_point` int(11) NOT NULL DEFAULT '0' COMMENT '成为推广员 上级获得的积分',
  `reg_promoter_two_point` int(11) NOT NULL DEFAULT '0' COMMENT '成为推广员 上上级获得的积分',
  `reg_promoter_three_point` int(11) NOT NULL DEFAULT '0' COMMENT '成为推广员 上上上级获得的积分',
  `reg_partner_self_point` int(11) NOT NULL DEFAULT '0' COMMENT '成为股东 自己获得的积分',
  `reg_partner_one_point` int(11) NOT NULL DEFAULT '0' COMMENT '成为股东 上级获得的积分',
  `reg_partner_two_point` int(11) NOT NULL DEFAULT '0' COMMENT '成为股东 上上级获得的积分',
  `reg_partner_three_point` int(11) NOT NULL DEFAULT '0' COMMENT '成为股东 上上上级获得的积分',
  `into_store_coupon` int(11) NOT NULL DEFAULT '0' COMMENT '进店领用优惠券  存入优惠券id(coupon_id)',
  `share_coupon` int(11) NOT NULL DEFAULT '0' COMMENT '分享领用优惠券  存入优惠券id(coupon_id)',
  PRIMARY KEY (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='奖励规则表';

-- ----------------------------
-- Records of tp_reward_rule
-- ----------------------------
INSERT INTO `tp_reward_rule` VALUES ('0', '100', '10', '10', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for tp_shop
-- ----------------------------
DROP TABLE IF EXISTS `tp_shop`;
CREATE TABLE `tp_shop` (
  `shop_id` int(11) NOT NULL COMMENT '店铺索引id',
  `shop_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `shop_type` int(11) NOT NULL COMMENT '店铺类型等级',
  `uid` int(11) NOT NULL COMMENT '会员id',
  `shop_group_id` int(11) NOT NULL COMMENT '店铺分类',
  `shop_company_name` varchar(50) DEFAULT NULL COMMENT '店铺公司名称',
  `province_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '店铺所在省份ID',
  `city_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '店铺所在市ID',
  `shop_address` varchar(100) NOT NULL DEFAULT '' COMMENT '详细地区',
  `shop_zip` varchar(10) NOT NULL DEFAULT '' COMMENT '邮政编码',
  `shop_state` tinyint(1) NOT NULL DEFAULT '1' COMMENT '店铺状态，0关闭，1开启，2审核中',
  `shop_close_info` varchar(255) DEFAULT NULL COMMENT '店铺关闭原因',
  `shop_sort` int(11) NOT NULL DEFAULT '0' COMMENT '店铺排序',
  `shop_create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '店铺时间',
  `shop_end_time` datetime DEFAULT NULL COMMENT '店铺关闭时间',
  `shop_logo` varchar(255) DEFAULT NULL COMMENT '店铺logo',
  `shop_banner` varchar(255) DEFAULT NULL COMMENT '店铺横幅',
  `shop_avatar` varchar(150) DEFAULT NULL COMMENT '店铺头像',
  `shop_keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺seo关键字',
  `shop_description` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺seo描述',
  `shop_qq` varchar(50) DEFAULT NULL COMMENT 'QQ',
  `shop_ww` varchar(50) DEFAULT NULL COMMENT '阿里旺旺',
  `shop_phone` varchar(20) DEFAULT NULL COMMENT '商家电话',
  `shop_domain` varchar(50) DEFAULT NULL COMMENT '店铺二级域名',
  `shop_domain_times` tinyint(1) unsigned DEFAULT '0' COMMENT '二级域名修改次数',
  `shop_recommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '推荐，0为否，1为是，默认为0',
  `shop_credit` int(10) NOT NULL DEFAULT '0' COMMENT '店铺信用',
  `shop_desccredit` float NOT NULL DEFAULT '0' COMMENT '描述相符度分数',
  `shop_servicecredit` float NOT NULL DEFAULT '0' COMMENT '服务态度分数',
  `shop_deliverycredit` float NOT NULL DEFAULT '0' COMMENT '发货速度分数',
  `shop_collect` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '店铺收藏数量',
  `shop_stamp` varchar(200) DEFAULT NULL COMMENT '店铺印章',
  `shop_printdesc` varchar(500) DEFAULT NULL COMMENT '打印订单页面下方说明文字',
  `shop_sales` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '店铺销售额（不计算退款）',
  `shop_account` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '店铺账户余额',
  `shop_cash` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '店铺可提现金额',
  `shop_workingtime` varchar(100) DEFAULT NULL COMMENT '工作时间',
  `live_store_name` varchar(255) DEFAULT NULL COMMENT '商铺名称',
  `live_store_address` varchar(255) DEFAULT NULL COMMENT '商家地址',
  `live_store_tel` varchar(255) DEFAULT NULL COMMENT '商铺电话',
  `live_store_bus` varchar(255) DEFAULT NULL COMMENT '公交线路',
  `shop_vrcode_prefix` char(3) DEFAULT NULL COMMENT '商家兑换码前缀',
  `store_qtian` tinyint(1) DEFAULT '0' COMMENT '7天退换',
  `shop_zhping` tinyint(1) DEFAULT '0' COMMENT '正品保障',
  `shop_erxiaoshi` tinyint(1) DEFAULT '0' COMMENT '两小时发货',
  `shop_tuihuo` tinyint(1) DEFAULT '0' COMMENT '退货承诺',
  `shop_shiyong` tinyint(1) DEFAULT '0' COMMENT '试用中心',
  `shop_shiti` tinyint(1) DEFAULT '0' COMMENT '实体验证',
  `shop_xiaoxie` tinyint(1) DEFAULT '0' COMMENT '消协保证',
  `shop_huodaofk` tinyint(1) DEFAULT '0' COMMENT '货到付款',
  `shop_free_time` varchar(10) DEFAULT NULL COMMENT '商家配送时间',
  `shop_region` varchar(50) DEFAULT NULL COMMENT '店铺默认配送区域',
  `recommend_uid` int(11) NOT NULL DEFAULT '0' COMMENT '推荐招商员用户id',
  `shop_qrcode` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺公众号',
  `shop_platform_commission_rate` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '平台抽取佣金比率',
  `latitude_longitude` varchar(255) DEFAULT NULL COMMENT '线下店铺地图经纬度',
  PRIMARY KEY (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='店铺数据表';

-- ----------------------------
-- Records of tp_shop
-- ----------------------------
INSERT INTO `tp_shop` VALUES ('0', '官方直营店', '1', '87', '1', '太原牛酷科技有限公司', '4', '14', '', '', '1', '', '0', '0000-00-00 00:00:00', null, 'upload/common/1500631921.jpg', 'upload/common/1500631921.jpg', 'upload/common/1500631921.jpg', '六星开源商城', '六星开源商城', '10202706', '0731-85573019', '0731-85573019', null, '0', '0', '5', '4', '3', '1', '41', null, null, '3.00', '0.00', '0.00', null, '官方直营店', '长沙岳麓区', '0731-85573019', '', '111', '1', '1', '0', '0', '0', '0', '1', '0', null, null, '0', '', '3.00', '');
INSERT INTO `tp_shop` VALUES ('1', '海尔加盟店', '2', '63', '1', '太原海尔科技有限公司', '4', '14', '', '', '1', '', '0', '0000-00-00 00:00:00', null, 'upload/common/1500622271.jpg', 'upload/common/1500632272.jpg', 'upload/common/1500622346.jpg', '', '', '', '', '13546422890', null, '0', '0', '5', '4', '3', '1', '48', null, null, '3.00', '0.00', '0.00', null, null, '山西省太原市', null, null, null, '1', '1', '0', '0', '0', '0', '1', '0', null, null, '0', '', '5.00', null);
INSERT INTO `tp_shop` VALUES ('41', '乔丹旗舰店', '2', '290', '1', '太原乔丹技有限公司', '4', '14', '', '', '1', '', '0', '0000-00-00 00:00:00', null, 'upload/common/1500623512.jpg', 'upload/common/1500111781.jpg', 'upload/common/1500623521.jpg', '', '', '', '', '13546422890', null, '0', '0', '5', '4', '3', '1', '48', null, null, '3.00', '0.00', '0.00', null, null, '山西省太原市', null, null, null, '1', '1', '0', '0', '0', '0', '1', '0', null, null, '0', '', '4.00', null);
INSERT INTO `tp_shop` VALUES ('42', '苏泊尔家电', '1', '292', '5', '苏泊尔专卖', '19', '208', '梅江阿诗丹顿', '', '1', null, '1', '0000-00-00 00:00:00', null, 'upload/common/1500623721.jpg', 'upload/common/1500631639.jpg', 'upload/common/1500623823.jpg', '', '', '', '', '', null, '0', '0', '0', '0', '0', '0', '0', null, null, '0.00', '0.00', '0.00', null, null, null, null, null, null, '0', '0', '0', '0', '0', '0', '0', '0', null, null, '0', '', '8.00', null);

-- ----------------------------
-- Table structure for tp_shop_account
-- ----------------------------
DROP TABLE IF EXISTS `tp_shop_account`;
CREATE TABLE `tp_shop_account` (
  `shop_id` int(11) NOT NULL,
  `shop_profit` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '店铺总营业额',
  `shop_total_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '店铺入账总额',
  `shop_proceeds` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '店铺收益总额',
  `shop_platform_commission` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '平台抽取店铺利润总额',
  `shop_withdraw` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '店铺提现总额',
  `shop_point` int(11) NOT NULL DEFAULT '0' COMMENT '店铺发放的积分总额',
  `shop_point_use` int(11) NOT NULL DEFAULT '0' COMMENT '会员已使用多少积分',
  PRIMARY KEY (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=2340 COMMENT='店铺账户表';

-- ----------------------------
-- Records of tp_shop_account
-- ----------------------------
INSERT INTO `tp_shop_account` VALUES ('0', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0');
INSERT INTO `tp_shop_account` VALUES ('1', '3760.00', '3760.00', '3760.00', '188.00', '0.00', '0', '0');
INSERT INTO `tp_shop_account` VALUES ('41', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0');
INSERT INTO `tp_shop_account` VALUES ('42', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0');

-- ----------------------------
-- Table structure for tp_shop_account_money_records
-- ----------------------------
DROP TABLE IF EXISTS `tp_shop_account_money_records`;
CREATE TABLE `tp_shop_account_money_records` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `serial_no` varchar(50) NOT NULL COMMENT '流水号',
  `shop_id` int(11) NOT NULL COMMENT '店铺ID  0标识平台',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '相关金额',
  `account_type` int(11) NOT NULL DEFAULT '1' COMMENT '记录类型',
  `type_alis_id` int(11) NOT NULL COMMENT '相关ID号',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '简单描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192 COMMENT='店铺入账总额的记录表';

-- ----------------------------
-- Records of tp_shop_account_money_records
-- ----------------------------
INSERT INTO `tp_shop_account_money_records` VALUES ('1', '170721052055750', '1', '3760.00', '1', '2', '2017-07-21 17:20:55', '店铺订单支付金额3760元, 订单号为：20170721172001000000001, 支付方式【在线支付】, 已入店铺账户。');

-- ----------------------------
-- Table structure for tp_shop_account_proceeds_records
-- ----------------------------
DROP TABLE IF EXISTS `tp_shop_account_proceeds_records`;
CREATE TABLE `tp_shop_account_proceeds_records` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `serial_no` varchar(50) NOT NULL COMMENT '流水号',
  `shop_id` int(11) NOT NULL COMMENT '店铺ID  0标识平台',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '相关金额',
  `account_type` int(11) NOT NULL DEFAULT '1' COMMENT '记录类型',
  `type_alis_id` int(11) NOT NULL COMMENT '相关ID号',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '简单描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='店铺收益总额的记录表';

-- ----------------------------
-- Records of tp_shop_account_proceeds_records
-- ----------------------------
INSERT INTO `tp_shop_account_proceeds_records` VALUES ('1', '170826050346595', '1', '3760.00', '1', '2', '2017-08-26 17:03:46', '订单完成，店铺收入金额3760元,订单号为：20170721172001000000001');

-- ----------------------------
-- Table structure for tp_shop_account_profit_records
-- ----------------------------
DROP TABLE IF EXISTS `tp_shop_account_profit_records`;
CREATE TABLE `tp_shop_account_profit_records` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `serial_no` varchar(50) NOT NULL COMMENT '流水号',
  `shop_id` int(11) NOT NULL COMMENT '店铺ID  0标识平台',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '相关金额',
  `account_type` int(11) NOT NULL DEFAULT '1' COMMENT '记录类型',
  `type_alis_id` int(11) NOT NULL COMMENT '相关ID号',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '简单描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192 COMMENT='店铺营业额的记录表';

-- ----------------------------
-- Records of tp_shop_account_profit_records
-- ----------------------------
INSERT INTO `tp_shop_account_profit_records` VALUES ('1', '170721052055802', '1', '3760.00', '1', '2', '2017-07-21 17:20:55', '店铺订单支付金额3760元, 订单号为：20170721172001000000001, 支付方式【线下支付】。');

-- ----------------------------
-- Table structure for tp_shop_account_records
-- ----------------------------
DROP TABLE IF EXISTS `tp_shop_account_records`;
CREATE TABLE `tp_shop_account_records` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `serial_no` varchar(50) NOT NULL DEFAULT '' COMMENT '流水号',
  `shop_id` int(11) NOT NULL COMMENT '店铺ID  0标识平台',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '相关金额',
  `account_type` int(11) NOT NULL DEFAULT '1' COMMENT '发生方式',
  `type_alis_id` int(11) NOT NULL COMMENT '相关ID号',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '店铺的可用余额',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '简单描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=5461 COMMENT='店铺账户记录管理';

-- ----------------------------
-- Records of tp_shop_account_records
-- ----------------------------
INSERT INTO `tp_shop_account_records` VALUES ('1', '170826050346423', '1', '订单完成，资金入账', '3760.00', '1', '2', '3760.00', '2017-08-26 17:03:46', '订单完成，店铺收入金额3760元,订单号为：20170721172001000000001');
INSERT INTO `tp_shop_account_records` VALUES ('2', '170826050346628', '1', '平台抽取店铺利润。', '-188.00', '1', '2', '3572.00', '2017-08-26 17:03:46', '店铺订单完成，订单金额：3760.00元, 平台抽取188.00。');

-- ----------------------------
-- Table structure for tp_shop_account_return_records
-- ----------------------------
DROP TABLE IF EXISTS `tp_shop_account_return_records`;
CREATE TABLE `tp_shop_account_return_records` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `serial_no` varchar(50) NOT NULL COMMENT '流水号',
  `shop_id` int(11) NOT NULL COMMENT '店铺ID  0标识平台',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '相关金额',
  `account_type` int(11) NOT NULL DEFAULT '1' COMMENT '记录类型',
  `type_alis_id` int(11) NOT NULL COMMENT '相关ID号',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '简单描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='平台抽取利润的记录表';

-- ----------------------------
-- Records of tp_shop_account_return_records
-- ----------------------------
INSERT INTO `tp_shop_account_return_records` VALUES ('1', '170826050346360', '1', '188.00', '1', '2', '2017-08-26 17:03:46', '店铺订单完成，订单金额：3760.00元, 平台抽取188.00。');

-- ----------------------------
-- Table structure for tp_shop_account_withdraw_records
-- ----------------------------
DROP TABLE IF EXISTS `tp_shop_account_withdraw_records`;
CREATE TABLE `tp_shop_account_withdraw_records` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `serial_no` varchar(50) NOT NULL COMMENT '流水号',
  `shop_id` int(11) NOT NULL COMMENT '店铺ID  0标识平台',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '相关金额',
  `account_type` int(11) NOT NULL DEFAULT '1' COMMENT '记录类型',
  `type_alis_id` int(11) NOT NULL COMMENT '相关ID号',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '简单描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192 COMMENT='店铺提现的记录表';

-- ----------------------------
-- Records of tp_shop_account_withdraw_records
-- ----------------------------

-- ----------------------------
-- Table structure for tp_shop_ad
-- ----------------------------
DROP TABLE IF EXISTS `tp_shop_ad`;
CREATE TABLE `tp_shop_ad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `ad_image` varchar(255) NOT NULL DEFAULT '' COMMENT '广告图片',
  `link_url` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `type` int(1) NOT NULL DEFAULT '0' COMMENT '类型 0 -- pc端  1-- 手机端 ',
  `background` varchar(255) NOT NULL DEFAULT '#FFFFFF' COMMENT '背景色',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=5461 COMMENT='店铺广告设置';

-- ----------------------------
-- Records of tp_shop_ad
-- ----------------------------
INSERT INTO `tp_shop_ad` VALUES ('2', '0', 'upload/advertising/1500632003.jpg', '#', '1', '0', '#000000');
INSERT INTO `tp_shop_ad` VALUES ('4', '1', 'upload/advertising/1500632298.jpg', '#', '1', '0', '#000000');
INSERT INTO `tp_shop_ad` VALUES ('5', '1', 'upload/advertising/1500632315.jpg', '#', '2', '0', '#000000');
INSERT INTO `tp_shop_ad` VALUES ('6', '41', 'upload/advertising/1500632686.jpg', '#', '0', '0', '#ffffff');
INSERT INTO `tp_shop_ad` VALUES ('7', '41', 'upload/advertising/1500632698.jpg', '#', '2', '0', '#ffffff');
INSERT INTO `tp_shop_ad` VALUES ('8', '42', 'upload/advertising/1500632762.jpg', '#', '1', '0', '#000000');

-- ----------------------------
-- Table structure for tp_shop_apply
-- ----------------------------
DROP TABLE IF EXISTS `tp_shop_apply`;
CREATE TABLE `tp_shop_apply` (
  `apply_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '申请ID',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺ID申请成功之前为0',
  `apply_type` int(11) NOT NULL DEFAULT '2' COMMENT '申请类型1.个人2.公司',
  `uid` int(10) unsigned NOT NULL COMMENT '用户编号',
  `company_name` varchar(50) NOT NULL DEFAULT '' COMMENT '公司名称',
  `user_name` varchar(50) NOT NULL DEFAULT '' COMMENT '店主用户名',
  `company_province_id` mediumint(8) NOT NULL DEFAULT '0' COMMENT '所在地省ID',
  `company_city_id` mediumint(8) NOT NULL DEFAULT '0' COMMENT '所在地市ID',
  `company_district_id` mediumint(8) NOT NULL DEFAULT '0' COMMENT '所在地区ID',
  `company_address_detail` varchar(50) NOT NULL DEFAULT '' COMMENT '公司详细地址',
  `company_phone` varchar(20) NOT NULL DEFAULT '' COMMENT '公司电话',
  `company_type` varchar(255) NOT NULL DEFAULT '私企' COMMENT '私企.个体.外企.中外合资',
  `company_employee_count` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '员工总数',
  `company_registered_capital` int(10) NOT NULL DEFAULT '0' COMMENT '注册资金',
  `contacts_name` varchar(50) NOT NULL DEFAULT '' COMMENT '联系人姓名',
  `contacts_phone` varchar(20) NOT NULL DEFAULT '' COMMENT '联系人电话',
  `contacts_email` varchar(50) NOT NULL DEFAULT '' COMMENT '联系人邮箱',
  `contacts_card_no` varchar(255) NOT NULL DEFAULT '' COMMENT '申请人身份证号',
  `contacts_card_electronic_1` varchar(255) NOT NULL DEFAULT '' COMMENT '申请人手持身份证电子版',
  `contacts_card_electronic_2` varchar(255) NOT NULL DEFAULT '' COMMENT '申请人身份证正面',
  `contacts_card_electronic_3` varchar(255) NOT NULL DEFAULT '' COMMENT '申请人身份证反面',
  `business_licence_number` varchar(50) NOT NULL DEFAULT '' COMMENT '营业执照号',
  `business_sphere` varchar(1000) NOT NULL DEFAULT '' COMMENT '法定经营范围',
  `business_licence_number_electronic` varchar(50) NOT NULL DEFAULT '' COMMENT '营业执照电子版',
  `organization_code` varchar(50) NOT NULL DEFAULT '' COMMENT '组织机构代码',
  `organization_code_electronic` varchar(50) NOT NULL DEFAULT '' COMMENT '组织机构代码电子版',
  `general_taxpayer` varchar(255) NOT NULL DEFAULT '' COMMENT '一般纳税人证明',
  `bank_account_name` varchar(50) NOT NULL DEFAULT '' COMMENT '银行开户名',
  `bank_account_number` varchar(50) NOT NULL DEFAULT '' COMMENT '公司银行账号',
  `bank_name` varchar(50) NOT NULL DEFAULT '' COMMENT '开户银行支行名称',
  `bank_code` varchar(50) NOT NULL DEFAULT '' COMMENT '支行联行号',
  `bank_address` varchar(50) NOT NULL DEFAULT '' COMMENT '开户银行所在地',
  `bank_licence_electronic` varchar(50) NOT NULL DEFAULT '' COMMENT '开户银行许可证电子版',
  `is_settlement_account` tinyint(1) NOT NULL DEFAULT '1' COMMENT '开户行账号是否为结算账号 1-开户行就是结算账号 2-独立的计算账号',
  `settlement_bank_account_name` varchar(50) NOT NULL DEFAULT '' COMMENT '结算银行开户名',
  `settlement_bank_account_number` varchar(50) NOT NULL DEFAULT '' COMMENT '结算公司银行账号',
  `settlement_bank_name` varchar(50) NOT NULL DEFAULT '' COMMENT '结算开户银行支行名称',
  `settlement_bank_code` varchar(50) NOT NULL DEFAULT '' COMMENT '结算支行联行号',
  `settlement_bank_address` varchar(50) NOT NULL DEFAULT '' COMMENT '结算开户银行所在地',
  `tax_registration_certificate` varchar(50) NOT NULL DEFAULT '' COMMENT '税务登记证号',
  `tax_registration_certificate_electronic` varchar(50) NOT NULL DEFAULT '' COMMENT '税务登记证号电子版',
  `taxpayer_id` varchar(50) NOT NULL DEFAULT '' COMMENT '纳税人识别号',
  `shop_name` varchar(50) NOT NULL DEFAULT '' COMMENT '店铺名称',
  `apply_state` varchar(50) NOT NULL DEFAULT '1' COMMENT '申请状态 1-已提交申请 -1-审核失败 2-审核通过开店',
  `apply_message` varchar(200) NOT NULL DEFAULT '' COMMENT '管理员审核信息',
  `apply_year` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '开店时长(年)',
  `shop_type_name` varchar(50) NOT NULL DEFAULT '' COMMENT '店铺等级名称',
  `shop_type_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '店铺等级id',
  `shop_group_name` varchar(50) NOT NULL DEFAULT '' COMMENT '店铺类型名称',
  `shop_group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '店铺类型ID',
  `paying_money_certificate` varchar(50) NOT NULL DEFAULT '' COMMENT '付款凭证',
  `paying_money_certificate_explain` varchar(200) NOT NULL DEFAULT '' COMMENT '付款凭证说明',
  `paying_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '付款金额',
  `recommend_uid` int(11) NOT NULL DEFAULT '0' COMMENT '推荐招商员用户id',
  PRIMARY KEY (`apply_id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1365 COMMENT='店铺申请表';

-- ----------------------------
-- Records of tp_shop_apply
-- ----------------------------
INSERT INTO `tp_shop_apply` VALUES ('86', '42', '2', '292', '苏泊尔专卖', '', '19', '208', '1825', '梅江阿诗丹顿', '030000', '私营企业', '1000', '5000', '郭先生', '13000000000', '1623542@qq.com', '', '', '', '', '0000111111111111111111', '家用电器', 'upload/common/1500292183.png', '0111111', 'upload/common/1500292197.png', 'upload/common/1500292203.jpg', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '苏泊尔家电', '2', '', '1', '直营店铺', '1', '家居用品', '5', '', '', '0.00', '0');

-- ----------------------------
-- Table structure for tp_shop_bank_account
-- ----------------------------
DROP TABLE IF EXISTS `tp_shop_bank_account`;
CREATE TABLE `tp_shop_bank_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL COMMENT '店铺id',
  `bank_type` varchar(50) NOT NULL DEFAULT '1' COMMENT '账号类型 1银行卡2支付宝',
  `branch_bank_name` varchar(50) DEFAULT NULL COMMENT '支行信息',
  `realname` varchar(50) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `account_number` varchar(50) NOT NULL DEFAULT '' COMMENT '银行账号',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  `is_default` int(11) NOT NULL DEFAULT '0' COMMENT '是否默认账号',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `modify_date` datetime DEFAULT NULL COMMENT '修改日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='店铺提现账号';

-- ----------------------------
-- Records of tp_shop_bank_account
-- ----------------------------
INSERT INTO `tp_shop_bank_account` VALUES ('2', '0', '1', '中国建设银行', '王伟', '6227 0003  9542  1265 369', '138 3838 5429', '1', '2017-07-13 16:30:19', '2017-07-13 16:38:14');

-- ----------------------------
-- Table structure for tp_shop_coin_records
-- ----------------------------
DROP TABLE IF EXISTS `tp_shop_coin_records`;
CREATE TABLE `tp_shop_coin_records` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL COMMENT '店铺ID',
  `num` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '购物币数量',
  `account_type` int(11) NOT NULL DEFAULT '1' COMMENT '增加或减少类型',
  `type_alis_id` int(11) NOT NULL DEFAULT '0' COMMENT '关联ID',
  `is_display` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否显示',
  `text` varchar(255) NOT NULL DEFAULT '' COMMENT '简介',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺购物币记录';

-- ----------------------------
-- Records of tp_shop_coin_records
-- ----------------------------

-- ----------------------------
-- Table structure for tp_shop_express_address
-- ----------------------------
DROP TABLE IF EXISTS `tp_shop_express_address`;
CREATE TABLE `tp_shop_express_address` (
  `express_address_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '物流地址id',
  `shop_id` int(11) NOT NULL COMMENT '商铺id',
  `contact` varchar(100) NOT NULL DEFAULT '' COMMENT '联系人',
  `mobile` varchar(50) NOT NULL DEFAULT '' COMMENT '手机',
  `phone` varchar(50) NOT NULL DEFAULT '' COMMENT '电话',
  `company_name` varchar(100) NOT NULL DEFAULT '' COMMENT '公司名称',
  `province` smallint(6) NOT NULL DEFAULT '0' COMMENT '所在地省',
  `city` smallint(6) NOT NULL DEFAULT '0' COMMENT '所在地市',
  `district` smallint(6) NOT NULL DEFAULT '0' COMMENT '所在地区县',
  `zipcode` varchar(6) NOT NULL DEFAULT '' COMMENT '邮编',
  `address` varchar(100) NOT NULL DEFAULT '' COMMENT '详细地址',
  `is_consigner` tinyint(2) NOT NULL DEFAULT '0' COMMENT '发货地址标记',
  `is_receiver` tinyint(2) NOT NULL DEFAULT '0' COMMENT '收货地址标记',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `modify_date` datetime DEFAULT NULL COMMENT '修改日期',
  PRIMARY KEY (`express_address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1092 COMMENT='物流地址';

-- ----------------------------
-- Records of tp_shop_express_address
-- ----------------------------

-- ----------------------------
-- Table structure for tp_shop_group
-- ----------------------------
DROP TABLE IF EXISTS `tp_shop_group`;
CREATE TABLE `tp_shop_group` (
  `shop_group_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分组ID',
  `group_name` varchar(50) NOT NULL DEFAULT '' COMMENT '分组名称',
  `group_sort` int(11) NOT NULL DEFAULT '1' COMMENT '分组排序号',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `modify_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`shop_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=2730 COMMENT='店铺分组表';

-- ----------------------------
-- Records of tp_shop_group
-- ----------------------------
INSERT INTO `tp_shop_group` VALUES ('1', '珠宝/首饰', '1', '0000-00-00 00:00:00', '2017-07-13 09:46:39');
INSERT INTO `tp_shop_group` VALUES ('2', '服装鞋包', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tp_shop_group` VALUES ('3', '3C数码', '2', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tp_shop_group` VALUES ('4', '美容护理', '3', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tp_shop_group` VALUES ('5', '家居用品', '4', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tp_shop_group` VALUES ('6', '食品/保健', '5', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for tp_shop_navigation
-- ----------------------------
DROP TABLE IF EXISTS `tp_shop_navigation`;
CREATE TABLE `tp_shop_navigation` (
  `nav_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `shop_id` int(11) NOT NULL COMMENT '店铺ID',
  `nav_title` varchar(255) NOT NULL DEFAULT '' COMMENT '导航名称',
  `nav_url` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `nav_type` int(11) NOT NULL DEFAULT '0' COMMENT '导航类型  0代表 商城链接   1代表外部链接',
  `is_blank` int(11) NOT NULL DEFAULT '0' COMMENT '是否在新窗口打开  0 在当前页面打开  1在新窗口打开',
  `template_name` varchar(50) NOT NULL DEFAULT '' COMMENT '模块名称',
  `type` int(11) NOT NULL DEFAULT '3' COMMENT '纵向所在位置1.头部2.中部3底部',
  `sort` int(11) NOT NULL COMMENT '排序号',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `modify_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `align` int(11) NOT NULL DEFAULT '1' COMMENT '横向所在位置1 左  2  右',
  PRIMARY KEY (`nav_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1489 COMMENT='店铺导航管理';

-- ----------------------------
-- Records of tp_shop_navigation
-- ----------------------------
INSERT INTO `tp_shop_navigation` VALUES ('4', '0', '品牌列表', '/goods/brandlist', '0', '0', '品牌列表', '1', '3', '2017-01-18 18:18:18', '2017-06-20 09:53:53', '0');
INSERT INTO `tp_shop_navigation` VALUES ('39', '0', '首页', '/index/index', '0', '1', '首页', '1', '1', '2017-06-17 20:06:38', '2017-07-21 17:12:10', '0');
INSERT INTO `tp_shop_navigation` VALUES ('40', '0', '限时折扣', '/index/discount', '0', '0', '限时折扣', '1', '2', '2017-06-17 20:07:05', '2017-07-13 09:42:56', '0');
INSERT INTO `tp_shop_navigation` VALUES ('41', '0', '中部导航', '/index/index', '0', '0', '首页', '2', '1', '2017-06-22 08:40:20', '2017-06-29 15:59:00', '0');
INSERT INTO `tp_shop_navigation` VALUES ('45', '0', '店铺街', '/shop/shopstreet', '0', '1', '店铺街', '1', '4', '2017-07-10 15:29:02', '2017-07-10 15:29:02', '0');
INSERT INTO `tp_shop_navigation` VALUES ('46', '0', '积分中心', '/goods/integralcenter', '0', '0', '积分中心', '1', '5', '2017-07-21 17:11:52', '2017-07-21 17:12:00', '0');

-- ----------------------------
-- Table structure for tp_shop_navigation_template
-- ----------------------------
DROP TABLE IF EXISTS `tp_shop_navigation_template`;
CREATE TABLE `tp_shop_navigation_template` (
  `template_id` int(11) NOT NULL AUTO_INCREMENT,
  `template_name` varchar(50) NOT NULL DEFAULT '' COMMENT '模板名称',
  `template_url` varchar(255) NOT NULL DEFAULT '' COMMENT '访问路径',
  `is_use` int(11) NOT NULL DEFAULT '1' COMMENT '是否有效',
  `use_type` int(11) NOT NULL COMMENT '1 shop端 0wap端',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`template_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=5461 COMMENT='导航 的 系统默认模板';

-- ----------------------------
-- Records of tp_shop_navigation_template
-- ----------------------------
INSERT INTO `tp_shop_navigation_template` VALUES ('2', '首页', '/index/index', '1', '1', '2017-06-17 09:16:46');
INSERT INTO `tp_shop_navigation_template` VALUES ('5', '限时折扣', '/index/discount', '1', '1', '2017-06-17 09:17:24');
INSERT INTO `tp_shop_navigation_template` VALUES ('6', '品牌列表', '/goods/brandlist', '1', '1', '2017-06-17 16:46:40');
INSERT INTO `tp_shop_navigation_template` VALUES ('7', '店铺街', '/shop/shopstreet', '1', '1', '2017-07-04 18:05:33');
INSERT INTO `tp_shop_navigation_template` VALUES ('8', '积分中心', '/goods/integralcenter', '1', '1', '2017-07-17 15:33:49');

-- ----------------------------
-- Table structure for tp_shop_order_goods_return
-- ----------------------------
DROP TABLE IF EXISTS `tp_shop_order_goods_return`;
CREATE TABLE `tp_shop_order_goods_return` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `order_id` int(11) NOT NULL DEFAULT '0' COMMENT '订单id',
  `order_goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '订单项id',
  `goods_pay_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单项实付金额',
  `rate` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '平台抽成比率',
  `return_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '平台抽成金额',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '抽成时间',
  `remake` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192 COMMENT='订单项的利润抽成记录';

-- ----------------------------
-- Records of tp_shop_order_goods_return
-- ----------------------------
INSERT INTO `tp_shop_order_goods_return` VALUES ('1', '1', '2', '2', '3760.00', '5.00', '188.00', '2017-07-21 17:20:55', '');

-- ----------------------------
-- Table structure for tp_shop_order_return
-- ----------------------------
DROP TABLE IF EXISTS `tp_shop_order_return`;
CREATE TABLE `tp_shop_order_return` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL COMMENT '店铺ID',
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `order_no` varchar(255) NOT NULL DEFAULT '' COMMENT '订单编号',
  `order_pay_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单实际付款金额',
  `platform_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '平台获取金额',
  `is_issue` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否发放  0未发放  1 已发放',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `modify_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=655 COMMENT='店铺针对订单的金额分配';

-- ----------------------------
-- Records of tp_shop_order_return
-- ----------------------------
INSERT INTO `tp_shop_order_return` VALUES ('1', '1', '2', '20170721172001000000001', '3760.00', '188.00', '1', '2017-07-21 17:20:55', '0000-00-00 00:00:00', '');

-- ----------------------------
-- Table structure for tp_shop_weixin_share
-- ----------------------------
DROP TABLE IF EXISTS `tp_shop_weixin_share`;
CREATE TABLE `tp_shop_weixin_share` (
  `shop_id` int(11) NOT NULL,
  `goods_param_1` varchar(255) NOT NULL DEFAULT '' COMMENT '商品分享价格标示',
  `goods_param_2` varchar(255) NOT NULL DEFAULT '' COMMENT '商品分享内容',
  `shop_param_1` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺分享标题',
  `shop_param_2` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺分享主题',
  `shop_param_3` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺分享内容',
  `qrcode_param_1` varchar(255) NOT NULL DEFAULT '' COMMENT '二维码分享主题',
  `qrcode_param_2` varchar(255) NOT NULL DEFAULT '' COMMENT '二维码分享内容',
  `platform_param_1` varchar(255) NOT NULL DEFAULT '' COMMENT '平台分享标题',
  `platform_param_2` varchar(255) NOT NULL DEFAULT '' COMMENT '平台分享主题',
  `platform_param_3` varchar(255) NOT NULL DEFAULT '' COMMENT '平台分享内容',
  PRIMARY KEY (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='店铺分享内容设置';

-- ----------------------------
-- Records of tp_shop_weixin_share
-- ----------------------------
INSERT INTO `tp_shop_weixin_share` VALUES ('0', '促销价', '', '王族保罗', '王族保罗', '200', '     ', '', '欢迎打开牡丹', '分享赚佣金牡丹', '100');

-- ----------------------------
-- Table structure for tp_shop_withdraw
-- ----------------------------
DROP TABLE IF EXISTS `tp_shop_withdraw`;
CREATE TABLE `tp_shop_withdraw` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL COMMENT '店铺编号',
  `withdraw_no` varchar(255) NOT NULL DEFAULT '' COMMENT '提现流水号',
  `bank_name` varchar(50) NOT NULL COMMENT '提现银行名称',
  `account_number` varchar(50) NOT NULL COMMENT '提现银行账号',
  `realname` varchar(10) NOT NULL COMMENT '提现账户姓名',
  `mobile` varchar(20) NOT NULL COMMENT '手机',
  `cash` decimal(10,2) NOT NULL COMMENT '提现金额',
  `ask_for_date` datetime NOT NULL COMMENT '提现日期',
  `payment_date` datetime DEFAULT NULL COMMENT '到账日期',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT '当前状态 0已申请(等待处理) 1已同意 -1 已拒绝',
  `memo` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `modify_date` datetime DEFAULT NULL COMMENT '修改日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192 COMMENT='店铺提现记录表';

-- ----------------------------
-- Records of tp_shop_withdraw
-- ----------------------------
INSERT INTO `tp_shop_withdraw` VALUES ('1', '0', '170713043833126', '中国建设银行', '6227 0003  9542  1265 369', '王伟', '138 3838 5429', '0.00', '2017-07-13 16:38:33', null, '1', '', '2017-07-15 15:18:18');
INSERT INTO `tp_shop_withdraw` VALUES ('2', '0', '170713044037756', '中国建设银行', '6227 0003  9542  1265 369', '王伟', '138 3838 5429', '0.00', '2017-07-13 16:40:37', null, '0', '', '2017-07-14 12:20:04');
INSERT INTO `tp_shop_withdraw` VALUES ('3', '0', '170713044209509', '中国建设银行', '6227 0003  9542  1265 369', '王伟', '138 3838 5429', '0.00', '2017-07-13 16:42:09', null, '0', '', '2017-07-14 12:20:11');
INSERT INTO `tp_shop_withdraw` VALUES ('4', '0', '170713045059858', '中国建设银行', '6227 0003  9542  1265 369', '王伟', '138 3838 5429', '0.00', '2017-07-13 16:50:59', null, '0', '', '2017-07-14 12:20:19');
INSERT INTO `tp_shop_withdraw` VALUES ('5', '0', '170713045209356', '中国建设银行', '6227 0003  9542  1265 369', '王伟', '138 3838 5429', '0.00', '2017-07-13 16:52:09', null, '0', '', '2017-07-14 12:20:26');
INSERT INTO `tp_shop_withdraw` VALUES ('6', '0', '170713053752733', '中国建设银行', '6227 0003  9542  1265 369', '王伟', '138 3838 5429', '0.00', '2017-07-13 17:37:52', null, '0', '', null);
INSERT INTO `tp_shop_withdraw` VALUES ('7', '0', '170713055127299', '中国建设银行', '6227 0003  9542  1265 369', '王伟', '138 3838 5429', '0.00', '2017-07-13 17:51:27', null, '0', '', '2017-07-14 11:38:42');

-- ----------------------------
-- Table structure for tp_supplier
-- ----------------------------
DROP TABLE IF EXISTS `tp_supplier`;
CREATE TABLE `tp_supplier` (
  `supplier_id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `supplier_name` varchar(50) NOT NULL DEFAULT '' COMMENT '供货商名称',
  `desc` varchar(1000) NOT NULL DEFAULT '' COMMENT '供货商描述',
  `linkman_tel` varchar(255) NOT NULL DEFAULT '' COMMENT '联系人电话',
  `linkman_name` varchar(50) NOT NULL DEFAULT '' COMMENT '联系人姓名',
  `linkman_address` varchar(255) NOT NULL DEFAULT '' COMMENT '联系人地址',
  PRIMARY KEY (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='供货商表';

-- ----------------------------
-- Records of tp_supplier
-- ----------------------------

-- ----------------------------
-- Table structure for tp_user
-- ----------------------------
DROP TABLE IF EXISTS `tp_user`;
CREATE TABLE `tp_user` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` int(10) NOT NULL,
  `instance_id` int(11) NOT NULL DEFAULT '0' COMMENT '实例信息',
  `user_name` varchar(50) NOT NULL DEFAULT '' COMMENT '用户名',
  `user_password` varchar(255) NOT NULL DEFAULT '' COMMENT '用户密码（MD5）',
  `user_status` int(11) NOT NULL DEFAULT '1' COMMENT '用户状态  用户状态默认为1',
  `user_headimg` varchar(255) NOT NULL DEFAULT '' COMMENT '用户头像',
  `is_system` int(1) NOT NULL DEFAULT '0' COMMENT '是否是系统后台用户 0 不是 1 是',
  `is_member` int(11) NOT NULL DEFAULT '0' COMMENT '是否是前台会员',
  `user_tel` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  `user_tel_bind` int(1) NOT NULL DEFAULT '0' COMMENT '手机号是否绑定 0 未绑定 1 绑定 ',
  `user_qq` varchar(255) DEFAULT '' COMMENT 'qq号',
  `qq_openid` varchar(255) NOT NULL DEFAULT '' COMMENT 'qq互联id',
  `qq_info` varchar(2000) NOT NULL DEFAULT '' COMMENT 'qq账号相关信息',
  `user_email` varchar(50) NOT NULL DEFAULT '' COMMENT '邮箱',
  `user_email_bind` int(1) NOT NULL DEFAULT '0' COMMENT '是否邮箱绑定',
  `wx_openid` varchar(255) DEFAULT NULL COMMENT '微信用户openid',
  `wx_sub_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '微信用户关注时间',
  `wx_notsub_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '微信用户取消关注时间',
  `wx_is_sub` int(1) NOT NULL DEFAULT '0' COMMENT '微信用户是否关注',
  `wx_info` varchar(2000) DEFAULT NULL COMMENT '微信用户信息',
  `other_info` varchar(255) DEFAULT NULL COMMENT '附加信息',
  `reg_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '注册时间',
  `current_login_ip` varchar(255) DEFAULT NULL COMMENT '当前登录ip',
  `current_login_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '当前登录时间',
  `current_login_type` int(11) DEFAULT NULL COMMENT '当前登录的操作终端类型',
  `last_login_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '上次登录时间',
  `last_login_ip` varchar(255) DEFAULT NULL COMMENT '上次登录ip',
  `last_login_type` int(11) DEFAULT NULL COMMENT '上次登录的操作终端类型',
  `login_num` int(11) NOT NULL DEFAULT '0' COMMENT '登录次数',
  `real_name` varchar(50) DEFAULT '' COMMENT '真实姓名',
  `sex` smallint(6) DEFAULT '0' COMMENT '性别 0保密 1男 2女',
  `birthday` date DEFAULT '0000-00-00' COMMENT '生日',
  `location` varchar(255) DEFAULT '' COMMENT '所在地',
  `nick_name` varchar(50) DEFAULT '牛酷用户' COMMENT '用户昵称',
  `wx_unionid` varchar(255) NOT NULL DEFAULT '' COMMENT '微信unionid',
  `qrcode_template_id` int(11) NOT NULL DEFAULT '0' COMMENT '模板id',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=296 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=372 COMMENT='系统用户表';

-- ----------------------------
-- Records of tp_user
-- ----------------------------
INSERT INTO `tp_user` VALUES ('63', '1', '1', 'lg', 'e10adc3949ba59abbe56e057f20f883e', '1', '', '1', '1', '17635273194', '0', '', '', '', '2513189129@qq.com', '0', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0', '', '', '2017-06-13 19:56:30', '0.0.0.0', '2017-07-21 18:29:05', '1', '2017-07-21 18:17:32', '0.0.0.0', '1', '0', '', '1', '2017-07-20', '', 'lg', '', '79');
INSERT INTO `tp_user` VALUES ('290', '1', '41', 'qd', 'e10adc3949ba59abbe56e057f20f883e', '1', '', '1', '1', '', '0', '', '', '', '', '0', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0', '', '', '2017-07-12 14:52:38', '0.0.0.0', '2017-07-21 18:28:54', '1', '2017-07-21 18:19:17', '0.0.0.0', '1', '0', '', '0', '2017-07-20', '', 'qd', '', '0');
INSERT INTO `tp_user` VALUES ('292', '2', '42', 'sbr', 'e10adc3949ba59abbe56e057f20f883e', '1', '', '1', '1', '', '0', '', '', '', '', '0', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0', '', '', '2017-07-17 19:46:32', '0.0.0.0', '2017-07-21 18:25:30', '1', '2017-07-21 18:07:08', '0.0.0.0', '1', '0', '', '0', '2017-07-20', '', 'sbr', '', '0');
INSERT INTO `tp_user` VALUES ('294', '3', '0', 'asdfg', 'e10adc3949ba59abbe56e057f20f883e', '1', '', '0', '1', '', '0', '', '', '', '', '0', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0', '', '', '2017-08-31 19:36:49', '127.0.0.1', '2017-08-31 19:36:49', '1', '0000-00-00 00:00:00', '', '0', '0', '', '0', '0000-00-00', '', 'asdfg', '', '0');
INSERT INTO `tp_user` VALUES ('295', '4', '0', 'admin', '$2y$10$Df4SrNYNFKVf3kLQQ58PLueRrTcoHGeh1TkUNP8XRp9cI.ZwYICcq', '1', '', '1', '1', '111111', '0', '', '', '', '111111', '0', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0', null, '', '2018-09-28 17:08:07', '127.0.0.1', '2018-11-05 20:07:28', '1', '2018-11-05 15:32:02', '127.0.0.1', '1', '0', '', '0', '0000-00-00', '', '暂无名称', '', '0');

-- ----------------------------
-- Table structure for tp_user_group
-- ----------------------------
DROP TABLE IF EXISTS `tp_user_group`;
CREATE TABLE `tp_user_group` (
  `group_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `instance_id` int(11) NOT NULL DEFAULT '1' COMMENT '实例ID',
  `group_name` varchar(50) NOT NULL DEFAULT '' COMMENT '用户组名称',
  `group_status` int(11) NOT NULL DEFAULT '1' COMMENT '用户组状态',
  `is_system` int(1) NOT NULL DEFAULT '0' COMMENT '是否是系统用户组',
  `module_id_array` text NOT NULL COMMENT '系统模块ID组，用，隔开',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `modify_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `desc` text COMMENT '描述',
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=963 COMMENT='系统用户组表';

-- ----------------------------
-- Records of tp_user_group
-- ----------------------------
INSERT INTO `tp_user_group` VALUES ('54', '1', '管理员组3', '1', '1', '120,121,122,123,129,126,127,144,360,128,133,149,139,169,151,171,172,210,334,478,516,517,179,180,186,187,195,196,197,198,199,200,201,202,203,446,469,184,185,190,194,189,191,192,487,533,534,471,472,528,529,530,218,418,474,678,679,680,10006,409,403,405,454,457,459,462,463,460,684,726,727,729,730,732,467,515', '2017-07-13 12:02:15', '0000-00-00 00:00:00', null);
INSERT INTO `tp_user_group` VALUES ('55', '41', '管理员组2', '1', '1', '120,121,122,123,129,126,127,144,360,128,133,149,139,169,151,171,172,210,334,478,516,517,179,180,186,187,195,196,197,198,199,200,201,202,203,446,469,184,185,190,194,189,191,192,487,533,534,471,472,528,529,530,218,418,474,678,679,680,10006,409,403,405,454,457,459,462,463,460,684,726,727,729,730,732,467,515', '2017-07-14 10:07:39', '0000-00-00 00:00:00', null);
INSERT INTO `tp_user_group` VALUES ('56', '42', '管理员组1', '1', '1', '120,121,122,123,129,126,127,144,360,128,133,149,139,169,151,171,172,210,334,478,516,517,179,180,186,187,195,196,197,198,199,200,201,202,203,446,469,184,185,190,194,189,191,192,487,533,534,471,472,528,529,530,218,418,474,678,679,680,10006,409,403,405,454,457,459,462,463,460,684,726,727,729,730,732,467,515', '2017-07-17 20:02:59', '0000-00-00 00:00:00', null);
INSERT INTO `tp_user_group` VALUES ('57', '0', '管理员组', '1', '1', '120,121,122,123,126,127,128,129,133,139,144,149,150,151,169,171,172,179,180,184,185,186,187,189,190,191,192,194,195,196,197,198,199,200,201,202,203,210,218,334,360,403,405,409,418,430,445,446,447,450,451,454,457,459,460,462,463,467,469,471,472,474,478,487,506,509,515,516,517,528,529,530,532,533,534,536,537,538,539,540,541,542,543,544,545,546,547,548,549,550,551,552,553,554,555,556,557,558,559,560,561,562,563,564,565,566,567,568,569,570,571,572,575,577,580,581,582,583,584,585,586,587,588,589,590,591,592,593,594,595,596,597,598,605,606,607,608,636,637,638,639,640,641,643,644,645,647,648,649,650,651,652,653,654,655,656,657,658,659,660,661,662,663,664,665,666,671,673,674,678,679,680,681,682,683,684,687,689,690,691,695,696,697,698,699,701,702,703,705,706,707,708,709,710,711,713,714,715,717,720,723,725,726,727,729,730,732,733,734,735,737,738,739,740,741,742,743,744,745,10001,10002,10003,10004,10005,10006,10007,10008,10009,10010,10011,10012,10013,10015,10016,10017,10018,10019,10020,10021,10022,10023,10024,10025,10026', '2017-08-26 09:03:27', '0000-00-00 00:00:00', null);
INSERT INTO `tp_user_group` VALUES ('59', '1', 'ewrw', '1', '1', '126,127,144,360,128,133,149,139,169,151,171,172,210,334,478,516,517,10007,10008,10009', '2018-10-27 22:50:42', '2018-10-27 23:13:19', null);
INSERT INTO `tp_user_group` VALUES ('60', '1', 'eqweq', '1', '0', '184,185,190,194,189,533,487,534,191,192,471,472,528,529,530', '2018-10-27 22:50:58', '2018-10-27 22:50:58', null);
INSERT INTO `tp_user_group` VALUES ('61', '1', '测试', '1', '0', '126,127,360,144,128,133', '2018-10-27 22:51:19', '2018-10-27 22:51:19', null);

-- ----------------------------
-- Table structure for tp_user_log
-- ----------------------------
DROP TABLE IF EXISTS `tp_user_log`;
CREATE TABLE `tp_user_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '操作用户ID',
  `is_system` int(11) NOT NULL DEFAULT '1' COMMENT '是否是后台操作',
  `controller` varchar(255) NOT NULL DEFAULT '' COMMENT '操作控制器',
  `method` varchar(255) NOT NULL DEFAULT '' COMMENT '操作方案',
  `data` text COMMENT '传输数据',
  `ip` varchar(255) DEFAULT NULL COMMENT 'ip地址',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=82 COMMENT='用户操作日志';

-- ----------------------------
-- Records of tp_user_log
-- ----------------------------

-- ----------------------------
-- Table structure for tp_user_role
-- ----------------------------
DROP TABLE IF EXISTS `tp_user_role`;
CREATE TABLE `tp_user_role` (
  `role_id` int(11) NOT NULL DEFAULT '0' COMMENT 'user用户ID',
  `role_name` varchar(50) NOT NULL DEFAULT '' COMMENT '用户姓名',
  `group_id_array` int(11) NOT NULL DEFAULT '0' COMMENT '系统用户组',
  `is_role` int(1) NOT NULL DEFAULT '0' COMMENT '是否是系统管理员组',
  `role_status` int(11) DEFAULT '1' COMMENT '状态 默认为1',
  `desc` text COMMENT '附加信息',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=910 COMMENT='后台管理员表';

-- ----------------------------
-- Records of tp_user_role
-- ----------------------------
INSERT INTO `tp_user_role` VALUES ('1', '普通', '54', '0', '1', null);
INSERT INTO `tp_user_role` VALUES ('2', '酱油', '55', '0', '1', null);
INSERT INTO `tp_user_role` VALUES ('3', '身份一', '56', '0', '1', null);
INSERT INTO `tp_user_role` VALUES ('4', '超级管理员', '57', '1', '1', null);

-- ----------------------------
-- Table structure for tp_version_devolution
-- ----------------------------
DROP TABLE IF EXISTS `tp_version_devolution`;
CREATE TABLE `tp_version_devolution` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `devolution_username` varchar(255) NOT NULL DEFAULT '' COMMENT '授权账户',
  `devolution_password` varchar(255) NOT NULL DEFAULT '' COMMENT '授权密码',
  `create_date` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='用户授权信息';

-- ----------------------------
-- Records of tp_version_devolution
-- ----------------------------

-- ----------------------------
-- Table structure for tp_version_patch
-- ----------------------------
DROP TABLE IF EXISTS `tp_version_patch`;
CREATE TABLE `tp_version_patch` (
  `patch_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `patch_type` int(11) NOT NULL DEFAULT '1' COMMENT '补丁类型  1. B2C单用户商城 2.B2C 单用户分销商城 3 B2B2C多用户商城',
  `patch_type_name` varchar(50) NOT NULL DEFAULT '' COMMENT '补丁类型名称',
  `patch_release` varchar(50) NOT NULL DEFAULT '' COMMENT '补丁编号',
  `patch_name` varchar(255) NOT NULL DEFAULT '' COMMENT '补丁标题',
  `patch_no` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '版本号',
  `patch_file_name` varchar(50) NOT NULL DEFAULT '' COMMENT '补丁文件名称',
  `patch_log` text NOT NULL COMMENT '版本补丁更新日志',
  `patch_file_size` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '补丁文件大小',
  `is_up` int(11) NOT NULL DEFAULT '2' COMMENT '是否升级  1代表已升级  0未升级 2全部',
  `modify_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  PRIMARY KEY (`patch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192 COMMENT='版本补丁管理';

-- ----------------------------
-- Records of tp_version_patch
-- ----------------------------
INSERT INTO `tp_version_patch` VALUES ('15', '1', 'B2C单用户商城', '20170701', '1.06升级', '1.06', 'Niushop_b2c_Update_v1.06.zip', '', '40.00', '1', '2017-06-29 20:08:55');
INSERT INTO `tp_version_patch` VALUES ('16', '1', 'B2C单用户商城', '20170703', '1.07补丁', '1.07', '高位', 'dd', '30.00', '0', '2017-06-29 20:10:46');

-- ----------------------------
-- Table structure for tp_website
-- ----------------------------
DROP TABLE IF EXISTS `tp_website`;
CREATE TABLE `tp_website` (
  `website_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '网站标题',
  `logo` varchar(255) NOT NULL DEFAULT '' COMMENT '网站logo',
  `web_desc` varchar(1000) NOT NULL DEFAULT '' COMMENT '网站描述',
  `key_words` varchar(255) NOT NULL DEFAULT '' COMMENT '网站关键字',
  `web_icp` varchar(255) NOT NULL DEFAULT '' COMMENT '网站备案号',
  `style_id` int(10) NOT NULL DEFAULT '0' COMMENT '网站风格',
  `web_address` varchar(255) NOT NULL DEFAULT '' COMMENT '网站联系地址',
  `web_qrcode` varchar(255) NOT NULL DEFAULT '' COMMENT '网站公众号二维码',
  `web_url` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺网址',
  `web_email` varchar(255) NOT NULL DEFAULT '' COMMENT '网站邮箱',
  `web_phone` varchar(255) NOT NULL DEFAULT '' COMMENT '网站联系方式',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '网站创建时间',
  `modify_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '网站修改时间',
  `web_qq` varchar(255) NOT NULL DEFAULT '' COMMENT '网站qq号',
  `web_weixin` varchar(255) NOT NULL DEFAULT '' COMMENT '网站微信号',
  `web_status` int(10) NOT NULL DEFAULT '1' COMMENT '网站运营状态1.开启 2.关闭 ',
  `third_count` text NOT NULL COMMENT '第三方统计',
  `close_reason` varchar(255) NOT NULL DEFAULT '' COMMENT '站点关闭原因',
  `wap_status` int(10) NOT NULL DEFAULT '1' COMMENT '手机端运营状态 1.开启2.关闭',
  PRIMARY KEY (`website_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='网站信息表';

-- ----------------------------
-- Records of tp_website
-- ----------------------------
INSERT INTO `tp_website` VALUES ('1', '六星开源商城', 'upload/common/1497923663.jpg', '', 'keywords2', '0300259', '2', '长沙市岳麓区', 'upload/common/1500630330.jpg', 'www.sixstaredu.com', '10202706@qq.com', '0731-85573019', '2016-10-26 11:21:52', '2017-07-21 17:45:32', '10202706', 'weboperator', '1', '六星', '对不起，六星开源商城维护中，大家敬请期待...', '1');

-- ----------------------------
-- Table structure for tp_web_style
-- ----------------------------
DROP TABLE IF EXISTS `tp_web_style`;
CREATE TABLE `tp_web_style` (
  `style_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `style_name` varchar(50) NOT NULL DEFAULT '' COMMENT '样式名称',
  `style_path` varchar(255) NOT NULL DEFAULT '' COMMENT '样式路径',
  `stye_img` varchar(255) NOT NULL DEFAULT '' COMMENT '样式图片路径',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `modify_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `desc` text COMMENT '备注',
  PRIMARY KEY (`style_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='网站前台样式表';

-- ----------------------------
-- Records of tp_web_style
-- ----------------------------
INSERT INTO `tp_web_style` VALUES ('1', '热情洋溢', 'default', '', '0000-00-00 00:00:00', '2017-07-07 17:16:15', '2017/7/7 星期五 下午 5:16:19');
INSERT INTO `tp_web_style` VALUES ('2', '蓝色清爽', 'blue', '', '2017-07-07 17:16:15', '2017-07-07 17:16:19', null);

-- ----------------------------
-- Table structure for tp_weixin_auth
-- ----------------------------
DROP TABLE IF EXISTS `tp_weixin_auth`;
CREATE TABLE `tp_weixin_auth` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `instance_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `authorizer_appid` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺的appid  授权之后不用刷新',
  `authorizer_refresh_token` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺授权之后的刷新token，每月刷新',
  `authorizer_access_token` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺的公众号token，只有2小时',
  `futp_info` varchar(1000) NOT NULL DEFAULT '' COMMENT '授权项目',
  `nick_name` varchar(50) NOT NULL DEFAULT '' COMMENT '公众号昵称',
  `head_img` varchar(255) NOT NULL DEFAULT '' COMMENT '公众号头像url',
  `user_name` varchar(50) NOT NULL DEFAULT '' COMMENT '公众号原始账号',
  `alias` varchar(255) NOT NULL DEFAULT '' COMMENT '公众号原始名称',
  `qrcode_url` varchar(255) NOT NULL DEFAULT '' COMMENT '公众号二维码url',
  `auth_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '授权时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192 COMMENT='店铺(实例)微信公众账号授权';

-- ----------------------------
-- Records of tp_weixin_auth
-- ----------------------------

-- ----------------------------
-- Table structure for tp_weixin_default_replay
-- ----------------------------
DROP TABLE IF EXISTS `tp_weixin_default_replay`;
CREATE TABLE `tp_weixin_default_replay` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `instance_id` int(11) NOT NULL COMMENT '店铺id',
  `reply_media_id` int(11) NOT NULL COMMENT '回复媒体内容id',
  `sort` int(11) NOT NULL,
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modify_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='关注时回复';

-- ----------------------------
-- Records of tp_weixin_default_replay
-- ----------------------------

-- ----------------------------
-- Table structure for tp_weixin_fans
-- ----------------------------
DROP TABLE IF EXISTS `tp_weixin_fans`;
CREATE TABLE `tp_weixin_fans` (
  `fatp_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '粉丝ID',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '会员编号ID',
  `source_uid` int(11) NOT NULL DEFAULT '0' COMMENT '推广人uid',
  `instance_id` int(11) NOT NULL COMMENT '店铺ID',
  `nickname` varchar(255) NOT NULL COMMENT '昵称',
  `nickname_decode` varchar(255) DEFAULT '',
  `headimgurl` varchar(500) NOT NULL DEFAULT '' COMMENT '头像',
  `sex` smallint(6) NOT NULL DEFAULT '1' COMMENT '性别',
  `language` varchar(20) NOT NULL DEFAULT '' COMMENT '用户语言',
  `country` varchar(60) NOT NULL DEFAULT '' COMMENT '国家',
  `province` varchar(255) NOT NULL DEFAULT '' COMMENT '省',
  `city` varchar(255) NOT NULL DEFAULT '' COMMENT '城市',
  `district` varchar(255) NOT NULL DEFAULT '' COMMENT '行政区/县',
  `openid` varchar(255) NOT NULL DEFAULT '' COMMENT '用户的标识，对当前公众号唯一     用户的唯一身份ID',
  `unionid` varchar(255) NOT NULL DEFAULT '' COMMENT '粉丝unionid',
  `groupid` int(11) NOT NULL DEFAULT '0' COMMENT '粉丝所在组id',
  `is_subscribe` bigint(1) NOT NULL DEFAULT '1' COMMENT '是否订阅',
  `subscribe_date` datetime NOT NULL COMMENT '订阅时间',
  `unsubscribe_date` datetime DEFAULT NULL COMMENT '解订阅时间',
  `update_date` datetime DEFAULT NULL COMMENT '粉丝信息最后更新时间',
  `memo` varchar(255) NOT NULL COMMENT '备注',
  PRIMARY KEY (`fatp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1638 COMMENT='微信公众号获取粉丝列表';

-- ----------------------------
-- Records of tp_weixin_fans
-- ----------------------------

-- ----------------------------
-- Table structure for tp_weixin_follow_replay
-- ----------------------------
DROP TABLE IF EXISTS `tp_weixin_follow_replay`;
CREATE TABLE `tp_weixin_follow_replay` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `instance_id` int(11) NOT NULL COMMENT '店铺id',
  `reply_media_id` int(11) NOT NULL COMMENT '回复媒体内容id',
  `sort` int(11) NOT NULL,
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modify_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='关注时回复';

-- ----------------------------
-- Records of tp_weixin_follow_replay
-- ----------------------------
INSERT INTO `tp_weixin_follow_replay` VALUES ('10', '0', '50', '0', '2017-07-15 14:16:12', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for tp_weixin_functiotp_button
-- ----------------------------
DROP TABLE IF EXISTS `tp_weixin_functiotp_button`;
CREATE TABLE `tp_weixin_functiotp_button` (
  `button_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `instance_id` int(11) NOT NULL COMMENT '实例',
  `button_name` varchar(50) NOT NULL DEFAULT '' COMMENT '模块名',
  `keyname` varchar(20) NOT NULL DEFAULT '' COMMENT '触发关键词',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '触发网址',
  `hits` int(11) NOT NULL DEFAULT '0' COMMENT '触发次数',
  `is_enabled` int(1) NOT NULL DEFAULT '1' COMMENT '是否启用',
  `is_system` int(1) DEFAULT '0',
  `orders` int(11) NOT NULL DEFAULT '0' COMMENT '排序号',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `modify_time` datetime DEFAULT NULL COMMENT '修改日期',
  PRIMARY KEY (`button_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1489 COMMENT='微信功能按钮';

-- ----------------------------
-- Records of tp_weixin_functiotp_button
-- ----------------------------

-- ----------------------------
-- Table structure for tp_weixin_instance_msg
-- ----------------------------
DROP TABLE IF EXISTS `tp_weixin_instance_msg`;
CREATE TABLE `tp_weixin_instance_msg` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `instance_id` int(11) NOT NULL COMMENT '店铺id（单店版为0）',
  `template_no` varchar(55) NOT NULL COMMENT '模版编号',
  `template_id` varbinary(55) DEFAULT NULL COMMENT '微信模板消息的ID',
  `title` varchar(100) NOT NULL COMMENT '模版标题',
  `is_enable` bit(1) DEFAULT b'0' COMMENT '是否启用',
  `headtext` varchar(255) NOT NULL COMMENT '头部文字',
  `bottomtext` varchar(255) NOT NULL COMMENT '底部文字',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=4096 COMMENT='微信实例消息';

-- ----------------------------
-- Records of tp_weixin_instance_msg
-- ----------------------------
INSERT INTO `tp_weixin_instance_msg` VALUES ('1', '0', 'OPENTM207103254', '', '退款申请', '', '您已申请退款，我们将尽快处理您的退款申请。您可以在“退换货”中查看到退款申请的进度', '如您在退款中遇到问题，请联系我们的客服人员，协助您处理！');
INSERT INTO `tp_weixin_instance_msg` VALUES ('2', '0', 'OPENTM205986235', '', '退款结果通知', '', '亲，您的退款订单已被拒绝。', '如您还有疑问，请联系客服。');
INSERT INTO `tp_weixin_instance_msg` VALUES ('3', '0', 'OPENTM200444326', '', '订单付款成功通知', '', '亲，您的订单已付款成功', '感谢您的惠顾');
INSERT INTO `tp_weixin_instance_msg` VALUES ('4', '0', 'OPENTM200444240', '', '订单提交成功通知', '', '亲！您的订单已创建成功，点击进入完成付款。', '感谢亲的支持，我们将以最好的服务来回报亲。');
INSERT INTO `tp_weixin_instance_msg` VALUES ('5', '0', 'OPENTM201541214', '', '订单发货通知', '', '亲，你的宝贝已发货', '请注意查收。');

-- ----------------------------
-- Table structure for tp_weixin_key_replay
-- ----------------------------
DROP TABLE IF EXISTS `tp_weixin_key_replay`;
CREATE TABLE `tp_weixin_key_replay` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `instance_id` int(11) NOT NULL COMMENT '店铺id',
  `key` varchar(255) NOT NULL COMMENT '关键词',
  `match_type` tinyint(4) NOT NULL COMMENT '匹配类型1模糊匹配2全部匹配',
  `reply_media_id` int(11) NOT NULL COMMENT '回复媒体内容id',
  `sort` int(11) NOT NULL,
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modify_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='关键词回复';

-- ----------------------------
-- Records of tp_weixin_key_replay
-- ----------------------------
INSERT INTO `tp_weixin_key_replay` VALUES ('3', '0', '商品', '1', '28', '0', '2017-07-14 09:39:40', '0000-00-00 00:00:00');
INSERT INTO `tp_weixin_key_replay` VALUES ('4', '0', '呵呵', '1', '50', '0', '2017-07-15 11:08:44', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for tp_weixin_media
-- ----------------------------
DROP TABLE IF EXISTS `tp_weixin_media`;
CREATE TABLE `tp_weixin_media` (
  `media_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '图文消息id',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `instance_id` int(11) NOT NULL DEFAULT '0' COMMENT '实例id店铺id',
  `type` varchar(255) NOT NULL DEFAULT '1' COMMENT '类型1文本(项表无内容) 2单图文 3多图文',
  `sort` int(11) NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建日期',
  `modify_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改日期',
  PRIMARY KEY (`media_id`),
  UNIQUE KEY `id` (`media_id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1170;

-- ----------------------------
-- Records of tp_weixin_media
-- ----------------------------
INSERT INTO `tp_weixin_media` VALUES ('28', '测试测试测试测试测试测试测试测试vvvvvvv', '0', '1', '0', '2017-07-15 11:10:31', '0000-00-00 00:00:00');
INSERT INTO `tp_weixin_media` VALUES ('39', 'ns', '0', '2', '0', '2017-07-14 15:38:57', '0000-00-00 00:00:00');
INSERT INTO `tp_weixin_media` VALUES ('41', 'niushop', '0', '2', '0', '2017-07-14 15:20:50', '0000-00-00 00:00:00');
INSERT INTO `tp_weixin_media` VALUES ('49', 'niushop2', '0', '3', '0', '2017-07-14 15:33:32', '0000-00-00 00:00:00');
INSERT INTO `tp_weixin_media` VALUES ('50', '123', '0', '2', '0', '2017-07-15 11:12:52', '0000-00-00 00:00:00');
INSERT INTO `tp_weixin_media` VALUES ('53', '哦哦', '0', '3', '0', '2017-07-15 11:01:42', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for tp_weixin_media_item
-- ----------------------------
DROP TABLE IF EXISTS `tp_weixin_media_item`;
CREATE TABLE `tp_weixin_media_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `media_id` int(11) NOT NULL COMMENT '图文消息id',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `author` varchar(50) NOT NULL COMMENT '作者',
  `cover` varchar(200) NOT NULL COMMENT '图文消息封面',
  `show_cover_pic` tinyint(4) NOT NULL DEFAULT '1' COMMENT '封面图片显示在正文中',
  `summary` varchar(200) NOT NULL COMMENT '摘要',
  `content` text NOT NULL COMMENT '正文',
  `content_source_url` varchar(200) NOT NULL DEFAULT '' COMMENT '图文消息的原文地址，即点击“阅读原文”后的URL',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序号',
  `hits` int(11) NOT NULL DEFAULT '0' COMMENT '阅读次数',
  PRIMARY KEY (`id`),
  KEY `id` (`media_id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=712;

-- ----------------------------
-- Records of tp_weixin_media_item
-- ----------------------------
INSERT INTO `tp_weixin_media_item` VALUES ('48', '41', 'niushop', 'niu', 'upload/common/1500016756.jpg', '0', 'niushop123', '<p>niushop123</p>', 'www.niushop', '0', '0');
INSERT INTO `tp_weixin_media_item` VALUES ('90', '49', 'niushop2', 'niuniu', 'upload/common/1500016905.jpg', '0', 'niu1234567898', '<p>123654</p>', 'www.jingd', '0', '0');
INSERT INTO `tp_weixin_media_item` VALUES ('91', '49', 'n2', '', 'upload/common/1500017591.jpg', '0', 'gb', '<p>bg</p>', '', '0', '0');
INSERT INTO `tp_weixin_media_item` VALUES ('92', '49', 'bg', 'gb', 'upload/common/1500016918.jpg', '0', 'bg', '<p>bg</p>', '', '0', '0');
INSERT INTO `tp_weixin_media_item` VALUES ('93', '49', 'bgb', 'bgf', 'upload/common/1500016928.jpg', '0', 'bg', '<p>bg</p>', '', '0', '0');
INSERT INTO `tp_weixin_media_item` VALUES ('94', '49', 'bgf', 'bgfbgfb', 'upload/common/1500016934.jpg', '0', 'bgfewfe', '<p>ef</p>', '', '0', '0');
INSERT INTO `tp_weixin_media_item` VALUES ('95', '49', 'ef', 'ew', 'upload/common/1500016941.jpg', '0', 'fe', '<p>fe</p>', '23111', '0', '0');
INSERT INTO `tp_weixin_media_item` VALUES ('96', '49', 'ef', 'fwe', 'upload/common/1500016948.jpg', '0', 'fe', '<p>few</p>', '', '0', '0');
INSERT INTO `tp_weixin_media_item` VALUES ('97', '49', 'niusjop2', 'niuniu', 'upload/common/1500017120.jpg', '0', 'niuniu123', '<p>niu987<br/></p>', 'www.baidu', '0', '0');
INSERT INTO `tp_weixin_media_item` VALUES ('98', '39', 'ns', '', 'upload/common/1500017914.jpg', '0', 'ns123', '<p>nssb</p>', '', '0', '0');
INSERT INTO `tp_weixin_media_item` VALUES ('104', '53', '哦哦', '哦哦', 'upload/common/1500087600.png', '0', '拒绝', '<p><img src=\"/ueditor/php/upload/image/20170715/1500087610874362.png\" title=\"1500087610874362.png\" alt=\"440edaad4c2a1283edba6e15e6e8dc59_1497067960.png\"/></p>', '', '0', '0');
INSERT INTO `tp_weixin_media_item` VALUES ('105', '53', '第二篇', '第二篇', 'upload/common/1500087660.png', '0', '第二篇', '<p>第二篇</p>', '', '0', '0');
INSERT INTO `tp_weixin_media_item` VALUES ('106', '53', '第三篇', '第三篇', 'upload/common/1500087692.png', '0', '第三篇', '<p>第三篇</p>', '', '0', '0');
INSERT INTO `tp_weixin_media_item` VALUES ('107', '28', '测试测试测试测试测试测试测试测试vvvvvvv', '', '', '0', '', '', '', '0', '0');
INSERT INTO `tp_weixin_media_item` VALUES ('110', '50', '123', '2222', 'upload/common/1500088355.png', '1', '123456', '<p><em><span style=\"text-decoration: underline;\">是大富大贵复古风格</span></em></p>', '33', '0', '0');

-- ----------------------------
-- Table structure for tp_weixin_menu
-- ----------------------------
DROP TABLE IF EXISTS `tp_weixin_menu`;
CREATE TABLE `tp_weixin_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `instance_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `menu_name` varchar(50) NOT NULL DEFAULT '' COMMENT '菜单名称',
  `ico` varchar(32) NOT NULL DEFAULT '' COMMENT '菜图标单',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '父菜单',
  `menu_event_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1普通url 2 图文素材 3 功能',
  `media_id` int(11) NOT NULL DEFAULT '0' COMMENT '图文消息ID',
  `menu_event_url` varchar(255) NOT NULL DEFAULT '' COMMENT '菜单url',
  `hits` int(11) NOT NULL DEFAULT '0' COMMENT '触发数',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建日期',
  `modify_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改日期',
  PRIMARY KEY (`menu_id`),
  KEY `IDX_biz_shop_menu_orders` (`sort`),
  KEY `IDX_biz_shop_menu_shopId` (`instance_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1638 COMMENT='微设置->微店菜单';

-- ----------------------------
-- Records of tp_weixin_menu
-- ----------------------------
INSERT INTO `tp_weixin_menu` VALUES ('2', '0', '菜单名称', '', '0', '1', '0', '', '0', '1', '2017-06-19 10:55:49', '2017-06-26 17:50:30');
INSERT INTO `tp_weixin_menu` VALUES ('3', '0', '菜单名称', '', '0', '1', '0', '', '0', '3', '2017-07-04 10:31:23', '0000-00-00 00:00:00');
INSERT INTO `tp_weixin_menu` VALUES ('4', '0', '子菜单名称', '', '2', '1', '0', '', '0', '1', '2017-07-04 10:31:30', '0000-00-00 00:00:00');
INSERT INTO `tp_weixin_menu` VALUES ('5', '0', '子菜单名称', '', '2', '1', '0', '', '0', '2', '2017-07-04 10:31:33', '0000-00-00 00:00:00');
INSERT INTO `tp_weixin_menu` VALUES ('6', '0', '子菜单名称', '', '3', '2', '50', '', '0', '1', '2017-07-10 11:37:08', '0000-00-00 00:00:00');
INSERT INTO `tp_weixin_menu` VALUES ('7', '0', '菜单名称', '', '0', '1', '0', '', '0', '3', '2017-07-10 15:20:33', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for tp_weixin_msg_template
-- ----------------------------
DROP TABLE IF EXISTS `tp_weixin_msg_template`;
CREATE TABLE `tp_weixin_msg_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `template_no` varchar(55) NOT NULL COMMENT '编号',
  `title` varchar(100) NOT NULL COMMENT '标题',
  `contents` varchar(255) NOT NULL DEFAULT '' COMMENT '内容示例',
  `template_id` varchar(55) DEFAULT '' COMMENT '模版id',
  `headtext` varchar(255) DEFAULT NULL COMMENT '头部文字',
  `bottomtext` varchar(255) DEFAULT NULL COMMENT '底部文字',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信消息模版';

-- ----------------------------
-- Records of tp_weixin_msg_template
-- ----------------------------

-- ----------------------------
-- Table structure for tp_weixin_qrcode_template
-- ----------------------------
DROP TABLE IF EXISTS `tp_weixin_qrcode_template`;
CREATE TABLE `tp_weixin_qrcode_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '实例ID',
  `instance_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `background` varchar(255) NOT NULL DEFAULT '' COMMENT '背景图片',
  `nick_font_color` varchar(255) NOT NULL DEFAULT '#000' COMMENT '昵称字体颜色',
  `nick_font_size` smallint(6) NOT NULL DEFAULT '12' COMMENT '昵称字体大小',
  `is_logo_show` smallint(6) NOT NULL DEFAULT '1' COMMENT 'logo是否显示',
  `header_left` varchar(6) NOT NULL DEFAULT '0px' COMMENT '头部左边距',
  `header_top` varchar(6) NOT NULL DEFAULT '0px' COMMENT '头部上边距',
  `name_left` varchar(6) NOT NULL DEFAULT '0px' COMMENT '昵称左边距',
  `name_top` varchar(6) NOT NULL DEFAULT '0px' COMMENT '昵称上边距',
  `logo_left` varchar(6) NOT NULL DEFAULT '0px' COMMENT 'logo左边距',
  `logo_top` varchar(6) NOT NULL DEFAULT '0px' COMMENT 'logo上边距',
  `code_left` varchar(6) NOT NULL DEFAULT '0px' COMMENT '二维码左边距',
  `code_top` varchar(6) NOT NULL DEFAULT '0px' COMMENT '二维码上边距',
  `is_check` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否默认',
  `is_remove` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否删除  0未删除 1删除',
  `template_url` varchar(255) NOT NULL DEFAULT '' COMMENT '模板样式路径',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=5461 COMMENT='微信推广二维码模板管理';

-- ----------------------------
-- Records of tp_weixin_qrcode_template
-- ----------------------------
INSERT INTO `tp_weixin_qrcode_template` VALUES ('79', '0', 'upload/common/1497664191.png', '#2b2b2b', '23', '1', '108px', '356px', '150px', '511px', '51px', '434px', '90px', '86px', '0', '1', 'upload/qrcode/promote_qrcode_template/qrcode_template_79_0.png');
INSERT INTO `tp_weixin_qrcode_template` VALUES ('80', '0', '', '#2b2b2b', '23', '1', '59px', '15px', '150px', '120px', '120px', '100px', '70px', '300px', '0', '1', 'upload/qrcode/promote_qrcode_template/qrcode_template_80_0.png');
INSERT INTO `tp_weixin_qrcode_template` VALUES ('81', '0', '', '#2b2b2b', '23', '1', '59px', '15px', '150px', '120px', '120px', '100px', '70px', '300px', '0', '1', 'upload/qrcode/promote_qrcode_template/qrcode_template_81_0.png');
INSERT INTO `tp_weixin_qrcode_template` VALUES ('82', '0', '', '#2b2b2b', '23', '1', '59px', '15px', '115px', '479px', '93px', '365px', '83px', '28px', '0', '1', 'upload/qrcode/promote_qrcode_template/qrcode_template_82_0.png');
INSERT INTO `tp_weixin_qrcode_template` VALUES ('83', '0', '', '#2b2b2b', '23', '1', '51px', '471px', '138px', '475px', '87px', '362px', '81px', '44px', '0', '1', '');
INSERT INTO `tp_weixin_qrcode_template` VALUES ('84', '0', 'upload/common/1497662802.jpg', '#2b2b2b', '23', '1', '59px', '15px', '150px', '120px', '120px', '100px', '71px', '234px', '0', '1', '');
INSERT INTO `tp_weixin_qrcode_template` VALUES ('85', '0', 'upload/common/1497662859.jpg', '#2b2b2b', '23', '1', '59px', '15px', '150px', '120px', '120px', '100px', '70px', '300px', '0', '1', '');
INSERT INTO `tp_weixin_qrcode_template` VALUES ('86', '0', 'upload/common/1497664146.png', '#2b2b2b', '23', '1', '94px', '474px', '148px', '486px', '88px', '312px', '90px', '89px', '0', '1', 'upload/qrcode/promote_qrcode_template/qrcode_template_86_0.png');
INSERT INTO `tp_weixin_qrcode_template` VALUES ('87', '0', '', '#2b2b2b', '23', '1', '59px', '15px', '150px', '120px', '120px', '100px', '70px', '300px', '1', '0', 'upload/qrcode/promote_qrcode_template/qrcode_template_87_0.png');
INSERT INTO `tp_weixin_qrcode_template` VALUES ('88', '0', '', '#2b2b2b', '23', '1', '59px', '15px', '150px', '120px', '120px', '100px', '70px', '300px', '0', '0', 'upload/qrcode/promote_qrcode_template/qrcode_template_88_0.png');
INSERT INTO `tp_weixin_qrcode_template` VALUES ('89', '0', 'upload/common/1500088505.jpg', '#2b2b2b', '23', '1', '-41px', '-16px', '150px', '120px', '120px', '100px', '70px', '300px', '0', '1', 'upload/qrcode/promote_qrcode_template/qrcode_template_89_0.png');
INSERT INTO `tp_weixin_qrcode_template` VALUES ('90', '0', 'upload/common/1500089516.jpg', '#2b2b2b', '23', '1', '59px', '15px', '150px', '120px', '120px', '100px', '70px', '300px', '0', '1', 'upload/qrcode/promote_qrcode_template/qrcode_template_90_0.png');
INSERT INTO `tp_weixin_qrcode_template` VALUES ('91', '0', '', '#2b2b2b', '11', '1', '59px', '15px', '150px', '120px', '120px', '100px', '70px', '300px', '0', '1', 'upload/qrcode/promote_qrcode_template/qrcode_template_91_0.png');
INSERT INTO `tp_weixin_qrcode_template` VALUES ('92', '0', 'upload/common/1500089971.png', '#2b2b2b', '23', '1', '59px', '15px', '150px', '120px', '120px', '100px', '70px', '300px', '0', '1', 'upload/qrcode/promote_qrcode_template/qrcode_template_92_0.png');
INSERT INTO `tp_weixin_qrcode_template` VALUES ('93', '0', '', '#2b2b2b', '23', '1', '59px', '15px', '150px', '120px', '120px', '100px', '70px', '300px', '0', '1', 'upload/qrcode/promote_qrcode_template/qrcode_template_93_0.png');

-- ----------------------------
-- Table structure for tp_weixin_user_msg
-- ----------------------------
DROP TABLE IF EXISTS `tp_weixin_user_msg`;
CREATE TABLE `tp_weixin_user_msg` (
  `msg_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `msg_type` varchar(255) NOT NULL,
  `content` text,
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_replay` int(11) NOT NULL DEFAULT '0' COMMENT '是否回复',
  PRIMARY KEY (`msg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信用户消息表';

-- ----------------------------
-- Records of tp_weixin_user_msg
-- ----------------------------

-- ----------------------------
-- Table structure for tp_weixin_user_msg_replay
-- ----------------------------
DROP TABLE IF EXISTS `tp_weixin_user_msg_replay`;
CREATE TABLE `tp_weixin_user_msg_replay` (
  `replay_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `msg_id` int(11) NOT NULL,
  `replay_uid` int(11) NOT NULL COMMENT '当前客服uid',
  `replay_type` varchar(255) NOT NULL,
  `content` text,
  `replay_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`replay_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信用户消息回复表';

-- ----------------------------
-- Records of tp_weixin_user_msg_replay
-- ----------------------------

-- ----------------------------
-- Table structure for tp_wexin_onekeysubscribe
-- ----------------------------
DROP TABLE IF EXISTS `tp_wexin_onekeysubscribe`;
CREATE TABLE `tp_wexin_onekeysubscribe` (
  `instance_id` int(11) NOT NULL COMMENT '实例ID',
  `url` varchar(300) NOT NULL DEFAULT '' COMMENT '一键关注url',
  PRIMARY KEY (`instance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=2048 COMMENT='微信一键关注设置';

-- ----------------------------
-- Records of tp_wexin_onekeysubscribe
-- ----------------------------
INSERT INTO `tp_wexin_onekeysubscribe` VALUES ('0', '');
