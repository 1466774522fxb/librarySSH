<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人中心</title>
</head>
<body>
<jsp:include page="../../pages/header.jsp"></jsp:include>
    <div class="container content-body">
    <div class="row">
    <div class="col-md-3 hidden-print hidden-xs hidden-sm">
        <div class="sidebar">
        <div class="sidebar-title">
            <a>
				个人中心 </a>
        </div>
    	<s:if test="#request.op == 1">
    	 <div class="sub-title sub-active">
	    </s:if>
	    <s:else>
	     <div class="sub-title ">
	    </s:else>	
            <a href="userCenter?op=info">
					个人信息				</a>
        </div>

        <s:if test="#request.op == 2">
    	 <div class="sub-title sub-active">
	    </s:if>
	    <s:else>
	     <div class="sub-title ">
	    </s:else>	
                <a href="userCenter?op=alter">
					修改信息				
			   </a>
            </div>
     <s:if test="#request.op == 3">
    	 <div class="sub-title sub-active">
	    </s:if>
	    <s:else>
	     <div class="sub-title ">
	    </s:else>	
                <a href="userCenter?op=recharge">
					充值				
				</a>
            </div>

      <s:if test="#request.op == 4">
    	 <div class="sub-title sub-active">
	    </s:if>
	    <s:else>
	     <div class="sub-title ">
	    </s:else>	
                <a href="userCenter?op=pwd">
					修改密码
								</a>
            </div>


          </div>
    </div>

    <div class="col-md-9">
        <div class="section-box">
        <div class="section-nav">
                           <span>个人中心</span>
                        &gt;  <span>个人信息</span></div>

        <div class="section-title">
            <h1 class="content_c_title text-center">
				<s:if test="#request.op == 1">个人信息
				</s:if>	
				<s:elseif test="#request.op == 2">修改信息</s:elseif>		
				<s:elseif test="#request.op == 3">充值</s:elseif>		
				<s:elseif test="#request.op == 4">修改密码</s:elseif>		
			</h1>
        </div>

        <div class="section-info">
            <p>
                </p><div class="grey14">
                                        
                                    </div>
            <p></p>
        </div>
        <div class="section-body justify">
        <s:if test="#request.op == 1">
              <form id="form-info" class="form-horizontal templatemo-container templatemo-login-form-1 margin-bottom-30" role="form" action="#" method="post">				
		      <s:iterator value="#request.user">
		      <div class="row cl">
					<label class="form-label col-xs-4 col-sm-3">用户名：</label>
					<div class="formControls col-xs-8 col-sm-9">
						${account}
					</div>
				</div>
				<hr>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-3">姓名：</label>
					<div class="formControls col-xs-8 col-sm-9">
						${name}
					</div>
				</div>
				<hr>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-3">账户余额：</label>
					<div class="formControls col-xs-8 col-sm-9">
						${balance}￥
					</div>
				</div>
				<hr>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-3">等级：</label>
					<div class="formControls col-xs-8 col-sm-9">
						${grade}
					</div>
				</div>
				<hr>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-3">电话：</label>
					<div class="formControls col-xs-8 col-sm-9">
						${phone}
					</div>
				</div>
				<hr>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-3">地址：</label>
					<div class="formControls col-xs-8 col-sm-9">
						${address}
					</div>
				</div>
				</s:iterator>
		    </form>
           </s:if>
           <s:elseif test="#request.op == 2">
                <form id="form-info" class="form-horizontal">
                    <s:iterator value="#request.user">
					  <div class="form-group">
					    <label for="inputEmail3" class="col-sm-2 control-label">姓名</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" name="name" value="${name}" id="inputEmail3" placeholder="姓名">
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="inputPassword3" class="col-sm-2 control-label">电话</label>
					    <div class="col-sm-10">
					      <input type="tel" class="form-control" name="phone" value="${phone}" placeholder="电话">
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="inputPassword3" class="col-sm-2 control-label">地址</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" name="address" value="${address}" placeholder="地址">
					    </div>
					  </div>
					  </s:iterator>
					  <div class="form-group">
					    <div class="col-sm-offset-2 col-sm-10">
					      <button id="alterInfo"  type="button" class="btn btn-success">提交</button>
					    </div>
					  </div>
			    </form>
           </s:elseif>
            <s:elseif test="#request.op == 3">
                  <form id="form-monney" class="form-horizontal">
					  <div class="form-group">
					    <label for="inputEmail3" class="col-sm-2 control-label">金额</label>
					    <div class="col-sm-10">
					      <input type="number" class="form-control" id="inputEmail3" name="balance" placeholder="金额">
					    </div>
					  </div>
					  <div class="form-group">
					    <div class="col-sm-offset-2 col-sm-10">
					      <button id="addMonney" type="button" class="btn btn-success">提交</button>
					    </div>
					  </div>
			    </form>
           </s:elseif>
            <s:elseif test="#request.op == 4">
               <form id="form-password" class="form-horizontal">
					  <div class="form-group">
					    <label for="inputEmail3" class="col-sm-2 control-label">原密码</label>
					    <div class="col-sm-10">
					      <input type="password" class="form-control" id="inputEmail3" name="password" placeholder="请输入原密码">
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="inputPassword3" class="col-sm-2 control-label">密码</label>
					    <div class="col-sm-10">
					      <input type="password" class="form-control" id="inputPassword3" name="newPwd" placeholder="请输入密码">
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="inputPassword3" class="col-sm-2 control-label">确认密码</label>
					    <div class="col-sm-10">
					      <input type="password" class="form-control" id="inputPassword3" name="reNewPwd" placeholder="输入确认密码">
					    </div>
					  </div>
					  <div class="form-group">
					    <div class="col-sm-offset-2 col-sm-10">
					      <button id="alterPassword" type="button" class="btn btn-success">提交</button>
					    </div>
					  </div>
			    </form>
           </s:elseif>
            
        </div>
    </div>
    </div>
