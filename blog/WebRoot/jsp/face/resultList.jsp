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
<link href="${blog}/css/learn.css" rel="stylesheet">
<link href="${blog}/css/page.css" rel="stylesheet">

</head>
<body>
<!-- 引用公共头部 -->
<%@ include file="/jsp/common/top.jsp"%>
<article class="blogs">
<h1 class="t_nav"><span>搜索一下，你就知道 。</span><a href="${blog}/" class="n1">网站首页</a>
			<a href="#" class="n2">${searchName}</a>
</h1>
<!-- 博客列表 -->
<div class="newblog left">
<c:forEach var="r" items="${list}">
     <h2>${r.title}</h2>
      <p class="dateview"><span>发布时间：<fmt:parseDate value='${r.createTime}' var="yearMonth" pattern="yyyy-MM-dd "/>
        <fmt:formatDate value="${yearMonth}" pattern="yyyy-MM-dd " /></span>
    <span>作者：${r.createUser}</span><span>分类：[<a href="${blog}/search.html?catCode=${r.catCode}">${r.articleName}</a>]</span></p>
    <figure><img src="${imageService}/${r.image}"></figure>
    <ul class="nlist">
      <p>${r.remake}</p>
      <a title="/" href="${blog}/articleDetail.html?id=${r.id}" class="readmore" target="_blank">详细信息>></a>
    </ul>
    <div class="line"></div>
</c:forEach>
    <!-- 分页信息 -->
    <div class="pagelistFace">
      <ul>
        ${pager}
      </ul>
    </div>    
</div>
<aside class="right">
	<div class="container"><div id="search"> 
	<form name="search_js1" method="post" action="${blog}/search.html"> 
	<input type="text" name="title" placeholder="请输入关键字"   value="${param.title}">    
	<input class="button" type="submit" value="搜索"> 
    </form></div></div>
   <div class="rnav">
      <h2>博客分类</h2>
       <ul>
	<c:forEach var="a" items="${articleTypeList}" varStatus="d">
   		 <li class="rnav${d.count}"><a href="${blog}/search.html?catCode=${a.catCode}" >${a.articleName}</a></li>	  			
   	</c:forEach>
      </ul>           
    </div> 
<div class="label" id="divTags">
	<h3 >
      <p>标签<span>列表</span></p>
    </h3>
    <ul>
    <c:forEach var="l" items="${labelList}">
	<li><a href="${blog}/search.html?label=${l.label}">${l.name}<span class="tag-count"> (${l.count})</span></a></li>
	</c:forEach>
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