<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
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

		
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript" src="/resources/js/Chart.js"></script>
<script type="text/javascript" src="/resources/freemon/talent/talentDetailSearch.js?version=3.3"></script>
<script type="text/javascript">
	$(function() {
		freemon.invoker.invoke("talentDetailSearch", "param", {fno : '1443141222','dv':''});
	});	
</script>

<div id="container">
	<section class="project_in" style="min-height: 765px;">
        <!-- 프로젝트 상세 -->
        <div class="man_list" id="talentDetailSearchList">
<div id="resume_info" class="project_detail cf no_hidden">
	<!-- 프로젝트 정보 -->
    <div class="detail_info man_detail_info cf sm-col-12 pb-0">
    	<div class="detail_info_in cf">
            <div class="profile" style="background-image:url('http://th-p.talk.kakao.co.kr/th/talkp/wlBaG95K4G/8Ttz5G4v91tdCDYBGwYNFK/hpj5e3_110x110_c.jpg')">프로필사진</div>
            <div class="pro_con">
                <h3 class="name">김수현</h3>
                <ul class="f_nature cf">
                    <li>36세</li>
                </ul>
            </div>
        </div>
        <ul class="ul_detail cf">
            <li class="col-12"><span class="tit">전화</span>010-****-****
				<p class="text_i"><span class="note_i"></span>프로젝트 제안한 경우, 해당정보 공개</p>
				
			</li>
            <li class="col-12"><span class="tit">이메일</span>wld*****@*****.com
            <p class="text_i"><span class="note_i"></span>프로젝트 제안한 경우, 해당정보 공개</p></li>
            
            <li class="col-12"><span class="tit">희망지역</span>대구</li>
            <li class="col-12 ellipsis"><span class="tit">전문기술</span>모바일UI, CSS, CSS3, HTML코딩, UI·UX</li> 
            <li class="col-12"><span class="tit">투입가능일 &nbsp;</span>2020-08-14</li> 
        </ul>

        <!--div class="report list3">
            <ul class="alarm cf">
                <li class="alarm2 ">4일후</li>
            </ul>
        </div-->

		<ul class="btn_icon absolute cf">
			<li class="like "><a href="javascript:void(0);" data-action="m_like" class="btn_small m_like">관심프리랜서</a></li>
			<li class="pick "><a href="javascript:void(0);" data-value="1443141222" data-nm="김수현" data-yn="N" data-action="talentExclusive" title="전속프리랜서<br></a>전속프리랜서는 프리랜서가 기업에 소속되는 관계로 둘다 동의시 프리랜서검색에 노출되지 않습니다.">전속프리랜서</a></li>
			<!--li class="tree"><a href="#none" class="btn_small m_map" data-action="m_map" data-value="1443141222">인맥트리</a></li-->
			<li class="memo "><a href="javascript:void(0);" class="talentMemo ellipsis" data-value="1443141222" data-name="김수현" data-action="talentMemo" title="메모"></a></li>
		</ul>
        <!-- 해시태그, 투입가능일 -->
        <div class="add_con cf mt-10">
            <div class="hash hash_detail"> 
                <ul class="cf"> 
                   <li>#web</li><li>#design</li><li>#mobile</li><li>#design</li><li>#css</li><li>#html</li>
                </ul>
            </div>
            <p class="able ">4일후</p>
        </div>

			<!-- 이력서 다운로드 -->
            <ul class="project_con2">
                <li>
                    <div class="man_table">
                        <table class="man_board sm-hidden">
                            <tbody>
                            </tbody>
                        </table>
                        
                    </div>
                </li>
            </ul>
			<!-- /이력서 다운로드 -->
		<div class="btn_box left mt-0 mb-20">
			
			<a href="javascript:void(0);" class="btn_join mt-0" data-action="prop">프로젝트 제안</a>
			

		</div>
    </div>

    <div class="detail_info man_detail_graph cf sm-col-12">
		<h3 class="man_detail_tit">보유기술</h3>
    	<div class="graph xs-col-12 center">
        	<!-- 그래프자리 -->
            <canvas id="marksChart" width="650" height="600" style="display: block; height: 300px; width: 325px;"></canvas>
                    </div>
                    <div class="graph_table xs-col-12">
                    	<h5 class="career_text">
							기술경력
							<a href="javascript:void(0)" class="note_q">
                            	<p class="note_a">등록된 경력을 기준으로<br>진행한 프로젝트의 기술을<br>계산하여 보여줍니다.<span class="a_arrow"></span></p>
                            </a>
							<span class="red"></span>
						</h5>
                        <table class="board_g">
                        	<tbody>
                            </tbody>
                        </table>
	                </div>
            	</div>
            </div>


    <div id="resume_chart" class="project_detail cf">
		<div class="chart cf">
			<div class="chart_tit">
				<h3>프로젝트 경력</h3>
				<p>기간(개월)</p><p>
				<!-- <h5 class="red cf" id="projectChartText"></h5> -->
				<img src="/resources/images/new/chart5.png" class="chart_img" alt="">
			</p></div>
			<div id="project_div" class="chart_position" style=""><div style="position: relative;"><div dir="ltr" style="position: relative; width: 945px; height: 150px;"><div aria-label="A chart." style="position: absolute; left: 0px; top: 0px; width: 100%; height: 100%;"><svg width="945" height="150" aria-label="A chart." style="overflow: hidden;"><defs id="_ABSTRACT_RENDERER_ID_0"><clipPath id="_ABSTRACT_RENDERER_ID_1"><rect x="28" y="29" width="756" height="93"></rect></clipPath></defs><g><rect x="28" y="29" width="756" height="93" stroke="none" stroke-width="0" fill-opacity="0" fill="#ffffff"></rect><g clip-path="url(https://www.freemon.co.kr/talent/talentDetailSearch?fno=1443141222#_ABSTRACT_RENDERER_ID_1)"><g><rect x="28" y="29" width="1" height="93" stroke="none" stroke-width="0" fill="#cccccc"></rect><rect x="179" y="29" width="1" height="93" stroke="none" stroke-width="0" fill="#cccccc"></rect><rect x="330" y="29" width="1" height="93" stroke="none" stroke-width="0" fill="#cccccc"></rect><rect x="481" y="29" width="1" height="93" stroke="none" stroke-width="0" fill="#cccccc"></rect><rect x="632" y="29" width="1" height="93" stroke="none" stroke-width="0" fill="#cccccc"></rect><rect x="783" y="29" width="1" height="93" stroke="none" stroke-width="0" fill="#cccccc"></rect><rect x="104" y="29" width="1" height="93" stroke="none" stroke-width="0" fill="#ebebeb"></rect><rect x="255" y="29" width="1" height="93" stroke="none" stroke-width="0" fill="#ebebeb"></rect><rect x="406" y="29" width="1" height="93" stroke="none" stroke-width="0" fill="#ebebeb"></rect><rect x="557" y="29" width="1" height="93" stroke="none" stroke-width="0" fill="#ebebeb"></rect><rect x="708" y="29" width="1" height="93" stroke="none" stroke-width="0" fill="#ebebeb"></rect></g><g><rect x="29" y="34" width="150" height="14" stroke="none" stroke-width="0" fill="#a7a7a7"></rect><rect x="29" y="57" width="271" height="14" stroke="none" stroke-width="0" fill="#a7a7a7"></rect><rect x="29" y="80" width="739" height="14" stroke="none" stroke-width="0" fill="#a7a7a7"></rect><rect x="29" y="103" width="558" height="14" stroke="none" stroke-width="0" fill="#a7a7a7"></rect></g><g><rect x="28" y="29" width="1" height="93" stroke="none" stroke-width="0" fill="#333333"></rect></g><g><rect x="179" y="41" width="12" height="1" stroke="none" stroke-width="0" fill="#999999"></rect><rect x="300" y="64" width="12" height="1" stroke="none" stroke-width="0" fill="#999999"></rect><rect x="768" y="87" width="12" height="1" stroke="none" stroke-width="0" fill="#999999"></rect><rect x="587" y="110" width="12" height="1" stroke="none" stroke-width="0" fill="#999999"></rect></g></g><g></g><g><g><g><rect x="188.5" y="33.5" width="107" height="15" stroke="none" stroke-width="0" fill-opacity="0" fill="#ffffff"></rect><text text-anchor="start" x="191" y="45.55" font-family="Arial" font-size="13" stroke="none" stroke-width="0" fill="#999999">프리랜서 / 10개월</text><rect x="191" y="34.5" width="101" height="13" stroke="none" stroke-width="0" fill-opacity="0" fill="#ffffff"></rect></g></g><g><g><rect x="309.5" y="56.5" width="145" height="15" stroke="none" stroke-width="0" fill-opacity="0" fill="#ffffff"></rect><text text-anchor="start" x="312" y="68.55" font-family="Arial" font-size="13" stroke="none" stroke-width="0" fill="#999999">스페이스에듀 / 1년6개월</text><rect x="312" y="57.5" width="139" height="13" stroke="none" stroke-width="0" fill-opacity="0" fill="#ffffff"></rect></g></g><g><g><rect x="777.5" y="79.5" width="170" height="15" stroke="none" stroke-width="0" fill-opacity="0" fill="#ffffff"></rect><text text-anchor="start" x="780" y="91.55" font-family="Arial" font-size="13" stroke="none" stroke-width="0" fill="#999999">희일커뮤니케이션 / 4년1개월</text><rect x="780" y="80.5" width="164" height="13" stroke="none" stroke-width="0" fill-opacity="0" fill="#ffffff"></rect></g></g><g><g><rect x="596.5" y="102.5" width="145" height="15" stroke="none" stroke-width="0" fill-opacity="0" fill="#ffffff"></rect><text text-anchor="start" x="599" y="114.55" font-family="Arial" font-size="13" stroke="none" stroke-width="0" fill="#999999">한국종합기술 / 3년1개월</text><rect x="599" y="103.5" width="139" height="13" stroke="none" stroke-width="0" fill-opacity="0" fill="#ffffff"></rect></g></g></g></g><g></g></svg><div aria-label="A tabular representation of the data in the chart." style="position: absolute; left: -10000px; top: auto; width: 1px; height: 1px; overflow: hidden;"><table><thead><tr><th>Task</th><th>기간(개월)</th></tr></thead><tbody><tr><td>프리랜서</td><td>10</td></tr><tr><td>스페이스에듀</td><td>18</td></tr><tr><td>희일커뮤니케이션</td><td>49</td></tr><tr><td>한국종합기술</td><td>37</td></tr></tbody></table></div></div></div><div aria-hidden="true" style="display: none; position: absolute; top: 160px; left: 955px; white-space: nowrap; font-family: Arial; font-size: 13px;">한국종합기술 / 3년1개월</div><div></div></div></div>
		</div>
	</div>

