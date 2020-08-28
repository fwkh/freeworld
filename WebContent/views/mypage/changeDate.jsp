<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<meta http-equiv="content-type" content="text/html;charset=UTF-8" />


<head>


<!-- <meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="naver-site-verification"
	content="81b7cb5e5f8e2975b94b334d812bb38453749a5a" />
<meta name="keywords"
	content="프리몬, FREEMON, SI, SM, 프리랜서, 아웃소싱 플랫폼, 상주, 프로젝트, 개발자, 시스템엔지니어, MES, 설계자, 디자이너, 타임라인, Java, C#" />
<meta name="description"
	content="SI 전문 아웃소싱 플랫폼. 일정이 딱딱 맞는 프로젝트, 프리랜서를 한눈에. 프로젝트 프리랜서 타임라인, 간편하게 작성하는 전자계약서, 이력 간편등록, 프리랜서 멘토, 쉽게 관리하는 프로젝트" />
<meta property="og:type" content="website" />
<meta property="og:title" content="프리몬 - SI 전문 아웃소싱" />
<meta property="og:description"
	content="SI 전문 아웃소싱 플랫폼. 프로젝트 프리랜서 타임라인, 이력 간편등록, 프리랜서 멘토, 간편 전자계약서" />
<meta property="og:image"
	content="https://www.freemon.co.kr/resources/images/new/freemon_naver.jpg" />
<meta property="og:url" content="https://www.freemon.co.kr" />
<meta id="_csrf" name="_csrf"
	content="45d71795-fe18-44ec-9100-ef681e66286f" />
<meta id="_csrf_header" name="_csrf_header" content="X-CSRF-TOKEN" />
<meta name="viewport" content="width=1360"> -->
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
.tooltipUI {
	background-color: #FAF4C0;
}

.ui-tooltip {
	padding: 8px;
	position: absolute;
	z-index: 999999;
	color: #fff;
	font-size: 12px;
	max-width: 600px;
	-webkit-box-shadow: 0 0 5px #aaa;
	box-shadow: 0 0 5px #aaa;
	/* for IE */
	filter: alpha(opacity = 80);
	/* CSS3 standard */
	opacity: 0.8;
	line-height: 16px;
}

body .ui-tooltip {
	border-width: 2px;
}

/* .scrollOff{position:fixed;overflow:hidden;height:100%;width:100%;} */
</style>
<script type="text/javascript"
	src="../resources/scripts/jquery-3.3.1.min.js" charset="utf-8"></script>

</script>
</head>
<body>
<%@ include file="../common/header.jsp"%>

<div id="container">
	<section class="project_in">
    	<!-- 제목부분 -->
    	<div class="pro_tit mb-0">
        	<h2>투입가능일자변경</h2>
        </div>
        
        <!-- 내용 -->
        <div class="detail_box insert">
        	<h4>투입일자 <span class="red">변경하기</span></h4>
            <p>
            한진선님 프로젝트 일정이 변경되었다면 <br class="hidden xxs-visible" />투입가능일을 변경하셔서<br/>다음 프로젝트 진행에 <br class="hidden xxs-visible" />프리몬 코디가 확인 후 연락 드립니다.</p>
            <div class="input_box cf">
                <form>
                    <input type="text" id="joinPsblDt" name="joinPsblDt" class="dateRangePicker col-10" value="2020-10-23"/>
                    <button id="changeDate" class="btn_resume col-2" style="cursor:pointer;" onClick="return false;"/>변경</button>
                </form>
            </div>
			<img src="images/new/img_insert.png" class="hidden sm-visible" alt="" />
        </div>
    </section>
</div>
	<%@ include file="../common/footer.jsp"%>


</body>
</html>