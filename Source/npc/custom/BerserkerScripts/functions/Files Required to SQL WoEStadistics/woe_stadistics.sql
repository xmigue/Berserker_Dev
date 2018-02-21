/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : berserkerro

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-02-15 20:00:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for woe_stadistics
-- ----------------------------
DROP TABLE IF EXISTS `woe_stadistics`;
CREATE TABLE `woe_stadistics` (
  `char_id` int(11) NOT NULL,
  `map_name` varchar(255) DEFAULT NULL,
  `nkills` int(11) DEFAULT NULL,
  `ndeaths` int(11) DEFAULT NULL,
  `date_firstkill` datetime DEFAULT NULL,
  `date_lastkill` datetime DEFAULT NULL,
  `date_firstdeath` datetime DEFAULT NULL,
  `date_lastdeath` datetime DEFAULT NULL,
  `available` tinyint(4) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
