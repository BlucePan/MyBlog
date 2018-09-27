<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="blog" value="${pageContext.request.contextPath}" />
<c:set var="imageService" value= 'https://www.blucepan.top/imageService/uploadFiles'/>
<c:set var="imageServices" value= 'https://www.blucepan.top/imageService/uploadBaiduFiles'/>
<link href="${blog}/zepto/mdialog.css" type="text/css" rel="stylesheet" />
<script type='text/javascript' src="${blog}/zepto/zepto.min.js"></script>
<script type='text/javascript' src="${blog}/zepto/mdialog.js"></script>
<script type="text/javascript" src="${blog}/js/jquery-1.11.2.min.js"></script>
<!--删除框操作-->
<div class="model"></div>
<div class="modelcont">
  <dl class="contdl">
    <dt></dt>
    <dd></dd>
  </dl>
</div>
<script type="text/javascript">
function del(id){
     	$(".model,.modelcont").show();
     	$(".contdl dt").text("确定要删除吗？");
		$(".contdl dd").html('<a href="javascript:yes();" class="btn goods">确定</a><a href="javascript:;" class="btn danger close">取消</a>');
     	$(".modelcont .goods").attr("href","javascript:yes('"+id+"')");
}
$("body").on("click",".close,.model",function(){
        $(".model,.modelcont").hide();	
});
</script>
<script type="text/javascript"> 
/* 鼠标特效 */
/* var a_idx = 0; 
jQuery(document).ready(function($) { 
    $("body").click(function(e) { 
        var a = new Array("富强", "民主", "文明", "和谐", "自由", "平等", "公正" ,"法治", "爱国", "敬业", "诚信", "友善"); 
        var $i = $("<span/>").text(a[a_idx]); 
        a_idx = (a_idx + 1) % a.length; 
        var x = e.pageX, 
        y = e.pageY; 
        $i.css({ 
            "z-index": 999999999999999999999999999999999999999999999999999999999999999999999, 
            "top": y - 20, 
            "left": x, 
            "position": "absolute", 
            "font-weight": "bold", 
            "color": "#ff6651" 
        }); 
        $("body").append($i); 
        $i.animate({ 
            "top": y - 180, 
            "opacity": 0 
        }, 
        1500, 
        function() { 
            $i.remove(); 
        }); 
    }); 
});  */
</script>