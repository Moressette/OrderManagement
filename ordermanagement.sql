/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50150
Source Host           : localhost:3306
Source Database       : ordermanagement

Target Server Type    : MYSQL
Target Server Version : 50150
File Encoding         : 65001

Date: 2016-10-19 18:11:12
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `orderlist`
-- ----------------------------
DROP TABLE IF EXISTS `orderlist`;
CREATE TABLE `orderlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `no` varchar(20) NOT NULL,
  `consignee_name` varchar(20) NOT NULL,
  `consignee_addr` varchar(100) NOT NULL,
  `consignee_phone` varchar(20) NOT NULL,
  `order_price` double NOT NULL,
  `order_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `order_amount` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `no` (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderlist
-- ----------------------------
INSERT INTO orderlist VALUES ('1', 'jd0001', '王聪', '天津大学仁爱学院', '18833827200', '53.6', '2016-10-16 12:20:15', '5');
INSERT INTO orderlist VALUES ('8', 'jd0002', '张晓宇', '北京', '13116152536', '125.98', '2016-10-19 13:11:22', '99');
INSERT INTO orderlist VALUES ('13', 'jd0003', '蒋辉', '天津大学仁爱学院五实验楼', '13000000001', '236.4', '2016-10-19 17:51:26', '6');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `username` varchar(40) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO users VALUES ('1', 'admin', '123456', '1');
