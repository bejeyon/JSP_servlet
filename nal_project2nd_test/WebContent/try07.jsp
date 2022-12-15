<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>2nd</title>
</head>
<body>
    <div class="top"></div>
    <div class="bottom"></div>
    <div class="subTitle"></div>
    <div class="inner">
        <div class="contents" id="bodyWrap">
            <h3 class="title">자유게시판</h3>
            <div class="subContents">
                <div class="body" id="bodyCon">
                    <div class="bodyBox01">
                        <div class="textWrap">
                            <div class="conTxt">
                                <p class="txt01 txt">이 게시판은 이용자들이 자유롭게 의견을 표현하는 공간으로 글 등록 시 작성자의 실명이 공개됩니다.</p>
                                <p class="txt01 txt">인신공격, 욕설, 상업적인 글, 저속한 표현, 동일한 글의 반복 및 선거법 위반 등에 대한 글은 게시자에게
                                    통보하지 않고 삭제될 수 있습니다.</p>
                                <p class="txt01 txt">관계법령을 위반하거나 업무를 방해하는 등 「국회도서관 이용 약관」에서 정한 이용자의 의무를 위반하는 경우
                                    국회도서관 서비스를 제한하거나 정지시킬 수 있습니다.</p>
                                <p class="txt01 txt">국회도서관 이용과 관련된 문의사항은 묻고답하기 게시판을 이용하시기 바랍니다.</p>										
                            </div>
						</div>
                        <div class="conBottomBox conBottomBox2">
                            <div class="outputTxt">
                                <div class="leftTxt">총 1,364건</div>
                                <div class="rightAlign all">
                           <span class="left01 left01_32">
                            <select id="searchKeyCode" name="searchKeyCode" title="검색항목">
                                <option value="00">전체</option>
                                <option value="01">제목</option>
                                <option value="02">제목+내용</option>
                                <option value="03">작성자</option>
                            </select>
                        </span>
                                    <span class="left02 left02_49 left01_w215">
                            <input id="searchKeyWord" name="searchKeyWord" title="검색어 입력" onkeydown="javascript:if(event.keyCode == 13) search();" type="text" value="">
                        </span>
                                    <span class="left03 left03_01">
                               <span class="btn"><a href="javascript:search();">검색</a></span>
                           </span>
                                </div>
                            </div>
                            <div class="tableCon hAuto conShow57">
                                <table class="boardTable" summary="">
                                    <caption>자유게시판 목록에 대한 테이블로 번호, 제목, 작성자, 등록일, 조회로 구성</caption>
                                    <colgroup>
                                        <col style="width:7%;">
                                        <col style="width:58%;">
                                        <col style="width:16%;">
                                        <col style="width:12%;">
                                        <col style="width:7%;">
                                    </colgroup>
                                    <thead>
                                    <tr>
                                        <th scope="col" class="cT01">번호</th>
                                        <th scope="col" class="cT02">제목</th>
                                        <th scope="col" class="cT03">작성자</th>
                                        <th scope="col" class="cT04">등록일</th>
                                        <th scope="col" class="cT05">조회</th>
                                    </tr>
                                    </thead>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>