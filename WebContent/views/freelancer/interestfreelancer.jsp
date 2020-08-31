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

	<div class="load_box" style="display:none;"><div class="load_img"><img src="/resources/images/common/loading.gif" alt="loading"/></div></div>
	
<script type="text/javascript" src="/resources/freemon/talent/interestTalent.js?version=1.7"></script>
<script type="text/javascript">
	$(function() {
		freemon.invoker.invoke("interestTalent", "pm", {'intrestCount' : '5','exclusiveCount':'3','dv':'I'});
		
		$('.dateRangePicker').datepicker({
			 format: "yyyy-mm-dd",
			 language: "kr",
			 autoclose: true
		});
		
		$(".man_tab > li").removeClass("active");
		switch("I"){
		case "I" : $(".man_tab > li:first-child").addClass("active"); break;
		case "E" : $(".man_tab > li:nth-child(2)").addClass("active"); break;
		default: $(".man_tab > li:first-child").addClass("active"); break;
		}
	});
</script>
<!--Contents-->
<div id="container">
	<section class="project_in none" style="min-height: 818px;">
    	<!-- 제목부분 -->
    	<div class="pro_tit mb-0">
        	<h2>프리랜서관리 </h2>
        	






<script type="text/javascript" src="/resources/freemon/common/freemonSearch.js?version=1.2"></script>
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
        <input type="text" class="dateRangePicker col-9 pl-0 hasDatepicker" id="searchStrDate" name="searchStrDate" placeholder="프로젝트시작일" readonly="readonly">
    </div>
    <div class="input_box col-7">
        <input type="text" name="keyword" id="keyword" placeholder="예) 서울 java 홍길동">
    </div>
    <a href="#none" class="btn_search col-1" id="freemonSearchBtn">검색</a>
    <!-- <a href="#none" class="btn_search btn_reset sm-col-1" id="freemonReload">초기화</a> -->
</div>

        </div>
        <!-- tab -->
        <ul class="man_tab add_line cf">
       		<li class="active"><a href="#none" data-action="I">관심프리랜서<span class="totalCnt totalInterestCnt small">5</span></a></li>
       		<li class=""><a href="#none" data-action="E">전속프리랜서<span class="totalCnt totalExclusiveCnt small">3</span></a></li>
       	</ul>
        
        <!-- 선택부분 -->
        <!-- 선택부분 -->
        <div class="select">
            <div class="select_in">
                <div class="sel_option">
                    <a href="#none" id="area">지역선택</a>
                    <!-- 옵션 -->
                    <div class="option depth2 single" id="workAreaList" style="display: none;">
                        <div class="select_box cf">
                            <ul class="cf" id="memberSearchAreaList">
		<li class="areaSelect active" data-id="0" data-value="전국" style="cursor:pointer;">전국</li>
		<li class="areaSelect" data-id="10" data-value="서울" style="cursor:pointer;">서울</li>
		<li class="areaSelect" data-id="60" data-value="부산" style="cursor:pointer;">부산</li>
		<li class="areaSelect" data-id="70" data-value="대구" style="cursor:pointer;">대구</li>
		<li class="areaSelect" data-id="40" data-value="인천" style="cursor:pointer;">인천</li>
		<li class="areaSelect" data-id="50" data-value="광주" style="cursor:pointer;">광주</li>
		<li class="areaSelect" data-id="30" data-value="대전" style="cursor:pointer;">대전</li>
		<li class="areaSelect" data-id="68" data-value="울산" style="cursor:pointer;">울산</li>
		<li class="areaSelect" data-id="33" data-value="세종" style="cursor:pointer;">세종</li>
		<li class="areaSelect" data-id="41" data-value="경기" style="cursor:pointer;">경기</li>
		<li class="areaSelect" data-id="20" data-value="강원" style="cursor:pointer;">강원</li>
		<li class="areaSelect" data-id="36" data-value="충북" style="cursor:pointer;">충북</li>
		<li class="areaSelect" data-id="31" data-value="충남" style="cursor:pointer;">충남</li>
		<li class="areaSelect" data-id="56" data-value="전북" style="cursor:pointer;">전북</li>
		<li class="areaSelect" data-id="51" data-value="전남" style="cursor:pointer;">전남</li>
		<li class="areaSelect" data-id="71" data-value="경북" style="cursor:pointer;">경북</li>
		<li class="areaSelect" data-id="62" data-value="경남" style="cursor:pointer;">경남</li>
		<li class="areaSelect" data-id="69" data-value="제주" style="cursor:pointer;">제주</li>
