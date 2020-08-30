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