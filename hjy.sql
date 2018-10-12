/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : hjy

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-10-12 17:32:51
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hj_admin_company
-- ----------------------------
INSERT INTO `hj_admin_company` VALUES ('4', '四川省恒纪元科技有限公司', 'HJY', '恒纪元', '公司', '胡骞兮', '028-67137912', '028-67137912', null, '车位乐总公司-恒纪元', '2018-04-22 15:50:22');
INSERT INTO `hj_admin_company` VALUES ('5', '德阳一里屋房地产营销代理有限责任公司', 'HJY-YLW180503', '一里屋', '分公司', '刘勇', '13890242274', '', null, '恒纪元车位乐德阳一级代理分公司', '2018-04-27 15:36:13');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hj_admin_department
-- ----------------------------
INSERT INTO `hj_admin_department` VALUES ('1', '4', 'HJY-00', '总经办', '总办', '综合性', '1', '18280501533', '028-67137912', '2018-04-18 10:57:20', '负责恒纪元日常运营管理。整个OA系统管控、最高授权指令');
INSERT INTO `hj_admin_department` VALUES ('2', '4', 'HJY-W', '外控部', '行业经理', '营销性', '8', '18683851125', '028-67137912', '2018-04-22 15:51:13', '主要作为甲方代表，与各区县代理（主要为房产营销代理公司）进行业务洽谈与对接。');
INSERT INTO `hj_admin_department` VALUES ('3', '4', 'HJY-W', '外控部', '银行经理', '营销性', '9', '17708355660', '028-67137912', '2018-05-21 19:36:06', '主要作为甲方代表，负责与公司业务需要开展各区县对应的银行进行业务拓展与对接。');
INSERT INTO `hj_admin_department` VALUES ('4', '4', 'HJY-N', '内控部', '办公室主任', '综合性', '10', '15108476479', '028-67137912', '2018-05-21 19:39:56', '负责OA系统财务的管理与发放');
INSERT INTO `hj_admin_department` VALUES ('5', '4', 'HJY-W', '外控部', '客户经理', '营销性', '0', '18755556466', '', '2018-05-29 14:39:56', '');
INSERT INTO `hj_admin_department` VALUES ('7', '5', 'HJY-YLW', '一里屋营销部', '一里屋营销部', '运营', '14', '18981020304', '', '2018-08-04 19:57:42', '负责车位、开发商的整体营销管控');

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
  `type` int(11) DEFAULT '1',
  `createUser` int(10) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hj_admin_user
-- ----------------------------
INSERT INTO `hj_admin_user` VALUES ('1', 'admin', '胡骞兮', '2', '18280501533', '028-67137912', '523957241@qq.com', '1', '4', '0', '总经理', '1', '0000-00-00 00:00:00', '2018-10-12 03:59:56', '负责恒纪元日常运营管理。整个OA系统管控、最高授权指令', 'e10adc3949ba59abbe56e057f20f883e', 'HJY-00', '1', null);
INSERT INTO `hj_admin_user` VALUES ('3', '18280420231', '王茹', '2', '18280420231', '028-67137912', '411432935@qq.com', '11', '4', '0', '028-67137912', '1', '2018-04-23 17:23:11', null, '负责OA系统上薪资的管理与发放', '7459ca564288fca8cb553f15455e3260', 'HJY-C', '1', null);
INSERT INTO `hj_admin_user` VALUES ('5', '13890242274', '刘勇', '1', '13890242274', '13890242274', '182430723@qq.com', '6', '5', '0', '总经理', '1', '2018-04-27 15:39:41', '2018-09-18 05:24:51', '负责德阳一里屋分公司的运营，一里屋OA系统分支的管控及指令', '8c7fdd43b0cfdabbc8d230747880fb7e', 'HJY-YLW180503', '1', null);
INSERT INTO `hj_admin_user` VALUES ('6', '13890260176', '代敏', '1', '13890260176', '13890260176', '2631649556@qq.com', '5', '5', '0', '13890260176', '1', '2018-04-27 15:41:01', '2018-06-07 10:52:20', '负责德阳地区开发商的对接及OA系统上相对应的管控', 'd7d68f2db8a59ac2bc40333f89bf7ad2', 'HJY-YLW180503', '1', null);
INSERT INTO `hj_admin_user` VALUES ('9', '17708355660', '何林玥', '2', '17708355660', '028-67137912', '349297177@qq.com', '9', '4', '3', '028-67137912', '1', '2018-05-21 19:33:45', '2018-06-01 20:46:01', '主要作为甲方代表，负责与公司业务需要开展各区县对应的银行进行业务拓展与对接。', '341306eb0f693978879b9636ea427fcd', 'HJY-WY', '1', null);
INSERT INTO `hj_admin_user` VALUES ('10', '蓝敏', '蓝敏', '2', '15108476479', '02867137912', '1187152356@qq.com', '16', '4', '4', '02867137912', '1', '2018-06-04 15:18:02', '2018-10-12 03:45:58', '', '47b7517a229ae4e0324f1a2a74e703b5', 'HJY-蓝敏', '1', null);
INSERT INTO `hj_admin_user` VALUES ('12', '蒋武', '蒋武', '1', '18908361805', '028－67137912', 'jw@stablera.com', '10', '4', '5', '客户经理', '1', '2018-07-11 16:57:32', '2018-09-21 11:36:01', '主要作为甲方代表，与各区县代理（主要为房产营销代理公司）进行业务洽谈与对接。	', 'e10adc3949ba59abbe56e057f20f883e', 'HJY-WK', '1', '10');
INSERT INTO `hj_admin_user` VALUES ('13', '曾伟', '曾伟', '1', '13419006688', '028－67137912', 'zengwei@stablera.com', '10', '4', '5', '客户经理', '1', '2018-07-24 02:50:36', null, '主要作为甲方代表，与各区县代理（主要为房产营销代理公司）进行业务洽谈与对接。	', 'e10adc3949ba59abbe56e057f20f883e', 'HJY-WK', '1', '10');
INSERT INTO `hj_admin_user` VALUES ('14', '刘加强', '刘加强', '1', '18981020304', '18981020304', '86731367@qq.com', '5', '5', '7', '营销总监', '1', '2018-08-04 19:27:15', '2018-10-04 13:10:52', '负责德阳地区开发商的对接及OA系统上相对应的管控', 'e10adc3949ba59abbe56e057f20f883e', 'HJY-YLW180808', '1', '10');
INSERT INTO `hj_admin_user` VALUES ('17', '谌礼俊', '谌礼俊', '1', '13980073227', '13980073227', '284553323@qq.com', '10', '4', '5', '', '1', '2018-08-15 10:40:16', '2018-10-12 03:38:23', '', 'e10adc3949ba59abbe56e057f20f883e', 'HJY-WK', '1', '10');
INSERT INTO `hj_admin_user` VALUES ('18', '13551555068', '黎钟营', '1', '13551555068', '', '', '10', '4', '5', '', '1', '2018-10-11 17:10:32', '2018-10-11 11:11:19', '', 'e10adc3949ba59abbe56e057f20f883e', 'KJY-NK', '1', '10');
INSERT INTO `hj_admin_user` VALUES ('19', 'admin123', 'hiyang', null, null, null, null, '1', null, null, null, '1', '2018-10-12 11:59:15', '2018-10-12 07:24:02', null, 'e10adc3949ba59abbe56e057f20f883e', null, '1', null);

