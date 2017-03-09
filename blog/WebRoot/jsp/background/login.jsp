<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/jsp/common/common.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
	    <title>后台管理系统</title>
<link rel="stylesheet" type="text/css" href="${blog}/css/doumao.css" />
  </head>
  
  <body>	
  
  <div class="Sign">
  <div class="login"> 
    <h1><img src="${blog}/img/ddmimg/xtlogo.png" alt="嘟嘟猫OA后台管理系统" /></h1>
    <form method="post" name="listForm" action="${blog}/user/admin.html">
      <ul>
        <li><input type="text" name="account" class="z-h" value=""/></li>
        <li><input type="password" name="password" class="password" value="" /></li>
      </ul>
      <p class="error">${message }</p>
      <div class="update">
	      <button class="deuo" type="submit" >登录</button>
      </div>
    </form>
  </div>
</div>
<script type="text/javascript">
var zh=document.querySelector(".z-h");
var pass=document.querySelector(".password");
zh.onfocus=function(){
      if(this.value==this.defaultValue){
		   this.value="";
	  }	
}
zh.onblur=function(){
      if(this.value==''){
		  this.value=this.defaultValue;
	  }
}
pass.onfocus=function(){
      if(this.value==this.defaultValue){
		   this.value="";
		   this.type="password";
	  }	
}
pass.onblur=function(){
      if(this.value==''){
		  this.value=this.defaultValue;
		  this.type="text";
	  }
}

</script>
  </body>
</html>