</ul>
                            <ul class="cf" id="memberSearchArea2List">
        <li class="area2Select" id="areaSelectList_0" data-id="0" data-value="전국" data-uppervalue="" data-upperid="" style="cursor:pointer;">전국</li>
</ul>
                        </div>
                    </div>
                    <!-- /옵션 -->
                </div>
                <div class="sel_option">
                    <a href="#none" id="skill">전문기술</a>
                    <!-- 옵션 -->
                    <div class="option depth2 single" id="skillList" style="display: none;">
                        <div class="select_box cf">
                            <ul class="cf" id="memberSearchJobList">
		<li class="jobSelect active" data-value="1" style="cursor:pointer;">웹개발</li>
		<li class="jobSelect" data-value="12" style="cursor:pointer;">응용개발</li>
		<li class="jobSelect" data-value="13" style="cursor:pointer;">시스템개발</li>
		<li class="jobSelect" data-value="10" style="cursor:pointer;">모바일개발</li>
		<li class="jobSelect" data-value="2" style="cursor:pointer;">DBA/데이터베이스</li>
		<li class="jobSelect" data-value="11" style="cursor:pointer;">네트워크/서버/보안</li>
		<li class="jobSelect" data-value="3" style="cursor:pointer;">기획/마케팅</li>
		<li class="jobSelect" data-value="4" style="cursor:pointer;">웹디자인/퍼블리싱</li>
		<li class="jobSelect" data-value="6" style="cursor:pointer;">분석/설계/PM</li>
		<li class="jobSelect" data-value="5" style="cursor:pointer;">게임</li>
		<li class="jobSelect" data-value="7" style="cursor:pointer;">IT 강의</li>
		<li class="jobSelect" data-value="8" style="cursor:pointer;">동영상제작/편집</li>
		<li class="jobSelect" data-value="9" style="cursor:pointer;">빅데이터/AI(인공지능)</li>
