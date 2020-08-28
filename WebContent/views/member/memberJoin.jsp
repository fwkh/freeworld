<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Google Tag Manager -->
	<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
	new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
	j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
	'../../www.googletagmanager.com/gtm5445.html?id='+i+dl;f.parentNode.insertBefore(j,f);
	})(window,document,'script','dataLayer','GTM-MF7LK3J');</script>
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
    <title>프리몬 - SI 전문 아웃소싱</title>
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

	<link rel="stylesheet" type="text/css" href="../resources/css/defaulta9af.css?version=4.3">
	<link rel="stylesheet" type="text/css" href="../resources/css/jquery-ui.mina751.css?version=2.0">
	<link rel="stylesheet" type="text/css" href="../resources/css/membercd4e.css?version=4.1">
	<link rel="stylesheet" type="text/css" href="../resources/css/new6d33.css?version=4.8">
	<link rel="stylesheet" type="text/css" id="mobile" href="../resources/css/web_hand.css">
	<link rel="stylesheet" type="text/css" href="../resources/css/career-ui.mina751.css?version=2.0" />
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
      #signup_wrapper{
          margin: auto;
          /* border: 1px solid black; */
          height: 650px;
          width: 60%;
          padding: 30px;
          
        
      }


      #input_id{
          background: cornflowerblue;
          height: 35px;
      }
      #id_wrapper{
          width: 50%;
          height: 500px;
          /* background:yellow; */
          display: inline-block;
          position: relative;
          top: 60px;
          left: 100px;
      }
      #id_wrapper2{
          position: relative;
          width: 50%;
          height: 500px;
          left: 100px;
          top: 60px;
          /* background:yellow; */
          float: right;
      }
      #signup{
          position: relative;
          top: 25px;
          font-size: 45px;
      }
      #input_pass{
        background: cornflowerblue;
        width: 300px;
        height: 35px;
      }

      #yy{
          background:cornflowerblue ;
          height: 35px;
          width: 75px;
      }

      #mm{
        background:cornflowerblue ;
          height: 35px;
          width: 75px;
      }
      #dd{
        background:cornflowerblue ;
          height: 35px;
          width: 75px;
      }
      #sector{
        background:cornflowerblue ;
          height: 35px;
          width: 75px;
      }
      #sector_ch{
        background:cornflowerblue ;
          height: 35px;
          width: 100px;
      }
      #tech1{
        background:cornflowerblue ;
          height: 35px;
          width: 75px;
      }
      #tech1_year{
        background:cornflowerblue ;
          height: 35px;
          width: 100px;
      }
      #tech2{
        background:cornflowerblue ;
          height: 35px;
          width: 75px;
      }
      #tech2_year{
        background:cornflowerblue ;
          height: 35px;
          width: 100px;
      }
      #tel1{
        background:cornflowerblue ;
          height: 35px;
          width: 75px;
      }
      #tel2{
        background:cornflowerblue ;
          height: 35px;
          width: 75px;
          text-align: center;
      }
      #tel3{
        background:cornflowerblue ;
          height: 35px;
          width: 75px;
          text-align: center;
      }
      #date{
        background:cornflowerblue ;
          height: 35px;
          width: 150px;
          text-align: center;
         
      }
      #complete{
          border: 2px solid silver;
          width: 170px;
          height: 50px;
          background: lightskyblue;
          text-align: center;
          position: relative;
          top: 40px;
          left: 80px;

      }
      #complete>a{
          position: relative;
          top: 30%;
          font-size: 30px;
          /* text-align: center; */
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
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../common/header.jsp" %>

<!-- Google Tag Manager (noscript) -->
	<noscript><iframe src="http://www.googletagmanager.com/ns.html?id=GTM-MF7LK3J"
	height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
	<!-- End Google Tag Manager (noscript) -->

	<div class="load_box" style="display:none;"><div class="load_img"><img src="../resources/images/common/loading.gif" alt="loading"/></div></div>



		

		
<script type="text/javascript" src="../resources/freemon/login/freemonLogin069b.js?version=1.1"></script>

<script type="text/javascript">
	$(function() {
		freemon.invoker.invoke("freemonLogin");
		
		$('.login_box #login_tab > ul > li').bind("click",function(){
			$(this).children("a").removeAttr('href');
			if($(this).attr("id") == 'tab_con'){
				
			}else{
				$('.login_box #login_tab > ul').children("li").removeClass("active");
				$(this).addClass("active");
				$('.login_box .tab_con').hide();
				$('.login_box #con_'+$(this).attr("id")).show();
			}
		});
		$('.btn_person').bind("click",function(){
			$(this).children("a").removeAttr('href');
			$('.login_box #login_tab > ul').children("li").removeClass("active");
			$('.login_box #tab1').addClass("active");
			$('.login_box .tab_con').hide();
			$('.login_box #con_tab1').show();
		});
		$('.btn_company').bind("click",function(){
			$(this).children("a").removeAttr('href');
			$('.login_box #login_tab > ul').children("li").removeClass("active");
			$('.login_box #tab2').addClass("active");
			$('.login_box .tab_con').hide();
			$('.login_box #con_tab2').show();
		});
		
		$('.idfind_box #login_tab > ul > li').bind("click",function(){
			$(this).children("a").removeAttr('href');
			if($(this).attr("id") == 'tab_con'){
				
			}else{
				$('.idfind_box #login_tab > ul').children("li").removeClass("active");
				$(this).addClass("active");
				$('.idfind_box .tab_con').hide();
				$('.idfind_box #con_'+$(this).attr("id")).show();
			}
		});
	});
