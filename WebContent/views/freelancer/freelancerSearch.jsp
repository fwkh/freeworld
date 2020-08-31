<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<head>
	<style type="text/css">	  
	  #f_management{display:none;}
	  #p_management{display:none;}
	  #profile{display:none;}
	  #suggestion{display:none;}
	  #logout{display:none;}
	</style>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<script type="text/javascript" src="../../resources/js/f_Search.js" charset="UTF-8"></script>

		
<!-- Bootstrap css -->
<style type="text/css">
#slider-range .slider-selection {
	background: #cf3128;
}
#slider-range .slider-handle {
	background: #fff;
	border:1px solid #ccc;
	box-shadow:2px 2px 5px 0 rgba(0,0,0,0.2);
}
.slider > div.tooltip-min {
	display:none;
}
.slider > div.tooltip-max {
	display:none;
}
</style>
<link rel="stylesheet" type="text/css" href="../resources/css/bootstrap-slider.css">
<script type="text/javascript" src="../resources/js/bootstrap-slider.min.js"></script>
<script type="text/javascript" src="../resources/freemon/talent/talentSearch29d4.js?version=1.16"></script>
<script type="text/javascript">
	$(function() {
		freemon.invoker.invoke("talentSearch");
		
		$(".closeTemp").click(function(){
			$("#relationInTalentList").hide();
		});
	});
</script>

