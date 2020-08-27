var questionRegist = {
	name : 'questionRegist',
	param : {},
	init : function() {
		ObserverControl.addObserver(this);
		this.beforeBind();
		this.bind();
	},
	beforeBind : function() {
		questionRegist.fn.selectQuestionTypeList();
		questionRegist.fn.validation();
	},
	bind : function() {
	},
	fn : {
		selectQuestionTypeList : function() {
			var option = {
				url : "/common/selectCodeList",
				data : {
					'cdId' : 'INQUERY_CD'
				},
				contentType : "application/json; charset=UTF-8",
				type : 'post',
				success : function(res, statusText) {
					$('#type').append(
						Mustache.render($('#typeListTemplate').html(), {
							'typeList' : res.data
						}));
					
					// 멘토신청일 경우 미리 선택
					var aTag = window.location.href.substring(window.location.href.indexOf("#")+1);
					if(aTag == "mentor"){
						$("#type").val('3');
					}
				}
			};
			freemon.http.ajax(option);
		},
		validation : function() {
			$('#registForm').validate({
				rules : {
					name : "required",
					telNo: {
						digits: true,
						minlength: 10,
						maxlength: 11
					},
					email: {
						checkEmail: true
					}
				},
				messages : {
					type : "문의종류를 선택해주세요.",
					name : "이름을 입력해주세요.",
					telNo: {
						required: '전화번호를 입력해주세요.',
						digits: '전화번호는 숫자만 입력해주세요',
						maxlength: $.validator.format( "전화번호는 {0}자를 넘을 수 없습니다. " ),
						minlength: $.validator.format( "전화번호를 {0}자 이상 입력하세요." )
					},
					email: {
						required: '이메일을 입력해주세요.',
						checkEmail: "유효하지 않은 이메일주소입니다."
					},
					contents : "문의 내용을 입력해주세요"
				},
				submitHandler : function(form) {
					questionRegist.fn.questionRegist();
				}
			})
		},
		questionRegist : function() {
			
			var regExpTelNo = /^[0-9]+$/;
			var regExpEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			var param = freemon.data.createJSONFromForm('registForm');
			
			if(!$("input:checkbox[id='chk']").is(":checked")){
				freemon.ux.alert('개인정보 수집 및 이용안내를 체크해주세요');
				return false;
			}
			
			var option = {
				url : "/customer/questionRegist",
				data : param,
				contentType : "application/json; charset=UTF-8",
				type : 'post',
				success : function(res, statusText) {
					freemon.util.postSend("/customer/questionComplete");
				}
			}
			
			freemon.http.ajax(option);
		}
	}
}