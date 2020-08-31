<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<!-- Google Tag Manager -->
	<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
	new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
	j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
	'http://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
	})(window,document,'script','dataLayer','GTM-MF7LK3J');</script>
	<!-- End Google Tag Manager -->	


	<link rel="stylesheet" type="text/css" href="../../resources/css/default.css">
	<link rel="stylesheet" type="text/css" href="../../resources/css/jquery-ui.min.css">
	<link rel="stylesheet" type="text/css" href="../../resources/css/member.css">
	<link rel="stylesheet" type="text/css" href="../../resources/css/new.css">
	<link rel="stylesheet" type="text/css" id="mobile" href="../../resources/css/web_hand.css">
	<link rel="stylesheet" type="text/css" href="../../resources/css/career-ui.min.css?version=2.0" />
	<link rel="stylesheet" type="text/css" href="../../resources/css/ui.jqgrid.css" />
	<link rel="shortcut icon" href="../../resources/images/new/favicon.ico"/>
	
	<style type="text/css">
	  .tooltipUI{
	    background-color:#FAF4C0;
	  }
	  .ui-tooltip {
	    padding: 8px;
	    position: absolute;
	    z-index: 999999;
	    color : #fff;
	    font-size : 12px;
	    max-width: 600px;
	    -webkit-box-shadow: 0 0 5px #aaa;
	    box-shadow: 0 0 5px #aaa;
		/* for IE */
		filter:alpha(opacity=80);
		/* CSS3 standard */
		opacity:0.8;
		line-height:16px;
	  }
	  body .ui-tooltip {
	    border-width: 2px;
	  }
	  
	  /* .scrollOff{position:fixed;overflow:hidden;height:100%;width:100%;} */
	</style>
    <script type="text/javascript" src="../../resources/scripts/jquery-3.3.1.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="../../resources/scripts/jquery.flexslider.js"></script>
    <script type="text/javascript" src="../../resources/scripts/site_ui.js"></script>
	<script type="text/javascript" src="../../resources/js/jquery.easing.1.3.js"></script>
    <!--Calendar-->
    <script type="text/javascript" src="../../resources/scripts/calendar/pignose.calendar.full.js"></script>
	<script type="text/javascript" src="../../resources/js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="../../resources/js/jquery.ba-hashchange.min.js"></script>
	<script type="text/javascript" src="../../resources/js/jquery.json-2.3.js"></script>
	<script type="text/javascript" src="../../resources/js/jquery.validate.min.js"></script>
	<script type="text/javascript" src="../../resources/js/jquery.history.js"></script>
	<!-- Jqgrid -->
	<script type="text/javascript" src="../../resources/js/grid.locale-kr.js"></script>
	<script type="text/javascript" src="../../resources/js/jquery.jqGrid.min.js"></script>
	<!-- //Jqgrid -->
	<script type="text/javascript" src="../../resources/js/jquery.marquee.min.js?version=1.0"></script>
	<script type="text/javascript" src="../../resources/js/mustache.js"></script>
	<script type="text/javascript" src="../../resources/js/jquery.cookie.js"></script>
	<script type="text/javascript" src="../../resources/i18n/commonMessages_ko.js"></script>
	<script type="text/javascript" src="../../resources/freemon/base64.js"></script>
	<script type="text/javascript" src="../../resources/freemon/sha256.js"></script>
	<script type="text/javascript" src="../../resources/freemon/nmask.js"></script>
	<script type="text/javascript" src="../../resources/freemon/freemon.js?version=3.4"></script>
	<script type="text/javascript" src="../../resources/js/gnb_common.js?version=4.2"></script>
	<script type="text/javascript" src="../../resources/freemon/common/apply.js"></script>
	<script type="text/javascript" src="../../resources/freemon/common/freemonPopUp.js?version=1.2"></script>
	<script type="text/javascript" src="../../resources/freemon/common/input.js"></script>
	
	<script type="text/javascript" src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
	
	<script type="text/javascript">
		var frameworkProperties = {
			context: '',
			locale: 'ko',
			defaultLang: 'ko',
			kakaoAppKey: 'a8bf256e33657332f212fd5847dbd8c5',
		};
	</script>

	<script type="text/javascript">
		$(function() {
			$(document).tooltip({
				//tooltipClass: 'tooltipUI',
		       	content: function() {
		        return $(this).prop('title');
		       	},
		       	track: true
			});
			
			freemon.invoker.invoke("freemonPopUp");

			var stylesheet = document.getElementById("mobile");
			if(freemon.ux.isMobileCheck() == false){				
			    stylesheet.setAttribute('href', "");
			    $(".link_mobile").hide();
			}
			else{
				var url = "/resources/css/web_hand.css";
				stylesheet.setAttribute('href', url);
				$(".link_mobile").show();
			}
			
 			$('.flow_text_in').marquee({
				direction: 'up',
				speed: 200,
				gap: 0,
				delayBeforeStart: 0,
				duplicated: true,
				pauseOnHover: true
			}); 
		});
		
		// 모바일일때 모바일경로로 이동
		$(document).ready(function(){
			if(freemon.ux.isMobileCheck() == true && "" == "MOBILE"){
				document.location.href = "https://m.freemon.co.kr";
				return false;
			}
		});
	</script>
