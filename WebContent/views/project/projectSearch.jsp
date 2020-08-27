<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>




<!DOCTYPE html>
<html lang="ko">
<!-- Mirrored from www.freemon.co.kr/project/projectSearch by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 27 Jul 2020 06:59:41 GMT -->
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->
<head>

</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<!-- Google Tag Manager (noscript) -->
	<noscript><iframe src="http://www.googletagmanager.com/ns.html?id=GTM-MF7LK3J"
	height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
	<!-- End Google Tag Manager (noscript) -->

	<!-- <div class="load_box" style="display:none;"><div class="load_img"><img src="" alt="loading"/></div></div>  -->

		

<script type="text/javascript" src="../../resources/freemon/project/projectSearch6a91.js?version=1.7"></script>
<script type="text/javascript">
	$(function() {
		freemon.invoker.invoke("projectSearch");
	});
</script>
<!--Contents-->
<div id="container">
	<section class="project_in">
    	<!-- 제목부분 -->
    	<div class="pro_tit mb-0">
        	<h2>프로젝트 검색 <span><span class="totalCnt">111</span></span></h2>
			


<script type="text/javascript" src="../../resources/freemon/common/freemonSearch9667.js?version=1.2"></script>
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
        <input type="text" class="dateRangePicker col-9 pl-0" id ="searchStrDate" name ="searchStrDate" placeholder="프로젝트시작일" readonly="readonly" />
    </div>
    <div class="input_box col-7">
        <input type="text" name="keyword" id ="keyword" placeholder="예) 서울 java" />
    </div>
    <a href="#none" class="btn_search col-1" id="freemonSearchBtn">검색</a>
    <!-- <a href="#none" class="btn_search btn_reset sm-col-1" id="freemonReload">초기화</a> -->
