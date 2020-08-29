<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>

    <title>프리몬 - SI 전문 아웃소싱</title>
	<%@ include file="../common/header.jsp" %>
	    <!-- 네비게이션바 -->
	<style type="text/css">	  
	  #f_management{display:none;}
	  #p_management{display:none;}
	  #profile{display:none;}
	  #suggestion{display:none;}
	</style>
<!-- 페이지 적용 CSS -->
<link rel="stylesheet" type="text/css"
	href="../../resources/css/defaulta9af.css">
<link rel="stylesheet" type="text/css"
	href="../../resources/css/jquery-ui.mina751.css">
<link rel="stylesheet" type="text/css"
	href="../../resources/css/membercd4e.css">
<link rel="stylesheet" type="text/css"
	href="../../resources/css/new6d33.css">
<link rel="stylesheet" type="text/css" id="mobile"
	href="../../resources/css/web_hand.css">
<link rel="stylesheet" type="text/css"
	href="../../resources/css/career-ui.mina751.css" />
<link rel="stylesheet" type="text/css"
	href="../../resources/css/ui.jqgrid.css" />
<link rel="shortcut icon" href="../../resources/images/new/favicon.ico" />
	
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

	<script type="text/javascript">
		var frameworkProperties = {
			context: '',
			locale: 'ko',
			defaultLang: 'ko',
			kakaoAppKey: 'a8bf256e33657332f212fd5847dbd8c5',
		};
	</script>

</head>
<body>
	<!-- Google Tag Manager (noscript) -->
	

	        <div class="top_menu w_top_menu">
	            <ul class="cf">
	            	
	                
	                
	                <li>한진선님</li>
	                <li class="login"><a href="/login/logout">로그아웃</a></li>
	                <li><a href="/mypage/myFreemon">마이프리몬<span class="arrow"></span></a>
	                	<ul class="top_depth2" style="display:none;">
	                    	<p class="top_arrow"></p>
	                    	<li><a href="/resume/resumeSearch">프로필 관리</a></li>
	                    	<!-- <li><a href="/document/documentSelect">서류신청</a></li> -->
	                    	<li><a href="#none" class="common-open_popup" data-div="alamn" data-user-div="freelancer">알림설정</a></li>
	                    </ul>
	                </li>
					
	                <li><a href="/customer/noticeSearch">고객센터<span class="arrow"></span></a>
	                	<ul class="top_depth2" style="display:none;">
	                    	<p class="top_arrow"></p>
	                    	<li><a href="/customer/noticeSearch">자주묻는질문</a></li>
	                        <li><a href="/customer/questionRegistForm">문의하기</a></li>
	                    </ul>
	                </li>
	                <li class="blog"><a href="http://blog.freemon.co.kr" target="_blank">블로그</a></li>
	            </ul>
	        </div>
	    </div>
	</div>
    <div class="header_body">
    	<div class="box">
           <h1 class="logo"><a href="/">프리몬</a></h1>
            <div id="gnb">
                <nav>
                    <ul class ="gnb_in cf">
                    	
						
						<li class="menu_about gnb_depth1 ">
                        	<a href="/project/projectSearch" class="gnb_depTxt"><em>프로젝트 검색</em></a>
                        </li>
						<li class="menu_about gnb_depth1 ">
                        	<a href="/project/projectMap" class="gnb_depTxt"><em>프로젝트 맵</em></a>
                        </li>
                        <li class="menu_about gnb_depth1 active">
                        	<a href="/applicant/talentApplicantSearch" class="gnb_depTxt"><em>제안 및 지원 현황</em></a>
                        </li>
                       <!--  <li class="menu_about gnb_depth1 ">
                        	<a href="/home/freemonSupport" class="gnb_depTxt"><em>출장지원</em></a> 
                        </li>-->
                        <li class="menu_about gnb_depth1 ">
                        	<a href="/resume/resumeSearch" class="gnb_depTxt"><em>프로필 관리</em></a>
                        </li>
						
						
                    </ul>
                </nav>
            </div>
		</div>
	</div>
</div>
		


		

