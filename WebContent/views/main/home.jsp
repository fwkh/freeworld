<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html>
<html lang="ko">

<!-- Mirrored from www.freemon.co.kr/home by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 27 Jul 2020 06:58:58 GMT -->
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->
<head>
	<%@ include file="../common/header.jsp" %>
	
    <!-- 네비게이션바 -->
	<style type="text/css">	  
	  #f_management{display:none;}
	  #p_management{display:none;}
	  #profile{display:none;}
	  #suggestion{display:none;}
	  #logout{display:none;}
	</style>
</head>
<body>

	
	<div id="wrap" >
		<div id="modal-wrap" class="modal-wrap"></div>


	<!-- 풀페이지 -->
	<div id="m-container" class="main-wrap">
		<div class="section-wrap">
			<!-- section1 -->
			<div id="section01" class="section">
			  <div class="visual-slide">
			  
				<div class="slide slide02" data-title="#해시태그">
			      <div class="bg"></div>
			      <div class="intro box cf">
			        <div class="txt-wrap">
			        	<h2>#해시태그로</h2>
			          	<h3>나의 장점을 어필해보세요<i>!</i></h3>
			        </div>
			      </div>
			    </div>
			  	<div class="slide slide00" data-title="사라졌다">
			      <div class="bg"></div>
			      <div class="intro box">
			        <div class="txt-wrap">
			          <h2>프리월드을 만나고</h2>
			          <h3>다음 프로젝트 걱정이 사라졌다<i>!</i></h3>
			          <div class="btn-wrap">
				            <div class="inner">
				            	<a href="../../views/customer/introduction.html" target="_blank">서비스 소개</a>
				            </div>
				    	</div>
			        </div>
			      </div>
			    </div>
			    <div class="slide slide01" data-title="개인서비스">
			      <div class="bg"></div>
			      <div class="intro box">
			        <div class="txt-wrap">
			          <h2>카카오톡으로<br/>프로젝트 추천부터 일정까지</h2>
			          <h3>간편하게 관리받으세요<i>!</i></h3>
			        </div>
			      </div>
			    </div>
			    <div class="slide slide02" data-title="기업서비스">
			      <div class="bg"></div>
			      <div class="intro box">
			        <div class="txt-wrap">
			          <h2>투입 가능 인력의 스케줄을</h2>
			          <h3>한눈에 확인하세요<i>!</i></h3>
			        </div>
			      </div>
			    </div>
			    <div class="slide slide06" data-title="프로필">
			      <div class="bg"></div>
			      <div class="intro box">
			        <div class="txt-wrap">
			          <h2>프로필 + 그래프</h2>
			          <h3>프리몬 프로필로 매력 UP<i>!</i></h3>
			          <div class="btn-wrap">
				            <div class="inner">
				            	<a href="login/freemonLoginbce7.html">프로필 관리</a>
				            </div>
				    	</div>
			        </div>
			      </div>
			    </div>
			    <div class="slide slide05" data-title="이력서 파일등록">
			      <div class="bg"></div>
			      <div class="intro box cf">
			        <div class="txt-wrap">
			        	<h2>내 이력서 업로드하면,</h2>
			          	<h3>프로필은 자동 완성<i>!</i></h3>
						<div class="btn-wrap">
				            <div class="inner">
				            	<a href="../www.freemon.co.kr/login/freemonLoginbce7.html">이력서 파일등록</a>
				            </div>
				    	</div>
			        </div>
			      </div>
			    </div>
			    
			  </div>
			</div>
			<!--// section1 -->
		
			<!-- m_counter_box -->
			<div class="m_counter_box">
				<div class="box cf">
					<div class="col-6 center">
						<a href="../../views/project/projectSearch.jsp">
                            <h3>곧 시작될 프로젝트</h3>
                            <p><span class="count" data-count="129">1</span><span class="after">건</span></p>
                        </a>
					</div>
					<div class="col-6 center">
						<a href="../../views/freelancer/freelancerSearch.jsp">
                            <h3>즉시 투입 프리랜서</h3>
                            <p><span class="count" data-count="4,105">1</span><span class="after">명</span></p>
                        </a>
					</div>
				</div>
			</div>
			<!--// m_counter_box -->
			
			<!-- m_counter2_box -->
			<div class="m_counter2_box">
				<div class="box cf">
					<div class="col-6 center">
						<p>지난 일주일 간 <span class="count" data-count="21">1</span>명의 프리랜서가 프로젝트에 지원했습니다.</p>
					</div>
					<div class="col-6 center">
						<p>지난 일주일 간 <span class="count" data-count="82">1</span>명의 프리랜서가 기업으로부터 제안을 받았습니다.</p>
					</div>
				</div>
			</div>
			<!--// m_counter2_box -->
			
			<!-- m_list_box -->
			<div class="box cf mt-30 mb-20">
				<div class="m_project col-6 pr-15 cf">
					<h2 class="m_tit">
                                          이달의 프로젝트
                        
                        <a href="../../views/project/projectSearch.jsp" class="m_more">전체보기</a>
                        
					</h2>
					<div id="projectSearchList" class="cf">
						<div class="m_project_card cf">
							<h4 data-value="894"><a href="#none" data-action="projectDetail">(주)블록체인기술연구소</a></h4>
							<h3 class="flex" data-value="894">
								<a href="#none" data-action="projectDetail" class="ellipsis">반응형 웹기반 크라우드 펀딩서비스 웹사이트 개발</a>
								<span class="add_info org">NEW</span>
							</h3>
							<ul class="pro_list cf">
								<li>2020.08.31 ~ 2020.11.30<span class="add_info">3개월</span></li>
								<li>서울 강남구</li>
								<!--li>3600만원<span class="add_info">협의가능</span></li-->
								<li class="ellipsis">React.js, Java, PHP, NodeJS, HTML5</li>
							</ul>
						</div>
						<div class="m_project_card cf">
							<h4 data-value="893"><a href="#none" data-action="projectDetail">국민카드</a></h4>
							<h3 class="flex" data-value="893">
								<a href="#none" data-action="projectDetail" class="ellipsis">국민카드 발송엔진 </a>
								<span class="add_info org">NEW</span>
							</h3>
							<ul class="pro_list cf">
								<li>2020.08.19 ~ 2020.11.30<span class="add_info">4개월</span></li>
								<li>서울 종로구</li>
								<!--li>520만원<span class="add_info">협의가능</span></li-->
								<li class="ellipsis">Java, JSP</li>
							</ul>
						</div>
						<div class="m_project_card cf">
							<h4 data-value="892"><a href="#none" data-action="projectDetail">모집중</a></h4>
							<h3 class="flex" data-value="892">
								<a href="#none" data-action="projectDetail" class="ellipsis">ORP연구소 채용대행시스템 </a>
								<span class="add_info org">NEW</span>
							</h3>
							<ul class="pro_list cf">
								<li>2020.08.07 ~ 2020.11.30<span class="add_info">4개월</span></li>
								<li> 서울</li>
								<!--li>1만원<span class="add_info">협의가능</span></li-->
								<li class="ellipsis">Java, Jquery</li>
							</ul>
						</div>
						<div class="m_project_card cf">
							<h4 data-value="891"><a href="#none" data-action="projectDetail">모집중</a></h4>
							<h3 class="flex" data-value="891">
								<a href="#none" data-action="projectDetail" class="ellipsis">SK매직 차세대시스템(방문판매) 구축</a>
								<span class="add_info org">NEW</span>
							</h3>
							<ul class="pro_list cf">
								<li>2020.08.07 ~ 2021.06.30<span class="add_info">11개월</span></li>
								<li> 서울</li>
								<!--li>1만원<span class="add_info">협의가능</span></li-->
								<li class="ellipsis">Java</li>
							</ul>
						</div>
					</div>
	         		<div class="w_line"></div>
				</div>
				<div class="m_free col-6 pl-15">
					<h2 class="m_tit">
                                        프리랜서 정보
                        
                        <a href="../../views/freelancer/freelancerSearch.jsp" class="m_more">전체보기</a>
                        
					</h2>
					<div id="talentSearchList" class="relative">
						<div class="top_month col-6">
							<ul class="cf">
								<li class="col-4 ">07월</li>
								<li class="col-4 ">08월</li>
								<li class="col-4 ">09월</li>
							</ul>
						</div>
						<div class="card cf">
							<div class="free_info add_sche cf">
								<div class="profile" style="cursor:pointer;background-image:url(http://th-p.talk.kakao.co.kr/th/talkp/wlBaG95K4G/8Ttz5G4v91tdCDYBGwYNFK/hpj5e3_110x110_c.jpg)" data-action="talentDetail" data-value="1443141222">
									프로필사진
								</div>
								<div class="pro_con" data-action="talentDetail" data-value="1443141222">
									<h3>
										<a href="#none" data-action="talentDetail" data-value="1443141222">김**</a>
										<!--span class="period ">5일후</span-->
										<ul class="f_nature cf">
										<li>36세</li>
										<li class="ellipsis">**</li>
									</ul>
									</h3>
									<ul class="free_list cf">
										<li class="col-12">총 11년 1개월</li>
										<li class="col-12 ellipsis">
											모바일UI, CSS, CSS3, HTML코딩, UI·UX
										</li>
									</ul>
									<!-- 해시태그, 투입가능일 -->
									<div class="add_con cf">
										<div class="hash col-12 ellipsis"> 
											<ul class="cf"> 
											  <li>#web</li><li>#design</li><li>#mobile</li><li>#design</li><li>#css</li><li>#html</li>
											</ul>
										</div>
									</div>
								</div>
							</div>
							<div class="schedule col-6">
								<ul class="bg cf">
									<li class="col-4"></li>
									<li class="col-4"></li>
									<li class="col-4"></li>
								</ul>
								<!-- 이전 프로젝트 -->
								<div class="project2" style="left:0%;width:65.93406593406593%;">
									<a href="#none" style="cursor:default" title="프리랜서<br></a>11/01 ~ 08/30">
									<h4 class="ellipsis">프리랜서</h4>
									<p class="ellipsis">11/01 ~ 08/30</p>
									<div class="day_end">08/30</div>
									</a>
								</div>
								<div class="project4" style="left:66%;width:1%;">
									<a href="#none" style="cursor:default" title="비공개 프로젝트 진행중<br></a>2020.08.14부터 투입가능">
									<h4 class="ellipsis">비공개 프로젝트 진행중</h4>
									<p class="ellipsis">2020.08.14부터 투입가능</p>
									<div class="day_end"></div>
									</a>
								</div>
								<!-- 투입가능일 -->
								<div class="line_able" style="left:42%;">
									<div class="day_able">08/09</div>
								</div>
								
							</div>
						</div>
						<div class="card cf">
							<div class="free_info add_sche cf">
								<div class="profile" style="cursor:pointer;background-image:url(http://th-p.talk.kakao.co.kr/th/talkp/wkHGEyxyHZ/gK6O7M16x8k9z4jMnNeFK1/73a8bi_110x110_c.jpg)" data-action="talentDetail" data-value="1440748279">
									프로필사진
								</div>
								<div class="pro_con" data-action="talentDetail" data-value="1440748279">
									<h3>
										<a href="#none" data-action="talentDetail" data-value="1440748279">도**</a>
										<!--span class="period on">투입가능</span-->
										<ul class="f_nature cf">
										<li>61세</li>
										<li class="ellipsis">**</li>
									</ul>
									</h3>
									<ul class="free_list cf">
										<li class="col-12">총 32년 10개월</li>
										<li class="col-12 ellipsis">
											JSP, Jquery, JavaScript
										</li>
									</ul>
									<!-- 해시태그, 투입가능일 -->
									<div class="add_con cf">
										<div class="hash col-12 ellipsis"> 
											<ul class="cf"> 
											  
											</ul>
										</div>
									</div>
								</div>
							</div>
							<div class="schedule col-6">
								<ul class="bg cf">
									<li class="col-4"></li>
									<li class="col-4"></li>
									<li class="col-4"></li>
								</ul>
								<!-- 이전 프로젝트 -->
								<div class="project4" style="left:0%;width:36.26373626373626%;">
									<a href="#none" style="cursor:default" title="비공개 프로젝트 진행중<br></a>2020.08.03부터 투입가능">
									<h4 class="ellipsis">비공개 프로젝트 진행중</h4>
									<p class="ellipsis">2020.08.03부터 투입가능</p>
									<div class="day_end"></div>
									</a>
								</div>
								<!-- 투입가능일 -->
								<div class="line_able" style="left:42%;">
									<div class="day_able">08/09</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--// m_list_box -->
	
			<!-- 우수특허대상 -->
			<div class="box mb-10" id="excellent_patent_award" style="display:none">
				<a href="https://blog.naver.com/freemon1/221735014338" target="_blank"><img src="resources/images/new/img_award.jpg" alt="제13회 2019 대한민국 우수특허대상 수상"/></a>
			</div>
			<!-- /우수특허대상 -->
			<!-- footer -->
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
	
			<div class="ad" style="display:none;">
				
			</div>
			
			
		</div>
	<!--//Contents-->

	<script id="projectSearchListTemplate" type="text/x-mustache">
{{#projectList}}
    <!-- m_project_card -->
    <div class="m_project_card cf">
        <h4 data-value="{{projIdx}}"><a href="#none" data-action="projectDetail">{{customer}}</a></h4>
        <h3 class="flex" data-value="{{projIdx}}">
            <a href="#none" data-action="projectDetail" class="ellipsis">{{projNm}}</a>
            {{#newImage}}<span class="add_info org">NEW</span>{{/newImage}}
        </h3>
        <ul class="pro_list cf">
            <li>{{projStrtDtPoint}} ~ {{projCloseDtPoint}}<span class="add_info">{{projTerm}}개월</span></li>
            <li>{{projUpperAddr}} {{projAddr}}</li>
            <!--li>{{unitPrice}}만원{{#negoYn}}<span class="add_info">협의가능</span>{{/negoYn}}</li-->
            <li class="ellipsis">{{recruitSkillNm}}</li>
        </ul>
    </div>
    <!-- //m_project_card -->
{{/projectList}}
	</script>
	
	<script id="talentSearchListTemplate" type="text/x-mustache">
{{#obj}}
    <!-- 월표시 -->
    <div class="top_month col-6">
        <ul class="cf">
			{{#monthArr}}
        	<li class="col-4 {{#now}}today{{/now}}">{{month}}월</li>
			{{/monthArr}}
        </ul>
    </div>
    <!-- //월표시 -->
	{{#talentList}}
    <!-- card -->
    <div class="card cf">
        <div class="free_info add_sche cf">
            <div class="profile" style="cursor:pointer;background-image:url({{profileUrl}})"
                {{#authentication}}{{/authentication}}
                {{^authentication}}data-action="talentDetail"{{/authentication}} data-value="{{userId}}">
				프로필사진
            </div>
            <div class="pro_con" {{#authentication}}{{/authentication}}{{^authentication}}data-action="talentDetail"{{/authentication}} data-value="{{userId}}">
                <h3>
                    <a href="#none" {{#authentication}}{{/authentication}}{{^authentication}}data-action="talentDetail"{{/authentication}} data-value="{{userId}}">{{userNm}}</a>
                    <!--span class="period {{leaveStrtTermCss}}">{{leaveStrtTermTxt}}</span-->
                    <ul class="f_nature cf">
                    <li>{{#isGenderNm}}{{genderNm}}{{#age}},{{/age}} {{/isGenderNm}}{{#age}}{{age}}세{{/age}}</li>
                    <li class="ellipsis">{{hopeAreaNm}}</li>
                </ul>
                </h3>
                <ul class="free_list cf">
                    <li class="col-12">총 {{totalWorkCareer}}</li>
                    <li class="col-12 ellipsis">
                        {{usableSkillNm}}
                    </li>
                </ul>
                <!-- 해시태그, 투입가능일 -->
                <div class="add_con cf">
                    <div class="hash col-12 ellipsis"> 
                        <ul class="cf"> 
                          {{#keyword}}{{#hashTagList}}<li>{{.}}</li>{{/hashTagList}}{{/keyword}}
                        </ul>
                    </div>
                </div>
            </div>
		</div>
        <div class="schedule col-6">
            <ul class="bg cf">
				{{#monthArr}}
            	<li class="col-4"></li>
				{{/monthArr}}
            </ul>
            <!-- 이전 프로젝트 -->
			{{#cntrctList}}
			{{#isDisplay}}
            <div class="{{cssNm}}" style="left:{{leftwidth}}%;width:{{rightwidth}}%;">
                <a href="#none" style="cursor:default" title="{{{projNm}}}<br/>{{projPeriod}}">
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
    </div>
    <!-- //card -->
	{{/talentList}}
{{/obj}}
	</script>
	
	<script id="popupTemplate" type="text/x-mustache">
		<div class="ad_in">
			<img src="{{popImg}}" usemap="#map_result" border="0" />
			<map name="map_result" id="map_result">
				<area shape="rect" coords="673,20,743,52" href="#none" data-action="popupClose" onfocus="this.blur()" alt="닫기" />
				<area shape="rect" coords="576,20,674,52" href="#none" data-action="popupCookieClose" onfocus="this.blur()" alt="하루안보기" />
				<area shape="rect" coords="293,317,548,368" href="{{linkUrl}}" onfocus="this.blur()" alt="당첨결과 보러가기" />
			</map>
		</div>
</script>
	<%@ include file="../common/footer.jsp" %>

</body>

<!-- Mirrored from www.freemon.co.kr/home by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 27 Jul 2020 06:59:11 GMT -->
</html>