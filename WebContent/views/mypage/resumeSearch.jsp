<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<!-- Mirrored from www.freemon.co.kr/login/freemonLogin by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 27 Jul 2020 06:59:35 GMT -->
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->
<head>
	<!-- Google Tag Manager -->
	<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
	new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
	j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
	'../../www.googletagmanager.com/gtm5445.html?id='+i+dl;f.parentNode.insertBefore(j,f);
	})(window,document,'script','dataLayer','GTM-MF7LK3J');</script>
	<!-- End Google Tag Manager -->	

    <title>프리월드 - SI 전문 아웃소싱</title>


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
    
        <div class="load_box" style="display:none;">
            <div class="load_img">
                <img src="../resources/images/common/loading.gif" alt="loading"/>
            </div>
        </div>
        <link rel="stylesheet" type="text/css" href="../resources/css/resume.css">
    
    
<%@ include file="../common/header.jsp"%>



<script type="text/javascript" src="../resources/js/Chart.js"></script>
<script type="text/javascript" src="../resources/js/resumeSearch.js"></script>
<script type="text/javascript">
	$(function() {
	    var skills = [], areas = [];
		
		
		freemon.invoker.invoke("resumeSearch", "talent", {
		    'userId':'1444427072',
            'selectSkills': skills,
            'selectArea': areas,
            'korNm' : '아무개',
            'birthDay' : '1990',
            'genderCd' : '',
            'telNo' : '01011112222',
            'email' : 'test@test.com',
            'joinPsblDt' : '2020-12-09',
            'keyword' : '',
            'genderCd' : '',
            'hldSkill' : '',
            'workAreaNm' : ''
		});
	});

	function clickFile() {
		registForm.file.click();
	}
	function fillFile() {
		registForm.virtu_text.value = registForm.file.value;
	}
