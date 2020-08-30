<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="ko">
    <head>
	<%@ include file="../common/header.jsp" %>
	
    <!-- 네비게이션바 -->
	<style type="text/css">	  
	  #p_search{display:none;}
	  #p_management{display:none;}
	  #notice{display:none;}
	  #service{display:none;}
	  #suggestion{display:none;}
	  #login{display:none;}
	</style>
    </head>
<body>
	<!-- Google Tag Manager (noscript) -->
	<noscript><iframe src="http://www.googletagmanager.com/ns.html?id=GTM-MF7LK3J"
	height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
	<!-- End Google Tag Manager (noscript) -->

	<div class="load_box" style="display:none;"><div class="load_img"><img src="/resources/images/common/loading.gif" alt="loading"/></div></div>


<script type="text/javascript" src="/resources/freemon/account/companyConfig.js?version=1.2"></script>
<script type="text/javascript">
	$(function() {
		freemon.invoker.invoke("companyConfig");
	});
</script>
<!--Contents-->
<div id="container">
	<section class="join">
    	<div class="join_in">
            <!-- 제목부분 -->
            <div class="join_tit">
                <h2>회원정보 수정</h2>
            </div>
            
            <!-- 기업회원가입 -->
            <div class="tab_con">
            	<form class="login_form" id="registForm" name="registForm" action="">
                <div class="input_list p-0 mb-20">
                    <ul class="input_list_in cf">
                    	<li class="col-6 xs-col-12 pr-16 xs-pr-0">
                            <div class="input">
                                <label for="">사업자번호<span>*</span></label>
                                <input type="text" id="bzRegNo" name="bzRegNo" readonly="readonly" placeholder="&quot;-&quot;없이 입력바랍니다."  style="color:#999;" value="2158828373" />
                            </div>
                        </li>
                        <li class="col-6 xs-col-12 pl-16 xs-pl-0">
                            <div class="input">
                                <label for="">회사명<span>*</span></label>
                                <input type="text" id="compNm" name="compNm" value="Samsoung" placeholder="&quot;(주)&quot;없이 입력바랍니다."/>
                            </div>
                        </li>
                        <li>
                            <div class="input">
                                <label for="">이메일 주소<span>*</span></label>
                                <input type="text" id="mngId" name="mgrId" readonly="readonly" placeholder="이메일 형식에 맞춰 입력바랍니다." style="color:#999;" value="kch@gsteletech.com" />
                            </div>
                        </li>
                        <li class="col-6 xs-col-12 pr-16 xs-pr-0">
                            <div class="input">
                                <label for="">비밀번호<span>*</span></label>
                                <input type="password" id="pwd" name="pwd" placeholder="최소 8자이상으로 문자,숫자,특수문자를 포함하여 입력바랍니다."/>
                            </div>
                        </li>
                        <li class="col-6 xs-col-12 pl-16 xs-pl-0">
                            <div class="input">
                                <label for="">비밀번호 확인<span>*</span></label>
                                <input type="password" id="pwdCheck" name="pwdCheck" placeholder="비밀번호를 한번더 입력해주세요." />
                            </div>
                        </li>
                        <li class="col-6 xs-col-12 pr-16 xs-pr-0">
                            <div class="input">
                                <label for="">담당자이름<span>*</span></label>
                                <input type="text" id="mngNm" name="mgrNm" placeholder="담당자 이름은 어떻게 되나요?" value="김인사" style="ime-mode:active !important;" />
                            </div>
                        </li>
                        <li class="col-6 xs-col-12 pl-16 xs-pl-0">
                            <div class="input">
                                <label for="">담당자 휴대폰<span>*</span></label>
                                <input type="text" id="telNo" name="telNo" placeholder="&quot;-&quot;없이 입력바랍니다." value="01023456789" />
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="input_list p-0 mb-20">
                    <ul class="input_list_in cf">
                        <li >
                            <div class="input sign_box">
                                <label for="compDtl">회사소개</label>
                                <div class="sign">
		                        	<textarea id="compDtl" name="compDtl" style="height:200px;"></textarea>
		                        </div>
                            </div>
                        </li>
                    </ul>
                </div>
                
                <!-- 버튼 -->
                <div class="btn_box xs-mt-20">
                	<button type="submit" id="btn" class="btn_login btn_blue">정보수정</button>
                </div>
                
                <div class="input_etc cf">
                    <div class="id_fine col-12"><a href="#none" class="underline common-open_popup" data-div="closed" data-user-div="company">회원탈퇴</a></div>
                </div>
            	</form>
            </div>
        </div>
    </section>
</div>
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
						
                        <li>
                            <div class="input">
                                <label for="">비밀번호</label>
                                <input type="password" id="pincode" name="pincode" />
                            </div>
                        </li>
						
						
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
								<p>2. 회원의 즉시 삭제 요청시 프리몬이 확인 후 그에 따른 조치를 취합니다.</p>
              					<p>※ 참고 : 계정의 개인정보는 관계 법령의 규정에 의하여 보유할 필요가 있는 경우 관계법령에서 정한 기간 동안 개인정보를 보관합니다.</p>
              					<p>회원 탈퇴와 관련하여 더 궁금하신 점은 프리몬 <a href="/customer/questionRegistForm">"문의하기 > 회원정보/아이디/비밀번호"</a>로 문의를 남기거나 고객센터(<a href="mailto:freemon@freemon.co.kr">freemon@freemon.co.kr</a>) 문의해주세요.</p>
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

	

    <script id="popMemoTemplate" type="text/x-mustache">
        <div class="pop">
            <div class="pop_header">
                <h3 id="pop-title">{{name}}</h3>
                <a href="javascript:void(0);" class="close">닫기</a>
            </div>
            <div class="pop_body">
                <div class="apply_con">
                    <textarea id="memo" name="memo" placeholder="메모내용은 GSteletech님만 볼수 있습니다." style="height:297px">{{memo}}</textarea>
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

	<%@ include file="../common/footer.jsp" %>

</body>
</html>