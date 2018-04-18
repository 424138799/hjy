/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : hengjiyuan

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-04-18 17:19:31
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

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
  `idDel` int(2) DEFAULT '0' COMMENT '是否删除 1是 0否',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hj_business
-- ----------------------------

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hj_developers
-- ----------------------------

-- ----------------------------
-- Table structure for hj_sales_company
-- ----------------------------
DROP TABLE IF EXISTS `hj_sales_company`;
CREATE TABLE `hj_sales_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '销售公司',
  `companyName` varchar(500) DEFAULT NULL COMMENT '公司名称',
  `companyAdress` varchar(500) DEFAULT NULL COMMENT '公司地址',
  `companyInfo` varchar(500) DEFAULT NULL COMMENT '公司简介',
  `uid` int(20) DEFAULT NULL COMMENT '负责人id',
  `linkman` varchar(50) DEFAULT NULL COMMENT '联系人',
  `linkPhone` varchar(50) DEFAULT NULL COMMENT '联系电话',
  `license` varchar(100) DEFAULT NULL COMMENT '营业执照',
  `licensePic` varchar(500) DEFAULT NULL COMMENT '营业执照图片',
  `billing` varchar(100) DEFAULT NULL COMMENT '开票信息',
  `openAccount` varchar(200) DEFAULT NULL COMMENT '开户信息',
  `sort` varchar(10) DEFAULT '200' COMMENT '排序 从小到大排序',
  `isDel` int(2) DEFAULT '0' COMMENT '是否删除  1是 0否',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hj_sales_company
-- ----------------------------

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
  `idDel` int(2) DEFAULT '0' COMMENT '是否删除  1是 0否',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hj_sales_user
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

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
