<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*"%>
<%@ page import="usermadang.board.model.FreeboardVO"%>
<%@ page import="usermadang.board.model.FreeboardDAO"%>

<%
	String sessionId = (String) session.getAttribute("sessionId");
	FreeboardVO article = (FreeboardVO) request.getAttribute("FreeBoardVO");
// 	int pageIndex = ((Integer) request.getAttribute("pageIndex")).intValue();
	
	FreeboardDAO dao = FreeboardDAO.getInstance();
	String member_name = dao.getLoginNameById(sessionId);
%>




















<!DOCTYPE html>
<html lang="ko"  xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<head>
<meta name="description" content="도서관 소개, 자료검색, 열람실 등 이용안내"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta http-equiv="Expires" content="-1" />


<meta charset="UTF-8">

<meta name="viewport" content="initial-scale=1, user-scalable=no, initial-scale=1">
<meta name="format-detection" content="telephone=no">
<meta http-equiv="Cache-Control" content="no-cache" />
<meta http-equiv="Pragma" content="no-cache" />

<title>이용자마당>게시판>자유게시판</title>
<link  href="${pageContext.request.contextPath}/css/sub.css" rel="stylesheet"/>
<meta name='viewport' content='initial-scale=1, user-scalable=no, initial-scale=1'/>

<link href="${pageContext.request.contextPath}/css/jquery-ui.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/font-awesome.css" rel="stylesheet" />

<link rel="icon" href="${pageContext.request.contextPath}/images/logo/favicon.png" sizes="16x16" />

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/new_common.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/jquery.bxslider.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/fonts.css">


<!--[if lte IE 8]>
<link href="${pageContext.request.contextPath}/css/sub_pc.css" rel="stylesheet"/>
<![endif]-->


<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/jquery-1.11.2.min.js"></script>
<!--<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>-->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-migrate-1.2.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/js_rolling.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jExpand.js"></script>


<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/jquery.bxslider.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/new_common.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/menu_control.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/select2.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/select2.min.js"></script>

<script type="text/javascript">
//<![CDATA[        
 $(function() {
	 $("#deviceType").val('');

  });
//]]>
</script>        

</head>
<body>


	






















<script type="application/ld+json">
    {
        "@context": "http://schema.org",
        "@type": "Organization",
        "name": "국회도서관",
        "url": "http://www.nanet.go.kr",
        "sameAs": [
            "https://www.facebook.com/NationalAssemblyLibraryROK",
            "https://play.google.com/store/apps/details?id=kr.go.nanet.mdl&hl=ko",
            "https://www.youtube.com/channel/UC-bp8PLUgMxMNkdvdlGLznQ",
            "https://blog.naver.com/nalkr2017",
            "https://www.instagram.com/nal_kr"
        ]
    }
</script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/select2_old.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/select2.min.js"></script>


<div class="skip">
    <a href="#bodyWrap">본문 바로가기</a>
    <a href="#menu">주메뉴 바로가기</a>
    <a href="#subMenu">서브메뉴 바로가기</a>
</div>

<!-- top Popup -->



<div class="sub" id="top">
<form name="headerForm"	id="headerForm"	method="post">
    <input type="hidden" name="ret_url" value="" />
    <input type="hidden" name="inter_system" value="" />
    <input type="hidden" name="system" value="" />
    <input type="hidden" name="retURL" value="" />
    <input type="hidden" name="deviceType" id ="deviceType"/>

    
    
        <input type="hidden" name="liveCheck" id="liveCheck" value="N" />
    
</form>

    <div class="header">
        <div class="top">
        
        
            <div class="inner">
                <!-- pc용 로그인 -->
                <div class="loginList pc">
                    <ul>
                        
                            
                            

                                
                                    <li class="new user"><b><%=member_name%></b>님 안녕하세요!</li> <!-- 로그인 시, 노출 -->
                                
                                <!-- 20181128 추가 직원 -->
                                
                                    <li><a href="javascript:logout();">로그아웃</a></li>
                                
                                

                                
                                    <li><a href="/member/modyMember.do">마이페이지</a></li>
                                

                                
                                    
                                        <li><a href="/mylib/bitchReqInfo.do">My Library</a></li>
                                    
                                

                                <li><a href="/english/main.do" target="_blank" title="새창열기">ENGLISH</a></li>
<!--                                 <li><a href="https://www.facebook.com/NationalAssemblyLibraryROK/" target="_blank" title="새창열기">국회도서관 SNS</a></li> -->
                            
                        
                    </ul>
                </div>
            </div>
            
            
        </div>
        
        
        <div class="bottom">
            <div class="inner">
                <div class="logo"><h1><a href="/main.do" title="메인페이지로 이동"><img src="${pageContext.request.contextPath}/resource/images/logo.png" alt="국회도서관 로고"></a></h1></div>

                <!-- 메뉴 -->
                <div class="menu" id="menu">
                    <ul>
                        <li>
                            <a href="/lowcontent/etccontents/assemblyInfoServiceView.do" class="blue">입법서비스</a>
                            <div class="menuList service">
                                <div class="inner">
                                    <div class="text">
                                        <p>입법서비스</p>
                                        <p>입법관련된 서비스를 찾아<br/>보실 수 있습니다.</p>
                                    </div>
                                    <ul>
                                        <li class="menu01">
                                            <a href="/lowcontent/etccontents/assemblyInfoServiceView.do">국회의원·입법부</a>
                                            <ul>
                                                <li><a href="/lowcontent/etccontents/assemblyInfoServiceView.do">의회정보</a></li>
                                                <li><a href="/lowcontent/etccontents/lowInfoServiceView.do">법률정보</a></li>
                                                <li><a href="/lowcontent/etccontents/argos.do">지능형분석</a></li>
                                                <li><a href="/lowcontent/etccontents/humanNetView.do">전문가정보데이터베이스</a></li>
                                                <li><a href="/lowcontent/etccontents/assemblyPolicyDataDBView.do">국회의원 정책자료</a></li>
                                                <li><a href="/lowcontent/etccontents/assemblyNationBodoData.do">국회·국회의원 보도자료</a></li>
                                                <li><a href="/lowcontent/etccontents/communityView.do">국회·지방의회 의정정보</a></li>
                                                <li><a href="/lowcontent/etccontents/dokdoIntro.do">독도홈페이지</a></li> 
                                                <li><a href="/lowcontent/etccontents/assemblyRecordInfoView.do">국회기록정보</a></li> 
                                                <li><a href="/lowcontent/etccontents/assemblyBigDataSet.do">국회회의록 빅데이터</a></li>                                                
                                            </ul>
                                        </li>
                                        <li class="menu02">
                                            <a href="/datasearch/webdb/selectParliamentDBList.do">학술·연구자 클라우드</a>
                                            <ul>
                                                <li><a href="/datasearch/webdb/selectParliamentDBList.do">Web-DB</a></li>
                                                <li><a href="/openaccess/openAccessList.do">오픈액세스 저널</a></li>
                                                <li><a href="/comnet/knowshare/acdemShareView.do">학술연구자정보</a></li>
                                                <li><a href="/comnet/knowshare/cloudView.do">국가학술정보</a></li>
                                            </ul>
                                        </li>
                                        <li class="menu03">
                                            <a href="/comnet/knowshare/knowShareView.do">저작권 서비스</a>
                                            <ul>
                                                <li><a href="/comnet/knowshare/knowShareView.do">지식공유</a></li>
                                                <li><a href="/comnet/knowshare/uciView.do">디지털콘텐츠식별체계</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                        <li>
                            <a href="/datasearch/commant/selectWeekCommantList.do" class="green">책이야기</a>
                            <div class="menuList story">
                                <div class="inner">
                                    <div class="text">
                                        <p>책이야기</p>
                                        <p>도서관련 콘텐츠를<br/>찾아 보실 수 있습니다.</p>
                                    </div>
                                    <ul>
                                        <li class="menu01"><a href="/datasearch/commant/selectWeekCommantList.do">서평</a></li>
                                        <li class="menu02">
                                            <a href="/datasearch/weeknewbook/selectWeekNewBookList.do">신간</a>
                                            <ul>
                                                <li><a href="/datasearch/weeknewbook/selectWeekNewBookList.do">금주의 신간</a></li>
                                                <li><a href="/datasearch/weeklyarticle/selectWeeklyarticleList.do">국내 주간지 기사</a></li>
                                                <li><a href="/datasearch/foreignlibdata/selectForeignLibDataList.do">외국도서관 기증자료</a></li>
                                            </ul>
                                        </li>