</head>
<body>
	<!-- Google Tag Manager (noscript) -->
	<noscript><iframe src="http://www.googletagmanager.com/ns.html?id=GTM-MF7LK3J"
	height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
	<!-- End Google Tag Manager (noscript) -->

	<div class="load_box" style="display:none;"><div class="load_img"><img src="/resources/images/common/loading.gif" alt="loading"/></div></div>
<script type="text/javascript" src="/resources/freemon/talent/openTalentDetail.js?version=3.2"></script>
<script type="text/javascript">
	$(function() {
		freemon.invoker.invoke("talentDetailSearch", "param", {fno : '1414045769'});
		$("#btnList").hide();
	});	
</script>

<div id="container" style="margin-top:-140px;">
	<section class="project_in pt-0 pb-0">
        <div id="talentDetailSearchList" class="cf">
        </div>
    </section>
</div>
<link rel="stylesheet" type="text/css" href="/resources/css/resume.css?version=4.4">

<script id="talentDetailSearchListTemplate" type="text/x-mustache">
{{#talentList}}
<div class="left_content">
    <!--기본정보-->
    <div class="free_info col-12 no_float p-0 cf">
        <div class="profile_big">
            <div class="profile" style="background-image:url('{{profileUrl}}')">프로필사진</div>
        </div>
        <div class="free_con pt-5">
            <h5>{{userNm}}
            <ul class="f_nature cf ml-10">
                {{#isGenderNm}}<li class="ellipsis">{{gender}}</li>{{/isGenderNm}}
                {{#age}}<li>{{age}}세</li>{{/age}}
            </ul>
            </h5>
            {{#keyword}}
            <div class="hash org hash_detail no_float mt-20"> 
                <ul class="cf"> 
                    {{#hashTagList}}<li>{{.}}</li>{{/hashTagList}}
                </ul>
            </div>
            {{/keyword}}
            <ul class="ul_detail gray cf mt-10">
                <li><span class="tit">전화</span>{{telNo}}
                    {{#isTalentDetailSearchOpen}}<p class="text_i"><span class="note_i"></span>제안 후, 공개</p>{{/isTalentDetailSearchOpen}}
                    {{#isRejCancle}}<p class="text_i"><span class="note_i"></span>제안 후, 공개됨</p>{{/isRejCancle}}</li>
                <li><span class="tit">주소</span>{{addr}}</li>
                <li><span class="tit">이메일</span>{{email}}
                    {{#isTalentDetailSearchOpen}}<p class="text_i"><span class="note_i"></span>제안 후, 공개</p></li>{{/isTalentDetailSearchOpen}}
                    {{#isRejCancle}}<p class="text_i"><span class="note_i"></span>제안 후, 공개</p>{{/isRejCancle}}</li>              
            </ul>
            {{^isOpenTalentDetail}}
            <ul class="btn_icon absolute0 cf">
                <li class="like {{#IsinterestYn}}active{{/IsinterestYn}}"><a href="javascript:void(0);" data-action="m_like" class="btn_small m_like">관심프리랜서</a></li>
                <li class="pick {{#isExclusiveYn}}active{{/isExclusiveYn}}"><a href="javascript:void(0);" data-value="{{userId}}" data-nm="{{userNm}}" data-yn="{{exclusiveYn}}" data-action="talentExclusive" title="전속프리랜서<br/>전속프리랜서는 프리랜서가 기업에 소속되는 관계로 둘다 동의시 프리랜서검색에 노출되지 않습니다.">전속프리랜서</a></li>
                <!--li class="tree"><a href="#none" class="btn_small m_map" data-action="m_map" data-value="{{userId}}">인맥트리</a></li-->
                <li class="memo {{#memoYN}}active{{/memoYN}}"><a href="javascript:void(0);" class="talentMemo ellipsis" data-value="{{userId}}" data-name="{{userNm}}" data-action="talentMemo" {{#memoYN}}title="{{memo}}"{{/memoYN}}{{^memoYN}}title="메모"{{/memoYN}}>{{memo}}{{#memoYN}}<span></span>{{/memoYN}}</a></li>
            </ul>
            {{/isOpenTalentDetail}}
        </div>
    </div>
    <!-- 대시보드 -->
    <ul class="dashboard cf">
        <li>
            <h6>경력</h6>
            <p>총 {{totalWorkCareer}}</p>
        </li>
        <li>
            <h6>전문기술</h6>
            <p>{{usableSkillNm}}</p>
        </li>
        <li>
            <h6>희망지역</h6>
            <p>{{hopeAreaNm}}</p>
        </li>
        <li>
            <h6>투입가능일</h6>
            <p class="eng">{{joinPsblDt}}</p>
            <p class="able no_float mt-5 {{leaveStrtTermCss}}">{{leaveStrtTermTxt}}</p>
        </li>
    </ul>

    <!-- 학력 -->
    <div id="education">
        <div class="tab_menu mt-30">
            <ul>
                <li class="active"><a href="#education">학력</a></li>
                <li><a href="#career">수행 프로젝트</a></li>
                <li><a href="#etc">기타</a></li>
                <li><a href="#certify">자격사항</a></li>
            </ul>
        </div>
        {{#isSchoolList}}
        <p class="total"><span class="tit">최종학력</span>{{schoolNm}}</p>
        {{#schoolList}}
        <div id="schoolList" class="mt-10">
            <div class="card no_over over_hidden">
                <div class="card_info" id="educationEdit">
                    {{#isStateNm}}
                        <ul class="pro_section">
                            <li>{{stateNm}}</li>
                        </ul>
                    {{/isStateNm}}
                        <p class="pro_term">{{entrncDt}} ~ {{finishDt}}</p>
                        <ul class="pro_name">
                            <li>{{schoolNm}}</li>
                            <li>{{major}}</li>
                        </ul>
                        {{#isStateNm}}<span class="add_info top">{{stateNm}}</span>{{/isStateNm}}
                        <ul class="pro_detail">
                            <li class="grade">{{score}}/{{^grade}}0{{/grade}}{{grade}}</li>
                        </ul>
                </div>
            </div>
        </div>
        {{/schoolList}}
        {{/isSchoolList}}
    </div>


    <!-- 수행 프로젝트 -->
    <div id="career">
        <div class="tab_menu mt-30">
            <ul>
                <li><a href="#education">학력</a></li>
                <li class="active"><a href="#career">수행 프로젝트</a></li>
                <li><a href="#etc">기타</a></li>
                <li><a href="#certify">자격사항</a></li>
            </ul>
        </div>
        <p class="total"><span class="tit">경력</span>총 {{totalWorkCareer}}</p>
        {{#isCareerList}}
        {{#careerList}}
        <div class="career_detail">
            <div id="resumeSearchList">
                {{#careerArray}}
                <p class="pro_term">{{strtDt}} ~ {{endDt}}<span class="add_info org_stroke">{{date}}</span></p>
                <div class="card no_line no_over">
                    <div class="card_info">
                        {{#isoccDomain}}
                        <ul class="pro_section">
                            {{#occupationDiv}}<li>{{occupationDiv}}</li>{{/occupationDiv}}
                            {{#domainDiv}}<li>{{domainDiv}}</li>{{/domainDiv}}
                        </ul>
                        {{/isoccDomain}}
                        <ul class="pro_name">
                            <li>{{customer}}</li>
                            <li>{{projNm}}</li>
                        </ul>
                        <ul class="pro_detail">
                            {{#workCompNm}}<li class="company">{{workCompNm}}</li>{{/workCompNm}}
                            {{#jobPos}}<li class="job">{{jobPos}}</li>{{/jobPos}}
                            {{#isLang}}<li class="tech"><!--전문기술:-->{{lang}}</li>{{/isLang}}
                            {{#isDbms}}<li class="tech2"><!--DBMS:-->{{dbms}}</li>{{/isDbms}}
                            {{#isFramework}}<li class="tech5"><!--프레임워크:-->{{framework}}</li>{{/isFramework}}
                            {{#isOs}}<li class="tech1"><!--운영체제:-->{{os}}</li>{{/isOs}}
                            {{#isDevTool}}<li class="tech4"><!--개발툴:-->{{devTool}}</li>{{/isDevTool}}
                        </ul>
                        <div class="pro_etc">
                            <ul>
                                {{#isRole}}<li class="cf"><h6>주요업무</h6><p class="word_break">{{{role}}}</p></li>{{/isRole}}
                                {{#isprojectDtl}}<li class="cf"><h6>프로젝트 설명</h6><p class="word_break">{{{projectDtl}}}</p></li>{{/isprojectDtl}}
                                {{#isEtc}}<li class="cf"><h6>비고</h6><p class="word_break">{{{etc}}}</p></li>{{/isEtc}}
                            </ul>
                        </div>

                    </div>
                </div>
                {{/careerArray}}
            </div>
        </div>
        {{/careerList}}
        {{/isCareerList}}

    </div>

    <!-- 기타 -->
    <div id="etc">
        <div class="tab_menu mt-30">
            <ul>
                <li><a href="#education">학력</a></li>
                <li><a href="#career">수행 프로젝트</a></li>
                <li class="active"><a href="#etc">기타</a></li>
                <li><a href="#certify">자격사항</a></li>
            </ul>
        </div>
        <div id="etcViewList" class="mt-10">
            {{#isResumeNoteList}}
            {{#resumeNoteList}}
            <div class="card no_over over_hidden">
                <div class="card_info">
                    <ul class="pro_name">
                        <li>{{subject}}</li>
                    </ul>
                    <p class="word_break">{{{contents}}}</p>
                </div>
            </div>
            {{/resumeNoteList}}
            {{/isResumeNoteList}}
        </div>
    </div>

    <!-- 자격사항 -->
    <div id="certify">
        <div class="tab_menu mt-30">
            <ul>
                <li><a href="#education">학력</a></li>
                <li><a href="#career">수행 프로젝트</a></li>
                <li><a href="#etc">기타</a></li>
                <li class="active"><a href="#certify">자격사항</a></li>
            </ul>
        </div>
        {{#isCertificationList}}
        <div id="certList" class="mt-10">
            {{#certificationList}}
            <div class="card no_over over_hidden">
                <div class="card_info">
                    <p class="pro_term">{{acqrDt}}</p>
                    <ul class="pro_name mb-0">
                         <li>{{quilifNm}}</li>
                         <li class="small">{{publOrg}}</li>
                    </ul>
                </div>
            </div>
            {{/certificationList}}
        </div>
        {{/isCertificationList}}
    </div>
</div>

<div id="right">
    <!-- 제안버튼 -->
	{{^isOpenTalentDetail}}
	{{^isClosed}}
    {{^isRejectYn}}
    {{^isCancelYn}}
    {{#isTalentProposeDetailSearch}}
    
    <a href="javascript:void(0);" class="btn b_m col-12 no_float" data-action="proposeCancel" data-nm="{{userNm}}" data-projnm="{{projNm}}" data-regdt="{{regDt}}">{{btnProposeCancel}}</a>
    
    {{/isTalentProposeDetailSearch}}
    {{#isTalentDetailSearchPropose}}
    
    <a href="javascript:void(0);" class="btn b_m b_red col-12 no_float" data-action="prop">프로젝트 제안</a>
    {{/isTalentDetailSearchPropose}}
    
    {{/isCancelYn}}
	{{/isRejectYn}}

    <div {{#isTalentAppliDetailSearch}}data-value-userid="{{userId}}" data-value-applicntIdx="{{appliIdx}}"{{/isTalentAppliDetailSearch}}>
    {{#isTalentAppliDetailSearch}}
    
    {{#cntrctView}}
    <button type="button" id="btn" class="btn b_m b_red col-12 no_float" data-action="contractView">{{btnContractView}}</button>
    {{/cntrctView}}
    {{#isApplicantCancel}}
        <button id="btn" class="btn b_m col-12 mt-5 no_float">{{btnApplicantCancel}}</button>
    {{/isApplicantCancel}}

    {{^isApplicantCancel}}
    {{#nextTime}}
        <button id="btn" class="btn b_m col-12 mt-5 no_float {{^refuseView}} {{/refuseView}}{{#refuseView}} {{/refuseView}}" {{^refuseView}}{{^cntrctDone}}data-action="applicantNextTime"{{/cntrctDone}}{{/refuseView}} style="cursor:pointer;">{{btnApplicantNextTime}}</button>
    {{/nextTime}}
       
    {{/isApplicantCancel}}
    
    {{/isTalentAppliDetailSearch}}
    </div>
    
    <!-- 이력서 다운로드 -->
    {{#resumeFileList}}
    <div class="file_down">
        <h4>이력서 다운로드</h4>
        <ul class="file_list cf">
            <li><a href="/talent/resumeDownload?attmIdx={{attmIdx}}" class="ellipsis">{{fileName}}</a></li>
        </ul>
    </div>
    {{/resumeFileList}}
	{{/isClosed}}

    <!-- 이력서 요청 버튼 -->
	{{^isRejectYn}}
    {{^isCancelYn}}
    {{^isResumeFile}}
	{{^resumeFileList}}
        {{^isCareerList}}
            <a href="javascript:void(0);" class="btn b_m col-12 mt-5" data-action="requestCVFile" data-comp="권철">이력서 요청</a>
        {{/isCareerList}}
	{{/resumeFileList}}
    {{/isResumeFile}}
    {{/isCancelYn}}
	{{/isRejectYn}}

    <!-- 제안 프로젝트 -->
	{{^isTalentDetailSearch}}
	<div class="cf"/>
    <div class="pro_select">
        <h5 class="ellipsis">
			{{#isTalentProposeDetailSearch}}
				<span class="add_info org first submit">
				제안{{#isRejectYn}}거절{{/isRejectYn}}{{#isCancelYn}}취소{{/isCancelYn}}
				</span>
			{{/isTalentProposeDetailSearch}}
			{{#isTalentAppliDetailSearch}}
				<span class="add_info org first suggest">{{prgsDivTitleStr}}</span>
			{{/isTalentAppliDetailSearch}}
			{{projNm}}
		</h5>
        <ul class="pro_detail">
            {{#isTalentProposeDetailSearch}}
            <li class="while">
                {{^isRejectYn}}{{^isCancelYn}}{{regDt}}{{/isCancelYn}}{{/isRejectYn}}
				{{#isRejectYn}}{{rejectDt}}{{/isRejectYn}}
				{{#isCancelYn}}{{cancelDt}}{{/isCancelYn}}
			</li>
            {{/isTalentProposeDetailSearch}}
            {{#isTalentAppliDetailSearch}}
            <li class="while">{{regDt}}</li>
            {{/isTalentAppliDetailSearch}}

			{{#isUnitPriceYn}}<li class="pay">{{unitPrice}}만원 {{#isNegoYn}}<span class="add_info">협의가능</span>{{/isNegoYn}}{{#isTravelExpYn}}<span class="add_info">출장비 포함</span>{{/isTravelExpYn}}</li>{{/isUnitPriceYn}}
        </ul>
    </div>
	<div class="cf"/>

    <!-- 대화 -->
    {{#isInqueryList}}
    <div class="talk_box" id="loadCommunicationList" >
    {{#inqueryList}}
        {{^me}}
        <!-- 상대 대화 -->
        <div class="talk you">
            <div class="talk_in">
                {{{inqDtl}}}
                <p class="talk_time">{{inqDt}} {{#readYn}}읽음 {{/readYn}}{{^readYn}}안읽음 {{/readYn}}</p>
            </div>
        </div>
        {{/me}}
        {{#me}}
        <!-- 내 대화 -->
        <div class="talk me">
            <div class="talk_in">
                {{{inqDtl}}}
                <p class="talk_time">{{#readYn}}읽음 {{/readYn}}{{^readYn}}안읽음 {{/readYn}}{{inqDt}}</p>
            </div>
        </div>
        {{/me}}
    {{/inqueryList}}
    </div>
    <button id="btnEdit" class="btn b_m b_gray col-12" data-action="openCommunicationPopup">메시지 남기기</button>
    {{/isInqueryList}}
    {{/isTalentDetailSearch}}
    {{/isOpenTalentDetail}}

    <!-- 목록버튼 -->
    <button type="button" id="btnList" class="btn b_m col-12 mt-20" data-action="listView" onClick="return false;">목록으로</button>

</div>
{{/talentList}}
</script>

</body>
</html>

