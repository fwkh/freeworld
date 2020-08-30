<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="../common/header.jsp" %>
	    <!-- 네비게이션바 -->
	<style type="text/css">	  
	  #f_search{display:none;}
	  #notice{display:none;}
	  #f_management{display:none;}
	  #p_management{display:none;}
	  #login{display:none;}
	  #service{display:none;}
	</style>
</head>
<body>

		
<script type="text/javascript" src="../resources/freemon/mypage/myCompFreemon.js"></script>
<!-- <script type="text/javascript">
	$(function() {
		freemon.invoker.invoke("myCompFreemon");
	});
</script> -->

<div id="container">
	<section class="project_in margintop" style="min-height: 1099px;">
    	<!-- 제목부분 -->
    	<div class="pro_tit mb-0">
        	<h2>Samsoung
            </h2>
        </div>
        <ul class="man_tab my_man_tab cf">
       		<li class="active"><a href="#none">마이프리몬</a></li>
       		<li><a href="../account/companyConfig.html">정보변경</a></li>
            <li><a href="../mypage/myProjectSearch.html">프로젝트 관리</a></li>
            <li><a href="/customer/questionRegistForm">문의하기</a></li>
            <li><a href="#none" class="common-open_popup" data-div="alamn" data-user-div="company">알림설정</a></li>
       	</ul>
        <!-- 카운트 -->
        <div class="counter com_counter">
        	<ul class="cf">
                <li title="프로젝트 마감 제외"><a href="/applicant/compApplicantSearch?dv=1"><h5>제안한 프리랜서<!-- <span class="arrow"></span> --></h5><p><span class="icon"></span>0</p></a></li>
                <li title="프로젝트 마감 제외"><a href="/applicant/compApplicantSearch?dv=3"><h5>지원한 프리랜서<!-- <span class="arrow"></span> --></h5><p><span class="icon"></span>1</p></a></li>
                <li><a href="/talent/interestTalent?dv=1"><h5>관심 프리랜서<!-- <span class="arrow"></span> --></h5><p><span class="icon"></span><span id="textInterestCount">1</span></p></a></li>
                <li><a href="/talent/interestTalent?dv=2"><h5>전속 프리랜서<!-- <span class="arrow"></span> --></h5><p><span class="icon"></span><span id="textExclusiveCount">1</span></p></a></li>
                <li title="프로젝트 마감 포함"><a href="/applicant/compApplicantSearch?dv=4"><h5>계약된 프리랜서<!-- <span class="arrow"></span> --></h5><p><span class="icon"></span>0</p></a></li>
            </ul>
        </div>
        <!-- 프로젝트 & 제안 및 지원현황 -->
        <div class="mt-40 cf">
        	<div class="col-6 pr-15">
            	<!-- 프로젝트 -->
                <div class="dash">
                    <div class="dash_tit">
                        <h3>등록된 프로젝트</h3>
                        <a href="/mypage/myProjectSearch" class="more">전체보기</a>
                    </div>
                    <div class="dash_list" id="myProjectList">
	<div class="card cf closed">
		<div class="pro_info">
            <h4><a href="#non" data-action="projectDetail" data-id="825">지에스인스텍</a></h4>
			<h3 class="project_name cf ellipsis">
				
				<span class="project_name_in">
					<a href="#none" data-action="projectDetail" data-id="825">웹사이트개발</a>
				</span>
				
			</h3>
			<ul class="pro_list surport cf mt-10" style="width:500px;">
                <li>2020.08.25 ~ 2020.09.15</li>
                <li>서울 강남구</li>
				<li>1만원<span class="add_info">협의가능</span></li>
                <li class="ellipsis" style="max-width:calc(100% - 210px);">Java, JavaScript, MySQL</li>
            </ul>
		</div>
		<div class="report list2">
			<ul class="report_in cf">
				<li class="note_back on"><a href="#none" data-action="applicantList" data-id="825">지원  1</a></li>
				<li class="note_agree "><a href="#none" data-action="contractList" data-id="825">계약  0</a></li>
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
                        <h3>제안 및 지원자 현황</h3>
                        <a href="/applicant/compApplicantSearch" class="more">전체보기</a>
                    </div>
                    <div class="dash_list applicant" id="myApplicantList">
                    
    <div class="man_info no_data cf" style="text-align:center;padding-top:40px;">조회 결과가 없습니다.</div>