<!--                                         <li class="menu03"><a href="/datasearch/issuebook/selectIssueBookList.do">현안과 책</a></li> -->
                                        <li class="menu03"><a href="/libintroduce/etc/monthLibView.do">월간 국회도서관</a></li>
                                        <li class="menu04"><a href="https://www.nanet.go.kr/webzine/202005/main.html" target="_blank" class="wu" title="새창열기">국회도서관 웹진</a></li>
                                        <li class="menu05"><a href="/bookstory/recommendbook/selectRecommendBookList.do">국회의원 추천도서</a></li>



                                        <li class="menu06"><a href="/eBook/eBookInfo.do" >전자책(e-Book)</a></li>
										
                                    	<li class="menu07"><a href="/bookstory/curation/selectBookCurationList.do">북 큐레이션</a></li>
                                    	<!--<li class="menu08"><a href="/bookstory/curation/selectVideoCurationList.do">영상 큐레이션</a></li>-->
										

                                    </ul>
                                </div>
                            </div>
                        </li>
                        <li>
                            <a href="/usermadang/notice/noticeList.do">이용자마당</a>
                            <div class="menuList user">
                                <div class="inner">
                                    <div class="text">
                                        <p>이용자마당</p>
                                        <p>도서관 이용자관련 서비스를<br/>찾아 보실 수 있습니다.</p>
                                    </div>
                                    <ul>
                                        <li class="menu01"><a href="/usermadang/notice/noticeList.do">공지사항</a></li>
                                        <li class="menu02">
                                        

<!-- 												<a href="/usermadang/reqreservation/useReserveInfo.do">신청 및 예약</a> -->

												<a href="/usermadang/bitchBookReqView.do">신청 및 예약</a>

												
                                            <ul>
                                                
                                                

													<li><a href="#" onclick="seatRegister();" title="새창열기">디지털정보센터 좌석예약</a></li>

	<!-- 												<li><a href="#" onclick="seatck();" title="새창열기">디지털정보센터 좌석예약</a></li> -->

													
                                                
                                                <li><a href="/usermadang/etc/nightUseReqView.do">야간 자료이용</a></li>
                                                <li><a href="/usermadang/bitchBookReqView.do">비치희망도서신청</a></li>
                                                <li><a href="/usermadang/etc/copyServiceView.do">자료복사</a></li>
                                                
                                                    <li><a href="/usermadang/etc/mailingServiceView.do">메일링 서비스</a></li>
                                                
                                                <li><a href="/usermadang/reqreservation/visitInfo.do">참관</a></li>

		                                        <!--<li>
		                                        <a href="/usermadang/reqreservation/useReserveInfo.do">국회도서관 이용 예약</a>
		                                        </li>-->

		                                        <!-- //20200702 추가 <span style="padding-left: 3px;vertical-align: none;"></span>-->
                                            </ul>
                                        </li>
                                        
                                        <!-- //20211026 임시 주석 s -->
                                        <li class="menu03">
                                        	<a href="/usermadang/etc/clView.do">납본·기증</a>
		                                    <ul>
		                                        <li><a href="/usermadang/etc/clView.do">납본</a></li>
		                                        <li><a href="/usermadang/etc/donView.do">기증</a></li>
		                                        <li><a href="/usermadang/etc/dataColView.do">자료수집정책</a></li>
		                                    </ul>                                        	
                                        </li> 
                                        <!-- //20211026 임시 주석 e -->
<!--                                         <li class="menu03"><a href="/usermadang/etc/payDonateView.do">납본·기증</a></li> -->
                                        
                                        <li class="menu04"><a href="/usermadang/etc/openApiView.do">Open API</a></li>
                                        <li class="menu05">
                                            <a href="/libaryuseinfo/faqServiceList.do">게시판</a>
                                            <ul>
                                                <li><a href="/libaryuseinfo/faqServiceList.do">자주하는 질문</a></li>
                                                <li><a href="/libaryuseinfo/selectQnaList.do">묻고답하기</a></li>
                                                <li><a href="/usermadang/board/freeBoardList.do">자유게시판</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                        <li>
                            <a href="/libintroduce/etc/greetingView.do">도서관소개</a>
                            <div class="menuList intro">
                                <div class="inner">
                                    <div class="text">
                                        <p>도서관소개</p>
                                        <p>국회도서관을<br/>소개합니다.</p>
                                    </div>
                                    <ul>
                                        <li class="menu01">
                                            <a href="/libintroduce/etc/greetingView.do">국회도서관</a>
                                            <ul>
                                                <li><a href="/libintroduce/etc/greetingView.do">국회도서관장</a></li>
                                                <li><a href="/libintroduce/etc/orgJobView.do">조직 및 업무</a></li>
                                            </ul>
                                        </li>
                                        <li class="menu02">
                                            <a href="/libintroduce/etc/pubDataview.do">개방·공유</a>
                                            <ul>
                                                <li><a href="/libintroduce/etc/pubDataview.do">발간자료</a></li>
                                                <li><a href="/libintroduce/etc/libDataStatusView.do">소장현황</a></li>
                                                <li><a href="/libintroduce/bododata/selectBodoDataList.do">사이버 홍보실</a></li>
                                                <li><a href="/comnet/academeet/academPubView.do">한국학술정보협의회</a></li>
                                                <li><a href="https://open.assembly.go.kr/portal/exposeInfo/guideOpnInfoPage.do" target="_blank" title="새창열기">정보공개</a></li>
                                                <li><a href="/libintroduce/law/relLawList.do" >관계법규</a></li>
                                            </ul>
                                        </li>
                                        <li class="menu04">
                                            <a href="/libaryuseinfo/libUseUserTimeView.do">도서관이용</a>
                                            <ul>
                                                <li><a href="/libaryuseinfo/libUseUserTimeView.do">이용안내</a></li>
                                                <li><a href="/libaryuseinfo/infomationView.do">자료실</a></li>
                                                <li><a href="/libintroduce/etc/libDirectView.do">오시는 길</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div><!-- //메뉴 -->

                <div class="mo btnSearch">
                    <button type="button" class="btn_search">검색</button>
                </div>

                <div class="menuSearch pc">
                    <input type="text" id="searchQuery1" placeholder="홈페이지내 검색" title="검색어 입력창" onkeydown="javascript:if(event.keyCode == 13) totalSearch();" autocomplete="off" />
                    <button type="button" class="btn_search" onclick="totalSearch();">검색</button>
                </div>

                <div class="menuIcon"><a href="#none"><img src="${pageContext.request.contextPath}/resource/images/btn_hambuger.png" alt="전체메뉴"></a></div>
            </div>
        </div>
    </div>
    <div class="menuSearch mo">
    	<div class="btnClose"><button type="button" class="btn_close">닫기</button></div>
    	<input type="text" id="searchQuery2" title="검색어 입력창" placeholder="홈페이지내 검색" onkeydown="javascript:if(event.keyCode == 13) totalSearch();" autocomplete="off"/>
        <button type="button" class="btn_search" onkeydown="javascript:if(event.keyCode == 13) totalSearch();" onclick="totalSearch();">검색</button>
   	</div>

    <!-- 팝업메뉴 -->
    <div class="popupMenu">
        <div class="dim"></div>
        <div class="popupContainer">
            <p><em>전체메뉴</em><span class="close"><a href="#none">닫기</a></span></p>

            <!-- 모바일용 로그인 -->
            <div class="loginList mo">
                <div class="logo"><h1><a href="/main.do"><img src="${pageContext.request.contextPath}/resource/images/logo.png" alt="국회도서관"></a></h1></div>
                <div class="close"><a href="#">닫기</a></div>
                <ul>
                    <li><a href="/english/main.do" target="_blank" title="새창열기">ENGLISH</a></li>
