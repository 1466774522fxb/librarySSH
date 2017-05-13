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
     
   <nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i>首页 <span class="c-gray en">&gt;</span>图书管理<span class="c-gray en">&gt;</span> 图书信息  <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="mt-20">
	<table class="table table-border table-bordered table-hover table-bg table-sort">
		<thead>
			<tr>
				<th scope="col" colspan="11">图书列表</th>
			</tr>
			<tr class="text-c">
				<th>ISBN</th>
				<th>书名</th>
				<th>作者</th>
				<th>出版社</th>
				<th>类型</th>
				<th>出版时间</th>
				<th>总数量</th>
				<th>借出数量</th>
                <th>状态</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			
			<s:if test="#request.books == null || #request.books.size()==0">
                <tr class="text-c">没有任何信息！！！</tr>
              </s:if>
             <s:else>
	          <s:iterator value="#request.books">
	             <tr>
		          <td>${ISBN}</td>
		          <td>${bookName }</td>
		          <td>${author}</td>
		          <td>${publish}</td>
		          <td>${type.typeName}</td>
		          <td>${createTime}</td>
		          <td>${counts}</td>
		          <td>${loanCount}</td>
		          <td>
		          <s:if test="status == 0 ">
		            
		                                         已下架
		              <s:if test="isCheap == 1">  
		                -优惠
		               </s:if>
	              </s:if>
	               <s:else>
	                                                         已上架
	                    <s:if test="isCheap == 1">  
		                  -优惠
		               </s:if>
	                </s:else>
	              </td>
		          <td>
			          <s:if test="status == 0">
			              <a href="booksUp?ISBN=${ISBN}"><span class="label label-blue radius">上架</span></a> | 
			          </s:if>
			          <s:else>
			                <a href="booksDown?ISBN=${ISBN}"><span class="label label-danger radius">下架</span></a>| 
			          </s:else>
			            <s:if test="isCheap == 0">
			              <a onclick="booksCheap(this,${ISBN})"><span class="label label-success radius">优惠</span></button>
			          </s:if>
			          <s:else>
			                <a onclick="booksCommon(this,${ISBN})"><span class="label label-success radius">正常</span></button> 
			          </s:else>
		           
		            </td>
		          </tr>
	          </s:iterator>
            </s:else>
		</tbody>
	</table>
	</div>
</div>
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
		  {"orderable":false,"aTargets":[0,8,9]}// 制定列不参与排序
		]
	});
	$('.table-sort tbody').on( 'click', 'tr', function () {
		if ( $(this).hasClass('selected') ) {
			$(this).removeClass('selected');
		}
		else {
			/* table.$('tr.selected').removeClass('selected');
			$(this).addClass('selected'); */
		}
	});

});
/*优惠*/
function booksCheap(obj,id){
	layer.confirm('确认要优惠吗？',function(index){
		//此处请求后台程序，下方是成功后的前台处理……
		$.post('booksisCheap','ISBN='+id,function(data){
			if(data==1){
				/* $(obj).parents("tr").find(".td-manage").prepend('<a onClick="admin_stop(this,'+id+')" href="javascript:;" title="禁用" style="text-decoration:none"><span class="label label-danger radius">禁用</span></a>');
				$(obj).parents("tr").find(".td-status").html('正常');
				$(obj).remove(); */
				layer.msg('已优惠!', {icon: 6,time:1000});
				  setTimeout("window.location.reload()",1200)
			}else if(data==0){
				layer.msg('优惠失败!', {icon: 6,time:1000});
			}else{
				layer.msg('服务器出现异常!', {icon: 6,time:1000});
			}
		});
		
	});
}
/*正常*/
function booksCommon(obj,id){
	layer.confirm('确认要正常吗？',function(index){
		//此处请求后台程序，下方是成功后的前台处理……
		$.post('bookscommon','ISBN='+id,function(data){
			if(data==1){
				/* $(obj).parents("tr").find(".td-manage").prepend('<a onClick="admin_stop(this,'+id+')" href="javascript:;" title="禁用" style="text-decoration:none"><span class="label label-danger radius">禁用</span></a>');
				$(obj).parents("tr").find(".td-status").html('正常');
				$(obj).remove(); */
				layer.msg('已正常!', {icon: 6,time:1000});
				setTimeout("window.location.reload()",1200)
			}else if(data==0){
				layer.msg('修改失败!', {icon: 6,time:1000});
			}else{
				layer.msg('服务器出现异常!', {icon: 6,time:1000});
			}
		});
		
	});
}
</script>

</body>
</html>