<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4>디비 연동</h4>
	<%
		Context initCtx = new InitialContext(); // InitialContext 객체 생성
		Context envCtx = (Context) initCtx.lookup("java:comp/env"); // lookup 메소드로 DBCP에서 지정한 이름 찾음
		DataSource ds = (DataSource) envCtx.lookup("jdbc/orcl"); // DataSource 형으로 되돌리도록 <Resource> 태그의 type 속성에서 지정
		Connection conn = ds.getConnection(); // lookup메소드로 얻어낸 DataSource 객체로 getConenction() 메소드 호출하여 커넥션 객체 얻어냄
		out.println("DBCP 연동 성공");
	%>
</body>
</html>