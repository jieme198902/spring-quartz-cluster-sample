/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50715
 Source Host           : localhost
 Source Database       : quartz

 Target Server Type    : MySQL
 Target Server Version : 50715
 File Encoding         : utf-8

 Date: 03/19/2019 17:35:03 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `SCHEDULE_JOB`
-- ----------------------------
DROP TABLE IF EXISTS `SCHEDULE_JOB`;
CREATE TABLE `SCHEDULE_JOB` (
                              `schedule_job_id` bigint(20) NOT NULL AUTO_INCREMENT,
                              `job_name` varchar(255) DEFAULT NULL,
                              `alias_name` varchar(255) DEFAULT NULL,
                              `job_group` varchar(255) DEFAULT NULL,
                              `job_trigger` varchar(255) DEFAULT NULL,
                              `status` varchar(255) DEFAULT NULL,
                              `cron_expression` varchar(255) DEFAULT NULL,
                              `is_sync` varchar(1) NOT NULL,
                              `url` varchar(255) DEFAULT NULL,
                              `description` varchar(255) DEFAULT NULL,
                              `gmt_create` timestamp NULL DEFAULT NULL,
                              `gmt_modify` timestamp NULL DEFAULT NULL,
                              `job_class` varchar(255) DEFAULT NULL COMMENT '需要执行的逻辑类名',
                              `job_class_method` varchar(255) DEFAULT NULL COMMENT '执行作业的方法名称',
                              PRIMARY KEY (`schedule_job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;