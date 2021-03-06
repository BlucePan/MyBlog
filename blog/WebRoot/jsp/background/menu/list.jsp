<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="/jsp/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="${blog}/css/doumao.css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body>
<div class="maincont">
	<form name="listForm" action="" method="post">  
	  <div class="operation"> <span>菜单名称</span>
	    	<input type="text" name="menuName" placeholder="请输入菜单名称" value="${param.menuName}"/>
	    	<a href="#" class="btn goods" onclick="query()">查询</a> <a href="${blog}/menu/menuToAdd.html" class="btn goods">新增</a> 
	   </div>
   </form>
  <div class="aotable">
    <table class="table" cellpadding="0" cellspacing="0">
      <thead>
        <tr>
          <th>菜单名称</th>
          <th>菜单KEY</th>
          <th>菜单URL</th>
          <th>菜单类型</th>
          <th>菜单排序</th>
          <th>上级菜单</th>
          <th>菜单状态</th>
          <th>操作</th>
        </tr>
      </thead>
     
      <tbody>
       <c:forEach var="r" items="${list}">
        <tr>
          <td>${r.menuName}</td>
          <td>${r.resKey}</td>
          <td>${r.url}</td>
          <td><c:choose>
	            	<c:when test="${r.menuType=='1' }">
	            		目录
	            	</c:when>
	            	<c:when test="${r.menuType=='2' }">
	            		菜单
	            	</c:when>
	            	<c:otherwise>
	            		按钮
	            	</c:otherwise>
	            </c:choose></td>
          <td>${r.priority}</td>
          <td><c:choose>
	            	<c:when test="${r.superior=='1' }">
	            		顶级菜单
	            	</c:when>
	            	<c:otherwise>
	            		${r.superiorName}
	            	</c:otherwise>
	            </c:choose></td>
	            <td>
          <c:choose>
	            	<c:when test="${r.flag=='1' }">
	            		启用
	            	</c:when>
	            	<c:otherwise>
	            		禁用
	            	</c:otherwise>
	            </c:choose></td>
          <td>
          <a href="${blog}/menu/menuDetail.html?id=${r.id}" class="btn goods">查看详情</a>
          <a href="javascript:del('${r.id}')" class="btn danger modelshow">删除菜单</a>
          </td>
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
<script type="text/javascript">

    function query(){
        document.listForm.action = "${blog}/menu/menuList.html";
		document.listForm.submit();
	}

	function yes(id) {
		$.ajax({
			async:false,
			type : "POST",
			data : {
				id : id
			},
			url : "${blog}/menu/menuDel.html",
			dataType : 'json',
			success : function(data) {
				if (data == "success") {
				    $(".contdl dt").text("删除成功");
				    $(".contdl dd").html('<a href="javascript:query()" class="btn danger close">确定</a>');
				} else {
				    $(".contdl dt").text("删除失败,请先删除子目录");
					$(".contdl dd").html('<a href="javascript:;" class="btn danger close">确定</a>');
				}

			}
		});
 
	}
</script>
</body>
</html>