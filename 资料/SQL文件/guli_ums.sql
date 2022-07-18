/*
Navicat MySQL Data Transfer

Source Server         : centos
Source Server Version : 50716
Source Host           : 172.16.116.100:3306
Source Database       : guli_ums

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2020-05-12 22:04:26
*/

CREATE DATABASE /*!32312 IF NOT EXISTS*/`guli_ums` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `guli_ums`;

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ums_growth_history
-- ----------------------------
DROP TABLE IF EXISTS `ums_growth_history`;
CREATE TABLE `ums_growth_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `count` int(11) DEFAULT NULL COMMENT '变动数量',
  `remark` varchar(0) DEFAULT NULL COMMENT '备注',
  `source_type` tinyint(4) DEFAULT NULL COMMENT '来源',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='成长积分记录表';

-- ----------------------------
-- Records of ums_growth_history
-- ----------------------------

-- ----------------------------
-- Table structure for ums_integration_history
-- ----------------------------
DROP TABLE IF EXISTS `ums_integration_history`;
CREATE TABLE `ums_integration_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` bigint(20) DEFAULT NULL COMMENT 'member_id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `count` int(11) DEFAULT NULL COMMENT '变动数量',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `source_type` tinyint(4) DEFAULT NULL COMMENT '来源',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='购物积分记录表';

-- ----------------------------
-- Records of ums_integration_history
-- ----------------------------

-- ----------------------------
-- Table structure for ums_user
-- ----------------------------
DROP TABLE IF EXISTS `ums_user`;
CREATE TABLE `ums_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `level_id` bigint(20) DEFAULT NULL COMMENT '��Ա�ȼ�id',
  `username` char(64) DEFAULT NULL COMMENT '用户名',
  `password` varchar(64) DEFAULT NULL COMMENT '密码',
  `salt` varchar(64) DEFAULT NULL COMMENT '盐',
  `nickname` varchar(64) DEFAULT NULL COMMENT '昵称',
  `phone` varchar(20) DEFAULT NULL COMMENT '手机号',
  `email` varchar(64) DEFAULT NULL COMMENT '邮箱',
  `header` varchar(500) DEFAULT NULL COMMENT '头像',
  `gender` tinyint(4) DEFAULT NULL COMMENT '性别',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `city` varchar(500) DEFAULT NULL COMMENT '城市',
  `job` varchar(255) DEFAULT NULL COMMENT '职业',
  `sign` varchar(255) DEFAULT NULL COMMENT '个性签名',
  `source_type` tinyint(4) DEFAULT NULL COMMENT '来源',
  `integration` int(11) DEFAULT NULL COMMENT '购物积分',
  `growth` int(11) DEFAULT NULL COMMENT '赠送积分',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态',
  `create_time` datetime DEFAULT NULL COMMENT '注册时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of ums_user
-- ----------------------------
INSERT INTO `ums_user` VALUES ('1', '1', 'liuyan', '123456', null, '柳岩', '13888888888', '88@qq.com', null, '1', '2020-04-05', '上海', '服务员', null, '1', '1000', '2000', '1', '2020-04-05 20:03:25');
INSERT INTO `ums_user` VALUES ('2', '1', 'xiaolu', 'c2be06f23d08fa4d7a5ef214887ab3c4', '74a85273dfec463386411f35647ee948', null, '18666666666', '66@qq.com', null, null, null, null, null, null, null, '2000', '2000', '1', '2020-04-05 20:24:08');

-- ----------------------------
-- Table structure for ums_user_address
-- ----------------------------
DROP TABLE IF EXISTS `ums_user_address`;
CREATE TABLE `ums_user_address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` bigint(20) DEFAULT NULL COMMENT 'member_id',
  `name` varchar(255) DEFAULT NULL COMMENT '收货人',
  `phone` varchar(64) DEFAULT NULL COMMENT '电话',
  `post_code` varchar(64) DEFAULT NULL COMMENT '右边',
  `province` varchar(100) DEFAULT NULL COMMENT '省份',
  `city` varchar(100) DEFAULT NULL COMMENT '城市',
  `region` varchar(100) DEFAULT NULL COMMENT '区',
  `address` varchar(255) DEFAULT NULL COMMENT '详细地址',
  `default_status` tinyint(1) DEFAULT NULL COMMENT '是否默认地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='收货地址表';

-- ----------------------------
-- Records of ums_user_address
-- ----------------------------
INSERT INTO `ums_user_address` VALUES ('1', '2', '柳岩', '13812345678', '200122', '上海', '上海市', '松江区', '大江商厦6层', '1');
INSERT INTO `ums_user_address` VALUES ('2', '2', '锋哥', '18612345678', '200112', '北京', '北京市', '昌平区', '宏福科技园', '0');

