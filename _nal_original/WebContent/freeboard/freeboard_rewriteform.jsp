<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*, freeboard.controller.*"
    isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*"%>
<%@ page import="freeboard.model.FreeboardVO"%>

<%
	String sessionId = (String) session.getAttribute("sessionId");
	FreeboardVO freeBoardVO = (FreeboardVO) request.getAttribute("freeBoardVO");
	int articleno = ((Integer) request.getAttribute("articleno")).intValue();
	int pageIndex = Integer.parseInt(request.getParameter("pageIndex"));
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자유게시판</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script type="text/javascript">

	  //<![CDATA[
	
	  	$(function(){
	      	$(document).attr("title","이용자마당>게시판>자유게시판>글쓰기");
	      	
	  		var seq = '5645606'
	  		if(seq!=''){
	  			$("#userSeq").val('5645606');
	  		}
	  	});
	  	
	  	
	  	function isValid(){
	  		
	  	 	var title = $("#title").val();
	  	 	var contents = $("#contents").val();
	  	 
	  	 	if(title == ""){
	  	 		alert("제목을 입력하세요.");
	  			$("#title").focus();
	      		return false;
	  	 	}
	      	
	      	if (contents == "") {
	      		alert("내용을 입력하세요.");
	  			$("#contents").focus();
	      		return false;
	      	}
	      	
	  		return true;
	  	}
	  	
	  	/*
	  	* 자유게시판 등록
	  	*/
	  	function insertFreeBoard(){
	  		
	  		if (${sessionId==null}) {
				alert("로그인 해주세요.");
				return false;
			}
	  		
	  		if( freeBoardVO.title.value == "" ) {
	  			freeBoardVO.title.focus();
	  	        alert("제목을 입력해 주십시오.");
	  	        return false;	  	        
	  	    }
	  		
	  		if( freeBoardVO.contents.value == "" ) {
	  			freeBoardVO.contents.focus();
	  	        alert("내용을 입력해 주십시오.");
	  	        return false;	  	        
	  	    }
	  		
	  		var msg = "자유게시판 등록하시겠습니까?";
	  		
	  		if(isValid()){
	  			if(confirm(msg)){
	  				$("#freeBoardVO").attr("method", "post");
	  				$("#freeBoardVO").attr("action", "./updateFreeboardProc.do").submit();
	  			}
	  		}
	  	}
	  	
	
// 	  	/*
// 	  	* 목록가기
// 	  	*/
// 	  	function reList(){
	  		
// 	  		$("#searchFreeBoardVO").attr("action", "/usermadang/board/freeBoardList.do").submit();
// 	  	}
	
	
// 	  //]]>

    	function reList() {	
	
			if (<%=request.getParameter("searchKeyWord")%>!=null) {
				location.href = "./freeBoardList.do?pageIndex=<%=pageIndex%>&searchKeyCode=${param.searchKeyCode}&searchKeyWord=${param.searchKeyWord}"
			} else {
				location.href = "./freeBoardList.do?pageIndex=<%=pageIndex%>"
			}
		}
		
	</script>
</head>
<body>
    <div class="top"></div>
    <div class="bottom"></div>
    <div class="subTitle"></div>
	<div class="inner">
			<div class="contents" id="bodyWrap">
				<h3 class="title">자유게시판<%=sessionId%></h3>
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
								<form id="freeBoardVO" name="freeBoardVO">
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
													
													<input id="title" name="title" type="text" value="<%=freeBoardVO.getTitle()%>">
													
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
													<pre><textarea id="contents" name="contents"><%=freeBoardVO.getContent()%></textarea></pre>
													<input id="member_id" name="member_id" type="hidden" value="<%=sessionId%>">
													<input id="articleno" name="articleno" type="hidden" value="<%=articleno%>">
													<input id="pageIndex" name="pageIndex" type="hidden" value="<%=pageIndex%>">
												</span>
											</td>
										</tr>
									</tbody></table>
								</form>
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