<!--                     <li><a href="https://www.facebook.com/NationalAssemblyLibraryROK/" target="_blank" title="새창열기">국회도서관 SNS</a></li> -->
                    
                        
                            <li><a href="/mylib/mobMember.do">모바일 열람증</a></li>
                        
                    
                    
                </ul>
                <!-- <div class="userForm"><b>홍길동</b>님 안녕하세요!</div> --> <!-- 로그인 시, 노출 -->

                
                    <div class="userForm"><b><%=member_name%></b>님 안녕하세요!</div> <!-- 로그인 시, 노출 -->
                

                <div class="logButton">
                    
                        
                        
                            <!-- 20181128 추가 직원 -->
                            
                                <button class="btn_logout" onclick="logout();">로그아웃</button>
                            
                            
                        
                    
                    <p><a href="javascript:firstWelcomPop();" title="새창열기">처음 방문하셨나요?</a></p>
                </div>
            </div>

            <ul>
                <li>
                    <span>입법서비스</span>
                    <ul class="depth">
                        <li>
                            <a href="/lowcontent/etccontents/assemblyInfoServiceView.do">국회의원·입법부</a>
                            <ul>
                                <li><a href="/lowcontent/etccontents/assemblyInfoServiceView.do">의회정보</a></li>
                                <li><a href="/lowcontent/etccontents/lowInfoServiceView.do">법률정보</a></li>
                                <li><a href="/lowcontent/etccontents/argos.do">지능형분석</a></li>
                                <li><a href="/lowcontent/etccontents/humanNetView.do">전문가정보데이터베이스</a></li>
                                <li><a href="/lowcontent/etccontents/assemblyPolicyDataDBView.do">국회의원 정책자료</a></li>
                                <li><a href="/lowcontent/etccontents/assemblyNationBodoData.do">국회·국회의원 보도자료</a></li>
                                <li><a href="/lowcontent/etccontents/communityView.do">국회·지방의회 의정정보</a></li>
                                <li><a href="/lowcontent/etccontents/dokdoIntro.do">독도홈페이지</a></li>
                                <li><a href="/lowcontent/etccontents/assemblyRecordInfoView.do">국회기록정보</a></li>   
                                <li><a href="/lowcontent/etccontents/assemblyBigDataSet.do">국회회의록 빅데이터</a></li>                               
                            </ul>
                        </li>
                        <li>
                            <a href="/datasearch/webdb/selectParliamentDBList.do">학술·연구자 클라우드</a>
                            <ul>
                                <li><a href="/datasearch/webdb/selectParliamentDBList.do">Web-DB</a></li>
                                <li><a href="/openaccess/openAccessList.do">오픈액세스 저널</a></li>
                                <li><a href="/comnet/knowshare/acdemShareView.do">학술연구자정보</a></li>
                                <li><a href="/comnet/knowshare/cloudView.do">국가학술정보</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="/comnet/knowshare/knowShareView.do">저작권 서비스</a>
                            <ul>
                                <li><a href="/comnet/knowshare/knowShareView.do">지식공유</a></li>
                                <li><a href="/comnet/knowshare/uciView.do">디지털콘텐츠식별체계</a></li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <li>
                    <span class="green">책이야기</span>
                    <ul class="depth">
                        <li><a href="/datasearch/commant/selectWeekCommantList.do">서평</a></li>
                        <li>
                            <a href="/datasearch/weeknewbook/selectWeekNewBookList.do">신간</a>
                            <ul>
                                <li><a href="/datasearch/weeknewbook/selectWeekNewBookList.do">금주의 신간</a></li>
                                <li><a href="/datasearch/weeklyarticle/selectWeeklyarticleList.do">국내 주간지 기사</a></li>
                                <li><a href="/datasearch/foreignlibdata/selectForeignLibDataList.do">외국도서관 기증자료</a></li>
                            </ul>
                        </li>
<!--                         <li><a href="/datasearch/issuebook/selectIssueBookList.do">현안과 책</a></li> onclick="javascript:eBook(); return false;"-->
                        <li><a href="/libintroduce/etc/monthLibView.do">월간 국회도서관</a></li>
                        <li><a href="https://www.nanet.go.kr/webzine/202005/main.html" target="_blank" class="wu" title="새창열기">국회도서관 웹진</a></li>
                        <li><a href="/bookstory/recommendbook/selectRecommendBookList.do">국회의원 추천도서</a></li>


						<li><a href="/eBook/eBookInfo.do" >전자책(e-Book)</a></li>
						
                         <li><a href="/bookstory/curation/selectBookCurationList.do">북 큐레이션</a></li>
				       <!--<li><a href="/bookstory/curation/selectVideoCurationList.do">영상 큐레이션</a></li>    -->                    
						
                    </ul>
                </li>
                <li>
                    <span>이용자마당</span>
                    <ul class="depth">
                        <li><a href="/usermadang/notice/noticeList.do">공지사항</a></li>
                        <li>
                        

<!-- 								<a href="/usermadang/reqreservation/useReserveInfo.do">신청 및 예약</a> -->

								<a href="/usermadang/bitchBookReqView.do">신청 및 예약</a>

								
                            <ul>
                                
                                

 									<li><a href="#" onclick="seatRegister();" title="새창열기">디지털정보센터 좌석예약</a></li>