-- ----------------------------
-- Table structure for ums_user_collect_shop
-- ----------------------------
DROP TABLE IF EXISTS `ums_user_collect_shop`;
CREATE TABLE `ums_user_collect_shop` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `shop_id` bigint(20) DEFAULT NULL COMMENT '店铺id',
  `shop_name` varchar(50) DEFAULT NULL COMMENT '店铺名',
  `shop_logo` varchar(100) DEFAULT NULL COMMENT '店铺logo',
  `createTime` datetime DEFAULT NULL COMMENT '关注时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='关注店铺表';

-- ----------------------------
-- Records of ums_user_collect_shop
-- ----------------------------

-- ----------------------------
-- Table structure for ums_user_collect_sku
-- ----------------------------
DROP TABLE IF EXISTS `ums_user_collect_sku`;
CREATE TABLE `ums_user_collect_sku` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `sku_id` bigint(20) DEFAULT NULL COMMENT 'sku_id',
  `sku_title` varchar(500) DEFAULT NULL COMMENT 'sku标题',
  `sku_image` varchar(500) DEFAULT NULL COMMENT 'sku默认图片',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='关注商品表';

-- ----------------------------
-- Records of ums_user_collect_sku
-- ----------------------------

-- ----------------------------
-- Table structure for ums_user_collect_subject
-- ----------------------------
DROP TABLE IF EXISTS `ums_user_collect_subject`;
CREATE TABLE `ums_user_collect_subject` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `subject_id` bigint(20) DEFAULT NULL COMMENT '活动id',
  `subject_name` varchar(255) DEFAULT NULL COMMENT '活动名称',
  `subject_image` varchar(500) DEFAULT NULL COMMENT '活动默认图片',
  `subject_url` varchar(500) DEFAULT NULL COMMENT '活动链接',
  `create_time` datetime DEFAULT NULL COMMENT '关注时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='关注活动表';

-- ----------------------------
-- Records of ums_user_collect_subject
-- ----------------------------

-- ----------------------------
-- Table structure for ums_user_level
-- ----------------------------
DROP TABLE IF EXISTS `ums_user_level`;
CREATE TABLE `ums_user_level` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(100) DEFAULT NULL COMMENT '等级名称',
  `growth_point` int(11) DEFAULT NULL COMMENT '等级需要的成长值',
  `default_status` tinyint(4) DEFAULT NULL COMMENT '默认等级',
  `free_freight_point` decimal(18,4) DEFAULT NULL COMMENT '免运费标准',
  `comment_growth_point` int(11) DEFAULT NULL COMMENT '每次评价获取的成长值',
  `priviledge_free_freight` tinyint(4) DEFAULT NULL COMMENT '是否有免邮特权',
  `priviledge_member_price` tinyint(4) DEFAULT NULL COMMENT '是否有会员价格特权',
  `priviledge_birthday` tinyint(4) DEFAULT NULL COMMENT '是否有生日特权',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员等级表';

-- ----------------------------
-- Records of ums_user_level
-- ----------------------------

-- ----------------------------
-- Table structure for ums_user_login_log
-- ----------------------------
DROP TABLE IF EXISTS `ums_user_login_log`;
CREATE TABLE `ums_user_login_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `create_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `ip` varchar(64) DEFAULT NULL COMMENT '登录ip',
  `city` varchar(64) DEFAULT NULL COMMENT '登录城市',
  `type` tinyint(1) DEFAULT NULL COMMENT '登录类型【0-web，1-移动】',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户登陆记录表';

-- ----------------------------
-- Records of ums_user_login_log
-- ----------------------------

-- ----------------------------
-- Table structure for ums_user_statistics
-- ----------------------------
DROP TABLE IF EXISTS `ums_user_statistics`;
CREATE TABLE `ums_user_statistics` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `consume_amount` decimal(18,4) DEFAULT NULL COMMENT '累计消费金额',
  `coupon_amount` decimal(18,4) DEFAULT NULL COMMENT '累计优惠金额',
  `order_count` int(11) DEFAULT NULL COMMENT '订单数量',
  `coupon_count` int(11) DEFAULT NULL COMMENT '优惠券数量',
  `comment_count` int(11) DEFAULT NULL COMMENT '评价数',
  `return_order_count` int(11) DEFAULT NULL COMMENT '退货数量',
  `login_count` int(11) DEFAULT NULL COMMENT '登录次数',
  `attend_count` int(11) DEFAULT NULL COMMENT '关注数量',
  `fans_count` int(11) DEFAULT NULL COMMENT '粉丝数量',
  `collect_product_count` int(11) DEFAULT NULL COMMENT '收藏的商品数量',
  `collect_subject_count` int(11) DEFAULT NULL COMMENT '收藏的专题活动数量',
  `collect_comment_count` int(11) DEFAULT NULL COMMENT '收藏的评论数量',
  `invite_friend_count` int(11) DEFAULT NULL COMMENT '邀请的朋友数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='统计信息表';

-- ----------------------------
-- Records of ums_user_statistics
-- ----------------------------