<div id="container">
	<section class="project_in">
		<!-- 제목부분 -->
		<div class="pro_tit mb-0 no_line">
			<h2>제안 및 지원 현황</h2>
			<div class="search cf" style="display: none;">
				<div class="input_box sm-col-3 xs-col-5 cf">
					<input type="text" class="dateRangePicker col-10 xs-col-9"
						id="searchStrDate" name="searchStrDate"
						placeholder="프로젝트시작일"
						readonly="readonly" /> <a href="javascript:void(0);" id="freemonSearchDateBtn"
						class="btn_sche col-2 xs-col-3">달력</a>
				</div>
				<div class="input_box sm-col-7 xs-col-5">
					<input type="text" name="keyword" id="keyword" placeholder="예) 서울 java 홍길동" />
				</div>
				<a href="javascript:void(0);" class="btn_search sm-col-1" id="freemonSearchBtn">검색</a>
				<a href="javascript:void(0);" class="btn_search btn_reset sm-col-1"
					id="freemonReload">초기화</a>
			</div>
		</div>
		<div class="pop_bg" id="pop_prop" style="display: none;">
			<div class="pop">
				<div class="pop_header">
					<h3>다음에 지원하는 이유</h3>
					<a href="javascript:void(0);" class="close">닫기</a>
				</div>
				<div class="pop_body">
					<form id="propForm" name="propForm" action="#">
						<div class="apply_top">
							<select id="rejectList">
								<option></option>
							</select>
							<div id="joinPsblDtPage" class="member_input" style="display:none;">
                                <ul>
                                    <li class="horizon cf">
	                                    <label for="joinPsblDt">투입가능일자</label>
		                                <input type="text" class="dateRangePicker" id="joinPsblDt" value="" readonly="readonly" />
		                                <button class="btn b_s" id="changeDate">수정</button>
                                    </li>
                                </ul>
							</div>

							<!-- 버튼-->
							<div class="btn_pop_box">
								<button id="btnProp" class="btn_apply"
									data-action="proposeReject" onClick="return false;">확인</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		<!-- 팝업 지원취소하기 -->
        <div class="pop_bg" id="pop_applicant" style="display:none;">
            <div class="pop">
                <div class="pop_header">
                    <h3>지원취소하기</h3>
                    <a href="javascript:void(0);" class="close">닫기</a>
                </div>
                <div class="pop_body">
                    <div class="apply_top" style="line-height:20px;">
                        <span id="project_name"></span>
                        <br/>
                        <span style="color:#666;">지원일시</span> <span id="project_date">%{projRegDt}</span>
                    </div>
                    <div class="apply_con">
                        <textarea id="textarea" placeholder="지원취소시 안내 내용이 있을 경우 여기에 남기세요."></textarea>
                        <div class="btn_pop_box">
                            <button id="btnProp" class="btn_apply" data-action="applicantCancelRegist" onClick="return false;">지원취소하기</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
		<!-- 카운터 -->
        <div class="count_num count5">
            <ul class="cf">
                <li class="step1">
	                <a href="#none" data-value = "P">
	                    <span class="num">999+<em><i>999+</i></em></span>
	                    <span class="tit"><em>제안</em></span>
	                </a>
	            </li>
	            <li class="step2">
	                <a href="#none" data-value = "Y">
	                    <span class="num">5</span>
	                    <span class="tit"><em>지원</em></span>
	                </a>
	            </li>
	            <li class="step3">
	                <a href="#none" data-value = "I">
	                    <span class="num">5<em><i>5</i></em></span>
	                    <span class="tit"><em>면접진행</em></span>
	                </a>
	            </li>
	            <li class="step4">
	                <a href="#none" data-value = "R">
	                    <span class="num">5</span>
	                    <span class="tit"><em>계약요청</em></span>
	                </a>
	            </li>
	            <li class="step5">
	                <a href="#none" data-value = "N">
	                    <span class="num">5<em><i>999+</i></em></span>
	                    <span class="tit"><em>계약완료</em></span>
	                </a>
	            </li>
            </ul>
        </div>

        <div class="tab_menu cf">
			<ul class="cf">
			    <li class="active"><a href="javascript:void(0);" data-value = "P">제안</a></li>
			    <li><a href="javascript:void(0);" data-value = "Y">지원</a></li>
			    <li><a href="javascript:void(0);" data-value = "I">면접진행</a></li>
			    <li><a href="javascript:void(0);" data-value = "R">계약요청</a></li>
			    <li><a href="javascript:void(0);" data-value = "N">계약완료</a></li>
			</ul>
			
        </div>
        
    </section>
</div>

<%@ include file="../common/footer.jsp"%>

</body>
</html>