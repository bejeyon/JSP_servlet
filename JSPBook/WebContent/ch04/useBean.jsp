<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Action Tag</title>
</head>
<body>
	<h4>구구단 출력하기</h4>
	<jsp:useBean id="multi" class="ch04.com.dao.GuGuDan"></jsp:useBean>
	<%
		int dan = 5;
		for (int i = 1; i <= 9; i++) {
	%>
	<%= "5 * " + i + " = " + multi.process(dan, i) + "<br>" %>
	<%
		}
	%>
</body>
</html>