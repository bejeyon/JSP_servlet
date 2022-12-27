<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<title>마이페이지>아이디/비밀번호 찾기>아이디 찾기</title>

<script type="text/javascript">

    $(function(){
        fnCurrentMenuCheck();
    });

    function ipck(){
        window.open("/main/ipChkPopup.do","acDbipPopup","width=336, height=250, scrollbars=0, resizable=0");
        //푸터쪽 관련사이트 컨트롤러
    }

</script>

<div class="wrap">
    <div class="inner">
        <!-- 왼쪽메뉴 -->
        <div class="leftMenu" id="subMenu">
            <ul class="side-menu">
                <li data-url="/loginForm.do, /snsLoginProc.do">
                    <a href="login.do">로그인</a>
                </li>
                <li data-url="/member/insertMemberForm1.do, /member/insertMemberForm2.do, /member/insertMemberForm3.do, /member/insertMemberForm4.do,
                                /member/insertMemberForm5.do, /member/insertMemberForm6.do, /member/selectMember.do, /member/insertMemberFormKid1.do, /member/insertMemberFormKid2.do">
                   <a href="selectMember.do">회원가입</a>  <!-- 14세미만 선택화면 20211026 -->
<!--                     <a href="/member/insertMemberForm1.do">회원가입</a> -->
                </li>
                <li data-url="/member/searchIdPwdForm.do, /member/searchPwdForm.do, /member/searchIdPwdProc.do, /member/searchIdPwdProc.do">
                    <a href="searchIdPwdForm.do">아이디/비밀번호 찾기</a>
                </li>


                <li data-url="/member/mobilePassForm.do, /member/studentPassForm.do, /member/insertPassForm.do, /member/mobileBizForm.do">
                    <a href="#">열람증</a>
                    <ul>
                        <li data-url="/member/mobilePassForm.do, /member/insertPassForm.do"><a href="/member/mobilePassForm.do">모바일 간편열람증</a></li>
                    </ul>
                </li>

            </ul>
        </div><!-- //왼쪽메뉴 -->
    </div>

<form id="MemberVO" action="searchIdPwdProc.do" method="get" name="frm">

<input id="searchId" name="searchId" type="hidden" value=""/>
<input id="searchNoSeq" name="searchNoSeq" type="hidden" value=""/>
<input id="searchBirthday" name="searchBirthday" type="hidden" value="CaimZFiuoyvAh/Jnzac6EQ=="/>
<input id="changeGubun" name="changeGubun" type="hidden" value="id"/>

    <div class="contentsContainer">
        <div class="subTitle">
            <div class="inner">
                <h2>마이페이지</h2>
                <div class="location">
                    <ol>
                        <li class="home"><img src="images/img/icon_home.png" alt="홈"/></li>
                        <li>마이페이지</li>
                        <li>아이디/비밀번호 찾기</li>
                    </ol>
                </div>
            </div>
        </div>
        <div class="inner">
            <div class="contents" id="bodyWrap">
                <h3 class="title">아이디/비밀번호 찾기</h3>

                <div class="subContents">

                    <div class="body">
                        <!-- 여기서부터 콘텐츠 s -->
                        <ul class="tabbox two">
                            <li class="tab on nemBox" id="t1">
                                <h3><a href="searchIdPwdForm.do">아이디 찾기</a></h3>
                            </li>
                            <li class="tab" id="t2">
                                <h3><a href="searchPwdForm.do">비밀번호 변경</a></h3>
                            </li>
                        </ul>

                        <div class="nemoWapbox">
                            <div class="pt20">
                                <p class="nemoTxtTitle01 fontTxt01">입력하신 정보와 일치하는 아이디는 아래와 같습니다.</p>
                            </div>

                            <div class="logonCon">


                                <div class="width165 divDefine divDefine2">
                                    
               <span class="chk21 m_idSerch chkRadio">          
                   <input type="radio" id="member_id" name="member_id" value="${member_id}"  checked = 'checked'/>
                   <label for="id" class="bdfc38">${member_id}</label>  
                   <input type="hidden" id="member_id" name="member_id" value="${member_id}"/>
                </span>
                                    
                                </div>
                            </div>
                        </div>
                        <div class="btnSetList">
                            <ul>
                                <li class="mr10"><a href="login.do">로그인</a></li>
                                <li><a href="SearchPwdServlet?member_id=${member_id}">비밀번호 변경</a></li>
                            </ul>
                            
<!--                         <div class="joinbtn" style="display: flex; justify-content: center;"> -->
<!--                         		<input type="button" value="로그인" onclick="location.href='login.do' "/> -->
<!--                                <input type="submit" value="비밀번호 변경" onclick="return changepw()"/>     -->
                        </div>
<%
	String member_id = request.getParameter("member_id");
%>     
                   
<script>
// 작성자 문수지
 function changepw() {
 		/* changePwdForm.jsp 페이지는 changePwdForm.do로 요청하면서 입력받은 정보 받음 */
 		var url = "changePwdForm.do?member_id="+frm.member_id.value();
 		//location.replace(url);
		location.href = url;	
 }
 </script>
                        <!-- 여기까지 콘텐츠 e -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>

    <script type='text/javascript' src="/js/bs_trk.js"></script>

<script type="text/javascript" defer='defer'>/* CLICKZONE SCRIPT V.V.4 *//*X*//* COPYRIGHT 2002-2017 BIZSPRING INC. *//*X*//* DO NOT MODIFY THIS SCRIPT. *//*X*/


    var _CZN = "29"; //운영서버 : 10

</script>
<script type='text/javascript' defer="defer" src="https://webstat.nanet.go.kr/InsightTrk/js/InsightClickZone.js"></script>
<!-- [end] 접속 로그 -->



<form name="footerForm" method="post">
    <input type="hidden" name="deviceType" value="mob"/>
</form>


<%@ include file="../footer.jsp" %>  