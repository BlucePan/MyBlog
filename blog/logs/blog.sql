/*
Navicat MySQL Data Transfer

Source Server         : blog
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : blog

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2017-03-17 17:37:13
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
  `keyWord` varchar(255) DEFAULT NULL,
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
INSERT INTO `blog_article` VALUES ('d9cf27b549894a1baddaaa7dd0eb40cd', '测试1', '201703/20170313110547_31.png', '测试', '测试1', '2017-03-13 10:30:02', '666666', '666666', '2017-03-13 11:05:48', '1', '0', '0', '<p>测试1</p>', '0');
INSERT INTO `blog_article` VALUES ('24fe482060d54a06b9b503c5d5312c15', '测试2', '201703/20170313110536_72.png', '测试', '测试2', '2017-03-13 10:30:21', '666666', '666666', '2017-03-13 11:05:38', '2', '0', '0', '<p>测试2</p>', '0');
INSERT INTO `blog_article` VALUES ('5d178fc9e5c9443a939af8096291ad5f', '测试3', '201703/20170313110525_656.png', '测试', '测试3', '2017-03-13 10:30:41', '666666', '666666', '2017-03-13 11:05:28', '2', '200', '0', '<p>测试3<br/></p>', '1');
INSERT INTO `blog_article` VALUES ('5d178fc9e5c9443a939af8094291ad5f', '测试4', '201703/20170313110508_965.png', '测试', '测试4', '2017-03-13 10:31:01', '666666', '666666', '2017-03-15 18:03:04', '4', '300', '0', '<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 打算嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟的，</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 打算嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟的</p><p><br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;打算嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟的打算嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟的</p><p>打算嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟的打算嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟的</p><p>打算嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟的打算嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟的打算嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟的</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img src=\"http://localhost:8080/blog/ueditor/jsp/upload/image/20170315/1489572179937095638.jpg\" title=\"1489572179937095638.jpg\" alt=\"a1.jpg\"/></p>', '1');
INSERT INTO `blog_article` VALUES ('aebfb89e374b48edac4b9141908618a3', '测试上下', '201703/20170313170923_560.jpg', '测试', '测试上下', '2017-03-13 17:09:28', '666666', null, null, '2', '0', '0', '<p>测试上下</p>', '0');
INSERT INTO `blog_article` VALUES ('3d10ae5ca7d342eca57f7570b84492f6', '测试上传代码', '201703/20170315140752_621.jpg', '测试', '测试上传代码', '2017-03-15 14:09:12', '666666', null, null, '1', '0', '0', '<p style=\"text-align: left;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"font-size: 20px;\">&nbsp; 测试上传代码</span></p><p><span style=\"background-color: rgb(31, 73, 125);\"></span><br style=\"text-align: left;\"/></p><hr/><p style=\"text-align: left;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; //文章列表<br style=\"text-align: left;\"/>&nbsp;&nbsp; &nbsp;@RequestMapping(&quot;/articleList.html&quot;)<br style=\"text-align: left;\"/>&nbsp;&nbsp; &nbsp;public String articleList(HttpServletRequest request, Model model) {<br style=\"text-align: left;\"/>&nbsp;&nbsp; &nbsp;&nbsp; List&lt;BlogArticleType&gt; articleTypeList=bArticleService.getAllArticleType();//得到所有的文章类型<br style=\"text-align: left;\"/>&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp;<br style=\"text-align: left;\"/>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;PageView page = new PageView();<br style=\"text-align: left;\"/>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;page.setPageSize(15);<br style=\"text-align: left;\"/>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;page.setCurrentPage(request.getParameter(&quot;page&quot;) == null ? 1 : Integer.valueOf(request.getParameter(&quot;page&quot;)));<br style=\"text-align: left;\"/>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Map map = new HashMap();<br style=\"text-align: left;\"/>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;map.put(&quot;title&quot;, request.getParameter(&quot;title&quot;));<br style=\"text-align: left;\"/>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;map.put(&quot;type&quot;, request.getParameter(&quot;type&quot;));<br style=\"text-align: left;\"/>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;PageView pageView = bArticleService.findByPage(page, map);<br style=\"text-align: left;\"/>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;StringBuffer buffer = new StringBuffer();<br style=\"text-align: left;\"/>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;if(!BlogUtil.isEmpty(request.getParameter(&quot;title&quot;))){<br style=\"text-align: left;\"/>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;buffer.append(&quot;&amp;title=&quot;);<br style=\"text-align: left;\"/>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;buffer.append(request.getParameter(&quot;title&quot;));<br style=\"text-align: left;\"/>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;}if(!BlogUtil.isEmpty(request.getParameter(&quot;type&quot;))){<br style=\"text-align: left;\"/>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;buffer.append(&quot;&amp;type=&quot;);<br style=\"text-align: left;\"/>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;buffer.append(request.getParameter(&quot;type&quot;));<br style=\"text-align: left;\"/>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;}<br style=\"text-align: left;\"/>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;model.addAttribute(&quot;pager&quot;,pageView.getPagerStr(buffer));<br style=\"text-align: left;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; model.addAttribute(&quot;list&quot;, pageView.getItems());<br style=\"text-align: left;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; model.addAttribute(&quot;articleTypeList&quot;, articleTypeList);<br style=\"text-align: left;\"/>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;<br style=\"text-align: left;\"/>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;return &quot;background/article/articleList&quot;;<br style=\"text-align: left;\"/>&nbsp;&nbsp; &nbsp;}<br style=\"text-align: left;\"/></p>', '0');
INSERT INTO `blog_article` VALUES ('1cb4e78a4ebe461dbf2958034bb25ece', '测试5', '201703/20170315171236_25.jpg', '测试', '测试5', '2017-03-15 17:12:55', '666666', null, null, '1', '0', '0', '<p>测试5测试5测试5测试5测试5测试5测试5测试5测试5测试5测试5测试5测试5测试5测试5测试5测试5测试5测试5测试5测试5测试5测试5测试5测试5</p>', '0');

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
-- Table structure for blog_jottings
-- ----------------------------
DROP TABLE IF EXISTS `blog_jottings`;
CREATE TABLE `blog_jottings` (
  `id` varchar(225) DEFAULT NULL,
  `createUserId` varchar(255) DEFAULT NULL,
  `keyWord` varchar(255) DEFAULT NULL,
  `context` text,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_jottings
-- ----------------------------
INSERT INTO `blog_jottings` VALUES ('fa7019d038644aa3b068be68249ee9cc', '666666', '测试1', '<p>&nbsp;&nbsp;&nbsp; 测试1</p>', '2017-03-17 13:16:59', '2017-03-17 14:09:46');
INSERT INTO `blog_jottings` VALUES ('ef43cec58cf34616a203c0f9024a2475', '666666', '测试2', '<p>测试2<br/></p>', '2017-03-17 14:10:07', '2017-03-17 14:10:07');
INSERT INTO `blog_jottings` VALUES ('25a670c967de4256828df7acb8da388f', '666666', '测试3', '<p>测试3</p>', '2017-03-17 15:43:33', '2017-03-17 15:43:33');
INSERT INTO `blog_jottings` VALUES ('85b3a989519141aabcee6d6643e65e6f', '666666', '测试4', '<p>测试4</p>', '2017-03-17 15:43:41', '2017-03-17 15:43:41');
INSERT INTO `blog_jottings` VALUES ('91c1cdc084624c049c961ca5e8461c87', '666666', '测试5', '<p>测试5</p>', '2017-03-17 15:43:51', '2017-03-17 15:43:51');
INSERT INTO `blog_jottings` VALUES ('117c812a2fad410197294e07a42a5a5d', '666666', '测试6', '<p>测试6</p>', '2017-03-17 15:43:59', '2017-03-17 15:43:59');
INSERT INTO `blog_jottings` VALUES ('4cbba36dfd4648d4880786fca75b0d65', '666666', '测试7', '<p>测试7</p>', '2017-03-17 15:44:06', '2017-03-17 15:44:06');
INSERT INTO `blog_jottings` VALUES ('ccd3165eef6042d59cc2a70c03f880ae', '666666', '测试8', '<p>测试8</p>', '2017-03-17 15:44:14', '2017-03-17 15:44:14');
INSERT INTO `blog_jottings` VALUES ('bd9965b317bc444c943fa0cdffbed966', '666666', '测试9', '<p>测试9</p>', '2017-03-17 15:44:24', '2017-03-17 15:44:24');
INSERT INTO `blog_jottings` VALUES ('aba902acd5e94185a5f030daec5a4716', '666666', '测试10', '<p>测试10</p>', '2017-03-17 15:44:34', '2017-03-17 15:44:34');

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
INSERT INTO `blog_menu` VALUES ('486d855f130345b4a3b59042bb8f1749', 'sys_user_flgl', '博客管理', '201610/20161019133037_885.png', '/article/manage/articleList.html', '2', '40b9cc507bfe44b081a68b544095602b', '5', '2016-10-19 13:30:52', '666666', '2017-03-09 14:15:25', '666666', '1', 'yes', '文章分类等相关操作');
INSERT INTO `blog_menu` VALUES ('b202615d0b1e4140955cea7132727f57', 'sas', '大三大四的', '', '', '2', '1b50392b3efa4fc08fd770b31ee4f4c9', '6', '2016-10-21 10:52:01', '666666', null, '666666', '1', 'yes', '');
INSERT INTO `blog_menu` VALUES ('4e02403ba3dd40ed9797a7bfd93db605', 'sys_user_xtsb', '闲谈随笔', '201703/20170317111115_844.jpg', '/jottings/manage/jottingsList.html', '2', '40b9cc507bfe44b081a68b544095602b', '7', '2017-03-17 11:11:42', '666666', '2017-03-17 11:12:16', '666666', '1', 'yes', '闲谈随笔');

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
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('666666', 'root', '123456', '小盘子', '1548498126', 'Java工程师', null, '2017-03-10 10:05:34');
INSERT INTO `user` VALUES ('555555', 'abc', null, '小花', null, null, '2017-03-10 09:55:59', '2017-03-10 09:55:59');
INSERT INTO `user` VALUES ('444444', 'bcd', null, '小梅', null, null, '2017-03-10 09:56:43', '2017-03-10 09:56:43');
