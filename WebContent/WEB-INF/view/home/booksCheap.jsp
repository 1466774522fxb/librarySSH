<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>图书优惠</title>
</head>
<body>
<jsp:include page="../../pages/header.jsp"></jsp:include>
<div class="container content-body">
<div class="col-md-14">
        <div class="section-box">
        <div class="section-nav">
        <span>特惠</span>
            </div>
        <div class="department">
            <div class="row">
              <s:iterator value="#request.books">
	            <div class="col-sm-6 col-md-4">
	                <div class="in-thumbnail clearfix">
	                    <div class="in-thumbnail-title">
	                        <a href="http://z-innoway.com/index.php?app=web&amp;m=Article&amp;a=detail&amp;id=1" target="_blank">${bookName}</a>
	                    </div>
			            <a  target="_blank">
					        <div class="in-thumbnail-img" style="background:url( public/uploads/${bookImg}) 50% 50% / cover no-repeat">
					         </div>
			            </a>
	                   <div class="in-thumbnail-text justify">
	                        ${summary}                
	                   </div>
	                    <div class="pull-right">
	                        <a  href="booksBorrow?ISBN=${ISBN}" class="btn btn-default" role="button">借阅</a>
	                    </div>
	                </div>
	            </div>
	         </s:iterator>
     
         </div>
       </div>

            ${pageView}
        </div>
  </div>
 </div>
<jsp:include page="../../pages/footer.jsp"></jsp:include>
</body>
</html>