<!--									<li><a href="#" onclick="seatck();" title="새창열기">디지털정보센터 좌석예약</a></li>  -->

                                    
                                
                                <li><a href="/usermadang/etc/nightUseReqView.do">야간 자료이용</a></li>
                                <li><a href="/usermadang/bitchBookReqView.do">비치희망도서신청</a></li>
                                <li><a href="/usermadang/etc/copyServiceView.do">자료복사</a></li>
                                
                                    <li><a href="/usermadang/etc/mailingServiceView.do">메일링 서비스</a></li>
                                
                                <li><a href="/usermadang/reqreservation/visitInfo.do">참관</a></li>

                               <!-- <li>
                                <a href="/usermadang/reqreservation/useReserveInfo.do">국회도서관 이용 예약</a>
                                </li>-->

                                <!-- //20200702 추가 <span style="padding-left: 3px;vertical-align: none;"></span>-->
                            </ul>
                        </li>
                        
                        <!-- //20211026 임시 주석 s -->
                        <li>
                        	<a href="/usermadang/etc/clView.do">납본·기증</a>
                            <ul>
                                <li><a href="/usermadang/etc/clView.do">납본</a></li>
                                <li><a href="/usermadang/etc/donView.do">기증</a></li>
                                <li><a href="/usermadang/etc/dataColView.do">자료수집정책</a></li>
                            </ul>
                        </li> 
                        <!-- //20211026 임시 주석 e -->
<!--                         <li><a href="/usermadang/etc/payDonateView.do">납본·기증</a></li> -->
                        
                        <li><a href="/usermadang/etc/openApiView.do">Open API</a></li>
                        <li>
                            <a href="/libaryuseinfo/faqServiceList.do">게시판</a>
                            <ul>
                                <li><a href="/libaryuseinfo/faqServiceList.do">자주하는 질문</a></li>
                                <li><a href="/libaryuseinfo/selectQnaList.do">묻고답하기</a></li>
                                <li><a href="/usermadang/board/freeBoardList.do">자유게시판</a></li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <li>
                    <span>도서관소개</span>
                    <ul class="depth">
                        <li>
                            <a href="/libintroduce/etc/greetingView.do">국회도서관</a>
                            <ul>
                                <li><a href="/libintroduce/etc/greetingView.do">국회도서관장</a></li>
                                <li><a href="/libintroduce/etc/orgJobView.do">조직 및 업무</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="/libintroduce/etc/pubDataview.do">개방·공유</a>
                            <ul>
                                <li><a href="/libintroduce/etc/pubDataview.do">발간자료</a></li>
                                <li><a href="/libintroduce/etc/libDataStatusView.do">소장현황</a></li>
                                <li><a href="/libintroduce/bododata/selectBodoDataList.do">사이버 홍보실</a></li>
                                <li>
                                    <a href="/comnet/academeet/academPubView.do">한국학술정보협의회</a>
                                    <ul class="depth3">
<!--                                         <li><a href="/comnet/academeet/meetConferensView.do">제20차 정기총회 및 콘퍼런스</a></li> -->
                                        <li><a href="/comnet/academeet/academPubView.do">협정체결절차</a></li>
                                        <li><a href="/comnet/academeet/academInfoView.do">협의회 및 협정기관 소개</a></li>
                                        
                                    </ul>
                                </li>
                                <li>
                                    <a href="https://open.assembly.go.kr/portal/exposeInfo/guideOpnInfoPage.do" target="_blank" title="새창열기">정보공개</a>
                                    <ul class="depth3">
                                        <li><a href="https://open.assembly.go.kr/portal/exposeInfo/guideOpnInfoPage.do" target="_blank" title="새창열기">정보공개</a></li>
                                        <li><a href="https://open.assembly.go.kr/portal/data/service/selectServicePage.do/OTA0YC001127RJ11880" target="_blank" title="새창열기">업무추진비</a></li>
                                    </ul>
                                </li>
                                <li><a href="/libintroduce/law/relLawList.do" >관계법규</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="/libaryuseinfo/libUseUserTimeView.do">도서관이용</a>
                            <ul>
                                <li>
                                    <a href="/libaryuseinfo/libUseUserTimeView.do">이용안내</a>
                                    <ul class="depth3">
                                        <li><a href="/libaryuseinfo/libUseUserTimeView.do">이용 대상 및 시간</a></li>
                                        <li><a href="/libaryuseinfo/libSetepCencelView.do">이용 제한 자료</a></li>
                                        
                                        <li><a href="/libaryuseinfo/disblePersonUseView.do">장애인 이용</a></li>
                                        <li><a href="/libaryuseinfo/libuseStepView.do">출입 절차 및 준수사항</a></li>
                                        <li><a href="/libaryuseinfo/mobileServiceView.do">모바일 서비스</a></li>
                                    </ul>
                                </li>
                                <li><a href="/libaryuseinfo/infomationView.do">자료실</a></li>
                                <li><a href="/libintroduce/etc/libDirectView.do">오시는 길</a></li>
                            </ul>
                        </li>
                    </ul>
                </li>
                
                <li>
                    <span>마이페이지</span>
                    <ul class="depth">
                        
                            
                            
                                <li><a href="/member/modyMember.do">개인정보수정</a></li>
                                <li><a href="/member/delMember.do">회원탈퇴</a></li>
                            
                        
                    </ul>
                </li>
                
                
                    
					<!-- DR -->
                   <li>
                        <span>My Library</span>
                        <ul class="depth">
                            <li><a href="/mylib/bitchReqInfo.do">비치희망도서내역</a></li>
                            <li><a href="/mylib/mobMember.do">모바일 열람증</a></li>
                            <li>
                                
                                <a href="https://dl.nanet.go.kr/loan/loanBasketList.do?loanGubun=R" title="야간이용 자료신청으로 새창열림" target="_blank">야간이용 신청내역</a>
                                
                            </li>
                            <li><a href="https://dl.nanet.go.kr/mylist/list.do" target="_blank" title="새창열림">내서재</a></li>
                        </ul>
                    </li> 
                    
                
                <li>
                    <span>기타</span>
                    <ul class="depth">
                        <li><a href="/member/persionlInfoView.do">개인정보처리방침</a></li>
                        <li><a href="/member/mailrefusalView.do">이메일수집거부</a></li>
                        <li><a href="/member/totalsearchList.do">홈페이지 내 검색</a></li>
                        <li><a href="/main.do?flag=dl">전자도서관 검색</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div><!-- //팝업메뉴 -->



    <form name="memberShipFrm" id="memberShipFrm">
        <input type="hidden" name="retURL" id="member_retURL" value="membership"/>
        <input type="hidden" name="parentUrl" id="parentUrl_mem" value="membership"/>
    </form>

    <form name="eBookFrm" id="eBookFrm">
        <input type="hidden" name="docs_id" id="docs_id" />
        <input type="hidden" name="docs_pwd" id="docs_pwd" />
        <input type="hidden" name="docs_yn" id="docs_yn" />
    </form>

    <form name="frm" id="frm" >
        <input type="hidden" name="retUrl" id="frm_retUrl" />
        <input type="hidden" name="parentUrl" id="frm_parentUrl"	value="seatUrl"/>
        <!--<input type="hidden" name="id" id="libMemberId" value=""/>
        <input type="hidden" name="password" id="libMemberPw" value=""/>-->
    </form>

    <form name="subHeaderForm" id="subHeaderForm" method="post">
        
        <input type="hidden" name="searchQuery" id="searchQuery" value="" />
    </form>

	<form id="reserveFrm3" method="post">