</div>

        </div>
        
        <!-- 선택부분 -->
        <div class="choice">
        	<div class="cho_text"><span class="red" id="selectDateText"></span> 기준으로 <span class="red">지원가능한</span>프로젝트<span id="text_add"> 입니다.</span></div>
        	<div class="cho_man">
                <ul class="cf">
                	<li class="active"><a href="javascript:void(0);" data-action = "sortTypeClick" data-type="close">마감임박순</a></li>
                    <li><a href="javascript:void(0);" data-action = "sortTypeClick" data-type="new">최신순</a></li>
                </ul>
            </div>
            <div class="cho_show">
                <ul class="cf">
                	<li class="active cf">
                        <a href="javascript:void(0);" class="cho_icon1" data-action="showTypeClick" data-month="12">1년</a>
                    </li>
                    <li class=" cf">
                        <a href="javascript:void(0);" class="cho_icon1" data-action="showTypeClick" data-month="3">3개월</a>
                    </li>
                </ul>
            </div>
        </div>
        
        <!-- 추천검색어 -->
        <div class="choice">
        	<dl class="recom cf">
        		<dt>추천검색어</dt>
        		<dd></dd>
        	</dl>
        </div>
        
        <!-- 프로젝트목록 -->
        <div class="proj_list hidden xs-visible" id="projectSearchCardList">
        	<div class="m_thead" id="projectSearchCardListMonth"><!-- 달표시 --></div>
        	<ul class="card_list project_card cf" id="projectSearchCard">
        	</ul>
        </div>
        
        <div class="proj_list xs-hidden">
			<div id="projectSearchList">
				<div class="thead thead1">
					<div class="thead_in">
						<div class="th_month">
							<ul class="month12 cf">
								<li data-action="monthClick" data-date="20200601" style="cursor:pointer;">06월</li>
								<li data-action="monthClick" data-date="20200701" style="cursor:pointer;">07월</li>
								<li data-action="monthClick" data-date="20200801" style="cursor:pointer;">08월</li>
								<li data-action="monthClick" data-date="20200901" style="cursor:pointer;">09월</li>
								<li data-action="monthClick" data-date="20201001" style="cursor:pointer;">10월</li>
								<li data-action="monthClick" data-date="20201101" style="cursor:pointer;">11월</li>
								<li data-action="monthClick" data-date="20201201" style="cursor:pointer;">12월</li>
								<li data-action="monthClick" data-date="20210101" style="cursor:pointer;">01월</li>
								<li data-action="monthClick" data-date="20210201" style="cursor:pointer;">02월</li>
								<li data-action="monthClick" data-date="20210301" style="cursor:pointer;">03월</li>
								<li data-action="monthClick" data-date="20210401" style="cursor:pointer;">04월</li>
								<li data-action="monthClick" data-date="20210501" style="cursor:pointer;">05월</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="thead thead2">
					<div class="thead_in box">
						<div class="th_month">
							<ul class="month12 cf">
								<li data-action="monthClick" data-date="20200601" style="cursor:pointer;">06월</li>
								<li data-action="monthClick" data-date="20200701" style="cursor:pointer;">07월</li>
								<li data-action="monthClick" data-date="20200801" style="cursor:pointer;">08월</li>
								<li data-action="monthClick" data-date="20200901" style="cursor:pointer;">09월</li>
								<li data-action="monthClick" data-date="20201001" style="cursor:pointer;">10월</li>
								<li data-action="monthClick" data-date="20201101" style="cursor:pointer;">11월</li>
								<li data-action="monthClick" data-date="20201201" style="cursor:pointer;">12월</li>
								<li data-action="monthClick" data-date="20210101" style="cursor:pointer;">01월</li>
								<li data-action="monthClick" data-date="20210201" style="cursor:pointer;">02월</li>
								<li data-action="monthClick" data-date="20210301" style="cursor:pointer;">03월</li>
								<li data-action="monthClick" data-date="20210401" style="cursor:pointer;">04월</li>
								<li data-action="monthClick" data-date="20210501" style="cursor:pointer;">05월</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="card cf">
	                <div class="proj_info cf">
	                        <h4 data-value="804"><a href="javascript:void(0);" data-action="projectDetail">플랜정보기술</a></h4>
	                        <h3 data-value="804">
	                            <a href="javascript:void(0);" data-action="projectDetail">
                                    DB 모니터링 툴 개발<span class="add_info org">3개월</span>
                                </a>
	                        </h3>
	                        <ul class="pro_list cf">
	                            <li>서울 송파구</li>
								<li>1만원(협의가능)</li>
								<li class="tellipsis">MongoDB, Python, Oracle, Linux</li>
	                        </ul>
							<!-- 친구공유 -->
							<ul class="btn_icon absolute cf">
								<li class="share"><a href="javascript:void(0);" data-action="shareClick" data-value="804" title="친구공유">친구공유</a></li>
							</ul>
	                </div>
	                <div class="proj_sche">
	                	<div class="proj_sche_in cf">
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
	                        <!-- 최근 프로젝트 -->
	                        <div class="project2" style="left:19%;width:16.758241758241756%;" data-project-customer="플랜정보기술" data-project-idx="804" data-action="projectNoneInfo" data-customer="플랜정보기술" data-area="송파구" data-strtdt="08/10" data-closedt="10/10">
	                            <a href="javascript:void(0);" title="DB 모니터링 툴 개발<br></a>08/10 ~ 10/10">
									<h4 class="ellipsis">DB 모니터링 툴 개발</h4>
	                            	<p class="ellipsis">08/10 ~ 10/10</p>
	                            	<div class="day_start">08/10</div>
	                            	<div class="day_end">10/10</div>
								</a>
	                        </div>
	                        <!-- 투입가능일 -->
	                        <div class="line_able" style="left:19%;">
								<div class="day_able">08/09</div>
	                        </div>
						</div>
	                </div>
	                    
				</div>
				<div class="card cf">
	                <div class="proj_info cf">
	                        <h4 data-value="850"><a href="javascript:void(0);" data-action="projectDetail">모집중</a></h4>
	                        <h3 data-value="850">
	                            <a href="javascript:void(0);" data-action="projectDetail">
                                    [화성] 삼성전자 반도체  SCM 개발<span class="add_info org">5개월</span>
                                </a>
	                        </h3>
	                        <ul class="pro_list cf">
	                            <li>경기 화성시</li>
								<li>1만원(협의가능)</li>
								<li class="tellipsis">Java</li>
	                        </ul>
							<!-- 친구공유 -->
							<ul class="btn_icon absolute cf">
								<li class="share"><a href="javascript:void(0);" data-action="shareClick" data-value="850" title="친구공유">친구공유</a></li>
							</ul>
	                </div>
	                <div class="proj_sche">
	                	<div class="proj_sche_in cf">
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
	                        <!-- 최근 프로젝트 -->
	                        <div class="project2" style="left:19%;width:39.285714285714285%;" data-project-customer="모집중" data-project-idx="850" data-action="projectNoneInfo" data-customer="모집중" data-area="화성시" data-strtdt="08/10" data-closedt="12/31">
	                            <a href="javascript:void(0);" title="[화성] 삼성전자 반도체  SCM 개발<br></a>08/10 ~ 12/31">
									<h4 class="ellipsis">[화성] 삼성전자 반도체  SCM 개발</h4>
	                            	<p class="ellipsis">08/10 ~ 12/31</p>
	                            	<div class="day_start">08/10</div>
	                            	<div class="day_end">12/31</div>
								</a>
	                        </div>
	                        <!-- 투입가능일 -->
	                        <div class="line_able" style="left:19%;">
								<div class="day_able">08/09</div>
	                        </div>
						</div>
	                </div>
	                    
				</div>
				<div class="card cf">
	                <div class="proj_info cf">
	                        <h4 data-value="851"><a href="javascript:void(0);" data-action="projectDetail">모집중</a></h4>
	                        <h3 data-value="851">
	                            <a href="javascript:void(0);" data-action="projectDetail">
                                    [기흥] 삼성전자 반도체  자동화 포탈  구축<span class="add_info org">5개월</span>
                                </a>
	                        </h3>
	                        <ul class="pro_list cf">
	                            <li>경기 수원시</li>
								<li>1만원(협의가능)</li>
								<li class="tellipsis">Vue.js, Java</li>
	                        </ul>
							<!-- 친구공유 -->
							<ul class="btn_icon absolute cf">
								<li class="share"><a href="javascript:void(0);" data-action="shareClick" data-value="851" title="친구공유">친구공유</a></li>
							</ul>
	                </div>
	                <div class="proj_sche">
	                	<div class="proj_sche_in cf">
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
	                        <!-- 최근 프로젝트 -->
	                        <div class="project2" style="left:19%;width:39.285714285714285%;" data-project-customer="모집중" data-project-idx="851" data-action="projectNoneInfo" data-customer="모집중" data-area="수원시" data-strtdt="08/10" data-closedt="12/31">
	                            <a href="javascript:void(0);" title="[기흥] 삼성전자 반도체  자동화 포탈  구축<br></a>08/10 ~ 12/31">
									<h4 class="ellipsis">[기흥] 삼성전자 반도체  자동화 포탈  구축</h4>
	                            	<p class="ellipsis">08/10 ~ 12/31</p>
	                            	<div class="day_start">08/10</div>
	                            	<div class="day_end">12/31</div>
								</a>
	                        </div>
	                        <!-- 투입가능일 -->
	                        <div class="line_able" style="left:19%;">
								<div class="day_able">08/09</div>
	                        </div>
						</div>
	                </div>
	                    
				</div>
				<div class="card cf">
	                <div class="proj_info cf">
	                        <h4 data-value="854"><a href="javascript:void(0);" data-action="projectDetail">모집중</a></h4>
	                        <h3 data-value="854">
	                            <a href="javascript:void(0);" data-action="projectDetail">
                                    [을지로] 코리아세븐  업무시스템 구축 (AA 개발자) <span class="add_info org">12개월</span>
                                </a>
	                        </h3>
	                        <ul class="pro_list cf">
	                            <li>서울 중구</li>
								<li>1만원(협의가능)</li>
								<li class="tellipsis">Nexacro platform, Java, JSP</li>
	                        </ul>
							<!-- 친구공유 -->
							<ul class="btn_icon absolute cf">
								<li class="share"><a href="javascript:void(0);" data-action="shareClick" data-value="854" title="친구공유">친구공유</a></li>
							</ul>
	                </div>
	                <div class="proj_sche">
	                	<div class="proj_sche_in cf">
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
	                        <!-- 최근 프로젝트 -->
	                        <div class="project2" style="left:19%;width:97.52747252747253%;" data-project-customer="모집중" data-project-idx="854" data-action="projectNoneInfo" data-customer="모집중" data-area="중구" data-strtdt="08/10" data-closedt="07/31">
	                            <a href="javascript:void(0);" title="[을지로] 코리아세븐  업무시스템 구축 (AA 개발자) <br></a>08/10 ~ 07/31">
									<h4 class="ellipsis">[을지로] 코리아세븐  업무시스템 구축 (AA 개발자) </h4>
	                            	<p class="ellipsis">08/10 ~ 07/31</p>
	                            	<div class="day_start">08/10</div>
	                            	<div class="day_end">07/31</div>
								</a>
	                        </div>
	                        <!-- 투입가능일 -->
	                        <div class="line_able" style="left:19%;">
								<div class="day_able">08/09</div>
	                        </div>
						</div>
	                </div>
	                    
				</div>
				<div class="card cf">
	                <div class="proj_info cf">
	                        <h4 data-value="857"><a href="javascript:void(0);" data-action="projectDetail">모집중</a></h4>
	                        <h3 data-value="857">
	                            <a href="javascript:void(0);" data-action="projectDetail">
                                    [판교] NS홈쇼핑  서버 운영<span class="add_info org">17개월</span>
                                </a>
	                        </h3>
	                        <ul class="pro_list cf">
	                            <li>경기 성남시</li>
								<li>1만원(협의가능)</li>
								<li class="tellipsis">시스템운영</li>
	                        </ul>
							<!-- 친구공유 -->
							<ul class="btn_icon absolute cf">
								<li class="share"><a href="javascript:void(0);" data-action="shareClick" data-value="857" title="친구공유">친구공유</a></li>
							</ul>
	                </div>
	                <div class="proj_sche">
	                	<div class="proj_sche_in cf">
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
	                        <!-- 최근 프로젝트 -->
	                        <div class="project2" style="left:19%;width:99%;" data-project-customer="모집중" data-project-idx="857" data-action="projectNoneInfo" data-customer="모집중" data-area="성남시" data-strtdt="08/10" data-closedt="12/31">
	                            <a href="javascript:void(0);" title="[판교] NS홈쇼핑  서버 운영<br></a>08/10 ~ 12/31">
									<h4 class="ellipsis">[판교] NS홈쇼핑  서버 운영</h4>
	                            	<p class="ellipsis">08/10 ~ 12/31</p>
	                            	<div class="day_start">08/10</div>
	                            	<div class="day_end">12/31</div>
								</a>
	                        </div>
	                        <!-- 투입가능일 -->
	                        <div class="line_able" style="left:19%;">
								<div class="day_able">08/09</div>
	                        </div>
						</div>
	                </div>
	                    
	            </div>

			</div>
        </div>
       	<!-- 더보기 -->
        <div class="more_box" style="display:none;">
           	<a href="javascript:void(0);" class="btn_more center" data-action="moreViewClick"><span class="t_more">더보기</span></a>
        </div>
        
       	<!-- 팝업 -->
		<div class="pop_bg" id="projectInTalentList" style="display:none;">
		</div>
    </section>
