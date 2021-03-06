<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="/jsp/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

 	<link rel="stylesheet" type="text/css" href="${blog}/css/doumao.css" />
 	<link rel="stylesheet" type="text/css" href="${blog}/zyupload/skins/zyupload-1.0.0.min.css" />
    <script type="text/javascript" src="${blog}/zyupload/zyupload.basic-1.0.0.min.js"></script>
    
    <script type="text/javascript" src="${blog}/js/change.js"></script>

</head>
<body>
<form action="${blog}/menu/menuAdd.html" name="listForm" method="post" >
<div class="maincont othercolor">
  <div class="addmenu">
    <h2 class="addh2">新增菜单</h2>
    <div class="add_meunlist">
      <ul>
        <li><span>菜单名称：</span>
          <input type="text" placeholder="" name="menuName" id="menuName" />
          <p class="error">* 菜单名称不能为空</p>
        </li>
        <li><span>菜单KEY：</span>
          <input type="text" placeholder="" name="resKey" id="resKey" />
        </li>
        <li><span>菜单URL：</span>
          <input type="text" placeholder="" id="url" name="url"/>
        </li>
        <li><span>菜单类型：</span>
          <div class="sel_wrap" id="menutype">
          <label>目录</label>
           <select class="form-control">
	           <option value="1" selected="selected">目录</option>
	           <option value="2">菜单</option>
	           <option value="3">按钮</option>
       	   </select>
          </div>
        </li>
        <li><span>菜单排序：</span>
          <input type="text" placeholder="" id="priority" name="priority" />
          <p class="error">* 菜单排序不能为空</p>
        </li>
        <li><span>上级菜单：</span>
          <div class="sel_wrap" id="superior">
           <label>顶级菜单</label>
           <select class="form-control">
           <option value="1" selected="selected">顶级菜单</option>
           <c:forEach var="m" items="${list}">
           		<option value="${m.id}">${m.menuName}</option>
           </c:forEach>
       	 </select>
          </div>
        </li>
        <li><span>是否公共菜单：</span>
          <div class="sel_wrap" id="iScommon">
            <label>是</label>
            <select class="form-control">
           <option value="yes" selected="selected">是</option>
           <option value="no">否</option>
            </select>
          </div>
        </li>
        <li><span>是否启用：</span>
          <div class="sel_wrap" id="flag">
            <label>请选择</label>
            <select class="form-control">
 				<option value="1" selected="selected">是</option>
           		<option value="2">否</option>
            </select>
          </div>
        </li>
        <li><span>菜单图片：</span>
             <div id="zyupload" class="zyupload"></div>
            <input type="hidden" id="images" name="images"> 
        </li>
        <li><span>菜单描述：</span>
          <input type="text" placeholder="" id="remake" name="remake"/>
        </li>
        <li class="last-up">
        <a href="javascript:document.listForm.submit()" onclick="return verifyDate()" class="btn goods">保存</a>
        <a href="${blog}/menu/menuList.html" class="btn danger">返回列表</a></li>
      </ul>
    </div>
  </div>
</div>
<input type="hidden" id="menuType" name="menuType"> 
<input type="hidden" id="Superior" name="superior"> 
<input type="hidden" id="iscommon" name="iScommon">
<input type="hidden" id="Flag" name="flag">  
<script type="text/javascript">
//表单验证
function verifyDate(){
    if($("#menuName").val()=="" || $("#menuName").val()==null){
	    $("#menuName").parents("li").find(".error").text("* 菜单名称不能为空");
		$("#menuName").focus();
		return false;  	
	}	
	else{
	    $("#menuName").parents("li").find(".error").text("");	
	}
	var priority = document.getElementById("priority").value;
	var reg = /^\d+$/;
    if (priority==""||priority==null) {
        $("#priority").parents("li").find(".error").text("* 菜单排序不能为空");
		$("#priority").focus();
        return false;
    }else{$("#priority").parents("li").find(".error").text("");}
    if (!reg.test(priority)) {
      $("#priority").parents("li").find(".error").text("* 菜单排序只能输入数字");
	  $("#priority").focus();
      return false;
    }else{$("#priority").parents("li").find(".error").text("");}
    
    $("#menuType").attr("value",$("#menutype").find("option:selected").val());
    $("#Superior").attr("value",$("#superior").find("option:selected").val());
    $("#iscommon").attr("value",$("#iScommon").find("option:selected").val());
    $("#Flag").attr("value",$("#flag").find("option:selected").val());
   
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
						document.getElementById('images').value=arr;
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