<!-- 		<input type="hidden" name="retURL" value="useReserve" /> -->
	</form>
	
    <script type="text/javascript">


        $(window).resize(function(){
            var width = window.outerWidth;
            if(width <= 767){
                $('[data-search-type="home"]').hide();
                $('[data-search-type="elec"]').show();
                $('#selectSearchType').val('E').prop('selected', true);
            }
        });


        function logout(){
            /*if('null' == "Y"){
                document.headerForm.action="/nexess/sso/sloExe.jsp?RelayState=/logout.do";
            }else{*/
                document.headerForm.action="/logout.do";
            /*}*/
            document.headerForm.submit();
        }


        // 20181128 추가 직원
        function docsLogout(){
            document.headerForm.action="/logout.do";
            document.headerForm.submit();
        }


        function fnMovePage(type){      	
            switch (type) {
                case 1: $('#headerForm').attr('action', '/member/selectMember.do').submit();
                    break;
                case 2: $('#headerForm').attr('action',  '/loginForm.do').submit();
                    break;
            }
        }


        function goMbileMembership(){	
            var seq = '5645606';
            if(seq == '' || seq == null){
                if(navigator.userAgent.toLowerCase().search('mobile') > -1){
                    $("#mpcGbn").val("m");
                }else{
                    $("#mpcGbn").val("p");
                }
                $("#memberShipFrm").attr("action", "/loginForm.do").submit();
            }else{
                $("#memberShipFrm").attr("action", "/mylib/mobMemberDetail.do").submit();
            }
        }


        function firstWelcomPop() {
            window.open("/main/firstWelcomPopup.do","firstPopup","width=407, height=440, scrollbars=yes,toolbar=no,resizable=no,menubar=no,status=no");
        }


        function winPopup() {
            window.open("/main/siteListPop.do", "banner_list","width=410, height=200, scrollbars=no, resizable=0");
        }


        // 팝업존
        function eventPopup(seq) {
            var numScreenWidth	= screen.width;
            var numScreenHeight	= screen.height;

            var width = 400;
            var height = 675; //520
            /*
            if(seq == '391'){
                width = 700;
                if(numScreenHeight <= 900){
                    height = 800;
                }else{
                    height = 990; // 900 + 155
                }
            }
            */

            if(seq == '521'){
                window.open("/main/popupNotice.do", "popupNotice","width=501, height=863, scrollbars=no, resizable=no");
            }

            else if(seq == '523'){
                window.open("/main/popupNotice.do", "popupCopy","width=501, height=885, scrollbars=no, resizable=no");
            }

            else{
                window.open("/main/popupEvent.do?popupSeq=" + seq, "eventPopup","width="+width+", height="+height+", scrollbars=no, resizable=no");
            }
        }


        function urgentNoticeClose(){
            $('#topPopup').slideUp();
        }


//          20181224 전자자료(e-Book)  
        function eBook(){
            var ccd = 'P';
            var id = 'jypnal';
            var pwd = '!8JXkRhYUpyys';

            if(ccd == "E"){
                // 직원로그인
                $("#docs_id").val(id);
                $("#docs_pwd").val(pwd);
                $("#docs_yn").val('Y');

                $("#eBookFrm").attr("target","_blank");
                $("#eBookFrm").attr("action", "http://e-book.nanet.go.kr/" ); //http://e-book.nanet.go.kr:8080/(개발), http://e-book.nanet.go.kr/(운영)
                $("#eBookFrm").submit();
            }
        }



        // 홈페이지 내 검색
        function totalSearch(){
            var width = window.outerWidth;
            if(width <= 767){
                $('#searchQuery').val($('#searchQuery2').val());
            }else{
                $('#searchQuery').val($('#searchQuery1').val());
            }

            $('#subHeaderForm').attr('action', '/member/totalsearchList.do');
            $('#subHeaderForm').submit();
        }

        //webzin url
        $(function(){
    		$.ajax({
    			type: "post"
    			, async: false
    			, dataType: "json"
    			, url: "/main/selectWebzineUrl.do"
    			, success: function(resultData) {
    				var url = resultData.data[0].url;
    				$('.wu').attr('href', url);
    				
    			}, error: function(data, status, err) {
    				alert("서버와의 통신이 실패했습니다.");
    				console.log(data);
    	        }
    		});            
        });


        function fnHeaderLogin(){
        	$("#reserveFrm3").attr("action", "/loginForm2.do").submit();
        }
        
    	function seatck() {
    		window.open("https://www.nanet.go.kr/main/seatPopup.do", "seatPopup","width=336, height=350, scrollbars=0, resizable=0");
    	}


        //디지털정보센터 좌석예약
        function seatRegister(){
            var seq	= '5645606';
            if(seq == '' ||	seq == null){
                if(navigator.userAgent.toLowerCase().search('mobile') >	-1){
                    $("#mpcGbn").val("m");
                }else{
                    $("#mpcGbn").val("p");
                }
                $("#frm_retUrl").val("seatUrl");
                $("#frm").attr("action", "/loginForm.do").submit();
            }else{
                // 20201218 좌석예약 연계방식 변경
                // [dev]
                //var seatUrl = 'http://seat-dev2.nanet.go.kr:7700/login_library';
                // [real]



//                 $('#frm').attr('target', '_blank');
//                 $('#frm').attr('action', seatUrl).submit();
				location.href = 'http://seat.nanet.go.kr:7700/login_library?id=jypnal&password=!8JXkRhYUpyys';
            }
        }
    </script>

</div>
	















<script type="text/javascript">

    $(function(){
        fnCurrentMenuCheck();
    });

    function ipck(){
        window.open("/main/ipChkPopup.do","acDbipPopup","width=336, height=250, scrollbars=0, resizable=0");
        //푸터쪽 관련사이트 컨트롤러
    }

	function seatck() {
		window.open("https://www.nanet.go.kr/main/seatPopup.do", "seatPopup","width=336, height=350, scrollbars=0, resizable=0");
	}
	
</script>

<div class="wrap">
    <div class="inner">
        <!-- 왼쪽메뉴 -->
        <div class="leftMenu" id="subMenu">
            <ul class="side-menu">
                <li data-url="/usermadang/notice/noticeList.do, /usermadang/notice/noticeDetail.do">
                    <a href="/usermadang/notice/noticeList.do">공지사항</a>
                </li>
                <li data-url="/usermadang/etc/nightUseReqView.do, /usermadang/bitchBookReqView.do, /usermadang/etc/copyServiceView.do,
                                /usermadang/etc/mailingServiceView.do, /usermadang/etc/updateMailing.do, /usermadang/etc/delMailing.do,
                                /usermadang/reqreservation/visitInfo.do, /usermadang/reqreservation/visitdateView.do, /usermadang/reqreservation/visitresult.do,
                                /usermadang/reqreservation/visityensu.do, /usermadang/reqreservation/useReserveInfo.do, 
                                 /usermadang/reqreservation/useReserve.do ">
                                 