</ul>
                            <ul class="cf" id="memberSearchSkillList">
    	<li class="skillSelect" id="skillSelectList_2" data-id="2" data-value="JSP" style="cursor:pointer;">JSP</li>
    	<li class="skillSelect" id="skillSelectList_3" data-id="3" data-value="PHP" style="cursor:pointer;">PHP</li>
    	<li class="skillSelect" id="skillSelectList_1" data-id="1" data-value="ASP.NET" style="cursor:pointer;">ASP.NET</li>
    	<li class="skillSelect" id="skillSelectList_125" data-id="125" data-value="ASP" style="cursor:pointer;">ASP</li>
    	<li class="skillSelect" id="skillSelectList_6" data-id="6" data-value="JavaScript" style="cursor:pointer;">JavaScript</li>
    	<li class="skillSelect" id="skillSelectList_126" data-id="126" data-value="Ajax" style="cursor:pointer;">Ajax</li>
    	<li class="skillSelect" id="skillSelectList_4" data-id="4" data-value="Jquery" style="cursor:pointer;">Jquery</li>
    	<li class="skillSelect" id="skillSelectList_5" data-id="5" data-value="NodeJS" style="cursor:pointer;">NodeJS</li>
    	<li class="skillSelect" id="skillSelectList_146" data-id="146" data-value="Vue.js" style="cursor:pointer;">Vue.js</li>
    	<li class="skillSelect" id="skillSelectList_147" data-id="147" data-value="React.js" style="cursor:pointer;">React.js</li>
    	<li class="skillSelect" id="skillSelectList_150" data-id="150" data-value="Angular.js" style="cursor:pointer;">Angular.js</li>
    	<li class="skillSelect" id="skillSelectList_148" data-id="148" data-value="Ruby" style="cursor:pointer;">Ruby</li>
    	<li class="skillSelect" id="skillSelectList_149" data-id="149" data-value="Ruby on Rails" style="cursor:pointer;">Ruby on Rails</li>
    	<li class="skillSelect" id="skillSelectList_130" data-id="130" data-value="MiPlatform" style="cursor:pointer;">MiPlatform</li>
    	<li class="skillSelect" id="skillSelectList_132" data-id="132" data-value="Nexacro platform" style="cursor:pointer;">Nexacro platform</li>
    	<li class="skillSelect" id="skillSelectList_131" data-id="131" data-value="XPLATFORM" style="cursor:pointer;">XPLATFORM</li>
    	<li class="skillSelect" id="skillSelectList_129" data-id="129" data-value="GO" style="cursor:pointer;">GO</li>
    	<li class="skillSelect" id="skillSelectList_7" data-id="7" data-value="Oracle" style="cursor:pointer;">Oracle</li>
    	<li class="skillSelect" id="skillSelectList_8" data-id="8" data-value="MS-SQL" style="cursor:pointer;">MS-SQL</li>
    	<li class="skillSelect" id="skillSelectList_9" data-id="9" data-value="MySQL" style="cursor:pointer;">MySQL</li>
    	<li class="skillSelect" id="skillSelectList_10" data-id="10" data-value="DB2" style="cursor:pointer;">DB2</li>
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
                                <li class="setRangeValue" data-action="setRangeValue" data-value="1" id="1" data-html="5년이하">5년이하</li>
				                <li class="setRangeValue" data-action="setRangeValue" data-value="2" id="2" data-html="6~10년">6~10년</li>
				                <li class="setRangeValue" data-action="setRangeValue" data-value="3" id="3" data-html="11~15년">11~15년</li>
				                <li class="setRangeValue" data-action="setRangeValue" data-value="4" id="4" data-html="16~20년">16~20년</li>
				                <li class="setRangeValue" data-action="setRangeValue" data-value="5" id="5" data-html="21년이상">21년이상</li>
				                <li class="setRangeValue" data-action="setRangeValue" data-value="0" id="0" data-html="경력무관">경력무관</li>
                            </ul>
                        </div>
                    </div>
                    <!-- /옵션 -->
                </div>
                <div class="sel_check" style="display: none;">
                    <label class="agrChk" for="careerY"><input type="checkbox" id="careerY" name="careerY" data-action="" data-value="EXP" value="EXP"><i></i>계약된 프리랜서</label>
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
        
        <!--div class="choice">
        <div class="cho_text"><span class="red" id="selectDateText"></span> 기준으로 <span class="red">투입가능한</span> 프리랜서<span id="text_add"> 입니다.</span></div>
        	<div class="cho_man">
                <ul class="cf">
                    <li class="active"><a href="#none" class="contractType" data-action = "sortTypeClick" data-value="A">전체</a></li>
                    <li><a href="#none" class="contractType" data-action = "sortTypeClick" data-value="Y">계약된 프리랜서</a></li>
                    <li><a href="#none" class="contractType" data-action = "sortTypeClick" data-value="N">비계약된 프리랜서</a></li>
                    <li><a href="#none" class="contractType" data-action = "sortTypeClick" data-value="join">프로젝트 마감임박순</a></li>
                </ul>
            </div>
            <div class="cho_show">
                <ul class="cf">
                	<li class="active cf">
                        <a href="#none" class="cho_icon1 interestListType" data-action="showTypeClick" data-month="12">1년</a>
                    </li>
                    <li class="cf">
                        <a href="#none" class="cho_icon1 interestListType" data-action="showTypeClick" data-month="3">3개월</a>
                    </li>
                </ul>
            </div>
        </div-->
        
        <!-- 인재목록 -->
        <div class="man_list xs-hidden">
        	<div id="interestTalentList" style="">
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
        	<!-- 목록형 3개월 -->
                <div class="card cf">
                        <div class="free_info cf">
                        <div class="profile" style="cursor:pointer;background-image:url(/resources/images/new/no-pic.png)" data-action="talentDetail" data-value="1414045769">프로필사진</div>
                        <div class="pro_con">
                            <!--div class="report2 list2">
                                <ul class="alarm cf">
                                    <li class="alarm2 on">투입가능</li>
                                </ul>
                            </div-->
                            <h3 data-action="talentDetail" data-value="1414045769">
                                <a href="#none" data-action="talentDetail" data-value="1414045769">권철</a>
                                <ul class="f_nature cf">
                                    <li>51세</li>
                                    <li class="ellipsis"></li>
                                </ul>
                            </h3>
                            <ul class="free_list cf">
                                <li>총 0년</li>
                                <li class="ellipsis"></li>
                            </ul>
                            <!-- 해시태그, 투입가능일 -->
                            <div class="add_con cf">
                                <div class="hash ellipsis"> 
                                    <ul class="cf">
                                        
                                    </ul>
                                </div>
                                <p class="able on">투입가능</p>
                            </div>
                            <ul class="btn_icon absolute cf">
                                <li class="like active">
                                    <a href="#none" data-value="1414045769" data-action="talentInterest" title="관심프리랜서">관심프리랜서</a>
                                </li>
                                <li class="pick active">
                                    <a href="#none" data-value="1414045769" data-nm="권철" data-yn="Y" data-action="talentExclusive" title="전속프리랜서<br></a>전속프리랜서는 프리랜서가 기업에 소속되는 관계로 둘다 동의시 프리랜서검색에 노출되지 않습니다.">전속프리랜서</a>
                                </li>
                                <!--li class="tree">
                                    <a href="#none" data-value="1414045769" data-index="0" data-action="relationTalent" tltle="인맥트리">인맥트리</a>
                                </li-->

                                <li class="memo ">
                                    <a href="#none" class="talentMemo ellipsis" data-value="1414045769" data-name="권철" data-action="talnetMeno" title="메모"></a>
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
							<div class="project4" style="left:0%;width:50.136986301369866%;">
								<a href="#none" data-project-idx="-1" data-customer="" data-area="" data-strtdt="" data-closedt="" data-action="projectInfo" title="비공개 프로젝트 진행중<br></a>2020.06.01부터 투입가능">
                        			<h4 class="ellipsis">비공개 프로젝트 진행중</h4>
                            		<p class="ellipsis">2020.06.01부터 투입가능</p>
									<div class="day_end"></div>
								</a>
                        	</div>
                        <!-- 투입가능일 -->
                        <div class="line_able" style="left:75%;">
                        	<div class="day_able">08/30</div>
                        </div>
                    </div>
                </div>	
        	<!-- 목록형 3개월 -->
                <div class="card cf">
                        <div class="free_info cf">
                        <div class="profile" style="cursor:pointer;background-image:url(/resources/images/new/no-pic.png)" data-action="talentDetail" data-value="1413730487">프로필사진</div>
                        <div class="pro_con">
                            <!--div class="report2 list2">
                                <ul class="alarm cf">
                                    <li class="alarm2 ">183일후</li>
                                </ul>
                            </div-->
                            <h3 data-action="talentDetail" data-value="1413730487">
                                <a href="#none" data-action="talentDetail" data-value="1413730487">강동우</a>
                                <ul class="f_nature cf">
                                    <li>남, 28세</li>
                                    <li class="ellipsis"></li>
                                </ul>
                            </h3>
                            <ul class="free_list cf">
                                <li>총 0년</li>
                                <li class="ellipsis">Java, JSP, Jquery, JavaScript, Oracle</li>
                            </ul>
                            <!-- 해시태그, 투입가능일 -->
                            <div class="add_con cf">
                                <div class="hash ellipsis"> 
                                    <ul class="cf">
                                        
                                    </ul>
                                </div>
                                <p class="able ">183일후</p>
                            </div>
                            <ul class="btn_icon absolute cf">
                                <li class="like active">
                                    <a href="#none" data-value="1413730487" data-action="talentInterest" title="관심프리랜서">관심프리랜서</a>
                                </li>
                                <li class="pick ">
                                    <a href="#none" data-value="1413730487" data-nm="강동우" data-yn="N" data-action="talentExclusive" title="전속프리랜서<br></a>전속프리랜서는 프리랜서가 기업에 소속되는 관계로 둘다 동의시 프리랜서검색에 노출되지 않습니다.">전속프리랜서</a>
                                </li>
                                <!--li class="tree">
                                    <a href="#none" data-value="1413730487" data-index="1" data-action="relationTalent" tltle="인맥트리">인맥트리</a>
                                </li-->

                                <li class="memo ">
                                    <a href="#none" class="talentMemo ellipsis" data-value="1413730487" data-name="강동우" data-action="talnetMeno" title="메모"></a>
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
							<div class="project4" style="left:0%;width:99%;">
								<a href="#none" data-project-idx="-1" data-customer="" data-area="" data-strtdt="" data-closedt="" data-action="projectInfo" title="비공개 프로젝트 진행중<br></a>2021.03.01부터 투입가능">
                        			<h4 class="ellipsis">비공개 프로젝트 진행중</h4>
                            		<p class="ellipsis">2021.03.01부터 투입가능</p>
									<div class="day_end"></div>
								</a>
                        	</div>
                        <!-- 투입가능일 -->
                        <div class="line_able" style="left:75%;">
                        	<div class="day_able">08/30</div>
                        </div>
                    </div>
                </div>	
        	<!-- 목록형 3개월 -->
                <div class="card cf">
                        <div class="free_info cf">
                        <div class="profile" style="cursor:pointer;background-image:url(http://th-p.talk.kakao.co.kr/th/talkp/wlppos8SsF/x3p8zKTBVnNGqYR6kvIkM0/9nmr9n_110x110_c.jpg)" data-action="talentDetail" data-value="1444427072">프로필사진</div>
                        <div class="pro_con">
                            <!--div class="report2 list2">
                                <ul class="alarm cf">
                                    <li class="alarm2 ">101일후</li>
                                </ul>
                            </div-->
                            <h3 data-action="talentDetail" data-value="1444427072">
                                <a href="#none" data-action="talentDetail" data-value="1444427072">김은호</a>
                                <ul class="f_nature cf">
                                    <li>29세</li>
                                    <li class="ellipsis"></li>
                                </ul>
                            </h3>
                            <ul class="free_list cf">
                                <li>총 0년</li>
                                <li class="ellipsis"></li>
                            </ul>
                            <!-- 해시태그, 투입가능일 -->
                            <div class="add_con cf">
                                <div class="hash ellipsis"> 
                                    <ul class="cf">
                                        
                                    </ul>
                                </div>
                                <p class="able ">101일후</p>
                            </div>
                            <ul class="btn_icon absolute cf">
                                <li class="like active">
                                    <a href="#none" data-value="1444427072" data-action="talentInterest" title="관심프리랜서">관심프리랜서</a>
                                </li>
                                <li class="pick ">
                                    <a href="#none" data-value="1444427072" data-nm="김은호" data-yn="N" data-action="talentExclusive" title="전속프리랜서<br></a>전속프리랜서는 프리랜서가 기업에 소속되는 관계로 둘다 동의시 프리랜서검색에 노출되지 않습니다.">전속프리랜서</a>
                                </li>
                                <!--li class="tree">
                                    <a href="#none" data-value="1444427072" data-index="2" data-action="relationTalent" tltle="인맥트리">인맥트리</a>
                                </li-->

                                <li class="memo ">
                                    <a href="#none" class="talentMemo ellipsis" data-value="1444427072" data-name="김은호" data-action="talnetMeno" title="메모"></a>
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
							<div class="project4" style="left:0%;width:99%;">
								<a href="#none" data-project-idx="-1" data-customer="" data-area="" data-strtdt="" data-closedt="" data-action="projectInfo" title="비공개 프로젝트 진행중<br></a>2020.12.09부터 투입가능">
                        			<h4 class="ellipsis">비공개 프로젝트 진행중</h4>
                            		<p class="ellipsis">2020.12.09부터 투입가능</p>
									<div class="day_end"></div>
								</a>
                        	</div>
                        <!-- 투입가능일 -->
                        <div class="line_able" style="left:75%;">
                        	<div class="day_able">08/30</div>
                        </div>
                    </div>
                </div>	
        	<!-- 목록형 3개월 -->
                <div class="card cf">
                        <div class="free_info cf">
                        <div class="profile" style="cursor:pointer;background-image:url(/resources/images/new/no-pic.png)" data-action="talentDetail" data-value="1413481352">프로필사진</div>
                        <div class="pro_con">
                            <!--div class="report2 list2">
                                <ul class="alarm cf">
                                    <li class="alarm2 ">54일후</li>
                                </ul>
                            </div-->
                            <h3 data-action="talentDetail" data-value="1413481352">
                                <a href="#none" data-action="talentDetail" data-value="1413481352">한진선</a>
                                <ul class="f_nature cf">
                                    <li>남, 32세</li>
                                    <li class="ellipsis">서울,경기 고양시,경기 파주시</li>
                                </ul>
                            </h3>
                            <ul class="free_list cf">
                                <li>총 0년</li>
                                <li class="ellipsis">Java, Oracle</li>
                            </ul>
                            <!-- 해시태그, 투입가능일 -->
                            <div class="add_con cf">
                                <div class="hash ellipsis"> 
                                    <ul class="cf">
                                        <li>#장기</li>
                                    </ul>
                                </div>
                                <p class="able ">54일후</p>
                            </div>
                            <ul class="btn_icon absolute cf">
                                <li class="like active">
                                    <a href="#none" data-value="1413481352" data-action="talentInterest" title="관심프리랜서">관심프리랜서</a>
                                </li>
                                <li class="pick active">
                                    <a href="#none" data-value="1413481352" data-nm="한진선" data-yn="Y" data-action="talentExclusive" title="전속프리랜서<br></a>전속프리랜서는 프리랜서가 기업에 소속되는 관계로 둘다 동의시 프리랜서검색에 노출되지 않습니다.">전속프리랜서</a>
                                </li>
                                <!--li class="tree">
                                    <a href="#none" data-value="1413481352" data-index="3" data-action="relationTalent" tltle="인맥트리">인맥트리</a>
                                </li-->

                                <li class="memo ">
                                    <a href="#none" class="talentMemo ellipsis" data-value="1413481352" data-name="한진선" data-action="talnetMeno" title="메모"></a>
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
							<div class="project4" style="left:0%;width:89.58904109589041%;">
								<a href="#none" data-project-idx="-1" data-customer="" data-area="" data-strtdt="" data-closedt="" data-action="projectInfo" title="비공개 프로젝트 진행중<br></a>2020.10.23부터 투입가능">
                        			<h4 class="ellipsis">비공개 프로젝트 진행중</h4>
                            		<p class="ellipsis">2020.10.23부터 투입가능</p>
									<div class="day_end"></div>
								</a>
                        	</div>
                        <!-- 투입가능일 -->
                        <div class="line_able" style="left:75%;">
                        	<div class="day_able">08/30</div>
                        </div>
                    </div>
                </div>	
        	<!-- 목록형 3개월 -->
                <div class="card cf">
                        <div class="free_info cf">
                        <div class="profile" style="cursor:pointer;background-image:url(http://th-p.talk.kakao.co.kr/th/talkp/wlRiSfFftw/zPoamIv1NsP0LsSCtYFKW1/xyefs1_110x110_c.jpg)" data-action="talentDetail" data-value="1435864601">프로필사진</div>
                        <div class="pro_con">
                            <!--div class="report2 list2">
                                <ul class="alarm cf">
                                    <li class="alarm2 ">10일후</li>
                                </ul>
                            </div-->
                            <h3 data-action="talentDetail" data-value="1435864601">
                                <a href="#none" data-action="talentDetail" data-value="1435864601">모두한</a>
                                <ul class="f_nature cf">
                                    <li>26세</li>
                                    <li class="ellipsis">서울</li>
                                </ul>
                            </h3>
                            <ul class="free_list cf">
                                <li>총 0년</li>
                                <li class="ellipsis">ASP, JSP</li>
                            </ul>
                            <!-- 해시태그, 투입가능일 -->
                            <div class="add_con cf">
                                <div class="hash ellipsis"> 
                                    <ul class="cf">
                                        <li>#344</li>
                                    </ul>
                                </div>
                                <p class="able ">10일후</p>
                            </div>
                            <ul class="btn_icon absolute cf">
                                <li class="like active">
                                    <a href="#none" data-value="1435864601" data-action="talentInterest" title="관심프리랜서">관심프리랜서</a>
                                </li>
                                <li class="pick active">
                                    <a href="#none" data-value="1435864601" data-nm="모두한" data-yn="Y" data-action="talentExclusive" title="전속프리랜서<br></a>전속프리랜서는 프리랜서가 기업에 소속되는 관계로 둘다 동의시 프리랜서검색에 노출되지 않습니다.">전속프리랜서</a>
                                </li>
                                <!--li class="tree">
                                    <a href="#none" data-value="1435864601" data-index="4" data-action="relationTalent" tltle="인맥트리">인맥트리</a>
                                </li-->

                                <li class="memo ">
                                    <a href="#none" class="talentMemo ellipsis" data-value="1435864601" data-name="모두한" data-action="talnetMeno" title="메모"></a>
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
							<div class="project4" style="left:0%;width:77.53424657534246%;">
								<a href="#none" data-project-idx="-1" data-customer="" data-area="" data-strtdt="" data-closedt="" data-action="projectInfo" title="비공개 프로젝트 진행중<br></a>2020.09.09부터 투입가능">
                        			<h4 class="ellipsis">비공개 프로젝트 진행중</h4>
                            		<p class="ellipsis">2020.09.09부터 투입가능</p>
									<div class="day_end"></div>
								</a>
                        	</div>
                        <!-- 투입가능일 -->
                        <div class="line_able" style="left:75%;">
                        	<div class="day_able">08/30</div>
                        </div>
                    </div>
                </div>	