</div>

<script id="projectSearchListTemplate" type="text/x-mustache">
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
	{{#projectList}}
	        	<!-- 목록형 -->
	            <div class="card cf">
	                <div class="proj_info cf">
	                        <h4 data-value="{{projIdx}}"><a href="javascript:void(0);" data-action="projectDetail">{{customer}}</a></h4>
	                        <h3 data-value="{{projIdx}}">
	                            <a href="javascript:void(0);" data-action="projectDetail">
                                    {{#closed}}<span class="add_info first gray">마감</span>{{/closed}}{{projNm}}<span class="add_info org">{{projTerm}}개월</span>
                                </a>
	                        </h3>
	                        <ul class="pro_list cf">
	                            <li>{{projUpperAddr}} {{projAddr}}</li>
								<li>{{unitPrice}}만원{{#negoYn}}(협의가능){{/negoYn}}</li>
								<li class="tellipsis">{{recruitSkillNm}}</li>
	                        </ul>
							<!-- 친구공유 -->
							<ul class="btn_icon absolute cf">
								<li class="share"><a href="javascript:void(0);" data-action = "shareClick" data-value="{{projIdx}}" title="친구공유">친구공유</a></li>
							</ul>
	                </div>
	                <div class="proj_sche">
	                	<div class="proj_sche_in cf">
	                        <div class="she{{month}}_gray">
	                            <ul class="cf">
									{{#monthArr}}
	                                <li></li>
									{{/monthArr}}
	                            </ul>
	                        </div>
	                        <!-- 최근 프로젝트 -->
	                        <div class="{{cssNm}}" style="left:{{leftwidth}}%;width:{{rightwidth}}%;"
								data-project-customer="{{customer}}" data-project-idx="{{projIdx}}" data-action="{{obj.action}}" data-customer="{{customer}}" data-area="{{projAddr}}" data-strtdt="{{strtDt}}" data-closedt="{{closeDt}}">
	                            <a href="javascript:void(0);" title="{{{projNm}}}<br/>{{projPeriod}}">
									<h4 class="ellipsis">{{projNm}}</h4>
	                            	<p class="ellipsis">{{projPeriod}}</p>
	                            	<div class="day_start">{{strtDt}}</div>
	                            	<div class="day_end">{{closeDt}}</div>
								</a>
	                        </div>
	                        <!-- 투입가능일 -->
	                        <div class="line_able" style="left:{{initwidth}}%;">
								<div class="day_able">{{searchDay}}</div>
	                        </div>
						</div>
	                </div>
	                    
	            </div>
	{{/projectList}}
	{{^projectList}}
		<div class="project_box no_data cf" style="text-align:center;">조회 결과가 없습니다.</div>
	{{/projectList}}
{{/obj}}
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


    		

</body>
	<%@ include file="../common/footer.jsp" %>

<!-- Mirrored from www.freemon.co.kr/project/projectSearch by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 27 Jul 2020 06:59:42 GMT -->
</html>