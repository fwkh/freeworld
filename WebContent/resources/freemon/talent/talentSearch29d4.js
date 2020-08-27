var talentSearch = {
	name : 'talentSearch',
	searchStrDate: '',
	keywordList : [],
	selectArea : [],
	selectSkill : [],
	selectedCareer : [],
	experience : '',
	month : Number(12),
	history : null,
	availability : 'join',
	param : {},
	slider : null,
	isList : false,
	init : function() {
		ObserverControl.addObserver(this);
		this.beforeBind();
		this.bind();
	},
	beforeBind : function() {
		talentSearch.fn.selectSkillList();
		talentSearch.fn.selectAreaList();

		var searchStrDate = $.datepicker.formatDate('yy-mm-dd', new Date());
		$("#searchStrDate").val(searchStrDate);
		$("#selectDateText").text('' + searchStrDate + '');

		History.Adapter.bind(window, 'statechange', function(e) {
			var state = History.getState();
		});
	},
	bind : function() {
		$("#searchStrDate").datepicker().on("change", function(e) {talentSearch.fn.initSearch(); });

		$("#freemonSearchDateBtn").click(function(){
			$('#searchStrDate').datepicker('show');
		});

		$('.project_in').on('click', "[data-action]", function(){
			talentSearch.fn.dataActionEnventHalnder($(this));
		});

		$('#freemonSearchBtn').on('click', function(){
			talentSearch.fn.initSearch();
		});

		$("#keyword").keydown(function(e){
			if(e.keyCode == 13){
				$("#freemonSearchBtn").trigger("click");
			}
		});

		$("#projectInTalentList").on("click", ".close", function(){ freemon.ux.hidePopup(".pop_bg"); $("#projectInTalentList").html(""); });
		$('#projectInTalentList').on('click', function(e) {
			if(e.target.className == "pop_bg"){ freemon.ux.hidePopup('.pop_bg'); $("#projectInTalentList").html(""); }
		});

		$(".sel_option").hover(function () {
		    $(this).addClass("active");
            $(this).find('.option').show();
        }, function () {
            $(this).removeClass("active");
            $(this).find('.option').hide();
        });

		$("#memberSearchAreaList").on('mouseover', '.areaSelect', function(){
			var data = $(this).attr("data-id");

            $("#memberSearchAreaList .areaSelect").removeClass("active");
			$(this).addClass("active");

			talentSearch.fn.selectAreaObjList(data);
		});

	    $("#memberSearchArea2List").on('click', '.area2Select', function(){
			var txtupper = $(this).attr("data-uppervalue");
			var dataupper = $(this).attr("data-upperId");
			var data = $(this).attr("data-id");
			var txt = $(this).attr("data-value");

            $.each(talentSearch.areaObj, function(i, area) {
                if (area.cdVal == data) {
                    talentSearch.areaObj[i].active = true;
                }
            });

			var addResult = false;
			$.each(talentSearch.selectArea, function(i, area) {
				if(area != null && area == data){
				    talentSearch.fn.deleteArea(data);
					addResult = true;
					return false;
				}
			});
			if(addResult == false){
			    talentSearch.selectArea.push(data);
                if(txtupper == null || txtupper == ""){
                    $("#searchWord").append('<p id="area_' + data + '">' + txt + '<a href="" class="del delArea" data-id="'+ data+ '">삭제</a></p>');
                }else{
				    $("#searchWord").append('<p id="area_' + data + '">' + txtupper + ">" + txt + '<a href="" class="del delArea" data-id="'+ data+ '">삭제</a></p>');
				}
				talentSearch.fn.initSearch();
			}
		});
		$("#memberSearchJobList").on('mouseover', '.jobSelect', function(){
			var data = $(this).attr("data-value");

            $("#memberSearchJobList .jobSelect").removeClass("active");
			$(this).addClass("active");

			talentSearch.fn.selectSkillObjList(data);
		});
		$("#memberSearchSkillList").on('click', '.skillSelect', function(){
			var data = $(this).attr("data-id");
			var txt = $(this).attr("data-value");

            var addResult = false;
            $.each(talentSearch.skillObj, function(i, skill) {
                if (skill.cdVal == data) {
                    talentSearch.skillObj[i].active = true;
                }
            });

			$.each(talentSearch.selectSkill, function(i, job) {
				if(job != null && job == data){
				    talentSearch.fn.deleteJob(data);
					addResult = true;
					return false;
				}
			});

			if(addResult == false){
                talentSearch.selectSkill.push(data);

			    $("#searchWord").append('<p id="skill_' + data + '">'+ txt + '<a href="" class="del delSkill" data-id="' + data + '">삭제</a></p>');
			    talentSearch.fn.initSearch();
			}
		});

		$('.setRangeValue').on('click', function(){
		    var data = $(this).attr("data-value");
		    var html = $(this).attr("data-html");

		    var addResult = false;
		    $.each(talentSearch.selectedCareer, function(i, career) {
				if(career != null && career == data){
				    talentSearch.fn.deleteCareer(data);
					addResult = true;
					return false;
				}
			});
			if(addResult == false){
			    $(this).addClass("active");
                talentSearch.selectedCareer.push(data);
				talentSearch.fn.setRangeValue(html,data);
			    talentSearch.fn.initSearch();
			}
		});

		$("#freemonReload").click(function () {
		    $.each(talentSearch.areaObj, function(i, area) {
                talentSearch.areaObj[i].active = false;
            });
            $.each(talentSearch.skillObj, function(i, skill) {
                talentSearch.skillObj[i].active = false;
            });
            $("#careerList .select_box ul.cf li").removeClass("active");
			talentSearch.selectArea = [];
			talentSearch.selectSkill =[];
			talentSearch.selectedCareer =[];
			$("#searchWord p").hide();
			$('#searchWord p').nextAll('p').detach();

			talentSearch.fn.initSearch();
			return false;
	    });
	    $('#searchWord').on('click', '.delArea' ,function(){
	        var data = $(this).attr("data-id");
	        talentSearch.fn.deleteArea(data);
		    return false;
	    });

	    $('#searchWord').on('click', '.delSkill' ,function(){
	        var data = $(this).attr("data-id");
	        talentSearch.fn.deleteJob(data);
		    return false;
	    });

	    $('#searchWord').on('click', '.delCareer' ,function(){
	        var data = $(this).attr("data-id");
	        talentSearch.fn.deleteCareer(data);
		    return false;
	    });

        talentSearch.param = $.extend({}, talentSearch.param, freemonSearch.fn.param());
        talentSearch.param.month = talentSearch.month;
        talentSearch.param.availability = talentSearch.availability;
        talentSearch.param.experience = ($("input:checkbox[id='careerY']").is(":checked") == false) ? '' : $("input:checkbox[id='careerY']").val();
    	talentSearch.fn.initParam();
    	talentSearch.fn.infiniteScroll();
	},
	fn :  {
	    screenObject : function(){
	        var value = freemon.util.getUrlValue();
                if(value.area != null && value.area != ""){
                    urlArea = value.area.split(" ");
                    selectArea = urlArea;
                    talentSearch.selectArea = selectArea;
                }
                if(value.skill != null && value.skill != ""){
                    urlSkill = value.skill.split(" ");
                    selectSkill = urlSkill;
                    talentSearch.selectSkill = selectSkill;
                }
                if(value.career != null && value.career != ""){
                    urlCareer = value.career.split(" ");
                    selectedCareer = urlCareer;
                    talentSearch.selectedCareer = selectedCareer;
            }
            talentSearch.fn.searchResultIcon(value);
	    },
	    searchResultIcon : function(value){
            if(value.area != null && value.area != ""){
                $.each(talentSearch.areaObj, function(i, area){
                    $.each(talentSearch.areaObj,function(j){
                        if (selectArea && selectArea[j] == area.cdVal) {
                            talentSearch.areaObj[i].active = true;
                            if(area.workUpperAddr == null || area.workUpperAddr == ""){
                                $("#searchWord").append('<p id="area_' + area.cdVal + '">' + area.cdValNm + '<a href="" class="del delArea" data-id="'+ area.cdVal + '">삭제</a></p>');
                            }else{
                                $("#searchWord").append('<p id="area_' + area.cdVal + '">' + area.workUpperAddr + ">" + area.cdValNm + '<a href="" class="del delArea" data-id="'+ area.cdVal + '">삭제</a></p>');
                            }
                        }
                    });
                });
            }
            if(value.skill != null && value.skill != ""){
                $.each(talentSearch.skillObj, function(i, job){
                    $.each(talentSearch.skillObj,function(j){
                        if (selectSkill && selectSkill[j] == job.cdVal) {
                            talentSearch.skillObj[i].active = true;
                            $("#searchWord").append('<p id="skill_' + job.cdVal + '">' + job.cdValNm + '<a href="" class="del delSkill" data-id="' + job.cdVal + '" >삭제</a></p>');
                        }
                    });
                });
            }
            if(talentSearch.param.selectedCareerList != null && talentSearch.param.selectedCareerList != ""){
                selectedCareer = talentSearch.param.selectedCareerList;
                $.each(selectedCareer,function(i, career){
                    if(career == "1"){
                        $("#careerList .select_box > ul.cf > li:first-child").addClass("active");
                        $("#searchWord").append('<p id="1">5년이하<a href="" class="del delCareer" data-id="1">삭제</a></p>');
                    }
                    if(career == "2"){
                        $("#careerList .select_box > ul.cf > li:nth-child(2)").addClass("active");
                        $("#searchWord").append('<p id="2">6~10년<a href="" class="del delCareer" data-id="2">삭제</a></p>');
                    }
                    if(career == "3"){
                        $("#careerList .select_box> ul.cf > li:nth-child(3)").addClass("active");
                        $("#searchWord").append('<p id="3">11~15년<a href="" class="del delCareer" data-id="3">삭제</a></p>');
                    }
                    if(career == "4"){
                        $("#careerList .select_box> ul.cf > li:nth-child(4)").addClass("active");
                        $("#searchWord").append('<p id="4">16~20년<a href="" class="del delCareer" data-id="4">삭제</a></p>');
                    }
                    if(career == "5"){
                        $("#careerList .select_box> ul.cf > li:nth-child(5)").addClass("active");
                        $("#searchWord").append('<p id="5">21년이상<a href="" class="del delCareer" data-id="5">삭제</a></p>');
                    }
                    if(career == "0"){
                        $("#careerList .select_box> ul.cf > li:last-child").addClass("active");
                        $("#searchWord").append('<p id="0">경력무관<a href="" class="del delCareer" data-id="0">삭제</a></p>');
                    }
                });

	        }

			talentSearch.fn.selectTalentList();
	    },
		initParam : function(ev){
			var value = freemon.util.getUrlValue();
			
	        //if(value && value.page != undefined){
			if(value){
				if(freemon.util.isUndefinedOrNull(value.page)) value.page = 1;
		       	talentSearch.history = {
			        		page : value.page,
			        		height : value.height,
//			        		keyword : value.kl,
//			        		searchStrDate : value.strdate,
			    }
		       	var career = [];
		       	if(value.career != null && value.career != ""){
		            career = value.career.split(" ");
		       	}

		       	var area = [];
		       	if(value.area != null && value.area != ""){
		       	    area = value.area.split(" ");
		       	}

		       	var skill = [];
		       	if(value.skill != null && value.skill != ""){
		       	    skill = value.skill.split(" ");
		       	}

	        	talentSearch.param = {
	        			month : talentSearch.month,
	        			keywordList : freemon.util.isUndefinedOrNull(freemonSearch.fn.param().keywordList) ? value.query : freemonSearch.fn.param().keywordList,
	        			searchStrDate :  freemon.util.isUndefinedOrNull(value.date) ? $(".dateRangePicker").val() : value.date,
	        			availability : freemon.util.isUndefinedOrNull(talentSearch.param.availability) ? value.order : talentSearch.param.availability,
	        			experience : freemon.util.isUndefinedOrNull(talentSearch.param.experience) ? value.exp : talentSearch.param.experience,
	        			selectedCareerList : freemon.util.isUndefinedOrNull(talentSearch.param.selectedCareerList) ? career : talentSearch.param.selectedCareerList,
	        			selectedAreaList : freemon.util.isUndefinedOrNull(talentSearch.param.selectedAreaList) ? area : talentSearch.param.selectedAreaList,
	        			selectedSkillList: freemon.util.isUndefinedOrNull(talentSearch.param.selectedSkillList) ? skill : talentSearch.param.selectedSkillList,
	        			height : value.height,
		        		paging : {
			        		pageNo : 1,    
				            listBlock : 10 * value.page
		        		}
	        	}

		       	if(talentSearch.param.experience != 'EXP'){
		       		var li = $(".cho_man .sort li");
			       	li.siblings().removeClass("active");
			       	
			        talentSearch.param.availability == "join" ? li.eq(0).addClass("active") : li.eq(1).addClass("active");
		       	}
		       	else{
		       		$("input:checkbox[id='careerY']").prop("checked", true);
		       	}
		       	$("#keyword").val(freemon.util.isUndefinedOrNull(talentSearch.param.keywordList) ? '' : talentSearch.param.keywordList.join(" "));
	        }
	        else{
	        	talentSearch.param = $.extend({}, talentSearch.param, freemonSearch.fn.param());
				talentSearch.param.month = talentSearch.month;
	        	talentSearch.history = {
		        		page : null,
		        		height : null
		        }
	        }
	        
	        $(".dateRangePicker").val(talentSearch.param.searchStrDate);
    		$("#selectDateText").text('' + talentSearch.param.searchStrDate + '');
    		freemon.util.pushHistory({
    				query: talentSearch.param.keywordList == undefined || talentSearch.param.keywordList == "" ? '' : talentSearch.param.keywordList.join(" "),
    				page: talentSearch.param.paging.pageNo,
    				date: talentSearch.param.searchStrDate,
    				order: talentSearch.param.availability,
					career: talentSearch.param.selectedCareerList == undefined || talentSearch.param.selectedCareerList == "" ? '' : talentSearch.param.selectedCareerList,
					area: talentSearch.param.selectedAreaList == undefined || talentSearch.param.selectedAreaList == "" ? '' : talentSearch.param.selectedAreaList,
					skill: talentSearch.param.selectedSkillList == undefined || talentSearch.param.selectedSkillList == "" ? '' : talentSearch.param.selectedSkillList,
					height: talentSearch.param.height,
					exp: freemon.util.isUndefinedOrNull(talentSearch.param.experience) ? '' : talentSearch.param.experience}
					);
		},
		dataActionEnventHalnder : function(e){
			var action = e.data("action");
			if(action == "noneAuth"){
				talentSearch.fn.authResult("로그인을 하시면 더 많은 정보를 확인 하실 수 있습니다.\n로그인 하시겠습니까?");
			}else if(action == "talentInterest"){
				talentSearch.fn.toggleInterestTalent(e);
			}else if(action == "talentExclusive") {
				freemon.ux.toggleExclusiveTalent(e);
			}else if (action == "relationTalent"){
				talentSearch.fn.relationInTalentList(e);
			}else if (action == "talnetMeno"){
				freemonPopUp.fn.talentMemo(e);
			}else if (action == "monthClick"){
				talentSearch.fn.monthClick(e);
			}else if (action == "projectInfo"){
				if(parseInt(e.data('projectIdx')) > -1) talentSearch.fn.projectInTalentList(e);
				else freemon.ux.alert(e.children("h4").text() + "입니다.<br/>" + e.children("p").text() + " 가능합니다.");
			}else if (action == "showTypeClick"){
				talentSearch.fn.setMonth(e);
			}else if(action == "sortTypeClick"){
				talentSearch.fn.sortTypeClick(e);
			}else if(action == "careerTypeClick"){
				talentSearch.fn.careerTypeClick(e);
				return false;
			}/*else if (action == "setRangeValue"){
				talentSearch.fn.setRangeValue(e);
			}*/else if (action == "moreViewClick"){
				talentSearch.fn.moreTalentList();
			}else if (action == "sliderReflesh"){
				talentSearch.fn.sliderReflesh();
			}else if (action == "talentDetail"){
				talentSearch.fn.goTalentDetail(e);
			}else if (action == "searchTag"){
				talentSearch.fn.searchTag(e);
			}
		},
		setRangeValue : function(html,data){
			$("#searchWord").append('<p id="' + data + '">'+ html + '<a href="" class="del delCareer" data-id="' + data + '">삭제</a></p>');
		},
		sliderReflesh : function(){
			talentSearch.slider.options.value = [1, 22];
	    	talentSearch.slider.refresh();
	    	
	    	$(".setRangeValue").parent().removeClass("active");
	    	$(".setRangeValue").eq(5).parent().addClass("active");
	    	talentSearch.fn.addEvent();
	    	talentSearch.fn.initParam(talentSearch.slider.options.value);
		},
		selectTalentList : function() {
			var date = new Date();
			var searchDate = talentSearch.param.searchStrDate.split("-");
			var searchJoinPsblDt = 'old';
			if(parseInt(date.getFullYear()) == parseInt(searchDate[0]) && parseInt(date.getMonth() + 1) == parseInt(searchDate[1])) { searchJoinPsblDt = 'newly'; }
			talentSearch.param.searchJoinPsblDt = searchJoinPsblDt;

			var option = {
				url : "/talent/selectTalentSearch",
				data : talentSearch.param,
				contentType : "application/json; charset=UTF-8",
				type : 'post',
				success : function(res, statusText) {
					talentSearch.fn.listRender(res.data, true);
					talentSearch.param.paging = $.extend(talentSearch.param.paging, res.data.paging);
					if(talentSearch.history.page){
						talentSearch.param.paging.pageNo = talentSearch.history.page;
						talentSearch.param.paging.listBlock = 10;	
					}
					
					$('.totalCnt').html(freemon.string.formatComma(res.data.paging.totalCount));
					$(window).scrollTop(talentSearch.param.height ? talentSearch.param.height : 0);
					
					talentSearch.isList = freemon.ux.isMoreView(res.data.paging);
				}
			};
			freemon.http.ajax(option);
		},
		infiniteScroll : function(){
			$(window).scroll(function() {
				if ($(window).scrollTop() >= $(document).height() - $(window).height() - 1 && talentSearch.isList) {
		        	talentSearch.fn.moreTalentList();		        	
		        }
		    });
		},  
		moreTalentList : function(){
			talentSearch.param.paging.pageNo++;
        	var option = {
				url : "/talent/selectTalentSearch",
				data : talentSearch.param,
				contentType : "application/json; charset=UTF-8",
				type : 'post',
				success : function(res, statusText) {
					if(res.data.talentList.length > 0){
    					talentSearch.fn.listRender(res.data, false);
    					talentSearch.param.paging = $.extend(talentSearch.param.paging, res.data.paging);
                        
    					var height = $(document).scrollTop();
                        $('#talentSearchList').animate({scrollTop : height+400}, 600);
                        talentSearch.isList = freemon.ux.isMoreView(res.data.paging);

					}
				}
			};
        	freemon.http.ajax(option);
		},
		listRender : function(realObj, isSearch) {		
			if(isSearch){
				$('#talentSearchList').html('');
				$('#talentSearchCardList').html('');
				realObj.isSearch = isSearch;
			}
			var login = false;
			if(realObj.mngId){
				login = true;
			}
			realObj.login = login;
			realObj.month = talentSearch.month; 
			obj = freemon.ui.talentListRender(realObj);
			$('#talentSearchList').append(Mustache.render($('#talentSearchListTemplate').html(), {obj : obj }));
		},
		toggleInterestTalent : function($this) {
			var option = {
				url : "/talent/toggleInterestTalent",
				data : {'userId': $this.data("value")},
				contentType : "application/json; charset=UTF-8",
				type : 'post',
				success : function(res, statusText) {
					if(res.data === 'ON') {
					if(!$this.hasClass('active'))
						$this.parent().addClass("active"); 
					} else {
						$this.parent().removeClass('active');
					}
				}
			};
			freemon.http.ajax(option);
		},
		projectList : function(data){
			if(!data.company){
				return false;
			}

			var option = {
				url : "/project/projectCompSearch",
				data : {
					mngId : data.userId
					},
				contentType : "application/json; charset=UTF-8",
				type : 'post',
				success : function(res, statusText) {
					$('#projectList').append(Mustache.render($('#projectListTemplate').html(), { 'projectList' : res.data.projectList}));
				}
			};
			freemon.http.ajax(option);
		},
		setMonth : function($this){
			$this.parent().siblings().removeClass('active');;
			$this.parent().addClass('active');
			talentSearch.month = $this.data("value");
			talentSearch.fn.initParam();
		},
		projectInTalentList : function($this){
			$this.data("searchdt", $("#searchStrDate").val());
			freemon.ux.projectInTalentList($this, '#projectInTalentList', '#projectInTalentListTemplate');
		},
		authResult : function(msg) {
			document.location.href = "/login/freemonLogin?url=/talent/talentSearch";
		},
		relationInTalentList : function($this){
			var index = $this.attr("data-value");
			var searchdt = $("#searchStrDate").val();			
			var option = {
				url : "/talent/selectTalentDetail",
				data : {'userId':index,'searchStrDate':searchdt},
				contentType : "application/json; charset=UTF-8",
				type : 'post',
				success : function(res, statusText) {	
					freemon.ux.relationInTalentList($this, '#projectInTalentList', '#relationInTalentListTemplate', res.data);
				}
			};
			freemon.http.ajax(option);
		},
		rangeSlider : function(){
			$('#projectInTalentList').append(Mustache.render($('#rangeSliderTemplate').html(), null));
		},
		monthClick : function($this) {
			var mergeDay = freemon.ux.dayInSelectMonth($this.data("date").toString(), $("#searchStrDate").val());
	    	$('#searchStrDate').val(mergeDay);
	    	talentSearch.param.searchStrDate = mergeDay;
	    	
	    	talentSearch.fn.initSearch();
		},
		sortTypeClick : function(e){
			talentSearch.param.availability = e.data("value");
			e.parent().siblings().removeClass("active");
			e.parent().addClass('active');
			talentSearch.fn.initParam();
			
			freemonPopUp.fn.tagHover();
		},
		careerTypeClick : function(e){
			var value = e.data("value");
			if($("input:checkbox[id='careerY']").is(":checked") == false) value = "";
			talentSearch.param.experience = value;
			
			freemon.util.pushHistory(
				    {
	    				page: '1',
	    				date: $(".dateRangePicker").val(),
	    				career: talentSearch.param.selectedCareerList,
	    				area: talentSearch.param.selectedAreaList,
	                    skill: talentSearch.param.selectedSkillList,
						exp: value
					});

			talentSearch.fn.initSearch();
		},
		goTalentDetail : function(e){
			var map = new CustomMap();			
			var sendUrl = "/talent/talentDetailSearch";
			map.set("fno", e.data("value"));
			
			freemon.util.pushHistory({
                query: freemonSearch.fn.param().keywordList.join(" "),
                page: talentSearch.param.paging.pageNo,
                date: talentSearch.param.searchStrDate,
                order: talentSearch.param.availability,
                career: talentSearch.param.selectedCareerList,
                area: talentSearch.param.selectedAreaList,
                skill: talentSearch.param.selectedSkillList,
                height: e.offset().top - 233,
                exp: talentSearch.param.experience
            });
			freemon.util.getSend(sendUrl, map);
		},
		initSearch : function(){
			talentSearch.param = $.extend({}, talentSearch.param, freemonSearch.fn.param());
			talentSearch.param.month = talentSearch.month;
			talentSearch.param.selectedCareerList = talentSearch.selectedCareer;
			talentSearch.param.selectedAreaList = talentSearch.selectArea;
			talentSearch.param.selectedSkillList = talentSearch.selectSkill;

        	talentSearch.history = {
	        		page : null,
	        		height : null
	        }
			talentSearch.param.experience = ($("input:checkbox[id='careerY']").is(":checked") == false) ? '' : $("input:checkbox[id='careerY']").val();
        	
	        $(".dateRangePicker").val(talentSearch.param.searchStrDate);
			$("#selectDateText").text('' + talentSearch.param.searchStrDate + '');

			freemon.util.pushHistory({
					query: talentSearch.param.keywordList == undefined || talentSearch.param.keywordList == "" ? '' : talentSearch.param.keywordList.join(" "),
					page: talentSearch.param.paging.pageNo,
					date: talentSearch.param.searchStrDate,
					order: talentSearch.param.availability,
					career: talentSearch.param.selectedCareerList == undefined || talentSearch.param.selectedCareerList == "" ? '' : talentSearch.param.selectedCareerList,
					area: talentSearch.param.selectedAreaList == undefined || talentSearch.param.selectedAreaList == "" ? '' : talentSearch.param.selectedAreaList,
					skill: talentSearch.param.selectedSkillList == undefined || talentSearch.param.selectedSkillList == "" ? '' : talentSearch.param.selectedSkillList,
					height: talentSearch.param.height,
					exp: talentSearch.param.experience
                });

	    	talentSearch.fn.selectTalentList();
		},
		addEvent : function(){
			talentSearch.slider.on('change', function (ev, ui) {
		    	freemon.ux.sliderSetValue(ev);
	        });
			talentSearch.slider.on('slideStop', function (ev, ui) {
				talentSearch.fn.initParam(ev);
			});
		},
		searchTag : function(e){
			var searchStrDate = $.datepicker.formatDate('yy-mm-dd', new Date());
			$("#searchStrDate").val(searchStrDate);
			$("#selectDateText").text('' + searchStrDate + '');
			$("#keyword").val(e.data("value"));
			
			talentSearch.fn.initSearch();
			
			freemonPopUp.fn.tagHover();
		},
		selectJobList : function() {
			var option = {
				url : "/common/selectCodeList",
				data : {
					'cdId' : 'SKILL_PART_CD'
				},
				contentType : "application/json; charset=UTF-8",
				type : 'post',
				success : function(res, statusText) {
					$.each(res.data, function(i, job) {
						if(i == 0){
							job.index = true;
							talentSearch.fn.selectSkillObjList(job.cdVal);
							talentSearch.firstCdVal = job.cdVal;
						}
						else{
							job.index = false;
						}
					});

					$('#memberSearchJobList').html(Mustache.render($('#memberSearchJobListTemplate').html(), {'jobList':res.data}));
				}
			};
			freemon.http.ajax(option);
		},
		selectSkillList : function() {
			var option = {
				url : "/common/selectSkillList",
				contentType : "application/json; charset=UTF-8",
				type : 'post',
				success : function(res, statusText) {
					talentSearch.skillObj = res.data;
					talentSearch.fn.selectJobList();
				}
			};
			freemon.http.ajax(option);
		},
		selectSkillObjList : function(data) {
			var skillList = $.grep(talentSearch.skillObj, function (a) { return a.upperCdVal == data; });
			$('#memberSearchSkillList').html(Mustache.render($('#memberSearchSkillListTemplate').html(), {'skillList':skillList}));
		},
        selectArea2List : function(data) {
			var option = {
			    url : "/common/selectCodeList",
	            data : {
	                    'cdId' : 'WORK_AREA_CD'
	            },
				contentType : "application/json; charset=UTF-8",
				type : 'post',
				success : function(res, statusText) {
                    $.each(res.data, function(i, area) {
                        if(i == 0){
                            area.index = true;
                            talentSearch.fn.selectAreaObjList(area.cdVal);
                            talentSearch.firstCdVal = area.cdVal;
                            talentSearch.fn.screenObject();
                        }
                        else{
                            area.index = false;
                        }
                    });
						$('#memberSearchAreaList').html(Mustache.render($('#memberSearchAreaListTemplate').html(), {'areaList':res.data}));
				}
			};
			freemon.http.ajax(option);
		},
		selectAreaList : function() {
			var option = {
				url : "/common/selectCodeListArea",
				data : {
	                    'cdId' : 'WORK_AREA_CD'
	                },
				contentType : "application/json; charset=UTF-8",
				type : 'post',
				success : function(res, statusText) {
					talentSearch.areaObj = res.data;
					talentSearch.fn.selectArea2List();
				}
			};
			freemon.http.ajax(option);
		},
		selectAreaObjList : function(data) {
			var areaList = $.grep(talentSearch.areaObj, function (a) { return a.upperCdVal == data || a.cdVal == data;});
			$('#memberSearchArea2List').html(Mustache.render($('#memberSearchArea2ListTemplate').html(), {'areaList':areaList}));
		},

		deleteArea : function(data) {
            var delArea = talentSearch.selectArea.filter(function (area) {
                if(area == data){
                    $("#area_" + data).remove();
                    $("#memberSearchArea2List #areaSelectList_"+ data).removeClass("active");
                    $.each(talentSearch.areaObj, function(i, area) {
                        if (area.cdVal == data) {
                            talentSearch.areaObj[i].active = false;
                        }
                    });
                    return false;
                }
                return area !== data;
            });
            selectArea = delArea;
            talentSearch.selectArea = selectArea;
            talentSearch.fn.initSearch();
		},
		deleteJob : function(data) {
		    var delSkill = talentSearch.selectSkill.filter(function (job) {
		        if(job == data){
		            $("#skill_" + data).remove();
                    $("#memberSearchSkillList #skillSelectList_"+ data).removeClass("active");
                    $.each(talentSearch.skillObj, function(i, job) {
                        if (job.cdVal == data) {
                            talentSearch.skillObj[i].active = false;
                        }
                    });
                    return false;
                }
                return job !== data;
            });
            selectSkill = delSkill;
			talentSearch.selectSkill = selectSkill;
			talentSearch.fn.initSearch();
		},
		deleteCareer : function(data) {
		    var delCareer = talentSearch.selectedCareer.filter(function (career) {
		        if(career == data){
		            $("#searchWord #" + data).remove();
		            $("#careerList .select_box ul.cf li#"+ data).removeClass("active");
                    return false;
                }
                return career !== data;
            });
            selectedCareer = delCareer;
			talentSearch.selectedCareer = selectedCareer;
			talentSearch.fn.initSearch();
		}
	}
}