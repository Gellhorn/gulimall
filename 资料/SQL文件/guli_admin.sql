/*
Navicat MySQL Data Transfer

Source Server         : centos
Source Server Version : 50716
Source Host           : 172.16.116.100:3306
Source Database       : guli_admin

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2020-03-18 19:23:51
*/

CREATE DATABASE /*!32312 IF NOT EXISTS*/`guli_admin` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `guli_admin`;

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('guliScheduler', 'TASK_1', 'DEFAULT', '0 0/30 * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', '0 0/30 * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('guliScheduler', 'TASK_1', 'DEFAULT', null, 'com.atguigu.modules.job.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B455973720030636F6D2E617467756967752E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200074C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000016B9719ADF87874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000174000672656E72656E74000CE58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);
INSERT INTO `qrtz_job_details` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', null, 'com.atguigu.modules.job.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B455973720030636F6D2E617467756967752E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200074C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000016B9719ADF87874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000174000672656E72656E74000CE58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('guliScheduler', 'DESKTOP-G0LDITS1564022533118', '1564130467969', '15000');
INSERT INTO `qrtz_scheduler_state` VALUES ('RenrenScheduler', 'DESKTOP-G0LDITS1562576376372', '1562592385551', '15000');

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('guliScheduler', 'TASK_1', 'DEFAULT', 'TASK_1', 'DEFAULT', null, '1564131600000', '1564129800000', '5', 'WAITING', 'CRON', '1562592416000', '0', null, '2', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B455973720030636F6D2E617467756967752E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200074C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000016B9719ADF87874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000174000672656E72656E74000CE58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);
INSERT INTO `qrtz_triggers` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', 'TASK_1', 'DEFAULT', null, '1562592600000', '1562590800000', '5', 'WAITING', 'CRON', '1562214590000', '0', null, '2', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B455973720030636F6D2E617467756967752E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200074C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000016B9719ADF87874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000174000672656E72656E74000CE58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);

-- ----------------------------
-- Table structure for schedule_job
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job`;
CREATE TABLE `schedule_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint(4) DEFAULT NULL COMMENT '任务状态  0：正常  1：暂停',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='定时任务';

-- ----------------------------
-- Records of schedule_job
-- ----------------------------
INSERT INTO `schedule_job` VALUES ('1', 'testTask', 'renren', '0 0/30 * * * ?', '0', '参数测试', '2019-06-27 12:02:51');

-- ----------------------------
-- Table structure for schedule_job_log
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job_log`;
CREATE TABLE `schedule_job_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `job_id` bigint(20) NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `status` tinyint(4) NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `error` varchar(2000) DEFAULT NULL COMMENT '失败信息',
  `times` int(11) NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=546 DEFAULT CHARSET=utf8 COMMENT='定时任务日志';

