<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<!-- Mirrored from www.freemon.co.kr/login/freemonLogin by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 27 Jul 2020 06:59:35 GMT -->
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->
<head>
	<!-- Google Tag Manager -->
	<!-- <script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
	new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
	j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
	'../../www.googletagmanager.com/gtm5445.html?id='+i+dl;f.parentNode.insertBefore(j,f);
	})(window,document,'script','dataLayer','GTM-MF7LK3J');</script> -->
	<!-- End Google Tag Manager -->	

	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="naver-site-verification" content="81b7cb5e5f8e2975b94b334d812bb38453749a5a"/>
	<meta name="keywords" content="프리몬, FREEMON, SI, SM, 프리랜서, 아웃소싱 플랫폼, 상주, 프로젝트, 개발자, 시스템엔지니어, MES, 설계자, 디자이너, 타임라인, Java, C#" />
	<meta name="description" content="SI 전문 아웃소싱 플랫폼. 일정이 딱딱 맞는 프로젝트, 프리랜서를 한눈에. 프로젝트 프리랜서 타임라인, 간편하게 작성하는 전자계약서, 이력 간편등록, 프리랜서 멘토, 쉽게 관리하는 프로젝트" />
	<meta property="og:type" content="website" />
	<meta property="og:title" content="프리몬 - SI 전문 아웃소싱" />
	<meta property="og:description" content="SI 전문 아웃소싱 플랫폼. 프로젝트 프리랜서 타임라인, 이력 간편등록, 프리랜서 멘토, 간편 전자계약서" />
	<meta property="og:image" content="https://www.freemon.co.kr/resources/images/new/freemon_naver.jpg" />
	<meta property="og:url" content="https://www.freemon.co.kr" />
    <meta id="_csrf" name="_csrf" content="45d71795-fe18-44ec-9100-ef681e66286f"/>
	<meta id="_csrf_header" name="_csrf_header" content="X-CSRF-TOKEN"/>
    <meta name="viewport" content="width=1360">
    <title>프리월드 - SI 전문 아웃소싱</title>
	<!-- Global site tag (gtag.js) - Google Analytics -->
	<!-- <script async src="https://www.googletagmanager.com/gtag/js?id=UA-137161229-1"></script>
	<script>
		window.dataLayer = window.dataLayer || [];
	  	function gtag(){dataLayer.push(arguments);}
	  	gtag('js', new Date());
	
	  	gtag('config', 'UA-137161229-1', {
	  	  'linker': {
	  	    'domains': ['www.freemon.co.kr', 'www.freemon.kr']
	  	  }
	  	});
	</script> -->

	<link rel="stylesheet" type="text/css" href="../resources/css/defaulta9af.css">
	<link rel="stylesheet" type="text/css" href="../resources/css/jquery-ui.mina751.css">
	<link rel="stylesheet" type="text/css" href="../resources/css/membercd4e.css">
	<link rel="stylesheet" type="text/css" href="../resources/css/new6d33.css">
	<link rel="stylesheet" type="text/css" id="mobile" href="../resources/css/web_hand.css">
	<link rel="stylesheet" type="text/css" href="../resources/css/career-ui.mina751.css" />
	<link rel="stylesheet" type="text/css" href="../resources/css/ui.jqgrid.css" />
	<link rel="shortcut icon" href="../resources/images/new/favicon.ico"/>
	
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
    <script type="text/javascript" src="../resources/scripts/jquery-3.3.1.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="../resources/scripts/jquery.flexslider.js"></script>
    <script type="text/javascript" src="../resources/scripts/site_ui.js"></script>
	<script type="text/javascript" src="../resources/js/jquery.easing.1.3.js"></script>
    <!--Calendar-->
    <script type="text/javascript" src="../resources/scripts/calendar/pignose.calendar.full.js"></script>
	<script type="text/javascript" src="../resources/js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="../resources/js/jquery.ba-hashchange.min.js"></script>
	<script type="text/javascript" src="../resources/js/jquery.json-2.3.js"></script>
	<script type="text/javascript" src="../resources/js/jquery.validate.min.js"></script>
	<script type="text/javascript" src="../resources/js/jquery.history.js"></script>
	<!-- Jqgrid -->
	<script type="text/javascript" src="../resources/js/grid.locale-kr.js"></script>
	<script type="text/javascript" src="../resources/js/jquery.jqGrid.min.js"></script>
	<!-- //Jqgrid -->
	<script type="text/javascript" src="../resources/js/jquery.marquee.min9a0d.js?version=1.0"></script>
	<script type="text/javascript" src="../resources/js/mustache.js"></script>
	<script type="text/javascript" src="../resources/js/jquery.cookie.js"></script>
	<script type="text/javascript" src="../resources/i18n/commonMessages_ko.js"></script>
	<script type="text/javascript" src="../resources/freemon/base64.js"></script>
	<script type="text/javascript" src="../resources/freemon/sha256.js"></script>
	<script type="text/javascript" src="../resources/freemon/nmask.js"></script>
	<script type="text/javascript" src="../resources/freemon/freemonc599.js?version=3.3"></script>
	<script type="text/javascript" src="../resources/js/gnb_common56b8.js?version=4.2"></script>
	<script type="text/javascript" src="../resources/freemon/common/apply.js"></script>
	<script type="text/javascript" src="../resources/freemon/common/freemonPopUp9667.js?version=1.2"></script>
	<script type="text/javascript" src="../resources/freemon/common/input.js"></script>
	
	<script type="text/javascript" src="../../developers.kakao.com/sdk/js/kakao.min.js"></script>
	
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
				var url = "../resources/css/web_hand.css";
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
			if(freemon.ux.isMobileCheck() == true && "PC" == "MOBILE"){
				document.location.href = "https://m.freemon.co.kr/";
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

	<div class="load_box" style="display:none;"><div class="load_img"><img src="../resources/images/common/loading.gif" alt="loading"/></div></div>


<div id="header">
	<div class="header_top">
	    <div class="box">
	        <!-- 활동내역 -->
	    	<div class="flow_text" style="padding-top:10px;">
	    		<div class="flow_text_in" style="border:0px solid red; line-height:30px; height:22px;">
  	    			
	    				
	    		
	    					
	    				
					
	    		</div>
	    	</div>
	        <div class="top_menu w_top_menu">
	            <ul class="cf">
	            	
	                
	            <!--헤더의 최 상단(로그인 관련)-->   
	                <li>김은호님</li>
	                <li class="login"><a href="../home.html">로그아웃</a></li>
	                <li><a href="/www.freemon.co.kr/mypage/myfreemon_P.html">마이프리몬<span class="arrow"></span></a>
	                	<ul class="top_depth2" style="display:none;">
	                    	<p class="top_arrow"></p>
	                    	<li><a href="/resume/resumeSearch">프로필 관리</a></li>
	                    	<!-- <li><a href="/document/documentSelect">서류신청</a></li> -->
	                    	<li><a href="#none" class="common-open_popup" data-div="alamn" data-user-div="freelancer">알림설정</a></li>
	                    </ul>
	                </li>
					
	                <!-- <li><a href="/customer/noticeSearch">고객센터<span class="arrow"></span></a>
	                	<ul class="top_depth2" style="display:none;">
	                    	<p class="top_arrow"></p>
	                    	<li><a href="/customer/noticeSearch">자주묻는질문</a></li>
	                        <li><a href="/customer/questionRegistForm">문의하기</a></li>
	                    </ul>
	                </li> -->
	                <!-- <li class="blog"><a href="http://blog.freemon.co.kr" target="_blank">블로그</a></li> -->
	            </ul>
	        </div>
	    </div>
    </div>
    <!-- 네비게이션 바-->
    <div class="header_body">
    	<div class="box">
           <h1 class="logo"><a href="/www.freemon.co.kr/index.html">프리월드</a></h1>
            <div id="gnb">
                <nav>
                    <ul class ="gnb_in cf">
                    							
						<li class="menu_about gnb_depth1 ">
                        	<a href="../project/projectSearch.html" class="gnb_depTxt"><em>프로젝트 검색</em></a>
                        </li>
						<li class="menu_about gnb_depth1 ">
                        	<a href="../project/projectMap" class="gnb_depTxt"><em>프로젝트 맵</em></a>
                        </li>
                        <li class="menu_about gnb_depth1 ">
                        	<a href="../applicant/applicantsearch.html" class="gnb_depTxt"><em>제안 및 지원 현황</em></a>
                        </li>
                       <!--  <li class="menu_about gnb_depth1 ">
                        	<a href="/home/freemonSupport" class="gnb_depTxt"><em>출장지원</em></a> 
                        </li>-->
                        <li class="menu_about gnb_depth1 ">
                        	<a href="../resume/resumeSearch.html" class="gnb_depTxt"><em>프로필 관리</em></a>
                        </li>
						
						
                    </ul>
                </nav>
            </div>
		</div>
	</div>
</div>
		
		
<link rel="stylesheet" type="text/css" href="/resources/css/resume.css">
<link rel="stylesheet" type="text/css" href="/resources/css/pop.css?version=1.0">
<script type="text/javascript" src="/resources/freemon/mypage/myUserFreemon.js?version=1.9"></script>
<script type="text/javascript">
$(function() {
    $(function() {
    var skills = [], areas = [];
    
    
    freemon.invoker.invoke("myUserFreemon", "talent", {'userId':'1444427072', 'selectSkills': skills, 'selectArea': areas});
    });
    
    $('.dateRangePicker').datepicker({
         format: "yyyy-mm-dd",
         language: "kr",
         minDate: freemon.util.getDateString(new Date(), '-'),
         autoclose: true
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
          <h2>김은호
          </h2>
		</div>
		<ul class="man_tab my_man_tab cf">
       		<li class="active"><a href="#none">마이프리몬</a></li>
       		<li><a href="../resume/resumeSearch.html">프로필관리</a></li>
        	<!--  <li><a href="/document/documentSelect">서류신청</a></li> -->
			<li><a href="/customer/questionRegistForm">문의하기</a></li>
			<li><a href="javascript:void(0);" class="common-open_popup" data-div="alamn" data-user-div="freelancer">알림설정</a></li>
       	</ul>
        <!-- 카운트 -->
        <div class="counter per_counter">
        	
        	<ul class="cf">
                <li><a href="/applicant/talentApplicantSearch"><h5>제안된 요청</h5><p><span class="icon"></span>0</p></a></li>
                <li><a href="/applicant/talentApplicantSearch?dv=2"><h5>지원 프로젝트</h5><p><span class="icon"></span>1</p></a></li>
                <li><a href="/applicant/talentApplicantSearch?dv=4"><h5>계약요청</h5><p><span class="icon"></span>0</p></a></li>
                <li><a href="/applicant/talentApplicantSearch?dv=3"><h5>계약 프로젝트</h5><p><span class="icon"></span>0</p></a></li>
            </ul>
        </div>
        <!-- 타임라인  -->
        <div class="mt-40 cf">
        	<div>
            	<!-- 프로젝트 -->
                <div class="dash">
                    <div class="dash_tit">
                        <h3>나의 타임라인 
                        	<a class="btn_close" href="/talent/openTalentDetail?fno=1414045769" target="_blank">프로필 미리보기</a> 
			            	<a href="javascript:void(0);" class="note_q">
			                	<p class="note_a">등록된 경력을 기준으로<br>기업고객에게 보여지는<br>이력정보 화면입니다.<span class="a_arrow"></span></p>
			                </a>
                        	<p class="small"><span><!-- 현재  -->투입가능일</span>2020.12.07</p><a href="/changeDate" class="btn_logout"><!-- 투입가능일(비공개 프로젝트 수행중) 변경 -->일자변경</a>
                        </h3>
				      	<div class="man_box cf" id="talentSearchList">
    <div class="man_info">
        <a href="/resume/resumeSearch">
        <div class="free_info cf">
            <div class="profile" style="background-image:url(/resources/images/new/no-pic.png)">프로필사진</div>
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
                    <p class="able ">119일후</p>
                </div>
            </div>
        </div>
        </a>
    </div>
    <div class="man_sche">
        <div class="she12_gray">
            <ul class="cf">
                <li><p>12월</p></li>
                <li><p>01월</p></li>
                <li><p>02월</p></li>
                <li><p>03월</p></li>
                <li><p>04월</p></li>
                <li><p>05월</p></li>
                <li><p>06월</p></li>
                <li><p>07월</p></li>
                <li><p>08월</p></li>
                <li><p>09월</p></li>
                <li><p>10월</p></li>
                <li><p>11월</p></li>
            </ul>
        </div>
        <!-- 이전 프로젝트 -->
        <div class="project4" style="left:0%;width:99%;">
            <a href="javascript:void(0);" data-project-idx="-1" data-customer="" data-area="" data-strtdt="" data-closedt="" data-action="moveLink" title="비공개 프로젝트 진행중<br></a>2020.12.07부터 투입가능">
            <h4 class="ellipsis">비공개 프로젝트 진행중</h4>
            <p class="ellipsis">2020.12.07부터 투입가능</p>
            <div class="day_end"></div>
            </a>
        </div>


        <!-- 투입가능일 -->
        <div class="line_able" style="left:69%;">
            <div class="day_able">08/10</div>
        </div>
    </div>
</div>
					
                	</div>
        		</div>
        	</div>
        </div>

		
        <!-- 추천프로젝트 & 제안 및 지원현황 -->
        <div class="mt-40 cf">
        	<div class="col-6 pr-15">
            	<!-- 프로젝트 -->
                <div class="dash">
                    <div class="dash_tit">
                        <h3>최근 본 프로젝트
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
					<a href="javascript:void(0);" data-action="projectDetail" data-id="804">플랜정보기술</a>
				</h4>
                <h3 class="ellipsis">
                    <a href="javascript:void(0);" data-action="projectDetail" data-id="804">DB 모니터링 툴 개발</a>
                </h3>
                <ul class="pro_list surport cf">
                    <li>2020.08.10 ~ 2020.10.10<span class="add_info org">3개월</span></li>
                    <li>서울 송파구</li>
					<li>1만원(협의가능)</li>
                    <li class="ellipsis">MongoDB,Python,Oracle,Linux</li>
                </ul>
                <ul class="btn_icon absolute">
                    <li class="share"><a href="javascript:void(0);" data-action="shareClick" data-value="804" title="친구공유">친구공유</a></li>
                </ul>
        </div>
    </div>
    <div class="card cf ">
        <div class="pro_info">
                <h4>
					<a href="javascript:void(0);" data-action="projectDetail" data-id="755">모집중</a>
				</h4>
                <h3 class="ellipsis">
                    <a href="javascript:void(0);" data-action="projectDetail" data-id="755">KIS정보통신 안드로이드 Agent 개발 </a>
                </h3>
                <ul class="pro_list surport cf">
                    <li>2020.07.17 ~ 2020.12.31<span class="add_info org">6개월</span></li>
                    <li> 서울</li>
					<li>550만원</li>
                    <li class="ellipsis">Android,C</li>
                </ul>
                <ul class="btn_icon absolute">
                    <li class="share"><a href="javascript:void(0);" data-action="shareClick" data-value="755" title="친구공유">친구공유</a></li>
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
                        <h3>계약요청
                        	<a href="javascript:void(0);" class="note_q">
                            	<p class="note_a w180">기업고객으로 부터 계약요청<br>받은 정보를 보여드립니다.<span class="a_arrow"></span></p>
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
                        <h3>계약 프로젝트
                        	<a href="javascript:void(0);" class="note_q">
                            	<p class="note_a w180">기업고객과 계약된 <br>보여드립니다.<span class="a_arrow"></span></p>
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


<div class="pop_bg" id="pop_update_request" style="visibility:hidden;">
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
		            <li class="areaTab "><a href="javascript:void(0);">희망 근무지역</a></li>
		            
		            <li class="resumeTab "><a href="javascript:void(0);">이력서 등록/갱신</a></li>
		        </ul>
		    </div>

		    
		    <!-- 전문기술 -->
		    <div class="page" id="skillPage">
		    	<h3 class="name mb-5">보유하신 <span class="orange">전문 기술</span>을 선택해 주세요.</h3>
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
				<h3 class="name mb-5"><span class="orange">해시태그</span>로 당신을 알려주세요.</h3>
		    	<p class="small">해시태그로 나의 강점이나 선호하는 프로젝트를 알려주세요.<br/>
	기업이 당신을 쉽게 찾고 많은 기업의 관심을 받게 되실 거예요.<br/>
	(예. #단기선호 #PL/PM전문 #해외출장경험자)</p>
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
		    	<h3 class="name mb-5"><span class="orange">희망 근무지역</span>을 선택해 주세요.</h3>
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
				<h3 class="name mb-5"><span class="orange">이력서 파일</span>을 등록해 주세요.</h3>
		    	<p class="small">파일을 올려주시면 프리몬에서 프로필을 완성해드립니다.</p>
		    	<div class="pop_input date over_hidden">
		    		<div class="file_btn cf">
	                    <form id="registForm" name="registForm" enctype="multipart/form-data" style="display:;">
    	                    <input type="file" id="file" name="file" class="hidden" accept="application/pdf, application/msword, application/vnd.openxmlformats-officedocument.wordprocessingml.document, application/x-tika-msoffice, application/vnd.ms-powerpoint, application/vnd.openxmlformats-officedocument.presentationml.slideshow, application/vnd.openxmlformats-officedocument.presentationml.presentation, application/vnd.ms-excel, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, .hwp" onchange="fillFile()" />
	                        <button name="virtu_btn" class="btn b_m" onclick="clickFile(); return false;">파일선택</button>
	                        <input type="text" name="virtu_text" readonly="readonly"/>
	                        <button type="submit" id="btn" class="btn b_m b_red" style="cursor:pointer;">등록</button>
	                    </form>
	                </div>
		    	</div>
		    	<em class="f_note">공개 선택 시, 지원한 프로젝트에서 기업이 해당 파일을 다운로드할 수 있습니다.</em>
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

<script id="myContractListTemplate" type="text/x-mustache">
{{#projectList}}
    <div class="card cf {{#isClosed}}closed{{/isClosed}}">
        <div class="pro_info">
                <h4><a href="javascript:void(0);" data-action="applicantDetail" data-id="{{projIdx}}" data-app="{{applicntidx}}" data-dv="3">{{customer}}</a></h4>
                <h3 class="ellipsis">
                    <a href="javascript:void(0);" data-action="applicantDetail" data-id="{{projIdx}}" data-app="{{applicntidx}}" data-dv="3"><span class="add_info org first contract">계약</span>{{projNm}}</a>
					<span style="font-size:13px; color:#898989; padding-left:10px;">{{projStrtDt}} ~ {{projCloseDt}}</span>
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
<tr>
</script>
<script id="memberJobListTemplate" type="text/x-mustache">
{{#jobList}}
    <th class="jobselect" data-value="{{cdVal}}" style="cursor:pointer;">{{cdValNm}}</th>
{{/jobList}}
</script>
<script id="memberSkillListTemplate" type="text/x-mustache">
    <td>
        <ul>
        {{#jobList}}
            <li class="skillSelect" id="skillSelectList_{{cdVal}}" data-id="{{cdVal}}" data-value="{{cdValNm}}" style="cursor:pointer;">{{cdValNm}}</li>
        {{/jobList}}
        </ul>
    </td>
</script>
<script id="memberJobEndTemplate" type="text/x-mustache">
</tr>
</script>
<script id="memberAreaStrartTemplate" type="text/x-mustache">
<tr>
</script>
<script id="memberAreaListTemplate" type="text/x-mustache">
{{#areaList}}
    <th class="areaSelect {{#index}}active{{/index}}" data-id="{{cdVal}}" data-value="{{cdValNm}}" style="cursor:pointer;">{{cdValNm}}</th>
{{/areaList}}
</script>
<script id="memberArea2ListTemplate" type="text/x-mustache">
    <td>
        <ul>
        {{#areaList}}
            <li class="area2Select" id="areaSelectList_{{cdVal}}" data-id="{{cdVal}}" data-value="{{cdValNm}}"  data-uppervalue="{{workUpperAddr}}" data-upperId="{{upperCdVal}}" style="cursor:pointer;">{{cdValNm}}</li>
        {{/areaList}}
        </ul>
    </td>
</script>
<script id="memberAreaEndTemplate" type="text/x-mustache">
</tr>
</script>
<script id="resumeFileListTemplate" type="text/x-mustache">
{{#data}}
<tr>
    <td><a href="/resume/resumeDownload?fno={{crrIdx}}" class="ellipsis">{{fileName}}</a></td>
    <td>
        <div class="no_gap">
            {{#publicYn}}
            <button id="resumeFileUpdate" data-value="N" data-attmidx="{{attmIdx}}" data-userid="{{userId}}" class="btn b_xs b_red">공개</button>
            {{/publicYn}}
            {{^publicYn}}
            <button id="resumeFileUpdate" data-value="Y" data-attmidx="{{attmIdx}}" data-userid="{{userId}}" class="btn b_xs b_gray">비공개</button>
            {{/publicYn}}
            <button id="resumeFileDelete" data-attmidx="{{attmIdx}}" data-userid="{{userId}}" class="btn b_xs">삭제</button>
        </div>
     </td>
</tr>
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
        <a href="#none" class="close">닫기</a>
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

	

    		
<div id="footer">
	<div class="footer_in box cf">
        <section>
	       <h3>주식회사 인사이트온</h3>
	       <ul class="over_info cf">
                <li>대표 : 박승래</li>
                <li>사업자등록번호 : 522-88-00100</li>
                <li>상표등록 제 40-1402651호</li>
                <li>특허 제 10-2007018호</li>
                <li class="col-12">디자인특허 제 30-2019-0048098호, 제 30-2019-0048099호</li>
            </ul>
            <ul class="over_menu cf">
                <li><a href="/home/freemonIndividualTerms">회원이용약관</a></li>
                <li><a href="/home/freemonIndividualPrivacy">개인정보보호방침</a></li>
                <li><a href="https://m.freemon.co.kr" class="link_mobile" style="display:;">모바일버전</a></li>
                <li>© InsightOn Corp.</li>
            </ul>
	   </section>
	   <section>
	        <h3>고객센터</h3>
	        <p class="f_tel eng"><a href="tel:18992951">1899-2951</a></p>
	        <p class="operate">평일 09:00 ~ 18:00 / 주말·공휴일 휴무</p>
	        <div class="f_btn">
                <a href="/home/freemonService" target="_blank">서비스소개</a>
	            <a href="/customer/noticeSearch">자주묻는질문</a>
	            <a href="/customer/questionRegistForm">문의하기</a>
	        </div>
	    </section>
	    <section>
	       <h3>앱 다운로드</h3>
	       <div class="app_btn cf">
	            <a href="https://play.google.com/store/apps/details?id=kr.insighton.freemonservice" target="_blank" class="play"><em>구글플레이</em></a>
	            <a href="https://itunes.apple.com/app/id1472330588" target="_blank" class="store"><em>앱스토어</em></a>
	        </div>
	    </section>
    </div>
</div>
</body>
</html>