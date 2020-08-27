var freemonLogin = {
	name : 'freemonLogin',
	fcmToken : "",
	init : function() {
		
		ObserverControl.addObserver(this);
		this.beforeBind();
		this.bind();
	},
	beforeBind : function() {
		if(freemon.ux.isMobileCheck() == true && "${pcMode.sessionMobile}" != "PC"){
			document.location.href = "https://m.freemon.co.kr/m/login/freemonLogin";
			return false;
		}
		Kakao.init(frameworkProperties.kakaoAppKey);
		freemonLogin.fn.initUserId();
	},
	bind : function() {
		// 카카오톡 연동 로그인
		$('.freemonLoginBtn').click(function() {
			try {
				if( /Android/i.test(navigator.userAgent)) {
					freemon_app.fnKaKaoLogin();
				}
				else if (/iPhone|iPad|iPod/i.test(navigator.userAgent)) {
					window.webkit.messageHandlers.nativeKakaoLogin.postMessage("카카오로그인");	
				}
				else {
					freemon_app.fnKaKaoLogin();
				}
				return false;
			} catch(err) {
				console.log(err);
			}
			
			if(freemon.ux.isMobileCheck() == true){
				Kakao.Auth.login({
					success: function(authObj) {
						freemonLogin.fn.kakaoLogin(authObj);
			        },
			        fail: function(err) {
			        	alert(JSON.stringify(err));
			        }
				});
			}
			else{
				Kakao.Auth.loginForm({
					success : function(authObj) {
						freemonLogin.fn.kakaoLogin(authObj);
					},
					fail : function(err) {
						alert(JSON.stringify(err));
					}
				});
			}
		});
		
		// 기업 로그인
		$('#companyloginBtn').click(function() {
			freemonLogin.fn.companyLogin();
		});
		
		// 기업 회원가입
		$('#companyJoinBtn').click(function() {
			freemonLogin.fn.companyJoin();
		});
		
		// 비밀번호 입력 후 엔터키 입력
		$("#companyPwd").keyup(function(e){
			if(e.keyCode == 13) {
				freemonLogin.fn.companyLogin();
			}
		});
		
		$(".underline").click(function(){
			freemon.ux.showPopup('#idfind_pop');
		});
		$('.close').on('click', function() {
			freemon.ux.hidePopup('#idfind_pop');
		});
		$("#btnFindId").click(function(){
			freemonLogin.fn.findIdentity();
		});
		$("#btnFindPwd").click(function(){
			freemonLogin.fn.findPincode();
		});
	},
	fn :  {
		/*
		 * 카카오톡 로그인
		 * 
		 * @param param : 카카오톡 연동후 넘어온 데이타
		 */
		kakaoLogin : function(param) {
		    param.device="P";
			var option = {
				url : "/login/kakaoLogin",
				data : param,
				dataType : 'json',
				target : document.body,
				contentType : "application/json; charset=UTF-8",
				type : 'post',
				success : function(res, statusText) {
					
					var map = new CustomMap();
					map.set('username', res.data.userId);
					map.set('userNm', res.data.korNm); 
					map.set('userpw', res.data.userId);
					map.set('accessToken', res.data.accessToken);
					map.set('profileUrl', res.data.kkoPrfUrl);
					if(res.data.useYn == "N") {
						var d = res.data;
						map.clear();
						for(var key in d){
							map.set(key, d[key]);
						}
						freemon.util.postSend("/account/memberConfig", map);						
					}else{
						//map.set('targetUrlParameter', "/project/projectSearch");
						map.set('targetUrlParameter', "/mypage/myFreemon");
						freemon.util.postSend("/j_spring_security_check", map);
					}
				}
			};
			freemon.http.ajax(option);
		},
		/*
		 * 기업 로그인
		 */
		companyLogin : function() {
			var param = freemon.data.createJSONFromForm('login_form');
			var userId = param.companyUserId;
			var pwd = param.companyPwd;
				param.fcmDeviceToken = freemonLogin.fn.fcmToken;
			
			if(!userId) {
				freemon.ux.alert('이메일을 입력하세요.');
				$('#companyUserId').focus();
				return;
			} else if(!pwd) {
				freemon.ux.alert('비밀번호를 입력하세요.');
				$('#companyPwd').focus();
				return;
			}
			param.userId = userId;
			param.pwd = SHA256(pwd);
			param.device="P";

			var option = {
				url : "/login/companyLogin",
				data : param,
				dataType : 'json',
				target : document.body,
				contentType : "application/json; charset=UTF-8",
				type : 'post',
				success : function(res, statusText) {
					
					var map = new CustomMap();
					map.set('username', res.data.mgrId); 
					map.set('userpw', res.data.mgrId); 
					map.set('userNm', res.data.mgrNm); 
					
					if($("input[name='chkIdSave']").is(":checked")){ 
		                var userId = $("input[name='companyUserId']").val();
		                freemon.http.setCookie("companyUserId", userId, 5);
		            }else{
		            	freemon.http.deleteCookie("companyUserId");
		            }
					map.set('targetUrlParameter', "/mypage/myFreemon");
					freemon.util.postSend("/j_spring_security_check", map);
				}
			};
			freemon.http.ajax(option);
		},
		/*
		 * 기업 회원가입
		 */
		companyJoin : function() {
			location.href = '/account/companyJoin';
		},
		findIdentity : function() {
			if(!$("#userNm").val()){
				freemon.ux.alert("이름을 입력하세요.");
				$("#userNm").focus();
				return false;
			}
			if(!$("#telNo").val()){
				freemon.ux.alert("휴대폰번호를 입력하세요.");
				$("#telNo").focus();
				return false;
			}
			else{
				if(!(/^[0-9]+$/).test($("#telNo").val())){
					freemon.ux.alert("숫자만 입력가능합니다.");
					return false;
				}
			}
			var param = {};
			param.mgrNm = $("#userNm").val();
			param.phone = $("#telNo").val();
			
			freemon.ui.showLoading();

			var option = {
				url : "/login/findIdentity",
				data : param,
				dataType : 'json',
				contentType : "application/json; charset=UTF-8",
				type : 'post',
				success : function(res, statusText) {
					
					freemon.ui.hideLoading();
					$('.close').trigger('click');
					
					if(statusText == "success") {
						$("#userNm").val("");
						$("#telNo").val("");
						
						freemon.ux.alert("카카오톡으로 아이디를 전송했습니다.");

						return false;
					}
					else {
						freemon.ux.alert(res.data);
					}
				}
			};
			freemon.http.ajax(option);
		},
		findPincode : function() {
			if(!$("#userId").val()){
				freemon.ux.alert("아이디를 입력하세요.");
				$("#userId").focus();
				return false;
			}
			if(!$("#mngNm").val()){
				freemon.ux.alert("이름을 입력하세요.");
				$("#mngNm").focus();
				return false;
			}
			if(!$("#phone").val()){
				freemon.ux.alert("휴대폰번호를 입력하세요.");
				$("#phone").focus();
				return false;
			}
			else{
				if(!(/^[0-9]+$/).test($("#phone").val())){
					freemon.ux.alert("숫자만 입력가능합니다.");
					return false;
				}
			}
			var param = {};
			param.mgrNm = $("#mngNm").val();
			param.phone = $("#phone").val();
			param.mgrId = $("#userId").val();
			
			freemon.ui.showLoading();
			
			var option = {
				url : "/login/findPinIdentity",
				data : param,
				dataType : 'json',
				contentType : "application/json; charset=UTF-8",
				type : 'post',
				success : function(res, statusText) {
					
					freemon.ui.hideLoading();
					$('.close').trigger('click');
					
					if(statusText == "success") {
						$("#mngNm").val("");
						$("#phone").val("");
						$("#userId").val("");
						
						freemon.ux.alert("카카오톡으로 임시비밀번호를 전송했습니다.");
					}
					else{
						freemon.ux.alert(res.data);
					}
					return false;
				}
			};
			freemon.http.ajax(option);
		},
		initUserId : function(){
			var userId = freemon.http.getCookie("companyUserId"); 
	        $("input[name='companyUserId']").val(userId); 
	         
	        if($("input[name='companyUserId']").val() != ""){ // Cookie에 만료되지 않은 아이디가 있어 입력됬으면 체크박스가 체크되도록 표시
	            $("input[name='chkIdSave']").attr("checked", true);
	        }
		},
		nativeSetToken : function(val) {
			freemonLogin.fn.fcmToken = val;
		},
		nativeCallLogin : function(val) {
			var obj = jQuery.parseJSON(val);
			var param = {};
			param.userId = obj.userId;
			param.email = obj.email;
			param.kkoPrfUrl = obj.thumbnail_image;
			param.pwd = obj.pwd;
			param.korNm = obj.nickname;
			param.accessToken = obj.accessToken;
			param.fcmDeviceToken = obj.accessToken;
			
			var option = {
				url : "/login/nativeKakaoLogin",
				data : param,
				dataType : 'json',
				target : document.body,
				contentType : "application/json; charset=UTF-8",
				type : 'post',
				success : function(res, statusText) {
					var map = new CustomMap();
					map.set('username', res.data.userId);
					map.set('userNm', res.data.korNm); 
					map.set('userpw', res.data.userId);
					map.set('accessToken', res.data.accessToken);
					map.set('profileUrl', res.data.kkoPrfUrl);
					if(res.data.useYn == "N") {
						var d = res.data;
						map.clear();
						for(var key in d){
							map.set(key, d[key]);
						}
						freemon.util.postSend("/m/account/memberConfig", map);						
					}else{
						map.set('targetUrlParameter', "/m/mypage/myFreemon");
						freemon.util.postSend("/j_spring_security_check", map);
					}
				}
			};
			freemon.http.ajax(option);
		}
	}
}