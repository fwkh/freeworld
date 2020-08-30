<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
    <head>
	<%@ include file="../common/header.jsp" %>
	<style type="text/css">	  
	  #f_management{display:none;}
	  #p_management{display:none;}
	  #profile{display:none;}
	  #suggestion{display:none;}
	  #logout{display:none;}
	</style>
    </head>
<body>
	<!-- Google Tag Manager (noscript) -->
	<noscript><iframe src="http://www.googletagmanager.com/ns.html?id=GTM-MF7LK3J"
	height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
	<!-- End Google Tag Manager (noscript) -->

	<div class="load_box" style="display:none;"><div class="load_img"><img src="../../resources/images/common/loading.gif" alt="loading"/></div></div>

	
<script type="text/javascript" src="../resources/freemon/mypage/myProjectSearch.js?v=1.1"></script>
<script type="text/javascript">
	$(function() {
		freemon.invoker.invoke("myProjectSearch");
	});
</script>

<div id="container">
	<section class="project_in" style="min-height: 1099px;">
    	<!-- 제목부분 -->
    	<div class="pro_tit mb-0">
        	<h2>프로젝트 관리 <span><span class="totalCnt">1</span></span></h2>
             <div class="search cf">
                <div class="input_box col-11">
                    <input type="text" id="keyword" placeholder="예) 서울 java">
                </div>
                <a href="#none" class="btn_search col-1" id="freemonSearchBtn">검색</a>
            </div>
        </div>
        
        <!-- 프로젝트 목록 -->
        <div class="man_list">
	        <!-- 버튼 -->
	        <div class="btn_box right mt-0 mb-10">
	        	<button id="btnEdit" class="btn_no" style="cursor:pointer" onclick="document.location.href='/project/projectConfig'">프로젝트 등록</button>
	        </div>
	        
        	<div id="myProjectSearchList">
        	<!-- 프로젝트 정보 -->
            <div class="card cf closed">
                <div class="pro_info">
                    <h4 class="company_name"><a href="./myProjectDetail?fno=825">지에스인스텍</a></h4>
                    <h3 class="project_name cf">
                        <span class="project_name_in">
                        	<span class="add_info gray">마감</span><a href="./myProjectDetail?fno=825">웹사이트개발</a>
                        </span>
                        
                    </h3>
					<ul class="pro_list surport cf">
                        <li>2020.08.25 ~ 2020.09.15</li>
                    	<li>서울 강남구</li>
						<li>1만원<span class="add_info">협의가능</span></li>
                   		<li>Java, JavaScript, MySQL</li>
                	</ul>
                </div>
                <!-- 수정 2019-03-12 -->
                <div class="report list2">
                	<ul class="report_in cf">
                    	<li class="note_back on"><a href="./myProjectDetail?fno=825#applicantList">지원  1</a></li>
                        <li class="note_agree "><a href="./myProjectDetail?fno=825#contractList">계약  0</a></li>
                    </ul>
                </div>
            </div>
</div>
        	<!-- 더보기 -->
	        <div class="more_box" style="display:none;">
	           	<a href="#none" class="btn_more center" data-action="moreViewClick"><span class="t_more">더보기</span></a>
	        </div>
        
	        <!-- 버튼 -->
	        <div class="btn_box right mt-10">
	        	<button id="btnEdit2" class="btn_no" style="display:none; cursor:pointer" onclick="document.location.href='/project/projectConfig'">프로젝트 등록</button>
	        </div>
        </div>
        
    </section>
</div>

<script id="myProjectSearchListTemplate" type="text/x-mustache">
{{#projectList}}
        	<!-- 프로젝트 정보 -->
            <div class="card cf {{#isClosed}}closed{{/isClosed}}">
                <div class="pro_info">
                    <h4 class="company_name"><a href="./myProjectDetail?fno={{projIdx}}">{{customer}}</a></h4>
                    <h3 class="project_name cf">
                        <span class="project_name_in">
                        	{{#isClosed}}<span class="add_info gray">마감</span>{{/isClosed}}<a href="./myProjectDetail?fno={{projIdx}}">{{projNm}}</a>
                        </span>
                        {{#newImage}}<span class="add_info org">New</span>{{/newImage}}
                    </h3>
					<ul class="pro_list surport cf">
                        <li>{{projStrtDt}} ~ {{projCloseDt}}{{^isClosed}}<span style="color:#ff6600">{{leaveStrtTerm}}</span>{{/isClosed}}</li>
                    	<li>{{projUpperAddr}} {{projAddr}}</li>
						<li>{{unitPrice}}만원{{#negoYn}}<span class="add_info">협의가능</span>{{/negoYn}}</li>
                   		<li>{{recruitSkillNm}}</li>
                	</ul>
                </div>
                <!-- 수정 2019-03-12 -->
                <div class="report list2">
                	<ul class="report_in cf">
                    	<li class="note_back {{#isApplicantCount}}on{{/isApplicantCount}}"><a href="./myProjectDetail?fno={{projIdx}}#applicantList">지원  {{applicantCount}}</a></li>
                        <li class="note_agree {{#isContractCount}}on{{/isContractCount}}"><a href="./myProjectDetail?fno={{projIdx}}#contractList">계약  {{contractCount}}</a></li>
                    </ul>
                </div>
            </div>
{{/projectList}}
{{^projectList}}
    <div class="project_box no_data cf" style="text-align:center;">조회 결과가 없습니다.</div>
{{/projectList}}
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

    
    
</body>
</html>