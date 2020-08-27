
$(window).init (function() {
	onMainSlider();

	var sw=true;
	$('#section01 .btn-play').click(function(){
	if(sw==true){
		$('#section01 .btn-play').addClass('on'); 
		$('.btn-play').find('span').text('play');
		$('.visual-slide').slick('slickPause'); 
	} else {
		$('#section01 .btn-play').removeClass('on'); 
		$('.btn-play').find('span').text('stop');
		$('.visual-slide').slick('slickPlay');
	}
	
	sw = !sw;
	});
});

function onMainSlider() {
	$('.visual-slide').on('init', function(event, slick){

		$(this).on("beforeChange", function(event, slick, currentSlide, nextSlide) {
			//$(this).find(".slick-dots a").attr("tabindex" , "-1");
		}).on("afterChange", function(event, slick, currentSlide) {
			$(this).find(".slick-active a").attr("tabindex" , 0);
			//$(this).find(".slick-active a").focus();
		}).on("lazyLoadError", function(event, slick, image, imageSource) {
			console.log("error");
		});

		$(this).addClass("ani");
	}).slick({
		dots: true,
		infinite: true,
		speed: 1000,
		arrows: true,
		autoplay: true,
		autoplaySpeed: 5000,
		fade: true,
		pauseOnHover: true,
		pauseOnFocus: true,
		cssEase: 'cubic-bezier(0.7, 0, 0.3, 1)',
		customPaging : function(slider, i) {
			var title = $(slider.$slides[i]).data('title');
			return '<a href="#"><em>'+title+'</em></a>';
		},
		responsive: [{
			 breakpoint: 992,
			 settings: {
					customPaging : function(slider, i) {
					var num = i+1;
					return '<a href="#"><em>0'+num+'</em></a>';
				 }
			}
		 }]
	});
}


$(function(){
	$('#section03 .section-list').slick({
		slidesToShow: 5,
		slidesToScroll: 1,
		autoplay: false,
		responsive:[
			{
				breakpoint: 992,
				settings:{
					slidesToShow: 1,
					slidesToScroll: 1
				}
			},
			{
				breakpoint: 768,
				settings:{
					slidesToShow: 1,
					slidesToScroll: 1
				}
			},
		]
		//autoplaySpeed: 2000,
	});
	
	
	var leyerLink = $('#section05 .layer-wrap');
	leyerLink.mouseenter(function(){	
		$(this).find('.layer').fadeIn();
	}).mouseleave(function(){
		leyerLink.find('.layer').delay(300).fadeOut();
	});
	
});


$(function () {
	var playing = false;
	var winH;
	var $section = $(".section");
	var sectionActive = 0;

	resize();
	init();

	 var resizeTiming;
	 $(window).resize(function () {
	 	 clearTimeout(resizeTiming);
	 	 resizeTiming = setTimeout(function () {
	 	 	resize();
	 	 }, 100);
	 	resize();
	 });

	function init() {
		var sectionMany = $section.length;
		$(document).mousewheel(function (event, delta) {
			if (!playing) {
				playing = true;
				if (delta == -1  && $(".modal-wrap").css("display") == "none") {
					if (sectionActive < sectionMany) {
						sectionActive = sectionActive + 1;
					} else {
						setTimeout(function () {
							playing = false;
						}, 100)
						return;
					}
				}
				if (delta == 1 && $(".modal-wrap").css("display") == "none") {
					if (sectionActive == 0) {
						setTimeout(function () {
							playing = false;
						}, 100)
						return;
					} else {
						sectionActive = sectionActive - 1;
					}
				}
				

				sectionAnimating(sectionActive);
			}

		});

		$(document).keydown(function (e) {
			if (!playing) {
				playing = true;
				if (e.keyCode == 40) {
					if (sectionActive < sectionMany) {
						sectionActive = sectionActive + 1;
					} else {
						setTimeout(function () {
							playing = false;
						}, 100)
						return;
					}
				}
				if (e.keyCode == 38) {
					if (sectionActive == 0) {
						setTimeout(function () {
							playing = false;
						}, 100)
						return;
					} else {
						sectionActive = sectionActive - 1;
					}
				}
				sectionAnimating(sectionActive);
			}

		});

		
		$("#scroll-nav ul li a").click(function (e) {
			e.preventDefault();
			var idx = $(this).closest("li").index();
			sectionAnimating(idx);
		}).hover(
			function(){
			if($(window).width() > 1600){
				$(this).find('span').stop().fadeIn(300);
			}
		},
		function(){
			$(this).find('span').delay(300).fadeOut(300);
		});


		// $(".section").on({
		// 	focusin: function (e) {
		// 		e.preventDefault();
		// 		var idx = $(this).index();
		// 		sectionAnimating(idx);
		// 	}
		// })

		//.top_btn click
		$(".top_btn").click(function (e) {
			e.preventDefault();
			sectionAnimating(0);
		})

		$("#scroll-nav li:first-child a").click(function (e) {
			e.preventDefault();
			sectionAnimating(0);
		})

		sectionAnimating(0);
		//layerPop('open','popup_newNotice');

	}
	
	function sectionAnimating(active) {
		sectionActive = active;
		if (sectionActive != 2) {
			$(".main-wrap").attr("class", "main-wrap section" + (sectionActive));
		}
		$(".section-wrap").attr("class", "section-wrap section" + (sectionActive));

		$section.css("z-index", 9);
		$section.eq(active).css("z-index", 10).addClass("active");
		var top = -winH * active;
		if (sectionActive < 5) {
			$("#scroll-nav li").removeClass("active").eq(active).addClass("active");
		} else {
			top = -((winH * (active - 1)) + 92);//92.8

		}

		$(".section-wrap").stop().animate({ top: top }, {
			duration: 1000,
			easing: "easeInOutCubic",
			complete: function () {
				playing = false;
				$(".section").filter(function (index) {
					return index != active;
				}).removeClass("active");
				if (sectionActive == 2) {
					$(".main-wrap").attr("class", "main-wrap section" + (sectionActive));
				}
				if (!$("html").hasClass("init")) {
					$("html").addClass("init");
					resize(true);
				} else {
					resize();
				}

			}
		});

		 if (sectionActive == 0) {
			$("#scroll-nav li").removeClass("active");
			$("#scroll-nav li:first-child").addClass("active");
			$("#scroll-nav").stop().slideDown({
				duration: 500,
				easing: "easeInOutCubic"
			});

		} else {
			$("#scroll-nav li:first-child").removeClass("active");
		}

	}
	
	
	//resize
	function resize() {
		//if(freemon.ux.isMobileCheck() == false){
		if($(window).width() > 992){
			winH = $(window).height() - 130;
			//winH_f = $(window).height() - 240;
		}else{
			winH = $(window).height() - 60;
		}
		
		var many = $section.length;
		var top = -winH * sectionActive;
		if (sectionActive == 5) {
			top = -((winH * (sectionActive - 1)) + 92.8);
		}
		$(".section-wrap").css({ top: top });
		$(".section").css({ height: winH});
		//$("#section01").css({ height: winH_f});
		
	}

	
});










