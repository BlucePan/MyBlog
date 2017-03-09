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
      <input type="text" name="title" placeholder="请输入标题" value="${param.title}"/>
      
          <div class="sel_wrap">        
         <label>请选择类型</label>
       <select class="form-control">
            <c:forEach var="a" items="${articleTypeList}">
   			<option >${a.articleName}</option>
   			</c:forEach>
    </select>
    <select id="type" name="type" class="form-control">
   			<option  value="">请选择类型</option>
   			 <c:forEach var="a" items="${articleTypeList}">
   			<option  value="${a.id}"  <c:if test="${param.type==a.id}"> selected="selected" </c:if>>${a.articleName}</option>
   			</c:forEach>
   	</select>
  </div>
      
      
      <a href="#" class="btn goods" onclick="query()">查询</a> <a href="${blog}/article/addToArticle.html" class="btn goods">新增</a> </div>
  </form>
  <div class="aotable">
    <table class="table" cellpadding="0" cellspacing="0">
      <thead>
        <tr>
          <th>知识标题</th>
          <th>创建时间</th>
          <th>预览图</th>
          <th>所属类型</th>
          <th>发布人</th>
          <th>操作</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="r" items="${list}">
          <tr>
            <td>${r.title}</td>
            <td ><fmt:parseDate value='${r.createTime}' var="yearMonth" pattern="yyyy-MM-dd HH:mm:ss"/>
              <fmt:formatDate value="${yearMonth}" pattern="yyyy-MM-dd HH:mm" /></td>
            <td><div class="gallery">
                <ul>
                  <c:if test="${not empty r.image}">
                    <c:forEach items="${fn:split(r.image,',')}"  var="ig">
                      <li><a href="/imageService/uploadFiles/${ig}"><img src="/imageService/uploadFiles/${ig}"/></a></li>
                    </c:forEach>
                  </c:if>
                </ul>
              </div></td>
            <td>${r.articleName}</td>
            <td>${r.createUser}</td>
            <td>
            <c:choose>
            <c:when test="${r.top == 1}"><a href="${blog}/article/delTopArticle.html?id=${r.id}" class="btn goods">取消置顶</a></c:when>
            <c:otherwise><a href="${blog}/article/editTopArticle.html?id=${r.id}" class="btn goods">设为置顶</a></c:otherwise>
            </c:choose>
            <a href="${blog}/article/articleDetail.html?id=${r.id}" class="btn goods">查看详情</a> <a href="javascript:del('${r.id}')" class="btn danger modelshow">删除</a></td>
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
        document.listForm.action = "${blog}/article/articleList.html";
		document.listForm.submit();
	}

	function yes(id) {
		$.ajax({
			async:false,
			type : "POST",
			data : {
				id : id
			},
			url : "${blog}/article/delArticle.html",
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