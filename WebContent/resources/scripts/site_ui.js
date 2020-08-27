$(document).ready(function () {
    //Intro Height
    var introHeight = $(window).height()
    $('.intro').css({ 'height': introHeight });
    $(window).resize(function () {
        var introHeight = $(window).height()
        $('.intro').css({ 'height': introHeight })
    });
    //Sub Container Height
    var subHeight = $(window).height()
    $('#container > section').css({ 'min-height': subHeight });
    $(window).resize(function () {
        var subHeight = $(window).height()
        $('#container > section').css({ 'min-height': subHeight })
    });
    //회원가입-남여선택
    $('dd.wm_select span').click(function () {
        $('dd.wm_select span').removeClass('on')
        $(this).addClass('on')
        $('dd.wm_select span input').removeAttr('checked', 'checked')
        $(this).find('input').attr('checked', 'checked')
    });
    
    //회원가입-개인-필수입력
    $('.join_prsn .required label').click(function () {
        $(this).text('');
        $(this).next('input').focus()
    });
    //회원가입-개인-희망지역/전문분야 텍스트 삭제
    $(document).on('click', '.join_prsn div.select_info', function() {
        $(this).find('span').css({ 'display': 'none' });
    });
    //회원가입-개인-희망지역팝업
    $(document).on('click', '.join_prsn .select_area', function() {
        $(' .join_prsn .area_popup').show();
        $(' .join_prsn .select_popup').show();
    });
    //회원가입-개인-전분분야팝업
    $(document).on('click', '.join_prsn .select_expertise', function() {
        $(' .join_prsn .expertise_popup').show();
        $(' .join_prsn .select_popup').show();
    });
    //회원가입-개인-팝업닫기
    $(document).on('click', '.join_prsn span.close', function() {
        $(' .join_prsn .select_popup').hide();
        $(' .join_prsn .popup_data').hide();
    });

    //회원가입-개인-희망지역선택
    $(document).on('click', '.join_prsn .area_roll li a', function() {
        if ($(this).parent('div').hasClass('on') == true) {
            $(this).parents('div').removeClass('on')
            var DataClass = $(this).parents('li').attr('class')
            $('form.login_form dd .select_area ul li[class=' + DataClass + ']').remove();
            $('.join_prsn .select_list ul.place li[class=' + DataClass + ']').remove();
            var count = $('.join_prsn .area_roll li div.on').length;
            $('.join_prsn .area_popup .btn_area .select_count span').remove();
            $('.join_prsn .area_popup .btn_area .select_count').append('<span>' + count + '</span>');
        } else {
        	if($('.join_prsn .area_roll li div.on').length > 0) {
        		alert('최대 1개만 선택할 수 있습니다.');
        		return false;
        	}
        	
            $(this).parent('div').addClass('on')
            var DataClass = $(this).parents('li').attr('class');
            var DataValue = $(this).parents('li').data('value');
            var DataText = $(this).find('span').text();
        
            $('.join_prsn .select_list ul.place').append('<li class="' + DataClass + '" data-value="' + DataValue + '">' + DataText + '<img src="/images/icon_roll_del.png" class="del" />' + '</li>');
            var count = $('.join_prsn .area_roll li div.on').length;
            $('.join_prsn .area_popup .btn_area .select_count span').remove();
            $('.join_prsn .area_popup .btn_area .select_count').append('<span>' + count + '</span>');
        }
        return false;
    });
    //회원가입-개인-희망지역 선택완료
    $(document).on('click', '.join_prsn .area_popup a.select_end', function() {
        $('form.login_form dd .select_area ul li').remove();
        $('.join_prsn .area_roll li div.on').each(function () {
            var sendClass = $(this).parents('li').attr('class');
            var sendValue = $(this).parents('li').data('value');
            var sendText = $(this).find('span').text();
            $('form.login_form dd .select_area ul').append('<li class="' + sendClass + '" data-value="' + sendValue + '">' + sendText + '</li>');
        });
        $('.join_prsn .popup_data').hide();
        $('.join_prsn .select_popup').hide();
        return false;
    });
    //회원가입-개인-희망지역선택 삭제
    $(document).on('click', '.join_prsn .area_roll li .del , .join_prsn .select_list ul.place li .del', function() {
        $(this).parent('li').removeClass('on');
        var DataClass = $(this).parent().attr('class')
        $('.join_prsn .area_roll li[class=' + DataClass + ']').find('div').removeClass('on');
        $('form.login_form dd .select_area ul li[class=' + DataClass + ']').remove();
        $('.join_prsn .select_list ul.place li[class=' + DataClass + ']').remove();
        var count = $('.join_prsn .area_roll li div.on').length;
        $('.join_prsn .area_popup .btn_area .select_count span').remove();
        $('.join_prsn .area_popup .btn_area .select_count').append('<span>' + count + '</span>');
    });
    $(document).on('click', '.join_prsn .area_roll li .del', function() {
        $(this).parents('div').removeClass('on');
        var DataClass = $(this).parents('li').attr('class')
        $('form.login_form dd .select_area ul li[class=' + DataClass + ']').remove();
        $('.join_prsn .select_list ul.place li[class=' + DataClass + ']').remove();
        var count = $('.join_prsn .area_roll li div.on').length;
        $('.join_prsn .area_popup .btn_area .select_count span').remove();
        $('.join_prsn .area_popup .btn_area .select_count').append('<span>' + count + '</span>');
    });
    //회원가입-개인-희망지역 초기화
    $(document).on('click', '.join_prsn .area_popup a.reset', function() {
        $('.join_prsn .area_roll li div').removeClass('on');
        $('.join_prsn .select_list ul.place li').remove();
        $('form.login_form dd .select_area ul li').remove();
        $('.join_prsn .area_popup .btn_area .select_count span').remove();
        $('.join_prsn .area_popup .btn_area .select_count').append('<span>' + '0' + '</span>');
        return false;
    });
    //회원가입-개인-전문분야 목록열기
    $(document).on('click', '.join_prsn .popup_data ul.expertise_list li.title span', function() {
        $(this).next('ol').slideToggle();
    });
    //회원가입-개인-전문분야선택
    $(document).on('click', '.join_prsn .expertise_list li div a', function() {
        if ($(this).parent('div').hasClass('on') == true) {
            $(this).parents('div').removeClass('on')
            var DataClass = $(this).parents('li').attr('class')
            $('form.login_form dd .select_expertise ul li[class=' + DataClass + ']').remove();
            $('.join_prsn .select_list ul.tech li[class=' + DataClass + ']').remove();
            var count = $('.join_prsn .expertise_list li div.on').length;
            $('.join_prsn .expertise_popup .btn_area .select_count span').remove();
            $('.join_prsn .expertise_popup .btn_area .select_count').append('<span>' + count + '</span>');
        } else {
        	if($('.join_prsn .expertise_list li div.on').length > 4) {
        		alert('최대 5개만 선택할 수 있습니다.');
        		return false;
        	}
        	
            $(this).parent('div').addClass('on')
            var DataClass = $(this).parents('li').attr('class');
            var DataValue = $(this).parents('li').data('value');
            var DataText = $(this).text();
            $('.join_prsn .select_list ul.tech').append('<li class="' + DataClass + '" data-value="' + DataValue + '">' + DataText + '<img src="/images/icon_roll_del.png" class="del" />' + '</li>');
            var count = $('.join_prsn .expertise_list li div.on').length;
            $('.join_prsn .expertise_popup .btn_area .select_count span').remove();
            $('.join_prsn .expertise_popup .btn_area .select_count').append('<span>' + count + '</span>');
        }
    });
    //회원가입-개인-전문분야 선택완료
    $(document).on('click', '.join_prsn .expertise_popup a.select_end', function() {
        $('form.login_form dd .select_expertise ul li').remove();
        $('.join_prsn .expertise_list li div.on').each(function () {
            var sendClass = $(this).parents('li').attr('class');
            var sendValue = $(this).parents('li').data('value');
            var sendText = $(this).find('a').text();
            $('form.login_form dd .select_expertise ul').append('<li class="' + sendClass + '" data-value="' + sendValue + '">' + sendText + '</li>');
        });
        $('.join_prsn .popup_data').hide();
        $('.join_prsn .select_popup').hide();
        return false;
    });
    //회원가입-개인-전문분야선택 삭제
    $(document).on("click", ".join_prsn .expertise_list li .del , .join_prsn .select_list ul.tech li .del", function () {
        $(this).parent('li').removeClass('on');
        var DataClass = $(this).parent().attr('class')
        $('.join_prsn .expertise_list li[class=' + DataClass + ']').find('div').removeClass('on');
        $('form.login_form dd .select_expertise ul li[class=' + DataClass + ']').remove();
        $('.join_prsn .select_list ul.tech li[class=' + DataClass + ']').remove();
        var count = $('.join_prsn .expertise_list li div.on').length;
        $('.join_prsn .expertise_popup .btn_area .select_count span').remove();
        $('.join_prsn .expertise_popup .btn_area .select_count').append('<span>' + count + '</span>');
    });
    $(document).on('click', '.join_prsn .expertise_list li .del', function() {
        $(this).parents('div').removeClass('on')
        var DataClass = $(this).parents('li').attr('class')
        $('form.login_form dd .select_expertise ul li[class=' + DataClass + ']').remove();
        $('.join_prsn .select_list ul.tech li[class=' + DataClass + ']').remove();
        var count = $('.join_prsn .expertise_list li div.on').length;
        $('.join_prsn .expertise_popup .btn_area .select_count span').remove();
        $('.join_prsn .expertise_popup .btn_area .select_count').append('<span>' + count + '</span>');
    });
    //회원가입-개인-전문분야 초기화
    $(document).on('click', '.join_prsn .expertise_popup a.reset', function() {
        $('.join_prsn .expertise_list li div').removeClass('on');
        $('.join_prsn .select_list ul.tech li').remove();
        $('form.login_form dd .select_expertise ul li').remove();
        $('.join_prsn .expertise_popup .btn_area .select_count span').remove();
        $('.join_prsn .expertise_popup .btn_area .select_count').append('<span>' + '0' + '</span>');
        return false;
    });
    //달력
    //Calendar
    function onSelectHandler(date, context) {
        var $element = context.element;
        var $calendar = context.calendar;
        var $box = $element.siblings('.box').show();
        var text = '';
        if (date[0] !== null) {
            $('#freemonSearch_strDate').val(date[0].format('YYYY-MM-DD'));
        } else {
            $('#freemonSearch_strDate').val('');
        }
        if (date[1] !== null) {
            $('#freemonSearch_endDate').val(date[1].format('YYYY-MM-DD'));
        } else {
            $('#freemonSearch_endDate').val('');
        }
        $box.text(text);
    }
    //Calendar
    $('.calendar').pignoseCalendar({
		minDate: freemon.util.getDateString(new Date(), '-'),
        multiple: true,
        initialize: false,
        lang: 'ko',
		format: 'YYYYMMDD',
        select: onSelectHandler,
    })
    //검색조건선택(전문기술)
    $(document).on('click', '.srch_terms ul.tech li span', function() {
        if ($(this).parent('div').hasClass('on') == true) {
            $(this).parents('div').removeClass('on');
            var DataClass = $(this).parents('li').attr('class');
            $('.srch_terms .keyword_area .sel_view ul li[class=' + DataClass + ']').remove();
            $('.mo_sel_view .tech li[class=' + DataClass + ']').remove();
            var count = $('.srch_terms .data_roll ul.tech div.on').length;
            $('.technology h3 span.count span').remove();
            $('.technology h3 span.count ').append('<span>' + count + '</span>');
        } else {
            $(this).parents('div').addClass('on');
            var DataClass = $(this).parents('li').attr('class');
            var DataValue = $(this).parents('li').data('value');
            var DataText = $(this).text();
            $('.srch_terms .sel_view ul.tech').append('<li class="' + DataClass + '" data-value="' + DataValue + '">' + DataText + '<img src="/images/icon_roll_del.png" class="del" />' + '</li>')
            $('.mo_sel_view .tech').append('<li class="' + DataClass + '" data-value="' + DataValue + '">' + DataText + '<img src="/images/icon_roll_del.png" class="del" />' + '</li>')
            var count = $('.srch_terms .data_roll ul.tech div.on').length;
            $('.technology h3 span.count span').remove();
            $('.technology h3 span.count ').append('<span>' + count + '</span>');
        }
    });
    //검색조건선택 해제(전문기술)
    $(document).on('click', '.srch_terms .data_roll ul.tech li div .del', function() {
        $(this).parents('div').removeClass('on')
        var DataClass = $(this).parents('li').attr('class')
        $('.srch_terms .keyword_area .sel_view ul li[class=' + DataClass + ']').remove()
        $('.mo_sel_view .tech li[class=' + DataClass + ']').remove()
        var count = $('.srch_terms .data_roll ul.tech div.on').length;
        $('.technology h3 span.count span').remove();
        $('.technology h3 span.count ').append('<span>' + count + '</span>');
    });
    //검색조건선택 목록삭제(전문기술)
    $(document).on('click', '.srch_terms .sel_view ul.tech li .del , .mo_sel_view ul.tech li .del', function() {
        $(this).parent('li').remove()
        var DataClass = $(this).parent().attr('class')
        $('.srch_terms .data_roll ul li[class=' + DataClass + ']').find('div').removeClass('on');
        $('.mo_sel_view .tech li[class=' + DataClass + ']').remove()
        $('.srch_terms .sel_view ul.tech li[class=' + DataClass + ']').remove()
        var count = $('.srch_terms .data_roll ul.tech div.on').length;
        $('.technology h3 span.count span').remove();
        $('.technology h3 span.count ').append('<span>' + count + '</span>');
    });
    //검색조건선택(도시)
    $(document).on('click', ".srch_terms ul.city li a", function() {
        if ($(this).parent('div').hasClass('on') == true) {
            $('.srch_terms .data_roll .city').stop().animate({ 'width': '60%', 'padding': '15px 1%' }, 100);
            $(".srch_terms .data_roll ul.local").stop().animate({ 'right': '-100%' });
            $($(this).attr("href")).stop().animate({ 'right': '0' });
        } else {
            $(this).parents('div').addClass('on');
            var DataClass = $(this).parents('li').attr('class');
            var DataValue = $(this).parents('li').data('value');
            var DataText = $(this).find('span').text();
            $('.srch_terms .sel_view ul.city').append('<li class="' + DataClass + '" data-value="' + DataValue + '">' + DataText + '<img src="/images/icon_roll_del.png" class="del" />' + '</li>');
            $('.mo_sel_view ul.city').append('<li class="' + DataClass + '">' + DataText + '<img src="/images/icon_roll_del.png" class="del" />' + '</li>');
            $('.srch_terms .data_roll .city').stop().animate({ 'width': '60%', 'padding': '15px 1%' }, 100);
            $(".srch_terms .data_roll ul.local").stop().animate({ 'right': '-100%' });
            $($(this).attr("href")).stop().animate({ 'right': '0' });
            var count = $('.srch_terms .data_roll ul.city div.on').length;
            $('.area h3 span.count span').remove();
            $('.area h3 span.count ').append('<span>' + count + '</span>');
        }
        if(!$($(this).attr("href")).children('li').children('div').hasClass('on')) {
        	$($(this).attr("href")).children('li.all').children('div').addClass('on');
        }
        return false;
    });
    //검색조건선택 해제(도시)
    $(document).on('click', ".srch_terms .data_roll ul.city li div .del", function() {
        $(this).parents('div').removeClass('on');
        var DataClass = $(this).parents('li').attr('class');
        var DataValue = $(this).parents('li').data('value');
        $('.srch_terms .keyword_area .sel_view ul li[class=' + DataClass + ']').remove();
        $('.mo_sel_view ul.city li[class=' + DataClass + ']').remove();	
        $('.srch_terms .sel_view ul.city li[data-upper=' + DataValue + ']').remove();
        $('.mo_sel_view ul.city li[data-upper=' + DataValue + ']').remove();
        $('.srch_terms .data_roll .city').stop().animate({ 'width': '100%', 'padding': '15px 9%' }, 100);
        var activeTab = $(this).prev().attr("href");
        $(".srch_terms .data_roll ul.local").stop().animate({ 'right': '-100%' });
        $(activeTab).stop().animate({ 'right': '-100%' });
        $(activeTab).find('div').removeClass('on')
        var count = $('.srch_terms .data_roll ul.city div.on').length;
        $('.area h3 span.count span').remove();
        $('.area h3 span.count ').append('<span>' + count + '</span>');
    });
    //검색조건선택 목록삭제(도시)
    $(document).on("click", ".srch_terms .sel_view ul.city li .del , .mo_sel_view ul.city li .del", function () {
        $(this).parent('li').remove();
        var DataClass = $(this).parent().attr('class');
        $('.data_roll ul li[class=' + DataClass + ']').find('div').removeClass('on');
        var CityDel = $('.data_roll ul li[class=' + DataClass + ']').find('a').attr("href");
        $(CityDel).find('div').removeClass('on');
        $('.srch_terms .sel_view ul.city li[class=' + DataClass + ']').remove();
        $('.mo_sel_view ul.city li[class=' + DataClass + ']').remove();
        $(".srch_terms .data_roll ul.local").stop().animate({ 'right': '-100%' });
        $('.srch_terms .data_roll .city').stop().animate({ 'width': '100%', 'padding': '15px 9%' }, 100);
        var count = $('.srch_terms .data_roll ul.city div.on').length;
        $('.area h3 span.count span').remove();
        $('.area h3 span.count ').append('<span>' + count + '</span>');
    });
    //검색조건선택(지역구)
    $(document).on("click", ".srch_terms ul.local li span", function () {
        if (!$(this).parent('div').hasClass('on')) {
	        $(this).parents('div').addClass('on');
            var DataClass = $(this).parents('li').attr('class');
            var DataValue = $(this).parents('li').data('value');
            var DataUpper = $(this).parents('li').data('upper');
            var DataText = $('#freemonSearch_area > ul.city > li[data-value="'+DataUpper+'"]').find('span').text();
            //var DataText = $(this).text();
            
	    	if($(this).parents('li').hasClass('all')) {
	    		$(this).parents('ul').find('li.sub > div').removeClass('on');
		        $('.srch_terms .keyword_area .sel_view ul li[data-upper=' + DataUpper + ']').remove();
		        $('.mo_sel_view ul.city li[data-upper=' + DataUpper + ']').remove();
	    	} else {
	    		$(this).parents('ul').find('li.all > div').removeClass('on');
	    		var AllValue = $(this).closest('ul').find('li.all').data('value');
		        $('.srch_terms .keyword_area .sel_view ul li[data-value=' + AllValue + ']').remove();
		        $('.mo_sel_view ul.city li[data-value=' + AllValue + ']').remove();
		        
		        DataText = DataText + ' ' + $(this).text();
	    	}
            
            $('.srch_terms .sel_view ul.city').append('<li class="' + DataClass + '_' + DataValue + '" data-upper="'+DataUpper+'" data-value="' + DataValue + '">' + DataText + '<img src="/images/icon_roll_del.png" class="del" />' + '</li>');
            $('.mo_sel_view ul.city').append('<li class="' + DataClass + '" data-upper="'+DataUpper+'" data-value="' + DataValue + '">' + DataText + '<img src="/images/icon_roll_del.png" class="del" />' + '</li>');
        }
    });
    //검색조건선택(지역구)삭제
    $(document).on("click", ".srch_terms ul.local li .del", function () {
        $(this).parents('div').removeClass('on');
        var DataValue = $(this).parents('li').data('value');
        var DataUpper = $(this).parents('li').data('upper');
        $('.srch_terms .keyword_area .sel_view ul li[data-value=' + DataValue + ']').remove();
        $('.mo_sel_view ul.city li[data-value=' + DataValue + ']').remove();
        
        if(!$(this).parents('ul').find('li > div').hasClass('on')) {
	        $(".srch_terms .data_roll ul.local").stop().animate({ 'right': '-100%' });
	        $('.srch_terms .data_roll .city').stop().animate({ 'width': '100%', 'padding': '15px 9%' }, 100);
	        var count = $('.srch_terms .data_roll ul.city div.on').length;
	        $('.area h3 span.count span').remove();
	        $('.area h3 span.count ').append('<span>' + count + '</span>');
	        
	        $('#freemonSearch_area ul.city li[data-value=' + DataUpper + ']').children('div').removeClass('on');
        }
    });
    //검색결과 즐겨찾기
    $(document).on("click", ".fav_cart a.fav", function () {
        $(this).toggleClass('on')
        return false;
    });
    //검색결과(인재)키워드 경력 검색결과
    $(document).on("click", ".prsn_srch_result .td.part3 .career", function () {
        if ($('.data', this).length < 3) {
            $(this).find('.data').addClass('full_size');
        } else {
            $(this).find('.data').addClass('half_size');
        }
    });
    //검색결과(프로젝트) 더보기
    $(document).on("click", ".prj_srch_result .td.part1 ul", function () {
        $(this).find('li a').toggleClass('on');
        $(this).parents('li.tr').find('.sec2').slideToggle()
        return false;
    });
    /**********Mobile**********/
    //Mobile Menu
    $(document).on("click", "a.m_menu_btn", function () {
        $('.mobile_menu').show();
        $('.mobile_menu .bg').fadeIn('slow');
        $('.m_menu_area').animate({ 'right': '0' }, 500);
        return false
    });
    $(document).on("click", ".m_menu_close", function () {
        $('.mobile_menu .bg').fadeOut('slow');
        $('.m_menu_area').animate({ 'right': '-100%' }, 500);
        $('.mobile_menu').delay(500).fadeOut('fast');
    });
    //Mobile Footer Menu
    $(document).on("click", ".m_link_open", function () {
        $(this).toggleClass('on');
        $('.m_direct_menu .m_list').toggle()
    });
    //모바일 상세검색 OPEN
    $(document).on("click", ".mo_top_info ul.filter a", function () {
        $('.srch_result .srch_method').show();
        $('.srch_result .srch_method').animate({ 'right': '0' }, 500);
        return false
    });
    $(document).on("click", ".srch_method h2.mo_tit span", function () {
        $('.srch_result .srch_method').animate({ 'right': '-100%' }, 500);
        $('.srch_result .srch_method').delay(500).fadeOut('fast');
    });
    //모바일 상세검색 숨김/보임 처리
    $(window).resize(function () {
        if ($(window).width() < 751) {
            $('.srch_result .srch_method').css('display', 'none')
        } else {
            $('.srch_result .srch_method').css('display', 'inline-block')
        }
    });
});