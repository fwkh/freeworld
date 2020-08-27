/*!
 * jQuery iMask Plugin v0.7.0
 *
 * Licensed under the MIT License
 * Authors: Mark Kahn
 *          Fabio Zendhi Nagao (http://zend.lojcomm.com.br)
 *
 * Date: Wed Aug 24 10:50:49 2011 -0700
 */
(function($){
	var $chk = function(obj){
		return !!(obj || obj === 0);
	};

	/**
	 * Masks an input with a pattern
	 * @class
	 * @requires jQuery
	 * @name jQuery.iMask
	 * @param {Object}    options
	 * @param {String}    options.type (number|fixed)
	 * @param {String}    options.mask Mask using 9,a,x notation
	 * @param {String}   [options.maskEmptyChr=' ']
	 * @param {String}   [options.validNumbers='1234567890']
	 * @param {String}   [options.validAlphas='abcdefghijklmnopqrstuvwxyz']
	 * @param {String}   [options.validAlphaNums='abcdefghijklmnopqrstuvwxyz1234567890']
	 * @param {Number}   [options.groupDigits=3]
	 * @param {Number}   [options.decDigits=2]
	 * @param {String}   [options.currencySymbol]
	 * @param {String}   [options.groupSymbol=',']
	 * @param {String}   [options.decSymbol='.']
	 * @param {Boolean}  [options.showMask=true]
	 * @param {Boolean}  [options.stripMask=false]
	 * @param {Function} [options.sanity]
	 * @param {Object}   [options.number] Override options for when validating numbers only
	 * @param {Boolean}  [options.number.stripMask=false]
	 * @param {Boolean}  [options.number.showMask=false]
	 */
	var iMask = function(){
		this.initialize.apply(this, arguments);
	};

	iMask.prototype = {
		options: {
			maskEmptyChr   : ' ',

			validNumbers   : "1234567890",
			validAlphas    : "abcdefghijklmnopqrstuvwxyz",
			validAlphaNums : "abcdefghijklmnopqrstuvwxyz1234567890",

			groupDigits    : 3,
			decDigits      : 2,
			currencySymbol : '',
			groupSymbol    : ',',
			decSymbol      : '.',
			showMask       : true,
			stripMask      : false,

			lastFocus      : 0,

			number : {
				stripMask : false,
				showMask  : false
			}
		},

		initialize: function(node, options) {
			this.node    = node;
			this.domNode = node[0];
			this.options = $.extend({}, this.options, this.options[options.type] || {}, options);
			var self     = this;

			if(options.type == "number") this.node.css("text-align", "right");

			this.node
				.bind( "mousedown click", function(ev){ ev.stopPropagation(); ev.preventDefault(); } )

				.bind( "mouseup",  function(){ self.onMouseUp .apply(self, arguments); } )
				.bind( "keydown",  function(){ self.onKeyDown .apply(self, arguments); } )
				.bind( "keypress", function(){ self.onKeyPress.apply(self, arguments); } )
				.bind( "focus",    function(){ self.onFocus   .apply(self, arguments); } )
				.bind( "blur",     function(){ self.onBlur    .apply(self, arguments); } );
		},

		isFixed  : function(){ return this.options.type == 'fixed';  },
		isNumber : function(){ return this.options.type == 'number'; },

		onMouseUp: function( ev ) {
			ev.stopPropagation();
			ev.preventDefault();

			if( this.isFixed() ) {
				var p = this.getSelectionStart();
				this.setSelection(p, (p + 1));
			} else if(this.isNumber() ) {
				this.setEnd();
			}
		},

		onKeyDown: function(ev) {
			if(ev.ctrlKey || ev.altKey || ev.metaKey) {
				return;

			} else if(ev.which == 13) { // enter
				this.node.blur();

				this.submitForm(this.node);

			} else if(!(ev.which == 9)) { // tab
				if(this.options.type == "fixed") {
					ev.preventDefault();

					var p = this.getSelectionStart();
					switch(ev.which) {
						case 8: // Backspace
							this.updateSelection( this.options.maskEmptyChr );
							this.selectPrevious();
							break;
						case 36: // Home
							this.selectFirst();
							break;
						case 35: // End
							this.selectLast();
							break;
						case 37: // Left
						case 38: // Up
							this.selectPrevious();
							break;
						case 39: // Right
						case 40: // Down
							this.selectNext();
							break;
						case 46: // Delete
							this.updateSelection( this.options.maskEmptyChr );
							this.selectNext();
							break;
						default:
							var chr = this.chrFromEv(ev);
							if( this.isViableInput( p, chr ) ) {
								this.updateSelection( ev.shiftKey ? chr.toUpperCase() : chr );
								this.node.trigger("valid", ev, this.node);
								this.selectNext();
							} else {
								this.node.trigger("invalid", ev, this.node);
							}
							break;
					}
				} else if(this.options.type == "number") {
					switch(ev.which) {
						case 35: // END
						case 36: // HOME
						case 37: // LEFT
						case 38: // UP
						case 39: // RIGHT
						case 40: // DOWN
							break;
						case 8:  // backspace
						case 46: // delete
							var self = this;
							setTimeout(function(){
								self.formatNumber();
							}, 1);
							break;

						default:
							ev.preventDefault();

							var chr = this.chrFromEv( ev );
							if( this.isViableInput( p, chr ) ) {
								var range = new Range( this )
								 ,    val = this.sanityTest( range.replaceWith( chr ) );

								if(val !== false){
									this.updateSelection( chr );
									this.formatNumber();
								}
								this.node.trigger( "valid", ev, this.node );
							} else {	
								this.node.trigger( "invalid", ev, this.node );
							}
							break;
					}
				}
			}
		},

		allowKeys : {
			   8 : 1 // backspace
			,  9 : 1 // tab
			, 13 : 1 // enter
			, 35 : 1 // end
			, 36 : 1 // home
			, 37 : 1 // left
			, 38 : 1 // up
			, 39 : 1 // right
			, 40 : 1 // down
			, 46 : 1 // delete
		},

		onKeyPress: function(ev) {
			var key = ev.which || ev.keyCode;

			if(
				!( this.allowKeys[ key ] )
				&& !(ev.ctrlKey || ev.altKey || ev.metaKey)
			) {
				ev.preventDefault();
				ev.stopPropagation();
			}
		},

		onFocus: function(ev) {
			ev.stopPropagation();
			ev.preventDefault();

			this.options.showMask && (this.domNode.value = this.wearMask(this.domNode.value));
			this.sanityTest( this.domNode.value );

			var self = this;

			setTimeout( function(){
				self[ self.options.type === "fixed" ? 'selectFirst' : 'setEnd' ]();
			}, 1 );
		},

		onBlur: function(ev) {
			ev.stopPropagation();
			ev.preventDefault();

			if(this.options.stripMask)
				this.domNode.value = this.stripMask();
		},

		selectAll: function() {
			this.setSelection(0, this.domNode.value.length);
		},

		selectFirst: function() {
			for(var i = 0, len = this.options.mask.length; i < len; i++) {
				if(this.isInputPosition(i)) {
					this.setSelection(i, (i + 1));
					return;
				}
			}
		},

		selectLast: function() {
			for(var i = (this.options.mask.length - 1); i >= 0; i--) {
				if(this.isInputPosition(i)) {
					this.setSelection(i, (i + 1));
					return;
				}
			}
		},

		selectPrevious: function(p) {
			if( !$chk(p) ){ p = this.getSelectionStart(); }

			if(p <= 0) {
				this.selectFirst();
			} else {
				if(this.isInputPosition(p - 1)) {
					this.setSelection(p - 1, p);
				} else {
					this.selectPrevious(p - 1);
				}
			}
		},

		selectNext: function(p) {
			if( !$chk(p) ){ p = this.getSelectionEnd(); }

			if( this.isNumber() ){
				this.setSelection( p+1, p+1 );
				return;
			}

			if( p >= this.options.mask.length) {
				this.selectLast();
			} else {
				if(this.isInputPosition(p)) {
					this.setSelection(p, (p + 1));
				} else {
					this.selectNext(p + 1);
				}
			}
		},

		setSelection: function( a, b ) {
			a = a.valueOf();
			if( !b && a.splice ){
				b = a[1];
				a = a[0];
			}

			if(this.domNode.setSelectionRange) {
				this.domNode.focus();
				this.domNode.setSelectionRange(a, b);
			} else if(this.domNode.createTextRange) {
				var r = this.domNode.createTextRange();
				r.collapse();
				r.moveStart("character", a);
				r.moveEnd("character", (b - a));
				r.select();
			}
		},

		updateSelection: function( chr ) {
			var value = this.domNode.value
			 ,  range = new Range( this )
			 , output = range.replaceWith( chr );

			this.domNode.value = output;
			if( range[0] === range[1] ){
				this.setSelection( range[0] + 1, range[0] + 1 );
			}else{
				this.setSelection( range );
			}
		},

	 	setEnd: function() {
			var len = this.domNode.value.length;
			this.setSelection(len, len);
		},

		getSelectionRange : function(){
			return [ this.getSelectionStart(), this.getSelectionEnd() ];
		},

		getSelectionStart: function() {
			var p = 0,
			    n = this.domNode.selectionStart;

			if( n ) {
				if( typeof( n ) == "number" ){
					p = n;
				}
			} else if( document.selection ){
				var r = document.selection.createRange().duplicate();
				r.moveEnd( "character", this.domNode.value.length );
				p = this.domNode.value.lastIndexOf( r.text );
				if( r.text == "" ){
					p = this.domNode.value.length;
				}
			}
			return p;
		},

		getSelectionEnd: function() {
			var p = 0,
			    n = this.domNode.selectionEnd;

			if( n ) {
				if( typeof( n ) == "number"){
					p = n;
				}
			} else if( document.selection ){
				var r = document.selection.createRange().duplicate();
				r.moveStart( "character", -this.domNode.value.length );
				p = r.text.length;
			}
			return p;
		},

		isInputPosition: function(p) {
			var mask = this.options.mask.toLowerCase();
			var chr = mask.charAt(p);
			return !!~"9ax".indexOf(chr);
		},

		sanityTest: function( str, p ){
			var sanity = this.options.sanity;

			if(sanity instanceof RegExp){
				return sanity.test(str);
			}else if($.isFunction(sanity)){
				var ret = sanity(str, p);
				if(typeof(ret) == 'boolean'){
					return ret;
				}else if(typeof(ret) != 'undefined'){
					if( this.isFixed() ){
						var p = this.getSelectionStart();
						this.domNode.value = this.wearMask( ret );
						this.setSelection( p, p+1 );
						this.selectNext();
					}else if( this.isNumber() ){
						var range = new Range( this );
						this.domNode.value = ret;
						this.setSelection( range );
						this.formatNumber();
					}
					return false;
				}
			}
		},

		isViableInput: function() {
			return this[ this.isFixed() ? 'isViableFixedInput' : 'isViableNumericInput' ].apply( this, arguments );
		},

		isViableFixedInput : function( p, chr ){
			var mask   = this.options.mask.toLowerCase();
			var chMask = mask.charAt(p);

			var val = this.domNode.value.split('');
			val.splice( p, 1, chr );
			val = val.join('');

			var ret = this.sanityTest( val, p );
			if(typeof(ret) == 'boolean'){ return ret; }

			if(({
				'9' : this.options.validNumbers,
				'a' : this.options.validAlphas,
				'x' : this.options.validAlphaNums
			}[chMask] || '').indexOf(chr) >= 0){
				return true;
			}

			return false;
		},

		isViableNumericInput : function( p, chr ){
			return !!~this.options.validNumbers.indexOf( chr );
		},

		wearMask: function(str) {
			var   mask = this.options.mask.toLowerCase()
			 ,  output = ""
			 , chrSets = {
				  '9' : 'validNumbers'
				, 'a' : 'validAlphas'
				, 'x' : 'validAlphaNums'
			};

			for(var i = 0, u = 0, len = mask.length; i < len; i++) {
				switch(mask.charAt(i)) {
					case '9':
					case 'a':
					case 'x':
						output += 
							((this.options[ chrSets[ mask.charAt(i) ] ].indexOf( str.charAt(u).toLowerCase() ) >= 0) && ( str.charAt(u) != ""))
								? str.charAt( u++ )
								: this.options.maskEmptyChr;
						break;

					default:
						output += mask.charAt(i);
						if( str.charAt(u) == mask.charAt(i) ){
							u++;
						}

						break;
				}
			}
			return output;
		},

		stripMask: function() {
			var value = this.domNode.value;
			if("" == value) return "";
			var output = "";

			if( this.isFixed() ) {
				for(var i = 0, len = value.length; i < len; i++) {
					if((value.charAt(i) != this.options.maskEmptyChr) && (this.isInputPosition(i)))
						{output += value.charAt(i);}
				}
			} else if( this.isNumber() ) {
				for(var i = 0, len = value.length; i < len; i++) {
					if(this.options.validNumbers.indexOf(value.charAt(i)) >= 0)
						{output += value.charAt(i);}
				}
			}

			return output;
		},

		chrFromEv: function(ev) {
			var chr = '', key = ev.which;

			if(key >= 96 && key <= 105){ key -= 48; }     // shift number-pad numbers to corresponding character codes
			chr = String.fromCharCode(key).toLowerCase(); // key pressed as a lowercase string
			return chr;
		},

		formatNumber: function() {
			// stripLeadingZeros
			var olen = this.domNode.value.length
			 ,  str2 = this.stripMask()
			 ,  str1 = str2.replace( /^0+/, '' )
			 , range = new Range(this);

			// wearLeadingZeros

			str2 = str1;
			str1 = "";
			for(var len = str2.length, i = this.options.decDigits; len <= i; len++) {
				str1 += "0";
			}
			str1 += str2;

			// decimalSymbol
			str2 = str1.substr(str1.length - this.options.decDigits)
			str1 = str1.substring(0, (str1.length - this.options.decDigits))

			// groupSymbols
			var re = new RegExp("(\\d+)(\\d{"+ this.options.groupDigits +"})");
			while(re.test(str1)) {
				str1 = str1.replace(re, "$1"+ this.options.groupSymbol +"$2");
			}

			this.domNode.value = this.options.currencySymbol + str1 + this.options.decSymbol + str2;
			this.setSelection( range );
		},

		getObjForm: function() {
			// getClosest -> 수정			
			//return this.node.getClosest('form');
			return this.node.closest('form');
		},

		submitForm: function() {
			var form = this.getObjForm();
			form.trigger('submit');
		}
	};

	function Range( obj ){
		this.range = obj.getSelectionRange();
		this.len   = obj.domNode.value.length
		this.obj   = obj;
		
		/**
		 * ie10 이하에서 이상 반응이 있어 수정함
		 * ie11에서 문서 모드를 변경해서 보거나 ietester에서 보면 문제가 없으나 ie10에서 보면 문제가 발생 하여 수정함
		 * range 값이 0,1 1,2 이런식으로 나와야 하는데 1,1이렇게 나오고 있어 문제가 됨
		 * @author jgs135
		 */
		if(obj.domNode.value.substring(0,1) == ' ' && this.range[0] == 1 && this.range[1] == 1){
			this.range = [0,1];
		}

		this['0']  = this.range[0];
		this['1']  = this.range[1];
	}
	Range.prototype = {
		valueOf : function(){
			var len = this.len - this.obj.domNode.value.length;
			return [ this.range[0] - len, this.range[1] - len ];
		},
		replaceWith : function( str ){
			var  val = this.obj.domNode.value
			 , range = this.valueOf();

			return val.substr( 0, range[0] ) + str + val.substr( range[1] );
		}
	};

	$.fn.iMask = function(options){
		this.each(function(){
			new iMask($(this), options);
		});
	};
})(jQuery);



