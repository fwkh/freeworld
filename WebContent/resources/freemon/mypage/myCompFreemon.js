var myCompFreemon = {
	name : 'myCompFreemon',
	param : {},
	isChange : true,
	listObj : null,
	isList : false,
	init : function() {
		ObserverControl.addObserver(this);
		this.beforeBind();
		this.bind();
	},
	beforeBind : function() {
		myCompFreemon.fn.selectMyProject();
	},
	bind : function() {		
		$('#container').on('click', "[data-action]", function(){
			myCompFreemon.fn.dataActionEnventHalnder($(this));
		});
		
		$("#projectInTalentList").on("click", ".close", function(){ freemon.ux.hidePopup('.pop_bg'); $("#projectInTalentList").html(''); });
		$('#projectInTalentList').on('click', function(e) {
			if(e.target.className == "pop_bg"){ freemon.ux.hidePopup('.pop_bg'); $("#projectInTalentList").html(""); } 
		});
	},
	fn :  {
		dataActionEnventHalnder : function(e){
			var action = e.data("action");
			var map = new CustomMap();
			if (action == "projectDetail"){
				if(e.data("id")){
					var sendUrl = "./myProjectDetail";
					map.set("fno", e.data("id"));
					freemon.util.getSend(sendUrl, map);
				}
			}
			else if (action == "applicantList"){		
				var sendUrl = "./myProjectDetail";
				map.set("fno", e.data("id") + "#applicantList");
				freemon.util.getSend(sendUrl, map);
			}
			else if (action == "contractList"){		
				var sendUrl = "./myProjectDetail";
				map.set("fno", e.data("id") + "#contractList");
				freemon.util.getSend(sendUrl, map);
			}
			else if (action == "talentDetail") {
				var sendUrl = "/talent/talentDetailSearch";
				map.set("fno", e.data("id"));
				map.set("dv", e.data("dv"));
				freemon.util.getSend(sendUrl, map);
			}
			else if (action == "proposeDetail") {
				var sendUrl = "/talent/talentProposeDetail";
				map.set("fno", e.data("id"));
				map.set("dv", e.data("dv"));
				map.set("prpstidx", e.data("app"));
				map.set("idx", e.data("projidx"));
				freemon.util.getSend(sendUrl, map);
			}
			else if (action == "applicantDetail") {
				var sendUrl = "/talent/talentAppliDetailSearch";
				map.set("fno", e.data("id"));
				map.set("applicntidx", e.data("app"));
				map.set("dv", e.data("dv"));
				map.set("idx", e.data("projidx"));
				freemon.util.getSend(sendUrl, map);
			}
			else if (action == "relationTalent") {
				myCompFreemon.fn.relationInTalentList(e);
			}
			else if (action == "talentMeno") {
				freemonPopUp.fn.talentMemo(e);
			}
			else if (action == "talentInterest") {
				myCompFreemon.fn.toggleInterestTalent(e);
			}
			else if (action == "talentExclusive") {
				freemon.ux.toggleExclusiveTalent(e);
			}
		},
		selectMyProject : function(isLoad) {
			myCompFreemon.param = {
				paging : {
		            pageNo : 1,        // 현재 선택된 페이지 번호
		            listBlock : 4,    // 목록의 출력 갯수
				}
			}
			
			var option = {
				url : "/mypage/selectmyProject",
				data : myCompFreemon.param,
				contentType : "application/json; charset=UTF-8",
				type : 'post',
				success : function(res, statusText) {
					myCompFreemon.fn.projectListRender(res.data, true);
					myCompFreemon.fn.selectProposeApplicantProject();
				}
			};
			freemon.http.ajax(option);
		},  
		projectListRender : function(obj, isSearch) {
			if(isSearch){
				$('#myProjectList').html('');
			}
			
			$.each(obj.projectList, function(i, data) {				
				// 마감임박
				var projStrtDt = data.projStrtDt.replace(".","-").replace(".","-");
				var projectDateDiff = freemon.util.calcDayMonthCount(freemon.util.getStringFromDate(new Date()), projStrtDt.substr(0,10), 'D');
				data.isDeadline = function(){
					if(projectDateDiff < 7 && projectDateDiff >= 0) return true;
					else return false;
				}
				
				data.isClosed = function() {
					if(data.closeYn == "Y") {
						return true;
					} else {
						return false;
					}
				}
				var isnegoYn = false;
                if(data.negoYn == "Y"){
                	isnegoYn=true;
                }
                data.negoYn=isnegoYn;
                
				data.isApplicantCount = function(){
					if(data.applicantCount > 0) return true;
					else return false;
				}
				data.isContractCount = function(){
					if(data.contractCount > 0) return true;
					else return false;
				}
			});
			$('#myProjectList').append(Mustache.render($('#myProjectListTemplate').html(), obj));
		},
		selectProposeApplicantProject : function(isLoad) {
			myCompFreemon.param = {
				paging : {
		            pageNo : 1,        // 현재 선택된 페이지 번호
		            listBlock : 3,    // 목록의 출력 갯수
				}
			}
			
			var option = {
				url : "/mypage/selectProposeApplicantProject",
				data : myCompFreemon.param,
				contentType : "application/json; charset=UTF-8",
				type : 'post',
				success : function(res, statusText) {
					myCompFreemon.fn.proposeListRender(res.data);
					myCompFreemon.fn.selectMyInterest();
				}
			};
			freemon.http.ajax(option);
		},  
		proposeListRender : function(obj) {
			
			$.each(obj.applicantList, function(i, data) {
				data.isInterest = function() {
					if(data.interestYn == 'Y') return true;
					else return false;
				}
				
				data.isPropose = function() {
					if(data.contractDivCd == 'PROPOSE') return true;
					else return false;
				}
				
				if(data.appCancelYn == 'Y'){
					data.tailText = "취소";
					data.isClosed = true;
					data.regDt = data.appCancelDt;
				}
				else{
					if(data.rejectYn == 'Y'){
						if(data.contractDivCd == 'PROPOSE') data.tailText = "거절";
						else data.tailText = "";
						data.isClosed = true;
						data.regDt = data.appRejectDt;
					}
					else{
						data.tailText = "";
						data.isClosed = false;
						data.regDt = data.applicantDt;
					}
				}
				
//				data.isContract = function(){
//					if(data.prgsStsCd == '7') return true;
//					else return false;
//				}
				
				data.isExclusive = function(){
					if(data.exclusiveYn == 'Y') return true;
					else return false;
				}
				
				if(data.joinPsblDt){
					var dateTerm = freemon.util.calcDayMonthCount(freemon.util.getStringFromDate(new Date()), data.joinPsblDt, 'D');
					data.isNow = function() {
						if(dateTerm < 1) {
							return true;
						} else {
							return false;
						}
					}
					data.joinPsblDt = data.joinPsblDt.replace("-",".").replace("-",".");
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
				
				if(data.birthDay != "" && data.birthDay != null){
					var birthDay = data.birthDay;
					var year = parseInt(new Date().getFullYear());
					data.age = (year-birthDay)+1; // 우리나라 나이 표시 +1 더함 
					data.shortYear = birthDay.substr(2,4);
				}
				
				if(parseInt(data.leaveStrtTerm) > 0){
					data.leaveStrtTermTxt = data.leaveStrtTerm + "일후";
					data.leaveStrtTermCss = "";
				}
				else if(parseInt(data.leaveStrtTerm) == 0){
					data.leaveStrtTermTxt = "투입가능";
					data.leaveStrtTermCss = "";
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
				
				if(data.memo != "" && data.memo != null){
					data.memoYN = true;
				}
				else{
					data.memoYN = false;
				}
				
				if(data.prfPhotoYn == 'Y'){
					if(data.kkoPrfUrl){ data.profileUrl = data.kkoPrfUrl; }
					else{ data.profileUrl = "/resources/images/new/no-pic.png"; }
				}
				else{
					data.profileUrl = "/resources/images/new/no-pic.png";
				}
				
				data.projStrtDt = data.projStrtDt.replace("-",".").replace("-",".");
				data.projCloseDt = data.projCloseDt.replace("-",".").replace("-",".");
				
				if(data.prgsStsCd == '4'){
					data.reject = "reject";
					data.rejectText = "rejectText";
				}
				else{
					data.reject = "";
					data.rejectText = "";
				}
				
				if(data.totalWorkCareer == " ") data.totalWorkCareer = "0년";
			});
			$('#myApplicantList').append(Mustache.render($('#myApplicantListTemplate').html(), obj));
		},
		selectMyInterest : function(isLoad) {
			myCompFreemon.param = {
					
				paging : {
		            pageNo : 1,        // 현재 선택된 페이지 번호
		            listBlock : 4,    // 목록의 출력 갯수
				}
			}
			
			var option = {
				url : "/mypage/selectMyInterestTalentList",
				data : myCompFreemon.param,
				contentType : "application/json; charset=UTF-8",
				type : 'post',
				success : function(res, statusText) {
					myCompFreemon.fn.interestListRender(res.data, true);
					myCompFreemon.fn.selectMyRecommand();
				}
			};
			freemon.http.ajax(option);
		},  
		interestListRender : function(obj, isSearch) {
			if(isSearch){
				$('#myInterestList').html('');
			}
			
			obj = myCompFreemon.fn.talenListRender(obj);
			
			$('#myInterestList').append(Mustache.render($('#myInterestListTemplate').html(), obj));
		},
		selectMyRecommand : function(isLoad) {
			myCompFreemon.param = {
					
				paging : {
		            pageNo : 1,        // 현재 선택된 페이지 번호
		            listBlock : 4,    // 목록의 출력 갯수
				}
			}
			
			var option = {
				url : "/mypage/selectMyRecommandTalentList",
				data : myCompFreemon.param,
				contentType : "application/json; charset=UTF-8",
				type : 'post',
				success : function(res, statusText) {
					myCompFreemon.fn.recommandListRender(res.data, true);
					myCompFreemon.fn.selectMyExclusive();
				}
			};
			freemon.http.ajax(option);
		},  
		recommandListRender : function(obj, isSearch) {
			if(isSearch){
				$('#myRecommandList').html('');
			}
			
			obj = myCompFreemon.fn.talenListRender(obj);
			
			$('#myRecommandList').append(Mustache.render($('#myRecommandListTemplate').html(), obj));
		},
		selectMyExclusive : function(isLoad) {
			myCompFreemon.param = {
					
				paging : {
		            pageNo : 1,        // 현재 선택된 페이지 번호
		            listBlock : 3,    // 목록의 출력 갯수
				}
			}
			
			var option = {
				url : "/mypage/selectMyExclusiveTalentList",
				data : myCompFreemon.param,
				contentType : "application/json; charset=UTF-8",
				type : 'post',
				success : function(res, statusText) {
					myCompFreemon.fn.exclusiveListRender(res.data, true);
				}
			};
			freemon.http.ajax(option);
		},  
		exclusiveListRender : function(obj, isSearch) {
			if(isSearch){
				$('#myExclusiveList').html('');
			}
			
			obj = myCompFreemon.fn.talenListRender(obj);
			$.each(obj.talentList, function(i, data) {
				
				data.isProject = function(){
					if(data.projIdx == null || data.projIdx == "") return false;
					else return true;
				}
				
				if(data.projIdx != null && data.projIdx != ""){
					data.isContract = function(){
						var dateTerm = freemon.util.calcDayMonthCount(freemon.util.getStringFromDate(new Date()), data.cntrctEndDt, 'D');
						if(dateTerm < 0) return false;
						else return true;
					}
				}
				
				if(data.totalWorkCareer == " ") data.totalWorkCareer = "0년";
			});
			
			$('#myExclusiveList').append(Mustache.render($('#myExclusiveListTemplate').html(), obj));
		},
		talenListRender : function(obj) {
			$.each(obj.talentList, function(i, data) {			
				if(data.birthDay != "" && data.birthDay != null){
					var birthDay = data.birthDay;
					var year = parseInt(new Date().getFullYear());
					data.age = (year-birthDay)+1; // 우리나라 나이 표시 +1 더함 
					data.shortYear = birthDay.substr(2,4);
				}
				
				// 관심인재여부
				data.isInterest = function() {
					if(data.interestYn == 'Y') {
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
				
				if(data.memo != "" && data.memo != null){
					data.memoYN = true;
				}
				else{
					data.memoYN = false;
				}
				
				if(data.prfPhotoYn == 'Y'){
					if(data.photo){ data.profileUrl = "/resources/images/new/no-pic.png"; }
					else if(data.kkoProfilUrl){ data.profileUrl = data.kkoProfilUrl; }
					else{ data.profileUrl = "/resources/images/new/no-pic.png"; }
				}
				else{
					data.profileUrl = "/resources/images/new/no-pic.png";
				}
				
				data.isExclusive = function(){
					if(data.exclusiveYn == 'Y') return true;
					else return false;
				}
				
				if(data.totalWorkCareer == " ") data.totalWorkCareer = "0년";
			});
			
			return obj;
		},
		relationInTalentList : function($this){
			myCompFreemon.param = { userId : $this.attr("data-value") }
			var option = {
					url : "/talent/selectTalentDetailSearch",
					data : myCompFreemon.param,
					contentType : "application/json; charset=UTF-8",
					type : 'post',
					success : function(res, statusText) {	
						var obj = res.data.talentList[0];
						obj.genderNm = obj.gender;
						freemon.ux.relationInTalentList($this, '#projectInTalentList', '#relationInTalentListTemplate', obj);
					}
				};
			freemon.http.ajax(option);
		},
		toggleInterestTalent : function($this) {
			var option = {
				url : "/talent/toggleInterestTalent",
				data : {'userId': $this.data("value")},
				contentType : "application/json; charset=UTF-8",
				type : 'post',
				success : function(res, statusText) {
					var textInterestCount = $("#textInterestCount").text();
					if(res.data === 'ON') {
						$this.parent().addClass("active"); 
						$("#textInterestCount").text(parseInt(textInterestCount) + 1);
					}
					else{
						$this.parent().removeClass('active');
						$("#textInterestCount").text(parseInt(textInterestCount) - 1);
					}
					
					myCompFreemon.fn.selectMyInterest();
				}
			};
			freemon.http.ajax(option);
		}
	}
}