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
<link href="${blog}/css/mood.css" rel="stylesheet">
<link href="${blog}/css/page.css" rel="stylesheet">
<style type="text/css">
.pagelistFace{
text-align: center;
}
</style>
<!--[if lt IE 9]>
<script src="js/modernizr.js"></script>
<![endif]-->
</head>
<body>
<%@ include file="faceTop.jsp"%>
<div class="moodlist" >
  <h1 class="t_nav"><span>删删写写，回回忆忆，虽无法行云流水，却也可碎言碎语。</span><a href="${blog}/user/main.html" class="n1">网站首页</a><a href="${blog}/jottings/manage/faceJottingsList.html" class="n2">闲谈随笔</a></h1>
  <div class="bloglist" >
 <c:forEach var="j" items="${jList}">
 	   <ul class="arrow_box">
         <div class="sy">
      <p>
      <img  src="${imageService}/${j.image}" />
       ${j.context}
      </p>
      <span class="dateview"><fmt:parseDate value='${j.createTime}' var="yearMonth" pattern="yyyy-MM-dd "/>
              <fmt:formatDate value="${yearMonth}" pattern="yyyy-MM-dd" /></span>
        </div>
    </ul> 	
 </c:forEach>
 
   	    <!-- 分页信息 -->
    <div id="page" class="pagelistFace">
      <ul>
        ${pager}
      </ul>
    </div>
 		</div>
 </div>

 <!--   <div class="page"><a title="Total record"><b>41</b></a><b>1</b><a href="/news/s/index_2.html">2</a><a href="/news/s/index_2.html">&gt;</a><a href="/news/s/index_2.html">&gt;&gt;</a></div>
</div> -->
<!-- <footer>
  <p>Design by DanceSmile <a href="http://www.miitbeian.gov.cn/" target="_blank">蜀ICP备11002373号-1</a> <a href="/">网站统计</a></p>
</footer> -->



<script src="${blog}/js/silder.js"></script>
</body>
</html>