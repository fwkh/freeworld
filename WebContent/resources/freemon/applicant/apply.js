( function( $ ) {
    $( document ).ready(function() {
        $('#talentSearchList').on('click','ul > li .project_info2', function(e){
            if(e.target.className != "line-130"){
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
            }
        });
    
        $('.applicant_box > ul > li .project_info2').append('<span class="holder"></span>');
    
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
    