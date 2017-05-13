<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录页面</title>
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link href="public/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="public/bootstrap/css/templatemo_style.css" rel="stylesheet" type="text/css" />
<link href="public/bootstrap/css/font-awesome.min.css" rel="stylesheet" type="text/css">
</head>
<body>
<body class="templatemo-bg-gray">
	<div class="container">
		<div class="col-md-12">
			<h1 class="margin-bottom-15">会员登录中心</h1>
			<form id="form-login" class="form-horizontal templatemo-container templatemo-login-form-1 margin-bottom-30" role="form" action="#" method="post">				
		        <div class="form-group">
		          <div class="col-xs-12">		            
		            <div class="control-wrapper">
		            	<label for="username" class="control-label fa-label"><i class="glyphicon glyphicon-user"></i></label>
		            	<input type="text" class="form-control" id="acount" name="account" placeholder="用户名">
		            </div>		            	            
		          </div>              
		        </div>
		        <div class="form-group">
		          <div class="col-md-12">
		          	<div class="control-wrapper">
		            	<label for="password" class="control-label fa-label"><i class="glyphicon glyphicon-lock"></i></label>
		            	<input type="password" class="form-control" id="password" name="password" placeholder="密码">
		            </div>
		          </div>
		        </div>
		        <div class="form-group">
		          <div class="col-md-12">
	             	<div class="checkbox control-wrapper">
	                	<label>
	                  		<input type="checkbox"> Remember me
                		</label>
	              	</div>
		          </div>
		        </div>
		        <div class="form-group">
		          <div class="col-md-12">
		          	<div class="control-wrapper">
		          		<input id="login" type="button" value="登录" class="btn btn-info">
		          		<a href="forgot-password.html" class="text-right pull-right">Forgot password?</a>
		          	</div>
		          </div>
		        </div>
		        <hr>
		        
		      </form>
		      <div class="text-center">
		      	<a href="typehome" class="templatemo-create-new">返回首页 <i class="fa fa-arrow-circle-o-right"></i></a>	
		      </div>
		</div>
	</div>
</body>
<script type="text/javascript" src="public/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="public/layer/2.1/layer.js"></script> 
<script type="text/javascript">
$(function(){
	$('#login').click(function(){
		var data=$('#form-login').serialize();
		$.post('userlogin',data,function(data){
			if(data==0){
				layer.msg('用户名不能为空!',{icon: 0,time:1000});
			}else if(data==1){
				layer.msg('密码不能为空!',{icon: 0,time:1000});
			}else if(data==2){
				layer.msg('用户名或密码错误!',{icon: 5,time:1000});
			}else if(data==3){
				layer.msg('登录成功!',{icon: 6,time:1000});
				window.location.href="typehome";
			}else if(data==4){
				layer.msg('登录成功!',{icon: 6,time:1000});
				window.location.href="index";
			}else{
				layer.msg('服务器出现异常!',{icon: 0,time:1000});
			}
		});
	})
	
});
</script>
</html>