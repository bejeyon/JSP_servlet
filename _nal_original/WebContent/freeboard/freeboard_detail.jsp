<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*"%>
<%@ page import="freeboard.model.*"%>
<%@ page import="freeboard.controller.*"%>

<%
	String sessionId = (String) session.getAttribute("sessionId");
	FreeboardVO freeBoardVO = (FreeboardVO) request.getAttribute("freeBoardVO");
	int articleno = ((Integer) request.getAttribute("articleno")).intValue();
	int pageIndex = ((Integer) request.getAttribute("pageIndex")).intValue();
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
			
			
			if (<%=request.getParameter("searchKeyCode")%>!=null) {
				location.href = "./freeBoardList.do?pageIndex=<%=pageIndex%>&searchKeyCode=${param.searchKeyCode}&text=${param.searchKeyWord}"
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
	        <h3 class="title"><a href="<c:url value="./BoardListAction.do" /> ">자유게시판<%=sessionId%></a></h3>
	        <div class="subContents" id="contentBody">
	
	            <div class="body" id="bodyCon">
	                <!-- 여기서부터 콘텐츠 s -->
	                <div class="bodyBox01">
	                    <div class="bottomListBox">
	                        
	                        <div class="tableWrap">
	                            <table>
	                                <caption>자유게시판 뷰 페이지로 제목, 질문자, 등록일로 구성</caption>
	                                <colgroup>
	                                    <col style="width:16%;">
	                                    <col style="width:48%;">
	                                    <col style="width:16%;">
	                                    <col style="width:20%;">
	                                </colgroup>
	                                
	                                    
	                                        <tbody><tr>
	                                            <th scope="row">제목</th>
	                                            <td colspan="3">
	                                                <div class="box01">
	                                                    <%=freeBoardVO.getTitle()%>
	                                                </div>
	                                            </td>
	                                        </tr>
	                                        <tr>
	                                            <th scope="row">질문자</th>
	                                            <td>
	                                                <div class="box01"><%=freeBoardVO.getMember_name()%></div>
	                                            </td>
	                                            <th scope="row">등록일</th>
	                                            <td>
	                                                <div class="box01"><%=freeBoardVO.getWritedate()%></div>
	                                            </td>
	                                        </tr>
	                                    
	                                    
	                                
	                            </tbody></table>
	                        </div><!--//tableWrap -->
	
	                        
	                            
	                                <div class="listView">
	                                    <div class="viewTxt"><%=freeBoardVO.getContent()%></div>
	                                </div>
	                            
	                            
	                        
	
	                        <div class="btnListGo">
	                            <a class="ml10 m_width50px" href="javascript:reList();">목록</a>
								<c:set var="userId" value="<%=freeBoardVO.getMember_id()%>" />
								<c:if test="${sessionId==userId}">
									<p>
										<a	href="./delFreeboardProc.do?articleno=<%=freeBoardVO.getArticleno()%>&pageIndex=<%=pageIndex%>"	class="btn btn-danger"> 삭제</a> 
										<a	href="./freeBoardUpdate.do?articleno=<%=freeBoardVO.getArticleno()%>&pageIndex=<%=pageIndex%>"	class="btn btn-danger"> 수정</a> 
								</c:if>
	                            
	                        </div><!-- //btnListGo -->
	
	                        
	                    </div><!-- //bottomListBox -->
	                </div><!-- //bodyBox01 -->
	
	                <div class="bodyBox02"></div>
	
	                <!-- 여기까지 콘텐츠 e -->
	            </div><!-- //body -->
	        </div><!-- //contentBody -->
	
	    </div>
	</div>
</body>
</html>