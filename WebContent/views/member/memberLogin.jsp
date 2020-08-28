<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="../common/header.jsp" %>
	
   <!-- 네비게이션바 -->
	<style type="text/css">	  
	  #f_management{display:none;}
	  #p_management{display:none;}
	  #profile{display:none;}
	  #suggestion{display:none;}
	</style>
</head>
<body>


<!-- Google Tag Manager (noscript) -->
	<noscript><iframe src="http://www.googletagmanager.com/ns.html?id=GTM-MF7LK3J"
	height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
	<!-- End Google Tag Manager (noscript) -->

	<div class="load_box" style="display:none;"><div class="load_img"><img src="../resources/images/common/loading.gif" alt="loading"/></div></div>

		
<script type="text/javascript" src="../resources/freemon/login/freemonLogin069b.js?version=1.1"></script>

<script type="text/javascript">
	$(function() {
		freemon.invoker.invoke("freemonLogin");
		
		$('.login_box #login_tab > ul > li').bind("click",function(){
			$(this).children("a").removeAttr('href');
			if($(this).attr("id") == 'tab_con'){
				
			}else{
				$('.login_box #login_tab > ul').children("li").removeClass("active");
				$(this).addClass("active");
				$('.login_box .tab_con').hide();
				$('.login_box #con_'+$(this).attr("id")).show();
			}
		});
		$('.btn_person').bind("click",function(){
			$(this).children("a").removeAttr('href');
			$('.login_box #login_tab > ul').children("li").removeClass("active");
			$('.login_box #tab1').addClass("active");
			$('.login_box .tab_con').hide();
			$('.login_box #con_tab1').show();
		});
		$('.btn_company').bind("click",function(){
			$(this).children("a").removeAttr('href');
			$('.login_box #login_tab > ul').children("li").removeClass("active");
			$('.login_box #tab2').addClass("active");
			$('.login_box .tab_con').hide();
			$('.login_box #con_tab2').show();
		});
		
		$('.idfind_box #login_tab > ul > li').bind("click",function(){
			$(this).children("a").removeAttr('href');
			if($(this).attr("id") == 'tab_con'){
				
			}else{
				$('.idfind_box #login_tab > ul').children("li").removeClass("active");
				$(this).addClass("active");
				$('.idfind_box .tab_con').hide();
				$('.idfind_box #con_'+$(this).attr("id")).show();
			}
		});
	});
</script>

