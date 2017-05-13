<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>交易记录</title>
 <meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<LINK rel="Bookmark" href="/favicon.ico" >
<LINK rel="Shortcut Icon" href="/favicon.ico" />
<link rel="stylesheet" type="text/css" href="public/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="public/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="public/Hui-iconfont/1.0.7/iconfont.css" />
<!-- <link rel="stylesheet" type="text/css" href="lib/icheck/icheck.css" /> -->
<link rel="stylesheet" type="text/css" href="public/h-ui.admin/skin/default/skin.css" id="skin" />
 <link rel="stylesheet" type="text/css" href="public/h-ui.admin/css/style.css" /> 
</head>
<body>
     <nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i>首页 <span class="c-gray en">&gt;</span>图书管理<span class="c-gray en">&gt;</span> 图书信息  <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
	<div class="page-container">
	<div class="mt-20">
		<table class="table table-border table-bordered table-hover table-bg table-sort">
	      <thead>
		   <tr>
			   <th scope="col" colspan="10">交易记录</th>
		   </tr>
		  <tr class="text-c">
	       <th> 交易编号</th>
	       <th> 书名</th>
	       <th> 借阅日期</th>
	       <th> 应还日期</th>
	       <th> 实还日期</th>
	       <th>借阅册数</th>
	       <th>押金</th>
	       <th>会员</th>
	       <th>状态</th>
	       <th>操作</th>
	      </tr>
	      </thead>
			<tbody>
	      <s:if test="#request.trade == null || #request.trade.size()==0">
	      </s:if>
	      <s:else>
	         <s:iterator value="#request.trade">
		         <tr class="text-c">
			       <td> ${number}</td>
			       <td> ${books.bookName}</td>
			       <td> ${borrowDate}</td>
			       <td> ${returnDate}</td>
			       <td> ${trueDate}</td>
			       <td>${count}</td>
			       <td>${money}</td>
			       <td>${user.name}</td>
			       <td class="td-status">
			       <s:if test="state == 1">已还</s:if><s:else>未还</s:else>
			       </td>
			       
			       <td>
			       <s:if test="state == 2">
			       <button onclick="inputBox(this,${number},${books.ISBN},${count},${money})"   class="btn btn-primary" >同意归还</button>
			       </s:if>
			       </td>
		      </tr>
		      </s:iterator>
	     </s:else>
	     </tbody>
	</table>
  </div>
  </div>
</body>
<script type="text/javascript" src="public/jquery/1.9.1/jquery.min.js"></script>  
<script type="text/javascript" src="public/layer/2.1/layer.js"></script> 
<script type="text/javascript" src="public/laypage/1.2/laypage.js"></script> 
<script type="text/javascript" src="public/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="public/h-ui/js/H-ui.js"></script> 
<script type="text/javascript" src="public/h-ui.admin/js/H-ui.admin.js"></script> 
<script type="text/javascript">
$(function(){
	$('.table-sort').dataTable({
		"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[0]}// 制定列不参与排序
		]
	});
	$('.table-sort tbody').on( 'click', 'tr', function () {
		if ( $(this).hasClass('selected') ) {
			$(this).removeClass('selected');
		}
		else {
			table.$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
	});
	

});
function inputBox(obj,number,ISBN,count,money){

 layer.confirm('确认要入库吗？',function(index){
		//此处请求后台程序，下方是成功后的前台处理……
        $.post("tradeinputBook","number="+number+"&count="+count+"&ISBN="+ISBN+"&money="+money,function(data){
        	if(data==1){
        		layer.msg('已归还!',{icon:1,time:1000});
        		 setTimeout("window.location.reload()",1200);
        		
        	}else if(data==0){
        		layer.msg('归还失败!',{icon:0,time:1000});
        	}
        }); 
        
	});
}
</script>
</html>