var compApplicantSearch = {
	name : 'compApplicantSearch',
	data : null,
	param : {},
	contactDivCd : "",
	isChange : true,
	listObj : null,
	allListObj : null, 
	actionUrl : '/applicant/selectCompProposedApplicantList',
	init : function() {
		ObserverControl.addObserver(this);
		this.beforeBind();
		this.bind();
	},
	beforeBind : function() {
		compApplicantSearch.param = {
			paging : {
	            pageNo : 1,        // 현재 선택된 페이지 번호
	            listBlock : 1000,    // 목록의 출력 갯수
			},
			contactDivCd : compApplicantSearch.contactDivCd
		}
		
		compApplicantSearch.contactDivCd = compApplicantSearch.pm;
		compApplicantSearch.fn.submit(true);
		
		History.Adapter.bind(window, 'statechange', function(e) {
			var state = History.getState();
		});
	},
	bind : function() {
		//검색버튼 클릭시
		$("#keyword").keydown(function(e){
			if(e.keyCode == 13){
				$("#freemonSearchBtn").trigger("click");
			}
		});
		
		$("#freemonSearchBtn").on('click', function() { 
			var uriMap = new CustomMap();
			var dv = "";
			switch(compApplicantSearch.contactDivCd){
	        	case "P": dv = "1"; break;
				case "N": dv = "3"; break;
				case "Y": dv = "4"; break;
				case "R": dv = "5"; break;
				case "I": dv = "6"; break;
				default: dv = ""; break;
			}
			uriMap.set("dv", dv);
			History.pushState('','프리몬 - SI 전문 아웃소싱', freemon.util.setUrlValue(uriMap));
			compApplicantSearch.fn.submit(true);
		});
		
		$("#freemonReload").on('click', function(){
			$("#keyword").val('');
			$(".tab_menu > ul.cf > li").removeClass("active"); $(".tab_menu > ul.cf > li:first-child").addClass("active"); 
			compApplicantSearch.contactDivCd = "";
			
	        var uriMap = new CustomMap();
			History.pushState('','프리몬 - SI 전문 아웃소싱', freemon.util.setUrlValue(uriMap));
			
			compApplicantSearch.fn.submit(null);
		});
		
		$('.tab_menu').on('click', 'ul.cf > li a', function() {
			compApplicantSearch.fn.setcontactDivCd($(this));
		});
		
		$('.project_in').on('click',"[data-action]" ,function(){
			compApplicantSearch.fn.dataActionHandler($(this));
			return false;
		});
		
		$("#projectInTalentList").on("click", ".close", function(){ freemon.ux.hidePopup('.pop_bg'); $("#projectInTalentList").html(""); });
		$('#projectInTalentList').on('click', function(e) {
			if(e.target.className == "pop_bg"){ freemon.ux.hidePopup('.pop_bg'); $("#projectInTalentList").html(""); } 
		});
		$("#projectInTalentList").on('click','.talentDetailInfo', function() {
			document.location.href = "/talent/talentDetailSearch?fno=" + $(this).attr("data-value");
		});
		$('#rejectList').on('change', function(){
			compApplicantSearch.param.cdValNm = $(this).val();
		});
	},
	fn :  {
		selectTalentList : function() {			
			var option = {
				url : compApplicantSearch.actionUrl,
				data : compApplicantSearch.param,
				contentType : "application/json; charset=UTF-8",
				type : 'post',
				success : function(res, statusText) {
					compApplicantSearch.listObj = res.data;
					compApplicantSearch.allListObj = res.data;
					compApplicantSearch.fn.listRender(res.data, true);
					$('.totalCnt').html(freemon.string.formatComma(res.data.paging.totalCount));
					
					if(res.data.paging.totalPageCnt > res.data.paging.pageNo){
						$(".more_box").show();
					}
                    else{
                    	$(".more_box").hide();
                    }
					
					compApplicantSearch.param.paging = $.extend(compApplicantSearch.param.paging, res.data.paging);
				},
				error :function(res, statusText) {
				}
			};
			freemon.http.ajax(option);
		},  
		listRender : function(obj, isSearch) {
			if(isSearch){
				$('#talentSearchList').html('');
			}
			
			var projIdx = null;
			var applicantArray = [];
			var distinctList = {
					data : []
			};
			var readCnt = 0;
			
			$.each(obj.applicantList, function(i, data) {
				
				if (i == 0 ){
					projIdx = data.projIdx;
				}
				
				data.isInterest = function() {
					if(data.interestYn == 'Y') {
						return true;
					} else {
						return false;
					}
				}
				
				data.isExclusive = function() {
					if(data.exclusiveYn == 'Y') {
						return true;
					} else {
						return false;
					}
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
				
				data.existFile = function(){
					if(data.contractDivCd =="Y"){
						return true;
					}else{
						return false;
					}
				}
				
				data.isFileExist = function(){
					if(data.prgsStsCd == 7){
						if(data.fileExist == 'Y') return true;
						else return false;
					}
					else{
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
				
				data.isGenderNm = function() {
					if(data.gender != null && data.gender != '') return true;
					else return false;
				}
				
				data.projStrtDt = data.projStrtDt.replace("-",".").replace("-",".");
				data.projCloseDt = data.projCloseDt.replace("-",".").replace("-",".");
				
				/*
				 * 단계정리
				 */
				data.isProposeYn = function(){
					if(data.proposeDt != null && data.proposeDt != "") return true;
					else return false;
				}
				
				data.isProCancelYn = function(){
					if(data.proCancelYn == 'Y' || data.rejectYn == 'Y') return true;
					else return false;
				}
				data.isRejectYn = function(){
					if(data.rejectYn == 'Y') return true;
					else return false;
				}
				
				data.isAppCancelYn = function(){
					if(data.applicntYn == 'N') return true;
					else return false;
				}
				if(data.prgsDivCd != null && data.prgsDivCd != ""){
					data.isApplicantYn = true;
					//data.isRequestContractYn = function(){
					//	if(parseInt(data.prgsDivCd) > 1) return true;
					//	else return false;
					//}
					data.isConsiderContractYn = function(){
						if(parseInt(data.prgsDivCd) > 2 && data.appConsiderDt != null) return true;
						else return false;
					}
					data.isInterview = function(){
						if(parseInt(data.prgsDivCd) == 10) return true;
						else return false;
					}
					data.isInterviewCancle = function(){
						if(parseInt(data.prgsDivCd) == 11) return true;
						else return false;
					}
					data.isContractCompleteYn = function(){
						if(parseInt(data.prgsDivCd) == 7) return true;
						else return false;
					}
					data.isContractRejectYn = function(){
						if(parseInt(data.prgsDivCd) == 4) return true;
						else return false;
					}
				}
				else{
					data.isApplicantYn = false;
					data.isRequestContractYn = false;
					data.isConsiderContractYn = false;
					data.isConsiderCompleteYn = false;
				}

				data.isRead = function(){
					if(data.readYn == 'Y') return true;
					else return false;
				}
				
				if(data.totalWorkCareer == " ") data.totalWorkCareer = "0년";
				if(data.proposeDt != null) data.proposeDt = data.proposeDt.substring(0,10);
				if(data.applicantDt != null) data.applicantDt = data.applicantDt.substring(0,10);
				
				if(projIdx == data.projIdx){
					if(data.readYn == 'N'){
						readCnt++;
					}
					
					applicantArray.push({ 
						projIdx : data.projIdx, 
						projNm : data.projNm,	
						projStrtDt : data.projStrtDt, 
						projCloseDt : data.projCloseDt,
						closeYn : data.closeYn, 
						userNm : data.userNm,
						joinPsblDt : data.joinPsblDt, 
						userId : data.userId,	
						usableSkillNm : data.usableSkillNm, 
						usableSkillList : data.usableSkillList, 
						leaveStrtTermCss: data.leaveStrtTermCss, 
						leaveStrtTermTxt : data.leaveStrtTermTxt, 
						hopeAreaNm : data.hopeAreaNm, 
						recentProEndDt : data.recentProEndDt,
						contractDt : data.contractDt, 
						birthDay : data.birthDay, 
						kkoPrfUrl : data.profileUrl,	
						isGenderNm : data.isGenderNm,
						gender : data.gender, 
						isInterest : data.isInterest,	
						isExclusive : data.isExclusive,
						exclusiveYn : data.exclusiveYn,
						isNow : data.isNow,
						existFile : data.existFile,	
						age : (data.birthDay != "" && data.birthDay != null) ? parseInt(new Date().getFullYear()) - data.birthDay + 1 : data.birthDay,
						applicntIdx : data.appIdx, 
						applicantDt : data.applicantDt,
						prgsDivNm : (data.prgsStsCd == "1") ? (data.appIdx == '0') ? (data.rejectYn == 'Y') ? "제안거절" : "제안" : "지원" : data.prgsDivNm,
						prgsDivCss : data.prgsDivCss,
						memoYN : data.memoYN, 
						memo : data.memo,
						isFileExist : data.isFileExist,
						reject : data.reject,
						rejectText : data.rejectText,
						readYn : (data.readYn == 'N') ? true : false,
						proposeYn : (compApplicantSearch.contactDivCd == 'P') ? true : false,
						tempSaveYn : (data.tempSaveYn == 'Y') ? true : false,
						totalWorkCareer : data.totalWorkCareer,
						
						isProposeYn : data.isProposeYn, 
						prpstIdx : data.proIdx, 
						proposeDt : data.proposeDt, 
						proRejectDt : data.proRejectDt, 
						isProCancelYn : data.isProCancelYn, 
						isRejectYn : data.isRejectYn, 
						proCancelDt : data.proCancelDt, 
						isApplicantYn : data.isApplicantYn, 
						isAppCancelYn : data.isAppCancelYn, 
						applicantDt : data.applicantDt, 
						isRequestContractYn : data.isRequestContractYn, 
						isConsiderContractYn : data.isConsiderContractYn, 
						isContractCompleteYn : data.isContractCompleteYn, 
						isContractRejectYn : data.isContractRejectYn, 
						isInterview : data.isInterview, 
						isInterviewCancle : data.isInterviewCancle, 
						isRead : data.isRead, 
						prgsDivCd : data.prgsDivCd, 
						appCancelDt : data.appCancelDt, 
						appRejectDt : data.appRejectDt, 
						appConsiderDt : data.appConsiderDt, 
						contRequestDt : data.contRequestDt, 
						contCompleteDt : data.contCompleteDt,
						spprtRefuseDt : data.spprtRefuseDt,
						interviewDt : data.interviewDt,
						isCancelReject :data.isCancelReject,
						keyword : data.keyword,
						hashTagList :data.hashTagList
					});
					
				}else{
					projIdx = data.projIdx;
					
					distinctList.data.push({
							applicantList : applicantArray,	
							projIdx : applicantArray[0].projIdx,
							projNm : applicantArray[0].projNm,	
							projStrtDt : applicantArray[0].projStrtDt,
							projCloseDt : applicantArray[0].projCloseDt, 
							isFirst : false, 
							applicantCount : 0, 
							readCnt : readCnt, 
							applicantDivNm : (compApplicantSearch.contactDivCd == 'P') ? "제안" : (data.prgsStsCd == "7") ? "계약" : "지원", 
							contractDivNm : (compApplicantSearch.contactDivCd == 'P') ? "제안" : "계약",
							isCloseYn : (applicantArray[0].closeYn == 'Y') ? true : false
					});
					
					applicantArray = [];
					readCnt = 0;
					if(data.readYn == 'N'){
						readCnt++;
					}
					
					applicantArray.push({
						projIdx : data.projIdx,
						projNm : data.projNm,
						projStrtDt : data.projStrtDt,
						projCloseDt : data.projCloseDt,
						closeYn : data.closeYn, 
						userNm : data.userNm,
						joinPsblDt : data.joinPsblDt,
						userId : data.userId,
						usableSkillNm : data.usableSkillNm,
						usableSkillList : data.usableSkillList, 
						leaveStrtTermCss: data.leaveStrtTermCss, 
						leaveStrtTermTxt : data.leaveStrtTermTxt,
						hopeAreaNm : data.hopeAreaNm,
						recentProEndDt : data.recentProEndDt,
						contractDt : data.contractDt,
						birthDay : data.birthDay,
						kkoPrfUrl : data.profileUrl,	
						isGenderNm : data.isGenderNm,
						gender : data.gender,
						isInterest : data.isInterest, 
						isExclusive : data.isExclusive,
						exclusiveYn : data.exclusiveYn,
						isNow : data.isNow,
						existFile : data.existFile,
						age : (data.birthDay != "" && data.birthDay != null) ? parseInt(new Date().getFullYear()) - data.birthDay + 1 : data.birthDay,
						applicntIdx : data.appIdx,
						applicantDt : data.applicantDt,
						prgsDivNm : (data.prgsStsCd == "1") ? (data.appIdx == '0') ? (data.rejectYn == 'Y') ? "제안거절" : "제안" : "지원" : data.prgsDivNm,
						prgsDivCss : data.prgsDivCss,
						memoYN : data.memoYN, 
						memo : data.memo,
						isFileExist : data.isFileExist,
						reject : data.reject,
						rejectText : data.rejectText,
						readYn : (data.readYn == 'N') ? true : false,
						proposeYn : (compApplicantSearch.contactDivCd == 'P') ? true : false,
						tempSaveYn : (data.tempSaveYn == 'Y') ? true : false,
						totalWorkCareer : data.totalWorkCareer,
						
						isProposeYn : data.isProposeYn, 
						prpstIdx : data.proIdx, 
						proposeDt : data.proposeDt, 
						proRejectDt : data.proRejectDt, 
						isProCancelYn : data.isProCancelYn, 
						isRejectYn : data.isRejectYn, 
						proCancelDt : data.proCancelDt, 
						isAppCancelYn : data.isAppCancelYn, 
						isApplicantYn : data.isApplicantYn, 
						applicantDt : data.applicantDt, 
						isRequestContractYn : data.isRequestContractYn, 
						isConsiderContractYn : data.isConsiderContractYn, 
						isContractCompleteYn : data.isContractCompleteYn, 
						isContractRejectYn : data.isContractRejectYn, 
						isRead : data.isRead, 
						isInterview : data.isInterview, 
						isInterviewCancle : data.isInterviewCancle, 
						prgsDivCd : data.prgsDivCd, 
						appCancelDt : data.appCancelDt, 
						appRejectDt : data.appRejectDt, 
						appConsiderDt : data.appConsiderDt, 
						contRequestDt : data.contRequestDt, 
						contCompleteDt : data.contCompleteDt,
						spprtRefuseDt : data.spprtRefuseDt,
						interviewDt : data.interviewDt,
						isCancelReject : data.isCancelReject,
						keyword : data.keyword,
						hashTagList :data.hashTagList
					});	
				}
				if(i == obj.applicantList.length - 1){
					distinctList.data.push({
						applicantList : applicantArray,
						projIdx : applicantArray[0].projIdx,
						projNm : applicantArray[0].projNm,
						projStrtDt : applicantArray[0].projStrtDt,
						projCloseDt : applicantArray[0].projCloseDt,
						isFirst : false,
						applicantCount : 0,
						readCnt : readCnt,
						applicantDivNm : (compApplicantSearch.contactDivCd == 'P') ? "제안" : (data.prgsStsCd == "7") ? "계약" : "지원",
						contractDivNm : (compApplicantSearch.contactDivCd == 'P') ? "제안" : "계약", 
						isCloseYn : (applicantArray[0].closeYn == 'Y') ? true : false
					});
				}
			});
			
			$.each(distinctList.data, function(i, data) {
				if(i == 0){
					data.isFirst = true;
				}
				data.applicantCount = data.applicantList.length;
				if(data.readCnt > 0){
					data.newApplicant = true;
				}
				else{
					data.newApplicant = false;
				}
			});
			
			$('#talentSearchList').append(Mustache.render($('#talentSearchListTemplate').html(), distinctList));
		},
		dataActionHandler : function($this){
			if($this.data("action") == "m_like"){
				compApplicantSearch.fn.toggleInterestTalent($this);
			}else if($this.data("action") == "contract"){
				compApplicantSearch.fn.downloadContractFile($this);
			}
			else if($this.data("action") == "proposeTalentDetail"){
				var map = new CustomMap();
				sendUrl = "/talent/talentProposeDetail";
				map.set("idx", $this.data("projidx"));
				map.set("prpstidx", $this.data("prpstidx"));
				map.set("fno", $this.data("value"));
				
				switch(compApplicantSearch.contactDivCd){
		        	case "P": map.set("dv","1"); break;
					case "N": map.set("dv","3"); break;
					case "Y": map.set("dv","4"); break;
					case "R": map.set("dv","5"); break;
					case "I": map.set("dv","6"); break;
					default: map.set("dv",""); break;
				}
				
				freemon.util.getSend(sendUrl, map);
			}
			else if($this.data("action") == "applicantTalentDetail"){
				var map = new CustomMap();
				sendUrl = "/talent/talentAppliDetailSearch";
				map.set("idx", $this.data("projidx"));
				map.set("applicntidx", $this.data("applicntidx"));
				map.set("fno", $this.data("value"));
				
				switch(compApplicantSearch.contactDivCd){
		        	case "P": map.set("dv","1"); break;
					case "N": map.set("dv","3"); break;
					case "Y": map.set("dv","4"); break;
					case "R": map.set("dv","5"); break;
					case "I": map.set("dv","6"); break;
					default: map.set("dv",""); break;
				}
				freemon.util.getSend(sendUrl, map);
			}
			else if($this.data("action") == "m_map") {
				compApplicantSearch.fn.relationInTalentList($this);
			}
			else if($this.data("action") == "m_memo") {
				var dv = "";
				switch(compApplicantSearch.contactDivCd){
		        	case "P": dv = "1"; break;
					case "N": dv = "3"; break;
					case "Y": dv = "4"; break;
					case "R": dv = "5"; break;
					case "I": dv = "6"; break;
					default: dv = ""; break;
				}				
				freemonPopUp.fn.talentMemo($this, dv);
			}
			else if($this.data("action") == "tempSaveContractView") {
				var map = new CustomMap();
				var sendUrl = "/contract/contractRegistForm";
				map.set("fno",$this.data("id"));
				map.set("applicntIdx",$this.data("idx"));
				freemon.util.getSend(sendUrl, map);
			}
			else if($this.data("action") == "talentExclusive") {
				compApplicantSearch.fn.toggleExclusiveTalent($this);
			}
			else if($this.data("action") == "talentDetail"){
				var map = new CustomMap();			
				var sendUrl = "/talent/talentDetailSearch";
				map.set("fno", $this.data("value"));
				freemon.util.getSend(sendUrl, map);
			}
			else if($this.data("action") == "proposeCancel") {
				freemon.ux.showPopup('#pop_prop');
				$("#project_name").text($this.data("projnm"));
				$("#project_date").text($this.data("regdt"));
				compApplicantSearch.nm = $this.data("nm");
				compApplicantSearch.projIdx = $this.data("value");
				compApplicantSearch.fno = $this.data("fno");
				compApplicantSearch.prpstidx = $this.data("prpstidx");
			}
			else if($this.data("action") == "propCancelRegist") {
				compApplicantSearch.fn.proposeCancel($this);
			}
			else if($this.data("action") == "applicantInterview"){
				compApplicantSearch.fn.applicantInterview($this);
			}
			else if($this.data("action") == "applicantReject"){
				compApplicantSearch.fn.applicantReject($this);
			}
			else if($this.data("action") == "applicantNextTime"){
				compApplicantSearch.appidx = $this.data("applicntidx");
				compApplicantSearch.projIdx = $this.data("value");
				compApplicantSearch.fno = $this.data("fno");
				freemon.ux.showPopup('#pop_prop_reject');
				compApplicantSearch.fn.selectRejectList();
			}
			else{
				var projIdx = $this.data("value");
				var map = new CustomMap();
				var sendUrl;
				if($this.data("action") == "detail"){
					map.set("fno", projIdx);
					sendUrl = "/mypage/myProjectDetail";
				}else if ($this.data("action")){
					map.set("project", projIdx);
					sendUrl = "/project/projectModify";
				}
				freemon.util.getSend(sendUrl, map);
			}
		},
		toggleInterestTalent : function($this) {
			var userId = $this.data("value");		
			var option = {
				url : "/talent/toggleInterestTalent",
				data : {'userId': userId},
				contentType : "application/json; charset=UTF-8",
				type : 'post',
				success : function(res, statusText) {
					
					if(res.data === 'ON') {
						if(!$this.hasClass('active'))
							$this.addClass("active");
						
						if(!$this.parent().hasClass('active'))
							$this.parent().addClass("active"); 
					} else {
						$this.removeClass('active');
						$this.parent().removeClass('active');
					}
				}
			};
			freemon.http.ajax(option);
		},
		toggleExclusiveTalent : function($this) {
			var nm = $this.data("nm");
			var fno = $this.data("value");
			if($this.data("yn") == 'Y'){
				freemon.ux.confirm('"' + nm + '"님과 전속프리랜서를 해지하시겠습니까?',
				    function() {
						freemon.ux.toggleExclusiveTalent($this);
				    },
				    function() {}
				);
				return false;
			}
			else{
				freemon.ux.toggleExclusiveTalent($this);
			}
		},
		downloadContractFile : function($this){
			var map = new CustomMap();
			map.set("applicntIdx", $this.data("value"));	
			freemon.util.getSend("/contract/contractFileDownload", map);
		},
		setcontactDivCd : function($this){
			$this.parent().siblings().removeClass('active');
			$this.parent().addClass('active');
			compApplicantSearch.contactDivCd = $this.attr("data-value");
			compApplicantSearch.fn.submit();
		},
		submit : function() {
			$('#talentSearchList').html('');

			var value = freemon.util.getUrlValue();
	        if(value && value.query && value.dv != ''){
	        	var div = "";
	        	switch(value.dv){
		        	case "1": div = "P"; break;
					case "3": div = "N"; break;
					case "4": div = "Y"; break;
					case "5": div = "R"; break;
					case "6": div = "I"; break;
					default: div = ""; break;
				}
	        	compApplicantSearch.param = {
	        			keywordList : freemon.util.isUndefinedOrNull(compApplicantSearch.fn.param().keywordList) ? value.query : compApplicantSearch.fn.param().keywordList,
	        			contactDivCd : freemon.util.isUndefinedOrNull(value.dv) ? div : compApplicantSearch.contactDivCd,
		        		paging : {
			        		pageNo : 1,    
				            listBlock : 1000
		        		}
	        	}
	        }
	        else{
				compApplicantSearch.param = {
						paging : {
				            pageNo : 1,
				            listBlock : 1000
				        },
						contactDivCd : compApplicantSearch.contactDivCd,
						keywordList : compApplicantSearch.fn.param().keywordList
				};
	        }
	        
	        var uriMap = new CustomMap();
	        var dv = "";
			uriMap.set("query", compApplicantSearch.fn.param().keywordList);
			switch(compApplicantSearch.contactDivCd){
	        	case "P": dv = "1"; break;
				case "N": dv = "3"; break;
				case "Y": dv = "4"; break;
				case "R": dv = "5"; break;
				case "I": dv = "6"; break;
				default: dv = ""; break;
			}
			uriMap.set("dv", dv);
			History.pushState('','프리몬 - SI 전문 아웃소싱', freemon.util.setUrlValue(uriMap));

			compApplicantSearch.fn.selectTalentList();
		},
		relationInTalentList : function($this){
			var option = {
					url : "/talent/selectTalentDetailSearch",
					data : { userId : $this.attr("data-value") },
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
		param : function() {
			var param = {};
			// 검색 키워드
			var keyword = $("input[id='keyword']").val();

			param.keywordList = [];
			
			if(keyword != '' && keyword !=null){
				var keywordArr = keyword.split(' ');
		
				$.each(keywordArr, function(i, data){
					param.keywordList.push(data);
				});
			}
			
			return param;
		},
		proposeCancel : function($this){
			var text =$("#textarea").val();
			if(text == ""){
				text = "프리몬에서 제안취소를 알려드립니다.";
			}
			if(compApplicantSearch.projIdx){
				freemon.ux.confirm('"' + compApplicantSearch.nm + '"님께 했던 제안을 취소하시겠습니까?',
				    function() {
						var param = {}; param.projIdx = compApplicantSearch.projIdx; param.inqDtl = text; param.fno = compApplicantSearch.fno, param.prpstIdx = compApplicantSearch.prpstidx;
						var option = {
							url : "/project/proposedCancelRegist",
							data : param,
							contentType : "application/json; charset=UTF-8",
							type : 'post',
							success : function(res, statusText) {
								location.reload();
								$('#textarea').val('');
							}
						};
						freemon.http.ajax(option);
				    },
				    function() {}
				);
			}
			else{
				freemon.ux.alert("제안정보를 가져올 수 없습니다." + freemon.ux.customCenterText());
			}
			return false;
		},
		applicantInterview : function($this){
			var userId = $this.data("fno");
			var applicntIdx = $this.data("applicntidx");
			var option = {
					url : "/talent/updateApplicantInterview",
					data : {'userId' : userId,
                        	'applicntIdx' : applicntIdx
					},
					contentType : "application/json; charset=UTF-8",
					type : 'post',
					success : function(res, statusText) {
						location.reload();
					},
					error : function(res){
					}
			}	
			freemon.http.ajax(option);
		},
		applicantReject : function(param){
			var param = freemon.data.createJSONFromForm('propForm');
			param.userId = compApplicantSearch.fno;
			param.applicntIdx = compApplicantSearch.appidx;
			param.projIdx = compApplicantSearch.projIdx;
			param.rejectReson = compApplicantSearch.param.cdValNm;
			
			var option = {
					url : "/talent/updateApplicantRefuse",
					data : param,
					contentType : "application/json; charset=UTF-8",
					type : 'post',
					success : function(res, statusText) {
						location.reload();
					},
					error : function(res){
					}
				}
			freemon.http.ajax(option);
		},
		selectRejectList : function() {
			var option = {
				url : "/common/selectCodeList",
				data : {
					'cdId' : 'APPLCNT_REJECT_REASON'
				},
				contentType : "application/json; charset=UTF-8",
				type : 'post',
				success : function(res, statusText) {
					$('#rejectList').html(Mustache.render($('#rejectListTemplate').html(), {'rejectList' : res.data}));
				}
			}
			freemon.http.ajax(option);
		}
	}
}