var changeAvailableDate = {
	name : 'changeAvailableDate',
	oldDate : '',
	init : function() {
		ObserverControl.addObserver(this);
		this.beforeBind();
		this.bind();
	},
	beforeBind : function() {
		changeAvailableDate.oldDate = $("#joinPsblDt").val();
	},
	bind : function() {
		$("#changeDate").click(function(){
			changeAvailableDate.fn.changeAvailableDate();
		});
	},
	fn :  {
		changeAvailableDate : function() {
			var joinPsblDt = $("#joinPsblDt").val();
			if(!joinPsblDt) {
				freemon.ux.alert("투입가능일을 선택해주세요.");		
				return false;
			}
			else{
				if(changeAvailableDate.oldDate == joinPsblDt){
					freemon.ux.alert("변경할 일자를 선택해주세요.");
					return false;
				}
			}

			var option = {
				url : "/mypage/changeAvailableDate",
				data : {'cntrctEndDt': joinPsblDt},
				contentType : "application/json; charset=UTF-8",
				type : 'post',
				success : function(res, statusText) {
					var map = new CustomMap();
					map.set("joinPsblDt", joinPsblDt);
					
					freemon.util.postSend("/home/changeDateComplete", map);
				},
				error : function(error) {
					freemon.ux.alert('투입가능일 변경시 에러가 발생하였습니다.\n관리자에게 문의하세요');
				}
			};
			freemon.http.ajax(option);

		}
	}
}