/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : hengjiyuan

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-04-21 16:00:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for hj_admin_company
-- ----------------------------
DROP TABLE IF EXISTS `hj_admin_company`;
CREATE TABLE `hj_admin_company` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '公司',
  `companyTitle` varchar(500) DEFAULT NULL COMMENT '公司名称',
  `companyNum` varchar(20) DEFAULT NULL COMMENT '公司编码',
  `info` varchar(50) DEFAULT NULL COMMENT '简称',
  `cateName` varchar(20) DEFAULT NULL COMMENT '分类',
  `linkUser` varchar(50) DEFAULT NULL COMMENT '联系人',
  `linkPhone` varchar(12) DEFAULT NULL COMMENT '联系电话',
  `faxNum` varchar(30) DEFAULT NULL COMMENT '传真',
  `status` int(1) DEFAULT NULL COMMENT '状态',
  `describe` varchar(500) DEFAULT NULL COMMENT '描述',
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hj_admin_company
-- ----------------------------
INSERT INTO `hj_admin_company` VALUES ('2', '123', '对方的', 'の22', '分公司', '3242', '234', '434', null, '222', '2018-04-18 10:10:35');
INSERT INTO `hj_admin_company` VALUES ('3', '中原n', '342', '234', '分公司', '3434', '3434', '3434', null, '234', '2018-04-18 10:11:39');

