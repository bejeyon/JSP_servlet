
<%@page import="java.sql.Connection"%>
<%@page import="com.example.ajax.ContactDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> <head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	ContactDao dao = ContactDao.getInstance();
	Connection conn = dao.getConnection();
	out.println("D연동 성공");
	conn.close();

%>
</body> </html>