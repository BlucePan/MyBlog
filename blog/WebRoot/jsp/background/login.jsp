<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/jsp/common/common.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
	    <title>后台管理系统</title>
        <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
        <link   rel="icon" href="https://open.itboy.net/favicon.ico" type="image/x-icon" />
		<link   rel="shortcut icon" href="https://open.itboy.net/favicon.ico" />
        <!-- CSS -->
        <link rel="stylesheet" href="${blog}/js/app/reset.css">
        <link rel="stylesheet" href="${blog}/js/app/supersized.css">
        <link rel="stylesheet" href="${blog}/js/app/style.css"/>
        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="http://static.supportfolios.com/js/www/html5shiv.js"></script>
        <![endif]-->
		<style>
			canvas{position: fixed; top: 0px; left: 0px; }
		</style>
    </head>

    <body id="body">
     <script src="${blog}/js/particleback.js"></script>
        <div class="page-container">
            <h1>Login</h1>
            <form id="_form" action="" name="listForm" method="post">
                <input type="text" name="account" class="username" placeholder="Account">
                <input type="password" name="password" class="password" placeholder="Password">
                <input type="hidden" id="message" name="message" value="${message}">
                <div style="text-align: left; margin-left: 10px;">
                <label><input type="checkbox" checked="checked"  id="rememberMe"style="width: 10px; height: 10px;">记住我</label>
                </div>
                <button type="button" id="login">登录</button>
                <button type="button" id="register" class="register">Register</button>               
                <div class="error"><span>+</span></div>
            </form>
        </div>
        <!-- Javascript -->
        <script src="${blog}/js/app/supersized.3.2.7.min.js"></script>
        <script src="${blog}/js/app/supersized-init.js"></script>   
        <script  src="${blog}/js/app/layer.js"></script>
        <script>  
		$(function(){
			var message=$("#message").val();
			if(message!=null && message!=""){
			layer.msg(message,function(){});
			$('.password').val('');
			$('.password').focus();
			}		
		})	
 		//登录操作
	    $('#login').click(function(){
	           $("#message").val('');
	    	var username = $('.username').val();
	        var password = $('.password').val();
	        if(username == '') {
	            $('.error').fadeOut('fast', function(){
	                $('.error').css('top', '27px').show();
	            });
	            $('.error').fadeIn('fast', function(){
	                $('.username').focus();
	            });
	            return false;
	        }
	        if(password == '') {
	            $('.error').fadeOut('fast', function(){
	                $('.error').css('top', '96px').show();
	            });
	            $(this).find('.error').fadeIn('fast', function(){
	                $('.password').focus();
	            });
	            return false;
	        }
	   	    document.listForm.action = "${blog}/user/login.html";
            document.listForm.submit(); 
	    });
			    
			    
        </script>
    </body>

</html>

