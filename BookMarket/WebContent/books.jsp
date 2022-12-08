<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Book"%>
<jsp:useBean id="bookDAO" class="dao.BookRepository" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<title>상품 목록</title>
</head>
<body>
	<jsp:include page="menu.jsp"></jsp:include>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">도서 목록</h1>
		</div>
	</div>
	<%
		ArrayList<Book> listOfBooks = bookDAO.getAllBooks();
	%>
	<div class="condainer">
		<div class="column" align="left">
			<%
				for (int i = 0; i < listOfBooks.size(); i++) {
					Book book = listOfBooks.get(i);
			%>
			<div class="col-md-10">
				<h3><%=book.getName()%></h3>
				<p><%=book.getDescription()%></p>
				<p><%=book.getAuthor() + " | " + book.getPublisher() +  " | " + book.getUnitPrice()%>원</p>
				<hr>
			</div>
			<%
				}
			%>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>