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

	<div class="load_box" style="display:none;"><div class="load_img"><img src="../../resources/images/common/loading.gif" alt="loading"/></div></div>


		
<script type="text/javascript" src="../../resources/freemon/applicant/apply.js"></script>
<script type="text/javascript" src="../resources/freemon/applicant/compApplicantSearch.js?version=4.0"></script>
<script type="text/javascript">
	$(function() {
		freemon.invoker.invoke("compApplicantSearch", "pm", "P");
		
		switch("P"){
		case "Y" : $(".tab_menu > ul.cf > li").removeClass("active"); $(".tab_menu > ul.cf > li:nth-child(2)").addClass("active"); break;
		case "I" : $(".tab_menu > ul.cf > li").removeClass("active"); $(".tab_menu > ul.cf > li:nth-child(3)").addClass("active"); break;
        case "R" : $(".tab_menu > ul.cf > li").removeClass("active"); $(".tab_menu > ul.cf > li:nth-child(4)").addClass("active"); break;
        case "N" : $(".tab_menu > ul.cf > li").removeClass("active"); $(".tab_menu > ul.cf > li:last-child").addClass("active"); break;
        default: $(".tab_menu > ul.cf > li").removeClass("active"); $(".tab_menu > ul.cf > li:first-child").addClass("active"); break;
		}
	});
</script>
<div id="container">
	<section class="project_in" style="min-height: 1099px;">
    	<!-- 제목부분 -->
    	<div class="pro_tit mb-0 no_line">
        	<h2>제안 및 지원자 현황</h2>
        </div>
        <div class="pop_bg" id="pop_prop_reject" style="display: none;">
            <div class="pop">
                <div class="pop_header">
                    <h3>지원 거절 사유</h3>
                    <a href="#none" class="close">닫기</a>
                </div>
                <div class="apply_top">
                    <select id="rejectList">
                        <option></option>
                    </select>
                </div>
                <div class="pop_body">
                    <form id="propForm" name="propForm" action="#">
                        <div class="apply_con">
                            <textarea id="rejectResonText" name="rejectResonText" placeholder="지원거절하시는 사유가 있으시면 여기에 남겨주세요."></textarea>
                            <div class="message_note">
                                <p class="foot_note first">
                                    <span></span>작성하신 사유는 프리랜서에는 공개되지 않고 프리몬 매칭 품질 향상을 <br>위해 사용됩니다.
                                </p>
                            </div>
                            <!-- 버튼-->
                            <div class="btn_pop_box">
                                <button id="btnProp" class="btn_apply" data-action="applicantReject" onclick="return false;">확인</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- 팝업 제안취소하기 -->
        <div class="pop_bg" id="pop_prop" style="display:none;">
            <div class="pop">
                <div class="pop_header">
                    <h3>제안취소하기</h3>
                    <a href="#none" class="close">닫기</a>
                </div>
                <div class="pop_body">
                    <div class="apply_top" style="line-height:20px;">
                        <span id="project_name"></span>
                        <br>
                        <span style="color:#666;">제안일시</span> <span id="project_date"></span>
                    </div>
                    <div class="apply_con">
                        <textarea id="textarea" placeholder="제안취소시 안내 내용이 있을 경우 여기에 남기세요."></textarea>
                        <div class="btn_pop_box">
                            <button id="btnProp" class="btn_apply" data-action="propCancelRegist" onclick="return false;">제안취소하기</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 카운터 -->
        <div class="count_num count5" style="display:none;">
            <ul class="cf">
                <li class="step1">
	                <a href="">
	                    <span class="num">999+<em><i>999+</i></em></span>
	                    <span class="tit"><em>제안</em></span>
	                </a>
	            </li>
	            <li class="step2">
	                <a href="">
	                    <span class="num">5</span>
	                    <span class="tit"><em>지원</em></span>
	                </a>
	            </li>
	            <li class="step3">
	                <a href="">
	                    <span class="num">5<em><i>2</i></em></span>
	                    <span class="tit"><em>면접진행</em></span>
	                </a>
	            </li>
	            <li class="step4">
	                <a href="">
	                    <span class="num">5<em><i>2</i></em></span>
	                    <span class="tit"><em>계약요청</em></span>
	                </a>
	            </li>
	            <li class="step5">
	                <a href="">
	                    <span class="num">5<em><i>2</i></em></span>
	                    <span class="tit"><em>계약완료</em></span>
	                </a>
	            </li>
            </ul>
        </div>
        <div class="tab_menu cf">
			<ul class="cf">
			    <li class="active"><a href="#none" data-value="P">제안</a></li>
			    <li class=""><a href="#none" data-value="Y">지원</a></li>
			    <li class=""><a href="#none" data-value="I">면접진행</a></li>
			    <li class=""><a href="#none" data-value="R">계약요청</a></li>
			    <li class=""><a href="#none" data-value="N">계약완료</a></li>
			</ul>
			<div class="custom_check" style="display:none;">
	            <span class="custom_checkbox">
			        <input type="checkbox" id="custom" name="" class="image_checkbox">
			        <label for="custom" class="image_checkbox">마감 포함</label>
			    </span>
			    <span class="custom_checkbox">
	                <input type="checkbox" id="custom2" name="" class="image_checkbox">
	                <label for="custom2" class="image_checkbox">[다음에 함께 할게요] 포함</label>
	            </span>
            </div>
        </div>
        
        <!-- 프로젝트 목록 -->
        <div class="man_list" id="talentSearchList">
	<div class="project_box no_data cf" style="text-align:center;">조회 결과가 없습니다.</div>
