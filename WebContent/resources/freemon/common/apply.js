( function( $ ) {
$( document ).ready(function() {
$('.applicant_box > ul > li .project_info2').on('click', function(){
		$(this).removeAttr('href');
		var element = $(this).parent('li');
		element.find('ul.project_con2').slideUp();
		if (element.hasClass('open')) {
			element.removeClass('open');
			element.find('li').removeClass('open');
			element.find('ul.project_con2').slideUp();
		}
		else {
			element.addClass('open');
			element.children('ul.project_con2').slideDown(200);
			element.siblings('li').children('ul.project_con2').slideUp();
			element.siblings('li').removeClass('open');
			element.siblings('li').find('li').removeClass('open');
			element.siblings('li').find('ul.project_con2').slideUp(200);
		}
	});
	
	$('.open_list > ul > li .proj_box').on('click', function(){
		$(this).removeAttr('href');
		var element = $(this).parent('li');
		element.find('ul.open_talk').slideUp();
		if (element.hasClass('open')) {
			element.removeClass('open');
			element.find('li').removeClass('open');
			element.find('ul.open_talk').slideUp();
		}
		else {
			element.addClass('open');
			element.children('ul.open_talk').slideDown(200);
			element.siblings('li').children('ul.open_talk').slideUp();
			element.siblings('li').removeClass('open');
			element.siblings('li').find('li').removeClass('open');
			element.siblings('li').find('ul.open_talk').slideUp(200);
		}
	});
	
		$('.open_list > ul > li .man_box').on('click', function(){
		$(this).removeAttr('href');
		var element = $(this).parent('li');
		element.find('ul.open_talk').slideUp();
		if (element.hasClass('open')) {
			element.removeClass('open');
			element.find('li').removeClass('open');
			element.find('ul.open_talk').slideUp();
		}
		else {
			element.addClass('open');
			element.children('ul.open_talk').slideDown(200);
			element.siblings('li').children('ul.open_talk').slideUp();
			element.siblings('li').removeClass('open');
			element.siblings('li').find('li').removeClass('open');
			element.siblings('li').find('ul.open_talk').slideUp(200);
		}
	});
	
	$('.career_etc .man_detail_tit').on('click', function(){
		$(this).removeAttr('href');
		var element = $('.career_etc');
			$('.career_etc_con').slideUp();
		if (element.hasClass('open')) {
			$('.career_etc').removeClass('open');
			$('.career_etc').addClass('close');
			$('.career_etc_con').slideUp();
		}
		else {
			$('.career_etc').removeClass('close');
			$('.career_etc').addClass('open');
			$('.career_etc_con').slideDown(200);
		}
	});
	
	$('.m_career_etc .m_man_detail_tit').on('click', function(){
		$(this).removeAttr('href');
		var element = $(this).parent('.m_career_etc');
		element.find('.m_career_etc_con').slideUp();
		if (element.hasClass('open')) {
			element.removeClass('open');
			element.addClass('close');
			element.find('.m_career_etc').removeClass('open');
			element.find('.m_career_etc_con').slideUp();
		}
		else {
			element.removeClass('close');
			element.addClass('open');
			element.children('.m_career_etc_con').slideDown(200);
			element.siblings('.m_career_etc').children('.m_career_etc_con').slideUp();
			element.siblings('.m_career_etc').removeClass('open');
			element.siblings('.m_career_etc').addClass('close');
			element.siblings('.m_career_etc').find('.m_career_etc').removeClass('open');
			element.siblings('.m_career_etc').find('.m_career_etc').addClass('close');
			element.siblings('.m_career_etc').find('.m_career_etc_con').slideUp(200);
		}
	});
	
	// 경력 상세내용 닫고/열기
/*	$('.career_list > li').on('click', function(){
		var element = $(this);
		element.find('.project_p > p').slideUp();
	});
	
	// 경력 상세내용 닫고/열기
	$('.career_list > li').on('click', function(){
		$(this).removeAttr('href');
		var element = $(this);
		element.addClass('open');
		element.find('.project_p > p').slideUp();
		if (element.hasClass('open')) {
			element.removeClass('open');
			element.addClass('close');
			element.find('.project_p > p').slideUp();
		}
		else {
			element.removeClass('close');
			element.addClass('open');
			element.find('.project_p > p').slideDown(200);
			element.find('.project_p > p').slideUp(200);
		}
	});

*/
	function rgbToHsl(r, g, b) {
	    r /= 255, g /= 255, b /= 255;
	    var max = Math.max(r, g, b), min = Math.min(r, g, b);
	    var h, s, l = (max + min) / 2;

	    if(max == min){
	        h = s = 0;
	    }
	    else {
	        var d = max - min;
	        s = l > 0.5 ? d / (2 - max - min) : d / (max + min);
	        switch(max){
	            case r: h = (g - b) / d + (g < b ? 6 : 0); break;
	            case g: h = (b - r) / d + 2; break;
	            case b: h = (r - g) / d + 4; break;
	        }
	        h /= 6;
	    }
	    return l;
	}
});
} )( jQuery );
