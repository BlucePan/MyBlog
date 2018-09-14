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
<!--[if lt IE 9]>
<script src="js/modernizr.js"></script>
<![endif]-->
</head>
<body>
<%@ include file="/jsp/common/top.jsp"%>
<div class="moodlist" >
  <h1 class="t_nav"><span>删删写写，回回忆忆，虽无法行云流水，却也可碎言碎语。</span><a href="${blog}/" class="n1">网站首页</a><a href="${blog}/jottings.html" class="n2">闲谈随笔</a></h1>
  <div class="bloglist" >
 <c:forEach var="j" items="${jList}">
 	   <ul class="arrow_box">
         <div class="sy">
      <p>
      <c:if test="${j.image != null &&  j.image != ''}"><img  src="${imageService}/${j.image}" /></c:if>
       ${j.context}
      </p>
      <span class="dateview"><fmt:parseDate value='${j.createTime}' var="yearMonth" pattern="yyyy-MM-dd "/>
              <fmt:formatDate value="${yearMonth}" pattern="yyyy-MM-dd" /></span>
        </div>
    </ul> 	
 </c:forEach>
 
   <!-- 分页信息 -->
   <div  class="fenye">
      <ul class="clear">
        ${pager}
      </ul>
    </div>
 	</div>
 </div>

<%@include file="/jsp/common/bottom.jsp"%>
</body>
</html>