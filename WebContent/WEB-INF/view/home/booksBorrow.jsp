<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>借阅图书</title>
</head>
<body>
<jsp:include page="../../pages/header.jsp"></jsp:include>
<div class="container">
	<div class="h10"></div>
	<h1 class="text-center"><strong>书籍借阅单</strong></h1>
	<div class="row">
		<form id="form-books"  method="post" class="form-horizontal apply">
		<s:iterator value="#request.books">
			<div class="form-group">
				<label for="company" class="col-sm-4 control-label">ISBN</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" value="${ISBN}" readonly="readonly"  name="ISBN" >
				</div>
			</div>
			<div class="form-group">
				<label for="number" class="col-sm-4 control-label">书名</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" readonly="readonly" value="${bookName}"  >
				</div>
			</div>
			<div class="form-group">
				<label for="date" class="col-sm-4 control-label">借阅册数</label>
				<div class="col-sm-5">
					<input type="number" class="form-control date" value="1" name="count" >
				</div>
			</div>
			<div class="form-group">
				<label for="name" class="col-sm-4 control-label">借阅时间</label>
				<div class="col-sm-5">
				  <s:if test="isCheap == 0">
					<input name="returnDate" type="text" onfocus="WdatePicker({lang:'zh-cn',minDate:new Date()})" id="datemax" name="createTime" class="input-text Wdate" style="width:120px;">
				  </s:if>	
				   <s:else>
					   <select name="month" class="select" style="width: 211px;height: 34px;"> 
						 <option value="1">1个月</option>
						 <option value="2">2个月</option>
						 <option value="3">3个月</option>
						 <option value="4">4个月</option>
						 <option value="5">5个月</option>
						 <option value="6">6个月</option>
						</select>
						<input type="hidden" name="cheap" value="1">
					</s:else>
				</div>
			</div>
			<s:iterator value="#request.user">
			<div class="form-group">
				<label for="mobile" class="col-sm-4 control-label">联系手机</label>
				<div class="col-sm-5">
					<input type="text" name="phone" class="form-control" id="mobile" value="${phone}" name="mobile" placeholder="请输入联系人的手机">
				</div>
			</div>
			<div class="form-group">
				<label for="mobile" class="col-sm-4 control-label">邮寄地址</label>
				<div class="col-sm-5">
					<input type="text" name="address" class="form-control" value="${address}" placeholder="请输入邮寄地址">
				</div>
			</div>
			</s:iterator>
			<div class="form-group">
				<label for="mobile" class="col-sm-4 control-label">押金</label>
				<div class="col-sm-5">
					<input type="text"  class="form-control" id="money" name="money" value="50" placeholder="请输入邮寄地址">
				</div>
			</div>
			<div class="form-group">
				<label for="content" class="col-sm-4 control-label">备注说明</label>
				<div class="col-sm-6">
					<textarea class="form-control" rows="3"  name="reMarks" placeholder="请输入其他备注内容或留空"></textarea>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-4 control-label">&nbsp;</label>
				<div class="col-sm-6">
					<input id="submit" type="button" class="btn btn-primary submit" value="提交并支付">
				</div>
			</div>
			</s:iterator>
		</form>
	</div>
	<div class="h10"></div>
</div>
<jsp:include page="../../pages/footer.jsp"></jsp:include>
<script type="text/javascript" src="public/jquery/1.9.1/jquery.min.js"></script>  
<script type="text/javascript" src="public/layer/2.1/layer.js"></script> 
<script type="text/javascript" src="public/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
   $('#submit').click(function(){
	  console.log("sdedd"); 
	  var data= $('#form-books').serialize();
	  $.post('tradeadd',data,function(data){
		  console.log(data+">>");
		  if(data==0){
			  layer.msg('库存不足!',{icon:5,time:1000});
		  }else if(data==1){
			  layer.msg('借阅成功!',{icon:6,time:1000});
			  setTimeout("window.location.href='tradeBill'",1200)
		  }else{
			  layer.msg('服务器出现异常!',{icon:1,time:1000});
		  }
	  }); 
   });

</script>
</body>
</html>