<!--Contents-->
<div class="range_bg" style="display:none; position:fixed;top:0;left:0;width:100%;height:100%;background:rgba(255,255,255,0);overflow-y:auto;z-index:10000;"></div>
<div id="container">
    <section class="project_in">
    	<!-- 제목부분 -->
    	<div class="pro_tit mb-0">
        	<h2>프리랜서 검색 <span class="totalCnt">3,245</span></h2>
			<script type="text/javascript" src="../resources/freemon/common/freemonSearch9667.js?version=1.2"></script>
			<script type="text/javascript">
			$(function() {
				freemon.invoker.invoke("freemonSearch");
				$('.dateRangePicker').datepicker({
					 format: "yyyy-mm-dd",
					 language: "kr",
				});
			});
			</script>
			<div class="search cf">
			    <div class="input_box col-4 cf">
			        <a href="#none" id="freemonSearchDateBtn" class="btn_sche col-3">달력</a>
			        <input type="text" class="dateRangePicker col-9 pl-0" id ="searchStrDate" name ="searchStrDate" placeholder="투입가능일" readonly="readonly" />
			    </div>
			    <div class="input_box col-7">
			        <input type="text" name="keyword" id ="keyword" placeholder="예) 서울 java 홍길동" />
			    </div>
			    <a href="#none" class="btn_search col-1" id="freemonSearchBtn">검색</a>
			</div>
        </div>
        
        <!-- 선택부분 -->
		<div class="select">
            <div class="select_in">
                <div class="sel_option">
                    <a href="#none" id="area">지역선택</a>
                    <!-- 옵션 -->
                    <div class="option depth1 single" id="workAreaList" style="display: none;">
                        <div class="select_box cf">
                            <ul class="cf" id="memberSearchAreaList">
								<li class="areaSelect" id="area0" data-value="서울 전체" style="cursor:pointer;">서울 전체</li>
								<li class="areaSelect" id="area1" data-value="중구" style="cursor:pointer;">중구</li>
								<li class="areaSelect" id="area2" data-value="종로구" style="cursor:pointer;">종로구</li>
								<li class="areaSelect" id="area3" data-value="용산구" style="cursor:pointer;">용산구</li>
								<li class="areaSelect" id="area4" data-value="성동구" style="cursor:pointer;">성동구</li>
								<li class="areaSelect" id="area5" data-value="광진구" style="cursor:pointer;">광진구</li>
								<li class="areaSelect" id="area6" data-value="동대문구" style="cursor:pointer;">동대문구</li>
								<li class="areaSelect" id="area7" data-value="중랑구" style="cursor:pointer;">중랑구</li>
								<li class="areaSelect" id="area8" data-value="성북구" style="cursor:pointer;">성북구</li>
								<li class="areaSelect" id="area9" data-value="강북구" style="cursor:pointer;">강북구</li>
								<li class="areaSelect" id="area10" data-value="도봉구" style="cursor:pointer;">도봉구</li>
								<li class="areaSelect" id="area11" data-value="노원구" style="cursor:pointer;">노원구</li>
								<li class="areaSelect" id="area12" data-value="은평구" style="cursor:pointer;">은평구</li>
								<li class="areaSelect" id="area13" data-value="서대문구" style="cursor:pointer;">서대문구</li>
								<li class="areaSelect" id="area14" data-value="양천구" style="cursor:pointer;">양천구</li>
								<li class="areaSelect" id="area15" data-value="강서구" style="cursor:pointer;">강서구</li>
								<li class="areaSelect" id="area16" data-value="구로구" style="cursor:pointer;">구로구</li>
								<li class="areaSelect" id="area17" data-value="금천구" style="cursor:pointer;">금천구</li>
								<li class="areaSelect" id="area18" data-value="제주" style="cursor:pointer;">영등포구</li>
								<li class="areaSelect" id="area19" data-value="영등포구" style="cursor:pointer;">동작구</li>
								<li class="areaSelect" id="area20" data-value="관악구" style="cursor:pointer;">관악구</li>
								<li class="areaSelect" id="area21" data-value="서초구" style="cursor:pointer;">서초구</li>
								<li class="areaSelect" id="area22" data-value="강남구" style="cursor:pointer;">강남구</li>
								<li class="areaSelect" id="area23" data-value="송파구" style="cursor:pointer;">송파구</li>
								<li class="areaSelect" id="area24" data-value="강동구" style="cursor:pointer;">강동구</li>
								<li class="areaSelect" id="area25" data-value="마포구" style="cursor:pointer;">마포구</li>
							</ul>
                        </div>
                    </div>
                    <!-- /옵션 -->
                </div>
                <div class="sel_option">
	                <a href="#none" id="skill">전문기술</a>
	                <!-- 옵션 -->
                    <div class="option depth1 single" id="skillList" style="display: none;">
                        <div class="select_box cf">
                            <ul class="cf" id="memberSearchJobList">
								<li class="jobSelect" data-value="1" style="cursor:pointer;">JSP</li>
								<li class="jobSelect" data-value="2" style="cursor:pointer;">PHP</li>
								<li class="jobSelect" data-value="3" style="cursor:pointer;">ASP.NET</li>
								<li class="jobSelect" data-value="4" style="cursor:pointer;">ASP</li>
								<li class="jobSelect" data-value="5" style="cursor:pointer;">JavaScript</li>
								<li class="jobSelect" data-value="6" style="cursor:pointer;">Ajax</li>
								<li class="jobSelect" data-value="7" style="cursor:pointer;">Jquery</li>
								<li class="jobSelect" data-value="8" style="cursor:pointer;">NodeJS</li>
								<li class="jobSelect" data-value="9" style="cursor:pointer;">Vue.js</li>
								<li class="jobSelect" data-value="10" style="cursor:pointer;">React.js</li>
								<li class="jobSelect" data-value="11" style="cursor:pointer;">Ruby</li>
								<li class="jobSelect" data-value="12" style="cursor:pointer;">RubyonRails</li>
								<li class="jobSelect" data-value="13" style="cursor:pointer;">MiPlatform</li>
								<li class="jobSelect" data-value="14" style="cursor:pointer;">Nexacro</li>
								<li class="jobSelect" data-value="15" style="cursor:pointer;">XPLATFORM</li>
								<li class="jobSelect" data-value="16" style="cursor:pointer;">GO</li>
								<li class="jobSelect" data-value="17" style="cursor:pointer;">Oracle</li>
								<li class="jobSelect" data-value="18" style="cursor:pointer;">MS-SQL</li>
								<li class="jobSelect" data-value="19" style="cursor:pointer;">MySQL</li>
								<li class="jobSelect" data-value="20" style="cursor:pointer;">DB2</li>
								<li class="jobSelect" data-value="21" style="cursor:pointer;">Pro-C</li>
								<li class="jobSelect" data-value="22" style="cursor:pointer;">Python</li>
								<li class="jobSelect" data-value="23" style="cursor:pointer;">VB</li>
								<li class="jobSelect" data-value="24" style="cursor:pointer;">VB.NET</li>
								<li class="jobSelect" data-value="25" style="cursor:pointer;">POS</li>
								<li class="jobSelect" data-value="26" style="cursor:pointer;">ABAP</li>
								<li class="jobSelect" data-value="27" style="cursor:pointer;">EJB</li>
								<li class="jobSelect" data-value="28" style="cursor:pointer;">JAVA</li>
								<li class="jobSelect" data-value="29" style="cursor:pointer;">C#</li>
								<li class="jobSelect" data-value="30" style="cursor:pointer;">SAP</li>
								<li class="jobSelect" data-value="31" style="cursor:pointer;">C++</li>
								<li class="jobSelect" data-value="32" style="cursor:pointer;">Kotlin</li>
								<li class="jobSelect" data-value="33" style="cursor:pointer;">F#</li>
								<li class="jobSelect" data-value="34" style="cursor:pointer;">C</li>
								<li class="jobSelect" data-value="35" style="cursor:pointer;">PowerBuilder</li>
								<li class="jobSelect" data-value="36" style="cursor:pointer;">MFC</li>
								<li class="jobSelect" data-value="37" style="cursor:pointer;">어셈블리</li>
								<li class="jobSelect" data-value="38" style="cursor:pointer;">임베디드</li>
								<li class="jobSelect" data-value="39" style="cursor:pointer;">펌웨어</li>
								<li class="jobSelect" data-value="40" style="cursor:pointer;">HMI</li>
								<li class="jobSelect" data-value="41" style="cursor:pointer;">MMI</li>
								<li class="jobSelect" data-value="42" style="cursor:pointer;">PLC</li>
								<li class="jobSelect" data-value="43" style="cursor:pointer;">Android</li>
								<li class="jobSelect" data-value="44" style="cursor:pointer;">Objective-C</li>
								<li class="jobSelect" data-value="45" style="cursor:pointer;">Swift</li>
							</ul>
                        </div>
                    </div>
                    <!-- /옵션 -->
	            </div>

	            <div class="sel_option">
                    <a href="#none" id="careerDate">경력</a>
                    <!-- 옵션 -->
                    <div class="option depth1 single" id="careerList" style="display: none;">
                        <div class="select_box cf">
                            <ul class="cf">
                                <li class="setRangeValue" data-action="setRangeValue" data-value="1" id="career1" data-html="5년이하">5년이하</li>
				                <li class="setRangeValue" data-action="setRangeValue" data-value="2" id="career2" data-html="6~10년">6~10년</li>
				                <li class="setRangeValue" data-action="setRangeValue" data-value="3" id="career3" data-html="11~15년">11~15년</li>
				                <li class="setRangeValue" data-action="setRangeValue" data-value="4" id="career4" data-html="16~20년">16~20년</li>
				                <li class="setRangeValue" data-action="setRangeValue" data-value="5" id="career5" data-html="21년이상">21년이상</li>
				                <li class="setRangeValue" data-action="setRangeValue" data-value="0" id="career6" data-html="경력무관">경력무관</li>
                            </ul>
                        </div>
                    </div>
                    <!-- /옵션 -->
                </div>
                <div class="sel_check">
                    <label class="agrChk" for="careerY"><input type="checkbox" id="careerY" name="careerY" data-action="careerTypeClick" data-value="EXP" value="EXP"><i></i>이력서 등록자</label>
                </div>
                <ul class="sel_order" style="display:none;">
                    <li class="active"><a href="">등록순</a></li>
                    <li><a href="">업데이트순</a></li>
                </ul>
            </div>
            <div class="select_in" id="searchWord">
                <a href="" class="reset" id="freemonReload">전체삭제</a>
            </div>
        </div>
        
        <!-- 단가 *지우면 목록이 안나옴 -->
        <div id="" class="range_box" style="display:none; left:2%; margin-top:3%; z-index:10000;">
            <p class="range_arrow"></p>
            <div class="range_header cf">
                <a href="#none" class="reflesh list2" style="z-index:10000;" data-action="sliderReflesh">새로고침</a>
                <span class="range_text range_start">5년이하</span>
                <span class="range_text range_end">21년이상</span>
            </div>
            <div class="rangeControl">
                <input id="slider-range" type="text" class="" data-slider-id="slider-range" value="" data-slider-min="1" data-slider-max="22" data-slider-step="1" data-slider-value="[1,22]"/>
            </div>
        
            <ul class="range_list cf">
                <li><a href="#none" class="setRangeValue" data-action="setRangeValue" data-value="[1,5]">5년이하</a></li>
                <li><a href="#none" class="setRangeValue" data-action="setRangeValue" data-value="[6,10]">6~10년</a></li>
                <li><a href="#none" class="setRangeValue" data-action="setRangeValue" data-value="[11,15]">11~15년</a></li>
                <li><a href="#none" class="setRangeValue" data-action="setRangeValue" data-value="[16,20]">16~20년</a></li>
                <li><a href="#none" class="setRangeValue" data-action="setRangeValue" data-value="[21,22]">21년이상</a></li>
                <li class="active"><a href="#none" class="setRangeValue" data-action="setRangeValue" data-value="[1,22]">경력무관</a></li>
            </ul>
         </div>
         <!-- /단가 *지우면 목록이 안나옴 -->
         
        <!-- 인재목록 -->
        <div class="man_list xs-hidden">
        	<div id="talentSearchList">
				<div class="thead thead1">
					<div class="thead_in">
						<div class="th_month">
							<ul class="month12 cf">
								<li data-action="monthClick" data-date="20191201" style="cursor:pointer;">12월</li>
								<li data-action="monthClick" data-date="20200101" style="cursor:pointer;">01월</li>
								<li data-action="monthClick" data-date="20200201" style="cursor:pointer;">02월</li>
								<li data-action="monthClick" data-date="20200301" style="cursor:pointer;">03월</li>
								<li data-action="monthClick" data-date="20200401" style="cursor:pointer;">04월</li>
								<li data-action="monthClick" data-date="20200501" style="cursor:pointer;">05월</li>
								<li data-action="monthClick" data-date="20200601" style="cursor:pointer;">06월</li>
								<li data-action="monthClick" data-date="20200701" style="cursor:pointer;">07월</li>
								<li data-action="monthClick" data-date="20200801" style="cursor:pointer;">08월</li>
								<li data-action="monthClick" data-date="20200901" style="cursor:pointer;">09월</li>
								<li data-action="monthClick" data-date="20201001" style="cursor:pointer;">10월</li>
								<li data-action="monthClick" data-date="20201101" style="cursor:pointer;">11월</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="thead thead2">
					<div class="thead_in box">
						<div class="th_month">
							<ul class="month12 cf">
								<li data-action="monthClick" data-date="20191201" style="cursor:pointer;">12월</li>
								<li data-action="monthClick" data-date="20200101" style="cursor:pointer;">01월</li>
								<li data-action="monthClick" data-date="20200201" style="cursor:pointer;">02월</li>
								<li data-action="monthClick" data-date="20200301" style="cursor:pointer;">03월</li>
								<li data-action="monthClick" data-date="20200401" style="cursor:pointer;">04월</li>
								<li data-action="monthClick" data-date="20200501" style="cursor:pointer;">05월</li>
								<li data-action="monthClick" data-date="20200601" style="cursor:pointer;">06월</li>
								<li data-action="monthClick" data-date="20200701" style="cursor:pointer;">07월</li>
								<li data-action="monthClick" data-date="20200801" style="cursor:pointer;">08월</li>
								<li data-action="monthClick" data-date="20200901" style="cursor:pointer;">09월</li>
								<li data-action="monthClick" data-date="20201001" style="cursor:pointer;">10월</li>
								<li data-action="monthClick" data-date="20201101" style="cursor:pointer;">11월</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="card cf" style=" cursor: pointer;" onclick="location.href='../member/memberLogin.jsp'">
                    <div class="free_info cf">
                        <div class="profile" style="cursor:pointer; background-image:url(http://th-p.talk.kakao.co.kr/th/talkp/wlBaG95K4G/8Ttz5G4v91tdCDYBGwYNFK/hpj5e3_110x110_c.jpg)" data-action="talentDetail" data-value="1443141222">프로필사진</div>
                        <div class="free_con">
                            <h3 data-action="talentDetail" data-value="1443141222">
                                <a href="../member/memberLogin.jsp" data-action="talentDetail" data-value="1443141222">김**</a>
                                <ul class="f_nature cf">
                                    <li>36세</li>
                                    <li class="ellipsis">**</li>
                                </ul>
                            </h3>
                            <ul class="free_list cf">
                                <li>총 11년 1개월</li>
                                <li class="ellipsis">모바일UI, CSS, CSS3, HTML코딩, UI·UX</li>
                            </ul>
                            <!-- 해시태그, 투입가능일 -->
                            <div class="add_con cf">
                                <div class="hash ellipsis"> 
                                    <ul class="cf"> 
                                        <li>#web</li><li>#design</li><li>#mobile</li><li>#design</li><li>#css</li><li>#html</li>
                                    </ul>
                                </div>
                                <p class="able ">5일후</p>
                            </div>
                            <ul class="btn_icon absolute cf">
                                <li class="like "><a href="#none" data-value="1443141222" data-action="noneAuth" title="관심프리랜서">관심프리랜서</a></li>

                                <li class="pick"><a href="#none" data-value="1443141222" data-nm="김**" data-action="noneAuth" title="전속프리랜서<br></a>전속프리랜서는 프리랜서가 기업에 소속되는 관계로 둘다 동의시 프리랜서검색에 노출되지 않습니다.">전속프리랜서</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="schedule">
						<div class="she12_gray">
                        	<ul class="cf">
                       			<li></li>
                       			<li></li>
                       			<li></li>
                       			<li></li>
                       			<li></li>
                       			<li></li>
                       			<li></li>
                       			<li></li>
                       			<li></li>
                       			<li></li>
                       			<li></li>
                       			<li></li>
							</ul>
						</div>

                        <!-- 이전 프로젝트 -->
							<div class="project2" style="left:0%;width:74.79452054794521%;">
								<a href="#none" data-project-idx="0" data-customer="" data-area="" data-strtdt="2019-11-01" data-closedt="2020-08-30" data-action="noneAuth" title="프리랜서<br></a>11/01 ~ 08/30">
                        		<h4 class="ellipsis">프리랜서</h4>
                            	<p class="ellipsis">11/01 ~ 08/30</p>
								<div class="day_end">08/30</div>
								</a>
                        	</div>
                        <!-- 이전 프로젝트 -->
							<div class="project4" style="left:75%;width:1%;">
								<a href="#none" data-project-idx="-1" data-customer="" data-area="" data-strtdt="" data-closedt="" data-action="noneAuth" title="비공개 프로젝트 진행중<br></a>2020.08.14부터 투입가능">
                        		<h4 class="ellipsis">비공개 프로젝트 진행중</h4>
                            	<p class="ellipsis">2020.08.14부터 투입가능</p>
								<div class="day_end"></div>
								</a>
                        	</div>
                        <!-- 투입가능일 -->
                        <div class="line_able" style="left:69%;">
                        	<div class="day_able">08/09</div>
                        </div>
                    </div>
				</div>
				<div class="card cf" style=" cursor: pointer;" onclick="location.href='../member/memberLogin.jsp'">
                    <div class="free_info cf">
                        <div class="profile" style="cursor:pointer;background-image:url(/resources/images/new/no-pic.png)" data-action="talentDetail" data-value="1413120282">프로필사진</div>
                        <div class="free_con">
                            <h3 data-action="talentDetail" data-value="1413120282">
                                <a href="#none" data-action="talentDetail" data-value="1413120282">김**</a>
                                <ul class="f_nature cf">
                                    <li>34세</li>
                                    <li class="ellipsis">**</li>
                                </ul>
                            </h3>
                            <ul class="free_list cf">
                                <li>총 10년 8개월</li>
                                <li class="ellipsis">모바일UI, UI·UX, 포토샵</li>
                            </ul>
                            <!-- 해시태그, 투입가능일 -->
                            <div class="add_con cf">
                                <div class="hash ellipsis"> 
                                    <ul class="cf"> 
                                        <li>#재택</li><li>#모바일UI</li><li>#모바일UX</li><li>#브로슈어</li><li>#전단지</li><li>#베너</li><li>#이벤트페이지</li><li>#현수막</li>
                                    </ul>
                                </div>
                                <p class="able on">투입가능</p>
                            </div>
                            <ul class="btn_icon absolute cf">
                                <li class="like "><a href="#none" data-value="1413120282" data-action="noneAuth" title="관심프리랜서">관심프리랜서</a></li>

                                <li class="pick"><a href="#none" data-value="1413120282" data-nm="김**" data-action="noneAuth" title="전속프리랜서<br></a>전속프리랜서는 프리랜서가 기업에 소속되는 관계로 둘다 동의시 프리랜서검색에 노출되지 않습니다.">전속프리랜서</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="schedule">
						<div class="she12_gray">
                        	<ul class="cf">
                       			<li></li>
                       			<li></li>
                       			<li></li>
                       			<li></li>
                       			<li></li>
                       			<li></li>
                       			<li></li>
                       			<li></li>
                       			<li></li>
                       			<li></li>
                       			<li></li>
                       			<li></li>
							</ul>
						</div>

                        <!-- 이전 프로젝트 -->
							<div class="project4" style="left:0%;width:67.3972602739726%;">
								<a href="#none" data-project-idx="-1" data-customer="" data-area="" data-strtdt="" data-closedt="" data-action="noneAuth" title="비공개 프로젝트 진행중<br></a>2020.08.03부터 투입가능">
                        		<h4 class="ellipsis">비공개 프로젝트 진행중</h4>
                            	<p class="ellipsis">2020.08.03부터 투입가능</p>
								<div class="day_end"></div>
								</a>
                        	</div>
                        <!-- 투입가능일 -->
                        <div class="line_able" style="left:69%;">
                        	<div class="day_able">08/09</div>
                        </div>
                    </div>
				</div>
				<div class="card cf" style=" cursor: pointer;" onclick="location.href='../member/memberLogin.jsp'">
                    <div class="free_info cf">
                        <div class="profile" style="cursor:pointer;background-image:url(http://th-p.talk.kakao.co.kr/th/talkp/wkTe9ganri/RLUKJr1XNRu8EycEPMFdFK/ov0djy_110x110_c.jpg)" data-action="talentDetail" data-value="1407998569">프로필사진</div>
                        <div class="free_con">
                            <h3 data-action="talentDetail" data-value="1407998569">
                                <a href="#none" data-action="talentDetail" data-value="1407998569">엄**</a>
                                <ul class="f_nature cf">
                                    <li>48세</li>
                                    <li class="ellipsis">**</li>
                                </ul>
                            </h3>
                            <ul class="free_list cf">
                                <li>총 20년 5개월</li>
                                <li class="ellipsis">Nexacro platform, Vue.js, JSP, Oracle</li>
                            </ul>
                            <!-- 해시태그, 투입가능일 -->
                            <div class="add_con cf">
                                <div class="hash ellipsis"> 
                                    <ul class="cf"> 
                                        <li>#PL/분석/설계/개발</li><li>#해외출장경험자</li><li>#지방출장경험자</li>
                                    </ul>
                                </div>
                                <p class="able ">1일후</p>
                            </div>
                            <ul class="btn_icon absolute cf">
                                <li class="like "><a href="#none" data-value="1407998569" data-action="noneAuth" title="관심프리랜서">관심프리랜서</a></li>

                                <li class="pick"><a href="#none" data-value="1407998569" data-nm="엄**" data-action="noneAuth" title="전속프리랜서<br></a>전속프리랜서는 프리랜서가 기업에 소속되는 관계로 둘다 동의시 프리랜서검색에 노출되지 않습니다.">전속프리랜서</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="schedule">
						<div class="she12_gray">
                        	<ul class="cf">
                       			<li></li>
                       			<li></li>
                       			<li></li>
                       			<li></li>
                       			<li></li>
                       			<li></li>
                       			<li></li>
                       			<li></li>
                       			<li></li>
                       			<li></li>
                       			<li></li>
                       			<li></li>
							</ul>
						</div>

                        <!-- 이전 프로젝트 -->
							<div class="project3" style="left:8%;width:32.87671232876712%;">
								<a href="#none" data-project-idx="0" data-customer="" data-area="" data-strtdt="2020-01-01" data-closedt="2020-04-30" data-action="noneAuth" title="성남종합운동장 스포츠센터 고도화<br></a>01/01 ~ 04/30">
                        		<h4 class="ellipsis">성남종합운동장 스포츠센터 고도화</h4>
                            	<p class="ellipsis">01/01 ~ 04/30</p>
								<div class="day_end">04/30</div>
								</a>
                        	</div>
                        <!-- 이전 프로젝트 -->
							<div class="project3" style="left:42%;width:24.65753424657534%;">
								<a href="#none" data-project-idx="0" data-customer="" data-area="" data-strtdt="2020-05-01" data-closedt="2020-07-30" data-action="noneAuth" title="데이터 포털 고도화<br></a>05/01 ~ 07/30">
                        		<h4 class="ellipsis">데이터 포털 고도화</h4>
                            	<p class="ellipsis">05/01 ~ 07/30</p>
								<div class="day_end">07/30</div>
								</a>
                        	</div>
                        <!-- 이전 프로젝트 -->
							<div class="project4" style="left:66%;width:3.0136986301369864%;">
								<a href="#none" data-project-idx="-1" data-customer="" data-area="" data-strtdt="" data-closedt="" data-action="noneAuth" title="비공개 프로젝트 진행중<br></a>2020.08.10부터 투입가능">
                        		<h4 class="ellipsis">비공개 프로젝트 진행중</h4>
                            	<p class="ellipsis">2020.08.10부터 투입가능</p>
								<div class="day_end"></div>
								</a>
                        	</div>
                        <!-- 투입가능일 -->
                        <div class="line_able" style="left:69%;">
                        	<div class="day_able">08/09</div>
                        </div>
                    </div>
				</div>
				<div class="card cf" style=" cursor: pointer;" onclick="location.href='../member/memberLogin.jsp'">
                    <div class="free_info cf">
                        <div class="profile" style="cursor:pointer;background-image:url(http://th-p.talk.kakao.co.kr/th/talkp/wlB2QYnj7f/NSmL6HT1YjotCdheKAWgBk/ouzjh9_110x110_c.jpg)" data-action="talentDetail" data-value="1388066362">프로필사진</div>
                        <div class="free_con">
                            <h3 data-action="talentDetail" data-value="1388066362">
                                <a href="#none" data-action="talentDetail" data-value="1388066362">박**</a>
                                <ul class="f_nature cf">
                                    <li>32세</li>
                                    <li class="ellipsis">**</li>
                                </ul>
                            </h3>
                            <ul class="free_list cf">
                                <li>총  2개월</li>
                                <li class="ellipsis">시스템엔지니어</li>
                            </ul>
                            <!-- 해시태그, 투입가능일 -->
                            <div class="add_con cf">
                                <div class="hash ellipsis"> 
                                    <ul class="cf"> 
                                        <li>#Nachi</li><li>#Kawasaki</li><li>#산업용로봇</li><li>#엔지니어</li>
                                    </ul>
                                </div>
                                <p class="able ">2일후</p>
                            </div>
                            <ul class="btn_icon absolute cf">
                                <li class="like "><a href="#none" data-value="1388066362" data-action="noneAuth" title="관심프리랜서">관심프리랜서</a></li>

                                <li class="pick"><a href="#none" data-value="1388066362" data-nm="박**" data-action="noneAuth" title="전속프리랜서<br></a>전속프리랜서는 프리랜서가 기업에 소속되는 관계로 둘다 동의시 프리랜서검색에 노출되지 않습니다.">전속프리랜서</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="schedule">
						<div class="she12_gray">
                        	<ul class="cf">
                       			<li></li>
                       			<li></li>
                       			<li></li>
                       			<li></li>
                       			<li></li>
                       			<li></li>
                       			<li></li>
                       			<li></li>
                       			<li></li>
                       			<li></li>
                       			<li></li>
                       			<li></li>
							</ul>
						</div>

                        <!-- 이전 프로젝트 -->
							<div class="project2" style="left:50%;width:20%;">
								<a href="#none" data-project-idx="0" data-customer="" data-area="" data-strtdt="2020-05-30" data-closedt="2020-08-11" data-action="noneAuth" title="삼성<br></a>05/30 ~ 08/11">
                        		<h4 class="ellipsis">삼성</h4>
                            	<p class="ellipsis">05/30 ~ 08/11</p>
								<div class="day_end">08/11</div>
								</a>
                        	</div>
                        <!-- 투입가능일 -->
                        <div class="line_able" style="left:69%;">
                        	<div class="day_able">08/09</div>
                        </div>
                    </div>
                </div>
			</div>
        </div>
        
        <div class="man_list hidden xs-visible">
			 <div class="m_thead" id="talentSearchCardListMonth"><!-- 달표시 --></div>
	        <ul class="card_list cf" id="talentSearchCardList">
	        </ul>
        </div>
        
       	<!-- 더보기 -->
        <div class="more_box" style="display:none;">
           	<a href="#none" class="btn_more center" data-action="moreViewClick"><span class="t_more">더보기</span></a>
        </div>
		
		<!-- 팝업 인맥트리 테스트 -->
		<div class="pop_bg" id="relationInTalentList" style="display:none;">
			<div class="pop">
		    	<div class="pop_header">
		        	<h3>인맥트리</h3>
		            <a href="#none" class="close closeTemp">닫기</a>
		        </div>
		        <div class="pop_body" style="padding:20px;height:600px;">
		        	<div class="verticalTree" style="overflow-y:visible;"></div>
		        </div>
			</div>
		</div>
    </section>
