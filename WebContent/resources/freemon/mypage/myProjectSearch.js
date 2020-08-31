var myProjectSearch = {
	name : 'myProjectSearch',
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
		myProjectSearch.fn.submit();
		myProjectSearch.fn.infiniteScroll();
	},
	bind : function() {
		//검색버튼 클릭시
		$("#keyword").keydown(function(e){
			if(e.keyCode == 13){
				$("#freemonSearchBtn").trigger("click");
			}
		});
		$("#freemonSearchBtn").click(function(){
			// 리스트 초기화
			$("#myProjectSearchList").html('');
			myProjectSearch.fn.submit();
		});
		
		$('.project_in').on('click', "[data-action]", function(){
			myProjectSearch.fn.dataActionEnventHalnder($(this));
		});
	},
	fn :  {
		submit : function() {
			$("#myProjectSearchList").html('');
			
			var keyword = $("#keyword").val();
			var keywordList = [];
			if(keyword != '' && keyword !=null){
				var keywordArr = keyword.split(' ');
		
				$.each(keywordArr, function(i, data){
					if(data) keywordList.push(data);
				});
			}
			
			myProjectSearch.param = {
				keywordList : keywordList, // 검색 키워드
				paging : {
		            pageNo : 1,        // 현재 선택된 페이지 번호
		            listBlock : 10,    // 목록의 출력 갯수
				}
			}
			myProjectSearch.fn.selectProjectList(true);
		},
		dataActionEnventHalnder : function(e){
			var action = e.data("action");
			if (action == "moreViewClick"){
				myProjectSearch.fn.moreProjectList();
			}
		},
		selectProjectList : function(isLoad) {
			var option = {
				url : "/mypage/selectmyProject",
				data : myProjectSearch.param,
				contentType : "application/json; charset=UTF-8",
				type : 'post',
				success : function(res, statusText) {
					myProjectSearch.listObj = res.data;
					myProjectSearch.fn.listRender(res.data, true);
					myProjectSearch.param.paging = $.extend(myProjectSearch.param.paging, res.data.paging);
					$('.totalCnt').html(freemon.string.formatComma(res.data.paging.totalCount));
					myProjectSearch.isChange = false;
					myProjectSearch.isList = freemon.ux.isMoreView(res.data.paging);	     
					
					$(window).scrollTop(0);
					
					if(res.data.paging.totalCount > 10){
						$("#btnEdit2").show();
					} 
				}
			};
			freemon.http.ajax(option);
		},infiniteScroll : function(){
			$(window).scroll(function() {
		        //if ($(window).scrollTop() == $(document).height() - $(window).height() && myProjectSearch.isList) {
				if ($(window).scrollTop() >= $(document).height() - $(window).height() - 1 && myProjectSearch.isList) {
		        	myProjectSearch.fn.moreProjectList();
		        }
		    });
		},  
		moreProjectList : function(){
			myProjectSearch.param.paging.pageNo++;
        	var option = {
    			url : "/mypage/selectmyProject",
				data : myProjectSearch.param,
				contentType : "application/json; charset=UTF-8",
				type : 'post',
				success : function(res, statusText) {
					if(res.data.projectList.length != 0) {
						myProjectSearch.param.paging.pageNo++;
						myProjectSearch.listObj = res.data;
						myProjectSearch.fn.listRender(res.data, false);
						myProjectSearch.param.paging = $.extend(myProjectSearch.param.paging, res.data.paging);

                        var height = $(document).scrollTop();
                        $('#myProjectSearchList').animate({ scrollTop : height + 400 }, 600);
                        
                        myProjectSearch.isList = freemon.ux.isMoreView(res.data.paging);	     
                        
                        myProjectSearch.isChange = false;
					}
				}
			};
    		freemon.http.ajax(option);
		}, 
		/*
		 * 목록 랜딩
		 * 
		 * @param obj : 목록조회 결과 object
		 */
		listRender : function(obj, isSearch) {
			var monthArr = [];
			var date;
			for(var i = 0; i < 3; i++) {
				date = freemon.util.addDate(new Date(), 2, i * 1);
				date.setDate(1);
				monthArr.push({
					'date' : date,
					'month' : freemon.string.lpad("" + (date.getMonth() + 1), 2, '0'),
					'className' : 'line_' + (i + 1)
				});
			}
			
			var monthTerm = freemon.util.calcDayMonthCount(freemon.util.getStringFromDate(monthArr[0].date), freemon.util.getStringFromDate(monthArr[3 - 1].date), 'D');
			
			if(isSearch){
				$('#myProjectSearchList').html('');
			}
			
			$.each(obj.projectList, function(i, data) {
				data.monthArr = monthArr;
				data.dateTerm = freemon.util.calcDayMonthCount(data.projStrtDt, data.projCloseDt);

				data.shortProjectDt = freemon.util.getShortDateString(data.projStrtDt, '/');
				var strTerm = freemon.util.calcDayMonthCount(data.projStrtDt, freemon.util.getStringFromDate(monthArr[2].date), 'D');
				var endTerm = freemon.util.calcDayMonthCount(data.projCloseDt, freemon.util.getStringFromDate(monthArr[2].date), 'D');
				
				var width = Math.floor(strTerm/monthTerm * 100);
				data.padding = 0;
				if(endTerm > 0) {
					data.padding = Math.floor(endTerm/monthTerm * 100);
				}
				data.isTermOver = function() {
					if(width > 100) {
						return true;
					} else {
						return false;
					}
				}
				data.width = width;
				if(data.width >= 100) {
					data.width = 99;
				}
				var isnegoYn = false;
                if(data.negoYn == "Y"){
                	isnegoYn=true;
                }
                data.negoYn=isnegoYn;
				// new icon
				var newCount = freemon.util.calcDayMonthCount(data.projRegDt.substr(0,10), freemon.util.getStringFromDate(new Date()), 'D');
				if(newCount > 7){
					data.newImage = false;
				}
				else{
					data.newImage = true;
				}
				
				data.isClosed = function() {
					if(data.closeYn == "Y") {
						return true;
					} else {
						return false;
					}
				}
				
				data.isApplicantCount = function(){
					if(data.applicantCount > 0) return true;
					else return false;
				}
				data.isContractCount = function(){
					if(data.contractCount > 0) return true;
					else return false;
				}
			});
			$('#myProjectSearchList').append(Mustache.render($('#myProjectSearchListTemplate').html(), obj));
		}
	}
}