<!-- 경력 -->
<div id="resume_project" class="project_detail cf">
	<h3 class="man_detail_tit careerList">총 경력<span>11년 1개월</span></h3>
    <div id="career" class="open">
    	<div class="year">
        	<div class="year_list">
            	<div class="box">
                    <ul class="yeaer_ul">
                        <li class="on"><a href="#year1">2020</a></li>
                        <li><a href="#year2">2019</a></li>
                        <li><a href="#year3">2016</a></li>
                        <li><a href="#year4">2012</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="career_content">
        	<!-- 년별 경력 -->
        	<div id="year1">
            	<h3 class="year_text">2020</h3>
                <ul class="career_list cf">
                	<!-- 경력 -->
                	<li class="cf">
						<p class="point"></p>
                    	<div class="career_date">
                        	<p>2019-11 ~ 2020-08 (10개월)</p>
                        </div>
						<div class="career_con">
                        	<h3 class="project_name cf">
                                <span class="project_name_in max-col-12">
                                    프리랜서
                                </span>
                            </h3>
							<ul class="project_ul cf mt-10">
								
                            </ul><div class="cf"></div>
                        	<ul class="project_ul cf mt-0">
                                <li>
                                	
									 
									 
									 
									
								</li>
                            </ul><div class="cf"></div>
                        </div>

						<div class="project_p" title="주요업무">
							<!-- 주요업무 -->
							<p class="show">웹디자인, 퍼블리싱, 프로모션,Sum note 퍼블리싱, 포스코 강판 모바일, PLM dashboard 웹, 공장관리자 Kiosk 작업</p>
						</div>
                    </li>
                    <!-- /경력 -->
              </ul>
            </div>
        	<!-- 년별 경력 -->
        	<div id="year2">
            	<h3 class="year_text">2019</h3>
                <ul class="career_list cf">
                	<!-- 경력 -->
                	<li class="cf">
						<p class="point"></p>
                    	<div class="career_date">
                        	<p>2018-07 ~ 2019-12 (1년6개월)</p>
                        </div>
						<div class="career_con">
                        	<h3 class="project_name cf">
                                <span class="project_name_in max-col-12">
                                    스페이스에듀
                                </span>
                            </h3>
							<ul class="project_ul cf mt-10">
								
                            </ul><div class="cf"></div>
                        	<ul class="project_ul cf mt-0">
                                <li>
                                	
									 
									 
									 
									
								</li>
                            </ul><div class="cf"></div>
                        </div>

						<div class="project_p" title="주요업무">
							<!-- 주요업무 -->
							<p class="show">웹디자인, 프로모션, 광고 배너 , 퍼블리싱,FLIP APP, FLIP 소개 사이트, FLIP 컨텐츠 마켓, 한국경찰학원</p>
						</div>
                    </li>
                    <!-- /경력 -->
              </ul>
            </div>
        	<!-- 년별 경력 -->
        	<div id="year3">
            	<h3 class="year_text">2016</h3>
                <ul class="career_list cf">
                	<!-- 경력 -->
                	<li class="cf">
						<p class="point"></p>
                    	<div class="career_date">
                        	<p>2012-08 ~ 2016-08 (4년1개월)</p>
                        </div>
						<div class="career_con">
                        	<h3 class="project_name cf">
                                <span class="project_name_in max-col-12">
                                    희일커뮤니케이션
                                </span>
                            </h3>
							<ul class="project_ul cf mt-10">
								
                            </ul><div class="cf"></div>
                        	<ul class="project_ul cf mt-0">
                                <li>
                                	
									 
									 
									 
									
								</li>
                            </ul><div class="cf"></div>
                        </div>

						<div class="project_p" title="주요업무">
							<!-- 주요업무 -->
							<p class="show">웹디자인, 프로모션, 쇼핑몰, 모바일 디자인, 내부 프로젝트,바른손 홈케어, 소통 통역연구소, 아너스 치과, 닥터스 치과, 이노테라피 등</p>
						</div>
                    </li>
                    <!-- /경력 -->
              </ul>
            </div>
        	<!-- 년별 경력 -->
        	<div id="year4">
            	<h3 class="year_text">2012</h3>
                <ul class="career_list cf">
                	<!-- 경력 -->
                	<li class="cf">
						<p class="point"></p>
                    	<div class="career_date">
                        	<p>2009-08 ~ 2012-08 (3년1개월)</p>
                        </div>
						<div class="career_con">
                        	<h3 class="project_name cf">
                                <span class="project_name_in max-col-12">
                                    한국종합기술
                                </span>
                            </h3>
							<ul class="project_ul cf mt-10">
								
                            </ul><div class="cf"></div>
                        	<ul class="project_ul cf mt-0">
                                <li>
                                	
									 
									 
									 
									
								</li>
                            </ul><div class="cf"></div>
                        </div>

						<div class="project_p" title="주요업무">
							<!-- 주요업무 -->
							<p class="show">웹디자인, 프로모션, 쇼핑몰, 모바일 디자인, 내부 프로젝트,대영정공스프링, 윌로 펌프, 대경정공 등</p>
						</div>
                    </li>
                    <!-- /경력 -->
              </ul>
            </div>
            <!-- /년별 경력 -->
       </div>
    </div>
