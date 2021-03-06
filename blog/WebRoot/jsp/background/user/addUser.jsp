<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="/jsp/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="${blog}/css/doumao.css" />
    <script src="${blog}/js/change.js" type="text/javascript"></script>
</head>
<body>

<form action="${blog}/role/manage/addUser.html" name="listForm" method="post" >
<div class="maincont othercolor">
  <div class="addmenu">
    <h2 class="addh2">新增用户</h2>
    <div class="add_meunlist">
      <ul>
        <li><span>账户：</span>
          <input type="text" placeholder="" name="account" id="account" />
          <p class="error">* 帐号不能为空</p>
        </li>
          <li><span>姓名：</span>
          <input type="text" placeholder="" name="name" id="name" />
          <p class="error">* 姓名不能为空</p>
        </li>
        <li><span>密码：</span>
          <input type="text" placeholder="" name="password" id="password" />
          <p class="error">* 密码不能为空</p>
        </li>
        <li class="last-up">
        <a href="javascript:document.listForm.submit()" onclick="return verifyDate()" class="btn goods">保存</a>
        <a href="${blog}/role/manage/userList.html" class="btn danger">返回列表</a></li>
      </ul>
    </div>
  </div>
</div>
<script type="text/javascript">
//表单验证
function verifyDate(){
    if($("#name").val()=="" || $("#name").val()==null){
	    $("#name").parents("li").find(".error").text("* 标题不能为空");
		$("#name").focus();
		return false;  	
	}	
	else{
	    $("#name").parents("li").find(".error").text("");	
	}
}
</script>
</form> 
</body>
</html>