(function($) {
	
	/*
	 * input의 type이 text일때 KeyUp event를 잡아서 주어진 형태로 문자열을 변환하여 표시합니다. 
	 * 표시형식은 정수형, 플로우트형, 전화번호형,고정형을 지원합니다. 숫자를 표시할 때 콤마를 표시 
	 * 하고 싶으면 hasComma를 true 하면 됩니다.
	 * 
	 * 고정형은 고정길이의 주어진 형식으로 입력이 필요할 때 사용합니다. 주민번호나 특별한 형식의 
	 * 아이디입력을 받고 싶을 때 사용합니다. 전화번호는 국번이 02 이거나 031과 같이 자리수가 일정
	 * 하지 않아서 별도의 타입으로 분리했습니다.
	 * 
	 * 아래는 예제입니다.
	 * 
	 * 	$("#maskTelephone").nMask( { type:"telephone"});  // 전화번호
	 * 	$("#maskResidentId").nMask( {                     // 주민번호
	 *          type:'fixed',   // 고정길이
	 *          mask:'999999-9999999'
	 *  });
	 *   
	 *  // 정수형
	 *  $("#maskInteger").nMask( {  
	 *    	 type:'number',
	 *       decimals:0,     // 소수자리수
	 *    	 hasComma:true   // 천의자리 구분표시(콤마)
	 *  });
	 *   
	 *  $("#maskFloat").nMask( {  type:'number',        hasComma:true     });  // 소수형
	 *  $("#maskDate").nMask( { type:'fixed',mask:'9999/99/99',}); // 날자 
	 *  $("#maskId").nMask( { type:'fixed',mask:'(aaa)999-999'  }); // 고정형
	 *   
	 *   
	 * 옵션
	 *    type : number,telephone, fixed 
	 *    mask : Mask using 9,a,x notation.  9=Numeric; a=Alpha; x=AlphaNumeric
	 *    decimals : 소수자리수 
	 *    hasComma:  숫자를 표시할 때 콤마를 넣을지 여부
	 *   
	 *   
	 * References. https://github.com/cwolves/jQuery-iMask
	 * 
	 * @author Sanghyun, Kim
	 */
	var nMask = function()  {
		this.initialize.apply(this, arguments);
    };
    
    nMask.prototype = {
    		// 옵션
    		options: {
    			type : "number",     // telephone, number, fixed
    			mask:"9,999",        // 고정형일때
    			decimals:2,          // 소수자리수
    			hasComma: true       // 자리수구분(,)
    		},
    		// 고정형 여부
    		isFixed  : function(){ return this.options.type == 'fixed';  },
    		// 초기화 
    		initialize : function(node, options) {
    			this.node = node;  // jquery 확장집합 
    			this.domNode = node[0];
    			this.options = $.extend({}, this.options, this.options[options.type] || {} , options);
    			var self     = this;
    			this.node
    			    .bind( "keyup",    function(){ self.onKeyUp.apply(self, arguments); } )
    			    .bind( "focus",    function(){ self.onFocus.apply(self, arguments); } )
    			    .bind( "blur",    function(){ self.onFocus.apply(self, arguments); } );
    			if(this.options.type == "fixed") {
        			$(this.node).iMask({
        				type:"fixed",
        				mask: this.options.mask
        			});
    			}
    		},
    		
    		// onFocus event
    		onFocus : function(event) {
    			if(this.options.type == "telephone") {
    				this.maskTelephone(event); 
    			}else if(this.options.type == "number") { 
    				this.maskNumber(event);
    			}/*else if(this.options.type == "fixed") {
    				this.domNode.value = this.stripMask( );
    				this.domNode.value = this.wearMask(this.options.mask, this.domNode.value);
    			}*/
    		},
    		// onKeyUp event
    		onKeyUp : function(event) {
    			if(this.options.type == "telephone") {
    				this.maskTelephone(event); 
    			}else if(this.options.type == "number") { 
    				this.maskNumber(event);
    			}/*else if(this.options.type == "fixed") {
    				this.domNode.value = this.stripMask( );
    				this.domNode.value = this.wearMask(this.options.mask, this.domNode.value);
    			}*/
    		},
    		// onFocusOut event
    		onFocusOut : function(){
    			if(this.options.type == "telephone") {
    				this.maskTelephone(event); 
    			}else if(this.options.type == "number") { 
    				this.maskNumber(event);
    			}/*else if(this.options.type == "fixed") {
    				this.domNode.value = this.stripMask( );
    				this.domNode.value = this.wearMask(this.options.mask, this.domNode.value);
    			}*/
    		},
    		
    		// number type formatting
    		maskNumber: function(event) {
    			 var str = ""; 
    			 if(this.options.decimals > 0)  {
    				 str = this.domNode.value.replace(/[^0-9,\.]/g, "");	 
    			 }else {
    				 str = this.domNode.value.replace(/[^0-9,]/g, "");
    			 }
    			 var tmps =  this.formatComma(str.replace(/,/g, ""));
    
    			 if(this.options.hasComma) { 
    				 tmps =  tmps;	 
    			 }else {
    				 tmps =  tmps.replace(/,/g, "");
    			 }
    			 if(tmps.indexOf(".") > 0) {
        			 if(this.options.decimals > 0) { 
        				 var priorStr = tmps.substring(0, tmps.indexOf(".") +1);
        				 var postStr =  tmps.substring(tmps.indexOf(".")+1);
        				 tmps = priorStr + this.left(postStr, this.options.decimals);
        			 }
    			 }
    			 this.domNode.value = tmps;
    		},
    		// 전화번호 타입 포맷팅
    		maskTelephone : function(event) {
	   			 var str = this.domNode.value.replace(/[^0-9]/g, "");
	             if(!this.isNumberDash(this.domNode.value)) {
	                this.domNode.value = this.domNode.value.replace(/[^0-9\-]/g, "");
	                return false;
	             }
	             this.domNode.value =  this.formatTelephone(str);
	             return true;
    		},
    		// 왼쪽을 기준으로 주어진 길이만큼 문자열 자르기
            left : function(str, length) {
                if(!str) return "";
                return  str.length >= length  ? str.substring(0, length): str;
            },
            // 입력된 숫자형식의 문자열에 콤마를 넣습니다
            formatComma : function(str) {
            	str += '';
            	x = str.split('.');
            	x1 = x[0];
            	x2 = x.length > 1 ? '.' + x[1] : '';
            	var rgx = /(\d+)(\d{3})/;
            	while (rgx.test(x1)) {
            		x1 = x1.replace(rgx, '$1' + ',' + '$2');
            	}
            	return x1 + x2;
            },
            // 전화번호 포맷팅 
    	    formatTelephone : function(str)  {
   	            	if(!str) return "";
   	            	if(str.length < 3) return str;
   	            	else if(str.length >= 3 & str.length < 5) {
   	            		return str.replace(/(^0(?:2|[0-9]{2}))([0-9]+$)/, "$1-$2");
   	            	}
   	            	else if(str.length >= 5 & str.length < 8) {
   	            		return str.replace(/(^0(?:2|[0-9]{2}))([0-9]{3,4})([0-9]+$)/, "$1-$2-$3");
   	            	}
   	            	else {
   	            		return str.replace(/(^0(?:2|[0-9]{2}))([0-9]+)([0-9]{4}$)/, "$1-$2-$3");
   	            	}
    	    },// formatTelephone
    	    // 숫자와 dash만 있는지 확인
            isNumberDash : function(str) {
            	return !str.match(/[^0-9\-]{1,}/);
            },
            
            // type이 fixed일때 사용
            // @deprecated
    		isInputPosition: function(p) {
    			var mask = this.options.mask.toLowerCase();
    			var chr = mask.charAt(p);
    			return !!~"9ax".indexOf(chr);
    		},
    		//@deprecated
    		stripMask: function() {
    			var value = this.domNode.value;
    			if("" == value) return "";
    			var output = "";
    			var maskEmptyChr = '';

    			if( this.isFixed() ) {
    				for(var i = 0, len = value.length; i < len; i++) {
    					if((value.charAt(i) !=  maskEmptyChr) && (this.isInputPosition(i)))
    						{output += value.charAt(i);}
    				}
    			} 
    			//else if( this.isNumber() ) {
//    				for(var i = 0, len = value.length; i < len; i++) {
//    					if(this.options.validNumbers.indexOf(value.charAt(i)) >= 0)
//    						{output += value.charAt(i);}
//    				}
    		//	}

    			return output;
    		},
    		//@deprecated
            wearMask: function(mask, str) {
            	 var options = {
            		        validNumbers   : "1234567890",
            	            validAlphas    : "abcdefghijklmnopqrstuvwxyz",
            	            validAlphaNums : "abcdefghijklmnopqrstuvwxyz1234567890",
            	            groupDigits    : 3,
            	            decDigits      : 2,
            	            currencySymbol : '',
            	            groupSymbol    : ',',
            	            decSymbol      : '.',
            	            showMask       : true,
            	            stripMask      : false,
            	            lastFocus      : 0
             	 };
                 var mask = mask.toLowerCase()
                  , output = ""
                  , chrSets = {
                       '9' : 'validNumbers'
                     , 'a' : 'validAlphas'
                     , 'x' : 'validAlphaNums'
                 };
                 
                 
                 var maskEmptyChr = '';
                 var tmp = "";
                 for(var i = 0, u = 0, len = mask.length; i < len; i++) {
                	 if(u >= str.length) break;
                     switch(mask.charAt(i)) {
                         case '9':
                         case 'a':
                         case 'x':
                             output += 
                                 ((options[ chrSets[ mask.charAt(i) ] ].indexOf( str.charAt(u).toLowerCase() ) >= 0) && ( str.charAt(u) != ""))
                                     ? str.charAt( u++ )
                                     : maskEmptyChr;
                             break;
                         default:
                             output += mask.charAt(i);
                             if( str.charAt(u) == mask.charAt(i) ){
                                 u++;
                             } 
                             break;
                     }
                 }
                 return output;
            }// mask 
    };
    
    $.fn.nMask = function(options) {
    	this.each(function() {
    		new nMask($(this), options);
    	});
    };
	
})(jQuery);

