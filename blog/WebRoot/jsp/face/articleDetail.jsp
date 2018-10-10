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
<script type="text/javascript" src="${blog}/ueditor/third-party/SyntaxHighlighter/shCore.js"></script>   
<link rel="stylesheet" href="${blog}/ueditor/third-party/SyntaxHighlighter/shCoreDefault.css" type="text/css" />
<script>   
SyntaxHighlighter.all() //执行代码高亮   
</script>
</head>
<body>
<%@ include file="/jsp/common/top.jsp"%>
<article class="blogs">
  <h1 class="t_nav"><span>我们长路漫漫，只因学无止境。</span><a href="${blog}/" class="n1">网站首页</a><a href="#" class="n2">${article.articleName}</a></h1>
  <div class="index_about">
    <h2 class="c_titile">${article.title}</h2>
    <p class="box_c"><span class="d_time">发布时间：<fmt:parseDate value='${article.createTime}' var="yearMonth" pattern="yyyy-MM-dd "/><fmt:formatDate value="${yearMonth}" pattern="yyyy-MM-dd " />
                     </span><span>编辑：${article.createUser}</span><span>阅读：（${article.browse}）</span></p>
    <ul class="infos">
    		${article.context}
    </ul>    
    <div class="keybq">
    <p><span>关键字词</span>：${article.keyWord}</p>    
    </div>
    <div class="ad"> </div>
    <div class="nextinfo">
    <c:if test="${aboveArticle!= null}">
    	 <p>上一篇：<a href="${blog}/articleDetail.html?id=${aboveArticle.id}">${aboveArticle.title}</a></p>
    </c:if> 
     <c:if test="${nextArticle!= null}">
    	 <p>下一篇：<a href="${blog}/articleDetail.html?id=${nextArticle.id}">${nextArticle.title}</a></p>
    </c:if>
    </div>
    <div class="otherlink">
      <h2>相关文章</h2>
      <ul>
         <c:forEach var="l" items="${lArticleList}">
      <li><a href="${blog}/articleDetail.html?id=${l.id}" title="${l.title}" >${l.title}</a></li>    
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
<div class="bdsharebuttonbox"><a href="#" class="bds_more" data-cmd="more"></a><a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a><a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a><a href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a><a href="#" class="bds_sqq" data-cmd="sqq" title="分享到QQ好友"></a><a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a></div>
<script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"1","bdSize":"32"},"share":{}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='${blog}/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>
    <!-- Baidu Button END -->
    <div class="blank"></div>
    <div class="news">
    	<!-- 右边加载的数据 -->
      <iframe src="${blog}/faceRightArticleList.html?catCode=${parentCode}" id="right"  scrolling="no" frameborder="0" onload="this.height=this.contentWindow.document.documentElement.scrollHeight"></iframe>   
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