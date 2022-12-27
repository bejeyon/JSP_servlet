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

<form name="sciCertForm" method="post" action="">
    <input type="hidden" name="id"       value = "SNAQ001" />
    <input type="hidden" name="srvNo"    value = "001001" />
    <input type="hidden" name="certGb"   value = "H" />
	<input type="hidden" name="retUrl"   value = "31https://www.nanet.go.kr/member/mobile/pwd.do" /> 
</form>

<form name="sciCertIpinForm" method="post" action="">
    <input type="hidden" name="id"       value = "NAQ002" />
    <input type="hidden" name="srvNo"   value = "001002" />
	<input type="hidden" name="retUrl"   value = "23https://www.nanet.go.kr/member/sciCertIpinResult.do" /> 
</form>
<form id="memberVO" action="/member/searchPwdForm.do" method="post">
	<input type="hidden" name="retInfo"    id="retInfo"   value = "" />
</form>


<form id="MemberVO" action="searchPwdForm.do" method="post" name="searchpwfrm">
<input id="changeBirthday" name="changeBirthday" type="hidden" value=""/>
<input id="changeGubun" name="changeGubun" type="hidden" value="pwd"/><!-- value="pwd" -->

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
                                <span><a href="searchIdPwdForm.do">아이디 찾기</a></span>
                            </li>
                            <li class="tab on">
                                <span><a href="searchPwdForm.do">비밀번호 변경<span class="blind">선택됨</span></a></span>
                            </li>
                        </ul>

                        <div class="contentTab">
                            <div class="tableBox  mt10">
                            <p style="font-size: 15px;line-height: 12px;margin-bottom: 10px;">
                            	<span style="padding-right: 7px;"><input type="radio" id="search_chk1" name="search_chk" value="N" checked="checked" >
                            	<label for="search_chk1">이메일로 찾기</label>
                            	<span class="blind" id="text_chk1">선택됨</span>
                            	</span>
                            	<span><input type="radio" id="search_chk2" name="search_chk" value="Y" >
                            	<label for="search_chk2">실명인증으로 찾기</label>
                            	<span class="blind" id="text_chk2"></span>
                            	</span>
                            </p>
                            
                            
                                <div class="idSearch" id="idSearch1">
                                    <p class="pwchangTxt">비밀번호를 찾으시려면 아래사항을 입력하신 후 확인버튼을 누르세요.</p>
                                    <div class="peopleInfo">
                                        <div class="peopleInfo01">
                                            <span class="peopleInfoTxt01"><span class="listTxt00001">아이디</span></span>
                                            <span class="peopleInfoInput">
                                          <input type="text" id="member_id" name="member_id" title="아이디입력란"/></span>
                                        </div>
                                        <div class="peopleInfo01">
                                            <span class="peopleInfoTxt01"><span class="listTxt00001">이름</span></span>
                                            <span class="peopleInfoInput">
                                          <input type="text" id="member_name" name="member_name" title="이름입력란"/></span>
                                        </div>
                                        <div class="peopleInfo01">
                                            <span class="peopleInfoTxt01"><span class="listTxt00001">이메일</span></span>
                                            <span class="peopleInfoInput">
                                          <input type="text" id="member_email" name="member_email" title="이메일입력란"/></span>
                                        </div>
                                        <div class="peopleInfo01">
                                            <span class="peopleInfoTxt01"><span class="listTxt00001">생년월일</span></span>
                                            <div class="overflowH ml10">
                                                <div class="leftBox30">
                                                    <div class="hbSelect fl m0">
                                                        <select name="member_birthyear" title="연도" id="member_birthyear" class="m_width100">
                                                            <option value="">선택</option>
																
																
																	
																	<option value="2022">2022</option>
																
																	
																	<option value="2021">2021</option>
																
																	
																	<option value="2020">2020</option>
																
																	
																	<option value="2019">2019</option>
																
																	
																	<option value="2018">2018</option>
																
																	
																	<option value="2017">2017</option>
																
																	
																	<option value="2016">2016</option>
																
																	
																	<option value="2015">2015</option>
																
																	
																	<option value="2014">2014</option>
																
																	
																	<option value="2013">2013</option>
																
																	
																	<option value="2012">2012</option>
																
																	
																	<option value="2011">2011</option>
																
																	
																	<option value="2010">2010</option>
																
																	
																	<option value="2009">2009</option>
																
																	
																	<option value="2008">2008</option>
																
																	
																	<option value="2007">2007</option>
																
																	
																	<option value="2006">2006</option>
																
																	
																	<option value="2005">2005</option>
																
																	
																	<option value="2004">2004</option>
																
																	
																	<option value="2003">2003</option>
																
																	
																	<option value="2002">2002</option>
																
																	
																	<option value="2001">2001</option>
																
																	
																	<option value="2000">2000</option>
																
																	
																	<option value="1999">1999</option>
																
																	
																	<option value="1998">1998</option>
																
																	
																	<option value="1997">1997</option>
																
																	
																	<option value="1996">1996</option>
																
																	
																	<option value="1995">1995</option>
																
																	
																	<option value="1994">1994</option>
																
																	
																	<option value="1993">1993</option>
																
																	
																	<option value="1992">1992</option>
																
																	
																	<option value="1991">1991</option>
																
																	
																	<option value="1990">1990</option>
																
																	
																	<option value="1989">1989</option>
																
																	
																	<option value="1988">1988</option>
																
																	
																	<option value="1987">1987</option>
																
																	
																	<option value="1986">1986</option>
																
																	
																	<option value="1985">1985</option>
																
																	
																	<option value="1984">1984</option>
																
																	
																	<option value="1983">1983</option>
																
																	
																	<option value="1982">1982</option>
																
																	
																	<option value="1981">1981</option>
																
																	
																	<option value="1980">1980</option>
																
																	
																	<option value="1979">1979</option>
																
																	
																	<option value="1978">1978</option>
																
																	
																	<option value="1977">1977</option>
																
																	
																	<option value="1976">1976</option>
																
																	
																	<option value="1975">1975</option>
																
																	
																	<option value="1974">1974</option>
																
																	
																	<option value="1973">1973</option>
																
																	
																	<option value="1972">1972</option>
																
																	
																	<option value="1971">1971</option>
																
																	
																	<option value="1970">1970</option>
																
																	
																	<option value="1969">1969</option>
																
																	
																	<option value="1968">1968</option>
																
																	
																	<option value="1967">1967</option>
																
																	
																	<option value="1966">1966</option>
																
																	
																	<option value="1965">1965</option>
																
																	
																	<option value="1964">1964</option>
																
																	
																	<option value="1963">1963</option>
																
																	
																	<option value="1962">1962</option>
																
																	
																	<option value="1961">1961</option>
																
																	
																	<option value="1960">1960</option>
																
																	
																	<option value="1959">1959</option>
																
																	
																	<option value="1958">1958</option>
																
																	
																	<option value="1957">1957</option>
																
																	
																	<option value="1956">1956</option>
																
																	
																	<option value="1955">1955</option>
																
																	
																	<option value="1954">1954</option>
																
																	
																	<option value="1953">1953</option>
																
																	
																	<option value="1952">1952</option>
																
																	
																	<option value="1951">1951</option>
																
																	
																	<option value="1950">1950</option>
																
																	
																	<option value="1949">1949</option>
																
																	
																	<option value="1948">1948</option>
																
																	
																	<option value="1947">1947</option>
																
																	
																	<option value="1946">1946</option>
																
																	
																	<option value="1945">1945</option>
																
																	
																	<option value="1944">1944</option>
																
																	
																	<option value="1943">1943</option>
																
																	
																	<option value="1942">1942</option>
																
																	
																	<option value="1941">1941</option>
																
																	
																	<option value="1940">1940</option>
																
																	
																	<option value="1939">1939</option>
																
																	
																	<option value="1938">1938</option>
																
																	
																	<option value="1937">1937</option>
																
																	
																	<option value="1936">1936</option>
																
																	
																	<option value="1935">1935</option>
																
																	
																	<option value="1934">1934</option>
																
																	
																	<option value="1933">1933</option>
																
																	
																	<option value="1932">1932</option>
																
																	
																	<option value="1931">1931</option>
																
																	
																	<option value="1930">1930</option>
																
																	
																	<option value="1929">1929</option>
																
																	
																	<option value="1928">1928</option>
																
																	
																	<option value="1927">1927</option>
																
																	
																	<option value="1926">1926</option>
																
																	
																	<option value="1925">1925</option>
																
																	
																	<option value="1924">1924</option>
																
																	
																	<option value="1923">1923</option>
																
																	
																	<option value="1922">1922</option>
																
																	
																	<option value="1921">1921</option>
																
																	
																	<option value="1920">1920</option>
																
																	
																	<option value="1919">1919</option>
																
																	
																	<option value="1918">1918</option>
																
																	
																	<option value="1917">1917</option>
																
																	
																	<option value="1916">1916</option>
																
																	
																	<option value="1915">1915</option>
																
																	
																	<option value="1914">1914</option>
																
																	
																	<option value="1913">1913</option>
																
																	
																	<option value="1912">1912</option>
																
																	
																	<option value="1911">1911</option>
																
																	
																	<option value="1910">1910</option>
																
																	
																	<option value="1909">1909</option>
																
																	
																	<option value="1908">1908</option>
																
																	
																	<option value="1907">1907</option>
																
																	
																	<option value="1906">1906</option>
																
																	
																	<option value="1905">1905</option>
																
																	
																	<option value="1904">1904</option>
																
																	
																	<option value="1903">1903</option>
																
																	
																	<option value="1902">1902</option>
																
																	
																	<option value="1901">1901</option>
																
																	
																	<option value="1900">1900</option>
																
                                                        </select>
                                                    </div>
                                                    <div class="divDefine fl lh29 ml0 m0">년</div>
                                                </div>
                                                <div class="leftBox30">
                                                    <div class="hbSelect fl m0">
                                                        <select name="member_birthmonth" title="월" id="member_birthmonth" class="m_width100">
                                                            <option value="">선택</option>
                                                            <option value="01">1</option>
                                                            <option value="02">2</option>
                                                            <option value="03">3</option>
                                                            <option value="04">4</option>
                                                            <option value="05">5</option>
                                                            <option value="06">6</option>
                                                            <option value="07">7</option>
                                                            <option value="08">8</option>
                                                            <option value="09">9</option>
                                                            <option value="10">10</option>
                                                            <option value="11">11</option>
                                                            <option value="12">12</option>
                                                        </select>
                                                    </div>
                                                    <div class="divDefine fl lh29 ml0 m0">월</div>
                                                </div>
                                                <div class="leftBox30">
                                                    <div class="hbSelect fl m0">
                                                        <select name="member_birthday" title="일" id="member_birthday" class="m_width100">
                                                            <option value="">선택</option>
                                                            <option value="01">1</option>
                                                            <option value="02">2</option>
                                                            <option value="03">3</option>
                                                            <option value="04">4</option>
                                                            <option value="05">5</option>
                                                            <option value="06">6</option>
                                                            <option value="07">7</option>
                                                            <option value="08">8</option>
                                                            <option value="09">9</option>
                                                            <option value="10">10</option>
                                                            <option value="11">11</option>
                                                            <option value="12">12</option>
                                                            <option value="13">13</option>
                                                            <option value="14">14</option>
                                                            <option value="15">15</option>
                                                            <option value="16">16</option>
                                                            <option value="17">17</option>
                                                            <option value="18">18</option>
                                                            <option value="19">19</option>
                                                            <option value="20">20</option>
                                                            <option value="21">21</option>
                                                            <option value="22">22</option>
                                                            <option value="23">23</option>
                                                            <option value="24">24</option>
                                                            <option value="25">25</option>
                                                            <option value="26">26</option>
                                                            <option value="27">27</option>
                                                            <option value="28">28</option>
                                                            <option value="29">29</option>
                                                            <option value="30">30</option>
                                                            <option value="31">31</option>
                                                        </select>
                                                    </div>
                                                    <div class="divDefine fl lh29 ml0 m0">일</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
