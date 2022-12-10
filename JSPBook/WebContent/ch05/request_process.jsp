<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String queryString = request.getQueryString();
	%>
	<p> 전송된 요청 파라미터 : <%=queryString%></p>
</body>
</html>