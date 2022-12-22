<!-- 회원인증에 성공한 사용자에게 제공되는 페이지 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- JSTL 태그 라이브러리를 사용하기 위한 지시자 -->
<!-- JSTL 태그 라이브러리는 standard.jar와 jstl.jar에서 제공되기에 lib 폴더에 standard.jar와 jstl.jar를 복사해 두어야 함 -->
<%-- 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<c:if test="${empty loginUser}">
	<jsp:forward page='login.do'/>
</c:if>
--%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원관리</title>
	<script type="text/javascript" src="member.js"></script>
</head>
<body>
	<h2>회원 전용 페이지</h2>
	<form action="logout.do">
		<table>
			<tr>
			<td>
			<tr> 
				<td colspan="2" align="center"> 
					<!-- <로그아웃> 버튼 클릭 시 logout.do가 요청되며 이 요청을 받는 서블릿에서 logout.jsp로 이동
							logout.jsp에서 인증된 사용자의 인증을 무효화함 -->	
					<input type="submit" value="로그아웃"> &nbsp;&nbsp;		
					<!-- <회원정보변경> 버튼 클릭 시 회원정보수정페이지로 이동
							memberUpdate.do 요청 시 사용자 아이디를 파라미터로 전달 -->
					<input type="button" value="회원정보변경">
				<!--
					<input type="button" value="회원정보변경" onclick="location.href='memberUpdate.do?member_id=${loginUser.member_id}'">
				-->
			</td> 
			</tr>
		</table>	
	</form>
</body>
</html>