</div>

    
<!-- 웹 - 학력/자격증/수상내역 -->
<div id="resume_study" class="project_detail cf bg_darkgray sm-hidden">
    <div class="career_etc open">
        <h3 class="man_detail_tit">학력<span>대구예술대학교 (대구) 서양화과 </span></h3>
        <div class="career_etc_con">
        	<ul>
             <li>
            	<span>2004-03 ~ 2008-02</span>
                <span>대구예술대학교 (대구) 서양화과 </span>
             </li>
            </ul>
        </div>
    </div>
    <div class="career_etc open">
        <h3 class="man_detail_tit">자격증</h3>
        <div class="career_etc_con">
        	<ul>
            	<li>
                	<span>2007.03</span>
                    <span>컴퓨터그래픽스운용기능사</span>
                    <span>한국산업인력공단</span>
                </li>
            </ul>
        </div>
    </div>
    <!--div class="career_etc open">
        <h3 class="man_detail_tit">교육내역</h3>
	</div-->
</div>

<div id="resume_etc" class="project_detail cf">
	<h3 class="man_detail_tit careerList">핵심역량</h3>
    <div id="career" class="open career_pad" style="word-break: break-word;white-space: pre-wrap;">디자인 역량 - 디자인파트 리더로 프로젝트 수행<br>기획 역량 - 고객의 니즈를 파악하여 프로젝트 컨텐츠 기획<br>커뮤니케이션 역량 - 클라이언트 및 직원들과의 원활한 소통</div>
