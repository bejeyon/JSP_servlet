<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

													<tr>
														<td class="cT01">1365</td>
														<td class="tableTitle cT02">
															
															
															
															
															
																
																	<a href="javascript:freeBoardDetail('4343','2')">수고하십니다</a>
																
																
															
														</td>
														<td class="cT03"><%=member_name%></td>
														<td class="cT04">
																2022-12-20
														</td>
														<td class="cT05">10</td>
													</tr>
													
													<c:choose>
														<c:when test="${searchFreeBoardVO==null}">
															<tr>
																<td>등록된 글이 없습니다.</td>
															</tr>
														</c:when>
														<c:when test="${searchFreeBoardVO!=null}">
															<c:forEach var="list" items="${searchFreeBoardVO}">
																<tr>
																	<td class="tableTitle cT02">${list.articleno}</td>
																	<c:choose>
																		<c:when test="${param.searchKeyWord==null}">
																			<td class="tableTitle cT02"><a href="./freeBoardDetail.do?articleno=${list.articleno}&pageIndex=<%=pageIndex%>">${list.title}</a></td>
																		</c:when>
																		<c:otherwise>
																			<td class="tableTitle cT02"><a href="./freeBoardDetail.do?articleno=${list.articleno}&pageIndex=<%=pageIndex%>&items=${param.items}&text=${param.text}">${list.title}</a></td>
											
																		</c:otherwise>
																	</c:choose>
																	<td class="cT03">${list.member_name}</td>
																	<td class="cT04">${list.writedate}</td>
																	<td class="cT05">${list.hit}</td>
																</tr>										
															</c:forEach>
														</c:when>
													</c:choose>
													
													<c:choose>
														<c:when test="${searchFreeBoardVO==null}">
															<tr>
																<td>등록된 글이 없습니다.</td>
															</tr>
														</c:when>
														<c:when test="${searchFreeBoardVO!=null}">
															<c:forEach var="list" items="${searchFreeBoardVO}">
																<tr>
																	<td class="cT01">${list.articleno}</td>
																	<c:choose>
																		<c:when test="${param.searchKeyWord==null}">
																			<td><a href="./freeBoardDetail.do?articleno=${list.articleno}&pageIndex=<%=pageIndex%>">${list.title}</a></td>
																		</c:when>
																		<c:otherwise>
																			<td><a href="./freeBoardDetail.do?articleno=${list.articleno}&pageIndex=<%=pageIndex%>&items=${param.items}&text=${param.text}">${list.title}</a></td>
											
																		</c:otherwise>
																	</c:choose>
																	<td>${list.member_name}</td>
																	<td>${list.writedate}</td>
																	<td>${list.hit}</td>
																</tr>										
															</c:forEach>
														</c:when>
													</c:choose>





























</body>
</html>