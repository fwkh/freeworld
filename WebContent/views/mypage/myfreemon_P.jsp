<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<meta http-equiv="content-type" content="text/html;charset=UTF-8" />


<head>

	<title>프리월드 - SI 전문 아웃소싱</title>

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
	
	<!-- 네비게이션 바로 밑 컨테이너-->
	<div id="container">
		<section class="project_in margintop" style="min-height: 765px;">
			<!-- 제목부분 -->
			<div class="pro_tit mb-0">
				<h2>김은호</h2>
			</div>
			<ul class="man_tab my_man_tab cf">
				<li class="active"><a href="#none">마이프리몬</a></li>		
				<!-- 주소 변경 -->
				<li><a href="../resume/resumeSearch.html">프로필관리</a></li>	
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
										등록된 경력을 기준으로<br>기업고객에게 보여지는<br>이력정보 화면입니다.<span class="a_arrow"></span>
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
								
								<div class="man_sche">
									<div class="she12_gray">
								<!-- 월 데이터 입력 및 테이블 자동생성 코드 작성-->	
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


							<!-- 최근 본프로젝트 & 제안 및 지원현황 -->
							<div class="mt-40 cf">
								<div class="col-6 pr-15">
									<!-- 프로젝트 -->
									<div class="dash">
										
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

	<!-- 풋터 include -->
	<%@ include file="../common/footer.jsp"%>

</body>

</html>