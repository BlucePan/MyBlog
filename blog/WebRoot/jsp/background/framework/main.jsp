<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>OA管理系统</title>
<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath }/css/doumao.css" />
<!-- <style>
frame,iframe,frameset{ border:0;}
</style> -->
</head>

<%-- <frameset rows="60,*" cols="" framespacing="0" frameborder="no" border="0">
  <frame src="${pageContext.servletContext.contextPath }/small/top.html" name="topFrame" scrolling="no" frameborder="no" border="0" noresize="noresize" id="topFrame" />
  <frame src="${pageContext.servletContext.contextPath }/small/center.html" name="mainFrame"  frameborder="no" border="0" id="mainFrame" />
</frameset>
<noframes><body>
</body>
</noframes> --%>

<body>
<iframe src="${pageContext.servletContext.contextPath }/user/left.html" id="left" frameborder="0"></iframe>
<iframe src="${pageContext.servletContext.contextPath }/user/top.html" id="toper" frameborder="0"></iframe>
<iframe src="${pageContext.servletContext.contextPath }/user/tab.html" id="maincont" frameborder="0" name="rights"></iframe>
</body>

</html>