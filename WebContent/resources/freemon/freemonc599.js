(function($) {
	
	/*
	 * @deprecated
	 * 중복된 history를 생성하는 버그,특정상황에서만 쓸수있는 제약 조건,제한된 히스토리 저장 갯수 문제가 있어서 필요한 페이지만 별도로 구현
	 
	$(window).hashchange(function(evt){
		freemon.http.history.hashChange(evt);
	}).unload(function(evt){
		freemon.http.history.historyLocalSave();
	}).load(function(){
		freemon.http.history.restoreLocalSave();
		if (freemon.http.history.state.length > 0) {
			freemon.http.history.state[freemon.http.history.state.length - 1].restore = true;
			location.hash = freemon.http.history.state[freemon.http.history.state.length - 1].hash;
		}
	});*/
	$.datepicker.setDefaults({
        dateFormat: 'yy-mm-dd',
        prevText: '이전 달',
        nextText: '다음 달',
        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
        showMonthAfterYear: true,
        yearSuffix: '년'
    });
	
	$.validator.setDefaults({
	    onkeyup: false,
	    onclick: false,
	    onfocusout: false,
	    showErrors: function(errorMap,errorList){
	        if(this.numberOfInvalids()){ // 에러가 있으면
	            //alert(errorList[0].message); // 경고창으로 띄움
	            freemon.ux.alert(errorList[0].message);
	        }
	    }
	});
	
	$.validator.addMethod('checkBizNo', function (value, element, param) {
		var checkID = new Array(1, 3, 7, 1, 3, 7, 1, 3, 5, 1); 
		var tmpBizID, i, chkSum=0, c2, remander;

		for (i=0; i<=7; i++) chkSum += checkID[i] * value.charAt(i); 
		c2 = "0" + (checkID[8] * value.charAt(8)); 
		c2 = c2.substring(c2.length - 2, c2.length); 
		chkSum += Math.floor(c2.charAt(0)) + Math.floor(c2.charAt(1)); 
		remander = (10 - (chkSum % 10)) % 10 ; 

		if (Math.floor(value.charAt(9)) == remander) return true ; // OK! 
			return false;
    });
	
	$.validator.addMethod('checkEmail', function (value, element, param) {
		var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        if(filter.test(value)) return true;
            return false;
	});
	
	$.validator.addMethod('checkTelno', function (value, element, param) {
		var filter = /^\d{3}\d{3,4}\d{4}$/;
        if(filter.test(value)) return true;
            return false;
	});
	
	$.validator.addMethod('checkPwd', function (value, element, param) {
		//var filter = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
		var filter = /([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~,-])|([!,@,#,$,%,^,&,*,?,_,~,-].*[a-zA-Z0-9])/;
        if(filter.test(value)) return true;
            return false;
	});
	
	$.jsonQueryParams = function(query) {
		query = decodeURIComponent(query);
		  var chunks = query.replace(/^\?/, '').split('&'),
		      obj = {};
		  for(var c=0; c < chunks.length; c++) {
		    var split = chunks[c].split('=', 2);
		    obj[split[0]] = split[1];
		  }
		  return obj;
		/*
		return query.replace(/^\?/, '').split('&').reduce((json, item) => {
			if (item) {
		    	item = item.split('=').map((value) => decodeURIComponent(value))
		    	json[item[0]] = item[1]
		    }
		    return json
		}, {});
		*/
	};
	
    /**
     * Javascript가 로드된후 javascript를 호출해야 한다. 자바스크립트가 로드될 때까지 기다린후 화면제어
     * 로직을 처리하는 스크립트의 init 함수를 호출한다.
     */
    var ScriptInvoker = function(scriptName)  {
        /** 실행할 스크립트 객체명    */
        this.scriptName = scriptName;
        /** timeout 이벤트의 참조 변수 */
        this.timeVar   =  'undefined';
        /** 객체에 전달할 데이터 값 */
        this.attrValue =  'undefined';
        /** 객체에 생성할 데이터 */
        this.attrName;
        /**
         * script에 전달할 데이터를 설정합니다.
         * @param attrName  변수명
         * @param attrValue 데이터, Object, string, int 아무거나
         */
        this.setAttribute = function(attrName, attrValue) {
            this.attrName   = attrName;
            this.attrValue  = attrValue;
        };
        /**
         * script의 init를 호출합니다.
         */
        this.invoke = function() {
            var self = this;
            this.timeVar = setTimeout(function() {
                var func = window[self.scriptName];
                if(func) {
                    if(self.attrName) {
                        func[self.attrName] = self.attrValue;
                    }
                    func.init();
                    self.clearTime();
                }else {
                    self.invoke();
                }
            });
        };
        /**
         * 타입아웃을 해제
         */
        this.clearTime = function() {
            clearTimeout(this.timeVar);
        };
    };


        var freemon = function() {
            //return new freemon.fn.init();
        };
//
//        freemon.fn = freemon.prototype = {
//            init : function() {
//                return this;
//            }
//        };

        // ---------------------------------------------------------------------- String Section
        /**
         * 문자열 처리 클래스
         */
        freemon.string = {
        		
        	/**
             * 배열 split 구분자
            */
        	sep : [",", "|", "▒", "▤", "▩", "＾", "｜", "＆"],
            
        	/**
             * 패딩문자로 문자열을 채웁니다. Oracle LPAD 함수를 생각하면 됩니다.
             *
             * <pre>
             *
             * 다음은 문자열을 padding하는 예제입니다.
             *
             * var src = "111";
             * var paddedStr = freemon.string.lpad(src, 10, '0');
             *
             * paddedStr의 값은 다음과 같습니다.
             *
             * '0000000111'
             *
             * </pre>
             *
             * @param src 원본문자열
             * @param length 문자열의 제한 길이
             * @param pad 채울 문자
             * @returns
             *      패딩된 문자열
             */
        	lpad : function(s, padLength, padString){
        		 
        	    while(s.length < padLength)
        	        s = padString + s;
        	    return s;
        	},
        	 
        	rpad : function rpad(s, padLength, padString){
        	    while(s.length < padLength)
        	        s += padString;
        	    return s;
        	},
        	/*
        	* 마지막 글자를 마스킹 처리한다. (ex. 홍길동 → 홍길*)
        	*/
        	maskingStr : function (str) {
        	    if(str === undefined || str === '') {
        	        return '';
        	    }
        	    var pattern = /.{2}$/; // 정규식
        	    return str.replace(pattern, "*");
        	},
/*
            lpad : function(src, length, pad) {
                if (!this.hasText(src))
                    return "";

                var buffer = [];
                for ( var i = 0; i < length - src.length; i++) {
                    buffer.push(pad);
                }
                src = buffer.join("") + src;
                return src.substring(0, length);
            },
*/            /**
             * 문자열의 앞뒤를 공백을 제거합니다. 오라클의 trim을 생각하면 됩니다.
             * <pre>
             * 다음은 trim을 사용하는 예제입니다.
             *
             * var src = "abcde   ";
             * var trimedString = freemon.sring.trim(src);
             *
             * trimedString의 값은 다음과 같습니다.
             *
             *  'abcde'
             *
             * </pre>
             * @param str  문자열
             *      트림된 문자열
             */
            trim : function(str) {
            	str = str.toString();
            	return str.replace(/^\s\s*/, '').replace(/\s\s*$/, '');
            },
            /**
             * 공백을 제외한 문자열을 가지고 있는지 확인합니다.
             * @param str 체크할 문자열
             * @return
             *      true : 문자열의 길이가 > 0 이면 , 그밖에 false
             */
            hasText : function(str) {
                if (!str)
                    return false;
                str = this.trim(str);
                if (str == "")
                    return false;
                return true;
            },
            /**
             * 주어진 문자열이 null 이나 "" 인지 확인
             * @param 비교할 문자열
             * @return
             * 		true : null 이나 "", , 그밖에 false
             */
            isEmpty : function(str) {
                return (str == null || str == "") ? true: false;
            },

            /**
             * 주어진 문자열이 null 이나 "" 인지 확인
             * @param 비교할 문자열
             * @return
             * 		false : null 이나 "", , 그밖에 true
             */
            isNotEmpty : function(str) {
                return (str == null || str == "") ? false: true;
            },


            /**
             * 주어진 문자열이 null 혹은 "" 혹은 undefined 인지 확인
             * @param 비교할 문자열
             * @return
             * 		true : null 이나 "", , 그밖에 false
             */
            isBlank : function(str) {
                return (str == null || str == "" || str == "undefined") ? true: false;
            },

            /**
             * 주어진 문자열이 null 혹은 "" 혹은 undefined 인지 확인
             * @param 비교할 문자열
             * @return
             * 		false : null 이나 "", , 그밖에 true
             */
            isNotBlank : function(str) {
                return (str == null || str == "" || str == "undefined") ? false: true;
            },
            
            /**
             * 주어진 문자열이 json 문자열인지 확인
             * @param 비교할 문자열
             * @return false , true
             */
            isJsonString : function(str) {
            	if(str == null || str == "" || str == undefined){
            		return false;
            	}else if (/^[\],:{}\s]*$/.test(str.replace(/\\["\\\/bfnrtu]/g, '@').
            			replace(/"[^"\\\n\r]*"|true|false|null|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?/g, ']').
            			replace(/(?:^|:|,)(?:\s*\[)+/g, ''))) {
            		return true;
            	}
                return false;
            },

            /**
             * 문자열이 널이면 널스트링("")을 반환
             * @param str 원본문자열
             * @returns
             *      변환된 문자열
             */
            nvls : function(str) {
                if (!str)
                    return "";
                else
                    return str;
            },

            /**
             * Oracle의 decode 참조. "1,한글,2,영어,기타" 와 같은 문자열을 decodeString
             * 에 설정하고 expr1에 '2' 값을 설정하면  "영어"를 반환합니다. 주어진 값이
             * 없으면 마지막 기타를 반환합니다.
             *
             *
             * <pre>
             * 다음은 decode를 사용하는 예제입니다.
             *
             * var  deStr = "1,사과,2,배,감자";
             * var  decodedString = freemon.string.decode("2", deStr);
             *
             * decodeStgring의 값은  "배"가 됩니다.
             *
             *
             * </pre>
             *
             * @param expr1 찾을 문자열
             * @param decodeString 해석할 문자열
             *  @return 검색된 결과 문자열
             */
            decode : function(expr1, decodeString) {
                decodeString = this.trim(decodeString);
                var strs = decodeString.split(',');
                return this.decode_internal(expr1, strs);
            },
            /**
             * decode의 내부에서 사용합니다. 실제의 decode 처리를 합니다.
             * @param expr1  디코드할 문자열
             * @param exprs 디코드 값
             * @returns
             *      결과 값
             */
            decode_internal : function(expr1, exprs) {
                var i = 0;
                var hasElseValue = false;
                var isMatch = false;
                var expr = this.nvls(expr1);

                hasElseValue = (exprs.length % 2) == 1 ? true : false;
                for (i = 0; i < exprs.length; i++) {
                    if ((i % 2) == 0 && expr == exprs[i])
                        return exprs[i + 1];
                    i++;
                }// for

                if (!isMatch && hasElseValue)
                    rv = exprs[exprs.length - 1];
                return rv;
            },
            /**
             * 문자열을 치환합니다.
             *
             * <pre>
             *
             * var src = "Once or twice";
             * var replacedStr = freemon.string.replace(src, "twice");
             *
             * replacedStr의 값은 다음과 같습니다.
             *
             * "Once or "
             *
             * </pre>
             *
             * @param str 원본문자열
             * @param findStr 찾을 문자열
             * @param replaceStr 치환할 문자열
             *
             */
            replace : function(str, findStr, replaceStr) {
                if (!str)
                    return str;
                return str.replace(new RegExp(findStr, "g"), replaceStr);
            },
            /**
             * 문자열의끝에서 주어진 길이만큼 분리합니다.
             *
             * <pre>
             *
             * var src = "123456789";
             * var rightedString = freemon.string.right(src, 5);
             *
             * 결과는 다음과 같습니다.
             *
             * "56789"
             *
             * </pre>
             *
             * @param str 원본 문자열
             * @param length 길이
             * @returns
             * 		 변환된 문자열
             */
            right : function(str, length) {
                if (!str)
                    return "";
                return (str.length >= length) ? str.substring(str.length - length) : str;
            },
            /**
             * 문자열의 시작부분을 잘라냅니다.
             *
             * <pre>
             *
             * var src = "123456789":
             * var leftedString = freemon.string.left(src, 5);
             *
             * 결과는 다음과 같습니다.
             *
             *
             * "12345"
             *
             * </pre>
             *
             * @param str  원본 문자열
             * @param length  길이
             * @returns
             * 		변환된 문자열
             */
            left : function(str, length) {
                if (!str)
                    return "";
                return str.length >= length ? str.substring(0, length) : str;
            },
            /**
             * 날자형식으로 변환합니다.
             *
             * <pre>
             * var str = "20120101";
             * var formatedStr = freemon.string.formatDate(str, '/');
             *
             * 결과는 다음과 같습니다.
             * "2012/01/01"
             *
             * </pre>
             *
             * @param str  원본 문자열
             * @param ch  구분자
             * @returns
             *      변환된 문자열
             */
            formatDate : function(str, ch) {
                if (str == null)
                    return "";
                if (str.length < 5)
                    return str;
                else if (str.length > 4 && str.length < 7) {
                    return this.left(str, 4) + ch + str.substring(4);
                } else {
                    return this.left(str, 4) + ch + str.substring(4, 6) + ch + str.substring(6);
                }
            },
            /**
             * 주민번호 형식으로 변환합니다.(750123-21111111)
             *
             * <pre>
             *
             * var str = "7501232111111";
             * var formatedStr = freemon.string.formatResidentId(str);
             *
             * 결과는 다음과 같습니다.
             *
             * "750123-2111111"
             *
             *
             * </pre>
             * @param str 문자열
             * @returns
             * 		변환된 문자열
             */
            formatResidentId : function(str) {
                if (str == null)
                    return "";
                str = this.replace(str, "-", "");
                if (str.length < 7)
                    return str;
                return this.left(str, 6) + "-" + str.substring(6);
            },
            /**
             *  우편번호 형식으로 문자열을 변환합니다.
             *
             *  <pre>
             *
             *  var str = "132123";
             *  var formatedStr = freemon.string.formatZipCode(str);
             *
             *  결과는 다음과 같습니다.
             *
             *  "132-123"
             *
             *  </pre>
             *
             * @param str 원본 문자열
             * @returns
             * 		변환된 문자열
             */
            formatZipCode : function(str) {
                if (str == null)
                    return "";
                str = this.replace(str, "-", "");
                if (str.length < 4)
                    return str;
                return this.left(str, 3) + "-" + str.substring(3);
            },

            /**
             * 입력된 숫자형식의 문자열에 콤마를 넣습니다.
             *
             * <pre>
             *
             * var str = "123123";
             * var formatedStr = naopn.string.formatComma(str);
             *
             * 결과는 다음과 같습니다.
             *
             * "123,123"
             *
             * </pre>
             *
             * @param str 원본 문자열
             * @returns
             * 		변환된 문자열
             */
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
            /**
             * 전화번호 형식으로 변환합니다
             *
             * <pre>
             * var str = "023030101";
             * var formatedStr = freemon.string.formatTelephone(str);
             *
             * 결과는 다음과 같습니다.
             *
             * "02-303-0101";
             * </pre>
             *
             * @param str 원본  문자열
             * @returns
             * 		변환된 문자열
             */
            formatTelephone : function(str) {
                if (!str)
                    return "";
                if (str.length < 3)
                    return str;
                else if (str.length >= 3 & str.length < 5) {
                    return str.replace(/(^0(?:2|[0-9]{2}))([0-9]+$)/, "$1-$2");
                } else if (str.length >= 5 & str.length < 8) {
                    return str.replace(/(^0(?:2|[0-9]{2}))([0-9]{3,4})([0-9]+$)/, "$1-$2-$3");
                }
                //            	else {
                //            		return str.replace(/(^0(?:2|[0-9]{2}))([0-9]+)([0-9]{4}$)/, "$1-$2-$3");
                //            	}
            },
            /**
             * 문자열이 통화형식(123,222.22) 형식인지 확인합니다.
             * @param str 문자열
             * @returns
             * 		형식이 맞으년 true, 아니면 false
             */
            isCurrency : function(str) {
                return !str.match(/[^0-9,\.]{1,}/);
            },
            /**
             * 이메일 형식이 맞는지 확인한다.
             */
            isEmail : function (str){
            	return !str.match(/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i);
            },
            /**
             * 문자열이 정수형(1234455)인지 확인한다.
             * @param str 문자열
             * @returns
             * 		형식이 맞으년 true, 아니면 false
             */
            isInteger : function(str) {
                return !str.match(/[^0-9]{1,}/);
            },
            /**
             * 문자열이 정수형과 대쉬(-)만 있는지 체크
             * @param str 문자열
             * @returns
             *    형식이 맞으년 true, 아니면 false
             */
            isNumberDash : function(str) {
                return !str.match(/[^0-9\-]{1,}/);
            },
            /**
             * 바이트로 환산한 문자열의 길이값 반환
             *
             * <pre>
             *
             * var str = "한글a";
             * var len = freemonb.string.getBytesLength(str);
             *
             * 결과는 7 입니다.
             * 오라클 기준으로 한글은 3byte 로 계산 되었습니다.
             *
             * </pre>
             *
             * @param str 문자열
             * @returns
             * 		integer : 문자열 길이
             */
            getBytesLength : function(str) {
                str_len = str.length;
                byte_cnt = 0;
                if (str_len != escape(str).length) {
                    for (i = 0; i < str_len; i++) {
                        byte_cnt++;
                        if (this.isUnicode(str.charAt(i))) {
                            byte_cnt = byte_cnt + 2;
                        }
                    }
                } else
                    byte_cnt = str_len;
                return byte_cnt;
            },
            /**
             * 입력받은 글자 byte길이로 자르기
             * */
            getBytesCut :  function(str, len) {
            	var l = 0;
            	for (var i=0; i<str.length; i++) {
            	       l += (str.charCodeAt(i) > 128) ? 2 : 1;
            	       if (l > len) return str.substring(0,i);
            	}
            	return str;
        	},
            	

            /**
             * 문자가 유니코드인지 확인
             * @param chr 문자
             * @returns {Boolean}
             * 		true 유니코드, false 유니코드 아님
             */
            isUnicode : function(chr) {
                return (escape(chr).length == 6);
            }
        };

    	/**
    	 * 다국어 처리 클래스
    	 */
    	freemon.i18n = {
    		/**
    		 * 다국어 처리시 인자가 있는 경우 치환
    		 *
    		 *
    		 */
    		msgFormat : function() {
    			var arg = arguments;
    			if (arg.length == 0)
    				return '';
    			if (arg.length == 1)
    				return arg[0];

    			var fn = function(w, g) {
    				if (isNaN(g))
    					return '';
    				var idx = parseInt(g) + 1;
    				if (idx >= arg.length)
    					return '';
    				return arg[parseInt(g) + 1];
    			};
    			return arg[0].replace(/\{([0-9]*)\}/g, fn);
    		},

            /**
             * 설정 파일에서 언어셋을 읽어 다국어 UI를 구성
             * @param i18nDivId 다국어 UI가 들어갈 DivId
             * @param i18nColName 다국어 컬럼명
             * @param alwaysEn 조직관리의 경우 Y, 기타 N
             * @param uiStyle 'simple이면 한줄형태로 나옴. 그외 여러줄형태로.
             *
             * 설정파일
             * #언어셋
             * langSet=한국어$ko*English$en*日本語$ja*中國語$zh
             * #기본언어
             * defaultLang=ko
             *
             * <div class="lang" id=”divDeptName”>
             * </div>
             *
             * freemon.i18n. formatI18nUI(“divDeptName”,”deptName”) 호츌후
             *
             * <div class="lang" id=”divDeptName”>
             * <dl>
             * 	<dt>한국어<span class="req">*</span></dt>
             * 	<dd><input id="deptName_ko" name="deptName_ko" type="text" data-lang="KO" class="input_txt"></dd>
             * </dl>
             * <dl>
             * 	<dt>English</dt>
             * 	<dd><input id="deptName_en" name="deptName_en"  type="text" data-lang="EN" class="input_txt"></dd>
             * </dl>
             * <dl>
             * 	<dt>日本語</dt>
             * 	<dd><input id="deptName_ja" name="deptName_ja"  type="text" data-lang="JA" class="input_txt"></dd>
             * </dl>
             * <dl>
             * 	<dt>中國語</dt>
             * 	<dd><input id="deptName_zh" name="deptName_zh"  type="text" data-lang="ZH" class="input_txt"></dd>
             * </dl>
             * </div>
             *
             * freemon.i18n. formatI18nUI(“divDeptName”,”deptName”, 'N', 'simple') 호츌후
             * <div class="lang" id=”divDeptName”>
             *	<input name="deptName_ko" type="text" placeholder="한국어*" class="input_txt">
             *	<input name="deptName_en" type="text" placeholder="English" class="input_txt">
             * </div>
             *
             */
			formatI18nUI : function(i18nDivId,i18nColName,alwaysEn,uiStyle) {
				var template = uiStyle === 'simple' ? this.getSimpleI18nTmplt() : this.getI18nTmplt();
				var langSetArr = this.getLangSetArr();

				if (alwaysEn == "Y" && !this.existsEn) {
					
					var existEn = false;
					
					//이미 영문이 있을경우 추가하지 않는다.
					$.map(langSetArr, function(value, key) {
						if(value.langCd == 'en'){
							existEn = true;
						} 
					});
					
					if(!existEn){
						langSetArr.push({
							langName: 'English',
							langCd: 'en',
							defaultLang: false
						});
					}
				}
				
				var html = Mustache.to_html(template, {keyPrefix: i18nColName + '_', langSet: langSetArr});
				$('#'+i18nDivId).html(html);
			},
			/** 한줄형태의 다국어 템플릿 */
			getSimpleI18nTmplt: function() {
				if (!this.simpleI18nTmplt) {
					this.simpleI18nTmplt = '{{#langSet}}\r\n' +
						'<input id="{{keyPrefix}}{{langCd}}" name="{{keyPrefix}}{{langCd}}" type="text" placeholder="{{langName}}{{#defaultLang}}*{{/defaultLang}}" data-lang="{{langCd}}" title="{{langName}}" class="input_txt">\r\n' +
						'{{/langSet}}';
				}
				return this.simpleI18nTmplt;
			},
			/** 다국어 템플릿 */
			getI18nTmplt: function() {
				if (!this.i18nTmplt) {
					this.i18nTmplt = "{{#langSet}}<dl>\r\n" +
						"<dt>{{langName}}{{#defaultLang}}<span class=\"req\">*</span>{{/defaultLang}}</dt>\r\n" +
						"<dd><input id=\"{{keyPrefix}}{{langCd}}\" name=\"{{keyPrefix}}{{langCd}}\" data-lang=\"{{langCd}}\" type=\"text\" class=\"input_txt\"></dd>\r\n" +
		 				"</dl>{{/langSet}}";
				}
				return this.i18nTmplt;
			},
			/** 언어셋 배열을 반환한다.
			 *  @keyPrefix key prefix
			 */
			getLangSetArr : function() {
				if (!this.langSetArr) {
					this.langSetArr = $.map(frameworkProperties.langSet.split("*"), function(value, key) {
						var lang = value.split("$");
						var langSet = {
								langName: lang[0],
								langCd: lang[1],
								defaultLang: frameworkProperties.defaultLang == lang[1]
							};
						if(lang[1] === 'en') {
							freemon.i18n.existsEn = true;
						}
						return langSet;
					});
				}
				return this.langSetArr;
			}
		};



        // ------------------------------------------------------------------------------- invoker
        /**
         * Javscript 함수 실행
         */
        freemon.invoker = {
                /**
                 * Javascript가 로드될 때 까지 기다린후 javascript object가 유효하면 script의
                 * init function을 호출한다. 화면개발가이드 참조하세요.
                 * @param scriptName  javascript 객체이름
                 * @param varName  객체에 추가할 변수이름
                 * @param jsonStr 객체에 담을 변수, Object or primitive type
                 */
                invoke : function(scriptName, varName, jsonStr) {
                    var invoker = new ScriptInvoker(scriptName);
                    invoker.setAttribute(varName, jsonStr);
                    invoker.invoke();
                }
        };




        // ------------------------------------------------------------------------------- doc

        // javascript two patterns 

        //<\s*script[^><]*src=".*[^>]">\s*<\/\s*script\s*>
        
        
        
        
        
        /**
         * document 처리
         */
        freemon.doc =  {

        		/**
        		 * jQuery의 append, html과 동작이 같아서 jQuery를 그대로 쓰려고 함. 
        		 * 다만, title, meta는 제거함. 
        		 */
        		getHtml: function(htmlRes) {
        			var result = "";
        			var re = /<\s*meta[^<>]*>/ig;
        			result = htmlRes.replace(re, "");
        			re = /<\s*title\s*>[^<>]*<\s*\/title\s*>/ig;
        			result = result.replace(re, ""); 
        			return result; 
        		},
                /**
                 * html을 파싱하여 script 파일과, css 파일은 헤더에 추가하고 나머지는
                 * 다시 html을 만들어 되돌린다.
                 * HTML을 분해하여 HEAD에 javascript, css 를 추가한다.

                 */
//                getHtml : function(htmlRes) {
//                    var targetHead =  document.getElementsByTagName("HEAD")[0];
//                    debugger
//                    // import javascript
//                    // src 속성이 있는 자바스크립트를 분리
//                    var re = /<\s*script[^><]*src="*(.*[\w\.\s/])"*>\s*<\/\s*script\s*>/ig
//                    var r;
//                    while(r = re.exec(htmlRes)) {
//                        var scriptStr = r[0].toString();
//                        var scriptElement = document.createElement('script')
//                        var scriptElement =   targetHead.appendChild(document.createElement('script'));
//                        scriptElement.type = 'text/javascript';
//                        scriptElement.src = freemon.string.replace(r[1].toString(),"/","\/")  + "?_=" + new Date().getTime();
//                        targetHead.appendChild(scriptElement);
//                    }// while
//                    
//                    
//                    
//                    // import style  User style
//                    // href 속성이 있는 외부 스타일 시트를 불러온다.
//                    var re2 = /<link\s*[^<>]*href=\s*"?([\w\s\./]*)"?\s*[^<>]*\s*>/ig
//                    //var re = new RegExp(regexpStr1);  //Create regular expression object.
//                    var r2;
//                    while(r2 = re2.exec(htmlRes)) {
//                        var linkStr = r2[0].toString();
//
//                        //var linkElement=targetHead.appendChild(document.createElement('link'));
//                        var linkElement= document.createElement('link');
//                        linkElement.type = 'text/css';
//                        linkElement.rel = "StyleSheet";
//                        linkElement.href = freemon.string.replace(r2[1].toString(),"/","\/") + "?_=" + new Date().getTime();
//                        targetHead.appendChild(linkElement);
//                    }
//                    
//                    
//                    
//                    // body
//                    var sHtml = "";
//                    var regexpStr3 = /<body[^>]*?>/im
//                    re = new RegExp(regexpStr3);  //Create regular expression object.
//                    r = re.exec(htmlRes);
//                    if(r != null){
//                        var sInBody = RegExp.rightContext;
//                        regexpStr3 = /<\/body>/im
//                        re = new RegExp(regexpStr3);  //Create regular expression object.
//                        r = re.exec(sInBody);
//                        sHtml = RegExp.leftContext;
//                    }
//                    //var nHtml = "<html><head>" + sScript + "</head><body>" + sHtml + "</body>";
//
//                    //$("#" + divId).html(sHtml+sScript);
//                    //document.getElementById(divId).insertAdjacentHTML("beforeEnd", sHtml+sScript);
//
//                    var replRe = /<\s*script[^><]*src="*.*[\w\.\s/]"*>\s*<\/\s*script\s*>/;
//                    var retStr =  sHtml.replace(replRe, "");
//                    return retStr; 
//                    
//                },
                writeOuterHtml:function(htmlRes, divId) {
                     var nHtml = freemon.doc.getHtml(htmlRes);
                     $("#" + divId).outerHTML(nHtml);
                },
                /**
                 * HTML을 분해하여 HEAD에 javascript, css 를 추가한다.
                 */
                writeHtml : function(htmlRes, divId) {
                    var nHtml = freemon.doc.getHtml(htmlRes);
                    $("#" + divId).html(nHtml);

                }// writeHtml
        };




        // ----------------------------------------------------------------------// Util Section
        /**
         * Utility 객체
         */
        freemon.util = {
                /**
                 * 최소값을 반환한다.
                 * <pre>
                 *
                 * var a = 10;
                 * var b = 20;
                 * var c = freemon.util.min(a, b);
                 *
                 * c의 값은  10 이다.
                 *
                 * </pre>
                 *
                 * @param val1  값 1
                 * @param val2  값 2
                 */
            min : function(val1, val2) {
                if (val1 < val2)
                    return val1;
                else
                    return val2;
            },
            /**
             * 문자열 날씨 포맷 변환
             * param _date : 문자열 데이터
             * param _format : yyyy/mm/dd
             * param _delimiter : 구분자 /, - 등
             */
            stringToDate : function(_date,_format,_delimiter)
            {
                var formatLowerCase=_format.toLowerCase();
                var formatItems=formatLowerCase.split(_delimiter);
                var dateItems=_date.split(_delimiter);
                var monthIndex=formatItems.indexOf("mm");
                var dayIndex=formatItems.indexOf("dd");
                var yearIndex=formatItems.indexOf("yyyy");
                var month=parseInt(dateItems[monthIndex]);
                month-=1;
                var formatedDate = new Date(dateItems[yearIndex],month,dateItems[dayIndex]);
                return formatedDate;
            },
            dateToDateMonth : function(startDate, endDate){
            	var joinDayDate = new Date(startDate.substring(0, 4), startDate.substring(4, 6)-1, startDate.substring(6, 8));
            	var joinDate2 = new Date( endDate.substring(0, 4),  endDate.substring(4, 6)-1,  endDate.substring(6, 8));
            	var years = joinDate2.getFullYear() - joinDayDate.getFullYear();
            	var months = joinDate2.getMonth() - joinDayDate.getMonth();
            	var days = joinDate2.getDate() - joinDayDate.getDate();
            	var differentMonth = years * 12 + months + (days >= 0 ? 0 : -1);
            	return differentMonth;
            },
            /**
             * 입력값에 최소값을 반환한다.
             *
             * <pre>
             * var a = 10;
             * var b = 20;
             * var c = freemon.util.max(a,b );
             *
             * 결과값은 20  이다.
             *
             * </pre>
             * @param val1   값 1
             * @param val2   값 2
             */
            max : function(val1, val2) {
                if (val1 < val2)
                    return val2;
                else
                    return val1;
            },
            /**
             *
             * 숫자값을 반올림한다.
             * TODO : 테스트하고 주석처리할 것
             *
             * @param num
             * @param dec
             */
            max : function(num, dec) {
                var temp = freemon.util.decToDigit(dec);
                num = num * temp;
                num = Math.round(num);
                num = num / temp;
                return num;
            },
            decToDigit : function(dec) {
                var temp = 1;
                if (dec >= 1) {
                    for ( var i = 0; i < dec; i++) {
                        temp = temp * 10;
                    }
                } else if (dec < 1) {
                    for ( var i = dec; i < 0; i++) {
                        temp = temp / 10;
                    }
                }
                return temp;
            },


            /**
             * 컬렉션이 비어있는지 확인한다.
             *
             * @param collection 배열
             */
            isEmpty : function(collection) {
                if (!collection)
                    return true;
                if (collection.length == 0)
                    return true;
                return false;
            },

            /**
             * 날자객체를 문자열로 되돌립니다.
             *
             * @date    날자 객체
             * @concatChar 연결문자
             */
            getDateString : function(date, concatChar) {
                return date.getFullYear() + concatChar
                        + freemon.string.lpad("" + (date.getMonth() + 1), 2, '0') + concatChar
                        + freemon.string.lpad("" + date.getDate(), 2, '0') ;
                ;
            },
            
            getShortDateString : function(dateStr, concatChar) {
                dateStr = freemon.string.replace(dateStr, "-", "");
                var date = new Date(dateStr.substring(0,4),dateStr.substring(4,6)-1,dateStr.substring(6,8));
                return freemon.string.lpad("" + (date.getMonth() + 1), 2, '0') + concatChar
                	+ freemon.string.lpad("" + date.getDate(), 2, '0') ;
            },


            /**
             * 날자를 yyyyMMdd 형식으로 되돌린다.
             * 예)  20121010
             *
             */
            getStringFromDate : function(date) {
                var today = date;
                var year  = today.getFullYear();
                var month = today.getMonth() + 1;
                var date  = today.getDate();
                return year.toString() + freemon.string.lpad(month.toString(), 2, '0')
                        +  freemon.string.lpad(date.toString(), 2, '0');
            },
            cloneDate : function(date) {
                return new Date(date.getTime());
            },
            /**
             * 날자를 더하거나 뺀다.
             *
             * @date  Date Object
             * @field  1. Year, 2. Month, 3. date
             * @val 음수값(-)이 들어오면 이전, 양수값이 들어오면 이후
             *
             */
            addDate : function(date, field, val) {
                if(field == 1) {
                    date.setFullYear( date.getFullYear() + val);
                }else if(field == 2) {
                    date.setMonth(date.getMonth() +  val);
                }else if(field == 3) {
                    date.setDate(date.getDate() + val);
                }
                return date;
            },
            /**
             * 입력된 문자열이 날자 타입이 맞는지 확인한다.
             * @param dateStr 날자 문자열
             *
             */
            validateDate : function(dateStr) {
                dateStr = freemon.string.replace(dateStr, "-", "");

                var month = parseInt(dateStr.substring(4,6), 10);
                var year  = parseInt(freemon.string.left(dateStr, 4), 10);
                var date  = parseInt(freemon.string.right(dateStr, 2), 10);

                if(year < 1970) {
                    return false;
                }

                if(month < 1 || month > 12) {
                    return false;
                }

                if(date < 1 || date > 31) {
                    return false;
                }else {
                    var days = freemon.util.daysInMonth(month, year) ;
                    //alert(days);
                    if(date > days) {
                       return false;
                    }
                }
                return true;
            },
            calcDayMonthCount : function(pStartDate, pEndDate, pType) {
            	pStartDate = freemon.string.replace(pStartDate, "-", "");
            	pEndDate = freemon.string.replace(pEndDate, "-", "");
                var strSDT = new Date(pStartDate.substring(0,4),pStartDate.substring(4,6)-1,pStartDate.substring(6,8));
                var strEDT = new Date(pEndDate.substring(0,4),pEndDate.substring(4,6)-1,pEndDate.substring(6,8));
                var strTermCnt = 0;
                 
                if(pType == 'D') {  //일수 차이
                    strTermCnt = (strEDT.getTime()-strSDT.getTime())/(1000*60*60*24);
                } else {            //개월수 차이
                    //년도가 같으면 단순히 월을 마이너스 한다.
                    // => 20090301-20090201 의 경우(윤달이 있는 경우) 아래 else의 로직으로는 정상적인 1이 리턴되지 않는다.
                    if(pEndDate.substring(0,4) == pStartDate.substring(0,4)) {
                        strTermCnt = pEndDate.substring(4,6) * 1 - pStartDate.substring(4,6) * 1;
                    } else {
                        //strTermCnt = Math.floor((strEDT.getTime()-strSDT.getTime())/(1000*60*60*24*365.25/12));
                        strTermCnt = Math.round((strEDT.getTime()-strSDT.getTime())/(1000*60*60*24*365/12));
                    }
                }
                
                return strTermCnt;
            },
            setTime : function(date, hour, minute, second) {
                date.setHours(hour);
                date.setMinutes(minute);
                date.setSeconds(second);
                return date;
            },
            /**
             * 해당 년월의 마지막 일자를 구한다.
             * @param month  월
             * @param year  년
             * @returns
             *      마지막 일자
             */
            daysInMonth: function(month, year) {
                var dd = new Date(year, month, 0);
                return dd.getDate();
            },

            /**
             * GET으로 전달받은 인자와 값을 JSON으로 반환
             *
             * Ex)
             * http://www.example.com/?me=myValue&name2=SomeOtherValue
             *
             * {
    		 *	"me"    : "myValue",
    		 *	"name2" : "SomeOtherValue"
    		 *  }
    		 *
    		 *  var first = freemon.util.getUrlVars()["me"];
    		 *
    		 *
             *
             */
            getUrlVars : function() {
                var vars = [], hash;
                var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
                for(var i = 0; i < hashes.length; i++)
                {
                    hash = hashes[i].split('=');
                    vars.push(hash[0]);
                    vars[hash[0]] = hash[1];
                }
                return vars;
            },
            /**
             * 페이지가 모두 로드되어있는걸 체크하고 다시 리사이징 한다.
             */
            setResizeIframe : function(iframeId, targetId) {

            	var check = window.setInterval(function(){
            		if (freemon.util.isImgLoaded()){
            			freemon.util.resizeIframe(iframeId, targetId);
            			window.clearInterval(check);
            		}
            	},50);
            },
            /**
             * 해당 아이프레임을 리사이징 한다.
             * 아이프레임의 하단 내용에서 페이지가 로드될때 실행해야 한다.
             *
             */
            resizeIframe : function(iframeId, targetId) {
            	var body = document.body;

            	var height;
            	var width;

            	if(targetId) {
            		height = document.getElementById(targetId).scrollHeight;
            		width = document.getElementById(targetId).scrollWidth;

            	} else {
            		// TODO : 브라우저에 맞게 계산하는 로직 필요
            		// firefox height
            		if (navigator.userAgent.toLowerCase().indexOf('gecko') > -1 ) {
            			height = window.document.documentElement.scrollHeight;
            			if (height < body.scrollHeight) {
            				height = body.scrollHeight;
            			}
            			width = window.document.documentElement.scrollWidth;

            			if (width < body.scrollWidth) {
            				width = body.scrollWidth;
            			}

            		} else {
            			height = body.scrollHeight;
            			width = body.scrollWidth;

            		}

            	}


            	if(!iframeId ) {
            		if(!parent) {
            			alert("부모창이 존재하지 않습니다.");
            			return;
            		}


            		// id를 몰라도 자동으로 찾아서 설정할 수 있는 방법이 없을까
            		var url = location.href;

            		var iframes = parent.document.getElementsByTagName("iframe");

            		for (var i = 0; i < iframes.length; i++) {
            			// id파라미터가 없다면 현재 페이지와 부모창의 iframe중 src경로가 같은 경우에 해당 id가 맞는거라고 처리
            			if(iframes[i].src == url) {
            				iframeId = iframes[i].id;
            				break;
            			}
            		}
            	}


            	var iframe = parent.document.getElementById(iframeId);

            	if (!iframe) {
            		alert("iframe을 찾을 수 없습니다.");
            		return;
            	}

            	if(height > 0) {
            		iframe.height = height + "px";
            	}
            	if(width > 0) {
            		iframe.width = width + "px";
            	}
            },
            /**
             * 페이지의 이미지가 모두 로딩이 완료 했는지 체크한다.
             */
            isImgLoaded : function() {
            	var imgs = document.getElementsByTagName("img");

            	for (var i = 0; i < imgs.length; i++) {
            		if (!imgs[i].complete) {
            			if (navigator.userAgent.indexOf('MSIE') > -1) {
            				if(imgs[i].readyState == "uninitialized") {
            					continue;
            				}
            			}
            			return false;
            		}
            	}

            	return true;
            },
            /**
             * iframe영역만 프린트한다.
             */
            printIframe : function(iframeId) {
            	frames[iframeId].focus();
            	frames[iframeId].print();
            },
            /** dummy function */
            dummy : function() {
                // not used
            },
            cleanXSSByBlockingTag : function(value) {
    			if(value != '') {
    				value = freemon.string.replace(value, "<" , "&lt;");
    				value = freemon.string.replace(value, ">" , "&gt;");
    				value = freemon.string.replace(value, "\"" , "&quot;");
    				value = freemon.string.replace(value, "," , "."); //57155 이름명에 쉼표들어가는 오류수정
    				//value = freemon.string.replace(value, " ", "&nbsp;");
    			}
    			return value;
    		},
    		/**
    		 *
    		 */
    		strNumToFileSize : function(num, fixed) {
    			var ret = "";
    			var bias = 1024;
    			num = parseInt(num,10);
    			if (num < bias) {
    				ret = num.toFixed(fixed) + "Byte";
    			} else if (num >= bias && num < (bias * bias)) {
    				ret = (num / bias).toFixed(fixed) + "KB";
    			} else if (num >= (bias * bias) && num < (bias * bias * bias)) {
    				ret = (num / (bias * bias)).toFixed(fixed) + "MB";
    			} else if (num >= (bias * bias * bias) && num < (bias * bias * bias * bias)) {
    				ret = (num / (bias * bias * bias)).toFixed(fixed) + "GB";
    			}

    			return ret;
    		},
    		strNumToSize : function(num, fixed) {
    			var ret = "";
    			var bias = 1024;

    			if (num < bias) {
    				ret = num.toFixed(fixed) + "Byte";
    			} else if (num >= bias && num < (bias * bias)) {
    				ret = (num / bias).toFixed(fixed) + "KB";
    			} else if (num >= (bias * bias) && num < (bias * bias * bias)) {
    				ret = (num / (bias * bias)).toFixed(fixed) + "MB";
    			} else if (num >= (bias * bias * bias) && num < (bias * bias * bias * bias)) {
    				ret = (num / (bias * bias * bias)).toFixed(fixed) + "GB";
    			}

    			return ret;
    		},
    		/**
    		 * 확장자 체크
    		 * @param val 체크할 확장자명
    		 * @param limitExtArr 허용된 확장자 배열
    		 */
    		chkExt : function (val,limitExtArr) {
    		    var len = limitExtArr.length;
    		    for (var i=0; i < len; i++) {
    		        if (limitExtArr[i] == val) return true;
    		    }
    		    return false;
    		},

    		/**
    		 * ie버전을 반환.
    		 * ie가 아니면 -1반환.
    		 */
			ieVersion: function(){
				if(typeof this.ieVer != 'undefined') {
					
					return this.ieVer;
				}
				var rv = -1;
				if (navigator.appName == 'Microsoft Internet Explorer')
				{
					var ua = navigator.userAgent;
					var re  = new RegExp("MSIE ([0-9]{1,}[\.0-9]{0,})");
					if (re.exec(ua) != null) {
						rv= parseFloat( RegExp.$1 );
					}
				} else if (navigator.appName == 'Netscape') {
					var ua = navigator.userAgent;
					var re  = new RegExp("Trident/.*rv:([0-9]{1,}[\.0-9]{0,})");
					if (re.exec(ua) != null) {
						rv = parseFloat( RegExp.$1 );
					}
				}
				this.ieVer = rv;

				return rv;
			},
			
			/**
			 * 글로벌타임 기준의 시간을 가져온다
			 * */
			globalTime : function(date){
				var timeDiff = -loginConfig.timeDiff; // 글로벌타임 적용
				var today = new Date(date.getTime() + (1000*60*60) * timeDiff);
				return today;
			},
			postSend : function(path, params, method) {
			    method = method || "post";
			    var form = document.createElement("form");
			    form.setAttribute("method", method);
			    form.setAttribute("action", path);
			    if(params){
			    	/*
			    	//$.each(params, function (i, param) {
					    $.each(params, function (key, value) {
					        console.log(key + ";" + value);
				            var hiddenField = document.createElement("input");
				            hiddenField.setAttribute("type", "hidden");
				            hiddenField.setAttribute("name", key);
				            hiddenField.setAttribute("value", value);
				            form.appendChild(hiddenField);
					    });
					//});
					*/
			    	for(var i = 0; i < params.size(); i++){
			    		var hiddenField = document.createElement("input");
			            hiddenField.setAttribute("type", "hidden");
			            hiddenField.setAttribute("name", params.keys(0)[i]);
			            hiddenField.setAttribute("value", params.values(0)[i]);
			            form.appendChild(hiddenField);
			    	}
			    	
			    	/*
				    params.forEach(function(value, key, array){
			            var hiddenField = document.createElement("input");
			            hiddenField.setAttribute("type", "hidden");
			            hiddenField.setAttribute("name", key);
			            hiddenField.setAttribute("value", value);
			            form.appendChild(hiddenField);
					})
					*/
			    	//return false;
			    }
				//csrf Token 삽입
				var token = $("meta[name='_csrf']").attr("content");
				var hiddenField = document.createElement("input");
				hiddenField.setAttribute("type", "hidden");
		        hiddenField.setAttribute("name", "_csrf");
		        hiddenField.setAttribute("value", token);
		        form.appendChild(hiddenField);
			    /*for(var [key, value] of params) {
			        //if(params.hasOwnProperty(key)) {
			            var hiddenField = document.createElement("input");
			            hiddenField.setAttribute("type", "hidden");
			            hiddenField.setAttribute("name", key);
			            hiddenField.setAttribute("value", value);
			            form.appendChild(hiddenField);
			         //}
			    }*/
			    document.body.appendChild(form);
			    form.submit();
			},
			getSend: function(path, params){
				var uri = [];
				/*for(var [key, value] of params) {
			        //if(params.hasOwnProperty(key)) {
					uri.push(key + "=" + value);
				}*/
//				params.forEach(function(value, key, array){
//					uri.push(key + "=" + value);
//				});
				for(var i = 0; i < params.size(); i++){
		            uri.push(params.keys(0)[i] + "=" + params.values(0)[i]);
		    	}
				
				uri = path + "?" + uri.join('&');
				location.href = uri;
			},
			numberWithCommas :function (x) {
			    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			},
			numberRemoveCommas :function (x) {
			    return x.toString().replace(/,/g,"");
			},
			/**
			 * Url에서 갑 추출
			 * @param v : paramtername
			 * @return value 
			 */
			getUrlValue : function(v){
				var query = decodeURI(window.location.search.substring(1));
				var query = query.replace(/%23/gi, '#');
//				var query = window.location.search.substring(1).replace(/%23/gi, '#');
				
				var array = [];
			    var vars = query.split("&");
			    for (var i=0;i<vars.length;i++) {
			    	var d = vars[i].split("=");
			    	if(d[0] === "query"){
			    		var dd = d[1].split(" ");
			    		if(dd[0] == "") continue;
			    		var s = [];
			    		dd.forEach(function(value, key, array){
			    			s.push(value);
			    		});
			    		array["query"] = s;
			    	}else{
			    		array[d[0]] = d[1];
			    	}
			    }
			    return vars[0] == "" ? null : array;
			},
			setUrlValue : function (params){
				var uri = [];
//				params.forEach(function(value, key, array){
//					uri.push(key + "=" + encodeURI(value));
//				});
//				$.each(params, function(i, data){
//					uri.push(data);
//				});
		    	for(var i = 0; i < params.size(); i++){
		    		//uri.push(params.keys(0)[i] + "=" + encodeURI(params.values(0)[i]));
		    		uri.push(params.keys(0)[i] + "=" + params.values(0)[i]);
		    	}

				uri = "?" + uri.join('&');
				return uri;
			},
			pushHistory : function(params){
//{query, page, date, order, careerstr, careerEnd, height, exp}
				var uriMap = new CustomMap();
				query = freemon.util.isUndefinedOrNull(params.query) ? '' : params.query;
				career = freemon.util.isUndefinedOrNull(params.career) ? '' : params.career;
				area = freemon.util.isUndefinedOrNull(params.area) ? '' : params.area;
				skill = freemon.util.isUndefinedOrNull(params.skill) ? '' : params.skill;
				if(params.query)
//					uriMap.set("query", query);
					uriMap.set("query", params.query.replace(/#/gi, '%23'));
				if(params.page)
					uriMap.set("page", params.page);
				if(params.date)
					uriMap.set("date", params.date);
				if(params.order)
					uriMap.set("order", params.order);
				if(params.career)
					uriMap.set("career", params.career.join(" ").replace(/#/gi, '%23'));
				if(params.area)
					uriMap.set("area", params.area.join(" ").replace(/#/gi, '%23'));
				if(params.skill)
					uriMap.set("skill", params.skill.join(" ").replace(/#/gi, '%23'));
				if(params.height)
					uriMap.set("height", params.height);
				if(params.exp)
					uriMap.set("exp", params.exp);

				History.pushState('','프리몬 - SI 전문 아웃소싱', freemon.util.setUrlValue(uriMap));
			},
			isUndefinedOrNull : function(param){
				if(param == undefined || param == '' || param == null)
					return true;
				else 
					false;
			}
        };

        // -------------------------------------------------------------------------- JSON Section
        /**
         * JSON 처리
         */
        freemon.json = {
            /**
             * 데이타 객체를 쿼리스트링으로 변환합니다.
             *
             * <pre>
             *
             * var json = { name : "kim", age : 10 };
             * var str = freemon.json.toQueryString(json);
             *
             * 결과값은 다음과 같다.
             *
             * "&name=kim&age=10"
             *
             * </pre>
             * @param dataObject 데이타 객체
             */
            toQueryString : function(dataObject) {
                var result = "";
                for ( var prop in dataObject) {
                    result += "&" + prop + "=" + dataObject[prop];
                }//for
                return result;
            },
            /**
             *
             * JSON 객체를 문자열로 변환한다.
             *
             * <pre>
             *
             * var jsonObject = new Object();
             * jsonObject.name = "kim";
             * jsonObject.age = 10;
             *
             * var convertedString = freemon.json.getJSONString(jsonObject);
             *
             * 결과값은 다음과 같다.
             *
             * {name:"kim", age : 10 }
             *
             * </pre>
             *
             *  @param object
             */
            getJSONString : function(object) {
            	//return $.toJSON(object);
                return JSON.stringify(object);  // 객체를 JSON 문자열로 반환 
            },
            /** dummy function */
            dummy : function() {
                // not used
            }
        };

        // -------------------------------------------------------------------------- HTTP Section
        freemon.http = {

            /**
             *    AJAX 통신 함수, jQuery의 $.ajax() 함수의 래핑 함수입니다.  호출방법은 아래와 같습니다.
             *
             *   var options = {
             *            url : "/inc/guide/guideUserList",
             *            sendDataType : "json", // default
             *            contentType:"application/json", 
             *            dataType : "html",
             *            target : document.body, // loading bar 표시위치
             *            type : "post",
             *            success : function(htmlRes, statusText) {
             *                    freemon.doc.writeHtml(htmlRes, "userListDiv");
             *            }// success
             *   }; // optionsuide
             *
             *   freemon.http.ajax(options);
             *
             *   자세한 사용방법은 화면개발가이드를 참조하세요.
             *
             *
             *    호출할때 파라미터로 넘기는 파라미터는 { } 표기법을 사용하여 넘기면 됩니다. 파라미터는 jQuery의
             * 파라미터 이름을 사용하고 추가적으로 정의된 파라미터가 존재합니다. 아래는 파라미터에 대한 설명입니다.
             *
             *    acceepts
             *       어떤 응답을 보낼지 서버에게 알리기 위해 Request Header에 보내는 content type이다.
             *       accetps setting의 수정이 필요하면, $.ajaxSetup()을 메소드를 사용한다.
             *    async
             *       디폴트로, 모든 요청은 비동기로 보내진다. 디폴트로 true 값이 설정된다.  동기식 요청을 보내고
             *       싶으면 false 값을 설정한다.  Cross-domain 요청과 dataType:"jsonp" 요청은 동기식을 지원하지
             *       않는다.
             *
             *    beforeSend(jqXHR, settings)
             *        요청전 callback function은 그것이 전송되기 전에  jqXHR을 수정할 수 있다.
             *    cache
             *        기본값은 true 이다. dataType 'script'와  'jsonp'을 위해서는 false을 설정한다.  false로
             *        설정하면 브라우져는 cache를 하지 않는다.
             *    complete(jqXHR, textStatus)
             *        요청이 완료되었을 때 실행되는 함수이다. success와 error callback들이 실행된 이후에 실행
             *        된다. textStatus에 전달되는 값은 다음과 같다.
             *        "success", "notmodified", "error", "timeout", "abort", or "parsererror"
             *
             *    contents
             *        string/정규식 쌍의 map이다. 이것은 jQuery가 response을 그것에 주어진 content type으로 파싱
             *        하는 방법을 결정한다.
             *    contentType
             *        데이터가 서버로 전송될 때 content-type이 사용된다.  기본값은 "application/x-www-form-urlencoded"
             *        인 데, 그것은 대부분의 경우에 좋다. 데이터는 항상 UTF-8 charset을 사용해서 서버로 전송된다.
             *        적절히 서버에서 decode 해야 한다.
             *        
             *        서버에 queryString이 아닌 JSON 문자열을 그대로 보내고 싶은 경우에는 
             *        application/json으로 설정한다. 
             *    context
             *        설명을 나중에 추가
             *    converters
             *       기본값 : {"* text": window.String, "text html": true, "text json": jQuery.parseJSON, "text xml": jQuery.parseXML}
             *       응답의 값을 변경하기 위한 함수를 반환한다.
             *
             *    crossDomain
             *       생략
             *    data
             *       서버로 전송될 데이터.
             *    dataFilter(data, type)
             *        생략.
             *    dataType (※주의 : $.ajax에서 사용하는 option을 제어할수는 없다.)
             *       서버로 부터 되돌려 받을 데이터 타입. 값이 정해지지 않으면 MIME 타입을 이용한다.
             *       다음의 값을 사용할 수 있다. xml,"html","script","json","jsonp""text", "file"
             *    error(jqXHR, textStatus, errorThrown)
             *       요청이 실패하면 호출되는 함수이다. textStatus에 허용되는 값은 null을 포함하여
             *       "timeout", "error", "abort", "parsererror" 이다. HTTP error가 발생하면 errorThrown은
             *       HTTP의 문자열 상태값 "Not Found", "Internal Server Error" 와 같은 값을 받는다.
             *    global
             *       생략.
             *    headers
             *        key/value 쌍의 맵. 요청과 함께 서버로 보내진다.  beforeSend 함수가 호출되기 전에 설정된다.
             *    ifModified
             *        생략
             *    isLocal
             *        생략
             *    jsonp
             *        jsonp 요청에서 jsonp callback function 이름을 오버라이드 한다.  추가적인 설명 필요 .
             *    jsonpCallback
             *        JSONP 요청에 대한 callback function 이름을 명시한다.
             *    mimeType
             *        XHR mime thype을 오버라이드 할 mime type.
             *    password
             *        HTTP access authentication 요청에서 사용되는 패스워드.
             *    processData
             *        생략.
             *    scriptCharset
             *        생략.
             *    statusCode
             *        numeric HTTP code들의 맵이다.
             *
             *        $.ajax({
             *            statusCode: {
             *               404: function() {
             *                    alert('page not found');
             *               }
             *           }
             *        });
             *
             *    success(data, textStatus, jqXHR)
             *       요청이 성공했을 때 호출되는 함수이다.
             *    timeout
             *       요청에 대한 타임아웃을 밀리세컨드로 설정한다.
             *    traditional
             *       생략.
             *    type
             *        디폴트는 GET이다.  POST 또는 GET으로 설정. 다른 메소드인  PUT , DELETE도 여기서 사용될 수
             *        있다.
             *    url
             *        요청을 보낼 URL.
             *    username
             *        HTTTP access authentication 요청에서 사용할 사용자 이름.
             *    xhr
             *       XMLHttpRequest 객체를 생성할 콜백.
             *    xhrFields
             *       생략.
             *    target
             *       로딩이미지가 표시될 영역이 될 요소를 정의한다. document.body 처럼 요소를 직접써도 되고,
             *       jQuery의 selector를 사용할 수 있다.  예를들어 .contents 는  class=".contents" 가 적용된
             *       요소를 선택한다.
             *    errorProcType
             *       에러 처리 방법. 에러가 발생하면 alert로 띄울지 아니면 html을 되돌릴지를 결정한다. 사용자
             *       정의 callback에는 별도로 처리하고 시스템에서 처리하는 방법을 명시.
             *
             *       시험중.
             *
             */
            ajax : function(opts, isLoad) {
            	if(isLoad == null) freemon.ui.showLoading();
                // default options
                var settings = {
                    url : "",
                    target : document.body,
                    errorProcType : "alert", // 에러처리 방식 alert, html
                    processData: true,
                    data : {}, // 요청 데이터
                    success : function() {
                    }, // 응답성공시 실행할 함수
                    error : function(xhr, statusText) {
                       //alert($.toJSON(xhr));

                    }, // 에러발생시 실행할 함수
                    dataType : "json",                 //  응답데이터 유형  json, xml, html, script, json, jsonp, text, file
                    type : "post",                       // 전송방법 기본값  post, (get/post),  
                    sendDataType : "undefined",
                    contentType : "undefined",     //default: application/x-www-form-urlencoded;charset=UTF-8
                                                           // contentType="application/json"인 경우에는 type:"post"로 설정해야 함.
                    blind : false, // '잠시만 기다려 주세요' 표시 유무, 기본은 보여 줌.  커스텀 옵션
                    modal : false, //반투명한 검은색 레이어 표시
                    showLoadingImg : true //로딩 이미지 표시 유무
                };

            	var dns = document.location.href; //<-- 현재 URL 얻어온다
        	    var arrDns = dns.split("//"); //<-- // 구분자로 짤라와서
        	    //현재 도메인
        	    var _nowDomain = arrDns[1].substring(0,arrDns[1].indexOf("/")); //<-- 뒤에부터 다음 / 까지 가져온다 
        	    
                // history에 해당 값 추가
                if(opts.history && opts.url && opts.url.indexOf("insert") == -1 && opts.url.indexOf("update") == -1) {
                	freemon.http.history.addHistory(opts);
                }

                $.extend(settings, opts);

//                if(settings.contentType!="undefined"){
//                	settings.url = frameworkProperties.context + freemon.string.trim(settings.url);
//                }else

                // 서버 프레임워크에서 에러발생시 처리방법을 결정하기 위해 _REQ_DATA_TYPE_  에
                // dataType을 값을 설정함.
                // 서버에서 useWrappedObject가 true인 경우에는 ResponseData.class를 사용하여 오류정보를 반환함.
                // 브라우져에서 REQ_DATA_TYPE, USE_WRAPPED_OBJECT의 값을 전달하면 
                // 에러처리에 대한 공통 로직을 사용할 수 있음.
                // jquery plugin 중에서 dynatree 혹은 다른 plugin에서 자체적으로 ajax 통신을 하는 경우에는
                // 이 두개의 파라미터 값이 없으므로 에러처리 공통 로직을 사용하지 않음. 
                settings.url = frameworkProperties.context + freemon.string.trim(settings.url);

                //settings.url +=  "&ajax=true";
                //alert(settings.url);
                //alert(settings.async);

                
                // make the request data.
                // setttings.data == "object"이면 JSON 객체임.  JSON객체를 문자열로 변환해야 함.   JSON.stringify를 사용하는 것으로 통일
                // JSON 객체는 문자열로 변환하여야 함.   freemon.json.getJSONString() 함수를 사용함.
                // 나머지는 변환하지 않고 $.ajax()에 넘겨 줌.
             
                var sendData;
                
                if(!settings.contentType){
                	sendData = settings.data;
                } else if(settings.contentType!="undefined"){
                    sendData = (typeof settings.data == "object")  ? freemon.json.getJSONString(settings.data) : settings.data;
                } else if (settings.sendDataType == "json") {
                    sendData = (typeof settings.data == "object")  ? freemon.json.getJSONString(settings.data) : settings.data;
                    sendData = "__REQ_JSON_OBJECT__=" + encodeURIComponent(sendData);
                } else {
                    sendData = settings.data;
                }
                
                var v = {};                
                if(settings.contentType != false){
                	//var orgData = JSON.parse(sendData);
                	var orgData = $.parseJSON(sendData);
	                
	                for(var value in orgData){
	                	if(orgData[value] && typeof(orgData[value]) == 'string' &&  orgData[value].indexOf("<script>") != -1){
	                		orgData[value] = orgData[value].replace("<", "&lt;").replace(">", "&gt;");
	                		orgData[value] = orgData[value].replace("'", "&quot;").replace('"', "&#39;");
	                		orgData[value] = orgData[value].replace("(", "&#40;").replace(")", "&#41;");
	                		orgData[value] = orgData[value].replace("#", "&#35;");
	                		orgData[value] = orgData[value].replace("<", "&lt;").replace(">", "&gt;");
	                		v[orgData[value]] = value;
	                	}
	                	v[value] = orgData[value];
	                }
	                sendData = JSON.stringify(v);
                }

                
                // make the default timeout value.
                var timeoutValue = (settings.timeout) ? settings.timeout : 60000; // default 10초
                // make a loading image
                var ctime = new Date().getTime();
                var randomVal = Math.floor(Math.random() * 100) + 1;
                var divId = "DIV" + ctime + "_" + randomVal;

                //####### file download의 경우 #############
                if (settings.dataType == 'file') {
                    $.fileDownload(frameworkProperties.context + opts.url,
                    	{
                    		data: sendData,
                    		httpMethod: settings.type,
                    		successCallback: function (url) {
                    			if (opts.success) {
                    				opts.success();
                    			}
                    		},
                    		failCallback: function (html, url) {
                    			if (opts.error) {
                    				opts.error();
                    			}
                    		},
                    	failMessageHtml: common_freemonjs_message_download // 다운로드에 실패했습니다.
                    	}
                    );
                    return;
                }
                //####### download가 아닌 경우 #############
                var options = {
                    url : settings.url, // 요청URL
                    async : settings.async, // 동기식
                    data : sendData,
                    processData : settings.processData,
                    // -------------------------------------------------------------beforeSend
                    beforeSend : function(xhr) {
                    	if(settings.beforeSend) {
                    		settings.beforeSend(xhr);
                    	}
                    	var target = (typeof settings.target == "string") ? $(settings.target).get(0) : settings.target;
                    	
                    	if($(target).length == 0){
                        	target = document.body;
                        }
                    	//csrf 적용
                    	var token = $("meta[name='_csrf']").attr("content");
                    	var header = $("meta[name='_csrf_header']").attr("content");
                    	xhr.setRequestHeader("freemonAjax",settings.dataType); //서버에서 ajax통신중 발생하는 오류를 인식하기 위해
                    	xhr.setRequestHeader(header, token);
                        // before sending a request, display the loading image.                       
                        /*var newDiv = document.createElement("div");
                        newDiv.id = divId;
                        
                        $(target).append(newDiv);                                         
                        $("#" + divId).addClass("loading_lyr");                                                
                        
                        var html = "";
                        if(settings.blind){
                        	html = "<div class=\"msg_box\">"	
           					 + "  <span>" +  common_freemonjs_message_wait + "</span>" // 잠시만 기다려 주세요
           			         + "</div>"
           			         + "<div class=\"blind\"></div>";
                        }else if(settings.modal){
                        	html = "<div class=\"blind\"></div>";
                        }else if(settings.showLoadingImg){
                        	html = "<div class=\"img_box\"><span>" +  common_freemonjs_message_wait + "</span></div>";
                        }
                        
                        $("#" + divId).append(html);*/
                                                                     
                        /*var target = (typeof settings.target == "string") ? $(settings.target).get(
                                0) : settings.target;
                        var rect = freemon.ui.getBounds(target);
                        var offset = $(target).offset();
                        
                        $("#" + divId).css("visibility", "visible");
                        $("#" + divId).css("top", offset.top);
                        $("#" + divId).css("left", offset.left);
                        $("#" + divId).css("position", "absolute");
                        // added by
                        $("#" + divId).css("width", rect.width);
                        $("#" + divId).css("height", rect.height);
                        $("#" + divId).css("text-align", "center");
                        // TODO : 이미지 경로?
                        $("#" + divId).css(
                                {
                                    backgroundImage : "url('"+frameworkProperties.context +"/resources/biz/common/img/loading.gif')",
                                    backgroundRepeat : "no-repeat",
                                    backgroundPosition : "50% 50%"
                                });*/                        
                    }, // the end of beforeSend
                    // ------------------------------------------------------------- success
                    success : function(responseData, statusText) {
                    	freemon.ui.hideLoading();
                        $("#" + divId).remove(); // delete the loading image.
                        
                        if (!responseData) {
                            return;
                        }// 응답데이타가 없다면 아무것도 하지 않음. 어떻게 하지?

                        var resObject = responseData;

                        //server framework에서 반환하는 구조확인
                        if (resObject.responseCode) {
                        	if (parseInt(resObject.responseCode) == 0) {
                        		if (settings.success) {
                        			settings.success(resObject, statusText);
                                }
                            }
                        	else if(parseInt(resObject.responseCode) == 2){
                        		//document.location.href =  frameworkProperties.context +"/common/error/mobileError.jsp?";
                        	}else {
//                            	if (settings.errorProcType == "alert") {
//                            		if(_nowDomain == frameworkProperties.mobileDomain) { //모바일 페이지라면
//                            			document.location.href =  frameworkProperties.context +"/common/error/mobileError.jsp?responseText=" + encodeURIComponent(resObject.responseText);
//                            		} else{
//                            			freemon.ui.showAjaxError(resObject);
//                            			settings.error(resObject, statusText);
//                            		}
//                            	}
                            	freemon.ux.alert(resObject.responseText);
                            }
                        }else {
                        	settings.success(responseData, statusText); // callback 함수 직접 호출
                        }
                    },
                    // 통신오류
                    error : function(xhr, statusText) {
                    	freemon.ui.hideLoading();
                    	$("#" + divId).remove();
                    	
                    	//ajax 호출중 페이지 이동시 오류창 표시안해야 됨 (리턴값: status값 0,statusText값이 error),호출취소시 오류표시 안함.
                    	if(xhr.readyState == 0 && xhr.status == 0 && (statusText == 'error' || statusText == 'abort' )){
                    		return;
                    	}

                        if (settings.error) {
                            if (settings.errorProcType == "alert") {
                                //alert("statusText=====::::=" + statusText);


                                //alert("xhr.status=" + xhr.status);


                                var errCode = xhr.status;
                                var errMsg = "";
                                // TODO : 다국어 처리
                                switch (xhr.status) {
                                //문제점 : 서버 접속이 안될 경우와 ajax호출중 페이지 이동시 동일한 응답(status:0)이 오므로 메세지 처리가 불가능
                                //case 0:
                                //    errMsg = "서버에 접속할 수 없습니다."; 
                                //    break;
                                case 403:
                                    errMsg =  "요청하신 페이지는 권한이 없습니다"; // "요청하신 페이지를 찾을 수 없습니다.";
                                    break;
                                case 404:
                                    errMsg =  common_freemonjs_message_404; // "요청하신 페이지를 찾을 수 없습니다.";
                                    break;
                                case 500:
                                    errMsg =  common_freemonjs_message_500; //  "서버에서 오류가 발생했습니다.";
                                    break;
                                case 408:
                                    errMsg =  common_freemonjs_message_408; //   "서버로 부터 응답이 없습니다(Timeout).";
                                    break;
                                default:
                                    errMsg =  common_freemonjs_message_unknown;  //   "알수없는 오류가 발생했습니다.";
                                    break;
                                }
                                
                                switch (xhr.statusText) {
                                case 'timeout':
                                	errMsg = common_freemonjs_message_timeout; //    "지정된 응답 시간을 초과했습니다. ("+timeoutValue/1000+"초)";
                                	break;
                                }
                                
                                var resObject = {
                                    reqURL : settings.url,
                                    responseCode : errCode,
                                    responseText : errMsg,
                                    systemError : '수신된 서버의 오류 메시지가 없습니다.'
                                };

                                if(_nowDomain == frameworkProperties.mobileDomain) { //모바일 페이지라면
                                	document.location.href = frameworkProperties.context +"/common/error/error.jsp";
                            	} else{
                            		freemon.ui.showAjaxError(resObject);
                                    settings.error(xhr, statusText);
                            	}                      
                            }
                        }
                    },
                    type : settings.type, // POST / GET
                    timeout : timeoutValue,
                    complete : function(xhr) {
                        // 호출이 안되는 이유는???
                    }
                };
                
                //alert("url=" + settings.url);
                if(settings.contentType!="undefined"){
                	var addOption = {"contentType":settings.contentType};
                	$.extend(options,addOption);
                }
                
                if(settings.complete){
                	var addOption = {"complete":settings.complete};
                	$.extend(options,addOption);
                }
                return $.ajax(options);
            },
            /**
             * ajax에 대한 history를 관리한다.
             */
            history : {
            	state : [],
            	/**
            	 * 신규 히스토리를 추가한다.
            	 */
            	addHistory : function(opts) {
            		this.makeHash(opts);
        			location.hash = opts.hash;
        			// 맥시멈 히스토리 숫자는 50으로 제한한다.
        			if (this.state.length >= 50) {
        				this.state.shift();
        			}
        			if (opts.data) {
        				// parameter data call by address 방지
        				opts.data = $.extend({}, opts.data);
        			}
        			this.state.push(opts);
            	},
            	/**
            	 * 주소내 hash url이 변경될시 동작하는 이벤트
            	 */
            	hashChange : function(evt) {
            		// 히스토리 내에서 데이터 검색
            		if (evt && (!location.hash || location.hash == "#")) {
            			evt.preventDefault();
            		}

            		var opts = this.findHistory(location.hash);
            		// TODO : 새로고침인경우 히스토리를 찾아낼 수 있는 로직 필요
            		if (opts && (opts.restore || (opts.hash != this.state[this.state.length - 1].hash))) {
            			opts.history = false; // 무한루프 방지
            			opts.restore = false;
            			this.moveLastOrder(opts);

            			// 다이얼로그 열려있으면 모두 닫음
            			try{
            				$(".ui-dialog .ui-dialog-content").dialog("close");
            			} catch(e) {
            				//console.info("닫다가 에러났어요" + e.message);
            				
            			}

            			freemon.http.ajax(opts);

            			var ifName = opts.callName;
            			if (!ifName) {
            				var ifNameArr = opts.url.split("/");
            				ifName = ifNameArr[ifNameArr.length - 1];
            			}

            			var param = {type : ifName, data : opts, evt : evt};
            			// 사용자 커스터마이징 이벤트 호출
            			ObserverControl.notifyObservers(param);
            		}
            	},
            	/**
            	 * 히스토리를 구분할 키를 생성한다.
            	 */
            	makeHash : function(opts) {
            		var hash = "#" + encodeURIComponent(opts.url) + "!" + Date.now();
            		opts.hash = hash;
            	},
            	/**
            	 * 모든 히스토리를 초기화한다.
            	 */
            	removeHistory : function() {
            		this.state = [];
            	},
            	/**
            	 * 히스토리 오브젝트를 찾아서 리턴한다.
            	 */
            	findHistory : function(hashCode) {
            		for (var i = 0; i < this.state.length; i ++) {
            			if (this.state[i].hash == hashCode) {
            				return this.state[i];
            			}
            		}
            	},
            	/**
            	 * 히스토리를 쿠키 및 스토리지에 저장해놓는다
            	 */
            	historyLocalSave : function() {
            		var stateList = [];
            		for (var i = 0; i < this.state.length; i++) {
            			var state = this.state[i];
            			// function string으로 치환 해서 저장
            			state.success = this.state[i].success.toString();
            			stateList.push(state);
            		}
            		if (typeof(Storage) !== "undefined") {
            			// html5 localStorage 저장
            			sessionStorage.state = JSON.stringify(stateList);
            		} else {
            			// cookie 저장
            			// cookie max size가 4kb여서 history 데이터가 잘릴 가능성이 매우 큼.
            			freemon.http.setCookie("state", JSON.stringify(stateList));
            		}
            	},
            	/**
            	 * 스토리지 및 쿠키에 저장되있는 히스토리 정보를 복원시킨다.
            	 */
            	restoreLocalSave : function() {
            		var stateList = [];

            		if (typeof(Storage) !== "undefined") {
            			// html5 localStorage 저장
            			if(sessionStorage.state){
            				//stateList = JSON.parse(sessionStorage.state);
            				stateList = $.parseJSON(sessionStorage.state);
            			}
            		} else {
            			// cookie
            			//stateList = JSON.parse(freemon.http.getCookie("state"));
            			stateList = $.parseJSON(freemon.http.getCookie("state"));
            		}

            		for (var i = 0; i < stateList.length; i++) {
            			// function string을 다시 function으로 변환
            			eval("stateList[" + i + "].success = " + stateList[i].success);
            		}

            		freemon.http.history.state = stateList;
            	},
            	/**
            	 * 현재 히스토리 오브젝트를 맨 마지막 순위로 변경시킨다. 로직 재호출 방지용.
            	 */
            	moveLastOrder : function(opts) {
            		for (var i = 0; i < this.state.length; i ++) {
            			if (this.state[i].hash == opts.hash) {
            				this.state.splice(i, 1);
            				this.state.push(opts);
            			}
            		}
            	}
            },
            /**
             * cookie 값을 설정한다.
             *
             * <pre>
             *
             * 1) 쿠키값만 설정할 경우
             *     freemon.http.setCookie('myCookie", 1111);
             *
             * 2) 쿠키값 및 만료일을 설정할 경우
             *
             *     var expDate = new Date();
             *     // 현재시간 + 1일로 만료시간 설정
             *     expDate.setTime(ExpDate.getTime() * 1000 * 60 * 60 * 24);
             *     freemon.http.setCookie('myCookie', 1111, expDate);
             *
             * </pre>
             *
             * @param name     쿠키이름
             * @param value    쿠키값
             * @param expries  쿠키설정무효화 시간(생략가능)
             *                  millisecond 이므로 계산하기 쉽게 1000을 곱하면 됨.
             *                  (하루는 24시간) * (1시간은 60분) * (1분은 60초) * (밀리세컨 1000)
             *                  1) 1시간을 설정
             *                      1 * 60 * 60 * 1000
             *                  2) 하루를 설정
             *                      24 * 60 * 60 * 1000
             *
             * @param path     쿠키경로(생략가능)
             *                  문서의 경로명 설정. 설정하지 않으면 현재 Cookie를 보내는 문서의
             *                  URL 상의 경로(도메인 명 제외)
             * @param domain   도메인(생략가능)
             *                 웹 서버의 도메인 설정. 설정하지 않으면 Cookie를 보내는 문서가 속한
             *                 도메인 명으로 설정된다.
             * @param secure   보안여부(생략가능)
             *                 HTTPS Server와 같은 Secure server에서 Cookie를 보낼대 이 값을 설정
             */
            setCookie : function(name, value, expires, path, domain, secure) {
                // Set-Cookie 구조
                // name=value;expires=date;path=path domain=domain_name;secure
                // example>
                //
                // set time, it's in milliseconds
                var today = new Date();
                today.setTime(today.getTime());

                /*
                 if the expires variable is set, make the correct
                 expires time, the current script below will set
                 it for x number of days, to make it for hours,
                 delete * 24, for minutes, delete * 60 * 24
                 */
                if (expires) {
                    expires = expires * 1000 * 60 * 60 * 24;
                } else {
                	expires = 365 * 1000 * 60 * 60 * 24;
                }
                var expires_date = new Date(today.getTime() + (expires));

                document.cookie = name + "=" + escape(value)
                        + ((expires) ? ";expires=" + expires_date.toGMTString() : "")
                        + ((path) ? ";path=" + path : "") + ((domain) ? ";domain=" + domain : "")
                        + ((secure) ? ";secure" : "");
            },
            /**
             * 쿠키값을 읽어 옵니다.
             *
             *  @param cookieName 쿠키의 이름
             */
            getCookie : function(cookieName) {
                var i, x, y;
                var cookies = document.cookie.split(";");

                for (i = 0; i < cookies.length; i++) {
                    x = cookies[i].substr(0, cookies[i].indexOf("="));
                    y = cookies[i].substr(cookies[i].indexOf("=") + 1);
                    x = x.replace(/^\s+|\s+$/g, "");
                    if (x == cookieName) {
                        return unescape(y);
                    }
                }
            },
            /**
             * 쿠키값을 제거합니다.
             *
             *  @param name 쿠키의 이름
             *  @param path 경로 (생략가능)
             *  @param domain 도메인(생략가능)
             */
            deleteCookie : function(name, path, domain) {
                if (freemon.http.getCookie(name))
                    document.cookie = name + "=" + ((path) ? ";path=" + path : "")
                            + ((domain) ? ";domain=" + domain : "")
                            + ";expires=Thu, 01-Jan-1970 00:00:01 GMT";
            },

            /** dummy function */
            dummy : function() {
                // not used
            }
        };

        // ----------------------------------------------------------------------- Data Section
        /**
         * HTML Form 처리
         */
        freemon.data = {

            /**
             * 입력된 JSON 객체의 값을 html element에 채웁니다.
             *
             * <pre>
             *
             * HTML Form의 input 요소를 다음과 같이 작성했다. 언더스코어(_) 까지는 namespace로 사용
             * 하는 접두사이다.  실제의 객체의 필드는 userId 라고 생각하면 된다.
             *
             * <input type="text" name="UserInfo_userId" value="" />
             * <input type="text" name="UserInfo_userName" value="" />
             *
             *
             *  서버로 부터 응답으로 받은 JSON은  다음과 같다.
             *  { userId : "happy", userName: "Kim " }
             *
             *  이것을 이용하여 form의 요소에 값을 채우는 방법은 다음과 같다.
             *
             *  freemon.data.setForm(json, "UserInfo_");
             *
             *  필드 이름과 같은 이름의 폼 요소를 찾아서 값을 설정한다.
             *
             * </pre>
             *
             *  @param jsonObj   JSON  객체
             *  @param namespace  이름이 충돌되지 않도록 Domain Class의 필드앞에 붙인 접두사.
             *  @param baseJqObject 특정 jquery object하위만 찾을 때 지정하며 지정하지 않으면 문서전체탐색.
             */
            setForm : function(jsonObj, namespace, baseJqObject) {
                this.setFormRecursive("", jsonObj, namespace, baseJqObject);
            },
            /**
             * setForm의 내부적인 함수 입니다.
             *
             * @para`"m parentElementName  부모객체의 이름
             * @param jsonObj   json 객체
             * @param namespace  이름공간
             * @param baseJqObject 탐색을 시작할 jquery object
             */
            setFormRecursive : function(parentElementName, jsonObj, namespace, baseJqObject) {
                //alert('ok');
                var prefix = (parentElementName == "") ? "" : parentElementName + ".";
                for ( var key in jsonObj) {
                    //var srchKey = prefix + key;
                    var srchKey = prefix + namespace + key;
                    //var eArr = $("*[data-name='" + srchKey + "']");  // html element 검색
                    var eArr = $("*[name='" + srchKey + "']", baseJqObject); // html element 검색
                    if (!eArr)
                        continue; //  엘리먼트가 없으면 skip
                    var propValue = jsonObj[key];
                    if(!propValue)
                        continue;
                    var e = eArr[0];
                    if (typeof propValue == "object") {
                        // 배열
                        if (propValue.constructor.toString().indexOf("Array") > -1) {
                            // 배열일 경우에는 checkbox, select multiple 처리
                            if (!e)
                                continue;
                            if (e.type == "checkbox") {
                                for ( var j = 0; j < eArr.length; j++) {
                                    eArr[j].checked = false; // initialize
                                }
                                for ( var i = 0; i < propValue.length; i++) {
                                    for ( var j = 0; j < eArr.length; j++) {
                                        if (propValue[i] == eArr[j].value) {
                                            eArr[j].checked = true;
                                        }
                                    }// for j
                                }//for i
                            } else if (e.type == "select-multiple") {
                                for ( var i = 0; i < e.options.length; i++) {
                                    var opt = e.options[i];
                                    opt.selected = false;
                                }
                                for ( var i = 0; i < e.options.length; i++) {
                                    var opt = e.options[i];
                                    for ( var j = 0; j < propValue.length; j++) {
                                        if (propValue[j] == opt.value) {
                                            opt.selected = true;
                                        }
                                    }
                                }// for
                            }
                        } else {
                            // JSON Object
                            //this.setFormRecursive(prefix + key, propValue);
                            this.setFormRecursive(prefix + key, propValue, namespace, baseJqObject);
                        }
                    } else {

                        if (!e) {
                            continue;
                        } // element가 없으면 skip
                        if (e.type) {
                            if (e.type == "text") {
                                if ($(e).hasClass("comma")) {
                                    e.value = freemon.string.formatComma(propValue);
                                } else if ($(e).hasClass("residentId")) {
                                    e.value = freemon.string.formatResidentId(propValue);
                                } else if ($(e).hasClass("telephone")) {
                                    e.value = freemon.string.formatTelephone(propValue);
                                } else if ($(e).hasClass("zipcode")) {
                                    e.value = freemon.string.formatZipCode(propValue);
                                } else {
                                    e.value = propValue;
                                }
                            } else if (e.type == "hidden" || e.type == "password"
                                    || e.type == "textarea") {
                                e.value = propValue;
                            } else if (e.type == "checkbox") {
                                for ( var i = 0; i < eArr.length; i++) {
                                    eArr[i].checked = false;
                                    if (eArr[i].value == propValue) {
                                        eArr[i].checked = true;
                                    }
                                }// for
                            } else if (e.type == "radio") {
                                for ( var i = 0; i < eArr.length; i++) {
                                    eArr[i].checked = false;
                                    if (eArr[i].value == propValue) {
                                        eArr[i].checked = true;
                                        break;
                                    }
                                }// for
                            } else if (e.type == "select-one") {
                                for ( var i = 0; i < e.options.length; i++) {
                                    var opt = e.options[i];
                                    opt.selected = false;
                                    if (opt.value == propValue) {
                                        opt.selected = true;
                                        break;
                                    }
                                }// for
                            } else if (e.type == "select-multiple") {
                                for ( var i = 0; i < e.options.length; i++) {
                                    var opt = e.options[i];
                                    opt.selected = false;
                                    if (opt.value == jo) {
                                        opt.selected = true;
                                    }
                                }// for
                            }
                        } else {
                            //
                            e.innerHTML = propValue;
                        }
                    }
                }// for
            },
            setJSONMember : function(rootObject, e) {
                //                var dataName = $(e).attr('data-name');
                var dataName = $(e).attr('name');
                //alert(dataName);
                if(!dataName) return;

                if (/* 객체안의 객체 */dataName.indexOf(".") > 0) {
                    var names = dataName.split(".");
                    var jsonMember = null;

                    for ( var i = 0; i < names.length - 1; i++) {
                        if (i == 0) {
                            if (!rootObject[names[i]])
                                rootObject[names[i]] = {};
                            jsonMember = rootObject[names[i]];
                        } else {
                            if (!jsonMember[names[i]])
                                jsonMember[names[i]] = {};
                            jsonMember = jsonMember[names[i]];
                        }
                    }// for
                    if (e.type) {
                        freemon.data.setJSONMemberByValue(jsonMember, names[names.length - 1], e);
                    } else {
                        jsonMember[names[names.length - 1]] = $(e).html();
                    }

                } else {
                    // e : form element
                    if (e.type) {
                        freemon.data.setJSONMemberByValue(rootObject, dataName, e);
                    } else {
                        rootObject[dataName] = $(e).html();
                    }
                }
                return rootObject;
            },
            /** JSON 객체의 속성값을 채운다. */
            setJSONMemberByValue : function(fld /* { } --> 즉, JSON Object */, name, e) {

                // fld[name]은  object.field와 같은 의미.
                switch (e.type) {
                case "radio":
                    if (e.checked) {
                        fld[name] = e.value;
                    }
                    break;
                case "select-multiple":
                    fld[name] = [];
                    var arr = fld[name];
                    for ( var j = 0; j < e.options.length; j++) {
                        if (e.options[j].selected) {
                            arr.push(e.options[j].value);
                        }
                    }// for
                    break;
                case "select-one":
                    fld[name] = e.options[e.selectedIndex].value;
                    break;
                case "checkbox":
                    //var  dataName = $(e).attr('data-name');
                    var dataName = $(e).attr('name');
                    //var  ele = $('*[data-name='  + dataName +  ']');
                    var ele = $('*[name=' + dataName.replace(/\./g, '\\.') + ']');
                    if (ele.length == 1) {// Checkbox 가 1개인경우 객체로 생성
                        if (e.checked) {
                            fld[name] = e.value;
                        } else {
                        	//Checkbox 값이 Y/N이면 언체크시 다른값으로 생성 
                        	if(e.value === 'Y'){ 
                        		fld[name] = 'N'; 
                        	}else if(e.value === 'N'){
                        		fld[name] = 'Y';
                        	}else{
                        		fld[name] = '';
                        	}
                        }
                        break;
                    }
                    // Array
                    if (!fld[name])
                        fld[name] = [];
                    var chkbox = fld[name];
                    if (e.checked) {
                        chkbox.push(e.value);
                    }

                    break;
                case "text":
                case "hidden":
                case "password":
                    fld[name] = e.value;
                    break;
                case "textarea":
                    //fld[name] = freemon.string.replace(e.value, "\r\n", "\\n");
                    fld[name] = e.value;
                    break;
                }
            },
            /**
             * HTML FORM으로부터 JSON 생성한다.
             *
             * <pre>
             *
             * var jsonObj = freemon.data.createJSONFromForm("form1");
             *
             *
             * </pre>
             *
             * @param formName HTML FORM이름
             * @returns
             *      JSON Object
             */
            createJSONFromForm : function(formName) {
                var model = {};
                //var eArr = $("*[data-name]");
                //var eArr = $("form[name=" + formName + "]" + " *[name]");
                //var eArr = $("form[name=" + formName + "] :input").not("[type=image],[type=submit], [type=button]");
                var eArr = $("form[name=" + formName + "]").find(":input , textarea").not("[type=image],[type=submit], [type=button]");
                if (!eArr)
                    return;
                for ( var i = 0; i < eArr.length; i++) {
                    freemon.data.setJSONMember(model, eArr[i]);
                }// for
                return model;
            },
            /**
             * HTML FORM으로부터  JSON을 생성.  createJSONFromForm과 같은 JSON 객체를 되돌리지만
             * 폼 요소간의 이름충돌을 방지하기 위해서 접두사를 사용했으면 접두사를 제거하고 원래의
             * 도메인 객체의 필드명을 만들기 위해서 사용한다.
             *
             * @param formName  form 이름
             * @param strToRemove 제거할 문자
             * @returns
             *      JSON Object
             */
            createJSON : function(formName, strToRemove) {
                var jsonStr = freemon.data.createJSONString(formName, strToRemove);
                return  window["eval"]("(" + jsonStr + ")");
            },
            /**
             * HTML FORM으로부터 JSON 문자열을 생성. createJSONFromForm과 같은 JSON 객체를 되돌리지만
             * 폼 요소간의 이름충돌을 방지하기 위해서 접두사를 사용했으면 접두사를 제거하고 원래의
             * 도메인 객체의 필드명을 만들기 위해서 사용한다.
             *
             * @param formName 폼이름
             * @param strToRemove 제거할 문자
             * @returns
             */
            createJSONString : function(formName, strToRemove) {
                var jsonObj = freemon.data.createJSONFromForm(formName);
                var jsonStr =  freemon.json.getJSONString(jsonObj);
                return  freemon.string.replace(jsonStr, strToRemove , "");
            },

            /**
             * form element의 option 값을 가지고 옵션이 선택이 되도록
             *
             * @param selector jQuery selector
             * @param optionValue  option 태그와 비교할 값
             */
            setSelect : function(selector, optionValue) {
                $(selector).each(function() {
                    if (this.value == optionValue) {
                        this.selected = true;
                    } else {
                        this.selected = false;
                    }
                });
            },
            /**
             * multiple 속성을 가진 select 옵션 선택하게 만들기
             * @param selector jQuery selector
             * @parma checkValues :  [] 형태의 값
             */
            setSelectMultiple : function(selector, optionValues) {
                $(selector).each(function() {
                    for ( var i = 0; i < optionValues.length; i++) {
                        if (optionValues[i] === this.value) {
                            this.selected = true;
                        }
                    }
                });
            },
            /**
             * input=radio 의 값 설정합니다.
             *
             * @param selector jQuery selector
             * @param radioVlalue 비교할 값
             */
            setRadio : function(selector, radioValue) {
                $(selector).each(function() {
                    if (this.value == radioValue) {
                        this.checked = true;
                    } else {
                        this.checked = false;
                    }
                });
            },
            /** checkbox  값 설정합니다.
             * @param selector jQuery selector
             * @parma checkValues :  [] 형태의 값
             */
            setCheckbox : function(selector, checkValues) {
                $(selector).each(function() {
                    this.checked = false;
                });
                $(selector).each(function() {
                    for ( var i = 0; i < checkValues.length; i++) {
                        if (this.value == checkValues[i]) {
                            this.checked = true;
                        }
                    }
                });
            },
            /** dummy function */
            dummy : function() {
                // not used
            }
        };

        // ----------------------------------------------------------------------- freemon.ui section
        /**
         * 화면처리
         */
        freemon.ui = {
        	showLoading : function(){
        		$('.load_box').show();
        	},
        	hideLoading : function(){
        		$('.load_box').hide();
        	},
        	
            /**
             *  modal dialog를  표시한다. jquery.ui.dialog 를 참조한다. 다른 점이 있다면
             *  selector를 옵션에 추가적으로 정의한다. freemon.js 내부에서만 사용한다.
             *  { selector :"#dialog-modal" }
             *  @parma opt  json object, jquery.ui.dialog의 option 참조
             */
            showModal : function(opts) {
                var opts2 = $.extend({}, opts, {
                    modal : true
                });
                return $(opts.selector).dialog(opts2);
            },
            /**
             * dialog를 표시한다. freemon.js 내부적으로만 사용함
             * @param opts 모달창 옵션
             */
            showDialog : function(opts) {
                return $(opts.selector).dialog(opts);
            },
            /**
             * freemon.js에서만 사용하는 에러표시 창.
             */
            showAjaxError : function(opts) {

                var ctime = new Date().getTime();
                var randomVal = Math.floor(Math.random() * 100) + 1;
                var divId = "DIV" + ctime + "_" + randomVal;

                // deprecated 
                var html = "<table  style='border:1px black solid;border-collapse:collapse'>"
                        + "<tr>" + "<td style='border:1px black solid;'>에러코드</td>"
                        + "<td style='border:1px black solid;'>" + opts.responseCode + "</td>"
                        + "</tr>" + "<tr>" + "<td style='border:1px black solid;'>에러메시지</td>"
                        + "<td>" + opts.responseText + "</td>" + "</tr>" + "<tr>"
                        + "<td style='border:1px black solid;'>시스템오류메시지</td>"
                        + "<td style='border:1px black solid;'>" + opts.systemError + "</td>"
                        + "</tr>" + "</table>";

                var errMsg  =opts.responseText;
                var errCode =  common_freemonjs_message_syserr;   // "시스템 오류가 발생하였습니다.";
                if( opts.responseCode == 500) {
                   errCode = common_freemonjs_message_syserr;   // "시스템 오류가 발생하였습니다.";
                   errMsg =  common_freemonjs_message_inquire;   // "자세한 사항은 시스템 관리자에게 문의하세요";
                } else {
                    errCode = common_freemonjs_message_notice + "(" + common_freemonjs_message_code + ":" + opts.responseCode  + ")"; //errCode = "알림(코드:" + opts.responseCode  + ")";
                    errMsg = opts.responseText;
                }

               
//html = ""
//+  "<div class='fx_dialog'>"
//+  "<div class='fx_dialog_lyr'>"
//+  "<div class='fx_dialog_titbar'>"
//+  "<h3 class='tit'>"+common_org_error+"</h3>"
//+  "</div>"
//+  "<div class='fx_dialog_cont'>"                 
//+  "<div class=\"system_msg_box\" style=\"width:auto; height:338px; margin:0;\">     "
//+  "    <div class=\"img_side\"><img src=\"" + frameworkProperties.image_server + "/resources/common/img/img_alert.png\" alt=\"\"></div>                                                       "
//+  "    <div class=\"txt_side\">  "
//+  "            <div class=\"tit\">      "
//+  "                    <strong>" +  errCode + "</strong> "
//+  "            </div> "
//+  "            <div class=\"desc\">   "
//+  errMsg
//+  "      <!- Put a system error message here. but hide it. -->  "
//+  "<!-- "
//+  opts.systemError
//+ " --!>"
//+  "            </div>   "
//+  "            <div class=\"btn_box\">"
//+  "                <!-- put a button to contain an action here !-->    "
//+  "            </div>"
//+  "    </div> "
//+  "</div> "
//+  "</div> "
//+  "</div> "
//+  "</div> "
//+ "<iframe frameborder='0' scrolling='no' class='ie_fixed' title=''></iframe>";
					                                
//                html = ""
//                	+ "<div class='pop pop2'>"
//                	+ "<div class='pop_header'>"
//                	+ "<h3>&nbsp;</h3>"
//                	//+ "<a href='javascript:void(0)' class='close'>닫기</a>"
//                	+ "</div>"
//                	+ "<div class='pop_body p-20 no_scroll'>"
//                	+ "<div class='no_page_tit'>" + common_org_error + "<br/><br/>" +  errCode + "<br/>" + errMsg + "</div>"
//                	+ "<div class='btn_pop_box center'>"
//                	+ "</div>"
//                	+ "</div>"
//                	+ "</div>";
//                
//                var newDiv = document.createElement("div");
//                newDiv.id = divId;
//                newDiv.className = "iefix_dialog";
//                document.body.appendChild(newDiv);
//                $("#" + divId).html(html);
//
//                var defaultSettings = {
//                    selector : "#" + divId,
//                    dialogClass: "iefix_dialog_lyr",
//                    height : 400,
//                    width : 600,
//                    modal : false,
//                    show : "slide",
//                    title : "ERROR"
//                };
//                this.showModal(defaultSettings);
                freemon.ux.alert(common_org_error + "<br/><br/>" +  errCode + "<br/>" + errMsg + "<br/>고객센터 : <a href='tel:1899-2951' style='color:#666'>1899-2951</a>");
            },
            /**
             * 이미지를 마우스 오버/아웃시 스왑합니다.
             *
             * @param src jQuery selector
             * @param overImage  mouse over 시 표시할 이미지 경로
             * @param outImage  mouse out 시 표시할 이미지 경로
             */
            swapImage : function(src, overImage, outImage) {
                $(src).mouseover(function() {
                    this.src = overImage;
                }).mouseout(function() {
                    this.src = outImage;
                })
            },
            /**
             * iframe을 구한다. cross browser 지원
             * @param iframeId  iframe's ID
             * @return
             *      iframe 요소.
             */
            getIframe : function(iframeId) {
                return document.getElementById(iframeId).contentWindow || document.frames[iframeId];
            },

            /**
             *  팝업윈도우를 중앙에 위치시키기 위한 좌표 계산
             *  <pre>
             *  var dimension = freemon.ui.getCenterXY(448,366);
             *  window.open(url,'postalCode','width=448,height=366,top=' + dimension.Y + ',left=' + dimension.X);
             *  </pre>
             *
             *  @param w  팝업창의 width
             *  @param h  팝업창의 height
             *  @return   좌표객체 (.X : 좌측위치, .Y : 위쪽 위치 )
             *
             */
            getCenterXY : function(w, h) {
                var dimension = {};
                dimension.X = (screen.availWidth / 2) - (w / 2);
                dimension.Y = (screen.availHeight / 2) - (h / 2) - 40;
                return dimension;
            },
            /**
             * 태그의 좌표와 width, height를 반환
             * @param selector 요소 selector
             */
            getBounds : function(selector) {
                // 일단 jquery를 사용하는 것으로 바꿈.  검증 필요.
                /* var ret = { left:0, top:0, width:0,height:0 };
                if(document.getBoxObjectFor) {
                    var box = document.getBoxObjectFor(tag);
                    ret.left = box.x;
                    ret.top = box.y;
                    ret.width = box.width;
                    ret.height = box.height;
                } else if(tag.getBoundingClientRect)  { // IE, FF3
                    var rect = tag.getBoundingClientRect();
                    ret.left = rect.left + (document.documentElement.scrollLeft || document.body.scrollLeft);
                    ret.top  = rect.top + (document.documentElement.scrollTop || document.body.scrollTop);
                    ret.width = rect.right - rect.left;
                    ret.height = rect.bottom - rect.top;
                }
                 */
                // 좀더 검증을 해 봐야 함.
                var ret = {
                    left : $(selector).offset().left,
                    top : $(selector).offset().top,
                    height : $(selector).outerHeight(),
                    width : $(selector).outerWidth()
                }
                return ret;
            },
            /**
             * div를 이벤트가 발생한 엘리먼트의 아래에 표시합니다.
             *
             * Example)
             *  Html codes:
             *     <input type="text" id="test" value="" />
             *
             *     <div id="layer1">Contents here </div>
             *
             *  Javascript Codes:
             *     $("#test").click(function() {
             *          freemon.ui.showLayer("layer1", this);
             *     });
             *
             * @param  selector : selector. a div shows  below this targer element.
             * @param  source      : event source element
             */
            showLayer : function(selector, source) {
                //var position = $(source).position();
                var offset = $(source).offset();
                var height = $(source).outerHeight();
                var width = $(source).outerWidth();

                return $(selector).css("left", offset.left).css("top", offset.top + height).css(
                        "position", "absolute").css("visibility", "visible");
            },
            hello : function() {
                alert('hello');
            },

            /**
             * 위치 변경 레이어에서 항목을 선택 했을 때 li 태그에 색을 변경 한다.
             *
             * Exzmple)
             * 	Javascript Codes:
             * 		$('#test > li').click(function(event){freemon.ui.selectItem(event, $('#test'))});
             * @param e 이벤트 객체
             * @param ulObj ul 태그 객체
             */
            selectItem : function(e, ulObj){
            	$(ulObj).children().each(function(index){
            		$(this).removeClass('ui-sortable-helper');
            		$(this).removeClass('active');
            	});
            	$(e.target).addClass('ui-sortable-helper');
            	$(e.target).addClass('active');
            },
            /**
             * 선택한 항목에 위치를 아래로 한칸 이동 시킨다.
             *
             * Exzmple)
             * 	Javascript Codes:
             * 		$('#test').click(function(){freemon.ui.itemMoveDown($('#test'));});
             * @param ulObj ul 태그 객체
             */
            itemMoveDown : function(ulObj){
            	var current = $(ulObj).children('.ui-sortable-helper');
            	current.next().after(current);
            },
            /**
             * 선택한 항목에 위치를 위로 한칸 이동 시킨다.
             *
             * Exzmple)
             * 	Javascript Codes:
             * 		$('#test').click(function(){freemon.ui.itemMoveUp($('#test'));});
             * @param ulObj ul 태그 객체
             */
            itemMoveUp : function(ulObj){
            	var current = $(ulObj).children('.ui-sortable-helper');
            	current.prev().before(current);
            },
            /**
             * 선택한 항목에 위치를 맨 위로 이동 시킨다.
             *
             * Exzmple)
             * 	Javascript Codes:
             * 		$('#test').click(function(){freemon.ui.itemMoveTop($('#test'));});
             * @param ulObj ul 태그 객체
             */
            itemMoveTop : function(ulObj){
            	var firstEl = $(ulObj).children().first();
            	var current = $(ulObj).children('.ui-sortable-helper');
            	if(!firstEl.hasClass('ui-sortable-helper')) firstEl.before(current);
            },
            /**
             * 선택한 항목에 위치를 맨 아래로 이동 시킨다.
             *
             * Exzmple)
             * 	Javascript Codes:
             * 		$('#test').click(function(){freemon.ui.itemMoveBottom($('#test'));});
             * @param ulObj ul 태그 객체
             */
            itemMoveBottom : function(ulObj){
            	var lastEl = $(ulObj).children().last();
            	var current = $(ulObj).children('.ui-sortable-helper');
            	if(!lastEl.hasClass('ui-sortable-helper')) lastEl.after(current);
            },

        	contents : {
        		appendContentsIframe: function(contents, targetId, callbackAfterLoad) {
        			var that = this;
        			$('<iframe name="contentsFrame" src="' + frameworkProperties.context + '/inc/editor/contentsView" marginwidth="0" marginheight="0" frameBorder="0" width="100%" height="100px" scrolling="auto"></iframe>')
        			.load(function() {
        				var $iframe = $(this);
        				var frameBody = $iframe.contents().find('body');
        				var doc = this.contentDocument || this.contentWindow.document;
        				frameBody
        				.append(contents)
        				.find('img')
        				.load(function() {
        					$iframe.css({/*width: that.getDocWidth(doc),*/ height: that.getDocHeight(doc) + 18});
        				});
        				$iframe.css({/*width: that.getDocWidth(doc),*/ height: that.getDocHeight(doc) + 18});

        				if (callbackAfterLoad) {
        					callbackAfterLoad(frameBody);
        				}
        			}).appendTo($('#' + targetId));
        		},
        		getDocHeight: function (doc) {
        			var db = doc.body, de = doc.documentElement;
        			var mMax = Math.max(
            				Math.max(db.scrollHeight, de.scrollHeight),
            				Math.max(db.offsetHeight, de.offsetHeight),
            				Math.max(db.clientHeight, de.clientHeight)
            			); 
        			if(mMax > 20000){
        				mMax = 20000;
        			}
        			return mMax;
        		},
        		getDocWidth: function (doc) {
        			var db = doc.body, de = doc.documentElement;
        			return Math.max(
        				Math.max(db.scrollWidth, de.scrollWidth),
        				Math.max(db.offsetWidth, de.offsetWidth),
        				Math.max(db.clientWidth, de.clientWidth)
        			);
        		}
        	},

			/** 로그인사용자의 테마및 배경을 띄운다.
			 * 
			 * @param showBg 배경이미지를 보여줄지 여부 - 메모나 스페이스등 배경이 필요할때 사용.
			 *
			 */
			loadUserSkinTheme: function(showBg) {
				if(loginUserInfo && loginUserInfo.gwSkinTheme){
					$(document.body).addClass('gw_theme'+ loginUserInfo.gwSkinTheme);
				} else {
					$(document.body).addClass('gw_theme4');
				}
				if(showBg) {
					this.displayPageBg();
				}
			},

			/** 로그인사용자의 테마색상을 띄운다. */
			loadUserSkinColor: function() {
				if(loginUserInfo && loginUserInfo.gwSkinColor){
					$(document.body).addClass('gw_color'+loginUserInfo.gwSkinColor);
				} else {
					$(document.body).addClass('gw_color1');
				}
			},

			/** 로그인사용자의 배경화면화면을 표시한다. */
			displayPageBg: function() {
				if(loginUserInfo == null) {
					$(document.body).addClass('gw_bg1');
				}else if(loginUserInfo.gwBgType == '0'){
					//사용지정 이미지 적용.
					if(loginUserInfo.personCfgImage) {
						freemon.ui.setCustomImageByBg(loginUserInfo.personCfgImage);
					} else {
						$(document.body).addClass('gw_bg1');
					}
				}else {
					//기본배경이미지 적용.
					$(document.body).addClass('gw_bg'+ (loginUserInfo.gwBgType || '1'));
				}
			},

			setCustomImageByBg : function(cfgImg){
				var rp = null, bp = null, css;
				// 반복
				switch (cfgImg.reptType) {
				case '2': rp = 'repeat'; break;
				case '3': rp = 'repeat-x'; break;
				case '4': rp = 'repeat-y'; break;
				default:  rp = 'no-repeat';
				}
				// 위치
				if(cfgImg.locType == '1'){
					bp = '50% 50%';
				}else{
					bp = cfgImg.leftLoc+'% '+cfgImg.upperLoc+'%';
				}

				css = {
					'background-image' : 'url('+frameworkProperties.context+'/inc/file/fileView?fileUrl='+encodeURIComponent(cfgImg.fileUrl) +'&fileName='+cfgImg.localFileName+')',
					'background-repeat': rp,
					'background-position': bp
				}
				// 위치 고정
				if(cfgImg.locFixedYn == 'Y'){
					css['background-attachment'] = 'fixed;';
				}
				// 화면에 맞춤
				if(cfgImg.scrnFitYn == 'Y'){
					css['background-size'] = 'cover';
					css['-webkit-background-size'] = 'cover';
					css['-moz-background-size'] = 'cover';
					css['-o-background-size'] = 'cover';
				}
				
				$(document.body).css(css);
			},
			projectListRender : function(obj){
				
				var monthArr = [];
				var chartTerm = obj.month;
				j = -(Math.floor(chartTerm/2));
				if(chartTerm == 2){
                    j = 0;
				}else if(chartTerm == 12){
                    j = - 2;
				}
				var parts = obj.searchStrDate.split('-');
				for(var i = 0; i < chartTerm; i++) {
					if(obj.searchStrDate) {
//						var parts = obj.searchStrDate.split('-');
						//var initDate = new Date(parts[0], parts[1] - 1, parts[2]);
						if(parts[2] > 28){
							var initDate = new Date(parts[0], parts[1] - 1, parts[2]-3);
						}
						else{
							var initDate = new Date(parts[0], parts[1] - 1, parts[2]);
						}
					} else {
						var initDate = new Date();
					}
					var date = freemon.util.addDate(initDate, 2, j);
					
					date.setDate(1);
					
					/**
					 * 현재달 표시
					 */
					var nowDate = new Date();
					var scDate = new Date(parts[0], parseInt(parts[1]) - 1, parts[2]);
					var nowDateCheck = false;
					if(nowDate.getFullYear() == date.getFullYear() && nowDate.getMonth() == date.getMonth()){
						if(scDate.getFullYear() == nowDate.getFullYear() &&  scDate.getMonth() == nowDate.getMonth()) nowDateCheck = false;
						else nowDateCheck = true;
					}
					
					monthArr.push({
						'day' : freemon.util.getStringFromDate(date),
						'date' : date,
						'month' : freemon.string.lpad("" + (date.getMonth() + 1), 2, '0'),
						'now' : nowDateCheck
					});
					j++;
				}
				var endDate = new Date( monthArr[chartTerm - 1].date.getFullYear(), monthArr[chartTerm - 1].date.getMonth()+1, 0);
				var monthTerm = freemon.util.calcDayMonthCount(freemon.util.getStringFromDate(monthArr[0].date), freemon.util.getStringFromDate(endDate), 'D');
				
				obj.monthArr = monthArr;
				obj.action = function(){
					if(obj.authentication) return "projectInfo";
					else return "projectNoneInfo";
				}
				
				if(obj.projectList == undefined){
					obj = "객체 정보를 찾을 수 없습니다.";
					return obj;
				}
				try{
					$.each(obj.projectList, function(i, data) {
						var leftSum = 0;
						
						data.monthArr = monthArr;		
						
						var newDate = new Date();
						// new icon
						var newCount = freemon.util.calcDayMonthCount(data.projRegDt.substr(0,10), freemon.util.getStringFromDate(newDate), 'D');
						var startCount = freemon.util.calcDayMonthCount(data.projStrtDt.substr(0,10), freemon.util.getStringFromDate(newDate), 'D');
						if(newCount > 30){
							data.newImage = false;
						}
						else{
							if(startCount < 20){
								data.newImage = true;
							}
							else{
								data.newImage = false;
							}
						}
						
						data.projStrtDtPoint = data.projStrtDt.replace(/-/gi,".");
						data.projCloseDtPoint = data.projCloseDt.replace(/-/gi,".");
						
						data.isContactStatus = function(){
							if(data.contactStatus == "계약전"){
								return false;
							}else{
								return true;
							}
						}
//						data.isContactFinish = function(){
//							if(data.contactStatus == "계약완료"){
//								return "on";
//							}else{
//								return "off";
//							}
//						}
						// 제안시 남긴글
						data.isMessage = function(){
							if(data.inqueryMessage){
								return true;
							}else{
								return false;
							}
						}	
						if(data.inqueryMessage != null) {
							if(data.inqueryMessage == ""){
								data.inqueryMessage = "제안 되었습니다.";
							}
							data.inqueryMessage = data.inqueryMessage.replace(/(?:\r\n|\r|\n)/g, '<br />');
						}
						
						// 지원시 남긴글
						data.isMessage2 = function(){
							if(data.inqueryMessage2){
								return true;
							}else{
								return false;
							}
						}	
						if(data.inqueryMessage2 != null) {
							if(data.inqueryMessage2 == ""){
								data.inqueryMessage2 = "지원 되었습니다.";
							}
							data.inqueryMessage2 = data.inqueryMessage2.replace(/(?:\r\n|\r|\n)/g, '<br />');
						}
						
						// 재검토요청시 남긴글
						data.isMessage3 = function(){
							if(data.inqueryMessage3){
								return true;
							}else{
								return false;
							}
						}	
						if(data.inqueryMessage3 != null) {
							if(data.inqueryMessage3 == ""){
								data.inqueryMessage3 = "재검토요청 되었습니다.";
							}
							data.inqueryMessage3 = data.inqueryMessage3.replace(/(?:\r\n|\r|\n)/g, '<br />');
						}
						
						// 제안취소시 남긴글
						data.isMessage4 = function(){
							if(data.inqueryMessage4){
								return true;
							}else{
								return false;
							}
						}	
						if(data.inqueryMessage4 != null) {
							if(data.inqueryMessage4 == ""){
								data.inqueryMessage4 = "제안취소 되었습니다.";
							}
							data.inqueryMessage4 = data.inqueryMessage4.replace(/(?:\r\n|\r|\n)/g, '<br />');
						}
						
						// 지원취소시 남긴글
						data.isMessage5 = function(){
							if(data.inqueryMessage5 != null){
								return true;
							}else{
								return false;
							}
						}	
						if(data.inqueryMessage5 != null) {
							if(data.inqueryMessage5 == ""){
								data.inqueryMessage5 = "지원취소 되었습니다.";
							}
							data.inqueryMessage5 = data.inqueryMessage5.replace(/(?:\r\n|\r|\n)/g, '<br />');
						}
						
						if(data.projectDateDiff != null){
							data.projectDay = function(){
								if(data.projectDateDiff == 0){
									return "금일시작";
								}else if (data.projectDateDiff > 0){
									return data.projectDateDiff + "일후";
								}else{
									return data.projectDateDiff.replace("-", "")+ "일전";
								}
							}
						}
						
						data.isProjectStart = function(){
							if (data.projectDateDiff < 0){
								return "off";
							}else{
								return "on";
							}
						}
										
						data.isNow = function() {
							if(data.leaveStrtTerm == "Y") {
								return true;
							} else {
								return false;
							}
						}
						
						data.isClosed = function() {
							if(data.closeYn == "Y") {
								return true;
							} else {
								return false;
							}
						}
	//					data.closed = function() {
	//						if(data.projectDateDiff < 0) {
	//							return true;
	//						} else {
	//							return false;
	//						}
	//					}
						
						// 지원현황의 확인여부 : 너무 색이 많아 잠시 주석처리
						//if(data.readYn == "N"){
						//	data.isReadYn = true;
						//}
						//else{
							data.isReadYn = false;
						//}
						
						// 즉시 투입 가능 시
						var initterm = freemon.util.calcDayMonthCount(freemon.util.getStringFromDate(monthArr[0].date), obj.searchStrDate, 'D');
						//var initwidth = Math.floor(initterm/monthTerm * 100);
						if(chartTerm == 12){
							var initwidth = Math.floor((initterm+2)/monthTerm * 100);
						}
						else{
							var initwidth = Math.floor(initterm/monthTerm * 100);
						}
	
						data.initwidth = function(){
							if (initwidth >= 100){
								return 90;
							}else{
								return initwidth;
							}
						}
						
						data.initDate = freemon.string.lpad(obj.searchStrDate.substr(5,2)) + "/" + freemon.string.lpad(obj.searchStrDate.substr(8,2));
						
						// 내일정
						if(data.joinPsblDt != null) {
							var myTerm = freemon.util.calcDayMonthCount(freemon.util.getStringFromDate(monthArr[0].date), data.joinPsblDt, 'D');
							var width = Math.floor(myTerm/monthTerm * 100);
							data.width = function(){
								if (width >= 100){
									return 90;
								}else{
									return width;
								}
							}
							
							data.myDt = freemon.string.lpad(data.joinPsblDt.substr(5,2)) + "/" + freemon.string.lpad(data.joinPsblDt.substr(8,2));
						}
	
						// 프로젝트 종료된것과 진행중인것, 진행예정인것 css
						data.cssNm = function() {
							var endProject = freemon.util.calcDayMonthCount(obj.searchStrDate, data.projCloseDt, 'D');
							if(endProject < 1){
								return "project1";	// 회색
							}
							else{
								return "project2";	// 컬러
							}
						}
						
						// 프로젝트 일정
						data.strtDt = freemon.string.lpad(data.projStrtDt.substr(5,2)) + "/" + freemon.string.lpad(data.projStrtDt.substr(8,2));
						data.closeDt = freemon.string.lpad(data.projCloseDt.substr(5,2)) + "/" + freemon.string.lpad(data.projCloseDt.substr(8,2));
						data.projPeriod = data.strtDt + " ~ " + data.closeDt;
						
						var left = freemon.util.calcDayMonthCount(freemon.util.getStringFromDate(monthArr[0].date),data.projStrtDt, 'D');
						var right = freemon.util.calcDayMonthCount(data.projStrtDt, data.projCloseDt, 'D');
						data.leftwidth = function(){
							if(chartTerm == 3 && Math.round(left / monthTerm * 100) < 0){
								return 0;
							}
							else if(chartTerm == 3 ){
								return Math.round(left / monthTerm * 100) + 1;
							}
							else {
								return Math.round(left / monthTerm * 100);
							}
						}
							
						var rightwidth = right / monthTerm * 100;
	
						leftSum += data.leftwidth;
	
						if(chartTerm == 3 && leftSum > 66){
							data.rightwidth = 34;
						}else if (rightwidth > 100){
							data.rightwidth = 99;
						}else{
							data.rightwidth = rightwidth;
						}
					})
				}catch(e){
					obj = e;
					return obj;
				}
				
				// 검색일자(init Day)
				obj.searchDay = freemon.string.lpad(obj.searchStrDate.substr(5,2)) + "/" + freemon.string.lpad(obj.searchStrDate.substr(8,2));
				
				return obj;
			},
			talentListRender : function(obj) {
				// 인재검색쪽 소스 넣음
				var monthArr = [];
				var chartTerm = obj.month;
				j = -(Math.floor(chartTerm/2));
				if(chartTerm == 12){
				    j = - 8;
				}
				for(var i = 0; i < chartTerm; i++) {
					if(obj.searchStrDate) {
						var parts = obj.searchStrDate.split('-');
						if(parts[2] > 28){
							var initDate = new Date(parts[0], parts[1] - 1, parts[2]-3);
						}
						else{
							var initDate = new Date(parts[0], parts[1] - 1, parts[2]);
						}
					} else {
						var initDate = new Date();
					}
					
					var date = freemon.util.addDate(initDate, 2, j);
					
					date.setDate(1);
					
					/**
					 * 현재달 표시
					 */
					var nowDate = new Date();
					var scDate = new Date(parts[0], parseInt(parts[1]) - 1, parts[2]);
					var nowDateCheck = false;
					if(nowDate.getFullYear() == date.getFullYear() && nowDate.getMonth() == date.getMonth()){
						if(scDate.getFullYear() == nowDate.getFullYear() &&  scDate.getMonth() == nowDate.getMonth()) nowDateCheck = false;
						else nowDateCheck = true;
					}
					
					monthArr.push({
						'day' : freemon.util.getStringFromDate(date),
						'date' : date,
						'month' : freemon.string.lpad("" + (date.getMonth() + 1), 2, '0'),
						'now' : nowDateCheck,
						'className' : 'line_' + (i + 1)
					});
					
					j++;
				}
				
				var endDate = new Date( monthArr[chartTerm - 1].date.getFullYear(), monthArr[chartTerm - 1].date.getMonth()+1, 0);
				var monthTerm = freemon.util.calcDayMonthCount(freemon.util.getStringFromDate(monthArr[0].date), freemon.util.getStringFromDate(endDate), 'D');
				obj.monthArr = monthArr;
				this.talentListUX(obj, chartTerm, monthArr, endDate, monthTerm);
				
				return obj;
			},	// talentListRender
			talentListUX : function(obj, chartTerm, monthArr, endDate, monthTerm) {
				
				$.each(obj.talentList, function(i, data) {
					
					data.index = i;
					
					var leftSum = 0 ;
					data.monthArr = monthArr;

					if( data.birthDay != "" && data.birthDay != null){
						var birthDay = data.birthDay;
						var year = parseInt(new Date().getFullYear());
						data.age = (year-birthDay)+1; // 우리나라 나이 표시 +1 더함 
						data.shortYear = birthDay.substr(2,4);
					}
					
					data.isGenderNm = function() {
						if(data.genderNm != '' && data.genderNm != null) return true;
						else return false;
					}
					
					// 관심인재여부
					data.isInterest = function() {
						if(data.interestYn == 'Y') {
							return true;
						} else {
							return false;
						}
					}
					
					// 전속인재여부
					data.isExclusive = function() {
						if(data.exclusiveYn == 'Y') {
							return true;
						} else {
							return false;
						}
					}
					
					// 전문기술 = 기술명 : 경력
					if(data.usableSkillNm) {
						data.usableSkillList = [];
						$.each(data.usableSkillNm.split(','), function(i, skillNm) {
							
							var skills = skillNm.split("|");
							
							data.usableSkillList.push({
								'skillNm' : skills[0],
								'skillCrr': skills[1]
							});
						});
					}
					
					// 계약여부
					data.isContract = function() {
						if(data.applcntStatus == "계약완료"){
							return true;
						}
						else{
							return false;
						}
					}
					
					if(parseInt(data.leaveStrtTerm) > 0){
						data.leaveStrtTermTxt = data.leaveStrtTerm + "일후";
					}
					else if(parseInt(data.leaveStrtTerm) == 0){
						data.leaveStrtTermTxt = "투입가능";
						data.leaveStrtTermCss = "on";
					}
					else{
						if(data.leaveStrtTerm < -30 || data.leaveStrtTerm == null){
							data.leaveStrtTermTxt = "투입가능";
							data.leaveStrtTermCss = "on";
						}
						else{
							data.leaveStrtTermTxt = "투입가능";
							data.leaveStrtTermCss = "on";
						}
					}

					data.shortJoinPsblDt = freemon.util.getShortDateString(data.joinPsblDt, '/');
					var dateTerm = freemon.util.calcDayMonthCount(freemon.util.getStringFromDate(new Date()), data.joinPsblDt, 'D');
					data.isNow = function() {
						if(dateTerm < 1) {
							return true;
						} else {
							return false;
						}
					}

					var myTerm = freemon.util.calcDayMonthCount(freemon.util.getStringFromDate(monthArr[0].date), data.joinPsblDt, 'D');
					var width = Math.floor(myTerm/monthTerm * 100);
					
					data.isTermOver = function() {
						if(width > 100) {
							return true;
						} else {
							return false;
						}
					}
					data.width = width;
					if(data.width >= 100) {
						data.width = 90;
					}
					
					var initDate = obj.searchStrDate;
					
					var initterm = freemon.util.calcDayMonthCount(freemon.util.getStringFromDate(monthArr[0].date), initDate, 'D');
					if(chartTerm == 12){
						var initwidth = Math.floor((initterm+2)/monthTerm * 100);
					}
					else{
						var initwidth = Math.floor(initterm/monthTerm * 100);
					}
					
					data.initwidth = initwidth;
					if(data.initwidth >= 100) {
						data.initwidth = 90;
					}
					
					if(data.memo != "" && data.memo != null){
						data.memoYN = true;
					}
					else{
						data.memoYN = false;
					}
					
					if(data.totalWorkCareer == " ") data.totalWorkCareer = "0년";
					
					data.initDate =freemon.string.lpad(initDate.substr(5,2)) + "/" + freemon.string.lpad(initDate.substr(8,2));
					data.cntrctTempList = [];
						
					var lastContractEndDt = "";
					$.each(data.cntrctList, function(i, data) {						
						if(data.cntrctStrtDt != null && data.cntrctEndDt != null ){
							data.isDisplay = true;
							
							var left = freemon.util.calcDayMonthCount(freemon.util.getStringFromDate(monthArr[0].date),data.cntrctStrtDt, 'D');
							if(left < 0){
								var leftEnd = freemon.util.calcDayMonthCount(freemon.util.getStringFromDate(monthArr[0].date), data.cntrctEndDt, 'D');
								if(leftEnd < 0){
									var right = 0;
								}
								else{
									var right = freemon.util.calcDayMonthCount(freemon.util.getStringFromDate(monthArr[0].date), data.cntrctEndDt, 'D');
								}
							}
							else{
								var right = freemon.util.calcDayMonthCount(data.cntrctStrtDt, data.cntrctEndDt, 'D');
							}
							
							if(chartTerm == 3){
								if(left == 0){
									data.leftwidth = Math.round(left / monthTerm * 100);
								}
								else{
									data.leftwidth = Math.round(left / monthTerm * 100) + 1;
								}
							}else{
								data.leftwidth = Math.round(left / monthTerm * 100);
							}
							if(data.leftwidth < 0) data.leftwidth = 0;

							var rightwidth = right / monthTerm * 100;
							
							leftSum += data.leftwidth;
							
							if(chartTerm == 3 && leftSum > 66){
								data.rightwidth = 34;
							}else if (rightwidth > 100){
								data.rightwidth = 100;
							}else{
								data.rightwidth = rightwidth;
							}
							
							data.projNm = data.projNm.replace(/\"/g, '');
							data.strtdt = data.cntrctStrtDt;
							data.closedt = data.cntrctEndDt;
							data.startDay = freemon.string.lpad(data.cntrctStrtDt.substr(5,2)) + "/" + freemon.string.lpad(data.cntrctStrtDt.substr(8,2));
							data.endDay = freemon.string.lpad(data.cntrctEndDt.substr(5,2)) + "/" + freemon.string.lpad(data.cntrctEndDt.substr(8,2));
							data.projPeriod = data.startDay + " ~ " + data.endDay;
							
							var endProject = freemon.util.calcDayMonthCount(initDate, data.cntrctEndDt, 'D');
							if(endProject < 1){
								data.cssNm = "project3";	// 종료된 프로젝트
							}
							else{
								data.cssNm = "project2";	// 진행중인 프로젝트
							}
							
							if(data.projIdx == null || data.projIdx == "") data.projIdx = 0;	// 프로젝트 연결키가 없는 경우
							
							lastContractEndDt = data.cntrctEndDt;
						}
					});
					
					if(data.lastCntrctEndDt != null && lastContractEndDt == data.lastCntrctEndDt){
						var calc = (freemon.util.calcDayMonthCount(data.joinPsblDt, data.lastCntrctEndDt, 'D'));
						if(calc < -1 || calc > 1){
							var subData = {};
							
							var left = freemon.util.calcDayMonthCount(freemon.util.getStringFromDate(monthArr[0].date), data.lastCntrctEndDt, 'D');
							
							var right = freemon.util.calcDayMonthCount(data.lastCntrctEndDt, data.joinPsblDt, 'D');
							if(left == null || left < 0 || left == ""){
								left = 0;
								right = freemon.util.calcDayMonthCount(freemon.util.getStringFromDate(monthArr[0].date), data.joinPsblDt, 'D');
							} 
							
							if(chartTerm == 3){
								subData.leftwidth = Math.round(left / monthTerm * 100);
							}else{
								subData.leftwidth = Math.round(left / monthTerm * 100);
							}
							if(subData.leftwidth < 0) subData.leftwidth = 0;
	
							if(right < 0){
								var rightwidth = 1;
							}
							else{
								var rightwidth = right / monthTerm * 100;
							}
							
							leftSum += subData.leftwidth;
							
							if(chartTerm == 3 && leftSum > 66){
								subData.rightwidth = 34;
							}else if (rightwidth > 100){
								subData.rightwidth = 99;
							}else{
								subData.rightwidth = rightwidth;
							}
							
							subData.cssNm = "project4";
							subData.projIdx = -1;
							subData.projNm = "비공개 프로젝트 진행중";
							subData.projPeriod = data.joinPsblDt.replace("-",".").replace("-",".") + "부터 투입가능";
							subData.isDisplay = true;
							
							data.cntrctList.push(subData);
						}
					}
					else{
						// 현재 선택한 달에도 데이터가 없을 경우
						var subData = {};
						
						if(data.lastCntrctEndDt == null){
							var left = 0;
						}
						else{
							var left = freemon.util.calcDayMonthCount(freemon.util.getStringFromDate(monthArr[0].date), data.lastCntrctEndDt, 'D');
							if(left == null || left < 0 || left == "") left = 0;
						}
						var right = freemon.util.calcDayMonthCount(freemon.util.getStringFromDate(monthArr[0].date), data.joinPsblDt, 'D');
	
						if(chartTerm == 3){
							subData.leftwidth = Math.round(left / monthTerm * 100);
						}else{
							subData.leftwidth = Math.round(left / monthTerm * 100);
						}
						if(subData.leftwidth < 0) subData.leftwidth = 0;
	
						if(right < 0){
							var rightwidth = 1;
						}
						else{
							var rightwidth = right / monthTerm * 100;
						}
						
						leftSum += subData.leftwidth;
						
						if(chartTerm == 3 && leftSum > 66){
							subData.rightwidth = 34;
						}else if (rightwidth > 100){
							subData.rightwidth = 99;
						}else{
							subData.rightwidth = rightwidth;
						}
						
						subData.cssNm = "project4";
						subData.projIdx = -1;
						subData.projNm = "비공개 프로젝트 진행중";
						subData.projPeriod = data.joinPsblDt.replace("-",".").replace("-",".") + "부터 투입가능";
						subData.isDisplay = true;
						
						data.cntrctList.push(subData);
					}
					
					if(data.prfPhotoYn == 'Y'){
						if(data.photo){ data.profileUrl = "/resources/images/new/no-pic.png"; }
						else if(data.kkoProfilUrl){ data.profileUrl = data.kkoProfilUrl; }
						else{ data.profileUrl = "/resources/images/new/no-pic.png"; }
					}
					else{
						data.profileUrl = "/resources/images/new/no-pic.png";
					}
				});
			}
        };





        // ---------------------------------------------------------------------------------- Paging
        /**
         * 페이지 목록을 처리하는 클래스.
         */
        freemon.paging =  {

                //    처음    이전    (1) 2 3 4 5 6 7 8 9 10   다음   마지막
                //    First   Prev    Select                   Next    Last
                options : {
                    divId: "paging",
                    pageObject: "",
                    funcName: "",    // 링크 클릭시 호출할 함수 이름
                    pageNo : 1,        // 현재 선택된 페이지 번호
                    listBlock : 10,    // 목록의 출력 갯수
                    pageBlock: 10,     // 페이지 목록의 수
                    totalCount:0,      // 전체 데이터 행의 수
                    tempNo:0,
                    showImage: true    // 이미지 표시여부( default : true)
                },



                /**
                 * 페이지의 항목 목록의 시작번호를 구한다.
                 * @pageNo  페이지 번호
                 * @listBlock 페이지에 출력할 목록 번호
                 */

                getStartNum : function(pageNo, listBlock) {
                    return (pageNo * listBlock) - listBlock + 1;
                },// getStartNum
                /** 전체 페이지 수 */
                getTotalPageCnt : function(options) {

                    var t = options.totalCount / options.listBlock;
                    var i = Math.floor(t);
                    if(options.totalCount % options.listBlock  > 0) {
                        i++;
                    }
                    return i;
                },
                getNavigator : function(settings) {

                    var opts = $.extend(freemon.paging.options, settings);
                    var html = "";
                    // pageBlockNo은 0 부터 시작
                    // page block은  "1 2 3 4 5 6 7 8 9 10"과 같이 표시할 페이지 목록의 갯수를 묶는 단위로
                    // 10개씩 페이지 블럭을 묶으면  전체 페이지가 13개라고 하면 2대의 page block이 생긴다.
                    // 첫번째 페이지 블럭은 0, 그다음은 1이다.
                    //
                    var totalPageCnt = freemon.paging.getTotalPageCnt(opts);         // 전체 페이지수
                    var pageBlockNo = Math.floor(opts.pageNo / opts.pageBlock);   // 선택페이지의 블럭 번호
                    var lastPageBlockNo = Math.floor( totalPageCnt / opts.pageBlock); // 마지막 페이지블럭 번호
                    
                    if(opts.pageNo % opts.pageBlock == 0) pageBlockNo = pageBlockNo - 1;
                    
                    var liPrev 		 = '<li class="pagination-arrow"><a href="javascript:void(0);" onclick="javascript:{{funcName}}({{pageNo}}); return false;" class="ripple-effect"><i class="icon-material-outline-keyboard-arrow-left"></i></a></li>';
                    var liActivePage = '<li><a href="javascript:void(0);" class="current-page ripple-effect">{{pageNo}}</a></li>';
                    var liPage		 = '<li><a href="javascript:void(0);" class="ripple-effect" onclick="javascript:{{funcName}}({{pageNo}}); return false;">{{pageNo}}</a></li>';
                    var liNext		 = '<li class="pagination-arrow"><a href="javascript:void(0);" onclick="javascript:{{funcName}}({{pageNo}}); return false;" class="ripple-effect"><i class="icon-material-outline-keyboard-arrow-right"></i></a></li>';

                    html = "<ul>";
                    // 처음
                    if(!opts.autoHideAdjacent || pageBlockNo > 0)  {
                        var formatData = {
                                    funcName  : opts.funcName,
                                    pageNo    : 1
                                };
                            //html +=  $.format(liFirst, formatData);
                            //html +=  Mustache.to_html(liFirst, formatData);
                    }// autoHideAdjacent



                    // 이전
                    if(!opts.autoHideAdjacent || pageBlockNo > 0 ){

                       var prevPageBlock = pageBlockNo -1  // 이전 페이지 블럭
                       var prevPageNo    = prevPageBlock *  opts.pageBlock + 1; // 이전 페이지 블럭의 첫 페이지
                       if(prevPageNo < 1) prevPageNo = 1;
                          var formatData = {
                                    funcName  : opts.funcName,
                                    pageNo    : prevPageNo
                                };
                          //html += $.format(liPrev, formatData);
                          html +=  Mustache.to_html(liPrev, formatData);
                    }//

                    // 페이지 영역
                    for(var i= pageBlockNo * opts.pageBlock +1; i <= pageBlockNo * opts.pageBlock + opts.pageBlock; i++) {
                        if(i > totalPageCnt) break;
                        if(i == opts.pageNo) {
                            var formatData = {
                                    pageNo : i
                                };
                            //html += $.format(liActivePage, formatData);
                            html +=  Mustache.to_html(liActivePage, formatData);
                        }else {
                            var formatData = {
                                    funcName  : opts.funcName,
                                    pageNo    : i
                                };
                            //html += $.format(liPage, formatData);
                            html +=  Mustache.to_html(liPage, formatData);
                        }
                    }// for


                    // 다음
                    if(!opts.autoHideAdjacent ||   pageBlockNo < lastPageBlockNo ) {
                    	var nextPageBlockNo = pageBlockNo + 1;	                        
                    	var nextPageNo = (nextPageBlockNo * opts.pageBlock) + 1;
                   	                    	
                        if(totalPageCnt == 0){
                        	nextPageNo = 1;
                        }else if(nextPageNo > totalPageCnt) {
                            nextPageNo = totalPageCnt;
                        }

                            var formatData = {
                                    funcName  : opts.funcName,
                                    pageNo    : nextPageNo
                                };
                                //html += $.format(liNext, formatData);
                                html +=  Mustache.to_html(liNext, formatData);
                    }// 다음


                    // 마지막
                    if(!opts.autoHideAdjacent || ( pageBlockNo < lastPageBlockNo)) {

                        var totalCnt = freemon.paging.getTotalPageCnt(opts);
                        var formatData = {
                                    funcName  : opts.funcName,
                                    pageNo    : opts.totalCount>0?freemon.paging.getTotalPageCnt(opts):1
                                };
                            //html += $.format(liLast, formatData);
                           // html +=  Mustache.to_html(liLast, formatData);
                    }// 마지막

                    html += "</ul>";

              /*
                    var pagingDiv = '<div id="{divId:s}" class="pagination">{navi:s}</div>';
                    var fmtData = {
                        navi       : html,
                        divId      :   opts.divId
                    }
                    return   $.format(pagingDiv, fmtData);
                    */
                    return  html;

                },// getNavigator
                /**
                 * 다음 페이지 번호를 구한다.
                 * @param settings
                 */
                getNextPageNo : function(settings) {

                    var opts = $.extend(freemon.paging.options, settings);
                    var totalPageCnt = freemon.paging.getTotalPageCnt(opts);         // 전체 페이지수
                    var data = {};
                	var nextPage = 0;
                	if(opts.pageNo >= totalPageCnt){
                		nextPage = totalPageCnt;
                	}else{
                		nextPage = opts.pageNo+1;
                	}
                	
                	data.nextPage = nextPage;
                	data.lastPage = opts.totalCount>0?totalPageCnt:1;
                	return data;
                }
        };

		// ------------------------------------------------------------------------ openUi
		/**
		 * 공개된 ui를 제공하는 클래스.
		 */
		freemon.openUi = {
			/**그룹웨어 알림 팝업**/
			/*homGwPushPopup: function(data) {
				var date = new Date();
				this.callPopup2(data, 'homGwPushPopup'+date.getTime(), '/view/home/homGwPushPopup', 350, 190, 0, 0, 0);
			},*/
			/** popup을 호출. */
			callPopup: function(data, popName, url, w, h, s) {
				var f = $('#openUi_callForm'),
					iArr= [],
					name = null;

				if (!f.length) {
					f = $('<form id="openUi_callForm" name="openUi_callForm" method="post" onsubmit="return false;"/>');
					f.appendTo(document.body);
				}

				if(data) {
					for (name in data) {
						if(data.hasOwnProperty(name)){
							iArr.push('<input type="hidden" name="'+name+'" value="' +(data[name] || '')+ '"/>');
						}
					}
				}
				f.html(iArr.join(''));

				$.popupWindow({
					windowURL: 'about:blank',
					windowName: popName,
					width: w,
					height: h,
					centerScreen: 1,
					scrollbars: s
				});

				f[0].target = popName;
				f[0].action = frameworkProperties.context+url;
				f[0].submit();
			},
			
			/** popup을 호출. */
			callPopup2: function(data, popName, url, w, h, t, l, s) {
				var f = $('#openUi_callForm'),
					iArr= [],
					name = null;

				if (!f.length) {
					f = $('<form id="openUi_callForm" name="openUi_callForm" method="post" onsubmit="return false;"/>');
					f.appendTo(document.body);
				}

				if(data) {
					for (name in data) {
						if(data.hasOwnProperty(name)){
							iArr.push('<input type="hidden" name="'+name+'" value="' +(data[name] || '')+ '"/>');
						}
					}
				}
				f.html(iArr.join(''));

				$.popupWindow({
					windowURL: 'about:blank',
					windowName: popName,
					width: w,
					height: h,
					top: t,
					left: l,
					scrollbars: s
				});

				f[0].target = popName;
				f[0].action = frameworkProperties.context+url;
				f[0].submit();
			}
		},


        // ----------------------------------------------------------------------- Sample Object
        freemon.hello = {
            aa : function() {
                alert('aaa');
                freemon.hello.bb();
            },
            bb : function() {
                alert('bb');
            }
        }

		/**
		 * freemonUX.js에 IE에서 안되는 이유로 설정된 메서드 옮김 
		 */
		freemon.ux = {
			projectInTalentList : function ($this, id, tmlId) {	
				var projNm = $this.find("h4").text();
				var customer = $this.data("customer");
				var workArea = $this.data("area");
				var searchStrDate = $this.data("searchdt");
				var projStrtDt = $this.data("strtdt");	// 시작일
				var projCloseDt = $this.data("closedt");	// 종료일
				var option = {
					url : "/talent/projectInTalentList",
					data : {'projNm':projNm, 'customer':customer, 'workArea':workArea, 'searchStrDate':searchStrDate, 'projStrtDt':projStrtDt, 'projCloseDt':projCloseDt},
					contentType : "application/json; charset=UTF-8",
					type : 'post',
					success : function(res, statusText) {
						freemon.ux.showPopup(id);

						$.each(res.data.talentList, function(i, data) {
							if(data.usableSkillNm) {
								data.usableSkillList = [];
								$.each(data.usableSkillNm.split(','), function(i, skillNm) {
									
									var skills = skillNm.split("|");
									
									data.usableSkillList.push({
										'skillNm' : skills[0],
										'skillCrr': skills[1]
									});
								});
							}
							
							var birthDay = data.birthDay;
							var year = parseInt(new Date().getFullYear());
							if(birthDay == "" || birthDay == null){
								data.age = 0;
								data.shortYear = "00";
							}
							else{
								data.age = (year-birthDay)+1; // 우리나라 나이 표시 +1 더함
								data.shortYear = birthDay.substr(2,4);
							}
							
							if(data.prfPhotoYn == 'Y'){
								if(data.photo){
									data.profileUrl = "/resources/images/new/no-pic.png";
								}
								else if(data.kkoProfilUrl){
									data.profileUrl = data.kkoProfilUrl;
								}
								else{
									data.profileUrl = "/resources/images/new/no-pic.png";
								}
							}
							else{
								data.profileUrl = "/resources/images/new/no-pic.png";
							}
							
							data.isGenderNm = function() {
								if(data.genderNm != '') return true;
								else return false;
							}
							
							if(parseInt(data.leaveStrtTerm) > 0){
								data.leaveStrtTermTxt = data.leaveStrtTerm + "일후";
							}
							else if(parseInt(data.leaveStrtTerm) == 0){
								data.leaveStrtTermTxt = "투입가능";
								data.leaveStrtTermCss = "on";
							}
							else{
								if(data.leaveStrtTerm < -30 || data.leaveStrtTerm == null){
									data.leaveStrtTermTxt = "투입가능";
									data.leaveStrtTermCss = "on";
								}
								else{
									data.leaveStrtTermTxt = "투입가능";
									data.leaveStrtTermCss = "on";
								}
							}
						});
						
						res.data.projNm = $this.find("h4").text();
						//res.data.projPeriod = $this.find("p").text();
						res.data.projPeriod = $this.data("strtdt").replace("-",".").replace("-",".") + " ~ " + $this.data("closedt").replace("-",".").replace("-",".");
						$(id).append(Mustache.render($(tmlId).html(), res.data));
					}
				};
				freemon.http.ajax(option);
	        },
		        
			relationInTalentList : function ($this, id, tmlId, obj) {	
				var option = {
					url : "/talent/relationInTalentList",
					data : {'userId':$this.attr("data-value")},
					contentType : "application/json; charset=UTF-8",
					type : 'post',
					success : function(res, statusText) {
						freemon.ux.showPopup(id);
						$.each(res.data.talentList, function(i, data) {
							if(data.usableSkillNm) {
								data.usableSkillList = [];
								$.each(data.usableSkillNm.split(','), function(i, skillNm) {
									
									var skills = skillNm.split("|");
									
									data.usableSkillList.push({
										'skillNm' : skills[0],
										'skillCrr': skills[1]
									});
								});
							}
							
							var birthDay = data.birthDay;
							var year = parseInt(new Date().getFullYear());
							if(birthDay == "" || birthDay == null){
								data.age = 0;
								data.shortYear = "00";
							}
							else{
								data.age = (year-birthDay)+1; // 우리나라 나이 표시 +1 더함
								data.shortYear = birthDay.substr(2,4);
							}
							
							if(data.prfPhotoYn == 'Y'){
								if(data.photo){
									data.profileUrl = "/resources/images/new/no-pic.png";
								}
								else if(data.kkoProfilUrl){
									data.profileUrl = data.kkoProfilUrl;
								}
								else{
									data.profileUrl = "/resources/images/new/no-pic.png";
								}
							}
							else{
								data.profileUrl = "/resources/images/new/no-pic.png";
							}
							
							data.isGenderNm = function() {
								if(data.genderNm != '') return true;
								else return false;
							}
							
							if(parseInt(data.leaveStrtTerm) > 0){
								data.leaveStrtTermTxt = data.leaveStrtTerm + "일후";
								data.leaveStrtTermCss = "";
							}
							else if(parseInt(data.leaveStrtTerm) == 0){
								data.leaveStrtTermTxt = "투입가능";
								data.leaveStrtTermCss = "on";
							}
							else{
								if(data.leaveStrtTerm < -30 || data.leaveStrtTerm == null){
									data.leaveStrtTermTxt = "투입가능";
									data.leaveStrtTermCss = "on";
								}
								else{
									data.leaveStrtTermTxt = "투입가능";
									data.leaveStrtTermCss = "on";
								}
							}
						});
						
						if(obj){
							// 전문기술 = 기술명 : 경력
							if(obj.usableSkillNm) {
								obj.usableSkillList = [];
								$.each(obj.usableSkillNm.split(','), function(i, skillNm) {
									
									var skills = skillNm.split("|");
									
									obj.usableSkillList.push({
										'skillNm' : skills[0],
										'skillCrr': skills[1]
									});
								});
							}
							
							if(parseInt(obj.leaveStrtTerm) > 0){
								obj.leaveStrtTermTxt = obj.leaveStrtTerm + "일후";
							}
							else if(parseInt(obj.leaveStrtTerm) == 0){
								obj.leaveStrtTermTxt = "투입가능";
								obj.leaveStrtTermCss = "on";
							}
							else{
								if(obj.leaveStrtTerm < -30 || obj.leaveStrtTerm == null){
									obj.leaveStrtTermTxt = "투입가능";
									obj.leaveStrtTermCss = "on";
								}
								else{
									obj.leaveStrtTermTxt = "투입가능";
									obj.leaveStrtTermCss = "on";
								}
							}
							
							var kkoPrfUrl = "/resources/images/new/no-pic.png";
							if(obj.prfPhotoYn == 'Y'){
								if(obj.photo){ obj.profileUrl = "/resources/images/new/no-pic.png"; }
								else if(obj.kkoProfilUrl){ obj.profileUrl = obj.kkoProfilUrl; }
								else{ obj.profileUrl = "/resources/images/new/no-pic.png"; }
								
								if(obj.kkoPrfUrl != null && obj.kkoPrfUrl != ""){
									kkoPrfUrl = obj.kkoPrfUrl;
								}
							}
							else{
								obj.profileUrl = "/resources/images/new/no-pic.png";
							}
							
							var birthDay = obj.birthDay;
							var year = parseInt(new Date().getFullYear());
							var age = 0;
							if(birthDay != "" && birthDay != null){
								age = (year-birthDay)+1; // 우리나라 나이 표시 +1 더함
							}
							
							if(!obj.totalWorkCareer == " ") obj.totalWorkCareer = "0년";
							
							res.data.userNm = obj.userNm;
							res.data.usableSkillList = obj.usableSkillList;
							res.data.usableSkillNm = obj.usableSkillNm;
							res.data.totalWorkCareer = obj.totalWorkCareer;
							res.data.hopeAreaNm = obj.hopeAreaNm;
							res.data.leaveStrtTermTxt = obj.leaveStrtTermTxt;
							res.data.leaveStrtTermCss = obj.leaveStrtTermCss;
							res.data.profileUrl = obj.profileUrl;
//							res.data.kkoPrfUrl = (obj.kkoPrfUrl != null && obj.kkoPrfUrl != "") ? obj.kkoPrfUrl : "/resources/images/new/no-pic.png";
							res.data.kkoPrfUrl = kkoPrfUrl;
							res.data.genderNm = obj.gender;
							res.data.isGenderNm = function() {
								if(obj.gender != '') return true;
								else return false;
							}
							res.data.age = age;
						}
						$(id).append(Mustache.render($(tmlId).html(), res.data));
					}
				};
				freemon.http.ajax(option);
	        },
			        
			sliderSetValue : function(ev){
	        	var sVal = ev.newValue[0];
		    	var eVal = ev.newValue[1];
		    	if(isNaN(sVal)) sVal = 1;
		    	if(isNaN(eVal)) eVal = 50;
		    	$(".setRangeValue").parent().addClass("active");
		    	
		    	if(sVal <= 5 && eVal > 21){
		    		$(".setRangeValue").eq(0).parent().removeClass("active");
		    		$(".setRangeValue").eq(1).parent().removeClass("active");
		    		$(".setRangeValue").eq(2).parent().removeClass("active");
		    		$(".setRangeValue").eq(3).parent().removeClass("active");
		    		$(".setRangeValue").eq(4).parent().removeClass("active");
		    	}
		    	else if((sVal > 5 && sVal <= 10) && eVal > 21){
		    		$(".setRangeValue").eq(0).parent().removeClass("active");
		    		$(".setRangeValue").eq(5).parent().removeClass("active");
		    	}
		    	else if((sVal > 10 && sVal <= 15) && eVal > 21){
		    		$(".setRangeValue").eq(0).parent().removeClass("active");
		    		$(".setRangeValue").eq(1).parent().removeClass("active");
		    		$(".setRangeValue").eq(5).parent().removeClass("active");
		    	}
		    	else if((sVal > 15 && sVal <= 20) && eVal > 21){
		    		$(".setRangeValue").eq(0).parent().removeClass("active");
		    		$(".setRangeValue").eq(1).parent().removeClass("active");
		    		$(".setRangeValue").eq(2).parent().removeClass("active");
		    		$(".setRangeValue").eq(5).parent().removeClass("active");
		    	}
		    	else if(sVal > 20 && eVal > 21){
		    		if(sVal == 22){
		    			$(".setRangeValue").eq(0).parent().removeClass("active");
			    		$(".setRangeValue").eq(1).parent().removeClass("active");
			    		$(".setRangeValue").eq(2).parent().removeClass("active");
			    		$(".setRangeValue").eq(3).parent().removeClass("active");
			    		$(".setRangeValue").eq(4).parent().removeClass("active");
		    		}
		    		else{
		    			$(".setRangeValue").eq(0).parent().removeClass("active");
			    		$(".setRangeValue").eq(1).parent().removeClass("active");
			    		$(".setRangeValue").eq(2).parent().removeClass("active");
			    		$(".setRangeValue").eq(3).parent().removeClass("active");
			    		$(".setRangeValue").eq(5).parent().removeClass("active");	
		    		}
		    	}
		    	else if(sVal <= 5 && (eVal > 20 && eVal < 22)) {
		    		$(".setRangeValue").eq(5).parent().removeClass("active");	
		    	}
		    	else if(sVal <= 5 && (eVal > 15 && eVal <= 20)) {
		    		$(".setRangeValue").eq(5).parent().removeClass("active");
		    		$(".setRangeValue").eq(4).parent().removeClass("active");
		    	}
		    	else if(sVal <= 5 && (eVal > 10 && eVal <= 15)) {
		    		$(".setRangeValue").eq(5).parent().removeClass("active");
		    		$(".setRangeValue").eq(4).parent().removeClass("active");
		    		$(".setRangeValue").eq(3).parent().removeClass("active");
		    	}
		    	else if(sVal <= 5 && (eVal > 5 && eVal <= 10)) {
		    		$(".setRangeValue").eq(5).parent().removeClass("active");
		    		$(".setRangeValue").eq(4).parent().removeClass("active");
		    		$(".setRangeValue").eq(3).parent().removeClass("active");
		    		$(".setRangeValue").eq(2).parent().removeClass("active");
		    	}
		    	else if(sVal <= 5 && (eVal > 0 && eVal <= 5)) {
		    		$(".setRangeValue").eq(5).parent().removeClass("active");
		    		$(".setRangeValue").eq(4).parent().removeClass("active");
		    		$(".setRangeValue").eq(3).parent().removeClass("active");
		    		$(".setRangeValue").eq(2).parent().removeClass("active");
		    		$(".setRangeValue").eq(1).parent().removeClass("active");
		    	}
		    	else if((sVal > 5 && sVal <= 10) && (eVal > 20 && eVal <= 21)){
		    		$(".setRangeValue").eq(5).parent().removeClass("active");
		    		$(".setRangeValue").eq(0).parent().removeClass("active");
		    	}
		    	else if((sVal > 5 && sVal <= 10) && (eVal > 15 && eVal <= 20)){
		    		$(".setRangeValue").eq(5).parent().removeClass("active");
		    		$(".setRangeValue").eq(4).parent().removeClass("active");
		    		$(".setRangeValue").eq(0).parent().removeClass("active");
		    	}
		    	else if((sVal > 5 && sVal <= 10) && (eVal > 10 && eVal <= 15)){
		    		$(".setRangeValue").eq(5).parent().removeClass("active");
		    		$(".setRangeValue").eq(4).parent().removeClass("active");
		    		$(".setRangeValue").eq(3).parent().removeClass("active");
		    		$(".setRangeValue").eq(0).parent().removeClass("active");
		    	}
		    	else if((sVal > 5 && sVal <= 10) && (eVal > 5 && eVal <= 10)){
		    		$(".setRangeValue").eq(5).parent().removeClass("active");
		    		$(".setRangeValue").eq(4).parent().removeClass("active");
		    		$(".setRangeValue").eq(3).parent().removeClass("active");
		    		$(".setRangeValue").eq(2).parent().removeClass("active");
		    		$(".setRangeValue").eq(0).parent().removeClass("active");
		    	}
		    	// 11년 이상
		    	else if((sVal > 10 && sVal <= 15) && (eVal > 20 && eVal <= 21)){
		    		$(".setRangeValue").eq(5).parent().removeClass("active");
		    		$(".setRangeValue").eq(1).parent().removeClass("active");
		    		$(".setRangeValue").eq(0).parent().removeClass("active");
		    	}
		    	else if((sVal > 10 && sVal <= 15) && (eVal > 15 && eVal <= 20)){
		    		$(".setRangeValue").eq(5).parent().removeClass("active");
		    		$(".setRangeValue").eq(4).parent().removeClass("active");
		    		$(".setRangeValue").eq(1).parent().removeClass("active");
		    		$(".setRangeValue").eq(0).parent().removeClass("active");
		    	}
		    	else if((sVal > 10 && sVal <= 15) && (eVal > 10 && eVal <= 15)){
		    		$(".setRangeValue").eq(5).parent().removeClass("active");
		    		$(".setRangeValue").eq(4).parent().removeClass("active");
		    		$(".setRangeValue").eq(3).parent().removeClass("active");
		    		$(".setRangeValue").eq(1).parent().removeClass("active");
		    		$(".setRangeValue").eq(0).parent().removeClass("active");
		    	}
		    	else if((sVal > 15 && sVal <= 20) && (eVal > 20 && eVal <= 21)){
		    		$(".setRangeValue").eq(5).parent().removeClass("active");
		    		$(".setRangeValue").eq(2).parent().removeClass("active");
		    		$(".setRangeValue").eq(1).parent().removeClass("active");
		    		$(".setRangeValue").eq(0).parent().removeClass("active");
		    	}
		    	else if((sVal > 15 && sVal <= 20) && (eVal > 15 && eVal <= 20)){
		    		$(".setRangeValue").eq(5).parent().removeClass("active");
		    		$(".setRangeValue").eq(4).parent().removeClass("active");
		    		$(".setRangeValue").eq(2).parent().removeClass("active");
		    		$(".setRangeValue").eq(1).parent().removeClass("active");
		    		$(".setRangeValue").eq(0).parent().removeClass("active");
		    	}
		    	else if(sVal > 20 && (eVal > 15 && eVal <= 20)){
		    		$(".setRangeValue").eq(5).parent().removeClass("active");
		    		$(".setRangeValue").eq(3).parent().removeClass("active");
		    		$(".setRangeValue").eq(2).parent().removeClass("active");
		    		$(".setRangeValue").eq(1).parent().removeClass("active");
		    		$(".setRangeValue").eq(0).parent().removeClass("active");
		    	}
			},
			
			sliderSetButtonValue : function(slider, $this, index){
	        	var hasClass0 = $(".setRangeValue").eq(0).parent().hasClass("active");
		    	var hasClass1 = $(".setRangeValue").eq(1).parent().hasClass("active");
		    	var hasClass2 = $(".setRangeValue").eq(2).parent().hasClass("active");
		    	var hasClass3 = $(".setRangeValue").eq(3).parent().hasClass("active");
		    	var hasClass4 = $(".setRangeValue").eq(4).parent().hasClass("active");
		    	var hasClass5 = $(".setRangeValue").eq(5).parent().hasClass("active");
		    	
		    	//경력무관이라면
	  	    	if(index == $(".setRangeValue").length-1){
		    		$(".setRangeValue").parent().removeClass("active");
		    		$this.parent().addClass("active");
		    	}
		    	else{ 
		    		// 경력무관은 remove class
		    		$(".setRangeValue").eq(5).parent().removeClass("active");
		    		if($this.parent().hasClass("active")){
		    			switch(index){
			    			case 0:
		    					if(!hasClass1 && !hasClass2 && !hasClass3 && !hasClass4 && !hasClass5){
		    						$(".setRangeValue").eq(5).parent().addClass("active");
		    					}
		    					else{
		    						$this.parent().removeClass("active");
		    					}
			    				break;
		    				case 1:
			    				if(hasClass0 && hasClass1 && hasClass2){
			    					$(".setRangeValue").parent().removeClass("active");
			    					$(".setRangeValue").eq(1).parent().addClass("active");
			    				}
			    				else{
			    					$this.parent().removeClass("active");
			    				}
			    				break;
			    			case 2:
			    				if(hasClass0 && hasClass1 && hasClass2 && hasClass3){
			    					$(".setRangeValue").parent().removeClass("active");
			    					$(".setRangeValue").eq(2).parent().addClass("active");
			    				}
			    				else if(hasClass0 && hasClass1 && hasClass2 && hasClass3 && hasClass4){
			    					$(".setRangeValue").parent().removeClass("active");
			    					$(".setRangeValue").eq(2).parent().addClass("active");
			    				}
			    				else if(hasClass1 && hasClass2 && hasClass3){
			    					$(".setRangeValue").parent().removeClass("active");
			    					$(".setRangeValue").eq(2).parent().addClass("active");
			    				}
			    				else{
			    					$this.parent().removeClass("active");
			    				}
			    				break;
			    			case 3:
			    				if(hasClass1 && hasClass2 && hasClass3 && hasClass4){
			    					$(".setRangeValue").parent().removeClass("active");
			    					$(".setRangeValue").eq(3).parent().addClass("active");
			    				}
			    				else if(hasClass2 && hasClass3 && hasClass4){
			    					$(".setRangeValue").parent().removeClass("active");
			    					$(".setRangeValue").eq(3).parent().addClass("active");
			    				}
			    				else{
			    					$this.parent().removeClass("active");
			    				}
			    				break;
			    			default:
			    				$this.parent().removeClass("active");
			    				break;
		    			}
			    	}
			    	else{
			    		$this.parent().addClass("active");	
			    	}	
		    	}
		    	
	  	    	if(!$("ul.range_list li").hasClass("active")){
	  	    		$(".setRangeValue").eq(5).parent().addClass("active");
	  	    	}

		    	var hasValue = [];
		    	$.each($(".setRangeValue"), function(i, data){
		    		if($(".setRangeValue").eq(i).parent().hasClass("active")){		    			
		    			//var val = JSON.parse(data.dataset.value);
		    			var val = $.parseJSON(data.getAttribute('data-value'));
		    			hasValue.push({'min' : val[0], 'max' : val[1]});
		    		}
				});
		    	var a = hasValue[0].min;
		    	var b = hasValue[hasValue.length-1].max;
		    	
		    	
		    	
		    	//선택한값이 경력무관과 같으면
		    	if(slider.options.min == a && slider.options.max == b) {
		    		$(".setRangeValue").parent().removeClass("active");
		    		$(".setRangeValue").eq(5).parent().addClass("active");
		    	}
		    	else{
		    		if(a == 1 && b == 15 ){
		    			//$(".setRangeValue").eq(0).parent().addClass("active");
		    			if(!$(".setRangeValue").eq(1).parent().hasClass("active")){
		    				$(".setRangeValue").eq(1).parent().addClass("active");
		    			}
		    		}
		    		else if(a == 1 && b == 20){
		    			if(!$(".setRangeValue").eq(1).parent().hasClass("active")){
		    				$(".setRangeValue").eq(1).parent().addClass("active");
		    			}
		    			if(!$(".setRangeValue").eq(2).parent().hasClass("active")){
		    				$(".setRangeValue").eq(2).parent().addClass("active");
		    			}
		    		}
		    		else if(a == 6 && b == 20){
		    			if(!$(".setRangeValue").eq(2).parent().hasClass("active")){
		    				$(".setRangeValue").eq(2).parent().addClass("active");
		    			}
		    		}
		    		else if(a == 6 && b == 22){
		    			if(!$(".setRangeValue").eq(2).parent().hasClass("active")){
		    				$(".setRangeValue").eq(2).parent().addClass("active");
		    			}
		    			if(!$(".setRangeValue").eq(3).parent().hasClass("active")){
		    				$(".setRangeValue").eq(3).parent().addClass("active");
		    			}
		    		}
		    		else if(a == 11 && b == 22){
		    			if(!$(".setRangeValue").eq(3).parent().hasClass("active")){
		    				$(".setRangeValue").eq(3).parent().addClass("active");
		    			}
		    		}
		    	}
		    	
		    	return [a,b]
	        },
	        
	        setMonths : function(month, searchStrDate) {
	        	var monthArr = [];
				var chartTerm = month;
				j = -(Math.floor(chartTerm/2));
				
				var parts = searchStrDate.split('-');
				for(var i = 0; i < chartTerm; i++) {
					if(searchStrDate) {
						if(parts[2] > 28){
							var initDate = new Date(parts[0], parts[1] - 1, parts[2]-3);
						}
						else{
							var initDate = new Date(parts[0], parts[1] - 1, parts[2]);
						}
					} else {
						var initDate = new Date();
					}
					var date = freemon.util.addDate(initDate, 2, j);
					
					date.setDate(1);
					
					/**
					 * 현재달 표시
					 */
					var nowDate = new Date();
					var scDate = new Date(parts[0], parseInt(parts[1]) - 1, parts[2]);
					var nowDateCheck = false;
					if(nowDate.getFullYear() == date.getFullYear() && nowDate.getMonth() == date.getMonth()){
						if(scDate.getFullYear() == nowDate.getFullYear() &&  scDate.getMonth() == nowDate.getMonth()) nowDateCheck = false;
						else nowDateCheck = true;
					}
					
					monthArr.push({
						'day' : freemon.util.getStringFromDate(date),
						'date' : date,
						'month' : freemon.string.lpad("" + (date.getMonth() + 1), 2, '0'),
						'now' : nowDateCheck
					});
					j++;
				}
				
				return {'month':chartTerm, 'monthList':monthArr};
	        },
	        
	        alertLayer : function(title, message, isButton, btnTitle, func, param, link, fontsize){
	        	freemon.ux.showPopup('#popAlertData');
	        	
	        	if(title != null) $("#popAlertData > .pop > .pop_header h3").text(title);
	        	if(message != null) $("#popAlertData > .pop > .pop_body div.no_page_tit").html(message);
	        	if(isButton != null) {
	        		var html = '<button class="btn_normal btn_blue" onClick="' + func + '(' + param + ');">' + btnTitle + '</button>';
	        			html += ' ';
	        			html += '<button class="btn_normal btn_gray" onClick="freemon.ux.close(\'' + link + '\');">취소</button>';
	        		$("#popAlertData > .pop > .pop_body div.btn_pop_box").html(html);
	        	}
	        	else{
	        		$("#popAlertData > .pop > .pop_body div.btn_pop_box").html('<button class="btn_normal btn_gray" onClick="freemon.ux.close(\'' + link + '\');">닫기</button>');
	        	}
	        	if(link != null) {
	        		$(".pop_bg > div.pop > div.pop_header > a.close").attr("href", link);
	        	}
	        	else{
	        		$(".pop_bg > div.pop > div.pop_header > a.close").attr("href", "#none");
	        	}
	        	if(fontsize != null || fontsize != undefined) {
	        		$("#popAlertData > .pop > .pop_body div.no_page_tit").css("font-size", "24px");
	        		$("#popAlertData > .pop > .pop_body div.no_page_tit").css("line-height", "30px");
	        	}
	        },
	        
	        close : function(link){
	        	freemon.ux.hidePopup('#popAlertData');
	        	
	        	if(link != null && link != 'null'){
	        		document.location.href = link;
	        	}
	        },
	        
	        isMobileCheck : function(){
				var filter = "win16|win32|win64|macintel|mac|linux x86_64";
				if (navigator.platform && filter.indexOf(navigator.platform.toLowerCase()) >= 0) {
					// 모바일 에이전트 구분
					var isMobile = {
					        Android: function () {
					                 return navigator.userAgent.match(/Android/i) == null ? false : true;
					        },
					        BlackBerry: function () {
					                 return navigator.userAgent.match(/BlackBerry/i) == null ? false : true;
					        },
					        IOS: function () {
					                 return navigator.userAgent.match(/iPhone|iPad|iPod/i) == null ? false : true;
					        },
					        Opera: function () {
					                 return navigator.userAgent.match(/Opera Mini/i) == null ? false : true;
					        },
					        Windows: function () {
					                 return navigator.userAgent.match(/IEMobile/i) == null ? false : true;
					        },
					        any: function () {
					                 return (isMobile.Android() || isMobile.BlackBerry() || isMobile.IOS() || isMobile.Opera() || isMobile.Windows());
					        }
					};
					if(isMobile.Android() || isMobile.BlackBerry() || isMobile.IOS() || isMobile.Opera() || isMobile.Windows()){
						return true;
					}
					else{
						return false;
					}
				}
				else{
					return true;
				}
	        },
	        
	        isMoreView : function(paging){
	        	if(paging.totalPageCnt > paging.pageNo)	{$(".more_box").show(); return true;}
				else {$(".more_box").hide(); return false;}
	        },
	        
	        showPopup : function(element){
	        	var offsetY = window.pageYOffset;
	        	var obj = $("body").offset();
	        	if(offsetY != 0){
                    $('body').css({
                            'position': 'fixed',
                            'top': -offsetY + 'px',
                            'height': '100%',
                            'width': '100%'
                    });
	        	}
	        	else{
                    $('body').css({
                            'position': 'fixed',
                            'top': obj.top + 'px',
                            'height': '100%',
                            'width': '100%'
                    });
	        	}
	        	$(element).show();
	        },
	       
	        hidePopup : function(element){
	            var offsetY = window.pageYOffset;
	        	var obj = $("body").offset();
	        	$('body').css({
	                'position': 'static'
	            });
	            if(offsetY != 0){
	        	    $(window).scrollTop(offsetY);
	        	}
	        	else{
	        	    $(window).scrollTop(-(obj.top));
	        	}
	        	$(element).scrollTop(0);
				$(element).hide();
	        },
	        
	        dayInSelectMonth : function(strDay, today){
	        	strDay = strDay.replace("-","").replace("-","");
	        	if(!today) today = $.datepicker.formatDate('yy-mm-dd', new Date());
		    	var yy = strDay.substr(0,4);
		    	var mm = strDay.substr(4,2);
		    	var dd = today.substr(8,2);
		    	var last = freemon.util.daysInMonth(mm, yy);
		    	if(last < dd) dd = last;
		    	
		    	return (yy + "-" + mm + "-" + dd);
	        },
	        
	        alert : function(message){
	        	freemon.ux.showPopup('#popAlertData');
	        	
	        	if(message != null){
	        		message = message.replace("\n","<br/>").replace("\n","<br/>");
	        		$("#popAlertData > .pop > .pop_body div.no_page_tit").html(message);
	        	}
	        	$("#popAlertData > .pop > .pop_body div.btn_pop_box").html('<button class="btn_normal btn_gray" onClick="freemon.ux.alertClose();">닫기</button>');
	        },
	        
	        alertClose : function(link){
	        	freemon.ux.hidePopup('#popAlertData');
	        },
	        confirm : function(message, yesCallback, noCallback) {
	        	message = message.replace("\n","<br/>").replace("\n","<br/>");

	        	$("#popAlertData > .pop > .pop_body div.no_page_tit").html(message);
	        	var html = '';
	        	html += '<button class="btn_normal btn_blue" id="btnYes">확인</button>';
    			html += ' ';
    			html += '<button class="btn_normal btn_gray" id="btnNo">취소</button>';
    			$("#popAlertData > .pop > .pop_body div.btn_pop_box").html(html);
    			
    			freemon.ux.showPopup('#popAlertData');
    		
	            $('#btnYes').click(function() {
	            	freemon.ux.hidePopup('#popAlertData');
	                yesCallback();
	            });
	            $('#btnNo').click(function() {
	            	freemon.ux.hidePopup('#popAlertData');
	                noCallback();
	            });
	            
	            return false;
	        },
	        confirmExclusive : function(message, yesCallback, noCallback) {
	        	message = message.replace("\n","<br/>").replace("\n","<br/>");

	        	$("#popAlertData > .pop > .pop_body div.no_page_tit").html(message);
	        	var html = '';
	        	html += '<button class="btn_normal btn_blue" id="btnYes">요청 취소</button>';
    			html += ' ';
    			html += '<button class="btn_normal btn_gray" id="btnNo">닫기</button>';
    			$("#popAlertData > .pop > .pop_body div.btn_pop_box").html(html);
    			
    			freemon.ux.showPopup('#popAlertData');
    		
	            $('#btnYes').click(function() {
	            	freemon.ux.hidePopup('#popAlertData');
	                yesCallback();
	            });
	            $('#btnNo').click(function() {
	            	freemon.ux.hidePopup('#popAlertData');
	                noCallback();
	            });
	            
	            return false;
	        },
          getThisWeek : function (){
            var now = new Date(); 
            var nowDay = now.getDate(); 
            var nowMonth = now.getMonth(); 
            var nowYear = now.getYear();
            nowYear += (nowYear < 2000) ? 1900 : 0; 
            var weekStartDate = new Date(nowYear, nowMonth, nowDay - 6);
            var weekEndDate = new Date(nowYear, nowMonth, nowDay);

            return [
              freemon.util.getDateString(weekStartDate,"-"),
              freemon.util.getDateString(weekEndDate,"-")
            ];
          },
          getPreviousWeek : function(date1){
            var parts = date1.split('-');
            var now = new Date(parts[0], parseInt(parts[1])-1, parseInt(parts[2])); 
            var nowDay = now.getDate(); 
            var nowMonth = now.getMonth(); 
            var nowYear = now.getYear(); 
            nowYear += (nowYear < 2000) ? 1900 : 0; 

            var weekStartDate = new Date(nowYear, nowMonth, nowDay - 7); 
            var weekEndDate = new Date(nowYear, nowMonth, nowDay - 1);

            return [
              freemon.util.getDateString(weekStartDate,"-"),
              freemon.util.getDateString(weekEndDate,"-")
            ];
	        },
	        getChangeDate : function(date1, type){
	        	var value = [];
	        	var formatDate = function(date){
	        		var myMonth = date.getMonth()+1; 
        	     	var myWeekDay = date.getDate();
        	       
        	       	var addZero = function(num){
        	       		if (num < 10){
        	       			num = "0"+num;
        	       		}
        	       		return num;
        	       	}
        	       	var md = addZero(myMonth) + "-" + addZero(myWeekDay);
        	       
        	       	return md;
	        	}
        	   
	        	var parts = date1.split('-');
        	    var now = new Date(parts[0], parseInt(parts[1])-1, parseInt(parts[2])); 
        	    var nowDayOfWeek = now.getDay(); 
        	    var nowDay = now.getDate(); 
        	    var nowMonth = now.getMonth(); 
        	    var nowYear = now.getYear(); 
        	    nowYear += (nowYear < 2000) ? 1900 : 0; 
        	    
        	    if (type === 'yesterday') {
        	    	dayStartDate = new Date(nowYear, nowMonth, nowDay - 1);
        	    }else if (type === 'tomorrow') {
        	    	dayStartDate = new Date(nowYear, nowMonth, nowDay + 1);
        	    }
        	    var dayEndDate = dayStartDate;
        	    value.push(freemon.util.getDateString(dayStartDate,"-"));
        	    value.push(freemon.util.getDateString(dayEndDate,"-"));
        	    
        	    
        	         
        	    return value;
	        },
	        customCenterText : function(){
	        	return "<br/>고객센터 : <a href='tel:1899-2951' style='color:#666'>1899-2951</a>";
	        },
	        toggleExclusiveTalent : function($this) {
				var nm = $this.data("nm");
				var fno = $this.data("value");
				
				var option = {
					url : "/talent/toggleExclusiveTalent",
					data : {'userId': fno, 'userNm':nm},
					contentType : "application/json; charset=UTF-8",
					type : 'post',
					success : function(res, statusText) {
						if(res.data.exclusiveYn == 'Y'){
							if(res.data.userYn == "N"){
								freemon.ux.confirmExclusive(res.data.message,
								    function() {
										var option = {
											url : "/talent/companyExclusiveCancel",
											data : {'userId': fno, 'userNm':nm},
											contentType : "application/json; charset=UTF-8",
											type : 'post',
											success : function(res, statusText) {
												freemon.ux.alert(res.data.message);
											}
										};
										freemon.http.ajax(option);
								    },
								    function() {
								    }
								);
								return false;
							}
							else{
								freemon.ux.alert(res.data.message);
								if($this.data("yn") === 'Y'){
									$this.parent().removeClass('active');
								}
							}
						}
						else{
							freemon.ux.alert(res.data.message);
						}
					}
				};
				freemon.http.ajax(option);
			},
			projectShareKakao : function(param){
				try {
					var projContents = "기간 : " + param.projTerm + "개월(" + param.projStrtDt + " ~ " + param.projCloseDt + "), " + param.projAddr + ", " + param.recruitSkillNm;
					var link = "https://m.freemon.co.kr/m/project/projectDetail?project=" + param.projIdx;
					var imageURL = "https://www.freemon.co.kr/resources/images/new/freemon_ad_mobile_url.jpg";
					var jsonString = "{\"message\":\"share\", \"title\":\"" + param.projNm + "\", \"desc\":\"" + projContents + "\", \"imageURL\":\"" + imageURL + "\", \"link\":\"" + link + "\"}";
					
					if( /Android/i.test(navigator.userAgent)) {
						freemon_app.fnKaKaoShare(jsonString);
					}
					else if (/iPhone|iPad|iPod/i.test(navigator.userAgent)) {
						window.webkit.messageHandlers.nativeKakaoLogin.postMessage(jsonString);	
					}
					else {
						freemon_app.fnKaKaoShare(jsonString);
					}
					
					freemon.ux.shareRecordbehavior(param);
					return false;
				} catch(err) {
					console.log(err);
				}
				freemon.ux.projectShareWeb(param);
			},
			projectShareWeb : function(param, tmpId){
				var projContents = "기간 : " + param.projTerm + "개월, " + param.projAddr;
				
			    Kakao.Link.sendCustom({
			    	templateId: 15853,
			        templateArgs: {
			        	'projNm' : param.projNm,
			        	'projContents' : projContents,
			          	'url': "m/project/projectDetail?project=" + param.projIdx
			        },
			    	success : function(messageObj){
				    },
			    	callback : function(){
			    		freemon.ux.shareRecordbehavior(param);
			    	}
			    });
			},
			shareRecordbehavior : function(param){
				var option = {
					url : "/project/shareRecordbehavior",
					data : param, 
					contentType : "application/json; charset=UTF-8",
					type : 'post',
					success : function(res, statusText) {
						console.log("done");
					}
				};
				freemon.http.ajax(option);
			},
			talentDetail : function(obj){
				var talentList = obj.talentList[0];		
				
				if(talentList.prfPhotoYn == 'Y'){
					if(talentList.photo){
						talentList.profileUrl = "/resources/images/new/no-pic.png";
					}
					else if(talentList.kkoProfilUrl){
						talentList.profileUrl = talentList.kkoProfilUrl;
					}
					else{
						talentList.profileUrl = "/resources/images/new/no-pic.png";
					}
				}
				else{
					talentList.profileUrl = "/resources/images/new/no-pic.png";
				}
				
				if(parseInt(talentList.leaveStrtTerm) > 0){
					talentList.leaveStrtTermTxt = talentList.leaveStrtTerm + "일후";
				}
				else if(parseInt(talentList.leaveStrtTerm) == 0){
					talentList.leaveStrtTermTxt = "투입가능";
					talentList.leaveStrtTermCss = "on";
				}
				else{
					if(talentList.leaveStrtTerm < -30 || talentList.leaveStrtTerm == null){
						talentList.leaveStrtTermTxt = "투입가능";
						talentList.leaveStrtTermCss = "on";
					}
					else{
						talentList.leaveStrtTermTxt = "투입가능";
						talentList.leaveStrtTermCss = "on";
					}
				}
				
				talentList.isGenderNm = function() {
					if(talentList.gender != '' && talentList.gender != null) return true;
					else return false;
				}
				
				talentList.IsinterestYn = function(){
					if(talentList.interestYn == "Y")
						return true;
					else
						return false;
				}
				talentList.isExclusiveYn = function(){
					if(talentList.exclusiveYn == "Y") return true;
					else return false;
				}
				talentList.memoYN = function(){
					if(talentList.memo != '' && talentList.memo != null)
						return true;
					else return false;
				}
				////////////////////////////////////
				////// 이력부분
				////////////////////////////////////
				var projectEndDate = null;
				var isFirst = false;
				var yearArr = [];
				var iCnt = 0;
				var careerArray = [];
				var distinctList = [];
				
				$.each(talentList.careerList, function(i, data){
					if(data.strtDt == null) data.strtDt = "";
					if(data.endDt == null) data.endDt = "";
					if(i==0){
						projectEndDate = data.endDt;
						isFirst = true;
					}
					
					if(data.customer == ".") data.customer = "";
					if(data.jobPos == ".") data.jobPos = "";
					if(data.lang == ".") data.lang = "";
					
					if(data.projectDtl != null && data.projectDtl != '') {
						data.projectDtl = data.projectDtl.replace(/(?:\r\n|\r|\n)/g, '<br />');
					}
					if(data.role != null && data.role != '') {
						data.role = data.role.replace(/(?:\r\n|\r|\n)/g, '<br />');
					}
					if(data.etc != null && data.etc != '') {
						data.etc = data.etc.replace(/(?:\r\n|\r|\n)/g, '<br />');
					}
					
					if(data.endDt.substring(0,4) == projectEndDate.substring(0,4)){
						var year = parseInt(data.prtcptTerm/12)
                    	var month = parseInt(data.prtcptTerm%12)
                    	
                    	if(month == 12) date = (year + 1) + "년";
    					else if(month == 0 ) date = year + "년";
    					else if(year == 0 ) date = month + "개월";
    					else date = year + "년" + month + "개월";
						
						careerArray.push({
							strtDt : data.strtDt.substring(0, 7),
							endDt : data.endDt.substring(0, 7),
							customer : data.customer,
							jobPos : data.jobPos, 
							projNm : data.projNm,
							lang : data.lang,
							dbms : data.dbms,
							framework : data.framework,
							os : data.os,
							devTool : data.devTool,
							role : data.role, 
							projectDtl : data.projectDtl,
							devFieldInd : data.devFieldInd, 
							devFieldApp : data.devFieldApp, 
							comm : data.comm, 
							kinds : data.kinds, 
							etc : data.etc, 
							date : date, 
							isCustomer : (data.customer) ? true : false, 
							isJobPos : (data.jobPos) ? true : false, 
							isDbms : (data.dbms) ? true : false,
							isFramework : (data.framework) ? true : false,
							isOs : (data.os) ? true : false,
							isLang : (data.lang) ? true : false,
							isDevTool :(data.devTool)? true : false,
							isprojectDtl : (data.projectDtl) ? true : false, 
							isRole : (data.role) ? true : false,
							isEtc : (data.etc) ? true : false
						});
						
					}else{
						yearArr.push({
							'isFirst' : isFirst,
							'i' : ++iCnt,
							'year' : projectEndDate.substring(0,4)
						});
						
						distinctList.push({
							year : projectEndDate.substring(0,4),
							iCnt : iCnt,
							careerArray : careerArray
						});
											
						isFirst = false;
						
						projectEndDate = data.endDt;
						
						careerArray = [];
						
						
						var year = parseInt(data.prtcptTerm/12)
                    	var month = parseInt(data.prtcptTerm%12)
                    	
                    	if(month == 12) date = (year + 1) + "년";
    					else if(month == 0 ) date = year + "년";
    					else if(year == 0 ) date = month + "개월";
    					else date = year + "년" + month + "개월";
						
						careerArray.push({
							strtDt : data.strtDt.substring(0, 7),
							endDt : data.endDt.substring(0, 7),
							customer : data.customer,
							jobPos : data.jobPos, 
							projNm : data.projNm,
							lang : data.lang,
							dbms : data.dbms,
							framework : data.framework,
							os : data.os,
							devTool : data.devTool, 
							projectDtl : data.projectDtl,
							role : data.role, 
							isprojectDtl : data.isprojectDtl, 
							devFieldInd : data.devFieldInd, 
							devFieldApp : data.devFieldApp, 
							comm : data.comm, 
							kinds : data.kinds, 
							etc : data.etc, 
							date : date, 
							isCustomer : (data.customer) ? true : false,
							isJobPos : (data.jobPos) ? true : false, 
							isDbms : (data.dbms) ? true : false,
							isFramework : (data.framework) ? true : false,
							isOs : (data.os) ? true : false,
							isLang : (data.lang) ? true : false,
							isDevTool :(data.devTool)? true : false,
							isprojectDtl : (data.projectDtl) ? true : false, 
							isRole : (data.role) ? true : false,
							isEtc : (data.etc) ? true : false
						});
					}
					if(i == talentList.careerList.length - 1){
						yearArr.push({
							'isFirst' : isFirst,
							'i' : ++iCnt,
							'year' : careerArray[0].year == undefined ? data.endDt.substring(0,4) : ""
						});
						
						distinctList.push({
							year : careerArray[0].year == undefined ? data.endDt.substring(0,4) : "",
							iCnt : iCnt,
							careerArray : careerArray
						});
					}
				});
				talentList.careerList = distinctList;
				talentList.yearArr = yearArr;
				talentList.isCareerList = function(){
					if(talentList.careerList.length > 0) return true;
					else return false;
				}
				
				////////////////////////////////////
				////// 학력
				////////////////////////////////////
				$.each(talentList.schoolList, function(i, data){
					if(data.entrncDt == null) data.entrncDt = "";
					if(data.finishDt == null) data.finishDt = "";
					data.entrncDt = data.entrncDt.substr(0,7);
					data.finishDt = data.finishDt.substr(0,7);
					data.isEntrncFinish = function(){
						if(data.entrncDt != "" && data.finishDt != "") return true;
						else return false;
					}
					if(i == 0){
						talentList.schoolNm = data.schoolNm;
						talentList.major = data.major;
					}
				});
				
				$.each(talentList.schoolList, function(i, data){
					if(data.eduStrtDt == null) data.eduStrtDt = "";
					if(data.eduEndDt == null) data.eduEndDt = "";
					data.eduStrtDt = data.eduStrtDt.replace("-",".").replace("-",".");
					data.eduEndDt = data.eduEndDt.replace("-",".").replace("-",".");
				});
				talentList.isSchoolList = function(){
					if(talentList.schoolList.length > 0) return true;
					else return false;
				}
				
				$.each(talentList.certificationList, function(i, data){
					if(data.acqrDt == null) data.acqrDt = "";
					else data.acqrDt = data.acqrDt.substr(0, 7);
					data.acqrDt = data.acqrDt.replace("-",".").replace("-",".");
				});
				talentList.isCertificationList = function(){
					if(talentList.certificationList.length > 0) return true;
					else return false;
				}

				$.each(talentList.educationList, function(i, data){
					if(data.eduStrtDt == null) data.eduStrtDt = "";
					else data.eduStrtDt = data.eduStrtDt.substr(0, 7);
					if(data.eduEndDt == null) data.eduEndDt = "";
					else data.eduEndDt = data.eduEndDt.substr(0, 7);
					data.eduStrtDt = data.eduStrtDt.replace("-",".").replace("-",".");
					data.eduEndDt = data.eduEndDt.replace("-",".").replace("-",".");
				});
				talentList.isEducationList = function(){
					if(talentList.educationList.length > 0) return true;
					else return false;
				}
				// 기타
				$.each(talentList.resumeNoteList, function(i, data){
					if(data.contents != null && data.contents != '') {
						data.contents = data.contents.replace(/(?:\r\n|\r|\n)/g, '<br />');
					}
				});
				talentList.isResumeNoteList = function(){
					if(talentList.resumeNoteList.length > 0) return true;
					else return false;
				}


				// 차트 데이터
				talentList.hasChartData = false;
				talentList.hasProjectTypeChartData = false;
				talentList.hasProjectRoleChartData = false;
				talentList.hasDomainChartData = false;
				talentList.hasSkillChartData = false;
				talentList.hasProjectChartData = false;
				
                if (talentList.occuList && talentList.occuList.length > 0) {
					talentList.hasChartData = true;
					talentList.hasProjectTypeChartData = true;
				}
                if (talentList.roleList && talentList.roleList.length > 0) {
					talentList.hasChartData = true;
					talentList.hasProjectRoleChartData = true;
				}
                if (talentList.domainList && talentList.domainList.length > 0) {
					talentList.hasChartData = true;
					talentList.hasDomainChartData = true;
				}
                if (talentList.skillCareers && talentList.skillCareers.length > 0) {
                    for (var i = 0; i < talentList.skillCareers.length; i++) {
                        if (Object.keys(talentList.skillCareers[i]).length !== 0 || JSON.stringify(talentList.skillCareers[i]) !== JSON.stringify({})) {
							talentList.hasChartData = true;
							talentList.hasSkillChartData = true;
                        }
                    }
                }
                if (talentList.careerList && talentList.careerList.length > 0) {
					talentList.hasChartData = true;
					talentList.hasProjectChartData = true;
				}
				return talentList;
			},
			calculateMax : function(data, max) {
			    var dataValue = 0;
			    
			    for (var i = 1; i < data.length; i++) {
			    	dataValue += data[i][1];
			    }
			    
			    var count = Math.pow(10,1);
			    var result = Math.round(((max / dataValue) * 100) * count)/count;

			    return result;
			},
			calculateMaxText : function(data, max) {
			    var dataValue = 0;
			    
			    for (var i = 1; i < data.length; i++) {
			    	if(data[i][1] == max){
			    		return data[i][0];
			    	}
			    }
			},
			drawChart : function(obj, option){

                if (obj.hasProjectTypeChartData) {
                    // Occupation
                    var occuArray = [['Task', 'Percentage']];
                    $.each(obj.occuList, function (i, list) {
                        occuArray.push([list.cdValNm, list.days]);
                    });
                    var data = google.visualization.arrayToDataTable(occuArray);
                    if (data.getNumberOfRows() > 0) {
                        var options = {
                            tooltip: {trigger: 'none'},
                            pieSliceText: 'percentage',
                            pieHole: 0.35, // 홀 크기 0 - 1
                            slices: {
                                0: {color: '#ff9900'},
                                1: {color: '#a7a7a7'},
                                2: {color: '#666666'},
                                3: {color: '#333333'},
                                4: {color: '#ff6600'}
                            },
                            backgroundColor: 'none' // 챠트내 백그라운드를 없앰
                        };

                        if (option != null) {
                            options.legend = option;
                        }
                        var chart = new google.visualization.PieChart(document.getElementById('piechart'));
                        chart.draw(data, options);

                        $("#pieChartText").html(freemon.ux.calculateMaxText(occuArray, data.getColumnRange(1).max) + '<p>' + freemon.ux.calculateMax(occuArray, data.getColumnRange(1).max) + '<span class="small">%</span></p>');
                    }
                }

                if (obj.hasProjectRoleChartData) {
                    // Role
                    var roleArray = [['Task', '%']];
                    $.each(obj.roleList, function (i, list) {
                        roleArray.push([list.cdValNm, list.days]);
                    });
                    var data = google.visualization.arrayToDataTable(roleArray);
                    $("#roleChartText").html(freemon.ux.calculateMaxText(roleArray, data.getColumnRange(1).max) + '<p>' + freemon.ux.calculateMax(roleArray, data.getColumnRange(1).max) + '<span class="small">%</span></p>');

                    var roleArray2 = [['Task', '%', {role: 'annotation'}]];
                    $.each(obj.roleList, function (i, list) {
                        roleArray2.push([list.cdValNm, freemon.ux.calculateMax(roleArray, list.days), String(freemon.ux.calculateMax(roleArray, list.days)) + "%"]);
                    });
                    var roleHeight = 40 * roleArray.length;
                    var data = google.visualization.arrayToDataTable(roleArray2);
                    if (data.getNumberOfRows() > 0) {
                        var role_options = {
                            colors: ['#a7a7a7'],
                            legend: 'none',
                            hAxis: {
                                minValue: 0,
                                maxValue: 100,
                                format: '#\'%\'',
                                textPosition: 'none'
                            },
                            isStacked: true,
                            textPosition: "inside",
                            height: roleHeight,
                            tooltip: {trigger:'none'},
                            annotations: {
                                alwaysOutside: 'true',
                                textStyle: {
                                    color: "#999"
                                },
                            },
                            backgroundColor: 'none'
                        };

                        var barchart = new google.visualization.BarChart(document.getElementById('role_div'));
                        barchart.draw(data, role_options);
                    }
                }

                if (obj.hasDomainChartData) {
                    // Domain
                    var domainArray = [['Task', '기간(개월)', {role: 'annotation'}]];
                    $.each(obj.domainList, function (i, list) {
                    	var year = parseInt(String(list.days)/12)
                    	var month = parseInt(String(list.days)%12)
                    	
                    	if(month == 12) date = (year + 1) + "년";
    					else if(month == 0 ) date = year + "년";
    					else if(year == 0 ) date = month + "개월";
    					else date = year + "년" + month + "개월";
                    	
                        domainArray.push([list.cdValNm, list.days, date]);
                    });
                    var domainHeight = 40 * domainArray.length;
                    var data = google.visualization.arrayToDataTable(domainArray);
                    if (data.getNumberOfRows() > 0) {
                        var domain_options = {
                            colors: ['#a7a7a7'],
                            legend: 'none',
                            height: domainHeight,
                            hAxis: {textPosition: 'none'},
                            tooltip: {trigger:'none'},
                            annotations: {
                                alwaysOutside: 'true',
                                textStyle: {
                                    color: "#999"
                                },
                            },
                            backgroundColor: 'none'
                        };
                        var barchart = new google.visualization.BarChart(document.getElementById('domain_div'));
                        barchart.draw(data, domain_options);

                        $("#domainChartText").html(freemon.ux.calculateMaxText(domainArray, data.getColumnRange(1).max));
                    }
                }

                if (obj.hasSkillChartData) {
                    // Skill
                    var skillArray = [['Task', '기간(개월)', {role: 'annotation'}]];
                    $.each(obj.skillList, function (i, list) {
                        Object.keys(list).forEach(function (key) {
                            var value = list[key];
                            
                            var year = parseInt(value/12)
                        	var month = parseInt(value%12)
                        	
                        	if(month == 12) date = (year + 1) + "년";
        					else if(month == 0 ) date = year + "년";
        					else if(year == 0 ) date = month + "개월";
        					else date = year + "년" + month + "개월";
                            
                            skillArray.push([key, parseInt(value), date]);
                        });
                    });
                    var skillHeight = 40 * skillArray.length;
                    var data = google.visualization.arrayToDataTable(skillArray);
                    if (data.getNumberOfRows() > 0) {
                        var project_options = {
                            colors: ['#a7a7a7'],
                            legend: 'none',
                            height: skillHeight,
                            hAxis: {textPosition: 'none'},
                            tooltip: {trigger:'none'},
                            annotations: {
                                alwaysOutside: 'true',
                                textStyle: {
                                    color: "#999"
                                },
                            },
                            backgroundColor: 'none'
                        };
                        var barchart = new google.visualization.BarChart(document.getElementById('skill_div'));
                        barchart.draw(data, project_options);

                        $("#skillChartText").html(freemon.ux.calculateMaxText(skillArray, data.getColumnRange(1).max));
                    }
                }

                if (obj.hasProjectChartData) {
                    // Project
                    var projectArray = [['Task', '기간(개월)', {role: 'annotation'}]];
                    var totalCareer = 0;
                    $.each(obj.projectList, function (i, list) {
                    	var year = parseInt(list.prtcptTerm/12)
                    	var month = parseInt(list.prtcptTerm%12)
                    	
                    	if(month == 12) date = (year + 1) + "년";
    					else if(month == 0 ) date = year + "년";
    					else if(year == 0 ) date = month + "개월";
    					else date = year + "년" + month + "개월";
                    	
                        projectArray.push([list.projNm, parseInt(list.prtcptTerm), list.projNm + " / " + date]);
                        totalCareer += parseInt(list.prtcptTerm);
                    });
                    var projectHeight = 30 * projectArray.length;
                    var data = google.visualization.arrayToDataTable(projectArray);
                    if (data.getNumberOfRows() > 0) {
                        var project_options = {
                            colors: ['#a7a7a7'],
                            legend: 'none',
                            hAxis: {textPosition: 'none'},
                            vAxis: {textPosition: 'none'},
                            height: projectHeight,
                            tooltip: {trigger:'none'},
                            annotations: {
                                alwaysOutside: 'true',
                                textStyle: {
                                    color: "#999"
                                }
                            },
                            chartArea: {
                                left: '3%',
                                right: '17%',
                                top: '5px',
                                width: '86%',
                            },
                            backgroundColor: 'none'
                        };
                        var barchart = new google.visualization.BarChart(document.getElementById('project_div'));
                        barchart.draw(data, project_options);
                        
                        var career = totalCareer / 12;
                        var year = Math.floor(career);
                        var month = totalCareer % 12;
                        
                        if(parseInt(month) == 12) date = (year + 1) + "년";
    					else if(parseInt(month) == 0 ) date = year + "년";
    					else if(parseInt(year) == 0 ) date = month + "개월";
    					else date = year + "년" + month + "개월";
                        
                        $("#projectChartText").html(date);
                    }
                }
			}
		}

        //Expose freemon to the global object
    window.freemon = freemon;

})(jQuery);






/**
 * window에 속한 객체로 LayoutManager를 사용할 경우 화면 제어 클래스가 이미 로드되어 있는지 확인하기
 * 위해서 사용한다. 메인화면에서 VIEW 화면을 다시 로드할지를 체크하기 위한 용도로 사용한다. VIEW는
 * 화면에 로드될 때 자신을 등록한다. init function에 ViewController의 enroll 함수를 호출하여 등록
 * 한다.
 *
 * var ArticleView = {
 *    name : "ArticleView",
 *    init : function() {
 *           ViewController.enroll(ArticleView.name);
 *    }
 *
 * };
 *
 *
 * 메인 클래스에서  ViewController의 exists 함수를 호출하여 ArticleView를 다시 로드할지를 결정한다.
 *
 * if(ViewController.exists("ArticelView")) {
 *     return;   // ArticleView가 존재하면 다시 로드할 필요가 없어서  return 처리한다.
 * }
 *
 *
 */
var ViewController = {
     /** 현재 VIEW의 클래스 명 */
     currentViewClass : "",
     /**
      * VIEW 화면에서 자신을 등록할 때 사용한다.
      * @param viewClassName  제어로직의 클래스명
      */
     enroll: function(viewClassName) {
        if(ViewController.currentViewClass != "") {
            window[ViewController.currentViewClass] = null;
        }
        ViewController.currentViewClass = viewClassName;
     },

     /**
      * 해당 제어로직 클래스가 등록이 되어 있는지 확인한다.
      * @param viewClassName  제어로직 클래스 명
      * @return
      *     true : 이미 로드되어 있음
      *     false: 로드되어 있지 않음.
      *
      */
     exists : function(viewClassName) {
         return (ViewController.currentViewClass == viewClassName) ? true: false;
     }
};








/**
 *   관찰자 객체에게 변경사항을 통지하는 역할을 합니다.  obervers 필드에 관찰자(Observer)를 가지고
 *   있고, View에서 notifyObservers 함수를 호출하면 순환하면서 관찰자의 update 메서드를 호출합니다.
 *   관찰자는 update 함수를 구현해야 합니다.
 *
 *   이 객체는 Observer Pattern의 응용입니다.  Observer Pattern에서는 관찰자와 Subject가 있습니다.
 *   주체(Subject)는 이 객체가 해당됩니다.  Subject는 Observer를 담고 있고, 어떤 객체에서 Subect에게
 *   변경을 통지하면, Subject가 Observer의 update 메서드를 호출하여 변경사항을 적용하도록 합니다.
 *
 *    관찰자(Observer)가 되는 객체는 update 함수를 반드시 구현해야 합니다. update 함수에는 관찰정보
 *    가 전달됨니다. 이것은 JSON 객체입니다. 이 객체의  첫번째 필드는 관찰정보에 대한 구분값으로
 *    type이며 이 타입을 이용하여 처리 방법을 분기합니다. 두번째 인자는 전달할 데이터입니다.
 *
 *    아래는 Observer 구현체의 예입니다. param.type의 값이 USER_INF_CHASNGED이면 변경사항을 처리하는
 *    코드 입니다. init 함수에서 ObserverControl에 자기 자신을 등록합니다.
 *
 *    var  ConcreteObjserver = {
 *         init : function( )  {
 *              ObserverControl.addObserver(this);
 *         },
 *         fn : {
 *             update : function(param) {
 *                 if(param.type = "USER_INFO_CHANGED") {
 *                    doSomthing();
 *                 }
 *             }
 *         }
 *     };
 *
 *
 *    아래의 코드는 ObserverControl에게 변경사항을 전달하는 코드입니다. 변경사항이 발생했을 때 다른
 *    Observer들에게 변경사항을 통지하도록 하는 예제 입니다.
 *
 *    var OtherLogicObject = {
 *
 *        fn :  {
 *           selectUser : function(pUserId) {
 *                var options = { type : "USER_INFO_CHANGED", data : { userId : pUserId}};
 *                ObserverControl.notifyObservers(options);
 *           }
 *        }
 *    }
 *
 *
 *   @author Sanghyun, Kim(sanghyun@freemonsoft.com)
 */
var ObserverControl = {
    /**
     * Observer Collection
     */
    observers : [],
    /**
     * 옵져버를 등록합니다.
     * @param observer 관찰자
     */
    addObserver : function(observer) {
        // 동일한 객체가 여러개 등록되는 현상을 방지
        if(!ObserverControl.containsObserver(observer)) {
            ObserverControl.observers.push(observer);
        }else {
        	var observerIndex = ObserverControl.indexOf(observer);

        	// 현재 저장되어있는 옵저버를 새로 날라온 파라미터로 교체함(테스트 코드)
        	ObserverControl.observers[observerIndex] = observer;
        	/*

        	if(!!window[observer.name]) {
        		window[observer.name] = observer;
        	}*/
        }

        //test code
        /*
        if(observer.fn) $.extend(observer, observer.fn);

        if(observer.init) observer.init();
        if(obsever.beforeBind) observer.beforeBind();
        if(obsever.bind) observer.bind();
        if(observer.afterBind) observer.afterBind();
         */
    },
    /**
     * 관찰자를 삭제합니다.
     * @param observer 관찰자
     */
    deleteObserver : function(observer) {
        var tempObservers = [];
        for ( var i = 0; i < ObserverControl.observers.length; i++) {
            // argument에 전달된 observer를 제외하고 모아놓고 다시
        	var obj = ObserverControl.observers[i];
            if(!ObserverControl.equals(obj, observer)) {
                tempObservers.push(obj);
            }
        }
        ObserverControl.observers = tempObservers;
        // 로드되어있는 스크립트를 지움
        window[observer.name] = null;
    },
    /**
     * 관찰자에게 변경정보를 통지합니다. 변경정보는 JSON을 작성합니다.  VIEW 객체가 이 함수를 호출
     * 하는 코드는 아래와 같습니다.
     *
     *  var options  = { type:"USER_INFO_CHANGE", data : { userId: "appletree", userDept:"1022" }};
     *  ObserverControl.notifyObservers(options);
     *
     * @param param 통지할 정보, JSON Object
     */
    notifyObservers : function(param) {
        for ( var i = 0; i < ObserverControl.observers.length; i++) {
            var obj = ObserverControl.observers[i];
            if(obj.fn && obj.fn.update) obj.fn.update(param);
        }// for
    },
    /**
     * 관찰자에게 변경정보를 통지합니다. 변경정보는 JSON을 작성합니다.  VIEW 객체가 이 함수를 호출
     * 하는 코드는 아래와 같습니다.
     *
     *  var options  = { type:"USER_INFO_CHANGE", data : { userId: "appletree", userDept:"1022" }};
     *  ObserverControl.notifyObservers(options);
     *
     * @param param 통지할 정보, JSON Object
     */
    opennerNotifyObservers : function(param){
    	var len = 0;
    	if(opener){
    		if(opener.ObserverControl){
    			len = opener.ObserverControl.observers.length;
    		}
    	}
    	for ( var i = 0; i < len; i++) {
            var obj = opener.ObserverControl.observers[i];
            if(obj.fn && obj.fn.update) obj.fn.update(param);
        }// for
    },
    /**
     * Observer array 에서 이미 등록된 동일한 객체가 있는지 판단한다
     * @param observer
     * @returns {Boolean}
     */
    containsObserver : function(observer) {
        for(var i = 0; i < ObserverControl.observers.length; i++) {
            var obj = ObserverControl.observers[i];

            if(ObserverControl.equals(obj, observer)) {
                return true;
            }
        }
        return false;
    },
    /**
     * Observer array에서 해당 observer가 몇번째 위치에 속해있는지 판단한다.
     */
    indexOf : function(observer) {
        for(var i = 0; i < ObserverControl.observers.length; i++) {
            var obj = ObserverControl.observers[i];

            if(ObserverControl.equals(obj, observer)) {
                return i;
            }
        }
        return -1;
    },
    /**
     * Page Object 2개가 동일한 Object인지 비교한다.
     * @param obj1
     * @param obj2
     * @returns {Boolean}
     */
    equals : function(obj1, obj2){
        /*
        for(var i in obj1) {
            if(obj1.hasOwnProperty(i)) {
                if (!obj2.hasOwnProperty(i)) return false;
                if (obj1[i] != obj2[i]) return false;
            }
        }
        for(var i in obj2) {
            if(obj2.hasOwnProperty(i)) {
                if (!obj1.hasOwnProperty(i)) return false;
                if (obj1[i] != obj2[i]) return false;
            }
        }
        return true;
        */
        // 펑션은 연산자로 동일여부를 비교할 수 없어 그냥 다음과 같은 방식으로 비교하였음
        /*
        if(obj1.name == obj2.name && obj1.mode == obj2.mode && obj1.menu == obj2.menu) {
            return true;
        } else {
            return false;
        }
        */
        if(obj1.name == obj2.name) {
           return true;
        }
        return false;
    }
};


//---------------------------------------------------------------------------------- Validation
(function( $ ){


 /**
  * HTMLT FORM 요소를 검증하기 위한 객체이다.
  */
 freemon.validation =  {


         checkPattern : function(node) {
             var patternStr = $(node).attr("pattern");
             if(!patternStr) return true;

             var nodeVal = $(node).val();
             if(!nodeVal) return true;

             var reg = new RegExp(patternStr);
             var testRes = reg.test(nodeVal);
             if(!testRes) {
                 var msg = $(node).data("validation-pattern-message");
                 if(msg) { alert(msg); }
                 $(node).focus();
                 return false;
             }
             return testRes;

         },  // checkPattern
         checkNumber: function(node) {

             if($(node).data("validation-type") != "number") return true;

             var nodeVal = $(node).val();
             if(!nodeVal) return true;

             if(!freemon.string.isCurrency(nodeVal)) {
                 var msg = $(node).data("validation-number-message");
                 if(msg) { alert(msg); }
                 $(node).focus();
                 return false;
             }
             nodeVal = nodeVal.replace(new RegExp(",", "g"), "");
             var thisMin = $(node).attr("min");
             if(thisMin) {
                 var fMin = parseFloat(thisMin);
                 var fVal = parseFloat(nodeVal);
                 if(fVal < fMin) {
                     var msg = $(node).data("validation-min-message");
                     if(msg) { alert(msg); }
                     $(node).focus();
                     return false;
                 }
             } // thisMin
             var thisMax = $(node).attr("max");
             if(thisMax) {
                 var fMax = parseFloat(thisMax);
                 var fVal = parseFloat(nodeVal);
                 if(fVal > fMax) {
                     var msg = $(node).data("validation-max-message");
                     if(msg) { alert(msg); }
                     $(node).focus();
                     return false;
                 }
             }// thisMax

             return true;

         }, // checkNumber
         checkURL: function(node) {

             if($(node).data("validation-type") == "url") {
                 var filter = /(ftp|http|https):\/\/(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/;
                 var nodeVal = $(node).val();
                 if(!nodeVal) return true;
                 if(!filter.test(nodeVal)) {
                     var msg = $(node).data("validation-url-message");
                     if(msg) { alert(msg); }
                     $(node).focus();
                     return false;
                 }
                 return true;
             }
             return true;

         }, // checkURL

         checkEmail: function(node) {
             if($(node).data("validation-type") != "email") return true;

             var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
             var nodeVal = $(node).val();
             if(!nodeVal) return true;
             if(!filter.test(nodeVal)) {
                 var msg = $(node).data("validation-email-message");
                 if(msg) { alert(msg); }
                 $(node).focus();
                 return false;
             }

             return true;

         }, // checkEmail
         match : function(node) {
             var matchTarget = $(node).data("validation-match-match");
             if(!matchTarget)  return true;

             if($(node).attr("type") == "text"){

                 if(!$(matchTarget)) return true;

                 var targetVal =  $(matchTarget).val();
                 if(!targetVal) {
                     var msg = $(node).data("validation-match-message");
                     if(msg) alert(msg);
                     $(node).focus();
                     return false;
                 }else {
                     if(targetVal == $(node).val()) {
                         return true;
                     }
                     var msg = $(node).data("validation-match-message");
                     if(msg) alert(msg);
                     $(node).focus();
                     return false;
                 }
             } // type == text
             return true;
         },
         
         checkPeriod : function(node) {
        	 if($(node).data("validation-type") != "date") return true;
        	 
        	 var filter = "\D";
        	 var nodeVal = $(node).val();
        	 if(!nodeVal) return true;
        	 nodeVal = nodeVal.replace(new RegExp(filter, "g"), '');
        	 
        	 var thisMin = $(node).attr("min").replace(new RegExp(filter, "g"), '');
        	 if(thisMin) {
        		 var IMin = parseInt(thisMin,10);
        		 var IVal = parseInt(nodeVal,10);
        		 if(IVal < IMin) {
        			 var msg = $(node).data("validation-min-message");
        			 if(msg) { alert(msg); }
        			 $(node).focus();
        			 return false;
        		 }
        	 } // thisMin
        	 
        	 var thisMax = $(node).attr("max").replace(new RegExp(filter, "g"), '');
        	 if(thisMax) {
        		 var IMax = parseInt(thisMax,10);
        		 var IVal = parseInt(nodeVal,10);
        		 if(IVal > IMax) {
        			 var msg = $(node).data("validation-max-message");
        			 if(msg) { alert(msg); }
        			 $(node).focus();
        			 return false;
        		 }
        	 }// thisMax
        	 
        	 return true;
         },
         /**
          * HTML FORM의 input 요소의 값을 검증한다. 이 함수는 폼 요소를 서버로 전송하기 전에
          * 폼 요소에 정의되어 있는 속성값을 기준으로 폼 요소의 입력값을 검증한다.  오류가 있으면
          * alert창을 표시하고 false를 리턴한다. true이면 서버로 전송하면 된다.
          *
          * 아래의 코드는 모든 INPUT 요소를 검증한다. 오류가 있으면  더이상 진행하지 않도록 작성되
          * 었다.
          *
          *    if(!freemon.validation.validate(":input") {
          *       return;
          *    }
          *
          *
          *  폼 요소에 사용할 속성값은 다음과 같다.
          *
          *  1. 필수값 체크
          *     required   : 이 속성이 기술되면 필수 값이다.
          *     data-validation-required-message : 필수값이 없을 때 표시되는 메시지
          *
          *     예)
          *         <input type="text" id="userId"
          *              required
          *              data-validation-required-messagege="ID 값이 필요합니다."
          *          />
          *
          *  2. 날자 입력값 체크
          *     data-validation-type : date
          *     data-validation-date-message : 입력값이 없을 때 나타내는 메시지
          *
          *     예)
          *
          *        <input type="text" id="registDate"
          *               required
          *               data-validation-required-message="등록일은 필수 값입니다."
          *               data-validation-type="date"
          *               data-validation-date-message="입력값이 잘못 되었습니다." />
          *
          *  3. 두 요소의 값이 일치하는지 체크(Match)
          *      data-validation-match-match : 비교할 요소의 아이디
          *      data-validation-match-message : 입력값이 서로 다를 때 표시할 메시지
          *
          *              <spring:message code="input.label.password1" text="패스워드1" />
          *              <input type="text" id="ErrorStat_password1"
          *                 required
          *                 data-validation-required-message="<spring:message
          *                 code="validation.empty" text="값이 비었습니다"  />"
          *                 data-validation-type="string"
          *                 placeHolder="<spring:message  code="input.label.password"
          *                 text="패스워드"  />"
          *              />
          *
          *            <spring:message code="input.label.password2" text="패스워드2" />
          *            <input type="text" id="ErrorStat_password2"
          *                    required
          *                    data-validation-required-message="<spring:message
          *                    code="validation.empty"
          *                    text="값이 비었습니다"  />"
          *                    data-validation-type="string"
          *                    data-validation-match-match="#ErrorStat_password1"
          *                    data-validation-match-message="값이 서로 다릅니다."
          *                    placeHolder="<spring:message  code="input.label.password"  text="패스워드"  />"
          *
          *  4. 숫자값의 최소값, 최대값 확인
          *      data-validation-type : 데이터 형식(default: number)
          *      data-validation-number-message: 데이터 형식이 다를 때 표시할 메지시
          *      min : 최소값
          *      max : 최대값
          *      data-validation-min-message: min값 보다 적을 때 표시할 메시지
          *      data-valiadtion-max-message: max값 보다 적을 때 표시할 메시지
          *
          *    예)
          *      <input type="text" id="age"
          *           data-validation-type="number"
          *           min="30"
          *           max="80"
          *           data-validation-min-message="입력값이 너무 작습니다. "
          *           data-validation-max-message="입력값이 너무 큽니다."  />
          *
          *  5. 패턴을 이용한 입력값 검증
          *       pattern : 패턴을 입력하기 위한 속성
          *       data-validation-type  : 데이터 형식( default : pattern)
          *       data-validation-pattern-message: 패턴과 맞지 않을 때 표시할 메시지
          *
          *     예)
          *        <input type="text" id="userId"
          *            pattern="ab+c"
          *            data-validation-type="pattern"
          *            data-validation-pattern-message="입력값은 ab로 시작하고 c로 끝나야 합니다."
          *            />
          *
          *
          * @select  jQuery의 Selector
          */
         validate: function(selector) {

             var checkStatus = true;
             $(selector).not("[type=image],[type=submit], [type=button]").each(function() {

                 // Check the required attribute
                 if($(this).attr("required") != undefined) {
                     if($(this).val() == null || $(this).val() == "") {
                         var msg = $(this).data("validation-required-message");
                         if(msg) {alert(msg);}
                         $(this).focus();
                         checkStatus = false;
                         return false;
                     }
                 }

                 // Check the validation type which is the date
                 if($(this).data("validation-type") != undefined) {
                     var validType = $(this).data("validation-type");
                     if(validType =="date") {
                         if(!freemon.util.validateDate( $(this).val() ))  {
                             if($(this).data("validation-date-message")) {
                                alert($(this).data("validation-date-message"));
                             }
                             $(this).focus();
                             checkStatus = false;
                             return false;
                         }
                     }// validType == date
                 }// if

                 if(!freemon.validation.match(this))   {
                     checkStatus = false;
                     return false;
                 }
                 if(!freemon.validation.checkEmail(this))  {
                     checkStatus = false;
                     return false;
                 }
                 if(!freemon.validation.checkURL(this)) {
                     checkStatus = false;
                     return false;
                 }
                 if(!freemon.validation.checkNumber(this)) {
                     checkStatus = false;
                     return false;
                 }
                 if(!freemon.validation.checkPattern(this)) {
                     checkStatus = false;
                     return false;
                 }
                 if(!freemon.validation.checkPeriod(this)) {
                	 checkStatus = false;
                	 return false;
                 }

             });  // each

             // Everything is OK.
             return checkStatus;

         },// validate

         realTimeIdCheck : function(target){
        	 var obj = null;
        	 if($.type(target) == 'object'){
        		 obj = $(target);
        	 }else if($.type(target) == 'string'){
        		 obj = $('#'+target);
        	 }else{
        		 return ;
        	 }

        	 obj.blur(function(){
        		 if($.trim($(this).val()) == ''){
        			freemon.validation.printErrorMsg($(this), '아이디를 입력해 주세요.');
        		 }
        	 });

        	 obj.keyup(function(){
        		 if(!(/^[0-9a-zA-Z]+$/).test($(this).val())){
        			 freemon.validation.printErrorMsg($(this), '아이디는 영문과 숫자만 입력 가능합니다.');
        			 return;
        		 }

        		 //if()
        	 });
         },

         realTimePwCheck : function(target){
        	 var obj = null;
        	 if($.type(target) == 'object'){
        		 obj = $(target);
        	 }else if($.type(target) == 'string'){
        		 obj = $('#'+target);
        	 }else{
        		 return ;
        	 }

        	 obj.blur(function(){
        		 $(obj).siblings('.validation_msg').css('display', 'none');
            	 $(obj).removeClass('field_invalid');
        	 });

        	 obj.focus(function(){
        		 if($(this).val().length < 6){
        			 freemon.validation.printErrorMsg($(this), '사용 불가');
        			 return;
        		 }else if($(this).val().length > 12){
        			 freemon.validation.printErrorMsg($(this), '사용 불가');
        			 return;
        		 }

        		 for(var i=0; i < $(this).val().length; i++){
 			        var chr=$(this).val().substr(i,1);
 			        if(!(chr < 'ㄱ' || chr > '힣'  )){
 			        	freemon.validation.printErrorMsg($(this), '사용 불가');
 	        			return;
 			        }
 			     }


        		 freemon.validation.printErrorMsg($(this), '사용 가능');
        		 $(this).removeClass('field_invalid');
        		 $(this).siblings('.validation_msg').addClass('msg_valid');
        		 $(this).siblings('.validation_msg').removeClass('msg_invalid');
        	 });

        	 obj.keyup(function(){
        		 if($(this).val().length < 6){
        			 freemon.validation.printErrorMsg($(this), '사용 불가');
        			 return;
        		 }else if($(this).val().length > 12){
        			 freemon.validation.printErrorMsg($(this), '사용 불가');
        			 return;
        		 }

        		 for(var i=0; i < $(this).val().length; i++){
 			        var chr=$(this).val().substr(i,1);
 			        if(!(chr < 'ㄱ' || chr > '힣'  )){
 			        	freemon.validation.printErrorMsg($(this), '사용 불가');
 	        			return;
 			        }
 			     }


        		 freemon.validation.printErrorMsg($(this), '사용 가능');
        		 $(this).removeClass('field_invalid');
        		 $(this).siblings('.validation_msg').addClass('msg_valid');
        		 $(this).siblings('.validation_msg').removeClass('msg_invalid');

        	 });
         },

         printErrorMsg : function(obj, msg){
        	 if($(obj).siblings('.validation_msg').length == 0){
        		 $('<span class="validation_msg"></span>').insertAfter(obj);
        	 }

        	 var errorMsgEl = $(obj).siblings('.validation_msg');

        	 errorMsgEl.html(msg);
        	 errorMsgEl.css('display', 'inline');
        	 $(obj).addClass('field_invalid');
        	 errorMsgEl.addClass('msg_invalid');
        	 errorMsgEl.removeClass('msg_valid');
         }

 }; // freemon.validation


 /*
  * freemon paletee 생성 추가
  * @param : rootNode - 팔레트가 위치할 node
  * @param : callback - 색상 선택시 색상값을 받을 콜백함수
  */
	freemon.palette = function(rootNode, callback) {
		return new palette(rootNode, callback);
	}

	 /*
	  * paletee object
	  * @param : rootNode - 팔레트가 위치할 node
	  * @param : callback - 색상 선택시 색상값을 받을 콜백함수
	  */
    var palette = function(rootNode, callback){

    	// 객체 참조
    	var t = this;

    	// 기본색상정보
    	t.paletteoption = this.paletteoption = {
    			divNode : $('<div class="cal_plt unhidden">'),
    			labels : {
    				       '#ac725e' : $('<label id="1" style="background-color:#ac725e;"><input name="'+rootNode.attr('id')+'plt" type="radio" value="#ac725e" fgcolor="#ffffff" class="input_rdo"><span>#ac725e</span></label>'),
    				       '#d06b64' : $('<label id="2" style="background-color:#d06b64;"><input name="'+rootNode.attr('id')+'plt" type="radio" value="#d06b64" fgcolor="#ffffff" class="input_rdo"><span>#d06b64</span></label>'),
    			           '#f83a22' : $('<label id="3" style="background-color:#f83a22;"><input name="'+rootNode.attr('id')+'plt" type="radio" value="#f83a22" fgcolor="#ffffff" class="input_rdo"><span>#f83a22</span></label>'),
    		  	           '#fa573c' : $('<label id="4" style="background-color:#fa573c;"><input name="'+rootNode.attr('id')+'plt" type="radio" value="#fa573c" fgcolor="#ffffff" class="input_rdo"><span>#fa573c</span></label>'),
    			           '#ff7537' : $('<label id="5" style="background-color:#ff7537;"><input name="'+rootNode.attr('id')+'plt" type="radio" value="#ff7537" fgcolor="#ffffff" class="input_rdo"><span>#ff7537</span></label>'),
    			           '#ffad46' : $('<label id="6" style="background-color:#ffad46;"><input name="'+rootNode.attr('id')+'plt" type="radio" value="#ffad46" fgcolor="#ffffff" class="input_rdo"><span>#ffad46</span></label>'),
    			           '#42d692' : $('<label id="7" style="background-color:#42d692;"><input name="'+rootNode.attr('id')+'plt" type="radio" value="#42d692" fgcolor="#ffffff" class="input_rdo"><span>#42d692</span></label>'),
    			           '#16a765' : $('<label id="8" style="background-color:#16a765;"><input name="'+rootNode.attr('id')+'plt" type="radio" value="#16a765" fgcolor="#ffffff" class="input_rdo"><span>#16a765</span></label>'),
    			           '#7bd148' : $('<label id="9" style="background-color:#7bd148;"><input name="'+rootNode.attr('id')+'plt" type="radio" value="#7bd148" fgcolor="#ffffff" class="input_rdo"><span>#7bd148</span></label>'),
    			           '#b3dc6c' : $('<label id="10" style="background-color:#b3dc6c;"><input name="'+rootNode.attr('id')+'plt" type="radio" value="#b3dc6c" fgcolor="#466216" class="input_rdo"><span>#b3dc6c</span></label>'),
    			           '#fbe983' : $('<label id="11" style="background-color:#fbe983;"><input name="'+rootNode.attr('id')+'plt" type="radio" value="#fbe983" fgcolor="#584514" class="input_rdo"><span>#fbe983</span></label>'),
    		 	           '#fad165' : $('<label id="12" style="background-color:#fad165;"><input name="'+rootNode.attr('id')+'plt" type="radio" value="#fad165" fgcolor="#584514" class="input_rdo"><span>#fad165</span></label>'),
    			           '#92e1c0' : $('<label id="13" style="background-color:#92e1c0;"><input name="'+rootNode.attr('id')+'plt" type="radio" value="#92e1c0" fgcolor="#245d45" class="input_rdo"><span>#92e1c0</span></label>'),
    			           '#9fe1e7' : $('<label id="14" style="background-color:#9fe1e7;"><input name="'+rootNode.attr('id')+'plt" type="radio" value="#9fe1e7" fgcolor="#1e5d63" class="input_rdo"><span>#9fe1e7</span></label>'),
    			           '#9fc6e7' : $('<label id="15" style="background-color:#9fc6e7;"><input name="'+rootNode.attr('id')+'plt" type="radio" value="#9fc6e7" fgcolor="#244b6c" class="input_rdo"><span>#9fc6e7</span></label>'),
    			           '#4986e7' : $('<label id="16" style="background-color:#4986e7;"><input name="'+rootNode.attr('id')+'plt" type="radio" value="#4986e7" fgcolor="#ffffff" class="input_rdo"><span>#4986e7</span></label>'),
    			           '#9a9cff' : $('<label id="17" style="background-color:#9a9cff;"><input name="'+rootNode.attr('id')+'plt" type="radio" value="#9a9cff" fgcolor="#ffffff" class="input_rdo"><span>#9a9cff</span></label>'),
    			           '#b99aff' : $('<label id="18" style="background-color:#b99aff;"><input name="'+rootNode.attr('id')+'plt" type="radio" value="#b99aff" fgcolor="#ffffff" class="input_rdo"><span>#b99aff</span></label>'),
    			           '#c2c2c2' : $('<label id="19" style="background-color:#c2c2c2;"><input name="'+rootNode.attr('id')+'plt" type="radio" value="#c2c2c2" fgcolor="#444444" class="input_rdo"><span>#c2c2c2</span></label>'),
    			           '#cabdbf' : $('<label id="20" style="background-color:#cabdbf;"><input name="'+rootNode.attr('id')+'plt" type="radio" value="#cabdbf" fgcolor="#4f3e41" class="input_rdo"><span>#cabdbf</span></label>'),
    			           '#cca6ac' : $('<label id="21" style="background-color:#cca6ac;"><input name="'+rootNode.attr('id')+'plt" type="radio" value="#cca6ac" fgcolor="#ffffff" class="input_rdo"><span>#cca6ac</span></label>'),
    		 	           '#f691b2' : $('<label id="22" style="background-color:#f691b2;"><input name="'+rootNode.attr('id')+'plt" type="radio" value="#f691b2" fgcolor="#ffffff" class="input_rdo"><span>#f691b2</span></label>'),
    			           '#cd74e6' : $('<label id="23" style="background-color:#cd74e6;"><input name="'+rootNode.attr('id')+'plt" type="radio" value="#cd74e6" fgcolor="#ffffff" class="input_rdo"><span>#cd74e6</span></label>'),
    			           '#a47ae2' : $('<label id="24" style="background-color:#a47ae2;"><input name="'+rootNode.attr('id')+'plt" type="radio" value="#a47ae2" fgcolor="#ffffff" class="input_rdo"><span>#a47ae2</span></label>')
    					}
    	};


        var newdivNode = t.paletteoption.divNode;
    	t.htmlNode = newdivNode;
    	t.getHtml = getHtml;
    	t.setColor = setColor;
    	t.selectColor = '';
    	t.selectColorObj = null;
    	t.checkedColorID = checkedColorID;
    	t.checkedColorVal = checkedColorVal;

    	// 각 색상 input box 선택값이 변경되었을때 change event 삽입
		$.each(this.paletteoption.labels, function(key,obj){
			var tObj = $(obj); 
			tObj.children(':first').change(function(){
				var thisObj =  $(this);
			    t.setColor(thisObj.val());
				if(callback){
					callback(thisObj.val(), thisObj.attr('fgcolor'));
				}
			});
			newdivNode.append(tObj);
		});

		// rootnode 존재시 해당 노드에 붙임
		if(rootNode){
			rootNode.append(t.htmlNode);
		}

		// 색상선택 지정
		function setColor(color){

    		t.selectColor = color;
    		$.each(t.paletteoption.labels, function(key,obj){
    			if(color==key){
    				obj.addClass('selected');
    				obj.children(':first').attr('checked',true);
    				t.selectColorObj = obj;
    			}else{
    				obj.removeClass('selected');
    				obj.children(':first').attr('checked',false);
    			}

			});

    	}

		function checkedColorID(){
			return t.selectColorObj.attr('id');
		}

		function checkedColorVal(){
			return t.selectColorObj.children(':first').val();
		}
		function checkedFgColorVal(){
			return t.selectColorObj.children(':first').attr('fgcolor');
		}
		// 팔레트 htmlnode 반환
		function getHtml(){
			return t.htmlNode;
		}

		return t;
    };

    /*
     * 사용자 정보를 정해진 정책에 따른 fomat 으로 리턴함.     
     *
     */
    freemon.getTextFomatFromUser = function(username, posName, deptName, cmpName, loginCmpId, targetCmpid){
    	
    	var text = "";
    	
    	text +=  username && username!=''? username+' ':'';
    	text +=  posName && posName!=''? posName : '';
    	
    	// 로그인한 본인과 다른 계열사의 경우에 회사명을 출력한다.
    	if((deptName && deptName!='') && (cmpName && cmpName!='') && (loginCmpId!=targetCmpid)){
    		text +=  '('+deptName+':'+cmpName+')';
    	}else if(deptName && deptName!=''){
    		text +=  deptName? '('+deptName+')' : '';    		
    	}
    	
    	return text;
    	
    };

    /*
     * datepicker, timepicker 공통
     *  - 날짜, 시간 포멧 체크
     *  - 시작일자/시간, 종료일자/시간 간격 체크 조정
     */
    freemon.dateTimepicker = function(startEle, startOption, endEle, endOption, startTimeEle, startTimeOption, endTimeEle, endTimeOption){
    	
    	var defaultNmask =  {type:'fixed',mask:'9999-99-99'};
    	var defaultTimeNmask = {type:'fixed',mask:'99:99'};    	
    	var defaultOption = {changeMonth: true, changeYear: true, yearSuffix: '&nbsp;'};    
    	var regional = $.datepicker.regional[frameworkProperties.locale];
		$.extend(defaultOption, regional);
    	var defaultTimeOption = {'step':10, 'timeFormat': 'H:i', 'forceRoundTime': false, 'scrollDefaultNow': true};
    	
    	var isIE = 0 < $('html.old-ie').length;
    	
    	var m_startOption = {
    			/* fix buggy IE focus functionality */
	            fixFocusIE: false,
	            
	            /* blur needed to correctly handle placeholder text */
	            onSelect: function(dateText, inst) {
	            	if($('.ui-dialog'))
	            		$('.ui-dialog').focus();  
	            	this.fixFocusIE = true;
	                  //$('.input_date').focusout();
	                 //$(this).blur().change().focus();
	            },
	            onClose: function(dateText, inst) {
	                  this.fixFocusIE = true;
	            },
	            beforeShow: function(input, inst) {
	            	//IE에서 발생하는 jquery 오류 패치
	            	/*var result = true;
	            	if(this.fixFocusIE){
		                  if (freemon.util.ieVersion() > -1 ){
		                    //msg = "You are using IE " + ver;
		                	  result = !this.fixFocusIE;
		                  }else{
		                	  result = true;
		                  }
	            	}
	                  this.fixFocusIE = false;
	                  return result;*/
	            	var result = isIE ? !this.fixFocusIE : true;
	                this.fixFocusIE = false;
	                return result;
	            }};
    	var m_endOption = {
    			/* fix buggy IE focus functionality */
	            fixFocusIE: false,
	            
	            /* blur needed to correctly handle placeholder text */
	            onSelect: function(dateText, inst) {
	            	if($('.ui-dialog'))
	            		$('.ui-dialog').focus();
	                  this.fixFocusIE = true;
	                  //$('.input_date').focusout();
	                 // $(this).blur().change().focus();
	            },
	            onClose: function(dateText, inst) {
	                  this.fixFocusIE = true;
	            },
	            beforeShow: function(input, inst) {
	            	//IE에서 발생하는 jquery 오류 패치
	            	/*var result = true;
	            	if(this.fixFocusIE){
		                  if (freemon.util.ieVersion() > -1 ){
		                    //msg = "You are using IE " + ver;
		                	  result = !this.fixFocusIE;
		                  }else{
		                	  result = true;
		                  }
	            	}
	                  this.fixFocusIE = false;
	                  return result;*/
	            	var result = isIE ? !this.fixFocusIE : true;
	                this.fixFocusIE = false;
	                return result;
	            }};    	 
    	var m_startTimeOption = {};
    	var m_endTimeOption = {};
        
        var _isTimeFormat = function(d) {
        	var df = /[0-2]{1}[0-9]{1}:[0-5]{1}[0-9]{1}/;
        	return d.match(df);
        };
    	
    	// 시작일자 객체
    	if(startEle && startEle.length>0){
    		
    		startEle.data('diffTime', 0);
    		startEle.nMask(defaultNmask); 
    		
    		if(startOption==undefined || startOption==null){    		
    			$.extend(m_startOption, defaultOption);
    		}else{
    			$.extend(m_startOption, startOption);
    		}
    		
    		startEle.datepicker(m_startOption);
    		
    		startEle.datepicker("option", "onClose", 
		    		function(dateText, inst){
		    			
		  		   	    var setdate;
		  		   	   
		  			   // 입력된 값의 길이가 10보다 작을경우 이전값으로 세팅한다.
		  			   if(inst.input.val().length<10){		    				
		  				   
		  				   if(inst.lastVal){	
		      					setdate = $.datepicker.parseDate($.datepicker._get(inst, "dateFormat"), inst.lastVal, $.datepicker._getFormatConfig(inst));
		  						if(setdate){
		  							$(this).datepicker('setDate', setdate);		    																		
		  						}
		  					}
		  				   return;
		
		  			   }else{
		  				   
		  				   try {	
		  					   setdate = $.datepicker.parseDate($.datepicker._get(inst, "dateFormat"), inst.input.val(), $.datepicker._getFormatConfig(inst));	    							   
		  				   }
		  				   catch (err) {
		  					   if(inst.lastVal.replace(/\s/g,"").replace(/\-/g, '')){	
		  						   setdate = $.datepicker.parseDate($.datepicker._get(inst, "dateFormat"), inst.lastVal, $.datepicker._getFormatConfig(inst));
		  						   if(setdate){
		  							   $(this).datepicker('setDate', setdate);		    																		
		  						   }
		  					   }
		  				   }
		  			   }
		  			   			   
		    		   // 시작일자가 변경되면 종료일자와 시간을 재조정한다.
		  			   freemon.DatetimeResetChecker('start', startEle, endEle, startTimeEle, endTimeEle);
		  			   $(this).blur(function() {
		    				var elem = $(this);
		    				setTimeout(function() {
		    				},100);
		  			   });
//		  			 $(this).blur(); //dialog에서 datepicker focus남아있는 오류 패치
		      	    }
    		);
    		
    	}
    	
    	// 종료일자 객체
    	if(endEle && endEle.length>0){
    		
    		endEle.nMask(defaultNmask); 
    		
    		endEle.focus(function(){
    			var tobj = $(this); 
    			tobj.attr('lastVal', tobj.val());
    		});
    		
    		if(endOption==undefined || endOption==null){    		
    			$.extend(m_endOption, defaultOption);
    		}else{
    			$.extend(m_endOption, endOption);
    		}
    		
    		endEle.datepicker(m_endOption);    		
    		
    		endEle.datepicker("option", "onClose", 
		    		function(dateText, inst){
		    			
		    			var setdate;
		    			
		    			// 입력된 값의 길이가 10보다 작을경우 이전값으로 세팅한다.
		    			if(inst.input.val().length<10){		    				
		    				
		    				if(inst.lastVal){	
		    					setdate = $.datepicker.parseDate($.datepicker._get(inst, "dateFormat"), inst.lastVal, $.datepicker._getFormatConfig(inst));
		    					if(setdate){
		    						$(this).datepicker('setDate', setdate);		    																		
		    					}
		    				}
		    				
		    			}else{    				
		    				try {	
		    					setdate = $.datepicker.parseDate($.datepicker._get(inst, "dateFormat"), inst.input.val(), $.datepicker._getFormatConfig(inst));	    							   
		    				}
		    				catch (err) {
		    					if(inst.input.attr('lastVal').replace(/\s/g,"").replace(/\-/g, '')){
		    						setdate = $.datepicker.parseDate($.datepicker._get(inst, "dateFormat"), inst.input.attr('lastVal'), $.datepicker._getFormatConfig(inst));
		    						if(setdate){
		    							$(this).datepicker('setDate', setdate);																	
		    						}
		    					}
		    					
		    				}
		    			}
		    			
		     		   // 시작일자가 변경되면 종료일자와 시간을 재조정한다.
		    			freemon.DatetimeResetChecker('end', startEle, endEle, startTimeEle, endTimeEle);
		    			$(this).blur(function() {
		    				var elem = $(this);
		    				setTimeout(function() {
		    				},100);
		  			   	});
//		    			$(this).blur(); //dialog에서 datepicker focus남아있는 오류 패치
		    		}    				
    		
    		);
    		
    	}
    	
    	// 시작시간 객체
    	if(startTimeEle && startTimeEle.length>0){
    		    		
    		startTimeEle.nMask(defaultTimeNmask); 
    		
    		if(startTimeOption==undefined || startTimeOption==null){    		
    			$.extend(m_startTimeOption, defaultTimeOption);
    		}else{
    			$.extend(m_startTimeOption, startTimeOption);
    		}
    		
    		startTimeEle.timepicker(m_startTimeOption);
    		
    		if(m_startTimeOption['changeTime']){    			
	        	startTimeEle.on('changeTime', m_startTimeOption['changeTime']);    			
    			
    		}else{
        		startTimeEle.on('changeTime', function() {	    		   
       			 freemon.DatetimeResetChecker('start', startEle, endEle, startTimeEle, endTimeEle);
   	    		   
       		});    			
    		}
    		
    		startTimeEle.focus(function(){
    			tobj = $(this);
    			tobj.attr('lastVal', tobj.val());
    		});
    		
    		startTimeEle.focusout(function() {
    			if(!_isTimeFormat(startTimeEle.val())){
    				tobj = $(this);
	    			tobj.val(tobj.attr('lastVal'));
	    		}
    		});
    		
    		startTimeEle.blur(function(){	    		   
    			if(!_isTimeFormat(startTimeEle.val())){
    				tobj = $(this);
    				tobj.val(tobj.attr('lastVal'));
    			}
    			freemon.DatetimeResetChecker('start', startEle, endEle, startTimeEle, endTimeEle);
	    	});
    		
    	}
    	
    	// 종료시간 객체
    	if(endTimeEle && endTimeEle.length>0){
    		
    		endTimeEle.nMask(defaultTimeNmask); 
    		
    		if(endTimeOption==undefined || endTimeOption==null){    		
    			$.extend(m_endTimeOption, defaultTimeOption);
    		}else{
    			$.extend(m_endTimeOption, endTimeOption);
    		}
    		
    		endTimeEle.timepicker(m_endTimeOption);
    		
    		if(m_endTimeOption['changeTime']){
        		endTimeEle.on('changeTime', m_endTimeOption['changeTime']);
    		}else{
        		endTimeEle.on('changeTime', function() {	    			
        			freemon.DatetimeResetChecker('end', startEle, endEle, startTimeEle, endTimeEle);
    	    		   
        		});	
    		}    	
    		
    		endTimeEle.focus(function(){
    			tobj = $(this);
    			tobj.attr('lastVal', tobj.val());
    		});
    		
    		endTimeEle.focusout(function() {
    			if(!_isTimeFormat(endTimeEle.val())){
    				tobj = $(this);
	    			tobj.val(tobj.attr('lastVal'));
	    		}
    		});
    		
    		endTimeEle.blur(function(){	    		   
	    		if(!_isTimeFormat(endTimeEle.val())){
	    			tobj = $(this);
	    			tobj.val(tobj.attr('lastVal'));
	    		}
	    		freemon.DatetimeResetChecker('end', startEle, endEle, startTimeEle, endTimeEle);
	    	});
    		
    	}
    };
    
    /*
	 * 시작일자+시작시간 - 종료일자+종료시간 간격 유효성 체크 
	 */
	freemon.DatetimeResetChecker = function(eventType, startEle, endEle, startTimeEle, endTimeEle){
		
		   var startDate = null;
		   var endDate   = null;
 	   if(startEle && startEle.length>0 && startEle.val().replace(/\s/g,"").replace(/\-/g, '')){
 		   if(startTimeEle && startTimeEle.length>0){
 			   var startTime = startTimeEle.timepicker('getTime');
 			   startDate = new Date($.datepicker.formatDate('yy/mm/dd', startEle.datepicker('getDate'))+' '+startTime.getHours()+':'+startTime.getMinutes());
 		   }else{
 			   startDate = new Date($.datepicker.formatDate('yy/mm/dd', startEle.datepicker('getDate')));    			   
 		   }
 	   }
 	   
 	   if(endEle && endEle.length>0 && endEle.val().replace(/\s/g,"").replace(/\-/g, '')){
 		   if(endTimeEle && endTimeEle.length>0){
 			   var endTime   = endTimeEle.timepicker('getTime');
 			   endDate = new Date($.datepicker.formatDate('yy/mm/dd', endEle.datepicker('getDate'))+' '+endTime.getHours()+':'+endTime.getMinutes());
 		   }else{
 			   endDate = new Date($.datepicker.formatDate('yy/mm/dd', endEle.datepicker('getDate')));    			   
 		   }
 	   }

 	   if(startDate && endDate){

			   var tmp_startDt = startEle.datepicker('getDate');
			   var tmp_endDt   = endEle.datepicker('getDate'); 
     	   if(startDate.getTime()>=endDate.getTime()){         	           		   
     		   if(eventType=='start'){        			   
     			   endEle.datepicker('setDate', new Date(startEle.datepicker('getDate').getTime()+startEle.data('diffTime')));        			   
     		   }else if(eventType=='end'){
     			   startEle.datepicker('setDate', tmp_endDt);
     		   }

     		   // 재세팅된 값을 다시 가져온다.
 			   tmp_startDt = startEle.datepicker('getDate');
 			   tmp_endDt   = endEle.datepicker('getDate');        		   
     		   
				   // 시간정보가 있을때
				   if(startTimeEle && startTimeEle.length>0 && endTimeEle && endTimeEle.length>0){  
					   
					   // 시작일자와 종료일자가 같을경우 
					   if(tmp_startDt.getTime()==tmp_endDt.getTime()){
						  
						    // 시작시간과 종료시간을 비교하여 재세팅해준다.
						    var tmpstartTime =  startTimeEle.val().split(':');
						    var tmpendTime   =  endTimeEle.val().split(':');
						    tmpstartTime[0]  =  parseInt(tmpstartTime[0]);
						    tmpendTime[0]    =  parseInt(tmpendTime[0]);
						    
					    	// 시작시간이 종료시간보다 더크거나 같을 경우 종료시간에 +1해준다.
						    if(tmpstartTime[0]>=tmpendTime[0]){  	  						    	
						    	tmpstartTime[0] = tmpstartTime[0]+1;
						    	
						    	if(tmpstartTime[0]>24){
						    		tmpstartTime[0] = 24;
						    	}
						    	
						    	tmpstartTime[0] = freemon.string.lpad(tmpstartTime[0]+'',2,'0');
						    	
	  		    				endTimeEle.timepicker('setTime', tmpstartTime.join(':'));
	  		    				//endTimeEle.timepicker('option','minTime', tmpstartTime.join(':'));
						    }
						    
					   }else if(tmp_startDt.getTime()<tmp_endDt.getTime()){  		  				   
			  				// 종료일자가 시작일자보다 클때는 시간선택에 제한이 없다.
			  				endTimeEle.timepicker('option','minTime', null);  					 
			  		   }
				   }
     	   }else{
     		   startEle.data('diffTime', tmp_endDt.getTime()-tmp_startDt.getTime());
     		   // ie dialog에서 날짜 선택 후 다시 캘린더가 뜨는 오류 수정을 위해 추가
     		  if(eventType=='start'){        			   
     			 startEle.datepicker('setDate', startEle.datepicker('getDate'));        			   
    		   }else if(eventType=='end'){
    			   endEle.datepicker('setDate', endEle.datepicker('getDate'));
    		   }
     	   }
 	   }else{
   		   // ie dialog에서 날짜 선택 후 다시 캘린더가 뜨는 오류 수정을 위해 추가 	   
 		  if(eventType=='start'){        			   
  			 	startEle.datepicker('setDate', startEle.datepicker('getDate'));        			   
 		   }else if(eventType=='end'){
 			   endEle.datepicker('setDate', endEle.datepicker('getDate'));
 		   }
 	   }
 	};

 	
 	CustomMap = function(){
 	     this.map = new Object();
 	};
 	 
 	CustomMap.prototype = {
 	    set : function(key, value){
 	        this.map[key] = value;
 	    },
 	    get : function(key){
 	        if(this.size() == 0)
 	        return '';
 	        return this.map[key];
 	    },
 	    containsKey : function(key){
 	        return key in this.map;
 	    },
 	    containsValue : function(value){
 	        for(var prop in this.map){
 	            if(this.map[prop] == value) return true;
 	        };
 	        return false;
 	    },
 	    isEmpty : function(){
 	        return (this.size() == 0);
 	    },
 	    clear : function(){
 	        for(var prop in this.map){
 	            delete this.map[prop];
 	        };
 	    },
 	    remove : function(key){
 	        delete this.map[key];
 	    },
 	    keys : function(){
 	        var keys = new Array();
 	        for(var prop in this.map){
 	            keys.push(prop);
 	        };
 	        return keys;
 	    },
 	    values : function(){
 	        var values = new Array();
 	        for(var prop in this.map){
 	            values.push(this.map[prop]);
 	        };
 	        return values;
 	    },
 	    size : function(){
 	        var count = 0;
 	        for (var prop in this.map) {
 	            count++;
 	        };
 	        return count;
 	    }
 	};
})( jQuery );