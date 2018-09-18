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
<h1 class="t_nav"><span>我们长路漫漫，只因学无止境。 </span><a href="${blog}/" class="n1">网站首页</a>
	<c:choose>		
		<c:when test="${param.type=='1'}">
			<a href="${blog}/article.html?type=1" class="n2">网站建设</a>
		</c:when>
		<c:when test="${param.type=='2'}">
			<a href="${blog}/article.html?type=2" class="n2">心得笔记</a>
		</c:when>
		<c:when test="${param.type=='3'}">
			<a href="${blog}/article.html?type=3" class="n2">程序人生</a>
		</c:when>
		<c:when test="${param.type=='4'}">
			<a href="${blog}/article.html?type=4" class="n2">web前端</a>
		</c:when>
		<c:otherwise>		
            <a href="${blog}/article.html" class="n2">我的博客</a>
		</c:otherwise>
	</c:choose>
</h1>

<!-- 博客列表 -->
<div class="newblog left">
<c:forEach var="r" items="${list}">
     <h2>${r.title}</h2>
      <p class="dateview"><span>发布时间：<fmt:parseDate value='${r.createTime}' var="yearMonth" pattern="yyyy-MM-dd "/>
        <fmt:formatDate value="${yearMonth}" pattern="yyyy-MM-dd " /></span>
    <span>作者：${r.createUser}</span><span>分类：[<a href="${blog}/articleDetail.html?type=${r.catCode}">${r.articleName}</a>]</span></p>
    <figure><img src="${imageService}/${r.image}"></figure>
    <ul class="nlist">
      <p>${r.remake}</p>
      <a title="/" href="${blog}/articleDetail.html?id=${r.id}&type=${r.catCode}" class="readmore">详细信息>></a>
    </ul>
    <div class="line"></div>
</c:forEach>

    <!-- 分页信息 -->
    <div class="pagelistFace">
      <ul>
        ${pager}
      </ul>
    </div>
    
 <%--     <div class="blank"></div> 
    <div class="ad">  
    <img src="${blog}/img/ad.png">
    </div>
    <div class="page"><a title="Total record"><b>41</b></a><b>1</b><a href="/news/s/index_2.html">2</a><a href="/news/s/index_2.html">&gt;</a><a href="/news/s/index_2.html">&gt;&gt;</a></div>
 --%></div>
<aside class="right">
	<div class="container"><div id="search"> 
	<form name="search_js1" method="post" action="#"> 
	<input type="text" name="keyboard">    
	<input class="button" type="submit" value="搜索"> 
    </form></div></div>
   <div class="rnav">
      <h2>博客分类</h2>
       <ul>
	<c:forEach var="a" items="${articleTypeList}" varStatus="d">
   		 <li class="rnav${d.count}"><a href="${blog}/article.html?type=${a.id}" >${a.articleName}</a></li>	  			
   	</c:forEach>
      </ul>           
    </div>
              
<div class="news"> 
  	<!-- 右边加载的数据 -->
      <iframe src="${blog}/user/faceRightArticleList.html" id="right"  scrolling="no" frameborder="0" onload="this.height=this.contentWindow.document.documentElement.scrollHeight"></iframe>    
</div>
        
    <div class="visitors">
      <h3><p>最近访客</p></h3>
      <ul>

      </ul>
    </div>
     <!-- Baidu Button BEGIN -->
    <div id="bdshare" class="bdshare_t bds_tools_32 get-codes-bdshare"><a class="bds_tsina"></a><a class="bds_qzone"></a><a class="bds_tqq"></a><a class="bds_renren"></a><span class="bds_more"></span><a class="shareCount"></a></div>
    <script type="text/javascript" id="bdshare_js" data="type=tools&amp;uid=6574585" ></script> 
    <script type="text/javascript" id="bdshell_js"></script> 
    <script type="text/javascript">
document.getElementById("bdshell_js").src = "http://bdimg.share.baidu.com/static/js/shell_v2.js?cdnversion=" + Math.ceil(new Date()/3600000)
</script> 
    <!-- Baidu Button END -->   
</aside>
</article>
<%@include file="/jsp/common/bottom.jsp"%>
</body>
</html>