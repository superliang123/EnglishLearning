/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : englishlearning

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2019-05-25 12:54:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `sex` varchar(2) DEFAULT NULL,
  `email` varchar(32) DEFAULT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `role` varchar(32) DEFAULT 'admin',
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', '123', null, null, null, null, 'admin');
INSERT INTO `admin` VALUES ('2', 'root', 'root', '男', '741320162@qq.com', '13696063963', '2019-04-03', 'admin');
INSERT INTO `admin` VALUES ('3', 'root', 'root', '男', '741320162@qq.com', '13696063963', '2019-04-03', 'admin');
INSERT INTO `admin` VALUES ('4', 'root', 'root', '男', '741320162@qq.com', '13696063963', '2019-04-03', 'admin');
INSERT INTO `admin` VALUES ('5', '1504240527', 'root', '男', '741320162@qq.com', '12233568564', '2019-04-03', 'admin');
INSERT INTO `admin` VALUES ('6', '1504240527', 'root', '男', '741320162@qq.com', '12233568564', '2019-04-03', 'admin');
INSERT INTO `admin` VALUES ('7', '1504240527', 'root', '男', '741320162@qq.com', '12233568564', '2019-04-03', 'admin');
INSERT INTO `admin` VALUES ('8', 'superliang', '123456', '男', '741320162@qq.com', '13696063963', '2019-05-08', 'admin');
INSERT INTO `admin` VALUES ('9', 'superliang666', '123456', '男', '741320162@qq.com', '13696063963', '2019-05-08', 'admin');
INSERT INTO `admin` VALUES ('10', '王企鹅', '123', '男', '2131243@12321.dafdsfa', '4546yu', '2019-05-08', 'admin');
INSERT INTO `admin` VALUES ('11', '2131', '12321213', '男', '2131243@12321.dafdsfa', '21311', '2019-05-16', 'admin');

-- ----------------------------
-- Table structure for audio
-- ----------------------------
DROP TABLE IF EXISTS `audio`;
CREATE TABLE `audio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `time` date DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of audio
-- ----------------------------
INSERT INTO `audio` VALUES ('7', '2014年12月四级真题（第1套）.mp3', 'super亮', 'upload//92df248f-1b0c-4cc9-85fa-d97c699ab4b7_2014年12月四级真题（第1套）.mp3', '2019-05-10', null);
INSERT INTO `audio` VALUES ('8', '2015年6月四级真题（第1套）.mp3', 'super亮', 'upload//e3b7ac96-0438-40cd-b4b5-2279c0459405_2015年6月四级真题（第1套）.mp3', '2019-05-10', null);
INSERT INTO `audio` VALUES ('9', '2015年12月四级真题（第1套）.mp3', 'super亮', 'upload//1c792aae-bc09-4f19-85e9-56def6917d7f_2015年12月四级真题（第1套）.mp3', '2019-05-10', null);

-- ----------------------------
-- Table structure for data
-- ----------------------------
DROP TABLE IF EXISTS `data`;
CREATE TABLE `data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) DEFAULT NULL,
  `author` varchar(32) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `time` date DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of data
-- ----------------------------
INSERT INTO `data` VALUES ('6', '简·六级翻译-翻译素材.pdf', '王老师', 'upload//d01130e8-035f-455d-8ff6-300bf6cdd619_简·六级翻译-翻译素材.pdf', '2019-05-17', null);
INSERT INTO `data` VALUES ('7', '6级48篇段落翻译.pdf', '王老师', 'upload//c3b4adca-26a3-4597-94c2-cde57237d6a7_6级48篇段落翻译.pdf', '2019-05-17', null);
INSERT INTO `data` VALUES ('8', '6级听力&翻译词汇.pdf', 'super亮', 'upload//4ba86703-62c1-4e11-be7e-6b402e378f70_6级听力&翻译词汇.pdf', '2019-05-17', null);
INSERT INTO `data` VALUES ('9', 'DCSJD182大学英语六级巧记速记赠册2.pdf', '李老师', 'upload//fd35dee0-b7a1-43c8-ac2b-6f8dfbea94d0_DCSJD182大学英语六级巧记速记赠册2.pdf', '2019-05-17', null);
INSERT INTO `data` VALUES ('10', '简·六级翻译-更多语法.pdf', '王老师', 'upload//76c16eeb-5443-4fc8-a564-fc394b6cde41_简·六级翻译-更多语法.pdf', '2019-05-17', null);
INSERT INTO `data` VALUES ('11', '简·六级翻译-海量练习.pdf', '王老师', 'upload//9506610e-0f38-4a67-ad12-cb5689ca86d3_简·六级翻译-海量练习.pdf', '2019-05-17', null);