</div>
        	<div id="exclusiveTalentList" style="display: none;"></div>
        </div>
        
        <!-- 팝업 -->
		<div class="pop_bg" id="projectInTalentList" style="display:none;">
		</div>
		
        <!-- 더보기 -->
        <div class="more_box" style="display:none;">
           	<a href="#none" class="btn_more center" data-action="moreViewClick"><span class="t_more">더보기</span></a>
        </div>
    </section>
</div>
<!--//Contents-->
<script id="interestTalentListTemplate" type="text/x-mustache">
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
                        <div class="pro_con">
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
                                <li class="like {{#isInterest}}active{{/isInterest}}">
                                    <a href="#none" data-value="{{userId}}" data-action="talentInterest" title="관심프리랜서">관심프리랜서</a>
                                </li>
                                <li class="pick {{#isExclusive}}active{{/isExclusive}}">
                                    <a href="#none" data-value="{{userId}}" data-nm="{{userNm}}" data-yn="{{exclusiveYn}}" data-action="talentExclusive" title="전속프리랜서<br/>전속프리랜서는 프리랜서가 기업에 소속되는 관계로 둘다 동의시 프리랜서검색에 노출되지 않습니다.">전속프리랜서</a>
                                </li>
                                <!--li class="tree">
                                    <a href="#none" data-value="{{userId}}" data-index="{{index}}" data-action="relationTalent" tltle="인맥트리">인맥트리</a>
                                </li-->

                                <li class="memo {{#memoYN}}active{{/memoYN}}">
                                    <a href="#none" class="talentMemo ellipsis" data-value="{{userId}}" data-name="{{userNm}}" data-action = "talnetMeno"
                                    {{#memoYN}}title="{{memo}}"{{/memoYN}}{{^memoYN}}title="메모"{{/memoYN}}>{{memo}}{{#memoYN}}<span></span>{{/memoYN}}</a>
                                </li>
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
									data-action="projectInfo" title="{{{projNm}}}<br/>{{projPeriod}}">
                        			<h4 class="ellipsis">{{projNm}}</h4>
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

<script id="exclusiveTalentListTemplate" type="text/x-mustache">
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
                        <div class="pro_con">
                            <!--div class="report2 list2">
                                <ul class="alarm cf">
                                    <li class="alarm2 {{leaveStrtTermCss}}">{{leaveStrtTermTxt}}</li>
                                </ul>
                            </div-->
                            <h3>
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
                                <li class="like {{#isInterest}}active{{/isInterest}}">
                                    <a href="#none" data-value="{{userId}}" data-action="talentInterest" title="관심프리랜서">관심프리랜서</a>
                                </li>
                                <li class="pick active">
                                    <a href="#none" data-value="{{userId}}" data-nm="{{userNm}}" data-yn="Y" data-action="talentExclusive" title="전속프리랜서 관계를 해제합니다.">전속프리랜서</a>
                                </li>
                                <!--li class="tree">
                                    <a href="#none" data-value="{{userId}}" data-index="{{index}}" data-action="relationTalent" tltle="인맥트리">인맥트리</a>
                                </li-->
                
                                <li class="memo {{#memoYN}}active{{/memoYN}}">
                                    <a href="#none" class="talentMemo ellipsis" data-value="{{userId}}" data-name="{{userNm}}" data-action = "talnetMeno"
                                    {{#memoYN}}title="{{memo}}"{{/memoYN}}{{^memoYN}}title="메모"{{/memoYN}}>{{memo}}{{#memoYN}}<span></span>{{/memoYN}}</a>
                                </li>
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
									data-action="projectInfo" title="{{{projNm}}}<br/>{{projPeriod}}">
                        			<h4 class="ellipsis">{{projNm}}</h4>
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
	
	<%@ include file="../common/footer.jsp"%>

</body>
</html>