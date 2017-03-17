<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/jsp/common/common.jsp"%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>杨青个人博客网站—一个站在web前段设计之路的女技术员个人博客网站</title>
<meta name="keywords" content="个人博客,杨青个人博客,个人博客模板,杨青" />
<meta name="description" content="杨青个人博客，是一个站在web前端设计之路的女程序员个人网站，提供个人博客模板免费资源下载的个人原创网站。" />
<link href="${blog}/css/base.css" rel="stylesheet">
<link href="${blog}/css/mood.css" rel="stylesheet">
<link href="${blog}/css/sm.min.css" type="text/css" rel="stylesheet">
<script src="${blog}/js/sm.js" type="text/javascript"></script>
<!--[if lt IE 9]>
<script src="js/modernizr.js"></script>
<![endif]-->
</head>
<body>
<%@ include file="faceTop.jsp"%>
<div class="moodlist" id="page-infinite-scroll-bottom">

<!-- <div id="page-infinite-scroll-bottom" class="page">
 -->
  <h1 class="t_nav"><span>删删写写，回回忆忆，虽无法行云流水，却也可碎言碎语。</span><a href="${blog}/user/main.html" class="n1">网站首页</a><a href="${blog}/jottings/manage/faceJottingsList.html" class="n2">闲谈随笔</a></h1>
  <div class="bloglist" >
 <c:forEach var="j" items="${jList}">
 	   <ul class="arrow_box">
         <div class="sy">
      <p> ${j.context}</p>
      <span class="dateview"><fmt:parseDate value='${j.createTime}' var="yearMonth" pattern="yyyy-MM-dd "/>
              <fmt:formatDate value="${yearMonth}" pattern="yyyy-MM-dd" /></span>
        </div>
    </ul> 	
 </c:forEach>
 	
 	   		    <!-- 加载提示符 -->
	      <div class="infinite-scroll-preloader">
	        <div class="preloader"> </div>
	      </div>
	    </div>
  
  <!-- 	</div> -->
 </div>
 <!--   <div class="page"><a title="Total record"><b>41</b></a><b>1</b><a href="/news/s/index_2.html">2</a><a href="/news/s/index_2.html">&gt;</a><a href="/news/s/index_2.html">&gt;&gt;</a></div>
</div> -->
<!-- <footer>
  <p>Design by DanceSmile <a href="http://www.miitbeian.gov.cn/" target="_blank">蜀ICP备11002373号-1</a> <a href="/">网站统计</a></p>
</footer> -->

<script>
$(function () {
	alert("dadad");
'use strict';
var len=$(".wailist li").length;
if(len<3){
	$(".infinite-scroll-preloader").html("没有更多啦");
}
$(document).on("pageInit", "#page-infinite-scroll-bottom", function(e, id, page) {

    var loading = false;
    // 每次加载添加多少条目
    var itemsPerLoad = 10;
    // 最多可加载的条目
    var maxItems = ${count};
    var lastIndex = $('.bloglist ul').length;
    if (lastIndex >= maxItems) {
        // 加载完毕，则注销无限加载事件，以防不必要的加载
        $.detachInfiniteScroll($('.infinite-scroll'));
        // 删除加载提示符
        $('.infinite-scroll-preloader').remove();
        return;
      }
    function addItems(number, lastIndex) {
    	// 生成新条目的HTML
      var html = '';
      var page = $('#nextPage').val();
	      $.ajax({
	    		type : "POST",
	    		data:{start:lastIndex,max:itemsPerLoad},
	    		url: "${blog}/jottings/manage/queryMyIntegralRecord.html",
	    		async:false,
	    		success: function(data){
	    			var obj = eval("("+data+")");
	    			$('#nextPage').val(obj.nextPage);
	    			for(var i=0;i<obj.list.length;i++){
	    			    html+='<ul class="arrow_box"><div class="sy">';                        
                        html+=' <p>'+obj.list[i].context+'</p></div></ul>';

	    			}
	    		  }
	    	});   

     for (var i = lastIndex + 1; i <= lastIndex + number; i++) {
       html += '<li class="item-content"><div class="item-inner"><div class="item-title">新条目</div></div></li>';
     }
      // 添加新条目
      $('.bloglist ul').append(html);
    }
    $(page).on('infinite', function() {
      // 如果正在加载，则退出
      if (loading) return;
      // 设置flag
      loading = true;
      // 模拟1s的加载过程
      setTimeout(function() {
        // 重置加载flag
        loading = false;
        if (lastIndex >= maxItems) {
          // 加载完毕，则注销无限加载事件，以防不必要的加载
          $.detachInfiniteScroll($('.infinite-scroll'));
          // 删除加载提示符
          $('.infinite-scroll-preloader').remove();
          return;
        }
        addItems(itemsPerLoad,lastIndex);
        // 更新最后加载的序号
        lastIndex = $('.list-container li').length;
        $.refreshScroller();
      }, 1000);
    });
  });
$.init();
});
</script>


<script src="${blog}/js/silder.js"></script>
</body>
</html>