<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/jsp/common/common.jsp"%>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>盘子博客 BlucePan</title>
<meta name="keywords" content="盘子博客 BlucePan"/>
<meta name="description" content="个人博客模板,博客模板,盘子" />
<link href="/favicon.ico" mce_href="/favicon.ico" rel="icon" type="image/x-icon">
<link href="${blog}/css/base.css" rel="stylesheet">
<link href="${blog}/css/index.css" rel="stylesheet">
<link href="${blog}/css/csshake.css" rel="stylesheet">
</head>
<body>
<%-- <header>
  <div id="logo"><a href="${blog}/user/main.html"></a></div>
  <nav class="topnav" id="topnav"><a href="${blog}/user/main.html"><span>首页</span><span class="en">Protal</span></a><a href="${blog}/jsp/face/about.jsp"><span>关于我</span><span class="en">About</span></a><a href="${blog}/jsp/face/newlist.jsp"><span>慢生活</span><span class="en">Life</span></a><a href="${blog}/jsp/face/moodlist.jsp"><span>碎言碎语</span><span class="en">Doing</span></a><a href="${blog}/jsp/face/share.jsp"><span>模板分享</span><span class="en">Share</span></a><a href="${blog}/jsp/face/knowledge.jsp"><span>学无止境</span><span class="en">Learn</span></a><a href="${blog}/user/myself.html"><span>留言版</span><span class="en">Gustbook</span></a></nav>
  </nav>
</header> --%>
<!-- 引入公共头部 -->
<%@ include file="/jsp/common/top.jsp"%>
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
      <p><span></span>猜你喜欢</p>
      <div class="gg" style="float: right;width:80.5%;font-size: 14px;height: 30px;line-height: 30px;color: #4E3E3E;position: absolute;bottom:0;right: 0;font-weight: 400;">
		<marquee scrollamount="5" direction="left" onmouseover="this.stop()" onmouseout="this.start()">
		<span style="color:#2b97d5;font-weight:bold">偶遇佳句：一生中，总有那么一段时间，需要你自己走，自己扛。 不要感觉害怕，不要感觉孤单，这只不过是成长的代价。</span>
		</marquee>
	  </div> 
    </h3>
    <ul>
 	 <c:forEach var="v" items="${bSlideList}">
 	   <li><a  class="shake shake-little" href="${v.url}"><img src="${imageService}/${v.image}"></a><span>${v.title}</span></li>
     </c:forEach>
  </ul>
  </div>
</div>
<!-- 文章模块 -->
<article>
  <h2 class="title_tj">
    <p>文章<span>推荐</span></p>
  </h2>
  <div class="bloglist left">
  <c:forEach var="b" items="${bArticleList}" varStatus="d">
  	<c:choose>		
		<c:when test="${d.count==1}">
            <h3><a href="#" style="color: #f00;">${b.title}</a><span class="hot"></span></h3>
	    </c:when>
		<c:otherwise>		
            <h3><a href="#">${b.title}</a></h3>
		</c:otherwise>
	</c:choose>
    <figure><img src="${imageService}/${b.image}"></figure>
    <ul>
      <p>${b.remake}</p>
      <a title="/" href="${blog}/articleDetail.html?id=${b.id}"  class="readmore" target="_blank">阅读全文>></a>
    </ul>
    <p class="dateview">
    <span><fmt:parseDate value='${b.createTime}' var="yearMonth" pattern="yyyy-MM-dd "/>
          <fmt:formatDate value="${yearMonth}" pattern="yyyy-MM-dd " /></span>          
          <span>作者：${b.createUser}</span><span>个人博客：[<a href="${blog}/chose.html?catCode=${b.catCode}">${b.articleName}</a>]</span></p>
</c:forEach>
   </div>
  <aside class="right">
  	<div class="container"><div id="search"> 
	<form name="search_js1" method="post" action="${blog}/search.html"> 
	<input type="text" name="title" placeholder="请输入关键字" required="required" value="${param.title}">    
	<input class="button" type="submit" value="搜索"> 
    </form></div></div>
    <div class="sale" style="display:none;"><figure><p><a href="#"  target="_blank" title="本站个人博客主题出售"><img src='${blog}/img/sale.jpg' alt='本站个人博客主题出售'/></a></p></figure></div>	
	<div class="blank"></div>
	<div class="time" style="border:#CCC 2px solid;border-radius:10px;padding-left: 3%;margin-bottom:5px;">
	  <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" name="movie" width="235" height="97" id="movie"><param name="movie" value="${blog}/img/time.swf"><param name="quality" value="high"><param name="menu" value="false"><embed src="${blog}/img/time.swf" width="235" height="97" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" id="movie" name="movie" menu="false"><param name="wmode" value="Opaque"></object></div>
<!--<div class="weather"><iframe width="250" scrolling="no" height="60" frameborder="0" allowtransparency="true" src="http://i.tianqi.com/index.php?c=code&id=12&icon=1&num=1"></iframe></div>    -->    
    <div class="music">
		<h3>
		  <p>分享<span>音乐</span></p>
		</h3>
		<span style="margin-left: -10px;">
		<iframe frameborder="no" border="0" marginwidth="0" marginheight="0" width="300" height="110" src="https://music.163.com/outchain/player?type=2&amp;id=438903458&amp;auto=1&amp;height=90"></iframe>		
		</span>
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
    <h3>
      <p>最新<span>文章</span></p>
    </h3>
    <ul class="rank">
      <c:forEach var="n" items="${nArticleList}" varStatus="d">
   	<c:choose>		
		<c:when test="${d.count==1}">
            <li><a href="${blog}/articleDetail.html?id=${n.id}" title="${n.title}" style="color:red;">${n.title}</a></li>
	    </c:when>
		<c:otherwise>		
            <li><a href="${blog}/articleDetail.html?id=${n.id}" title="${n.title}" >${n.title}</a></li>
		</c:otherwise>
	</c:choose>
      </c:forEach>
     </ul>
    <h3 class="ph">
      <p>点击<span>排行</span></p>
    </h3>
    <ul class="paih">
        <c:forEach var="s" items="${sArticleList}">
      <li><a href="${blog}/articleDetail.html?id=${s.id}" title="${s.title}" >${s.title}</a></li>    
    </c:forEach>
    </ul>
    <h3 class="links">
      <p>友情<span>链接</span></p>
    </h3>
    <ul class="website">
      <li><a href="http://www.gov.cn/" target="_blank">中国政府网</a></li>
      <li><a href="http://www.amall360.com" target="_blank">A猫商城</a></li>
      <li><a href="http://218.200.143.38:8503/Index.aspx" target="_blank">枣阳房地产发布平台</a></li>
      <li><a href="http://www.ruanyifeng.com" target="_blank">阮一峰</a></li>
      <li><a href="http://www.yangqq.com" target="_blank">杨青博客</a></li>
      <li><a href="http://www.guduke.cn" target="_blank">微光博客</a></li>
      <li><a href="http://www.xiaozhanfei.com" target="_blank">肖战飞</a></li>
      <li><a href="http://www.liuyuyao.com" target="_blank">刘玉尧</a></li>
    </ul> 
    </div>  
</article>
<!-- 引入公共头部 -->
<%@include file="/jsp/common/bottom.jsp"%>
</body>
</html>