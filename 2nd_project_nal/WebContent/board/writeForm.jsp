<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*, controller.*"
    isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*"%>
<%@ page import="model.BoardDTO"%>

<%
	String sessionId = (String) session.getAttribute("sessionId");
	BoardDTO article = (BoardDTO) request.getAttribute("board");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자유게시판</title>
    <script type="text/javascript">
		function reList() {	
	
			location.href = "./BoardListAction.do"
		}
		
		function insertFreeBoard() {	
			
			location.href = "./BoardListAction.do"
		}
	</script>
</head>
<body>
    <div class="top"></div>
    <div class="bottom"></div>
    <div class="subTitle"></div>
	<div class="inner">
			<div class="contents" id="bodyWrap">
				<h3 class="title">자유게시판</h3>
				<div class="subContents" id="contentBody">

					<div class="body" id="bodyCon">
						<!-- 여기서부터 콘텐츠 s -->
						<div class="bodyBox01">

							<div class="textWrap">
								<div class="conTxt">
									<p class="txt01 txt">이 게시판은 이용자들이 자유롭게 의견을 표현하는 공간으로 글 등록 시 작성자의 실명이 공개됩니다.</p>
									<p class="txt01 txt">답변이나 안내를 요구하는 사항에 대해서는 <span class="redTxt">&lt;묻고 답하기&gt;</span> 를 이용하여 주시기 바랍니다.</p>
								</div>
							</div>

							<div class="table01">
								<table>
									<caption>자유게시판 글쓰기 페이지로 제목과 내용으로 구성</caption>
									<colgroup>
										<col style="width:15%;">
										<col style="width:85%;">
									</colgroup>
									<thead>
									<tr>
										<th scope="row">
											<span class="star m_pL0 m_lh38">*</span>
											<label class="bodyTxt fl lh38 m_pl0 t_lh38" for="title">제목</label>
										</th>
										<td>
											<span class="box00 t_pull2 m_pull2">
												<input id="title" name="title" type="text" value="">
											</span>
										</td>
									</tr>
									</thead>
									<tbody><tr>
										<th scope="row">
											<span class="star m_pL0 m_lh38">*</span>
											<label class="bodyTxt fl lh38 m_pl0 t_lh38" for="content">내용</label>
										</th>
										<td>
											<span class="box00 t_pull2 m_pull2">
												<pre><textarea id="content" name="content"></textarea></pre>
											</span>
										</td>
									</tr>
								</tbody></table>
							</div>
							<div class="pagingWrap">
								<div class="btn1 mt0 "><a href="javascript:reList();">목록</a></div>
								<div class="btn2 mt0 mr10"><a href="javascript:insertFreeBoard();">등록</a></div>
							</div>
						</div>
						<!-- 여기까지 콘텐츠 e -->
					</div>
				</div>
			</div>
		</div>
</body>
</html>