</script>

<!--Contents-->
<div id="container">
    <div id="signup_wrapper">
        <h1 style="text-align: center;" id="signup">회원가입</h1>
        <div id="id_wrapper">
        <h3 style="margin: 10px;">*아이디(이메일 주소)</h3>
        <input type="text" id="eamil">&nbsp;
        <button type="submit" id="id_check">중복확인</button>
        <h3 style="margin: 10px;">*비밀번호</h3>
        <input type="password" id="userPwd" placeholder="비밀번호(숫자,영문,특수문자 조합 최소 8자)">&nbsp;
        <h3 style="margin: 10px;">*생년월일</h3>
        <input type="text" id="birth" placeholder="년(4자)" aria-label="년(4자)" class="int" maxlength="4">
        &nbsp;
        <select id="mm" class="sel" aria-label="월">
            <option value="">월</option>
                               <option value="01">
                                1
                            </option>
                               <option value="02">
                                2
                            </option>
                               <option value="03">
                                3
                            </option>
                               <option value="04">
                                4
                            </option>
                               <option value="05">
                                5
                            </option>
                               <option value="06">
                                6
                            </option>
                               <option value="07">
                                7
                            </option>
                               <option value="08">
                                8
                            </option>
                               <option value="09">
                                9
                            </option>
                               <option value="10">
                                10
                            </option>
                               <option value="11">
                                11
                            </option>
                               <option value="12">
                                12
                            </option>
        </select>
        &nbsp;
        <input type="text" id="dd" placeholder="일" aria-label="일" class="int" maxlength="2">
        <h3 style="margin: 10px;">*희망지역</h3>
        <select id="sector">
            <option value="">시</option>
            <option value="seoul">
            서울
            </option>

        </select>
        &nbsp;&nbsp;
        <select id="sector_ch">
            <option value="">구,동</option>
                            <option value="location">
                                강북구,미아동
                            </option>
        </select>
        <h3 style="margin: 10px;">*보유기술</h3>
        <select id="tech1">
            <option value="">1순위</option>
            <option value="JAVA">JAVA</option>
            <option value="SQL">SQL</option>
            <option value="CSS">CSS</option>
        </select>
        &nbsp;
        <select id="tech1_year">
            <option value="">경력(년차)</option>
            <option value="1">1년차</option>
            <option value="2">2년차</option>
            <option value="3">3년차</option>
        </select>
        <br><br>
        <select id="tech2">
            <option value="">2순위</option>
            <option value="JAVA">JAVA</option>
            <option value="SQL">SQL</option>
            <option value="CSS">CSS</option>
        </select>
        &nbsp;
        <select id="tech2_year">
            <option value="">경력(년차)</option>
            <option value="1">1년차</option>
            <option value="2">2년차</option>
            <option value="3">3년차</option>
        </select>



        </div>
        <div id="id_wrapper2">
            <h3 style="margin: 10px;">*이름</h3>
            <input type="text" id="input_id">&nbsp;
            <h3 style="margin: 10px;">*비밀번호</h3>
            <input type="password" id="input_pass" placeholder="비밀번호 확인">&nbsp;
            <h3 style="margin: 10px;">*전화번호</h3>
            <select name="tel1" id="tel1"onchange="">
                <option value="010">010</option>
                <option value="011">011</option>
                <option value="016">016</option>
                <option value="019">019</option>
            </select>-
            <input type="text" name="tel2" id="tel2" size="3" maxlength="4">-
            <input type="text" name="tel3" id="tel3" size="3" maxlength="4">
            <h3 style="margin: 10px;">*거주 지역</h3>
            <select id="sector">
                <option value="">시</option>
                <option value="seoul">
                서울
                </option>
            </select>
            &nbsp;&nbsp;
            <select id="sector_ch">
                <option value="">구,동</option>
                <option value="location">
                강북구,미아동
                </option>
            </select>
            <h3 style="margin: 10px;">*투입가능한 날짜</h3>
            <input type="date" id="date">
            <br>
            <div id="complete">
                <a href="">가입완료</a>
            </div>



        
    
            </div>
    
        
        
    </div>
	
        </div>
    </script>
    		
</body>
<%@ include file="../common/footer.jsp" %>
</html>