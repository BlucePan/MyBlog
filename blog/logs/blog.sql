/*
Navicat MySQL Data Transfer

Source Server         : blog
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : blog

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2016-10-21 17:36:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for blog_article
-- ----------------------------
DROP TABLE IF EXISTS `blog_article`;
CREATE TABLE `blog_article` (
  `id` varchar(225) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `remake` varchar(500) DEFAULT NULL COMMENT '摘要',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `createUserId` varchar(50) DEFAULT NULL COMMENT '创建者',
  `updateUserId` varchar(50) DEFAULT NULL COMMENT '更新人',
  `updateTime` datetime DEFAULT NULL COMMENT '更新时间',
  `type` int(50) DEFAULT NULL COMMENT '文章所属类型',
  `browse` int(50) DEFAULT NULL COMMENT '浏览量',
  `popularity` int(50) DEFAULT NULL COMMENT '人气',
  `context` text COMMENT '文章内容',
  `top` int(50) DEFAULT NULL COMMENT '置顶'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_article
-- ----------------------------
INSERT INTO `blog_article` VALUES ('593d4ba12a264b2c808768c96a0ed844', '测试数据', '201610/20161021104946_634.png', '的撒打算打算的范德萨大苏打', '2016-10-21 10:50:06', '666666', '666666', '2016-10-21 15:03:14', '1', '0', '0', null, '1');
INSERT INTO `blog_article` VALUES ('6d54cbb02b234f94b26b6fedb2764c1a', '我的日记', '201610/20161021135921_497.jpg', '我的日记呀啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊', '2016-10-21 13:52:50', '666666', '666666', '2016-10-21 15:03:08', '2', '0', '0', '<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;我的日记</p><p><br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;啊打算生生世世生生世世生生世世生生世世生生世世生生世世生生世世生生世世上</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src=\"http://localhost:8080/blog/ueditor/jsp/upload/image/20161021/1477029168674071318.jpg\" title=\"1477029168674071318.jpg\" alt=\"05.jpg\"/></p>', '0');
INSERT INTO `blog_article` VALUES ('1af0ff9270b04aff969e2f9a40e2ddbe', 'dadadda', '201610/20161021140730_589.png', 'dasdads', '2016-10-21 14:07:34', '666666', '666666', '2016-10-21 15:03:09', '1', null, null, '<p>dadasdsa<br/></p>', '0');

-- ----------------------------
-- Table structure for blog_article_type
-- ----------------------------
DROP TABLE IF EXISTS `blog_article_type`;
CREATE TABLE `blog_article_type` (
  `id` int(8) DEFAULT NULL,
  `articleName` varchar(255) DEFAULT NULL COMMENT '文章名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_article_type
-- ----------------------------
INSERT INTO `blog_article_type` VALUES ('1', '网站建设');
INSERT INTO `blog_article_type` VALUES ('2', '心得笔记');
INSERT INTO `blog_article_type` VALUES ('3', '程序人生');
INSERT INTO `blog_article_type` VALUES ('4', 'web前端');

-- ----------------------------
-- Table structure for blog_menu
-- ----------------------------
DROP TABLE IF EXISTS `blog_menu`;
CREATE TABLE `blog_menu` (
  `id` varchar(225) DEFAULT NULL,
  `resKey` varchar(255) DEFAULT NULL COMMENT 'key值',
  `menuName` varchar(255) DEFAULT NULL COMMENT '菜单名称',
  `imgUrl` varchar(255) DEFAULT NULL COMMENT '图片路径',
  `url` varchar(255) DEFAULT NULL COMMENT '后台访问路径',
  `menuType` varchar(255) DEFAULT NULL COMMENT '菜单类型（1.目录2.菜单3.按钮）',
  `superior` varchar(255) DEFAULT NULL COMMENT '上级id，没有默认为1',
  `priority` varchar(255) DEFAULT NULL COMMENT '优先级，菜单排序',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `createUserId` varchar(225) DEFAULT NULL COMMENT '创建人id',
  `updateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `updateUserId` varchar(225) DEFAULT NULL COMMENT '修改人id',
  `flag` varchar(255) DEFAULT NULL COMMENT '菜单是否启用(1yes2no)',
  `isCommon` varchar(255) DEFAULT NULL COMMENT '是否是公用菜单(1yes2no)',
  `remake` varchar(255) DEFAULT NULL COMMENT '菜单详情'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_menu
-- ----------------------------
INSERT INTO `blog_menu` VALUES ('1b50392b3efa4fc08fd770b31ee4f4c9', 'sys_user_xtgl', '系统管理', null, null, '1', '1', '1', '2016-10-17 13:39:34', '666666', '2016-10-17 13:39:45', '666666', '1', 'yes', '系统管理，是管理整个项目的架构，风格极其他操作');
INSERT INTO `blog_menu` VALUES ('1b50392b3efa4fc08fd770b31ee4f4c3', 'sys_user_cdgl', '菜单管理', '201610/20161019132253_570.png', '/menu/menuList.html', '2', '1b50392b3efa4fc08fd770b31ee4f4c9', '2', '2016-10-17 13:42:16', '666666', '2016-10-19 13:22:55', '666666', '1', 'yes', '菜单管理，添加系统菜单');
INSERT INTO `blog_menu` VALUES ('1b50392b3efa4fc08fd770b31ee4f4c8', 'sys_user_lbgl', '轮播图管理', null, '/main/imgList.html', '2', '1b50392b3efa4fc08fd770b31ee4f4c9', '3', '2016-10-17 13:44:20', '666666', '2016-10-17 13:44:25', '666666', '1', 'yes', '管理前台展示的轮播图效果图片');
INSERT INTO `blog_menu` VALUES ('40b9cc507bfe44b081a68b544095602b', 'sys_user_wzgl', '文章管理', '', '', '1', '1', '4', '2016-10-18 11:02:24', '666666', null, null, '1', 'yes', '文章管理可以的');
INSERT INTO `blog_menu` VALUES ('486d855f130345b4a3b59042bb8f1749', 'sys_user_flgl', '博客管理', '201610/20161019133037_885.png', '/article/articleList.html', '2', '40b9cc507bfe44b081a68b544095602b', '5', '2016-10-19 13:30:52', '666666', '2016-10-20 18:36:49', '666666', '1', 'yes', '文章分类等相关操作');
INSERT INTO `blog_menu` VALUES ('b202615d0b1e4140955cea7132727f57', 'sas', '大三大四的', '', '', '2', '1b50392b3efa4fc08fd770b31ee4f4c9', '6', '2016-10-21 10:52:01', '666666', null, '666666', '1', 'yes', '');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` varchar(50) NOT NULL,
  `account` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `qq` varchar(50) DEFAULT NULL,
  `job` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('666666', 'root', '123456', '盘子', '1548498126', 'Java工程师');
