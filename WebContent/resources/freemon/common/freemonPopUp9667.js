var freemonPopUp = {
	name : 'freemonPopUp',
	div : "",
	userDiv : "",
	alamnObj : null,
	fno : "",
	nM : "",
	dv : "",
	init : function() {
		ObserverControl.addObserver(this);
		this.beforeBind();
		this.bind();
	},
	beforeBind : function() {
	},
	bind : function() {
		$(".project_in").on("click", ".close", function(){ freemon.ux.hidePopup('.pop_bg'); $("#projectInTalentList").html(''); $("#textarea").val(""); });
		$('.project_in').on('click', function(e) {
			if(e.target.className == "pop_bg"){ freemon.ux.hidePopup('.pop_bg'); $("#projectInTalentList").html(""); $("#textarea").val(""); } 
		});
		
		$("#popInfoData").on('click', '.pop_header > a.close', function() {
			freemon.ux.hidePopup('#popInfoData');
		});
		$("#popInfoData").on('click', function(e) {
			if(e.target.className == "pop_bg"){ freemon.ux.hidePopup('#popInfoData'); }
		});
		$('#popAlertData').on('click', '.pop_header > a.close', function() {
			freemon.ux.hidePopup('#popAlertData');
		});
		$('#popAlertData').on('click', function(e) {
			if(e.target.className == "pop_bg"){ freemon.ux.hidePopup('#popAlertData'); } 
		});

		$(".common-open_popup").click(function(){
			var div = $(this).attr("data-div");
			var userdiv = $(this).attr("data-user-div");
			freemonPopUp.div = div;
			freemonPopUp.userDiv = userdiv;
			
			$("#popInfoData").html('');
			
			switch(div){
				case "alamn":
					freemonPopUp.fn.selectAlamnList();
					break;
				case "closed":
					$("#popInfoData").append(Mustache.render($('#popClosedTemplate').html(), freemonPopUp.alamnObj));
					break;
			}
			
			freemon.ux.showPopup('#popInfoData');
		});
		
		$('#popInfoData').on('click', '#btnAlamn', function() {
			freemonPopUp.fn.registAlamnForm();
		});
		$('#popInfoData').on('click', '#btnClosed', function() {
			if(freemonPopUp.userDiv == "company"){
				if($("#pincode").val() == "") {
					freemon.ux.alert("비밀번호를 입력해주세요.");
					return false;
				}
			}
			if($("#agrChk").is(":checked") == false){
				freemon.ux.alert("회원탈퇴 안내사항을 확인해 주세요.");
				return false;
			}
			
			freemon.ux.confirm('그동안 프리몬을 이용해 주셔서 감사합니다.\n회원님께 알맞는 정보와 서비스를 제공하기위해 항상 노력합니다.\n탈퇴를 원하시나요?',
			    function() {
					freemonPopUp.fn.registClosedForm();
			    },
			    function() {}
			);
			return false;
		});
		
		$('#popInfoData').on('click', '#btn', function() {
			freemonPopUp.fn.talentMemoRegist();
		});
		
		$(".noLogin").click(function(){
//			freemon.ux.confirm('로그인을 하시면 더 많은 정보를 확인 하실 수 있습니다.\n로그인 하시겠습니까?',
//			    function() {
					document.location.href = "/login/freemonLogin";
//			    },
//			    function() {}
//			);
		});
		
		$(".kakaoPlusTalk").click(function(){
			//카카오플러스 상담
			try {
				if( /Android/i.test(navigator.userAgent)) {
					freemon_app.fnKakaoPlusChat();
				}
				else if (/iPhone|iPad|iPod/i.test(navigator.userAgent)) {
					window.webkit.messageHandlers.nativeKakaoLogin.postMessage("카카오플러스친구");	
				}
				else {
					freemon_app.fnKakaoPlusChat();
				}
				return false;
			} catch(err) {
				console.log(err);
			}
			
			window.open('http://pf.kakao.com/_IxhlCC/chat');
		});
	},
	fn :  {
		selectAlamnList : function(param, isLoad) {	
			var option = {
				url : "/mypage/selectAlamnList",
				data : {userRole:freemonPopUp.userDiv},
				contentType : "application/json; charset=UTF-8",
				type : 'post',
				success : function(res, statusText) {
					$.each(res.data, function(i, data) {
						if(data.almVal == 'Y'){
							data.almVal = true;
						}
						else{
							data.almVal = false;
						}
						data.isDesc = function(){
							if(data.alamnDesc != null && data.alamnDesc != "") return true;
							else return false;
						}
					});
					
					freemonPopUp.alamnObj = res;
					
					$("#popInfoData").append(Mustache.render($('#popAlamnTemplate').html(), res));
				}
			};
			freemon.http.ajax(option);
		},
		registAlamnForm : function(){
			var param = freemon.data.createJSONFromForm('popAlarmForm');
			var paramData = [];
			
			$.each(freemonPopUp.alamnObj.data, function(i, data) {
				paramData.push({
					'alamnClsCd' : data.alamnClsCd,
					'almVal' : ($('input[name=alamn' + data.alamnClsCd + ']:checked').val() == undefined) ? "N" : $('input[name=alamn' + data.alamnClsCd + ']:checked').val()
					});
			});
			
			param.alamnList = paramData;

			var option = {
				url : "/mypage/updateAlamn",
				data : param,
				contentType : "application/json; charset=UTF-8",
				type : 'post',
				success : function(res, statusText) {
					freemon.ux.alert("알림설정이 변경되었습니다.");
				}
			};
			freemon.http.ajax(option);
		},
		registClosedForm : function(){
			
			var param = freemon.data.createJSONFromForm('popForm');
			if(freemonPopUp.userDiv == "company"){
				if(param.pincode == "") {
					freemon.ux.alert("비밀번호를 입력해주세요.");
					return false;
				}
			}
			param.userRole = freemonPopUp.userDiv;
			param.pincode = SHA256(param.pincode);
				
			var option = {
				url : "/mypage/updateSecession",
				data : param,
				contentType : "application/json; charset=UTF-8",
				type : 'post',
				success : function(res, statusText) {
					var option = {
						url : "/login/logout",
						data : {},
						contentType : "application/json; charset=UTF-8",
						type : 'post',
						success : function(res, statusText) {
							document.location.href = "/login/logoutComplete";
						}
					};
					freemon.http.ajax(option);
						
					//alert("로그아웃 처리되었습니다.\n프리몬을 다시 이용하시기 위해서는 회원가입을 하셔야 합니다.");
					//document.location.href = "/login/logout";
					//freemon.ux.alertLayer(null, "로그아웃 처리되었습니다.<br/>프리몬을 다시 이용하시기 위해서는 회원가입을 하셔야 합니다.", true, "확인", "freemonPopUp.fn.logout", null, "/login/logout", "small");
				}
			};
			freemon.http.ajax(option);
		},
		talentMemo : function($this, dv) {
			dv = typeof dv !== 'undefined' ? dv : "";
			   
			$("#popInfoData").html('');
			freemonPopUp.dv = dv;
			
			freemonPopUp.fno = $this.attr("data-value");
			freemonPopUp.nM = $this.attr("data-name");
			var obj = {};
			obj.name = "\"" + $this.attr("data-name") + "\" 님을 위한 메모";
			obj.memo = "";
			var option = {
				url : "/mypage/memoSearch",
				data : {'userId':freemonPopUp.fno},
				contentType : "application/json; charset=UTF-8",
				type : 'post',
				success : function(res, statusText) {
					
					if(res.data != null){
						obj.memo = res.data.memo;
					}
					
					$("#popInfoData").html(Mustache.render($('#popMemoTemplate').html(), obj));
				}
			};
			freemon.http.ajax(option);
			
			freemon.ux.showPopup('#popInfoData');
		},
		talentMemoRegist : function($this) {
			
			if(!$("#memo").val()){
				freemon.ux.alert("메모 내용을 입력해주세요.");
				$("#memo").focus();
				return false;
			}
			
			freemon.ui.showLoading();
			
			var option = {
				url : "/mypage/memoRegist",
				data : {'userId':freemonPopUp.fno, 'memo': $("#memo").val()},
				contentType : "application/json; charset=UTF-8",
				type : 'post',
				success : function(res, statusText) {
					res.data.name = "\"" + freemonPopUp.nM + "\" 님을 위한 메모";
					
					$("#popInfoData").html(Mustache.render($('#popMemoTemplate').html(), res.data));
					
					freemon.ui.hideLoading();
					
					var ref = document.location.pathname;
					if(ref == "/applicant/compApplicantSearch"){
						var para = $.jsonQueryParams(window.location.search);
						if(freemonPopUp.dv != "" && freemonPopUp.dv != undefined) para.dv = freemonPopUp.dv;
						//var url = ref.split('?');
						//document.location.href = ref.split('?')[0] + "?" + $.param(para);
						document.location.href = ref + "?" + $.param(para);
					}
					else{
						document.location.reload();
					}
				}
			};
			freemon.http.ajax(option);
		},
		getActivityLog : function(){
			var option = {
				url : "/home/getActivityLog",
				data : {},
				contentType : "application/json; charset=UTF-8",
				type : 'post',
				success : function(res, statusText) {
				}
			};
			freemon.http.ajax(option);
		},
		openCommunicationPopup : function(val, element){
			freemon.ux.showPopup('#pop_communication');
			$("#pop_communication > div.pop > div.pop_header > h3").html(val.nm + "님에게 메시지를 보냅니다.");
			$('#communicationList').html('');
			freemonPopUp.fn.selectCommunicationList(val, element);
		},
		selectCommunicationList : function(val, element){
			var param = {}; param.idx = val.idx, param.mngId = val.fno, param.userId = val.fno;
			var option = {
				url : "/common/selectCommunicationList",
				data : param,
				contentType : "application/json; charset=UTF-8",
				type : 'post',
				success : function(res, statusText) {
					$.each(res.data.inqueryList, function(i, data2){
						data2.isCancel = function(){
							if(data2.applcntDivCd == '4') return true;
							else return false;
						}

						if(data2.applcntDivCd == '1') data2.applicantStr = "지원을";
						else if(data2.applcntDivCd == '2') data2.applicantStr = "계약을";
						else if(data2.applcntDivCd == '3') data2.applicantStr = "제안을";
						else if(data2.applcntDivCd == '4') data2.applicantStr = "제안취소를";
						else if(data2.applcntDivCd == '5') data2.applicantStr = "지원취소를";
						else data2.applicantStr = "메시지를";
						
						data2.inqDtl = freemon.string.trim(data2.inqDtl);
						if(data2.inqDtl != null && data2.inqDtl != '') data2.inqDtl = data2.inqDtl.replace(/(?:\r\n|\r|\n)/g, '<br />');
						else data2.inqDtl = "프리몬에서 " + data2.applicantStr + " 알려드립니다.";
					});
					
					//$('#communicationList').append(Mustache.render($('#communicationListTemplate').html(), res.data));
					$(element).append(Mustache.render($('#communicationListTemplate').html(), res.data));
					$(element).scrollTop($(element).prop('scrollHeight'));
				}
			};
			freemon.http.ajax(option);
		},
		communicationTalkSave : function(val) { 
			var param = {}; param.idx = val.idx, param.mngId = val.fno, param.userId = val.fno, param.inqDtl = $("#talk").val(), param.prpstIdx = val.proidx; param.applcntIdx = val.appidx;
			console.log(param);
//			return false;
			if(!param.inqDtl){
				freemon.ux.alert("남기고 싶은 내용을 입력하세요.");
				return false;
			}
			var option = {
					url : "/common/communicationTalkSave",
					data : param,
					contentType : "application/json; charset=UTF-8",
					type : 'post',
					success : function(res, statusText) {
						$('#communicationList').append(Mustache.render($('#communicationListTemplate').html(), {'inqueryList' : res.data}));
						$("#talk").val('');
						$('#communicationList').scrollTop($('#communicationList').prop('scrollHeight'));
						
						var ref = document.location.pathname;
						if(ref == "/applicant/talentApplicantSearch"){
							var idx = res.data.idx;
							$("#loadCommunicationList"+idx).html('');
							freemonPopUp.fn.selectCommunicationList(val, '#loadCommunicationList'+idx);
                        }else{
							$("#loadCommunicationList").html('');
							freemonPopUp.fn.selectCommunicationList(val, '#loadCommunicationList');
                        }
					}
				};
				freemon.http.ajax(option);
		},
		selectTagList : function(val){
			var param = {}; param.upperCdVal = val;
			var option = {
				url : "/common/selectTagList",
				data : param,
				contentType : "application/json; charset=UTF-8",
				type : 'post',
				success : function(res, statusText) {
					$.each(res.data, function(i, data){
						$('.recom dd').append("<a href='javascript:void(0);' data-action='searchTag' data-value='" + data.cdVal + "'>" + data.cdVal + "</a>");
					});
				}
			};
			freemon.http.ajax(option);
		},
		tagHover : function(){ 
			$("dl.recom").find('a').removeClass('hover');
			
			var keywordArr = $("#keyword").val().split(' ');
			$.each(keywordArr, function(i, data){
				$('dl.recom').find('a').each(function(){
					if(data.toUpperCase() == $(this).text().toUpperCase()){
						$(this).addClass('hover');
					}
				});
			});
		}
	}
}