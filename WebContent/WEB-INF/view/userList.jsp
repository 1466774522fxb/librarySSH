<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户信息页面</title>
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<LINK rel="Bookmark" href="/favicon.ico" >
<LINK rel="Shortcut Icon" href="/favicon.ico" />
<link rel="stylesheet" type="text/css" href="public/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="public/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="public/Hui-iconfont/1.0.7/iconfont.css" />
<link rel="stylesheet" type="text/css" href="public/h-ui.admin/skin/default/skin.css" id="skin" />
 <link rel="stylesheet" type="text/css" href="public/h-ui.admin/css/style.css" /> 
</head>
<body>
     
   <nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i>首页 <span class="c-gray en">&gt;</span>会员管理<span class="c-gray en">&gt;</span> 会员列表  <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="text-c"> 
		<input type="text" class="input-text" style="width:250px" placeholder="输入管理员名称" id="" name="">
		<button type="submit" class="btn btn-success" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 搜用户</button>
	</div>
	<table class="table table-border table-bordered table-hover table-bg table-sort">
		<thead>
			<tr>
				<th scope="col" colspan="9">会员列表</th>
			</tr>
			<tr class="text-c">
				<th width="40">ID</th>
				<th width="150">用户名</th>
				<th width="90">姓名</th>
				<th width="150">等级</th>
				<th>电话</th>
				<th width="130">地址</th>
				<th width="100">是否正常</th>
				<th width="100">操作</th>
			</tr>
		</thead>
		<tbody>
			
			<s:if test="#request.user == null || #request.user.size()==0">
                <tr class="text-c">没有任何信息！！！</tr>
              </s:if>
                <s:else>
          <s:iterator value="#request.user">
              <tr class="text-c">
	          <td>${id}</td>
	          <td>${account}</td>
	          <td>${name }</td>
	          <td>${grade}</td>
	          <td>${phone}</td>
	          <td>${address}</td>
	          <td class="td-status">
		          <s:if test=" status == 0">
		                                  正常</s:if>
					<s:else>已禁用
				</s:else>
	                   </td>
			  <td class="td-manage">
				<s:if test=" status == 0">
				  <a style="text-decoration:none" onClick="admin_stop(this,${id})" href="javascript:;" title="禁用"><span class="label label-danger radius">禁用</span></a>
				</s:if>
				<s:else>
				  <a style="text-decoration:none" onClick="admin_start(this,${id})" href="javascript:;" title="启用"><span class="label label-success radius">启用</span></a>
				</s:else>
				 <a title="编辑" href="javascript:;" onclick="admin_edit('管理员编辑','admin-add.html','2','800','500')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a> <a title="删除" href="javascript:;" onclick="admin_del(this,'1')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
			 </tr>
          </s:iterator>
            </s:else>
		</tbody>
	</table>
</div>
<script type="text/javascript" src="public/jquery/1.9.1/jquery.min.js"></script>  
<script type="text/javascript" src="public/layer/2.1/layer.js"></script> 
<script type="text/javascript" src="public/laypage/1.2/laypage.js"></script> 
<script type="text/javascript" src="public/My97DatePicker/WdatePicker.js"></script> 
<script type="text/javascript" src="public/h-ui/js/H-ui.js"></script> 
<script type="text/javascript" src="public/h-ui.admin/js/H-ui.admin.js"></script> 
<script type="text/javascript" src="public/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript">

$(function(){
	$('.table-sort').dataTable({
		"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[4,7]}// 制定列不参与排序
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
/*管理员-删除*/
function admin_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		//此处请求后台程序，下方是成功后的前台处理……
		
		$(obj).parents("tr").remove();
		layer.msg('已删除!',{icon:1,time:1000});
	});
}
/*管理员-编辑*/
function admin_edit(title,url,id,w,h){
	layer_show(title,url,w,h);
}
/*-停用*/
function admin_stop(obj,id){
	layer.confirm('确认要禁用吗？',function(index){
		//此处请求后台程序，下方是成功后的前台处理……
		$.post('userstatusNo','id='+id,function(data){
			if(data==1){
				$(obj).parents("tr").find(".td-manage").prepend('<a onClick="admin_start(this,'+id+')" href="javascript:;" title="启用" style="text-decoration:none"><span class="label label-success radius">启用</span></a>');
				$(obj).parents("tr").find(".td-status").html('已禁用');
				$(obj).remove();
				layer.msg('已禁用!',{icon: 5,time:1000});
			}else if(data==0){
				layer.msg('禁用失败!',{icon: 5,time:1000});
			}else{
				layer.msg('服务器出现异常!',{icon: 5,time:1000});
			}
		});
		
	});
}

/*-启用*/
function admin_start(obj,id){
	layer.confirm('确认要启用吗？',function(index){
		//此处请求后台程序，下方是成功后的前台处理……
		$.post('userstatusOk','id='+id,function(data){
			if(data==1){
				$(obj).parents("tr").find(".td-manage").prepend('<a onClick="admin_stop(this,'+id+')" href="javascript:;" title="禁用" style="text-decoration:none"><span class="label label-danger radius">禁用</span></a>');
				$(obj).parents("tr").find(".td-status").html('正常');
				$(obj).remove();
				layer.msg('已启用!', {icon: 6,time:1000});
			}else if(data==0){
				layer.msg('启用失败!', {icon: 6,time:1000});
			}else{
				layer.msg('服务器出现异常!', {icon: 6,time:1000});
			}
		});
		
	});
}
</script>
</body>
</html>