<%@page import="java.util.Calendar"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Action Tag</title>
</head>
<body>
	<h3>param 액션 태그</h3>
	<jsp:include page="param02_data.jsp">
		<jsp:param name="title" value='<%=URLEncoder.encode("오늘의 날짜와 시각")%>'/>
		<jsp:param name="date" value="<%=Calendar.getInstance().getTime()%>"/>
	</jsp:include>
</body>
</html>