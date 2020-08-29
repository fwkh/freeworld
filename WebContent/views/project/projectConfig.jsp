<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="ko">
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

	<div class="load_box" style="display:none;"><div class="load_img"><img src="/resources/images/common/loading.gif" alt="loading"/></div></div>


<div id="header">
	<div class="header_top">
	    <div class="box">
	    
	        <div class="top_menu w_top_menu">
	            <ul class="cf">
	            	
	                
	                <li>GSteletech님</li>
	                <li class="login"><a href="/login/logout">로그아웃</a></li>
	                <li><a href="/mypage/myFreemon">마이프리몬</a>
	                </li>
	                
	                
	                <!-- <li><a href="/customer/noticeSearch">고객센터<span class="arrow"></span></a> -->
	                	<ul class="top_depth2" style="display:none;">
	                    	<p class="top_arrow"></p>
	                    	<li><a href="/customer/noticeSearch">자주묻는질문</a></li>
	                        <li><a href="/customer/questionRegistForm">문의하기</a></li>
	                    </ul>
	                </li>
	                <!-- <li class="blog"><a href="http://blog.freemon.co.kr" target="_blank">블로그</a></li> -->
	            </ul>
	        </div>
	    </div>
	</div>
    <div class="header_body">
    	<div class="box">
           <h1 class="logo"><a href="../../views/main/home.jsp">프리월드</a></h1>
            <div id="gnb">
                <nav>
                    <ul class ="gnb_in cf">
                    	
                        <li class="menu_about gnb_depth1 ">
                        	<a href="../../views/freelancer/freelancerSearch.jsp" class="gnb_depTxt"><em>프리랜서 검색</em></a>
                        </li>
                        <li class="menu_about gnb_depth1 ">
                        	<a href="/talent/interestTalent" class="gnb_depTxt"><em>프리랜서 관리</em></a>
                        </li>
                        <li class="menu_about gnb_depth1 ">
                        	<a href="/applicant/compApplicantSearch" class="gnb_depTxt"><em>제안 및 지원자 현황</em></a>
                        </li>
                        <li class="menu_about gnb_depth1 ">
                        	<a href="/mypage/myProjectSearch" class="gnb_depTxt"><em>프로젝트 관리</em></a>
                        </li>
						
                    </ul>
                </nav>
            </div>
		</div>
	</div>
</div>

	

<script type="text/javascript" src="/resources/freemon/project/projectConfig.js?version=1.3"></script>
<script type="text/javascript">
	$(function() {
		freemon.invoker.invoke("projectConfig");
		
		$('.input_day').datepicker({
			 format: "yyyy-mm-dd",
			 language: "kr",
			 minDate: freemon.util.getDateString(new Date(), '-'),
			 autoclose: true
		});
		
 		$("#projDtl").load("/resources/freemon/editer.html?version=1.1", function( response, status, xhr ) {
			if ( status == "error" ) {
				var msg = "Sorry but there was an error: ";
				$("#projDtl").html( msg + xhr.status + " " + xhr.statusText );
				$("#projDtl").hide();
			}
		});
	});
</script>

