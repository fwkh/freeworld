var noticeSearch = {
	name : 'noticeSearch',
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
		noticeSearch.param = {
			paging : {
	            pageNo : 1,        // 현재 선택된 페이지 번호
	            listBlock : 10,    // 목록의 출력 갯수
			}
		}
		noticeSearch.fn.selecNoticeTypeList();
		noticeSearch.fn.selectnNoticeList();
		noticeSearch.fn.infiniteScroll();
	},
	bind : function() {
		$('.cho_faq').on('click', 'ul  li > a', function(){
			noticeSearch.fn.noticeChange($(this));
		});
		
		$('.btn_sesarch').on('click', function(){
			noticeSearch.fn.submit();
		});
		
		$("input[id='keyword']").on('keypress', function(e){
			if(e.which == 13){
				noticeSearch.fn.submit();
			}
		});
		
		$(".project_in").on("click", "[data-action]", function(){
			noticeSearch.fn.dataActionEventHandler($(this));
		})
	},
	fn :  {
		dataActionEventHandler : function(e){
			var action = e.data("action");
			if(action == "moreViewClick") {
				noticeSearch.fn.selectMoreList();
			}
			else if(action == "innerLinks") {
				document.location.href = e.data("value");
			}
			else if(action == "outerLinks") {
				window.open(e.data("value"));
			}
		},
		submit : function() {
			var keyword = $("input[id='keyword']").val();
			var keywordList = [];
			if(keyword != '' && keyword !=null){
				var keywordArr = keyword.split(' ');
				var keywordList = [];
				
				$.each(keywordArr, function(i, data){
					keywordList.push(data);
				});
			}
			
			noticeSearch.param = {
				paging : {
		            pageNo : 1,       
		            listBlock : 10
				},keywordList : keywordList
				,type : noticeSearch.param.type
			}

			noticeSearch.fn.selectnNoticeList();
			//noticeSearch.fn.infiniteScroll();
			freemon.util.pushHistory(
			    {
                    query: keyword,
                    page: noticeSearch.param.paging.pageNo,
                    order: noticeSearch.param.type,
                    height: noticeSearch.param.height
                }
            );
		},
		selectnNoticeList : function() {
			var option = {
				url : "/customer/selectNoticeSearchList",
				data : noticeSearch.param,
				contentType : "application/json; charset=UTF-8",
				type : 'post',
				success : function(res, statusText) {
					noticeSearch.listObj = res.data;
					noticeSearch.fn.listRender(res.data.articleList, true);
					noticeSearch.param.paging = $.extend(noticeSearch.param.paging, res.data.paging);
					$(window).scrollTop(0);
					
					noticeSearch.isList = freemon.ux.isMoreView(res.data.paging);
				}
			};
			freemon.http.ajax(option);
		},
		infiniteScroll : function(){
			$(window).scroll(function() {
		        if ($(window).scrollTop() == $(document).height() - $(window).height() && noticeSearch.isList) {
		        	noticeSearch.fn.selectMoreList();
		        }
		    });
		},    
		listRender : function(obj, isSearch) {
			if(isSearch){
				$('#faq_listul').html('');
			}
			obj.isList = noticeSearch.isList;
			$('#faq_listul').append(Mustache.render($('#faqlistTemplate').html(), {'articleList' : obj}));
		},
		noticeChange : function($this){
			noticeSearch.param.type = $this.attr('data-value');
			$this.parent().siblings().removeClass('active');;
			$this.parent().addClass('active');
			noticeSearch.fn.submit();
		},
		selecNoticeTypeList : function() {
			var option = {
				url : "/common/selectCodeList",
				data : {
					'cdId' : 'BOARD_CD'
				},
				contentType : "application/json; charset=UTF-8",
				type : 'post',
				success : function(res, statusText) {
					$('#noticeList').append(
							Mustache.render($('#noticeTypeListTemplate').html(), {
								'typeList' : res.data
							}));
				}
			};
			freemon.http.ajax(option);
		},
		selectMoreList : function(){
			noticeSearch.param.paging.pageNo++;
        	var option = {
        			url : "/customer/selectNoticeSearchList",
    				data : noticeSearch.param,
    				contentType : "application/json; charset=UTF-8",
    				type : 'post',
    				success : function(res, statusText) {
    					if(res.data.articleList.length > 0){
	    					noticeSearch.listObj = res.data;
	    					noticeSearch.fn.listRender(res.data.articleList, false);
	    					noticeSearch.param.paging = $.extend(noticeSearch.param.paging, res.data.paging);
	    					var height = $(document).scrollTop();
		                    $('#SearchList').animate({ scrollTop : height + 400 }, 600);
    					}
	                    noticeSearch.isList = freemon.ux.isMoreView(res.data.paging);
	            }
    			};
    		freemon.http.ajax(option);
		}
	}
}