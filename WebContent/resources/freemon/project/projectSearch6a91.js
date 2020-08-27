var projectSearch = {
	name : 'projectSearch',
	param : {},
	history : {},
	isList : false,
	listObj : null,
	chartTerm : "12", 
	init : function() {
		ObserverControl.addObserver(this);
		this.beforeBind();
		this.bind();
	},
	beforeBind : function() {
		Kakao.init(frameworkProperties.kakaoAppKey);
		
		History.Adapter.bind(window, 'statechange', function(e) {
			var state = History.getState();
		});
		
		var searchStrDate = $.datepicker.formatDate('yy-mm-dd', new Date());
		$("#searchStrDate").val(searchStrDate);
		$("#selectDateText").text('' + searchStrDate + '');
		
		freemonPopUp.fn.selectTagList("PROJECT");
	},
	bind : function() {		
		projectSearch.param = $.extend({}, projectSearch.param, freemonSearch.fn.param());
		projectSearch.param.month = projectSearch.chartTerm;
		projectSearch.param.orderBy = "close";
		projectSearch.fn.initParam();
		projectSearch.fn.infiniteScroll();
		
		$('.project_in').on('click', "[data-action]", function(){
			projectSearch.fn.dataActionHandler($(this));
		});
		//검색버튼 클릭시
		$("#keyword").keydown(function(e){
			if(e.keyCode == 13){
				$("#freemonSearchBtn").trigger("click");
			}
		});
		
		$("#freemonSearchBtn").click(function(){
			projectSearch.fn.initSearch();
		});
		
		$("#searchStrDate").datepicker().on("change", function(e) {
			projectSearch.fn.initSearch();
		});
		
		$("#projectInTalentList").on("click", ".close", function(){ freemon.ux.hidePopup(".pop_bg"); $("#projectInTalentList").html(""); });
		$('#projectInTalentList').on('click', function(e) {
			if(e.target.className == "pop_bg"){ freemon.ux.hidePopup('.pop_bg'); $("#projectInTalentList").html(""); } 
		});
		
		$("#freemonReload").on('click', function(){
			projectSearch.fn.initReload();
		})
		
	},
	fn :  {
		initParam : function(){
			var value = freemon.util.getUrlValue();
			
	        if(value && value.page != undefined && value != null){
	        	projectSearch.history = {
		        		'page' : value.page,
		        		'height' : value.height,
		        		'keyword' : value.query,
		        		searchStrDate : value.date
		        }

	        	projectSearch.param = {
	        			month : projectSearch.chartTerm,
	        			keywordList : freemon.util.isUndefinedOrNull(freemonSearch.fn.param().keywordList) ? value.query : freemonSearch.fn.param().keywordList,
	        			searchStrDate :  freemon.util.isUndefinedOrNull(value.date) ? $(".dateRangePicker").val() : value.date,
	        			orderBy : freemon.util.isUndefinedOrNull(projectSearch.param.orderBy) ?
	        						 "close" : projectSearch.param.orderBy,
	        			height : value.height,
		        		paging : {
			        		pageNo : 1,    
				            listBlock : 10 * value.page
		        		}
	        	}    
	        					
	        	
	        	$('#keyword').val(freemon.util.isUndefinedOrNull(projectSearch.param.keywordList) ? '' : projectSearch.param.keywordList.join(" "));
	        	$(".cho_man > ul li").siblings().removeClass("active");
	        	if(projectSearch.param.orderBy == "close") $(".cho_man > ul li:first").addClass("active");
	        	else $(".cho_man > ul li:last").addClass("active");
	        }
	        else{
	        	projectSearch.history = {
		        		'page' : null,
		        		'height' : null
		        }
	        }
	        $(".dateRangePicker").val(projectSearch.param.searchStrDate);
    		$("#selectDateText").text('' + projectSearch.param.searchStrDate + '');
    		var query =
    		freemon.util.pushHistory(
    		    {
    		        query: freemon.util.isUndefinedOrNull(projectSearch.param.keywordList) ? '' : projectSearch.param.keywordList.join(" "),
    		        page: projectSearch.param.paging.pageNo,
    		        date: projectSearch.param.searchStrDate,
    		        order: projectSearch.param.orderBy,
	        		height: projectSearch.param.height
                });
    		
	        projectSearch.fn.selectProjectList();
		},
		dataActionHandler : function(e){
			var action = e.data("action");
			if(action == "projectDetail"){
				projectSearch.fn.goProjectDetail(e);
			}else if(action == "talentDetail"){
				return false;
			}else if(action == "shareClick"){
				var p = null;
				var value = e.data("value");
				$.each(projectSearch.listObj.projectList, function(i, data){
					if(data.projIdx == value){
						p = data;
					}
				});
				
				freemon.ux.projectShareKakao(p);
			}else if (action == "projectInfo"){
				projectSearch.fn.projectInTalentList(e);
			}else if (action == "projectNoneInfo"){
				projectSearch.fn.authResult();
			}else if(action == "monthClick"){
				projectSearch.fn.monthClick(e);
			}else if(action == "showTypeClick"){
				projectSearch.fn.showTypeClick(e);
			}else if(action == "sortTypeClick"){
				projectSearch.fn.sortTypeClick(e);
			}else if(action == "moreViewClick"){
				projectSearch.fn.moreProjectList();
			}else if(action == "searchTag"){
				projectSearch.fn.searchTag(e);
			}
		},
		/*
		 * 프로젝트검색목록 조회
		 */
		selectProjectList : function() {
			var option = {
				url : "/project/selectProjectList",
				data : projectSearch.param,
				contentType : "application/json; charset=UTF-8",
				type : 'post',
				success : function(res, statusText) {
					projectSearch.listObj = res.data;
					projectSearch.fn.listRender(res.data, true);
					projectSearch.param.paging = $.extend(projectSearch.param.paging, res.data.paging);
					
					if(projectSearch.history.page){
						projectSearch.param.paging.pageNo = projectSearch.history.page;
						projectSearch.param.paging.listBlock = 10;	
					}
					
					$('.totalCnt').html(freemon.string.formatComma(res.data.paging.totalCount));
					$(window).scrollTop(projectSearch.history.height ? projectSearch.history.height : 0);
					
					projectSearch.isList = freemon.ux.isMoreView(res.data.paging);
				}
			};
			freemon.http.ajax(option);
		},
		/**
		 * 무한 스크롤
		 */
		infiniteScroll : function(){
			$(window).scroll(function() {
				if ($(window).scrollTop() >= $(document).height() - $(window).height() - 1 && projectSearch.isList) {
		        	projectSearch.fn.moreProjectList();
		        }
		    });
		},  
		/**
		 * 무한 스크롤 더보기
		 */
		moreProjectList : function(){
        	projectSearch.param.paging.pageNo++;
        	var option = {
    			url : "/project/selectProjectList",
				data : projectSearch.param,
				contentType : "application/json; charset=UTF-8",
				type : 'post',
				success : function(res, statusText) {
					if(res.data.projectList.length > 0 ){
						projectSearch.listObj = res.data;
						projectSearch.fn.listRender(res.data, false);
						projectSearch.param.paging = $.extend(projectSearch.param.paging, res.data.paging);
                        
						var height = $(document).scrollTop();
                        $('#projectSearchList').animate({ scrollTop : height + 400 }, 600);
                        projectSearch.isList = freemon.ux.isMoreView(res.data.paging);    			
					}
				}
			};
        	freemon.http.ajax(option);
		},   
		/*
		 * 목록 랜딩
		 * 
		 * @param realObj : 목록조회 결과 realObj,
		 * @param isSearch : 검색 유무 isSearch
		 */
		listRender : function(realObj, isSearch) {
			if(isSearch){
				$('#projectSearchList').html('');
				$('#projectSearchCard').html('');
				realObj.isSearch = isSearch;
			}
			$.each(realObj.projectList, function(i, data) {
                var isnegoYn = false;
                if(data.negoYn == "Y"){
                	isnegoYn=true;
                }
                data.negoYn=isnegoYn;
            });
			//Desktop List
			realObj.month = projectSearch.chartTerm;
			obj = freemon.ui.projectListRender(realObj);
			$('#projectSearchList').append(Mustache.render($('#projectSearchListTemplate').html(), {'obj': obj}));
			//Mobile List
			realObj.month = "3";
			obj = freemon.ui.projectListRender(realObj);
			$('#projectSearchCard').append(Mustache.render($('#projectSearchCardTemplate').html(), obj));
		},
		projectInTalentList : function($this){
			$this.data("searchdt", $("#searchStrDate").val());
			freemon.ux.projectInTalentList($this, '#projectInTalentList', '#projectInTalentListTemplate');
		},
		authResult : function() {
			document.location.href = "/login/freemonLogin";
		},
		showTypeClick : function(e){
			projectSearch.chartTerm = e.data("month");
			e.parent().siblings().removeClass("active");
			e.parent().addClass('active');
			projectSearch.fn.initParam();
		},
		sortTypeClick : function(e){
			projectSearch.param.orderBy = e.data("type");
			e.parent().siblings().removeClass("active");
			e.parent().addClass('active');
			projectSearch.fn.initSearch();
			
			freemonPopUp.fn.tagHover();
		},
		monthClick : function($this) {
			var mergeDay = freemon.ux.dayInSelectMonth($this.data("date").toString(), $("#searchStrDate").val());
	    	$('#searchStrDate').val(mergeDay);
	    	projectSearch.fn.initSearch();
		},
		goProjectDetail : function(e){
			freemon.util.pushHistory(
			    {
			        query: freemon.util.isUndefinedOrNull(projectSearch.param.keywordList) ? '' : projectSearch.param.keywordList.join(" "),
			        page: projectSearch.param.paging.pageNo,
			        date: projectSearch.param.searchStrDate,
			        order: projectSearch.param.contractStatus,
	        		height: e.offset().top - 233
                });
			var map = new CustomMap();
			var sendUrl = "/project/projectDetail";
			map.set("project", e.parent().data("value"));
			freemon.util.getSend(sendUrl, map);			
		},
		initSearch : function(){
		    projectSearch.param = $.extend({}, projectSearch.param, freemonSearch.fn.param());

			freemon.util.pushHistory(
                {
					query: freemonSearch.fn.param().keywordList == undefined || freemonSearch.fn.param().keywordList == "" ? '' : freemonSearch.fn.param().keywordList.join(" "),
					page: projectSearch.param.paging.pageNo,
					date: projectSearch.param.searchStrDate,
					order: projectSearch.param.orderBy
                });
			
			projectSearch.fn.selectProjectList();
			
			freemonPopUp.fn.tagHover();
		},
		initReload : function(){
			var searchStrDate = $.datepicker.formatDate('yy-mm-dd', new Date());
			$("#searchStrDate").val(searchStrDate);
			$("#selectDateText").text('' + searchStrDate + '');
			$("#keyword").val('');
			
			projectSearch.fn.initSearch();
		},
		searchTag : function(e){
			$("#keyword").val(e.data("value"));
			projectSearch.fn.initSearch();
			
			freemonPopUp.fn.tagHover();
		}
	}
}