-- ----------------------------
-- Table structure for forum
-- ----------------------------
DROP TABLE IF EXISTS `forum`;
CREATE TABLE `forum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `author` varchar(32) DEFAULT NULL,
  `time` date DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `type` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of forum
-- ----------------------------
INSERT INTO `forum` VALUES ('16', ' How old is your daughter ? ', 'admin', '2019-05-17', 'I wan to Know your daughter', 'English  ——   每日英语');
INSERT INTO `forum` VALUES ('17', 'What can I do for you ?', 'admin', '2019-05-01', ' I want to buy a skirt for my daughter. ', 'English  ——   每日英语');
INSERT INTO `forum` VALUES ('18', 'what can I do if  i were lost in a new city ?', 'admin', '2019-05-09', 'I am lost....', 'English  ——   每日英语');
INSERT INTO `forum` VALUES ('20', '有没有人看到了我在教室掉的伞呢？', 'root', '2019-05-17', '2019.05.16，本人不小心遗失白色雨伞一把，若有人看见，烦请联系软件11501班，XXX，手机号：13206980259。', 'Help     ——   我要求助');
INSERT INTO `forum` VALUES ('21', 'That girl looks very attractive , doesn\'t she?', '2131', '2019-05-17', 'do you think so? I don\'t like girls who look like that . I like girls who aren\'t too slim. If you like her,go and talk to her.', 'English  ——   每日英语');
INSERT INTO `forum` VALUES ('22', 'I\'m going to the beauty parlor. Do you want to come too?', 'admin', '2019-05-17', 'I want to have a foot massage and hair cut.', 'Study    ——   学习交流');
INSERT INTO `forum` VALUES ('23', 'How old are you ?', '张三', '2019-05-18', 'I am 18 years old', 'English  ——   每日英语');

-- ----------------------------
-- Table structure for forum_reply
-- ----------------------------
DROP TABLE IF EXISTS `forum_reply`;
CREATE TABLE `forum_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `forumid` int(11) DEFAULT NULL,
  `author` varchar(32) DEFAULT NULL,
  `content` text,
  `lou` int(11) DEFAULT NULL,
  `time` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of forum_reply
