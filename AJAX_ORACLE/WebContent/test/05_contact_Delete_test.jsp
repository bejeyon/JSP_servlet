<%@page import="java.util.Date"%>
<%@page import="com.example.ajax.ContactVO"%>
<%@page import="com.example.ajax.ContactDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head><body>
<%
ContactDao dao = ContactDao.getInstance();
dao.removeContact(1);
out.print("삭제 완료");
%>
</body></html>