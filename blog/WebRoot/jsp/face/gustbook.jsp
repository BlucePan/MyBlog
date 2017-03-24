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
appid: 'cysU9ouu1',
conf: 'prod_f7b4b4284527f7d0ac5eb32a6acb6ae5'
});
</script>
</div>
<aside class="right">  
    <div class="about_c">
    <p>网名：<span>DanceSmile</span> | 即步非烟</p>
    <p>姓名：杨青 </p>
    <p>生日：1987-10-30</p>
    <p>籍贯：四川省—成都市</p>
    <p>现居：天津市—滨海新区</p>
    <p>职业：网站设计、网站制作</p>
    <p>喜欢的书：《红与黑》《红楼梦》</p>
    <p>喜欢的音乐：《burning》《just one last dance》《相思引》</p>
<a target="_blank" href="http://wp.qq.com/wpa/qunwpa?idkey=d4d4a26952d46d564ee5bf7782743a70d5a8c405f4f9a33a60b0eec380743c64">
<img src="http://pub.idqqimg.com/wpa/img/group.png" alt="杨青个人博客网站" title="杨青个人博客网站"></a>
<a target="_blank" href="http://mail.qq.com/cgi-bin/qm_share?t=qm_mailme&amp;email=HHh9cn95b3F1cHVye1xtbTJ-c3E" ><img src="http://rescdn.qqmail.com/zh_CN/htmledition/img/function/qm_open/ico_mailme_22.png" alt="杨青个人博客网站"></a>
</div>     
</aside>
</article>
<footer>
  <p>Design by DanceSmile <a href="http://www.miitbeian.gov.cn/" target="_blank">蜀ICP备11002373号-1</a> <a href="/">网站统计</a></p>
</footer>
<script src="${blog}/js/silder.js"></script>
</body>
</html>