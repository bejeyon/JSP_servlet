<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Scripting Tag</title>
</head>
<body>
<!-- 	Like other locale-sensitive classes, Calendar provides a class method, getInstance, for getting a generally useful object of this type. Calendar's getInstance method returns a Calendar object whose calendar fields have been initialized with the current date and time: -->

<!--      Calendar rightNow = Calendar.getInstance(); -->
	<%! java.util.Calendar expression = java.util.Calendar.getInstance(); %>
	<%= "Current Time : " + expression.getTime() %>
</body>
</html>