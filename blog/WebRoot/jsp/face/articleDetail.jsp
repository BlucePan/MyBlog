<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/jsp/common/common.jsp"%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>${article.title}-盘子博客 BlucePan</title>
<meta name="keywords" content="${article.title}"/>
<meta name="description" content="${r.remake}" />
<link href="${blog}/css/base.css" rel="stylesheet">
<link href="${blog}/css/new.css" rel="stylesheet">
<!--[if lt IE 9]>
<script src="js/modernizr.js"></script>
<![endif]-->
</head>
<body>
<%@ include file="/jsp/common/top.jsp"%>
<article class="blogs">
  <h1 class="t_nav"><span>我们长路漫漫，只因学无止境。</span><a href="${blog}/" class="n1">网站首页</a><a href="${blog}/article.html?type=${article.type}" class="n2">${article.articleName}</a></h1>
  <div class="index_about">
    <h2 class="c_titile">${article.title}</h2>
    <p class="box_c"><span class="d_time">发布时间：2013-09-08</span><span>编辑：${article.createUser}</span><span>阅读：（${article.browse}）</span></p>
    <ul class="infos">
    		${article.context}
    </ul>
    <div class="keybq">
    <p><span>关键字词</span>：${article.keyWord}</p>    
    </div>
    <div class="ad"> </div>
    <div class="nextinfo">
    <c:if test="${aboveArticle!= null}">
    	 <p>上一篇：<a href="${blog}/articleDetail.html?id=${aboveArticle.id}&type=${aboveArticle.type}">${aboveArticle.title}</a></p>
    </c:if> 
     <c:if test="${nextArticle!= null}">
    	 <p>下一篇：<a href="${blog}/articleDetail.html?id=${nextArticle.id}&type=${nextArticle.type}">${nextArticle.title}</a></p>
    </c:if>
    </div>
    <div class="otherlink">
      <h2>相关文章</h2>
      <ul>
         <c:forEach var="l" items="${lArticleList}">
      <li><a href="${blog}/articleDetail.html?id=${l.id}&type=${l.type}" title="${l.title}" >${l.title}</a></li>    
         </c:forEach>
      </ul>
    </div>
    
<!--PC版-->
<div id="SOHUCS" sid="${article.id}" style="margin-left: 1;width:96%"></div>
<script charset="utf-8" type="text/javascript" src="https://changyan.sohu.com/upload/changyan.js" ></script>
<script type="text/javascript">
window.changyan.api.config({
appid: 'cytN4LNTj',
conf: 'prod_aef07d70ca8ec23ae9bbbfb1bffff613'
});
</script>
    
  </div>
  
  <aside class="right">
    <!-- Baidu Button BEGIN -->
    <div id="bdshare" class="bdshare_t bds_tools_32 get-codes-bdshare"><a class="bds_tsina"></a><a class="bds_qzone"></a><a class="bds_tqq"></a><a class="bds_renren"></a><span class="bds_more"></span><a class="shareCount"></a></div>
    <script type="text/javascript" id="bdshare_js" data="type=tools&amp;uid=6574585" ></script> 
    <script type="text/javascript" id="bdshell_js"></script> 
    <script type="text/javascript">
document.getElementById("bdshell_js").src = "http://bdimg.share.baidu.com/static/js/shell_v2.js?cdnversion=" + Math.ceil(new Date()/3600000)
</script> 
    <!-- Baidu Button END -->
    <div class="blank"></div>
    <div class="news">
    	<!-- 右边加载的数据 -->
      <iframe src="${blog}/user/faceRightArticleList.html" id="right"  scrolling="no" frameborder="0" onload="this.height=this.contentWindow.document.documentElement.scrollHeight"></iframe> 
   
    </div>
    <div class="visitors">
      <h3>
        <p>最近访客</p>
      </h3>
      <ul>
      </ul>
    </div>
  </aside>
</article>
<%@include file="/jsp/common/bottom.jsp"%>
</body>
</html>