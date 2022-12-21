<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

                            <div class="paging">
                                <c:set var="pageIndex" value="<%=pageIndex%>" />
           
                                	<c:if test="${param.searchKeyWord==null}">
										<c:if test="${pageIndex!=1}">
											<a href="<c:url value="./freeBoardList.do?pageIndex=1" /> ">맨 처음으로</a>
											<a href="<c:url value="./freeBoardList.do?pageIndex=${pageIndex - 1}" /> ">이전</a>
										</c:if>
										
										<c:forEach var="i" begin="<%=pageIndex > 6 ? pageIndex - 5 : 1 %>" end="<%=(pageIndex > 6 ? pageIndex + 5 : 11) > total_page ? total_page : (pageIndex > 6 ? pageIndex + 5 : 11)%>">
											<a href="<c:url value="./freeBoardList.do?pageIndex=${i}" /> ">
												<c:choose>
													<c:when test="${pageIndex==i}">
														<font color='4C5317'><b> [${i}]</b></font>
													</c:when>
													<c:otherwise>
														<font color='4C5317'> [${i}]</font>
						
													</c:otherwise>
												</c:choose>
											</a>
										</c:forEach>
										<c:if test="${pageIndex!=total_page}">
											<a href="<c:url value="./freeBoardList.do?pageIndex=${pageIndex + 1}" /> ">다음</a>
											<a href="<c:url value="./freeBoardList.do?pageIndex=${total_page}" /> ">맨 마지막으로</a>
										</c:if>
									</c:if>                     
                                
                                	<c:if test="${param.searchKeyWord!=null}">
										<c:if test="${pageIndex!=1}">
											<a href="<c:url value="./freeBoardList.do?pageIndex=1&items=${param.searchKeyCode}&text=${param.searchKeyWord}" /> ">맨 처음으로</a>
											<a href="<c:url value="./freeBoardList.do?pageIndex=${pageIndex - 1}&items=${param.searchKeyCode}&text=${param.searchKeyWord}" /> ">이전</a>
										</c:if>
										
										<c:forEach var="i" begin="<%=pageIndex > 6 ? pageIndex - 5 : 1 %>" end="<%=(pageIndex > 6 ? pageIndex + 5 : 11) > total_page ? total_page : (pageIndex > 6 ? pageIndex + 5 : 11)%>">
											<a href="<c:url value="./freeBoardList.do?pageIndex=${i}&items=${param.searchKeyCode}&text=${param.searchKeyWord}" /> ">
												<c:choose>
													<c:when test="${pageIndex==i}">
														<font color='4C5317'><b> [${i}]</b></font>
													</c:when>
													<c:otherwise>
														<font color='4C5317'> [${i}]</font>
						
													</c:otherwise>
												</c:choose>
											</a>
										</c:forEach>
										<c:if test="${pageIndex!=total_page}">
											<a href="<c:url value="./freeBoardList.do?pageIndex=${pageIndex + 1}&items=${param.searchKeyCode}&text=${param.searchKeyWord}" /> ">다음</a>
											<a href="<c:url value="./freeBoardList.do?pageIndex=${total_page}&items=${param.searchKeyCode}&text=${param.searchKeyWord}" /> ">맨 마지막으로</a>
										</c:if>
									</c:if>
									
                                <input id="pageIndex" name="pageIndex" type="hidden" value="1">

                                <div class="btn"><a href="javascript:createFreeboard();">글쓰기</a></div>
                            </div>
                            
                            								<div class="paging">
																<ul>
																	<li class=first><a href="#" onclick="fn_egov_link_page(1); return false;"><img src=/images/img/btnFirst.png style=border:0; alt=처음으로 /></a></li><li class=pre><a href="#" onclick="fn_egov_link_page(1); return false;"><img src=/images/img/btnPre.png style=border:0; alt=이전으로 /></a></li><li class=active><a href="#">1</a></li><li><a href="#" onclick="fn_egov_link_page(2); return false;">2</a></li><li><a href="#" onclick="fn_egov_link_page(3); return false;">3</a></li><li><a href="#" onclick="fn_egov_link_page(4); return false;">4</a></li><li><a href="#" onclick="fn_egov_link_page(5); return false;">5</a></li><li><a href="#" onclick="fn_egov_link_page(6); return false;">6</a></li><li><a href="#" onclick="fn_egov_link_page(7); return false;">7</a></li><li><a href="#" onclick="fn_egov_link_page(8); return false;">8</a></li><li><a href="#" onclick="fn_egov_link_page(9); return false;">9</a></li><li><a href="#" onclick="fn_egov_link_page(10); return false;">10</a></li><li class=next><a href="#" onclick="fn_egov_link_page(11); return false;"><img src=/images/img/btnNext.png style=border:0; alt=다음으로 /></a></li><li class=end><a href="#" onclick="fn_egov_link_page(137); return false;"><img src=/images/img/btnLast.png style=border:0; alt=마지막으로 /></a></li>
							
																</ul>
																<input id="pageIndex" name="pageIndex" type="hidden" value="1"/>
							
																<div class="btn"><a href="javascript:createFreeboard();">글쓰기</a></div>
															</div>

							<div class="paging">
                                <c:set var="pageIndex" value="<%=pageIndex%>" />
           
                                	<c:if test="${param.searchKeyWord==null}">
										<c:if test="${pageIndex!=1}">
											<li class=first><a href="<c:url value="./freeBoardList.do?pageIndex=1" /> "><img src=/images/img/btnFirst.png style=border:0; alt=처음으로 /></a></li>
											<li class=pre><a href="<c:url value="./freeBoardList.do?pageIndex=${pageIndex - 1}" /> "><img src=/images/img/btnPre.png style=border:0; alt=이전으로 /></a></li>
										</c:if>
										
										<c:forEach var="i" begin="<%=pageIndex > 6 ? pageIndex - 5 : 1 %>" end="<%=(pageIndex > 6 ? pageIndex + 5 : 11) > total_page ? total_page : (pageIndex > 6 ? pageIndex + 5 : 11)%>">
											<a href="<c:url value="./freeBoardList.do?pageIndex=${i}" /> ">
												<c:choose>
													<c:when test="${pageIndex==i}">
														<li class=active><font color='4C5317'><b> [${i}]</b></font></li>
													</c:when>
													<c:otherwise>
														<li><font color='4C5317'> [${i}]</font></li>
						
													</c:otherwise>
												</c:choose>
											</a>
										</c:forEach>
										<c:if test="${pageIndex!=total_page}">
											<li class=next><a href="<c:url value="./freeBoardList.do?pageIndex=${pageIndex + 1}" /> ">다음</a></li>
											<li class=end><a href="<c:url value="./freeBoardList.do?pageIndex=${total_page}" /> ">맨 마지막으로</a></li>
										</c:if>
									</c:if>                     
                                
                                	<c:if test="${param.searchKeyWord!=null}">
										<c:if test="${pageIndex!=1}">
											<li class=first><a href="<c:url value="./freeBoardList.do?pageIndex=1&items=${param.searchKeyCode}&text=${param.searchKeyWord}" /> ">맨 처음으로</a></li>
											<li class=pre><a href="<c:url value="./freeBoardList.do?pageIndex=${pageIndex - 1}&items=${param.searchKeyCode}&text=${param.searchKeyWord}" /> ">이전</a></li>
										</c:if>
										
										<c:forEach var="i" begin="<%=pageIndex > 6 ? pageIndex - 5 : 1 %>" end="<%=(pageIndex > 6 ? pageIndex + 5 : 11) > total_page ? total_page : (pageIndex > 6 ? pageIndex + 5 : 11)%>">
											<a href="<c:url value="./freeBoardList.do?pageIndex=${i}&items=${param.searchKeyCode}&text=${param.searchKeyWord}" /> ">
												<c:choose>
													<c:when test="${pageIndex==i}">
														<li class=active><font color='4C5317'><b> [${i}]</b></font></li>
													</c:when>
													<c:otherwise>
														<li><font color='4C5317'> [${i}]</font></li>
						
													</c:otherwise>
												</c:choose>
											</a>
										</c:forEach>
										<c:if test="${pageIndex!=total_page}">
											<li class=next><a href="<c:url value="./freeBoardList.do?pageIndex=${pageIndex + 1}&items=${param.searchKeyCode}&text=${param.searchKeyWord}" /> ">다음</a></li>
											<li class=end><a href="<c:url value="./freeBoardList.do?pageIndex=${total_page}&items=${param.searchKeyCode}&text=${param.searchKeyWord}" /> ">맨 마지막으로</a></li>
										</c:if>
									</c:if>
									
                                <input id="pageIndex" name="pageIndex" type="hidden" value="1">

                                <div class="btn"><a href="javascript:createFreeboard();">글쓰기</a></div>
                            </div>




























</body>
</html>