<div id = "container">
	<section class="project_in">
    	<!-- 제목부분 -->
    	<div class="pro_tit mb-0">
        	<h2>프로젝트 등록</h2>
        </div>
        
        <!-- 프로젝트 입력폼 -->
        <div class="input_list">
        	<form id="registForm" name="registForm">
        	<ul class="input_list_in cf">
                <li class="col-6 xs-col-12 pr-16 xs-pr-0">
                	<div class="input">
                    	<label for="projNm">프로젝트명<span>*</span></label>
                        <input type="text" id="projNm" name="projNm" required="required" />
                    </div>
                </li>
                <li class="col-6 xs-col-12 pl-16 xs-pl-0">
                	<div class="input">
                    	<label for="projStrtDt">투입기간<span>*</span></label>
                        <input type="text" class="input_day" id="projStrtDt" name="projStrtDt" required="required" readonly="readonly" />
                        <span class="pl-16 pr-16  xs-pl-0  xs-pr-0"> ~ </span>
                        <input type="text" class="input_day" id="projCloseDt" name="projCloseDt" required="required" readonly="readonly" /> 
                        <span class="input_add" style="padding-left:10px;"><input type="checkbox" id="cntiPlanYn" name="cntiPlanYn" value="Y" /> <label for="cntiPlanYn">연장가능</label></span>
                    </div>
                </li>
                <li class="col-6 xs-col-12 pr-16 xs-pr-0">
                	<div class="input">
                    	<label for="customer">고객사</label>
                        <input type="text" id="customer" name="customer" />
                    </div>
                </li>
                <li class="col-6 xs-col-12 pl-16 xs-pl-0">
                	<div class="input won">
                    	<label for="unitPrice">단가<span>*</span></label>
                        <input type="text" id="unitPrice" name="unitPrice" value="0" style="width: 263px;"/> <span>만원</span> 
                        <span class="input_add" style="padding-left:10px;"><input type="checkbox" id="negoYn" name="negoYn" value="Y" checked="checked"/> <label for="negoYn">협의가능</label></span>
                        <span class="input_add"><input type="checkbox" id="travelExpYn" name="travelExpYn" value="Y" checked="checked"/> <label for="travelExpYn">출장비포함</label></span>
                    </div>
                </li>
                <li class="col-6 xs-col-12 pr-16 xs-pr-0">
                	<div class="input cf">
                    	<label for="skills">전문기술<span>*</span></label>
                        <input type="text" id="skills" name="skills" class="input_tech" required="required" readonly="readonly" style="cursor:pointer;"/>
                    </div>
                    <div class="option depth2 multi" id="skillPartList" style="display: none;">
							<div class="select_box cf">
								<ul class="cf" id="memberConfigJobList">
								</ul>
								<ul class="cf" id="memberConfigSkillList">
								</ul>
							</div>
							<div class="view_box">
								<ul class="cf">
								</ul>
								<div id="btnSkill" class="btn_close">선택</div>
							</div>
						</div>
					</li>
                <li class="col-6 xs-col-12 pl-16 xs-pl-0">
                	<div class="input">
                    	<label for="area">위치<span>*</span></label>
                        <input type="text" id="area" name="area" class="input_local" required="required" readonly="readonly" style="cursor:pointer;"/>
                    </div>
						<div class="option depth2 multi" id="workAreaList" style="display: none;">
							<div class="select_box cf">
								<ul class="cf" id="memberConfigAreaList">
								</ul>
								<ul class="cf" id="memberConfigArea2List">
								</ul>
							</div>
						</div>
					</li>
                <li class="col-6 xs-col-12 pr-16 xs-pr-0">
                	<div class="input">
                    	<label for="recrtrQm">모집요건</label>
                        <input type="text" id="recrtrQm" name="recrtrQm" placeholder="예) 자바 경력 3년 이상"/>
                    </div>
                </li>
                <li class="col-6 xs-col-12 pl-16 xs-pl-0">
                	<div class="input">
                    	<label for="recrtNum">모집인원</label>
                        <input type="text" id="recrtNum" name="recrtNum" placeholder="예) c# 중급 1명, 고급 1명"/>
                    </div>
                </li>
                <li class="col-12 xs-col-12 pr-16 xs-pr-0">
                	<div class="input">
                    	<label for="accptStrtDt">모집기간<span>*</span></label>
                        <input type="text" class="input_day" id="accptStrtDt" name="accptStrtDt" required="required" readonly="readonly" />
                        <span class="pl-16 pr-16  xs-pl-0  xs-pr-0"> ~ </span>
                        <input type="text" class="input_day" id="accptCloseDt" name="accptCloseDt" required="required" readonly="readonly" /> 
                        <span class="input_add" style="padding-left:20px;line-height:18px; color:#ff6600;">
                        	* 모집기간은 기본 등록일로부터 한달이며 모집기간 종료일 이후 자동 마감됩니다. <br/>
                       	 	* 모집기간 변경시 클릭하여 수정하시기 바랍니다.
                        </span>
                    </div>
                </li>
                <li>
                	<div class="input sign_box">
                    	<label for="projDtl">프로젝트 상세 내용</label>
                        <div class="sign">
							<textarea name="projDtl" id="projDtl" cols="100" rows="50" autofocus required style="height:700px;"></textarea>
                        </div>
                    </div>
                </li>
            </ul>
            
            <!-- 버튼 -->
            <div class="btn_box right">
            	<button type="submit" id="btn" class="btn_normal btn_blue">등록하기</button>
                <button id="btn" class="btn_normal btn_gray" onClick="location.href='/mypage/myProjectSearch';return false;";>프로젝트 목록</button>
            </div>
            </form>
        </div>
    </section>
</div>

<script id="memberConfigJobListTemplate" type="text/x-mustache">
	{{#jobList}}
		<li class="configSelect {{#index}}active{{/index}}" data-value="{{cdVal}}" style="cursor:pointer;">{{cdValNm}}</li>
	{{/jobList}}
</script>
<script id="memberConfigSkillListTemplate" type="text/x-mustache">
	{{#jobList}}
    	<li class="skillSelect" id="skillSelectList_{{cdVal}}" data-id="{{cdVal}}" data-value="{{cdValNm}}" style="cursor:pointer;">{{cdValNm}}</li>
	{{/jobList}}
</script>
<script id="memberConfigAreaListTemplate" type="text/x-mustache">
{{#areaList}}
	<li class="areaSelect" data-id="{{cdVal}}" data-value="{{cdValNm}}" style="cursor:pointer;">{{cdValNm}}</li>
{{/areaList}}
</script>
<script id="memberConfigArea2ListTemplate" type="text/x-mustache">
    {{#areaList}}
        <li class="area2Select" id="areaSelectList_{{cdVal}}" data-id="{{cdVal}}" data-value="{{cdValNm}}" style="cursor:pointer;">{{cdValNm}}</li>
    {{/areaList}}
</script>
<script>
	//initCkeditor();
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