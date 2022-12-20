<%@page import="java.sql.Connection"%>
<%@page import="freeboard.model.*"%>
<%@page import= "java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> <head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
    FreeboardDAO dao = FreeboardDAO.getInstance();
	out.println("DB연동 성공");
	int result = dao.getArticleByArticleno(101, 1).getArticleno();
%>
전체글수<%= result %>
</body> </html>