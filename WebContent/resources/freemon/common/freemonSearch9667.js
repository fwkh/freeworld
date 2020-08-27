var freemonSearch = {
	name : 'freemonSearch',
	param : {},
	init : function() {
		ObserverControl.addObserver(this);
		this.beforeBind();
		this.bind();
	},
	beforeBind : function() {
		if(!freemonSearch.param) {
			freemonSearch.param = {};
		}
	},
	bind : function() {
		//$('#searchStrDate').val($.datepicker.formatDate('yy-mm-dd', new Date()));
		
		$("#freemonSearchDateBtn").click(function(){
			$('#searchStrDate').datepicker('show');
		});

		$('#freemonSearchDate').datepicker({
			 format: "yyyy-mm-dd",
			 language: "kr",
			 minDate: freemon.util.getDateString(new Date(), '-'),
			 autoclose: true
		});
	},
	fn :  {
		param : function() {
			var param = {};
			
			// 검색 일잔
			param.searchStrDate = $('#searchStrDate').val();
			// 페이징
			param.paging = {
	            pageNo : 1,        // 현재 선택된 페이지 번호
	            listBlock : 10,    // 목록의 출력 갯수
			}
			// 검색 키워드
			var keyword = $("input[id='keyword']").val();

			param.keywordList = [];
			
			if(keyword != '' && keyword !=null){
				var keywordArr = keyword.split(' ');
		
				$.each(keywordArr, function(i, data){
//					param.keywordList.push(data.replace(/#/gi, '%23'));
					param.keywordList.push(data);
				});
			}
			
			return param;
		}
	}
}