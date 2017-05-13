<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title><s:text name="loginPage"/></title>
</head>

<body>
<s:form action="login">
<s:textfield name="username" key="user"></s:textfield>
<s:textfield name="password" key="pass"></s:textfield>
<s:submit key="login"></s:submit>
</s:form>
</body>
</html>