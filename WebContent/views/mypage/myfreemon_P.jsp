<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<meta http-equiv="content-type" content="text/html;charset=UTF-8" />


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
	<!-- 헤더 include -->
	<%@ include file="../common/header.jsp"%>


	<link rel="stylesheet" type="text/css"
		href="../resources/css/resume.css">
	<link rel="stylesheet" type="text/css"
		href="/resources/css/pop.css?version=1.0">
	<script type="text/javascript"
		src="/resources/freemon/mypage/myUserFreemon.js?version=1.9"></script>
	<script type="text/javascript">
		$(function() {
			$(function() {
				var skills = [], areas = [];

				freemon.invoker.invoke("myUserFreemon", "talent", {
					'userId' : '1444427072',
					'selectSkills' : skills,
					'selectArea' : areas
				});
			});

			$('.dateRangePicker').datepicker({
				format : "yyyy-mm-dd",
				language : "kr",
				minDate : freemon.util.getDateString(new Date(), '-'),
				autoclose : true
			});
		});
	</script>


	<script type="text/javascript">
		function clickFile() {
			registForm.file.click();
		}
		function fillFile() {
			registForm.virtu_text.value = registForm.file.value;
		}
	</script>

	<!-- 네비게이션 바로 밑 컨테이너-->
	<div id="container">
		<section class="project_in margintop" style="min-height: 765px;">
			<!-- 제목부분 -->
			<div class="pro_tit mb-0">
				<h2>김은호</h2>
			</div>
			<ul class="man_tab my_man_tab cf">
				<li class="active"><a href="#none">마이프리몬</a></li>
				<li><a href="../resume/resumeSearch.html">프로필관리</a></li>
				<!--  <li><a href="/document/documentSelect">서류신청</a></li> -->
				<li><a href="/customer/questionRegistForm">문의하기</a></li>
				<li><a href="javascript:void(0);" class="common-open_popup"
					data-div="alamn" data-user-div="freelancer">알림설정</a></li>
			</ul>
			<!-- 카운트 -->
			<div class="counter per_counter">

				<ul class="cf">
					<li><a href="/applicant/talentApplicantSearch">
							<h5>제안된 요청</h5>
							<p>
								<span class="icon"></span>0
							</p>
					</a></li>
					<li><a href="/applicant/talentApplicantSearch?dv=2">
							<h5>지원 프로젝트</h5>
							<p>
								<span class="icon"></span>1
							</p>
					</a></li>
					<li><a href="/applicant/talentApplicantSearch?dv=4">
							<h5>계약요청</h5>
							<p>
								<span class="icon"></span>0
							</p>
					</a></li>
					<li><a href="/applicant/talentApplicantSearch?dv=3">
							<h5>계약 프로젝트</h5>
							<p>
								<span class="icon"></span>0
							</p>
					</a></li>
				</ul>
			</div>
			<!-- 타임라인  -->
			<div class="mt-40 cf">
				<div>
					<!-- 프로젝트 -->
					<div class="dash">
						<div class="dash_tit">
							<h3>
								나의 타임라인 <a class="btn_close"
									href="/talent/openTalentDetail?fno=1414045769" target="_blank">프로필
									미리보기</a> <a href="javascript:void(0);" class="note_q">
									<p class="note_a">
										등록된 경력을 기준으로<br>기업고객에게 보여지는<br>이력정보 화면입니다.<span
											class="a_arrow"></span>
									</p>
								</a>
								<p class="small">
									<span>투입가능일</span>2020.12.07
								</p>
								<a href="/changeDate" class="btn_logout"> <!-- 투입가능일(비공개 프로젝트 수행중) 변경 -->일자변경
								</a>
							</h3>
							<div class="man_box cf" id="talentSearchList">
								<div class="man_info">
									<a href="/resume/resumeSearch">
										<div class="free_info cf">
											<div class="profile"
												style="background-image: url(/resources/images/new/no-pic.png)">프로필사진
											</div>
											<div class="pro_con">
												<h3>
													김은호
													<ul class="f_nature cf">
														<li>32세</li>
														<li class="ellipsis"></li>
													</ul>
												</h3>
												<ul class="free_list cf">
													<li>총 10년</li>
													<li class="ellipsis"></li>
												</ul>
												<!-- 해시태그, 투입가능일 -->
												<div class="add_con cf">
													<div class="hash ellipsis">
														<ul class="cf">

														</ul>
													</div>
													<!-- 투입가능일- 오늘날짜-->
													<p class="able ">119일후</p>
												</div>
											</div>
										</div>
									</a>
								</div>
								<!-- 월 데이터 입력-->
								<div class="man_sche">
									<div class="she12_gray">
										<ul class="cf">
											<li>
												<p>12월</p>
											</li>
											<li>
												<p>01월</p>
											</li>
											<li>
												<p>02월</p>
											</li>
											<li>
												<p>03월</p>
											</li>
											<li>
												<p>04월</p>
											</li>
											<li>
												<p>05월</p>
											</li>
											<li>
												<p>06월</p>
											</li>
											<li>
												<p>07월</p>
											</li>
											<li>
												<p>08월</p>
											</li>
											<li>
												<p>09월</p>
											</li>
											<li>
												<p>10월</p>
											</li>
											<li>
												<p>11월</p>
											</li>
										</ul>
									</div>
									<!-- 현재 진행중인 프로젝트종료일 -->
									<div class="project4" style="left: 0%; width: 99%;">
										<a href="javascript:void(0);" data-project-idx="-1"
											data-customer="" data-area="" data-strtdt="" data-closedt=""
											data-action="moveLink"
											title="비공개 프로젝트 진행중<br></a>2020.12.07부터 투입가능">
											<h4 class="ellipsis">비공개 프로젝트 진행중</h4>
											<p class="ellipsis">2020.12.07부터 투입가능</p>
											<div class="day_end"></div>
										</a>
									</div>


									<!-- 투입가능일 -->
									<div class="line_able" style="left: 69%;">
										<div class="day_able">08/10</div>
									</div>
								</div>
							</div>


							<!-- 추천프로젝트 & 제안 및 지원현황 -->
							<div class="mt-40 cf">
								<div class="col-6 pr-15">
									<!-- 프로젝트 -->
									<div class="dash">
										<div class="dash_tit">
											<h3>
												최근 본 프로젝트
												<!-- <a href="#none" class="note_q">
                            	<p class="note_a w180">최근 관심있게 본 프로젝트를<br/>보여드립니다.<span class="a_arrow"></span></p>
                            </a> -->
											</h3>
											<!-- <a href="/project/projectSearch" class="more">전체보기</a> -->
										</div>
										<div class="dash_list" id="myRecommandProjectList">
											<!--프로젝트 불러오기 -->
											<div class="card cf ">
												<div class="pro_info">
													<h4>
														<a href="javascript:void(0);" data-action="projectDetail"
															data-id="804">플랜정보기술</a>
													</h4>
													<h3 class="ellipsis">
														<a href="javascript:void(0);" data-action="projectDetail"
															data-id="804">DB 모니터링 툴 개발</a>
													</h3>
													<ul class="pro_list surport cf">
														<li>2020.08.10 ~ 2020.10.10<span class="add_info org">3개월</span>
														</li>
														<li>서울 송파구</li>
														<li>1만원(협의가능)</li>
														<li class="ellipsis">MongoDB,Python,Oracle,Linux</li>
													</ul>
													<ul class="btn_icon absolute">
														<li class="share"><a href="javascript:void(0);"
															data-action="shareClick" data-value="804" title="친구공유">친구공유</a></li>
													</ul>
												</div>
											</div>
											<div class="card cf ">
												<div class="pro_info">
													<h4>
														<a href="javascript:void(0);" data-action="projectDetail"
															data-id="755">모집중</a>
													</h4>
													<h3 class="ellipsis">
														<a href="javascript:void(0);" data-action="projectDetail"
															data-id="755">KIS정보통신 안드로이드 Agent 개발 </a>
													</h3>
													<ul class="pro_list surport cf">
														<li>2020.07.17 ~ 2020.12.31<span class="add_info org">6개월</span>
														</li>
														<li>서울</li>
														<li>550만원</li>
														<li class="ellipsis">Android,C</li>
													</ul>
													<ul class="btn_icon absolute">
														<li class="share"><a href="javascript:void(0);"
															data-action="shareClick" data-value="755" title="친구공유">친구공유</a></li>
													</ul>
												</div>
											</div>
										</div>
									</div>
									<!-- /프로젝트 -->
								</div>
								<div class="col-6 pl-15">
									<!-- 제안 및 지원현황 -->
									<div class="dash">
										<div class="dash_tit">
											<h3>제안 및 지원현황</h3>
											<a href="/applicant/talentApplicantSearch" class="more">전체보기</a>
										</div>
										<div class="dash_list com_black" id="myApplicantList">
											<div class="man_info no_data cf">조회 결과가 없습니다.</div>
										</div>
									</div>
									<!-- /제안 및 지원현황 -->
								</div>
							</div>

							<!-- 계약요청 & 계약 현황 -->
							<div class="mt-40 cf">
								<div class="col-6 pr-15">
									<!-- 계약요청 -->
									<div class="dash">
										<div class="dash_tit">
											<h3>
												계약요청 <a href="javascript:void(0);" class="note_q">
													<p class="note_a w180">
														기업고객으로 부터 계약요청<br>받은 정보를 보여드립니다.<span class="a_arrow"></span>
													</p>
												</a>
											</h3>
											<a href="/applicant/talentApplicantSearch?dv=4" class="more">전체보기</a>
										</div>
										<div class="dash_list" id="myRequestContractList">
											<div class="man_info no_data cf">조회 결과가 없습니다.</div>
										</div>
									</div>
									<!-- /프로젝트 -->
								</div>
								<div class="col-6 pl-15">
									<!-- 계약 프로젝트 -->
									<div class="dash">
										<div class="dash_tit">
											<h3>
												계약 프로젝트 <a href="javascript:void(0);" class="note_q">
													<p class="note_a w180">
														기업고객과 계약된 <br>보여드립니다.<span class="a_arrow"></span>
													</p>
												</a>
											</h3>
											<a href="/applicant/talentApplicantSearch?dv=3" class="more">전체보기</a>
										</div>
										<div class="dash_list com_black" id="myContractList">
											<div class="man_info no_data cf">조회 결과가 없습니다.</div>
										</div>
									</div>
									<!-- /제안 및 지원현황 -->
								</div>
							</div>
		</section>
	</div>


	<div class="pop_bg" id="pop_update_request" style="visibility: hidden;">
		<div class="my_pop over_hidden">
			<div class="pop_content">
				<!-- 스크롤 가로 메뉴 -->
				<script src="/resources/freemon/tab_menu/modernizr.js?version=1.1"></script>
				<script src="/resources/freemon/tab_menu/plugins.js?version=1.0"></script>
				<script src="/resources/freemon/tab_menu/sly.min.js?version=1.0"></script>
				<script src="/resources/freemon/tab_menu/horizontal.js?version=1.1"></script>
				<div class="frame tab_scroll" id="basic">
					<ul class="clearfix">
						<li class="skillTab active"><a href="javascript:void(0);">전문기술</a></li>
						<li class="hashTagTab "><a href="javascript:void(0);">해시태그</a></li>
						<li class="areaTab "><a href="javascript:void(0);">희망
								근무지역</a></li>

						<li class="resumeTab "><a href="javascript:void(0);">이력서
								등록/갱신</a></li>
					</ul>
				</div>


				<!-- 전문기술 -->
				<div class="page" id="skillPage">
					<h3 class="name mb-5">
						보유하신 <span class="orange">전문 기술</span>을 선택해 주세요.
					</h3>
					<p class="small">(최대 5개까지 선택 가능)</p>
					<div class="pop_input over_hidden">
						<table class="t_select">
							<tbody id="memberSkillList">
							</tbody>
						</table>
					</div>
					<div class="btn_box relative">
						<button class="btn b_m b_red" id="skillRegist">저장</button>
						<button class="btn b_m b_skip hashTagNextTab">건너뛰기</button>
					</div>
				</div>



				<!-- 해시태그 -->
				<div class="page hidden" id="hashTagPage">
					<h3 class="name mb-5">
						<span class="orange">해시태그</span>로 당신을 알려주세요.
					</h3>
					<p class="small">
						해시태그로 나의 강점이나 선호하는 프로젝트를 알려주세요.<br /> 기업이 당신을 쉽게 찾고 많은 기업의 관심을 받게
						되실 거예요.<br /> (예. #단기선호 #PL/PM전문 #해외출장경험자)
					</p>
					<div class="pop_input no_height over_hidden">
						<textarea rows="3" id="hashTag"></textarea>
					</div>
					<div class="btn_box relative">
						<button class="btn b_m b_red" id="hashTagRegist">저장</button>
						<button class="btn b_m b_skip areaNextTab">건너뛰기</button>
					</div>
				</div>



				<!-- 희망 근무지역 -->
				<div class="page hidden" id="areaPage">
					<h3 class="name mb-5">
						<span class="orange">희망 근무지역</span>을 선택해 주세요.
					</h3>
					<p class="small">(최대 5개까지 선택 가능)</p>
					<div class="pop_input over_hidden">
						<table class="t_select">
							<tbody id="memberAreaList">
							</tbody>
						</table>
					</div>
					<div class="btn_box relative">
						<button class="btn b_m b_red" id="areaRegist">저장</button>
						<button class="btn b_m b_skip joinPsblDtNextTab">건너뛰기</button>
					</div>
				</div>





				<!-- 이력서 등록/갱신 -->
				<div class="page hidden" id="resumePage">
					<h3 class="name mb-5">
						<span class="orange">이력서 파일</span>을 등록해 주세요.
					</h3>
					<p class="small">파일을 올려주시면 프리몬에서 프로필을 완성해드립니다.</p>
					<div class="pop_input date over_hidden">
						<div class="file_btn cf">
							<form id="registForm" name="registForm"
								enctype="multipart/form-data" style="display:;">
								<input type="file" id="file" name="file" class="hidden"
									accept="application/pdf, application/msword, application/vnd.openxmlformats-officedocument.wordprocessingml.document, application/x-tika-msoffice, application/vnd.ms-powerpoint, application/vnd.openxmlformats-officedocument.presentationml.slideshow, application/vnd.openxmlformats-officedocument.presentationml.presentation, application/vnd.ms-excel, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, .hwp"
									onchange="fillFile()" />
								<button name="virtu_btn" class="btn b_m"
									onclick="clickFile(); return false;">파일선택</button>
								<input type="text" name="virtu_text" readonly="readonly" />
								<button type="submit" id="btn" class="btn b_m b_red"
									style="cursor: pointer;">등록</button>
							</form>
						</div>
					</div>
					<em class="f_note">공개 선택 시, 지원한 프로젝트에서 기업이 해당 파일을 다운로드할 수
						있습니다.</em>
					<div class="file_layout">
						<table class="file_board">
							<tbody id="resumeFileList">
							</tbody>
						</table>
					</div>
					<!-- <div class="btn_box relative">
		    		<button class="btn b_m b_red">저장</button>
		    	</div> -->
				</div>

			</div>

			<!-- 닫기 -->
			<div class="pop_footer">
				<ul class="ul_close">
					<li id="weekcloseYn" value="Y"><a href="">7일간 보지 않기</a></li>
					<li id="close"><a href="">닫기</a></li>
				</ul>
			</div>
		</div>
	</div>

<!-- 지원현황 2page -->
	<script id="myRecommandProjectListTemplate" type="text/x-mustache">
{{#projectList}}
    <div class="card cf {{#isClosed}}closed{{/isClosed}}">
        <div class="pro_info">
                <h4>
					<a href="javascript:void(0);" data-action="projectDetail" data-id="{{projIdx}}">{{customer}}</a>
				</h4>
                <h3 class="ellipsis">
                    <a href="javascript:void(0);" data-action="projectDetail" data-id="{{projIdx}}">{{projNm}}</a>
                </h3>
                <ul class="pro_list surport cf">
                    <li>{{projStrtDt}} ~ {{projCloseDt}}<span class="add_info org">{{projTerm}}개월</span></li>
                    <li>{{projUpperAddr}} {{projAddr}}</li>
					<li>{{unitPrice}}만원{{#negoYn}}(협의가능){{/negoYn}}</li>
                    <li class="ellipsis">{{recruitSkillNm}}</li>
                </ul>
                <ul class="btn_icon absolute">
                    <li class="share"><a href="javascript:void(0);" data-action="shareClick" data-value="{{projIdx}}" title="친구공유">친구공유</a></li>
                </ul>
        </div>
    </div>
{{/projectList}}
{{^projectList}}
    <div class="man_info no_data cf">조회 결과가 없습니다.</div>
{{/projectList}}
</script>

	<script id="myApplicantListTemplate" type="text/x-mustache">
{{#projectList}}
    <div class="card cf {{#isClosed}}closed{{/isClosed}}">
        <div class="pro_info">
                <h4>
					<a href="javascript:void(0);" data-action="{{#isPropose}}proposeDetail{{/isPropose}}{{^isPropose}}applicantDetail{{/isPropose}}" data-id="{{projIdx}}" {{#isPropose}}data-app="{{prpstIdx}}"{{/isPropose}}{{^isPropose}}data-app="{{applicntidx}}"{{/isPropose}} data-dv="2">{{customer}}</a>
				</h4>
                <h3 class="ellipsis">
                    <a href="javascript:void(0);" data-action="{{#isPropose}}proposeDetail{{/isPropose}}{{^isPropose}}applicantDetail{{/isPropose}}" data-id="{{projIdx}}" {{#isPropose}}data-app="{{prpstIdx}}"{{/isPropose}}{{^isPropose}}data-app="{{applicntidx}}"{{/isPropose}} data-dv="2"><span class="add_info org first {{#isPropose}}submit{{/isPropose}}{{^isPropose}}suggest{{/isPropose}}">{{contractStateText}}</span>{{projNm}}</a>
                </h3>
                <ul class="pro_list surport cf">
                    <li>{{projStrtDt}} ~ {{projCloseDt}}<span class="add_info">{{projTerm}}개월</span></li>
                    <li>{{projUpperAddr}} {{projAddr}}</li>
					<li>{{unitPrice}}만원{{#negoYn}}<span class="add_info">협의가능</span>{{/negoYn}}</li>
                    <li class="ellipsis">{{recruitSkillNm}}</li>
                </ul>
                <ul class="btn_icon absolute">
                    <li class="share"><a href="javascript:void(0);" data-action="shareClick" data-value="{{projIdx}}" title="친구공유">친구공유</a></li>
                </ul>
        </div>
    </div>
{{/projectList}}
{{^projectList}}
    <div class="man_info no_data cf">조회 결과가 없습니다.</div>
{{/projectList}}
</script>

	<script id="myRequestContractListTemplate" type="text/x-mustache">
{{#projectList}}
    <div class="card cf {{#isClosed}}closed{{/isClosed}}">
        <div class="pro_info">
                <h4>
					<a href="javascript:void(0);" data-action="applicantDetail" data-id="{{projIdx}}" data-app="{{applicntidx}}" data-dv="4">{{customer}}</a>
				</h4>
                <h3 class="ellipsis">
                    <a href="javascript:void(0);" data-action="applicantDetail" data-id="{{projIdx}}" data-app="{{applicntidx}}" data-dv="4"><span class="add_info org first propose">계약요청</span>{{projNm}}</a>
                </h3>
                <ul class="pro_list surport cf">
                    <li>{{projStrtDt}} ~ {{projCloseDt}}<span class="add_info">{{projTerm}}개월</span></li>
                    <li>{{projUpperAddr}} {{projAddr}}</li>
                    <li>{{unitPrice}}만원{{#negoYn}}<span class="add_info">협의가능</span>{{/negoYn}}</li>
                    <li class="ellipsis">{{recruitSkillNm}}</li>
                </ul>
               <ul class="btn_icon absolute">
                    <li class="share"><a href="javascript:void(0);" data-action="shareClick" data-value="{{projIdx}}" title="친구공유">친구공유</a></li>
                </ul>
        </div>
        </div>
    </div>
{{/projectList}}
{{^projectList}}
    <div class="man_info no_data cf">조회 결과가 없습니다.</div>
{{/projectList}}
</script>

<!--  게약요청 page -->
	<script id="myContractListTemplate" type="text/x-mustache">

</script>

	<script id="talentSearchListTemplate" type="text/x-mustache">
{{#obj}}
	{{#talentList}}
    <div class="man_info">
        <a href="/resume/resumeSearch">
        <div class="free_info cf">
            <div class="profile" style="background-image:url({{profileUrl}})">프로필사진</div>
            <div class="pro_con">
                <h3>
                    {{userNm}}
				<ul class="f_nature cf">
                    <li>{{#isGenderNm}}{{genderNm}}{{#age}},{{/age}} {{/isGenderNm}}{{#age}}{{age}}세{{/age}}</li>
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
            </div>
        </div>
        </a>
    </div>
    <div class="man_sche">
        <div class="she12_gray">
            <ul class="cf">
                {{#monthArr}}
                <li><p>{{month}}월</p></li>
                {{/monthArr}}
            </ul>
        </div>
        {{#cntrctList}}
        <!-- 이전 프로젝트 -->
        {{#isDisplay}}
        <div class={{cssNm}} style="left:{{leftwidth}}%;width:{{rightwidth}}%;">
            <a href="javascript:void(0);" data-project-idx="{{projIdx}}" data-customer="{{customer}}" data-area="{{workArea}}" data-strtdt="{{strtdt}}" data-closedt="{{closedt}}"
                data-action="moveLink" title="{{{projNm}}}<br/>{{projPeriod}}">
            <h4 class="ellipsis">{{{projNm}}}</h4>
            <p class="ellipsis">{{projPeriod}}</p>
            <div class="day_end">{{endDay}}</div>
            </a>
        </div>
        {{/isDisplay}}
        {{/cntrctList}}


        <!-- 투입가능일 -->
        <div class="line_able" style="left:{{initwidth}}%;">
            <div class="day_able">{{initDate}}</div>
        </div>
    </div>
	{{/talentList}}
{{/obj}}
</script>
	<script id="memberJobStrartTemplate" type="text/x-mustache">

</script>
	<script id="memberJobListTemplate" type="text/x-mustache">

</script>
	<script id="memberSkillListTemplate" type="text/x-mustache">

</script>
	<script id="memberJobEndTemplate" type="text/x-mustache">

</script>
	<script id="memberAreaStrartTemplate" type="text/x-mustache">

</script>
	<script id="memberAreaListTemplate" type="text/x-mustache">

</script>
	<script id="memberArea2ListTemplate" type="text/x-mustache">

</script>
	<script id="memberAreaEndTemplate" type="text/x-mustache">

</script>
	<script id="resumeFileListTemplate" type="text/x-mustache">

</script>


	<script id="popAlamnTemplate" type="text/x-mustache">

	</script>
	<script id="popClosedTemplate" type="text/x-mustache">

	</script>

	<script id="projectInTalentListTemplate" type="text/x-mustache">

    </script>



	<!-- 풋터 include -->
	<%@ include file="../common/footer.jsp"%>

</body>

</html>