</div>
</div>

<jsp:include page="../../pages/footer.jsp"></jsp:include>
</body>
<script type="text/javascript" src="public/jquery/1.9.1/jquery.min.js"></script>  
<script type="text/javascript" src="public/layer/2.1/layer.js"></script> 
<%-- <script type="text/javascript" src="public/laypage/1.2/laypage.js"></script> 
<script type="text/javascript" src="public/h-ui/js/H-ui.js"></script> 
<script type="text/javascript" src="public/h-ui.admin/js/H-ui.admin.js"></script>  --%>
<script type="text/javascript">
  $('#alterPassword').click(function(){  //修改密码
	  var data= $('#form-password').serialize();
	 $.post('userpassword',data,function(data){
		 if(data==0){
			 layer.msg('密码不能为空!',{icon:5,time:1000});
		 }else if(data==1){
			 layer.msg('两次输入的密码不同!',{icon:5,time:1000});
		 }else if(data==2){
			 layer.msg('修改成功!',{icon:6,time:1000});
		 }else if(data==3){
			 layer.msg('原密码不正确!',{icon:5,time:1000});
		 }
	 })
  });
  $('#addMonney').click(function(){
	  var data= $('#form-monney').serialize();
	  $.post('userbalance',data,function(data){
			 if(data==0){
				 layer.msg('金额必须大于0',{icon:5,time:1000});
			 }else if(data==1){
				 layer.msg('充值成功!',{icon:6,time:1000});
			 }else if(data==2){
				 layer.msg('重置失败!',{icon:5,time:1000});
			 }
      })
  });
  $('#alterInfo').click(function(data){
	  var data=$('#form-info').serialize();
	  $.post('userinfo',data,function(data){
		  if(data==0){
			  layer.msg('修改失败!',{icon:5,time:1000});
		  }else if(data==1){
			  layer.msg('修改成功!',{icon:6,time:1000});
		  }else{
			  layer.msg('服务器出现异常!',{icon:5,time:1000});
		  }
	  });
	  
  });
</script>
</html>