//订餐系统菜单表
DROP TABLE IF EXISTS `food`;
CREATE TABLE `food` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

//给菜单表添加数据
INSERT INTO `food` VALUES ('1', '黄焖鸡米饭', '15');
INSERT INTO `food` VALUES ('2', '山西刀削面', '12');
INSERT INTO `food` VALUES ('3', '土豆牛肉盖浇饭', '16');

//订餐系统订单表
DROP TABLE IF EXISTS `order1`;
CREATE TABLE `order1` (
  `orderid` varchar(255) NOT NULL,
  `foodname` varchar(255) DEFAULT NULL,
  `orderdate` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

//给订单表添加数据
INSERT INTO `order1` VALUES ('20210602163103', '山西刀削面', '2021-06-02 16:31:03');
INSERT INTO `order1` VALUES ('20210602163411', '黄焖鸡米饭', '2021-06-02 16:34:11');

//订餐系统客户信息表
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userid` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `userpwd` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

//给客户信息表添加信息
INSERT INTO `user` VALUES ('1', 'tom', '123', '河南', '13266666666');
INSERT INTO `user` VALUES ('2', 'jerry', '111', '郑州', '13322222222');
INSERT INTO `user` VALUES ('1002', 'eric', '222', 'luoshanji', '1233333333');