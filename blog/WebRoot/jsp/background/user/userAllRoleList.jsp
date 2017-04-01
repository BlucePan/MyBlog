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
    <div class="operation customer"> <span>帐号或名称</span>
      <input type="text" name=findContent placeholder="帐号或名称" value="${param.findContent}"/>
      <a href="#" class="btn goods" onclick="query()">查询</a></div>
  </form>
  <div class="aotable">
    <table class="table" cellpadding="0" cellspacing="0">
      <thead>
        <tr>
          <th>帐号</th>
          <th>名称</th>
          <th>状态</th>
          <th>所拥有的角色</th>
          <th>操作</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="uAllRoles" items="${list}">
          <tr>
            <td>${uAllRoles.account}</td>
            <td>${uAllRoles.name}</td>
            <td>${uAllRoles.status==1?'有效':'禁止'}</td>
            <td roleIds="${uAllRoles.roleIds}">${uAllRoles.roleNames}</td>
            <td>
            <a href="javascript:updateRole('${uAllRoles.roleIds}','${uAllRoles.id}')" class="btn goods">选择角色</a> <a href="javascript:del('${uAllRoles.id}')" class="btn danger modelshow">清空用户角色</a></td>
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
        document.listForm.action = "${blog}/role/manage/userAllRoleList.html";
		document.listForm.submit();
	}

	function yes(id) {
		$.ajax({
			async:false,
			type : "POST",
			data : {
				id : id
			},
			url : "${blog}/role/manage/delUserRoles.html",
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
	
		      //弹出分配角色
		  function updateRole(roleIds,id){
				$.ajax({
						url: '${blog}/role/manage/queryAllRole.html',
						type: 'post',
						data:{'id':id},
						success: function(data){
							//console.info("data.message + "+data);
							var obj = eval("("+data+")");//转换为json对象
							if(obj.status == '100'){
								var list = obj.list;
								var map	=obj.map;
								var html='<div class="model"></div>';
								 html+='<div class="modelcont">';
								 html+='<dl class="contdl">';
								 html+='<dt>添加角色</dt>';
								 html += '<input type="hidden" id="userId" value="'+map.id+'">';
								 html += '<input type="hidden" id="roleIds" value="">';
								 for(i in list){
									  html += '<li><input type="checkbox"  value="'+list[i].id+'"  name="checkedRole">'+list[i].name+'</li>';
								 }
								 html+='<dd><a href="javascript:updatesRoles();" class="btn goods">确定</a><a href="javascript:;" class="btn danger close">取消</a></dd></dl></div>';
								 $("body").append(html);
								 $(".model,.modelcont").show();  
							    //js选中已有角色
								 var r="s,"+roleIds;
								 $('input[name="checkedRole"]').each(function(){  
						         var  alt=$(this).val();
						         if(r.indexOf(alt) > 0 ){
						         $(this).prop("checked", true);
						      }
						     }); 
														 	 
							}else{
							  alert("获取数据失败");
							}
			            }
			           });  
			}	  
			
		        //分配角色
			 function updatesRoles(){
			    var userId= $("#userId").val();
			        //得到被选中的角色
				   var roles =[]; 
				      $('input[name="checkedRole"]:checked').each(function(){ 
				        roles.push($(this).val()); 
				     }); 
				     $("#roleIds").val(roles);
				    var roless=$("#roleIds").val();            
			   	$.ajax({
					url: "${blog}/role/manage/updateRoles.html",
					type: 'post',
					data:{'userId':userId,'roles':roless},
					dataType : 'json',
					success: function(data){
						if(data == 1){
							$(".model,.modelcont").remove();
							window.location.href = '${blog}/role/manage/userAllRoleList.html';
						}else{
							alert("更新失败");
						}
			        }
 			  });  
			
		 
		 }
	
</script>
</body>
</html>