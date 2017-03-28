<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/jsp/common/common.jsp"%>

<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>个人博客 BlucePan</title>
<meta name="keywords" content="个人博客模板,博客模板"/>
<meta name="description" content="寻梦主题的个人博客模板，优雅、稳重、大气,低调。" />
<link href="${blog}/css/base.css" rel="stylesheet">
<link href="${blog}/css/index.css" rel="stylesheet">
<!--[if lt IE 9]>
<script src="js/modernizr.js"></script>
<![endif]-->
</head>
<body>
<%-- <header>
  <div id="logo"><a href="${blog}/user/main.html"></a></div>
  <nav class="topnav" id="topnav"><a href="${blog}/user/main.html"><span>首页</span><span class="en">Protal</span></a><a href="${blog}/jsp/face/about.jsp"><span>关于我</span><span class="en">About</span></a><a href="${blog}/jsp/face/newlist.jsp"><span>慢生活</span><span class="en">Life</span></a><a href="${blog}/jsp/face/moodlist.jsp"><span>碎言碎语</span><span class="en">Doing</span></a><a href="${blog}/jsp/face/share.jsp"><span>模板分享</span><span class="en">Share</span></a><a href="${blog}/jsp/face/knowledge.jsp"><span>学无止境</span><span class="en">Learn</span></a><a href="${blog}/user/myself.html"><span>留言版</span><span class="en">Gustbook</span></a></nav>
  </nav>
</header> --%>
<!-- 引入公共头部 -->
<%@ include file="faceTop.jsp"%>

<!-- 滚动字幕 -->
<div class="banner">
  <section class="box">
    <ul class="texts">
      <p>嬉皮笑脸，面对人生的难。</p>
      <p>说书唱戏劝人方，三条大陆走中央，</p>
      <p>善恶到头终有报，人间正道是沧桑。</p>
    </ul>
    <div class="avatar"><a href="#"><span>盘子</span></a> </div>
  </section>
</div>

<!-- 图片模块 -->
<div class="template">
  <div class="box">
    <h3>
      <p><span></span>推荐视频</p>
    </h3>
    <ul>
  <%--     <li><a href="/"  ><img src="${blog}/img/01.jpg"></a><span>小帅哥</span></li>--%>   
 	 <c:forEach var="v" items="${bVideoList}">
 	   <li><a href="${blog}/voice/manage/faceVideoDetail.html?id=${v.id}"><img src="/imageService/uploadFiles/${v.image}"></a><span>${v.title}</span></li>
     </c:forEach>
  </ul>
  </div>
</div>

<article>
  <h2 class="title_tj">
    <p>文章<span>推荐</span></p>
  </h2>
  <div class="bloglist left">
  <c:forEach var="b" items="${bArticleList}">
    <h3>${b.title}</h3>
    <figure><img src="/imageService/uploadFiles/${b.image}"></figure>
    <ul>
      <p>${b.remake}</p>
      <a title="/" href="${blog}/article/manage/seeArticleDetail.html?id=${b.id}&type=${b.type}"  class="readmore">阅读全文>></a>
    </ul>
    <p class="dateview">
    <span><fmt:parseDate value='${b.createTime}' var="yearMonth" pattern="yyyy-MM-dd "/>
          <fmt:formatDate value="${yearMonth}" pattern="yyyy-MM-dd " /></span>          
          <span>作者：${b.createUser}</span><span>个人博客：[<a href="${blog}/article/manage/faceArticleList.html?type=${b.type}">${b.articleName}</a>]</span></p>
