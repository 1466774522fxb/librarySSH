<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE >
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,minimum-scale=1,user-scalable=no">
<link rel="stylesheet" type="text/css" href="public/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="public/scss/index.min.css">
<link rel="stylesheet" type="text/css" href="public/scss/zm.css">

</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top u-navbar">
       <div class="container">
	<div class="row">
           <div class="navbar-header">
              
               <a class="navbar-brand" href="/">
                   <figure class="ac-logo-icon pc-none"></figure>
                   <div class="logo-pc-div app-none">
                       <figure class="ac-familybrowser-icon"></figure>
                   </div>
               </a>
           </div>
           <div class="navbar-collapse collapse navbar-right" style="height: auto;">
               <!-- Main navigation -->
               <ul class="nav navbar-nav">
                      <li class="${home}"><a href="typehome">首页</a>${homeLine}</li>
                      <li class="${booksClass}"><a href="booksClass">分类</a>${booksClassLine}</li>
                      <li class="${booksCheap}"><a href="booksCheap">特惠</a>${booksCheapLine}</li>
     	              <s:if test="#session.ACCOUNT != null ">
     	               <li class="${tradeBill}"><a  href="tradeBill">我的书单</a>${tradeBillLine}</li>
     	               <li class="${userCenter}"><a  href="userCenter">个人中心</a>${userCenterLine}</li>
                       </s:if>
               </ul>
               <form class="navbar-form navbar-right" style="margin-right:0;">
                    <s:if test="#session.ACCOUNT == null ">
						<a class="app-none memberzhuc model-down" href="login" data-toggle="modal" data-target=".bs-example-modal-sm">登录</a>
						<a class="app-none memberzhuc model-down" href="register" data-toggle="modal" data-target=".bs-example-modal-sm">注册</a>
                   </s:if>
                   <s:else>
	                   <a  href="register" data-toggle="modal" data-target=".bs-example-modal-sm">${session.ACCOUNT }</a>&nbsp;&nbsp;&nbsp;
	                   <a class="app-none memberzhuc model-down" href="userlogOut" data-toggle="modal" data-target=".bs-example-modal-sm">退出</a>
                   </s:else>
               
               </form>
           </div>
       </div>
    </div>
  </nav>
   
</body>
</html>