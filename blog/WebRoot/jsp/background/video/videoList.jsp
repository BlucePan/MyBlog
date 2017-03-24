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
    <script type="text/javascript" src="${blog}/js/My97DatePicker/WdatePicker.js"></script>
</head>
<body>
<div class="maincont">
  <form name="listForm" action="" method="post">
       <div class="operation customer"> <span>标题</span>
      <input type="text" name="title" placeholder="请输入标题" value="${param.title}"/>     
        <span>发布类型</span>
       <div class="sel_wrap">
       	<label>请选择</label>
         <select name="isPublish" class="form-control">
          <option value="" >请选择</option>
          <option value="1" <c:if test="${param.isPublish=='1' }"> selected="selected" </c:if> >已发布</option>
          <option value="0" <c:if test="${param.isPublish=='0' }"> selected="selected" </c:if> >未发布</option>
        </select>
       </div>
    <a href="#" class="btn goods" onclick="query()">查询</a> <a href="${blog}/voice/manage/videoToAdd.html" class="btn goods">新增</a> </div>
  </form>
  <div class="aotable">
    <table class="table" cellpadding="0" cellspacing="0">
      <thead>
        <tr>
          <th>视频标题</th>
          <th>创建时间</th>
          <th>封面图片</th>
          <th>发布人</th>
          <th>是否发布</th>
          <th>操作</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="v" items="${list}">
          <tr>
               <td>${v.title}</td>                
            <td ><fmt:parseDate value='${v.createTime}' var="yearMonth" pattern="yyyy-MM-dd HH:mm:ss"/>
              <fmt:formatDate value="${yearMonth}" pattern="yyyy-MM-dd HH:mm" /></td>
            <td><div class="gallery">
                <ul>
                  <c:if test="${not empty v.image}">
                    <c:forEach items="${fn:split(v.image,',')}"  var="ig">
                      <li><a href="/imageService/uploadFiles/${ig}"><img src="/imageService/uploadFiles/${ig}"/></a></li>
                    </c:forEach>
                  </c:if>
                </ul>
              </div></td>
            <td>${v.createUser}</td>
            <c:if test="${v.isPublish=='1'}">
             <td>已发布</td>
            </c:if>
            <c:if test="${v.isPublish=='0'}">
             <td>未发布</td>
            </c:if>
            <td>
            <a href="${blog}/voice/manage/videoDetail.html?id=${v.id}" class="btn goods">查看详情</a>
            <c:if test="${v.isPublish=='0'}">
       			   	<a href="javascript:changeStatus('${v.id}','1')" class="btn danger modelshow">发布</a>
            		<a href="javascript:del('${v.id}')" class="btn danger modelshow">删除</a>
         	   	</c:if>
            	<c:if test="${v.isPublish=='1'}">
       			   	<a href="javascript:changeStatus('${v.id}','0')" class="btn danger modelshow">取消发布</a>
            	</c:if>           
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
<script src="${blog}/js/jquery-1.11.2.min.js" type="text/javascript"></script>
<script src="${blog}/js/bigimg/zoom.js" type="text/javascript"></script>
<script type="text/javascript">

    function query(){
        document.listForm.action = "${blog}/voice/manage/videoList.html";
		document.listForm.submit();
	}

	function yes(id) {
		$.ajax({
			async:false,
			type : "POST",
			data : {
				id : id
			},
			url : "${blog}/voice/manage/delVideo.html",
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
	
	    
    function changeStatus(id,value) {
    	$.ajax({
    		type : "POST",
    		data: "id="+id+"&isPublish="+value,
    		url: "${blog}/voice/manage/editVideoStatus.html",
    		dataType:'json',
    		success: function(data){
    			if(data=="success"){
    				window.location.reload(true); 
    			}else{
    				 alert("更新失败");
    			}
    	      			
    		  }
    	});   

    	}
</script>
</body>
</html>