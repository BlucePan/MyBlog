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
<link href="${blog}/css/case.css" rel="stylesheet">
<link href="${blog}/css/page.css" rel="stylesheet">
<style type="text/css">
.vTitle{
	text-align: center;
}
</style>
</head>
<body>
<%@ include file="/jsp/common/top.jsp"%>
<article class="blogs">
<h1 class="t_nav"><span>好的视频要给大家分享。 </span><a href="${blog}/" class="n1">网站首页</a><a href="${blog}/video.html" class="n2">娱乐视频</a></h1>
<div class="caselist left">
 <ul>
 <c:forEach var="v" items="${list}">
    <li><a href="${blog}/videosDetail.html?id=${v.id}" target="_blank"><img src="${imageService}/${v.image}">
   	 <span class="vTitle">${v.title}</span>	
    </a></li>
 </c:forEach>
<%-- <li><a href="#"><img src="${blog}/img/01.jpg"></a></li>
<li><a href="#"><img src="${blog}/img/02.jpg"></a></li> --%>  
 </ul>	
  	 <!-- 分页信息 -->  	
 	<%-- <div id="page" class="pagelistFace">
      <ul>
        ${pager}
      </ul>
    </div>   --%>
</div>
<aside class="right">
   <div class="rnav">
      <h2>栏目导航</h2>
      <ul>
       <li><a href="#" >搞笑视频</a></li>
       <li><a href="#" >美国大片</a></li>
       <li><a href="#" >国产电影</a></li>
       <li><a href="#" >好看视频</a></li>
     </ul>      
    </div>
	<div class="news"> 
	  	<!-- 右边加载的数据 -->
	      <iframe src="${blog}/faceRightArticleList.html?catCode=${parentCode}" id="right"  scrolling="no" frameborder="0" onload="this.height=this.contentWindow.document.documentElement.scrollHeight"></iframe>    
	</div>
    <div class="visitors">
      <h3><p>最近访客</p></h3>
      <ul>

      </ul>
    </div>
</aside>
</article>
<%@include file="/jsp/common/bottom.jsp"%>
</body>
</html>