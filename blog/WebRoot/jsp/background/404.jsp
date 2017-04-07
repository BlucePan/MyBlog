<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>Exception!</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<style>
 *{ padding:0; margin:0;}
 .contation{ width:100%; margin-top:20%;}
 .contation img{ margin:0 auto; display:block;}
 .contation p{ text-align:center; color:#7b8c9d; font-size:1.2em; line-height:30px; margin:10px 0;}
 .contation p a {text-decoration: none;color: #7b8c9d;background: #eee;padding: 5px 10px;border-radius: 5px;}
</style>
</head>
<body>
	<div class="contation">
		<img src="${pageContext.request.contextPath}/img/404.jpg" alt="" />
		<p>对不起! 请求异常，请联系管理员!</p>
		<p><a href="javascript:history.go(-1);" class="history">点击返回</a></p>
	</div>
</body>
</html>