-- ----------------------------
-- Table structure for hj_admin_department
-- ----------------------------
DROP TABLE IF EXISTS `hj_admin_department`;
CREATE TABLE `hj_admin_department` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '公司部门',
  `cId` int(10) DEFAULT NULL COMMENT '公司id',
  `code` varchar(20) DEFAULT NULL COMMENT '编码',
  `department` varchar(50) DEFAULT NULL COMMENT '部门',
  `info` varchar(50) DEFAULT NULL COMMENT '简称',
  `nature` varchar(20) DEFAULT NULL COMMENT '性质',
  `userId` int(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(12) DEFAULT NULL COMMENT '电话',
  `fax` varchar(30) DEFAULT NULL COMMENT '传真',
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `remarks` varchar(500) DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hj_admin_department
-- ----------------------------
INSERT INTO `hj_admin_department` VALUES ('1', '2', '32424', 'cnsk点卡积分', 'dsf', 'IT', '1', '234', '23', '2018-04-18 10:57:20', '333333');

-- ----------------------------
-- Table structure for hj_admin_user
-- ----------------------------
DROP TABLE IF EXISTS `hj_admin_user`;
CREATE TABLE `hj_admin_user` (
  `userId` int(10) NOT NULL AUTO_INCREMENT COMMENT '管理用户',
  `loginNum` varchar(50) DEFAULT NULL COMMENT '登陆账户',
  `userName` varchar(20) DEFAULT NULL COMMENT '用户名',
  `gender` int(1) DEFAULT NULL COMMENT '1男 2女 3保密',
  `phone` varchar(11) DEFAULT NULL COMMENT '手机号码',
  `telPhone` varchar(20) DEFAULT NULL COMMENT '电话',
  `email` varchar(30) DEFAULT NULL COMMENT '邮箱',
  `gId` int(10) DEFAULT NULL COMMENT '用户所在用户组',
  `companyId` int(10) DEFAULT NULL COMMENT '所属公司id',
  `department` int(10) DEFAULT NULL COMMENT '部门id',
  `duty` varchar(500) DEFAULT NULL COMMENT '职责',
  `status` int(2) DEFAULT '1' COMMENT '用户状态 1正常 0禁止登陆',
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `loginTime` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '说明',
  `password` varchar(32) DEFAULT NULL COMMENT '密码',
  `userCode` varchar(20) DEFAULT NULL COMMENT '用户工号',
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hj_admin_user
-- ----------------------------
INSERT INTO `hj_admin_user` VALUES ('1', 'admin', '系统创建者', '1', '1528277232', null, null, '1', null, null, '34', '1', '0000-00-00 00:00:00', null, '', 'e10adc3949ba59abbe56e057f20f883e', null);
INSERT INTO `hj_admin_user` VALUES ('2', 'admin123', 'chenh', '1', '1582827547', '', '424138799@qq.com', '3', '3', '0', '', '1', '2018-04-20 18:30:30', null, '', '9cbf8a4dcb8e30682b927f352d6559a0', '02554');

-- ----------------------------
-- Table structure for hj_admin_user_group
-- ----------------------------
DROP TABLE IF EXISTS `hj_admin_user_group`;
CREATE TABLE `hj_admin_user_group` (
  `gid` int(10) NOT NULL AUTO_INCREMENT COMMENT '管理用户组',
  `groupName` varchar(30) DEFAULT NULL COMMENT '用户组名称',
  `perm` text COMMENT '权限',
  `addtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `status` int(1) DEFAULT '1' COMMENT '用户组状态1正常0冻结不能登陆',
  PRIMARY KEY (`gid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hj_admin_user_group
-- ----------------------------
INSERT INTO `hj_admin_user_group` VALUES ('1', '超级管理员', '{\"1\":{\"value\":{\"id\":\"1\",\"name\":\"\\u5c0f\\u533a\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":null,\"url\":\"village\",\"style\":\"\",\"other\":null,\"lev\":1,\"chick\":[{\"id\":\"5\",\"name\":\"\\u94f6\\u884c\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"1\",\"addtime\":null,\"url\":\"Bank\\/bankList\",\"style\":null,\"other\":\"bankList\",\"lev\":2},{\"id\":\"6\",\"name\":\"\\u94f6\\u884c\\u4eba\\u5458\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"1\",\"addtime\":null,\"url\":\"Bank\\/bankPersonnel\",\"style\":null,\"other\":\"bankPersonnel\",\"lev\":2},{\"id\":\"7\",\"name\":\"\\u5f00\\u53d1\\u5546\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"1\",\"addtime\":null,\"url\":\"Post\\/developers\",\"style\":null,\"other\":\"developers\",\"lev\":2},{\"id\":\"8\",\"name\":\"\\u9500\\u552e\\u516c\\u53f8\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"1\",\"addtime\":null,\"url\":\"Post\\/salesCompany\",\"style\":null,\"other\":\"salesCompany\",\"lev\":2},{\"id\":\"9\",\"name\":\"\\u9500\\u552e\\u4eba\\u5458\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"1\",\"addtime\":null,\"url\":\"Post\\/salesUser\",\"style\":null,\"other\":\"salesUser\",\"lev\":2},{\"id\":\"10\",\"name\":\"\\u5546\\u5bb6\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"1\",\"addtime\":null,\"url\":\"Post\\/business\",\"style\":null,\"other\":\"business\",\"lev\":2},{\"id\":\"11\",\"name\":\"\\u5c0f\\u533a\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"1\",\"addtime\":null,\"url\":\"Post\\/village\",\"style\":null,\"other\":\"village\",\"lev\":2},{\"id\":\"12\",\"name\":\"\\u8f66\\u4f4d\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"1\",\"addtime\":null,\"url\":\"Post\\/carPark\",\"style\":null,\"other\":\"carPark\",\"lev\":2}]}},\"2\":{\"value\":{\"id\":\"2\",\"name\":\"\\u6309\\u63ed\\u7533\\u8bf7\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":null,\"url\":\"Mortgage\\/applyList\",\"style\":\"am-icon-calendar\",\"other\":\"applyList\",\"lev\":1}},\"3\":{\"value\":{\"id\":\"3\",\"name\":\"\\u57fa\\u7840\\u8d44\\u6599\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":null,\"url\":\"member\",\"style\":null,\"other\":null,\"lev\":1,\"chick\":[{\"id\":\"13\",\"name\":\"\\u4e1a\\u52a1\\u63d0\\u6210\",\"status\":\"1\",\"pid\":\"3\",\"addtime\":null,\"url\":\"Mortgage\\/commision\",\"style\":null,\"other\":\"commision\",\"lev\":2},{\"id\":\"14\",\"name\":\"\\u5c0f\\u533a\\u63d0\\u6210\",\"status\":\"1\",\"pid\":\"3\",\"addtime\":null,\"url\":\"Mortgage\\/villageCommision\",\"style\":null,\"other\":\"villageCommision\",\"lev\":2},{\"id\":\"15\",\"name\":\"\\u516c\\u53f8\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"3\",\"addtime\":null,\"url\":\"Member\\/company\",\"style\":null,\"other\":\"company\",\"lev\":2},{\"id\":\"16\",\"name\":\"\\u90e8\\u95e8\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"3\",\"addtime\":null,\"url\":\"Member\\/department\",\"style\":null,\"other\":\"department\",\"lev\":2},{\"id\":\"17\",\"name\":\"\\u7528\\u6237\\u7ec4\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"3\",\"addtime\":null,\"url\":\"Member\\/group\",\"style\":null,\"other\":\"group\",\"lev\":2},{\"id\":\"18\",\"name\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"3\",\"addtime\":null,\"url\":\"Member\\/adminUser\",\"style\":null,\"other\":\"adminUser\",\"lev\":2}]}},\"4\":{\"value\":{\"id\":\"4\",\"name\":\"\\u7cfb\\u7edf\\u8bbe\\u7f6e\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":null,\"url\":\"system\",\"style\":null,\"other\":null,\"lev\":1,\"chick\":[{\"id\":\"19\",\"name\":\"\\u5c0f\\u7a0b\\u5e8fbanner\",\"status\":\"1\",\"pid\":\"4\",\"addtime\":null,\"url\":\"Home\\/bannerList\",\"style\":null,\"other\":\"bannerList\",\"lev\":2},{\"id\":\"20\",\"name\":\"\\u7cfb\\u7edf\\u65e5\\u5fd7\",\"status\":\"1\",\"pid\":\"4\",\"addtime\":null,\"url\":\"#\",\"style\":null,\"other\":null,\"lev\":2}]}}}', '2018-04-17 09:57:25', '1');
INSERT INTO `hj_admin_user_group` VALUES ('3', '银行', '{\"2\":{\"value\":{\"id\":\"2\",\"name\":\"\\u6309\\u63ed\\u7533\\u8bf7\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":null,\"url\":\"Mortgage\\/applyList\",\"style\":\"am-icon-calendar\",\"other\":\"applyList\",\"lev\":1}}}', '2018-04-20 18:29:37', '1');

-- ----------------------------
-- Table structure for hj_bank
-- ----------------------------
DROP TABLE IF EXISTS `hj_bank`;
CREATE TABLE `hj_bank` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '银行id',
  `bankName` varchar(100) DEFAULT NULL COMMENT '银行名称',
  `linkUser` varchar(50) DEFAULT NULL COMMENT '联系人',
  `linkPhone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `remarks` varchar(50) DEFAULT NULL COMMENT '备注',
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `dutyId` int(11) DEFAULT NULL COMMENT '负责人ID 银行经理',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hj_bank
-- ----------------------------
INSERT INTO `hj_bank` VALUES ('2', '兴业银行', '马西纳', '15282455745', '', '2018-04-17 15:26:14', '1');
INSERT INTO `hj_bank` VALUES ('3', '招商银行1', '地方', '12584457445', '', '2018-04-17 15:26:14', '2');

-- ----------------------------
-- Table structure for hj_bank_user
-- ----------------------------
DROP TABLE IF EXISTS `hj_bank_user`;
CREATE TABLE `hj_bank_user` (
  `uId` int(11) NOT NULL AUTO_INCREMENT COMMENT '银行管理人员',
  `bankId` int(11) DEFAULT NULL COMMENT '所属银行',
  `userName` varchar(30) DEFAULT NULL COMMENT '用户名称',
  `gender` int(2) DEFAULT '0' COMMENT '性别  1男  2女  0保密',
  `linkPhone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `isDel` int(1) DEFAULT '1' COMMENT '状态  1正常  0删除',
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `password` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`uId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hj_bank_user
-- ----------------------------
INSERT INTO `hj_bank_user` VALUES ('2', '3', '32424', '2', '32434', '1', '2018-04-17 16:21:59', null);
INSERT INTO `hj_bank_user` VALUES ('3', '3', '从', '1', '1234443', '0', '2018-04-17 16:21:59', '9cbf8a4dcb8e30682b927f352d6559a0');
INSERT INTO `hj_bank_user` VALUES ('4', '2', '沉重', '2', '15825755477', '1', '2018-04-20 16:22:02', '9cbf8a4dcb8e30682b927f352d6559a0');

-- ----------------------------
-- Table structure for hj_business
-- ----------------------------
DROP TABLE IF EXISTS `hj_business`;
CREATE TABLE `hj_business` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '商家',
  `title` varchar(50) DEFAULT NULL COMMENT '商家名称',
  `address` varchar(100) DEFAULT NULL COMMENT '地址',
  `logo` varchar(500) DEFAULT NULL COMMENT 'logo',
  `info` varchar(200) DEFAULT NULL COMMENT '简介',
  `linkman` varchar(20) DEFAULT NULL COMMENT '联系人',
  `linkPhone` varchar(12) DEFAULT NULL COMMENT '联系电话',
  `sort` int(5) DEFAULT '200' COMMENT '排序 从小到达排序',
  `isDel` int(2) DEFAULT '0' COMMENT '是否删除 1是 0否',
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hj_business
-- ----------------------------
INSERT INTO `hj_business` VALUES ('2', '客人', '玩儿玩儿', 'upload/user/18-04-19_154358.png', 'f d f d f s d是的方式的', '23244', '23424', '3', '0', '2018-04-19 15:43:58');

-- ----------------------------
-- Table structure for hj_car_parking
-- ----------------------------
DROP TABLE IF EXISTS `hj_car_parking`;
CREATE TABLE `hj_car_parking` (
  `carId` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '车位管理',
  `vId` int(11) DEFAULT NULL COMMENT '小区id',
  `carTitle` varchar(50) DEFAULT NULL COMMENT '车位名称',
  `carNum` varchar(100) DEFAULT NULL COMMENT '车位编号',
  `logo` varchar(500) DEFAULT NULL COMMENT 'ligo',
  `price` float DEFAULT NULL COMMENT '价格',
  `discountPrice` int(11) DEFAULT NULL COMMENT '优惠价格',
  `surplusNum` int(10) DEFAULT NULL COMMENT '剩余数量',
  `createTime` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `startTime` timestamp NULL DEFAULT NULL COMMENT '开始时间',
  `endTime` timestamp NULL DEFAULT NULL COMMENT '结束时间',
  `content` text COMMENT '简介',
  `remarks` varchar(300) DEFAULT NULL COMMENT '备注',
  `soldNum` int(11) DEFAULT NULL COMMENT '已售数量',
  `carParkNum` int(11) DEFAULT NULL COMMENT '车位数量',
  `carPrice` float DEFAULT NULL COMMENT '均价',
  `createUser` int(11) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`carId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hj_car_parking
-- ----------------------------
INSERT INTO `hj_car_parking` VALUES ('2', '1', '美岸001', '34545', 'upload/car/18-04-19_184520.png', '4545', '154', '0', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '<p>4534535242424</p><p><br></p>', '4534532434', '0', '0', '45566', null);
INSERT INTO `hj_car_parking` VALUES ('3', '1', '34242', '4234242', 'https://img.hengjiyuankeji.com/2018-04-19_21:48:45.jpg', '4234230', '242334242', '23423432', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '<p>4353453535345</p>', '', '2147483647', '4242', '4234320000', '1');
INSERT INTO `hj_car_parking` VALUES ('4', '2', '4234', '234', 'https://img.hengjiyuankeji.com/carPark1524281782.jpg', '344', '0', '443', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '<p>2342424</p>', '', '343', '3434', '3434', '1');

-- ----------------------------
-- Table structure for hj_developers
-- ----------------------------
DROP TABLE IF EXISTS `hj_developers`;
CREATE TABLE `hj_developers` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '开发商',
  `title` varchar(100) DEFAULT NULL COMMENT '开发商名称',
  `legalUser` varchar(50) DEFAULT NULL COMMENT '法人',
  `license` varchar(200) DEFAULT NULL COMMENT '营业执照',
  `licensePic` varchar(500) DEFAULT NULL COMMENT '营业执照照片',
  `blameId` int(11) DEFAULT NULL COMMENT '负责人主键',
  `linkman` varchar(50) DEFAULT NULL COMMENT '联系人',
  `linkPhone` varchar(11) DEFAULT NULL COMMENT '联系人电话',
  `sort` int(5) DEFAULT '200' COMMENT '排序 默认从低到高',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注',
  `isDel` int(2) DEFAULT '0' COMMENT '是否删除 1是 0没有',
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `address` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hj_developers
-- ----------------------------
INSERT INTO `hj_developers` VALUES ('1', '包里2', '34', '  3434534353423', 'upload/developers/18-04-19_100746.jpg', '1', '包里2', '344', '34', '24575545454', '0', '2018-04-18 19:34:59', '1');

-- ----------------------------
-- Table structure for hj_sales_company
-- ----------------------------
DROP TABLE IF EXISTS `hj_sales_company`;
CREATE TABLE `hj_sales_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '销售公司',
  `companyName` varchar(500) DEFAULT NULL COMMENT '公司名称',
  `companyAddress` varchar(500) DEFAULT NULL COMMENT '公司地址',
  `companyInfo` varchar(500) DEFAULT NULL COMMENT '公司简介',
  `uid` int(20) DEFAULT NULL COMMENT '负责人id',
  `linkman` varchar(50) DEFAULT NULL COMMENT '联系人',
  `linkPhone` varchar(50) DEFAULT NULL COMMENT '联系电话',
  `license` varchar(100) DEFAULT NULL COMMENT '营业执照',
  `licensePic` varchar(500) DEFAULT NULL COMMENT '营业执照图片',
  `billing` varchar(100) DEFAULT NULL COMMENT '开票信息',
  `openAccount` varchar(200) DEFAULT NULL COMMENT '开户信息',
  `sort` int(10) DEFAULT '200' COMMENT '排序 从小到大排序',
  `isDel` int(2) DEFAULT '0' COMMENT '是否删除  1是 0否',
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hj_sales_company
-- ----------------------------
INSERT INTO `hj_sales_company` VALUES ('2', '的方式发送', '34535', '', '1', '4455345', '345', '25475734dsfsfs', 'upload/company/18-04-19_112348.jpg', '3453', '5353535', '0', '0', '2018-04-19 11:23:48');
INSERT INTO `hj_sales_company` VALUES ('3', '测试公司', '', '', '2', '', '', '1215455454', null, '', '', '0', '0', '2018-04-21 10:46:11');

-- ----------------------------
-- Table structure for hj_sales_user
-- ----------------------------
DROP TABLE IF EXISTS `hj_sales_user`;
CREATE TABLE `hj_sales_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '销售人员',
  `c_id` int(11) DEFAULT NULL COMMENT '销售公司名称',
  `userName` varchar(50) DEFAULT NULL COMMENT '姓名',
  `gender` int(1) DEFAULT '0' COMMENT '性别 1男 2女 0保密',
  `birthday` varchar(20) DEFAULT NULL COMMENT '生日',
  `phone` varchar(11) DEFAULT NULL COMMENT '电话',
  `info` varchar(500) DEFAULT NULL COMMENT '简介',
  `headPic` varchar(500) DEFAULT NULL COMMENT '头像',
  `sort` int(20) DEFAULT '200' COMMENT '排序 从小到大 ',
  `isDel` int(2) DEFAULT '0' COMMENT '是否删除  1是 0否',
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `password` varchar(32) DEFAULT NULL COMMENT '密码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hj_sales_user
-- ----------------------------
INSERT INTO `hj_sales_user` VALUES ('2', '2', '海运费', '2', '19958575', '15828277232', '4234', 'upload/user/18-04-19_142833.jpg', '200', '0', '2018-04-19 14:28:33', 'e10adc3949ba59abbe56e057f20f883e');

-- ----------------------------
-- Table structure for hj_send_apply
-- ----------------------------
DROP TABLE IF EXISTS `hj_send_apply`;
CREATE TABLE `hj_send_apply` (
  `mId` int(11) NOT NULL AUTO_INCREMENT COMMENT '按揭申请表',
  `salesId` int(11) DEFAULT NULL COMMENT '销售人员ID',
  `carId` int(11) DEFAULT NULL COMMENT '车位Id',
  `name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `idCard` varchar(50) DEFAULT NULL COMMENT '身份证号码',
  `cardPositive` varchar(500) DEFAULT NULL COMMENT '身份证正面',
  `cardOpposite` varchar(500) DEFAULT NULL COMMENT '反面',
  `holdCard` varchar(500) DEFAULT NULL COMMENT '手持身份证',
  `salesman` varchar(500) DEFAULT NULL COMMENT '营业员照片',
  `duty` varchar(100) DEFAULT NULL COMMENT '岗位',
  `income` varchar(20) DEFAULT NULL COMMENT '收入',
  `workUnit` varchar(255) DEFAULT NULL COMMENT '工作单位',
  `phone` varchar(12) DEFAULT NULL COMMENT '联系电话',
  `sendTime` timestamp NULL DEFAULT NULL COMMENT '申请时间',
  `examineState` int(11) DEFAULT NULL COMMENT '审核状态',
  `bankId` int(11) DEFAULT NULL COMMENT '审核人员',
  `examineTime` timestamp NULL DEFAULT NULL COMMENT '审核时间',
  `examineContent` varchar(500) DEFAULT NULL COMMENT '审核意见',
  PRIMARY KEY (`mId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hj_send_apply
-- ----------------------------
INSERT INTO `hj_send_apply` VALUES ('1', '2', '1', '陈华一', '211554445', '', '', '', '', '34234', '200', '32424', '1582587547', '2018-04-21 15:48:32', null, null, null, null);
INSERT INTO `hj_send_apply` VALUES ('2', '2', '1', '陈华一', '211554445', '', '', '', '', '34234', '200', '32424', '1582587547', '2018-04-21 09:47:45', null, null, null, null);
INSERT INTO `hj_send_apply` VALUES ('3', '2', '1', '陈华一', '211554445', '', '', '', '', '34234', '200', '32424', '1582587547', '2018-04-21 09:48:46', null, null, null, null);

-- ----------------------------
-- Table structure for hj_system_banner
-- ----------------------------
DROP TABLE IF EXISTS `hj_system_banner`;
CREATE TABLE `hj_system_banner` (
  `bannerId` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `bannerUrl` varchar(500) DEFAULT NULL,
  `linkPath` varchar(500) DEFAULT '',
  `createTime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`bannerId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hj_system_banner
-- ----------------------------
INSERT INTO `hj_system_banner` VALUES ('1', '34242', 'https://img.hengjiyuankeji.com/banner1524223996.jpg', '#', null);

-- ----------------------------
-- Table structure for hj_system_log
-- ----------------------------
DROP TABLE IF EXISTS `hj_system_log`;
CREATE TABLE `hj_system_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '系统日志',
  `log_url` varchar(200) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `userName` varchar(200) DEFAULT NULL,
  `log_ip` varchar(200) DEFAULT NULL,
  `log_status` varchar(2) DEFAULT NULL,
  `log_message` text,
  `log_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hj_system_log
-- ----------------------------
INSERT INTO `hj_system_log` VALUES ('59', 'Member/addGroup', '1', '系统创建者', '::1', '1', '新增用户组成功', '2018-04-20 14:14:47');
INSERT INTO `hj_system_log` VALUES ('60', 'Member/editGroup', '1', '系统创建者', '::1', '1', '编辑用户组成功', '2018-04-20 14:16:01');
INSERT INTO `hj_system_log` VALUES ('61', 'Member/editGroup', '1', '系统创建者', '::1', '1', '编辑用户组成功', '2018-04-20 14:22:11');
INSERT INTO `hj_system_log` VALUES ('62', 'Member/delGroup', '1', '系统创建者', '::1', '1', '删除用户组成功', '2018-04-20 14:22:42');
INSERT INTO `hj_system_log` VALUES ('63', 'Member/editJurisdiction', '1', '系统创建者', '::1', '1', '编辑用户组成功', '2018-04-20 15:06:49');
INSERT INTO `hj_system_log` VALUES ('64', 'Member/editJurisdiction', '1', '系统创建者', '::1', '1', '编辑用户组成功', '2018-04-20 15:17:26');
INSERT INTO `hj_system_log` VALUES ('65', 'Member/editJurisdiction', '1', '系统创建者', '::1', '1', '编辑用户组成功', '2018-04-20 15:38:52');
INSERT INTO `hj_system_log` VALUES ('66', 'Member/editJurisdiction', '1', '系统创建者', '::1', '1', '编辑用户组成功', '2018-04-20 15:42:15');
INSERT INTO `hj_system_log` VALUES ('67', 'Bank/addBankUser', '1', '系统创建者', '::1', '1', '新增银行管理人员成功,银行编号是：2,银行管理人员名称是：沉重', '2018-04-20 16:22:02');
INSERT INTO `hj_system_log` VALUES ('68', 'Bank/editBankUser', '1', '系统创建者', '::1', '1', '编辑银行管理人员成功,银行编号是：2,银行管理人员名称是：从', '2018-04-20 16:26:59');
INSERT INTO `hj_system_log` VALUES ('69', 'Bank/editBankUser', '1', '系统创建者', '::1', '1', '编辑银行管理人员成功,银行编号是：2,银行管理人员名称是：从', '2018-04-20 16:27:26');
INSERT INTO `hj_system_log` VALUES ('70', 'Bank/editBankUser', '1', '系统创建者', '::1', '1', '编辑银行管理人员成功,银行编号是：2,银行管理人员名称是：从', '2018-04-20 16:28:27');
INSERT INTO `hj_system_log` VALUES ('71', 'Bank/editBankUser', '1', '系统创建者', '::1', '1', '编辑银行管理人员成功,银行编号是：2,银行管理人员名称是：沉重', '2018-04-20 16:29:57');
INSERT INTO `hj_system_log` VALUES ('72', 'Bank/editBankUser', '1', '系统创建者', '::1', '1', '编辑银行管理人员成功,银行编号是：3,银行管理人员名称是：从', '2018-04-20 16:30:08');
INSERT INTO `hj_system_log` VALUES ('73', 'Member/addGroup', '1', '系统创建者', '::1', '1', '新增用户组成功', '2018-04-20 18:29:38');
INSERT INTO `hj_system_log` VALUES ('74', 'Member/editJurisdiction', '1', '系统创建者', '::1', '1', '编辑用户组成功', '2018-04-20 18:29:45');
INSERT INTO `hj_system_log` VALUES ('75', 'Member/AddUser', '1', '系统创建者', '::1', '1', '新增用户信息成功,用户登陆账户是admin123', '2018-04-20 18:30:30');
INSERT INTO `hj_system_log` VALUES ('76', 'Member/editJurisdiction', '1', '系统创建者', '::1', '1', '编辑用户组成功', '2018-04-20 18:51:53');
INSERT INTO `hj_system_log` VALUES ('77', 'Home/addBanner', '1', '系统创建者', '::1', '1', '新增banner成功,banner名称是：34242', '2018-04-20 19:10:18');
INSERT INTO `hj_system_log` VALUES ('78', 'Home/editBanner', '1', '系统创建者', '::1', '1', '编辑banner成功,banner名称是：34242,bannerId是:1', '2018-04-20 19:33:17');
INSERT INTO `hj_system_log` VALUES ('79', 'Home/addBanner', '1', '系统创建者', '::1', '1', '新增banner成功,banner名称是：34234', '2018-04-20 19:40:14');
INSERT INTO `hj_system_log` VALUES ('80', 'Home/delBanner', '1', '系统创建者', '::1', '1', '删除banner成功,bannerId是:', '2018-04-20 19:40:22');
INSERT INTO `hj_system_log` VALUES ('81', 'Bank/editBank', '1', '系统创建者', '::1', '1', '编辑银行成功,银行名称：招商银行1', '2018-04-21 10:22:27');
INSERT INTO `hj_system_log` VALUES ('82', 'Bank/editBank', '1', '系统创建者', '::1', '1', '编辑银行成功,银行名称：兴业银行', '2018-04-21 10:22:38');
INSERT INTO `hj_system_log` VALUES ('83', 'Post/AddCompany', '1', '系统创建者', '::1', '1', '新增销售公司成功,销售公司名称是：测试公司', '2018-04-21 10:46:11');
INSERT INTO `hj_system_log` VALUES ('84', 'Post/editVillage', '1', '系统创建者', '::1', '1', '编辑小区信息成功,小区名称是：美年1,小区编号是:1', '2018-04-21 10:57:52');
INSERT INTO `hj_system_log` VALUES ('85', 'Post/addVillage', '1', '系统创建者', '::1', '1', '新增小区信息成功,小区名称是：问打', '2018-04-21 11:35:58');
INSERT INTO `hj_system_log` VALUES ('86', 'Post/addCarPark', '1', '系统创建者', '::1', '1', '新增车位信息成功,车位名称是：4234', '2018-04-21 11:36:23');

-- ----------------------------
-- Table structure for hj_system_nav
-- ----------------------------
DROP TABLE IF EXISTS `hj_system_nav`;
CREATE TABLE `hj_system_nav` (
  `id` int(10) NOT NULL COMMENT '系统权限',
  `name` varchar(20) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `pid` int(10) DEFAULT NULL,
  `addtime` timestamp NULL DEFAULT NULL,
  `url` varchar(500) DEFAULT NULL,
  `style` varchar(500) DEFAULT NULL,
  `other` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hj_system_nav
-- ----------------------------
INSERT INTO `hj_system_nav` VALUES ('1', '小区管理', '1', '0', null, 'village', '', null);
INSERT INTO `hj_system_nav` VALUES ('2', '按揭申请管理', '1', '0', null, 'Mortgage/applyList', 'am-icon-calendar', 'applyList');
INSERT INTO `hj_system_nav` VALUES ('3', '基础资料', '1', '0', null, 'member', null, null);
INSERT INTO `hj_system_nav` VALUES ('4', '系统设置', '1', '0', null, 'system', null, null);
INSERT INTO `hj_system_nav` VALUES ('5', '银行管理', '1', '1', null, 'Bank/bankList', null, 'bankList');
INSERT INTO `hj_system_nav` VALUES ('6', '银行人员管理', '1', '1', null, 'Bank/bankPersonnel', null, 'bankPersonnel');
INSERT INTO `hj_system_nav` VALUES ('7', '开发商管理', '1', '1', null, 'Post/developers', null, 'developers');
INSERT INTO `hj_system_nav` VALUES ('8', '销售公司管理', '1', '1', null, 'Post/salesCompany', null, 'salesCompany');
INSERT INTO `hj_system_nav` VALUES ('9', '销售人员管理', '1', '1', null, 'Post/salesUser', null, 'salesUser');
INSERT INTO `hj_system_nav` VALUES ('10', '商家管理', '1', '1', null, 'Post/business', null, 'business');
INSERT INTO `hj_system_nav` VALUES ('11', '小区管理', '1', '1', null, 'Post/village', null, 'village');
INSERT INTO `hj_system_nav` VALUES ('12', '车位管理', '1', '1', null, 'Post/carPark', null, 'carPark');
INSERT INTO `hj_system_nav` VALUES ('13', '业务提成', '1', '3', null, 'Mortgage/commision', null, 'commision');
INSERT INTO `hj_system_nav` VALUES ('14', '小区提成', '1', '3', null, 'Mortgage/villageCommision', null, 'villageCommision');
INSERT INTO `hj_system_nav` VALUES ('15', '公司管理', '1', '3', null, 'Member/company', null, 'company');
INSERT INTO `hj_system_nav` VALUES ('16', '部门管理', '1', '3', null, 'Member/department', null, 'department');
INSERT INTO `hj_system_nav` VALUES ('17', '用户组管理', '1', '3', null, 'Member/group', null, 'group');
INSERT INTO `hj_system_nav` VALUES ('18', '用户管理', '1', '3', null, 'Member/adminUser', null, 'adminUser');
INSERT INTO `hj_system_nav` VALUES ('19', '小程序banner', '1', '4', null, 'Home/bannerList', null, 'bannerList');
INSERT INTO `hj_system_nav` VALUES ('20', '系统日志', '1', '4', null, '#', null, null);

-- ----------------------------
-- Table structure for hj_village
-- ----------------------------
DROP TABLE IF EXISTS `hj_village`;
CREATE TABLE `hj_village` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `bankId` int(11) DEFAULT NULL COMMENT '所属银行',
  `dId` int(11) DEFAULT NULL COMMENT '开发商id',
  `villageTitle` varchar(300) DEFAULT NULL COMMENT '小区名称',
  `address` varchar(500) DEFAULT NULL COMMENT '小区地址',
  `respons` varchar(30) DEFAULT NULL COMMENT '负责人',
  `linkPhone` int(12) DEFAULT NULL COMMENT '联系电话',
  `carNum` int(10) DEFAULT NULL COMMENT '车位数量',
  `soldNum` int(10) DEFAULT NULL COMMENT '已售数量',
  `surplusNum` int(11) DEFAULT NULL COMMENT '剩余数量',
  `logo` varchar(500) DEFAULT NULL COMMENT '小区logo',
  `carInfo` text COMMENT '车位简介',
  `content` text COMMENT '图片简介',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注',
  `status` int(2) DEFAULT '1' COMMENT '是否展示 1是 0 否',
  `carPrice` float DEFAULT NULL COMMENT '车位均价',
  `createUser` int(11) DEFAULT NULL COMMENT '创建者',
  `createTime` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updataUser` int(11) DEFAULT NULL COMMENT '修改用户',
  `updataTime` timestamp NULL DEFAULT NULL COMMENT '修改用户时间',
  `brokerage` float DEFAULT NULL COMMENT '佣金',
  `carWashNum` int(11) DEFAULT NULL COMMENT '赠送洗车卷数量',
  `recommend` int(11) DEFAULT '0' COMMENT '首页推荐 1推荐  0不推荐',
  `salesUserId` int(11) DEFAULT NULL COMMENT '所属销售人员Id',
  `salesCompany` int(11) DEFAULT NULL COMMENT '销售公司',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hj_village
-- ----------------------------
INSERT INTO `hj_village` VALUES ('1', '3', '1', '美年1', '撒娇看到那句', '李先生', '2147483647', '2300', '300', '1200', 'https://img.hengjiyuankeji.com/villageLogo1524279472.jpg', null, '<p>啊啊大大大<img src=\"http://localhost/hjy/upload/news/18-04-19_165713.png\" style=\"font-size: 1.6rem; max-width: 100%;\"></p><p><br></p>', '是的方式的', '1', '130000', null, null, '1', '2018-04-21 10:57:51', '500', '3', '1', '2', '2');
INSERT INTO `hj_village` VALUES ('2', '3', '1', '问打', '324243', '23424', '234234', '23434', '3434', '23', null, null, '<p>342342424</p>', '34', '1', '434', '1', null, null, null, '34', '0', '0', '2', '2');
