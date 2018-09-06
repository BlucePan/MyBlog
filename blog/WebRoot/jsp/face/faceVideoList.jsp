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
<!--[if lt IE 9]>
<script src="js/modernizr.js"></script>
<![endif]-->

<style type="text/css">
.vTitle{
	text-align: center;
}
</style>

</head>
<body>
<%@ include file="/jsp/common/top.jsp"%>
<article class="blogs">
<h1 class="t_nav"><span>好咖啡要和朋友一起品尝，好“模板”也要和同样喜欢它的人一起分享。 </span><a href="${blog}" class="n1">网站首页</a><a href="${blog}/video.html" class="n2">娱乐视频</a></h1>
<div class="caselist left">
 <ul>
 <c:forEach var="v" items="${list}">
    <li><a href="${blog}/videosDetail.html?id=${v.id}"><img src="${imageService}/${v.image}">
   	 <span class="vTitle">${v.title}</span>	
    </a></li>
 </c:forEach>
 
<%-- <li><a href="#"><img src="${blog}/img/01.jpg"></a></li>
<li><a href="#"><img src="${blog}/img/02.jpg"></a></li> --%>  
 </ul>
 		
  	 <!-- 分页信息 -->  	
 	<div id="page" class="pagelistFace">
      <ul>
        ${pager}
      </ul>
    </div>  
 	
</div>


<aside class="right">
   <div class="rnav">
      <h2>栏目导航</h2>
      <ul>
       <li><a href="#" >个人博客模板</a></li>
       <li><a href="#" >国外Html5模板</a></li>
       <li><a href="#" >企业网站模板</a></li>
       <li><a href="#" >作品展示</a></li>
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