-- ----------------------------
-- Records of schedule_job_log
-- ----------------------------
INSERT INTO `schedule_job_log` VALUES ('1', '1', 'testTask', 'renren', '0', null, '0', '2019-07-04 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('2', '1', 'testTask', 'renren', '0', null, '1', '2019-07-08 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('3', '1', 'testTask', 'renren', '0', null, '1', '2019-07-08 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('4', '1', 'testTask', 'renren', '0', null, '1', '2019-07-08 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('5', '1', 'testTask', 'renren', '0', null, '1', '2019-07-08 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('6', '1', 'testTask', 'renren', '0', null, '0', '2019-07-08 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('7', '1', 'testTask', 'renren', '0', null, '1', '2019-07-08 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('8', '1', 'testTask', 'renren', '0', null, '0', '2019-07-08 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('9', '1', 'testTask', 'renren', '0', null, '0', '2019-07-08 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('10', '1', 'testTask', 'renren', '0', null, '1', '2019-07-08 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('11', '1', 'testTask', 'renren', '0', null, '1', '2019-07-08 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('12', '1', 'testTask', 'renren', '0', null, '1', '2019-07-08 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('13', '1', 'testTask', 'renren', '0', null, '1', '2019-07-08 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('14', '1', 'testTask', 'renren', '0', null, '1', '2019-07-08 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('15', '1', 'testTask', 'renren', '0', null, '22', '2019-07-09 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('16', '1', 'testTask', 'renren', '0', null, '0', '2019-07-11 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('17', '1', 'testTask', 'renren', '0', null, '1', '2019-07-11 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('18', '1', 'testTask', 'renren', '0', null, '0', '2019-07-11 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('19', '1', 'testTask', 'renren', '0', null, '0', '2019-07-11 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('20', '1', 'testTask', 'renren', '0', null, '1', '2019-07-11 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('21', '1', 'testTask', 'renren', '0', null, '6', '2019-07-12 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('22', '1', 'testTask', 'renren', '0', null, '1', '2019-07-12 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('23', '1', 'testTask', 'renren', '0', null, '1', '2019-07-12 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('24', '1', 'testTask', 'renren', '0', null, '0', '2019-07-12 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('25', '1', 'testTask', 'renren', '0', null, '1', '2019-07-12 02:00:00');
INSERT INTO `schedule_job_log` VALUES ('26', '1', 'testTask', 'renren', '0', null, '0', '2019-07-12 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('27', '1', 'testTask', 'renren', '0', null, '0', '2019-07-12 03:00:00');
INSERT INTO `schedule_job_log` VALUES ('28', '1', 'testTask', 'renren', '0', null, '1', '2019-07-12 03:30:00');
INSERT INTO `schedule_job_log` VALUES ('29', '1', 'testTask', 'renren', '0', null, '0', '2019-07-12 04:00:00');
INSERT INTO `schedule_job_log` VALUES ('30', '1', 'testTask', 'renren', '0', null, '1', '2019-07-12 04:30:00');
INSERT INTO `schedule_job_log` VALUES ('31', '1', 'testTask', 'renren', '0', null, '1', '2019-07-12 05:00:00');
INSERT INTO `schedule_job_log` VALUES ('32', '1', 'testTask', 'renren', '0', null, '1', '2019-07-12 05:30:00');
INSERT INTO `schedule_job_log` VALUES ('33', '1', 'testTask', 'renren', '0', null, '1', '2019-07-12 06:00:00');
INSERT INTO `schedule_job_log` VALUES ('34', '1', 'testTask', 'renren', '0', null, '0', '2019-07-12 06:30:00');
INSERT INTO `schedule_job_log` VALUES ('35', '1', 'testTask', 'renren', '0', null, '1', '2019-07-12 07:00:00');
INSERT INTO `schedule_job_log` VALUES ('36', '1', 'testTask', 'renren', '0', null, '1', '2019-07-12 07:30:00');
INSERT INTO `schedule_job_log` VALUES ('37', '1', 'testTask', 'renren', '0', null, '1', '2019-07-12 08:00:00');
INSERT INTO `schedule_job_log` VALUES ('38', '1', 'testTask', 'renren', '0', null, '1', '2019-07-12 08:30:00');
INSERT INTO `schedule_job_log` VALUES ('39', '1', 'testTask', 'renren', '0', null, '0', '2019-07-12 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('40', '1', 'testTask', 'renren', '0', null, '1', '2019-07-12 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('41', '1', 'testTask', 'renren', '0', null, '0', '2019-07-12 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('42', '1', 'testTask', 'renren', '0', null, '8', '2019-07-12 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('43', '1', 'testTask', 'renren', '0', null, '2', '2019-07-12 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('44', '1', 'testTask', 'renren', '0', null, '1', '2019-07-12 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('45', '1', 'testTask', 'renren', '0', null, '4', '2019-07-12 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('46', '1', 'testTask', 'renren', '0', null, '1', '2019-07-12 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('47', '1', 'testTask', 'renren', '0', null, '2', '2019-07-12 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('48', '1', 'testTask', 'renren', '0', null, '1', '2019-07-13 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('49', '1', 'testTask', 'renren', '0', null, '1', '2019-07-13 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('50', '1', 'testTask', 'renren', '0', null, '2', '2019-07-13 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('51', '1', 'testTask', 'renren', '0', null, '1', '2019-07-13 02:00:00');
INSERT INTO `schedule_job_log` VALUES ('52', '1', 'testTask', 'renren', '0', null, '1', '2019-07-13 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('53', '1', 'testTask', 'renren', '0', null, '1', '2019-07-15 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('54', '1', 'testTask', 'renren', '0', null, '1', '2019-07-15 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('55', '1', 'testTask', 'renren', '0', null, '0', '2019-07-15 02:00:00');
INSERT INTO `schedule_job_log` VALUES ('56', '1', 'testTask', 'renren', '0', null, '1', '2019-07-15 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('57', '1', 'testTask', 'renren', '0', null, '1', '2019-07-15 03:00:00');
INSERT INTO `schedule_job_log` VALUES ('58', '1', 'testTask', 'renren', '0', null, '1', '2019-07-15 03:30:00');
INSERT INTO `schedule_job_log` VALUES ('59', '1', 'testTask', 'renren', '0', null, '1', '2019-07-15 04:00:00');
INSERT INTO `schedule_job_log` VALUES ('60', '1', 'testTask', 'renren', '0', null, '0', '2019-07-15 04:30:00');
INSERT INTO `schedule_job_log` VALUES ('61', '1', 'testTask', 'renren', '0', null, '1', '2019-07-15 05:00:00');
INSERT INTO `schedule_job_log` VALUES ('62', '1', 'testTask', 'renren', '0', null, '1', '2019-07-15 05:30:00');
INSERT INTO `schedule_job_log` VALUES ('63', '1', 'testTask', 'renren', '0', null, '0', '2019-07-15 06:00:00');
INSERT INTO `schedule_job_log` VALUES ('64', '1', 'testTask', 'renren', '0', null, '1', '2019-07-15 06:30:00');
INSERT INTO `schedule_job_log` VALUES ('65', '1', 'testTask', 'renren', '0', null, '1', '2019-07-15 07:00:00');
INSERT INTO `schedule_job_log` VALUES ('66', '1', 'testTask', 'renren', '0', null, '0', '2019-07-15 07:30:00');
INSERT INTO `schedule_job_log` VALUES ('67', '1', 'testTask', 'renren', '0', null, '1', '2019-07-15 08:00:00');
INSERT INTO `schedule_job_log` VALUES ('68', '1', 'testTask', 'renren', '0', null, '1', '2019-07-15 08:30:00');
INSERT INTO `schedule_job_log` VALUES ('69', '1', 'testTask', 'renren', '0', null, '15', '2019-07-15 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('70', '1', 'testTask', 'renren', '0', null, '4', '2019-07-15 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('71', '1', 'testTask', 'renren', '0', null, '3', '2019-07-15 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('72', '1', 'testTask', 'renren', '0', null, '2', '2019-07-15 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('73', '1', 'testTask', 'renren', '0', null, '3', '2019-07-15 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('74', '1', 'testTask', 'renren', '0', null, '2', '2019-07-15 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('75', '1', 'testTask', 'renren', '0', null, '3', '2019-07-15 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('76', '1', 'testTask', 'renren', '0', null, '5', '2019-07-15 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('77', '1', 'testTask', 'renren', '0', null, '2', '2019-07-15 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('78', '1', 'testTask', 'renren', '0', null, '2', '2019-07-15 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('79', '1', 'testTask', 'renren', '0', null, '2', '2019-07-15 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('80', '1', 'testTask', 'renren', '0', null, '1', '2019-07-15 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('81', '1', 'testTask', 'renren', '0', null, '0', '2019-07-15 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('82', '1', 'testTask', 'renren', '0', null, '1', '2019-07-15 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('83', '1', 'testTask', 'renren', '0', null, '2', '2019-07-15 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('84', '1', 'testTask', 'renren', '0', null, '1', '2019-07-15 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('85', '1', 'testTask', 'renren', '0', null, '1', '2019-07-15 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('86', '1', 'testTask', 'renren', '0', null, '1', '2019-07-15 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('87', '1', 'testTask', 'renren', '0', null, '0', '2019-07-15 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('88', '1', 'testTask', 'renren', '0', null, '1', '2019-07-15 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('89', '1', 'testTask', 'renren', '0', null, '1', '2019-07-15 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('90', '1', 'testTask', 'renren', '0', null, '1', '2019-07-15 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('91', '1', 'testTask', 'renren', '0', null, '2', '2019-07-15 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('92', '1', 'testTask', 'renren', '0', null, '1', '2019-07-15 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('93', '1', 'testTask', 'renren', '0', null, '1', '2019-07-15 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('94', '1', 'testTask', 'renren', '0', null, '1', '2019-07-15 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('95', '1', 'testTask', 'renren', '0', null, '1', '2019-07-15 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('96', '1', 'testTask', 'renren', '0', null, '0', '2019-07-15 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('97', '1', 'testTask', 'renren', '0', null, '1', '2019-07-15 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('98', '1', 'testTask', 'renren', '0', null, '1', '2019-07-15 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('99', '1', 'testTask', 'renren', '0', null, '1', '2019-07-16 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('100', '1', 'testTask', 'renren', '0', null, '4', '2019-07-17 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('101', '1', 'testTask', 'renren', '0', null, '0', '2019-07-17 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('102', '1', 'testTask', 'renren', '0', null, '1', '2019-07-17 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('103', '1', 'testTask', 'renren', '0', null, '1', '2019-07-17 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('104', '1', 'testTask', 'renren', '0', null, '1', '2019-07-17 02:00:00');
INSERT INTO `schedule_job_log` VALUES ('105', '1', 'testTask', 'renren', '0', null, '1', '2019-07-17 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('106', '1', 'testTask', 'renren', '0', null, '1', '2019-07-17 03:00:00');
INSERT INTO `schedule_job_log` VALUES ('107', '1', 'testTask', 'renren', '0', null, '1', '2019-07-17 03:30:00');
INSERT INTO `schedule_job_log` VALUES ('108', '1', 'testTask', 'renren', '0', null, '0', '2019-07-17 04:00:00');
INSERT INTO `schedule_job_log` VALUES ('109', '1', 'testTask', 'renren', '0', null, '1', '2019-07-17 04:30:00');
INSERT INTO `schedule_job_log` VALUES ('110', '1', 'testTask', 'renren', '0', null, '1', '2019-07-17 05:00:00');
INSERT INTO `schedule_job_log` VALUES ('111', '1', 'testTask', 'renren', '0', null, '1', '2019-07-17 05:30:00');
INSERT INTO `schedule_job_log` VALUES ('112', '1', 'testTask', 'renren', '0', null, '1', '2019-07-17 06:00:00');
INSERT INTO `schedule_job_log` VALUES ('113', '1', 'testTask', 'renren', '0', null, '1', '2019-07-17 06:30:00');
INSERT INTO `schedule_job_log` VALUES ('114', '1', 'testTask', 'renren', '0', null, '1', '2019-07-17 07:00:00');
INSERT INTO `schedule_job_log` VALUES ('115', '1', 'testTask', 'renren', '0', null, '1', '2019-07-17 07:30:00');
INSERT INTO `schedule_job_log` VALUES ('116', '1', 'testTask', 'renren', '0', null, '1', '2019-07-17 08:00:00');
INSERT INTO `schedule_job_log` VALUES ('117', '1', 'testTask', 'renren', '0', null, '0', '2019-07-17 08:30:00');
INSERT INTO `schedule_job_log` VALUES ('118', '1', 'testTask', 'renren', '0', null, '1', '2019-07-17 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('119', '1', 'testTask', 'renren', '0', null, '1', '2019-07-17 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('120', '1', 'testTask', 'renren', '0', null, '1', '2019-07-17 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('121', '1', 'testTask', 'renren', '0', null, '1', '2019-07-17 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('122', '1', 'testTask', 'renren', '0', null, '1', '2019-07-17 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('123', '1', 'testTask', 'renren', '0', null, '0', '2019-07-17 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('124', '1', 'testTask', 'renren', '0', null, '1', '2019-07-17 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('125', '1', 'testTask', 'renren', '0', null, '1', '2019-07-17 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('126', '1', 'testTask', 'renren', '0', null, '1', '2019-07-17 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('127', '1', 'testTask', 'renren', '0', null, '1', '2019-07-17 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('128', '1', 'testTask', 'renren', '0', null, '0', '2019-07-17 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('129', '1', 'testTask', 'renren', '0', null, '1', '2019-07-17 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('130', '1', 'testTask', 'renren', '0', null, '1', '2019-07-17 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('131', '1', 'testTask', 'renren', '0', null, '0', '2019-07-17 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('132', '1', 'testTask', 'renren', '0', null, '1', '2019-07-17 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('133', '1', 'testTask', 'renren', '0', null, '0', '2019-07-17 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('134', '1', 'testTask', 'renren', '0', null, '1', '2019-07-17 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('135', '1', 'testTask', 'renren', '0', null, '0', '2019-07-17 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('136', '1', 'testTask', 'renren', '0', null, '1', '2019-07-17 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('137', '1', 'testTask', 'renren', '0', null, '1', '2019-07-17 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('138', '1', 'testTask', 'renren', '0', null, '1', '2019-07-17 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('139', '1', 'testTask', 'renren', '0', null, '0', '2019-07-17 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('140', '1', 'testTask', 'renren', '0', null, '0', '2019-07-17 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('141', '1', 'testTask', 'renren', '0', null, '0', '2019-07-17 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('142', '1', 'testTask', 'renren', '0', null, '1', '2019-07-17 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('143', '1', 'testTask', 'renren', '0', null, '1', '2019-07-17 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('144', '1', 'testTask', 'renren', '0', null, '0', '2019-07-17 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('145', '1', 'testTask', 'renren', '0', null, '1', '2019-07-17 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('146', '1', 'testTask', 'renren', '0', null, '0', '2019-07-17 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('147', '1', 'testTask', 'renren', '0', null, '0', '2019-07-17 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('148', '1', 'testTask', 'renren', '0', null, '12', '2019-07-18 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('149', '1', 'testTask', 'renren', '0', null, '0', '2019-07-18 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('150', '1', 'testTask', 'renren', '0', null, '1', '2019-07-18 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('151', '1', 'testTask', 'renren', '0', null, '0', '2019-07-18 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('152', '1', 'testTask', 'renren', '0', null, '1', '2019-07-18 02:00:00');
INSERT INTO `schedule_job_log` VALUES ('153', '1', 'testTask', 'renren', '0', null, '0', '2019-07-18 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('154', '1', 'testTask', 'renren', '0', null, '0', '2019-07-18 03:00:00');
INSERT INTO `schedule_job_log` VALUES ('155', '1', 'testTask', 'renren', '0', null, '0', '2019-07-18 03:30:00');
INSERT INTO `schedule_job_log` VALUES ('156', '1', 'testTask', 'renren', '0', null, '1', '2019-07-18 04:00:00');
INSERT INTO `schedule_job_log` VALUES ('157', '1', 'testTask', 'renren', '0', null, '1', '2019-07-18 04:30:00');
INSERT INTO `schedule_job_log` VALUES ('158', '1', 'testTask', 'renren', '0', null, '0', '2019-07-18 05:00:00');
INSERT INTO `schedule_job_log` VALUES ('159', '1', 'testTask', 'renren', '0', null, '0', '2019-07-18 05:30:00');
INSERT INTO `schedule_job_log` VALUES ('160', '1', 'testTask', 'renren', '0', null, '1', '2019-07-18 06:00:00');
INSERT INTO `schedule_job_log` VALUES ('161', '1', 'testTask', 'renren', '0', null, '1', '2019-07-18 06:30:00');
INSERT INTO `schedule_job_log` VALUES ('162', '1', 'testTask', 'renren', '0', null, '1', '2019-07-18 07:00:00');
INSERT INTO `schedule_job_log` VALUES ('163', '1', 'testTask', 'renren', '0', null, '1', '2019-07-18 07:30:00');
INSERT INTO `schedule_job_log` VALUES ('164', '1', 'testTask', 'renren', '0', null, '0', '2019-07-18 08:00:00');
INSERT INTO `schedule_job_log` VALUES ('165', '1', 'testTask', 'renren', '0', null, '0', '2019-07-18 08:30:00');
INSERT INTO `schedule_job_log` VALUES ('166', '1', 'testTask', 'renren', '0', null, '0', '2019-07-18 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('167', '1', 'testTask', 'renren', '0', null, '1', '2019-07-18 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('168', '1', 'testTask', 'renren', '0', null, '0', '2019-07-18 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('169', '1', 'testTask', 'renren', '0', null, '0', '2019-07-18 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('170', '1', 'testTask', 'renren', '0', null, '0', '2019-07-18 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('171', '1', 'testTask', 'renren', '0', null, '1', '2019-07-18 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('172', '1', 'testTask', 'renren', '0', null, '0', '2019-07-18 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('173', '1', 'testTask', 'renren', '0', null, '1', '2019-07-18 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('174', '1', 'testTask', 'renren', '0', null, '1', '2019-07-18 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('175', '1', 'testTask', 'renren', '0', null, '0', '2019-07-18 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('176', '1', 'testTask', 'renren', '0', null, '0', '2019-07-18 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('177', '1', 'testTask', 'renren', '0', null, '0', '2019-07-18 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('178', '1', 'testTask', 'renren', '0', null, '1', '2019-07-18 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('179', '1', 'testTask', 'renren', '0', null, '0', '2019-07-18 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('180', '1', 'testTask', 'renren', '0', null, '0', '2019-07-18 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('181', '1', 'testTask', 'renren', '0', null, '0', '2019-07-18 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('182', '1', 'testTask', 'renren', '0', null, '0', '2019-07-18 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('183', '1', 'testTask', 'renren', '0', null, '1', '2019-07-18 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('184', '1', 'testTask', 'renren', '0', null, '1', '2019-07-18 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('185', '1', 'testTask', 'renren', '0', null, '1', '2019-07-18 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('186', '1', 'testTask', 'renren', '0', null, '1', '2019-07-18 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('187', '1', 'testTask', 'renren', '0', null, '1', '2019-07-18 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('188', '1', 'testTask', 'renren', '0', null, '0', '2019-07-18 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('189', '1', 'testTask', 'renren', '0', null, '1', '2019-07-18 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('190', '1', 'testTask', 'renren', '0', null, '0', '2019-07-18 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('191', '1', 'testTask', 'renren', '0', null, '0', '2019-07-18 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('192', '1', 'testTask', 'renren', '0', null, '0', '2019-07-18 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('193', '1', 'testTask', 'renren', '0', null, '0', '2019-07-18 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('194', '1', 'testTask', 'renren', '0', null, '0', '2019-07-18 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('195', '1', 'testTask', 'renren', '0', null, '0', '2019-07-18 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('196', '1', 'testTask', 'renren', '0', null, '4', '2019-07-19 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('197', '1', 'testTask', 'renren', '0', null, '1', '2019-07-19 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('198', '1', 'testTask', 'renren', '0', null, '1', '2019-07-19 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('199', '1', 'testTask', 'renren', '0', null, '1', '2019-07-19 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('200', '1', 'testTask', 'renren', '0', null, '1', '2019-07-19 02:00:00');
INSERT INTO `schedule_job_log` VALUES ('201', '1', 'testTask', 'renren', '0', null, '1', '2019-07-19 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('202', '1', 'testTask', 'renren', '0', null, '1', '2019-07-19 03:00:00');
INSERT INTO `schedule_job_log` VALUES ('203', '1', 'testTask', 'renren', '0', null, '1', '2019-07-19 03:30:00');
INSERT INTO `schedule_job_log` VALUES ('204', '1', 'testTask', 'renren', '0', null, '1', '2019-07-19 04:00:00');
INSERT INTO `schedule_job_log` VALUES ('205', '1', 'testTask', 'renren', '0', null, '0', '2019-07-19 04:30:00');
INSERT INTO `schedule_job_log` VALUES ('206', '1', 'testTask', 'renren', '0', null, '1', '2019-07-19 05:00:00');
INSERT INTO `schedule_job_log` VALUES ('207', '1', 'testTask', 'renren', '0', null, '0', '2019-07-19 05:30:00');
INSERT INTO `schedule_job_log` VALUES ('208', '1', 'testTask', 'renren', '0', null, '1', '2019-07-19 06:00:00');
INSERT INTO `schedule_job_log` VALUES ('209', '1', 'testTask', 'renren', '0', null, '0', '2019-07-19 06:30:00');
INSERT INTO `schedule_job_log` VALUES ('210', '1', 'testTask', 'renren', '0', null, '0', '2019-07-19 07:00:00');
INSERT INTO `schedule_job_log` VALUES ('211', '1', 'testTask', 'renren', '0', null, '1', '2019-07-19 07:30:00');
INSERT INTO `schedule_job_log` VALUES ('212', '1', 'testTask', 'renren', '0', null, '0', '2019-07-19 08:00:00');
INSERT INTO `schedule_job_log` VALUES ('213', '1', 'testTask', 'renren', '0', null, '1', '2019-07-19 08:30:00');
INSERT INTO `schedule_job_log` VALUES ('214', '1', 'testTask', 'renren', '0', null, '1', '2019-07-19 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('215', '1', 'testTask', 'renren', '0', null, '1', '2019-07-19 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('216', '1', 'testTask', 'renren', '0', null, '1', '2019-07-19 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('217', '1', 'testTask', 'renren', '0', null, '1', '2019-07-19 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('218', '1', 'testTask', 'renren', '0', null, '1', '2019-07-19 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('219', '1', 'testTask', 'renren', '0', null, '1', '2019-07-19 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('220', '1', 'testTask', 'renren', '0', null, '1', '2019-07-19 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('221', '1', 'testTask', 'renren', '0', null, '0', '2019-07-19 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('222', '1', 'testTask', 'renren', '0', null, '0', '2019-07-19 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('223', '1', 'testTask', 'renren', '0', null, '0', '2019-07-19 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('224', '1', 'testTask', 'renren', '0', null, '1', '2019-07-19 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('225', '1', 'testTask', 'renren', '0', null, '1', '2019-07-19 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('226', '1', 'testTask', 'renren', '0', null, '1', '2019-07-19 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('227', '1', 'testTask', 'renren', '0', null, '1', '2019-07-19 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('228', '1', 'testTask', 'renren', '0', null, '1', '2019-07-19 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('229', '1', 'testTask', 'renren', '0', null, '0', '2019-07-19 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('230', '1', 'testTask', 'renren', '0', null, '4', '2019-07-19 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('231', '1', 'testTask', 'renren', '0', null, '1', '2019-07-19 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('232', '1', 'testTask', 'renren', '0', null, '0', '2019-07-19 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('233', '1', 'testTask', 'renren', '0', null, '1', '2019-07-19 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('234', '1', 'testTask', 'renren', '0', null, '1', '2019-07-19 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('235', '1', 'testTask', 'renren', '0', null, '1', '2019-07-19 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('236', '1', 'testTask', 'renren', '0', null, '1', '2019-07-19 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('237', '1', 'testTask', 'renren', '0', null, '2', '2019-07-19 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('238', '1', 'testTask', 'renren', '0', null, '1', '2019-07-19 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('239', '1', 'testTask', 'renren', '0', null, '0', '2019-07-19 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('240', '1', 'testTask', 'renren', '0', null, '1', '2019-07-19 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('241', '1', 'testTask', 'renren', '0', null, '1', '2019-07-19 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('242', '1', 'testTask', 'renren', '0', null, '1', '2019-07-19 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('243', '1', 'testTask', 'renren', '0', null, '0', '2019-07-19 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('244', '1', 'testTask', 'renren', '0', null, '58', '2019-07-20 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('245', '1', 'testTask', 'renren', '0', null, '0', '2019-07-20 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('246', '1', 'testTask', 'renren', '0', null, '1', '2019-07-20 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('247', '1', 'testTask', 'renren', '0', null, '1', '2019-07-20 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('248', '1', 'testTask', 'renren', '0', null, '1', '2019-07-20 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('249', '1', 'testTask', 'renren', '0', null, '1', '2019-07-20 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('250', '1', 'testTask', 'renren', '0', null, '1', '2019-07-20 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('251', '1', 'testTask', 'renren', '0', null, '1', '2019-07-20 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('252', '1', 'testTask', 'renren', '0', null, '0', '2019-07-20 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('253', '1', 'testTask', 'renren', '0', null, '1', '2019-07-20 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('254', '1', 'testTask', 'renren', '0', null, '1', '2019-07-20 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('255', '1', 'testTask', 'renren', '0', null, '2', '2019-07-20 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('256', '1', 'testTask', 'renren', '0', null, '0', '2019-07-20 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('257', '1', 'testTask', 'renren', '0', null, '1', '2019-07-20 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('258', '1', 'testTask', 'renren', '0', null, '0', '2019-07-20 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('259', '1', 'testTask', 'renren', '0', null, '1', '2019-07-20 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('260', '1', 'testTask', 'renren', '0', null, '0', '2019-07-20 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('261', '1', 'testTask', 'renren', '0', null, '1', '2019-07-20 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('262', '1', 'testTask', 'renren', '0', null, '1', '2019-07-20 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('263', '1', 'testTask', 'renren', '0', null, '0', '2019-07-20 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('264', '1', 'testTask', 'renren', '0', null, '1', '2019-07-20 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('265', '1', 'testTask', 'renren', '0', null, '2', '2019-07-20 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('266', '1', 'testTask', 'renren', '0', null, '1', '2019-07-20 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('267', '1', 'testTask', 'renren', '0', null, '1', '2019-07-20 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('268', '1', 'testTask', 'renren', '0', null, '1', '2019-07-20 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('269', '1', 'testTask', 'renren', '0', null, '2', '2019-07-20 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('270', '1', 'testTask', 'renren', '0', null, '1', '2019-07-20 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('271', '1', 'testTask', 'renren', '0', null, '1', '2019-07-20 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('272', '1', 'testTask', 'renren', '0', null, '6', '2019-07-21 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('273', '1', 'testTask', 'renren', '0', null, '1', '2019-07-21 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('274', '1', 'testTask', 'renren', '0', null, '1', '2019-07-21 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('275', '1', 'testTask', 'renren', '0', null, '0', '2019-07-21 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('276', '1', 'testTask', 'renren', '0', null, '1', '2019-07-21 02:00:00');
INSERT INTO `schedule_job_log` VALUES ('277', '1', 'testTask', 'renren', '0', null, '1', '2019-07-21 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('278', '1', 'testTask', 'renren', '0', null, '1', '2019-07-21 03:00:00');
INSERT INTO `schedule_job_log` VALUES ('279', '1', 'testTask', 'renren', '0', null, '1', '2019-07-21 03:30:00');
INSERT INTO `schedule_job_log` VALUES ('280', '1', 'testTask', 'renren', '0', null, '1', '2019-07-21 04:00:00');
INSERT INTO `schedule_job_log` VALUES ('281', '1', 'testTask', 'renren', '0', null, '0', '2019-07-21 04:30:00');
INSERT INTO `schedule_job_log` VALUES ('282', '1', 'testTask', 'renren', '0', null, '0', '2019-07-21 05:00:00');
INSERT INTO `schedule_job_log` VALUES ('283', '1', 'testTask', 'renren', '0', null, '1', '2019-07-21 05:30:00');
INSERT INTO `schedule_job_log` VALUES ('284', '1', 'testTask', 'renren', '0', null, '1', '2019-07-21 06:00:00');
INSERT INTO `schedule_job_log` VALUES ('285', '1', 'testTask', 'renren', '0', null, '0', '2019-07-21 06:30:00');
INSERT INTO `schedule_job_log` VALUES ('286', '1', 'testTask', 'renren', '0', null, '1', '2019-07-21 07:00:00');
INSERT INTO `schedule_job_log` VALUES ('287', '1', 'testTask', 'renren', '0', null, '0', '2019-07-21 07:30:00');
INSERT INTO `schedule_job_log` VALUES ('288', '1', 'testTask', 'renren', '0', null, '1', '2019-07-21 08:00:00');
INSERT INTO `schedule_job_log` VALUES ('289', '1', 'testTask', 'renren', '0', null, '1', '2019-07-21 08:30:00');
INSERT INTO `schedule_job_log` VALUES ('290', '1', 'testTask', 'renren', '0', null, '1', '2019-07-21 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('291', '1', 'testTask', 'renren', '0', null, '1', '2019-07-21 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('292', '1', 'testTask', 'renren', '0', null, '0', '2019-07-21 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('293', '1', 'testTask', 'renren', '0', null, '1', '2019-07-21 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('294', '1', 'testTask', 'renren', '0', null, '1', '2019-07-21 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('295', '1', 'testTask', 'renren', '0', null, '1', '2019-07-21 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('296', '1', 'testTask', 'renren', '0', null, '0', '2019-07-21 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('297', '1', 'testTask', 'renren', '0', null, '1', '2019-07-21 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('298', '1', 'testTask', 'renren', '0', null, '0', '2019-07-21 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('299', '1', 'testTask', 'renren', '0', null, '1', '2019-07-21 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('300', '1', 'testTask', 'renren', '0', null, '1', '2019-07-21 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('301', '1', 'testTask', 'renren', '0', null, '0', '2019-07-21 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('302', '1', 'testTask', 'renren', '0', null, '0', '2019-07-21 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('303', '1', 'testTask', 'renren', '0', null, '1', '2019-07-21 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('304', '1', 'testTask', 'renren', '0', null, '1', '2019-07-21 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('305', '1', 'testTask', 'renren', '0', null, '2', '2019-07-21 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('306', '1', 'testTask', 'renren', '0', null, '10', '2019-07-21 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('307', '1', 'testTask', 'renren', '0', null, '1', '2019-07-21 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('308', '1', 'testTask', 'renren', '0', null, '1', '2019-07-21 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('309', '1', 'testTask', 'renren', '0', null, '1', '2019-07-21 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('310', '1', 'testTask', 'renren', '0', null, '1', '2019-07-21 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('311', '1', 'testTask', 'renren', '0', null, '0', '2019-07-21 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('312', '1', 'testTask', 'renren', '0', null, '1', '2019-07-21 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('313', '1', 'testTask', 'renren', '0', null, '0', '2019-07-21 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('314', '1', 'testTask', 'renren', '0', null, '1', '2019-07-21 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('315', '1', 'testTask', 'renren', '0', null, '1', '2019-07-21 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('316', '1', 'testTask', 'renren', '0', null, '0', '2019-07-21 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('317', '1', 'testTask', 'renren', '0', null, '1', '2019-07-21 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('318', '1', 'testTask', 'renren', '0', null, '1', '2019-07-21 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('319', '1', 'testTask', 'renren', '0', null, '1', '2019-07-21 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('320', '1', 'testTask', 'renren', '0', null, '6', '2019-07-22 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('321', '1', 'testTask', 'renren', '0', null, '0', '2019-07-22 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('322', '1', 'testTask', 'renren', '0', null, '1', '2019-07-22 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('323', '1', 'testTask', 'renren', '0', null, '1', '2019-07-22 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('324', '1', 'testTask', 'renren', '0', null, '1', '2019-07-22 02:00:00');
INSERT INTO `schedule_job_log` VALUES ('325', '1', 'testTask', 'renren', '0', null, '0', '2019-07-22 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('326', '1', 'testTask', 'renren', '0', null, '0', '2019-07-22 03:00:00');
INSERT INTO `schedule_job_log` VALUES ('327', '1', 'testTask', 'renren', '0', null, '1', '2019-07-22 03:30:00');
INSERT INTO `schedule_job_log` VALUES ('328', '1', 'testTask', 'renren', '0', null, '1', '2019-07-22 04:00:00');
INSERT INTO `schedule_job_log` VALUES ('329', '1', 'testTask', 'renren', '0', null, '1', '2019-07-22 04:30:00');
INSERT INTO `schedule_job_log` VALUES ('330', '1', 'testTask', 'renren', '0', null, '0', '2019-07-22 05:00:00');
INSERT INTO `schedule_job_log` VALUES ('331', '1', 'testTask', 'renren', '0', null, '1', '2019-07-22 05:30:00');
INSERT INTO `schedule_job_log` VALUES ('332', '1', 'testTask', 'renren', '0', null, '0', '2019-07-22 06:00:00');
INSERT INTO `schedule_job_log` VALUES ('333', '1', 'testTask', 'renren', '0', null, '1', '2019-07-22 06:30:00');
INSERT INTO `schedule_job_log` VALUES ('334', '1', 'testTask', 'renren', '0', null, '1', '2019-07-22 07:00:00');
INSERT INTO `schedule_job_log` VALUES ('335', '1', 'testTask', 'renren', '0', null, '0', '2019-07-22 07:30:00');
INSERT INTO `schedule_job_log` VALUES ('336', '1', 'testTask', 'renren', '0', null, '0', '2019-07-22 08:00:00');
INSERT INTO `schedule_job_log` VALUES ('337', '1', 'testTask', 'renren', '0', null, '1', '2019-07-22 08:30:00');
INSERT INTO `schedule_job_log` VALUES ('338', '1', 'testTask', 'renren', '0', null, '1', '2019-07-22 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('339', '1', 'testTask', 'renren', '0', null, '0', '2019-07-22 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('340', '1', 'testTask', 'renren', '0', null, '0', '2019-07-22 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('341', '1', 'testTask', 'renren', '0', null, '1', '2019-07-22 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('342', '1', 'testTask', 'renren', '0', null, '1', '2019-07-22 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('343', '1', 'testTask', 'renren', '0', null, '1', '2019-07-22 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('344', '1', 'testTask', 'renren', '0', null, '1', '2019-07-22 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('345', '1', 'testTask', 'renren', '0', null, '0', '2019-07-22 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('346', '1', 'testTask', 'renren', '0', null, '0', '2019-07-22 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('347', '1', 'testTask', 'renren', '0', null, '1', '2019-07-22 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('348', '1', 'testTask', 'renren', '0', null, '0', '2019-07-22 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('349', '1', 'testTask', 'renren', '0', null, '0', '2019-07-22 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('350', '1', 'testTask', 'renren', '0', null, '0', '2019-07-22 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('351', '1', 'testTask', 'renren', '0', null, '1', '2019-07-22 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('352', '1', 'testTask', 'renren', '0', null, '0', '2019-07-22 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('353', '1', 'testTask', 'renren', '0', null, '0', '2019-07-22 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('354', '1', 'testTask', 'renren', '0', null, '1', '2019-07-22 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('355', '1', 'testTask', 'renren', '0', null, '1', '2019-07-22 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('356', '1', 'testTask', 'renren', '0', null, '0', '2019-07-22 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('357', '1', 'testTask', 'renren', '0', null, '0', '2019-07-22 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('358', '1', 'testTask', 'renren', '0', null, '1', '2019-07-22 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('359', '1', 'testTask', 'renren', '0', null, '1', '2019-07-22 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('360', '1', 'testTask', 'renren', '0', null, '1', '2019-07-22 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('361', '1', 'testTask', 'renren', '0', null, '1', '2019-07-22 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('362', '1', 'testTask', 'renren', '0', null, '1', '2019-07-22 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('363', '1', 'testTask', 'renren', '0', null, '0', '2019-07-22 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('364', '1', 'testTask', 'renren', '0', null, '0', '2019-07-22 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('365', '1', 'testTask', 'renren', '0', null, '1', '2019-07-22 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('366', '1', 'testTask', 'renren', '0', null, '1', '2019-07-22 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('367', '1', 'testTask', 'renren', '0', null, '1', '2019-07-22 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('368', '1', 'testTask', 'renren', '0', null, '5', '2019-07-23 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('369', '1', 'testTask', 'renren', '0', null, '1', '2019-07-23 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('370', '1', 'testTask', 'renren', '0', null, '0', '2019-07-23 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('371', '1', 'testTask', 'renren', '0', null, '0', '2019-07-23 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('372', '1', 'testTask', 'renren', '0', null, '1', '2019-07-23 02:00:00');
INSERT INTO `schedule_job_log` VALUES ('373', '1', 'testTask', 'renren', '0', null, '1', '2019-07-23 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('374', '1', 'testTask', 'renren', '0', null, '1', '2019-07-23 03:00:00');
INSERT INTO `schedule_job_log` VALUES ('375', '1', 'testTask', 'renren', '0', null, '1', '2019-07-23 03:30:00');
INSERT INTO `schedule_job_log` VALUES ('376', '1', 'testTask', 'renren', '0', null, '1', '2019-07-23 04:00:00');
INSERT INTO `schedule_job_log` VALUES ('377', '1', 'testTask', 'renren', '0', null, '1', '2019-07-23 04:30:00');
INSERT INTO `schedule_job_log` VALUES ('378', '1', 'testTask', 'renren', '0', null, '1', '2019-07-23 05:00:00');
INSERT INTO `schedule_job_log` VALUES ('379', '1', 'testTask', 'renren', '0', null, '1', '2019-07-23 05:30:00');
INSERT INTO `schedule_job_log` VALUES ('380', '1', 'testTask', 'renren', '0', null, '1', '2019-07-23 06:00:00');
INSERT INTO `schedule_job_log` VALUES ('381', '1', 'testTask', 'renren', '0', null, '1', '2019-07-23 06:30:00');
INSERT INTO `schedule_job_log` VALUES ('382', '1', 'testTask', 'renren', '0', null, '0', '2019-07-23 07:00:00');
INSERT INTO `schedule_job_log` VALUES ('383', '1', 'testTask', 'renren', '0', null, '1', '2019-07-23 07:30:00');
INSERT INTO `schedule_job_log` VALUES ('384', '1', 'testTask', 'renren', '0', null, '1', '2019-07-23 08:00:00');
INSERT INTO `schedule_job_log` VALUES ('385', '1', 'testTask', 'renren', '0', null, '1', '2019-07-23 08:30:00');
INSERT INTO `schedule_job_log` VALUES ('386', '1', 'testTask', 'renren', '0', null, '0', '2019-07-23 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('387', '1', 'testTask', 'renren', '0', null, '0', '2019-07-23 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('388', '1', 'testTask', 'renren', '0', null, '0', '2019-07-23 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('389', '1', 'testTask', 'renren', '0', null, '1', '2019-07-23 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('390', '1', 'testTask', 'renren', '0', null, '0', '2019-07-23 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('391', '1', 'testTask', 'renren', '0', null, '0', '2019-07-23 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('392', '1', 'testTask', 'renren', '0', null, '1', '2019-07-23 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('393', '1', 'testTask', 'renren', '0', null, '1', '2019-07-23 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('394', '1', 'testTask', 'renren', '0', null, '0', '2019-07-23 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('395', '1', 'testTask', 'renren', '0', null, '0', '2019-07-23 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('396', '1', 'testTask', 'renren', '0', null, '0', '2019-07-23 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('397', '1', 'testTask', 'renren', '0', null, '0', '2019-07-23 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('398', '1', 'testTask', 'renren', '0', null, '1', '2019-07-23 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('399', '1', 'testTask', 'renren', '0', null, '0', '2019-07-23 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('400', '1', 'testTask', 'renren', '0', null, '0', '2019-07-23 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('401', '1', 'testTask', 'renren', '0', null, '1', '2019-07-23 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('402', '1', 'testTask', 'renren', '0', null, '1', '2019-07-23 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('403', '1', 'testTask', 'renren', '0', null, '1', '2019-07-23 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('404', '1', 'testTask', 'renren', '0', null, '0', '2019-07-23 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('405', '1', 'testTask', 'renren', '0', null, '0', '2019-07-23 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('406', '1', 'testTask', 'renren', '0', null, '1', '2019-07-23 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('407', '1', 'testTask', 'renren', '0', null, '1', '2019-07-23 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('408', '1', 'testTask', 'renren', '0', null, '1', '2019-07-23 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('409', '1', 'testTask', 'renren', '0', null, '0', '2019-07-23 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('410', '1', 'testTask', 'renren', '0', null, '1', '2019-07-23 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('411', '1', 'testTask', 'renren', '0', null, '1', '2019-07-23 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('412', '1', 'testTask', 'renren', '0', null, '0', '2019-07-23 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('413', '1', 'testTask', 'renren', '0', null, '1', '2019-07-23 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('414', '1', 'testTask', 'renren', '0', null, '1', '2019-07-23 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('415', '1', 'testTask', 'renren', '0', null, '0', '2019-07-23 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('416', '1', 'testTask', 'renren', '0', null, '4', '2019-07-24 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('417', '1', 'testTask', 'renren', '0', null, '1', '2019-07-24 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('418', '1', 'testTask', 'renren', '0', null, '0', '2019-07-24 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('419', '1', 'testTask', 'renren', '0', null, '1', '2019-07-24 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('420', '1', 'testTask', 'renren', '0', null, '0', '2019-07-24 02:00:00');
INSERT INTO `schedule_job_log` VALUES ('421', '1', 'testTask', 'renren', '0', null, '0', '2019-07-24 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('422', '1', 'testTask', 'renren', '0', null, '1', '2019-07-24 03:00:00');
INSERT INTO `schedule_job_log` VALUES ('423', '1', 'testTask', 'renren', '0', null, '1', '2019-07-24 03:30:00');
INSERT INTO `schedule_job_log` VALUES ('424', '1', 'testTask', 'renren', '0', null, '1', '2019-07-24 04:00:00');
INSERT INTO `schedule_job_log` VALUES ('425', '1', 'testTask', 'renren', '0', null, '1', '2019-07-24 04:30:00');
INSERT INTO `schedule_job_log` VALUES ('426', '1', 'testTask', 'renren', '0', null, '0', '2019-07-24 05:00:00');
INSERT INTO `schedule_job_log` VALUES ('427', '1', 'testTask', 'renren', '0', null, '0', '2019-07-24 05:30:00');
INSERT INTO `schedule_job_log` VALUES ('428', '1', 'testTask', 'renren', '0', null, '1', '2019-07-24 06:00:00');
INSERT INTO `schedule_job_log` VALUES ('429', '1', 'testTask', 'renren', '0', null, '1', '2019-07-24 06:30:00');
INSERT INTO `schedule_job_log` VALUES ('430', '1', 'testTask', 'renren', '0', null, '1', '2019-07-24 07:00:00');
INSERT INTO `schedule_job_log` VALUES ('431', '1', 'testTask', 'renren', '0', null, '1', '2019-07-24 07:30:00');
INSERT INTO `schedule_job_log` VALUES ('432', '1', 'testTask', 'renren', '0', null, '1', '2019-07-24 08:00:00');
INSERT INTO `schedule_job_log` VALUES ('433', '1', 'testTask', 'renren', '0', null, '1', '2019-07-24 08:30:00');
INSERT INTO `schedule_job_log` VALUES ('434', '1', 'testTask', 'renren', '0', null, '1', '2019-07-24 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('435', '1', 'testTask', 'renren', '0', null, '0', '2019-07-24 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('436', '1', 'testTask', 'renren', '0', null, '0', '2019-07-24 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('437', '1', 'testTask', 'renren', '0', null, '0', '2019-07-24 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('438', '1', 'testTask', 'renren', '0', null, '1', '2019-07-24 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('439', '1', 'testTask', 'renren', '0', null, '0', '2019-07-24 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('440', '1', 'testTask', 'renren', '0', null, '1', '2019-07-24 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('441', '1', 'testTask', 'renren', '0', null, '1', '2019-07-24 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('442', '1', 'testTask', 'renren', '0', null, '1', '2019-07-24 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('443', '1', 'testTask', 'renren', '0', null, '0', '2019-07-24 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('444', '1', 'testTask', 'renren', '0', null, '0', '2019-07-24 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('445', '1', 'testTask', 'renren', '0', null, '1', '2019-07-24 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('446', '1', 'testTask', 'renren', '0', null, '0', '2019-07-24 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('447', '1', 'testTask', 'renren', '0', null, '0', '2019-07-24 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('448', '1', 'testTask', 'renren', '0', null, '1', '2019-07-24 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('449', '1', 'testTask', 'renren', '0', null, '0', '2019-07-24 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('450', '1', 'testTask', 'renren', '0', null, '1', '2019-07-24 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('451', '1', 'testTask', 'renren', '0', null, '0', '2019-07-24 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('452', '1', 'testTask', 'renren', '0', null, '0', '2019-07-24 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('453', '1', 'testTask', 'renren', '0', null, '0', '2019-07-24 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('454', '1', 'testTask', 'renren', '0', null, '0', '2019-07-24 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('455', '1', 'testTask', 'renren', '0', null, '1', '2019-07-24 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('456', '1', 'testTask', 'renren', '0', null, '1', '2019-07-24 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('457', '1', 'testTask', 'renren', '0', null, '2', '2019-07-24 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('458', '1', 'testTask', 'renren', '0', null, '1', '2019-07-24 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('459', '1', 'testTask', 'renren', '0', null, '1', '2019-07-24 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('460', '1', 'testTask', 'renren', '0', null, '1', '2019-07-24 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('461', '1', 'testTask', 'renren', '0', null, '0', '2019-07-24 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('462', '1', 'testTask', 'renren', '0', null, '1', '2019-07-24 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('463', '1', 'testTask', 'renren', '0', null, '0', '2019-07-24 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('464', '1', 'testTask', 'renren', '0', null, '5', '2019-07-25 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('465', '1', 'testTask', 'renren', '0', null, '1', '2019-07-25 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('466', '1', 'testTask', 'renren', '0', null, '1', '2019-07-25 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('467', '1', 'testTask', 'renren', '0', null, '1', '2019-07-25 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('468', '1', 'testTask', 'renren', '0', null, '0', '2019-07-25 02:00:00');
INSERT INTO `schedule_job_log` VALUES ('469', '1', 'testTask', 'renren', '0', null, '1', '2019-07-25 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('470', '1', 'testTask', 'renren', '0', null, '0', '2019-07-25 03:00:00');
INSERT INTO `schedule_job_log` VALUES ('471', '1', 'testTask', 'renren', '0', null, '1', '2019-07-25 03:30:00');
INSERT INTO `schedule_job_log` VALUES ('472', '1', 'testTask', 'renren', '0', null, '1', '2019-07-25 04:00:00');
INSERT INTO `schedule_job_log` VALUES ('473', '1', 'testTask', 'renren', '0', null, '0', '2019-07-25 04:30:00');
INSERT INTO `schedule_job_log` VALUES ('474', '1', 'testTask', 'renren', '0', null, '0', '2019-07-25 05:00:00');
INSERT INTO `schedule_job_log` VALUES ('475', '1', 'testTask', 'renren', '0', null, '1', '2019-07-25 05:30:00');
INSERT INTO `schedule_job_log` VALUES ('476', '1', 'testTask', 'renren', '0', null, '0', '2019-07-25 06:00:00');
INSERT INTO `schedule_job_log` VALUES ('477', '1', 'testTask', 'renren', '0', null, '1', '2019-07-25 06:30:00');
INSERT INTO `schedule_job_log` VALUES ('478', '1', 'testTask', 'renren', '0', null, '1', '2019-07-25 07:00:00');
INSERT INTO `schedule_job_log` VALUES ('479', '1', 'testTask', 'renren', '0', null, '1', '2019-07-25 07:30:00');
INSERT INTO `schedule_job_log` VALUES ('480', '1', 'testTask', 'renren', '0', null, '0', '2019-07-25 08:00:00');
INSERT INTO `schedule_job_log` VALUES ('481', '1', 'testTask', 'renren', '0', null, '0', '2019-07-25 08:30:00');
INSERT INTO `schedule_job_log` VALUES ('482', '1', 'testTask', 'renren', '0', null, '1', '2019-07-25 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('483', '1', 'testTask', 'renren', '0', null, '1', '2019-07-25 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('484', '1', 'testTask', 'renren', '0', null, '1', '2019-07-25 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('485', '1', 'testTask', 'renren', '0', null, '1', '2019-07-25 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('486', '1', 'testTask', 'renren', '0', null, '1', '2019-07-25 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('487', '1', 'testTask', 'renren', '0', null, '1', '2019-07-25 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('488', '1', 'testTask', 'renren', '0', null, '0', '2019-07-25 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('489', '1', 'testTask', 'renren', '0', null, '1', '2019-07-25 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('490', '1', 'testTask', 'renren', '0', null, '0', '2019-07-25 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('491', '1', 'testTask', 'renren', '0', null, '0', '2019-07-25 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('492', '1', 'testTask', 'renren', '0', null, '1', '2019-07-25 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('493', '1', 'testTask', 'renren', '0', null, '1', '2019-07-25 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('494', '1', 'testTask', 'renren', '0', null, '0', '2019-07-25 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('495', '1', 'testTask', 'renren', '0', null, '1', '2019-07-25 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('496', '1', 'testTask', 'renren', '0', null, '0', '2019-07-25 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('497', '1', 'testTask', 'renren', '0', null, '0', '2019-07-25 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('498', '1', 'testTask', 'renren', '0', null, '1', '2019-07-25 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('499', '1', 'testTask', 'renren', '0', null, '0', '2019-07-25 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('500', '1', 'testTask', 'renren', '0', null, '0', '2019-07-25 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('501', '1', 'testTask', 'renren', '0', null, '1', '2019-07-25 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('502', '1', 'testTask', 'renren', '0', null, '1', '2019-07-25 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('503', '1', 'testTask', 'renren', '0', null, '1', '2019-07-25 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('504', '1', 'testTask', 'renren', '0', null, '1', '2019-07-25 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('505', '1', 'testTask', 'renren', '0', null, '0', '2019-07-25 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('506', '1', 'testTask', 'renren', '0', null, '1', '2019-07-25 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('507', '1', 'testTask', 'renren', '0', null, '0', '2019-07-25 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('508', '1', 'testTask', 'renren', '0', null, '0', '2019-07-25 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('509', '1', 'testTask', 'renren', '0', null, '1', '2019-07-25 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('510', '1', 'testTask', 'renren', '0', null, '0', '2019-07-25 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('511', '1', 'testTask', 'renren', '0', null, '1', '2019-07-25 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('512', '1', 'testTask', 'renren', '0', null, '19', '2019-07-26 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('513', '1', 'testTask', 'renren', '0', null, '1', '2019-07-26 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('514', '1', 'testTask', 'renren', '0', null, '1', '2019-07-26 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('515', '1', 'testTask', 'renren', '0', null, '1', '2019-07-26 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('516', '1', 'testTask', 'renren', '0', null, '0', '2019-07-26 02:00:00');
INSERT INTO `schedule_job_log` VALUES ('517', '1', 'testTask', 'renren', '0', null, '1', '2019-07-26 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('518', '1', 'testTask', 'renren', '0', null, '1', '2019-07-26 03:00:00');
INSERT INTO `schedule_job_log` VALUES ('519', '1', 'testTask', 'renren', '0', null, '1', '2019-07-26 03:30:00');
INSERT INTO `schedule_job_log` VALUES ('520', '1', 'testTask', 'renren', '0', null, '0', '2019-07-26 04:00:00');
INSERT INTO `schedule_job_log` VALUES ('521', '1', 'testTask', 'renren', '0', null, '1', '2019-07-26 04:30:00');
INSERT INTO `schedule_job_log` VALUES ('522', '1', 'testTask', 'renren', '0', null, '0', '2019-07-26 05:00:00');
INSERT INTO `schedule_job_log` VALUES ('523', '1', 'testTask', 'renren', '0', null, '1', '2019-07-26 05:30:00');
INSERT INTO `schedule_job_log` VALUES ('524', '1', 'testTask', 'renren', '0', null, '0', '2019-07-26 06:00:00');
INSERT INTO `schedule_job_log` VALUES ('525', '1', 'testTask', 'renren', '0', null, '0', '2019-07-26 06:30:00');
INSERT INTO `schedule_job_log` VALUES ('526', '1', 'testTask', 'renren', '0', null, '0', '2019-07-26 07:00:00');
INSERT INTO `schedule_job_log` VALUES ('527', '1', 'testTask', 'renren', '0', null, '1', '2019-07-26 07:30:00');
INSERT INTO `schedule_job_log` VALUES ('528', '1', 'testTask', 'renren', '0', null, '2', '2019-07-26 08:00:00');
INSERT INTO `schedule_job_log` VALUES ('529', '1', 'testTask', 'renren', '0', null, '1', '2019-07-26 08:30:00');
INSERT INTO `schedule_job_log` VALUES ('530', '1', 'testTask', 'renren', '0', null, '0', '2019-07-26 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('531', '1', 'testTask', 'renren', '0', null, '0', '2019-07-26 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('532', '1', 'testTask', 'renren', '0', null, '4', '2019-07-26 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('533', '1', 'testTask', 'renren', '0', null, '1', '2019-07-26 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('534', '1', 'testTask', 'renren', '0', null, '1', '2019-07-26 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('535', '1', 'testTask', 'renren', '0', null, '1', '2019-07-26 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('536', '1', 'testTask', 'renren', '0', null, '0', '2019-07-26 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('537', '1', 'testTask', 'renren', '0', null, '1', '2019-07-26 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('538', '1', 'testTask', 'renren', '0', null, '1', '2019-07-26 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('539', '1', 'testTask', 'renren', '0', null, '0', '2019-07-26 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('540', '1', 'testTask', 'renren', '0', null, '0', '2019-07-26 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('541', '1', 'testTask', 'renren', '0', null, '0', '2019-07-26 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('542', '1', 'testTask', 'renren', '0', null, '0', '2019-07-26 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('543', '1', 'testTask', 'renren', '0', null, '1', '2019-07-26 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('544', '1', 'testTask', 'renren', '0', null, '0', '2019-07-26 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('545', '1', 'testTask', 'renren', '0', null, '0', '2019-07-26 16:30:00');

-- ----------------------------
-- Table structure for sys_captcha
-- ----------------------------
DROP TABLE IF EXISTS `sys_captcha`;
CREATE TABLE `sys_captcha` (
  `uuid` char(36) NOT NULL COMMENT 'uuid',
  `code` varchar(6) NOT NULL COMMENT '验证码',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统验证码';

-- ----------------------------
-- Records of sys_captcha
-- ----------------------------
INSERT INTO `sys_captcha` VALUES ('009669ef-76d9-41ea-829c-8ca97a10c7a9', '68bn7', '2019-07-08 17:05:38');
INSERT INTO `sys_captcha` VALUES ('03ff5059-7350-480d-88bc-8905b3a0c105', 'gbge8', '2019-07-08 17:05:24');
INSERT INTO `sys_captcha` VALUES ('28cac9b7-0e2f-4500-86b3-f84a0da2a45c', 'x5a8y', '2019-07-19 23:47:39');
INSERT INTO `sys_captcha` VALUES ('48d1f189-f778-4b38-8539-2154cdf5128e', 'n4px2', '2019-07-15 23:10:03');
INSERT INTO `sys_captcha` VALUES ('507d49f2-36ba-41d3-8c61-54c07394bbb6', '4wmnx', '2019-07-15 20:40:51');
INSERT INTO `sys_captcha` VALUES ('63e824d2-edd0-46e9-82dd-dcfe6f8b8055', 'ynn85', '2019-07-19 17:29:49');
INSERT INTO `sys_captcha` VALUES ('82078b71-8f6c-455c-8ea9-a852c50fbfb7', '5n577', '2019-07-21 19:41:15');
INSERT INTO `sys_captcha` VALUES ('8239924a-ea06-4371-8be0-5221b1af640e', 'nayye', '2019-07-21 11:21:59');
INSERT INTO `sys_captcha` VALUES ('b2f90cf6-f44e-47a1-8014-49754bacb97a', 'pgb88', '2019-07-19 18:35:52');
INSERT INTO `sys_captcha` VALUES ('b3cadd6f-ce46-4ee0-8a3b-9bfc34f4542c', 'np7g2', '2019-07-04 13:47:11');
INSERT INTO `sys_captcha` VALUES ('e3057e14-0b76-4254-8b25-7e2f917621e7', 'awwmn', '2019-07-19 18:24:38');
INSERT INTO `sys_captcha` VALUES ('ea556b10-8109-4f5f-847d-13a94e349381', '68mbf', '2019-07-21 19:59:20');
INSERT INTO `sys_captcha` VALUES ('eaf9e005-4487-4aac-8b57-c577a63e3696', '2apxg', '2019-07-20 00:14:49');
INSERT INTO `sys_captcha` VALUES ('fc621be9-b374-4897-82de-236648906318', 'xx8bw', '2019-07-19 17:50:47');
INSERT INTO `sys_captcha` VALUES ('fc6b1dd3-05d9-4fa4-8f65-a3461c573cd6', '3aeb3', '2019-07-21 10:54:36');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `param_key` varchar(50) DEFAULT NULL COMMENT 'key',
  `param_value` varchar(2000) DEFAULT NULL COMMENT 'value',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `param_key` (`param_key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统配置信息表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', 'CLOUD_STORAGE_CONFIG_KEY', '{\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"aliyunDomain\":\"\",\"aliyunEndPoint\":\"\",\"aliyunPrefix\":\"\",\"qcloudBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qiniuAccessKey\":\"NrgMfABZxWLo5B-YYSjoE8-AZ1EISdi1Z3ubLOeZ\",\"qiniuBucketName\":\"ios-app\",\"qiniuDomain\":\"http://7xqbwh.dl1.z0.glb.clouddn.com\",\"qiniuPrefix\":\"upload\",\"qiniuSecretKey\":\"uIwJHevMRWU0VLxFvgy0tAcOdGqasdtVlJkdy6vV\",\"type\":1}', '0', '云存储配置信息');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `time` bigint(20) NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('1', 'admin', '保存菜单', 'com.atguigu.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":31,\"parentId\":0,\"name\":\"商品管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"zonghe\",\"orderNum\":0}]', '6', '127.0.0.1', '2019-07-04 13:48:35');
INSERT INTO `sys_log` VALUES ('2', 'admin', '保存菜单', 'com.atguigu.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":32,\"parentId\":0,\"name\":\"优惠营销\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"mudedi\",\"orderNum\":0}]', '4', '127.0.0.1', '2019-07-04 13:51:19');
INSERT INTO `sys_log` VALUES ('3', 'admin', '保存菜单', 'com.atguigu.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":33,\"parentId\":0,\"name\":\"库存管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"shouye\",\"orderNum\":0}]', '3', '127.0.0.1', '2019-07-04 13:54:03');
INSERT INTO `sys_log` VALUES ('4', 'admin', '保存菜单', 'com.atguigu.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":34,\"parentId\":0,\"name\":\"订单管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"log\",\"orderNum\":0}]', '3', '127.0.0.1', '2019-07-04 13:54:52');
INSERT INTO `sys_log` VALUES ('5', 'admin', '保存菜单', 'com.atguigu.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":35,\"parentId\":0,\"name\":\"物流管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"oss\",\"orderNum\":0}]', '3', '127.0.0.1', '2019-07-04 13:57:29');
INSERT INTO `sys_log` VALUES ('6', 'admin', '保存菜单', 'com.atguigu.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":36,\"parentId\":0,\"name\":\"内容管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"editor\",\"orderNum\":0}]', '2', '127.0.0.1', '2019-07-04 13:58:26');
INSERT INTO `sys_log` VALUES ('7', 'admin', '保存菜单', 'com.atguigu.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":37,\"parentId\":31,\"name\":\"分类维护\",\"url\":\"/category/list\",\"perms\":\"category:list\",\"type\":1,\"icon\":\"menu\",\"orderNum\":0}]', '7', '127.0.0.1', '2019-07-08 17:14:28');
INSERT INTO `sys_log` VALUES ('8', 'admin', '保存菜单', 'com.atguigu.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":38,\"parentId\":31,\"name\":\"商品列表\",\"url\":\"/spu/list\",\"perms\":\"spu:list\",\"type\":1,\"icon\":\"tubiao\",\"orderNum\":0}]', '4', '127.0.0.1', '2019-07-08 17:15:21');
INSERT INTO `sys_log` VALUES ('9', 'admin', '保存菜单', 'com.atguigu.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":39,\"parentId\":31,\"name\":\"品牌管理\",\"url\":\"/brand/list\",\"perms\":\"brand:list\",\"type\":1,\"icon\":\"tubiao\",\"orderNum\":0}]', '4', '127.0.0.1', '2019-07-08 17:16:57');
INSERT INTO `sys_log` VALUES ('10', 'admin', '保存菜单', 'com.atguigu.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":40,\"parentId\":31,\"name\":\"属性维护\",\"url\":\"/attr/list\",\"perms\":\"attr:list\",\"type\":1,\"icon\":\"tubiao\",\"orderNum\":0}]', '4', '127.0.0.1', '2019-07-08 17:17:42');
INSERT INTO `sys_log` VALUES ('11', 'admin', '修改菜单', 'com.atguigu.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":37,\"parentId\":31,\"name\":\"分类维护\",\"url\":\"/pms/category/list\",\"perms\":\"category:list\",\"type\":1,\"icon\":\"menu\",\"orderNum\":0}]', '9', '127.0.0.1', '2019-07-08 17:43:05');
INSERT INTO `sys_log` VALUES ('12', 'admin', '修改菜单', 'com.atguigu.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":38,\"parentId\":31,\"name\":\"商品列表\",\"url\":\"/pms/spu/list\",\"perms\":\"spu:list\",\"type\":1,\"icon\":\"tubiao\",\"orderNum\":0}]', '4', '127.0.0.1', '2019-07-08 17:43:16');
INSERT INTO `sys_log` VALUES ('13', 'admin', '修改菜单', 'com.atguigu.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":39,\"parentId\":31,\"name\":\"品牌管理\",\"url\":\"/pms/brand/list\",\"perms\":\"brand:list\",\"type\":1,\"icon\":\"tubiao\",\"orderNum\":0}]', '4', '127.0.0.1', '2019-07-08 17:43:27');
INSERT INTO `sys_log` VALUES ('14', 'admin', '修改菜单', 'com.atguigu.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":40,\"parentId\":31,\"name\":\"属性维护\",\"url\":\"/pms/attr/list\",\"perms\":\"attr:list\",\"type\":1,\"icon\":\"tubiao\",\"orderNum\":0}]', '7', '127.0.0.1', '2019-07-08 17:43:38');
INSERT INTO `sys_log` VALUES ('15', 'admin', '保存菜单', 'com.atguigu.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":41,\"parentId\":0,\"name\":\"用户管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"\",\"orderNum\":0}]', '4', '127.0.0.1', '2019-07-08 20:43:15');
INSERT INTO `sys_log` VALUES ('16', 'admin', '修改菜单', 'com.atguigu.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":41,\"parentId\":0,\"name\":\"用户管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"admin\",\"orderNum\":0}]', '4', '127.0.0.1', '2019-07-08 20:43:30');
INSERT INTO `sys_log` VALUES ('17', 'admin', '保存菜单', 'com.atguigu.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":42,\"parentId\":32,\"name\":\"优惠卷\",\"url\":\"/sms/coupon\",\"perms\":\"sms:coupon:list\",\"type\":1,\"icon\":\"\",\"orderNum\":0}]', '10', '192.168.3.3', '2019-07-19 17:44:20');
INSERT INTO `sys_log` VALUES ('18', 'admin', '修改菜单', 'com.atguigu.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":42,\"parentId\":32,\"name\":\"优惠卷\",\"url\":\"/sms/coupon/list\",\"perms\":\"sms:coupon:list\",\"type\":1,\"icon\":\"\",\"orderNum\":0}]', '6', '192.168.3.3', '2019-07-19 18:03:06');
INSERT INTO `sys_log` VALUES ('19', 'admin', '修改菜单', 'com.atguigu.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":42,\"parentId\":32,\"name\":\"优惠卷\",\"url\":\"/sms/coupon/list\",\"perms\":\"sms:coupon:list\",\"type\":1,\"icon\":\"log\",\"orderNum\":0}]', '7', '192.168.3.3', '2019-07-19 18:03:17');
INSERT INTO `sys_log` VALUES ('20', 'admin', '保存角色', 'com.atguigu.modules.sys.controller.SysRoleController.save()', '[{\"roleId\":1,\"roleName\":\"lfy\",\"remark\":\"123456\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,31,37,38,39,40,32,42,33,34,35,36,41,-666666],\"createTime\":\"Jul 21, 2019 11:18:03 AM\"}]', '193', '192.168.3.3', '2019-07-21 11:18:03');
INSERT INTO `sys_log` VALUES ('21', 'admin', '修改用户', 'com.atguigu.modules.sys.controller.SysUserController.update()', '[{\"userId\":2,\"username\":\"lei\",\"salt\":\"YzcmCZNvbXocrsz9dm8e\",\"email\":\"lei@com.atguigu\",\"mobile\":\"13612345678\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1}]', '336', '192.168.3.3', '2019-07-21 11:18:26');
INSERT INTO `sys_log` VALUES ('22', 'lei', '保存菜单', 'com.atguigu.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":43,\"parentId\":32,\"name\":\"秒杀活动\",\"url\":\"/sms/seckill/list\",\"perms\":\"\",\"type\":1,\"icon\":\"log\",\"orderNum\":0}]', '7', '192.168.3.3', '2019-07-21 13:15:25');
INSERT INTO `sys_log` VALUES ('23', 'lei', '修改菜单', 'com.atguigu.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":43,\"parentId\":32,\"name\":\"秒杀活动\",\"url\":\"/sms/seckill/list\",\"perms\":\"sms:seckill:list\",\"type\":1,\"icon\":\"log\",\"orderNum\":0}]', '6', '192.168.3.3', '2019-07-21 13:15:54');
INSERT INTO `sys_log` VALUES ('24', 'admin', '修改角色', 'com.atguigu.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":1,\"roleName\":\"lfy\",\"remark\":\"123456\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,31,37,38,39,40,32,42,43,33,34,35,36,41,-666666]}]', '42', '192.168.3.3', '2019-07-21 13:17:12');
INSERT INTO `sys_log` VALUES ('25', 'admin', '保存菜单', 'com.atguigu.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":44,\"parentId\":32,\"name\":\"优惠券领取历史\",\"url\":\"/sms/coupon/history\",\"perms\":\"sms:coupon:history\",\"type\":1,\"icon\":\"log\",\"orderNum\":0}]', '6', '192.168.3.3', '2019-07-21 23:43:07');
INSERT INTO `sys_log` VALUES ('26', 'admin', '修改菜单', 'com.atguigu.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":44,\"parentId\":32,\"name\":\"优惠券领取历史\",\"url\":\"/sms/coupon/coupon-history\",\"perms\":\"sms:coupon:history\",\"type\":1,\"icon\":\"log\",\"orderNum\":0}]', '8', '192.168.3.3', '2019-07-21 23:44:17');
INSERT INTO `sys_log` VALUES ('27', 'admin', '保存菜单', 'com.atguigu.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":45,\"parentId\":32,\"name\":\"商品折扣\",\"url\":\"/sms/spu/discount\",\"perms\":\"\",\"type\":1,\"icon\":\"log\",\"orderNum\":0}]', '4', '192.168.3.3', '2019-07-22 11:27:17');
INSERT INTO `sys_log` VALUES ('28', 'lei', '保存菜单', 'com.atguigu.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":46,\"parentId\":33,\"name\":\"仓库信息\",\"url\":\"/wms/wareinfo/list\",\"perms\":\"wms:wareinfo:list\",\"type\":1,\"icon\":\"log\",\"orderNum\":0}]', '7', '192.168.3.3', '2019-07-25 17:26:43');
INSERT INTO `sys_log` VALUES ('29', 'admin', '修改角色', 'com.atguigu.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":1,\"roleName\":\"lfy\",\"remark\":\"123456\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,31,37,38,39,40,32,42,43,44,45,33,46,34,35,36,41,-666666]}]', '189', '192.168.3.3', '2019-07-25 17:30:53');
INSERT INTO `sys_log` VALUES ('30', 'admin', '修改用户', 'com.atguigu.modules.sys.controller.SysUserController.update()', '[{\"userId\":2,\"username\":\"lei\",\"salt\":\"YzcmCZNvbXocrsz9dm8e\",\"email\":\"lei@com.atguigu\",\"mobile\":\"13612345678\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1}]', '316', '192.168.3.3', '2019-07-25 17:31:03');
INSERT INTO `sys_log` VALUES ('31', 'lei', '保存菜单', 'com.atguigu.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":47,\"parentId\":33,\"name\":\"库存工作单\",\"url\":\"/wms/task/list\",\"perms\":\"wms:task:list\",\"type\":1,\"icon\":\"log\",\"orderNum\":0}]', '4', '192.168.3.3', '2019-07-25 18:24:07');
INSERT INTO `sys_log` VALUES ('32', 'lei', '保存菜单', 'com.atguigu.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":48,\"parentId\":33,\"name\":\"商品库存\",\"url\":\"/wms/sku/list\",\"perms\":\"wms:sku:list\",\"type\":1,\"icon\":\"log\",\"orderNum\":0}]', '5', '192.168.3.3', '2019-07-25 18:24:57');
INSERT INTO `sys_log` VALUES ('33', 'admin', '修改角色', 'com.atguigu.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":1,\"roleName\":\"lfy\",\"remark\":\"123456\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,31,37,38,39,40,32,42,43,44,45,33,46,47,48,34,35,36,41,-666666]}]', '63', '192.168.3.3', '2019-07-25 18:25:51');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COMMENT='菜单管理';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '0', '系统管理', null, null, '0', 'system', '0');
INSERT INTO `sys_menu` VALUES ('2', '1', '管理员列表', 'sys/user', null, '1', 'admin', '1');
INSERT INTO `sys_menu` VALUES ('3', '1', '角色管理', 'sys/role', null, '1', 'role', '2');
INSERT INTO `sys_menu` VALUES ('4', '1', '菜单管理', 'sys/menu', null, '1', 'menu', '3');
INSERT INTO `sys_menu` VALUES ('5', '1', 'SQL监控', 'http://localhost:8080/renren-fast/druid/sql.html', null, '1', 'sql', '4');
INSERT INTO `sys_menu` VALUES ('6', '1', '定时任务', 'job/schedule', null, '1', 'job', '5');
INSERT INTO `sys_menu` VALUES ('7', '6', '查看', null, 'sys:schedule:list,sys:schedule:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('8', '6', '新增', null, 'sys:schedule:save', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('9', '6', '修改', null, 'sys:schedule:update', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('10', '6', '删除', null, 'sys:schedule:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('11', '6', '暂停', null, 'sys:schedule:pause', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('12', '6', '恢复', null, 'sys:schedule:resume', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('13', '6', '立即执行', null, 'sys:schedule:run', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('14', '6', '日志列表', null, 'sys:schedule:log', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('15', '2', '查看', null, 'sys:user:list,sys:user:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('16', '2', '新增', null, 'sys:user:save,sys:role:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('17', '2', '修改', null, 'sys:user:update,sys:role:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('18', '2', '删除', null, 'sys:user:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('19', '3', '查看', null, 'sys:role:list,sys:role:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('20', '3', '新增', null, 'sys:role:save,sys:menu:list', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('21', '3', '修改', null, 'sys:role:update,sys:menu:list', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('22', '3', '删除', null, 'sys:role:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('23', '4', '查看', null, 'sys:menu:list,sys:menu:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('24', '4', '新增', null, 'sys:menu:save,sys:menu:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('25', '4', '修改', null, 'sys:menu:update,sys:menu:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('26', '4', '删除', null, 'sys:menu:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('27', '1', '参数管理', 'sys/config', 'sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete', '1', 'config', '6');
INSERT INTO `sys_menu` VALUES ('29', '1', '系统日志', 'sys/log', 'sys:log:list', '1', 'log', '7');
INSERT INTO `sys_menu` VALUES ('30', '1', '文件上传', 'oss/oss', 'sys:oss:all', '1', 'oss', '6');
INSERT INTO `sys_menu` VALUES ('31', '0', '商品管理', '', '', '0', 'zonghe', '0');
INSERT INTO `sys_menu` VALUES ('32', '0', '优惠营销', '', '', '0', 'mudedi', '0');
INSERT INTO `sys_menu` VALUES ('33', '0', '库存管理', '', '', '0', 'shouye', '0');
INSERT INTO `sys_menu` VALUES ('34', '0', '订单管理', '', '', '0', 'log', '0');
INSERT INTO `sys_menu` VALUES ('35', '0', '物流管理', '', '', '0', 'oss', '0');
INSERT INTO `sys_menu` VALUES ('36', '0', '内容管理', '', '', '0', 'editor', '0');
INSERT INTO `sys_menu` VALUES ('37', '31', '分类维护', '/pms/category/list', 'pms:category:list', '1', 'menu', '0');
INSERT INTO `sys_menu` VALUES ('38', '31', '商品列表', '/pms/spu/list', 'pms:spu:list', '1', 'tubiao', '0');
INSERT INTO `sys_menu` VALUES ('39', '31', '品牌管理', '/pms/brand/list', 'pms:brand:list', '1', 'tubiao', '0');
INSERT INTO `sys_menu` VALUES ('40', '31', '属性维护', '/pms/attr/list', 'pms:attr:list', '1', 'tubiao', '0');
INSERT INTO `sys_menu` VALUES ('41', '0', '用户管理', '', '', '0', 'admin', '0');
INSERT INTO `sys_menu` VALUES ('42', '32', '优惠卷', '/sms/coupon/list', 'sms:coupon:list', '1', 'log', '0');
INSERT INTO `sys_menu` VALUES ('43', '32', '秒杀活动', '/sms/seckill/list', 'sms:seckill:list', '1', 'log', '0');
INSERT INTO `sys_menu` VALUES ('44', '32', '优惠券领取历史', '/sms/coupon/coupon-history', 'sms:coupon:history', '1', 'log', '0');
INSERT INTO `sys_menu` VALUES ('45', '32', '商品折扣', '/sms/spu/discount', '', '1', 'log', '0');
INSERT INTO `sys_menu` VALUES ('46', '33', '仓库信息', '/wms/wareinfo/list', 'wms:wareinfo:list', '1', 'log', '0');
INSERT INTO `sys_menu` VALUES ('47', '33', '库存工作单', '/wms/task/list', 'wms:task:list', '1', 'log', '0');
INSERT INTO `sys_menu` VALUES ('48', '33', '商品库存', '/wms/sku/list', 'wms:sku:list', '1', 'log', '0');

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件上传';

-- ----------------------------
-- Records of sys_oss
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', 'lfy', '123456', '1', '2019-07-21 11:18:03');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=180 DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('132', '1', '1');
INSERT INTO `sys_role_menu` VALUES ('133', '1', '2');
INSERT INTO `sys_role_menu` VALUES ('134', '1', '15');
INSERT INTO `sys_role_menu` VALUES ('135', '1', '16');
INSERT INTO `sys_role_menu` VALUES ('136', '1', '17');
INSERT INTO `sys_role_menu` VALUES ('137', '1', '18');
INSERT INTO `sys_role_menu` VALUES ('138', '1', '3');
INSERT INTO `sys_role_menu` VALUES ('139', '1', '19');
INSERT INTO `sys_role_menu` VALUES ('140', '1', '20');
INSERT INTO `sys_role_menu` VALUES ('141', '1', '21');
INSERT INTO `sys_role_menu` VALUES ('142', '1', '22');
INSERT INTO `sys_role_menu` VALUES ('143', '1', '4');
INSERT INTO `sys_role_menu` VALUES ('144', '1', '23');
INSERT INTO `sys_role_menu` VALUES ('145', '1', '24');
INSERT INTO `sys_role_menu` VALUES ('146', '1', '25');
INSERT INTO `sys_role_menu` VALUES ('147', '1', '26');
INSERT INTO `sys_role_menu` VALUES ('148', '1', '5');
INSERT INTO `sys_role_menu` VALUES ('149', '1', '6');
INSERT INTO `sys_role_menu` VALUES ('150', '1', '7');
INSERT INTO `sys_role_menu` VALUES ('151', '1', '8');
INSERT INTO `sys_role_menu` VALUES ('152', '1', '9');
INSERT INTO `sys_role_menu` VALUES ('153', '1', '10');
INSERT INTO `sys_role_menu` VALUES ('154', '1', '11');
INSERT INTO `sys_role_menu` VALUES ('155', '1', '12');
INSERT INTO `sys_role_menu` VALUES ('156', '1', '13');
INSERT INTO `sys_role_menu` VALUES ('157', '1', '14');
INSERT INTO `sys_role_menu` VALUES ('158', '1', '27');
INSERT INTO `sys_role_menu` VALUES ('159', '1', '29');
INSERT INTO `sys_role_menu` VALUES ('160', '1', '30');
INSERT INTO `sys_role_menu` VALUES ('161', '1', '31');
INSERT INTO `sys_role_menu` VALUES ('162', '1', '37');
INSERT INTO `sys_role_menu` VALUES ('163', '1', '38');
INSERT INTO `sys_role_menu` VALUES ('164', '1', '39');
INSERT INTO `sys_role_menu` VALUES ('165', '1', '40');
INSERT INTO `sys_role_menu` VALUES ('166', '1', '32');
INSERT INTO `sys_role_menu` VALUES ('167', '1', '42');
INSERT INTO `sys_role_menu` VALUES ('168', '1', '43');
INSERT INTO `sys_role_menu` VALUES ('169', '1', '44');
INSERT INTO `sys_role_menu` VALUES ('170', '1', '45');
INSERT INTO `sys_role_menu` VALUES ('171', '1', '33');
INSERT INTO `sys_role_menu` VALUES ('172', '1', '46');
INSERT INTO `sys_role_menu` VALUES ('173', '1', '47');
INSERT INTO `sys_role_menu` VALUES ('174', '1', '48');
INSERT INTO `sys_role_menu` VALUES ('175', '1', '34');
INSERT INTO `sys_role_menu` VALUES ('176', '1', '35');
INSERT INTO `sys_role_menu` VALUES ('177', '1', '36');
INSERT INTO `sys_role_menu` VALUES ('178', '1', '41');
INSERT INTO `sys_role_menu` VALUES ('179', '1', '-666666');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `salt` varchar(20) DEFAULT NULL COMMENT '盐',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='系统用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d', 'YzcmCZNvbXocrsz9dm8e', 'root@com.atguigu', '13612345678', '1', '1', '2016-11-11 11:11:11');
INSERT INTO `sys_user` VALUES ('2', 'lei', '9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d', 'YzcmCZNvbXocrsz9dm8e', 'lei@com.atguigu', '13612345678', '1', '1', '2019-07-19 17:26:22');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('2', '2', '1');

-- ----------------------------
-- Table structure for sys_user_token
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_token`;
CREATE TABLE `sys_user_token` (
  `user_id` bigint(20) NOT NULL,
  `token` varchar(100) NOT NULL COMMENT 'token',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统用户Token';

-- ----------------------------
-- Records of sys_user_token
-- ----------------------------
INSERT INTO `sys_user_token` VALUES ('1', '6c7ae55f7d135d12d7d415033aa4d900', '2019-07-26 23:04:34', '2019-07-26 11:04:34');
INSERT INTO `sys_user_token` VALUES ('2', 'f94ddd4c95cf3d327387fb43d802e474', '2019-07-27 00:05:14', '2019-07-26 12:05:14');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `mobile` varchar(20) NOT NULL COMMENT '手机号',
  `password` varchar(64) DEFAULT NULL COMMENT '密码',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户';

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('1', 'mark', '13612345678', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '2017-03-23 22:37:41');
