<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/jsp/common/common.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>无标题文档</title>
<link rel="stylesheet" type="text/css" href="${blog}/css/doumao.css" />
<!-- <style>
*{padding:0; margin:0}
body{background: #3D346F; color:#fff; font-family: "微软雅黑";   font-size:12px; }
</style> -->
<script type="text/javascript"> 
function exitSystem(){ 
	//必须让frame的父级元素去请求控制器,不然会显示出左侧栏和中间栏
	window.parent.location.href="${blog}/menu/clearManage.html"; 
} 
</script>

</head>

<body >
<%-- <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
        <td align="right" style="font-size:12px; padding:10px; letter-spacing: 1px;"> 欢迎您:${user_manage.name}
        <a href="" onclick="exitSystem();"  title="退出系统" style="background:#fff ">[退出]</a></td>
  </tr>
</table> --%>
<div class="toper">
  <p class="topleft">您好，<span>${user_manage.name}</span>，欢迎使用盘子后台管理系统。</p>
  <p class="topright"><a href="" onclick="exitSystem();">[退出]</a></p>
</div>
</body>
</html>