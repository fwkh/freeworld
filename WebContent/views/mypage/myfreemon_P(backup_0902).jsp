<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kh.semi.project.model.vo.*"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="kh.semi.jsp.member.model.vo.*"%>


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
	  #login{display:none;}
	</style>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>

<body>

<script type="text/javascript" src="../../resources/freemon/common/freemonSearch9667.js?version=1.2"></script>
<script type="text/javascript">
	$(function() {
		freemon.invoker.invoke("freemonSearch");
		$('.dateRangePicker').datepicker({
			 format: "yyyy-mm-dd",
			 language: "kr",
		});
	});
</script>
<script>
	/* $(function(){
		location.href="/myWeb/mypageLoad.bo"; // 세션에서 값 불러오기
	}); */
</script>
	
	<!-- 네비게이션 바로 밑 컨테이너-->
	<div id="container">
		<section class="project_in margintop" style="min-height: 765px;">
			<!-- 제목부분 -->
			<div class="pro_tit mb-0">
				<h2><%-- <%=m.getUserName()%> --%></h2>
			</div>
			<ul class="man_tab my_man_tab cf">
				<li class="active"><a href="#none">마이프리월드</a></li>		
				<!-- 주소 변경 -->
				<li><a href="resumeSearch.jsp">프로필관리</a></li>	
			</ul>
			<!-- 카운트 -->
			<div class="counter per_counter">

				<ul class="cf">
					<li><a href="/applicant/talentApplicantSearch">
							<h5>제안된 요청</h5>
							<p>
								<span class="icon"></span>0 <!-- 제안된 요청 count(*)불러오기 -->
							</p>
					</a></li>
					<li><a href="/applicant/talentApplicantSearch?dv=2">
							<h5>지원 프로젝트</h5>
							<p>
								<span class="icon"></span>1 <!--  지원한 프로젝트가 있다면 count(*) 불러오기 -->
							</p>
					</a></li>
					<li><a href="/applicant/talentApplicantSearch?dv=4">
							<h5>계약요청</h5> <!--  계약요청이 들어온 프로젝트 count(*)불러오기 -->
							<p>
								<span class="icon"></span>0
							</p>
					</a></li>
					<li><a href="/applicant/talentApplicantSearch?dv=3">
							<h5>계약 프로젝트</h5>
							<p>
								<span class="icon"></span><!--  계약한 프로젝트가 있다면 count(*) 불러오기 -->
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
								나의 타임라인 <a class="btn_close" href="">프로필 미리보기</a> <a href="javascript:void(0);" class="note_q">
									<p class="note_a">
										등록된 경력을 기준으로<br>기업고객에게 보여지는<br>이력정보 화면입니다.<span class="a_arrow"></span>
									</p>
								</a>
								<p class="small">
									<span>투입가능일</span><%-- <%=m.getFuture() %> --%></p>
								<a href="changeDate.jsp" class="btn_logout">날짜 변경
								</a>
							</h3>
							<div class="man_box cf" id="talentSearchList">
								<div class="man_info">
									<a href="resumeSearch.jsp">
										<div class="free_info cf">
											<div class="profile"
												style="background-image: url(/resources/images/new/no-pic.png)">프로필사진
											</div>
											<div class="pro_con">
												<h3>
													이름<%-- <%=m.getUserName()%> --%>
													<ul class="f_nature cf">
														<li>나이<%-- <%
															df.format(today.getTime());
														%> --%></li>
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
													<p class="able ">투입 가능일(if진행중인 프로젝트가 있따면 진행중인 프로젝트종료일-오늘/ else 투입 희망일- 오늘) 양식 :xx일 후</p>
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
											<h4 class="ellipsis"><%-- if 프로젝트가 진행중=>"비공개 프로젝트 진행중", else if 투입희망일<오늘 =>'공백',else "즉시투입가능"   --%>비공개 프로젝트 진행중</h4>
											<p class="ellipsis"><!-- 투입 가능일(if진행중인 프로젝트가 있따면 진행중인 프로젝트종료일-오늘=> "xx일 후가능"/ else if 투입 희망일- 오늘 => "xx일 후 가능"/ else => '공백') -->  12일 후 가능</p>
											<div class="day_end"></div>
										</a>
									</div>


									<!-- 투입가능일 -->
									<div class="line_able" style="left: 69%;"> <%-- %조절로 위치 조절함 노가다 해야함 --%>
										<div class="day_able"><%--프로젝트 종료일 or 프로젝트 희망일 --%><=m.getFuture() %></div>
									</div>
								</div>
							</div>

							<!-- 임시 -->
							<div class="proj_list">
        	<!-- 목록형 -->
			<div class="open_list xs-hidden">
                <ul class="suggest_list" id="projectSearchList">
