<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Directives Tag</title>
</head>
<body>
	<%@ include file="header.jsp" %>
	<%! java.util.Calendar expression = java.util.Calendar.getInstance(); %>
	<%= "현재 시간 : " + expression.getTime() %>
</body>
</html>