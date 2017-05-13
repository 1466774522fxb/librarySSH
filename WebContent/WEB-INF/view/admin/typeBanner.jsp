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
<title>轮播信息</title>
</head>
<body>
	  <nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i>首页 <span class="c-gray en">&gt;</span>广告管理<span class="c-gray en">&gt;</span> 轮播信息  <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
	<div class="page-container">
	<div class="mt-20">
		<table class="table table-border table-bordered table-hover table-bg table-sort">
	      <thead>
		   <tr>
			   <th scope="col" colspan="5">图书类型列表</th>
		   </tr>
		  <tr class="text-c">
	       <th> Id</th>
	       <th> 名称</th>
	       <th> URL</th>
	       <th> 图片</th>
	       <th> 状态</th>
	       <th> 操作</th>
	      </tr>
	      </thead>
			<tbody>
	      <s:if test="#request.banner == null || #request.banner.size()==0">
	      </s:if>
	      <s:else>
	         <s:iterator value="#request.banner">
		         <tr class="text-c">
			       <td>${id}</td>
			       <td>${name}</td>
			       <td>${url}</td>
			       <td><img    style=" width: 200px;"  alt="" src="public/uploads/${img}"></td>
			       <td class="td-status">
			       <s:if test="status == 0">
			                                禁用
			       </s:if>
			       <s:else>
			                                  正常
			       </s:else>
			                </td>
			       <td class="td-manage"> 
			          <s:if test="status == 1">
			      	      <a style="text-decoration:none" onclick="banner_stop(this,${id})" href="javascript:;" title="禁用"><span class="label label-danger radius">禁用</span></a>
		              </s:if>
		              <s:else>
		              	    <a style="text-decoration:none" onclick="banner_open(this,${id})" href="javascript:;" title="启用"><span class="label label-success radius">启用</span></a>
		              </s:else>
			       	 <a style="text-decoration:none" onclick="banner_del(this,${id})" href="javascript:;" title="删除"><span class="label label-danger radius">删除</span></a>
		
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
			//table.$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
	});
});
/*-增加*/
function banner_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		//此处请求后台程序，下方是成功后的前台处理……
        $.post("typedel_Banner","id="+id,function(data){
        	 if(data==1){
        		layer.msg('已删除!',{icon:1,time:1000});
        		$(obj).parents("tr").remove();
        	}else if(data==0){
        		layer.msg('删除失败!',{icon:0,time:1000});
        	} 
        }); 
        
	});
}
 /*-禁用*/
 function banner_stop(obj,id){
	 layer.confirm('确认要禁用吗？',function(index){
			//此处请求后台程序，下方是成功后的前台处理……
	        $.post("typestop_Banner","id="+id,function(data){
	        	 if(data==1){
	        		layer.msg('已禁用!',{icon:1,time:1000});
	        		$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onclick="banner_open(this,'+id+')" href="javascript:;" title="启用"><span class="label label-success radius">启用</span></a>');
					$(obj).parents("tr").find(".td-status").html('禁用');
	        		$(obj).remove();
	        	}else if(data==0){
	        		layer.msg('禁用失败!',{icon:0,time:1000});
	        	} 
	        }); 
	        
		});
 }
 /*-开启*/
 function banner_open(obj,id){
	 layer.confirm('确认要开启吗？',function(index){
			//此处请求后台程序，下方是成功后的前台处理……
	        $.post("typeopen_Banner","id="+id,function(data){
	        	 if(data==1){
	        		layer.msg('已开启!',{icon:1,time:1000});
	        		$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onclick="banner_stop(this,'+id+')" href="javascript:;" title="禁用"><span class="label label-danger radius">禁用</span></a>');
					$(obj).parents("tr").find(".td-status").html('正常');
	        		$(obj).remove();
	        	}else if(data==0){
	        		layer.msg('开启失败!',{icon:0,time:1000});
	        	} 
	        }); 
	        
		});
 }
</script>
</html>