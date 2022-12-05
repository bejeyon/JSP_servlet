<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2> Sripting Tag</h2>
<!--JSP 선언문  -->
<%! int count=3;
	String makeItLower(String data){
	return data.toLowerCase();
	}
%>
<!--스트립틀릿  -->
<%
for( int i =1; i <= count ; i++){
	out.println("Java Server Pages " + i + ". <br>");
}//end for
%>

</body>
</html>