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
    <div class="operation customer"> <span>标题</span>
      <input type="text" name="name" placeholder="请输入标题" value="${param.name}"/>
      <a href="#" class="btn goods" onclick="query()">查询</a> <a href="${blog}/role/manage/addToRole.html" class="btn goods">新增</a> </div>
  </form>
  <div class="aotable">
    <table class="table" cellpadding="0" cellspacing="0">
      <thead>
        <tr>
          <th>角色名称</th>
          <th>创建时间</th>
          <th>创建者</th>
          <th>操作</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="r" items="${list}">
          <tr>
            <td>${r.name}</td>
            <td ><fmt:parseDate value='${r.createTime}' var="yearMonth" pattern="yyyy-MM-dd HH:mm:ss"/>
              <fmt:formatDate value="${yearMonth}" pattern="yyyy-MM-dd HH:mm" /></td>
            <td>${r.createUser}</td>
            <td>
            <a href="${blog}/role/manage/roleDetail.html?id=${r.id}" class="btn goods">查看详情</a> <a href="javascript:permissio('${r.id}')" class="btn nodel sc">分配权限</a> <a href="javascript:del('${r.id}')" class="btn danger modelshow">删除</a></td>
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
        document.listForm.action = "${blog}/role/manage/roleList.html";
		document.listForm.submit();
	}

	function yes(id) {
		$.ajax({
			async:false,
			type : "POST",
			data : {
				id : id
			},
			url : "${blog}/role/manage/delRole.html",
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
	
	function permissio(id){
	 var url = "${blog}/role/manage/permissioRole.html?roleId="+id;
	 var h_sp1 = 400;
	 var w_sp1 = 350; 

	//兼容IE，firefox,google.模态窗口居中问题
	 var iTop2 = (window.screen.availHeight - 20 - h_sp1) / 2;
	 var iLeft2 = (window.screen.availWidth - 10 - w_sp1) / 2;
	 var params = 'menubar:no;dialogHeight=' + h_sp1 + 'px;dialogWidth=' + w_sp1 + 'px;dialogLeft=' + iLeft2 + 'px;dialogTop=' + iTop2 + 'px;resizable=yes;scrollbars=0;resizeable=0;center=yes;location:no;status:no;scroll:no'
	 if(navigator.userAgent.indexOf("Chrome") >0 ){
	 	var top = 200;
	 	var winOption = 'height='+h_sp1+'px,width='+w_sp1+'px,top='+top+'px,left='+iLeft2+'px,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,fullscreen=0';
	 	return  window.open(url,window, winOption);
	 }else{
	 	window.showModalDialog(url, window, params);
	 }
	 
}
</script>
</body>
</html>