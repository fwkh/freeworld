<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    

<!DOCTYPE html>
<html lang="ko">

<!-- Mirrored from www.freemon.co.kr/login/freemonLogin by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 27 Jul 2020 06:59:35 GMT -->
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
	
	<style type="text/css">

      #email_sign{
          margin: auto;
          /* border: 1px solid black; */
          height: 550px;
          width: 50%;
          padding: 30px;
          
         

      }
      #email_font{
          position: relative;
          top: 30px;
          text-align: center;
      }
      #text_sign_wrapper{
          position: relative;
          left: 100px;
      }
      #text_email{
          border: 1px solid silver;
          background: lightskyblue;
          opacity: 40%;
          color: black;
      }

      #select_email{
          background: lightskyblue;
          opacity: 40%;
      }

      #input_button{
          background: lightskyblue;
          color: white;
          border:1px solid blue;
          border-radius: 10%;

      }

      #sign_complete{
          position: relative;
          top: 25px;
          left: 25%;
          text-align: center;
          border: 2px solid silver;
          border-radius: 10px;
          width: 200px;
          height: 74px;
          background: lightskyblue;
      }
      #sign_complete>a{
          font-size: 35px;
          position: relative;
          top: 25px;
          color: white;
          
         
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
    <div id="email_sign">
        <h2 id="email_font" style="font-size: 40px;">이메일 인증</h2>
        <br><br><br><br><br>
        <div id="text_sign_wrapper">
        <p>-가입을 위한 인증정보를 보내드리니 정확한 연락처를 입력해주세요.</p>
        <br>
        <p>-프로젝트 관련 및 프리랜서 채용에 필요한 정보와 서비스는 이메일 인증 후 이용이 가능합니다.</p>
        <br>
        <p>-본인인증은 하나의 아이디만 가능하며 회원가입 후 마이프로필에서 이용 하실 수 있습니다.</p>
        <hr style="border:1px color= silver;" width="75%">
        <br>
        <label>이메일</label>&nbsp;&nbsp;
        <input type="text" id="text_email" size="18">
        <label>@</label>
        <select id="select_email">
            <option value="naver">@naver.com</option>
            <option value="hanmail">@hanmail.net</option>
            <option value="gmail">@gmail.com</option>
            <option value="nate">@nate.com</option>
            <option value="dreamwiz">@dreamwiz.com</option>
            <option value="empas">@empas.com</option>
            <option value="etc">기타</option>
        </select>
        &nbsp;&nbsp;
        <button type="submit" id="input_button">인증메일 받기</button>
        <br><br>
        <hr style="border:1px color= silver;" width="75%">
        <div id="sign_complete">
            <a href="">인증완료</a>
        </div>

      	</div>

    </div>
	
</div>

      <%@ include file="../common/footer.jsp" %>		

</body>

<!-- Mirrored from www.freemon.co.kr/login/freemonLogin by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 27 Jul 2020 06:59:36 GMT -->
</html>