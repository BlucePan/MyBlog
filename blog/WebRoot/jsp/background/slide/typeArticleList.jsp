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
<style type="text/css">    
.label{ width:100%; height:100%; top:0; left:0; z-index:11; position:fixed; background:#000; opacity:0.4; filter:alpha(opacity=40); display:none;}
.modelLabel{ width:400px; background:#fff; border-radius:4px; z-index:12; padding:20px; position:fixed; display:none; top:50%; left:50%; margin-left:-200px; margin-top:-150px;}
.modelLabel a{ margin:0 5px;}
.zhuan{ overflow:hidden; margin-bottom:15px; line-height:36px; }
.zhuan span{ float:left; line-height:36px; padding-right:5px; font-size:14px; padding-left:5px; width:95px;}
.zhuan input{ width:260px; padding:10px; float:left;}
.ts-z{ color:#f00; padding-left:95px;}
.modelLabel .qcs{ padding-bottom:15px; text-align:center; font-size:14px;}
</style>
</head>
<body>
<div class="maincont">
  <form name="listForm" action="" method="post">
       <div class="operation customer"> <span>标题</span>
      <input type="text" name="name" placeholder="请输入标题" value="${param.name}"/>     
       <%--  <span>发布类型</span>
       <div class="sel_wrap">
       	<label>请选择</label>
         <select name="isPublish" class="form-control">
          <option value="" >请选择</option>
          <option value="1" <c:if test="${param.isPublish=='1' }"> selected="selected" </c:if> >已发布</option>
          <option value="0" <c:if test="${param.isPublish=='0' }"> selected="selected" </c:if> >未发布</option>
        </select>
       </div> --%>
       <a href="#" class="btn goods" onclick="query()">查询</a> <a href="javascript:;" id="addLabel" class="btn goods">新增</a><a href="${blog}/voice/manage/typeList.html"  class="btn danger modelshow" style="float:right;">返回</a></div> 
  </form>
  <div class="aotable">
    <table class="table" cellpadding="0" cellspacing="0">
      <thead>
        <tr>
          <th>类目名称</th>
          <th>类目code</th>
          <th>父类名称</th>
          <th>创建时间</th>
          <th>操作</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="v" items="${list}">
          <tr>
               <td>${v.articleName}</td>      
               <td>${v.catCode}</td>      
               <td>${parentName}</td>       
            <td ><fmt:parseDate value='${v.createTime}' var="yearMonth" pattern="yyyy-MM-dd HH:mm:ss"/>
              <fmt:formatDate value="${yearMonth}" pattern="yyyy-MM-dd HH:mm" /></td>           
            <td>
            <a href="javascript:labelUpdate('${v.id}','${v.articleName}','${v.catCode}')" class="btn goods">修改</a>
            <a href="javascript:del('${v.id}')" class="btn danger modelshow">删除</a>
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
<!-- 弹出框 -->
<div class="label"></div>
<div class="modelLabel" style="display: none;">
 <form id="labelForm"  name="labelForm" action=""  method="post">
    <input type="hidden" name="type" value="2">
    <input type="hidden" name="parentCode" value="${parentCode}">
    <input type="hidden" name="parentName" value="${parentName}">
    <input type="hidden" id="id" name="id" value="">
   <div class="zhuan"><span>类别名称：</span>
   <input type="text" id="articleName" name="articleName" value=""></div>   
   <p class="text-align">
      <a href="javascript:addLabel();" class="btn goods yesa" id="tj">提交</a>
      <a style="display:none;" href="javascript:updateLabel();" class="btn goods yesa" id="xg">修改</a>
      <a href="javascript:quXiao();" class="btn danger close" >取消</a>
   </p>
  </form>
</div>
<script src="${blog}/js/jquery-1.11.2.min.js" type="text/javascript"></script>
<script src="${blog}/js/bigimg/zoom.js" type="text/javascript"></script>
<script type="text/javascript">

    function query(){
        document.listForm.action = "${blog}/voice/manage/typeArticleList.html?parentCode=${parentCode}&parentName=${parentName}";
		document.listForm.submit();
	}

	function yes(id) {
		$.ajax({
			async:false,
			type : "POST",
			data : {
				id : id
			},
			url : "${blog}/voice/manage/delType.html",
			dataType : 'json',
			success : function(data) {	
				if (data == "success") {
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
    
    
    $('#addLabel').click(function(){
    	//   $(".model,.modelcont").show();
    	console.log(11)
        $(".label,.modelLabel").toggle();
        $("#id").val("");
		$("#articleName").val("");
		$("#catCode").val("");
    })
    
	 function labelUpdate(id,name,catCode){
		$("#id").val(id);
		$("#articleName").val(name);
		$(".label,.modelLabel").toggle();
		$("#tj").css('display','none');
		$("#xg").css('display','inline-block');
	}   
    
    function quXiao(){
		$(".label,.modelLabel").css('display','none');
	} 
    
    
   	function addLabel(){
	var title=$("#articleName").val();
	if(title == "" || title == undefined || title == null){
		alert("请输入类别名称");
		$("#articleName").focus();
		return ;
	}
	 document.labelForm.action = "${blog}/voice/manage/typeAdd.html";
	 document.labelForm.submit();
}
   	function updateLabel(){
   		var title=$("#articleName").val();
   		if(title == "" || title == undefined || title == null){
   			alert("请输入类别名称");
   			$("#articleName").focus();
   			return ;
   		}
   		 document.labelForm.action = "${blog}/voice/manage/typeUpdate.html";
   		 document.labelForm.submit();
   	}
    
</script>
</body>
</html>