</div>
<div id="resume_etc" class="project_detail cf">
	<h3 class="man_detail_tit careerList">포트폴리오</h3>
    <div id="career" class="open career_pad" style="word-break: break-word;white-space: pre-wrap;">http://ekfdml00.cafe24.com/gnuboard5</div>
</div>

<div class="btn_box right sm-pr-15">

    <button type="button" id="btnList" class="btn_normal btn_gray" data-action="listView" onclick="return false;">목록으로</button>
</div>

<div class="resume_link">
	<ul>
		<li class="active"><a href="#resume_info">기본정보</a></li>
		<li><a href="#resume_chart">개요(그래프)</a></li>
		<li><a href="#resume_project">수행프로젝트</a></li>
		<li><a href="#resume_study">학력/수상및자격</a></li>
		<li><a href="#resume_etc">기타</a></li>
	</ul>
</div>


<script>
$(function(){
	$(".resume_link > ul > li").click(function(){
		$("#container .project_in .man_list .project_detail").animate({scrollTop:175},500,"easeInOutCirc");		
	});
	var menu = $(".resume_link > ul > li");
	var content = $(".man_list > div");
	menu.click(function(){
		menu.removeClass("active");
		$(this).addClass("active");
		var idx = $(this).index();
		var target = content.eq(idx);
		var tt = target.offset().top;
		tt = tt - 147;
		$("html,body").stop().animate({scrollTop:tt},500,"easeInOutCirc");
		return false;
	});
	$(window).scroll(function(){
		var st = $(window).scrollTop();
		st = -147;
		content.each(function() {
			var tg = $(this);
			var i = tg.index();
			if( tg.offset().top <= st ){
				menu.removeClass("active");
				menu.eq(i).addClass("active");	
			}			           
        });
		
	});	
});
</script></div>
        
        <!-- 팝업 제안하기 -->
		<div class="pop_bg" id="pop_prop" style="display:none;">
			<div class="pop">
		    	<div class="pop_header">
		        	<h3>제안하기</h3>
		            <a href="javascript:void(0);" class="close">닫기</a>
		        </div>
		        <div class="pop_body">
		        	<form id="propForm" name="propForm" action="#">
		        	<div class="apply_top">
		            	<select id="projectList">
		            		<option>제안할 프로젝트를 선택하세요</option>
		                </select>
		                <div class="input" style="">
							<label for="unitPrice">제안단가</label>
							<input type="text" id="unitPrice" name="unitPrice" value="" style="width:180px;text-align:right;" placeholder="숫자만 입력가능합니다."> 만원 
							<span style="padding-left:10px;"><input type="checkbox" id="negoYn" name="negoYn" value="Y" checked="checked"> <label for="negoYn">협의가능</label></span>
							<span style="padding-left:10px;"><input type="checkbox" id="travelExpYn" name="travelExpYn" value="Y" checked="checked"> <label for="travelExpYn">출장비 포함</label></span>
						</div>
		            </div>
		            <div class="apply_con">
		            	<textarea id="inqDtl" name="inqDtl" placeholder="제안시 참고할 내용이 있을 경우 여기에 남기세요."></textarea>
		                <!-- 버튼-->
		                <div class="btn_pop_box">
		                    <button id="btnProp" class="btn_apply" data-action="propReist" onclick="return false;">제안하기</button>
		                </div>
		            </div>
		            </form>
		        </div>
		    </div>
		</div>
		
		<!-- 팝업 -->
		<div class="pop_bg" id="projectInTalentList" style="display:none;">
		</div>
    </section>
</div>