<!-- 								<a href="/usermadang/reqreservation/useReserveInfo.do">신청 및 예약</a>					 -->

                    			<a href="/usermadang/bitchBookReqView.do">신청 및 예약</a>							

					
                    <ul>
                        
                            <li>
                            

								<a href="#"  onclick="seatRegister();" title="새창열기">디지털정보센터 좌석예약</a>					

<!-- 								<a href="#" onclick="seatck();" title="새창열기">디지털정보센터 좌석예약</a>							 -->

								
                            </li>
                        
                        <li data-url="/usermadang/etc/nightUseReqView.do"><a href="/usermadang/etc/nightUseReqView.do">야간 자료이용</a></li>
                        <li data-url="/usermadang/bitchBookReqView.do"><a href="/usermadang/bitchBookReqView.do">비치희망도서신청</a></li>
                        <li data-url="/usermadang/etc/copyServiceView.do"><a href="/usermadang/etc/copyServiceView.do">자료복사</a></li>
                        
                            <li data-url="/usermadang/etc/mailingServiceView.do, /usermadang/etc/updateMailing.do, /usermadang/etc/delMailing.do">
                                <a href="/usermadang/etc/mailingServiceView.do">메일링 서비스</a>
                            </li>
                        
                        <li data-url="/usermadang/reqreservation/visitInfo.do, /usermadang/reqreservation/visitdateView.do, /usermadang/reqreservation/visitresult.do,
                                        /usermadang/reqreservation/visityensu.do">
                            <a href="/usermadang/reqreservation/visitInfo.do">참관</a>
                        </li>

							<!-- <li data-url="/usermadang/reqreservation/useReserveInfo.do, /usermadang/reqreservation/useReserve.do">
								<a href="/usermadang/reqreservation/useReserveInfo.do">국회도서관 이용 예약  --> 
<!-- 								<span style="padding-left: 3px;"><img src="/images/img/new.png" alt="new" style="vertical-align:middle;"></span> //사용안함 -->
<!-- 								</a> -->
<!-- 							</li> -->

                    </ul>
                </li>
                <!-- //20211026 임시 주석 s -->
                 <li data-url="/usermadang/etc/clView.do, /usermadang/etc/donView.do, /usermadang/etc/dataColView.do">
                	<a href="/usermadang/etc/clView.do">납본·기증</a>
                	<ul>
                		<li data-url="/usermadang/etc/clView.do"><a href="/usermadang/etc/clView.do">납본</a></li>
                		<li data-url="/usermadang/etc/donView.do"><a href="/usermadang/etc/donView.do">기증</a></li>
                		<li data-url="/usermadang/etc/dataColView.do"><a href="/usermadang/etc/dataColView.do">자료수집정책</a></li>
                	</ul>
                </li>
                <!-- //20211026 임시 주석 e -->
<!--                 <li data-url="/usermadang/etc/payDonateView.do"><a href="/usermadang/etc/payDonateView.do">납본·기증</a></li> -->
                
                <li data-url="/usermadang/etc/openApiView.do"><a href="/usermadang/etc/openApiView.do">Open API</a></li>
                <li data-url="/libaryuseinfo/faqServiceList.do, /libaryuseinfo/selectQnaList.do, /libaryuseinfo/selectQnaDetail.do,
                                /usermadang/board/freeBoardList.do, /usermadang/board/freeBoardDetail.do, /usermadang/board/freeBoardForm.do,
                                /usermadang/board/freeBoardAnswer.do, /usermadang/board/reFreeBoardForm.do, /libaryuseinfo/qnaWriterForm.do, /libaryuseinfo/selectQnaModeForm.do">
                    <a href="/libaryuseinfo/faqServiceList.do">게시판</a>
                    <ul>
                        <li data-url="/libaryuseinfo/faqServiceList.do"><a href="/libaryuseinfo/faqServiceList.do">자주하는 질문</a></li>
                        <li data-url="/libaryuseinfo/selectQnaList.do, /libaryuseinfo/selectQnaDetail.do, /libaryuseinfo/qnaWriterForm.do, /libaryuseinfo/selectQnaModeForm.do">
                            <a href="/libaryuseinfo/selectQnaList.do">묻고답하기</a>
                        </li>
                        <li data-url="/usermadang/board/freeBoardList.do, /usermadang/board/freeBoardDetail.do, /usermadang/board/freeBoardForm.do,
                                        /usermadang/board/freeBoardAnswer.do, /usermadang/board/reFreeBoardForm.do">
                            <a href="/usermadang/board/freeBoardList.do">자유게시판</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
        <!-- //왼쪽메뉴 -->
    </div>

	













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
	 	var content = $("#content").val();
	 
	 	if(title == ""){
	 		alert("제목을 입력하세요.");
			$("#title").focus();
    		return false;
	 	}
    	
    	if (content == "") {
    		alert("내용을 입력하세요.");
			$("#content").focus();
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
  		
  		if( writing.title.value == "" ) {
  			writing.title.focus();
  	        alert("제목을 입력해 주십시오.");
  	        return false;	  	        
  	    }
  		
  		if( writing.content.value == "" ) {
  			writing.content.focus();
  	        alert("내용을 입력해 주십시오.");
  	        return false;	  	        
  	    }
  		
  		var msg = "자유게시판 등록하시겠습니까?";
  		
  		if(isValid()){
  			if(confirm(msg)){
  				$("#freeBoardVO").attr("method", "post");
  				$("#freeBoardVO").attr("action", "./freeboardProc.do").submit();
  			}
  		}
		
// 		var msg = "자유게시판 등록하시겠습니까?";
		
// 		if(isValid()){
// 			if(confirm(msg)){
// 				$("#freeBoardVO").attr("action", "/usermadang/board/freeboardProc.do").submit();
// 			}
// 		}
	}
	

	/*
	* 목록가기
	*/
	function reList(){
		
		if (<%=request.getParameter("searchKeyWord")%>!=null) {
			location.href = "./freeBoardList.do?pageIndex=<%=pageIndex%>&searchKeyCode=${param.searchKeyCode}&searchKeyWord=${param.searchKeyWord}"
		} else {
			location.href = "./freeBoardList.do?pageIndex=<%=pageIndex%>"
		}
		
// 		$("#searchFreeBoardVO").attr("action", "/usermadang/board/freeBoardList.do").submit();
	}


