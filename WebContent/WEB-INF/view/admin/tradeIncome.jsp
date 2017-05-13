<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<LINK rel="Bookmark" href="/favicon.ico" >
<LINK rel="Shortcut Icon" href="/favicon.ico" />
<link rel="stylesheet" type="text/css" href="public/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="public/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="public/Hui-iconfont/1.0.7/iconfont.css" />
<title>收入信息</title>
</head>
<body>
	  <nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i>首页 <span class="c-gray en">&gt;</span>收入管理<span class="c-gray en">&gt;</span> 收入信息  <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
	<div class="page-container">
	<div class="mt-20">
		<table class="table table-border table-bordered table-hover table-bg table-sort">
	      <thead>
		   <tr>
			   <th scope="col" colspan="5">收入列表</th>
		   </tr>
		  <tr class="text-c">
	       <th> 单号</th>
	       <th> 收入金额</th>
	       <th> 罚款</th>
	       <th> 退还金额</th>
	       <th> 创建时间</th>
	      </tr>
	      </thead>
			<tbody>
	      <s:if test="#request.income == null || #request.income.size()==0">
	      </s:if>
	      <s:else>
	         <s:iterator value="#request.income">
		         <tr class="text-c">
			       <td>${borrowId}</td>
			       <td>${bookMoney}</td>
			       <td>${ticketMoney}</td>
			       <td>${returnMoney}</td>
			       <td>${createtime}</td>
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
		"aaSorting": [[ 0, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[0,1]}// 制定列不参与排序
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

</script>
</html>