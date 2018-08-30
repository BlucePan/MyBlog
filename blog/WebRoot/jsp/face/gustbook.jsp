<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/jsp/common/common.jsp"%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>个人博客 BlucePan</title>
<meta name="keywords" content="个人博客模板,博客模板"/>
<meta name="description" content="寻梦主题的个人博客模板，优雅、稳重、大气,低调。" />
<link href="${blog}/css/base.css" rel="stylesheet">
<link href="${blog}/css/about.css" rel="stylesheet">
<!--[if lt IE 9]>
<script src="js/modernizr.js"></script>
<![endif]-->
<link href='http://fonts.googleapis.com/css?family=Architects+Daughter' rel='stylesheet' type='text/css'>
</head>
<body>
<%@ include file="faceTop.jsp"%>
<article class="aboutcon">
<h1 class="t_nav"><span>我不知道该说些什么。</span><a href="${blog}/user/main.html" class="n1">网站首页</a><a href="${blog}/jsp/face/about.jsp" class="n2">关于我</a></h1>
<div class="about left">
<!--PC版-->
<div id="SOHUCS" sid="520666666"></div>
<script charset="utf-8" type="text/javascript" src="https://changyan.sohu.com/upload/changyan.js" ></script>
<script type="text/javascript">
window.changyan.api.config({
	appid: 'cytN4LNTj',
	conf: 'prod_aef07d70ca8ec23ae9bbbfb1bffff613'
});
</script>
</div>
<aside class="right">  
    <div class="about_c">
    <p>网名：<span>BlucePan</span> | 小鬼头love盘</p>
    <p>姓名：盘子</p>
    <p>生日：1994-09-08</p>
    <p>籍贯：湖北省—枣阳市</p>
    <p>现居：浙江省—杭州市</p>
    <p>职业：Java开发工程师</p>
    <p>喜欢的书：《增广贤文》</p>
    <p>喜欢的音乐：《海阔天空》《探清水河》</p>
    <p><a href="http://wpa.qq.com/msgrd?V=3&amp;uin=1548498126&amp;Site=www.blucepan.top&amp;Menu=yes" target="_blank"><img border="0" src="http://wpa.qq.com/pa?p=1:1548498126:13" alt="交流点这里"></a></p>
    <img src="http://pub.idqqimg.com/wpa/img/group.png" alt="盘子个人博客网站" title="盘子个人博客网站"></a>
</div> 
</aside>
</article>
<footer>
  <p>Design by DanceSmile <a href="http://www.miitbeian.gov.cn/" target="_blank">蜀ICP备11002373号-1</a> <a href="/">网站统计</a></p>
</footer>
<script src="${blog}/js/silder.js"></script>
</body>
</html>