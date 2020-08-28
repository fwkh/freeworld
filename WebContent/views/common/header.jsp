<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>freeWorld</title>
<link rel="stylesheet" type="text/css" href="../../resources/css/defaulta9af.css?version=4.3">
	<link rel="stylesheet" type="text/css" href="../../resources/css/jquery-ui.mina751.css?version=2.0">
	<link rel="stylesheet" type="text/css" href="../../resources/css/membercd4e.css?version=4.1">
	<link rel="stylesheet" type="text/css" href="../../resources/css/new6d33.css?version=4.8">
	<link rel="stylesheet" type="text/css" id="mobile" href="../../resources/css/web_hand.css">
	<link rel="stylesheet" type="text/css" href="../../resources/css/career-ui.mina751.css?version=2.0" />
	<link rel="stylesheet" type="text/css" href="../../resources/css/ui.jqgrid.css" />
	<link rel="shortcut icon" href="../../resources/images/new/favicon.ico"/>
</head>
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
    <script type="text/javascript" src="../../resources/scripts/jquery-3.3.1.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="../../resources/scripts/jquery.flexslider.js"></script>
    <script type="text/javascript" src="../../resources/scripts/site_ui.js"></script>
	<script type="text/javascript" src="../../resources/js/jquery.easing.1.3.js"></script>
    <!--Calendar-->
    <script type="text/javascript" src="../../resources/scripts/calendar/pignose.calendar.full.js"></script>
	<script type="text/javascript" src="../../resources/js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="../../resources/js/jquery.ba-hashchange.min.js"></script>
	<script type="text/javascript" src="../../resources/js/jquery.json-2.3.js"></script>
	<script type="text/javascript" src="../../resources/js/jquery.validate.min.js"></script>
	<script type="text/javascript" src="../../resources/js/jquery.history.js"></script>
	<!-- Jqgrid -->
	<script type="text/javascript" src="../../resources/js/grid.locale-kr.js"></script>
	<script type="text/javascript" src="../../resources/js/jquery.jqGrid.min.js"></script>
	<!-- //Jqgrid -->
	<script type="text/javascript" src="../../resources/js/jquery.marquee.min9a0d.js?version=1.0"></script>
	<script type="text/javascript" src="../../resources/js/mustache.js"></script>
	<script type="text/javascript" src="../../resources/js/jquery.cookie.js"></script>
	<script type="text/javascript" src="../../resources/i18n/commonMessages_ko.js"></script>
	<script type="text/javascript" src="../../resources/freemon/base64.js"></script>
	<script type="text/javascript" src="../../resources/freemon/sha256.js"></script>
	<script type="text/javascript" src="../../resources/freemon/nmask.js"></script>
	<script type="text/javascript" src="../../resources/freemon/freemonc599.js?version=3.3"></script>
	<script type="text/javascript" src="../../resources/js/gnb_common56b8.js?version=4.2"></script>
	<script type="text/javascript" src="../../resources/freemon/common/apply.js"></script>
	<script type="text/javascript" src="../../resources/freemon/common/freemonPopUp9667.js?version=1.2"></script>
	<script type="text/javascript" src="../../resources/freemon/common/input.js"></script>
	
	<script type="text/javascript" src="../developers.kakao.com/sdk/js/kakao.min.js"></script>
	
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
				var url = "resources/css/web_hand.css";
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
	</script>
<body>
<!-- Google Tag Manager (noscript) -->
	<noscript><iframe src="http://www.googletagmanager.com/ns.html?id=GTM-MF7LK3J"
	height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
	<!-- End Google Tag Manager (noscript) -->
	<div class="load_box" style="display:none;"><div class="load_img"><img src="resources/images/common/loading.gif" alt="loading"/></div></div>
<!--Index Scripts-->
<link href="resources/css/main56b8.css?version=4.2" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../../resources/freemon/common/jquery.mousewheel.js"></script>
<script type="text/javascript" src="../../resources/freemon/common/slick.min.js"></script>
<script type="text/javascript" src="../../resources/freemon/common/main069b.js?version=1.1"></script>
<!--  <script type="text/javascript" src="resources/freemon/home/freemonHome3851.js?version=1.12"></script> -- 이곳에서 에러 발생 -->
<script type="text/javascript">
	$(function() {
		freemon.invoker.invoke("freemonHome");
	});
</script>
<!-- 숫자카운트 -->
<script type="text/javascript" src="../../resources/freemon/home/counter069b.js?version=1.1"></script>
<!--//Index Scripts-->
<div id="wrap" >
	<div id="modal-wrap" class="modal-wrap"></div>
	
	<!-- 상단 -->
