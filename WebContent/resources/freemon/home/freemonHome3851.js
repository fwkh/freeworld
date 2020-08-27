var freemonHome = {
	name : 'freemonHome',
	init : function() {
		ObserverControl.addObserver(this);
		this.beforeBind();
		this.bind();
	},
	beforeBind : function() {		
		freemonHome.fn.selectProjectList();
		freemonHome.fn.selectTalentList();
		freemonHome.fn.selectPopup();
		
		var today = new Date(), startDate = new Date(2019, (12 - 1), 19), endDate = new Date(2020, (1 - 1), 18);
        if(today >= startDate && today <= endDate) $("#excellent_patent_award").show();
	},
	bind : function() {
		if(freemon.ux.isMobileCheck() == true){
			// 모바일이라면
			$("#telConsulting").attr("href", "tel:1899-2951");
		}
		
		$('.section-wrap').on('click', "[data-action]", function(){
			freemonHome.fn.dataActionEnventHalnder($(this));
		});
	},
	fn :  {
		dataActionEnventHalnder : function(e){
			var action = e.data("action");
			if(action == "kakaoPlusTalkConsulting"){
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
			}
			else if(action == "projectDetail"){
				freemonHome.fn.goProjectDetail(e);
			}
			else if (action == "talentDetail"){
				freemonHome.fn.goTalentDetail(e);
			}
			else if(action == "noneAuth"){
				freemonHome.fn.authResult("로그인을 하시면 더 많은 정보를 확인 하실 수 있습니다.\n로그인 하시겠습니까?");
			}
			else if(action == "popupClose") {
				$(".ad").hide();
			}
			else if(action == "popupCookieClose") {
				freemon.http.setCookie("popupCookie", "N", 1);
				$(".ad").hide();
			}
			else if(action == "authUser"){
				freemon.ux.alert("기업고객님께는 제한된 정보입니다.");
				return false;
			}
			else if(action == "authCompany"){
				freemon.ux.alert("프리랜서님께는 제한된 정보입니다.");
				return false;
			}
		},
		selectTalentList : function() {
			var param = {
        			month : 3,
        			keywordList : null,
        			searchStrDate : $.datepicker.formatDate('yy-mm-dd', new Date()),
        			//availability : "career",
        			availability : "home",
        			careerStrt : "1",
        			careerEnd : "50",
	        		paging : {
		        		pageNo : 1,    
			            listBlock : 6
	        		}
			};
			var date = new Date();
			var searchDate = param.searchStrDate.split("-");
			var searchJoinPsblDt = 'old';
			if(parseInt(date.getFullYear()) == parseInt(searchDate[0]) && parseInt(date.getMonth() + 1) == parseInt(searchDate[1])) { searchJoinPsblDt = 'newly'; }
			param.searchJoinPsblDt = searchJoinPsblDt; 
			
			var option = {
				url : "/talent/selectTalentList",
				data : param,
				contentType : "application/json; charset=UTF-8",
				type : 'post',
				success : function(res, statusText) {
					var realObj = res.data;
					$('#talentSearchList').html('');
				
					realObj.month = 3; 
					var obj = freemon.ui.talentListRender(realObj);
					$('#talentSearchList').append(Mustache.render($('#talentSearchListTemplate').html(), {obj : obj }));
				}
			};
			freemon.http.ajax(option);
		},
		selectProjectList : function() {
			var date = new Date();
			var startDt = $.datepicker.formatDate('yy-mm', date) + "-01";
			date.setMonth(date.getMonth() + 3);
			var year = date.getFullYear();
			var day = freemon.util.daysInMonth(date.getMonth(), year);
			var month = date.getMonth();
			if(month < 10) month = "0" + month;

			var param = {
        			month : 3,
        			keywordList : null,
        			searchStrDate : $.datepicker.formatDate('yy-mm-dd', new Date()),
        			searchStrDate : startDt,
        			searchEndDate : year + "-" + month + "-" + day,
//        			orderBy : "new",
        			orderBy : "home",
	        		paging : {
		        		pageNo : 1,    
			            listBlock : 12
	        		}
        	} 
			var option = {
				url : "/project/selectProjectList",
				data : param,
				contentType : "application/json; charset=UTF-8",
				type : 'post',
				success : function(res, statusText) {
					var realObj = res.data;
					$('#projectSearchList').html('');
					
					realObj.month = 3;
					var obj = freemon.ui.projectListRender(realObj);
					$('#projectSearchList').append(Mustache.render($('#projectSearchListTemplate').html(), obj));
				}
			};
			freemon.http.ajax(option);
		},
		
		goProjectDetail : function(e){
			var map = new CustomMap();
			var sendUrl = "/project/projectDetail";
			map.set("project", e.parent().data("value"));
			freemon.util.getSend(sendUrl, map);			
		},
		goTalentDetail : function(e){
			var map = new CustomMap();			
			var sendUrl = "/talent/talentDetailSearch";
			map.set("fno", e.data("value"));
			freemon.util.getSend(sendUrl, map);
		},
		authResult : function(msg) {
			document.location.href = "/login/freemonLogin?url=/talent/talentSearch";
		},
		selectPopup : function(){
			var option = {
				url : "/home/selectPopup",
				data : {},
				contentType : "application/json; charset=UTF-8",
				type : 'post',
				success : function(res, statusText) {
					$('.ad').html('');
					if(res.data != null){
						if(freemon.http.getCookie("popupCookie") != "N"){
							$(".ad").css('display','table');
						}
						
						//$('.ad').append(Mustache.render($('#popupTemplate').html(), res.data));
						$(".ad").html(res.data.popImg);
					}
					else{
						$('.ad').hide();
					}
				}
			};
			freemon.http.ajax(option);
		}
	}
}