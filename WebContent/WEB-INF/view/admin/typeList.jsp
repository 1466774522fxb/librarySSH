<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>图书类型</title>
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<LINK rel="Bookmark" href="/favicon.ico" >
<LINK rel="Shortcut Icon" href="/favicon.ico" />
<link rel="stylesheet" type="text/css" href="public/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="public/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="public/Hui-iconfont/1.0.7/iconfont.css" />
</head>
<body>
   <nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i>首页 <span class="c-gray en">&gt;</span>图书管理<span class="c-gray en">&gt;</span> 图书信息  <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
	<div class="page-container">
	<div class="cl pd-5 bg-1 bk-gray mt-20">  <a href="javascript:;" onclick="admin_add('添加图书类型','addType','800','500')" class="btn btn-primary radius"><i class="Hui-iconfont"></i> 添加图书类型</a> <span class="r">共有数据：<strong>54</strong> 条</span> </div>
	<div class="mt-20">
		<table class="table table-border table-bordered table-hover table-bg table-sort">
	      <thead>
		   <tr>
			   <th scope="col" colspan="3">图书类型列表</th>
		   </tr>
		  <tr class="text-c">
	       <th> Id</th>
	       <th> 类型名称</th>
	       <th> 创建时间</th>
	      </tr>
	      </thead>
			<tbody>
	      <s:if test="#request.types == null || #request.types.size()==0">
	      </s:if>
	      <s:else>
	         <s:iterator value="#request.types">
		         <tr class="text-c">
			       <td>${id}</td>
			       <td>${typeName}</td>
			       <td>${time}</td>
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
/*-增加*/
function admin_add(title,url,w,h){
	layer_show(title,url,w,h);
}
</script>
</html>