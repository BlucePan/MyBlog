<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/jsp/common/common.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link rel="stylesheet" type="text/css" href="${blog}/css/doumao.css" />
</head>

<body>
<div class='hellos'>
  <p>尊敬的：<span>${sessionScope.user.name}</span>您好！！！！ 欢迎进入blog后台管理系统</p>
</div>
<div class="tiaochuan">
  <div class="tc-title">
    <h3>待办事项</h3>
    <span class="anniu">-</span></div>
  <ul>  
    <li><span>·</span><a href="#">全民经济人当月注册人数</a></li>
    <li><span>·</span><a href="#">家装设计师当月注册人数</a></li>
    <li><span>·</span><a href="#">客户当月的注册人数</a></li>
 </ul>
</div>
<script type="text/javascript">
		function qi(){
		    var kuan=$(".tiaochuan");
			kuan.animate({"bottom":"10px"},1000)	
		}
		$(".anniu").on("click",function(){
			var ut=$(".tiaochuan ul");
			if(ut.is(":hidden")){
			     ut.show();
				 $(".tiaochuan").stop(true.false).animate({"height":150},300);
				 $(this).text("-")
			}
			else{
			     ut.hide();	
				 $(".tiaochuan").stop(true.false).animate({"height":32},300);
				 $(this).text("+")
			}
		})
		qi()
	</script>
</body>
</html>
