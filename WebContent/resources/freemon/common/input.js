window.onload = function() {
    var input = $('.input_list li:first-child > .input > label');
	input.next().focus();
	input.parent('.input').addClass('focus');
	
	var p_input = $('.pop .input_list li:first-child > .input > label');
	p_input.next().focus();
	p_input.parent('.input').addClass('focus');
	
	var textarea = $('.input_list li:first-child .sign textarea');
	textarea.focus();
	textarea.parent('.sign').parent('.input').addClass('focus');
	
	$('.input_list li > .input > label').next().focus(function(){
		$('.input_list li > .input').removeClass('focus');
		$(this).parent('.input').addClass('focus');		
	});
	$('.input_list li > .input > label').next().blur(function(){
		$('.input_list li > .input').removeClass('focus');
	});
	$('.input_list li > .input .sign textarea').focus(function(){
		$('.input_list li > .input').removeClass('focus');
		$(this).parent('.sign').parent('.input').addClass('focus');		
	});
	$('.input_list li > .input .sign textarea').blur(function(){
		$('.input_list li > .input').removeClass('focus');
	});
	
	
	var input_career = $('.input_career_in > li:first-child > .input > label');
	input_career.next().focus();
	input_career.parent('.input').addClass('focus');
	
	$('.input_career_in li > .input > label').next().focus(function(){
		$('.input_career_in li > .input').removeClass('focus');
		$(this).parent('.input').addClass('focus');		
	});$('.input_career_in li > .input > label').next().focus(function(){
		$('.input_career_in li > .input').removeClass('focus');
		$(this).parent('.input').addClass('focus');		
	});
}