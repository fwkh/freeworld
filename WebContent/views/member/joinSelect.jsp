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
	}); 
</script>
<!--Contents-->
<div id="container">
	<section class="member login">
    	<!-- 제목부분 -->
    	<h2>회원가입</h2>

       	<!-- 개인 -->
       	<div class="col-6 pr-15">
			<div class="white_box center">
				<h3 class="name">프리랜서</h3>
				<a href="memberJoin.jsp" class="b_login b_kakao mt-30 mb-20"><i></i>프리월드계정으로 회원가입</a>
			</div>
                   
            <div class="benefit free">
                <h3>프리랜서를 위한 프리월드의 서비스</h3>
                <ul class="cf">
                    <li>상주 프로젝트<br/>정보 제공</li>
                    <li>기업고객이<br/>제안하는 프로젝트</li>
                    <li>나에게<br/>맞는 프로젝트</li>
                    <li>파일 등록으로<br/>프로필 완성</li>
                    <li>카카오톡으로<br/>일정 안내</li>
                </ul>
            </div>
		</div>
		
		<!-- 기업 -->
       	<div class="col-6 pl-15">
			<div class="white_box center">
				<h3 class="name">기업고객</h3>
				<a href="companyJoin.jsp" class="btn_login mt-30 mb-20">기업고객 회원가입</a>
			</div>
                   
            <div class="benefit company">
                <h3>기업고객 위한 프리월드의 서비스</h3>
                <ul class="cf">
                    <li>투입가능한<br/>프리랜서 정보</li>
                    <li>실력있고 경험많은<br/>프리랜서 정보</li>
                    <li>프로젝트<br/>지원현황</li>
                    <li>프로젝트에 맞는<br/>프리랜서 정보</li>
                    <li>손쉬운<br/> 프로젝트 관리</li>
                </ul>
            </div>
        </div>
    </section>
</div>
<!--//Contents-->
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

	<%@ include file="../common/footer.jsp" %>
	
</body>

<!-- Mirrored from www.freemon.co.kr/account/joinSelect by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 27 Jul 2020 06:59:37 GMT -->
</html>