<%@page import="com.google.gson.GsonBuilder"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.example.ajax.ContactVO"%>
<%@page import="java.util.List"%>
<%@page import="com.example.ajax.ContactDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head><body>
<%
ContactDao dao = ContactDao.getInstance();
List<ContactVO> contacts	   =	dao.getAllContacts();
Gson gson = new GsonBuilder().setDateFormat("yyyy/MM/dd").create();
String result = gson.toJson(contacts); 
%>

<%= result %>

</body></html>