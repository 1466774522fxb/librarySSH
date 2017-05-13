<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加图书页面</title>
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<LINK rel="Bookmark" href="/favicon.ico" >
<LINK rel="Shortcut Icon" href="/favicon.ico" />
<link rel="stylesheet" type="text/css" href="public/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="public/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="public/Hui-iconfont/1.0.7/iconfont.css" />
<link rel="stylesheet" type="text/css" href="public/h-ui.admin/css/style.css" /> 

</head>
<body>
<article class="page-container">
<form  class="form form-horizontal" id="form-book-add" action="booksAdd" method="post" enctype="multipart/form-data">
   <div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>ISBN：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<input type="text" class="input-text" value="" placeholder="" id="ISBN" name="ISBN">
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>书名：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<input type="text" class="input-text" value="" placeholder="" id="bookName" name="bookName">
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>作者：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<input type="text" class="input-text" value="" placeholder="" id="author" name="author">
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>出版社：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<input type="text" class="input-text" value="" placeholder="" id="publish" name="publish">
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>出版日期：</label>
		<div class="formControls col-xs-8 col-sm-9">
		 
		<input type="text" onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d'})" id="datemax" name="createTime" class="input-text Wdate" style="width:120px;">
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>类型：</label>
		<div class="formControls col-xs-8 col-sm-9">
		    <span class="select-box" style="width:150px;">
			<select class="select valid" name="classId" size="1" aria-required="true" aria-invalid="false">
				<s:iterator value="#request.types">
		        <option value="${id}">${typeName}</option>
		      </s:iterator>
			</select><label id="adminRole-error" class="error valid" for="adminRole" style="display: block;"></label>
			</span>
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>图片：</label>
		<div class="formControls col-xs-8 col-sm-9">
		     <input type="file" name="myFile">
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>简介：</label>
		<div class="formControls col-xs-8 col-sm-9">
		    <textarea name="summary"  class="textarea"  placeholder="...100个字符以内" dragonfly="true" ></textarea>
			<p class="textarea-numberbar"><em class="textarea-length">0</em>/100</p>
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>数量：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<input type="text" class="input-text" value="" placeholder="" id="counts" name="counts">
		</div>
	</div>
	<div class="row cl">
		<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
			<input id="addBooks" class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
    </div>
</form>
</article>

</body>
<script type="text/javascript" src="public/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="public/My97DatePicker/WdatePicker.js"></script> 
<script type="text/javascript" src="public/h-ui/js/H-ui.js"></script> 
<script type="text/javascript" src="public/h-ui.admin/js/H-ui.admin.js"></script> 
<script type="text/javascript">
/* $('#addBooks').click(function(){
	var data=$('#form-book-add').serialize();
	$.post('booksAdd',data,function(data){
		console.log("==="+data);
	});
}); */

</script>
</html>