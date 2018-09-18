<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="/jsp/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="${blog}/css/doumao.css" />
	<script type="text/javascript" charset="utf-8" src="${blog}/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="${blog}/ueditor/ueditor.all.js"> </script>
    <script type="text/javascript" charset="utf-8" src="${blog}/ueditor/lang/zh-cn/zh-cn.js"></script>
    <link rel="stylesheet" href="${blog}/ueditor/themes/default/css/ueditor.css"/>
    <link href="${blog}/js/bigimg/zoom.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="${blog}/zyupload/skins/zyupload-1.0.0.min.css" />
    <script src="${blog}/js/change.js" type="text/javascript"></script>
        <style type="text/css">
		/*删除图片css*/
	.nowImg{ width:200px; position: relative; float:left; margin-right:15px;}
	.tupics{width:100%;}
	.now_bar{ width:100%; height:25px; line-height:25px; background: rgba(0,0,0,0.6); color:#fff;}
	.now_bar .file_name{ padding-left:5px;}
	</style>
</head>
<body>
<div class="wxts">
  <span>温馨提示：</span>
  <span>
	 <ul>
	 	<li>编辑器里请勿上传Word、Excel、PPT、PDF等附件</li>
	 </ul>
</span>
</div>

<form action="${blog}/article/manage/articleUpdate.html" name="listForm" method="post" >
<input type="hidden" name="id" value="${article.id}"/>
<div class="maincont othercolor">
  <div class="addmenu">
    <h2 class="addh2">修改行业知识</h2>
    <div class="add_meunlist">
      <ul>
        <li><span>标题：</span>
          <input type="text" placeholder="" name="title" id="title" value="${article.title}"/>
          <p class="error">* 标题不能为空</p>
        </li>
			 <li><span>文章类型：</span>
		   <select id="type" name="type" style="width: 150px;height: 34px;padding-left: 3px;font-size: 15px;" onchange="selectTypeByCode(this.value)">
		  			<option  value="">请选择类型</option>
		   </select>		  	
		   <select id="catCode" name="catCode" style="width: 150px;height: 34px;padding-left: 3px;font-size: 15px;">
		  			<option  value="">请选择二级类型</option>
		   </select>
		 </li>
        <li><span>文章标签：</span>
		        <div class="sel_wrap">        
		        <label>请选择类型</label>
		    <select id="label" name="label" class="form-control">
		  			<option  value="">请选择标签</option>
		  			 <c:forEach var="a" items="${labelList}">
		  			<option  value="${a.id}"  <c:if test="${article.label==a.id}"> selected="selected" </c:if>>${a.name}</option>
		  			</c:forEach>
		  	</select>
		 </div></li>
            <li><span>菜单图片：</span>
        	<c:if test="${not empty article.image}">
        		<div class="nowImg">
		        <div class="now_bar">				
			        <p class="file_name" title="${article.image}">${article.image}</p>
			        <span class="file_del" data-index="0" title="删除"></span>	
		        </div>
		        	<img src="/imageService/uploadFiles/${article.image}" id="${article.image}" class="tupics" />
		    </div>
        	</c:if>
             <div id="zyupload" class="zyupload"></div>
            <input type="hidden" id="image" name="image" value="${article.image}"> 
        </li>
          <li><span>关键字：</span>
         <input type="text"  name="keyWord" id="keyWord" value="${article.keyWord}"/>
        </li>
        <li><span>摘要：</span>
          <textarea cols="10" name="remake" id ="remake">${article.remake}</textarea>
        </li>
        <li><span>内容：</span>
        	<textarea style="width:90%;height:300px;" name="context" id ="workstatus">${article.context}</textarea>
          	<script type="text/javascript">
	        var editor = UE.getEditor('workstatus');
	    	</script>
        </li>
        <li class="last-up">
        <a href="javascript:document.listForm.submit()" onclick="return verifyDate()" class="btn goods">保存</a>
        <a href="${blog}/article/manage/articleList.html" class="btn danger">返回列表</a></li>
      </ul>
    </div>
  </div>
</div>
<script src="${blog}/js/jquery-1.11.2.min.js" type="text/javascript"></script>
<script src="${blog}/js/bigimg/zoom.js" type="text/javascript"></script>
<script type="text/javascript" src="${blog}/zyupload/zyupload.basic-1.0.0.min.js"></script>
<script type="text/javascript">
$(function(){
	selectType();
	var catCode = '${article.catCode}';
	console.log(catCode);
	var parent = catCode.substring(0,7) ;
	console.log(parent);
	selectTypeByCode(parent);
	$("#type option[value='"+parent+"']").prop("selected", "selected");
	$("#catCode option[value='"+catCode+"']").prop("selected", "selected");
});

//加载一级类目
function selectType(){
		$.ajax({
		async:false,
		type : "POST",
		url: "${blog}/voice/manage/selectType.html",
		dataType:'json',
     		success: function(data){
     			for(var i=0;i<data.length;i++){
     				$("<option value='"+data[i].catCode+"'>"
     				+data[i].articleName+"</option>").appendTo($("#type"));
     			}
     		}
	});
}
function selectTypeByCode(parentCode){
	$("#catCode").html("");
	$("<option>请选择二级类型</option>").appendTo($("#catCode"));
	$.ajax({
		async:false,
		type : "POST",
		data:{catCode:parentCode},
		url: "${blog}/voice/manage/selectType.html",
		dataType:'json',
      		success: function(data){
      			for(var i=0;i<data.length;i++){
     				$("<option value='"+data[i].catCode+"'>"
     				+data[i].articleName+"</option>").appendTo($("#catCode"));
     			}
      		}
	});
}



	    $(function () {       
         //删除原图
         if($('#image').val()!=''){
	         	$(".zyupload").hide();
	            $(".now_bar span").on("click",function(){
	         	  var tuname=$(this).parents(".nowImg").find(".tupics").attr("id");
	         	  $.ajax({
			      		type : "POST",
			      		data:{imgUrl:tuname},
			      		url: "${blog}/upload/deleteFile.html",
			      		dataType:'json',
			      		success: function(data){
			      			if(data=="success"){
			      				$("#image").val("");
			      			}else{
			      				alert("删除失败");
			      				$("#image").val("");
			      			}
			      			
			       		}
	      		  }); 
	         	  
	              $(this).parents(".nowImg").hide();
	              $(".zyupload").show();
	         });
         }else{
         	$(".zyupload").show();
         }
		 
    }); 	
	    	
	    	
//表单验证
function verifyDate(){
    if($("#title").val()=="" || $("#title").val()==null){
	    $("#title").parents("li").find(".error").text("* 标题不能为空");
		$("#title").focus();
		return false;  	
	}	
	else{
	    $("#title").parents("li").find(".error").text("");	
	}
 
}
</script>
<script type="text/javascript">
var arr = new Array();
$(function(){
	// 初始化插件
	$("#zyupload").zyUpload({
		width            :   "700px",
		height           :   "auto",
		itemWidth        :   "120px",
		itemHeight       :   "100px",
		url              :   "${blog}/UploadUtil",
		fileType         :   ["jpg","png","gif","jpeg"],
		fileSize         :   51200000,
		multiple         :   false,
		dragDrop         :   false,
		tailor           :   false,
		del              :   true,
		finishDel        :   false,
		/* 外部获得的回调接口 */
					onSelect: function(selectFiles, allFiles){
						console.info("当前选择了以下文件：");
						console.info(selectFiles);
						document.getElementById('rapidAddImg').style.display='none';
						document.querySelector(".webuploader_pick").style.display='none';
					},
					onDelete: function(file, files){
						console.info("当前删除了此文件：");
						console.info(file.name);
						document.getElementById('rapidAddImg').style.display='';
						document.querySelector(".webuploader_pick").style.display='';						
/* 						$("#uploadInf").append("<p>当前删除了此文件：" + file.index+ "</p>"); */
					},
					onSuccess: function(file, response){
						console.info("此文件上传成功：");
						console.info(file.name);
						console.info("此文件上传到服务器地址：");
						console.info(response);
						$("#uploadInf").append("<p>上传成功，文件地址是：" + response + "</p>");
						arr.push(response);
						document.getElementById('image').value=arr;
						alert(document.getElementById('images').value);
						document.getElementById('rapidAddImg').style.display='none';
						document.querySelector(".webuploader_pick").style.display='none';
					},
					onFailure: function(file, response){
						console.info("此文件上传失败：");
						console.info(file.name);
					},
					onComplete: function(response){
						console.info("文件上传完成");
						console.info(response);
					}
				});
				
			});

</script>
</form> 
</body>
</html>