<!-- 목록형-->
<li class=" closed">
	<div class="proj_box cf">
		<div class="proj_info col-6" data-action="applicantInfo" data-view="slider">
                <h4 data-value="1013"><a href="javascript:void(0);" data-action="projectDetail" data-appidx="1213" data-proidx=""><span class="line-130">GSteletech</span></a></h4>
                <h3 data-value="1013">
                    <a href="javascript:void(0);" data-action="projectDetail" data-appidx="1213" data-proidx="">
                        <span class="add_info gray first">마감</span><span class="add_info org first ">면접진행</span><span class="line-130">semi-Project</span>
                    </a> 
                    
                </h3>
                <ul class="pro_list surport">
                    <li>2020-08-28 ~ 2020-09-07<span class="add_info org">1개월</span></li>
                    <li>서울 강남구</li>
					<li class="ellipsis">1만원<span class="add_info">협의가능</span></li>
                    <li class="ellipsis">Ajax, Java, JSP, MySQL</li>
                </ul>
                <!-- 친구공유 -->
                <ul class="btn_icon absolute cf">
                    <li class="share"><a href="javascript:void(0);" data-action="share_click" data-value="1013" title="친구공유">친구공유</a></li>
                </ul>
                <!-- 지원 또는 답변이 와서 상세 내용을 확인하지 않았을때 -->
                
                
				<span class="right_plus"></span>
        </div>
        <div class="process">
            <div class="process_in">
                <div class="p_btn">
                    

					<!-- 프로젝트 모집이 마감되었을 때 -->
                    <p class="center">프로젝트 모집이 마감되었습니다.</p>

                </div>
                <!-- 프로세스 -->
                <div class="p_step 
                                
                                step2 
                                
                                step3  
                                ">          
                    <ul>
                        <p class="line_graph"><em></em></p>
                        <li>
                                
                                
                                
                                
                                <p class="tit"><span class="tit_in">제안</span></p><span class="date"></span>
                        </li>
                        <li>
                                
                                
                                
                                <p class="tit"><span class="tit_in">지원<em class="yes">O</em></span></p><span class="date">2020-08-28</span>
                        </li>
                        <li>
                            <p class="tit"><span class="tit_in">면접진행<em class="yes">O</em></span></p><span class="date">2020-08-28</span>
                            
                            
                        </li>
                        <li>
                            <p class="tit"><span class="tit_in">계약요청</span></p><span class="date"></span>
                        </li>
                        <li>
                            <p class="tit"><span class="tit_in">계약완료</span></p>
                        </li>
                    </ul>
                </div>
            </div>
            
        </div> 
    </div>
    <ul class="open_talk" style="display:none">
     	<li>
         	<div class="talk_box proj_talk" id="loadCommunicationList1013" data-action="openCommunicationPopup" data-idx="1013" data-fno="kch@gsteletech.com" data-nm="GSteletech" data-appidx="1213" data-proidx="">
             	<!-- 제안메시지 -->
                <div class="apply_talk">
                    <h6><strong>GSteletech</strong>님이 한진선님께 면접진행을 하셨습니다.<br class="md-hidden sm-hidden xs-visible"><span>2020-08-28</span></h6>
						<ul class="detail_ul cf mt-5 center">
            				<li class="col-12"><span class="stroke">제안단가</span>1만원 (협의가능,출장비 포함)</li>
        				</ul>
                </div>

				<!-- 내 대화 -->
				<div class="talk me">
					<div class="talk_in">
						지원합니다.
						<p class="arrow"></p>
						<p class="talk_time">읽음 2020.08.28</p>
					</div>
				</div>
            </div>
			<div class="talk_btn">
				<button id="btnEdit" class="btn_no btn_mess" data-action="openCommunicationPopup" data-idx="1013" data-fno="kch@gsteletech.com" data-nm="GSteletech" data-appidx="1213" data-proidx="" style="cursor:pointer;position:relative;">메시지 남기기</button>
			</div>
        </li>
	</ul>
</li>
</ul>
			</div>
            
            <!-- 팝업 -->
					<div class="pop_bg" id="pop_communication" style="display: none;">
			<div class="pop">
		    	<div class="pop_header">
		        	<h3 style="width:90%">GSteletech님에게 메시지를 보냅니다.</h3>
		            <a href="javascript:void(0);" class="close">닫기</a>
		        </div>
		        <div class="pop_body">
		            <div class="apply_con">
				        <div class="career_etc_con">
				        	<div class="talk_box proj_talk" id="communicationList">
        <!-- 내 대화 -->
        <div class="talk me">
            <div class="talk_in">
                지원합니다.
                <p class="arrow"></p>
                <p class="talk_time">읽음 2020.08.28</p>
            </div>
        </div>
		</div>
       					</div>
       					
		            	<textarea id="talk" name="talk" style="height:100px;" placeholder="남기고 싶은 말을 남기세요."></textarea>
		                <div class="btn_pop_box">
		                    <button id="btnProp" class="btn_apply" data-action="talkSave" onclick="return false;">내용 남기기</button>
		                </div>
		            </div>
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
										<%-- 	<% for(Project p : list){ %> --%>
											<div class="card cf ">
												<div class="pro_info">
													<h4>
														<a href="javascript:void(0);" data-action="projectDetail"
															data-id="804">플랜정보기술<%--p.기업이름 --%></a>
													</h4>
													<h3 class="ellipsis">
														<a href="javascript:void(0);" data-action="projectDetail"
															data-id="804">DB 모니터링 툴 개발<%--p.프로젝트 명 --%></a>
													</h3>
													<ul class="pro_list surport cf">
														<li><%--p.프로젝트 시작일 --%>2020.08.10 ~ 2020.10.10<%--p.프로젝트 종료일 --%><span class="add_info org"><%--p.프로젝트 종료일 - p.프로젝트 시작일=(월) --%>3개월</span>
														</li>
														<li>서울 송파구<%--p.프로젝트 위치 --%></li>
														<li>1만원(협의가능)<%--p.단가 --%></li>
														<li class="ellipsis">MongoDB,Python,Oracle,Linux><%--p.스킬1 --%><%--if p.스킬2,3이 있다면 출력 --%>)</li>
													</ul>
													<!-- <ul class="btn_icon absolute">
														<li class="share"><a href="javascript:void(0);"
															data-action="shareClick" data-value="804" title="친구공유">친구공유</a></li>
													</ul> -->
												</div>
											</div>
											<%-- <%} %> --%>
											
											<!-- 중복되는 것 삭제 예정 -->
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
										<!-- 계약 요청 출력 -->
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