<div id="header">
	<div class="header_top">
	    <div class="box">
	        <!-- 활동내역 -->
	    	<!-- <div class="flow_text" style="padding-top:10px;">
	    		<div class="flow_text_in" style="border:0px solid red; line-height:30px; height:22px;">
	    						<p class="cf"><span class="tit ellipsis">오OO님의 이력서가 업데이트 되었습니다.</span></p>
	    						<p class="cf"><span class="tit ellipsis">안OO님이 프로젝트‘CMS 페이지 제작’에 제안 되었습니다.</span></p>
	    						<p class="cf"><span class="tit ellipsis">한OO님이 프로젝트‘CMS 페이지 제작’에 제안 되었습니다.</span></p>
	    						<p class="cf"><span class="tit ellipsis">최OO님의 이력서가 업데이트 되었습니다.</span></p>
	    						<p class="cf"><span class="tit ellipsis">안OO님의 이력서가 업데이트 되었습니다.</span></p>
	    						<p class="cf"><span class="tit ellipsis">프로젝트‘Unifier(오라클 제품) 설치 및 수행’이 신규로 추가되었습니다.</span></p>
	    						<p class="cf"><span class="tit ellipsis">서OO님이 프로젝트‘CMS 페이지 제작’에 제안 되었습니다.</span></p>
	    						<p class="cf"><span class="tit ellipsis">여OO님이 프로젝트‘CMS 페이지 제작’에 제안 되었습니다.</span></p>
	    						<p class="cf"><span class="tit ellipsis">김OO님이 프로젝트‘CMS 페이지 제작’에 지원 되었습니다.</span></p>
	    						<p class="cf"><span class="tit ellipsis">이OO님이 프로젝트‘CMS 페이지 제작’에 제안 되었습니다.</span></p>
	    		</div>
	    	</div> -->
	        <div class="top_menu w_top_menu">
	            <ul class="cf">
	                <li class="login"><a href="../member/loginForm.jsp">로그인</a></li>
	                <li><a href="../www.freemon.co.kr/login/freemonLoginbce7.html">회원가입</a></li>
	                <li class="coustomer"><a href="../customer/noticeSearch.html"><span class="arrow"></span></a>
	                	<ul class="top_depth2" style="display:none;">
	                    	<p class="top_arrow"></p>
	                    	<li><a href="../customer/noticeSearch.html">자주묻는질문</a></li>
	                        <li><a href="../customer/questionRegistForm.html">문의하기</a></li>
	                    </ul>
	                </li>
	                <li class="blog"><a href="http://blog.freemon.co.kr/" target="_blank">블로그</a></li>
	            </ul>
	        </div>
	    </div>
	</div>
    <div class="header_body">
    	<div class="box">
           <h1 class="logo"><a href="../../index.jsp">프리월드</a></h1>
            <div id="gnb">
                <nav>
                    <ul class ="gnb_in cf">
						<li class="menu_about gnb_depth1 ">
                        	<a href="talent/talentSearch.html" class="gnb_depTxt" id="f_search"><em>프리랜서 검색</em></a>
                        </li>
                        <li class="menu_about gnb_depth1 ">
                        	<a href="../../views/project/projectSearch.jsp" class="gnb_depTxt" id="p_search"><em>프로젝트 검색</em></a>
                        </li>
                        <li class="menu_about gnb_depth1 ">
                        	<a href="../www.freemon.co.kr/project/projectMap.html" class="gnb_depTxt" id="p_map"><em>프로젝트 맵</em></a>
                        </li>
                        <li class="menu_about gnb_depth1 ">
                        	<a href="../www.freemon.co.kr/home/noticeSearch.html" class="gnb_depTxt" id="notice"><em>공지사항</em></a>
                        </li>
                        <li class="menu_about gnb_depth1 ">
                        	<a href="/document/documentSelect" class="gnb_depTxt" id="f_management"><em>프리랜서 관리</em></a>
                        </li>
                        <li class="menu_about gnb_depth1 ">
                        	<a href="/document/documentSelect" class="gnb_depTxt" id="p_management"><em>프로젝트 관리</em></a>
                        </li>
                        <li class="menu_about gnb_depth1 ">
                        	<a href="/document/documentSelect" class="gnb_depTxt" id="profile"><em>프로필 관리</em></a>
                        </li>
                        <li class="menu_about gnb_depth1 ">
                        	<a href="/document/documentSelect" class="gnb_depTxt" id="suggestion"><em>제안 및 지원 현황</em></a>
                        </li>
                        <li class="menu_about gnb_depth1">
                            <a href="../www.freemon.co.kr/customer/introduction.html" target="_blank" class="gnb_depTxt" id="service"><em>서비스소개</em></a>
                        </li>
                    </ul>
                </nav>
            </div>
		</div>
	</div>
</div>
	<!-- /상단 -->

</body>
</html>