<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,minimum-scale=1,user-scalable=no">

<link rel="stylesheet" type="text/css" href="public/banner/css/style.css">
<style type="text/css">
   
</style>
<title>首页</title>
</head>
<body>
<jsp:include page="../../pages/header.jsp"></jsp:include>
 <div class="container content-body">
     <div class="content" style="width:100%;height:300px;margin-bottom30px;overflow:hidden;">
		<div id="slider">
		  <s:iterator value="#request.banner">
		     <a href="${url}"><img src="public/uploads/${img}"/></a>
		  </s:iterator>
		</div>
	</div>
	<div style="margin-top: 12px;">
	   <h2>图书类型     >></h2>
	   <s:iterator value="#request.type">
           <div class="col-lg-3  small-1 ">
                <div class="col-div">

                   <a href="booksClass?classId=${id}" style=" text-decoration:none; color: white; cursor:pointer; "><h1>${typeName}</h1></a>
                    
                </div>
            </div>  
        </s:iterator>         
  </div> 
</div>
<script type="text/javascript" src="public/jquery/1.9.1/jquery.min.js"></script>
 <script type="text/javascript" src="public/banner/js/vmc.slider.full.min.js"></script>
	<script type="text/javascript">
		$(function() {
			$('#slider').vmcSlider({
				width: '100%',
				height: 300,
				gridCol: 10,
				gridRow: 5,
				gridVertical: 20,
				gridHorizontal: 10,
				autoPlay: true,
				ascending: true,
				effects: [
					'fade', 'fadeLeft', 'fadeRight', 'fadeTop', 'fadeBottom', 'fadeTopLeft', 'fadeBottomRight',
					'blindsLeft', 'blindsRight', 'blindsTop', 'blindsBottom', 'blindsTopLeft', 'blindsBottomRight',
					'curtainLeft', 'curtainRight', 'interlaceLeft', 'interlaceRight', 'mosaic', 'bomb', 'fumes'
				],
				ie6Tidy: false,
				random: false,
				duration: 2000,
				speed: 900
			});
		});
	</script>
<jsp:include page="../../pages/footer.jsp"></jsp:include>
</body>
</html>