</c:forEach>
   </div>
  <aside class="right">
    <div class="weather"><iframe width="250" scrolling="no" height="60" frameborder="0" allowtransparency="true" src="http://i.tianqi.com/index.php?c=code&id=12&icon=1&num=1"></iframe></div>
    <div class="news">
    <h3>
      <p>最新<span>文章</span></p>
    </h3>
    <ul class="rank">
      <c:forEach var="n" items="${nArticleList}" varStatus="d">
   	<c:choose>		
		<c:when test="${d.count==1}">
            <li><a href="${blog}/article/manage/seeArticleDetail.html?id=${n.id}&type=${n.type}" title="${n.title}" style="color:red;">${n.title}</a></li>
	    </c:when>
		<c:otherwise>		
            <li><a href="${blog}/article/manage/seeArticleDetail.html?id=${n.id}&type=${n.type}" title="${n.title}" >${n.title}</a></li>
		</c:otherwise>
	</c:choose>
      </c:forEach>
     </ul>
    <h3 class="ph">
      <p>点击<span>排行</span></p>
    </h3>
    <ul class="paih">
        <c:forEach var="s" items="${sArticleList}">
      <li><a href="${blog}/article/manage/seeArticleDetail.html?id=${s.id}&type=${s.type}" title="${s.title}" >${s.title}</a></li>    
    </c:forEach>
    </ul>
    <h3 class="links">
      <p>友情<span>链接</span></p>
    </h3>
    <ul class="website">
      <li><a href="http://www.aiyoseo.com" target="_blank">万易设计</a></li>
      <li><a href="#" target="_blank">网易云音乐</a></li>
      <li><a href="#" target="_blank">王者农药</a></li>
      <li><a href="#" target="_blank">皇室战争</a></li>
    </ul> 
    </div>  
    <!-- 百度分享 -->
    <div id="bdshare" class="bdshare_t bds_tools_32 get-codes-bdshare"><a class="bds_tsina"></a><a class="bds_qzone"></a><a class="bds_tqq"></a><a class="bds_renren"></a><span class="bds_more"></span><a class="shareCount"></a></div>
    <script type="text/javascript" id="bdshare_js" data="type=tools&amp;uid=6574585" ></script> 
    <script type="text/javascript" id="bdshell_js"></script> 
    <script type="text/javascript">
document.getElementById("bdshell_js").src = "http://bdimg.share.baidu.com/static/js/shell_v2.js?cdnversion=" + Math.ceil(new Date()/3600000)
</script> 
    <!-- Baidu Button END -->   
    <!-- <a href="/" class="weixin"> </a></aside> -->
</article>

<footer>
  <p>Design by DanceSmile <a href="http://www.miitbeian.gov.cn/" target="_blank">蜀ICP备11002373号-1</a> <a href="/">网站统计</a></p>
</footer>
<script src="${blog}/js/silder.js"></script>

<!-- 背景特效 -->
<%-- <script type="text/javascript" src="${blog}/js/particle.js"></script> --%>
 <!-- 按需加载背景 -->
  <!-- 识别手机或电脑的js开始 -->  
  <script type="text/javascript">   
  (function(){  
    var res = GetRequest();  
    var par = res['index'];  
    if(par!='gfan'){  
      var ua=navigator.userAgent.toLowerCase();  
      var contains=function (a, b){  
          if(a.indexOf(b)!=-1){return true;}  
      };   
   /*    if((contains(ua,"android") && contains(ua,"mobile"))||(contains(ua,"android") && contains(ua,"mozilla"))||(contains(ua,"android") && contains(ua,"opera"))||contains(ua,"ucweb7")||contains(ua,"iphone")){
        return false;
      } else {
        $.getScript("${blog}/js/particle.js");
      } */
      $.getScript("${blog}/js/particle.js");
    }  
  })();  
  function GetRequest() {  
    var url = location.search;
    var theRequest = new Object();  
    if (url.indexOf("?") != -1) {  
      var str = url.substr(1);  
      strs = str.split("&");  
      for(var i = 0; i < strs.length; i ++) {  
        theRequest[strs[i].split("=")[0]]=unescape(strs[i].split("=")[1]);  
      }  
    }  
    return theRequest;  
  }  
  </script>  
  <!-- 识别手机或电脑的js结束 -->  

</body>
</html>