<!--Contents-->
<div id="container">
	<section class="member login">
    	<!-- 제목부분 -->
    	<h2>로그인</h2>
        
        
       	<!-- 개인 -->
       	<div class="col-6 pr-15">
			<div class="white_box center">
				<h3 class="name">프리랜서</h3>
				<div class="middle">
                   <div class="member_input">
						<form class="login_form" id="login_form" name="login_form">
		                    <ul class="cf">
		                        <li class="p-0">
	                                <!-- <label for="companyUserId">아이디</label> -->
	                                <input type="text" id="UserId" name="UserId" placeholder="아이디(이메일주소)"/>
		                        </li>
		                        <li class="pb-0">
	                                <!-- <label for="companyPwd">비밀번호</label> -->
	                                <input type="password" id="userPwd" name="userPwd" placeholder="비밀번호" />
		                        </li>
		                    </ul>
						</form>
		                <div class="radio member_check left">
		                	<label for="chkIdSave">
		                	<input type="checkbox" id="chkIdSave" name="chkIdSave" value="Y" />
		                	<i></i>
		                	아이디저장</label>
                        </div>
		                <button id="userLoginBtn" class="b_login b_red" value="로그인" style="cursor:pointer;">로그인</button>
		                <ul class="login_link">
		                	<li><a href="#none" class="underline">아이디/비밀번호 찾기</a></li>
		                	<li><a href="../member/memberJoin.jsp">프리랜서 회원가입</a></li>
		                </ul>
                   	</div>
				</div>
			</div>
                   
            <div class="benefit free">
                <h3>프리랜서를 위한 프리월드의 서비스</h3>
                <ul class="cf">
                    <li>상주 프로젝트<br/>정보 제공</li>
                    <li>기업고객이<br/>제안하는 프로젝트</li>
                    <li>나에게<br/>맞는 프로젝트</li>
                    <li>파일 등록으로<br/>프로필 완성</li>
                    <li>카카오톡으로<br/>일정 안내</li>
                </ul>
            </div>
		</div>
		
		<!-- 기업 -->
       	<div class="col-6 pl-15">
			<div class="white_box center">
				<h3 class="name">기업고객</h3>
				<div class="middle">
                   	<div class="member_input">
						<form class="login_form" id="login_form" name="login_form">
		                    <ul class="cf">
		                        <li class="p-0">
	                                <!-- <label for="companyUserId">아이디</label> -->
	                                <input type="text" id="companyUserId" name="companyUserId" placeholder="아이디(이메일주소)"/>
		                        </li>
		                        <li class="pb-0">
	                                <!-- <label for="companyPwd">비밀번호</label> -->
	                                <input type="password" id="companyPwd" name="companyPwd" placeholder="비밀번호" />
		                        </li>
		                    </ul>
						</form>
		                <div class="radio member_check left">
		                	<label for="chkIdSave">
		                	<input type="checkbox" id="chkIdSave" name="chkIdSave" value="Y" />
		                	<i></i>
		                	아이디저장</label>
                        </div>
		                <button id="companyloginBtn" class="b_login b_red" value="로그인" style="cursor:pointer;">로그인</button>
		                <ul class="login_link">
		                	<li><a href="#none" class="underline">아이디/비밀번호 찾기</a></li>
		                	<li><a href="../account/companyJoin.html">기업고객 회원가입</a></li>
		                </ul>
                   	</div>
				</div>
			</div>
                   
            <div class="benefit company">
                <h3>기업고객 위한 프리월드의 서비스</h3>
                <ul class="cf">
                    <li>투입가능한<br/>프리랜서 정보</li>
                    <li>실력있고 경험많은<br/>프리랜서 정보</li>
                    <li>프로젝트<br/>지원현황</li>
                    <li>프로젝트에 맞는<br/>프리랜서 정보</li>
                    <li>손쉬운<br/> 프로젝트 관리</li>
                </ul>
            </div>
		</div>
    </section>
</div>

<!-- 팝업 지원하기 -->
<div class="pop_bg" id="idfind_pop" style="display:none;">
	<div class="pop">
    	<div class="pop_header">
        	<h3>아이디/비밀번호 찾기</h3>
            <a href="#none" class="close">닫기</a>
        </div>
        <div class="pop_body">
            <div class="idfind_box option_box add_box">
                <!-- tab -->
                <div id="login_tab" class="mt-20 mb-0">
                    <ul class="cf">
                        <li id="tab1" class="active" style="cursor:pointer;"><a href="#none">아이디 찾기</a></li>
                        <li id="tab2" style="cursor:pointer;"><a href="#none">비밀번호 찾기</a></li>
                    </ul>
                </div>
                <!-- 아이디 찾기 -->
                <div id="con_tab1" class="tab_con">
                    <div class="input_list p-0 mb-20">
                        <ul class="input_list_in cf">
                            <li>
                                <div class="input">
                                    <label for="userNm">이름</label>
                                    <input type="text" id="userNm" name="userNm" value="" />
                                </div>
                            </li>
                            <li>
                                <div class="input">
                                    <label for="telNo">휴대폰</label>
                                    <input type="text" id="telNo" name="telNo" value="" placeholder="&quot;-&quot;없이 입력" />
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div class="btn_box">
                        <button id="btnFindId" class="btn_login btn_blue" style="cursor:pointer;"/>아이디 찾기</button>
                    </div>
                </div>
                
                <!-- 비밀번호 찾기 -->
                <div id="con_tab2" class="tab_con" style="display:none;">
                    <div class="input_list p-0 mb-20">
                        <ul class="input_list_in cf">
                            <li class="col-6 xs-col-12 pr-16 xs-pr-0">
                                <div class="input">
                                    <label for="userId">아이디</label>
                                    <input type="text" id="userId" name="userId" value=""/>
                                </div>
                            </li>
                            <li class="col-6 xs-col-12 pl-16 xs-pl-0">
                                <div class="input">
                                    <label for="mngNm">이름</label>
                                    <input type="text" id="mngNm" name="mngNm" value="" />
                                </div>
                            </li>
                            <li>
                                <div class="input">
                                    <label for="phone">휴대폰</label>
                                    <input type="text" id="phone" name="phone" value="" placeholder="&quot;-&quot;없이 입력" />
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div class="btn_box">
                        <button id="btnFindPwd" class="btn_login btn_blue" style="cursor:pointer;"/>비밀번호 찾기</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!--//Contents-->