</div>
        
        <!-- 팝업 -->
		<div class="pop_bg" id="projectInTalentList" style="display:none;">
		</div>
    </section>
</div>

<script id="talentSearchListTemplate" type="text/x-mustache">
{{#data}}
<div class="applicant_box">
	<ul>
    	<li {{^isCloseYn}}class="open"{{/isCloseYn}}>
		<div class="project_info2 active">
			<h3>
				<a href="#none" data-action="detail" data-value="{{projIdx}}">{{#isCloseYn}}<span class="add_info gray first">마감</span>{{/isCloseYn}}{{projNm}}</a>
			</h3>
            <ul class="pro_list surport cf mt-0">
                <li>{{projStrtDt}} ~ {{projCloseDt}}</li>
            </ul>
			<span class="right_plus list_p"></span>
			
			<div class="count_small absolute" style="display:none;">
                <ul class="cf">
                    <li>
                        <a href="">
                            <span class="icon"><em class="p_num"><i>999+</i></em></span>
                            <span class="tit">제안<em>999+</em></span>
                        </a>
                    </li>
                    <li>
                        <a href="">
                            <span class="icon"><em class="p_num"><i>999+</i></em></span>
                            <span class="tit">지원<em>999+</em></span>
                        </a>
                    </li>
                    <li>
                        <a href="">
                            <span class="icon"><em class="p_num"><i>999+</i></em></span>
                            <span class="tit">면접진행<em>999+</em></span>
                        </a>
                    </li>
                    <li>
                        <a href="">
                            <span class="icon"><em class="p_num"><i>999+</i></em></span>
                            <span class="tit">계약요청<em>999+</em></span>
                        </a>
                    </li>
                    <li>
                        <a href="">
                            <span class="icon"><em class="p_num"><i>999+</i></em></span>
                            <span class="tit">계약완료<em>999+</em></span>
                        </a>
                    </li>
                </ul>	
            </div>

		</div>

		<ul class="project_con2" style = "display : {{^isCloseYn}}block{{/isCloseYn}}{{#isCloseYn}}none{{/isCloseYn}};">
			{{#applicantList}}
			<li class="detail_free company_show">
				<div class="compApplicant cf {{#isCloseYn}}closed{{/isCloseYn}}">
                    <div class="free_info cf">
                        <div class="profile" style="cursor:pointer; background-image:url('{{kkoPrfUrl}}')" data-action="{{#isApplicantYn}}applicantTalentDetail{{/isApplicantYn}}{{^isApplicantYn}}proposeTalentDetail{{/isApplicantYn}}" data-value="{{userId}}" data-applicntidx="{{applicntIdx}}" data-prpstidx="{{prpstIdx}}" data-projidx="{{projIdx}}">프로필 사진</div>
                        <div class="pro_con">
                            <!--div class="report2 list2">
                                <ul class="alarm cf">
                                    <li class="alarm2 on">투입가능</li>
                                </ul>
                            </div-->
                            <h3 data-action="{{#isApplicantYn}}applicantTalentDetail{{/isApplicantYn}}{{^isApplicantYn}}proposeTalentDetail{{/isApplicantYn}}" data-value="{{userId}}" data-applicntidx="{{applicntIdx}}" data-prpstidx="{{prpstIdx}}" data-projidx="{{projIdx}}">
                                <a href="#none">{{userNm}}</a>
                                <ul class="f_nature cf">
                                    <li>{{#isGenderNm}}{{gender}}{{#age}},{{/age}} {{/isGenderNm}}{{#age}}{{age}}세{{/age}}</li>
                                    <li class="ellipsis">{{hopeAreaNm}}</li>
                                </ul>
                            </h3>
                            <ul class="free_list cf">
                                <li>총 {{totalWorkCareer}}</li>
                                <li class="ellipsis">{{usableSkillNm}}</li>
                            </ul>
                            <!-- 해시태그, 투입가능일 -->
                            <div class="add_con cf">
                                <div class="hash ellipsis"> 
                                    <ul class="cf">
                                        {{#keyword}}{{#hashTagList}}<li>{{.}}</li>{{/hashTagList}}{{/keyword}}
                                    </ul>
                                </div>
                                <p class="able {{leaveStrtTermCss}}">{{leaveStrtTermTxt}}</p>
                            </div>
                            <ul class="btn_icon absolute cf">
                                <li class="like {{#isInterest}}active{{/isInterest}}"><a href="#none" data-action="m_like" data-value="{{userId}}" title="관심프리랜서">관심프리랜서</a></li>
                                <li class="pick {{#isExclusive}}active{{/isExclusive}}"><a href="#none" data-value="{{userId}}" data-nm="{{userNm}}" data-yn="{{exclusiveYn}}" data-action="talentExclusive" title="전속프리랜서<br/>전속프리랜서는 프리랜서가 기업에 소속되는 관계로 둘다 동의시 프리랜서검색에 노출되지 않습니다.">전속프리랜서</a></li>
                                <!--li class="tree"><a href="#none" data-action = "m_map" data-value="{{userId}}" title="인맥트리">인맥트리</a></li-->
                                <li class="memo {{#memoYN}}active{{/memoYN}}">
                                    {{#memoYN}}
                                    <a href="#none" class="talentMemo ellipsis" data-action="m_memo" data-value="{{userId}}" data-name="{{userNm}}" title="{{memo}}">{{memo}}<span></span></a>
                                    {{/memoYN}}
                                    {{^memoYN}}
                                    <a href="#none" class="talentMemo ellipsis" data-action="m_memo" data-value="{{userId}}" data-name="{{userNm}}" title="메모"></a>
                                    {{/memoYN}}
                                </li>
                            </ul>
                            <!-- 지원 또는 답변이 와서 상세 내용을 확인하지 않았을때 -->
                            {{^isRead}}<div class="checked"><p><em>미확인</em></p></div>{{/isRead}}
                        </div>
                    </div>
					<div class="process">
                        <div class="process_in">
                            <div class="p_btn">
                                {{^isCloseYn}}

                                {{#isProposeYn}}{{^isAppCancelYn}}{{^isApplicantYn}}

                                {{^isProCancelYn}}{{^isInterview}}
                                <!-- 제안한 뒤 -->
                                <p class="center">프로젝트를 제안하였습니다. 프리랜서의 답변을 기다려주세요.</p>
                                <div class="btn_box mt-10">
                                    <button id=" " class="btn_open" data-action="proposeCancel" data-value="{{projIdx}}" data-fno="{{userId}}" data-prpstidx="{{prpstIdx}}"  data-projnm="{{projNm}}" data-regdt="{{proposeDt}}" data-nm="{{userNm}}">제안취소</button>
                                </div>
                                {{/isInterview}}{{/isProCancelYn}}

                                {{#isProCancelYn}}
                                {{#isRejectYn}}
                                <!-- 제안 거절 받았을 때 -->
                                <p class="center">프리랜서가 제안은 감사하지만, 이번 프로젝트는 함께하기 어렵다고 합니다.<br/>도움이 필요하시면 프리몬 매니져에게 문의하세요.</p>
                                {{/isRejectYn}}
                                {{^isRejectYn}}
                                <!-- 제안취소 뒤 -->
                                <p class="center">프로젝트 제안을 취소하셨습니다. 다시 제안이 가능합니다.</p>
                                <div class="btn_box mt-10">
                                    <button id=" " class="btn_close" data-action="talentDetail" data-value="{{userId}}">제안하기</button>
                                </div> 
                                {{/isRejectYn}}
                                {{/isProCancelYn}}

                                {{/isApplicantYn}}{{/isAppCancelYn}}{{/isProposeYn}}

                                {{#isApplicantYn}}{{^isInterviewCancle}}
                                {{^isAppCancelYn}}{{^isInterview}}
                                <!-- 지원받았을 때 -->
                                <p class="center">{{userNm}}님이 프로젝트에 지원하였습니다. 프로필을 확인하시고 다음 단계를 선택하세요.</p>
                                <div class="btn_box mt-10">
									<button id=" " class="btn_close" data-action="applicantInterview" data-fno="{{userId}}" data-applicntidx="{{applicntIdx}}">면접진행</button>
                                    <button id=" " class="btn_open" data-action="applicantNextTime" data-fno="{{userId}}" data-value="{{projIdx}}" data-applicntidx="{{applicntIdx}}">다음에 함께 할게요</button>
                                </div>
                                {{/isInterview}}{{/isAppCancelYn}}

                                {{#isAppCancelYn}}{{^isInterview}}
                                <!-- 지원취소한 뒤 -->
                                <p class="center">{{userNm}}님이 지원을 취소하셨습니다. 제안이 가능합니다.</p>
                                <div class="btn_box mt-10">
                                    <button id=" " class="btn_close" data-action="talentDetail" data-value="{{userId}}">제안하기</button>
                                </div>
                                {{/isInterview}}{{/isAppCancelYn}}
                                {{/isInterviewCancle}}

                                {{#isInterviewCancle}}
                                <!-- 지원거절한 뒤 -->
                                <p class="center">지원을 거절하셨습니다.</p>
                                {{/isInterviewCancle}}
                                {{/isApplicantYn}}

                                {{#isInterview}}
                                <!-- 면접 진행 뒤 -->
                                <p class="center"></p>
                                {{/isInterview}}
                                {{/isCloseYn}}
                                {{#isCloseYn}}
                                <!-- 모집마감 후 -->
                                <p class="center">프로젝트 모집이 마감되었습니다.</p>
                                {{/isCloseYn}}
                            </div>
                            <!-- 프로세스 -->
                            <div class="p_step {{#isProposeYn}}step1 {{^isInterview}}{{#isProCancelYn}} {{#isRejectYn}}no{{/isRejectYn}} {{^isRejectYn}}no{{/isRejectYn}} {{/isProCancelYn}}{{/isInterview}}{{/isProposeYn}} {{#isRejectYn}}step2{{/isRejectYn}}
                                               {{#isApplicantYn}}step2 {{^isInterview}} {{#isAppCancelYn}}{{^isInterviewCancle}}no{{/isInterviewCancle}}{{/isAppCancelYn}} {{#isInterviewCancle}}no{{/isInterviewCancle}} {{/isInterview}}{{/isApplicantYn}} {{#isInterviewCancle}}step3{{/isInterviewCancle}} 
                                               {{#isInterview}}step3{{/isInterview}}">
                                <ul>
                                    <p class="line_graph"><em></em></p>
                                    <li>
                            {{#isProposeYn}}
                                {{^isProCancelYn}}
                                        <p class="tit"><span class="tit_in">제안<em class="yes">O</em></span></p>
                                        <span class="date">{{proposeDt}}</span>
                                {{/isProCancelYn}}
                                {{#isProCancelYn}}{{#isRejectYn}}
                                        <p class="tit"><span class="tit_in">제안<em class="yes">O</em></span></p>
                                        <span class="date">{{proRejectDt}}</span>
                                    {{/isRejectYn}}
                                    {{^isRejectYn}}
                                        <p class="tit"><span class="tit_in">제안<em class="no">X</em></span></p>
                                        <span class="date">{{proCancelDt}}</span>
                                {{/isRejectYn}}{{/isProCancelYn}}
                            {{/isProposeYn}}
                            {{^isProposeYn}}
                                        <p class="tit"><span class="tit_in">제안</span></p><span class="date"></span>
                            {{/isProposeYn}}
                                    </li>
                                    <li>
                            {{#isApplicantYn}}
                            {{^isAppCancelYn}}{{^isInterviewCancle}}
                                        <p class="tit"><span class="tit_in">지원<em class="yes">O</em></span></p>
                                        <span class="date">{{applicantDt}}</span>
                            {{/isInterviewCancle}}{{/isAppCancelYn}}
                            {{#isAppCancelYn}}{{^isInterviewCancle}}
                                        <p class="tit"><span class="tit_in">지원<em class="no">X</em></span></p>
                                        <span class="date">{{appCancelDt}}</span>
                            {{/isInterviewCancle}}{{/isAppCancelYn}}
                            {{#isInterviewCancle}}
                                        <p class="tit"><span class="tit_in">지원<em class="yes">O</em></span></p>
                                        <span class="date">{{spprtRefuseDt}}</span>
                            {{/isInterviewCancle}}
                            {{/isApplicantYn}}

                            {{^isApplicantYn}}
                            {{#isProposeYn}}{{^isAppCancelYn}}{{^isRejectYn}}
                                        <p class="tit"><span class="tit_in">지원</span></p><span class="date"></span> 
                            {{/isRejectYn}}{{/isAppCancelYn}}{{/isProposeYn}}
                            {{#isRejectYn}}
                                        <p class="tit"><span class="tit_in">지원<em class="no">X</em></span></p><span class="date">{{proRejectDt}}</span>
                            {{/isRejectYn}}
                            {{/isApplicantYn}}
                                    </li>
                                    <li>
                            {{#isInterview}}
                                        <p class="tit"><span class="tit_in">면접진행<em class="yes">O</em></span></p>
                                        <span class="date">{{interviewDt}}</span>
                            {{/isInterview}}
                            {{^isInterview}}{{^isInterviewCancle}}
                                        <p class="tit"><span class="tit_in">면접진행</span></p><span class="date"></span> 
                            {{/isInterviewCancle}}{{/isInterview}}
                            {{#isInterviewCancle}}
                                        <p class="tit"><span class="tit_in">면접진행<em class="no">X</em></span></p><span class="date">{{spprtRefuseDt}}</span> 
                            {{/isInterviewCancle}}
                                    </li>
                                    <li>
                                        <p class="tit"><span class="tit_in">계약요청<em class="yes">O</em></span></p>
                                        <span class="date">{{contRequestDt}}</span>
                                    </li>
                                    <li>
                                        <p class="tit"><span class="tit_in">계약완료<em class="yes">O</em><em class="no">X</em></span></p>
                                        <span class="date">{{contCompleteDt}}</span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
				</div>
			<li>
			{{/applicantList}}
	</ul>
</div>
{{/data}}
{{^data}}
	<div class="project_box no_data cf" style="text-align:center;">조회 결과가 없습니다.</div>
{{/data}}
</script>
 <script id="rejectListTemplate" type="text/x-mustache">
<option>거절하신 사유를 선택하세요</option>
{{#rejectList}}
    <option value="{{cdValNm}}">{{cdValNm}}</option>
{{/rejectList}}
</script>
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
