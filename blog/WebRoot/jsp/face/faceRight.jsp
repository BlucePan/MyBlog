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
<link href="${blog}/css/index.css" rel="stylesheet">

<div class="news">
    <h3>
      <p>最新<span>文章</span></p>
    </h3>
    <ul class="rank">
        <c:forEach var="n" items="${nArticleList}" varStatus="d">
   	<c:choose>		
		<c:when test="${d.count==1}">
            <li><a href="${blog}/articleDetail.html?id=${n.id}&type=${n.catCode}" title="${n.title}" style="color:red;" target="_blank">${n.title}</a></li>
	    </c:when>
		<c:otherwise>		
            <li><a href="${blog}/articleDetail.html?id=${n.id}&type=${n.catCode}" title="${n.title}"  target="_blank">${n.title}</a></li>
		</c:otherwise>
	</c:choose>
      </c:forEach>   
      <!-- <li><a href="/" title="Column 三栏布局 个人网站模板" target="_blank">Column 三栏布局 个人网站模板</a></li>-->
    </ul>
    <h3 class="ph">
      <p>点击<span>排行</span></p>
    </h3>
    <ul class="paih">
        <c:forEach var="s" items="${sArticleList}">
      <li><a href="${blog}/articleDetail.html?id=${s.id}&type=${s.catCode}" title="${s.title}" target="_blank">${s.title}</a></li>    
    </c:forEach>
      <!-- <li><a href="/" title="Column 三栏布局 个人网站模板" target="_blank">Column 三栏布局 个人网站模板</a></li> -->
    </ul>    
</div>
<!-- 畅言评论 -->
<!-- <div class="visitors">
     <h3><p>热门<span>评论</span></p></h3>
     <div id="cyReping" role="cylabs" data-use="reping"></div>
  	 <script type="text/javascript" charset="utf-8" src="https://changyan.itc.cn/js/lib/jquery.js"></script>
	 <script type="text/javascript" charset="utf-8" src="https://changyan.sohu.com/js/changyan.labs.https.js?appid=cythFk0gD"></script>  
</div> -->
