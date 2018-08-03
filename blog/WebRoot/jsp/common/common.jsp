<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="blog" value="${pageContext.request.contextPath}" />
<c:set var="imageService" value= 'http://118.31.32.110:8080/imageService/uploadFiles/'/>
<c:set var="imageServices" value= 'http://118.31.32.110:8080/imageService/uploadBaiduFiles/'/>

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