</script>
<div id="container">
	<section class="project_in">
        <h5 class="mb-20 ml-5">기본정보</h5>

        <div class="layer-2">
            <!-- 이력서 파일 -->
            <div class="card no_over p-20 cf">
                <div class="profile_big">
                    <div class="profile" style="background-image:url()">프로필사진</div>
                    <div class="btn_box no_gap mt-10 cf">
                        <a href="" data-action="profile" data-value="Y" class="btn b_xs b_red">보임</a>
                        <a href="" data-action="profile" data-value="N" class="btn b_xs ">숨김</a>
                    </div>
                </div>
                <!-- 기본정보 출력 -->
                <div class="free_con" id="freelancerShow">
                    <h3>아무개</h3>
                    <div class="gray_box mt-10">
	                    <p class="small"> 20세</p>
	                    <ul class="ul_detail no_line cf">
		                    <li><span class="tit">전화</span>01011112222</li>
		                    <li><span class="tit">이메일</span>test@test.com</li>
		                </ul>
	                </div>
	                <ul class="ul_detail no_line cf">
	                    <li><span class="tit">희망지역</span></li>
	                    <li><span class="tit">전문기술</span></li>
	                    <li><span class="tit">투입가능일</span>2020-12-09<span class="add_info org">999 일후</span></li>
	                </ul>
	                <div class="add_con cf mt-10">
			            <div class="hash hash_detail">
			                <ul class="cf">
			                   
			                </ul>
			            </div>
			        </div>
                    <!-- 프로필 미리보기 버튼 -->
			        <div class="btn_box left">
			            <a class="btn b_m b_red" href="/talent/openTalentDetail?fno=1444427072" target="_blank">프로필 미리보기</a>
			            <a href="javascript:void(0);" class="i_note">
			                <span>등록된 경력을 기준으로 기업고객에게 보여지는 이력정보 화면입니다.</span>
			            </a>
			        </div>
			            <a href="" class="btn b_s absolute" id="modifyButton">수정하기</a>
                </div>
                <!-- /기본정보 출력 -->
                <!-- 기본정보 입력 -->
                <div class="free_con" id="freelancerUpdate" style="display:none;">
                <form id="updateForm" name="updateForm">
                    <div class="member_input input_small">
                    	<div class="gray_box mb-5">
	                        <ul class="cf">
	                            <li class="col-6 pr-5">
	                                <!-- <label for="">이름<span class="need orange">(필수)</span></label> -->
	                                <input type="text" id="korNm" name="korNm" value="" placeholder="실명으로 입력바랍니다."/>
	                            </li>
	                            <li class="col-6 pl-5">
	                                <!-- <label for="">출생년도<span class="need orange">(필수)</span></label> -->
	                                
	                                
	                                
	                                <select id="birthDay" name="birthDay">
	                                    <option value="1992">
	                                    
	                                        
	                                            1992
	                                        
	                                        
	                                    
	                                    </option>

	                                    
	                                    <option value="2000"  >2000</option>
	                                    
	                                    <option value="1999"  >1999</option>
	                                    
	                                    <option value="1998"  >1998</option>
	                                    
	                                    <option value="1997"  >1997</option>
	                                    
	                                    <option value="1996"  >1996</option>
	                                    
	                                    <option value="1995"  >1995</option>
	                                    
	                                    <option value="1994"  >1994</option>
	                                    
	                                    <option value="1993"  >1993</option>
	                                    
	                                    <option value="1992"  >1992</option>
	                                    
	                                    <option value="1991"  >1991</option>
	                                    
	                                    <option value="1990"  >1990</option>
	                                    
	                                    <option value="1989"  >1989</option>
	                                    
	                                    <option value="1988"  >1988</option>
	                                    
	                                    <option value="1987"  >1987</option>
	                                    
	                                    <option value="1986"  >1986</option>
	                                    
	                                    <option value="1985"  >1985</option>
	                                    
	                                    <option value="1984"  >1984</option>
	                                    
	                                    <option value="1983"  >1983</option>
	                                    
	                                    <option value="1982"  >1982</option>
	                                    
	                                    <option value="1981"  >1981</option>
	                                    
	                                    <option value="1980"  >1980</option>
	                                    
	                                    <option value="1979"  >1979</option>
	                                    
	                                    <option value="1978"  >1978</option>
	                                    
	                                    <option value="1977"  >1977</option>
	                                    
	                                    <option value="1976"  >1976</option>
	                                    
	                                    <option value="1975"  >1975</option>
	                                    
	                                    <option value="1974"  >1974</option>
	                                    
	                                    <option value="1973"  >1973</option>
	                                    
	                                    <option value="1972"  >1972</option>
	                                    
	                                    <option value="1971"  >1971</option>
	                                    
	                                    <option value="1970"  >1970</option>
	                                    
	                                    <option value="1969"  >1969</option>
	                                    
	                                    <option value="1968"  >1968</option>
	                                    
	                                    <option value="1967"  >1967</option>
	                                    
	                                    <option value="1966"  >1966</option>
	                                    
	                                    <option value="1965"  >1965</option>
	                                    
	                                    <option value="1964"  >1964</option>
	                                    
	                                    <option value="1963"  >1963</option>
	                                    
	                                    <option value="1962"  >1962</option>
	                                    
	                                    <option value="1961"  >1961</option>
	                                    
	                                    <option value="1960"  >1960</option>
	                                    
	                                    <option value="1959"  >1959</option>
	                                    
	                                    <option value="1958"  >1958</option>
	                                    
	                                    <option value="1957"  >1957</option>
	                                    
	                                    <option value="1956"  >1956</option>
	                                    
	                                    <option value="1955"  >1955</option>
	                                    
	                                    <option value="1954"  >1954</option>
	                                    
	                                    <option value="1953"  >1953</option>
	                                    
	                                    <option value="1952"  >1952</option>
	                                    
	                                    <option value="1951"  >1951</option>
	                                    
	                                    <option value="1950"  >1950</option>
	                                    
	                                </select>
	                            </li>
	                            <li class="col-12">
	                                <!-- <label for="">성별</label> -->
	                                <div class="radio member_check">
		                                <label for="genderCd01">
		                                <input type="radio" id="genderCd01" name="genderCd" value="M" checked=""/>
		                                <i></i>
		                                                        남자</label>
		                                <label for="genderCd02">
		                                <input type="radio" id="genderCd02" name="genderCd" value="F" checked=""/>
		                                <i></i>
		                                                        여자</label>
		                                <label for="genderCd03">
		                                <input type="radio" id="genderCd03" name="genderCd" value="" checked=""/>
		                                <i></i>
		                                                        선택안함</label>
		                            </div>
	                            </li>
	                            <li class="col-6 pr-5">
	                                <!-- <label for="">휴대폰번호<span class="need orange">(필수)</span></label> -->
	                                <input type="text" id="telNo" name="telNo" value="01051876305" placeholder="-없이 입력바랍니다."/>
	                            </li>
	                            <li class="col-6 pl-5">
	                                <!-- <label for="">이메일주소<span class="need orange">(필수)</span></label> -->
	                                <input type="hidden" id="userId" name="userId" value="1444427072"/>
	                                <input type="hidden" id="prfPhotoYn" name="prfPhotoYn" value="Y"/>
	                                <input type="text" id="email" name="email" value="keh9208@naver.com" placeholder="이메일 형식에 맞춰 입력바랍니다."/>
	                            </li>
							</ul>
						</div>
						<ul class="cf">
                            <li class="col-6 pr-5">
                                <label for="">전문기술<span class="need orange">(필수)</span></label>
                                <input type="text" id="skills" name="skills" placeholder="선택하세요.(여러개 선택 가능)" value="" readonly="readonly"/>

                                <div class="option depth2 multi" id="skillListModify" style="display: none;">
                                    <div class="select_box cf">
                                        <ul class="cf memberConfigJobList" id="memberModifyJobList">
                                            <!-- 스킬 대분류 -->
                                        </ul>
                                        <ul class="cf memberConfigSkillList" id="memberModifySkillList">
                                            <!-- 스킬 소분류 -->
                                        </ul>
                                    </div>
                                    <div class="view_box">
                                        <ul class="cf">
                                            <!-- 스킬 선택 정보 -->
                                        </ul>
                                        <div id="btnModifySkill" class="btn_close">닫기</div>
                                    </div>
                                </div>
                            </li>
                            <li class="col-6 pl-5">
                                <label for="">희망근무지역<span class="need orange">(필수)</span></label>
                                <input type="text" class="input_local" id="area" name="area" placeholder="선택하세요.(여러개 선택 가능)" value="" readonly="readonly"/>

                                <div class="option depth2 multi" id="workAreaList" style="display: none;">
                                    <div class="select_box cf">
                                        <ul class="cf" id="memberConfigAreaList">
                                        </ul>
                                        <ul class="cf" id="memberConfigArea2List">
                                        </ul>
                                    </div>
                                    <div class="view_box">
                                        <ul class="cf">
                                            <!-- 지역 선택 정보 -->
                                        </ul>
                                        <div id="btnArea" class="btn_close">닫기</div>
                                    </div>
                                </div>
                            </li>
                            <li class="col-6 pr-5">
                                <label for="">투입가능일<span class="need orange">(필수)</span></label>
                                <input type="text" class="input_day" id="joinPsblDt" name="joinPsblDt" value="2020-12-09" placeholder="투입가능일자를 선택하시면 회원님의 일정에 반영됩니다." readonly="readonly"/>
                            </li>
                            <li class="col-6 pl-5">
                                <label for="">해시태그<span class="need orange">(필수)</span></label>
                                <input type="text" id="keyword" name="keyword" value="" placeholder="예)#단기선호 #PL/PM전문 #해외출장경험자" />
                            </li>
                        </ul>

                    </div>
                    <!-- 프로필 미리보기 버튼 -->
                    <div class="btn_box left mt-10">
                        <button type="submit" class="btn b_m b_red">저장</button>
                        <button class="btn b_m b" href="" id="cancel">취소</button>
                    </div>
                    </form>
                </div>
                <!-- /기본정보 입력 -->
            </div>
            <!-- /이력서 파일 -->
            <!-- 이력서 파일 -->
	        <div class="card border_org over_hidden cf">
	            <div class="card_info">
	                <h3><span class="orange">파일 등록</span>으로 프로필을 <span class="orange">10초 완성</span>하세요~</h3>
	                <div class="file_btn cf">
	                    <form id="registForm" name="registForm" enctype="multipart/form-data" style="display:;">
	                        <input type="file" id="file" name="file" class="hidden" accept="application/pdf, application/msword, application/vnd.openxmlformats-officedocument.wordprocessingml.document, application/x-tika-msoffice, application/vnd.ms-powerpoint, application/vnd.openxmlformats-officedocument.presentationml.slideshow, application/vnd.openxmlformats-officedocument.presentationml.presentation, application/vnd.ms-excel, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, .hwp" onchange="fillFile()" />
	                        <button name="virtu_btn" class="btn b_m" onclick="clickFile(); return false;">파일선택</button>
	                        <input type="text" name="virtu_text" />
	                        <button type="submit" id="btn" class="btn b_m b_red" style="cursor:pointer;">등록</button>
	                    </form>
	                    <button id="btnMail" class="btn b_red" style="display:none;cursor:pointer;" onClick="location.href='mailto:freemon@freemon.co.kr'">이력서 메일로 첨부하기</button>
	                </div>
	                <h6>이력서 파일을 올려주시면 프리몬에서 프로필을 완성해드립니다.</h6>
	                <p class="small">(최대 2~3일 소요, 프로필 완성 후 카카오톡 메시지로 안내드립니다.)</p>
	            </div>
	            <div class="card_info bg_gray">
	                <em class="f_note">공개 선택 시, 지원한 프로젝트에서 기업이 해당 파일을 다운로드할 수 있습니다.</em>
	                
	            </div>
	        </div>
	        <!-- /이력서 파일 -->
	    </div>

        <!-- 보유기술 *없애면 수행프로젝트 목록이 안나옴 display:none으로 처리 -->
        <div class="resume_box cf" style="display:none;">
            <div class="detail_info man_detail_graph cf sm-col-12" id="resumeSkillList">
            </div>
        </div>

        <!-- tab_menu -->
        <div class="tab_menu mt-20">
            <ul>
                <li id="projTab" data-action="setTabValue" data-value="1"><a href="javascript:void(0);">수행 프로젝트</a></li>
                <li id="schoolTab" data-action="setTabValue" data-value="2"><a href="javascript:void(0);">학력</a></li>
                <li id="certTab" data-action="setTabValue" data-value="3"><a href="javascript:void(0);">자격사항</a></li>
                <li id="etcTab" data-action="setTabValue" data-value="4"><a href="javascript:void(0);">기타</a></li>
            </ul>
        </div>
        <div class="man_list hidden" id="proj">
            <!-- 제목 *없애면 수행프로젝트 수정안됨 display:none으로 처리 -->
            <h4 class="middle_tit" style="display:none;">경력</h4>

            <button id="btnAdd" class="btn b_add" data-action="addViewClick" onClick="return false;">추가등록</button>

            <!-- 경력 입력/수정 -->
            <div class="card hidden" id="divInsert">
                <div class="card_info">
	            	<form id="regForm" name="regForm">
		            	<div class="member_input input_small">
	                        <ul class="cf">
		                    	<li class="col-4 pr-5">
                                    <label for="occupation">프로젝트 유형</label>
                                    <div class="radio member_check">
                                    
                                        <label for="occupation1"><input type="checkbox" id="occupation1" name="occupation" value="1" /> <i></i>SI</label>
                                    
                                        <label for="occupation2"><input type="checkbox" id="occupation2" name="occupation" value="2" /> <i></i>SM</label>
                                    
                                        <label for="occupation3"><input type="checkbox" id="occupation3" name="occupation" value="3" /> <i></i>기타</label>
                                    
                                    </div>
                                </li>
		                    	<li class="col-4 pl-5 pr-5">
									<label for="domain">분야</label>
									<div class="dropdown2">
										<div id="dt">
											<dt>
												<a href="#" onClick="return false;"> <span class="input_tech" id="hida2">분야를 선택해주세요.(여러개 선택 가능)</span>
													<p id="multiSel2"></p>
												</a>
											</dt>
										</div>
									</div>
									<div class="option depth1 multi" id="mutliSelect2" style="display: none;">
										<div class="select_box cf">
											<ul class="cf">
												
													<li><label style="color:#333; margin-bottom:0px; font-size:15px;" for="domain1"><input type="checkbox" id="domain1" name="domain" value="제조" data-value="1" data-role="domain" />제조</label></li>
												
													<li><label style="color:#333; margin-bottom:0px; font-size:15px;" for="domain2"><input type="checkbox" id="domain2" name="domain" value="금융" data-value="2" data-role="domain" />금융</label></li>
												
													<li><label style="color:#333; margin-bottom:0px; font-size:15px;" for="domain3"><input type="checkbox" id="domain3" name="domain" value="교육" data-value="3" data-role="domain" />교육</label></li>
												
													<li><label style="color:#333; margin-bottom:0px; font-size:15px;" for="domain4"><input type="checkbox" id="domain4" name="domain" value="의료" data-value="4" data-role="domain" />의료</label></li>
												
													<li><label style="color:#333; margin-bottom:0px; font-size:15px;" for="domain5"><input type="checkbox" id="domain5" name="domain" value="공공" data-value="5" data-role="domain" />공공</label></li>
												
													<li><label style="color:#333; margin-bottom:0px; font-size:15px;" for="domain6"><input type="checkbox" id="domain6" name="domain" value="법조" data-value="6" data-role="domain" />법조</label></li>
												
													<li><label style="color:#333; margin-bottom:0px; font-size:15px;" for="domain7"><input type="checkbox" id="domain7" name="domain" value="유통" data-value="7" data-role="domain" />유통</label></li>
												
													<li><label style="color:#333; margin-bottom:0px; font-size:15px;" for="domain8"><input type="checkbox" id="domain8" name="domain" value="디자인" data-value="8" data-role="domain" />디자인</label></li>
												
													<li><label style="color:#333; margin-bottom:0px; font-size:15px;" for="domain9"><input type="checkbox" id="domain9" name="domain" value="웹솔루션" data-value="9" data-role="domain" />웹솔루션</label></li>
												
													<li><label style="color:#333; margin-bottom:0px; font-size:15px;" for="domain10"><input type="checkbox" id="domain10" name="domain" value="모바일앱" data-value="10" data-role="domain" />모바일앱</label></li>
												
													<li><label style="color:#333; margin-bottom:0px; font-size:15px;" for="domain11"><input type="checkbox" id="domain11" name="domain" value="플랫폼" data-value="11" data-role="domain" />플랫폼</label></li>
												
													<li><label style="color:#333; margin-bottom:0px; font-size:15px;" for="domain12"><input type="checkbox" id="domain12" name="domain" value="챗봇" data-value="12" data-role="domain" />챗봇</label></li>
												
													<li><label style="color:#333; margin-bottom:0px; font-size:15px;" for="domain13"><input type="checkbox" id="domain13" name="domain" value="머신러닝/AI/빅데이터" data-value="13" data-role="domain" />머신러닝/AI/빅데이터</label></li>
												
													<li><label style="color:#333; margin-bottom:0px; font-size:15px;" for="domain14"><input type="checkbox" id="domain14" name="domain" value="기타" data-value="14" data-role="domain" />기타</label></li>
												
											</ul>
										</div>
									</div>
								</li>
								<li class="col-2 pl-5 pr-5">
		                            <div class="input cf">
		                                <label for="strtDt">프로젝트 시작일<span class="need orange">(필수)</span></label>
		                                <input type="text" class="input_day dateRangePicker" value="" style="cursor:pointer;" readonly="readonly" id="strtDt" name="strtDt" />
		                            </div>
		                        </li>
		                        <li class="col-2 pl-5">
		                            <div class="input cf">
		                                <label for="endDt">프로젝트 종료일<span class="need orange">(필수)</span></label>
		                                <input type="text" class="input_day dateRangePicker" value="" style="cursor:pointer;" readonly="readonly" id="endDt" name="endDt" />
		                            </div>
		                        </li>
		                        <li class="col-4 pr-5">
		                            <div class="input cf">
										<label for="customer">발주처<span class="need orange">(필수)</span></label>
		                                <input type="text" id="customer" name="customer" value=""  maxlength="50" />
		                            </div>
		                        </li>
								<li class="col-8 pl-5">
		                            <div class="input cf">
		                                <label for="projNm">프로젝트명<span class="need orange">(필수)</span></label>
		                                <input type="text" id="projNm" name="projNm" value=""  maxlength="50" />
		                            </div>
		                        </li>
								<li class="col-4 pr-5">
		                            <div class="input cf">
		                                <label for="workCompNm">근무회사</label>
		                                <input type="text" id="workCompNm" name="workCompNm" value="" maxlength="30" />
		                            </div>
		                        </li>
								<li class="col-4 pl-5 pr-5">
									<div class="input cf keywords-container">
										<label for="jobPos">역할</label>
										<div class="dropdown">
											<div id="dt">
												<dt>
													<a href="#" onClick="return false;"> <span class="input_tech" id="hida">역할을 선택해주세요.(여러개 선택 가능)</span>
														<p id="multiSel"></p>
													</a>
												</dt>
											</div>
										</div>
									</div>
									<div class="option depth1 multi" id="mutliSelect" style="display: none;">
										<div class="select_box cf">
											<ul class="cf">
												
													<li><label style="color:#333; margin-bottom:0px; font-size:15px;" for="jobPos1"><input type="checkbox" id="jobPos1" name="jobPos" value="PM" data-value="1" data-role="role" />PM</label></li>
												
													<li><label style="color:#333; margin-bottom:0px; font-size:15px;" for="jobPos2"><input type="checkbox" id="jobPos2" name="jobPos" value="PL" data-value="2" data-role="role" />PL</label></li>
												
													<li><label style="color:#333; margin-bottom:0px; font-size:15px;" for="jobPos3"><input type="checkbox" id="jobPos3" name="jobPos" value="DBA" data-value="3" data-role="role" />DBA</label></li>
												
													<li><label style="color:#333; margin-bottom:0px; font-size:15px;" for="jobPos4"><input type="checkbox" id="jobPos4" name="jobPos" value="AA" data-value="4" data-role="role" />AA</label></li>
												
													<li><label style="color:#333; margin-bottom:0px; font-size:15px;" for="jobPos5"><input type="checkbox" id="jobPos5" name="jobPos" value="TA" data-value="5" data-role="role" />TA</label></li>
												
													<li><label style="color:#333; margin-bottom:0px; font-size:15px;" for="jobPos6"><input type="checkbox" id="jobPos6" name="jobPos" value="개발" data-value="6" data-role="role" />개발</label></li>
												
													<li><label style="color:#333; margin-bottom:0px; font-size:15px;" for="jobPos7"><input type="checkbox" id="jobPos7" name="jobPos" value="기타" data-value="7" data-role="role" />기타</label></li>
												
											</ul>
										</div>
									</div>
								</li>
		                        <li class="col-4 pl-5">
		                            <div class="input cf">
		                                <label for="lang">주요 기술<span class="need orange">(필수)</span></label>
		                                <input type="text" id="lang" name="lang" value="" readonly="readonly" style="cursor:pointer;" placeholder="주요기술(언어, DBMS)을 선택해 주세요."/>
		                            </div>
		                            <div class="option depth2 multi" id="skillPartList" style="display:none;">
		                                <div class="select_box cf">
		                                    <ul class="cf memberConfigJobList" id="memberConfigJobList">
		                                    </ul>
		                                    <ul class="cf memberConfigSkillList" id="memberConfigSkillList">
		                                    </ul>
		                                </div>
		                                <div class="view_box">
		                                    <ul class="cf">
		                                    </ul>
		                                    <div id="btnSkill" class="btn_close">닫기</div>
		                                </div>
		                            </div>
		                        </li>
		                        <li class="col-4 pr-5">
		                            <div class="input textarea cf">
		                                <label for="role">주요업무</label>
		                                <textarea id="role" name="role"></textarea>
		                            </div>
		                        </li>
		                         <li class="col-4 pl-5 pr-5">
		                            <div class="input textarea cf">
		                                <label for="projectDtl">프로젝트 설명</label>
		                                <textarea id="projectDtl" name="projectDtl"></textarea>
		                            </div>
		                        </li>
		                        <li class="col-4 pl-5">
		                            <div class="input textarea cf">
		                                <label for="etc" style="width:100%;">비고(프레임워크, OS, 개발툴, 기종, 통신, 기타내용)</label>
		                                <textarea id="etc" name="etc"></textarea>
		                            </div>
		                        </li>
		                	</ul>
		                </div>
		                <div class="btn_box mt-10">
		                    <button id="btnInsert" class="btn b_m b_red" data-action="InsertClick" style="cursor:pointer;" onClick="return false;">저장</button>
		                    <button id="btnClose" class="btn b_m" data-action="closeViewClick" style="cursor:pointer;" onClick="return false;">닫기</button>
		                </div>
	                </form>
                </div>
            </div>

        	<!-- 경력 정보 -->
        	<div id="resumeSearchList">
                <div class="project_box cf" style="text-align:center; vertical-align:middle!important;height:100px;">
                    <span class="red" style="line-height:30px;font-size:16px;">
                        <p style="padding-top:15px;">이력서 파일을 첨부하시면 프리몬에서 이력정보를 업데이트 해 드립니다.</p>
                    </span>
                </div>
            </div>

            <!-- 더보기 -->
        	<div class="more_box" style="display:none;">
           		<a href="javascript:void(0);" class="btn_more center" data-action="moreViewClick"><span class="t_more">더보기</span></a>
        	</div>

        </div>

        <!-- 학력 -->
        <div class="man_list hidden" id="school">
            <button id="" class="btn b_add" data-action="addEducation" onClick="return false;">추가등록</button>
            <!-- 학력 입력/수정 -->
            <div class="card hidden" id="educationInsert">
                <div class="card_info">
                    <form id="schoolForm" name="schoolForm">
                        <div class="member_input input_small">
	                        <ul class="cf">
                                <li class="col-6 pr-5">
                                     <label for="">학교명<span class="need orange">(필수)</span></label>
                                     <input type="text" id="schoolNm" name="schoolNm"/>
                                </li>
                                <li class="col-3 pl-5 pr-5">
                                     <label for="">입학일<span class="need orange">(필수)</span></label>
                                     <input type="text" class="dateRangePicker" id="entrncDt" name="entrncDt" readonly="readonly"/>
                                </li>
                                <li class="col-3 pl-5">
                                     <label for="">졸업일<span class="need orange">(필수)</span></label>
                                     <input type="text" class="dateRangePicker" id="finishDt" name="finishDt" readonly="readonly"/>
                                </li>
                                <li class="col-6 pr-5">
                                     <label for="">전공</label>
                                     <input type="hidden" id="userId" name="userId" value="1444427072"/>
                                     <input type="text" id="major" name="major"/>
                                </li>
                                <li class="col-2 pl-5 pr-5">
                                     <label for="customer">졸업상태<span class="need orange">(필수)</span></label>
                                     <select id="state" name="state">
                                         <option value="0">선택</option>
                                         <option value="1">졸업</option>
                                         <option value="2">졸업예정</option>
                                         <option value="3">재학중</option>
                                         <option value="4">중퇴</option>
                                         <option value="5">수료</option>
                                         <option value="6">휴학</option>
                                     </select>
                                </li>
                                <li class="col-2 pl-5 pr-5">
                                     <label for="">학점</label>
                                     <input type="text" id="score" name="score"/>
                                </li>
                                <li class="col-2 pl-5">
                                     <label for="">학점기준</label>
                                     <select id="grade" name="grade">
                                         <option value="0">선택</option>
                                         <option value="4.0">4.0</option>
                                         <option value="4.3">4.3</option>
                                         <option value="4.5">4.5</option>
                                     </select>
                                </li>
						    </ul>
						</div>
						<div class="btn_box mt-10">
                            <button id="" class="btn b_m b_red" data-action="registSchool" style="cursor:pointer;" onClick="return false;">저장</button>
                            <button id="btnSchoolClose" class="btn b_m" data-action="closeSchoolClick" style="cursor:pointer;" onClick="return false;">닫기</button>
                        </div>
					</form>
				</div>
			</div>
			<!-- 학력 출력 -->
			<div id="schoolList">
                <div class="project_box cf" style="text-align:center; vertical-align:middle!important;height:100px;">
                    <span class="red" style="line-height:30px;font-size:16px;">
                        <p style="padding-top:15px;">이력서 파일을 첨부하시면 프리몬에서 이력정보를 업데이트 해 드립니다.</p>
                    </span>
                </div>
			</div>
		</div>
        <!-- /학력 -->

        <!-- 자격증 -->
        <div class="man_list hidden" id="cert">
            <button id="" class="btn b_add" data-action="addCertClick" onClick="return false;">추가등록</button>
            <!-- 자격증 입력/수정 -->
            <div class="card hidden" id="certInsert">
                <div class="card_info">
                    <form id="certForm" name="certForm">
                        <div class="member_input input_small">
	                        <ul class="cf">
                                <li class="col-6 pr-5">
                                     <label for="">자격증명<span class="need orange">(필수)</span></label>
                                     <input type="text" id="quilifNm" name="quilifNm"/>
                                </li>
                                <li class="col-3 pl-5 pr-5">
                                     <label for="">발행처/기관</label>
                                     <input type="text" id="publOrg" name="publOrg"/>
                                </li>
                                <li class="col-3 pl-5">
                                     <label for="">취득일<span class="need orange">(필수)</span></label>
                                     <input type="text" class="dateRangePicker" id="acqrDt" name="acqrDt" readonly="readonly"/>
                                </li>
						    </ul>
						</div>
						<div class="btn_box mt-10">
                            <button id="" class="btn b_m b_red" data-action="registCert" style="cursor:pointer;" onClick="return false;">저장</button>
                            <button id="certClose" class="btn b_m" data-action="closeCertClick" style="cursor:pointer;" onClick="return false;">닫기</button>
                        </div>
					</form>
				</div>
			</div>
			<!-- 자격증 출력 -->
			<div id="certList">
                <div class="project_box cf" style="text-align:center; vertical-align:middle!important;height:100px;">
                    <span class="red" style="line-height:30px;font-size:16px;">
                        <p style="padding-top:15px;">이력서 파일을 첨부하시면 프리몬에서 이력정보를 업데이트 해 드립니다.</p>
                    </span>
                </div>
			</div>

		</div>
        <!-- /자격증 -->

        <!-- 기타 -->
        <div class="man_list hidden" id="etcList">
            <button id="" class="btn b_add" data-action="addEtc" onClick="return false;">추가등록</button>
            <!-- 기타 입력/수정 -->
            <div class="card hidden" id="etcInsert">
                <div class="card_info">
                    <form id="etcForm" name="etcForm">
                        <div class="member_input input_small">
	                        <ul class="cf">
                                <li class="col-12">
                                    <label for="">항목명<span class="need orange">(필수)</span></label>
                                    <input type="text" id="subject" name="subject"/>
                                </li>
                                <li class="col-12">
                                    <label for="">내용<span class="need orange">(필수)</span></label>
                                    <textarea id="contents" name="contents" style="height:200px;"></textarea>
                                </li>
						    </ul>
						</div>
						<div class="btn_box mt-10">
                            <button id="" class="btn b_m b_red" data-action="registEtc" style="cursor:pointer;" onClick="return false;">저장</button>
                            <button id="" class="btn b_m" data-action="closeEtcClick" style="cursor:pointer;" onClick="return false;">닫기</button>
                        </div>
					</form>
				</div>
			</div>
			<!-- 기타 출력 -->
			<div id="etcViewList">
                <div class="project_box cf" style="text-align:center; vertical-align:middle!important;height:100px;">
                    <span class="red" style="line-height:30px;font-size:16px;">
                        <p style="padding-top:15px;">이력서 파일을 첨부하시면 프리몬에서 이력정보를 업데이트 해 드립니다.</p>
                    </span>
                </div>
		    </div>
		</div>
        <!-- /기타 -->
    </section>
