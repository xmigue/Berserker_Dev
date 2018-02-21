/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : berserkerro

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-02-15 20:00:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for woe_stadistics_player
-- ----------------------------
DROP TABLE IF EXISTS `woe_stadistics_player`;
CREATE TABLE `woe_stadistics_player` (
  `player_asesino` varchar(255) DEFAULT NULL,
  `player_asesinado` varchar(255) DEFAULT NULL,
  `nveces_asesinado` varchar(255) DEFAULT NULL,
  `date_primerasesinato` datetime DEFAULT NULL,
  `date_ultimoasesinato` datetime DEFAULT NULL,
  `map_name` varchar(255) DEFAULT NULL,
  `available` tinyint(4) DEFAULT '1' COMMENT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
