/*
Navicat MySQL Data Transfer

Source Server         : blog
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : blog

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2017-03-24 16:42:29
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
INSERT INTO `blog_article` VALUES ('5d178fc9e5c9443a939af8094291ad5f', '测试4', '201703/20170313110508_965.png', '测试', '测试4', '2017-03-13 10:31:01', '666666', '666666', '2017-03-22 09:54:58', '4', '300', '0', '<p><img src=\"/upload/image/20170322/1490147468946006950.jpg\" title=\"1490147468946006950.jpg\" alt=\"06.jpg\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 打算嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟的，</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 打算嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟的</p><p><br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;打算嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟的打算嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟的</p><p>打算嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟的打算嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟的</p><p>打算嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟的打算嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟的打算嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟嘟的</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<img src=\"http://localhost:8080/blog/ueditor/jsp/upload/image/20170321/1490078753873097770.jpg\" title=\"1490078753873097770.jpg\" alt=\"01.jpg\"/>&nbsp; <img src=\"http://localhost:8080/imageService/uploadBaiduFiles/upload/image/20170322/1490147696462004526.jpg\" title=\"1490147696462004526.jpg\" alt=\"06.jpg\"/></p>', '1');
INSERT INTO `blog_article` VALUES ('aebfb89e374b48edac4b9141908618a3', '测试上下', '201703/20170313170923_560.jpg', '测试', '测试上下', '2017-03-13 17:09:28', '666666', null, null, '2', '0', '0', '<p>测试上下</p>', '0');
INSERT INTO `blog_article` VALUES ('3d10ae5ca7d342eca57f7570b84492f6', '测试上传代码', '201703/20170315140752_621.jpg', '测试', '测试上传代码', '2017-03-15 14:09:12', '666666', null, null, '1', '0', '0', '<p style=\"text-align: left;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"font-size: 20px;\">&nbsp; 测试上传代码</span></p><p><span style=\"background-color: rgb(31, 73, 125);\"></span><br style=\"text-align: left;\"/></p><hr/><p style=\"text-align: left;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; //文章列表<br style=\"text-align: left;\"/>&nbsp;&nbsp; &nbsp;@RequestMapping(&quot;/articleList.html&quot;)<br style=\"text-align: left;\"/>&nbsp;&nbsp; &nbsp;public String articleList(HttpServletRequest request, Model model) {<br style=\"text-align: left;\"/>&nbsp;&nbsp; &nbsp;&nbsp; List&lt;BlogArticleType&gt; articleTypeList=bArticleService.getAllArticleType();//得到所有的文章类型<br style=\"text-align: left;\"/>&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp;<br style=\"text-align: left;\"/>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;PageView page = new PageView();<br style=\"text-align: left;\"/>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;page.setPageSize(15);<br style=\"text-align: left;\"/>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;page.setCurrentPage(request.getParameter(&quot;page&quot;) == null ? 1 : Integer.valueOf(request.getParameter(&quot;page&quot;)));<br style=\"text-align: left;\"/>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Map map = new HashMap();<br style=\"text-align: left;\"/>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;map.put(&quot;title&quot;, request.getParameter(&quot;title&quot;));<br style=\"text-align: left;\"/>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;map.put(&quot;type&quot;, request.getParameter(&quot;type&quot;));<br style=\"text-align: left;\"/>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;PageView pageView = bArticleService.findByPage(page, map);<br style=\"text-align: left;\"/>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;StringBuffer buffer = new StringBuffer();<br style=\"text-align: left;\"/>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;if(!BlogUtil.isEmpty(request.getParameter(&quot;title&quot;))){<br style=\"text-align: left;\"/>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;buffer.append(&quot;&amp;title=&quot;);<br style=\"text-align: left;\"/>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;buffer.append(request.getParameter(&quot;title&quot;));<br style=\"text-align: left;\"/>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;}if(!BlogUtil.isEmpty(request.getParameter(&quot;type&quot;))){<br style=\"text-align: left;\"/>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;buffer.append(&quot;&amp;type=&quot;);<br style=\"text-align: left;\"/>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;buffer.append(request.getParameter(&quot;type&quot;));<br style=\"text-align: left;\"/>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;}<br style=\"text-align: left;\"/>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;model.addAttribute(&quot;pager&quot;,pageView.getPagerStr(buffer));<br style=\"text-align: left;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; model.addAttribute(&quot;list&quot;, pageView.getItems());<br style=\"text-align: left;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; model.addAttribute(&quot;articleTypeList&quot;, articleTypeList);<br style=\"text-align: left;\"/>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;<br style=\"text-align: left;\"/>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;return &quot;background/article/articleList&quot;;<br style=\"text-align: left;\"/>&nbsp;&nbsp; &nbsp;}<br style=\"text-align: left;\"/></p>', '0');
INSERT INTO `blog_article` VALUES ('1cb4e78a4ebe461dbf2958034bb25ece', '测试5', '201703/20170315171236_25.jpg', '测试', '测试5', '2017-03-15 17:12:55', '666666', '666666', '2017-03-21 13:39:28', '1', '0', '0', '<p># 欢迎使用 Cmd Markdown 编辑阅读器</p><p><br/></p><p>------</p><p><br/></p><p>我们理解您需要更便捷更高效的工具记录思想，整理笔记、知识，并将其中承载的价值传播给他人，**Cmd Markdown** 是我们给出的答案 —— 我们为记录思想和分享知识提供更专业的工具。 您可以使用 Cmd Markdown：</p><p><br/></p><p>&gt; * 整理知识，学习笔记</p><p>&gt; * 发布日记，杂文，所见所想</p><p>&gt; * 撰写发布技术文稿（代码支持）</p><p>&gt; * 撰写发布学术论文（LaTeX 公式支持）</p><p><br/></p><p>![cmd-markdown-logo](https://www.zybuluo.com/static/img/logo.png)</p><p><br/></p><p>除了您现在看到的这个 Cmd Markdown 在线版本，您还可以前往以下网址下载：</p><p><br/></p><p>### [Windows/Mac/Linux 全平台客户端](https://www.zybuluo.com/cmd/)</p><p><br/></p><p>&gt; 请保留此份 Cmd Markdown 的欢迎稿兼使用说明，如需撰写新稿件，点击顶部工具栏右侧的 &lt;i class=&quot;icon-file&quot;&gt;&lt;/i&gt; **新文稿** 或者使用快捷键 `Ctrl+Alt+N`。</p><p><br/></p><p>------</p><p><br/></p><p>## 什么是 Markdown</p><p><br/></p><p>Markdown 是一种方便记忆、书写的纯文本标记语言，用户可以使用这些标记符号以最小的输入代价生成极富表现力的文档：譬如您正在阅读的这份文档。它使用简单的符号标记不同的标题，分割不同的段落，**粗体** 或者 *斜体* 某些文字，更棒的是，它还可以</p><p><br/></p><p>### 1. 制作一份待办事宜 [Todo 列表](https://www.zybuluo.com/mdeditor?url=https://www.zybuluo.com/static/editor/md-help.markdown#13-待办事宜-todo-列表)</p><p><br/></p><p>- [ ] 支持以 PDF 格式导出文稿</p><p>- [ ] 改进 Cmd 渲染算法，使用局部渲染技术提高渲染效率</p><p>- [x] 新增 Todo 列表功能</p><p>- [x] 修复 LaTex 公式渲染问题</p><p>- [x] 新增 LaTex 公式编号功能</p><p><br/></p><p>### 2. 书写一个质能守恒公式[^LaTeX]</p><p><br/></p><p>$$E=mc^2$$</p><p><br/></p><p>### 3. 高亮一段代码[^code]</p><p><br/></p><p>```python</p><p>@requires_authorization</p><p>class SomeClass:</p><p>&nbsp; &nbsp; pass</p><p><br/></p><p>if __name__ == &#39;__main__&#39;:</p><p>&nbsp; &nbsp; # A comment</p><p>&nbsp; &nbsp; print &#39;hello world&#39;</p><p>```</p><p><br/></p><p>### 4. 高效绘制 [流程图](https://www.zybuluo.com/mdeditor?url=https://www.zybuluo.com/static/editor/md-help.markdown#7-流程图)</p><p><br/></p><p>```flow</p><p>st=&gt;start: Start</p><p>op=&gt;operation: Your Operation</p><p>cond=&gt;condition: Yes or No?</p><p>e=&gt;end</p><p><br/></p><p>st-&gt;op-&gt;cond</p><p>cond(yes)-&gt;e</p><p>cond(no)-&gt;op</p><p>```</p><p><br/></p><p>### 5. 高效绘制 [序列图](https://www.zybuluo.com/mdeditor?url=https://www.zybuluo.com/static/editor/md-help.markdown#8-序列图)</p><p><br/></p><p>```seq</p><p>Alice-&gt;Bob: Hello Bob, how are you?</p><p>Note right of Bob: Bob thinks</p><p>Bob--&gt;Alice: I am good thanks!</p><p>```</p><p><br/></p><p>### 6. 高效绘制 [甘特图](https://www.zybuluo.com/mdeditor?url=https://www.zybuluo.com/static/editor/md-help.markdown#9-甘特图)</p><p><br/></p><p>```gantt</p><p>&nbsp; &nbsp; title 项目开发流程</p><p>&nbsp; &nbsp; section 项目确定</p><p>&nbsp; &nbsp; &nbsp; &nbsp; 需求分析 &nbsp; &nbsp; &nbsp; :a1, 2016-06-22, 3d</p><p>&nbsp; &nbsp; &nbsp; &nbsp; 可行性报告 &nbsp; &nbsp; :after a1, 5d</p><p>&nbsp; &nbsp; &nbsp; &nbsp; 概念验证 &nbsp; &nbsp; &nbsp; : 5d</p><p>&nbsp; &nbsp; section 项目实施</p><p>&nbsp; &nbsp; &nbsp; &nbsp; 概要设计 &nbsp; &nbsp; &nbsp;:2016-07-05 &nbsp;, 5d</p><p>&nbsp; &nbsp; &nbsp; &nbsp; 详细设计 &nbsp; &nbsp; &nbsp;:2016-07-08, 10d</p><p>&nbsp; &nbsp; &nbsp; &nbsp; 编码 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;:2016-07-15, 10d</p><p>&nbsp; &nbsp; &nbsp; &nbsp; 测试 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;:2016-07-22, 5d</p><p>&nbsp; &nbsp; section 发布验收</p><p>&nbsp; &nbsp; &nbsp; &nbsp; 发布: 2d</p><p>&nbsp; &nbsp; &nbsp; &nbsp; 验收: 3d</p><p>```</p><p><br/></p><p>### 7. 绘制表格</p><p><br/></p><p>| 项目 &nbsp; &nbsp; &nbsp; &nbsp;| 价格 &nbsp; | &nbsp;数量 &nbsp;|</p><p>| -------- &nbsp; | -----: &nbsp;| :----: &nbsp;|</p><p>| 计算机 &nbsp; &nbsp; | \\$1600 | &nbsp; 5 &nbsp; &nbsp; |</p><p>| 手机 &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp; \\$12 &nbsp; | &nbsp; 12 &nbsp; |</p><p>| 管线 &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp; &nbsp;\\$1 &nbsp; &nbsp;| &nbsp;234 &nbsp;|</p><p><br/></p><p>### 8. 更详细语法说明</p><p><br/></p><p>想要查看更详细的语法说明，可以参考我们准备的 [Cmd Markdown 简明语法手册][1]，进阶用户可以参考 [Cmd Markdown 高阶语法手册][2] 了解更多高级功能。</p><p><br/></p><p>总而言之，不同于其它 *所见即所得* 的编辑器：你只需使用键盘专注于书写文本内容，就可以生成印刷级的排版格式，省却在键盘和工具栏之间来回切换，调整内容和格式的麻烦。**Markdown 在流畅的书写和印刷级的阅读体验之间找到了平衡。** 目前它已经成为世界上最大的技术分享网站 GitHub 和 技术问答网站 StackOverFlow 的御用书写格式。</p><p><br/></p><p>---</p><p><br/></p><p>## 什么是 Cmd Markdown</p><p><br/></p><p>您可以使用很多工具书写 Markdown，但是 Cmd Markdown 是这个星球上我们已知的、最好的 Markdown 工具——没有之一 ：）因为深信文字的力量，所以我们和你一样，对流畅书写，分享思想和知识，以及阅读体验有极致的追求，我们把对于这些诉求的回应整合在 Cmd Markdown，并且一次，两次，三次，乃至无数次地提升这个工具的体验，最终将它演化成一个 **编辑/发布/阅读** Markdown 的在线平台——您可以在任何地方，任何系统/设备上管理这里的文字。</p><p><br/></p><p>### 1. 实时同步预览</p><p><br/></p><p>我们将 Cmd Markdown 的主界面一分为二，左边为**编辑区**，右边为**预览区**，在编辑区的操作会实时地渲染到预览区方便查看最终的版面效果，并且如果你在其中一个区拖动滚动条，我们有一个巧妙的算法把另一个区的滚动条同步到等价的位置，超酷！</p><p><br/></p><p>### 2. 编辑工具栏</p><p><br/></p><p>也许您还是一个 Markdown 语法的新手，在您完全熟悉它之前，我们在 **编辑区** 的顶部放置了一个如下图所示的工具栏，您可以使用鼠标在工具栏上调整格式，不过我们仍旧鼓励你使用键盘标记格式，提高书写的流畅度。</p><p><br/></p><p>![tool-editor](https://www.zybuluo.com/static/img/toolbar-editor.png)</p><p><br/></p><p>### 3. 编辑模式</p><p><br/></p><p>完全心无旁骛的方式编辑文字：点击 **编辑工具栏** 最右侧的拉伸按钮或者按下 `Ctrl + M`，将 Cmd Markdown 切换到独立的编辑模式，这是一个极度简洁的写作环境，所有可能会引起分心的元素都已经被挪除，超清爽！</p><p><br/></p><p>### 4. 实时的云端文稿</p><p><br/></p><p>为了保障数据安全，Cmd Markdown 会将您每一次击键的内容保存至云端，同时在 **编辑工具栏** 的最右侧提示 `已保存` 的字样。无需担心浏览器崩溃，机器掉电或者地震，海啸——在编辑的过程中随时关闭浏览器或者机器，下一次回到 Cmd Markdown 的时候继续写作。</p><p><br/></p><p>### 5. 离线模式</p><p><br/></p><p>在网络环境不稳定的情况下记录文字一样很安全！在您写作的时候，如果电脑突然失去网络连接，Cmd Markdown 会智能切换至离线模式，将您后续键入的文字保存在本地，直到网络恢复再将他们传送至云端，即使在网络恢复前关闭浏览器或者电脑，一样没有问题，等到下次开启 Cmd Markdown 的时候，她会提醒您将离线保存的文字传送至云端。简而言之，我们尽最大的努力保障您文字的安全。</p><p><br/></p><p>### 6. 管理工具栏</p><p><br/></p><p>为了便于管理您的文稿，在 **预览区** 的顶部放置了如下所示的 **管理工具栏**：</p><p><br/></p><p>![tool-manager](https://www.zybuluo.com/static/img/toolbar-manager.jpg)</p><p><br/></p><p>通过管理工具栏可以：</p><p><br/></p><p>&lt;i class=&quot;icon-share&quot;&gt;&lt;/i&gt; 发布：将当前的文稿生成固定链接，在网络上发布，分享</p><p>&lt;i class=&quot;icon-file&quot;&gt;&lt;/i&gt; 新建：开始撰写一篇新的文稿</p><p>&lt;i class=&quot;icon-trash&quot;&gt;&lt;/i&gt; 删除：删除当前的文稿</p><p>&lt;i class=&quot;icon-cloud&quot;&gt;&lt;/i&gt; 导出：将当前的文稿转化为 Markdown 文本或者 Html 格式，并导出到本地</p><p>&lt;i class=&quot;icon-reorder&quot;&gt;&lt;/i&gt; 列表：所有新增和过往的文稿都可以在这里查看、操作</p><p>&lt;i class=&quot;icon-pencil&quot;&gt;&lt;/i&gt; 模式：切换 普通/Vim/Emacs 编辑模式</p><p><br/></p><p>### 7. 阅读工具栏</p><p><br/></p><p>![tool-manager](https://www.zybuluo.com/static/img/toolbar-reader.jpg)</p><p><br/></p><p>通过 **预览区** 右上角的 **阅读工具栏**，可以查看当前文稿的目录并增强阅读体验。</p><p><br/></p><p>工具栏上的五个图标依次为：</p><p><br/></p><p>&lt;i class=&quot;icon-list&quot;&gt;&lt;/i&gt; 目录：快速导航当前文稿的目录结构以跳转到感兴趣的段落</p><p>&lt;i class=&quot;icon-chevron-sign-left&quot;&gt;&lt;/i&gt; 视图：互换左边编辑区和右边预览区的位置</p><p>&lt;i class=&quot;icon-adjust&quot;&gt;&lt;/i&gt; 主题：内置了黑白两种模式的主题，试试 **黑色主题**，超炫！</p><p>&lt;i class=&quot;icon-desktop&quot;&gt;&lt;/i&gt; 阅读：心无旁骛的阅读模式提供超一流的阅读体验</p><p>&lt;i class=&quot;icon-fullscreen&quot;&gt;&lt;/i&gt; 全屏：简洁，简洁，再简洁，一个完全沉浸式的写作和阅读环境</p><p><br/></p><p>### 8. 阅读模式</p><p><br/></p><p>在 **阅读工具栏** 点击 &lt;i class=&quot;icon-desktop&quot;&gt;&lt;/i&gt; 或者按下 `Ctrl+Alt+M` 随即进入独立的阅读模式界面，我们在版面渲染上的每一个细节：字体，字号，行间距，前背景色都倾注了大量的时间，努力提升阅读的体验和品质。</p><p><br/></p><p>### 9. 标签、分类和搜索</p><p><br/></p><p>在编辑区任意行首位置输入以下格式的文字可以标签当前文档：</p><p><br/></p><p>标签： 未分类</p><p><br/></p><p>标签以后的文稿在【文件列表】（Ctrl+Alt+F）里会按照标签分类，用户可以同时使用键盘或者鼠标浏览查看，或者在【文件列表】的搜索文本框内搜索标题关键字过滤文稿，如下图所示：</p><p><br/></p><p>![file-list](https://www.zybuluo.com/static/img/file-list.png)</p><p><br/></p><p>### 10. 文稿发布和分享</p><p><br/></p><p>在您使用 Cmd Markdown 记录，创作，整理，阅读文稿的同时，我们不仅希望它是一个有力的工具，更希望您的思想和知识通过这个平台，连同优质的阅读体验，将他们分享给有相同志趣的人，进而鼓励更多的人来到这里记录分享他们的思想和知识，尝试点击 &lt;i class=&quot;icon-share&quot;&gt;&lt;/i&gt; (Ctrl+Alt+P) 发布这份文档给好友吧！</p><p><br/></p><p>------</p><p><br/></p><p>再一次感谢您花费时间阅读这份欢迎稿，点击 &lt;i class=&quot;icon-file&quot;&gt;&lt;/i&gt; (Ctrl+Alt+N) 开始撰写新的文稿吧！祝您在这里记录、阅读、分享愉快！</p><p><br/></p><p>作者 [@ghosert][3] &nbsp; &nbsp;&nbsp;</p><p>2016 年 07月 07日 &nbsp; &nbsp;</p><p><br/></p><p>[^LaTeX]: 支持 **LaTeX** 编辑显示支持，例如：$\\sum_{i=1}^n a_i=0$， 访问 [MathJax][4] 参考更多使用方法。</p><p><br/></p><p>[^code]: 代码高亮功能支持包括 Java, Python, JavaScript 在内的，**四十一**种主流编程语言。</p><p><br/></p><p>[1]: https://www.zybuluo.com/mdeditor?url=https://www.zybuluo.com/static/editor/md-help.markdown</p><p>[2]: https://www.zybuluo.com/mdeditor?url=https://www.zybuluo.com/static/editor/md-help.markdown#cmd-markdown-高阶语法手册</p><p>[3]: http://weibo.com/ghosert</p><p>[4]: http://meta.math.stackexchange.com/questions/5020/mathjax-basic-tutorial-and-quick-reference</p><p><br/></p>', '0');

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
INSERT INTO `blog_jottings` VALUES ('bd9965b317bc444c943fa0cdffbed966', '666666', '测试9', '<p><video class=\"edui-upload-video  vjs-default-skin video-js\" controls=\"\" preload=\"none\" width=\"420\" height=\"280\" src=\"/upload/video/20170322/1490148003550092879.mp4\" data-setup=\"{}\"><source src=\"/upload/video/20170322/1490148003550092879.mp4\" type=\"video/mp4\"/></video></p>', '2017-03-17 15:44:24', '2017-03-22 10:00:22');
INSERT INTO `blog_jottings` VALUES ('aba902acd5e94185a5f030daec5a4716', '666666', '测试10', '<p><embed type=\"application/x-shockwave-flash\" class=\"edui-faked-music\" pluginspage=\"http://www.macromedia.com/go/getflashplayer\" src=\"http://box.baidu.com/widget/flash/bdspacesong.swf?from=tiebasongwidget&url=&name=%E6%88%90%E9%83%BD&artist=%E8%B5%B5%E9%9B%B7&extra=&autoPlay=false&loop=true\" width=\"400\" height=\"95\" align=\"none\" wmode=\"transparent\" play=\"true\" loop=\"false\" menu=\"false\" allowscriptaccess=\"never\" allowfullscreen=\"true\"/></p>', '2017-03-17 15:44:34', '2017-03-24 13:43:28');

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
INSERT INTO `blog_menu` VALUES ('b202615d0b1e4140955cea7132727f57', 'sys_user_yhgl', '用户管理', '', '', '2', '1b50392b3efa4fc08fd770b31ee4f4c9', '6', '2016-10-21 10:52:01', '666666', '2017-03-22 10:14:12', '666666', '1', 'yes', '');
INSERT INTO `blog_menu` VALUES ('4e02403ba3dd40ed9797a7bfd93db605', 'sys_user_xtsb', '闲谈随笔', '201703/20170317111115_844.jpg', '/jottings/manage/jottingsList.html', '2', '40b9cc507bfe44b081a68b544095602b', '7', '2017-03-17 11:11:42', '666666', '2017-03-17 11:12:16', '666666', '1', 'yes', '闲谈随笔');
INSERT INTO `blog_menu` VALUES ('bd82bd1f2b2f4afd809e13c1270ca8d2', 'sys_user_ypgl', '音频管理', '', '', '1', '1', '8', '2017-03-21 16:10:24', '666666', '2017-03-22 10:12:08', '666666', '1', 'yes', '音频管理');
INSERT INTO `blog_menu` VALUES ('1d5f0f415c3b4854929c6d03cebf672b', 'sys_user_spgl', '视频管理', '', '/voice/manage/videoList.html', '2', 'bd82bd1f2b2f4afd809e13c1270ca8d2', '9', '2017-03-22 10:09:59', '666666', '2017-03-22 14:23:01', '666666', '1', 'yes', '视频管理');
INSERT INTO `blog_menu` VALUES ('e6224c7cd0dd40ebb5b7a3f3883b90a9', 'sys_user_yygl', '音乐管理', '', '', '2', 'bd82bd1f2b2f4afd809e13c1270ca8d2', '10', '2017-03-22 10:10:44', '666666', null, '666666', '1', 'yes', '音乐管理');

-- ----------------------------
-- Table structure for blog_music
-- ----------------------------
DROP TABLE IF EXISTS `blog_music`;
CREATE TABLE `blog_music` (
  `id` varchar(225) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `musicUrl` varchar(255) DEFAULT NULL,
  `createUserId` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `isPublish` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_music
-- ----------------------------

-- ----------------------------
-- Table structure for blog_video
-- ----------------------------
DROP TABLE IF EXISTS `blog_video`;
CREATE TABLE `blog_video` (
  `id` varchar(225) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `videoUrl` text,
  `createUserId` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `ispublish` varchar(255) DEFAULT NULL,
  `keyWord` varchar(255) DEFAULT NULL,
  `browse` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_video
-- ----------------------------
INSERT INTO `blog_video` VALUES ('0a2875f855b146f5a42c751262437b2d', '测试视频1', '201703/20170322152857_939.jpg', '<p><video class=\"edui-upload-video  vjs-default-skin video-js\" controls=\"\" preload=\"none\" width=\"420\" height=\"280\" src=\"/upload/video/20170323/1490253909414042832.mp4\" data-setup=\"{}\"><source src=\"/upload/video/20170323/1490253909414042832.mp4\" type=\"video/mp4\"/></video></p>', '666666', '2017-03-22 15:09:41', '2017-03-23 15:25:14', '1', '测试', '0');
INSERT INTO `blog_video` VALUES ('668c7ce290dd49bba4b2950efda4b58f', '测试视频2', '201703/20170322151258_279.jpg', '<p><video class=\"edui-upload-video  vjs-default-skin video-js\" controls=\"\" preload=\"none\" width=\"420\" height=\"280\" src=\"/upload/video/20170323/1490253909414042832.mp4\" data-setup=\"{}\"><source src=\"/upload/video/20170323/1490253909414042832.mp4\" type=\"video/mp4\"/></video></p>', '666666', '2017-03-22 15:13:13', '2017-03-23 15:14:32', '1', '测试', '0');
INSERT INTO `blog_video` VALUES ('e6f26dae818344d4910b951aeb386a21', '测试视频3', '201703/20170323091911_953.jpg', '<p><video class=\"edui-upload-video  vjs-default-skin video-js\" controls=\"\" preload=\"none\" width=\"420\" height=\"280\" src=\"/upload/video/20170323/1490253909414042832.mp4\" data-setup=\"{}\"><source src=\"/upload/video/20170323/1490253909414042832.mp4\" type=\"video/mp4\"/></video></p>', '666666', '2017-03-23 09:19:14', '2017-03-23 13:14:15', '1', '测试', '0');
INSERT INTO `blog_video` VALUES ('afad3e54ecc3479d82f0c641293ce3a1', '测试视频4', '201703/20170323091922_873.jpg', '<p><video class=\"edui-upload-video  vjs-default-skin video-js\" controls=\"\" preload=\"none\" width=\"420\" height=\"280\" src=\"/upload/video/20170323/1490253909414042832.mp4\" data-setup=\"{}\"><source src=\"/upload/video/20170323/1490253909414042832.mp4\" type=\"video/mp4\"/></video></p>', '666666', '2017-03-23 09:19:26', '2017-03-23 09:19:26', '1', '测试', '0');
INSERT INTO `blog_video` VALUES ('9f783596629c4d37bdf4960e54576c86', '测试视频5', '201703/20170323091957_849.jpg', '<p><video class=\"edui-upload-video  vjs-default-skin video-js\" controls=\"\" preload=\"none\" width=\"420\" height=\"280\" src=\"/upload/video/20170323/1490253909414042832.mp4\" data-setup=\"{}\"><source src=\"/upload/video/20170323/1490253909414042832.mp4\" type=\"video/mp4\"/></video></p>', '666666', '2017-03-23 09:20:00', '2017-03-23 15:14:43', '1', '测试', '0');
INSERT INTO `blog_video` VALUES ('4d51a150609043e896319005c0ab8e96', '测试视频6', '201703/20170323092736_28.jpg', '<p><video class=\"edui-upload-video  vjs-default-skin video-js\" controls=\"\" preload=\"none\" width=\"420\" height=\"280\" src=\"/upload/video/20170323/1490253909414042832.mp4\" data-setup=\"{}\"><source src=\"/upload/video/20170323/1490253909414042832.mp4\" type=\"video/mp4\"/></video></p>', '666666', '2017-03-23 09:27:39', '2017-03-23 09:27:39', '1', '测试', '0');
INSERT INTO `blog_video` VALUES ('c2fa14349fa6480f8918ec48f2eff42e', '测试视频7', '201703/20170323092748_783.jpg', '<p><video class=\"edui-upload-video  vjs-default-skin video-js\" controls=\"\" preload=\"none\" width=\"420\" height=\"280\" src=\"/upload/video/20170323/1490253909414042832.mp4\" data-setup=\"{}\"><source src=\"/upload/video/20170323/1490253909414042832.mp4\" type=\"video/mp4\"/></video></p>', '666666', '2017-03-23 09:27:51', '2017-03-23 09:27:51', '1', '测试', '0');
INSERT INTO `blog_video` VALUES ('b66ce44b6353438abdc7ecb355db13e8', '测试视频8', '201703/20170323092800_854.jpg', '<p><video class=\"edui-upload-video  vjs-default-skin video-js\" controls=\"\" preload=\"none\" width=\"420\" height=\"280\" src=\"/upload/video/20170323/1490253909414042832.mp4\" data-setup=\"{}\"><source src=\"/upload/video/20170323/1490253909414042832.mp4\" type=\"video/mp4\"/></video></p>', '666666', '2017-03-23 09:28:03', '2017-03-23 16:08:46', '1', '测试', '0');
INSERT INTO `blog_video` VALUES ('e371a326784f4df7bde24dd720411e0f', '测试视频9', '201703/20170324145547_864.jpg', '<p><video class=\"edui-upload-video  vjs-default-skin video-js\" controls=\"\" preload=\"none\" width=\"420\" height=\"280\" src=\"/upload/video/20170323/1490253909414042832.mp4\" data-setup=\"{}\"><source src=\"/upload/video/20170323/1490253909414042832.mp4\" type=\"video/mp4\"/></video></p>', '666666', '2017-03-24 14:55:51', '2017-03-24 14:55:51', '1', '测试', '0');
INSERT INTO `blog_video` VALUES ('4cb17716272e4859aaaa0ab8169f78eb', '测试视频10', '201703/20170324153748_460.jpg', '<p><video class=\"edui-upload-video  vjs-default-skin video-js\" controls=\"\" preload=\"none\" width=\"420\" height=\"280\" src=\"/upload/video/20170323/1490253909414042832.mp4\" data-setup=\"{}\"><source src=\"/upload/video/20170323/1490253909414042832.mp4\" type=\"video/mp4\"/></video></p>', '666666', '2017-03-24 15:37:55', '2017-03-24 15:55:40', '0', '测试,花火', '0');

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
