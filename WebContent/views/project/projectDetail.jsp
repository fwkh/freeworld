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
	  #login{display:none;}
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
	            	
	                
	                
	                <li>고객님</li>
	                <li class="login"><a href="/login/logout">로그아웃</a></li>
	                <li><a href="/mypage/myFreemon">마이프리몬<span class="arrow"></span></a>
	                	<ul class="top_depth2" style="display:none;">
	                    	<p class="top_arrow"></p>
	                    	<li><a href="/resume/resumeSearch">프로필 관리</a></li>
	                    	<!-- <li><a href="/document/documentSelect">서류신청</a></li> -->
	                    	<li><a href="#none" class="common-open_popup" data-div="alamn" data-user-div="freelancer">알림설정</a></li>
	                    </ul>
	                </li>
					
	                <li><a href="/customer/noticeSearch">고객센터<span class="arrow"></span></a>
	                	<ul class="top_depth2" style="display:none;">
	                    	<p class="top_arrow"></p>
	                    	<li><a href="/customer/noticeSearch">자주묻는질문</a></li>
	                        <li><a href="/customer/questionRegistForm">문의하기</a></li>
	                    </ul>
	                </li>
	                <li class="blog"><a href="http://blog.freemon.co.kr" target="_blank">블로그</a></li>
	            </ul>
	        </div>
	    </div>
	</div>
    <div class="header_body">
    	<div class="box">
           <h1 class="logo"><a href="/">프리월드</a></h1>
            <div id="gnb">
                <nav>
                    <ul class ="gnb_in cf">
                    	
						
						<li class="menu_about gnb_depth1 ">
                        	<a href="/project/projectSearch" class="gnb_depTxt"><em>프로젝트 검색</em></a>
                        </li>
						<li class="menu_about gnb_depth1 ">
                        	<a href="/project/projectMap" class="gnb_depTxt"><em>프로젝트 맵</em></a>
                        </li>
                        <li class="menu_about gnb_depth1 ">
                        	<a href="/applicant/talentApplicantSearch" class="gnb_depTxt"><em>제안 및 지원 현황</em></a>
                        </li>
                       <!--  <li class="menu_about gnb_depth1 ">
                        	<a href="/home/freemonSupport" class="gnb_depTxt"><em>출장지원</em></a> 
                        </li>-->
                        <li class="menu_about gnb_depth1 ">
                        	<a href="/resume/resumeSearch" class="gnb_depTxt"><em>프로필 관리</em></a>
                        </li>
						
						
                    </ul>
                </nav>
            </div>
		</div>
	</div>
</div>

		
<script type="text/javascript" src="/resources/freemon/project/projectDetail.js?version=1.6"></script>
<script type="text/javascript">
	$(function() {
		freemon.invoker.invoke("projectDetail", "param", {'m':'{"projCloseDt":"2021.01.31","projAddrCd":"110","projAddr":"종로구","closeYn":"N","compNm":"(주)가치정보기술","applicantCount":0,"mngId":"recruit@valueit.kr","recrtNum":"0명","recrtrQm":"프로젝트 상세 내용 참조","projTerm":"6","projStrtDt":"2020.08.29","accptCloseDt":"2020.09.29","email":"recruit@valueit.kr","resumeCount":0,"unitPrice":"1","negoYn":"Y","projUpperAddr":"서울","joinPsblDt":"2020.06.01","projNm":"[안국역] GSITM U.STRA CLOUD기반 ITSM 시스템 구축 ","travelExpYn":"Y","compDtl":"","accptStrtDt":"2020.08.29","projIdx":"1014","recruitSkillNm":"Jquery","contractCount":0,"phone":"010-2615-5920","cntiPlanYn":"N","mngNm":"강태규","projRegDt":"2020-08-29 00:24:51","closed":false,"projectDateDiff":"0","customer":"모집중"}'});
		projectDetail.fn.selectContractList('1014');
	});