<!--                                     <div class="okBtn"> -->
<!--                                         <a href="javascript:searchPwd();">확인</a> -->
									<div class="loginBtn">
                                          <input type="submit" value="확인" onclick="return searchPwd()"/>
                                    </div>
                                </div>
                                
	     						
<!-- 								<p class="txt01" style="padding-left: 0;padding:0;"> <span class="color02">※미인증 회원인 경우 ☎02-6788-4248으로 문의하시기 바랍니다.</span></p>	     						 -->
								<div class="loginNemoBox" id="idSearch2" style="display:none;">
									<div class="login03">
										<div class="loginNextRuning" style="border-right: 1px solid #ccc;">
											<div class="blueBtnN1"><a href="javascript:sciCert();" title="새창열림">휴대폰 인증하기</a></div>
										</div>
									</div>
									
<script>
// 작성자 문수지
 function searchPwd() {
		if (searchpwfrm.member_id.value.length == 0) {
			alert("아이디를 입력하세요!")
			searchpwfrm.member_id.focus();
			return false;
		}
		if (searchpwfrm.member_name.value.length == 0) {
			alert("이름을 입력하세요!")
 			searchpwfrm.member_name.focus();
 			return false;
 		}
 		if (searchpwfrm.member_email.value == "") {
 			alert("이메일을 입력하세요!")
 			searchpwfrm.member_email.focus();
 			return false;
 		}
 		if (searchpwfrm.member_birthyear.value == "" ||  searchidfrm.member_birthmonth.value=="" || searchidfrm.member_birthday.value=="") {
 			alert("생년월일을 입력하세요!");
 			return false;
 		}
 		return true;
 		
 		/* searchIdPwdProc.jsp 페이지는 searchIdPwdProc.do로 요청하면서 입력받은 정보 받음 */
  		var url = "changePwdForm.do?member_id=" + searchpwfrm.member_id.value;
//  		location.replace(url);
		location.href = url;			
	}
 </script>

<!-- 작성자 문수지 -->
<c:if test="${result == -1 }">
	<script>
		alert("입력하신 정보와 일치하는 정보가 없습니다.");
	</script>
</c:if>
									
									
									<div class="login03">
										<div class="loginNextRuning">
											<div class="blueBtnN1"><a href="javascript:openCBAWindow();" title="새창열림">아이핀 인증하기</a></div><!-- /member/insertMemberForm3.do -->
										</div>
									</div>
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