-- ----------------------------
INSERT INTO `forum_reply` VALUES ('20', '2', '张三', '阿', '1', '2018-05-31');
INSERT INTO `forum_reply` VALUES ('21', '2', '张三', '阿', '2', '2018-05-31');
INSERT INTO `forum_reply` VALUES ('22', '3', '张三', '阿', '1', '2018-05-31');
INSERT INTO `forum_reply` VALUES ('23', '3', '张三', '阿', '2', '2018-05-31');
INSERT INTO `forum_reply` VALUES ('24', '3', '张三', '阿', '3', '2018-05-31');
INSERT INTO `forum_reply` VALUES ('25', '3', '张三', '阿', '4', '2018-05-31');
INSERT INTO `forum_reply` VALUES ('26', '3', '张三', '阿', '5', '2018-05-31');
INSERT INTO `forum_reply` VALUES ('27', '3', '张三', '俄罗斯', '6', '2018-05-31');
INSERT INTO `forum_reply` VALUES ('28', '3', '张三', '', '7', '2018-05-31');
INSERT INTO `forum_reply` VALUES ('29', '5', '张三', '是', '1', '2018-05-31');
INSERT INTO `forum_reply` VALUES ('30', '5', '张三', '是', '2', '2018-05-31');
INSERT INTO `forum_reply` VALUES ('31', '4', '', '阿达', '1', '2018-05-31');
INSERT INTO `forum_reply` VALUES ('32', '5', '张三', '阿萨德', '3', '2018-06-01');
INSERT INTO `forum_reply` VALUES ('33', '5', '张三', '阿萨德', '4', '2018-06-01');
INSERT INTO `forum_reply` VALUES ('34', '4', '张三', '俄罗斯', '2', '2018-06-02');
INSERT INTO `forum_reply` VALUES ('35', '6', '张三', '*', '1', '2018-06-02');
INSERT INTO `forum_reply` VALUES ('36', '4', '张三', '*', '3', '2018-06-02');
INSERT INTO `forum_reply` VALUES ('37', '4', '张三', '阿', '4', '2018-06-03');
INSERT INTO `forum_reply` VALUES ('38', '4', '张三', '阿', '5', '2018-06-03');
INSERT INTO `forum_reply` VALUES ('39', '4', '张三', '阿', '6', '2018-06-03');
INSERT INTO `forum_reply` VALUES ('40', '4', '张三', '阿', '7', '2018-06-03');
INSERT INTO `forum_reply` VALUES ('41', '4', '张三', '阿', '8', '2018-06-03');
INSERT INTO `forum_reply` VALUES ('42', '4', '张三', '阿', '9', '2018-06-03');
INSERT INTO `forum_reply` VALUES ('43', '4', '张三', '阿', '10', '2018-06-03');
INSERT INTO `forum_reply` VALUES ('44', '4', '张三', '阿', '11', '2018-06-03');
INSERT INTO `forum_reply` VALUES ('45', '4', '张三', '阿', '12', '2018-06-03');
INSERT INTO `forum_reply` VALUES ('46', '7', 'admin', '阿萨德', '1', '2018-06-04');
INSERT INTO `forum_reply` VALUES ('47', '7', 'admin', '阿萨德', '2', '2018-06-04');
INSERT INTO `forum_reply` VALUES ('48', '7', 'admin', '阿达', '3', '2018-06-04');
INSERT INTO `forum_reply` VALUES ('49', '7', 'admin', '阿萨德', '4', '2018-06-04');
INSERT INTO `forum_reply` VALUES ('50', '7', 'admin', '阿达', '5', '2018-06-04');
INSERT INTO `forum_reply` VALUES ('51', '7', 'admin', '阿达', '6', '2018-06-04');
INSERT INTO `forum_reply` VALUES ('52', '7', 'admin', '阿萨德', '7', '2018-06-04');
INSERT INTO `forum_reply` VALUES ('53', '7', '朱强', '恩', '8', '2018-06-04');
INSERT INTO `forum_reply` VALUES ('54', '8', 'admin', '去', '1', '2018-06-05');
INSERT INTO `forum_reply` VALUES ('55', '8', 'admin', '去', '2', '2018-06-05');
INSERT INTO `forum_reply` VALUES ('56', '8', 'admin', '去', '3', '2018-06-05');
INSERT INTO `forum_reply` VALUES ('57', '8', 'admin', '去', '4', '2018-06-05');
INSERT INTO `forum_reply` VALUES ('58', '5', 'admin', '啊啊啊啊啊啊啊啊', '5', '2018-06-05');
INSERT INTO `forum_reply` VALUES ('59', '9', 'admin', '1393393339', '1', '2018-06-07');
INSERT INTO `forum_reply` VALUES ('60', '9', '朱强', '33333', '2', '2019-04-29');
INSERT INTO `forum_reply` VALUES ('61', '15', 'admin', '**d* d**d*d ', '1', '2019-05-01');
INSERT INTO `forum_reply` VALUES ('62', '13', 'admin', '*d安达市多萨达萨达', '1', '2019-05-01');
INSERT INTO `forum_reply` VALUES ('63', '12', 'admin', '萨达撒奥所多**dqw**', '1', '2019-05-01');
INSERT INTO `forum_reply` VALUES ('64', '11', 'admin', '*', '1', '2019-05-01');
INSERT INTO `forum_reply` VALUES ('65', '17', '张三', 'can you give me some money?', '1', '2019-05-04');
INSERT INTO `forum_reply` VALUES ('66', '17', '张三', 'can you take me to the NewYork?', '2', '2019-05-04');
INSERT INTO `forum_reply` VALUES ('67', '9', '张三', 'sorry,I don\'t know.', '3', '2019-05-04');
INSERT INTO `forum_reply` VALUES ('68', '16', '张三', 'dfsf f', '1', '2019-05-04');
INSERT INTO `forum_reply` VALUES ('69', '16', 'admin', '*', '2', '2019-05-06');
INSERT INTO `forum_reply` VALUES ('70', '17', 'admin', 'fdfs ', '3', '2019-05-06');
INSERT INTO `forum_reply` VALUES ('71', '17', 'admin', 'dasd as', '4', '2019-05-06');
INSERT INTO `forum_reply` VALUES ('72', '17', 'admin', 'asd asd ', '5', '2019-05-06');
INSERT INTO `forum_reply` VALUES ('73', '17', 'admin', 'dsad ', '6', '2019-05-06');
INSERT INTO `forum_reply` VALUES ('74', '17', 'admin', 'sadfda', '7', '2019-05-06');
INSERT INTO `forum_reply` VALUES ('75', '17', 'admin', 'afdsaf', '8', '2019-05-06');
INSERT INTO `forum_reply` VALUES ('76', '17', 'admin', 'sfdsaf', '9', '2019-05-06');
INSERT INTO `forum_reply` VALUES ('77', '17', 'admin', 'dasdfd', '10', '2019-05-06');
INSERT INTO `forum_reply` VALUES ('78', '17', 'admin', 'sdaf', '11', '2019-05-06');
INSERT INTO `forum_reply` VALUES ('79', '17', 'admin', 'asdsfd', '12', '2019-05-06');
INSERT INTO `forum_reply` VALUES ('80', '18', 'root', '*', '1', '2019-05-06');
INSERT INTO `forum_reply` VALUES ('81', '18', 'root', '*', '2', '2019-05-06');
INSERT INTO `forum_reply` VALUES ('82', '18', 'root', 'dsfa ', '3', '2019-05-06');
INSERT INTO `forum_reply` VALUES ('83', '18', 'root', '*', '4', '2019-05-06');
INSERT INTO `forum_reply` VALUES ('84', '18', 'root', '*', '5', '2019-05-06');
INSERT INTO `forum_reply` VALUES ('85', '18', 'root', '*', '6', '2019-05-06');
INSERT INTO `forum_reply` VALUES ('86', '18', 'root', '*', '6', '2019-05-06');
INSERT INTO `forum_reply` VALUES ('87', '18', 'root', '*', '6', '2019-05-06');
INSERT INTO `forum_reply` VALUES ('88', '18', 'root', '*', '6', '2019-05-06');
INSERT INTO `forum_reply` VALUES ('89', '18', 'root', '*', '6', '2019-05-06');
INSERT INTO `forum_reply` VALUES ('90', '18', 'root', '*', '11', '2019-05-06');
INSERT INTO `forum_reply` VALUES ('91', '18', 'root', '*', '11', '2019-05-06');
INSERT INTO `forum_reply` VALUES ('92', '20', 'root', '你好', '1', '2019-05-06');
INSERT INTO `forum_reply` VALUES ('93', '20', 'root', '我', '2', '2019-05-06');
INSERT INTO `forum_reply` VALUES ('94', '20', 'root', '我', '2', '2019-05-06');
INSERT INTO `forum_reply` VALUES ('95', '20', 'root', '我撒', '2', '2019-05-06');
INSERT INTO `forum_reply` VALUES ('96', '20', 'root', '我撒', '2', '2019-05-06');
INSERT INTO `forum_reply` VALUES ('97', '20', 'root', '我撒', '2', '2019-05-06');
INSERT INTO `forum_reply` VALUES ('98', '20', 'root', '我撒', '2', '2019-05-06');
INSERT INTO `forum_reply` VALUES ('99', '20', 'root', '我', '2', '2019-05-06');
INSERT INTO `forum_reply` VALUES ('100', '20', 'root', '我', '2', '2019-05-06');
INSERT INTO `forum_reply` VALUES ('101', '20', 'root', '*', '10', '2019-05-06');
INSERT INTO `forum_reply` VALUES ('102', '20', 'root', '*', '11', '2019-05-06');
INSERT INTO `forum_reply` VALUES ('103', '20', 'root', '我今天', '12', '2019-05-06');
INSERT INTO `forum_reply` VALUES ('104', '12', 'root', '阿萨德', '2', '2019-05-06');
INSERT INTO `forum_reply` VALUES ('105', '2', 'admin', '阿达', '3', '2019-05-07');
INSERT INTO `forum_reply` VALUES ('106', '18', 'admin', 'asda ', '13', '2019-05-07');
INSERT INTO `forum_reply` VALUES ('107', '16', '张三', 'i donot know\r\n', '3', '2019-05-07');
INSERT INTO `forum_reply` VALUES ('108', '18', '张三', 'safdsafd ', '14', '2019-05-07');
INSERT INTO `forum_reply` VALUES ('109', '18', '张三', 'fsdfda ', '15', '2019-05-07');
INSERT INTO `forum_reply` VALUES ('110', '18', 'admin', 'ad ', '16', '2019-05-07');
INSERT INTO `forum_reply` VALUES ('111', '18', 'admin', '大萨达', '17', '2019-05-07');
INSERT INTO `forum_reply` VALUES ('112', '18', '2131', '*', '18', '2019-05-16');
INSERT INTO `forum_reply` VALUES ('113', '18', '2131', '*吗？？\r\n', '19', '2019-05-16');
INSERT INTO `forum_reply` VALUES ('114', '18', '2131', '*啊', '20', '2019-05-17');
INSERT INTO `forum_reply` VALUES ('115', '16', '2131', '*', '4', '2019-05-17');
INSERT INTO `forum_reply` VALUES ('116', '16', 'admin', '*吹泡泡', '5', '2019-05-17');
INSERT INTO `forum_reply` VALUES ('117', '20', 'admin', '我看到了', '13', '2019-05-18');
INSERT INTO `forum_reply` VALUES ('118', '23', 'admin', '*啊', '1', '2019-05-18');
INSERT INTO `forum_reply` VALUES ('119', '23', 'admin', '*', '2', '2019-05-18');
INSERT INTO `forum_reply` VALUES ('120', '23', '张三', '*啊', '3', '2019-05-18');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `sex` varchar(2) DEFAULT NULL,
  `email` varchar(32) DEFAULT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `role` varchar(32) DEFAULT 'student',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('23', '张三', '123', '男', '123143@31231.dsa', '13', '2016-06-06', 'student');