//]]>
</script>
<form id="freeBoardVO" action="/usermadang/board/freeBoardForm.do" method="post">
<input id="userSeq" name="userSeq" type="hidden" value="5645606"/>
<input type="hidden" id="hi_parent" name="hi_parent" value=""/>

	<div class="contentsContainer">
		<div class="subTitle">
			<div class="inner">
				<h2>이용자마당</h2>
				<div class="location">
					<ol>
						<li class="home"><img src="${pageContext.request.contextPath}/resource/images/icon_home.png" alt="홈"/></li>
						<li>이용자마당</li>
						<li>게시판</li>
						<li>자유게시판</li>
					</ol>
				</div>
			</div>
		</div>
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
										<col style="width:15%;"/>
										<col style="width:85%;"/>
									</colgroup>
									<thead>
									<tr>
										<th scope="row">
											<span class="star m_pL0 m_lh38">*</span>
											<label class="bodyTxt fl lh38 m_pl0 t_lh38" for="title">제목</label>
										</th>
										<td>
											<span class="box00 t_pull2 m_pull2">
												<input id="title" name="title" type="text" value=""/>
											</span>
										</td>
									</tr>
									</thead>
									<tr>
										<th scope="row">
											<span class="star m_pL0 m_lh38">*</span>
											<label class="bodyTxt fl lh38 m_pl0 t_lh38" for="content">내용</label>
										</th>
										<td>
											<span class="box00 t_pull2 m_pull2">
												<pre><textarea id="content" name="content"></textarea></pre>
												<input id="member_id" name="member_id" type="hidden" value="<%=sessionId%>">
											</span>
										</td>
									</tr>
								</table>
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
	</div>
</form>

<form id="searchFreeBoardVO" action="/usermadang/board/freeBoardForm.do" method="post">
	<input id="searchKeyCode" name="searchKeyCode" type="hidden" value="00"/>
	<input id="searchKeyWord" name="searchKeyWord" type="hidden" value=""/>
	<input id="pageIndex" name="pageIndex" type="hidden" value="1"/>
</form>
	





<!-- [start] 접속 로그 -->
<script type="text/javascript">

    //컨텐츠 경로 구분 값(전체페이지 공통)
    var _TRK_CP = "";
    var TEXT = "";
    $('.location li').each(function(index, item){
        if(index > 0){
            if(window.location.href.indexOf('monthLibView.do') > -1){
                TEXT = '월간 국회도서관';
            }else{
                TEXT = $(item).find('a').text();
            }
            _TRK_CP += "^"+TEXT;
        }
    });






    



    // 연령 추출
    function getAges(birthday){
        var ages = new Date().getFullYear() - Number(birthday.substr(0,4)) + 1;

        if(ages <= 9){
            return "A";
        }else if(ages <= 19){
            return "B";
        }else if(ages <= 29){
            return "C";
        }else if(ages <= 39){
            return "D";
        }else if(ages <= 49){
            return "E";
        }else if(ages <= 59){
            return "F";
        }else if(ages <= 69){
            return "G";
        }else if(ages >= 70){
            return "H";
        }else{
            return "";
        }
    }
</script>


    <script type='text/javascript' src="${pageContext.request.contextPath}/js/bs_trk.js"></script>

<script type="text/javascript" defer='defer'>/* CLICKZONE SCRIPT V.V.4 *//*X*//* COPYRIGHT 2002-2017 BIZSPRING INC. *//*X*//* DO NOT MODIFY THIS SCRIPT. *//*X*/


    var _CZN = "29"; //운영서버 : 10

</script>
<script type='text/javascript' defer="defer" src="https://webstat.nanet.go.kr/InsightTrk/js/InsightClickZone.js"></script>
<!-- [end] 접속 로그 -->



<form name="footerForm" method="post">
    <input type="hidden" name="deviceType" value="mob"/>
</form>


    <!-- footer contents -->
    <div class="footerContents">
        <div class="inner">
            <div class="chatBot">
            <!-- DR 제거 -->
                <a href="#" id="floating_box" title="새창열림"><img src="${pageContext.request.contextPath}/resource/images/img_chatbot.png" alt="챗봇" /></a>
            </div>
            <div class="footerTopBox">
                <ul class="pvLink">
                    <li><a href="/member/persionlInfoView.do">개인정보처리방침</a></li>
                    <li><a href="/member/mailrefusalView.do">이메일수집거부</a></li>
                    <li class="mo"><a href="#top">TOP</a></li>
                </ul>

                <div class="frmLink snsW480">

                	<div class="snsMl75">
                     
                		<a href="https://www.youtube.com/c/NALKR" target="_blank" title="YouTube 새창열기" class="snsBt10" style="background-color:#ffffff;width: 25px;margin-right:10px;">
                			<img src="${pageContext.request.contextPath}/images/sns/sns_1.png" alt="YouTube" style="width:25px;margin-top: 8px;"/>
                		</a>
                		<a href="https://www.instagram.com/nal_kr/"  target="_blank" title="Instagram 새창열기"  class="snsBt10" style="background-color:#ffffff;width: 25px;margin-right:10px;">
                			<img src="${pageContext.request.contextPath}/images/sns/sns_2.png" alt="Instagram" style="width:25px;margin-top: 8px;"/>
                		</a>
                		<a href="https://www.facebook.com/NationalAssemblyLibraryROK" target="_blank" title="Facebook 새창열기"  class="snsBt10" style="background-color:#ffffff;width: 25px;margin-right:10px;">
                			<img src="${pageContext.request.contextPath}/images/sns/sns_3.png" alt="Facebook" style="width:25px;margin-top: 8px;"/>
                		</a>
                		<a href="https://blog.naver.com/nalkr2017" target="_blank" title="블로그 새창열기"  class="snsBt10" style="background-color:#ffffff;width: 25px;margin-right:10px;">
                			<img src="${pageContext.request.contextPath}/images/sns/sns_4.png" alt="블로그 " style="width:25px;margin-top: 8px;"/>
                		</a>
                                    		
                	</div>
                	                
                    <form name="footerLinkForm" id="footerLinkForm"></form>
                    <fieldset>
                        <legend>관련사이트</legend>
                        <div class="siteLink">
                            <select name="siteLink" id="siteLink" title="관련사이트 바로가기">
                            	<option value="23" title="국회부산도서관">국회부산도서관</option>
                                <option value="1" title="대한민국 국회">대한민국 국회</option>
                                <option value="2" title="국회사무처">국회사무처</option>
                                <option value="3" title="국회예산정책처">국회예산정책처</option>
                                <option value="4" title="국회입법조사처">국회입법조사처</option>
                                <option value="20" title="국회미래연구원">국회미래연구원</option>
                                <option value="7" title="국회기록보존소">국회기록보존소</option>
                                <option value="21" title="헌법재판소도서관">헌법재판소도서관</option>
                                <option value="5" title="선거정보도서관">선거정보도서관</option>
                                <option value="6" title="한국학술지인용색인">한국학술지인용색인</option>
                                <option value="8" title="국가전자도서관">국가전자도서관</option>
                                <option value="9" title="국가정책연구포털">국가정책연구포털</option>
                                <option value="16" title="국가학술정보 클라우드">국가학술정보 클라우드</option>
                                <!-- <option value="18" title="독도홈페이지">독도홈페이지</option> -->
                                <option value="17" title="디지털콘텐츠식별체계">디지털콘텐츠식별체계</option>
                                <option value="19" title="학술연구자정보 공유">학술연구자정보 공유</option>
                                <option value="22" title="지능형 분석(아르고스)">지능형 분석(아르고스)</option>
                            </select>
                        </div>
                        <a href="javascript:footerLink($('#siteLink').val());" title="새창열림">이동</a>
                    </fieldset>
                </div>
            </div>

            <div class="footerBottomBox">
                <p class="copyright">
                    국회도서관 - 서울특별시 영등포구 의사당대로 1 (여의도동) (우07233)<br>
                    홈페이지 관련 문의 : webw3@nanet.go.kr  /  전화문의 : 02-6788-4211, 080-788-4211(수신자 부담)<br>
                    Copyright ⓒ 대한민국 국회도서관 All rights reserved.
                </p>
                <div class="otherban">
                    
                        <a href="https://ccl.cckorea.org" target="_blank" title="새창열림">
                    
                            <img src="${pageContext.request.contextPath}/resource/images/img/logoSite01.png" alt="creativecommons">
                        </a>
                    
                        <a href="http://www.webwatch.or.kr/Situation/WA_Situation.html?MenuCD=110" target="_blank" title="새창열림">
                    
                            <img src="${pageContext.request.contextPath}/resource/images/img/logoSite02.png" alt="과학기술정보통신부 WA WEB접근성(웹 접근성 품질인증 마크) (사)한국시각장애인연합회 2021.12.28~2022.12.27" title="과학기술정보통신부 WA WEB접근성 (사)한국시각장애인연합회 2021.12.28~2022.12.27" />
                        </a>

                    <a href="#" onclick="footerLink('12');" title="새창열림">
                        <img src="${pageContext.request.contextPath}/resource/images/img/logoSite04.png" alt="107 손말이음센터 연중무휴 국번없이 107 청각,언어장애인 의사소통 지원">
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>


