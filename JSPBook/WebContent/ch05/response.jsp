<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Implicit Objects</title>
</head>
<body>
	<p>
		<%
			response.setIntHeader("Refresh", 5);
		%>
		<%="현재 시간은 " + (java.util.Calendar.getInstance().getTime())%>
	</p>
	<p><a href="response_data.jsp">Google 홈페이지로 이동하기</a></p>
</body>
</html>