</script>
<div id="container">
	<section class="sub_content">
		
				<div class="pop_bg" id="pop_communication" style="display:none;">
			<div class="pop">
		    	<div class="pop_header">
		        	<h3 style="width:90%"></h3>
		            <a href="javascript:void(0);" class="close">닫기</a>
		        </div>
		        <div class="pop_body">
		            <div class="apply_con">
				        <div class="career_etc_con">
				        	<div class="talk_box proj_talk" id="communicationList">
				        	</div>
       					</div>
       					
		            	<textarea id="talk" name="talk" style="height:100px;" placeholder="남기고 싶은 말을 남기세요."></textarea>
		                <div class="btn_pop_box">
		                    <button id="btnProp" class="btn_apply" data-action="talkSave" onClick="return false;">내용 남기기</button>
		                </div>
		            </div>
		        </div>
		    </div>
		</div>
		
		<!-- 팝업 -->
		<div class="pop_bg" id="projectInTalentList" style="display:none;">
		</div>

		<script id="communicationListTemplate" type="text/x-mustache">
        {{#inqueryList}}
        {{^me}}
        <!-- 상대 대화 -->
        <div class="talk you cf">
            <div class="talk_con">
                <div class="talk_in">
                    {{{inqDtl}}}
                    <p class="arrow"></p>
                    <p class="talk_time">{{#readYn}}읽음 {{/readYn}}{{^readYn}}안읽음 {{/readYn}}{{inqDt}}</p>
                </div>
            </div>
        </div>
        {{/me}}
        {{#me}}
        <!-- 내 대화 -->
        <div class="talk me">
            <div class="talk_in">
                {{{inqDtl}}}
                <p class="arrow"></p>
                <p class="talk_time">{{#readYn}}읽음 {{/readYn}}{{^readYn}}안읽음 {{/readYn}}{{inqDt}}</p>
            </div>
        </div>
        {{/me}}
        {{/inqueryList}}
		</script>    
		
		
		<div class="pop_bg" id ="pop_apply" style="display:none;">
			<div class="pop">
		    	<div class="pop_header">
		        	<h3>지원하기</h3>
		            <a href="javascript:void(0);" class="close">닫기</a>
		        </div>
		        <div class="pop_body">
		        	<div class="apply_top">
		            	<h4 class="company_name red"><a href="#none">모집중</a></h4>
		                <h3 class="project_name cf">
		                    <a href="javascript:void(0);">[안국역] GSITM U.STRA CLOUD기반 ITSM 시스템 구축 </a>
		                </h3>
		            </div>
		            <div class="apply_con">
		            	<textarea id="textarea" placeholder="지원시 참고할 내용이 있을 경우 여기에 남기세요."></textarea>
		            	
           				
           					
           						<div class="join_agree_body">
			                        <div class="agree_list mb-0">
			                        	<ul>
			                               <li class="active has-sub">
												<a href="javascript:void(0);" style="cursor:default;"><span style="display:inline-block;padding-right:10px;width: 19px;
		    height: 19px;background: #ff6600 url(/resources/images/new/agree_all.png) no-repeat center;border-radius:20px;margin-right:2px;vertical-align: bottom;"></span> 프로젝트 지원시 확인하세요!!</a>
			                               </li>
			                               <li class="has-sub agree_detail" style="overflow:auto;height:160px;">
			                               	<h4><strong>프로젝트 담당자</strong>가 지원하시는 프리랜서님의 <strong>이력정보</strong>를 확인 할 수<br/>있게 이력서가 꼭 등록되어 있어야 합니다.<br/>
			                               		<span style="color:#ff6600; font-size:13px;">* 이력정보가 없을 경우 1일 지원횟수가 제한됩니다.(1일 1회)</span>
			                               	</h4>
			                               	<p><a href="/resume/resumeSearch" class="underline">[프리몬에 이력서파일 올리기] <span style="color:#999;">클릭</span></a></p>
			                               	<p><a href="mailto:freemon@freemon.co.kr" class="underline">[메일로 프리몬에 이력서파일 보내기] <span style="color:#999;">클릭</span></a></p>
			                               </li>
			                            </ul>
			                        </div>
			                    </div>
           					
           					
           				
	                    
		                <div class="btn_pop_box">
		                    <button class="btn_apply" data-action = "applicntProj" onClick="return false;">지원하기</button>
		                </div>
		                
		            </div>
		        </div>
		    </div>
		</div>
		
		
        <!-- 프로젝트 상세 -->
        
        <div class="card no_over cf">
        	<!-- 프로젝트 정보 -->
            <div class="pro_info">
                <h4>모집중</h4>
                <h3 class="name">
                	
                	<!-- step1:제안 / step2:지원 / step3:면접진행 / step4:계약요청 / step5:계약완료 / 진행수락시:별도 표시 없음 / 거절취소시:no  -->
                    <!-- <span class="free_step step2">지원<em class="yes">O</em><em class="no">X</em></span> -->[안국역] GSITM U.STRA CLOUD기반 ITSM 시스템 구축 
                </h3>
                <ul class="ul_detail cf">
                    <li><span class="tit">투입기간</span>2020.08.29 ~ 2021.01.31<span class="add_info org">6개월</span></li>
                    <li><span class="tit">근무지역</span>서울 종로구</li>
                    <li><span class="tit">전문기술</span>Jquery</li>
                    <li><span class="tit">모집인원</span>0명</li>
                    <li><span class="tit">모집요건</span>프로젝트 상세 내용 참조</li>
                    
                    <li><span class="tit">단가</span>1만원
                    	<span class="add_info">협의가능</span><span class="add_info">출장비포함</span>
                    </li>
                    
                </ul>

                <!-- 공유하기 -->
                <ul class="btn_icon absolute">
                    <li class="share"><a href="javascript:void(0);" data-action="share_click" title="친구공유">친구공유</a></li>
                </ul>
            </div>

            <!-- 프로젝트 에디터 -->
            <div class="pro_info story">
            	■ 다음을 만족하는 대졸기준 3년이상 경력자<br/><br/>1) 수행업무<br/>   - ​Workflow 기반 ITSM 시스템 개발(웹개발)<br/>   - 내부결재, API연계 개발 등<br/>2) 기술등급/근무기간<br/>   - 초급(고)중급 : ​2020.09.14 ~ 2021.01.31<br/>   - 초급(고)중급 : ​2020.09.14 ~ 2020.12.31<br/>   - 초급(고)중급 : ​2020.09.14 ~ 2020.12.31<br/>3) 요소기술 Spring, JSTL, JQuery, Ansi SQL<br/>4) 근무장소 : 안국역 근처 삼환빌딩<br/>5) 우대사항 : REST api 설계 &구현 가능자 
            </div>
		</div>
		
		<!-- 담당자 안내 -->
		<div class="card no_over cf">
            <div class="pro_info">
                <h5><span class="add_info first">등록기업</span>(주)가치정보기술</h5>
                <p style="word-break: break-word;white-space: pre-wrap;"class="story"></p>
            </div>
            <div class="pro_info">
             	<ul class="ul_company cf">
                     <li><span class="tit">담당자</span>강태규</li>
                    
			
				<li><span class="tit">연락처</span><a href="tel:010-2615-5920">010-2615-5920</a></li>
                    		<li><span class="tit">이메일</span><a href="mailto:recruit@valueit.kr">recruit@valueit.kr</a></li>
                    	
                    	
                    	
                 </ul>
            </div>
            
        </div>
        <!-- 버튼 -->
        <div class="btn_box right">
        	
         	
             <!-- <button type="button" class="btn_normal btn_blue" data-action ="share_click" >친구공유</button> -->
             
             	
             		
             			
             				
             					
             					
             						<button type="button" class="btn_normal btn_blue" data-action="apply_click">지원하기</button>
             					
             				
             			
             		
             		
             	
             
            
            
            <button id="btn" class="btn_normal btn_gray" style="cursor:pointer;" data-action="list_click">목록으로</button>
        </div>
        
        
            
    </section>
</div>

<script id="contractListTemplate" type="text/x-mustache">
{{#data}}
    <div class="detail_man_list cf">
        <div class="detail_man_info cf">
			<a href="javascript:void(0);" style="cursor:default;">
            <div class="profile" style="background-image:url('{{profileUrl}}')">
                프로필사진
            </div>
            <div class="pro_con">
                <h4 class="man_name">{{userNm}}</h4>
                <ul class="project_ul darkgray_ul  cf">
                    <li>{{#isGenderNm}}{{genderNm}}{{#age}},{{/age}} {{/isGenderNm}}{{#age}}{{age}}세{{/age}}</li>
                    <li>{{hopeAreaNm}}</li>
                    <li class="ul_no_line ellipsis">{{usableSkillNm}}</li>
                </ul>
                <ul class="detail_man_ul cf">
                    <li class="ellipsis"><span>계약일</span>{{cntrctStrtDt}}</li>
                </ul>
            </div>
			</a>
        </div>
    </div>
{{/data}}
{{^data}}
	<div class="detail_man_list no-date cf">
    	<span>조회 결과가 없습니다.</span>
	</div>
{{/data}}
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
        <a href="javascript:void(0);" class="close">닫기</a>
    </div>
    <div class="pop_body">
        <form id="popForm" name="popForm">
			<div class="option_box add_box">
            	<div class="input_list p-0 mb-20">
                    <ul class="input_list_in cf">
						
						
							<input type="hidden" id="pincode" name="pincode" value="1" />
						
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
                                    <a href="javascript:void(0);" class="joinAgreeList">회원탈퇴 안내사항 확인</a>
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


	<%@ include file="../common/footer.jsp" %>

</body>
</html>