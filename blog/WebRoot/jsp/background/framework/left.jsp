<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/jsp/common/common.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link rel="stylesheet" type="text/css" href="${blog}/css/doumao.css" />
<script type="text/javascript">
$(function(){
    $(".meun li").on("click",function(){
	    $(this).addClass("thisclass").siblings().removeClass("thisclass");	
		$(this).parents("ul").siblings().find("li").removeClass("thisclass");
	}); 	
});
</script>
<script type="text/javascript" src="${blog}/js/change.js"></script>
</head>

<body>

<div class="m-left">
  <div class="logo"></div>
  <div class="meun">
	  <c:forEach items="${list}" var="key" varStatus="stut">
	  		<c:if test="${key.menuType=='1'}">
	  			<h2 class="me-one"><span>${key.menuName}</span></h2>
	    <ul id='child${stut.index}' >
	    	<c:forEach items="${list}" var="k">
	    		<c:if test="${k.superior == key.id}">
	      			<li><a href="${blog}${k.url}" target="rights">${k.menuName}</a></li>
	      		</c:if>
	      	</c:forEach>	
	    </ul>
   </c:if>
     </c:forEach>
  </div>
</div>
</body>
</html>