-- ----------------------------
-- Table structure for hj_admin_user_group
-- ----------------------------
DROP TABLE IF EXISTS `hj_admin_user_group`;
CREATE TABLE `hj_admin_user_group` (
  `gid` int(10) NOT NULL AUTO_INCREMENT COMMENT '管理用户组',
  `groupName` varchar(30) DEFAULT NULL COMMENT '用户组名称',
  `perm` text COMMENT '权限',
  `user_power` text NOT NULL,
  `addtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `status` int(1) DEFAULT '1' COMMENT '用户组状态1正常0冻结不能登陆',
  `pId` int(10) DEFAULT '0',
  PRIMARY KEY (`gid`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hj_admin_user_group
-- ----------------------------
INSERT INTO `hj_admin_user_group` VALUES ('1', '超级管理员-胡骞兮', '{\"1\":{\"value\":{\"id\":\"1\",\"name\":\"\\u57fa\\u7840\\u8d44\\u6599\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":null,\"url\":\"member\",\"style\":null,\"other\":null,\"lev\":1,\"chick\":[{\"id\":\"15\",\"name\":\"\\u516c\\u53f8\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"1\",\"addtime\":null,\"url\":\"Member\\/company\",\"style\":null,\"other\":\"company\",\"lev\":2},{\"id\":\"16\",\"name\":\"\\u90e8\\u95e8\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"1\",\"addtime\":null,\"url\":\"Member\\/department\",\"style\":null,\"other\":\"department\",\"lev\":2},{\"id\":\"17\",\"name\":\"\\u7528\\u6237\\u7ec4\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"1\",\"addtime\":null,\"url\":\"Member\\/group\",\"style\":null,\"other\":\"group\",\"lev\":2},{\"id\":\"18\",\"name\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"1\",\"addtime\":null,\"url\":\"Member\\/adminUser\",\"style\":null,\"other\":\"adminUser\",\"lev\":2}]}},\"2\":{\"value\":{\"id\":\"2\",\"name\":\"\\u5c0f\\u533a\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":null,\"url\":\"village\",\"style\":\"\",\"other\":null,\"lev\":1,\"chick\":[{\"id\":\"5\",\"name\":\"\\u94f6\\u884c\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Bank\\/bankList\",\"style\":null,\"other\":\"bankList\",\"lev\":2},{\"id\":\"6\",\"name\":\"\\u94f6\\u884c\\u4eba\\u5458\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Bank\\/bankPersonnel\",\"style\":null,\"other\":\"bankPersonnel\",\"lev\":2},{\"id\":\"7\",\"name\":\"\\u5f00\\u53d1\\u5546\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Post\\/developers\",\"style\":null,\"other\":\"developers\",\"lev\":2},{\"id\":\"8\",\"name\":\"\\u9500\\u552e\\u516c\\u53f8\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Post\\/salesCompany\",\"style\":null,\"other\":\"salesCompany\",\"lev\":2},{\"id\":\"9\",\"name\":\"\\u9500\\u552e\\u4eba\\u5458\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Post\\/salesUser\",\"style\":null,\"other\":\"salesUser\",\"lev\":2},{\"id\":\"10\",\"name\":\"\\u5546\\u5bb6\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Post\\/business\",\"style\":null,\"other\":\"business\",\"lev\":2},{\"id\":\"11\",\"name\":\"\\u5c0f\\u533a\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Post\\/village\",\"style\":null,\"other\":\"village\",\"lev\":2},{\"id\":\"12\",\"name\":\"\\u8f66\\u4f4d\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Post\\/carPark\",\"style\":null,\"other\":\"carPark\",\"lev\":2}]}},\"3\":{\"value\":{\"id\":\"3\",\"name\":\"\\u6309\\u63ed\\u7533\\u8bf7\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":null,\"url\":\"Mortgage\\/applyList\",\"style\":\"am-icon-calendar\",\"other\":\"applyList\",\"lev\":1}},\"4\":{\"value\":{\"id\":\"4\",\"name\":\"\\u8d22\\u52a1\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":null,\"url\":\"finance\",\"style\":null,\"other\":null,\"lev\":1,\"chick\":[{\"id\":\"13\",\"name\":\"\\u4e1a\\u52a1\\u63d0\\u6210\",\"status\":\"1\",\"pid\":\"4\",\"addtime\":null,\"url\":\"Mortgage\\/commision\",\"style\":null,\"other\":\"commision\",\"lev\":2},{\"id\":\"14\",\"name\":\"\\u5c0f\\u533a\\u63d0\\u6210\",\"status\":\"1\",\"pid\":\"4\",\"addtime\":null,\"url\":\"Mortgage\\/villageCommision\",\"style\":null,\"other\":\"villageCommision\",\"lev\":2},{\"id\":\"22\",\"name\":\"\\u63d0\\u73b0\\u8bb0\\u5f55\",\"status\":\"1\",\"pid\":\"4\",\"addtime\":null,\"url\":\"Mortgage\\/putForward\",\"style\":null,\"other\":\"putForward\",\"lev\":2}]}},\"21\":{\"value\":{\"id\":\"21\",\"name\":\"\\u7cfb\\u7edf\\u8bbe\\u7f6e\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":null,\"url\":\"system\",\"style\":null,\"other\":null,\"lev\":1,\"chick\":[{\"id\":\"19\",\"name\":\"\\u5c0f\\u7a0b\\u5e8fbanner\",\"status\":\"1\",\"pid\":\"21\",\"addtime\":null,\"url\":\"Home\\/bannerList\",\"style\":null,\"other\":\"bannerList\",\"lev\":2},{\"id\":\"20\",\"name\":\"\\u7cfb\\u7edf\\u65e5\\u5fd7\",\"status\":\"1\",\"pid\":\"21\",\"addtime\":null,\"url\":\"Home\\/systemLog\",\"style\":null,\"other\":\"systemLog\",\"lev\":2}]}}}', '[{\"id\":\"1\",\"name\":\"\\u57fa\\u7840\\u8d44\\u6599\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":null,\"url\":\"member\",\"style\":null,\"other\":null,\"lev\":1},{\"id\":\"15\",\"name\":\"\\u516c\\u53f8\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"1\",\"addtime\":null,\"url\":\"Member\\/company\",\"style\":null,\"other\":\"company\",\"lev\":2},{\"id\":\"23\",\"name\":\"\\u65b0\\u589e\\u516c\\u53f8\",\"status\":\"0\",\"pid\":\"15\",\"addtime\":null,\"url\":\"Member\\/AddCompany\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"24\",\"name\":\"\\u7f16\\u8f91\\u516c\\u53f8\",\"status\":\"0\",\"pid\":\"15\",\"addtime\":null,\"url\":\"Member\\/editCompany\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"25\",\"name\":\"\\u5220\\u9664\\u516c\\u53f8\",\"status\":\"0\",\"pid\":\"15\",\"addtime\":null,\"url\":\"Member\\/delCompany\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"16\",\"name\":\"\\u90e8\\u95e8\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"1\",\"addtime\":null,\"url\":\"Member\\/department\",\"style\":null,\"other\":\"department\",\"lev\":2},{\"id\":\"26\",\"name\":\"\\u65b0\\u589e\\u90e8\\u95e8\",\"status\":\"0\",\"pid\":\"16\",\"addtime\":null,\"url\":\"Member\\/addDepartment\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"27\",\"name\":\"\\u7f16\\u8f91\\u90e8\\u95e8\",\"status\":\"0\",\"pid\":\"16\",\"addtime\":null,\"url\":\"Member\\/editDepartment\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"28\",\"name\":\"\\u5220\\u9664\\u90e8\\u95e8\",\"status\":\"0\",\"pid\":\"16\",\"addtime\":null,\"url\":\"Member\\/delDepartment\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"17\",\"name\":\"\\u7528\\u6237\\u7ec4\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"1\",\"addtime\":null,\"url\":\"Member\\/group\",\"style\":null,\"other\":\"group\",\"lev\":2},{\"id\":\"29\",\"name\":\"\\u65b0\\u589e\\u7528\\u6237\\u7ec4\",\"status\":\"0\",\"pid\":\"17\",\"addtime\":null,\"url\":\"Member\\/addGroup\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"30\",\"name\":\"\\u7f16\\u8f91\\u7528\\u6237\\u7ec4\",\"status\":\"0\",\"pid\":\"17\",\"addtime\":null,\"url\":\"Member\\/editGroup\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"31\",\"name\":\"\\u5220\\u9664\\u7528\\u6237\\u7ec4\",\"status\":\"0\",\"pid\":\"17\",\"addtime\":null,\"url\":\"Member\\/delGroup\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"35\",\"name\":\"\\u5206\\u914d\\u6743\\u9650\",\"status\":\"0\",\"pid\":\"17\",\"addtime\":null,\"url\":\"Member\\/GroupJurisdiction\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"63\",\"name\":\"\\u4fee\\u6539\\u6743\\u9650\",\"status\":\"0\",\"pid\":\"17\",\"addtime\":null,\"url\":\"Member\\/editJurisdiction\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"18\",\"name\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"1\",\"addtime\":null,\"url\":\"Member\\/adminUser\",\"style\":null,\"other\":\"adminUser\",\"lev\":2},{\"id\":\"32\",\"name\":\"\\u65b0\\u589e\\u7528\\u6237\",\"status\":\"0\",\"pid\":\"18\",\"addtime\":null,\"url\":\"Member\\/AddUser\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"33\",\"name\":\"\\u7f16\\u8f91\\u7528\\u6237\",\"status\":\"0\",\"pid\":\"18\",\"addtime\":null,\"url\":\"Member\\/EditUser\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"34\",\"name\":\"\\u5220\\u9664\\u7528\\u6237\",\"status\":\"0\",\"pid\":\"18\",\"addtime\":null,\"url\":\"Member\\/DelUser\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"2\",\"name\":\"\\u5c0f\\u533a\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":null,\"url\":\"village\",\"style\":\"\",\"other\":null,\"lev\":1},{\"id\":\"5\",\"name\":\"\\u94f6\\u884c\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Bank\\/bankList\",\"style\":null,\"other\":\"bankList\",\"lev\":2},{\"id\":\"36\",\"name\":\"\\u65b0\\u589e\\u94f6\\u884c\",\"status\":\"0\",\"pid\":\"5\",\"addtime\":null,\"url\":\"Bank\\/addBank\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"37\",\"name\":\"\\u7f16\\u8f91\\u94f6\\u884c\",\"status\":\"0\",\"pid\":\"5\",\"addtime\":null,\"url\":\"Bank\\/editBank\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"38\",\"name\":\"\\u5220\\u9664\\u94f6\\u884c\",\"status\":\"0\",\"pid\":\"5\",\"addtime\":null,\"url\":\"Bank\\/delBank\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"6\",\"name\":\"\\u94f6\\u884c\\u4eba\\u5458\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Bank\\/bankPersonnel\",\"style\":null,\"other\":\"bankPersonnel\",\"lev\":2},{\"id\":\"39\",\"name\":\"\\u65b0\\u589e\\u94f6\\u884c\\u4eba\\u5458\",\"status\":\"0\",\"pid\":\"6\",\"addtime\":null,\"url\":\"Bank\\/addBankUser\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"40\",\"name\":\"\\u7f16\\u8f91\\u94f6\\u884c\\u4eba\\u5458\",\"status\":\"0\",\"pid\":\"6\",\"addtime\":null,\"url\":\"Bank\\/editBankUser\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"41\",\"name\":\"\\u5220\\u9664\\u94f6\\u884c\\u4eba\\u5458\",\"status\":\"0\",\"pid\":\"6\",\"addtime\":null,\"url\":\"Bank\\/delBankUser\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"7\",\"name\":\"\\u5f00\\u53d1\\u5546\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Post\\/developers\",\"style\":null,\"other\":\"developers\",\"lev\":2},{\"id\":\"42\",\"name\":\"\\u65b0\\u589e\\u5f00\\u53d1\\u5546\",\"status\":\"0\",\"pid\":\"7\",\"addtime\":null,\"url\":\"Post\\/addDevel\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"43\",\"name\":\"\\u7f16\\u8f91\\u5f00\\u53d1\\u5546\",\"status\":\"0\",\"pid\":\"7\",\"addtime\":null,\"url\":\"Post\\/editDevel\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"44\",\"name\":\"\\u5220\\u9664\\u5f00\\u53d1\\u5546\",\"status\":\"0\",\"pid\":\"7\",\"addtime\":null,\"url\":\"Post\\/delDevel\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"8\",\"name\":\"\\u9500\\u552e\\u516c\\u53f8\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Post\\/salesCompany\",\"style\":null,\"other\":\"salesCompany\",\"lev\":2},{\"id\":\"45\",\"name\":\"\\u65b0\\u589e\\u9500\\u552e\\u516c\\u53f8\",\"status\":\"0\",\"pid\":\"8\",\"addtime\":null,\"url\":\"Post\\/AddCompany\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"46\",\"name\":\"\\u7f16\\u8f91\\u9500\\u552e\\u516c\\u53f8\",\"status\":\"0\",\"pid\":\"8\",\"addtime\":null,\"url\":\"Post\\/editCompany\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"47\",\"name\":\"\\u5220\\u9664\\u9500\\u552e\\u516c\\u53f8\",\"status\":\"0\",\"pid\":\"8\",\"addtime\":null,\"url\":\"Post\\/delCompany\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"9\",\"name\":\"\\u9500\\u552e\\u4eba\\u5458\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Post\\/salesUser\",\"style\":null,\"other\":\"salesUser\",\"lev\":2},{\"id\":\"48\",\"name\":\"\\u65b0\\u589e\\u9500\\u552e\\u4eba\\u5458\",\"status\":\"0\",\"pid\":\"9\",\"addtime\":null,\"url\":\"Post\\/addSalesUser\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"49\",\"name\":\"\\u7f16\\u8f91\\u9500\\u552e\\u4eba\\u5458\",\"status\":\"0\",\"pid\":\"9\",\"addtime\":null,\"url\":\"Post\\/editSalesUser\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"50\",\"name\":\"\\u5220\\u9664\\u9500\\u552e\\u4eba\\u5458\",\"status\":\"0\",\"pid\":\"9\",\"addtime\":null,\"url\":\"Post\\/delSalesUser\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"10\",\"name\":\"\\u5546\\u5bb6\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Post\\/business\",\"style\":null,\"other\":\"business\",\"lev\":2},{\"id\":\"51\",\"name\":\"\\u65b0\\u589e\\u5546\\u5bb6\",\"status\":\"0\",\"pid\":\"10\",\"addtime\":null,\"url\":\"Post\\/addHusiness\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"52\",\"name\":\"\\u7f16\\u8f91\\u5546\\u5bb6\",\"status\":\"0\",\"pid\":\"10\",\"addtime\":null,\"url\":\"Post\\/editHusiness\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"53\",\"name\":\"\\u5220\\u9664\\u5546\\u5bb6\",\"status\":\"0\",\"pid\":\"10\",\"addtime\":null,\"url\":\"Post\\/delHusiness\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"11\",\"name\":\"\\u5c0f\\u533a\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Post\\/village\",\"style\":null,\"other\":\"village\",\"lev\":2},{\"id\":\"54\",\"name\":\"\\u65b0\\u589e\\u5c0f\\u533a\\u4fe1\\u606f\",\"status\":\"0\",\"pid\":\"11\",\"addtime\":null,\"url\":\"Post\\/addVillage\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"55\",\"name\":\"\\u7f16\\u8f91\\u5c0f\\u533a\\u4fe1\\u606f\",\"status\":\"0\",\"pid\":\"11\",\"addtime\":null,\"url\":\"Post\\/editVillage\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"56\",\"name\":\"\\u5220\\u9664\\u5c0f\\u533a\\u4fe1\\u606f\",\"status\":\"0\",\"pid\":\"11\",\"addtime\":null,\"url\":\"Post\\/delVillage\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"12\",\"name\":\"\\u8f66\\u4f4d\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Post\\/carPark\",\"style\":null,\"other\":\"carPark\",\"lev\":2},{\"id\":\"57\",\"name\":\"\\u65b0\\u589e\\u8f66\\u4f4d\\u4fe1\\u606f\",\"status\":\"0\",\"pid\":\"12\",\"addtime\":null,\"url\":\"Post\\/addCarPark\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"58\",\"name\":\"\\u7f16\\u8f91\\u8f66\\u4f4d\\u4fe1\\u606f\",\"status\":\"0\",\"pid\":\"12\",\"addtime\":null,\"url\":\"Post\\/editCarPark\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"59\",\"name\":\"\\u5220\\u9664\\u8f66\\u4f4d\\u4fe1\\u606f\",\"status\":\"0\",\"pid\":\"12\",\"addtime\":null,\"url\":\"Post\\/delCarPark\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"3\",\"name\":\"\\u6309\\u63ed\\u7533\\u8bf7\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":null,\"url\":\"Mortgage\\/applyList\",\"style\":\"am-icon-calendar\",\"other\":\"applyList\",\"lev\":1},{\"id\":\"60\",\"name\":\"\\u5220\\u9664\\u6309\\u63ed\\u7533\\u8bf7\\u4fe1\\u606f\",\"status\":\"0\",\"pid\":\"3\",\"addtime\":null,\"url\":\"Mortgage\\/delApply\",\"style\":null,\"other\":null,\"lev\":2},{\"id\":\"61\",\"name\":\"\\u5bfc\\u51fa\\u6309\\u63ed\\u7533\\u8bf7\\u4fe1\\u606f\",\"status\":\"0\",\"pid\":\"3\",\"addtime\":null,\"url\":\"Mortgage\\/downApply\",\"style\":null,\"other\":null,\"lev\":2},{\"id\":\"4\",\"name\":\"\\u8d22\\u52a1\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":null,\"url\":\"finance\",\"style\":null,\"other\":null,\"lev\":1},{\"id\":\"13\",\"name\":\"\\u4e1a\\u52a1\\u63d0\\u6210\",\"status\":\"1\",\"pid\":\"4\",\"addtime\":null,\"url\":\"Mortgage\\/commision\",\"style\":null,\"other\":\"commision\",\"lev\":2},{\"id\":\"14\",\"name\":\"\\u5c0f\\u533a\\u63d0\\u6210\",\"status\":\"1\",\"pid\":\"4\",\"addtime\":null,\"url\":\"Mortgage\\/villageCommision\",\"style\":null,\"other\":\"villageCommision\",\"lev\":2},{\"id\":\"22\",\"name\":\"\\u63d0\\u73b0\\u8bb0\\u5f55\",\"status\":\"1\",\"pid\":\"4\",\"addtime\":null,\"url\":\"Mortgage\\/putForward\",\"style\":null,\"other\":\"putForward\",\"lev\":2},{\"id\":\"21\",\"name\":\"\\u7cfb\\u7edf\\u8bbe\\u7f6e\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":null,\"url\":\"system\",\"style\":null,\"other\":null,\"lev\":1},{\"id\":\"19\",\"name\":\"\\u5c0f\\u7a0b\\u5e8fbanner\",\"status\":\"1\",\"pid\":\"21\",\"addtime\":null,\"url\":\"Home\\/bannerList\",\"style\":null,\"other\":\"bannerList\",\"lev\":2},{\"id\":\"20\",\"name\":\"\\u7cfb\\u7edf\\u65e5\\u5fd7\",\"status\":\"1\",\"pid\":\"21\",\"addtime\":null,\"url\":\"Home\\/systemLog\",\"style\":null,\"other\":\"systemLog\",\"lev\":2},{\"id\":\"62\",\"name\":\"\\u9996\\u9875\",\"status\":\"0\",\"pid\":\"0\",\"addtime\":null,\"url\":\"Home\\/index\",\"style\":null,\"other\":null,\"lev\":1}]', '2018-04-17 09:57:25', '1', '0');
INSERT INTO `hj_admin_user_group` VALUES ('5', '一里屋-销售主管', '{\"2\":{\"value\":{\"id\":\"2\",\"name\":\"\\u5c0f\\u533a\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":null,\"url\":\"village\",\"style\":\"\",\"other\":null,\"lev\":1,\"chick\":[{\"id\":\"7\",\"name\":\"\\u5f00\\u53d1\\u5546\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Post\\/developers\",\"style\":null,\"other\":\"developers\",\"lev\":2},{\"id\":\"11\",\"name\":\"\\u5c0f\\u533a\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Post\\/village\",\"style\":null,\"other\":\"village\",\"lev\":2},{\"id\":\"12\",\"name\":\"\\u8f66\\u4f4d\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Post\\/carPark\",\"style\":null,\"other\":\"carPark\",\"lev\":2}]}},\"3\":{\"value\":{\"id\":\"3\",\"name\":\"\\u6309\\u63ed\\u7533\\u8bf7\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":null,\"url\":\"Mortgage\\/applyList\",\"style\":\"am-icon-calendar\",\"other\":\"applyList\",\"lev\":1}}}', '[{\"id\":\"2\",\"name\":\"\\u5c0f\\u533a\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":null,\"url\":\"village\",\"style\":\"\",\"other\":null,\"lev\":1},{\"id\":\"7\",\"name\":\"\\u5f00\\u53d1\\u5546\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Post\\/developers\",\"style\":null,\"other\":\"developers\",\"lev\":2},{\"id\":\"42\",\"name\":\"\\u65b0\\u589e\\u5f00\\u53d1\\u5546\",\"status\":\"0\",\"pid\":\"7\",\"addtime\":null,\"url\":\"Post\\/addDevel\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"43\",\"name\":\"\\u7f16\\u8f91\\u5f00\\u53d1\\u5546\",\"status\":\"0\",\"pid\":\"7\",\"addtime\":null,\"url\":\"Post\\/editDevel\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"44\",\"name\":\"\\u5220\\u9664\\u5f00\\u53d1\\u5546\",\"status\":\"0\",\"pid\":\"7\",\"addtime\":null,\"url\":\"Post\\/delDevel\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"11\",\"name\":\"\\u5c0f\\u533a\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Post\\/village\",\"style\":null,\"other\":\"village\",\"lev\":2},{\"id\":\"54\",\"name\":\"\\u65b0\\u589e\\u5c0f\\u533a\\u4fe1\\u606f\",\"status\":\"0\",\"pid\":\"11\",\"addtime\":null,\"url\":\"Post\\/addVillage\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"55\",\"name\":\"\\u7f16\\u8f91\\u5c0f\\u533a\\u4fe1\\u606f\",\"status\":\"0\",\"pid\":\"11\",\"addtime\":null,\"url\":\"Post\\/editVillage\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"56\",\"name\":\"\\u5220\\u9664\\u5c0f\\u533a\\u4fe1\\u606f\",\"status\":\"0\",\"pid\":\"11\",\"addtime\":null,\"url\":\"Post\\/delVillage\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"12\",\"name\":\"\\u8f66\\u4f4d\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Post\\/carPark\",\"style\":null,\"other\":\"carPark\",\"lev\":2},{\"id\":\"57\",\"name\":\"\\u65b0\\u589e\\u8f66\\u4f4d\\u4fe1\\u606f\",\"status\":\"0\",\"pid\":\"12\",\"addtime\":null,\"url\":\"Post\\/addCarPark\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"58\",\"name\":\"\\u7f16\\u8f91\\u8f66\\u4f4d\\u4fe1\\u606f\",\"status\":\"0\",\"pid\":\"12\",\"addtime\":null,\"url\":\"Post\\/editCarPark\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"59\",\"name\":\"\\u5220\\u9664\\u8f66\\u4f4d\\u4fe1\\u606f\",\"status\":\"0\",\"pid\":\"12\",\"addtime\":null,\"url\":\"Post\\/delCarPark\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"3\",\"name\":\"\\u6309\\u63ed\\u7533\\u8bf7\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":null,\"url\":\"Mortgage\\/applyList\",\"style\":\"am-icon-calendar\",\"other\":\"applyList\",\"lev\":1},{\"id\":\"61\",\"name\":\"\\u5bfc\\u51fa\\u6309\\u63ed\\u7533\\u8bf7\\u4fe1\\u606f\",\"status\":\"0\",\"pid\":\"3\",\"addtime\":null,\"url\":\"Mortgage\\/downApply\",\"style\":null,\"other\":null,\"lev\":2},{\"id\":\"62\",\"name\":\"\\u9996\\u9875\",\"status\":\"0\",\"pid\":\"0\",\"addtime\":null,\"url\":\"Home\\/index\",\"style\":null,\"other\":null,\"lev\":1}]', '2018-04-24 17:33:50', '1', '0');
INSERT INTO `hj_admin_user_group` VALUES ('6', '一里屋-负责人', '{\"2\":{\"value\":{\"id\":\"2\",\"name\":\"\\u5c0f\\u533a\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":null,\"url\":\"village\",\"style\":\"\",\"other\":null,\"lev\":1,\"chick\":[{\"id\":\"7\",\"name\":\"\\u5f00\\u53d1\\u5546\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Post\\/developers\",\"style\":null,\"other\":\"developers\",\"lev\":2},{\"id\":\"10\",\"name\":\"\\u5546\\u5bb6\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Post\\/business\",\"style\":null,\"other\":\"business\",\"lev\":2},{\"id\":\"11\",\"name\":\"\\u5c0f\\u533a\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Post\\/village\",\"style\":null,\"other\":\"village\",\"lev\":2},{\"id\":\"12\",\"name\":\"\\u8f66\\u4f4d\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Post\\/carPark\",\"style\":null,\"other\":\"carPark\",\"lev\":2}]}},\"3\":{\"value\":{\"id\":\"3\",\"name\":\"\\u6309\\u63ed\\u7533\\u8bf7\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":null,\"url\":\"Mortgage\\/applyList\",\"style\":\"am-icon-calendar\",\"other\":\"applyList\",\"lev\":1}}}', '[{\"id\":\"2\",\"name\":\"\\u5c0f\\u533a\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":null,\"url\":\"village\",\"style\":\"\",\"other\":null,\"lev\":1},{\"id\":\"7\",\"name\":\"\\u5f00\\u53d1\\u5546\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Post\\/developers\",\"style\":null,\"other\":\"developers\",\"lev\":2},{\"id\":\"42\",\"name\":\"\\u65b0\\u589e\\u5f00\\u53d1\\u5546\",\"status\":\"0\",\"pid\":\"7\",\"addtime\":null,\"url\":\"Post\\/addDevel\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"43\",\"name\":\"\\u7f16\\u8f91\\u5f00\\u53d1\\u5546\",\"status\":\"0\",\"pid\":\"7\",\"addtime\":null,\"url\":\"Post\\/editDevel\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"44\",\"name\":\"\\u5220\\u9664\\u5f00\\u53d1\\u5546\",\"status\":\"0\",\"pid\":\"7\",\"addtime\":null,\"url\":\"Post\\/delDevel\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"10\",\"name\":\"\\u5546\\u5bb6\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Post\\/business\",\"style\":null,\"other\":\"business\",\"lev\":2},{\"id\":\"51\",\"name\":\"\\u65b0\\u589e\\u5546\\u5bb6\",\"status\":\"0\",\"pid\":\"10\",\"addtime\":null,\"url\":\"Post\\/addHusiness\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"52\",\"name\":\"\\u7f16\\u8f91\\u5546\\u5bb6\",\"status\":\"0\",\"pid\":\"10\",\"addtime\":null,\"url\":\"Post\\/editHusiness\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"53\",\"name\":\"\\u5220\\u9664\\u5546\\u5bb6\",\"status\":\"0\",\"pid\":\"10\",\"addtime\":null,\"url\":\"Post\\/delHusiness\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"11\",\"name\":\"\\u5c0f\\u533a\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Post\\/village\",\"style\":null,\"other\":\"village\",\"lev\":2},{\"id\":\"54\",\"name\":\"\\u65b0\\u589e\\u5c0f\\u533a\\u4fe1\\u606f\",\"status\":\"0\",\"pid\":\"11\",\"addtime\":null,\"url\":\"Post\\/addVillage\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"55\",\"name\":\"\\u7f16\\u8f91\\u5c0f\\u533a\\u4fe1\\u606f\",\"status\":\"0\",\"pid\":\"11\",\"addtime\":null,\"url\":\"Post\\/editVillage\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"56\",\"name\":\"\\u5220\\u9664\\u5c0f\\u533a\\u4fe1\\u606f\",\"status\":\"0\",\"pid\":\"11\",\"addtime\":null,\"url\":\"Post\\/delVillage\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"12\",\"name\":\"\\u8f66\\u4f4d\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Post\\/carPark\",\"style\":null,\"other\":\"carPark\",\"lev\":2},{\"id\":\"57\",\"name\":\"\\u65b0\\u589e\\u8f66\\u4f4d\\u4fe1\\u606f\",\"status\":\"0\",\"pid\":\"12\",\"addtime\":null,\"url\":\"Post\\/addCarPark\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"58\",\"name\":\"\\u7f16\\u8f91\\u8f66\\u4f4d\\u4fe1\\u606f\",\"status\":\"0\",\"pid\":\"12\",\"addtime\":null,\"url\":\"Post\\/editCarPark\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"59\",\"name\":\"\\u5220\\u9664\\u8f66\\u4f4d\\u4fe1\\u606f\",\"status\":\"0\",\"pid\":\"12\",\"addtime\":null,\"url\":\"Post\\/delCarPark\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"3\",\"name\":\"\\u6309\\u63ed\\u7533\\u8bf7\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":null,\"url\":\"Mortgage\\/applyList\",\"style\":\"am-icon-calendar\",\"other\":\"applyList\",\"lev\":1},{\"id\":\"61\",\"name\":\"\\u5bfc\\u51fa\\u6309\\u63ed\\u7533\\u8bf7\\u4fe1\\u606f\",\"status\":\"0\",\"pid\":\"3\",\"addtime\":null,\"url\":\"Mortgage\\/downApply\",\"style\":null,\"other\":null,\"lev\":2},{\"id\":\"62\",\"name\":\"\\u9996\\u9875\",\"status\":\"0\",\"pid\":\"0\",\"addtime\":null,\"url\":\"Home\\/index\",\"style\":null,\"other\":null,\"lev\":1}]', '2018-04-27 15:37:29', '1', '0');
INSERT INTO `hj_admin_user_group` VALUES ('7', '一里屋-客户经理', '{\"1\":{\"value\":{\"id\":\"1\",\"name\":\"\\u57fa\\u7840\\u8d44\\u6599\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":null,\"url\":\"member\",\"style\":null,\"other\":null,\"lev\":1}},\"2\":{\"value\":{\"id\":\"2\",\"name\":\"\\u5c0f\\u533a\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":null,\"url\":\"village\",\"style\":\"\",\"other\":null,\"lev\":1,\"chick\":[{\"id\":\"9\",\"name\":\"\\u9500\\u552e\\u4eba\\u5458\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Post\\/salesUser\",\"style\":null,\"other\":\"salesUser\",\"lev\":2},{\"id\":\"11\",\"name\":\"\\u5c0f\\u533a\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Post\\/village\",\"style\":null,\"other\":\"village\",\"lev\":2},{\"id\":\"12\",\"name\":\"\\u8f66\\u4f4d\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Post\\/carPark\",\"style\":null,\"other\":\"carPark\",\"lev\":2}]}},\"3\":{\"value\":{\"id\":\"3\",\"name\":\"\\u6309\\u63ed\\u7533\\u8bf7\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":null,\"url\":\"Mortgage\\/applyList\",\"style\":\"am-icon-calendar\",\"other\":\"applyList\",\"lev\":1}}}', '[{\"id\":\"1\",\"name\":\"\\u57fa\\u7840\\u8d44\\u6599\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":null,\"url\":\"member\",\"style\":null,\"other\":null,\"lev\":1},{\"id\":\"2\",\"name\":\"\\u5c0f\\u533a\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":null,\"url\":\"village\",\"style\":\"\",\"other\":null,\"lev\":1},{\"id\":\"9\",\"name\":\"\\u9500\\u552e\\u4eba\\u5458\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Post\\/salesUser\",\"style\":null,\"other\":\"salesUser\",\"lev\":2},{\"id\":\"48\",\"name\":\"\\u65b0\\u589e\\u9500\\u552e\\u4eba\\u5458\",\"status\":\"0\",\"pid\":\"9\",\"addtime\":null,\"url\":\"Post\\/addSalesUser\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"49\",\"name\":\"\\u7f16\\u8f91\\u9500\\u552e\\u4eba\\u5458\",\"status\":\"0\",\"pid\":\"9\",\"addtime\":null,\"url\":\"Post\\/editSalesUser\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"50\",\"name\":\"\\u5220\\u9664\\u9500\\u552e\\u4eba\\u5458\",\"status\":\"0\",\"pid\":\"9\",\"addtime\":null,\"url\":\"Post\\/delSalesUser\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"11\",\"name\":\"\\u5c0f\\u533a\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Post\\/village\",\"style\":null,\"other\":\"village\",\"lev\":2},{\"id\":\"54\",\"name\":\"\\u65b0\\u589e\\u5c0f\\u533a\\u4fe1\\u606f\",\"status\":\"0\",\"pid\":\"11\",\"addtime\":null,\"url\":\"Post\\/addVillage\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"55\",\"name\":\"\\u7f16\\u8f91\\u5c0f\\u533a\\u4fe1\\u606f\",\"status\":\"0\",\"pid\":\"11\",\"addtime\":null,\"url\":\"Post\\/editVillage\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"56\",\"name\":\"\\u5220\\u9664\\u5c0f\\u533a\\u4fe1\\u606f\",\"status\":\"0\",\"pid\":\"11\",\"addtime\":null,\"url\":\"Post\\/delVillage\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"12\",\"name\":\"\\u8f66\\u4f4d\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Post\\/carPark\",\"style\":null,\"other\":\"carPark\",\"lev\":2},{\"id\":\"57\",\"name\":\"\\u65b0\\u589e\\u8f66\\u4f4d\\u4fe1\\u606f\",\"status\":\"0\",\"pid\":\"12\",\"addtime\":null,\"url\":\"Post\\/addCarPark\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"58\",\"name\":\"\\u7f16\\u8f91\\u8f66\\u4f4d\\u4fe1\\u606f\",\"status\":\"0\",\"pid\":\"12\",\"addtime\":null,\"url\":\"Post\\/editCarPark\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"59\",\"name\":\"\\u5220\\u9664\\u8f66\\u4f4d\\u4fe1\\u606f\",\"status\":\"0\",\"pid\":\"12\",\"addtime\":null,\"url\":\"Post\\/delCarPark\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"3\",\"name\":\"\\u6309\\u63ed\\u7533\\u8bf7\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":null,\"url\":\"Mortgage\\/applyList\",\"style\":\"am-icon-calendar\",\"other\":\"applyList\",\"lev\":1},{\"id\":\"62\",\"name\":\"\\u9996\\u9875\",\"status\":\"0\",\"pid\":\"0\",\"addtime\":null,\"url\":\"Home\\/index\",\"style\":null,\"other\":null,\"lev\":1}]', '2018-05-10 19:55:08', '1', '0');
INSERT INTO `hj_admin_user_group` VALUES ('8', '恒纪元-行业经理', '{\"1\":{\"value\":{\"id\":\"1\",\"name\":\"\\u57fa\\u7840\\u8d44\\u6599\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":null,\"url\":\"member\",\"style\":null,\"other\":null,\"lev\":1,\"chick\":[{\"id\":\"18\",\"name\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"1\",\"addtime\":null,\"url\":\"Member\\/adminUser\",\"style\":null,\"other\":\"adminUser\",\"lev\":2}]}},\"2\":{\"value\":{\"id\":\"2\",\"name\":\"\\u5c0f\\u533a\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":null,\"url\":\"village\",\"style\":\"\",\"other\":null,\"lev\":1,\"chick\":[{\"id\":\"7\",\"name\":\"\\u5f00\\u53d1\\u5546\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Post\\/developers\",\"style\":null,\"other\":\"developers\",\"lev\":2},{\"id\":\"9\",\"name\":\"\\u9500\\u552e\\u4eba\\u5458\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Post\\/salesUser\",\"style\":null,\"other\":\"salesUser\",\"lev\":2},{\"id\":\"10\",\"name\":\"\\u5546\\u5bb6\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Post\\/business\",\"style\":null,\"other\":\"business\",\"lev\":2},{\"id\":\"11\",\"name\":\"\\u5c0f\\u533a\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Post\\/village\",\"style\":null,\"other\":\"village\",\"lev\":2},{\"id\":\"12\",\"name\":\"\\u8f66\\u4f4d\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Post\\/carPark\",\"style\":null,\"other\":\"carPark\",\"lev\":2}]}},\"3\":{\"value\":{\"id\":\"3\",\"name\":\"\\u6309\\u63ed\\u7533\\u8bf7\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":null,\"url\":\"Mortgage\\/applyList\",\"style\":\"am-icon-calendar\",\"other\":\"applyList\",\"lev\":1}},\"21\":{\"value\":{\"id\":\"21\",\"name\":\"\\u7cfb\\u7edf\\u8bbe\\u7f6e\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":null,\"url\":\"system\",\"style\":null,\"other\":null,\"lev\":1,\"chick\":[{\"id\":\"20\",\"name\":\"\\u7cfb\\u7edf\\u65e5\\u5fd7\",\"status\":\"1\",\"pid\":\"21\",\"addtime\":null,\"url\":\"Home\\/systemLog\",\"style\":null,\"other\":\"systemLog\",\"lev\":2}]}}}', '[{\"id\":\"1\",\"name\":\"\\u57fa\\u7840\\u8d44\\u6599\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":null,\"url\":\"member\",\"style\":null,\"other\":null,\"lev\":1},{\"id\":\"18\",\"name\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"1\",\"addtime\":null,\"url\":\"Member\\/adminUser\",\"style\":null,\"other\":\"adminUser\",\"lev\":2},{\"id\":\"32\",\"name\":\"\\u65b0\\u589e\\u7528\\u6237\",\"status\":\"0\",\"pid\":\"18\",\"addtime\":null,\"url\":\"Member\\/AddUser\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"33\",\"name\":\"\\u7f16\\u8f91\\u7528\\u6237\",\"status\":\"0\",\"pid\":\"18\",\"addtime\":null,\"url\":\"Member\\/EditUser\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"34\",\"name\":\"\\u5220\\u9664\\u7528\\u6237\",\"status\":\"0\",\"pid\":\"18\",\"addtime\":null,\"url\":\"Member\\/DelUser\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"2\",\"name\":\"\\u5c0f\\u533a\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":null,\"url\":\"village\",\"style\":\"\",\"other\":null,\"lev\":1},{\"id\":\"7\",\"name\":\"\\u5f00\\u53d1\\u5546\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Post\\/developers\",\"style\":null,\"other\":\"developers\",\"lev\":2},{\"id\":\"42\",\"name\":\"\\u65b0\\u589e\\u5f00\\u53d1\\u5546\",\"status\":\"0\",\"pid\":\"7\",\"addtime\":null,\"url\":\"Post\\/addDevel\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"43\",\"name\":\"\\u7f16\\u8f91\\u5f00\\u53d1\\u5546\",\"status\":\"0\",\"pid\":\"7\",\"addtime\":null,\"url\":\"Post\\/editDevel\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"44\",\"name\":\"\\u5220\\u9664\\u5f00\\u53d1\\u5546\",\"status\":\"0\",\"pid\":\"7\",\"addtime\":null,\"url\":\"Post\\/delDevel\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"9\",\"name\":\"\\u9500\\u552e\\u4eba\\u5458\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Post\\/salesUser\",\"style\":null,\"other\":\"salesUser\",\"lev\":2},{\"id\":\"48\",\"name\":\"\\u65b0\\u589e\\u9500\\u552e\\u4eba\\u5458\",\"status\":\"0\",\"pid\":\"9\",\"addtime\":null,\"url\":\"Post\\/addSalesUser\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"49\",\"name\":\"\\u7f16\\u8f91\\u9500\\u552e\\u4eba\\u5458\",\"status\":\"0\",\"pid\":\"9\",\"addtime\":null,\"url\":\"Post\\/editSalesUser\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"50\",\"name\":\"\\u5220\\u9664\\u9500\\u552e\\u4eba\\u5458\",\"status\":\"0\",\"pid\":\"9\",\"addtime\":null,\"url\":\"Post\\/delSalesUser\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"10\",\"name\":\"\\u5546\\u5bb6\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Post\\/business\",\"style\":null,\"other\":\"business\",\"lev\":2},{\"id\":\"51\",\"name\":\"\\u65b0\\u589e\\u5546\\u5bb6\",\"status\":\"0\",\"pid\":\"10\",\"addtime\":null,\"url\":\"Post\\/addHusiness\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"52\",\"name\":\"\\u7f16\\u8f91\\u5546\\u5bb6\",\"status\":\"0\",\"pid\":\"10\",\"addtime\":null,\"url\":\"Post\\/editHusiness\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"53\",\"name\":\"\\u5220\\u9664\\u5546\\u5bb6\",\"status\":\"0\",\"pid\":\"10\",\"addtime\":null,\"url\":\"Post\\/delHusiness\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"11\",\"name\":\"\\u5c0f\\u533a\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Post\\/village\",\"style\":null,\"other\":\"village\",\"lev\":2},{\"id\":\"54\",\"name\":\"\\u65b0\\u589e\\u5c0f\\u533a\\u4fe1\\u606f\",\"status\":\"0\",\"pid\":\"11\",\"addtime\":null,\"url\":\"Post\\/addVillage\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"55\",\"name\":\"\\u7f16\\u8f91\\u5c0f\\u533a\\u4fe1\\u606f\",\"status\":\"0\",\"pid\":\"11\",\"addtime\":null,\"url\":\"Post\\/editVillage\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"56\",\"name\":\"\\u5220\\u9664\\u5c0f\\u533a\\u4fe1\\u606f\",\"status\":\"0\",\"pid\":\"11\",\"addtime\":null,\"url\":\"Post\\/delVillage\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"12\",\"name\":\"\\u8f66\\u4f4d\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Post\\/carPark\",\"style\":null,\"other\":\"carPark\",\"lev\":2},{\"id\":\"57\",\"name\":\"\\u65b0\\u589e\\u8f66\\u4f4d\\u4fe1\\u606f\",\"status\":\"0\",\"pid\":\"12\",\"addtime\":null,\"url\":\"Post\\/addCarPark\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"58\",\"name\":\"\\u7f16\\u8f91\\u8f66\\u4f4d\\u4fe1\\u606f\",\"status\":\"0\",\"pid\":\"12\",\"addtime\":null,\"url\":\"Post\\/editCarPark\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"59\",\"name\":\"\\u5220\\u9664\\u8f66\\u4f4d\\u4fe1\\u606f\",\"status\":\"0\",\"pid\":\"12\",\"addtime\":null,\"url\":\"Post\\/delCarPark\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"3\",\"name\":\"\\u6309\\u63ed\\u7533\\u8bf7\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":null,\"url\":\"Mortgage\\/applyList\",\"style\":\"am-icon-calendar\",\"other\":\"applyList\",\"lev\":1},{\"id\":\"61\",\"name\":\"\\u5bfc\\u51fa\\u6309\\u63ed\\u7533\\u8bf7\\u4fe1\\u606f\",\"status\":\"0\",\"pid\":\"3\",\"addtime\":null,\"url\":\"Mortgage\\/downApply\",\"style\":null,\"other\":null,\"lev\":2},{\"id\":\"21\",\"name\":\"\\u7cfb\\u7edf\\u8bbe\\u7f6e\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":null,\"url\":\"system\",\"style\":null,\"other\":null,\"lev\":1},{\"id\":\"20\",\"name\":\"\\u7cfb\\u7edf\\u65e5\\u5fd7\",\"status\":\"1\",\"pid\":\"21\",\"addtime\":null,\"url\":\"Home\\/systemLog\",\"style\":null,\"other\":\"systemLog\",\"lev\":2},{\"id\":\"62\",\"name\":\"\\u9996\\u9875\",\"status\":\"0\",\"pid\":\"0\",\"addtime\":null,\"url\":\"Home\\/index\",\"style\":null,\"other\":null,\"lev\":1}]', '2018-05-21 19:03:53', '1', '0');
INSERT INTO `hj_admin_user_group` VALUES ('9', '恒纪元-银行经理', '{\"2\":{\"value\":{\"id\":\"2\",\"name\":\"\\u5c0f\\u533a\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":null,\"url\":\"village\",\"style\":\"\",\"other\":null,\"lev\":1}},\"3\":{\"value\":{\"id\":\"3\",\"name\":\"\\u6309\\u63ed\\u7533\\u8bf7\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":null,\"url\":\"Mortgage\\/applyList\",\"style\":\"am-icon-calendar\",\"other\":\"applyList\",\"lev\":1}}}', '[{\"id\":\"2\",\"name\":\"\\u5c0f\\u533a\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":null,\"url\":\"village\",\"style\":\"\",\"other\":null,\"lev\":1},{\"id\":\"3\",\"name\":\"\\u6309\\u63ed\\u7533\\u8bf7\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":null,\"url\":\"Mortgage\\/applyList\",\"style\":\"am-icon-calendar\",\"other\":\"applyList\",\"lev\":1},{\"id\":\"61\",\"name\":\"\\u5bfc\\u51fa\\u6309\\u63ed\\u7533\\u8bf7\\u4fe1\\u606f\",\"status\":\"0\",\"pid\":\"3\",\"addtime\":null,\"url\":\"Mortgage\\/downApply\",\"style\":null,\"other\":null,\"lev\":2},{\"id\":\"62\",\"name\":\"\\u9996\\u9875\",\"status\":\"0\",\"pid\":\"0\",\"addtime\":null,\"url\":\"Home\\/index\",\"style\":null,\"other\":null,\"lev\":1}]', '2018-05-21 19:04:09', '1', '0');
INSERT INTO `hj_admin_user_group` VALUES ('10', '恒纪元-客户经理', '{\"1\":{\"value\":{\"id\":\"1\",\"name\":\"\\u57fa\\u7840\\u8d44\\u6599\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":null,\"url\":\"member\",\"style\":null,\"other\":null,\"lev\":1,\"chick\":[{\"id\":\"18\",\"name\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"1\",\"addtime\":null,\"url\":\"Member\\/adminUser\",\"style\":null,\"other\":\"adminUser\",\"lev\":2}]}},\"2\":{\"value\":{\"id\":\"2\",\"name\":\"\\u5c0f\\u533a\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":null,\"url\":\"village\",\"style\":\"\",\"other\":null,\"lev\":1,\"chick\":[{\"id\":\"7\",\"name\":\"\\u5f00\\u53d1\\u5546\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Post\\/developers\",\"style\":null,\"other\":\"developers\",\"lev\":2},{\"id\":\"9\",\"name\":\"\\u9500\\u552e\\u4eba\\u5458\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Post\\/salesUser\",\"style\":null,\"other\":\"salesUser\",\"lev\":2},{\"id\":\"10\",\"name\":\"\\u5546\\u5bb6\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Post\\/business\",\"style\":null,\"other\":\"business\",\"lev\":2},{\"id\":\"11\",\"name\":\"\\u5c0f\\u533a\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Post\\/village\",\"style\":null,\"other\":\"village\",\"lev\":2},{\"id\":\"12\",\"name\":\"\\u8f66\\u4f4d\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Post\\/carPark\",\"style\":null,\"other\":\"carPark\",\"lev\":2}]}},\"3\":{\"value\":{\"id\":\"3\",\"name\":\"\\u6309\\u63ed\\u7533\\u8bf7\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":null,\"url\":\"Mortgage\\/applyList\",\"style\":\"am-icon-calendar\",\"other\":\"applyList\",\"lev\":1}}}', '[{\"id\":\"1\",\"name\":\"\\u57fa\\u7840\\u8d44\\u6599\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":null,\"url\":\"member\",\"style\":null,\"other\":null,\"lev\":1},{\"id\":\"18\",\"name\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"1\",\"addtime\":null,\"url\":\"Member\\/adminUser\",\"style\":null,\"other\":\"adminUser\",\"lev\":2},{\"id\":\"32\",\"name\":\"\\u65b0\\u589e\\u7528\\u6237\",\"status\":\"0\",\"pid\":\"18\",\"addtime\":null,\"url\":\"Member\\/AddUser\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"33\",\"name\":\"\\u7f16\\u8f91\\u7528\\u6237\",\"status\":\"0\",\"pid\":\"18\",\"addtime\":null,\"url\":\"Member\\/EditUser\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"34\",\"name\":\"\\u5220\\u9664\\u7528\\u6237\",\"status\":\"0\",\"pid\":\"18\",\"addtime\":null,\"url\":\"Member\\/DelUser\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"2\",\"name\":\"\\u5c0f\\u533a\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":null,\"url\":\"village\",\"style\":\"\",\"other\":null,\"lev\":1},{\"id\":\"7\",\"name\":\"\\u5f00\\u53d1\\u5546\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Post\\/developers\",\"style\":null,\"other\":\"developers\",\"lev\":2},{\"id\":\"42\",\"name\":\"\\u65b0\\u589e\\u5f00\\u53d1\\u5546\",\"status\":\"0\",\"pid\":\"7\",\"addtime\":null,\"url\":\"Post\\/addDevel\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"43\",\"name\":\"\\u7f16\\u8f91\\u5f00\\u53d1\\u5546\",\"status\":\"0\",\"pid\":\"7\",\"addtime\":null,\"url\":\"Post\\/editDevel\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"44\",\"name\":\"\\u5220\\u9664\\u5f00\\u53d1\\u5546\",\"status\":\"0\",\"pid\":\"7\",\"addtime\":null,\"url\":\"Post\\/delDevel\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"9\",\"name\":\"\\u9500\\u552e\\u4eba\\u5458\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Post\\/salesUser\",\"style\":null,\"other\":\"salesUser\",\"lev\":2},{\"id\":\"48\",\"name\":\"\\u65b0\\u589e\\u9500\\u552e\\u4eba\\u5458\",\"status\":\"0\",\"pid\":\"9\",\"addtime\":null,\"url\":\"Post\\/addSalesUser\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"49\",\"name\":\"\\u7f16\\u8f91\\u9500\\u552e\\u4eba\\u5458\",\"status\":\"0\",\"pid\":\"9\",\"addtime\":null,\"url\":\"Post\\/editSalesUser\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"50\",\"name\":\"\\u5220\\u9664\\u9500\\u552e\\u4eba\\u5458\",\"status\":\"0\",\"pid\":\"9\",\"addtime\":null,\"url\":\"Post\\/delSalesUser\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"10\",\"name\":\"\\u5546\\u5bb6\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Post\\/business\",\"style\":null,\"other\":\"business\",\"lev\":2},{\"id\":\"51\",\"name\":\"\\u65b0\\u589e\\u5546\\u5bb6\",\"status\":\"0\",\"pid\":\"10\",\"addtime\":null,\"url\":\"Post\\/addHusiness\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"52\",\"name\":\"\\u7f16\\u8f91\\u5546\\u5bb6\",\"status\":\"0\",\"pid\":\"10\",\"addtime\":null,\"url\":\"Post\\/editHusiness\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"53\",\"name\":\"\\u5220\\u9664\\u5546\\u5bb6\",\"status\":\"0\",\"pid\":\"10\",\"addtime\":null,\"url\":\"Post\\/delHusiness\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"11\",\"name\":\"\\u5c0f\\u533a\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Post\\/village\",\"style\":null,\"other\":\"village\",\"lev\":2},{\"id\":\"54\",\"name\":\"\\u65b0\\u589e\\u5c0f\\u533a\\u4fe1\\u606f\",\"status\":\"0\",\"pid\":\"11\",\"addtime\":null,\"url\":\"Post\\/addVillage\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"55\",\"name\":\"\\u7f16\\u8f91\\u5c0f\\u533a\\u4fe1\\u606f\",\"status\":\"0\",\"pid\":\"11\",\"addtime\":null,\"url\":\"Post\\/editVillage\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"56\",\"name\":\"\\u5220\\u9664\\u5c0f\\u533a\\u4fe1\\u606f\",\"status\":\"0\",\"pid\":\"11\",\"addtime\":null,\"url\":\"Post\\/delVillage\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"12\",\"name\":\"\\u8f66\\u4f4d\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Post\\/carPark\",\"style\":null,\"other\":\"carPark\",\"lev\":2},{\"id\":\"57\",\"name\":\"\\u65b0\\u589e\\u8f66\\u4f4d\\u4fe1\\u606f\",\"status\":\"0\",\"pid\":\"12\",\"addtime\":null,\"url\":\"Post\\/addCarPark\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"58\",\"name\":\"\\u7f16\\u8f91\\u8f66\\u4f4d\\u4fe1\\u606f\",\"status\":\"0\",\"pid\":\"12\",\"addtime\":null,\"url\":\"Post\\/editCarPark\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"59\",\"name\":\"\\u5220\\u9664\\u8f66\\u4f4d\\u4fe1\\u606f\",\"status\":\"0\",\"pid\":\"12\",\"addtime\":null,\"url\":\"Post\\/delCarPark\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"3\",\"name\":\"\\u6309\\u63ed\\u7533\\u8bf7\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":null,\"url\":\"Mortgage\\/applyList\",\"style\":\"am-icon-calendar\",\"other\":\"applyList\",\"lev\":1},{\"id\":\"61\",\"name\":\"\\u5bfc\\u51fa\\u6309\\u63ed\\u7533\\u8bf7\\u4fe1\\u606f\",\"status\":\"0\",\"pid\":\"3\",\"addtime\":null,\"url\":\"Mortgage\\/downApply\",\"style\":null,\"other\":null,\"lev\":2},{\"id\":\"62\",\"name\":\"\\u9996\\u9875\",\"status\":\"0\",\"pid\":\"0\",\"addtime\":null,\"url\":\"Home\\/index\",\"style\":null,\"other\":null,\"lev\":1}]', '2018-05-21 19:04:26', '1', '0');
INSERT INTO `hj_admin_user_group` VALUES ('11', '恒纪元-财务管理', null, '', '2018-05-21 19:04:44', '1', '0');
INSERT INTO `hj_admin_user_group` VALUES ('12', '恒纪元-技术管理', '{\"1\":{\"value\":{\"id\":\"1\",\"name\":\"\\u57fa\\u7840\\u8d44\\u6599\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":null,\"url\":\"member\",\"style\":null,\"other\":null,\"lev\":1,\"chick\":[{\"id\":\"15\",\"name\":\"\\u516c\\u53f8\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"1\",\"addtime\":null,\"url\":\"Member\\/company\",\"style\":null,\"other\":\"company\",\"lev\":2},{\"id\":\"16\",\"name\":\"\\u90e8\\u95e8\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"1\",\"addtime\":null,\"url\":\"Member\\/department\",\"style\":null,\"other\":\"department\",\"lev\":2},{\"id\":\"17\",\"name\":\"\\u7528\\u6237\\u7ec4\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"1\",\"addtime\":null,\"url\":\"Member\\/group\",\"style\":null,\"other\":\"group\",\"lev\":2},{\"id\":\"18\",\"name\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"1\",\"addtime\":null,\"url\":\"Member\\/adminUser\",\"style\":null,\"other\":\"adminUser\",\"lev\":2}]}},\"2\":{\"value\":{\"id\":\"2\",\"name\":\"\\u5c0f\\u533a\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":null,\"url\":\"village\",\"style\":\"\",\"other\":null,\"lev\":1,\"chick\":[{\"id\":\"5\",\"name\":\"\\u94f6\\u884c\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Bank\\/bankList\",\"style\":null,\"other\":\"bankList\",\"lev\":2},{\"id\":\"6\",\"name\":\"\\u94f6\\u884c\\u4eba\\u5458\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Bank\\/bankPersonnel\",\"style\":null,\"other\":\"bankPersonnel\",\"lev\":2},{\"id\":\"7\",\"name\":\"\\u5f00\\u53d1\\u5546\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Post\\/developers\",\"style\":null,\"other\":\"developers\",\"lev\":2},{\"id\":\"8\",\"name\":\"\\u9500\\u552e\\u516c\\u53f8\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Post\\/salesCompany\",\"style\":null,\"other\":\"salesCompany\",\"lev\":2},{\"id\":\"9\",\"name\":\"\\u9500\\u552e\\u4eba\\u5458\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Post\\/salesUser\",\"style\":null,\"other\":\"salesUser\",\"lev\":2},{\"id\":\"10\",\"name\":\"\\u5546\\u5bb6\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Post\\/business\",\"style\":null,\"other\":\"business\",\"lev\":2},{\"id\":\"11\",\"name\":\"\\u5c0f\\u533a\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Post\\/village\",\"style\":null,\"other\":\"village\",\"lev\":2},{\"id\":\"12\",\"name\":\"\\u8f66\\u4f4d\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Post\\/carPark\",\"style\":null,\"other\":\"carPark\",\"lev\":2}]}},\"3\":{\"value\":{\"id\":\"3\",\"name\":\"\\u6309\\u63ed\\u7533\\u8bf7\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":null,\"url\":\"Mortgage\\/applyList\",\"style\":\"am-icon-calendar\",\"other\":\"applyList\",\"lev\":1}},\"4\":{\"value\":{\"id\":\"4\",\"name\":\"\\u8d22\\u52a1\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":null,\"url\":\"finance\",\"style\":null,\"other\":null,\"lev\":1,\"chick\":[{\"id\":\"13\",\"name\":\"\\u4e1a\\u52a1\\u63d0\\u6210\",\"status\":\"1\",\"pid\":\"4\",\"addtime\":null,\"url\":\"Mortgage\\/commision\",\"style\":null,\"other\":\"commision\",\"lev\":2},{\"id\":\"14\",\"name\":\"\\u5c0f\\u533a\\u63d0\\u6210\",\"status\":\"1\",\"pid\":\"4\",\"addtime\":null,\"url\":\"Mortgage\\/villageCommision\",\"style\":null,\"other\":\"villageCommision\",\"lev\":2},{\"id\":\"22\",\"name\":\"\\u63d0\\u73b0\\u8bb0\\u5f55\",\"status\":\"1\",\"pid\":\"4\",\"addtime\":null,\"url\":\"Mortgage\\/putForward\",\"style\":null,\"other\":\"putForward\",\"lev\":2}]}},\"21\":{\"value\":{\"id\":\"21\",\"name\":\"\\u7cfb\\u7edf\\u8bbe\\u7f6e\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":null,\"url\":\"system\",\"style\":null,\"other\":null,\"lev\":1,\"chick\":[{\"id\":\"19\",\"name\":\"\\u5c0f\\u7a0b\\u5e8fbanner\",\"status\":\"1\",\"pid\":\"21\",\"addtime\":null,\"url\":\"Home\\/bannerList\",\"style\":null,\"other\":\"bannerList\",\"lev\":2},{\"id\":\"20\",\"name\":\"\\u7cfb\\u7edf\\u65e5\\u5fd7\",\"status\":\"1\",\"pid\":\"21\",\"addtime\":null,\"url\":\"Home\\/systemLog\",\"style\":null,\"other\":\"systemLog\",\"lev\":2}]}}}', '[{\"id\":\"1\",\"name\":\"\\u57fa\\u7840\\u8d44\\u6599\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":null,\"url\":\"member\",\"style\":null,\"other\":null,\"lev\":1},{\"id\":\"15\",\"name\":\"\\u516c\\u53f8\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"1\",\"addtime\":null,\"url\":\"Member\\/company\",\"style\":null,\"other\":\"company\",\"lev\":2},{\"id\":\"23\",\"name\":\"\\u65b0\\u589e\\u516c\\u53f8\",\"status\":\"0\",\"pid\":\"15\",\"addtime\":null,\"url\":\"Member\\/AddCompany\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"24\",\"name\":\"\\u7f16\\u8f91\\u516c\\u53f8\",\"status\":\"0\",\"pid\":\"15\",\"addtime\":null,\"url\":\"Member\\/editCompany\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"25\",\"name\":\"\\u5220\\u9664\\u516c\\u53f8\",\"status\":\"0\",\"pid\":\"15\",\"addtime\":null,\"url\":\"Member\\/delCompany\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"16\",\"name\":\"\\u90e8\\u95e8\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"1\",\"addtime\":null,\"url\":\"Member\\/department\",\"style\":null,\"other\":\"department\",\"lev\":2},{\"id\":\"26\",\"name\":\"\\u65b0\\u589e\\u90e8\\u95e8\",\"status\":\"0\",\"pid\":\"16\",\"addtime\":null,\"url\":\"Member\\/addDepartment\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"27\",\"name\":\"\\u7f16\\u8f91\\u90e8\\u95e8\",\"status\":\"0\",\"pid\":\"16\",\"addtime\":null,\"url\":\"Member\\/editDepartment\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"28\",\"name\":\"\\u5220\\u9664\\u90e8\\u95e8\",\"status\":\"0\",\"pid\":\"16\",\"addtime\":null,\"url\":\"Member\\/delDepartment\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"17\",\"name\":\"\\u7528\\u6237\\u7ec4\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"1\",\"addtime\":null,\"url\":\"Member\\/group\",\"style\":null,\"other\":\"group\",\"lev\":2},{\"id\":\"29\",\"name\":\"\\u65b0\\u589e\\u7528\\u6237\\u7ec4\",\"status\":\"0\",\"pid\":\"17\",\"addtime\":null,\"url\":\"Member\\/addGroup\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"30\",\"name\":\"\\u7f16\\u8f91\\u7528\\u6237\\u7ec4\",\"status\":\"0\",\"pid\":\"17\",\"addtime\":null,\"url\":\"Member\\/editGroup\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"31\",\"name\":\"\\u5220\\u9664\\u7528\\u6237\\u7ec4\",\"status\":\"0\",\"pid\":\"17\",\"addtime\":null,\"url\":\"Member\\/delGroup\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"35\",\"name\":\"\\u5206\\u914d\\u6743\\u9650\",\"status\":\"0\",\"pid\":\"17\",\"addtime\":null,\"url\":\"Member\\/GroupJurisdiction\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"63\",\"name\":\"\\u4fee\\u6539\\u6743\\u9650\",\"status\":\"0\",\"pid\":\"17\",\"addtime\":null,\"url\":\"Member\\/editJurisdiction\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"18\",\"name\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"1\",\"addtime\":null,\"url\":\"Member\\/adminUser\",\"style\":null,\"other\":\"adminUser\",\"lev\":2},{\"id\":\"32\",\"name\":\"\\u65b0\\u589e\\u7528\\u6237\",\"status\":\"0\",\"pid\":\"18\",\"addtime\":null,\"url\":\"Member\\/AddUser\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"33\",\"name\":\"\\u7f16\\u8f91\\u7528\\u6237\",\"status\":\"0\",\"pid\":\"18\",\"addtime\":null,\"url\":\"Member\\/EditUser\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"34\",\"name\":\"\\u5220\\u9664\\u7528\\u6237\",\"status\":\"0\",\"pid\":\"18\",\"addtime\":null,\"url\":\"Member\\/DelUser\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"2\",\"name\":\"\\u5c0f\\u533a\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":null,\"url\":\"village\",\"style\":\"\",\"other\":null,\"lev\":1},{\"id\":\"5\",\"name\":\"\\u94f6\\u884c\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Bank\\/bankList\",\"style\":null,\"other\":\"bankList\",\"lev\":2},{\"id\":\"36\",\"name\":\"\\u65b0\\u589e\\u94f6\\u884c\",\"status\":\"0\",\"pid\":\"5\",\"addtime\":null,\"url\":\"Bank\\/addBank\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"37\",\"name\":\"\\u7f16\\u8f91\\u94f6\\u884c\",\"status\":\"0\",\"pid\":\"5\",\"addtime\":null,\"url\":\"Bank\\/editBank\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"38\",\"name\":\"\\u5220\\u9664\\u94f6\\u884c\",\"status\":\"0\",\"pid\":\"5\",\"addtime\":null,\"url\":\"Bank\\/delBank\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"6\",\"name\":\"\\u94f6\\u884c\\u4eba\\u5458\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Bank\\/bankPersonnel\",\"style\":null,\"other\":\"bankPersonnel\",\"lev\":2},{\"id\":\"39\",\"name\":\"\\u65b0\\u589e\\u94f6\\u884c\\u4eba\\u5458\",\"status\":\"0\",\"pid\":\"6\",\"addtime\":null,\"url\":\"Bank\\/addBankUser\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"40\",\"name\":\"\\u7f16\\u8f91\\u94f6\\u884c\\u4eba\\u5458\",\"status\":\"0\",\"pid\":\"6\",\"addtime\":null,\"url\":\"Bank\\/editBankUser\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"41\",\"name\":\"\\u5220\\u9664\\u94f6\\u884c\\u4eba\\u5458\",\"status\":\"0\",\"pid\":\"6\",\"addtime\":null,\"url\":\"Bank\\/delBankUser\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"7\",\"name\":\"\\u5f00\\u53d1\\u5546\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Post\\/developers\",\"style\":null,\"other\":\"developers\",\"lev\":2},{\"id\":\"42\",\"name\":\"\\u65b0\\u589e\\u5f00\\u53d1\\u5546\",\"status\":\"0\",\"pid\":\"7\",\"addtime\":null,\"url\":\"Post\\/addDevel\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"43\",\"name\":\"\\u7f16\\u8f91\\u5f00\\u53d1\\u5546\",\"status\":\"0\",\"pid\":\"7\",\"addtime\":null,\"url\":\"Post\\/editDevel\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"44\",\"name\":\"\\u5220\\u9664\\u5f00\\u53d1\\u5546\",\"status\":\"0\",\"pid\":\"7\",\"addtime\":null,\"url\":\"Post\\/delDevel\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"8\",\"name\":\"\\u9500\\u552e\\u516c\\u53f8\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Post\\/salesCompany\",\"style\":null,\"other\":\"salesCompany\",\"lev\":2},{\"id\":\"45\",\"name\":\"\\u65b0\\u589e\\u9500\\u552e\\u516c\\u53f8\",\"status\":\"0\",\"pid\":\"8\",\"addtime\":null,\"url\":\"Post\\/AddCompany\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"46\",\"name\":\"\\u7f16\\u8f91\\u9500\\u552e\\u516c\\u53f8\",\"status\":\"0\",\"pid\":\"8\",\"addtime\":null,\"url\":\"Post\\/editCompany\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"47\",\"name\":\"\\u5220\\u9664\\u9500\\u552e\\u516c\\u53f8\",\"status\":\"0\",\"pid\":\"8\",\"addtime\":null,\"url\":\"Post\\/delCompany\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"9\",\"name\":\"\\u9500\\u552e\\u4eba\\u5458\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Post\\/salesUser\",\"style\":null,\"other\":\"salesUser\",\"lev\":2},{\"id\":\"48\",\"name\":\"\\u65b0\\u589e\\u9500\\u552e\\u4eba\\u5458\",\"status\":\"0\",\"pid\":\"9\",\"addtime\":null,\"url\":\"Post\\/addSalesUser\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"49\",\"name\":\"\\u7f16\\u8f91\\u9500\\u552e\\u4eba\\u5458\",\"status\":\"0\",\"pid\":\"9\",\"addtime\":null,\"url\":\"Post\\/editSalesUser\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"50\",\"name\":\"\\u5220\\u9664\\u9500\\u552e\\u4eba\\u5458\",\"status\":\"0\",\"pid\":\"9\",\"addtime\":null,\"url\":\"Post\\/delSalesUser\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"10\",\"name\":\"\\u5546\\u5bb6\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Post\\/business\",\"style\":null,\"other\":\"business\",\"lev\":2},{\"id\":\"51\",\"name\":\"\\u65b0\\u589e\\u5546\\u5bb6\",\"status\":\"0\",\"pid\":\"10\",\"addtime\":null,\"url\":\"Post\\/addHusiness\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"52\",\"name\":\"\\u7f16\\u8f91\\u5546\\u5bb6\",\"status\":\"0\",\"pid\":\"10\",\"addtime\":null,\"url\":\"Post\\/editHusiness\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"53\",\"name\":\"\\u5220\\u9664\\u5546\\u5bb6\",\"status\":\"0\",\"pid\":\"10\",\"addtime\":null,\"url\":\"Post\\/delHusiness\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"11\",\"name\":\"\\u5c0f\\u533a\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Post\\/village\",\"style\":null,\"other\":\"village\",\"lev\":2},{\"id\":\"54\",\"name\":\"\\u65b0\\u589e\\u5c0f\\u533a\\u4fe1\\u606f\",\"status\":\"0\",\"pid\":\"11\",\"addtime\":null,\"url\":\"Post\\/addVillage\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"55\",\"name\":\"\\u7f16\\u8f91\\u5c0f\\u533a\\u4fe1\\u606f\",\"status\":\"0\",\"pid\":\"11\",\"addtime\":null,\"url\":\"Post\\/editVillage\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"56\",\"name\":\"\\u5220\\u9664\\u5c0f\\u533a\\u4fe1\\u606f\",\"status\":\"0\",\"pid\":\"11\",\"addtime\":null,\"url\":\"Post\\/delVillage\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"12\",\"name\":\"\\u8f66\\u4f4d\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Post\\/carPark\",\"style\":null,\"other\":\"carPark\",\"lev\":2},{\"id\":\"57\",\"name\":\"\\u65b0\\u589e\\u8f66\\u4f4d\\u4fe1\\u606f\",\"status\":\"0\",\"pid\":\"12\",\"addtime\":null,\"url\":\"Post\\/addCarPark\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"58\",\"name\":\"\\u7f16\\u8f91\\u8f66\\u4f4d\\u4fe1\\u606f\",\"status\":\"0\",\"pid\":\"12\",\"addtime\":null,\"url\":\"Post\\/editCarPark\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"59\",\"name\":\"\\u5220\\u9664\\u8f66\\u4f4d\\u4fe1\\u606f\",\"status\":\"0\",\"pid\":\"12\",\"addtime\":null,\"url\":\"Post\\/delCarPark\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"3\",\"name\":\"\\u6309\\u63ed\\u7533\\u8bf7\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":null,\"url\":\"Mortgage\\/applyList\",\"style\":\"am-icon-calendar\",\"other\":\"applyList\",\"lev\":1},{\"id\":\"60\",\"name\":\"\\u5220\\u9664\\u6309\\u63ed\\u7533\\u8bf7\\u4fe1\\u606f\",\"status\":\"0\",\"pid\":\"3\",\"addtime\":null,\"url\":\"Mortgage\\/delApply\",\"style\":null,\"other\":null,\"lev\":2},{\"id\":\"61\",\"name\":\"\\u5bfc\\u51fa\\u6309\\u63ed\\u7533\\u8bf7\\u4fe1\\u606f\",\"status\":\"0\",\"pid\":\"3\",\"addtime\":null,\"url\":\"Mortgage\\/downApply\",\"style\":null,\"other\":null,\"lev\":2},{\"id\":\"4\",\"name\":\"\\u8d22\\u52a1\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":null,\"url\":\"finance\",\"style\":null,\"other\":null,\"lev\":1},{\"id\":\"13\",\"name\":\"\\u4e1a\\u52a1\\u63d0\\u6210\",\"status\":\"1\",\"pid\":\"4\",\"addtime\":null,\"url\":\"Mortgage\\/commision\",\"style\":null,\"other\":\"commision\",\"lev\":2},{\"id\":\"14\",\"name\":\"\\u5c0f\\u533a\\u63d0\\u6210\",\"status\":\"1\",\"pid\":\"4\",\"addtime\":null,\"url\":\"Mortgage\\/villageCommision\",\"style\":null,\"other\":\"villageCommision\",\"lev\":2},{\"id\":\"22\",\"name\":\"\\u63d0\\u73b0\\u8bb0\\u5f55\",\"status\":\"1\",\"pid\":\"4\",\"addtime\":null,\"url\":\"Mortgage\\/putForward\",\"style\":null,\"other\":\"putForward\",\"lev\":2},{\"id\":\"21\",\"name\":\"\\u7cfb\\u7edf\\u8bbe\\u7f6e\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":null,\"url\":\"system\",\"style\":null,\"other\":null,\"lev\":1},{\"id\":\"19\",\"name\":\"\\u5c0f\\u7a0b\\u5e8fbanner\",\"status\":\"1\",\"pid\":\"21\",\"addtime\":null,\"url\":\"Home\\/bannerList\",\"style\":null,\"other\":\"bannerList\",\"lev\":2},{\"id\":\"20\",\"name\":\"\\u7cfb\\u7edf\\u65e5\\u5fd7\",\"status\":\"1\",\"pid\":\"21\",\"addtime\":null,\"url\":\"Home\\/systemLog\",\"style\":null,\"other\":\"systemLog\",\"lev\":2},{\"id\":\"62\",\"name\":\"\\u9996\\u9875\",\"status\":\"0\",\"pid\":\"0\",\"addtime\":null,\"url\":\"Home\\/index\",\"style\":null,\"other\":null,\"lev\":1}]', '2018-05-21 19:11:25', '1', '0');
INSERT INTO `hj_admin_user_group` VALUES ('16', '信息管理员', '{\"1\":{\"value\":{\"id\":\"1\",\"name\":\"\\u57fa\\u7840\\u8d44\\u6599\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":null,\"url\":\"member\",\"style\":null,\"other\":null,\"lev\":1,\"chick\":[{\"id\":\"15\",\"name\":\"\\u516c\\u53f8\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"1\",\"addtime\":null,\"url\":\"Member\\/company\",\"style\":null,\"other\":\"company\",\"lev\":2},{\"id\":\"16\",\"name\":\"\\u90e8\\u95e8\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"1\",\"addtime\":null,\"url\":\"Member\\/department\",\"style\":null,\"other\":\"department\",\"lev\":2},{\"id\":\"17\",\"name\":\"\\u7528\\u6237\\u7ec4\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"1\",\"addtime\":null,\"url\":\"Member\\/group\",\"style\":null,\"other\":\"group\",\"lev\":2},{\"id\":\"18\",\"name\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"1\",\"addtime\":null,\"url\":\"Member\\/adminUser\",\"style\":null,\"other\":\"adminUser\",\"lev\":2}]}},\"2\":{\"value\":{\"id\":\"2\",\"name\":\"\\u5c0f\\u533a\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":null,\"url\":\"village\",\"style\":\"\",\"other\":null,\"lev\":1,\"chick\":[{\"id\":\"5\",\"name\":\"\\u94f6\\u884c\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Bank\\/bankList\",\"style\":null,\"other\":\"bankList\",\"lev\":2},{\"id\":\"6\",\"name\":\"\\u94f6\\u884c\\u4eba\\u5458\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Bank\\/bankPersonnel\",\"style\":null,\"other\":\"bankPersonnel\",\"lev\":2},{\"id\":\"7\",\"name\":\"\\u5f00\\u53d1\\u5546\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Post\\/developers\",\"style\":null,\"other\":\"developers\",\"lev\":2},{\"id\":\"8\",\"name\":\"\\u9500\\u552e\\u516c\\u53f8\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Post\\/salesCompany\",\"style\":null,\"other\":\"salesCompany\",\"lev\":2},{\"id\":\"9\",\"name\":\"\\u9500\\u552e\\u4eba\\u5458\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Post\\/salesUser\",\"style\":null,\"other\":\"salesUser\",\"lev\":2},{\"id\":\"10\",\"name\":\"\\u5546\\u5bb6\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Post\\/business\",\"style\":null,\"other\":\"business\",\"lev\":2},{\"id\":\"11\",\"name\":\"\\u5c0f\\u533a\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Post\\/village\",\"style\":null,\"other\":\"village\",\"lev\":2},{\"id\":\"12\",\"name\":\"\\u8f66\\u4f4d\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Post\\/carPark\",\"style\":null,\"other\":\"carPark\",\"lev\":2}]}},\"3\":{\"value\":{\"id\":\"3\",\"name\":\"\\u6309\\u63ed\\u7533\\u8bf7\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":null,\"url\":\"Mortgage\\/applyList\",\"style\":\"am-icon-calendar\",\"other\":\"applyList\",\"lev\":1}},\"4\":{\"value\":{\"id\":\"4\",\"name\":\"\\u8d22\\u52a1\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":null,\"url\":\"finance\",\"style\":null,\"other\":null,\"lev\":1,\"chick\":[{\"id\":\"13\",\"name\":\"\\u4e1a\\u52a1\\u63d0\\u6210\",\"status\":\"1\",\"pid\":\"4\",\"addtime\":null,\"url\":\"Mortgage\\/commision\",\"style\":null,\"other\":\"commision\",\"lev\":2},{\"id\":\"14\",\"name\":\"\\u5c0f\\u533a\\u63d0\\u6210\",\"status\":\"1\",\"pid\":\"4\",\"addtime\":null,\"url\":\"Mortgage\\/villageCommision\",\"style\":null,\"other\":\"villageCommision\",\"lev\":2},{\"id\":\"22\",\"name\":\"\\u63d0\\u73b0\\u8bb0\\u5f55\",\"status\":\"1\",\"pid\":\"4\",\"addtime\":null,\"url\":\"Mortgage\\/putForward\",\"style\":null,\"other\":\"putForward\",\"lev\":2}]}},\"21\":{\"value\":{\"id\":\"21\",\"name\":\"\\u7cfb\\u7edf\\u8bbe\\u7f6e\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":null,\"url\":\"system\",\"style\":null,\"other\":null,\"lev\":1,\"chick\":[{\"id\":\"19\",\"name\":\"\\u5c0f\\u7a0b\\u5e8fbanner\",\"status\":\"1\",\"pid\":\"21\",\"addtime\":null,\"url\":\"Home\\/bannerList\",\"style\":null,\"other\":\"bannerList\",\"lev\":2},{\"id\":\"20\",\"name\":\"\\u7cfb\\u7edf\\u65e5\\u5fd7\",\"status\":\"1\",\"pid\":\"21\",\"addtime\":null,\"url\":\"Home\\/systemLog\",\"style\":null,\"other\":\"systemLog\",\"lev\":2}]}}}', '[{\"id\":\"1\",\"name\":\"\\u57fa\\u7840\\u8d44\\u6599\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":null,\"url\":\"member\",\"style\":null,\"other\":null,\"lev\":1},{\"id\":\"15\",\"name\":\"\\u516c\\u53f8\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"1\",\"addtime\":null,\"url\":\"Member\\/company\",\"style\":null,\"other\":\"company\",\"lev\":2},{\"id\":\"23\",\"name\":\"\\u65b0\\u589e\\u516c\\u53f8\",\"status\":\"0\",\"pid\":\"15\",\"addtime\":null,\"url\":\"Member\\/AddCompany\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"24\",\"name\":\"\\u7f16\\u8f91\\u516c\\u53f8\",\"status\":\"0\",\"pid\":\"15\",\"addtime\":null,\"url\":\"Member\\/editCompany\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"25\",\"name\":\"\\u5220\\u9664\\u516c\\u53f8\",\"status\":\"0\",\"pid\":\"15\",\"addtime\":null,\"url\":\"Member\\/delCompany\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"16\",\"name\":\"\\u90e8\\u95e8\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"1\",\"addtime\":null,\"url\":\"Member\\/department\",\"style\":null,\"other\":\"department\",\"lev\":2},{\"id\":\"26\",\"name\":\"\\u65b0\\u589e\\u90e8\\u95e8\",\"status\":\"0\",\"pid\":\"16\",\"addtime\":null,\"url\":\"Member\\/addDepartment\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"27\",\"name\":\"\\u7f16\\u8f91\\u90e8\\u95e8\",\"status\":\"0\",\"pid\":\"16\",\"addtime\":null,\"url\":\"Member\\/editDepartment\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"28\",\"name\":\"\\u5220\\u9664\\u90e8\\u95e8\",\"status\":\"0\",\"pid\":\"16\",\"addtime\":null,\"url\":\"Member\\/delDepartment\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"17\",\"name\":\"\\u7528\\u6237\\u7ec4\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"1\",\"addtime\":null,\"url\":\"Member\\/group\",\"style\":null,\"other\":\"group\",\"lev\":2},{\"id\":\"29\",\"name\":\"\\u65b0\\u589e\\u7528\\u6237\\u7ec4\",\"status\":\"0\",\"pid\":\"17\",\"addtime\":null,\"url\":\"Member\\/addGroup\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"30\",\"name\":\"\\u7f16\\u8f91\\u7528\\u6237\\u7ec4\",\"status\":\"0\",\"pid\":\"17\",\"addtime\":null,\"url\":\"Member\\/editGroup\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"31\",\"name\":\"\\u5220\\u9664\\u7528\\u6237\\u7ec4\",\"status\":\"0\",\"pid\":\"17\",\"addtime\":null,\"url\":\"Member\\/delGroup\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"35\",\"name\":\"\\u5206\\u914d\\u6743\\u9650\",\"status\":\"0\",\"pid\":\"17\",\"addtime\":null,\"url\":\"Member\\/GroupJurisdiction\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"63\",\"name\":\"\\u4fee\\u6539\\u6743\\u9650\",\"status\":\"0\",\"pid\":\"17\",\"addtime\":null,\"url\":\"Member\\/editJurisdiction\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"18\",\"name\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"1\",\"addtime\":null,\"url\":\"Member\\/adminUser\",\"style\":null,\"other\":\"adminUser\",\"lev\":2},{\"id\":\"32\",\"name\":\"\\u65b0\\u589e\\u7528\\u6237\",\"status\":\"0\",\"pid\":\"18\",\"addtime\":null,\"url\":\"Member\\/AddUser\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"33\",\"name\":\"\\u7f16\\u8f91\\u7528\\u6237\",\"status\":\"0\",\"pid\":\"18\",\"addtime\":null,\"url\":\"Member\\/EditUser\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"34\",\"name\":\"\\u5220\\u9664\\u7528\\u6237\",\"status\":\"0\",\"pid\":\"18\",\"addtime\":null,\"url\":\"Member\\/DelUser\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"2\",\"name\":\"\\u5c0f\\u533a\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":null,\"url\":\"village\",\"style\":\"\",\"other\":null,\"lev\":1},{\"id\":\"5\",\"name\":\"\\u94f6\\u884c\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Bank\\/bankList\",\"style\":null,\"other\":\"bankList\",\"lev\":2},{\"id\":\"36\",\"name\":\"\\u65b0\\u589e\\u94f6\\u884c\",\"status\":\"0\",\"pid\":\"5\",\"addtime\":null,\"url\":\"Bank\\/addBank\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"37\",\"name\":\"\\u7f16\\u8f91\\u94f6\\u884c\",\"status\":\"0\",\"pid\":\"5\",\"addtime\":null,\"url\":\"Bank\\/editBank\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"38\",\"name\":\"\\u5220\\u9664\\u94f6\\u884c\",\"status\":\"0\",\"pid\":\"5\",\"addtime\":null,\"url\":\"Bank\\/delBank\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"6\",\"name\":\"\\u94f6\\u884c\\u4eba\\u5458\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Bank\\/bankPersonnel\",\"style\":null,\"other\":\"bankPersonnel\",\"lev\":2},{\"id\":\"39\",\"name\":\"\\u65b0\\u589e\\u94f6\\u884c\\u4eba\\u5458\",\"status\":\"0\",\"pid\":\"6\",\"addtime\":null,\"url\":\"Bank\\/addBankUser\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"40\",\"name\":\"\\u7f16\\u8f91\\u94f6\\u884c\\u4eba\\u5458\",\"status\":\"0\",\"pid\":\"6\",\"addtime\":null,\"url\":\"Bank\\/editBankUser\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"41\",\"name\":\"\\u5220\\u9664\\u94f6\\u884c\\u4eba\\u5458\",\"status\":\"0\",\"pid\":\"6\",\"addtime\":null,\"url\":\"Bank\\/delBankUser\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"7\",\"name\":\"\\u5f00\\u53d1\\u5546\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Post\\/developers\",\"style\":null,\"other\":\"developers\",\"lev\":2},{\"id\":\"42\",\"name\":\"\\u65b0\\u589e\\u5f00\\u53d1\\u5546\",\"status\":\"0\",\"pid\":\"7\",\"addtime\":null,\"url\":\"Post\\/addDevel\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"43\",\"name\":\"\\u7f16\\u8f91\\u5f00\\u53d1\\u5546\",\"status\":\"0\",\"pid\":\"7\",\"addtime\":null,\"url\":\"Post\\/editDevel\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"44\",\"name\":\"\\u5220\\u9664\\u5f00\\u53d1\\u5546\",\"status\":\"0\",\"pid\":\"7\",\"addtime\":null,\"url\":\"Post\\/delDevel\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"8\",\"name\":\"\\u9500\\u552e\\u516c\\u53f8\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Post\\/salesCompany\",\"style\":null,\"other\":\"salesCompany\",\"lev\":2},{\"id\":\"45\",\"name\":\"\\u65b0\\u589e\\u9500\\u552e\\u516c\\u53f8\",\"status\":\"0\",\"pid\":\"8\",\"addtime\":null,\"url\":\"Post\\/AddCompany\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"46\",\"name\":\"\\u7f16\\u8f91\\u9500\\u552e\\u516c\\u53f8\",\"status\":\"0\",\"pid\":\"8\",\"addtime\":null,\"url\":\"Post\\/editCompany\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"47\",\"name\":\"\\u5220\\u9664\\u9500\\u552e\\u516c\\u53f8\",\"status\":\"0\",\"pid\":\"8\",\"addtime\":null,\"url\":\"Post\\/delCompany\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"9\",\"name\":\"\\u9500\\u552e\\u4eba\\u5458\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Post\\/salesUser\",\"style\":null,\"other\":\"salesUser\",\"lev\":2},{\"id\":\"48\",\"name\":\"\\u65b0\\u589e\\u9500\\u552e\\u4eba\\u5458\",\"status\":\"0\",\"pid\":\"9\",\"addtime\":null,\"url\":\"Post\\/addSalesUser\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"49\",\"name\":\"\\u7f16\\u8f91\\u9500\\u552e\\u4eba\\u5458\",\"status\":\"0\",\"pid\":\"9\",\"addtime\":null,\"url\":\"Post\\/editSalesUser\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"50\",\"name\":\"\\u5220\\u9664\\u9500\\u552e\\u4eba\\u5458\",\"status\":\"0\",\"pid\":\"9\",\"addtime\":null,\"url\":\"Post\\/delSalesUser\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"10\",\"name\":\"\\u5546\\u5bb6\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Post\\/business\",\"style\":null,\"other\":\"business\",\"lev\":2},{\"id\":\"51\",\"name\":\"\\u65b0\\u589e\\u5546\\u5bb6\",\"status\":\"0\",\"pid\":\"10\",\"addtime\":null,\"url\":\"Post\\/addHusiness\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"52\",\"name\":\"\\u7f16\\u8f91\\u5546\\u5bb6\",\"status\":\"0\",\"pid\":\"10\",\"addtime\":null,\"url\":\"Post\\/editHusiness\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"53\",\"name\":\"\\u5220\\u9664\\u5546\\u5bb6\",\"status\":\"0\",\"pid\":\"10\",\"addtime\":null,\"url\":\"Post\\/delHusiness\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"11\",\"name\":\"\\u5c0f\\u533a\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Post\\/village\",\"style\":null,\"other\":\"village\",\"lev\":2},{\"id\":\"54\",\"name\":\"\\u65b0\\u589e\\u5c0f\\u533a\\u4fe1\\u606f\",\"status\":\"0\",\"pid\":\"11\",\"addtime\":null,\"url\":\"Post\\/addVillage\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"55\",\"name\":\"\\u7f16\\u8f91\\u5c0f\\u533a\\u4fe1\\u606f\",\"status\":\"0\",\"pid\":\"11\",\"addtime\":null,\"url\":\"Post\\/editVillage\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"56\",\"name\":\"\\u5220\\u9664\\u5c0f\\u533a\\u4fe1\\u606f\",\"status\":\"0\",\"pid\":\"11\",\"addtime\":null,\"url\":\"Post\\/delVillage\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"12\",\"name\":\"\\u8f66\\u4f4d\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Post\\/carPark\",\"style\":null,\"other\":\"carPark\",\"lev\":2},{\"id\":\"57\",\"name\":\"\\u65b0\\u589e\\u8f66\\u4f4d\\u4fe1\\u606f\",\"status\":\"0\",\"pid\":\"12\",\"addtime\":null,\"url\":\"Post\\/addCarPark\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"58\",\"name\":\"\\u7f16\\u8f91\\u8f66\\u4f4d\\u4fe1\\u606f\",\"status\":\"0\",\"pid\":\"12\",\"addtime\":null,\"url\":\"Post\\/editCarPark\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"59\",\"name\":\"\\u5220\\u9664\\u8f66\\u4f4d\\u4fe1\\u606f\",\"status\":\"0\",\"pid\":\"12\",\"addtime\":null,\"url\":\"Post\\/delCarPark\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"3\",\"name\":\"\\u6309\\u63ed\\u7533\\u8bf7\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":null,\"url\":\"Mortgage\\/applyList\",\"style\":\"am-icon-calendar\",\"other\":\"applyList\",\"lev\":1},{\"id\":\"60\",\"name\":\"\\u5220\\u9664\\u6309\\u63ed\\u7533\\u8bf7\\u4fe1\\u606f\",\"status\":\"0\",\"pid\":\"3\",\"addtime\":null,\"url\":\"Mortgage\\/delApply\",\"style\":null,\"other\":null,\"lev\":2},{\"id\":\"61\",\"name\":\"\\u5bfc\\u51fa\\u6309\\u63ed\\u7533\\u8bf7\\u4fe1\\u606f\",\"status\":\"0\",\"pid\":\"3\",\"addtime\":null,\"url\":\"Mortgage\\/downApply\",\"style\":null,\"other\":null,\"lev\":2},{\"id\":\"4\",\"name\":\"\\u8d22\\u52a1\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":null,\"url\":\"finance\",\"style\":null,\"other\":null,\"lev\":1},{\"id\":\"13\",\"name\":\"\\u4e1a\\u52a1\\u63d0\\u6210\",\"status\":\"1\",\"pid\":\"4\",\"addtime\":null,\"url\":\"Mortgage\\/commision\",\"style\":null,\"other\":\"commision\",\"lev\":2},{\"id\":\"14\",\"name\":\"\\u5c0f\\u533a\\u63d0\\u6210\",\"status\":\"1\",\"pid\":\"4\",\"addtime\":null,\"url\":\"Mortgage\\/villageCommision\",\"style\":null,\"other\":\"villageCommision\",\"lev\":2},{\"id\":\"22\",\"name\":\"\\u63d0\\u73b0\\u8bb0\\u5f55\",\"status\":\"1\",\"pid\":\"4\",\"addtime\":null,\"url\":\"Mortgage\\/putForward\",\"style\":null,\"other\":\"putForward\",\"lev\":2},{\"id\":\"21\",\"name\":\"\\u7cfb\\u7edf\\u8bbe\\u7f6e\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":null,\"url\":\"system\",\"style\":null,\"other\":null,\"lev\":1},{\"id\":\"19\",\"name\":\"\\u5c0f\\u7a0b\\u5e8fbanner\",\"status\":\"1\",\"pid\":\"21\",\"addtime\":null,\"url\":\"Home\\/bannerList\",\"style\":null,\"other\":\"bannerList\",\"lev\":2},{\"id\":\"20\",\"name\":\"\\u7cfb\\u7edf\\u65e5\\u5fd7\",\"status\":\"1\",\"pid\":\"21\",\"addtime\":null,\"url\":\"Home\\/systemLog\",\"style\":null,\"other\":\"systemLog\",\"lev\":2},{\"id\":\"62\",\"name\":\"\\u9996\\u9875\",\"status\":\"0\",\"pid\":\"0\",\"addtime\":null,\"url\":\"Home\\/index\",\"style\":null,\"other\":null,\"lev\":1}]', '2018-06-04 15:15:55', '1', '0');
INSERT INTO `hj_admin_user_group` VALUES ('18', 'cs', '{\"2\":{\"value\":{\"id\":\"2\",\"name\":\"\\u5c0f\\u533a\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":null,\"url\":\"village\",\"style\":\"\",\"other\":null,\"lev\":1,\"chick\":[{\"id\":\"6\",\"name\":\"\\u94f6\\u884c\\u4eba\\u5458\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Bank\\/bankPersonnel\",\"style\":null,\"other\":\"bankPersonnel\",\"lev\":2}]}}}', '[{\"id\":\"2\",\"name\":\"\\u5c0f\\u533a\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":null,\"url\":\"village\",\"style\":\"\",\"other\":null,\"lev\":1},{\"id\":\"6\",\"name\":\"\\u94f6\\u884c\\u4eba\\u5458\\u7ba1\\u7406\",\"status\":\"1\",\"pid\":\"2\",\"addtime\":null,\"url\":\"Bank\\/bankPersonnel\",\"style\":null,\"other\":\"bankPersonnel\",\"lev\":2},{\"id\":\"39\",\"name\":\"\\u65b0\\u589e\\u94f6\\u884c\\u4eba\\u5458\",\"status\":\"0\",\"pid\":\"6\",\"addtime\":null,\"url\":\"Bank\\/addBankUser\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"40\",\"name\":\"\\u7f16\\u8f91\\u94f6\\u884c\\u4eba\\u5458\",\"status\":\"0\",\"pid\":\"6\",\"addtime\":null,\"url\":\"Bank\\/editBankUser\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"41\",\"name\":\"\\u5220\\u9664\\u94f6\\u884c\\u4eba\\u5458\",\"status\":\"0\",\"pid\":\"6\",\"addtime\":null,\"url\":\"Bank\\/delBankUser\",\"style\":null,\"other\":null,\"lev\":3},{\"id\":\"62\",\"name\":\"\\u9996\\u9875\",\"status\":\"0\",\"pid\":\"0\",\"addtime\":null,\"url\":\"Home\\/index\",\"style\":null,\"other\":null,\"lev\":1}]', '2018-06-20 11:30:04', '1', '17');

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
  `createUserId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hj_bank
-- ----------------------------
INSERT INTO `hj_bank` VALUES ('2', '兴业银行', '马西纳', '15282455745', '', '2018-04-17 15:26:14', '1', null);
INSERT INTO `hj_bank` VALUES ('3', '招商银行1', '地方', '12584457445', '', '2018-04-17 15:26:14', '2', null);
INSERT INTO `hj_bank` VALUES ('4', '华夏村镇银行', '何林玥', '17708355660', '', '2018-04-22 15:54:05', '9', null);

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
  `createUserId` int(11) DEFAULT NULL,
  PRIMARY KEY (`uId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hj_bank_user
-- ----------------------------
INSERT INTO `hj_bank_user` VALUES ('2', '3', '32424', '2', '32434', '1', '2018-04-17 16:21:59', null, null);
INSERT INTO `hj_bank_user` VALUES ('3', '3', '从', '1', '1234443', '0', '2018-04-17 16:21:59', '9cbf8a4dcb8e30682b927f352d6559a0', null);
INSERT INTO `hj_bank_user` VALUES ('4', '2', '沉重', '2', '15825755477', '1', '2018-04-20 16:22:02', '9cbf8a4dcb8e30682b927f352d6559a0', null);
INSERT INTO `hj_bank_user` VALUES ('7', '2', 'Jon', '1', '18908361805', '1', '2018-10-12 09:20:32', 'e10adc3949ba59abbe56e057f20f883e', '10');

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
  `createUserId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hj_business
-- ----------------------------
INSERT INTO `hj_business` VALUES ('2', '客人', '玩儿玩儿', 'upload/user/18-04-19_154358.png', 'f d f d f s d是的方式的', '23244', '23424', '3', '0', '2018-04-19 15:43:58', null);
INSERT INTO `hj_business` VALUES ('3', '34535', '3445345', null, '345345', '', '', '1', '1', '2018-04-22 15:58:05', null);

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
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `startTime` timestamp NULL DEFAULT NULL COMMENT '开始时间',
  `endTime` timestamp NULL DEFAULT NULL COMMENT '结束时间',
  `content` text COMMENT '简介',
  `remarks` varchar(300) DEFAULT NULL COMMENT '备注',
  `soldNum` int(11) DEFAULT NULL COMMENT '已售数量',
  `carParkNum` int(11) DEFAULT NULL COMMENT '车位数量',
  `carPrice` float DEFAULT NULL COMMENT '均价',
  `createUser` int(11) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`carId`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hj_car_parking
-- ----------------------------
INSERT INTO `hj_car_parking` VALUES ('29', '37', '帝景峰·一期地下车位', '10', null, '82000', '70000', '1', '2018-10-12 09:36:08', null, null, '<p><br></p>', '', '0', '1', '80000', '10');
INSERT INTO `hj_car_parking` VALUES ('30', '37', '帝景峰·一期地下车位', '55', null, '85000', '74000', '1', '2018-10-12 10:03:34', null, null, '<p><br></p>', '', '0', '1', '80000', '10');

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
  `createUserId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hj_developers
-- ----------------------------
INSERT INTO `hj_developers` VALUES ('1', '包里2', '34', '  3434534353423', 'upload/developers/18-04-19_100746.jpg', '1', '包里2', '344', '34', '24575545454', '0', '2018-04-18 19:34:59', '1', null);
INSERT INTO `hj_developers` VALUES ('2', '保利', '我去额', ' 2558754457', null, '1', '保利', '32356964788', '25', '', '0', '2018-04-22 15:56:25', '', null);

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
  `createUserId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hj_sales_company
-- ----------------------------
INSERT INTO `hj_sales_company` VALUES ('5', '四川省恒纪元科技有限公司', '成都市武侯区一环路南一段2号2栋1层15号', '', '1', '胡骞兮', '18280501533', '91510107MA6C6HT37G', null, '', '', '0', '0', '2018-04-22 21:14:27', null);
INSERT INTO `hj_sales_company` VALUES ('6', '德阳一里屋房地产营销代理有限责任公司', '德阳市天山南路358号翠湖花园C1幢13号', '', '5', '刘勇', '15892888343', '91510600MA693TJJ8C', 'https://img.hengjiyuankeji.com/salesCompany1526903016.jpg', '', '', '1', '0', '2018-04-27 15:31:05', null);

-- ----------------------------
-- Table structure for hj_sales_forwork
-- ----------------------------
DROP TABLE IF EXISTS `hj_sales_forwork`;
CREATE TABLE `hj_sales_forwork` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL COMMENT '销售人员Id',
  `amountPrice` decimal(20,0) DEFAULT NULL COMMENT '总金额',
  `status` int(11) DEFAULT '0' COMMENT '状态  0待审核  1已审核  2审核错误',
  `examine` int(11) DEFAULT NULL COMMENT '审核人员id',
  `reflectTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '提现时间',
  `examineTime` timestamp NULL DEFAULT NULL COMMENT '审核时间',
  `month` varchar(10) DEFAULT NULL COMMENT '月份',
  `examineContent` varchar(100) NOT NULL,
  `createUserId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hj_sales_forwork
-- ----------------------------
INSERT INTO `hj_sales_forwork` VALUES ('7', '9', '0', '0', null, '2018-04-26 14:11:48', null, '03', '', null);
INSERT INTO `hj_sales_forwork` VALUES ('8', '12', '0', '0', null, '2018-04-27 17:59:25', null, '03', '', null);

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
  `createUserId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hj_sales_user
-- ----------------------------
INSERT INTO `hj_sales_user` VALUES ('6', '5', '胡骞兮', '2', '', '18280501533', '', null, '200', '0', '2018-04-22 21:15:19', '233c3b729fdfc9ad71eed3cdf3dab800', null);
INSERT INTO `hj_sales_user` VALUES ('7', '5', '乔婷', '2', '', '18508386013', '', null, '200', '0', '2018-04-23 15:45:43', 'ac70de9ebdec8f5085d46768276336d4', null);
INSERT INTO `hj_sales_user` VALUES ('8', '5', '王茹', '2', '', '18280420231', '', null, '200', '0', '2018-04-23 15:46:35', '25d55ad283aa400af464c76d713c07ad', null);
INSERT INTO `hj_sales_user` VALUES ('17', '5', '蓝敏', '2', '1990－07－17', '15108476479', '', null, '200', '0', '2018-07-24 03:06:43', '47b7517a229ae4e0324f1a2a74e703b5', '10');
INSERT INTO `hj_sales_user` VALUES ('18', '5', '曾伟', '1', '', '13419006688', '', null, '200', '0', '2018-07-24 03:08:40', '25d55ad283aa400af464c76d713c07ad', '10');
INSERT INTO `hj_sales_user` VALUES ('19', '5', '蒋武', '1', '', '18908361805', '', null, '200', '0', '2018-07-24 03:09:17', 'a2d46f615fc7ccd4b4e45137d3720fbd', '10');
INSERT INTO `hj_sales_user` VALUES ('20', '6', '刘加强', '1', '', '18981020304', '', null, '200', '0', '2018-08-04 20:44:13', 'e10adc3949ba59abbe56e057f20f883e', '10');
INSERT INTO `hj_sales_user` VALUES ('23', '5', '谌礼俊', '1', '', '13980073227', '', null, '200', '0', '2018-08-15 10:41:14', 'e10adc3949ba59abbe56e057f20f883e', '10');
INSERT INTO `hj_sales_user` VALUES ('24', '6', '周萍', '2', '', '13981036967', '', null, '200', '0', '2018-09-30 10:23:57', 'fa4dfe12b935fef1de21eb6236501de1', '10');
INSERT INTO `hj_sales_user` VALUES ('25', '6', '巫晓明', '1', '', '13548266999', '', null, '200', '0', '2018-09-30 10:25:08', '41b15631caaa37b811afcc0a3a6db9f4', '10');
INSERT INTO `hj_sales_user` VALUES ('26', '6', '马雪', '2', '', '18808100550', '', null, '200', '0', '2018-09-30 10:30:09', 'b853f98f394239ac15ea6a3d908122a7', '10');
INSERT INTO `hj_sales_user` VALUES ('27', '5', '向前', '1', '', '15828277232', '', null, '200', '0', '2018-10-12 12:00:36', 'dc483e80a7a0bd9ef71d8cf973673924', '1');

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
  `examineState` int(11) DEFAULT '0' COMMENT '审核状态    0审核中  1审核通过 2审核不通过 3待定',
  `bankId` int(11) DEFAULT NULL COMMENT '审核人员',
  `examineTime` timestamp NULL DEFAULT NULL COMMENT '审核时间',
  `examineContent` varchar(500) DEFAULT NULL COMMENT '审核意见',
  `extractPrice` decimal(20,0) DEFAULT NULL COMMENT '提成金额',
  `carNum` varchar(50) DEFAULT NULL,
  `bankExtract` int(11) NOT NULL,
  `customerExtract` int(11) NOT NULL,
  `serviceExtract` int(11) NOT NULL,
  `vId` int(11) NOT NULL,
  `dId` int(11) NOT NULL,
  PRIMARY KEY (`mId`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hj_send_apply
-- ----------------------------
INSERT INTO `hj_send_apply` VALUES ('1', '2', '2', '陈华一', '211554445', '', '', '', '', '34234', '200', '32424', '1582587547', '2018-03-21 15:48:32', '0', null, null, null, '200', null, '0', '0', '0', '0', '0');
INSERT INTO `hj_send_apply` VALUES ('4', '2', '4', '11', '55', 'https://wx.hengjiyuankeji.com/1524304866626', 'https://wx.hengjiyuankeji.com/1524304874887', 'https://wx.hengjiyuankeji.com/1524304884096', 'https://wx.hengjiyuankeji.com/1524304894183', '33', '44', '22', '13512343423', '2018-04-21 12:06:57', '2', '4', '2018-04-22 10:44:37', '2424234', '300', null, '0', '0', '0', '0', '0');
INSERT INTO `hj_send_apply` VALUES ('5', '2', '2', 'ddsf', 'sdasdasd', null, null, null, null, null, null, null, null, '2018-04-22 11:11:03', '0', null, null, null, '100', null, '0', '0', '0', '0', '0');
INSERT INTO `hj_send_apply` VALUES ('6', '2', '4', '海洋', '身份证号码', 'https://wx.hengjiyuankeji.com/1524375375877', 'https://wx.hengjiyuankeji.com/1524375381801', 'https://wx.hengjiyuankeji.com/1524375390869', 'https://wx.hengjiyuankeji.com/1524375397339', '岗位', '100', '单位', '17634672676', '2018-04-22 07:36:42', '0', null, null, null, null, null, '0', '0', '0', '0', '0');
INSERT INTO `hj_send_apply` VALUES ('7', '2', '3', '陈华一', '211554445', '', '', '', '', '34234', '200', '32424', '1582587547', '2018-04-22 08:17:10', '0', null, null, null, '500', null, '0', '0', '0', '0', '0');
INSERT INTO `hj_send_apply` VALUES ('8', '4', '5', '海洋', '57655753664367744677', 'https://wx.hengjiyuankeji.com/1524384548300', 'https://wx.hengjiyuankeji.com/1524384552721', 'https://wx.hengjiyuankeji.com/1524384557497', 'https://wx.hengjiyuankeji.com/1524384562065', '火花塞', '5885', '还是很', '15828277232', '2018-04-22 10:09:24', '1', '5', '2018-04-22 16:10:49', 'fdsf', '343', null, '0', '0', '0', '0', '0');
INSERT INTO `hj_send_apply` VALUES ('9', '5', '5', '张亮', '412829198307055614', 'https://wx.hengjiyuankeji.com/1524401559555', 'https://wx.hengjiyuankeji.com/1524401565211', 'https://wx.hengjiyuankeji.com/1524401569806', 'https://wx.hengjiyuankeji.com/1524401576098', '技术', '5588', '可人', '18602818778', '2018-04-22 20:52:59', '0', null, null, null, '343', '5588', '0', '0', '0', '0', '0');
INSERT INTO `hj_send_apply` VALUES ('10', '5', '7', '张亮', '412829198307055614', 'https://wx.hengjiyuankeji.com/1524405618861', 'https://wx.hengjiyuankeji.com/1524405629253', 'https://wx.hengjiyuankeji.com/1524405632688', 'https://wx.hengjiyuankeji.com/1524405637710', '技术', '2588', '可人', '18602818778', '2018-04-22 22:00:38', '0', null, null, null, '0', '5569', '0', '0', '0', '0', '0');
INSERT INTO `hj_send_apply` VALUES ('11', '9', '15', '157734', '43434343', 'https://wx.hengjiyuankeji.com/1524478469068', 'https://wx.hengjiyuankeji.com/1524478473735', 'https://wx.hengjiyuankeji.com/1524478477425', 'https://wx.hengjiyuankeji.com/1524478483382', '2334', '3434', '3242', '15773665532', '2018-04-23 18:15:46', '0', null, null, null, '0', '34343434', '0', '0', '0', '10', '2');
INSERT INTO `hj_send_apply` VALUES ('12', '9', '15', '135', '543136496731581643', 'https://wx.hengjiyuankeji.com/1524478345711', 'https://wx.hengjiyuankeji.com/1524478352588', 'https://wx.hengjiyuankeji.com/1524478361753', 'https://wx.hengjiyuankeji.com/1524478387303', '红', '1585422', '送你', '15854634351', '2018-04-23 18:15:50', '0', null, null, null, '0', '466461', '0', '0', '0', '10', '2');
INSERT INTO `hj_send_apply` VALUES ('13', '8', '10', '测试', '510452166505690425', 'https://wx.hengjiyuankeji.com/1524478619994', 'https://wx.hengjiyuankeji.com/1524478622788', 'https://wx.hengjiyuankeji.com/1524478625760', 'https://wx.hengjiyuankeji.com/1524478628883', '测试', '1', '测试', '18280420255', '2018-04-23 18:17:10', '0', null, null, null, '0', '001', '0', '0', '0', '6', '2');
INSERT INTO `hj_send_apply` VALUES ('14', '9', '15', '122', '111', 'https://wx.hengjiyuankeji.com/1525492186611', 'https://wx.hengjiyuankeji.com/1525492193011', 'https://wx.hengjiyuankeji.com/1525492199241', 'https://wx.hengjiyuankeji.com/1525492206303', '11', '11', '111', '17781454534', '2018-05-05 11:50:07', '0', null, null, null, '0', '111', '0', '0', '0', '10', '2');
INSERT INTO `hj_send_apply` VALUES ('15', '5', '7', '张亮', '412829198307055614', 'https://wx.hengjiyuankeji.com/undefined', 'https://wx.hengjiyuankeji.com/undefined', 'https://wx.hengjiyuankeji.com/undefined', 'https://wx.hengjiyuankeji.com/undefined', '技术', '18888', '可人', '18628187782', '2018-08-03 01:37:25', '0', null, null, null, '0', '川A12355', '0', '0', '0', '5', '2');
INSERT INTO `hj_send_apply` VALUES ('16', '19', '14', 'ghheeheh', '123654197803051456', 'https://wx.hengjiyuankeji.com/undefined', 'https://wx.hengjiyuankeji.com/undefined', 'https://wx.hengjiyuankeji.com/undefined', 'https://wx.hengjiyuankeji.com/undefined', 'dhdjd', '2000000', 'ndndndd', '17898093432', '2018-08-03 01:44:08', '0', null, null, null, '0', '川A12233', '0', '0', '0', '15', '2');
INSERT INTO `hj_send_apply` VALUES ('17', '5', '7', '张', '412836198307055624', 'https://wx.hengjiyuankeji.com/undefined', 'https://wx.hengjiyuankeji.com/undefined', 'https://wx.hengjiyuankeji.com/undefined', 'https://wx.hengjiyuankeji.com/undefined', '技术', '25588', '可人', '18208115165', '2018-08-03 01:52:48', '0', null, null, null, '0', '川A56889', '0', '0', '0', '5', '2');
INSERT INTO `hj_send_apply` VALUES ('18', '19', '12', 'bebebeb', '524654198008079876', 'https://wx.hengjiyuankeji.com/undefined', 'https://wx.hengjiyuankeji.com/undefined', 'https://wx.hengjiyuankeji.com/undefined', 'https://wx.hengjiyuankeji.com/undefined', 'jjenej', '2000000', 'bsjsne', '18907655776', '2018-08-03 01:56:45', '0', null, null, null, '0', '川A12223', '0', '0', '0', '8', '2');
INSERT INTO `hj_send_apply` VALUES ('19', '9', '15', '测试', '543168438433552619', 'https://wx.hengjiyuankeji.com/undefined', 'https://wx.hengjiyuankeji.com/undefined', 'https://wx.hengjiyuankeji.com/undefined', 'https://wx.hengjiyuankeji.com/undefined', 'ormer', '25555', '成林', '15828277332', '2018-08-03 02:07:56', '0', null, null, null, '0', '42351', '0', '0', '0', '10', '2');
INSERT INTO `hj_send_apply` VALUES ('20', '19', '26', 'bsbebsb', '512765198709083765', 'https://wx.hengjiyuankeji.com/undefined', 'https://wx.hengjiyuankeji.com/undefined', 'https://wx.hengjiyuankeji.com/undefined', 'https://wx.hengjiyuankeji.com/undefined', 'bdneen', '200000', 'hejeje', '18907655643', '2018-08-03 03:32:47', '0', null, null, null, '0', '川A13333', '0', '0', '0', '15', '2');
INSERT INTO `hj_send_apply` VALUES ('21', '19', '14', 'beneen', '514987198709063765', 'https://wx.hengjiyuankeji.com/undefined', 'https://wx.hengjiyuankeji.com/undefined', 'https://wx.hengjiyuankeji.com/undefined', 'https://wx.hengjiyuankeji.com/undefined', 'hebebe', '2800000', 'bdbsne', '18709887677', '2018-08-03 03:34:06', '0', null, null, null, '0', '川A12232', '0', '0', '0', '15', '2');
INSERT INTO `hj_send_apply` VALUES ('22', '19', '26', 'hhwwbw', '511678199708083787', 'https://wx.hengjiyuankeji.com/undefined', 'https://wx.hengjiyuankeji.com/undefined', 'https://wx.hengjiyuankeji.com/undefined', 'https://wx.hengjiyuankeji.com/undefined', 'dbebensn', '2000000', 'hsbbwb', '18990878766', '2018-08-03 04:31:04', '0', null, null, null, '0', '川A12345', '0', '0', '0', '15', '2');
INSERT INTO `hj_send_apply` VALUES ('23', '20', '14', 'bsbsns', '511612199809082761', 'https://wx.hengjiyuankeji.com/undefined', 'https://wx.hengjiyuankeji.com/undefined', 'https://wx.hengjiyuankeji.com/undefined', 'https://wx.hengjiyuankeji.com/undefined', 'hwnene', '200000', 'jejsjen', '18909073421', '2018-08-04 20:53:39', '0', null, null, null, '0', '川A12231', '0', '0', '0', '15', '2');
INSERT INTO `hj_send_apply` VALUES ('24', '21', '12', 'jenenen', '511654197909082654', 'https://wx.hengjiyuankeji.com/undefined', 'https://wx.hengjiyuankeji.com/undefined', 'https://wx.hengjiyuankeji.com/undefined', 'https://wx.hengjiyuankeji.com/undefined', 'jejnee', '200000', 'hejenen', '18709876576', '2018-08-04 21:06:02', '0', null, null, null, '0', '川A12221', '0', '0', '0', '8', '2');
INSERT INTO `hj_send_apply` VALUES ('25', '19', '11', 'bwnnww', '512721198809072828', 'https://wx.hengjiyuankeji.com/undefined', 'https://wx.hengjiyuankeji.com/undefined', 'https://wx.hengjiyuankeji.com/undefined', 'https://wx.hengjiyuankeji.com/undefined', 'bwbbe', '2000000', 'nwnwnw', '18709871818', '2018-08-05 01:19:37', '0', null, null, null, '0', '川A12221', '0', '0', '0', '14', '2');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hj_system_banner
-- ----------------------------
INSERT INTO `hj_system_banner` VALUES ('1', '34242', 'https://img.hengjiyuankeji.com/banner1524223996.jpg', '#', null);
INSERT INTO `hj_system_banner` VALUES ('3', '车多位少', 'https://img.hengjiyuankeji.com/banner1524722372.jpg', '#', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=649 DEFAULT CHARSET=utf8;

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
INSERT INTO `hj_system_log` VALUES ('87', 'Mortgage/editApply', '1', '系统创建者', '::1', '1', '审核信息成功,申请信息ID是4', '2018-04-21 19:55:59');
INSERT INTO `hj_system_log` VALUES ('88', 'Mortgage/downApply/1', '0', '沉重', '::1', '1', '导出按揭深审核信息成功,银行人员ID是4', '2018-04-22 10:35:13');
INSERT INTO `hj_system_log` VALUES ('89', 'Mortgage/downApply/1', '0', '沉重', '::1', '1', '导出按揭深审核信息成功,银行人员ID是4', '2018-04-22 10:35:41');
INSERT INTO `hj_system_log` VALUES ('90', 'Mortgage/downApply/1', '0', '沉重', '::1', '1', '导出按揭深审核信息成功,银行人员ID是4', '2018-04-22 10:37:04');
INSERT INTO `hj_system_log` VALUES ('91', 'Mortgage/downApply/1', '1', '系统创建者', '::1', '1', '导出按揭深审核信息成功', '2018-04-22 10:37:24');
INSERT INTO `hj_system_log` VALUES ('92', 'Mortgage/downApply/1', '1', '系统创建者', '::1', '1', '导出按揭深审核信息成功', '2018-04-22 10:39:34');
INSERT INTO `hj_system_log` VALUES ('93', 'Mortgage/editApply', '0', '沉重', '::1', '1', '审核信息成功,申请信息ID是4银行人员ID是：4', '2018-04-22 10:43:04');
INSERT INTO `hj_system_log` VALUES ('94', 'Mortgage/editApply', '0', '沉重', '::1', '1', '审核信息成功,申请信息ID是4银行人员ID是：4', '2018-04-22 10:44:37');
INSERT INTO `hj_system_log` VALUES ('95', 'Member/editJurisdiction', '1', '系统创建者', '::1', '1', '编辑用户组成功', '2018-04-22 11:00:48');
INSERT INTO `hj_system_log` VALUES ('96', 'Member/editJurisdiction', '1', '系统创建者', '::1', '1', '编辑用户组成功', '2018-04-22 12:51:50');
INSERT INTO `hj_system_log` VALUES ('97', 'Post/addSalesUser', '1', '系统创建者', '::1', '1', '新增销售人员成功,销售公司名称是：3,销售人员名称是：chehauyd', '2018-04-22 13:57:36');
INSERT INTO `hj_system_log` VALUES ('98', 'Post/editSalesUser', '1', '系统创建者', '::1', '1', '编辑销售人员成功,销售公司ID是：3,销售人员名称是：chehauyd', '2018-04-22 14:04:49');
INSERT INTO `hj_system_log` VALUES ('99', 'Mortgage/downApply/1', '0', '沉重', '::1', '1', '导出按揭深审核信息成功,银行人员ID是4', '2018-04-22 15:45:20');
INSERT INTO `hj_system_log` VALUES ('100', 'Member/AddCompany', '1', '系统创建者', '::1', '1', '新增公司信息成功,公司名称是恒纪元', '2018-04-22 15:50:22');
INSERT INTO `hj_system_log` VALUES ('101', 'Member/addDepartment', '1', '系统创建者', '::1', '1', '新增部门信息成功,部门名称是营业部', '2018-04-22 15:51:13');
INSERT INTO `hj_system_log` VALUES ('102', 'Bank/addBank', '1', '系统创建者', '::1', '1', '新增银行成功,银行名称：建设银行', '2018-04-22 15:54:05');
INSERT INTO `hj_system_log` VALUES ('103', 'Bank/addBankUser', '1', '系统创建者', '::1', '1', '新增银行管理人员成功,银行编号是：4,银行管理人员名称是：ceshi111', '2018-04-22 15:55:11');
INSERT INTO `hj_system_log` VALUES ('104', 'Post/addDevel', '1', '系统创建者', '::1', '1', '新增开发商成功,开发商名称是：保利', '2018-04-22 15:56:25');
INSERT INTO `hj_system_log` VALUES ('105', 'Post/AddCompany', '1', '系统创建者', '::1', '1', '新增销售公司成功,销售公司名称是：测试23232323', '2018-04-22 15:56:53');
INSERT INTO `hj_system_log` VALUES ('106', 'Post/addSalesUser', '1', '系统创建者', '::1', '1', '新增销售人员成功,销售公司名称是：4,销售人员名称是：是违规', '2018-04-22 15:57:36');
INSERT INTO `hj_system_log` VALUES ('107', 'Post/addHusiness', '1', '系统创建者', '::1', '1', '新增商家成功,商家名称是：34535', '2018-04-22 15:58:05');
INSERT INTO `hj_system_log` VALUES ('108', 'Post/addVillage', '1', '系统创建者', '::1', '1', '新增小区信息成功,小区名称是：保利心语', '2018-04-22 15:59:25');
INSERT INTO `hj_system_log` VALUES ('109', 'Post/editVillage', '1', '系统创建者', '::1', '1', '编辑小区信息成功,小区名称是：保利心语,小区编号是:3', '2018-04-22 15:59:39');
INSERT INTO `hj_system_log` VALUES ('110', 'Post/addCarPark', '1', '系统创建者', '::1', '1', '新增车位信息成功,车位名称是：车位1', '2018-04-22 16:00:48');
INSERT INTO `hj_system_log` VALUES ('111', 'Mortgage/editApply', '0', 'ceshi111', '::1', '1', '审核信息成功,申请信息ID是8银行人员ID是：5', '2018-04-22 16:10:49');
INSERT INTO `hj_system_log` VALUES ('112', 'Home/addBanner', '1', '系统创建者', '::1', '1', '新增banner成功,banner名称是：2', '2018-04-22 16:12:00');
INSERT INTO `hj_system_log` VALUES ('113', 'Home/delBanner', '1', '系统创建者', '::1', '1', '删除banner成功,bannerId是:', '2018-04-22 16:21:25');
INSERT INTO `hj_system_log` VALUES ('114', 'Member/addGroup', '1', '系统创建者', '192.168.1.9', '1', '新增用户组成功', '2018-04-22 16:43:33');
INSERT INTO `hj_system_log` VALUES ('115', 'Post/editVillage', '1', '系统创建者', '192.168.1.9', '1', '编辑小区信息成功,小区名称是：保利心语,小区编号是:3', '2018-04-22 17:39:58');
INSERT INTO `hj_system_log` VALUES ('116', 'Post/editVillage', '1', '系统创建者', '192.168.1.9', '1', '编辑小区信息成功,小区名称是：保利心语,小区编号是:3', '2018-04-22 17:40:21');
INSERT INTO `hj_system_log` VALUES ('117', 'Member/editJurisdiction', '1', '系统创建者', '171.221.136.49', '1', '编辑用户组成功', '2018-04-22 19:07:28');
INSERT INTO `hj_system_log` VALUES ('118', 'Post/addSalesUser', '1', '系统创建者', '171.221.136.49', '1', '新增销售人员成功,销售公司名称是：4,销售人员名称是：张亮', '2018-04-22 19:10:37');
INSERT INTO `hj_system_log` VALUES ('119', 'Post/editVillage', '1', '系统创建者', '171.221.136.49', '1', '编辑小区信息成功,小区名称是：保利心语,小区编号是:3', '2018-04-22 19:11:00');
INSERT INTO `hj_system_log` VALUES ('120', 'Member/delCompany', '1', '系统创建者', '223.87.199.194', '1', '修改公司信息成功,公司id是3', '2018-04-22 20:59:04');
INSERT INTO `hj_system_log` VALUES ('121', 'Member/delCompany', '1', '系统创建者', '223.87.199.194', '1', '修改公司信息成功,公司id是2', '2018-04-22 20:59:08');
INSERT INTO `hj_system_log` VALUES ('122', 'Member/editCompany', '1', '系统创建者', '223.87.199.194', '1', '修改公司信息成功,公司名称是四川恒纪元科技有限公司', '2018-04-22 20:59:21');
INSERT INTO `hj_system_log` VALUES ('123', 'Member/editDepartment', '1', '系统创建者', '223.87.199.194', '1', '新增部门信息成功,部门名称是技术部', '2018-04-22 20:59:51');
INSERT INTO `hj_system_log` VALUES ('124', 'Member/editDepartment', '1', '系统创建者', '223.87.199.194', '1', '新增部门信息成功,部门名称是营业部', '2018-04-22 21:00:11');
INSERT INTO `hj_system_log` VALUES ('125', 'Member/delGroup', '1', '系统创建者', '223.87.199.194', '1', '删除用户组成功', '2018-04-22 21:00:17');
INSERT INTO `hj_system_log` VALUES ('126', 'Member/EditUser', '1', '系统创建者', '223.87.199.194', '1', '编辑用户成功,用户id是:1', '2018-04-22 21:01:02');
INSERT INTO `hj_system_log` VALUES ('127', 'Post/delVillage', '1', '系统创建者', '223.87.199.194', '1', '删除小区信息成功,小区名称是：问打,小区编号是:2', '2018-04-22 21:01:55');
INSERT INTO `hj_system_log` VALUES ('128', 'Post/delVillage', '1', '系统创建者', '223.87.199.194', '1', '删除小区信息成功,小区名称是：美年1,小区编号是:1', '2018-04-22 21:02:02');
INSERT INTO `hj_system_log` VALUES ('129', 'Post/delVillage', '1', '系统创建者', '223.87.199.194', '1', '删除小区信息成功,小区名称是：保利心语,小区编号是:3', '2018-04-22 21:02:07');
INSERT INTO `hj_system_log` VALUES ('130', 'Post/delCompany', '1', '系统创建者', '223.87.199.194', '1', '删除销售公司成功,销售公司名称是：测试23232323,开发商id是：4', '2018-04-22 21:13:04');
INSERT INTO `hj_system_log` VALUES ('131', 'Post/delCompany', '1', '系统创建者', '223.87.199.194', '1', '删除销售公司成功,销售公司名称是：测试公司,开发商id是：3', '2018-04-22 21:13:10');
INSERT INTO `hj_system_log` VALUES ('132', 'Post/delCompany', '1', '系统创建者', '223.87.199.194', '1', '删除销售公司成功,销售公司名称是：的方式发送,开发商id是：2', '2018-04-22 21:13:14');
INSERT INTO `hj_system_log` VALUES ('133', 'Post/AddCompany', '1', '系统创建者', '223.87.199.194', '1', '新增销售公司成功,销售公司名称是：四川省恒纪元科技有限公司', '2018-04-22 21:14:27');
INSERT INTO `hj_system_log` VALUES ('134', 'Post/delSalesUser', '1', '系统创建者', '223.87.199.194', '1', '删除销售人员成功,销售人员id是：4,销售人员名称是：是违规', '2018-04-22 21:14:36');
INSERT INTO `hj_system_log` VALUES ('135', 'Post/delSalesUser', '1', '系统创建者', '223.87.199.194', '1', '删除销售人员成功,销售人员id是：2,销售人员名称是：海运费', '2018-04-22 21:14:40');
INSERT INTO `hj_system_log` VALUES ('136', 'Post/delSalesUser', '1', '系统创建者', '223.87.199.194', '1', '删除销售人员成功,销售人员id是：3,销售人员名称是：chehauyd', '2018-04-22 21:14:44');
INSERT INTO `hj_system_log` VALUES ('137', 'Post/addSalesUser', '1', '系统创建者', '223.87.199.194', '1', '新增销售人员成功,销售公司名称是：5,销售人员名称是：胡骞兮', '2018-04-22 21:15:19');
INSERT INTO `hj_system_log` VALUES ('138', 'Post/addVillage', '1', '系统创建者', '223.87.199.194', '1', '新增小区信息成功,小区名称是：珠江青云台', '2018-04-22 21:22:01');
INSERT INTO `hj_system_log` VALUES ('139', 'Post/editSalesUser', '1', '系统创建者', '223.87.199.194', '1', '编辑销售人员成功,销售公司ID是：5,销售人员名称是：胡骞兮', '2018-04-22 21:22:48');
INSERT INTO `hj_system_log` VALUES ('140', 'Post/editSalesUser', '1', '系统创建者', '223.87.199.194', '1', '编辑销售人员成功,销售公司ID是：5,销售人员名称是：张亮', '2018-04-22 21:23:16');
INSERT INTO `hj_system_log` VALUES ('141', 'Post/addVillage', '1', '系统创建者', '223.87.199.194', '1', '新增小区信息成功,小区名称是：天府逸家一期', '2018-04-22 21:26:23');
INSERT INTO `hj_system_log` VALUES ('142', 'Post/delCarPark', '1', '系统创建者', '223.87.199.194', '1', '删除车位信息成功,车位名称是：车位1,车位id是:5', '2018-04-22 21:27:27');
INSERT INTO `hj_system_log` VALUES ('143', 'Post/delCarPark', '1', '系统创建者', '223.87.199.194', '1', '删除车位信息成功,车位名称是：4234,车位id是:4', '2018-04-22 21:27:32');
INSERT INTO `hj_system_log` VALUES ('144', 'Post/delCarPark', '1', '系统创建者', '223.87.199.194', '1', '删除车位信息成功,车位名称是：34242,车位id是:3', '2018-04-22 21:27:37');
INSERT INTO `hj_system_log` VALUES ('145', 'Post/delCarPark', '1', '系统创建者', '223.87.199.194', '1', '删除车位信息成功,车位名称是：美岸001,车位id是:2', '2018-04-22 21:27:41');
INSERT INTO `hj_system_log` VALUES ('146', 'Post/addVillage', '1', '系统创建者', '223.87.199.194', '1', '新增小区信息成功,小区名称是：龙城一号', '2018-04-22 21:30:29');
INSERT INTO `hj_system_log` VALUES ('147', 'Post/addVillage', '1', '系统创建者', '223.87.199.194', '1', '新增小区信息成功,小区名称是：珠江国际花园', '2018-04-22 21:32:46');
INSERT INTO `hj_system_log` VALUES ('148', 'Post/addVillage', '1', '系统创建者', '223.87.199.194', '1', '新增小区信息成功,小区名称是：ICON尚郡', '2018-04-22 21:34:41');
INSERT INTO `hj_system_log` VALUES ('149', 'Post/addVillage', '1', '系统创建者', '223.87.199.194', '1', '新增小区信息成功,小区名称是：明信城1期', '2018-04-22 21:35:29');
INSERT INTO `hj_system_log` VALUES ('150', 'Post/addVillage', '1', '系统创建者', '223.87.199.194', '1', '新增小区信息成功,小区名称是：金河谷', '2018-04-22 21:37:14');
INSERT INTO `hj_system_log` VALUES ('151', 'Post/addVillage', '1', '系统创建者', '223.87.199.194', '1', '新增小区信息成功,小区名称是：地铁首座', '2018-04-22 21:38:49');
INSERT INTO `hj_system_log` VALUES ('152', 'Post/addVillage', '1', '系统创建者', '223.87.199.194', '1', '新增小区信息成功,小区名称是：边城水恋', '2018-04-22 21:40:22');
INSERT INTO `hj_system_log` VALUES ('153', 'Post/addVillage', '1', '系统创建者', '223.87.199.194', '1', '新增小区信息成功,小区名称是：上龙门', '2018-04-22 21:41:36');
INSERT INTO `hj_system_log` VALUES ('154', 'Post/addVillage', '1', '系统创建者', '223.87.199.194', '1', '新增小区信息成功,小区名称是：西班牙森林', '2018-04-22 21:43:01');
INSERT INTO `hj_system_log` VALUES ('155', 'Post/addVillage', '1', '系统创建者', '223.87.199.194', '1', '新增小区信息成功,小区名称是：师大现代花园', '2018-04-22 21:44:30');
INSERT INTO `hj_system_log` VALUES ('156', 'Post/addVillage', '1', '系统创建者', '223.87.199.194', '1', '新增小区信息成功,小区名称是：银城东方国际', '2018-04-22 21:45:55');
INSERT INTO `hj_system_log` VALUES ('157', 'Post/addVillage', '1', '系统创建者', '223.87.199.194', '1', '新增小区信息成功,小区名称是：海骏达蜀都1号凯悦', '2018-04-22 21:47:04');
INSERT INTO `hj_system_log` VALUES ('158', 'Post/addVillage', '1', '系统创建者', '223.87.199.194', '1', '新增小区信息成功,小区名称是：雄飞生活广场', '2018-04-22 21:47:31');
INSERT INTO `hj_system_log` VALUES ('159', 'Post/addVillage', '1', '系统创建者', '223.87.199.194', '1', '新增小区信息成功,小区名称是：招商依云上城', '2018-04-22 21:47:58');
INSERT INTO `hj_system_log` VALUES ('160', 'Post/addVillage', '1', '系统创建者', '223.87.199.194', '1', '新增小区信息成功,小区名称是：东城之星观邸', '2018-04-22 21:48:42');
INSERT INTO `hj_system_log` VALUES ('161', 'Post/addVillage', '1', '系统创建者', '223.87.199.194', '1', '新增小区信息成功,小区名称是：百悦城百悦天鹅湖', '2018-04-22 21:49:18');
INSERT INTO `hj_system_log` VALUES ('162', 'Post/addVillage', '1', '系统创建者', '223.87.199.194', '1', '新增小区信息成功,小区名称是：林溪康城', '2018-04-22 21:49:41');
INSERT INTO `hj_system_log` VALUES ('163', 'Post/addVillage', '1', '系统创建者', '223.87.199.194', '1', '新增小区信息成功,小区名称是：首创万卷山', '2018-04-22 21:50:07');
INSERT INTO `hj_system_log` VALUES ('164', 'Post/addVillage', '1', '系统创建者', '223.87.199.194', '1', '新增小区信息成功,小区名称是：佳兆业丽晶公馆', '2018-04-22 21:50:32');
INSERT INTO `hj_system_log` VALUES ('165', 'Post/addVillage', '1', '系统创建者', '223.87.199.194', '1', '新增小区信息成功,小区名称是：置信学府杏林', '2018-04-22 21:51:08');
INSERT INTO `hj_system_log` VALUES ('166', 'Post/addVillage', '1', '系统创建者', '223.87.199.194', '1', '新增小区信息成功,小区名称是：首创东公元', '2018-04-22 21:51:35');
INSERT INTO `hj_system_log` VALUES ('167', 'Post/addVillage', '1', '系统创建者', '223.87.199.194', '1', '新增小区信息成功,小区名称是：越鞠苑二期', '2018-04-22 21:52:21');
INSERT INTO `hj_system_log` VALUES ('168', 'Post/addVillage', '1', '系统创建者', '223.87.199.194', '1', '新增小区信息成功,小区名称是：金色鱼凫', '2018-04-22 21:52:46');
INSERT INTO `hj_system_log` VALUES ('169', 'Post/addVillage', '1', '系统创建者', '223.87.199.194', '1', '新增小区信息成功,小区名称是：世茂城', '2018-04-22 21:53:13');
INSERT INTO `hj_system_log` VALUES ('170', 'Post/addVillage', '1', '系统创建者', '223.87.199.194', '1', '新增小区信息成功,小区名称是：福泉中心', '2018-04-22 21:53:36');
INSERT INTO `hj_system_log` VALUES ('171', 'Post/addVillage', '1', '系统创建者', '223.87.199.194', '1', '新增小区信息成功,小区名称是：珠江御景湾', '2018-04-22 21:53:59');
INSERT INTO `hj_system_log` VALUES ('172', 'Post/addVillage', '1', '系统创建者', '223.87.199.194', '1', '新增小区信息成功,小区名称是：棕榈印象', '2018-04-22 21:54:23');
INSERT INTO `hj_system_log` VALUES ('173', 'Post/addVillage', '1', '系统创建者', '223.87.199.194', '1', '新增小区信息成功,小区名称是：中国铁建国际城', '2018-04-22 21:54:44');
INSERT INTO `hj_system_log` VALUES ('174', 'Post/addCarPark', '1', '系统创建者', '223.87.199.194', '1', '新增车位信息成功,车位名称是：地下车位', '2018-04-22 21:56:42');
INSERT INTO `hj_system_log` VALUES ('175', 'Post/addCarPark', '1', '系统创建者', '223.87.199.194', '1', '新增车位信息成功,车位名称是：地下车位', '2018-04-22 21:58:04');
INSERT INTO `hj_system_log` VALUES ('176', 'Post/addCarPark', '1', '系统创建者', '223.87.199.194', '1', '新增车位信息成功,车位名称是：地下车位', '2018-04-22 21:58:52');
INSERT INTO `hj_system_log` VALUES ('177', 'Post/addCarPark', '1', '系统创建者', '223.87.199.194', '1', '新增车位信息成功,车位名称是：地下车位', '2018-04-22 22:01:57');
INSERT INTO `hj_system_log` VALUES ('178', 'Post/addCarPark', '1', '系统创建者', '223.87.199.194', '1', '新增车位信息成功,车位名称是：地下车位', '2018-04-22 22:02:34');
INSERT INTO `hj_system_log` VALUES ('179', 'Post/addCarPark', '1', '系统创建者', '223.87.199.194', '1', '新增车位信息成功,车位名称是：地下车位', '2018-04-22 22:03:21');
INSERT INTO `hj_system_log` VALUES ('180', 'Post/addCarPark', '1', '系统创建者', '223.87.199.194', '1', '新增车位信息成功,车位名称是：地下车位', '2018-04-22 22:04:00');
INSERT INTO `hj_system_log` VALUES ('181', 'Post/addCarPark', '1', '系统创建者', '223.87.199.194', '1', '新增车位信息成功,车位名称是：地下车位', '2018-04-22 22:04:49');
INSERT INTO `hj_system_log` VALUES ('182', 'Post/addCarPark', '1', '系统创建者', '223.87.199.194', '1', '新增车位信息成功,车位名称是：地下车位', '2018-04-22 22:05:26');
INSERT INTO `hj_system_log` VALUES ('183', 'Post/addCarPark', '1', '系统创建者', '223.87.199.194', '1', '新增车位信息成功,车位名称是：地下车位', '2018-04-22 22:06:28');
INSERT INTO `hj_system_log` VALUES ('184', 'Post/addCarPark', '1', '系统创建者', '223.87.199.194', '1', '新增车位信息成功,车位名称是：地下车位', '2018-04-22 22:07:40');
INSERT INTO `hj_system_log` VALUES ('185', 'Post/editVillage', '1', '系统创建者', '223.87.199.194', '1', '编辑小区信息成功,小区名称是：珠江青云台,小区编号是:4', '2018-04-22 22:08:50');
INSERT INTO `hj_system_log` VALUES ('186', 'Post/editSalesUser', '1', '系统创建者', '223.87.199.194', '1', '编辑销售人员成功,销售公司ID是：5,销售人员名称是：胡骞兮', '2018-04-22 22:11:00');
INSERT INTO `hj_system_log` VALUES ('187', 'Post/addSalesUser', '1', '胡骞兮', '171.213.12.244', '1', '新增销售人员成功,销售公司名称是：5,销售人员名称是：乔婷', '2018-04-23 15:45:43');
INSERT INTO `hj_system_log` VALUES ('188', 'Post/addSalesUser', '1', '胡骞兮', '171.213.12.244', '1', '新增销售人员成功,销售公司名称是：5,销售人员名称是：王茹', '2018-04-23 15:46:35');
INSERT INTO `hj_system_log` VALUES ('189', 'Post/editSalesUser', '1', '胡骞兮', '171.213.12.244', '1', '编辑销售人员成功,销售公司ID是：5,销售人员名称是：王茹', '2018-04-23 15:47:14');
INSERT INTO `hj_system_log` VALUES ('190', 'Post/editVillage', '1', '胡骞兮', '171.221.138.157', '1', '编辑小区信息成功,小区名称是：珠江青云台,小区编号是:4', '2018-04-23 16:05:20');
INSERT INTO `hj_system_log` VALUES ('191', 'Member/AddUser', '1', '胡骞兮', '171.213.12.244', '1', '新增用户信息成功,用户登陆账户是18280420231', '2018-04-23 17:23:11');
INSERT INTO `hj_system_log` VALUES ('192', 'Post/editVillage', '1', '胡骞兮', '171.213.12.244', '1', '编辑小区信息成功,小区名称是：珠江青云台,小区编号是:4', '2018-04-23 17:23:55');
INSERT INTO `hj_system_log` VALUES ('193', 'Post/editVillage', '1', '胡骞兮', '171.213.12.244', '1', '编辑小区信息成功,小区名称是：龙城一号,小区编号是:6', '2018-04-23 17:26:10');
INSERT INTO `hj_system_log` VALUES ('194', 'Post/editCarPark', '1', '胡骞兮', '171.213.12.244', '1', '编辑车位信息成功,车位名称是：地下车位,车位id是：10', '2018-04-23 17:26:41');
INSERT INTO `hj_system_log` VALUES ('195', 'Post/editCarPark', '1', '胡骞兮', '171.213.12.244', '1', '编辑车位信息成功,车位名称是：地下车位,车位id是：10', '2018-04-23 17:27:13');
INSERT INTO `hj_system_log` VALUES ('196', 'Post/editVillage', '1', '胡骞兮', '171.213.12.244', '1', '编辑小区信息成功,小区名称是：珠江青云台,小区编号是:4', '2018-04-23 17:27:34');
INSERT INTO `hj_system_log` VALUES ('197', 'Post/editVillage', '1', '胡骞兮', '171.213.12.244', '1', '编辑小区信息成功,小区名称是：龙城一号,小区编号是:6', '2018-04-23 17:28:04');
INSERT INTO `hj_system_log` VALUES ('198', 'Post/addVillage', '1', '胡骞兮', '171.213.12.244', '1', '新增小区信息成功,小区名称是：122', '2018-04-23 17:29:09');
INSERT INTO `hj_system_log` VALUES ('199', 'Post/delVillage', '1', '胡骞兮', '171.213.12.244', '1', '删除小区信息成功,小区名称是：122,小区编号是:34', '2018-04-23 17:29:32');
INSERT INTO `hj_system_log` VALUES ('200', 'Post/editVillage', '1', '胡骞兮', '171.213.12.244', '1', '编辑小区信息成功,小区名称是：龙城一号,小区编号是:6', '2018-04-23 17:38:14');
INSERT INTO `hj_system_log` VALUES ('201', 'Post/editVillage', '1', '胡骞兮', '171.213.12.244', '1', '编辑小区信息成功,小区名称是：龙城一号,小区编号是:6', '2018-04-23 17:39:57');
INSERT INTO `hj_system_log` VALUES ('202', 'Post/editCarPark', '1', '胡骞兮', '171.213.12.244', '1', '编辑车位信息成功,车位名称是：地下车位,车位id是：10', '2018-04-23 17:40:15');
INSERT INTO `hj_system_log` VALUES ('203', 'Post/addSalesUser', '1', '胡骞兮', '171.221.138.157', '1', '新增销售人员成功,销售公司名称是：5,销售人员名称是：陈海洋', '2018-04-23 18:02:13');
INSERT INTO `hj_system_log` VALUES ('204', 'Post/editVillage', '1', '胡骞兮', '171.221.138.157', '1', '编辑小区信息成功,小区名称是：金河谷,小区编号是:10', '2018-04-23 18:02:58');
INSERT INTO `hj_system_log` VALUES ('205', 'Post/addVillage', '1', '胡骞兮', '171.221.138.157', '1', '新增小区信息成功,小区名称是：3424', '2018-04-24 17:21:06');
INSERT INTO `hj_system_log` VALUES ('206', 'Post/delVillage', '1', '胡骞兮', '171.221.138.157', '1', '删除小区信息成功,小区名称是：3424,小区编号是:35', '2018-04-24 17:21:22');
INSERT INTO `hj_system_log` VALUES ('207', 'Member/addGroup', '1', '胡骞兮', '171.221.138.157', '1', '新增用户组成功', '2018-04-24 17:33:51');
INSERT INTO `hj_system_log` VALUES ('208', 'Member/delGroup', '1', '胡骞兮', '171.221.138.157', '1', '删除用户组成功', '2018-04-24 17:34:00');
INSERT INTO `hj_system_log` VALUES ('209', 'Member/editJurisdiction', '1', '胡骞兮', '171.221.138.157', '1', '编辑用户组成功', '2018-04-24 17:34:14');
INSERT INTO `hj_system_log` VALUES ('210', 'Member/AddUser', '1', '胡骞兮', '171.221.138.157', '1', '新增用户信息成功,用户登陆账户是admin123', '2018-04-24 17:35:09');
INSERT INTO `hj_system_log` VALUES ('211', 'Member/editGroup', '1', '胡骞兮', '171.221.138.157', '1', '编辑用户组成功', '2018-04-24 17:43:39');
INSERT INTO `hj_system_log` VALUES ('212', 'Post/addSalesUser', '1', '胡骞兮', '171.221.140.238', '1', '新增销售人员成功,销售公司名称是：5,销售人员名称是：康奕豪', '2018-04-26 09:48:59');
INSERT INTO `hj_system_log` VALUES ('213', 'Member/editJurisdiction', '1', '胡骞兮', '118.113.0.10', '1', '编辑用户组成功', '2018-04-26 10:17:54');
INSERT INTO `hj_system_log` VALUES ('214', 'Member/editCompany', '1', '胡骞兮', '171.221.140.238', '1', '修改公司信息成功,公司名称是四川恒纪元科技有限公司', '2018-04-26 12:07:06');
INSERT INTO `hj_system_log` VALUES ('215', 'Member/editJurisdiction', '1', '胡骞兮', '171.221.140.238', '1', '编辑用户组成功', '2018-04-26 12:07:55');
INSERT INTO `hj_system_log` VALUES ('216', 'Member/editJurisdiction', '1', '胡骞兮', '171.221.140.238', '1', '编辑用户组成功', '2018-04-26 12:08:17');
INSERT INTO `hj_system_log` VALUES ('217', 'Member/editJurisdiction', '1', '胡骞兮', '171.221.140.238', '1', '编辑用户组成功', '2018-04-26 12:08:26');
INSERT INTO `hj_system_log` VALUES ('218', 'Bank/editBank', '1', '胡骞兮', '171.221.140.238', '1', '编辑银行成功,银行名称：建设银行', '2018-04-26 12:09:11');
INSERT INTO `hj_system_log` VALUES ('219', 'Home/addBanner', '1', '胡骞兮', '118.113.0.10', '1', '新增banner成功,banner名称是：车多位少', '2018-04-26 13:59:33');
INSERT INTO `hj_system_log` VALUES ('220', 'Member/EditUser', '1', '胡骞兮', '171.221.140.238', '1', '编辑用户成功,用户id是:3', '2018-04-26 14:10:59');
INSERT INTO `hj_system_log` VALUES ('221', 'Member/editJurisdiction', '1', '胡骞兮', '118.113.0.10', '1', '编辑用户组成功', '2018-04-26 14:38:22');
INSERT INTO `hj_system_log` VALUES ('222', 'Bank/editBankUser', '1', '胡骞兮', '118.113.0.10', '1', '编辑银行管理人员成功,银行编号是：2,银行管理人员名称是：沉重', '2018-04-27 14:12:08');
INSERT INTO `hj_system_log` VALUES ('223', 'Post/AddCompany', '1', '胡骞兮', '171.221.140.238', '1', '新增销售公司成功,销售公司名称是：德阳一里屋房地产营销代理有限责任公司', '2018-04-27 15:31:05');
INSERT INTO `hj_system_log` VALUES ('224', 'Post/addSalesUser', '1', '胡骞兮', '171.221.140.238', '1', '新增销售人员成功,销售公司名称是：6,销售人员名称是：吴刚', '2018-04-27 15:32:52');
INSERT INTO `hj_system_log` VALUES ('225', 'Member/AddCompany', '1', '胡骞兮', '171.221.140.238', '1', '新增公司信息成功,公司名称是德阳一里屋房地产营销代理有限责任公司', '2018-04-27 15:36:13');
INSERT INTO `hj_system_log` VALUES ('226', 'Member/addGroup', '1', '胡骞兮', '171.221.140.238', '1', '新增用户组成功', '2018-04-27 15:37:29');
INSERT INTO `hj_system_log` VALUES ('227', 'Member/editJurisdiction', '1', '胡骞兮', '171.221.140.238', '1', '编辑用户组成功', '2018-04-27 15:38:23');
INSERT INTO `hj_system_log` VALUES ('228', 'Member/AddUser', '1', '胡骞兮', '171.221.140.238', '1', '新增用户信息成功,用户登陆账户是13890242274', '2018-04-27 15:39:41');
INSERT INTO `hj_system_log` VALUES ('229', 'Member/AddUser', '1', '胡骞兮', '171.221.140.238', '1', '新增用户信息成功,用户登陆账户是13890260176', '2018-04-27 15:41:01');
INSERT INTO `hj_system_log` VALUES ('230', 'Post/editCompany', '1', '胡骞兮', '171.221.140.238', '1', '编辑销售公司成功,销售公司名称是：德阳一里屋房地产营销代理有限责任公司', '2018-04-27 15:42:00');
INSERT INTO `hj_system_log` VALUES ('231', 'Post/editSalesUser', '1', '胡骞兮', '171.221.140.238', '1', '编辑销售人员成功,销售公司ID是：6,销售人员名称是：吴刚', '2018-04-27 15:42:21');
INSERT INTO `hj_system_log` VALUES ('232', 'Member/editJurisdiction', '1', '胡骞兮', '171.221.140.238', '1', '编辑用户组成功', '2018-04-27 15:44:22');
INSERT INTO `hj_system_log` VALUES ('233', 'Post/editSalesUser', '6', '代敏', '171.221.140.238', '1', '编辑销售人员成功,销售公司ID是：6,销售人员名称是：兰刚', '2018-04-27 15:49:42');
INSERT INTO `hj_system_log` VALUES ('234', 'Post/addSalesUser', '1', '胡骞兮', '118.113.0.10', '1', '新增销售人员成功,销售公司名称是：5,销售人员名称是：游向前', '2018-04-27 17:47:04');
INSERT INTO `hj_system_log` VALUES ('235', 'Post/addSalesUser', '1', '胡骞兮', '171.221.140.238', '1', '新增销售人员成功,销售公司名称是：5,销售人员名称是：陈文彰', '2018-04-28 14:14:56');
INSERT INTO `hj_system_log` VALUES ('236', 'Member/EditUser', '1', '胡骞兮', '118.113.0.223', '1', '编辑用户成功,用户id是:1', '2018-05-07 09:42:40');
INSERT INTO `hj_system_log` VALUES ('237', 'Post/editSalesUser', '1', '胡骞兮', '118.113.0.223', '1', '编辑销售人员成功,销售公司ID是：5,销售人员名称是：胡骞兮', '2018-05-07 09:44:22');
INSERT INTO `hj_system_log` VALUES ('238', 'Post/editSalesUser', '1', '胡骞兮', '118.113.0.223', '1', '编辑销售人员成功,销售公司ID是：5,销售人员名称是：胡骞兮', '2018-05-07 09:45:06');
INSERT INTO `hj_system_log` VALUES ('239', 'Post/editSalesUser', '1', '胡骞兮', '171.221.137.227', '1', '编辑销售人员成功,销售公司ID是：5,销售人员名称是：陈文彰', '2018-05-10 19:23:01');
INSERT INTO `hj_system_log` VALUES ('240', 'Post/editSalesUser', '1', '胡骞兮', '171.221.137.227', '1', '编辑销售人员成功,销售公司ID是：5,销售人员名称是：陈文彰', '2018-05-10 19:23:34');
INSERT INTO `hj_system_log` VALUES ('241', 'Post/editSalesUser', '1', '胡骞兮', '171.221.137.227', '1', '编辑销售人员成功,销售公司ID是：5,销售人员名称是：陈文彰', '2018-05-10 19:24:00');
INSERT INTO `hj_system_log` VALUES ('242', 'Post/editSalesUser', '1', '胡骞兮', '171.221.137.227', '1', '编辑销售人员成功,销售公司ID是：5,销售人员名称是：陈文彰', '2018-05-10 19:24:52');
INSERT INTO `hj_system_log` VALUES ('243', 'Post/editSalesUser', '1', '胡骞兮', '171.221.137.227', '1', '编辑销售人员成功,销售公司ID是：5,销售人员名称是：陈文彰', '2018-05-10 19:26:51');
INSERT INTO `hj_system_log` VALUES ('244', 'Post/editSalesUser', '1', '胡骞兮', '171.221.137.227', '1', '编辑销售人员成功,销售公司ID是：5,销售人员名称是：陈文彰', '2018-05-10 19:27:11');
INSERT INTO `hj_system_log` VALUES ('245', 'Post/editSalesUser', '1', '胡骞兮', '171.221.137.227', '1', '编辑销售人员成功,销售公司ID是：5,销售人员名称是：陈文彰', '2018-05-10 19:31:42');
INSERT INTO `hj_system_log` VALUES ('246', 'Post/editSalesUser', '1', '胡骞兮', '171.221.137.227', '1', '编辑销售人员成功,销售公司ID是：5,销售人员名称是：陈文彰', '2018-05-10 19:50:29');
INSERT INTO `hj_system_log` VALUES ('247', 'Post/delSalesUser', '1', '胡骞兮', '171.221.137.227', '1', '删除销售人员成功,销售人员id是：13,销售人员名称是：陈文彰', '2018-05-10 19:51:08');
INSERT INTO `hj_system_log` VALUES ('248', 'Post/addSalesUser', '1', '胡骞兮', '171.221.137.227', '1', '新增销售人员成功,销售公司名称是：5,销售人员名称是：陈文 彰', '2018-05-10 19:52:03');
INSERT INTO `hj_system_log` VALUES ('249', 'Post/editSalesUser', '1', '胡骞兮', '171.221.137.227', '1', '编辑销售人员成功,销售公司ID是：5,销售人员名称是：陈文彰', '2018-05-10 19:52:50');
INSERT INTO `hj_system_log` VALUES ('250', 'Post/editSalesUser', '1', '胡骞兮', '171.221.137.227', '1', '编辑销售人员成功,销售公司ID是：5,销售人员名称是：陈文彰', '2018-05-10 19:53:13');
INSERT INTO `hj_system_log` VALUES ('251', 'Post/delSalesUser', '1', '胡骞兮', '171.221.137.227', '1', '删除销售人员成功,销售人员id是：14,销售人员名称是：陈文彰', '2018-05-10 19:53:30');
INSERT INTO `hj_system_log` VALUES ('252', 'Post/addSalesUser', '1', '胡骞兮', '171.221.137.227', '1', '新增销售人员成功,销售公司名称是：5,销售人员名称是：陈文彰', '2018-05-10 19:54:05');
INSERT INTO `hj_system_log` VALUES ('253', 'Member/addGroup', '1', '胡骞兮', '171.221.137.227', '1', '新增用户组成功', '2018-05-10 19:55:08');
INSERT INTO `hj_system_log` VALUES ('254', 'Member/editJurisdiction', '1', '胡骞兮', '171.221.137.227', '1', '编辑用户组成功', '2018-05-10 19:56:01');
INSERT INTO `hj_system_log` VALUES ('255', 'Member/AddUser', '1', '胡骞兮', '171.221.137.227', '1', '新增用户信息成功,用户登陆账户是18428321352', '2018-05-10 19:57:23');
INSERT INTO `hj_system_log` VALUES ('256', 'Post/addCarPark', '7', '陈文彰', '171.221.137.227', '1', '新增车位信息成功,车位名称是：地下车位', '2018-05-10 20:06:36');
INSERT INTO `hj_system_log` VALUES ('257', 'Post/addCarPark', '7', '陈文彰', '171.221.137.227', '1', '新增车位信息成功,车位名称是：地下车位', '2018-05-10 20:12:39');
INSERT INTO `hj_system_log` VALUES ('258', 'Post/addCarPark', '7', '陈文彰', '171.221.0.162', '1', '新增车位信息成功,车位名称是：地下车位', '2018-05-11 17:03:38');
INSERT INTO `hj_system_log` VALUES ('259', 'Post/addVillage', '7', '陈文彰', '171.221.0.162', '1', '新增小区信息成功,小区名称是：龙城 一号', '2018-05-11 17:08:03');
INSERT INTO `hj_system_log` VALUES ('260', 'Post/addCarPark', '7', '陈文彰', '171.221.0.162', '1', '新增车位信息成功,车位名称是：地下车位', '2018-05-11 17:09:11');
INSERT INTO `hj_system_log` VALUES ('261', 'Post/addCarPark', '7', '陈文彰', '171.221.0.162', '1', '新增车位信息成功,车位名称是：地下车位', '2018-05-11 18:26:04');
INSERT INTO `hj_system_log` VALUES ('262', 'Post/addCarPark', '7', '陈文彰', '171.221.0.162', '1', '新增车位信息成功,车位名称是：地下车位', '2018-05-11 18:28:34');
INSERT INTO `hj_system_log` VALUES ('263', 'Post/addCarPark', '7', '陈文彰', '171.221.140.243', '1', '新增车位信息成功,车位名称是：ceshi', '2018-05-11 18:43:45');
INSERT INTO `hj_system_log` VALUES ('264', 'Post/addCarPark', '7', '陈文彰', '171.221.0.162', '1', '新增车位信息成功,车位名称是：地下车位', '2018-05-11 19:13:26');
INSERT INTO `hj_system_log` VALUES ('265', 'Post/editCarPark', '7', '陈文彰', '113.140.51.56', '1', '编辑车位信息成功,车位名称是：地下车位,车位id是：22', '2018-05-11 21:48:47');
INSERT INTO `hj_system_log` VALUES ('266', 'Post/editCarPark', '7', '陈文彰', '113.140.51.56', '1', '编辑车位信息成功,车位名称是：地下车位,车位id是：21', '2018-05-11 22:28:28');
INSERT INTO `hj_system_log` VALUES ('267', 'Post/addCarPark', '7', '陈文彰', '118.113.0.225', '1', '新增车位信息成功,车位名称是：地下车位', '2018-05-12 10:01:36');
INSERT INTO `hj_system_log` VALUES ('268', 'Post/delCarPark', '7', '陈文彰', '118.113.0.225', '1', '删除车位信息成功,车位名称是：地下车位,车位id是:24', '2018-05-12 10:08:50');
INSERT INTO `hj_system_log` VALUES ('269', 'Post/delCarPark', '7', '陈文彰', '118.113.0.225', '1', '删除车位信息成功,车位名称是：ceshi,车位id是:23', '2018-05-12 10:08:54');
INSERT INTO `hj_system_log` VALUES ('270', 'Post/delCarPark', '7', '陈文彰', '118.113.0.225', '1', '删除车位信息成功,车位名称是：地下车位,车位id是:22', '2018-05-12 10:09:01');
INSERT INTO `hj_system_log` VALUES ('271', 'Post/delCarPark', '7', '陈文彰', '118.113.0.225', '1', '删除车位信息成功,车位名称是：地下车位,车位id是:21', '2018-05-12 10:09:06');
INSERT INTO `hj_system_log` VALUES ('272', 'Post/delCarPark', '7', '陈文彰', '118.113.0.225', '1', '删除车位信息成功,车位名称是：地下车位,车位id是:18', '2018-05-12 10:09:11');
INSERT INTO `hj_system_log` VALUES ('273', 'Post/delCarPark', '7', '陈文彰', '118.113.0.225', '1', '删除车位信息成功,车位名称是：地下车位,车位id是:17', '2018-05-12 10:09:15');
INSERT INTO `hj_system_log` VALUES ('274', 'Member/editCompany', '1', '胡骞兮', '171.221.0.150', '1', '修改公司信息成功,公司名称是德阳一里屋房地产营销代理有限责任公司', '2018-05-21 17:42:54');
INSERT INTO `hj_system_log` VALUES ('275', 'Member/editCompany', '1', '胡骞兮', '171.221.0.150', '1', '修改公司信息成功,公司名称是四川恒纪元科技有限公司', '2018-05-21 17:47:23');
INSERT INTO `hj_system_log` VALUES ('276', 'Member/editCompany', '1', '胡骞兮', '171.221.0.150', '1', '修改公司信息成功,公司名称是德阳一里屋房地产营销代理有限责任公司', '2018-05-21 17:50:42');
INSERT INTO `hj_system_log` VALUES ('277', 'Member/editCompany', '1', '胡骞兮', '171.221.0.150', '1', '修改公司信息成功,公司名称是德阳一里屋房地产营销代理有限责任公司', '2018-05-21 17:52:46');
INSERT INTO `hj_system_log` VALUES ('278', 'Member/editCompany', '1', '胡骞兮', '171.221.0.150', '1', '修改公司信息成功,公司名称是四川恒纪元科技有限公司', '2018-05-21 17:53:15');
INSERT INTO `hj_system_log` VALUES ('279', 'Member/editCompany', '1', '胡骞兮', '171.221.0.150', '1', '修改公司信息成功,公司名称是德阳一里屋房地产营销代理有限责任公司', '2018-05-21 17:59:37');
INSERT INTO `hj_system_log` VALUES ('280', 'Member/editCompany', '1', '胡骞兮', '171.221.0.150', '1', '修改公司信息成功,公司名称是四川省恒纪元科技有限公司', '2018-05-21 18:00:17');
INSERT INTO `hj_system_log` VALUES ('281', 'Member/editDepartment', '1', '胡骞兮', '171.221.0.150', '1', '新增部门信息成功,部门名称是总经办', '2018-05-21 18:07:35');
INSERT INTO `hj_system_log` VALUES ('282', 'Member/editDepartment', '1', '胡骞兮', '171.221.0.150', '1', '新增部门信息成功,部门名称是总经办', '2018-05-21 18:24:16');
INSERT INTO `hj_system_log` VALUES ('283', 'Member/editGroup', '1', '胡骞兮', '171.221.0.150', '1', '编辑用户组成功', '2018-05-21 18:25:34');
INSERT INTO `hj_system_log` VALUES ('284', 'Member/editGroup', '1', '胡骞兮', '171.221.0.150', '1', '编辑用户组成功', '2018-05-21 18:36:29');
INSERT INTO `hj_system_log` VALUES ('285', 'Member/EditUser', '1', '胡骞兮', '171.221.0.150', '1', '编辑用户成功,用户id是:1', '2018-05-21 18:40:59');
INSERT INTO `hj_system_log` VALUES ('286', 'Member/EditUser', '1', '胡骞兮', '171.221.0.150', '1', '编辑用户成功,用户id是:1', '2018-05-21 18:41:58');
INSERT INTO `hj_system_log` VALUES ('287', 'Member/EditUser', '1', '胡骞兮', '171.221.0.150', '1', '编辑用户成功,用户id是:3', '2018-05-21 18:43:46');
INSERT INTO `hj_system_log` VALUES ('288', 'Member/editDepartment', '1', '胡骞兮', '171.221.0.150', '1', '新增部门信息成功,部门名称是总经办', '2018-05-21 18:44:14');
INSERT INTO `hj_system_log` VALUES ('289', 'Post/delSalesUser', '1', '胡骞兮', '171.221.0.150', '1', '删除销售人员成功,销售人员id是：10,销售人员名称是：康奕豪', '2018-05-21 18:46:22');
INSERT INTO `hj_system_log` VALUES ('290', 'Post/delSalesUser', '1', '胡骞兮', '171.221.0.150', '1', '删除销售人员成功,销售人员id是：15,销售人员名称是：陈文彰', '2018-05-21 18:46:29');
INSERT INTO `hj_system_log` VALUES ('291', 'Post/editCompany', '1', '胡骞兮', '171.221.0.150', '1', '编辑销售公司成功,销售公司名称是：德阳一里屋房地产营销代理有限责任公司', '2018-05-21 18:52:41');
INSERT INTO `hj_system_log` VALUES ('292', 'Post/editSalesUser', '1', '胡骞兮', '171.221.0.150', '1', '编辑销售人员成功,销售公司ID是：6,销售人员名称是：兰刚', '2018-05-21 18:55:25');
INSERT INTO `hj_system_log` VALUES ('293', 'Post/editSalesUser', '1', '胡骞兮', '171.221.0.150', '1', '编辑销售人员成功,销售公司ID是：6,销售人员名称是：兰刚', '2018-05-21 18:55:36');
INSERT INTO `hj_system_log` VALUES ('294', 'Member/editGroup', '1', '胡骞兮', '171.221.0.150', '1', '编辑用户组成功', '2018-05-21 18:57:40');
INSERT INTO `hj_system_log` VALUES ('295', 'Member/editGroup', '1', '胡骞兮', '171.221.0.150', '1', '编辑用户组成功', '2018-05-21 18:57:53');
INSERT INTO `hj_system_log` VALUES ('296', 'Member/editGroup', '1', '胡骞兮', '171.221.0.150', '1', '编辑用户组成功', '2018-05-21 18:58:06');
INSERT INTO `hj_system_log` VALUES ('297', 'Member/addGroup', '1', '胡骞兮', '171.221.0.150', '1', '新增用户组成功', '2018-05-21 19:03:53');
INSERT INTO `hj_system_log` VALUES ('298', 'Member/addGroup', '1', '胡骞兮', '171.221.0.150', '1', '新增用户组成功', '2018-05-21 19:04:09');
INSERT INTO `hj_system_log` VALUES ('299', 'Member/addGroup', '1', '胡骞兮', '171.221.0.150', '1', '新增用户组成功', '2018-05-21 19:04:26');
INSERT INTO `hj_system_log` VALUES ('300', 'Member/addGroup', '1', '胡骞兮', '171.221.0.150', '1', '新增用户组成功', '2018-05-21 19:04:44');
INSERT INTO `hj_system_log` VALUES ('301', 'Member/editGroup', '1', '胡骞兮', '171.221.0.150', '1', '编辑用户组成功', '2018-05-21 19:05:08');
INSERT INTO `hj_system_log` VALUES ('302', 'Member/editGroup', '1', '胡骞兮', '171.221.0.150', '1', '编辑用户组成功', '2018-05-21 19:05:32');
INSERT INTO `hj_system_log` VALUES ('303', 'Member/editGroup', '1', '胡骞兮', '171.221.0.150', '1', '编辑用户组成功', '2018-05-21 19:05:48');
INSERT INTO `hj_system_log` VALUES ('304', 'Member/editGroup', '1', '胡骞兮', '171.221.0.150', '1', '编辑用户组成功', '2018-05-21 19:06:16');
INSERT INTO `hj_system_log` VALUES ('305', 'Member/EditUser', '1', '胡骞兮', '171.221.0.150', '1', '编辑用户成功,用户id是:3', '2018-05-21 19:07:50');
INSERT INTO `hj_system_log` VALUES ('306', 'Member/EditUser', '1', '胡骞兮', '171.221.0.150', '1', '编辑用户成功,用户id是:1', '2018-05-21 19:09:01');
INSERT INTO `hj_system_log` VALUES ('307', 'Member/editCompany', '1', '胡骞兮', '171.221.0.150', '1', '修改公司信息成功,公司名称是四川省恒纪元科技有限公司', '2018-05-21 19:09:10');
INSERT INTO `hj_system_log` VALUES ('308', 'Member/editDepartment', '1', '胡骞兮', '171.221.0.150', '1', '新增部门信息成功,部门名称是总经办', '2018-05-21 19:09:22');
INSERT INTO `hj_system_log` VALUES ('309', 'Member/EditUser', '1', '胡骞兮', '171.221.0.150', '1', '编辑用户成功,用户id是:1', '2018-05-21 19:10:14');
INSERT INTO `hj_system_log` VALUES ('310', 'Member/addGroup', '1', '胡骞兮', '171.221.0.150', '1', '新增用户组成功', '2018-05-21 19:11:25');
INSERT INTO `hj_system_log` VALUES ('311', 'Member/EditUser', '1', '胡骞兮', '171.221.0.150', '1', '编辑用户成功,用户id是:4', '2018-05-21 19:14:23');
INSERT INTO `hj_system_log` VALUES ('312', 'Member/editGroup', '1', '胡骞兮', '171.221.0.150', '1', '编辑用户组成功', '2018-05-21 19:14:37');
INSERT INTO `hj_system_log` VALUES ('313', 'Member/EditUser', '1', '胡骞兮', '171.221.0.150', '1', '编辑用户成功,用户id是:4', '2018-05-21 19:14:46');
INSERT INTO `hj_system_log` VALUES ('314', 'Member/EditUser', '1', '胡骞兮', '171.221.0.150', '1', '编辑用户成功,用户id是:4', '2018-05-21 19:15:06');
INSERT INTO `hj_system_log` VALUES ('315', 'Member/EditUser', '1', '胡骞兮', '171.221.0.150', '1', '编辑用户成功,用户id是:4', '2018-05-21 19:15:23');
INSERT INTO `hj_system_log` VALUES ('316', 'Member/EditUser', '1', '胡骞兮', '171.221.0.150', '1', '编辑用户成功,用户id是:5', '2018-05-21 19:18:36');
INSERT INTO `hj_system_log` VALUES ('317', 'Member/EditUser', '1', '胡骞兮', '171.221.0.150', '1', '编辑用户成功,用户id是:6', '2018-05-21 19:21:16');
INSERT INTO `hj_system_log` VALUES ('318', 'Member/delUser', '1', '胡骞兮', '171.221.0.150', '1', '删除用户成功,用户id是:7,用户名称是陈文彰', '2018-05-21 19:21:37');
INSERT INTO `hj_system_log` VALUES ('319', 'Member/EditUser', '1', '胡骞兮', '171.221.0.150', '1', '编辑用户成功,用户id是:1', '2018-05-21 19:22:27');
INSERT INTO `hj_system_log` VALUES ('320', 'Post/addSalesUser', '1', '胡骞兮', '171.221.0.150', '1', '新增销售人员成功,销售公司名称是：5,销售人员名称是：黄叔君', '2018-05-21 19:25:42');
INSERT INTO `hj_system_log` VALUES ('321', 'Member/editDepartment', '1', '胡骞兮', '171.221.0.150', '1', '新增部门信息成功,部门名称是总经办', '2018-05-21 19:26:27');
INSERT INTO `hj_system_log` VALUES ('322', 'Member/editDepartment', '1', '胡骞兮', '171.221.0.150', '1', '新增部门信息成功,部门名称是外控部', '2018-05-21 19:27:31');
INSERT INTO `hj_system_log` VALUES ('323', 'Member/AddUser', '1', '胡骞兮', '171.221.0.150', '1', '新增用户信息成功,用户登陆账户是18683851125', '2018-05-21 19:31:05');
INSERT INTO `hj_system_log` VALUES ('324', 'Member/EditUser', '1', '胡骞兮', '171.221.0.150', '1', '编辑用户成功,用户id是:8', '2018-05-21 19:31:44');
INSERT INTO `hj_system_log` VALUES ('325', 'Member/AddUser', '1', '胡骞兮', '171.221.0.150', '1', '新增用户信息成功,用户登陆账户是17708355660', '2018-05-21 19:33:45');
INSERT INTO `hj_system_log` VALUES ('326', 'Member/editDepartment', '1', '胡骞兮', '171.221.0.150', '1', '新增部门信息成功,部门名称是外控部', '2018-05-21 19:34:52');
INSERT INTO `hj_system_log` VALUES ('327', 'Member/editDepartment', '1', '胡骞兮', '171.221.0.150', '1', '新增部门信息成功,部门名称是外控部', '2018-05-21 19:35:02');
INSERT INTO `hj_system_log` VALUES ('328', 'Member/addDepartment', '1', '胡骞兮', '171.221.0.150', '1', '新增部门信息成功,部门名称是外控部', '2018-05-21 19:36:06');
INSERT INTO `hj_system_log` VALUES ('329', 'Member/addDepartment', '1', '胡骞兮', '171.221.0.150', '1', '新增部门信息成功,部门名称是财务管理', '2018-05-21 19:39:56');
INSERT INTO `hj_system_log` VALUES ('330', 'Post/editCompany', '1', '胡骞兮', '171.221.0.150', '1', '编辑销售公司成功,销售公司名称是：德阳一里屋房地产营销代理有限责任公司', '2018-05-21 19:43:36');
INSERT INTO `hj_system_log` VALUES ('331', 'Member/EditUser', '1', '胡骞兮', '171.221.141.164', '1', '编辑用户成功,用户id是:8', '2018-05-29 13:37:20');
INSERT INTO `hj_system_log` VALUES ('332', 'Member/EditUser', '1', '胡骞兮', '171.221.141.164', '1', '编辑用户成功,用户id是:9', '2018-05-29 13:38:48');
INSERT INTO `hj_system_log` VALUES ('333', 'Member/editDepartment', '1', '胡骞兮', '171.221.141.164', '1', '新增部门信息成功,部门名称是外控部', '2018-05-29 13:39:52');
INSERT INTO `hj_system_log` VALUES ('334', 'Member/editDepartment', '1', '胡骞兮', '171.221.141.164', '1', '新增部门信息成功,部门名称是外控部', '2018-05-29 13:40:11');
INSERT INTO `hj_system_log` VALUES ('335', 'Member/editCompany', '1', '胡骞兮', '171.221.141.164', '1', '修改公司信息成功,公司名称是四川省恒纪元科技有限公司', '2018-05-29 13:40:48');
INSERT INTO `hj_system_log` VALUES ('336', 'Post/editDevelopers', '1', '胡骞兮', '118.113.0.166', '1', '编辑开发商成功,开发商名称是：保利,开发商id是：2', '2018-05-29 13:46:12');
INSERT INTO `hj_system_log` VALUES ('337', 'Post/editCompany', '1', '胡骞兮', '118.113.0.166', '1', '编辑销售公司成功,销售公司名称是：四川省恒纪元科技有限公司', '2018-05-29 13:46:28');
INSERT INTO `hj_system_log` VALUES ('338', 'Post/editHusiness', '1', '胡骞兮', '118.113.0.166', '1', '编辑商家成功,商家名称是：34535,商家id是：3', '2018-05-29 13:46:50');
INSERT INTO `hj_system_log` VALUES ('339', 'Post/editCompany', '1', '胡骞兮', '118.113.0.166', '1', '编辑销售公司成功,销售公司名称是：德阳一里屋房地产营销代理有限责任公司', '2018-05-29 13:48:08');
INSERT INTO `hj_system_log` VALUES ('340', 'Post/editHusiness', '1', '胡骞兮', '118.113.0.166', '1', '编辑商家成功,商家名称是：34535,商家id是：3', '2018-05-29 13:52:31');
INSERT INTO `hj_system_log` VALUES ('341', 'Post/editSalesUser', '1', '胡骞兮', '118.113.0.166', '1', '编辑销售人员成功,销售公司ID是：6,销售人员名称是：兰刚', '2018-05-29 14:03:02');
INSERT INTO `hj_system_log` VALUES ('342', 'Post/editSalesUser', '1', '胡骞兮', '118.113.0.166', '1', '编辑销售人员成功,销售公司ID是：5,销售人员名称是：陈海洋', '2018-05-29 14:05:11');
INSERT INTO `hj_system_log` VALUES ('343', 'Member/addDepartment', '1', '胡骞兮', '118.113.0.166', '1', '新增部门信息成功,部门名称是外控部', '2018-05-29 14:39:56');
INSERT INTO `hj_system_log` VALUES ('344', 'Member/addDepartment', '1', '胡骞兮', '171.221.141.164', '1', '新增部门信息成功,部门名称是外控部', '2018-05-29 14:40:36');
INSERT INTO `hj_system_log` VALUES ('345', 'Member/editDepartment', '1', '胡骞兮', '171.221.141.164', '1', '新增部门信息成功,部门名称是外控部', '2018-05-29 14:42:18');
INSERT INTO `hj_system_log` VALUES ('346', 'Member/editDepartment', '1', '胡骞兮', '171.221.141.164', '1', '新增部门信息成功,部门名称是财务管理', '2018-05-29 14:42:34');
INSERT INTO `hj_system_log` VALUES ('347', 'Member/editDepartment', '1', '胡骞兮', '171.221.141.164', '1', '新增部门信息成功,部门名称是外控部', '2018-05-29 14:42:47');
INSERT INTO `hj_system_log` VALUES ('348', 'Member/editDepartment', '1', '胡骞兮', '171.221.141.164', '1', '新增部门信息成功,部门名称是外控部', '2018-05-29 14:42:57');
INSERT INTO `hj_system_log` VALUES ('349', 'Member/EditUser', '1', '胡骞兮', '171.221.141.164', '1', '编辑用户成功,用户id是:9', '2018-05-29 14:43:39');
INSERT INTO `hj_system_log` VALUES ('350', 'Member/EditUser', '1', '胡骞兮', '171.221.141.164', '1', '编辑用户成功,用户id是:8', '2018-05-29 14:43:53');
INSERT INTO `hj_system_log` VALUES ('351', 'Member/EditUser', '1', '胡骞兮', '171.221.141.164', '1', '编辑用户成功,用户id是:3', '2018-05-29 14:44:20');
INSERT INTO `hj_system_log` VALUES ('352', 'Member/editDepartment', '1', '胡骞兮', '118.113.0.166', '1', '新增部门信息成功,部门名称是外控部', '2018-05-29 14:46:17');
INSERT INTO `hj_system_log` VALUES ('353', 'Member/delDepartment', '1', '胡骞兮', '118.113.0.166', '1', '删除部门信息成功,部门id是6', '2018-05-29 14:46:32');
INSERT INTO `hj_system_log` VALUES ('354', 'Member/editDepartment', '1', '胡骞兮', '118.113.0.166', '1', '新增部门信息成功,部门名称是外控部', '2018-05-29 14:46:39');
INSERT INTO `hj_system_log` VALUES ('355', 'Member/EditUser', '1', '胡骞兮', '118.113.0.166', '1', '编辑用户成功,用户id是:4', '2018-05-29 14:51:10');
INSERT INTO `hj_system_log` VALUES ('356', 'Member/editGroup', '1', '胡骞兮', '171.221.141.164', '1', '编辑用户组成功', '2018-05-29 14:52:23');
INSERT INTO `hj_system_log` VALUES ('357', 'Post/editCompany', '1', '胡骞兮', '171.221.141.164', '1', '编辑销售公司成功,销售公司名称是：德阳一里屋房地产营销代理有限责任公司', '2018-05-29 14:53:46');
INSERT INTO `hj_system_log` VALUES ('358', 'Post/editCompany', '1', '胡骞兮', '171.221.141.164', '1', '编辑销售公司成功,销售公司名称是：四川省恒纪元科技有限公司', '2018-05-29 14:54:15');
INSERT INTO `hj_system_log` VALUES ('359', 'Post/editCompany', '1', '胡骞兮', '171.221.141.164', '1', '编辑销售公司成功,销售公司名称是：四川省恒纪元科技有限公司', '2018-05-29 14:54:34');
INSERT INTO `hj_system_log` VALUES ('360', 'Bank/editBank', '1', '胡骞兮', '171.221.141.164', '1', '编辑银行成功,银行名称：华夏村镇银行', '2018-05-29 16:10:01');
INSERT INTO `hj_system_log` VALUES ('361', 'Bank/editBank', '1', '胡骞兮', '171.221.141.164', '1', '编辑银行成功,银行名称：华夏村镇银行', '2018-05-29 16:10:32');
INSERT INTO `hj_system_log` VALUES ('362', 'Bank/editBankUser', '1', '胡骞兮', '171.221.141.164', '1', '编辑银行管理人员成功,银行编号是：4,银行管理人员名称是：何林玥', '2018-05-29 16:11:05');
INSERT INTO `hj_system_log` VALUES ('363', 'Bank/editBankUser', '1', '胡骞兮', '171.221.141.164', '1', '编辑银行管理人员成功,银行编号是：4,银行管理人员名称是：何林玥', '2018-05-29 16:11:15');
INSERT INTO `hj_system_log` VALUES ('364', 'Bank/editBankUser', '1', '胡骞兮', '118.113.0.166', '1', '编辑银行管理人员成功,银行编号是：4,银行管理人员名称是：何林玥', '2018-05-29 16:33:45');
INSERT INTO `hj_system_log` VALUES ('365', 'Member/editJurisdiction', '1', '胡骞兮', '118.113.0.166', '1', '编辑用户组成功', '2018-05-29 17:50:53');
INSERT INTO `hj_system_log` VALUES ('366', 'Member/editJurisdiction', '1', '胡骞兮', '118.113.0.166', '1', '编辑用户组成功', '2018-05-29 17:51:35');
INSERT INTO `hj_system_log` VALUES ('367', 'Member/EditUser', '1', '胡骞兮', '118.113.0.166', '1', '编辑用户成功,用户id是:4', '2018-05-29 17:51:51');
INSERT INTO `hj_system_log` VALUES ('368', 'Member/AddCompany', '4', '海洋', '118.113.0.166', '1', '新增公司信息成功,公司名称是23', '2018-05-29 17:52:12');
INSERT INTO `hj_system_log` VALUES ('369', 'Member/delCompany', '4', '海洋', '118.113.0.166', '1', '修改公司信息成功,公司id是6', '2018-05-29 17:52:17');
INSERT INTO `hj_system_log` VALUES ('370', 'Member/editJurisdiction', '4', '海洋', '118.113.0.166', '1', '编辑用户组成功', '2018-05-29 17:56:47');
INSERT INTO `hj_system_log` VALUES ('371', 'Member/editJurisdiction', '4', '海洋', '118.113.0.166', '1', '编辑用户组成功', '2018-05-29 17:57:00');
INSERT INTO `hj_system_log` VALUES ('372', 'Member/AddCompany', '4', '海洋', '118.113.0.166', '1', '新增公司信息成功,公司名称是23', '2018-05-29 17:57:50');
INSERT INTO `hj_system_log` VALUES ('373', 'Member/delCompany', '4', '海洋', '118.113.0.166', '1', '修改公司信息成功,公司id是7', '2018-05-29 17:57:55');
INSERT INTO `hj_system_log` VALUES ('374', 'Bank/addBank', '4', '海洋', '118.113.0.166', '1', '新增银行成功,银行名称：123', '2018-05-29 17:58:34');
INSERT INTO `hj_system_log` VALUES ('375', 'Bank/delBank', '4', '海洋', '118.113.0.166', '1', '删除银行成功,银行编号是：5', '2018-05-29 17:58:37');
INSERT INTO `hj_system_log` VALUES ('376', 'Member/editJurisdiction', '1', '胡骞兮', '118.113.0.166', '1', '编辑用户组成功', '2018-05-29 18:12:59');
INSERT INTO `hj_system_log` VALUES ('377', 'Member/editJurisdiction', '1', '胡骞兮', '118.113.0.166', '1', '编辑用户组成功', '2018-05-29 18:13:32');
INSERT INTO `hj_system_log` VALUES ('378', 'Bank/delBankUser', '1', '胡骞兮', '171.221.141.164', '1', '删除银行管理人员成功,银行人员编号是：5', '2018-06-01 19:31:11');
INSERT INTO `hj_system_log` VALUES ('379', 'Member/editCompany', '1', '胡骞兮', '171.221.141.164', '1', '修改公司信息成功,公司名称是四川省恒纪元科技有限公司', '2018-06-01 19:32:06');
INSERT INTO `hj_system_log` VALUES ('380', 'Member/editDepartment', '1', '胡骞兮', '171.221.141.164', '1', '新增部门信息成功,部门名称是外控部', '2018-06-01 19:32:34');
INSERT INTO `hj_system_log` VALUES ('381', 'Member/editDepartment', '1', '胡骞兮', '171.221.141.164', '1', '新增部门信息成功,部门名称是财务管理', '2018-06-01 19:32:43');
INSERT INTO `hj_system_log` VALUES ('382', 'Member/editDepartment', '1', '胡骞兮', '171.221.141.164', '1', '新增部门信息成功,部门名称是外控部', '2018-06-01 19:32:52');
INSERT INTO `hj_system_log` VALUES ('383', 'Member/editDepartment', '1', '胡骞兮', '171.221.141.164', '1', '新增部门信息成功,部门名称是外控部', '2018-06-01 19:33:07');
INSERT INTO `hj_system_log` VALUES ('384', 'Member/editDepartment', '1', '胡骞兮', '171.221.141.164', '1', '新增部门信息成功,部门名称是外控部', '2018-06-01 19:33:15');
INSERT INTO `hj_system_log` VALUES ('385', 'Member/EditUser', '1', '胡骞兮', '171.221.141.164', '1', '编辑用户成功,用户id是:9', '2018-06-01 19:34:49');
INSERT INTO `hj_system_log` VALUES ('386', 'Member/EditUser', '1', '胡骞兮', '171.221.141.164', '1', '编辑用户成功,用户id是:3', '2018-06-01 19:41:19');
INSERT INTO `hj_system_log` VALUES ('387', 'Member/EditUser', '1', '胡骞兮', '171.221.141.164', '1', '编辑用户成功,用户id是:4', '2018-06-01 19:41:30');
INSERT INTO `hj_system_log` VALUES ('388', 'Member/EditUser', '1', '胡骞兮', '171.221.141.164', '1', '编辑用户成功,用户id是:6', '2018-06-01 19:42:28');
INSERT INTO `hj_system_log` VALUES ('389', 'Member/editJurisdiction', '1', '胡骞兮', '171.221.141.164', '1', '编辑用户组成功', '2018-06-01 19:43:09');
INSERT INTO `hj_system_log` VALUES ('390', 'Member/editJurisdiction', '1', '胡骞兮', '171.221.141.164', '1', '编辑用户组成功', '2018-06-01 19:43:46');
INSERT INTO `hj_system_log` VALUES ('391', 'Member/editGroup', '1', '胡骞兮', '171.221.141.164', '1', '编辑用户组成功', '2018-06-01 19:44:01');
INSERT INTO `hj_system_log` VALUES ('392', 'Member/editGroup', '1', '胡骞兮', '171.221.141.164', '1', '编辑用户组成功', '2018-06-01 19:44:18');
INSERT INTO `hj_system_log` VALUES ('393', 'Member/editGroup', '1', '胡骞兮', '171.221.141.164', '1', '编辑用户组成功', '2018-06-01 19:44:29');
INSERT INTO `hj_system_log` VALUES ('394', 'Member/addGroup', '1', '胡骞兮', '171.221.141.164', '1', '新增用户组成功', '2018-06-01 19:45:03');
INSERT INTO `hj_system_log` VALUES ('395', 'Member/delGroup', '1', '胡骞兮', '171.221.141.164', '1', '删除用户组成功', '2018-06-01 19:45:19');
INSERT INTO `hj_system_log` VALUES ('396', 'Member/editDepartment', '1', '胡骞兮', '171.221.141.164', '1', '新增部门信息成功,部门名称是外控部', '2018-06-01 19:46:07');
INSERT INTO `hj_system_log` VALUES ('397', 'Member/addGroup', '1', '胡骞兮', '171.221.141.164', '1', '新增用户组成功', '2018-06-01 19:47:35');
INSERT INTO `hj_system_log` VALUES ('398', 'Member/editJurisdiction', '1', '胡骞兮', '171.221.141.164', '1', '编辑用户组成功', '2018-06-01 19:52:19');
INSERT INTO `hj_system_log` VALUES ('399', 'Member/editGroup', '1', '胡骞兮', '171.221.141.164', '1', '编辑用户组成功', '2018-06-01 19:52:28');
INSERT INTO `hj_system_log` VALUES ('400', 'Member/editJurisdiction', '1', '胡骞兮', '171.221.141.164', '1', '编辑用户组成功', '2018-06-01 19:56:50');
INSERT INTO `hj_system_log` VALUES ('401', 'Member/addGroup', '1', '胡骞兮', '171.221.141.164', '1', '新增用户组成功', '2018-06-01 19:59:36');
INSERT INTO `hj_system_log` VALUES ('402', 'Member/editJurisdiction', '1', '胡骞兮', '171.221.141.164', '1', '编辑用户组成功', '2018-06-01 20:21:23');
INSERT INTO `hj_system_log` VALUES ('403', 'Member/delGroup', '1', '胡骞兮', '171.221.141.164', '1', '删除用户组成功', '2018-06-01 20:21:31');
INSERT INTO `hj_system_log` VALUES ('404', 'Member/editJurisdiction', '1', '胡骞兮', '171.221.141.164', '1', '编辑用户组成功', '2018-06-01 20:27:43');
INSERT INTO `hj_system_log` VALUES ('405', 'Member/editJurisdiction', '1', '胡骞兮', '171.221.141.164', '1', '编辑用户组成功', '2018-06-01 20:29:25');
INSERT INTO `hj_system_log` VALUES ('406', 'Member/editJurisdiction', '1', '胡骞兮', '171.221.141.164', '1', '编辑用户组成功', '2018-06-01 20:38:45');
INSERT INTO `hj_system_log` VALUES ('407', 'Member/editJurisdiction', '1', '胡骞兮', '171.221.141.164', '1', '编辑用户组成功', '2018-06-01 20:42:37');
INSERT INTO `hj_system_log` VALUES ('408', 'Member/delGroup', '1', '胡骞兮', '171.221.141.164', '1', '删除用户组成功', '2018-06-01 20:44:44');
INSERT INTO `hj_system_log` VALUES ('409', 'Member/editJurisdiction', '1', '胡骞兮', '171.221.141.164', '1', '编辑用户组成功', '2018-06-01 20:45:38');
INSERT INTO `hj_system_log` VALUES ('410', 'Member/addGroup', '1', '胡骞兮', '118.113.1.51', '1', '新增用户组成功', '2018-06-04 15:15:56');
INSERT INTO `hj_system_log` VALUES ('411', 'Member/editJurisdiction', '1', '胡骞兮', '118.113.1.51', '1', '编辑用户组成功', '2018-06-04 15:16:25');
INSERT INTO `hj_system_log` VALUES ('412', 'Member/AddUser', '1', '胡骞兮', '118.113.1.51', '1', '新增用户信息成功,用户登陆账户是lanmin', '2018-06-04 15:18:02');
INSERT INTO `hj_system_log` VALUES ('413', 'Member/EditUser', '10', '蓝敏', '171.221.142.18', '1', '编辑用户成功,用户id是:10', '2018-06-06 16:31:51');
INSERT INTO `hj_system_log` VALUES ('414', 'Member/editDepartment', '10', '蓝敏', '171.221.142.18', '1', '新增部门信息成功,部门名称是内控部', '2018-06-06 16:33:38');
INSERT INTO `hj_system_log` VALUES ('415', 'Member/editJurisdiction', '1', '胡骞兮', '171.221.142.18', '1', '编辑用户组成功', '2018-06-06 16:39:55');
INSERT INTO `hj_system_log` VALUES ('416', 'Member/editJurisdiction', '10', '蓝敏', '171.221.142.18', '1', '编辑用户组成功', '2018-06-06 16:45:13');
INSERT INTO `hj_system_log` VALUES ('417', 'Member/editJurisdiction', '10', '蓝敏', '171.221.142.18', '1', '编辑用户组成功', '2018-06-07 10:50:43');
INSERT INTO `hj_system_log` VALUES ('418', 'Member/editJurisdiction', '10', '蓝敏', '171.221.142.18', '1', '编辑用户组成功', '2018-06-07 10:50:54');
INSERT INTO `hj_system_log` VALUES ('419', 'Member/editJurisdiction', '10', '蓝敏', '171.221.142.18', '1', '编辑用户组成功', '2018-06-07 10:51:15');
INSERT INTO `hj_system_log` VALUES ('420', 'Member/editJurisdiction', '1', '胡骞兮', '171.221.142.18', '1', '编辑用户组成功', '2018-06-07 10:55:07');
INSERT INTO `hj_system_log` VALUES ('421', 'Member/editJurisdiction', '1', '胡骞兮', '171.221.142.18', '1', '编辑用户组成功', '2018-06-07 10:56:38');
INSERT INTO `hj_system_log` VALUES ('422', 'Member/editJurisdiction', '1', '胡骞兮', '171.221.142.18', '1', '编辑用户组成功', '2018-06-07 10:57:01');
INSERT INTO `hj_system_log` VALUES ('423', 'Member/editJurisdiction', '1', '胡骞兮', '171.221.142.18', '1', '编辑用户组成功', '2018-06-07 10:58:25');
INSERT INTO `hj_system_log` VALUES ('424', 'Member/editJurisdiction', '1', '胡骞兮', '171.221.142.18', '1', '编辑用户组成功', '2018-06-07 11:10:22');
INSERT INTO `hj_system_log` VALUES ('425', 'Member/EditUser', '1', '胡骞兮', '171.221.142.18', '1', '编辑用户成功,用户id是:4', '2018-06-07 11:10:35');
INSERT INTO `hj_system_log` VALUES ('426', 'Member/EditUser', '1', '胡骞兮', '171.221.142.18', '1', '编辑用户成功,用户id是:10', '2018-06-07 11:16:34');
INSERT INTO `hj_system_log` VALUES ('427', 'Member/addGroup', '10', '蓝敏', '101.206.168.113', '1', '新增用户组成功', '2018-06-19 18:43:34');
INSERT INTO `hj_system_log` VALUES ('428', 'Member/editJurisdiction', '10', '蓝敏', '101.206.168.113', '1', '编辑用户组成功', '2018-06-19 18:44:14');
INSERT INTO `hj_system_log` VALUES ('429', 'Member/AddUser', '10', '蓝敏', '101.206.168.113', '1', '新增用户信息成功,用户登陆账户是测试一里屋', '2018-06-19 18:46:42');
INSERT INTO `hj_system_log` VALUES ('430', 'Member/addGroup', '11', '测试', '171.221.0.77', '1', '新增用户组成功', '2018-06-20 11:30:04');
INSERT INTO `hj_system_log` VALUES ('431', 'Member/editJurisdiction', '11', '测试', '171.221.0.77', '1', '编辑用户组成功', '2018-06-20 11:30:15');
INSERT INTO `hj_system_log` VALUES ('432', 'Member/EditUser', '10', '蓝敏', '171.221.139.147', '1', '编辑用户成功,用户id是:8', '2018-07-11 16:53:50');
INSERT INTO `hj_system_log` VALUES ('433', 'Member/EditUser', '10', '蓝敏', '171.221.139.147', '1', '编辑用户成功,用户id是:9', '2018-07-11 16:54:21');
INSERT INTO `hj_system_log` VALUES ('434', 'Member/EditUser', '10', '蓝敏', '171.221.139.147', '1', '编辑用户成功,用户id是:8', '2018-07-11 16:55:53');
INSERT INTO `hj_system_log` VALUES ('435', 'Member/AddUser', '10', '蓝敏', '171.221.139.147', '1', '新增用户信息成功,用户登陆账户是蒋武', '2018-07-11 16:57:32');
INSERT INTO `hj_system_log` VALUES ('436', 'Member/DelUser', '4', '海洋', '118.113.1.211', '1', '删除用户成功,用户id是:11,用户名称是测试', '2018-07-11 16:57:48');
INSERT INTO `hj_system_log` VALUES ('437', 'Member/DelUser', '10', '蓝敏', '171.221.139.147', '1', '删除用户成功,用户id是:11,用户名称是测试', '2018-07-11 16:58:58');
INSERT INTO `hj_system_log` VALUES ('438', 'Member/editJurisdiction', '10', '蓝敏', '171.221.136.16', '1', '编辑用户组成功', '2018-07-12 20:51:29');
INSERT INTO `hj_system_log` VALUES ('439', 'Member/editJurisdiction', '10', '蓝敏', '171.221.136.16', '1', '编辑用户组成功', '2018-07-12 20:52:02');
INSERT INTO `hj_system_log` VALUES ('440', 'Member/editJurisdiction', '10', '蓝敏', '171.221.136.16', '1', '编辑用户组成功', '2018-07-12 20:53:48');
INSERT INTO `hj_system_log` VALUES ('441', 'Member/EditUser', '10', '蓝敏', '171.221.143.85', '1', '编辑用户成功,用户id是:12', '2018-07-24 02:42:11');
INSERT INTO `hj_system_log` VALUES ('442', 'Member/EditUser', '10', '蓝敏', '171.221.143.85', '1', '编辑用户成功,用户id是:12', '2018-07-24 02:43:28');
INSERT INTO `hj_system_log` VALUES ('443', 'Member/AddUser', '10', '蓝敏', '171.221.143.85', '1', '新增用户信息成功,用户登陆账户是曾伟', '2018-07-24 02:50:36');
INSERT INTO `hj_system_log` VALUES ('444', 'Post/addSalesUser', '10', '蓝敏', '171.221.143.85', '1', '新增销售人员成功,销售公司名称是：5,销售人员名称是：蓝敏', '2018-07-24 03:06:43');
INSERT INTO `hj_system_log` VALUES ('445', 'Post/addSalesUser', '10', '蓝敏', '171.221.143.85', '1', '新增销售人员成功,销售公司名称是：5,销售人员名称是：曾伟', '2018-07-24 03:08:40');
INSERT INTO `hj_system_log` VALUES ('446', 'Post/addSalesUser', '10', '蓝敏', '171.221.143.85', '1', '新增销售人员成功,销售公司名称是：5,销售人员名称是：蒋武', '2018-07-24 03:09:17');
INSERT INTO `hj_system_log` VALUES ('447', 'Member/EditUser', '10', '蓝敏', '171.221.143.85', '1', '编辑用户成功,用户id是:10', '2018-07-24 03:19:58');
INSERT INTO `hj_system_log` VALUES ('448', 'Post/editVillage', '10', '蓝敏', '118.113.0.160', '1', '编辑小区信息成功,小区名称是：龙城 一号,小区编号是:36', '2018-08-03 00:13:29');
INSERT INTO `hj_system_log` VALUES ('449', 'Member/editJurisdiction', '10', '蓝敏', '118.113.0.160', '1', '编辑用户组成功', '2018-08-03 00:19:44');
INSERT INTO `hj_system_log` VALUES ('450', 'Post/editVillage', '10', '蓝敏', '118.113.0.160', '1', '编辑小区信息成功,小区名称是：龙城 一号,小区编号是:36', '2018-08-03 00:20:02');
INSERT INTO `hj_system_log` VALUES ('451', 'Member/EditUser', '10', '蓝敏', '118.113.0.160', '1', '编辑用户成功,用户id是:12', '2018-08-03 00:23:47');
INSERT INTO `hj_system_log` VALUES ('452', 'Member/EditUser', '10', '蓝敏', '118.113.0.160', '1', '编辑用户成功,用户id是:12', '2018-08-03 00:24:58');
INSERT INTO `hj_system_log` VALUES ('453', 'Post/editVillage', '10', '蓝敏', '118.113.0.160', '1', '编辑小区信息成功,小区名称是：中国铁建国际城,小区编号是:33', '2018-08-03 00:25:25');
INSERT INTO `hj_system_log` VALUES ('454', 'Member/editJurisdiction', '10', '蓝敏', '118.113.0.160', '1', '编辑用户组成功', '2018-08-03 00:31:13');
INSERT INTO `hj_system_log` VALUES ('455', 'Post/editVillage', '10', '蓝敏', '118.113.0.160', '1', '编辑小区信息成功,小区名称是：龙城 一号,小区编号是:36', '2018-08-03 00:35:24');
INSERT INTO `hj_system_log` VALUES ('456', 'Post/editVillage', '10', '蓝敏', '118.113.0.160', '1', '编辑小区信息成功,小区名称是：龙城 一号,小区编号是:36', '2018-08-03 00:40:46');
INSERT INTO `hj_system_log` VALUES ('457', 'Post/editVillage', '10', '蓝敏', '118.113.0.160', '1', '编辑小区信息成功,小区名称是：中国铁建国际城,小区编号是:33', '2018-08-03 00:41:03');
INSERT INTO `hj_system_log` VALUES ('458', 'Post/editVillage', '10', '蓝敏', '118.113.0.160', '1', '编辑小区信息成功,小区名称是：珠江御景湾,小区编号是:31', '2018-08-03 00:49:38');
INSERT INTO `hj_system_log` VALUES ('459', 'Post/editVillage', '10', '蓝敏', '118.113.0.160', '1', '编辑小区信息成功,小区名称是：珠江御景湾,小区编号是:31', '2018-08-03 00:50:13');
INSERT INTO `hj_system_log` VALUES ('460', 'Post/editVillage', '10', '蓝敏', '118.113.0.160', '1', '编辑小区信息成功,小区名称是：珠江御景湾,小区编号是:31', '2018-08-03 00:50:34');
INSERT INTO `hj_system_log` VALUES ('461', 'Post/editVillage', '10', '蓝敏', '118.113.0.160', '1', '编辑小区信息成功,小区名称是：珠江御景湾,小区编号是:31', '2018-08-03 00:51:05');
INSERT INTO `hj_system_log` VALUES ('462', 'Post/editVillage', '10', '蓝敏', '118.113.0.160', '1', '编辑小区信息成功,小区名称是：师大现代花园,小区编号是:15', '2018-08-03 00:53:47');
INSERT INTO `hj_system_log` VALUES ('463', 'Post/editVillage', '10', '蓝敏', '118.113.0.160', '1', '编辑小区信息成功,小区名称是：ICON尚郡,小区编号是:8', '2018-08-03 00:56:08');
INSERT INTO `hj_system_log` VALUES ('464', 'Member/editJurisdiction', '10', '蓝敏', '118.113.0.160', '1', '编辑用户组成功', '2018-08-03 01:05:59');
INSERT INTO `hj_system_log` VALUES ('465', 'Member/editJurisdiction', '10', '蓝敏', '118.113.0.160', '1', '编辑用户组成功', '2018-08-03 01:09:29');
INSERT INTO `hj_system_log` VALUES ('466', 'Member/editJurisdiction', '10', '蓝敏', '118.113.0.160', '1', '编辑用户组成功', '2018-08-03 01:13:52');
INSERT INTO `hj_system_log` VALUES ('467', 'Post/editVillage', '12', '蒋武', '118.113.0.160', '1', '编辑小区信息成功,小区名称是：师大现代花园,小区编号是:15', '2018-08-03 01:20:06');
INSERT INTO `hj_system_log` VALUES ('468', 'Post/editVillage', '12', '蒋武', '118.113.0.160', '1', '编辑小区信息成功,小区名称是：中国铁建国际城,小区编号是:33', '2018-08-03 01:23:35');
INSERT INTO `hj_system_log` VALUES ('469', 'Post/editVillage', '12', '蒋武', '118.113.0.160', '1', '编辑小区信息成功,小区名称是：师大现代花园,小区编号是:15', '2018-08-03 01:24:13');
INSERT INTO `hj_system_log` VALUES ('470', 'Post/delVillage', '12', '蒋武', '118.113.0.160', '1', '删除小区信息成功,小区名称是：ghheeheh,小区编号是:16', '2018-08-03 01:48:12');
INSERT INTO `hj_system_log` VALUES ('471', 'Post/delVillage', '12', '蒋武', '118.113.0.160', '1', '删除小区信息成功,小区名称是：ghheeheh,小区编号是:16', '2018-08-03 01:48:19');
INSERT INTO `hj_system_log` VALUES ('472', 'Post/delVillage', '12', '蒋武', '118.113.0.160', '1', '删除小区信息成功,小区名称是：ghheeheh,小区编号是:16', '2018-08-03 01:48:34');
INSERT INTO `hj_system_log` VALUES ('473', 'Post/editVillage', '12', '蒋武', '118.113.0.160', '1', '编辑小区信息成功,小区名称是：龙城 一号,小区编号是:36', '2018-08-03 01:52:25');
INSERT INTO `hj_system_log` VALUES ('474', 'Member/EditUser', '10', '蓝敏', '118.113.0.160', '1', '编辑用户成功,用户id是:12', '2018-08-03 02:22:52');
INSERT INTO `hj_system_log` VALUES ('475', 'Member/editJurisdiction', '10', '蓝敏', '118.113.0.160', '1', '编辑用户组成功', '2018-08-03 02:28:13');
INSERT INTO `hj_system_log` VALUES ('476', 'Member/EditUser', '12', '蒋武', '118.113.0.160', '1', '编辑用户成功,用户id是:12', '2018-08-03 02:28:54');
INSERT INTO `hj_system_log` VALUES ('477', 'Member/EditUser', '12', '蒋武', '118.113.0.160', '1', '编辑用户成功,用户id是:8', '2018-08-03 02:31:06');
INSERT INTO `hj_system_log` VALUES ('478', 'Member/editJurisdiction', '10', '蓝敏', '118.113.0.160', '1', '编辑用户组成功', '2018-08-03 02:53:02');
INSERT INTO `hj_system_log` VALUES ('479', 'Member/editJurisdiction', '10', '蓝敏', '118.113.0.160', '1', '编辑用户组成功', '2018-08-03 02:53:49');
INSERT INTO `hj_system_log` VALUES ('480', 'Post/delVillage', '12', '蒋武', '118.113.0.160', '1', '删除小区信息成功,小区名称是：测试,小区编号是:19', '2018-08-03 02:54:31');
INSERT INTO `hj_system_log` VALUES ('481', 'Post/delVillage', '12', '蒋武', '118.113.0.160', '1', '删除小区信息成功,小区名称是：测试,小区编号是:19', '2018-08-03 02:54:36');
INSERT INTO `hj_system_log` VALUES ('482', 'Member/editJurisdiction', '10', '蓝敏', '118.113.0.160', '1', '编辑用户组成功', '2018-08-03 02:56:39');
INSERT INTO `hj_system_log` VALUES ('483', 'Member/editJurisdiction', '10', '蓝敏', '118.113.0.160', '1', '编辑用户组成功', '2018-08-03 02:57:22');
INSERT INTO `hj_system_log` VALUES ('484', 'Post/editVillage', '12', '蒋武', '118.113.0.160', '1', '编辑小区信息成功,小区名称是：龙城 一号,小区编号是:36', '2018-08-03 03:17:53');
INSERT INTO `hj_system_log` VALUES ('485', 'Post/editVillage', '12', '蒋武', '118.113.0.160', '1', '编辑小区信息成功,小区名称是：中国铁建国际城,小区编号是:33', '2018-08-03 03:20:14');
INSERT INTO `hj_system_log` VALUES ('486', 'Post/editVillage', '12', '蒋武', '118.113.0.160', '1', '编辑小区信息成功,小区名称是：珠江御景湾,小区编号是:31', '2018-08-03 03:20:29');
INSERT INTO `hj_system_log` VALUES ('487', 'Post/editVillage', '12', '蒋武', '118.113.0.160', '1', '编辑小区信息成功,小区名称是：师大现代花园,小区编号是:15', '2018-08-03 03:20:45');
INSERT INTO `hj_system_log` VALUES ('488', 'Post/editVillage', '12', '蒋武', '118.113.0.160', '1', '编辑小区信息成功,小区名称是：龙城 一号,小区编号是:36', '2018-08-03 03:21:43');
INSERT INTO `hj_system_log` VALUES ('489', 'Post/editVillage', '12', '蒋武', '118.113.0.160', '1', '编辑小区信息成功,小区名称是：ICON尚郡,小区编号是:8', '2018-08-03 03:22:06');
INSERT INTO `hj_system_log` VALUES ('490', 'Post/delCarPark', '12', '蒋武', '118.113.0.160', '1', '删除车位信息成功,车位名称是：地下车位,车位id是:25', '2018-08-03 03:22:37');
INSERT INTO `hj_system_log` VALUES ('491', 'Post/delCarPark', '12', '蒋武', '118.113.0.160', '1', '删除车位信息成功,车位名称是：地下车位,车位id是:20', '2018-08-03 03:22:41');
INSERT INTO `hj_system_log` VALUES ('492', 'Post/editCarPark', '12', '蒋武', '118.113.0.160', '1', '编辑车位信息成功,车位名称是：地下车位,车位id是：19', '2018-08-03 03:25:02');
INSERT INTO `hj_system_log` VALUES ('493', 'Post/editVillage', '12', '蒋武', '118.113.0.160', '1', '编辑小区信息成功,小区名称是：龙城 一号,小区编号是:36', '2018-08-03 03:25:38');
INSERT INTO `hj_system_log` VALUES ('494', 'Post/editCarPark', '12', '蒋武', '118.113.0.160', '1', '编辑车位信息成功,车位名称是：地下车位,车位id是：19', '2018-08-03 03:26:25');
INSERT INTO `hj_system_log` VALUES ('495', 'Post/editCarPark', '12', '蒋武', '118.113.0.160', '1', '编辑车位信息成功,车位名称是：地下车位,车位id是：19', '2018-08-03 03:28:56');
INSERT INTO `hj_system_log` VALUES ('496', 'Post/editCarPark', '12', '蒋武', '118.113.0.160', '1', '编辑车位信息成功,车位名称是：地下车位,车位id是：19', '2018-08-03 03:29:18');
INSERT INTO `hj_system_log` VALUES ('497', 'Post/editVillage', '12', '蒋武', '118.113.0.160', '1', '编辑小区信息成功,小区名称是：师大现代花园,小区编号是:15', '2018-08-03 03:30:10');
INSERT INTO `hj_system_log` VALUES ('498', 'Post/addCarPark', '12', '蒋武', '118.113.0.160', '1', '新增车位信息成功,车位名称是：地下二层', '2018-08-03 03:31:14');
INSERT INTO `hj_system_log` VALUES ('499', 'Post/delCarPark', '12', '蒋武', '118.113.0.160', '1', '删除车位信息成功,车位名称是：地下车位,车位id是:19', '2018-08-03 03:34:19');
INSERT INTO `hj_system_log` VALUES ('500', 'Post/addCarPark', '12', '蒋武', '118.113.0.160', '1', '新增车位信息成功,车位名称是：热污染翁而我 ', '2018-08-03 03:35:15');
INSERT INTO `hj_system_log` VALUES ('501', 'Post/editVillage', '12', '蒋武', '118.113.0.160', '1', '编辑小区信息成功,小区名称是：龙城 一号,小区编号是:36', '2018-08-03 05:04:12');
INSERT INTO `hj_system_log` VALUES ('502', 'Post/editVillage', '12', '蒋武', '118.113.0.160', '1', '编辑小区信息成功,小区名称是：中国铁建国际城,小区编号是:33', '2018-08-03 05:04:39');
INSERT INTO `hj_system_log` VALUES ('503', 'Post/editVillage', '12', '蒋武', '118.113.0.160', '1', '编辑小区信息成功,小区名称是：ICON尚郡,小区编号是:8', '2018-08-03 05:05:08');
INSERT INTO `hj_system_log` VALUES ('504', 'Post/editVillage', '12', '蒋武', '118.113.0.160', '1', '编辑小区信息成功,小区名称是：越鞠苑二期,小区编号是:27', '2018-08-03 05:05:27');
INSERT INTO `hj_system_log` VALUES ('505', 'Post/editVillage', '12', '蒋武', '118.113.0.160', '1', '编辑小区信息成功,小区名称是：越鞠苑二期,小区编号是:27', '2018-08-03 05:06:17');
INSERT INTO `hj_system_log` VALUES ('506', 'Post/editVillage', '12', '蒋武', '118.113.0.160', '1', '编辑小区信息成功,小区名称是：中国铁建国际城,小区编号是:33', '2018-08-03 05:06:31');
INSERT INTO `hj_system_log` VALUES ('507', 'Post/editVillage', '12', '蒋武', '118.113.0.160', '1', '编辑小区信息成功,小区名称是：珠江御景湾,小区编号是:31', '2018-08-03 05:06:51');
INSERT INTO `hj_system_log` VALUES ('508', 'Post/editVillage', '12', '蒋武', '118.113.0.160', '1', '编辑小区信息成功,小区名称是：珠江御景湾,小区编号是:31', '2018-08-03 05:07:07');
INSERT INTO `hj_system_log` VALUES ('509', 'Post/editVillage', '12', '蒋武', '118.113.0.160', '1', '编辑小区信息成功,小区名称是：地铁首座,小区编号是:11', '2018-08-03 05:07:49');
INSERT INTO `hj_system_log` VALUES ('510', 'Post/editVillage', '12', '蒋武', '118.113.0.160', '1', '编辑小区信息成功,小区名称是：西班牙森林,小区编号是:14', '2018-08-03 05:08:05');
INSERT INTO `hj_system_log` VALUES ('511', 'Post/editCarPark', '12', '蒋武', '118.113.0.160', '1', '编辑车位信息成功,车位名称是：地下二层,车位id是：26', '2018-08-03 05:15:27');
INSERT INTO `hj_system_log` VALUES ('512', 'Post/editCarPark', '12', '蒋武', '118.113.0.160', '1', '编辑车位信息成功,车位名称是：地下二层,车位id是：26', '2018-08-03 05:16:29');
INSERT INTO `hj_system_log` VALUES ('513', 'Post/delCarPark', '12', '蒋武', '118.113.0.160', '1', '删除车位信息成功,车位名称是：地下二层,车位id是:26', '2018-08-03 05:17:07');
INSERT INTO `hj_system_log` VALUES ('514', 'Member/AddUser', '10', '蓝敏', '118.113.0.160', '1', '新增用户信息成功,用户登陆账户是刘加强', '2018-08-04 19:27:15');
INSERT INTO `hj_system_log` VALUES ('515', 'Member/EditUser', '10', '蓝敏', '118.113.0.160', '1', '编辑用户成功,用户id是:14', '2018-08-04 19:27:34');
INSERT INTO `hj_system_log` VALUES ('516', 'Member/editJurisdiction', '10', '蓝敏', '118.113.0.160', '1', '编辑用户组成功', '2018-08-04 19:29:47');
INSERT INTO `hj_system_log` VALUES ('517', 'Member/EditUser', '10', '蓝敏', '118.113.0.160', '1', '编辑用户成功,用户id是:14', '2018-08-04 19:33:32');
INSERT INTO `hj_system_log` VALUES ('518', 'Member/EditUser', '10', '蓝敏', '118.113.0.160', '1', '编辑用户成功,用户id是:14', '2018-08-04 19:34:09');
INSERT INTO `hj_system_log` VALUES ('519', 'Member/EditUser', '10', '蓝敏', '118.113.0.160', '1', '编辑用户成功,用户id是:14', '2018-08-04 19:34:19');
INSERT INTO `hj_system_log` VALUES ('520', 'Member/EditUser', '10', '蓝敏', '118.113.0.160', '1', '编辑用户成功,用户id是:14', '2018-08-04 19:40:19');
INSERT INTO `hj_system_log` VALUES ('521', 'Member/EditUser', '10', '蓝敏', '118.113.0.160', '1', '编辑用户成功,用户id是:14', '2018-08-04 19:40:39');
INSERT INTO `hj_system_log` VALUES ('522', 'Member/EditUser', '10', '蓝敏', '118.113.0.160', '1', '编辑用户成功,用户id是:14', '2018-08-04 19:41:19');
INSERT INTO `hj_system_log` VALUES ('523', 'Member/AddUser', '10', '蓝敏', '118.113.0.160', '1', '新增用户信息成功,用户登陆账户是廖思', '2018-08-04 19:44:17');
INSERT INTO `hj_system_log` VALUES ('524', 'Member/EditUser', '10', '蓝敏', '118.113.0.160', '1', '编辑用户成功,用户id是:15', '2018-08-04 19:44:46');
INSERT INTO `hj_system_log` VALUES ('525', 'Member/editJurisdiction', '10', '蓝敏', '118.113.0.160', '1', '编辑用户组成功', '2018-08-04 19:47:22');
INSERT INTO `hj_system_log` VALUES ('526', 'Member/addDepartment', '10', '蓝敏', '118.113.0.160', '1', '新增部门信息成功,部门名称是一里屋营销部', '2018-08-04 19:57:42');
INSERT INTO `hj_system_log` VALUES ('527', 'Member/EditUser', '10', '蓝敏', '118.113.0.160', '1', '编辑用户成功,用户id是:15', '2018-08-04 19:58:05');
INSERT INTO `hj_system_log` VALUES ('528', 'Member/EditUser', '10', '蓝敏', '118.113.0.160', '1', '编辑用户成功,用户id是:15', '2018-08-04 20:01:50');
INSERT INTO `hj_system_log` VALUES ('529', 'Member/EditUser', '10', '蓝敏', '118.113.0.160', '1', '编辑用户成功,用户id是:14', '2018-08-04 20:01:59');
INSERT INTO `hj_system_log` VALUES ('530', 'Post/addSalesUser', '10', '蓝敏', '118.113.0.160', '1', '新增销售人员成功,销售公司名称是：6,销售人员名称是：刘加强', '2018-08-04 20:44:13');
INSERT INTO `hj_system_log` VALUES ('531', 'Post/addSalesUser', '10', '蓝敏', '118.113.0.160', '1', '新增销售人员成功,销售公司名称是：6,销售人员名称是：廖思', '2018-08-04 20:47:18');
INSERT INTO `hj_system_log` VALUES ('532', 'Post/editVillage', '14', '刘加强', '118.113.0.160', '1', '编辑小区信息成功,小区名称是：师大现代花园,小区编号是:15', '2018-08-04 20:48:18');
INSERT INTO `hj_system_log` VALUES ('533', 'Post/editVillage', '14', '刘加强', '118.113.0.160', '1', '编辑小区信息成功,小区名称是：ICON尚郡,小区编号是:8', '2018-08-04 20:49:00');
INSERT INTO `hj_system_log` VALUES ('534', 'Post/editVillage', '14', '刘加强', '118.113.0.160', '1', '编辑小区信息成功,小区名称是：地铁首座,小区编号是:11', '2018-08-04 21:08:37');
INSERT INTO `hj_system_log` VALUES ('535', 'Post/editVillage', '14', '刘加强', '118.113.0.160', '1', '编辑小区信息成功,小区名称是：龙城一号,小区编号是:6', '2018-08-04 21:09:02');
INSERT INTO `hj_system_log` VALUES ('536', 'Member/AddUser', '10', '蓝敏', '171.221.136.18', '1', '新增用户信息成功,用户登陆账户是沈伟', '2018-08-14 09:22:10');
INSERT INTO `hj_system_log` VALUES ('537', 'Login/editInfo', '16', '沈伟', '171.221.136.18', '1', '修改资料成功,用户id是:', '2018-08-14 09:24:30');
INSERT INTO `hj_system_log` VALUES ('538', 'Post/addSalesUser', '10', '蓝敏', '171.221.136.18', '1', '新增销售人员成功,销售公司名称是：5,销售人员名称是：沈伟', '2018-08-14 09:25:52');
INSERT INTO `hj_system_log` VALUES ('539', 'Post/editVillage', '10', '蓝敏', '171.221.136.18', '1', '编辑小区信息成功,小区名称是：上龙门,小区编号是:13', '2018-08-14 09:28:34');
INSERT INTO `hj_system_log` VALUES ('540', 'Post/editVillage', '10', '蓝敏', '171.221.136.18', '1', '编辑小区信息成功,小区名称是：边城水恋,小区编号是:12', '2018-08-14 09:29:51');
INSERT INTO `hj_system_log` VALUES ('541', 'Member/delGroup', '10', '蓝敏', '171.221.136.18', '1', '删除用户组成功', '2018-08-14 09:36:17');
INSERT INTO `hj_system_log` VALUES ('542', 'Member/editJurisdiction', '10', '蓝敏', '171.221.136.18', '1', '编辑用户组成功', '2018-08-14 09:39:57');
INSERT INTO `hj_system_log` VALUES ('543', 'Member/editGroup', '10', '蓝敏', '171.221.136.18', '1', '编辑用户组成功', '2018-08-14 09:40:18');
INSERT INTO `hj_system_log` VALUES ('544', 'Member/editJurisdiction', '10', '蓝敏', '171.221.136.18', '1', '编辑用户组成功', '2018-08-14 09:42:02');
INSERT INTO `hj_system_log` VALUES ('545', 'Member/editJurisdiction', '10', '蓝敏', '171.221.136.18', '1', '编辑用户组成功', '2018-08-14 09:46:36');
INSERT INTO `hj_system_log` VALUES ('546', 'Member/editJurisdiction', '10', '蓝敏', '171.221.136.18', '1', '编辑用户组成功', '2018-08-14 09:47:20');
INSERT INTO `hj_system_log` VALUES ('547', 'Member/editJurisdiction', '10', '蓝敏', '171.221.136.18', '1', '编辑用户组成功', '2018-08-14 09:48:33');
INSERT INTO `hj_system_log` VALUES ('548', 'Member/addGroup', '10', '蓝敏', '171.221.136.18', '1', '新增用户组成功', '2018-08-14 09:49:12');
INSERT INTO `hj_system_log` VALUES ('549', 'Member/delGroup', '10', '蓝敏', '171.221.136.18', '1', '删除用户组成功', '2018-08-14 09:51:20');
INSERT INTO `hj_system_log` VALUES ('550', 'Member/editJurisdiction', '10', '蓝敏', '171.221.136.18', '1', '编辑用户组成功', '2018-08-14 09:53:32');
INSERT INTO `hj_system_log` VALUES ('551', 'Post/delVillage', '12', '蒋武', '171.221.136.18', '1', '删除小区信息成功,小区名称是：bwnnww,小区编号是:25', '2018-08-14 09:54:13');
INSERT INTO `hj_system_log` VALUES ('552', 'Post/delVillage', '12', '蒋武', '171.221.136.18', '1', '删除小区信息成功,小区名称是：bwnnww,小区编号是:25', '2018-08-14 09:54:18');
INSERT INTO `hj_system_log` VALUES ('553', 'Member/AddUser', '10', '蓝敏', '171.221.136.18', '1', '新增用户信息成功,用户登陆账户是谌礼俊', '2018-08-15 10:40:16');
INSERT INTO `hj_system_log` VALUES ('554', 'Member/EditUser', '10', '蓝敏', '171.221.136.18', '1', '编辑用户成功,用户id是:17', '2018-08-15 10:40:38');
INSERT INTO `hj_system_log` VALUES ('555', 'Post/addSalesUser', '10', '蓝敏', '171.221.136.18', '1', '新增销售人员成功,销售公司名称是：5,销售人员名称是：谌礼俊', '2018-08-15 10:41:14');
INSERT INTO `hj_system_log` VALUES ('556', 'Member/EditUser', '16', '沈伟', '171.221.142.179', '1', '编辑用户成功,用户id是:16', '2018-09-10 15:56:38');
INSERT INTO `hj_system_log` VALUES ('557', 'Member/EditUser', '16', '沈伟', '171.221.142.179', '1', '编辑用户成功,用户id是:16', '2018-09-10 15:57:39');
INSERT INTO `hj_system_log` VALUES ('558', 'Post/editSalesUser', '16', '沈伟', '171.221.142.179', '1', '编辑销售人员成功,销售公司ID是：5,销售人员名称是：沈伟', '2018-09-10 15:58:17');
INSERT INTO `hj_system_log` VALUES ('559', 'Member/editJurisdiction', '10', '蓝敏', '171.221.142.179', '1', '编辑用户组成功', '2018-09-10 18:03:10');
INSERT INTO `hj_system_log` VALUES ('560', 'Member/editJurisdiction', '10', '蓝敏', '171.221.142.179', '1', '编辑用户组成功', '2018-09-10 18:04:45');
INSERT INTO `hj_system_log` VALUES ('561', 'Member/DelUser', '10', '蓝敏', '118.113.1.229', '1', '删除用户成功,用户id是:16,用户名称是沈伟', '2018-09-28 15:36:10');
INSERT INTO `hj_system_log` VALUES ('562', 'Post/delSalesUser', '10', '蓝敏', '118.113.1.229', '1', '删除销售人员成功,销售人员id是：22,销售人员名称是：沈伟', '2018-09-28 15:36:31');
INSERT INTO `hj_system_log` VALUES ('563', 'Post/delSalesUser', '10', '蓝敏', '118.113.1.229', '1', '删除销售人员成功,销售人员id是：16,销售人员名称是：黄叔君', '2018-09-28 15:36:40');
INSERT INTO `hj_system_log` VALUES ('564', 'Post/delSalesUser', '10', '蓝敏', '118.113.1.229', '1', '删除销售人员成功,销售人员id是：9,销售人员名称是：陈海洋', '2018-09-28 15:37:00');
INSERT INTO `hj_system_log` VALUES ('565', 'Post/delSalesUser', '10', '蓝敏', '118.113.1.229', '1', '删除销售人员成功,销售人员id是：11,销售人员名称是：兰刚', '2018-09-28 15:37:16');
INSERT INTO `hj_system_log` VALUES ('566', 'Post/delSalesUser', '10', '蓝敏', '118.113.1.229', '1', '删除销售人员成功,销售人员id是：12,销售人员名称是：游向前', '2018-09-28 15:37:46');
INSERT INTO `hj_system_log` VALUES ('567', 'Post/delSalesUser', '10', '蓝敏', '118.113.1.229', '1', '删除销售人员成功,销售人员id是：5,销售人员名称是：张亮', '2018-09-28 15:37:58');
INSERT INTO `hj_system_log` VALUES ('568', 'Member/DelUser', '10', '蓝敏', '118.113.1.229', '1', '删除用户成功,用户id是:8,用户名称是黄叔君', '2018-09-28 15:38:23');
INSERT INTO `hj_system_log` VALUES ('569', 'Member/DelUser', '10', '蓝敏', '118.113.1.229', '1', '删除用户成功,用户id是:4,用户名称是海洋', '2018-09-28 15:38:33');
INSERT INTO `hj_system_log` VALUES ('570', 'Member/EditUser', '10', '蓝敏', '139.205.19.95', '1', '编辑用户成功,用户id是:14', '2018-09-30 09:48:24');
INSERT INTO `hj_system_log` VALUES ('571', 'Member/DelUser', '10', '蓝敏', '139.205.19.95', '1', '删除用户成功,用户id是:15,用户名称是廖思', '2018-09-30 09:48:35');
INSERT INTO `hj_system_log` VALUES ('572', 'Post/addSalesUser', '10', '蓝敏', '139.205.19.95', '1', '新增销售人员成功,销售公司名称是：6,销售人员名称是：周萍', '2018-09-30 10:23:57');
INSERT INTO `hj_system_log` VALUES ('573', 'Post/addSalesUser', '10', '蓝敏', '139.205.19.95', '1', '新增销售人员成功,销售公司名称是：6,销售人员名称是：巫晓明', '2018-09-30 10:25:08');
INSERT INTO `hj_system_log` VALUES ('574', 'Post/editVillage', '10', '蓝敏', '139.205.19.95', '1', '编辑小区信息成功,小区名称是：珠江御景湾,小区编号是:31', '2018-09-30 10:27:13');
INSERT INTO `hj_system_log` VALUES ('575', 'Post/editVillage', '10', '蓝敏', '139.205.19.95', '1', '编辑小区信息成功,小区名称是：中国铁建国际城,小区编号是:33', '2018-09-30 10:27:35');
INSERT INTO `hj_system_log` VALUES ('576', 'Post/editSalesUser', '10', '蓝敏', '139.205.19.95', '1', '编辑销售人员成功,销售公司ID是：6,销售人员名称是：周萍', '2018-09-30 10:28:13');
INSERT INTO `hj_system_log` VALUES ('577', 'Post/addSalesUser', '10', '蓝敏', '139.205.19.95', '1', '新增销售人员成功,销售公司名称是：6,销售人员名称是：马雪', '2018-09-30 10:30:09');
INSERT INTO `hj_system_log` VALUES ('578', 'Post/addCarPark', '14', '刘加强', '139.205.19.95', '1', '新增车位信息成功,车位名称是：-1', '2018-09-30 11:04:10');
INSERT INTO `hj_system_log` VALUES ('579', 'Mortgage/downApply/1', '10', '蓝敏', '171.221.138.7', '1', '导出按揭深审核信息成功', '2018-10-11 15:14:05');
INSERT INTO `hj_system_log` VALUES ('580', 'Post/delVillage', '10', '蓝敏', '171.221.138.7', '1', '删除小区信息成功,小区名称是：bwnnww,小区编号是:25', '2018-10-11 15:15:36');
INSERT INTO `hj_system_log` VALUES ('581', 'Post/delVillage', '10', '蓝敏', '171.221.138.7', '1', '删除小区信息成功,小区名称是：bwnnww,小区编号是:25', '2018-10-11 15:15:41');
INSERT INTO `hj_system_log` VALUES ('582', 'Bank/addBankUser', '10', '蓝敏', '171.221.138.7', '1', '新增银行管理人员成功,银行编号是：4,银行管理人员名称是：Jon', '2018-10-11 15:20:08');
INSERT INTO `hj_system_log` VALUES ('583', 'Bank/delBankUser', '10', '蓝敏', '171.221.138.7', '1', '删除银行管理人员成功,银行人员编号是：5', '2018-10-11 15:23:48');
INSERT INTO `hj_system_log` VALUES ('584', 'Bank/addBankUser', '10', '蓝敏', '171.221.138.7', '1', '新增银行管理人员成功,银行编号是：4,银行管理人员名称是：Jon', '2018-10-11 15:24:50');
INSERT INTO `hj_system_log` VALUES ('585', 'Bank/delBankUser', '10', '蓝敏', '171.221.138.7', '1', '删除银行管理人员成功,银行人员编号是：6', '2018-10-11 15:27:50');
INSERT INTO `hj_system_log` VALUES ('586', 'Post/delVillage', '10', '蓝敏', '171.221.138.7', '1', '删除小区信息成功,小区名称是：龙城 一号,小区编号是:36', '2018-10-11 17:00:46');
INSERT INTO `hj_system_log` VALUES ('587', 'Post/delVillage', '10', '蓝敏', '171.221.138.7', '1', '删除小区信息成功,小区名称是：中国铁建国际城,小区编号是:33', '2018-10-11 17:00:50');
INSERT INTO `hj_system_log` VALUES ('588', 'Post/delVillage', '10', '蓝敏', '171.221.138.7', '1', '删除小区信息成功,小区名称是：棕榈印象,小区编号是:32', '2018-10-11 17:00:54');
INSERT INTO `hj_system_log` VALUES ('589', 'Post/delVillage', '10', '蓝敏', '171.221.138.7', '1', '删除小区信息成功,小区名称是：珠江御景湾,小区编号是:31', '2018-10-11 17:00:57');
INSERT INTO `hj_system_log` VALUES ('590', 'Post/delVillage', '10', '蓝敏', '171.221.138.7', '1', '删除小区信息成功,小区名称是：福泉中心,小区编号是:30', '2018-10-11 17:01:00');
INSERT INTO `hj_system_log` VALUES ('591', 'Post/delVillage', '10', '蓝敏', '171.221.138.7', '1', '删除小区信息成功,小区名称是：世茂城,小区编号是:29', '2018-10-11 17:01:04');
INSERT INTO `hj_system_log` VALUES ('592', 'Post/delVillage', '10', '蓝敏', '171.221.138.7', '1', '删除小区信息成功,小区名称是：金色鱼凫,小区编号是:28', '2018-10-11 17:01:08');
INSERT INTO `hj_system_log` VALUES ('593', 'Post/delVillage', '10', '蓝敏', '171.221.138.7', '1', '删除小区信息成功,小区名称是：越鞠苑二期,小区编号是:27', '2018-10-11 17:01:11');
INSERT INTO `hj_system_log` VALUES ('594', 'Post/delVillage', '10', '蓝敏', '171.221.138.7', '1', '删除小区信息成功,小区名称是：西班牙森林,小区编号是:14', '2018-10-11 17:01:24');
INSERT INTO `hj_system_log` VALUES ('595', 'Post/delVillage', '10', '蓝敏', '171.221.138.7', '1', '删除小区信息成功,小区名称是：首创东公元,小区编号是:26', '2018-10-11 17:01:28');
INSERT INTO `hj_system_log` VALUES ('596', 'Post/delVillage', '10', '蓝敏', '171.221.138.7', '1', '删除小区信息成功,小区名称是：佳兆业丽晶公馆,小区编号是:24', '2018-10-11 17:01:31');
INSERT INTO `hj_system_log` VALUES ('597', 'Post/delVillage', '10', '蓝敏', '171.221.138.7', '1', '删除小区信息成功,小区名称是：首创万卷山,小区编号是:23', '2018-10-11 17:01:35');
INSERT INTO `hj_system_log` VALUES ('598', 'Post/delVillage', '10', '蓝敏', '171.221.138.7', '1', '删除小区信息成功,小区名称是：金河谷,小区编号是:10', '2018-10-11 17:01:41');
INSERT INTO `hj_system_log` VALUES ('599', 'Post/delVillage', '10', '蓝敏', '171.221.138.7', '1', '删除小区信息成功,小区名称是：林溪康城,小区编号是:22', '2018-10-11 17:01:43');
INSERT INTO `hj_system_log` VALUES ('600', 'Post/delVillage', '10', '蓝敏', '171.221.138.7', '1', '删除小区信息成功,小区名称是：百悦城百悦天鹅湖,小区编号是:21', '2018-10-11 17:01:47');
INSERT INTO `hj_system_log` VALUES ('601', 'Post/delVillage', '10', '蓝敏', '171.221.138.7', '1', '删除小区信息成功,小区名称是：东城之星观邸,小区编号是:20', '2018-10-11 17:01:50');
INSERT INTO `hj_system_log` VALUES ('602', 'Post/delVillage', '10', '蓝敏', '171.221.138.7', '1', '删除小区信息成功,小区名称是：雄飞生活广场,小区编号是:18', '2018-10-11 17:01:53');
INSERT INTO `hj_system_log` VALUES ('603', 'Post/delVillage', '10', '蓝敏', '171.221.138.7', '1', '删除小区信息成功,小区名称是：海骏达蜀都1号凯悦,小区编号是:17', '2018-10-11 17:01:56');
INSERT INTO `hj_system_log` VALUES ('604', 'Post/delVillage', '10', '蓝敏', '171.221.138.7', '1', '删除小区信息成功,小区名称是：上龙门,小区编号是:13', '2018-10-11 17:01:59');
INSERT INTO `hj_system_log` VALUES ('605', 'Post/delCarPark', '10', '蓝敏', '171.221.138.7', '1', '删除车位信息成功,车位名称是：-1,车位id是:28', '2018-10-11 17:02:15');
INSERT INTO `hj_system_log` VALUES ('606', 'Post/delCarPark', '10', '蓝敏', '171.221.138.7', '1', '删除车位信息成功,车位名称是：热污染翁而我 ,车位id是:27', '2018-10-11 17:02:17');
INSERT INTO `hj_system_log` VALUES ('607', 'Post/delCarPark', '10', '蓝敏', '171.221.138.7', '1', '删除车位信息成功,车位名称是：地下车位,车位id是:16', '2018-10-11 17:02:20');
INSERT INTO `hj_system_log` VALUES ('608', 'Post/delCarPark', '10', '蓝敏', '171.221.138.7', '1', '删除车位信息成功,车位名称是：地下车位,车位id是:15', '2018-10-11 17:02:23');
INSERT INTO `hj_system_log` VALUES ('609', 'Post/delCarPark', '10', '蓝敏', '171.221.138.7', '1', '删除车位信息成功,车位名称是：地下车位,车位id是:14', '2018-10-11 17:02:26');
INSERT INTO `hj_system_log` VALUES ('610', 'Post/delCarPark', '10', '蓝敏', '171.221.138.7', '1', '删除车位信息成功,车位名称是：地下车位,车位id是:13', '2018-10-11 17:02:29');
INSERT INTO `hj_system_log` VALUES ('611', 'Post/delCarPark', '10', '蓝敏', '171.221.138.7', '1', '删除车位信息成功,车位名称是：地下车位,车位id是:12', '2018-10-11 17:02:32');
INSERT INTO `hj_system_log` VALUES ('612', 'Post/delCarPark', '10', '蓝敏', '171.221.138.7', '1', '删除车位信息成功,车位名称是：地下车位,车位id是:11', '2018-10-11 17:02:35');
INSERT INTO `hj_system_log` VALUES ('613', 'Post/delCarPark', '10', '蓝敏', '171.221.138.7', '1', '删除车位信息成功,车位名称是：地下车位,车位id是:10', '2018-10-11 17:02:37');
INSERT INTO `hj_system_log` VALUES ('614', 'Post/delCarPark', '10', '蓝敏', '171.221.138.7', '1', '删除车位信息成功,车位名称是：地下车位,车位id是:9', '2018-10-11 17:02:40');
INSERT INTO `hj_system_log` VALUES ('615', 'Post/delCarPark', '10', '蓝敏', '171.221.138.7', '1', '删除车位信息成功,车位名称是：地下车位,车位id是:8', '2018-10-11 17:02:42');
INSERT INTO `hj_system_log` VALUES ('616', 'Post/delCarPark', '10', '蓝敏', '171.221.138.7', '1', '删除车位信息成功,车位名称是：地下车位,车位id是:7', '2018-10-11 17:02:45');
INSERT INTO `hj_system_log` VALUES ('617', 'Post/delCarPark', '10', '蓝敏', '171.221.138.7', '1', '删除车位信息成功,车位名称是：地下车位,车位id是:6', '2018-10-11 17:02:48');
INSERT INTO `hj_system_log` VALUES ('618', 'Post/delVillage', '10', '蓝敏', '171.221.138.7', '1', '删除小区信息成功,小区名称是：师大现代花园,小区编号是:15', '2018-10-11 17:04:23');
INSERT INTO `hj_system_log` VALUES ('619', 'Post/delVillage', '10', '蓝敏', '171.221.138.7', '1', '删除小区信息成功,小区名称是：边城水恋,小区编号是:12', '2018-10-11 17:04:26');
INSERT INTO `hj_system_log` VALUES ('620', 'Post/delVillage', '10', '蓝敏', '171.221.138.7', '1', '删除小区信息成功,小区名称是：地铁首座,小区编号是:11', '2018-10-11 17:04:28');
INSERT INTO `hj_system_log` VALUES ('621', 'Post/delVillage', '10', '蓝敏', '171.221.138.7', '1', '删除小区信息成功,小区名称是：明信城1期,小区编号是:9', '2018-10-11 17:04:31');
INSERT INTO `hj_system_log` VALUES ('622', 'Post/delVillage', '10', '蓝敏', '171.221.138.7', '1', '删除小区信息成功,小区名称是：ICON尚郡,小区编号是:8', '2018-10-11 17:04:35');
INSERT INTO `hj_system_log` VALUES ('623', 'Post/delVillage', '10', '蓝敏', '171.221.138.7', '1', '删除小区信息成功,小区名称是：珠江国际花园,小区编号是:7', '2018-10-11 17:04:39');
INSERT INTO `hj_system_log` VALUES ('624', 'Post/delVillage', '10', '蓝敏', '171.221.138.7', '1', '删除小区信息成功,小区名称是：龙城一号,小区编号是:6', '2018-10-11 17:04:42');
INSERT INTO `hj_system_log` VALUES ('625', 'Post/delVillage', '10', '蓝敏', '171.221.138.7', '1', '删除小区信息成功,小区名称是：天府逸家一期,小区编号是:5', '2018-10-11 17:04:45');
INSERT INTO `hj_system_log` VALUES ('626', 'Post/delVillage', '10', '蓝敏', '171.221.138.7', '1', '删除小区信息成功,小区名称是：珠江青云台,小区编号是:4', '2018-10-11 17:04:47');
INSERT INTO `hj_system_log` VALUES ('627', 'Post/delSalesUser', '10', '蓝敏', '171.221.138.7', '1', '删除销售人员成功,销售人员id是：21,销售人员名称是：廖思', '2018-10-11 17:05:01');
INSERT INTO `hj_system_log` VALUES ('628', 'Member/AddUser', '10', '蓝敏', '171.221.138.7', '1', '新增用户信息成功,用户登陆账户是13551555068', '2018-10-11 17:10:33');
INSERT INTO `hj_system_log` VALUES ('629', 'Member/EditUser', '10', '蓝敏', '171.221.138.7', '1', '编辑用户成功,用户id是:12', '2018-10-12 09:19:07');
INSERT INTO `hj_system_log` VALUES ('630', 'Bank/addBankUser', '10', '蓝敏', '171.221.138.7', '1', '新增银行管理人员成功,银行编号是：2,银行管理人员名称是：Jon', '2018-10-12 09:20:32');
INSERT INTO `hj_system_log` VALUES ('631', 'Post/addVillage', '10', '蓝敏', '171.221.138.7', '1', '新增小区信息成功,小区名称是：帝景峰', '2018-10-12 09:34:26');
INSERT INTO `hj_system_log` VALUES ('632', 'Post/addCarPark', '10', '蓝敏', '171.221.138.7', '1', '新增车位信息成功,车位名称是：帝景峰·一期地下车位', '2018-10-12 09:36:08');
INSERT INTO `hj_system_log` VALUES ('633', 'Post/editVillage', '10', '蓝敏', '171.221.138.7', '1', '编辑小区信息成功,小区名称是：帝景峰,小区编号是:37', '2018-10-12 09:40:33');
INSERT INTO `hj_system_log` VALUES ('634', 'Post/editVillage', '10', '蓝敏', '171.221.138.7', '1', '编辑小区信息成功,小区名称是：帝景峰,小区编号是:37', '2018-10-12 09:41:02');
INSERT INTO `hj_system_log` VALUES ('635', 'Post/editCarPark', '10', '蓝敏', '171.221.138.7', '1', '编辑车位信息成功,车位名称是：帝景峰·一期地下车位,车位id是：29', '2018-10-12 09:42:22');
INSERT INTO `hj_system_log` VALUES ('636', 'Post/editCarPark', '10', '蓝敏', '171.221.138.7', '1', '编辑车位信息成功,车位名称是：帝景峰·一期地下车位,车位id是：29', '2018-10-12 09:47:29');
INSERT INTO `hj_system_log` VALUES ('637', 'Post/editCarPark', '10', '蓝敏', '171.221.138.7', '1', '编辑车位信息成功,车位名称是：帝景峰·一期地下车位,车位id是：29', '2018-10-12 09:47:53');
INSERT INTO `hj_system_log` VALUES ('638', 'Post/editVillage', '10', '蓝敏', '171.221.138.7', '1', '编辑小区信息成功,小区名称是：帝景峰,小区编号是:37', '2018-10-12 09:51:37');
INSERT INTO `hj_system_log` VALUES ('639', 'Post/editCarPark', '10', '蓝敏', '171.221.138.7', '1', '编辑车位信息成功,车位名称是：帝景峰·一期地下车位,车位id是：29', '2018-10-12 09:52:30');
INSERT INTO `hj_system_log` VALUES ('640', 'Post/addCarPark', '10', '蓝敏', '171.221.138.7', '1', '新增车位信息成功,车位名称是：帝景峰·一期地下车位', '2018-10-12 10:03:34');
INSERT INTO `hj_system_log` VALUES ('641', 'Post/editCarPark', '10', '蓝敏', '171.221.138.7', '1', '编辑车位信息成功,车位名称是：帝景峰·一期地下车位,车位id是：30', '2018-10-12 10:04:02');
INSERT INTO `hj_system_log` VALUES ('642', 'Post/editCarPark', '10', '蓝敏', '171.221.138.7', '1', '编辑车位信息成功,车位名称是：帝景峰·一期地下车位,车位id是：29', '2018-10-12 10:04:17');
INSERT INTO `hj_system_log` VALUES ('643', 'Post/editCarPark', '10', '蓝敏', '171.221.138.7', '1', '编辑车位信息成功,车位名称是：帝景峰·一期地下车位,车位id是：30', '2018-10-12 10:04:49');
INSERT INTO `hj_system_log` VALUES ('644', 'Post/editVillage', '10', '蓝敏', '171.221.138.7', '1', '编辑小区信息成功,小区名称是：帝景峰,小区编号是:37', '2018-10-12 10:09:09');
INSERT INTO `hj_system_log` VALUES ('645', 'Post/addSalesUser', '1', '胡骞兮', '::1', '1', '新增销售人员成功,销售公司名称是：5,销售人员名称是：向前', '2018-10-12 12:00:36');
INSERT INTO `hj_system_log` VALUES ('646', 'Post/addVillage', '19', 'hiyang', '::1', '1', '新增小区信息成功,小区名称是：32424', '2018-10-12 15:32:54');
INSERT INTO `hj_system_log` VALUES ('647', 'Post/editVillage', '19', 'hiyang', '::1', '1', '编辑小区信息成功,小区名称是：32424,小区编号是:38', '2018-10-12 16:58:23');
INSERT INTO `hj_system_log` VALUES ('648', 'Post/editVillage', '19', 'hiyang', '::1', '1', '编辑小区信息成功,小区名称是：32424,小区编号是:38', '2018-10-12 17:00:38');

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
INSERT INTO `hj_system_nav` VALUES ('1', '基础资料', '1', '0', null, 'member', null, null);
INSERT INTO `hj_system_nav` VALUES ('2', '小区管理', '1', '0', null, 'village', '', null);
INSERT INTO `hj_system_nav` VALUES ('3', '按揭申请管理', '1', '0', null, 'Mortgage/applyList', 'am-icon-calendar', 'applyList');
INSERT INTO `hj_system_nav` VALUES ('4', '财务管理', '1', '0', null, 'finance', null, null);
INSERT INTO `hj_system_nav` VALUES ('5', '银行管理', '1', '2', null, 'Bank/bankList', null, 'bankList');
INSERT INTO `hj_system_nav` VALUES ('6', '银行人员管理', '1', '2', null, 'Bank/bankPersonnel', null, 'bankPersonnel');
INSERT INTO `hj_system_nav` VALUES ('7', '开发商管理', '1', '2', null, 'Post/developers', null, 'developers');
INSERT INTO `hj_system_nav` VALUES ('8', '销售公司管理', '1', '2', null, 'Post/salesCompany', null, 'salesCompany');
INSERT INTO `hj_system_nav` VALUES ('9', '销售人员管理', '1', '2', null, 'Post/salesUser', null, 'salesUser');
INSERT INTO `hj_system_nav` VALUES ('10', '商家管理', '1', '2', null, 'Post/business', null, 'business');
INSERT INTO `hj_system_nav` VALUES ('11', '小区管理', '1', '2', null, 'Post/village', null, 'village');
INSERT INTO `hj_system_nav` VALUES ('12', '车位管理', '1', '2', null, 'Post/carPark', null, 'carPark');
INSERT INTO `hj_system_nav` VALUES ('13', '业务提成', '1', '4', null, 'Mortgage/commision', null, 'commision');
INSERT INTO `hj_system_nav` VALUES ('14', '小区提成', '1', '4', null, 'Mortgage/villageCommision', null, 'villageCommision');
INSERT INTO `hj_system_nav` VALUES ('15', '公司管理', '1', '1', null, 'Member/company', null, 'company');
INSERT INTO `hj_system_nav` VALUES ('16', '部门管理', '1', '1', null, 'Member/department', null, 'department');
INSERT INTO `hj_system_nav` VALUES ('17', '用户组管理', '1', '1', null, 'Member/group', null, 'group');
INSERT INTO `hj_system_nav` VALUES ('18', '用户管理', '1', '1', null, 'Member/adminUser', null, 'adminUser');
INSERT INTO `hj_system_nav` VALUES ('19', '小程序banner', '1', '21', null, 'Home/bannerList', null, 'bannerList');
INSERT INTO `hj_system_nav` VALUES ('20', '系统日志', '1', '21', null, 'Home/systemLog', null, 'systemLog');
INSERT INTO `hj_system_nav` VALUES ('21', '系统设置', '1', '0', null, 'system', null, null);
INSERT INTO `hj_system_nav` VALUES ('22', '提现记录', '1', '4', null, 'Mortgage/putForward', null, 'putForward');
INSERT INTO `hj_system_nav` VALUES ('23', '新增公司', '0', '15', null, 'Member/AddCompany', null, null);
INSERT INTO `hj_system_nav` VALUES ('24', '编辑公司', '0', '15', null, 'Member/editCompany', null, null);
INSERT INTO `hj_system_nav` VALUES ('25', '删除公司', '0', '15', null, 'Member/delCompany', null, null);
INSERT INTO `hj_system_nav` VALUES ('26', '新增部门', '0', '16', null, 'Member/addDepartment', null, null);
INSERT INTO `hj_system_nav` VALUES ('27', '编辑部门', '0', '16', null, 'Member/editDepartment', null, null);
INSERT INTO `hj_system_nav` VALUES ('28', '删除部门', '0', '16', null, 'Member/delDepartment', null, null);
INSERT INTO `hj_system_nav` VALUES ('29', '新增用户组', '0', '17', null, 'Member/addGroup', null, null);
INSERT INTO `hj_system_nav` VALUES ('30', '编辑用户组', '0', '17', null, 'Member/editGroup', null, null);
INSERT INTO `hj_system_nav` VALUES ('31', '删除用户组', '0', '17', null, 'Member/delGroup', null, null);
INSERT INTO `hj_system_nav` VALUES ('32', '新增用户', '0', '18', null, 'Member/AddUser', null, null);
INSERT INTO `hj_system_nav` VALUES ('33', '编辑用户', '0', '18', null, 'Member/EditUser', null, null);
INSERT INTO `hj_system_nav` VALUES ('34', '删除用户', '0', '18', null, 'Member/DelUser', null, null);
INSERT INTO `hj_system_nav` VALUES ('35', '分配权限', '0', '17', null, 'Member/GroupJurisdiction', null, null);
INSERT INTO `hj_system_nav` VALUES ('36', '新增银行', '0', '5', null, 'Bank/addBank', null, null);
INSERT INTO `hj_system_nav` VALUES ('37', '编辑银行', '0', '5', null, 'Bank/editBank', null, null);
INSERT INTO `hj_system_nav` VALUES ('38', '删除银行', '0', '5', null, 'Bank/delBank', null, null);
INSERT INTO `hj_system_nav` VALUES ('39', '新增银行人员', '0', '6', null, 'Bank/addBankUser', null, null);
INSERT INTO `hj_system_nav` VALUES ('40', '编辑银行人员', '0', '6', null, 'Bank/editBankUser', null, null);
INSERT INTO `hj_system_nav` VALUES ('41', '删除银行人员', '0', '6', null, 'Bank/delBankUser', null, null);
INSERT INTO `hj_system_nav` VALUES ('42', '新增开发商', '0', '7', null, 'Post/addDevel', null, null);
INSERT INTO `hj_system_nav` VALUES ('43', '编辑开发商', '0', '7', null, 'Post/editDevel', null, null);
INSERT INTO `hj_system_nav` VALUES ('44', '删除开发商', '0', '7', null, 'Post/delDevel', null, null);
INSERT INTO `hj_system_nav` VALUES ('45', '新增销售公司', '0', '8', null, 'Post/AddCompany', null, null);
INSERT INTO `hj_system_nav` VALUES ('46', '编辑销售公司', '0', '8', null, 'Post/editCompany', null, null);
INSERT INTO `hj_system_nav` VALUES ('47', '删除销售公司', '0', '8', null, 'Post/delCompany', null, null);
INSERT INTO `hj_system_nav` VALUES ('48', '新增销售人员', '0', '9', null, 'Post/addSalesUser', null, null);
INSERT INTO `hj_system_nav` VALUES ('49', '编辑销售人员', '0', '9', null, 'Post/editSalesUser', null, null);
INSERT INTO `hj_system_nav` VALUES ('50', '删除销售人员', '0', '9', null, 'Post/delSalesUser', null, null);
INSERT INTO `hj_system_nav` VALUES ('51', '新增商家', '0', '10', null, 'Post/addHusiness', null, null);
INSERT INTO `hj_system_nav` VALUES ('52', '编辑商家', '0', '10', null, 'Post/editHusiness', null, null);
INSERT INTO `hj_system_nav` VALUES ('53', '删除商家', '0', '10', null, 'Post/delHusiness', null, null);
INSERT INTO `hj_system_nav` VALUES ('54', '新增小区信息', '0', '11', null, 'Post/addVillage', null, null);
INSERT INTO `hj_system_nav` VALUES ('55', '编辑小区信息', '0', '11', null, 'Post/editVillage', null, null);
INSERT INTO `hj_system_nav` VALUES ('56', '删除小区信息', '0', '11', null, 'Post/delVillage', null, null);
INSERT INTO `hj_system_nav` VALUES ('57', '新增车位信息', '0', '12', null, 'Post/addCarPark', null, null);
INSERT INTO `hj_system_nav` VALUES ('58', '编辑车位信息', '0', '12', null, 'Post/editCarPark', null, null);
INSERT INTO `hj_system_nav` VALUES ('59', '删除车位信息', '0', '12', null, 'Post/delCarPark', null, null);
INSERT INTO `hj_system_nav` VALUES ('60', '删除按揭申请信息', '0', '3', null, 'Mortgage/delApply', null, null);
INSERT INTO `hj_system_nav` VALUES ('61', '导出按揭申请信息', '0', '3', null, 'Mortgage/downApply', null, null);
INSERT INTO `hj_system_nav` VALUES ('62', '首页', '0', '0', null, 'Home/index', null, null);
INSERT INTO `hj_system_nav` VALUES ('63', '修改权限', '0', '17', null, 'Member/editJurisdiction', null, null);

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
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updataUser` int(11) DEFAULT NULL COMMENT '修改用户',
  `updataTime` timestamp NULL DEFAULT NULL COMMENT '修改用户时间',
  `brokerage` float DEFAULT NULL COMMENT '销售提成',
  `carWashNum` int(11) DEFAULT NULL COMMENT '赠送洗车卷数量',
  `recommend` int(11) DEFAULT '0' COMMENT '首页推荐 1推荐  0不推荐',
  `salesUserId` varchar(200) DEFAULT NULL COMMENT '所属销售人员Id',
  `salesCompany` int(11) DEFAULT NULL COMMENT '销售公司',
  `bankExtract` float DEFAULT NULL COMMENT '银行提成',
  `customerExtract` float DEFAULT NULL COMMENT '客户提成',
  `serviceExtract` float DEFAULT NULL COMMENT '业务提成',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hj_village
-- ----------------------------
INSERT INTO `hj_village` VALUES ('37', '2', '2', '帝景峰', '德阳市旌阳区岷山路172号', '17', '2147483647', '112', '0', '112', null, '', '<p><br></p>', '', '1', '80000', '10', '2018-10-12 09:34:26', '10', '2018-10-12 10:09:09', null, '0', '0', '[\"19\"]', '5', null, null, null);
INSERT INTO `hj_village` VALUES ('38', '2', '2', '32424', '24242', '18', '2147483647', '23424', '23424', '234', null, '234234234', '<p>23424</p><p><br></p>', '', '1', '0', '19', '2018-10-12 15:32:54', '19', '2018-10-12 17:00:38', '3', '0', '0', '[\"27\",\"23\",\"19\"]', '5', '4', '2', '-1');
