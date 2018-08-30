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

<form action="${blog}/jottings/manage/jottingsUpdate.html" name="listForm" method="post" enctype="multipart/form-data">
<input type="hidden" name="id" value="${jottings.id}"/>
<div class="maincont othercolor">
  <div class="addmenu">
    <h2 class="addh2">修改闲谈随笔</h2>
    <div class="add_meunlist">
      <ul>
        <li><span>关键词：</span>
         <input type="text"  name="keyWord" id="keyWord" value="${jottings.keyWord}" />
        </li>
         <li><span>图片：</span>
         <div id="preview"><img style="width:50px;height:50px;" id="imghead" src="/imageService/uploadFiles/${jottings.image}" /></div>
         <input type="file" accept="image/*" id="file" name="imageFile" />
        </li>
        <li><span>内容：</span>
        	<textarea name="context" id ="context" cols="47" rows="5" style="vertical-align: middle;" placeholder="请输入内容">${jottings.context}</textarea>
        </li>
        <li class="last-up">
        <a href="javascript:document.listForm.submit()" onclick="return verifyDate()" class="btn goods">保存</a>
        <a href="${blog}/jottings/manage/jottingsList.html" class="btn danger">返回列表</a></li>
      </ul>
    </div>
  </div>
</div>
<script type="text/javascript">
//表单验证
function verifyDate(){

}
</script>
</form> 
</body>
</html>