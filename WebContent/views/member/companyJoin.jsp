<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    










<!DOCTYPE html>
<html lang="ko">

<head>
	<%@ include file="../common/header.jsp" %>
	
    <!-- 네비게이션바 -->
	<style type="text/css">	  
	  #f_management{display:none;}
	  #p_management{display:none;}
	  #profile{display:none;}
	  #suggestion{display:none;}
	</style>

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
      
      #com_wrapper{
        
          margin: auto;
          /* background: blue; */
          /* border: 1px solid black; */
          width: 50%;
         
      }
      #com_sign{
          text-align: center;
          position: relative;
          top: 20px;
      }
	  
	  /* .scrollOff{position:fixed;overflow:hidden;height:100%;width:100%;} */
	</style>

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
    <h1 id="com_sign">기업 회원가입</h1>
    <div id="com_wrapper">
        <div class="join_in" id="joinFirstClass">
            <!-- 필수입력항목 -->
            <div class="tab_con">
            	<form class="login_form" id="registForm" name="registForm" action="" novalidate="novalidate">
                <div class="input_list p-0 mb-20">
                    <ul class="input_list_in cf">
                    	<li class="col-6 xs-col-12 pr-16 xs-pr-0">
                            <div class="input">
                                <label for="bzRegNo">사업자번호<span>*</span></label>
                                <input type="text" id="bzRegNo" name="bzRegNo" value="" placeholder="&quot;-&quot;없이 입력바랍니다.">
                            </div>
                        </li>
                        <li class="col-6 xs-col-12 pl-16 xs-pl-0">
                            <div class="input">
                                <label for="compNm">회사명<span>*</span></label>
                                <input type="text" id="compNm" name="compNm" placeholder="&quot;(주)&quot;없이 입력바랍니다.">
                            </div>
                        </li>
                        <li>
                            <div class="input">
                                <label for="mgrId">아이디(이메일주소)<span>*</span></label>
                                <input type="text" id="mgrId" name="mgrId" placeholder="이메일 형식에 맞춰 입력바랍니다.">
                            </div>
                        </li>
                        <li class="col-6 xs-col-12 pr-16 xs-pr-0">
                            <div class="input">
                                <label for="pwd">비밀번호<span>*</span></label>
                                <input type="password" id="pwd" name="pwd" placeholder="최소 8자이상으로 문자,숫자,특수문자를 포함하여 입력바랍니다.">
                            </div>
                        </li>
                        <li class="col-6 xs-col-12 pl-16 xs-pl-0">
                            <div class="input">
                                <label for="pwdCheck">비밀번호 확인<span>*</span></label>
                                <input type="password" id="pwdCheck" name="pwdCheck" placeholder="비밀번호를 한번더 입력해주세요.">
                            </div>
                        </li>
                        <li class="col-6 xs-col-12 pr-16 xs-pr-0">
                            <div class="input">
                                <label for="mgrNm">담당자이름<span>*</span></label>
                                <input type="text" id="mgrNm" name="mgrNm" placeholder="담당자 이름은 어떻게 되나요?" style="ime-mode:active !important;">
                            </div>
                        </li>
                        <li class="col-6 xs-col-12 pl-16 xs-pl-0">
                            <div class="input">
                                <label for="phone">담당자 휴대폰번호<span>*</span></label>
                                <input type="text" id="phone" name="phone" placeholder="&quot;-&quot;없이 입력바랍니다.">
                            </div>
                        </li>
                    </ul>
                </div>
                <!-- 동의 -->
                <div class="join_agree">
                    <div class="join_agree_top">
                        <h3>약관동의</h3>
                    </div>
                    <div class="join_agree_body">
                        <div class="agree_list">
                            <ul>
                            	<li>
                            		<div class="join_check">
			                            <label class="agrChk all" for="checkAll">
			                                <input type="checkbox" id="checkAll" name="checkAll">
			                                <i></i>
			                            </label>
			                        </div>
			                        <a href="#none" class="joinAgreeList">전체동의</a>
                            	</li>
								<li class="active has-sub">
									<div class="join_check">
                                        <label class="agrChk" for="argCheck01">
                                            <input type="checkbox" id="argCheck01" name="argCheck01" class="argChecked" value="Y"><i></i>
                                        </label>
                                    </div>
									<a href="#none" class="joinAgreeList">회원약관(필수)</a>
									<a href="/home/freemonIndividualTerms" target="_blank" class="btn_open">전문보기</a>
                               </li>
                               <li class="active has-sub">
                                    <div class="join_check">
                                        <label class="agrChk" for="argCheck02">
                                            <input type="checkbox" id="argCheck02" name="argCheck02" class="argChecked" value="Y"><i></i>
                                        </label>
                                    </div>
                                    <a href="#none" class="joinAgreeList">개인정보 수집 및 이용동의(필수)</a>
                                    <a href="/home/freemonIndividualPrivacy" target="_blank" class="btn_open">전문보기</a>
                               </li>
                               <li class="active has-sub">
                                    <div class="join_check">
                                        <label class="agrChk" for="argCheck03">
                                            <input type="checkbox" id="argCheck03" name="argCheck03" class="argChecked" value="Y"><i></i>
                                        </label>
                                    </div>
                                    <a href="#none" class="joinAgreeList">마케팅/홍보의 수집 및 이용동의(선택)</a>
                               </li>
                               <li class="has-sub agree_detail">
                               	<h4>이벤트와 관련하여, 본인의 개인정보를 프리몬에서 수집 및 이용하는 것에 대해 동의합니다.</h4>
                               	<p>① 수집 · 이용 목적</p>
              					<p style="padding-left:20px;">- 이벤트 당첨 경품 발송</p>
              					<p>② 수집 항목</p>
              					<p style="padding-left:20px;">- 이름, 휴대전화번호</p>
              					<p>③ 보유 기간</p>
              					<p style="padding-left:20px;">- 이벤트 종료 후 VOC 목적으로 한 달 후 까지 보관 후 파기</p>
                               </li>
                            </ul>
                        </div>
                    </div>
                </div>
                
                <!-- 버튼 -->
                <div class="btn_box xs-mt-20">
                	<button type="submit" id="btn" class="btn_mem_join">저 장</button>
                </div>
            	</form>
            </div>
        </div>
        
    </div>

        </div>


    <%@ include file="../common/footer.jsp" %>		

</body>

<!-- Mirrored from www.freemon.co.kr/login/freemonLogin by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 27 Jul 2020 06:59:36 GMT -->
</html>