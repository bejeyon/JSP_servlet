<%@page import="dbmanager.DBconnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> <head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Connection conn = DBconnection.getConnection(); // DBconnection의 getConnection() 메소드로 커넥션 객체 얻어냈는지 확인
	out.println("DBCP 연동 성공");
	conn.close();

%>
</body> </html>