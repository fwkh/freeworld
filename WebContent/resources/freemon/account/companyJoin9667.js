var companyJoin = {
    name : 'companyJoin',
    data : {},
    bzRegNo : '',
	init : function() {
		ObserverControl.addObserver(this);
		this.beforeBind();
		this.bind();
	},
	beforeBind : function() {
		companyJoin.fn.validation();
	},
	bind : function() {
        // 전체동의
        $("#checkAll").click(function(){
            var chk = $(this).is(":checked");
            if(chk) $(".agrChk input").prop('checked', true);
            else  $(".agrChk input").prop('checked', false);
        });
        
        $(".joinAgreeList").click(function(){
        	$(this).parents('.has-sub').parents('.agree_list').children("ul").children("li").children("ul").hide();
        	$(this).parents('.has-sub').children('ul').show();
        });
        
        $("#mgrId").on('keyup', function(){
        	var str = $("#mgrId").val().substring($("#mgrId").val().indexOf("@"));
        	if(str.indexOf("@") != -1 && str.indexOf(".")){
        		companyJoin.fn.reduplicationCheck($("#mgrId").val());
        	}
        });
        
        $('#container').on('click', "[data-action]", function(){
        	companyJoin.fn.dataActionEnventHalnder($(this));
			return false;
		});
	},
	fn :  {
		dataActionEnventHalnder : function(e) {
			var action = e.data("action");
			if(action == "secondNext") {
//				$("#joinFirstClass").hide();
//				$(".join_step > ul.cf li").removeClass("active");
//				$(".join_step > ul.cf > li:nth-child(2)").addClass("active");
//				$("#joinSecondClass").show();
//				return false;
				var map = new CustomMap();
				map.set('authCd', "company");
            	freemon.util.postSend("/account/memberComplete", map);
			}
			else if(action == "updateSecond") {
				companyJoin.fn.companySecondUpdate();
			}
		},
		validation : function() {
			$('#registForm').validate({
				rules: {
					bzRegNo: {
						required: true,
						digits: true,
						minlength: 10
					},
					compNm: {
						required: true,
						minlength: 2
					},
					mgrId: {
						required: true,
						checkEmail: true,
					},
					pwd: {
						required: true,
						maxlength: 16,
						checkPwd: true,
						minlength : 8
					},
					pwdCheck: {
						required: true,
						minlength : 8,
						maxlength: 16,
						equalTo: "#pwd"
					},
					mgrNm: {
						required: true,
						minlength: 2,
						maxlength : 5
					},
					phone: {
						required: true,
						digits: true,
						minlength: 10,
						maxlength: 11,
						checkTelno:true
					},
					argCheck01: {
						required : true
					},
					argCheck02: {
						required : true
					}
				},
				messages: {
					bzRegNo: {
						required: '사업자번호를 입력하세요.',
						digits : '사업자번호는 숫자만 입력해주세요',
						minlength: "유효하지 않은 사업자번호 입니다."
					},
					compNm: {
						required: '회사명을 입력하세요.',
						minlength: $.validator.format( "회사명을 {0}자 이상 입력하세요." )
					},
					mgrId: {
						required: '이메일주소를 입력하세요.',
						checkEmail: "유효하지 않은 이메일주소입니다."
					},
					pwd: {
						required: '비밀번호를 입력하세요.',
						checkPwd: "비밀번호는 최소 8자, 최소 하나 이상의 문자, 숫자, 특수문자가 포함되어야 합니다.",
						minlength: $.validator.format( "비밀번호는 {0}자 이상 입력하세요." ),
						maxlength : $.validator.format( "비밀번호는 최대 {0}자까지입니다." )
					},
					pwdCheck: {
						required: '비밀번호 확인을 입력하세요.',
						equalTo: "비밀번호가 일치하지 않습니다.",
						minlength: $.validator.format( "비밀번호는 {0}자 이상 입력하세요." ),
						maxlength : $.validator.format( "비밀번호는 최대 {0}자까지입니다." )
					},
					mgrNm: {
						required: '담당자 이름을 입력하세요.',
						minlength: $.validator.format( "담당자 이름을 {0}자 이상 입력하세요." ),
						maxlength : $.validator.format( "담당자 이름은 최대 {0}자까지입니다." )
					},
					phone: {
						required: '담당자 휴대폰번호를 입력하세요.',
						digits : '담당자 휴대폰번호는 숫자만 입력해주세요.',
						maxlength: $.validator.format( "담당자 휴대폰번호는 {0}자를 넘을 수 없습니다." ),
						minlength: $.validator.format( "담당자 휴대폰번호는 {0}자 이상 입력하세요." ),
						checkTelno : '담당자 휴대폰번호는 숫자만 입력가능합니다.'
					},
					argCheck01: {
						required: '회원약관에 동의해주세요.'
					},
					argCheck02: {
						required: '개인정보수집에 동의해주세요.'
					}
                },submitHandler: function(form) {
                	companyJoin.fn.companyRegist();
		        },
		        onfocusout: false,
		        invalidHandler: function(form, validator) {
		            var errors = validator.numberOfInvalids();
		            if (errors) {                    
		                validator.errorList[0].element.focus();
		            }
		        }
			});
		},
		BiznoCheck : function(){
			var param = freemon.data.createJSONFromForm('registForm');
			var option = {
				url : "/account/CorpCheck",
				data : param,
				dataType : 'json',
				target : document.body,
				contentType : "application/json; charset=UTF-8",
				type : 'post',
				success : function(res, statusText) {
					companyJoin.fn.companyRegist(res);
                },
                error : function(res){
                }
			};
			freemon.http.ajax(option);
		},
		companyRegist : function() {
			var param = freemon.data.createJSONFromForm('registForm');
					
			/*if(r == '{}'){
				freemon.ux.alert('회사 정보를 찾을 수 없습니다.\n사업자 번호 또는 회사 명을 확인해주세요');
            	return false;
            }
			var result = JSON.parse(r);
            if(param.bzRegNo.substring(0, 6) != result.bzowrRgstNo.substring(0,6)){
            	freemon.ux.alert('입력하신 사업자 번호가 일치하지않습니다.');
            	return false;
            }*/
            
			companyJoin.bzRegNo = param.bzRegNo;
            param.pwd = SHA256(param.pwd);
            // 앞뒤 공백 없애줌
            var compNmTrim = param.compNm.trim();
		    param.compNm = compNmTrim;
		    if(!compNmTrim || compNmTrim == ""){
		        $("#compNm").val("");
		        freemon.ux.alert("회사명을 입력하세요.");
		        return false;
		    }
            // 앞뒤 공백 없애줌
		    var mgrNmTrim = param.mgrNm.trim();
		    param.mgrNm = mgrNmTrim;
		    if(!mgrNmTrim || mgrNmTrim == ""){
		        $("#mgrNm").val("");
		        freemon.ux.alert("담당자 이름을 입력하세요.");
		        return false;
		    }
            delete param['pwdCheck'];
            
            var option = {
                url : "/account/companyRegist",
                data : param,
                dataType : 'json',
                target : document.body,
                contentType : "application/json; charset=UTF-8",
                type : 'post',
                success : function(res, statusText) {
                	$("#joinFirstClass").hide();
    				$(".join_step > ul.cf li").removeClass("active");
    				$(".join_step > ul.cf > li:nth-child(2)").addClass("active");
    				$("#joinSecondClass").show();
    				return false;
                }
            };
            freemon.http.ajax(option);
        },
        companySecondUpdate : function(){
        	var param = freemon.data.createJSONFromForm('secondForm');
        	param.bzRegNo = (companyJoin.bzRegNo == '') ? $("#bzRegNo").val() : companyJoin.bzRegNo;
        	
        	if(param.bzRegNo == ''){
        		freemon.ux.confirm('회사소개를 등록할 수 없습니다. 로그인후 정보변경에서 수정가능합니다.',
				    function() {
	        			var map = new CustomMap();
	    				map.set('authCd', "company");
	                	freemon.util.postSend("/account/memberComplete", map);
				    },
				    function() {
				    	var map = new CustomMap();
	    				map.set('authCd', "company");
	                	freemon.util.postSend("/account/memberComplete", map);
				    }
				);
				return false;
        	}
        	
        	var option = {
                url : "/account/companySecondRegist",
                data : param,
                dataType : 'json',
                target : document.body,
                contentType : "application/json; charset=UTF-8",
                type : 'post',
                success : function(res, statusText) {
                	var map = new CustomMap();
    				map.set('authCd', "company");
                	freemon.util.postSend("/account/memberComplete", map);
                }
            };
            freemon.http.ajax(option);
        },
        /*
        CustominitForm : function() {
            $('input[id="pwd"]').val("");
            $('input[id="pwdCheck"]').val("");
        },
        */
        reduplicationCheck : function(val) {
        	var option = {
                url : "/account/reduplicationCheck",
                data : {'mgrId':val},
                dataType : 'json',
                target : document.body,
                contentType : "application/json; charset=UTF-8",
                type : 'post',
                success : function(res, statusText) {}
            };
            freemon.http.ajax(option);
        }
	}
}
