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
	  #logout{display:none;}
	</style>
</head>
<body>
    <!-- Google Tag Manager (noscript) -->
    <noscript>
        <iframe src="http://www.googletagmanager.com/ns.html?id=GTM-MF7LK3J"
                height="0" width="0" style="display:none;visibility:hidden"></iframe>
    </noscript>
    <!-- End Google Tag Manager (noscript) -->

    <div class="load_box" style="display:none;">
        <div class="load_img"><img src="../resources/images/common/loading.gif" alt="loading"/></div>
    </div>


    <script type="text/javascript" src="../resources/freemon/customer/noticeSearch9a0d.js?version=1.0"></script>

    <script type="text/javascript" src="../resources/js/faq.js"></script>
    <script type="text/javascript">
        $(function () {
            freemon.invoker.invoke("noticeSearch");

            /* 		if(freemon.ux.isMobileCheck() == true){
                        $(".choice").hide();
                    } */
        });
    </script>
    <div id="container">
        <section class="project_in">
            <!-- 제목부분 -->
            <div class="pro_tit mb-0">
                <h2>공지사항</h2>
                <div class="search cf">
                    <div class="input_box col-11">
                        <input type="text" id="keyword" placeholder="예) 지원"/>
                    </div>
                    <a href="#none" class="btn_sesarch col-1">검색</a>
                </div>
            </div>

            <!-- 선택부분 -->
            <div class="choice blue">
                <div class="cho_faq">
                    <ul class="cf" id="noticeList">
                    </ul>
                </div>
            </div>

            <!-- 공지사항 -->
            <div id="faq_list">
                <ul id="faq_listul">
                </ul>
            </div>

            <!-- 더보기 -->
            <div class="more_box" style="display:none;">
                <a href="#none" class="btn_more center" data-action="moreViewClick"><span class="t_more">더보기</span></a>
            </div>

        </section>
    </div>
    <script id="noticeTypeListTemplate" type="text/x-mustache">
<li class="active"><a href="#none" data-value = ''>전체</a></li>
{{#typeList}}
<li><a href="#none" data-value = "{{cdVal}}" >{{cdValNm}}</a></li>
{{/typeList}}

    </script>

    <script id="faqlistTemplate" type="text/x-mustache">
{{#articleList}}
<li class="active has-sub"><a href="#none" data-value="{{idx}}" ><span class="blind">Q</span>{{title}}<span class="right_plus"></span></a>
	<ul class="faq_con">
		<li><span class="blind">A</span>{{{contents}}}</li>
	</ul>
</li>
{{/articleList}}
{{^articleList}}
	{{^isList}}
	<br/>
	<div class="project_box no_data cf" style="text-align:center;">조회 결과가 없습니다.</div>
	{{/isList}}
{{/articleList}}

    </script>

    ﻿    <!-- 팝업 -->
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

<!-- Mirrored from www.freemon.co.kr/customer/noticeSearch by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 27 Jul 2020 06:59:38 GMT -->
</html>