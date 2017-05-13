<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>保存页面</title>
</head>
<%
Cookie cookies[] = request.getCookies();  
if (cookies != null)  
{  
    for (int i = 0; i < cookies.length; i++)  
    {  
        if (cookies[i].getName().equals("nick"))  
        {  
            Cookie cookie = new Cookie("nick","ww");//这边得用"",不能用null  
            cookie.setPath("/");//设置成跟写入cookies一样的  
           // cookie.setDomain(".wangwz.com");//设置成跟写入cookies一样的  
            cookie.setMaxAge(0);  
            response.addCookie(cookie);  
        }  
    }  
}  


%>
<body>
   用户名：${userName}<br>
       密码：${password}
   
</body>
</html>