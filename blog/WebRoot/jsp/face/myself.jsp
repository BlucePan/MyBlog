<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/jsp/common/common.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>个人博客</title>
 <meta name="关键字" content="">
 <link href="${blog}/css/buju.css" rel="stylesheet">
 <link href="${blog}/css/index.css" rel="stylesheet">
 <script type="text/javascript" src="${blog}/js/jquery.min.js"></script>
 <script type="text/javascript" src="${blog}/js/sliders.js"></script>
</head>
<body>
 	<table width="80%">
 	<tr align="center">
 		<th>姓名</th>
 		<th>QQ</th>
 		<th>工作</th>	
 	</tr>
 	
 	<tr align="center">
 	<td>${user.name}</td>
 	<td>${user.qq}</td>
 	<td>${user.job}</td>
 	</tr>
 	
 	</table>
</body>
</html>