</div>
<!--//Contents-->

<script id="talentSearchListTemplate" type="text/x-mustache">
{{#obj}}
	{{#isSearch}}
	<div class="thead thead1">
        <div class="thead_in">
            <div class="th_month">
                <ul class="month{{month}} cf">
                    {{#monthArr}}
                    <li data-action="monthClick" {{#now}}class="today" {{/now}} data-date="{{day}}" style="cursor:pointer;">{{month}}월</li>
                    {{/monthArr}}
                </ul>
			</div>
		</div>
	</div>
	<div class="thead thead2">
        <div class="thead_in box">
            <div class="th_month">
				<ul class="month{{month}} cf">
                    {{#monthArr}}
                    <li data-action="monthClick" {{#now}}class="today" {{/now}} data-date="{{day}}" style="cursor:pointer;">{{month}}월</li>
                    {{/monthArr}}
                </ul>
			</div>
		</div>
	</div>
	{{/isSearch}}
	{{#talentList}}
        	<!-- 목록형 3개월 -->
                <div class="card cf">
                    <div class="free_info cf">
                        <div class="profile" style="cursor:pointer;background-image:url({{profileUrl}})" data-action="talentDetail" data-value="{{userId}}">프로필사진</div>
                        <div class="free_con">
                            <!--div class="report2 list2">
                                <ul class="alarm cf">
                                    <li class="alarm2 {{leaveStrtTermCss}}">{{leaveStrtTermTxt}}</li>
                                </ul>
                            </div-->
                            <h3 data-action="talentDetail" data-value="{{userId}}">
                                <a href="#none" data-action="talentDetail" data-value="{{userId}}">{{userNm}}</a>
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
                            <ul class="btn_icon absolute cf">
                                <li class="like {{#isInterest}}active{{/isInterest}}"><a href="#none" data-value="{{userId}}"
                                {{#login}}data-action="talentInterest"{{/login}}
                                {{^login}}data-action="noneAuth"{{/login}}
                                title="관심프리랜서">관심프리랜서</a></li>

                                <li class="pick"><a href="#none" data-value="{{userId}}" data-nm="{{userNm}}" 
                                {{#login}}data-action="talentExclusive"{{/login}}
                                {{^login}}data-action="noneAuth"{{/login}} 
                                title="전속프리랜서<br/>전속프리랜서는 프리랜서가 기업에 소속되는 관계로 둘다 동의시 프리랜서검색에 노출되지 않습니다.">전속프리랜서</a>
                                </li>

                                <!--li class="tree"><a href="#none" data-value="{{userId}}" data-index="{{index}}"
                                {{#login}}data-action="relationTalent"{{/login}}
                                {{^login}}data-action="noneAuth"{{/login}}
                                title="인맥트리">인맥트리</a></li-->
                                
                                <!-- 메모 -->
                                {{#login}}
                                <li class="memo {{#memoYN}}active{{/memoYN}}">
                                    <a href="#none" class="talentMemo ellipsis" data-value="{{userId}}" data-name="{{userNm}}" data-action = "talnetMeno"
                                    {{#memoYN}}title="{{memo}}"{{/memoYN}}{{^memoYN}}title="메모"{{/memoYN}}>{{memo}}{{#memoYN}}<span></span>{{/memoYN}}</a>
                                </li>
                                {{/login}}
                            </ul>
                        </div>
                    </div>
                    <div class="schedule">
						<div class="she{{month}}_gray">
                        	<ul class="cf">
								{{#monthArr}}
                       			<li></li>
					   			{{/monthArr}}
							</ul>
						</div>

						{{#cntrctList}}
                        <!-- 이전 프로젝트 -->
							{{#isDisplay}}
							<div class={{cssNm}} style="left:{{leftwidth}}%;width:{{rightwidth}}%;">
								<a href="#none" data-project-idx="{{projIdx}}" data-customer="{{customer}}" data-area="{{workArea}}" data-strtdt="{{strtdt}}" data-closedt="{{closedt}}"
								{{#login}}data-action="projectInfo"{{/login}}
								{{^login}}data-action="noneAuth"{{/login}} title="{{{projNm}}}<br/>{{projPeriod}}">
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
	{{/talentList}}
	{{^talentList}}
		<div class="project_box no_data cf" style="text-align:center;">조회 결과가 없습니다.</div>
	{{/talentList}}
{{/obj}}
</script>
<!-- 전문기술 1단계 -->
<script id="memberSearchJobListTemplate" type="text/x-mustache">
	{{#jobList}}
		<li class="jobSelect{{#index}} active{{/index}}" data-value="{{cdVal}}" style="cursor:pointer;">{{cdValNm}}</li>
	{{/jobList}}
</script>
<!-- 전문기술 2단계 -->
<script id="memberSearchSkillListTemplate" type="text/x-mustache">
	{{#skillList}}
    	<li class="skillSelect{{#active}} active{{/active}}" id="skillSelectList_{{cdVal}}" data-id="{{cdVal}}" data-value="{{cdValNm}}" style="cursor:pointer;">{{cdValNm}}</li>
	{{/skillList}}
</script>

<script id="memberSearchAreaListTemplate" type="text/x-mustache">
	{{#areaList}}
		<li class="areaSelect{{#index}} active{{/index}}" data-id="{{cdVal}}" data-value="{{cdValNm}}" style="cursor:pointer;">{{cdValNm}}</li>
	{{/areaList}}
</script>
<script id="memberSearchArea2ListTemplate" type="text/x-mustache">
    {{#areaList}}
        <li class="area2Select{{#active}} active{{/active}}" id="areaSelectList_{{cdVal}}" data-id="{{cdVal}}" data-value="{{cdValNm}}" data-uppervalue="{{workUpperAddr}}" data-upperId="{{upperCdVal}}" style="cursor:pointer;">{{cdValNm}}</li>
    {{/areaList}}
</script>

	<%@ include file="../common/footer.jsp" %>
</body>
</html>