<script id="talentDetailSearchListTemplate" type="text/x-mustache">
{{#talentList}}
<div id="resume_info" class="project_detail cf no_hidden">
	<!-- 프로젝트 정보 -->
    <div class="detail_info man_detail_info cf sm-col-12 pb-0">
    	<div class="detail_info_in cf">
            <div class="profile" style="background-image:url('{{profileUrl}}')">프로필사진</div>
            <div class="pro_con">
                <h3 class="name">{{userNm}}</h3>
                <ul class="f_nature cf">
                    <li>{{#isGenderNm}}{{gender}}{{#age}},{{/age}} {{/isGenderNm}}{{#age}}{{age}}세{{/age}}</li>
                </ul>
            </div>
        </div>
        <ul class="ul_detail cf">
            <li class="col-12"><span class="tit">전화</span>{{telNo}}
				{{#isTalentDetailSearch}}<p class="text_i"><span class="note_i"></span>프로젝트 제안한 경우, 해당정보 공개</p>{{/isTalentDetailSearch}}
				{{#isRejCancle}}<p class="text_i"><span class="note_i"></span>프로젝트 제안한 경우, 해당정보 공개</p>{{/isRejCancle}}
			</li>
            <li class="col-12"><span class="tit">이메일</span>{{email}}
            {{#isTalentDetailSearch}}<p class="text_i"><span class="note_i"></span>프로젝트 제안한 경우, 해당정보 공개</p></li>{{/isTalentDetailSearch}}
            {{#isRejCancle}}<p class="text_i"><span class="note_i"></span>프로젝트 제안한 경우, 해당정보 공개</p>{{/isRejCancle}}
            <li class="col-12"><span class="tit">희망지역</span>{{hopeAreaNm}}</li>
            <li class="col-12 ellipsis"><span class="tit">전문기술</span>{{usableSkillNm}}</li> 
            <li class="col-12"><span class="tit">투입가능일 &nbsp;</span>{{joinPsblDt}}</li> 
        </ul>

        <!--div class="report list3">
            <ul class="alarm cf">
                <li class="alarm2 {{leaveStrtTermCss}}">{{leaveStrtTermTxt}}</li>
            </ul>
        </div-->

		{{^isOpenTalentDetail}}
		{{#isTalentProposeDetailSearch}}
		<ul class="btn_icon absolute cf">
			<li class="like {{#IsinterestYn}}active{{/IsinterestYn}}"><a href="#none" data-action="m_like" class="btn_small m_like">관심프리랜서</a></li>
			<li class="pick {{#isExclusiveYn}}active{{/isExclusiveYn}}"><a href="#none" data-value="{{userId}}" data-nm="{{userNm}}" data-yn="{{exclusiveYn}}" data-action="talentExclusive" title="전속프리랜서<br/>전속프리랜서는 프리랜서가 기업에 소속되는 관계로 둘다 동의시 프리랜서검색에 노출되지 않습니다.">전속프리랜서</a></li>
			<!--li class="tree"><a href="#none" class="btn_small m_map" data-action="m_map" data-value="{{userId}}">인맥트리</a></li-->
			<li class="memo {{#memoYN}}active{{/memoYN}}"><a href="#none" class="talentMemo ellipsis" data-value="{{userId}}" data-name="{{userNm}}" data-action="talentMemo" {{#memoYN}}title="{{memo}}"{{/memoYN}}{{^memoYN}}title="메모"{{/memoYN}}>{{memo}}{{#memoYN}}<span></span>{{/memoYN}}</a></li>
		</ul>
		{{/isTalentProposeDetailSearch}}
		{{#isTalentDetailSearch}}
		<ul class="btn_icon absolute cf">
			<li class="like {{#IsinterestYn}}active{{/IsinterestYn}}"><a href="javascript:void(0);" data-action="m_like" class="btn_small m_like">관심프리랜서</a></li>
			<li class="pick {{#isExclusiveYn}}active{{/isExclusiveYn}}"><a href="javascript:void(0);" data-value="{{userId}}" data-nm="{{userNm}}" data-yn="{{exclusiveYn}}" data-action="talentExclusive" title="전속프리랜서<br/>전속프리랜서는 프리랜서가 기업에 소속되는 관계로 둘다 동의시 프리랜서검색에 노출되지 않습니다.">전속프리랜서</a></li>
			<!--li class="tree"><a href="#none" class="btn_small m_map" data-action="m_map" data-value="{{userId}}">인맥트리</a></li-->
			<li class="memo {{#memoYN}}active{{/memoYN}}"><a href="javascript:void(0);" class="talentMemo ellipsis" data-value="{{userId}}" data-name="{{userNm}}" data-action="talentMemo" {{#memoYN}}title="{{memo}}"{{/memoYN}}{{^memoYN}}title="메모"{{/memoYN}}>{{memo}}{{#memoYN}}<span></span>{{/memoYN}}</a></li>
		</ul>
		{{/isTalentDetailSearch}}
        {{/isOpenTalentDetail}}
        <!-- 해시태그, 투입가능일 -->
        <div class="add_con cf mt-10">
            <div class="hash hash_detail"> 
                <ul class="cf"> 
                   {{#keyword}}{{#hashTagList}}<li>{{.}}</li>{{/hashTagList}}{{/keyword}}
                </ul>
            </div>
            <p class="able {{leaveStrtTermCss}}">{{leaveStrtTermTxt}}</p>
        </div>

			<!-- 이력서 다운로드 -->
            <ul class="project_con2">
                <li>
                    <div class="man_table">
                        <table class="man_board sm-hidden">
                            <tbody>
                                {{#resumeFileList}}
                                <tr>
                                    <td class="left">
                                        <h4 class="file_name cf">
										<span class="icon_file">첨부파일</span>
										<a href="/talent/resumeDownload?attmIdx={{attmIdx}}" class="ellipsis">{{fileName}}</a>
										</h4>
                                    </td>
                                    <td>
                                        <a href="/talent/resumeDownload?attmIdx={{attmIdx}}" class="ellipsis"><button id="" class="btn_open">다운로드</button></a>
                                    </td>
                                </tr>
                                {{/resumeFileList}}
                            </tbody>
                        </table>
                        
                    </div>
                </li>
            </ul>
			<!-- /이력서 다운로드 -->
        {{^isOpenTalentDetail}}
        {{^isRejectYn}}
		{{^isCancelYn}}
		<div class="btn_box left mt-0 mb-20">
			{{#isTalentProposeDetailSearch}}
			
			<a href="#none" class="btn_join mt-0" data-action="proposeCancel" data-nm="{{userNm}}" data-projnm="{{projNm}}" data-regdt="{{regDt}}">{{btnProposeCancel}}</a>
			
			{{/isTalentProposeDetailSearch}}
			{{#isTalentDetailSearchPropose}}
			
			<a href="javascript:void(0);" class="btn_join mt-0" data-action="prop">프로젝트 제안</a>
			{{/isTalentDetailSearchPropose}}
			

			{{^isResumeFile}}
			{{^isCareerList}}
			<!-- 이력서 요청 버튼 -->
			<a href="javascript:void(0);" class="btn_no mt-0" data-action="requestCVFile" data-comp="GSteletech">이력서 요청
				<span href="#none" class="note_q">
            		<p class="note_a" style="width:170px;">"{{userNm}}"님에게 프리몬에 이력서업로드 요청을<br/>직접 하실 수 있습니다.<br/>("GSteletech"으로 요청됨)<span class="a_arrow"></span></p>
            	</span>
			</a>
			{{/isCareerList}}
			{{/isResumeFile}}
		</div>
		{{/isCancelYn}}
		{{/isRejectYn}}
		{{/isOpenTalentDetail}}
    </div>

    <div class="detail_info man_detail_graph cf sm-col-12">
		<h3 class="man_detail_tit">보유기술</h3>
    	<div class="graph xs-col-12 center">
        	<!-- 그래프자리 -->
            <canvas id="marksChart" width="325" height="300"></canvas>
                    </div>
                    <div class="graph_table xs-col-12">
                    	<h5 class="career_text">
							기술경력
							<a href="javascript:void(0)" class="note_q">
                            	<p class="note_a">등록된 경력을 기준으로<br />진행한 프로젝트의 기술을<br />계산하여 보여줍니다.<span class="a_arrow"></span></p>
                            </a>
							<span class="red">{{skillTotalYear}}</span>
						</h5>
                        <table class="board_g">
                        	<tbody>
								{{#detailCareerArr.skillCareerArr}}
                            	<tr>
                                	<td>
                                    	<h5 class="mb-0">{{SkillYear}}</h5>
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
							DBMS
							<a href="javascript:void(0)" class="note_q">
                            	<p class="note_a">등록된 경력을 기준으로<br />진행한 프로젝트의 DBMS<br />사용을 계산하여 보여줍니다.<span class="a_arrow"></span></p>
                            </a>
						</h5>
                        <table class="board_g">
                        	<tbody>
								{{#detailCareerArr.dbmsCareerArr}}
                            	<tr>
                                	<td>
                                    	<h5 class="mb-0">{{SkillYear}}</h5>
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
            	</div>
            </div>

{{#isProject}}
<!-- 제안 상세 -->
<div class="project_detail cf bg_darkgray in_case sm-hidden">
    <div class=" open col-12" data-action="openCommunicationPopup">
        <div class="man_detail_tit cf">
			<span class="project_state">
				{{#isTalentProposeDetailSearch}}
					제안{{#isRejectYn}}거절{{/isRejectYn}}{{#isCancelYn}}취소{{/isCancelYn}}
				{{/isTalentProposeDetailSearch}}
				{{#isTalentAppliDetailSearch}}
					{{prgsDivTitleStr}}
				{{/isTalentAppliDetailSearch}}
			</span>
			<div class="in_tit">
				<h3 class="project_name cf ellipsis">{{projNm}}</h3>
				<ul class="detail_man_ul cf">
                	<li>
						{{#isTalentProposeDetailSearch}}
							<span>제안{{#isRejectYn}}거절{{/isRejectYn}}{{#isCancelYn}}취소{{/isCancelYn}}일시</span>
							{{^isRejectYn}}{{^isCancelYn}}{{regDt}}{{/isCancelYn}}{{/isRejectYn}}
							{{#isRejectYn}}{{rejectDt}}{{/isRejectYn}}
							{{#isCancelYn}}{{cancelDt}}{{/isCancelYn}}
						{{/isTalentProposeDetailSearch}}
						{{#isTalentAppliDetailSearch}}
							<span>{{prgsDivDateStr}}</span>{{regDt}}</br>
                            <span>{{prgsDivReject}}</span>{{rejectReson}}{{#rejectReson}}{{#rejectResonText}},{{/rejectResonText}}{{/rejectReson}}{{rejectResonText}}
						{{/isTalentAppliDetailSearch}}
					</li>
					{{#isUnitPriceYn}}
					<li class="col-8">
						<span>제안단가</span>
						{{unitPrice}}만원 {{#isNegoYn}}(협의가능{{/isNegoYn}}{{^isNegoYn}}{{#isTravelExpYn}}({{/isTravelExpYn}}{{/isNegoYn}}{{#isTravelExpYn}}{{#isNegoYn}},{{/isNegoYn}}출장비 포함){{/isTravelExpYn}}{{^isTravelExpYn}}{{#isNegoYn}}){{/isNegoYn}}{{/isTravelExpYn}}
					</li>
					{{/isUnitPriceYn}}
            	</ul>
			</div>
		</div>
		{{#isInqueryList}}
        <div class="career_etc_con">
			<!--div class="talk_btn">
				<button id="btn" class="btn_open" data-action="openCommunicationPopup">메시지 남기기</button>
			</div-->
        	<div class="talk_box proj_talk" id="loadCommunicationList" style="max-height:500px; bottom:25px;">
				{{#inqueryList}}
				{{^me}}
                <!-- 상대 대화 -->
                <div class="talk you cf">
                    <div class="talk_con">
                        <div class="talk_in">
							{{{inqDtl}}}
                            <p class="arrow"></p>
                        	<p class="talk_time">{{#readYn}}읽음 {{/readYn}}{{^readYn}}안읽음 {{/readYn}}{{inqDt}}</p>
                    	</div>
                	</div>
                </div>
				{{/me}}
				{{#me}}
				<!-- 내 대화 -->
				<div class="talk me">
					<div class="talk_in">
						{{{inqDtl}}}
						<p class="arrow"></p>
						<p class="talk_time">{{#readYn}}읽음 {{/readYn}}{{^readYn}}안읽음 {{/readYn}}{{inqDt}}</p>
					</div>
				</div>
				{{/me}}
				{{/inqueryList}}
            </div>
			<div class="talk_btn">
				<button id="btnEdit" class="btn_no btn_mess" data-action="openCommunicationPopup" style="cursor:pointer;position:relative;">메시지 남기기</button>
			</div>
        </div>
		{{/isInqueryList}}
    </div>
</div>
{{/isProject}}

{{#hasChartData}}
    <div id="resume_chart" class="project_detail cf">
        {{#hasProjectTypeChartData}}
        <div class="chart cf">
			<div class="chart_tit">
				<h3>프로젝트 유형</h3>
				<h5 class="cf" id="pieChartText"></h5>
				<img src="/resources/images/new/chart1.png" class="chart_img" alt=""/>
			</div>
			<div id="piechart" class="chart_position" style=""></div>
		</div>
		{{/hasProjectTypeChartData}}
		{{#hasProjectRoleChartData}}
		<div class="chart cf">
			<div class="chart_tit">
				<h3>프로젝트 내 역할</h3>
				<h5 class="cf" id="roleChartText"></h5>
				<img src="/resources/images/new/chart2.png" class="chart_img" alt=""/>
			</div>
			<div id="role_div" class="chart_position" style=""></div>
		</div>
		{{/hasProjectRoleChartData}}
		{{#hasDomainChartData}}
		<div class="chart cf">
			<div class="chart_tit">
				<h3>분야</h3>
				<p>기간(개월)<p>
				<h5 class="red cf" id="domainChartText"></h5>
				<img src="/resources/images/new/chart3.png" class="chart_img" alt=""/>
			</div>
			<div id="domain_div" class="chart_position" style=""></div>
		</div>
		{{/hasDomainChartData}}
		{{#hasSkillChartData}}
		<div class="chart cf">
			<div class="chart_tit">
				<h3>전문기술</h3>
				<p>기간(개월)<p>
				<h5 class="red cf" id="skillChartText"></h5>
				<img src="/resources/images/new/chart4.png" class="chart_img" alt=""/>
			</div>
			<div id="skill_div" class="chart_position" style=""></div>
		</div>
		{{/hasSkillChartData}}
		{{#hasProjectChartData}}
		<div class="chart cf">
			<div class="chart_tit">
				<h3>프로젝트 경력</h3>
				<p>기간(개월)<p>
				<!-- <h5 class="red cf" id="projectChartText"></h5> -->
				<img src="/resources/images/new/chart5.png" class="chart_img" alt=""/>
			</div>
			<div id="project_div" class="chart_position" style=""></div>
		</div>
		{{/hasProjectChartData}}
	</div>
{{/hasChartData}}

<!-- 경력 -->
<div id="resume_project" class="project_detail cf">
	<h3 class="man_detail_tit careerList">총 경력<span>{{totalWorkCareer}}</span></h3>
	{{#isCareerList}}
    <div id="career" class="open">
    	<div class="year">
        	<div class="year_list">
            	<div class="box">
                    <ul class="yeaer_ul">
						{{#yearArr}}
                        <li {{#isFirst}}class="on"{{/isFirst}}><a href="#year{{i}}">{{year}}</a></li>
						{{/yearArr}}
                    </ul>
                </div>
            </div>
        </div>
        <div class="career_content">
			{{#careerList}}
        	<!-- 년별 경력 -->
        	<div id="year{{iCnt}}">
            	<h3 class="year_text">{{year}}</h3>
                <ul class="career_list cf">
					{{#careerArray}}
                	<!-- 경력 -->
                	<li class="cf">
						<p class="point"></p>
                    	<div class="career_date">
                        	<p>{{strtDt}} ~ {{endDt}} ({{date}})</p>
                        </div>
						<div class="career_con">
                        	<h3 class="project_name cf">
                                <span class="project_name_in max-col-12">
                                    {{#isCustomer}}<span class="career_company">{{customer}}</span>{{/isCustomer}}{{projNm}}
                                </span>
                            </h3>
							<ul class="project_ul cf mt-10">
								{{#isJobPos}}<li><span class="tech_icon tech1"><!--역할:-->{{jobPos}}</span></li>{{/isJobPos}}
                            </ul><div class="cf"></div>
                        	<ul class="project_ul cf mt-0">
                                <li>
                                	{{#isLang}}<span class="tech_icon tech2"><!--전문기술:-->{{lang}}</span>{{/isLang}}
									{{#isDbms}}<span class="tech_icon tech12"><!--DBMS:-->{{dbms}}</span>{{/isDbms}} 
									{{#isFramework}}<span class="tech_icon tech15"><!--프레임워크:-->{{framework}}</span>{{/isFramework}} 
									{{#isOs}}<span class="tech_icon tech11"><!--운영체제:-->{{os}}</span>{{/isOs}} 
									{{#isDevTool}}<span class="tech_icon tech14"><!--개발툴:-->{{devTool}}</span>{{/isDevTool}}
								</li>
                            </ul><div class="cf"></div>
                        </div>

						{{#isRole}}
						<div class="project_p" title="주요업무">
							<!-- 주요업무 -->
							<p class="show">{{{role}}}</p>
						</div>
						{{/isRole}}
						{{#isprojectDtl}}
						<div class="project_p" title="프로젝트 설명">
							<!-- 프로젝트 설명 -->
							<p class="show">{{{projectDtl}}}</p>
						</div>
						{{/isprojectDtl}}
						{{#isEtc}}
						<div class="project_p" title="기타">
							<!-- 기타 -->
							<p class="show">{{{etc}}}</p>
						</div>
						{{/isEtc}}
                    </li>
					{{/careerArray}}
                    <!-- /경력 -->
              </ul>
            </div>
			{{/careerList}}
            <!-- /년별 경력 -->
			{{^careerList}}
			{{/careerList}}
       </div>
    </div>
	{{/isCareerList}}
</div>

    
<!-- 웹 - 학력/자격증/수상내역 -->
<div id="resume_study" class="project_detail cf bg_darkgray sm-hidden">
    <div class="career_etc open">
        <h3 class="man_detail_tit">학력<span>{{schoolNm}} {{major}}</span></h3>
		{{#isSchoolList}}
        <div class="career_etc_con">
        	<ul>
			 {{#schoolList}}
             <li>
            	{{#isEntrncFinish}}<span>{{entrncDt}} ~ {{finishDt}}</span>{{/isEntrncFinish}}
                <span>{{schoolNm}} {{major}}</span>
             </li>
			 {{/schoolList}}
            </ul>
        </div>
		{{/isSchoolList}}
    </div>
    <div class="career_etc open">
        <h3 class="man_detail_tit">자격증</h3>
		{{#isCertificationList}}
        <div class="career_etc_con">
        	<ul>
				{{#certificationList}}
            	<li>
                	<span>{{acqrDt}}</span>
                    <span>{{quilifNm}}</span>
                    <span>{{publOrg}}</span>
                </li>
                {{/certificationList}}
            </ul>
        </div>
		{{/isCertificationList}}
    </div>
    <!--div class="career_etc open">
        <h3 class="man_detail_tit">교육내역</h3>
		{{#isEducationList}}
        <div class="career_etc_con">
        	<ul>
				{{#educationList}}
            	<li>
                	<span>{{eduStrtDt}} ~ {{eduEndDt}}</span>
                    <span>{{eduOrg}}</span>
                    <span>{{eduNm}}</span>
                </li>
				{{/educationList}}
            </ul>
        </div>
		{{/isEducationList}}
	</div-->
</div>

{{#isResumeNoteList}}
	{{#resumeNoteList}}
<div id="resume_etc" class="project_detail cf">
	<h3 class="man_detail_tit careerList">{{subject}}</h3>
    <div id="career" class="open career_pad" style="word-break: break-word;white-space: pre-wrap;">{{{contents}}}</div>
</div>
	{{/resumeNoteList}}
{{/isResumeNoteList}}

{{^isOpenTalentDetail}}
<div class="btn_box right sm-pr-15" {{#isTalentAppliDetailSearch}}data-value-userid="{{userId}}" data-value-applicntIdx="{{appliIdx}}"{{/isTalentAppliDetailSearch}}>
	{{#isTalentAppliDetailSearch}}
	
	{{#cntrctView}}
	<button type="button" id="btn" class="btn_normal btn_blue" data-action="contractView">{{btnContractView}}</button>
	{{/cntrctView}}
	{{#isApplicantCancel}}
		<button id="btn" class="btn_normal btn_gray" style="cursor:default;">{{btnApplicantCancel}}</button>
	{{/isApplicantCancel}}

    
    {{^isApplicantCancel}}
    {{#nextTime}}
        <button id="btn" class="btn_normal {{^refuseView}}btn_blue{{/refuseView}}{{#refuseView}}btn_gray{{/refuseView}}" {{^refuseView}}{{^cntrctDone}}data-action="applicantNextTime"{{/cntrctDone}}{{/refuseView}} style="cursor:pointer;">{{btnApplicantNextTime}}</button>
    {{/nextTime}}
        <button id="btn" class="btn_normal {{^refuseView}}btn_blue{{/refuseView}}{{#refuseView}}btn_gray{{/refuseView}}" {{^refuseView}}{{^cntrctDone}}data-action="applicantInterview"{{/cntrctDone}}{{/refuseView}} style="cursor:pointer;">{{contractStatelabel}}</button>
    {{/isApplicantCancel}}
	
	{{/isTalentAppliDetailSearch}}

    <button type="button" id="btnList" class="btn_normal btn_gray" data-action="listView" onClick="return false;">목록으로</button>
</div>
{{/isOpenTalentDetail}}

<div class="resume_link">
	<ul>
		<li class="active"><a href="#resume_info">기본정보</a></li>
{{#hasChartData}}
		<li><a href="#resume_chart">개요(그래프)</a></li>
{{/hasChartData}}
		<li><a href="#resume_project">수행프로젝트</a></li>
		<li><a href="#resume_study">학력/수상및자격</a></li>
		<li><a href="#resume_etc">기타</a></li>
	</ul>
</div>

{{/talentList}}

<script>
$(function(){
	$(".resume_link > ul > li").click(function(){
		$("#container .project_in .man_list .project_detail").animate({scrollTop:175},500,"easeInOutCirc");		
	});
	var menu = $(".resume_link > ul > li");
	var content = $(".man_list > div");
	menu.click(function(){
		menu.removeClass("active");
		$(this).addClass("active");
		var idx = $(this).index();
		var target = content.eq(idx);
		var tt = target.offset().top;
		tt = tt - 147;
		$("html,body").stop().animate({scrollTop:tt},500,"easeInOutCirc");
		return false;
	});
	$(window).scroll(function(){
		var st = $(window).scrollTop();
		st = -147;
		content.each(function() {
			var tg = $(this);
			var i = tg.index();
			if( tg.offset().top <= st ){
				menu.removeClass("active");
				menu.eq(i).addClass("active");	
			}			           
        });
		
	});	
});
</script>
</script>

 
<script id="projectListTemplate" type="text/x-mustache">
{{#projectList}}
	<option value="{{projIdx}}" data-price="{{unitPrice}}">{{projNm}}</option>
{{/projectList}}
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

<%@ include file="../common/footer.jsp" %>    		
</body>
</html>