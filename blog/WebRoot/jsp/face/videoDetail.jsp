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
<link href="${blog}/css/new.css" rel="stylesheet">
<!--[if lt IE 9]>
<script src="js/modernizr.js"></script>
<![endif]-->
</head>
<body>
<%@ include file="/jsp/common/top.jsp"%>
<article class="blogs">
  <h1 class="t_nav"><span>我们长路漫漫，只因学无止境。</span><a href="${blog}/" class="n1">网站首页</a><a href="${blog}/video.html" class="n2">娱乐视频</a></h1>
  <div class="index_about">
    <h2 class="c_titile">${video.title}</h2>
    <p class="box_c"><span class="d_time">发布时间：2013-09-08</span><span>编辑：${video.createUser}</span><span>阅读：100</span></p>
    <ul class="infosVideo">     
<%--<video src="/imageService/uploadBaiduFiles/${video.videoUrl}"></video>
    <video controls="controls" autoplay="autoplay">
  <source src="/imageService/uploadBaiduFiles/${video.videoUrl}" type="video/ogg" />
  <source src="/imageService/uploadBaiduFiles/${video.videoUrl}" type="video/mp4" />
</video> --%>
	    ${video.videoUrl} 	     
    </ul>
    <script>
/* 	;(function($){
		$(".infos p").each(function(){
		     var v=$(this).find("video").length;
			 if(v==0){
			    $(this).css("padding","0 10px");	 
			 }	
		})
		 	$(".infos video").attr("width","500");
			$(".infos video").attr("height","500"); 
		   var video=$(".infos video").attr("src");
		$(".infos video").attr("src","/imageService/uploadBaiduFiles/"+video);
	})(Zepto);  */
	//拼接播放路径
	$(function(){
	$(".infosVideo video").attr("width","712");
			$(".infosVideo video").attr("height","522"); 
		   var video=$(".infosVideo video").attr("src"); 
		$(".infosVideo video").attr("src","${imageServices}"+video); //拼接视频路径
		$(".infosVideo video").attr("poster","/imageService/uploadFiles/${video.image}"); //拼接显示封面图片
		$(".infosVideo video").attr("preload","auto"); //预加载播放
	});
		
	</script>
    
    
    <div class="keybq">
    <p><span>关键字词</span>：你猜</p>    
    </div>
    <div class="ad"> </div>
<%--     <div class="nextinfo">
    <c:if test="${aboveArticle!= null}">
    	 <p>上一篇：<a href="${blog}/article/manage/seeArticleDetail.html?id=${aboveArticle.id}&type=${aboveArticle.type}">${aboveArticle.title}</a></p>
    </c:if> 
     <c:if test="${nextArticle!= null}">
    	 <p>下一篇：<a href="${blog}/article/manage/seeArticleDetail.html?id=${nextArticle.id}&type=${nextArticle.type}">${nextArticle.title}</a></p>
    </c:if>
    </div>
 --%>    <div class="otherlink">
      <h2>相关视频</h2>
      <ul>
         <c:forEach var="l" items="${lVideoList}">
      <li><a href="${blog}/videosDetail.html?id=${l.id}" title="${l.title}" >${l.title}</a></li>    
         </c:forEach> 
      </ul>
    </div>
    
<!--PC版-->
<div id="SOHUCS" sid="${video.id}" style="margin-left: 1;width:96%"></div>
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