</div>
                </div>
                <!-- /제안 및 지원현황 -->
            </div>
        </div>
        
        <div class="mt-40 cf">
        	<div class="col-4 pr-14">
            	<!-- 추천인재 -->
            	<div class="dash">
                    <div class="dash_tit">
                        <h3>
                        	<span class="red">추천</span>프리랜서
                        	<a href="#none" class="note_q">
                            	<p class="note_a">등록된 프로젝트 기준으로<br>추천드립니다.<span class="a_arrow"></span></p>
                            </a>
                        </h3>
                        <a href="/talent/talentSearch" class="more">전체보기</a>
                    </div>
                    <div class="dash_list recommend" id="myRecommandList">
	<div class="man_info">
		<div class="free_info col-12 cf">
			<div class="profile" style="cursor:pointer;background-image:url(http://th-p.talk.kakao.co.kr/th/talkp/wlCGiGy6iU/rELCIRJsb86xhkAztwWVK0/y5qfxg_110x110_c.jpg)" data-action="talentDetail" data-id="1104149360" data-dv="1">프로필사진</div>
			<div class="pro_con">
				<!--div class="report2 list2">
					<ul class="alarm cf">
						<li class="alarm2 on">투입가능</li>
					</ul>
				</div-->
				<h3 data-action="talentDetail" data-id="1104149360" data-dv="1">
					<a href="#none" data-action="talentDetail" data-id="1104149360" data-dv="1">김명국</a>
					<ul class="f_nature cf">
                    	<li>38세</li>
                    	<li class="ellipsis">서울 강남구</li>
					</ul>
				</h3>
				<ul class="free_list cf">
                	<li>총 0년</li>
					<li class="ellipsis">
						
						Java, JSP, NodeJS, JavaScript, Oracle
					</li>
				</ul>
                <!-- 해시태그, 투입가능일 -->
                <div class="add_con cf">
                    <div class="hash ellipsis"> 
                        <ul class="cf"> 
                            
                        </ul>
                    </div>
                    <p class="able on">투입가능</p>
                </div>
				<ul class="btn_icon absolute cf">
					<li class="like ">
						<a href="#none" data-value="1104149360" data-action="talentInterest" title="관심프리랜서">관심프리랜서</a>
					</li>
					<li class="pick ">
						<a href="#none" data-value="1104149360" data-nm="김명국" data-action="talentExclusive" title="전속프리랜서<br></a>전속프리랜서는 프리랜서가 기업에 소속되는 관계로 둘다 동의시 프리랜서검색에 노출되지 않습니다.">전속프리랜서</a>
					</li>
					<!--li class="tree">
						<a href="#none" data-value="1104149360" data-action="relationTalent" title="인맥트리">인맥트리</a>
					</li-->
					<li class="memo ">
						<a href="#none" class="talentMemo ellipsis" data-value="1104149360" data-name="김명국" data-action="talentMeno" title=""></a>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<div class="man_info">
		<div class="free_info col-12 cf">
			<div class="profile" style="cursor:pointer;background-image:url(http://k.kakaocdn.net/dn/kRjMG/btqwgBoK4Uq/JWK00bQCgq9gNhe338Rki1/profile_110x110c.jpg)" data-action="talentDetail" data-id="1110861456" data-dv="1">프로필사진</div>
			<div class="pro_con">
				<!--div class="report2 list2">
					<ul class="alarm cf">
						<li class="alarm2 on">투입가능</li>
					</ul>
				</div-->
				<h3 data-action="talentDetail" data-id="1110861456" data-dv="1">
					<a href="#none" data-action="talentDetail" data-id="1110861456" data-dv="1">김진규</a>
					<ul class="f_nature cf">
                    	<li>41세</li>
                    	<li class="ellipsis">서울</li>
					</ul>
				</h3>
				<ul class="free_list cf">
                	<li>총 0년</li>
					<li class="ellipsis">
						
						ASP.NET, C#, Jquery, JavaScript, MS-SQL
					</li>
				</ul>
                <!-- 해시태그, 투입가능일 -->
                <div class="add_con cf">
                    <div class="hash ellipsis"> 
                        <ul class="cf"> 
                            
                        </ul>
                    </div>
                    <p class="able on">투입가능</p>
                </div>
				<ul class="btn_icon absolute cf">
					<li class="like ">
						<a href="#none" data-value="1110861456" data-action="talentInterest" title="관심프리랜서">관심프리랜서</a>
					</li>
					<li class="pick ">
						<a href="#none" data-value="1110861456" data-nm="김진규" data-action="talentExclusive" title="전속프리랜서<br></a>전속프리랜서는 프리랜서가 기업에 소속되는 관계로 둘다 동의시 프리랜서검색에 노출되지 않습니다.">전속프리랜서</a>
					</li>
					<!--li class="tree">
						<a href="#none" data-value="1110861456" data-action="relationTalent" title="인맥트리">인맥트리</a>
					</li-->
					<li class="memo ">
						<a href="#none" class="talentMemo ellipsis" data-value="1110861456" data-name="김진규" data-action="talentMeno" title=""></a>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<div class="man_info">
		<div class="free_info col-12 cf">
			<div class="profile" style="cursor:pointer;background-image:url(../resources/images/new/no-pic.png)" data-action="talentDetail" data-id="1151343516" data-dv="1">프로필사진</div>
			<div class="pro_con">
				<!--div class="report2 list2">
					<ul class="alarm cf">
						<li class="alarm2 on">투입가능</li>
					</ul>
				</div-->
				<h3 data-action="talentDetail" data-id="1151343516" data-dv="1">
					<a href="#none" data-action="talentDetail" data-id="1151343516" data-dv="1">김재민</a>
					<ul class="f_nature cf">
                    	<li>40세</li>
                    	<li class="ellipsis">울산</li>
					</ul>
				</h3>
				<ul class="free_list cf">
                	<li>총 0년</li>
					<li class="ellipsis">
						
						JavaScript, Oracle
					</li>
				</ul>
                <!-- 해시태그, 투입가능일 -->
                <div class="add_con cf">
                    <div class="hash ellipsis"> 
                        <ul class="cf"> 
                            
                        </ul>
                    </div>
                    <p class="able on">투입가능</p>
                </div>
				<ul class="btn_icon absolute cf">
					<li class="like ">
						<a href="#none" data-value="1151343516" data-action="talentInterest" title="관심프리랜서">관심프리랜서</a>
					</li>
					<li class="pick ">
						<a href="#none" data-value="1151343516" data-nm="김재민" data-action="talentExclusive" title="전속프리랜서<br></a>전속프리랜서는 프리랜서가 기업에 소속되는 관계로 둘다 동의시 프리랜서검색에 노출되지 않습니다.">전속프리랜서</a>
					</li>
					<!--li class="tree">
						<a href="#none" data-value="1151343516" data-action="relationTalent" title="인맥트리">인맥트리</a>
					</li-->
					<li class="memo ">
						<a href="#none" class="talentMemo ellipsis" data-value="1151343516" data-name="김재민" data-action="talentMeno" title=""></a>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<div class="man_info">
		<div class="free_info col-12 cf">
			<div class="profile" style="cursor:pointer;background-image:url(http://th-p.talk.kakao.co.kr/th/talkp/wlM6QmclUn/FiQduPqd5qVcf3IGfru68k/337134_110x110_c.jpg)" data-action="talentDetail" data-id="1163425993" data-dv="1">프로필사진</div>
			<div class="pro_con">
				<!--div class="report2 list2">
					<ul class="alarm cf">
						<li class="alarm2 on">투입가능</li>
					</ul>
				</div-->
				<h3 data-action="talentDetail" data-id="1163425993" data-dv="1">
					<a href="#none" data-action="talentDetail" data-id="1163425993" data-dv="1">김준엽</a>
					<ul class="f_nature cf">
                    	<li>23세</li>
                    	<li class="ellipsis">울산</li>
					</ul>
				</h3>
				<ul class="free_list cf">
                	<li>총 0년</li>
					<li class="ellipsis">
						
						JSP, JavaScript, Oracle, MS-SQL, MySQL
					</li>
				</ul>
                <!-- 해시태그, 투입가능일 -->
                <div class="add_con cf">
                    <div class="hash ellipsis"> 
                        <ul class="cf"> 
                            
                        </ul>
                    </div>
                    <p class="able on">투입가능</p>
                </div>
				<ul class="btn_icon absolute cf">
					<li class="like ">
						<a href="#none" data-value="1163425993" data-action="talentInterest" title="관심프리랜서">관심프리랜서</a>
					</li>
					<li class="pick ">
						<a href="#none" data-value="1163425993" data-nm="김준엽" data-action="talentExclusive" title="전속프리랜서<br></a>전속프리랜서는 프리랜서가 기업에 소속되는 관계로 둘다 동의시 프리랜서검색에 노출되지 않습니다.">전속프리랜서</a>
					</li>
					<!--li class="tree">
						<a href="#none" data-value="1163425993" data-action="relationTalent" title="인맥트리">인맥트리</a>
					</li-->
					<li class="memo ">
						<a href="#none" class="talentMemo ellipsis" data-value="1163425993" data-name="김준엽" data-action="talentMeno" title=""></a>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>
                </div>
                <!-- /추천인재 -->
            </div>
            <div class="col-4 pr-7 pl-7">
            	<!-- 관심인재 -->
            	<div class="dash">
                    <div class="dash_tit">
                        <h3>
                        	관심프리랜서
                        	<a href="#none" class="note_q">
                            	<p class="note_a w250">함께 하고픈 프리랜서를 관심프리랜서로 등록하면<br>해당 프리랜서만을 모아보실 수 있습니다. <span class="a_arrow"></span></p>
                            </a>
                        </h3>
                        <a href="/talent/interestTalent?dv=1" class="more">전체보기</a>
                    </div>
                    <div class="dash_list" id="myInterestList">
	<div class="man_info">
		<div class="free_info col-12 cf">
			<div class="profile" style="cursor:pointer;background-image:url(../resources/images/new/no-pic.png)" data-action="talentDetail" data-id="1435864601" data-dv="1">프로필사진</div>
			<div class="pro_con">
				<!--div class="report2 list2">
					<ul class="alarm cf">
						<li class="alarm2 ">30일후</li>
					</ul>
				</div-->
				<h3 data-action="talentDetail" data-id="1435864601" data-dv="1">
					<a href="#none" data-action="talentDetail" data-id="1435864601" data-dv="1">모두한</a>
					<ul class="f_nature cf">
                    	<li>26세</li>
                    	<li class="ellipsis">서울</li>
					</ul>
				</h3>
				<ul class="free_list cf">
                	<li>총 0년</li>
					<li class="ellipsis">
						
						ASP, JSP
					</li>
				</ul>
                <!-- 해시태그, 투입가능일 -->
                <div class="add_con cf">
                    <div class="hash ellipsis"> 
                        <ul class="cf"> 
                            <li>#344</li>
                        </ul>
                    </div>
                    <p class="able ">30일후</p>
                </div>
				<ul class="btn_icon absolute cf">
					<li class="like active">
						<a href="#none" data-value="1435864601" data-action="talentInterest" title="관심프리랜서">관심프리랜서</a>
					</li>
					<li class="pick active">
						<a href="#none" data-value="1435864601" data-nm="모두한" data-action="talentExclusive" title="전속프리랜서<br></a>전속프리랜서는 프리랜서가 기업에 소속되는 관계로 둘다 동의시 프리랜서검색에 노출되지 않습니다.">전속프리랜서</a>
					</li>
					<!--li class="tree">
						<a href="#none" data-value="1435864601" data-action="relationTalent" title="인맥트리">인맥트리</a>
					</li-->
					<li class="memo ">
						<a href="#none" class="talentMemo ellipsis" data-value="1435864601" data-name="모두한" data-action="talentMeno" title=""></a>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>
                </div>
                <!-- /관심인재 -->
            </div>
            <div class="col-4 pl-14">
            	<!-- 전속인재 -->
            	<div class="dash">
                    <div class="dash_tit">
                        <h3>전속프리랜서</h3>
                        <a href="/talent/interestTalent?dv=2" class="more">전체보기</a>
                    </div>
                    <div class="dash_list" id="myExclusiveList">
	<div class="man_info">
		<div class="free_info col-12 bg_white no_float cf">
			<div class="profile" style="cursor:pointer;background-image:url(../resources/images/new/no-pic.png)" data-action="talentDetail" data-id="1435864601" data-dv="2">프로필사진</div>
			<div class="pro_con">
				<!--div class="report2 list2">
					<ul class="alarm cf">
						<li class="alarm2 ">30일후</li>
					</ul>
				</div-->
				<h3 data-action="talentDetail" data-id="1435864601" data-dv="2">
					<a href="#none" data-action="talentDetail" data-id="1435864601" data-dv="2">모두한</a>
					<ul class="f_nature cf">
                    	<li>26세</li>
                    	<li class="ellipsis">서울</li>
					</ul>
				</h3><div class="cf"></div>
				<ul class="free_list cf">
                	<li>총 0년</li>
					<li class="ellipsis">
						
						ASP, JSP
					</li>
				</ul>
                <!-- 해시태그, 투입가능일 -->
                <div class="add_con cf">
                    <div class="hash ellipsis"> 
                        <ul class="cf"> 
                            <li>#344</li>
                        </ul>
                    </div>
                    <p class="able ">30일후</p>
                </div>
				<ul class="btn_icon absolute  cf">
					<li class="like active">
						<a href="#none" data-value="1435864601" data-action="talentInterest" title="관심프리랜서">관심프리랜서</a>
					</li>
					<li class="pick active">
						<a href="#none" data-value="1435864601" data-nm="모두한" data-action="talentExclusive" title="전속프리랜서 관계를 해제합니다.">전속프리랜서</a>
					</li>
					<!--li class="tree">
						<a href="#none" data-value="1435864601" data-action="relationTalent" title="인맥트리">인맥트리</a>
					</li-->
					<li class="memo ">
						<a href="#none" class="talentMemo ellipsis" data-value="1435864601" data-name="모두한" data-action="talentMeno" title=""></a>
					</li>
				</ul>
			</div>
		</div>
		<div class="info_bottom closed">
			<p class="no_data">진행중인 프로젝트가 없습니다.</p>
		</div>
	</div>
