<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<link href="public/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="public/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css">
	<link href="public/bootstrap/css/templatemo_style.css" rel="stylesheet" type="text/css">	
<title>注册页面</title>
</head>
<body>
<body class="templatemo-bg-gray">
	<h1 class="margin-bottom-15">会员注册中心</h1>
	<div class="container">
		<div class="col-md-12">			
			<form id="form-register" class="form-horizontal templatemo-create-account templatemo-container"  method="post">
				<div class="form-inner">
					<div class="form-group">
			          <div class="col-md-6">		          	
			            <label for="first_name" class="control-label">用户名</label>
			            <input type="text" class="form-control" name="account" id="account" placeholder="">		            		            		            
			          </div>  
			          <div class="col-md-6">		          	
			            <label for="last_name" class="control-label">姓名</label>
			            <input type="text" class="form-control" id="last_name" name="name" placeholder="">		            		            		            
			          </div>             
			        </div>
			        <div class="form-group">
			          <div class="col-md-12">		          	
			            <label  class="control-label">地址</label>
			            <input type="email" class="form-control" id="email" name="address" placeholder="">		            		            		            
			          </div>              
			        </div>			
			        <div class="form-group">
			          <div class="col-md-6">		          	
			            <label  class="control-label">电话</label>
			            <input type="text" class="form-control" id="username" name="phone" placeholder="">		            		            		            
			          </div>
			                     
			        </div>
			        <div class="form-group">
			          <div class="col-md-6">
			            <label  class="control-label">密码</label>
			            <input type="password" class="form-control" id="password" name="password" placeholder="">
			          </div>
			          <div class="col-md-6">
			            <label  class="control-label">确认密码</label>
			            <input type="password" class="form-control" id="rePassword" name="rePassword" placeholder="">
			          </div>
			        </div>
			        <div class="form-group">
			          <div class="col-md-12">
			            <label><input id="agree" type="checkbox" >I agree to the <a href="javascript:;" data-toggle="modal" data-target="#templatemo_modal">Terms of Service</a> and <a href="#">Privacy Policy.</a></label>
			          </div>
			        </div>
			        <div class="form-group">
			          <div class="col-md-12">
			            <input id="submit" disabled="disabled" class="btn btn-info" value="提交"/>
			            <a href="login" class="pull-right">Login</a>
			          </div>
			        </div>	
				</div>				    	
		      </form>		      
		</div>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="templatemo_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
	        <h4 class="modal-title" id="myModalLabel">Terms of Service</h4>
	      </div>
	      <div class="modal-body">
	      	<p>This form is provided by <a rel="nofollow" href="http://www.cssmoban.com/page/1">Free HTML5 Templates</a> that can be used for your websites. Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Morbi leo risus, porta ac consectetur ac, vestibulum at eros.</p>
	        <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non metus auctor fringilla. Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac facilisis in, egestas eget quam.</p>
	        <p>Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor.</p>
	      </div>
	       
	      <div class="modal-footer">
	        <button type="button"  class="btn btn-default" data-dismiss="modal">Close</button>
	      </div>
	    </div>
	  </div>
	 
	</div>
	<script type="text/javascript" src="public/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript" src="public/bootstrap/js/bootstrap.min.js"></script>
</body>
<script type="text/javascript" src="public/layer/2.1/layer.js"></script> 
<script type="text/javascript">
 $(function(){
	$('#submit').click(function(){
		var account =$('#account').val();
		var password =$('#password').val();
		var rePassword =$('#rePassword').val();
		if(account==""){
			layer.msg('用户名不能为空',{icon: 0,time:1000});
			return;
		}
		if(password==""){
			layer.msg('密码不能为空',{icon: 0,time:1000});
			return;
		}
		if(rePassword==""){
			layer.msg('确认密码不能为空',{icon: 0,time:1000});
			return;
		}
		if(rePassword!=rePassword){
			layer.msg('历次密码不一致！',{icon: 0,time:1000});
			return;
		}
	 	var data=$('#form-register').serialize();
		var url="useradd";
		$.post(url,data,function(data){
			console.log(data);
			if(data==0){
				layer.msg('此用户名已注册过，请更改!',{icon: 0,time:1000});
			}else if(data==1){
				layer.msg('注册成功!',{icon: 1,time:1000});
			}else{
				layer.msg('服务器出现异常!',{icon: 0,time:1000});
			}
		});   
	});
	
	$('#agree').click(function(){
		if($(this).prop("checked")){
			$('#submit').removeAttr('disabled');
		}else{
			$('#submit').attr('disabled','disabled')
		}
		
	})
	
 });

</script>
</html>