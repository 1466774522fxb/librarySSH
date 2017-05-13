<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>图书分类</title>
</head>
<body>
<jsp:include page="../../pages/header.jsp"></jsp:include>
<div class="container content-body">
    <div class="row">
        <div class="col-md-3 hidden-print hidden-xs hidden-sm">
            <div class="sidebar">
                <div class="sidebar-title">
                    <a>
        				分类    </a>
                </div>
                <s:if test="#request.bookType == 0">
                  <div class="sub-title sub-active">
                        <a href="booksClass">
        					全部      </a>
                    </div>
                </s:if>
                <s:else>
                     <div class="sub-title ">
                        <a href="booksClass">
        					全部      </a>
                    </div>
                </s:else>
                
                  <s:iterator value="#request.type">
                   <s:if test=" #request.bookType == id ">
                        <s:set name="typesName" value="typeName"></s:set>
	                    <div class="sub-title sub-active">
	                        <a href="booksClass?classId=${id}">
	        						${typeName}       </a>
	                    </div>
                   </s:if>
                    <s:else>
                      <div class="sub-title">
                        <a href="booksClass?classId=${id}">
        					${typeName}   				</a>
                      </div>
                   </s:else>
                  </s:iterator>
             </div>
        </div>

        <div class="col-md-9">
            <div class="section-box">
                <div class="section-nav">
                      <span>分类</span>&gt;<span><s:if test="#request.bookType == 0">全部</s:if><s:else>
                       <s:property value="#typesName"/>
                      
                      </s:else></span>
                 </div>
                <s:iterator value="#request.books">
	                <div class="list-box clearfix">
	                        <h1 class="text-overflow list-title">
	                            <a href="http://z-innoway.com/index.php?app=web&amp;m=Article&amp;a=detail&amp;id=2621" target="_blank">${bookName}</a>
	                        </h1>
	                        <div class="pull-left list-img">
	                                <a href="" target="_blank">
	                                    <img src="public/uploads/${bookImg}" alt="中关村创业大街恭祝您新春快乐！" style="width:150px;">
	                                </a>
	                        </div>                        
	                        <div class="list-body justify" style="height: 96px;">
	                            ${summary}                     
	                        </div>
	                        <s:set value="counts-loanCount" name="stock"></s:set>
		                    <div class="grey14 ">                         
		                        <span class="glyphicon glyphicon-calendar"></span>${createTime}
		                            &nbsp;&nbsp;&nbsp; <span class="glyphicon glyphicon-user"></span>${author}
		                            &nbsp;&nbsp;&nbsp; <span >库存：${stock}</span>
		                    </div>
		                    <div class="grey14 " style="float:right;"> 
		                        <a class="app-none memberzhuc model-down" href="booksBorrow?ISBN=${ISBN}" data-toggle="modal" data-target=".bs-example-modal-sm">借阅</a>
		                     
		                    </div>
	               </div>
                 </s:iterator>
                  ${pageView}
            </div><!--section-box-->
        </div><!--col-md-9-->
    </div>
</div>
<jsp:include page="../../pages/footer.jsp"></jsp:include>
</body>
</html>