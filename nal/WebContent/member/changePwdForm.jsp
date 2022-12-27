<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<title>마이페이지>아이디/비밀번호 찾기>비밀번호 변경</title>

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
                   <a href="selectMember.do">회원가입</a>
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
	
<form id="MemberVO" action="changePwdForm.do" method="post" name="changepwdfrm">
<input id="searchId" name="searchId" type="hidden" value="${member_id}"/>
<input id="searchNoSeq" name="searchNoSeq" type="hidden" value=""/>

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
                            <li class="tab nemBox">
                                <h3><a href="searchIdPwdForm.do">아이디 찾기</a></h3>
                            </li>
                            <li class="tab on">
                                <h3><a href="#">비밀번호 변경</a></h3>
                            </li>
                        </ul>

                        <div class="contentTab">
                            <div class="tableBox  mt10">
                                <div class="idSearch">
                                    <p class="pwchangTxt">
                                        국회도서관의 비밀번호 관리 정책에 의해서 비밀번호는 암호화되어 관리되며, 암호화된 비밀번호는 해독할 수 없습니다.
                                        아래에 새로운 비밀번호를 기입하시고 확인버튼을 누르시면 해당 비밀번호로 변경됩니다.
                                        <span class="redTxt">(8~20자의 비밀번호는 영문, 숫자, 특수문자 중 2종류 이상을 조합)</span>

                                    </p>
                                    <div class="peopleInfo01">
                                        <div class="peopleInfo010101">
                                            <span class="peopleInfoTxt020202"><span
                                                    class="listTxt00001">새 비밀번호</span></span>
                                            <span class="peopleInfoInput20202">
										  <input id="member_pw" name="member_pw" title="새비밀번호" onkeypress="capsLock(event);" type="password" value="" maxlength="20"/>
                                       </span>
                                        </div>
                                        <div class="peopleInfo010101">
                                            <span class="peopleInfoTxt020202"><span
                                                    class="listTxt00001">새 비밀번호 확인</span></span>
                                            <span class="peopleInfoInput20202">
                                         <input id="repw" name="repw" title="새비밀번호 확인" onkeypress="capsLock(event);" type="password" value="" maxlength="20"/>
                                      </span>
                                        </div>

<!--                                         <div class="okBtn2"> -->
<!--                                             <a href="return changePwd()">확인</a> -->
<!--                                             <a href="searchIdPwdForm.do">취소</a> -->
										<div class="joinbtn" style="display: flex; justify-content: center;">
                                              <input type="submit" value="확인" onclick="return changePwd()"/>
                                              <input type="button" value="취소" onclick="location.href='searchIdPwdForm.jsp' ">
                                        </div>
<script>
// 작성자 문수지
  function changePwd() { 
  	if (changepwdfrm.member_pw.value == "") {
		alert("비밀번호를 입력하세요!");
		changepwdfrm.member_pw.focus();
		return false;
	}
	if (changepwdfrm.member_pw.value.length < 8 || changepwdfrm.member_pw.value.length > 20) {
		alert("8자리 ~ 20자리 이내로 입력해주세요.");
		changepwdfrm.member_pw.focus();
		return false;
	}
	// 영문, 숫자, 특수문자 중 2가지 이상 조합하여 8자리 ~ 20자리 이내의 암호 정규식 (2가지 조합)
	var reg = /^(?!((?:[A-Za-z]+)|(?:[~!@#$%^&*()_+=]+)|(?:[0-9]+))$)[A-Za-z\d~!@#$%^&*()_+=]{8,20}$/;
	var pattern = /\s/g; // 공백체크 (탭, 스페이스)
	if (changepwdfrm.member_pw.value.match(reg) == null) {
		alert("영문, 숫자, 특수문자 중 2가지 이상을 혼합하여 입력해주세요.");
		changepwdfrm.member_pw.focus();
		return false;
	}
	// 공백 입력
	if (changepwdfrm.member_pw.value.match(pattern)) {
		alert("비밀번호는 공백 없이 입력해주세요.");
		changepwdfrm.member_pw.focus();
		return false;
	}
	if (changepwdfrm.repw.value == "") {
		alert("비밀번호 확인을 입력하세요.");
		changepwdfrm.repw.focus();
		return false;
	}
	if (changepwdfrm.member_pw.value != changepwdfrm.repw.value) {
		alert("비밀번호와 확인 비밀번호가 다릅니다.");
		changepwdfrm.repw.focus();
		return false;
	}
	return true;  
  }
</script>                                        
                                        
                                        
                                    </div>
                                </div>
                            </div>
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