/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : hengjiyuan

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-04-19 22:29:12
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hj_admin_user
-- ----------------------------
INSERT INTO `hj_admin_user` VALUES ('1', 'admin', '系统创建者', '1', '1528277232', null, null, '1', null, null, '34', '1', '0000-00-00 00:00:00', null, '', 'e10adc3949ba59abbe56e057f20f883e', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hj_admin_user_group
-- ----------------------------
INSERT INTO `hj_admin_user_group` VALUES ('1', '超级管理员', '', '2018-04-17 09:57:25', '1');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hj_bank
-- ----------------------------
INSERT INTO `hj_bank` VALUES ('2', '兴业银行', '马西纳', '15282455745', '', '2018-04-17 15:26:14');
INSERT INTO `hj_bank` VALUES ('3', '招商银行1', '地方', '12584457445', '', '2018-04-17 15:26:14');

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
  PRIMARY KEY (`uId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hj_bank_user
-- ----------------------------
INSERT INTO `hj_bank_user` VALUES ('2', '3', '32424', '2', '32434', '1', '2018-04-17 16:21:59');
INSERT INTO `hj_bank_user` VALUES ('3', '2', '从', '1', '5656', '0', '2018-04-17 16:21:59');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hj_car_parking
-- ----------------------------
INSERT INTO `hj_car_parking` VALUES ('2', '1', '美岸001', '34545', 'upload/car/18-04-19_184520.png', '4545', '154', '0', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '<p>4534535242424</p><p><br></p>', '4534532434', '0', '0', '45566', null);
INSERT INTO `hj_car_parking` VALUES ('3', '1', '34242', '4234242', 'https://img.hengjiyuankeji.com/2018-04-19_21:48:45.jpg', '4234230', '242334242', '23423432', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '<p>4353453535345</p>', '', '2147483647', '4242', '4234320000', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hj_sales_company
-- ----------------------------
INSERT INTO `hj_sales_company` VALUES ('2', '的方式发送', '34535', '', '1', '4455345', '345', '25475734dsfsfs', 'upload/company/18-04-19_112348.jpg', '3453', '5353535', '0', '0', '2018-04-19 11:23:48');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hj_sales_user
-- ----------------------------
INSERT INTO `hj_sales_user` VALUES ('2', '2', '海运费', '2', '19958575', '23424', '4234', 'upload/user/18-04-19_142833.jpg', '200', '0', '2018-04-19 14:28:33');

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
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hj_system_log
-- ----------------------------
INSERT INTO `hj_system_log` VALUES ('1', 'Bank/addBank', '1', '系统创建者', '::1', '1', '新增公告成功,公告内容：342', '2018-04-17 14:36:17');
INSERT INTO `hj_system_log` VALUES ('2', 'Bank/addBank', '1', '系统创建者', '::1', '1', '新增银行成功,银行名称：兴业银行', '2018-04-17 14:51:40');
INSERT INTO `hj_system_log` VALUES ('3', 'Bank/addBank', '1', '系统创建者', '::1', '1', '新增银行成功,银行名称：招商银行', '2018-04-17 14:52:15');
INSERT INTO `hj_system_log` VALUES ('4', 'Bank/editBank', '1', '系统创建者', '::1', '1', '编辑银行成功,银行名称：招商银行1', '2018-04-17 15:08:30');
INSERT INTO `hj_system_log` VALUES ('5', 'Bank/delBank', '1', '系统创建者', '::1', '1', '编辑银行成功,银行名称：', '2018-04-17 15:15:05');
INSERT INTO `hj_system_log` VALUES ('6', 'Bank/delBank', '1', '系统创建者', '::1', '1', '编辑银行成功,银行名称：', '2018-04-17 15:15:21');
INSERT INTO `hj_system_log` VALUES ('7', 'Bank/delBank', '1', '系统创建者', '::1', '1', '删除银行成功,银行编号是：1', '2018-04-17 15:16:38');
INSERT INTO `hj_system_log` VALUES ('8', 'Bank/addBank', '1', '系统创建者', '::1', '1', '新增银行成功,银行名称：', '2018-04-17 15:49:46');
INSERT INTO `hj_system_log` VALUES ('9', 'Bank/delBank', '1', '系统创建者', '::1', '1', '删除银行成功,银行编号是：4', '2018-04-17 15:50:55');
INSERT INTO `hj_system_log` VALUES ('10', 'Bank/addBankUser', '1', '系统创建者', '::1', '1', '新增银行管理人员成功,银行编号是：3,银行管理人员名称是：34', '2018-04-17 16:07:32');
INSERT INTO `hj_system_log` VALUES ('11', 'Bank/addBankUser', '1', '系统创建者', '::1', '1', '新增银行管理人员成功,银行编号是：3,银行管理人员名称是：32424', '2018-04-17 16:10:24');
INSERT INTO `hj_system_log` VALUES ('12', 'Bank/addBankUser', '1', '系统创建者', '::1', '1', '新增银行管理人员成功,银行编号是：2,银行管理人员名称是：456654', '2018-04-17 16:20:09');
INSERT INTO `hj_system_log` VALUES ('13', 'Bank/editBankUser', '1', '系统创建者', '::1', '1', '编辑银行管理人员成功,银行编号是：2,银行管理人员名称是：从', '2018-04-17 17:00:59');
INSERT INTO `hj_system_log` VALUES ('14', 'Bank/delBankUser', '1', '系统创建者', '::1', '1', '删除银行管理人员成功,银行人员编号是：1', '2018-04-17 17:31:08');
INSERT INTO `hj_system_log` VALUES ('15', 'Member/AddCompany', null, null, '::1', '1', '新增公司信息成功,公司名称是46464', '2018-04-18 09:54:54');
INSERT INTO `hj_system_log` VALUES ('16', 'Member/editCompany', null, null, '::1', '1', '新增公司信息成功,公司名称是中原公司', '2018-04-18 10:06:25');
INSERT INTO `hj_system_log` VALUES ('17', 'Member/editCompany', null, null, '::1', '1', '修改公司信息成功,公司名称是中原公司', '2018-04-18 10:07:01');
INSERT INTO `hj_system_log` VALUES ('18', 'Member/editCompany', '1', '系统创建者', '::1', '1', '修改公司信息成功,公司名称是中原公司', '2018-04-18 10:07:53');
INSERT INTO `hj_system_log` VALUES ('19', 'Member/AddCompany', '1', '系统创建者', '::1', '1', '新增公司信息成功,公司名称是123', '2018-04-18 10:10:35');
INSERT INTO `hj_system_log` VALUES ('20', 'Member/delCompany', '1', '系统创建者', '::1', '1', '修改公司信息成功,公司名称是', '2018-04-18 10:10:44');
INSERT INTO `hj_system_log` VALUES ('21', 'Member/AddCompany', '1', '系统创建者', '::1', '1', '新增公司信息成功,公司名称是中原n', '2018-04-18 10:11:39');
INSERT INTO `hj_system_log` VALUES ('22', 'Member/addDepartment', '1', '系统创建者', '::1', '1', '新增部门信息成功,部门名称是cnsk点卡积分', '2018-04-18 10:57:20');
INSERT INTO `hj_system_log` VALUES ('23', 'Member/editDepartment', '1', '系统创建者', '::1', '1', '新增部门信息成功,部门名称是cnsk点卡积分', '2018-04-18 11:16:16');
INSERT INTO `hj_system_log` VALUES ('24', 'Member/editDepartment', '1', '系统创建者', '::1', '1', '新增部门信息成功,部门名称是cnsk点卡积分', '2018-04-18 11:16:16');
INSERT INTO `hj_system_log` VALUES ('25', 'Member/editDepartment', '1', '系统创建者', '::1', '1', '新增部门信息成功,部门名称是cnsk点卡积分', '2018-04-18 11:17:52');
INSERT INTO `hj_system_log` VALUES ('26', 'Member/addDepartment', '1', '系统创建者', '::1', '1', '新增部门信息成功,部门名称是34534', '2018-04-18 11:21:07');
INSERT INTO `hj_system_log` VALUES ('27', 'Member/delDepartment', '1', '系统创建者', '::1', '1', '删除部门信息成功,部门id是2', '2018-04-18 11:21:12');
INSERT INTO `hj_system_log` VALUES ('28', 'Member/AddUser', '1', '系统创建者', '::1', '1', '新增用户信息成功,用户登陆账户是admin12', '2018-04-18 16:14:15');
INSERT INTO `hj_system_log` VALUES ('29', 'Member/EditUser', '1', '系统创建者', '::1', '1', '编辑用户成功,用户id是:2', '2018-04-18 17:10:48');
INSERT INTO `hj_system_log` VALUES ('30', 'Member/EditUser', '1', '系统创建者', '::1', '1', '编辑用户成功,用户id是:2', '2018-04-18 17:11:04');
INSERT INTO `hj_system_log` VALUES ('31', 'Member/delUser', '1', '系统创建者', '::1', '1', '删除用户成功,用户id是:2,用户名称是王姐', '2018-04-18 17:17:14');
INSERT INTO `hj_system_log` VALUES ('32', 'Post/addDevel', '1', '系统创建者', '::1', '1', '新增开发商成功,开发商名称是：包里', '2018-04-18 19:34:59');
INSERT INTO `hj_system_log` VALUES ('33', 'Post/addDevel', '1', '系统创建者', '::1', '1', '新增开发商成功,开发商名称是：测试', '2018-04-18 19:44:03');
INSERT INTO `hj_system_log` VALUES ('34', 'Post/editDevelopers', '1', '系统创建者', '::1', '1', '编辑开发商成功,开发商名称是：包里2,开发商id是：1', '2018-04-19 10:06:44');
INSERT INTO `hj_system_log` VALUES ('35', 'Post/editDevelopers', '1', '系统创建者', '::1', '1', '编辑开发商成功,开发商名称是：包里2,开发商id是：1', '2018-04-19 10:07:46');
INSERT INTO `hj_system_log` VALUES ('36', 'Post/delDevelopers', '1', '系统创建者', '::1', '1', '删除开发商成功,开发商名称是：测试,开发商id是：2', '2018-04-19 10:16:59');
INSERT INTO `hj_system_log` VALUES ('37', 'Post/AddCompany', '1', '系统创建者', '::1', '1', '新增销售公司成功,销售公司名称是：测试而微软', '2018-04-19 10:42:40');
INSERT INTO `hj_system_log` VALUES ('38', 'Post/editCompany', '1', '系统创建者', '::1', '1', '编辑销售公司成功,销售公司名称是：测试而微软', '2018-04-19 11:22:46');
INSERT INTO `hj_system_log` VALUES ('39', 'Post/AddCompany', '1', '系统创建者', '::1', '1', '新增销售公司成功,销售公司名称是：的方式发送', '2018-04-19 11:23:48');
INSERT INTO `hj_system_log` VALUES ('40', 'Post/editCompany', '1', '系统创建者', '::1', '1', '编辑销售公司成功,销售公司名称是：的方式发送', '2018-04-19 11:24:03');
INSERT INTO `hj_system_log` VALUES ('41', 'Post/delCompany', '1', '系统创建者', '::1', '1', '删除销售公司成功,销售公司名称是：测试而微软,开发商id是：1', '2018-04-19 11:31:39');
INSERT INTO `hj_system_log` VALUES ('42', 'Post/addSalesUser', '1', '系统创建者', '::1', '1', '新增销售人员成功,销售公司名称是：2,销售人员名称是：车话', '2018-04-19 13:47:48');
INSERT INTO `hj_system_log` VALUES ('43', 'Post/editSalesUser', '1', '系统创建者', '::1', '1', '新增销售公司成功,销售公司名称是：', '2018-04-19 14:14:12');
INSERT INTO `hj_system_log` VALUES ('44', 'Post/addSalesUser', '1', '系统创建者', '::1', '1', '新增销售人员成功,销售公司名称是：2,销售人员名称是：海运费', '2018-04-19 14:28:33');
INSERT INTO `hj_system_log` VALUES ('45', 'Post/delSalesUser', '1', '系统创建者', '::1', '1', '删除销售人员成功,销售人员id是：1,销售人员名称是：景色', '2018-04-19 14:28:39');
INSERT INTO `hj_system_log` VALUES ('46', 'Post/addHusiness', '1', '系统创建者', '::1', '1', '新增商家成功,商家名称是：恒纪元', '2018-04-19 15:10:38');
INSERT INTO `hj_system_log` VALUES ('47', 'Post/editHusiness', '1', '系统创建者', '::1', '1', '编辑商家成功,商家名称是：恒纪元1,商家id是：', '2018-04-19 15:28:27');
INSERT INTO `hj_system_log` VALUES ('48', 'Post/editHusiness', '1', '系统创建者', '::1', '1', '编辑商家成功,商家名称是：恒纪元1,商家id是：1', '2018-04-19 15:33:27');
INSERT INTO `hj_system_log` VALUES ('49', 'Post/editHusiness', '1', '系统创建者', '::1', '1', '编辑商家成功,商家名称是：恒纪元1,商家id是：1', '2018-04-19 15:36:12');
INSERT INTO `hj_system_log` VALUES ('50', 'Post/addHusiness', '1', '系统创建者', '::1', '1', '新增商家成功,商家名称是：客人', '2018-04-19 15:43:58');
INSERT INTO `hj_system_log` VALUES ('51', 'Post/delHusiness', '1', '系统创建者', '::1', '1', '删除商家成功,商家名称是：恒纪元1,商家id是：1', '2018-04-19 15:44:03');
INSERT INTO `hj_system_log` VALUES ('52', 'Post/addVillage', '1', '系统创建者', '::1', '1', '新增小区信息成功,小区名称是：美年', '2018-04-19 16:57:15');
INSERT INTO `hj_system_log` VALUES ('53', 'Post/editVillage', '1', '系统创建者', '::1', '1', '新增小区信息成功,小区名称是：美年1', '2018-04-19 18:03:48');
INSERT INTO `hj_system_log` VALUES ('54', 'Post/addVillage', '1', '系统创建者', '::1', '1', '新增小区信息成功,小区名称是：3434', '2018-04-19 18:10:26');
INSERT INTO `hj_system_log` VALUES ('55', 'Post/delVillage', '1', '系统创建者', '::1', '1', '删除小区信息成功,小区名称是：3434,小区编号是:2', '2018-04-19 18:10:32');
INSERT INTO `hj_system_log` VALUES ('56', 'Post/addCarPark', '1', '系统创建者', '::1', '1', '新增车位信息成功,车位名称是：', '2018-04-19 18:45:20');
INSERT INTO `hj_system_log` VALUES ('57', 'Post/editCarPark', '1', '系统创建者', '::1', '1', '编辑车位信息成功,车位名称是：美岸001,车位id是：2', '2018-04-19 19:26:48');
INSERT INTO `hj_system_log` VALUES ('58', 'Post/addCarPark', '1', '系统创建者', '::1', '1', '新增车位信息成功,车位名称是：34242', '2018-04-19 21:48:46');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hj_village
-- ----------------------------
INSERT INTO `hj_village` VALUES ('1', '3', '1', '美年1', '撒娇看到那句', '李先生', '2147483647', '2300', '300', '1200', 'upload/village/18-04-19_165715.png', null, '<p>啊啊大大大<img src=\"http://localhost/hjy/upload/news/18-04-19_165713.png\" style=\"font-size: 1.6rem; max-width: 100%;\"></p><p><br></p>', '是的方式的', '1', '130000', null, null, '1', '2018-04-19 18:03:48', '500', '3');