INSERT INTO `student` VALUES ('24', '张正光', '123', '男', '975129758@qq.com', '123', '2018-06-04', 'student');
INSERT INTO `student` VALUES ('25', '李王芳', '123', '女', '9668153555@qq.com', '123', '2019-04-30', 'student');
INSERT INTO `student` VALUES ('26', 'root', 'root', '男', '741320162@qq.com', '13696063963', '2019-04-03', 'student');
INSERT INTO `student` VALUES ('27', '二丫', '123456', '女', '123143@31231.dsa', '213213', '2019-05-08', 'student');
INSERT INTO `student` VALUES ('28', '王志冲', '123456', '男', '23121321@33.cads', '110', '2019-05-10', 'student');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `sex` varchar(2) DEFAULT NULL,
  `email` varchar(32) DEFAULT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `role` varchar(32) DEFAULT 'teacher',
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('1', '王立伟', '123', '女', '123@qq.com', '12322', '1996-03-27', 'teacher');
INSERT INTO `teacher` VALUES ('2', '朱强', '123', '男', '975129758@qq.com', '123', '2018-06-04', 'teacher');
INSERT INTO `teacher` VALUES ('3', '朱亮', '123', '男', '741320162@qq.com', '123', '2019-04-30', 'teacher');
INSERT INTO `teacher` VALUES ('4', 'zhangsan', '123', '男', '741320162@qq.com', '122335685643', '2019-05-02', 'teacher');
INSERT INTO `teacher` VALUES ('5', '张老师', '123', '男', '2131243@12321.dafdsfa', '13696063963', '2019-04-30', 'teacher');
INSERT INTO `teacher` VALUES ('6', '31231', '123', '男', '123143@31231.dsa', '2131', '2019-05-09', 'teacher');
INSERT INTO `teacher` VALUES ('7', '李老师', '123', '男', '741320162@qq.com', '13696063963', '2019-05-10', 'teacher');

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) DEFAULT NULL,
  `author` varchar(32) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `time` date DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test
