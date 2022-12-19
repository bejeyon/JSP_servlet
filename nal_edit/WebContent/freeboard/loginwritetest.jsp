<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% session.setAttribute("sessionId", "member01");
	%>
	<h3 class="title"><a href="http://localhost:8080/nal_edit/BoardListAction.do">글쓰려고 로그인하기!!</a></h3>
</body>
</html>