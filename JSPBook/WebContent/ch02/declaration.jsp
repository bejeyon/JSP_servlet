<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Scripting Tag</title>
</head>
<body>
	<%! String declaration = "Hello, Java Server Pages";
	String getString() {
		return declaration;
	} %>
	<%= getString() %>
</body>
</html>