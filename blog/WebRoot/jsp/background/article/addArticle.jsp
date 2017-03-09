<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="/jsp/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="${blog}/css/doumao.css" />
    <script src="${blog}/js/change.js" type="text/javascript"></script>
	<script type="text/javascript" charset="utf-8" src="${blog}/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="${blog}/ueditor/ueditor.all.js"> </script>
    <script type="text/javascript" charset="utf-8" src="${blog}/ueditor/lang/zh-cn/zh-cn.js"></script>
    <link rel="stylesheet" href="${blog}/ueditor/themes/default/css/ueditor.css"/>
    <script type="text/javascript" src="${blog}/zyupload/zyupload.basic-1.0.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="${blog}/zyupload/skins/zyupload-1.0.0.min.css" />
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

<form action="${blog}/article/addArticle.html" name="listForm" method="post" >
<div class="maincont othercolor">
  <div class="addmenu">
    <h2 class="addh2">新增博格文章</h2>
    <div class="add_meunlist">
      <ul>
        <li><span>标题：</span>
          <input type="text" placeholder="" name="title" id="title" />
          <p class="error">* 标题不能为空</p>
        </li>
 		  <li><span>文章类型：</span>
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
  </div></li>
        <li><span>图片：</span>
          <div id="picup" class="zyupload"></div><input type="hidden" id="image" name="image"/>
          <input type="hidden" id="img" name="img" value=""/>
        </li>
        <li><span>摘要：</span>
          <textarea cols="10" name="remake" id ="remake"></textarea>
        </li>
        <li><span>内容：</span>
        	<textarea style="width:90%;height:300px;" name="context" id ="workstatus"></textarea>
          	<script type="text/javascript">
	        var editor = UE.getEditor('workstatus');
	    	</script>
        </li>
        <li class="last-up">
        <a href="javascript:document.listForm.submit()" onclick="return verifyDate()" class="btn goods">保存</a>
        <a href="${blog}/article/knowledgeList.html" class="btn danger">返回列表</a></li>
      </ul>
    </div>
  </div>
</div>
<script type="text/javascript">
//表单验证
function verifyDate(){
	var img = $('#image').val();
	if(img != ""){
		$('#img').val(img);
	}
    if($("#title").val()=="" || $("#title").val()==null){
	    $("#title").parents("li").find(".error").text("* 标题不能为空");
		$("#title").focus();
		return false;  	
	}	
	else{
	    $("#title").parents("li").find(".error").text("");	
	}
}

$(function(){
	// 初始化插件
var arr = new Array();
$("#picup").zyUpload({
					width            :   "450px",
					height           :   "auto",
					itemWidth        :   "140px",
					itemHeight       :   "115px",
					url              :   "${blog}/UploadUtil",
					fileType         :   ["jpg","png","gif","jpeg"],
					fileSize         :   51200000,
					multiple         :   true,
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