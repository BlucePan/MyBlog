<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@include file="/jsp/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no" name="viewport">
<link rel="stylesheet" type="text/css" href="${blog}/css/doumao.css" />
<link href="${blog}/js/bigimg/zoom.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="${blog}/js/change.js"></script>
</head>
<body>
<div class="maincont">
  <form name="listForm" action="" method="post">
    <div class="operation customer"> <span>账户</span>
      <input type="text" name="account" placeholder="请输入帐号" value="${param.account}"/>
      <span>姓名</span>
      <input type="text" name="name" placeholder="请输入姓名" value="${param.name}"/>
      <a href="#" class="btn goods" onclick="query()">查询</a> <a href="${blog}/role/manage/addToUser.html" class="btn goods">新增</a> </div>
  </form>
  <div class="aotable">
    <table class="table" cellpadding="0" cellspacing="0">
      <thead>
        <tr>
          <th>账户</th>
          <th>姓名</th>
          <th>创建时间</th>
          <th>登录状态</th>
          <th>操作</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="u" items="${list}">
          <tr>
          	<td>${u.account}</td>
            <td>${u.name}</td>
            <td ><fmt:parseDate value='${u.createTime}' var="yearMonth" pattern="yyyy-MM-dd HH:mm:ss"/>
              <fmt:formatDate value="${yearMonth}" pattern="yyyy-MM-dd HH:mm" /></td>
            <td>${u.status==1?'有效':'禁止'}</td>
            <td>
            <a href="${blog}/role/manage/userDetail.html?id=${u.id}" class="btn goods">查看详情</a><a href="javascript:del('${u.id}')" class="btn danger modelshow">删除</a></td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
    <div class="pagelist">
      <ul>
        ${pager}
      </ul>
    </div>
  </div>
</div>
<script src="${blog}/js/jquery-1.11.2.min.js" type="text/javascript"></script>
<script src="${blog}/js/bigimg/zoom.js" type="text/javascript"></script>
<script type="text/javascript">

    function query(){
        document.listForm.action = "${blog}/role/manage/userList.html";
		document.listForm.submit();
	}

	function yes(id) {
		$.ajax({
			async:false,
			type : "POST",
			data : {
				id : id
			},
			url : "${blog}/role/manage/delUser.html",
			success : function(data) {
				var obj = eval("("+data+")");
				if(obj.status == '100'){
				    $(".contdl dt").text("删除成功");
					$(".contdl dd").html('<a href="javascript:query()" class="btn danger close">确定</a>');
				} else {
				    $(".contdl dt").text("删除失败");
					$(".contdl dd").html('<a href="javascript:;" class="btn danger close">确定</a>');
				}

			}
		});

	}
</script>
</body>
</html>