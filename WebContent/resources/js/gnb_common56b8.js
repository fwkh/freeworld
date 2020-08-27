
$(window).on("scroll", function() {
	if($(".top_banner").is(':visible')){
//		if ($(window).scrollTop() > 131.8) {
		var vheight = 0;
//		switch($(".totalCnt").text()){
//			case "3":
//				vheight = 150;
//				break;
//			case "4":
//				vheight = 110;
//				break;
//			default:
//				vheight = 131.8;
//				break;
//		}
//		console.log("vheight:"+$("#container").height());
		
		//if($("#container").height() > 720 && $("#container").height() < 750) {
//		if($("#container").height() < 650){
//			vheight = 0;
//		}
//		else if($("#container").height() >= 650 && $("#container").height() < 700){
//			vheight = 0;
//		}
//		else if($("#container").height() >= 700 && $("#container").height() < 750) {
//			vheight = 90;
//		}
//		else if($("#container").height() >= 750 && $("#container").height() < 760) {
//			vheight = 0;
//		}
//		else if($("#container").height() >= 760 && $("#container").height() < 790) {
//			vheight = 0;
//		}
//		else{
			vheight = 131.8;
//		}
//		console.log("vheight:"+vheight);
		if ($(window).scrollTop() > vheight) {
			$("#header").removeClass("none");
			$("#header").addClass("fix");
		}else {
			$("#header").removeClass("fix");
			$("#header").addClass("none");	
		}
	}
	else{
		$("#header").removeClass("none");
		$("#header").addClass("fix");
	}
});

/////// 프로젝트 카드 > 상위 : 월 표시
$(window).on("scroll", function() {
//	if($(".top_banner").is(':visible')){
		if ($(window).scrollTop() > 327) {
			$(".thead").removeClass("none");
			$(".thead").addClass("fix");
		}else {
			$(".thead").removeClass("fix");
			$(".thead").addClass("none");	
		}
//	}
//	else{
//		$("#container").css('padding-top', '130px');
//		
//		var vheight = 0;
//		switch($(".totalCnt").text()){
//			case "3":
//				vheight = 150;
//				break;
//			case "4":
//				vheight = 100;
//				break;
//			default:
//				vheight = 131.8;
//				break;
//		}
//		console.log("vheight:"+$("#container").height());
		//if($("#container").height() > 720 && $("#container").height() < 750) {
//		if($("#container").height() < 730) {
//			vheight = 80;
//		}
//		else if($("#container").height() >= 730 && $("#container").height() < 750) {
//			vheight = 100;
//		}
//		else{
//			vheight = 131.8;
//		}
//		if ($(window).scrollTop() > vheight) {
//			$(".thead").removeClass("none");
//			$(".thead").addClass("fix");
//		}
//		else{
//			$(".thead").removeClass("fix");
//			$(".thead").addClass("none");
//		}
//	}
});

/**
 * 모바일
 */
$(window).on("scroll", function() {	
//	if($(".top_banner").is(':visible')){
//		if ($(window).scrollTop() > 133) {
	if ($(window).scrollTop() > 110) {
			$(".m_thead").removeClass("none");
			$(".m_thead").addClass("fix");
			$(".project_in").removeClass("none");
			$(".project_in").addClass("margintop");
		}else {
			$(".m_thead").removeClass("fix");
			$(".m_thead").addClass("none");	
			$(".project_in").removeClass("margintop");
			$(".project_in").addClass("none");
		}
//	}
//	else{
//		$(".m_thead").removeClass("none");
//		$(".m_thead").addClass("fix");
//	}
});

$(window).on("scroll", function() {
//	if($(".top_banner").is(':visible')){
		if ($(window).scrollTop() > 30) {
			$(".top_banner").removeClass("none");
			$(".top_banner").addClass("fix");
			$("#header_mobile").removeClass("none");
			$("#header_mobile").addClass("fix");
		}else {
			$(".top_banner").removeClass("fix");
			$(".top_banner").addClass("none");
			$("#header_mobile").removeClass("fix");
			$("#header_mobile").addClass("none");	
		}
		
//		if ($(window).scrollTop() > 60) {
//			$(".map_box").removeClass("none");
//			$(".map_box").addClass("fix");
//		}else {
//			$(".map_box").removeClass("fix");
//			$(".map_box").addClass("none");	
//		}
		
		var filter = "win16|win32|win64|macintel|mac";
		if (navigator.platform && 0 > filter.indexOf(navigator.platform.toLowerCase())){
			$("#container").css('padding-top', '0px');
		}
//	}
//	else{
		
//		if ($(window).scrollTop() > 30) {
//			$("#header_mobile").removeClass("none");
//			$("#header_mobile").addClass("fix");
//		}
//		else{
//			$("#header_mobile").removeClass("fix");
//			$("#header_mobile").addClass("none");
//		}
//	}
});

$(function(){ 
	////////////////// btn TOP //////////////////
	$(".top_btn").click(function(){
		$("html,body").animate({scrollTop:0},1000,"easeInOutCirc");		
	});
	
	////////////////// 모바일 전체메뉴 //////////////////
	$(document).on("click",".btn-all-menu",function(){
		allPannelClose();
		$(this).next(".bg").show();
		$('[data-focus="modal-all"]').focus();
	});
	
	$(document).on("click",".bg .all-menu-close",function(){	
		$(this).closest(".bg").hide();
		$("#header_mobile .btn-all-menu").focus();
	});
	
	function allPannelClose(){
		$(".menu li>a").removeClass("on");	
	}
	
});


$(document).ready(function () {
	////////////////// 웹 메뉴 //////////////////
	$(".top_menu.w_top_menu > ul > li").hover(function (e){ 
		$(this).children("a").next().show();
	}, function() {
		$(this).children("a").next().hide();
	});
	
	$(".top_menu.m_top_menu > ul > li > a").click(function (e){ 
		$(this).removeAttr('href');
		var element = $(this).parent('li');
		element.find('a').next().hide();
		if (element.hasClass('active')) {
			element.removeClass('active');
			element.find('li').removeClass('active');
			element.find('a').next().hide();
		}
		else {
			element.addClass('active');
			element.children('a').next().show();
			element.siblings('li').children('a').next().hide();
			element.siblings('li').removeClass('active');
			element.siblings('li').find('li').removeClass('active');
			element.find('a').next().show();
		}
	});
	
	$(".gnb_in .gnb_depth1").hover(function (e){ 
		$(this).children("a").next().show();
		//$(this).addClass('active');
	}, function() {
		$(this).children("a").next().hide();
		//$(this).removeClass('active');
	});

});