<script type="text/javascript">


    // link box
    $('.quickMenu ul li a ').click(function(e){
        var id = $(this).attr("id");
        var txt = $("#"+id).find("span").text();

        _trk_clickTrace("EVT", txt);
    });


    function winPopup(){
        window.open("/main/siteListPop.do","banner_list","width=410, height=200, scrollbars=0, resizable=0");//푸터쪽 관련사이트 컨트롤러
    }


    function deviceMobChange(){
        document.footerForm.submit();
    }


    // 관련사이트 컨트롤러
    function ipck() {
        var sideLink = $('#siteLink').val();
        window.open("/main/ipChkPopup.do", "acDbipPopup","width=336, height=350, scrollbars=0, resizable=0");
        if(sideLink == "18"){
            $("#footerLinkForm").attr("target", "_blank");
            $("#footerLinkForm").attr("action","http://dokdo.nanet.go.kr/dokdo/").submit();
        }
    }


    function footerLink(gubun) {

        var userIp = "123.14";
        if(userIp == '10.201' || userIp == '10.202' || userIp == '0:0:0:'){
            if(gubun != "1" && gubun != "2" && gubun != "3" && gubun != "4" && gubun != "20" && gubun != "22"  && gubun != "23"  && gubun != "7"){
                ipck();
                return;
            }
        }        	


        $("#footerLinkForm").attr("target", "_blank");

        if (gubun == "1") {
            // 대한민국 국회
            $("#footerLinkForm").attr("action","https://www.assembly.go.kr").submit();
        } else if (gubun == "2") {
            // 국회사무처
            $("#footerLinkForm").attr("action", "https://nas.assembly.go.kr/nas/index.do").submit();
        } else if (gubun == "3") {
            // 국회예산정책처
            $("#footerLinkForm").attr("action","https://www.nabo.go.kr/index.jsp").submit();
        } else if (gubun == "4") {
            // 국회입법조사처
            $("#footerLinkForm").attr("action","https://www.nars.go.kr/index.do").submit();
        } else if (gubun == "20") {
            // 국회미래연구원 (30 임의 부여)
            $("#footerLinkForm").attr("action","https://www.nafi.re.kr/new/index.do").submit();
        } else if (gubun == "5") {
            // 선거정보도서관
            $("#footerLinkForm").attr("action","https://elecinfo.nec.go.kr/neweps/main.do").submit();
        } else if (gubun == "6") {
            // 한국학술지인용색인
            $("#footerLinkForm").attr("action", "https://www.kci.go.kr/kciportal/main.kci").submit();
        } else if (gubun == "8") {
            // 국가전자도서관
            $("#footerLinkForm").attr("action", "https://www.dlibrary.go.kr").submit();
        } else if (gubun == "9") {
            // 국가정책연구포털
        	$("#footerLinkForm").attr("action","https://www.nkis.re.kr:4445/main.do").submit();
        } else if (gubun == "16") {
            // 국가학술정보 클라우드
            $("#footerLinkForm").attr("action","https://cloud.nanet.go.kr/main.do").submit();
        } else if (gubun == "18") {
            // 독도홈페이지
        	$("#footerLinkForm").attr("action","http://dokdo.nanet.go.kr/dokdo/").submit();
        } else if (gubun == "17") {
            // UCI
            $("#footerLinkForm").attr("action","https://www.uci.or.kr/").submit();
        } else if (gubun == "19") {
            // 국가학술연구자정보 공유
            $("#footerLinkForm").attr("action","https://www.scholar.go.kr").submit();
        } else if (gubun == "31") {
            // 국회법률정보 (31 임의 부여)
            $("#footerLinkForm").attr("action","http://law.nanet.go.kr/main/main.do").submit();
        } else if (gubun == "32") {
            // 국회의원 정책자료 (32 임의 부여)
            $("#footerLinkForm").attr("action","http://ampos.nanet.go.kr:7000/mainPage.do").submit();
        } else if (gubun == "33") {
            // 국회·지방의회 의정정보 (33 임의 부여)
            $("#footerLinkForm").attr("action","http://clik.nanet.go.kr/index.do").submit();
        } else if (gubun == "34") {
            // 국회 기록보존소 (34 임의 부여)
            $("#footerLinkForm").attr("action","http://archives.nanet.go.kr/main.do").submit();
        } else if (gubun == "35") {
            // 아르고스(Argos) (35 임의 부여)
            $("#footerLinkForm").attr("action","http://argos.nanet.go.kr/main/monitoring/simpleMonitoring.do").submit();
        } else if (gubun == "12") {
            // 107손말이음센터
            $("#footerLinkForm").attr("action","http://www.relaycall.or.kr/home/main1.asp").submit();
        } else if (gubun == "21") {
            $("#footerLinkForm").attr("action","https://library.ccourt.go.kr/").submit();
        } else if(gubun == "22"){ //지능형 분석(아르고스)
        	var ccd = 'P';
        	var _url = "";
        	if(ccd == "E"){
//         		_url = "https://bigdata.nanet.go.kr";
        		_url = "https://argos.nanet.go.kr/main/monitoring/main.do";
        	}else{
        		_url = "https://argos.nanet.go.kr";
        	}
        	$("#footerLinkForm").attr("action",_url).submit();
        }else if (gubun == "23") {
            $("#footerLinkForm").attr("action","https://busan.nanet.go.kr/").submit();
        }else if (gubun == "7") {
            // 국회기록보존소
            $("#footerLinkForm").attr("action", "https://archives.nanet.go.kr/").submit();
        } 
    }


    // 챗봇20190220
    var win = "";
    $(function(){
        $("#floating_box").click(function(e){
            e.preventDefault();

            try{
                if(win != ""){
                    win.close();
                }
            }catch(e){
                win = "";
            }
            win = window.open("/main/chatBot.do","chatbot","width=390, height=600, resizable=no, scrollbars=no, status=no, location=no, directories=no, left=1165, top=280;");
        });
    });

</script>









</body>
</html>