</div>
                </div>
                <!-- /전속인재 -->
            </div>
        </div>
    </section>
    
    <!-- 팝업 -->
	<div class="pop_bg" id="projectInTalentList" style="display:none;">
	</div>
</div>

<script id="myProjectListTemplate" type="text/x-mustache">
{{#projectList}}
	<div class="card cf {{#isClosed}}closed{{/isClosed}}">
		<div class="pro_info">
            <h4><a href="#non" data-action="projectDetail" data-id="{{projIdx}}">{{customer}}</a></h4>
			<h3 class="project_name cf ellipsis">
				{{#isDeadline}}<span class="mark">마감임박</span>{{/isDeadline}}
				<span class="project_name_in">
					<a href="#none" data-action="projectDetail" data-id="{{projIdx}}">{{projNm}}</a>
				</span>
				
			</h3>
			<ul class="pro_list surport cf mt-10" style="width:500px;">
                <li>{{projStrtDt}} ~ {{projCloseDt}}</li>
                <li>{{projUpperAddr}} {{projAddr}}</li>
				<li>{{unitPrice}}만원{{#negoYn}}<span class="add_info">협의가능</span>{{/negoYn}}</li>
                <li class="ellipsis" style="max-width:calc(100% - 210px);">{{recruitSkillNm}}</li>
            </ul>
		</div>
		<div class="report list2">
			<ul class="report_in cf">
				<li class="note_back {{#isApplicantCount}}on{{/isApplicantCount}}"><a href="#none" data-action="applicantList" data-id="{{projIdx}}">지원  {{applicantCount}}</a></li>
				<li class="note_agree {{#isContractCount}}on{{/isContractCount}}"><a href="#none" data-action="contractList" data-id="{{projIdx}}">계약  {{contractCount}}</a></li>
			</ul>
		</div>
	</div>
{{/projectList}}
{{^projectList}}
    <div class="man_info no_data cf" style="text-align:center;padding-top:40px;">조회 결과가 없습니다.</div>
{{/projectList}}
</script>

<script id="myApplicantListTemplate" type="text/x-mustache">
{{#applicantList}}
	<div class="man_info {{#isClosed}}closed{{/isClosed}}">
		<div class="info_bottom">
			<h3 class="project_name cf">
				<span class="project_state ">
					{{prgsDivNm}}{{tailText}}
				</span>
				<a href="#none" class="ellipsis" data-action="projectDetail" data-id="{{projIdx}}">{{projNm}}</a>
				<span class="date">{{regDt}}</span>
			</h3>
		</div>
		<div class="info_top cf">
			<div class="profile" style="cursor:pointer;background-image:url({{profileUrl}})" data-action="{{#isPropose}}proposeDetail{{/isPropose}}{{^isPropose}}applicantDetail{{/isPropose}}" data-id="{{userId}}" data-projidx="{{projIdx}}" {{#isPropose}}data-dv="1" data-app="{{proIdx}}"{{/isPropose}} {{^isPropose}}data-app="{{applicntidx}}" {{#isContract}}data-dv="4"{{/isContract}}{{^isContract}}data-dv="3"{{/isContract}}{{/isPropose}}>프로필사진</div>
			<div class="pro_con">
				<!--div class="report2 list2">
					<ul class="alarm cf">
						<li class="alarm2 {{leaveStrtTermCss}}">{{leaveStrtTermTxt}}</li>
					</ul>
				</div-->
				<h3 data-action="{{#isPropose}}proposeDetail{{/isPropose}}{{^isPropose}}applicantDetail{{/isPropose}}" data-id="{{userId}}" data-projidx="{{projIdx}}" {{#isPropose}}data-dv="1" data-app="{{proIdx}}"{{/isPropose}} {{^isPropose}}data-app="{{applicntidx}}" {{#isContract}}data-dv="4"{{/isContract}}{{^isContract}}data-dv="3"{{/isContract}}{{/isPropose}}>
					<a href="#none" data-action="{{#isPropose}}proposeDetail{{/isPropose}}{{^isPropose}}applicantDetail{{/isPropose}}" data-id="{{userId}}" data-projidx="{{projIdx}}" {{#isPropose}}data-dv="1" data-app="{{proIdx}}"{{/isPropose}} {{^isPropose}}data-app="{{applicntidx}}" {{#isContract}}data-dv="4"{{/isContract}}{{^isContract}}data-dv="3"{{/isContract}}{{/isPropose}}>{{userNm}}</a>
					<ul class="f_nature cf">
                    	<li>{{#isGenderNm}}{{genderNm}}{{#age}},{{/age}} {{/isGenderNm}}{{#age}}{{age}}세{{/age}}</li>
                    	<li class="ellipsis">{{hopeAreaNm}}</li>
					</ul>
				</h3>
				<ul class="free_list cf">
                	<li>총 {{totalWorkCareer}}</li>
					<li class="ellipsis">
						
						{{usableSkillNm}}
					</li>
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
                <ul class="btn_icon absolute cf">
					<li class="like {{#isInterest}}active{{/isInterest}}">
						<a href="#none" data-value="{{userId}}" data-action="talentInterest" title="관심프리랜서">관심프리랜서</a>
					</li>
					<li class="pick {{#isExclusive}}active{{/isExclusive}}">
						<a href="#none" data-value="{{userId}}" data-nm="{{userNm}}" data-action="talentExclusive" title="전속프리랜서<br/>전속프리랜서는 프리랜서가 기업에 소속되는 관계로 둘다 동의시 프리랜서검색에 노출되지 않습니다.">전속프리랜서</a>
					</li>
					<!--li class="tree">
						<a href="#none" data-value="{{userId}}" data-action="relationTalent" title="인맥트리">인맥트리</a>
					</li-->
					<li class="memo {{#memoYN}}active{{/memoYN}}">
						<a href="#none" class="talentMemo ellipsis" data-value="{{userId}}" data-name="{{userNm}}" data-action = "talentMeno" title="{{memo}}">{{memo}}{{#memoYN}}<span></span>{{/memoYN}}</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
{{/applicantList}}
{{^applicantList}}
    <div class="man_info no_data cf" style="text-align:center;padding-top:40px;">조회 결과가 없습니다.</div>
{{/applicantList}}
</script>

<script id="myInterestListTemplate" type="text/x-mustache">
{{#talentList}}
	<div class="man_info">
		<div class="free_info col-12 cf">
			<div class="profile" style="cursor:pointer;background-image:url({{profileUrl}})" data-action="talentDetail" data-id="{{userId}}" data-dv="1">프로필사진</div>
			<div class="pro_con">
				<!--div class="report2 list2">
					<ul class="alarm cf">
						<li class="alarm2 {{leaveStrtTermCss}}">{{leaveStrtTermTxt}}</li>
					</ul>
				</div-->
				<h3 data-action="talentDetail" data-id="{{userId}}" data-dv="1">
					<a href="#none" data-action="talentDetail" data-id="{{userId}}" data-dv="1">{{userNm}}</a>
					<ul class="f_nature cf">
                    	<li>{{#isGenderNm}}{{genderNm}}{{#age}},{{/age}} {{/isGenderNm}}{{#age}}{{age}}세{{/age}}</li>
                    	<li class="ellipsis">{{hopeAreaNm}}</li>
					</ul>
				</h3>
				<ul class="free_list cf">
                	<li>총 {{totalWorkCareer}}</li>
					<li class="ellipsis">
						
						{{usableSkillNm}}
					</li>
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
				<ul class="btn_icon absolute cf">
					<li class="like {{#isInterest}}active{{/isInterest}}">
						<a href="#none" data-value="{{userId}}" data-action="talentInterest" title="관심프리랜서">관심프리랜서</a>
					</li>
					<li class="pick {{#isExclusive}}active{{/isExclusive}}">
						<a href="#none" data-value="{{userId}}" data-nm="{{userNm}}" data-action="talentExclusive" title="전속프리랜서<br/>전속프리랜서는 프리랜서가 기업에 소속되는 관계로 둘다 동의시 프리랜서검색에 노출되지 않습니다.">전속프리랜서</a>
					</li>
					<!--li class="tree">
						<a href="#none" data-value="{{userId}}" data-action="relationTalent" title="인맥트리">인맥트리</a>
					</li-->
					<li class="memo {{#memoYN}}active{{/memoYN}}">
						<a href="#none" class="talentMemo ellipsis" data-value="{{userId}}" data-name="{{userNm}}" data-action = "talentMeno" title="{{memo}}">{{memo}}{{#memoYN}}<span></span>{{/memoYN}}</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
{{/talentList}}
{{^talentList}}
    <div class="man_info no_data cf" style="text-align:center;padding-top:40px;">조회 결과가 없습니다.</div>
{{/talentList}}
</script>

<script id="myRecommandListTemplate" type="text/x-mustache">
{{#talentList}}
	<div class="man_info">
		<div class="free_info col-12 cf">
			<div class="profile" style="cursor:pointer;background-image:url({{profileUrl}})" data-action="talentDetail" data-id="{{userId}}" data-dv="1">프로필사진</div>
			<div class="pro_con">
				<!--div class="report2 list2">
					<ul class="alarm cf">
						<li class="alarm2 {{leaveStrtTermCss}}">{{leaveStrtTermTxt}}</li>
					</ul>
				</div-->
				<h3 data-action="talentDetail" data-id="{{userId}}" data-dv="1">
					<a href="#none" data-action="talentDetail" data-id="{{userId}}" data-dv="1">{{userNm}}</a>
					<ul class="f_nature cf">
                    	<li>{{#isGenderNm}}{{genderNm}}{{#age}},{{/age}} {{/isGenderNm}}{{#age}}{{age}}세{{/age}}</li>
                    	<li class="ellipsis">{{hopeAreaNm}}</li>
					</ul>
				</h3>
				<ul class="free_list cf">
                	<li>총 {{totalWorkCareer}}</li>
					<li class="ellipsis">
						
						{{usableSkillNm}}
					</li>
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
				<ul class="btn_icon absolute cf">
					<li class="like {{#isInterest}}active{{/isInterest}}">
						<a href="#none" data-value="{{userId}}" data-action="talentInterest" title="관심프리랜서">관심프리랜서</a>
					</li>
					<li class="pick {{#isExclusive}}active{{/isExclusive}}">
						<a href="#none" data-value="{{userId}}" data-nm="{{userNm}}" data-action="talentExclusive" title="전속프리랜서<br/>전속프리랜서는 프리랜서가 기업에 소속되는 관계로 둘다 동의시 프리랜서검색에 노출되지 않습니다.">전속프리랜서</a>
					</li>
					<!--li class="tree">
						<a href="#none" data-value="{{userId}}" data-action="relationTalent" title="인맥트리">인맥트리</a>
					</li-->
					<li class="memo {{#memoYN}}active{{/memoYN}}">
						<a href="#none" class="talentMemo ellipsis" data-value="{{userId}}" data-name="{{userNm}}" data-action = "talentMeno" title="{{memo}}">{{memo}}{{#memoYN}}<span></span>{{/memoYN}}</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
{{/talentList}}
{{^talentList}}
    <div class="man_info no_data cf" style="text-align:center;padding-top:40px;">조회 결과가 없습니다.</div>
{{/talentList}}
</script>

<script id="myExclusiveListTemplate" type="text/x-mustache">
{{#talentList}}
	<div class="man_info">
		<div class="free_info col-12 bg_white no_float cf">
			<div class="profile" style="cursor:pointer;background-image:url({{profileUrl}})" data-action="talentDetail" data-id="{{userId}}" data-dv="2">프로필사진</div>
			<div class="pro_con">
				<!--div class="report2 list2">
					<ul class="alarm cf">
						<li class="alarm2 {{leaveStrtTermCss}}">{{leaveStrtTermTxt}}</li>
					</ul>
				</div-->
				<h3 data-action="talentDetail" data-id="{{userId}}" data-dv="2">
					<a href="#none" data-action="talentDetail" data-id="{{userId}}" data-dv="2">{{userNm}}</a>
					<ul class="f_nature cf">
                    	<li>{{#isGenderNm}}{{genderNm}}{{#age}},{{/age}} {{/isGenderNm}}{{#age}}{{age}}세{{/age}}</li>
                    	<li class="ellipsis">{{hopeAreaNm}}</li>
					</ul>
				</h3><div class="cf"></div>
				<ul class="free_list cf">
                	<li>총 {{totalWorkCareer}}</li>
					<li class="ellipsis">
						
						{{usableSkillNm}}
					</li>
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
				<ul class="btn_icon absolute  cf">
					<li class="like {{#isInterest}}active{{/isInterest}}">
						<a href="#none" data-value="{{userId}}" data-action="talentInterest" title="관심프리랜서">관심프리랜서</a>
					</li>
					<li class="pick active">
						<a href="#none" data-value="{{userId}}" data-nm="{{userNm}}" data-action="talentExclusive" title="전속프리랜서 관계를 해제합니다.">전속프리랜서</a>
					</li>
					<!--li class="tree">
						<a href="#none" data-value="{{userId}}" data-action="relationTalent" title="인맥트리">인맥트리</a>
					</li-->
					<li class="memo {{#memoYN}}active{{/memoYN}}">
						<a href="#none" class="talentMemo ellipsis" data-value="{{userId}}" data-name="{{userNm}}" data-action = "talentMeno" title="{{memo}}">{{memo}}{{#memoYN}}<span></span>{{/memoYN}}</a>
					</li>
				</ul>
			</div>
		</div>
		{{#isProject}}
		<div class="info_bottom {{^isContract}}closed{{/isContract}}"><!-- 완료플젝의 경우 closed 추가-->
			<h3 class="project_name ellipsis cf" data-action="projectDetail" data-id="{{projIdx}}">
				<span class="project_state {{#isContract}}ing{{/isContract}}">{{#isContract}}진행{{/isContract}}{{^isContract}}완료{{/isContract}}</span>
				<a href="#none" data-action="projectDetail" data-id="{{projIdx}}">{{projNm}}</a>
			</h3>
		</div>
		{{/isProject}}
		{{^isProject}}
		<div class="info_bottom closed">
			<p class="no_data">진행중인 프로젝트가 없습니다.</p>
		</div>
		{{/isProject}}
	</div>
{{/talentList}}
{{^talentList}}
    <div class="man_info no_data cf" style="text-align:center;padding-top:40px;">조회 결과가 없습니다.</div>
{{/talentList}}
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

	<%@ include file="../common/footer.jsp"%>
    
</body>
</html>