</div>

<script id="resumeSkillListTemplate" type="text/x-mustache">
{{#careerObj}}
					<h3 class="man_detail_tit">보유기술</h3>
			    	<div class="graph xs-col-12 center">
			        	<!-- 그래프자리 -->
			            <canvas id="marksChart" width="325" height="300"></canvas>
                    </div>
                    <div class="graph_table xs-col-12" >
                    	<h5 class="career_text">
							기술경력<span style="color:#7a7a7a;">(개월)</span>
							<a href="#none" class="note_q">
                            	<p class="note_a">등록된 경력을 기준으로<br />진행한 프로젝트의 기술을<br />계산하여 보여줍니다.<span class="a_arrow"></span></p>
                            </a>
						</h5>
                        <table class="board_g">
                        	<tbody>
								{{#detailCareerArr.skillCareerArr}}
                            	<tr>
                                	<td>
                                    	<h5>{{SkillYear}}</h5>
                                    </td>
									<td>
										<p>{{lang}}</p>
									</td>
                                </tr>
								{{/detailCareerArr.skillCareerArr}}
                            </tbody>
                        </table>
						{{#isDbms}}
						<h5 class="career_text mt-10">
							DBMS<span style="color:#7a7a7a;">(개월)</span>
							<a href="#none" class="note_q">
                            	<p class="note_a">등록된 경력을 기준으로<br />진행한 프로젝트의 DBMS<br />사용을 계산하여 보여줍니다.<span class="a_arrow"></span></p>
                            </a>
						</h5>
                        <table class="board_g">
                        	<tbody>
								{{#detailCareerArr.dbmsCareerArr}}
                            	<tr>
                                	<td>
                                    	<h5>{{SkillYear}}</h5>
                                    </td>
									<td>
										<p>{{lang}}</p>
									</td>
                                </tr>
								{{/detailCareerArr.dbmsCareerArr}}
                            </tbody>
                        </table>
						{{/isDbms}}
	                </div>
{{/careerObj}}
</script>

<script id="resumeSearchListTemplate" type="text/x-mustache">
{{#resumeList}}
    <div class="card no_over over_hidden">
        <div class="card_info">
            {{#isoccDomain}}
            <ul class="pro_section">
                {{#occupationDiv}}<li>{{occupationDiv}}</li>{{/occupationDiv}}
                {{#domainDiv}}<li>{{domainDiv}}</li>{{/domainDiv}}
            </ul>
            {{/isoccDomain}}
            <p class="pro_term">{{strtDtTxt}} ~ {{endDtTxt}}<span class="add_info">{{prtcptTerm}}개월</span></p>
            <ul class="pro_name">
                {{#customer}}<li>{{customer}}</li>{{/customer}}
                <li>{{projNm}}</li>
            </ul>
            <ul class="pro_detail">
				{{#workCompNm}}<li class="company">{{workCompNm}}</li>{{/workCompNm}}
                {{#jobPos}}<li class="job">{{jobPos}}</li>{{/jobPos}}
            </ul>
            <ul class="pro_detail">
                {{#lang}}<li class="tech">{{lang}}</li>{{/lang}}
            </ul>
        </div>
        <div class="pro_etc">
            <ul>
            {{#isrole}}<li><h6>주요업무</h6><p style="word-break: break-word;white-space: pre-wrap;">{{{role}}}</p></li>{{/isrole}}
            {{#isprojectDtl}}<li><h6>프로젝트 설명</h6><p style="word-break: break-word;white-space: pre-wrap;">{{{projectDtl}}}</p></li>{{/isprojectDtl}}
            {{#isetc}}<li><h6>비고</h6><p style="word-break: break-word;white-space: pre-wrap;">{{{etc}}}</p></li>{{/isetc}}
            </ul>
        </div>
        <div class="absolute">
            <span class="small mr-10"><span class="mr-5">입력</span> {{regDt}}</span>
            <button id="btn" class="btn b_s" data-action="editViewClick" data-fno="{{crrIdx}}" onClick="return false;">수정</button>
            <button id="btn" class="btn b_s" data-action="delClick" data-fno="{{crrIdx}}" style="cursor:pointer;" onClick="return false;">삭제</button>
        </div>
    </div>
{{/resumeList}}
{{^resumeList}}
	<div class="project_box cf" style="text-align:center; vertical-align:middle!important;height:100px;">
		<span class="red" style="line-height:30px;font-size:16px;"><p style="padding-top:15px;">이력서 파일을 첨부하시면 프리몬에서 이력정보를 업데이트 해 드립니다.</p></span>
		
	</div>
{{/resumeList}}
</script>

<script id="schoolListTemplate" type="text/x-mustache">
{{#schoolList}}
<div class="card no_over over_hidden">
    <div class="card_info" id="educationEdit">
        {{#isStateNm}}
            <ul class="pro_section">
                <li>{{stateNm}}</li>
		    </ul>
		{{/isStateNm}}
		    <p class="pro_term">{{entrncDt}} ~ {{finishDt}}</p>
		    <ul class="pro_name">
		        <li>{{schoolNm}}</li>
		        <li>{{major}}</li>
		    </ul>
		    <ul class="pro_detail">
		        <li class="grade">{{score}}/{{^grade}}0{{/grade}}{{grade}}</li>
		    </ul>
	</div>
	<div class="absolute">
	    <button id="" class="btn b_s" data-action="editSchoolClick" data-idx="{{schIdx}}" data-fno="{{userId}}" data-nm="{{schoolNm}}" data-entrnc-dt="{{entrncDt}}" data-finish-dt="{{finishDt}}"
		            data-major="{{major}}" data-score="{{score}}" data-grade="{{grade}}" data-state="{{state}}" onclick="return false;">수정</button>
		<button id="" class="btn b_s" data-action="delSchoolClick" data-fno="{{schIdx}}" onclick="return false;">삭제</button>
	</div>
</div>
{{/schoolList}}
{{^schoolList}}
	<div class="project_box cf" style="text-align:center; vertical-align:middle!important;height:100px;">
		<span class="red" style="line-height:30px;font-size:16px;"><p style="padding-top:15px;">이력서 파일을 첨부하시면 프리몬에서 이력정보를 업데이트 해 드립니다.</p></span>
		
	</div>
{{/schoolList}}
</script>

<script id="certListTemplate" type="text/x-mustache">
{{#certList}}
<div class="card no_over over_hidden">
    <div class="card_info">
        <p class="pro_term">{{acqrDt}}</p>
        <ul class="pro_name">
             <li>{{quilifNm}}</li>
             <li class="small">{{publOrg}}</li>
		</ul>
    </div>
    <div class="absolute">
		<button id="" class="btn b_s" data-action="editCertClick" data-idx="{{crtIdx}}" data-nm="{{quilifNm}}" data-acqr-dt="{{acqrDt}}" data-publ-org="{{publOrg}}" onclick="return false;">수정</button>
		<button id="" class="btn b_s" data-action="delCertClick" data-idx="{{crtIdx}}" onclick="return false;">삭제</button>
	</div>
</div>
{{/certList}}
{{^certList}}
	<div class="project_box cf" style="text-align:center; vertical-align:middle!important;height:100px;">
		<span class="red" style="line-height:30px;font-size:16px;"><p style="padding-top:15px;">이력서 파일을 첨부하시면 프리몬에서 이력정보를 업데이트 해 드립니다.</p></span>
		
	</div>
{{/certList}}
</script>

<script id="etcListTemplate" type="text/x-mustache">
{{#etcList}}
<div class="card no_over over_hidden">
    <div class="card_info">
        <ul class="pro_name">
            <li>{{subject}}</li>
        </ul>
        <p style="word-break: break-word;white-space: pre-wrap;">{{contents}}</p>
    </div>
    <div class="absolute">
        <button id="" class="btn b_s" data-action="editEtcClick" data-idx="{{idx}}" data-title="{{subject}}" data-contents="{{contents}}" onclick="return false;">수정</button>
		<button id="" class="btn b_s" data-action="delEtcClick" data-idx="{{idx}}" data-title="{{subject}}" data-contents="{{contents}}" onclick="return false;">삭제</button>
	</div>
</div>
{{/etcList}}
{{^etcList}}
	<div class="project_box cf" style="text-align:center; vertical-align:middle!important;height:100px;">
		<span class="red" style="line-height:30px;font-size:16px;"><p style="padding-top:15px;">이력서 파일을 첨부하시면 프리몬에서 이력정보를 업데이트 해 드립니다.</p></span>
		
	</div>
{{/etcList}}
</script>

<script id="memberConfigJobListTemplate" type="text/x-mustache">
	{{#jobList}}
		<li class="configSelect {{#index}}active{{/index}}" data-value="{{cdVal}}" style="cursor:pointer;">{{cdValNm}}</li>
	{{/jobList}}
</script>
<script id="memberConfigSkillListTemplate" type="text/x-mustache">
	{{#jobList}}
    	<li class="skillSelect" id="skillSelectList_{{cdVal}}" data-id="{{cdVal}}" data-value="{{cdValNm}}" style="cursor:pointer;">{{cdValNm}}</li>
	{{/jobList}}
</script>

<script id="memberConfigAreaListTemplate" type="text/x-mustache">
{{#areaList}}
	<li class="areaSelect {{#index}}active{{/index}}" data-id="{{cdVal}}" data-value="{{cdValNm}}" style="cursor:pointer;">{{cdValNm}}</li>
{{/areaList}}
</script>
<script id="memberConfigArea2ListTemplate" type="text/x-mustache">
{{#areaList}}
    <li class="area2Select" id="areaSelectList_{{cdVal}}" data-id="{{cdVal}}" data-value="{{cdValNm}}"  data-uppervalue="{{workUpperAddr}}" data-upperId="{{upperCdVal}}" style="cursor:pointer;">{{cdValNm}}</li>
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

	
<%@ include file="../common/footer.jsp"%>		

</body>
</html>