-- ----------------------------
INSERT INTO `test` VALUES ('36', '英语学习试题3月 (1).docx', 'super亮', 'upload//1420775c-f733-4653-a766-77c0a54b50ad_英语学习试题3月 (1).docx', '2019-05-10', null);
INSERT INTO `test` VALUES ('37', '英语学习试题4月.docx', '王老师', 'upload//6e9f915c-a0b7-4bdd-a77d-b01eb1750cd5_英语学习试题4月.docx', '2019-05-10', null);
INSERT INTO `test` VALUES ('38', '英语学习试题5月.docx', '王老师', 'upload//0d4e4d29-5161-4d99-bf46-6f99c3ebc8f8_英语学习试题5月.docx', '2019-05-10', null);

-- ----------------------------
-- Table structure for video
-- ----------------------------
DROP TABLE IF EXISTS `video`;
CREATE TABLE `video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) DEFAULT NULL,
  `author` varchar(32) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `time` date DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of video
-- ----------------------------
INSERT INTO `video` VALUES ('42', '2one,it，that的用法区别.mp4', '王老师', 'upload//31985c0b-6af9-4ec0-bf04-a53edbe713a6_2one,it，that的用法区别.mp4', '2019-05-10', null);
INSERT INTO `video` VALUES ('48', 'Web.mp4', '王老师', 'upload//9434a049-b88c-4dbf-8ab9-003a6f0aada2_Web.mp4', '2019-05-18', null);
