<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加轮播</title>
<link rel="stylesheet" type="text/css" href="public/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="public/h-ui.admin/css/H-ui.admin.css" />
</head>
<body>
<article class="page-container">
<form  class="form form-horizontal" id="form-admin-add" action="typeaddBanner" method="post" enctype="multipart/form-data">
   <div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>名称：</label>
		<div class="formControls col-xs-5 col-sm-6">
			<input type="text" class="input-text" value="" placeholder=""  name="bannerName">
		</div>
	</div>

	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>URL：</label>
		<div class="formControls col-xs-5 col-sm-6">
			<input type="text" class="input-text" value="" placeholder=""  name="bannerUrl">
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>图片：</label>
		<div class="formControls col-xs-5 col-sm-6">
			<input type="file" class="input-text" value="" placeholder=""  name="myFile">
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>状态：</label>
		<div class="formControls col-xs-5 col-sm-6">
			 <select class="select" id="" name="status">
			 		<option  value="0">停用</option>
			 		<option  value="1">启用</option>
            </select>
		</div>
	</div>
	<div class="row cl">
		<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
			<input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
    </div>
</form>
</article>
</body>
</html>