﻿	<!-- 팝업 -->
	<div class="pop_bg" id="popInfoData" style="display:none;">
	</div>

	<!-- 팝업 -->
	<div class="pop_bg" id="popAlertData" style="display:none;">
		<div class="pop pop2">
	    	<div class="pop_header">
	        	<h3>&nbsp;</h3>
	            <a href="javascript:void(0);" class="close">닫기</a>
	        </div>
	        <div class="pop_body p-20 no_scroll" style="">
	        	<div class="no_page_tit"></div>
                <div class="btn_pop_box center">
                </div>
	        </div>
	    </div>
	</div>

<sec:authorize access="hasRole('ROLE_COMPANY') || hasRole('ROLE_USER')">
	<script id="popAlamnTemplate" type="text/x-mustache">
<div class="pop">
    <div class="pop_header">
        <h3 id="pop-title">알림설정</h3>
        <a href="#none" class="close">닫기</a>
    </div>
    <div class="pop_body">
        <form id="popAlarmForm" name="popAlarmForm">
        <div class="option_box">
                <table class="t_option">
                    <tbody>
                        {{#data}}
                        <tr>
                            <th>{{alamnClsCdNm}}
								{{#isDesc}}<p>{{alamnDesc}}</p>{{/isDesc}}
							</th>
                            <td>
								<label class="optChk" for="">
                                	<input type="checkbox" id="alamn{{alamnClsCd}}" name="alamn{{alamnClsCd}}" {{#almVal}}checked="checked"{{/almVal}} value="Y" />
                                	<i></i>
                            	</label>
                            </td>
                        </tr>
                        {{/data}}
                    </tbody>
                </table>
        </div>
		<!-- 버튼-->
        <div class="btn_pop_box center mt-10">
        	<button id="btnAlamn" class="btn_apply" style="cursor:pointer;">저장</button>
        </div>
        </form>
    </div>
</div>
	</script>
	<script id="popClosedTemplate" type="text/x-mustache">
<div class="pop">
    <div class="pop_header">
        <h3 id="pop-title">회원탈퇴</h3>
        <a href="#none" class="close">닫기</a>
    </div>
    <div class="pop_body">
        <form id="popForm" name="popForm">
			<div class="option_box add_box">
            	<div class="input_list p-0 mb-20">
                    <ul class="input_list_in cf">
						<sec:authorize access="hasRole('ROLE_COMPANY')">
                        <li>
                            <div class="input">
                                <label for="">비밀번호</label>
                                <input type="password" id="pincode" name="pincode" />
                            </div>
                        </li>
						</sec:authorize>
						<sec:authorize access="hasRole('ROLE_USER')">
							<input type="hidden" id="pincode" name="pincode" value="1" />
						</sec:authorize>
                        <li>
                            <div class="input sign_box exit">
                                <label for="">탈퇴사유</label>
                                <div class="sign">
                                    <textarea id="scssnDtl" name="scssnDtl"></textarea>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>

                <!-- 동의 -->
				<div class="join_agree">
                    <div class="join_agree_top">
                        <h3>탈퇴안내</h3>
                    </div>
                    <div class="join_agree_body">
                        <div class="agree_list">
                        	<ul>
                               <li class="active has-sub">
                                    <div class="join_check">
                                        <label class="agrChk" for="agrChk">
                                            <input type="checkbox" id="agrChk" name="agrChk" class="argChecked" value="Y"><i></i>
                                        </label>
                                    </div>
                                    <a href="#none" class="joinAgreeList">회원탈퇴 안내사항 확인</a>
                               </li>
                               <li class="has-sub agree_detail" style="overflow:auto;height:150px;">
                               	<h4>회원탈퇴 신청 전에 안내 사항을 확인해주세요.</h4>
                               	<p>1. 탈퇴 후 회사 내부 방침에 의해 기업고객과의 계약 관계로 이름, 로그인 ID를 1년간 따로 보유할 수 있습니다. 이후 삭제처리 됩니다.</p>
								<p>2. 회원의 즉시 삭제 요청시 프리월드이 확인 후 그에 따른 조치를 취합니다.</p>
              					<p>※ 참고 : 계정의 개인정보는 관계 법령의 규정에 의하여 보유할 필요가 있는 경우 관계법령에서 정한 기간 동안 개인정보를 보관합니다.</p>
              					<p>회원 탈퇴와 관련하여 더 궁금하신 점은 프리월드 <a href="/customer/questionRegistForm">"문의하기 > 회원정보/아이디/비밀번호"</a>로 문의를 남기거나 고객센터(<a href="mailto:freemon@freemon.co.kr">freemon@freemon.co.kr</a>) 문의해주세요.</p>
                               </li>
                            </ul>
                            
                        </div>
                    </div>
                </div>
                
            </div>
			<!-- 버튼-->
                <div class="btn_pop_box mt-00">
                    <button id="btnClosed" class="btn_apply" style="cursor:pointer;" onClick="return false;">회원탈퇴</button>
                </div>
        </form>
    </div>
</div>
	</script>
	
    <script id="projectInTalentListTemplate" type="text/x-mustache">
        <div class="pop">
            <div class="pop_header">
                <h3>프로젝트 참여자</h3>
                <a href="#none" class="close">닫기</a>
            </div>
            <div class="pop_body">
                <div class="proj_tit">
                    <h4 class="company_name detail"><a href="#none" style="cursor:default">{{customer}}</a></h4>
                    <h3 class="project_name cf"><a href="#none" style="cursor:default">{{projNm}}</a></h3>
                    <p class="project_term mt-10">{{projPeriod}}</p>
                </div>
                
                <div class="entry_list">
                    <div class="entry_box">
                        <ul class="entry cf">
                            {{#talentList}}
                            <li>
                                <div class="entry_in">
                                    <div class="profile" style="cursor:pointer; background-image:url('{{profileUrl}}')" data-value="{{userId}}" data-action="talentDetail">
                                        프로필사진
                                    </div>
                                    <h4 class="man_name mt-5 ellipsis"><a href="#none" data-value="{{userId}}" data-action="talentDetail">{{userNm}}</a></h4>
                                    <ul class="name1 cf mt-10">
                                        <li class="old">{{#isGenderNm}}{{genderNm}}{{#age}},{{/age}} {{/isGenderNm}}{{#age}}{{age}}세{{/age}}</li>
                                        <li>총 {{totalWorkCareer}}</li>
                                    </ul><div class="cf"></div>
                                    <p class="entry_tech ellipsis">
										{{usableSkillNm}}
                                    </p>
                                    <span class="d_day mt-10 {{leaveStrtTermCss}}">{{leaveStrtTermTxt}}</span>
                                </div>
                            </li>
                            {{/talentList}}
                        </ul>
						{{^talentList}}
                	    <div class="project_box no_data cf ml-20 mr-20" style="text-align:center;">프로젝트 다른 참여자 정보가 없습니다.</div>
                 	   {{/talentList}} 
                    </div>                    
                </div>
                
            </div>
        </div>
    </script>
</sec:authorize>
	
<sec:authorize access="hasRole('ROLE_COMPANY')">
    <script id="popMemoTemplate" type="text/x-mustache">
        <div class="pop">
            <div class="pop_header">
                <h3 id="pop-title">{{name}}</h3>
                <a href="javascript:void(0);" class="close">닫기</a>
            </div>
            <div class="pop_body">
                <div class="apply_con">
                    <textarea id="memo" name="memo" placeholder="메모내용은 님만 볼수 있습니다." style="height:297px">{{memo}}</textarea>
                    <!-- 버튼-->
                    <div class="btn_pop_box">
                        <button id="btn" class="btn_apply" style="cursor:pointer;">저장</button>
                    </div>        
                </div>
            </div>
        </div>
    </script>
    <script id="relationInTalentListTemplate" type="text/x-mustache">
        <div class="pop">
            <div class="pop_header">
                <h3>인맥트리</h3>
                <a href="#none" class="close">닫기</a>
            </div>
            <div class="pop_body">
                <div class="proj_tit mb-20 cf">
                    <div class="profile" style="cursor:pointer; background-image:url('{{profileUrl}}');" data-action="talentDetail" data-value="{{userId}}" data-dv="1">
                        프로필사진
                    </div>
                    <div class="pro_con">
                        <h4 class="man_name mt-5 ellipsis">
                            <a href="#none" data-action="talentDetail" data-value="{{userId}}" data-dv="1">{{userNm}}</a>
                            <ul class="name1 cf">
                                <li class="old">{{#isGenderNm}}{{genderNm}}{{#age}},{{/age}} {{/isGenderNm}}{{#age}}{{age}}세{{/age}}</li>
                                <li class="local">{{hopeAreaNm}}</li>
                            </ul>
                            <ul class="name cf">
                            <li class="alarm mb-0 ml-5 {{leaveStrtTermCss}}">{{leaveStrtTermTxt}}</li>
                        </ul>
                        </h4>
                        <ul class="name cf mt-10">
                            <li class="career">총 {{totalWorkCareer}}</li>
                        </ul>
                        <ul class="name cf">
                            <li class="tech">
                                {{usableSkillNm}}
                            </li>
                        </ul>
                    </div>
                </div>
                
                <div class="entry_list">
                    <div class="entry_box">
                        <ul class="entry cf">
                            {{#talentList}}
                            <li>
                                <div class="entry_in">
                                    <div class="profile" style="cursor:pointer; background-image:url('{{profileUrl}}')" data-action="talentDetail" data-value="{{userId}}" data-dv="1">프로필사진</div>
                                    <h4 class="man_name mt-5 ellipsis"><a href="#none" data-action="talentDetail" data-value="{{userId}}" data-dv="1">{{userNm}}</a></h4>
                                    <ul class="name1 cf mt-10">
                                        <li class="old">{{#isGenderNm}}{{genderNm}}{{#age}},{{/age}} {{/isGenderNm}}{{#age}}{{age}}세{{/age}}</li>
                                        <li>총 {{totalWorkCareer}}</li>
                                    </ul>
                                    <div class="cf"></div>
                                    <p class="entry_tech ellipsis2">
                                        {{usableSkillNm}}
                                    </p>
                                    <span class="d_day mt-10 {{leaveStrtTermCss}}">{{leaveStrtTermTxt}}</span>
                                </div>
                            </li>
                            {{/talentList}}
                        </ul>
                        {{^talentList}}
                            <div class="project_box no_data cf ml-20 mr-20" style="text-align:center;">인맥 정보가 없습니다.</div>
                        {{/talentList}} 
                    </div>
                </div>
                
            </div>
        </div>
    </script>
</sec:authorize>


    <%@ include file="../common/footer.jsp" %>
</body>

</html>