var projectMap = {
	name : 'projectMap',
	param : {},
	lat : '',
	lng : '',
	map : null,
	listObj : null,
	markerCluster : null,
	toDay : $.datepicker.formatDate('yy-mm-dd', new Date()), 
	init : function() {
		ObserverControl.addObserver(this);
		
		this.beforeBind();
		this.bind();
	},
	beforeBind : function() {
		$("#freemonSearchDate").val(projectMap.toDay);
		
		projectMap.lat = projectMap.mapinfo.lat;
		projectMap.lng = projectMap.mapinfo.lng;
		
		$("#monthInfo").text($.datepicker.formatDate('yy. mm', new Date()));
		
		var startDate = $.datepicker.formatDate('yy-mm', new Date()) + "-01";
		var endDate = $.datepicker.formatDate('yy-mm', new Date()) + "-" + freemon.util.daysInMonth($.datepicker.formatDate('mm', new Date()), $.datepicker.formatDate('yy', new Date()));
		$("#monthText").text($.datepicker.formatDate('mm', new Date()));
		
		projectMap.param = {
			searchStrDate : startDate,
			searchEndDate : endDate,
			orderBy : "projectDt",
			paging : {
        		pageNo : 1,    
	            listBlock : 100
    		}
		}
		projectMap.currentPosition(null);
	},
	bind : function() {

		$("#freemonSearchDateBtn").click(function(){
			$('#freemonSearchDate').datepicker('show');
		});
		
		$('#freemonSearchDate').datepicker({
			 format: "yyyy-mm-dd",
			 language: "kr",
			 minDate: freemon.util.getDateString(new Date(), '-'),
			 autoclose: true
		});
		
		// 검색조건과 함께 프로젝트 검색화면으로 넘어감
		$("#freemonSearchBtn").click(function(){
		});
		
		// 이전달/다음달
		$("#prevMonth").click(function(){
			var dateSplit = $("#monthInfo").text().split(". ");
			
			projectMap.fn.prevMonth(dateSplit);
		});
		$("#nextMonth").click(function(){
			var dateSplit = $("#monthInfo").text().split(". ");
			
			projectMap.fn.nextMonth(dateSplit);
		});
		
		// 정렬
		$("#projectDt").click(function(){
			$("#regDt").removeClass("active");
			$("#projectDt").addClass("active");
			projectMap.fn.orderBy("new");
			
		});
		$("#regDt").click(function(){
			$("#projectDt").removeClass("active");
			$("#regDt").addClass("active");
			projectMap.fn.orderBy("close");
		});
		
		$("#projectMonthList").on("click", ".num", function(){
			projectMap.lat = $(this).attr("data-lat");
			projectMap.lng = $(this).attr("data-lng");

			if(!freemon.util.isUndefinedOrNull(projectMap.lat) && !freemon.util.isUndefinedOrNull(projectMap.lng)){
				var darwin = new google.maps.LatLng(projectMap.lat, projectMap.lng);
				projectMap.map.setCenter(darwin);
			}
		});
	},
	geoErrer : function(err){
	},
	currentPosition : function(position) {		
		var latlng
		if(projectMap.lat != '' && projectMap.lng != ''){
			latlng = new google.maps.LatLng(projectMap.lat, projectMap.lng);
			 // Map Option
            var map_options = {
                center:latlng,
                zoom:9,
                maxZoom:11,
                minZoom:0,
                mapTypeId:google.maps.MapTypeId.ROADMAP,
                mapTypeControl:false,
                navigationControlOptions:{style:google.maps.NavigationControlStyle.SMALL}
            }
		}
		else{
			latlng = new google.maps.LatLng(36.45555, 126.773029);
			 // Map Option
            var map_options = {
                center:latlng,
                zoom:8,
                maxZoom:11,
                minZoom:0,
                mapTypeId:google.maps.MapTypeId.ROADMAP,
                mapTypeControl:false,
                navigationControlOptions:{style:google.maps.NavigationControlStyle.SMALL}
            }
		}
	    
	    // Map 생성
	    var map = new google.maps.Map(document.getElementById("google_map"), map_options);
	    projectMap.map = map;
	    
	    // 내위치 마커
	    var myIcon = new google.maps.MarkerImage("/resources/images/person_icon.png", null, null, null, new google.maps.Size(21,21));
	    var marker = new google.maps.Marker({
	    				position:latlng,
	    				map:map, 
	    				icon:myIcon, 
	    				title:"You are here!"
	    			});
	    
	    projectMap.fn.projectMonthList(projectMap.param);	    
	},
	fn :  {
		// 한달치 지도 데이터 보여줌
		projectMonthList : function(param){
			/*
			 * 두개 이상의 객체를 합칩(Merge) => extend(target, object1, object2)
			 * target 합쳐지는 추가 객체의 속성을 받을 객체 또는 유일한 인자일 경우 jQuery 네임스페이스로 확장될 객체
			 * object1 합쳐질 때 기준이 될 객체
			 * objectN 기준 객체에 합쳐질 추가 객체
			*/
			
			var option = {
					url : "/project/selectProjectList",
					data : param,
					contentType : "application/json; charset=UTF-8",
					type : 'post',
					success : function(res, statusText) {
						projectMap.listObj = res.data;
						projectMap.fn.listRender(res.data, false);
						$.each(projectMap.listObj.projectList, function(i, data) {
							
							var strDate = data.projStrtDt.replace("-","").replace("-","");
							data.projectDateDiff = freemon.util.calcDayMonthCount(freemon.util.getStringFromDate(new Date()), strDate, 'D');
							data.isProjectStart = function(){
								if (data.projectDateDiff < 0){
									return "off";
								}else{
									return "on";
								}
							}
							
							data.projectDateDiff = data.projectDateDiff.toString();
							data.projectDay = function(){
								if(data.projectDateDiff == 0){
									return "금일시작";
								}else if (data.projectDateDiff > 0){
									return data.projectDateDiff + "일후";
								}else{
									return data.projectDateDiff.replace("-", "")+ "일전";
								}
							}
							
							data.projStrtDt = data.projStrtDt.substr(2,8).replace("-",".").replace("-",".");
							data.projCloseDt = data.projCloseDt.substr(2,8).replace("-",".").replace("-",".");
						});
						
						$('.totalCnt').html(freemon.string.formatComma(res.data.paging.totalCount));
	                    projectMap.fn.setProjectToMap();
	                    $('#projectMonthList').empty();
	                    $('#projectMonthList').append(Mustache.render($('#projectMonthListTemplate').html(), projectMap.listObj));
	                    
					}
				};
			
			freemon.http.ajax(option);
		},
		listRender : function(realObj, isSearch) {
			if(isSearch){
				$('#projectMonthList').html('');
				realObj.isSearch = isSearch;
			}
			$.each(realObj.projectList, function(i, data) {
				var isnegoYn = false;
                if(data.negoYn == "Y"){
                	isnegoYn=true;
                }
                data.negoYn=isnegoYn;
            });
		},
		/*
		 * 지도내 클러스터에서 클릭하거나 마커에서 클릭했을때 가져옴
		 * 
		 * @param param : parameter object
		 */
		selectMapProjectList : function(param) {
			var data = projectMap.listObj;
			var selectProjectList = [];
			
			if(data != null){
				var projectList = data.projectList;
				
				for (var i = 0; i < param.length; i++){
					selectProjectList.push(projectList.find(function(element) {
						  return element.projIdx == param[i];
					}));
				}
			}
			
			var selectProjects = {"projectList" : selectProjectList};
						
			$('#projectMonthList').html(Mustache.render($('#projectMonthListTemplate').html(), selectProjects));
		},
		setProjectToMap : function(){
			var map = projectMap.map;
			var data = projectMap.listObj;
			var cnt = data.projectList.length;
			
		    // set multiple marker
			var mIcon = new google.maps.MarkerImage("/resources/images/new/map_point3.png", null, null, new google.maps.Point(50, 40), new google.maps.Size(120,121));
			
		    var markers = [];
		    for (var i = 0; i < cnt; i++) {
		        // init markers
		    	var locations = new google.maps.LatLng(data.projectList[i].lat, data.projectList[i].longt);

		        var marker = new google.maps.Marker({
		            position: locations,
		            map: map,
		            title: data.projectList[i].projIdx,
		            icon:mIcon
		        });
		        
		        // process multiple info windows
		        (function(marker, i) {
		            // add click event
		        	var hText = "";
			        hText += "<div style='border: 0px solid red; text-align:left;'>";
			        hText += "<strong>" + data.projectList[i].projNm + i + "</strong>";
			        hText += "<br/>" + data.projectList[i].projAddr;
			        hText += "<br/>" + data.projectList[i].projStrtDT + " ~ " + data.projectList[i].projClose_dt;
			        hText += "<br/><a href='#' onClick=alert('" + data.projectList[i].projIdx + "')>클릭</a>";
			        hText += "</div>";
			        
		            google.maps.event.addListener(marker, 'click', function() {
		            	var param = [];
		            	param.push(marker.title);
		            	projectMap.fn.selectMapProjectList(param);
		            	
		            });
		            
		        })(marker, i);

		        markers.push(marker);
		    }
		    
		    // Cluster
		    var styles = [[{
		        url: '/resources/images/new/map_point2.png',
		        width: 120,
		        height: 121,
		        anchor: [0, 0],
		        textColor: '#ffffff',
		        textSize: 40
		      },
		      {
		        url: '/resources/images/new/map_point2.png',
		        height: 120,
		        width: 121,
		        anchor: [0, 0],
		        textColor: '#ffffff',
		        textSize: 40
			  },
			  {
		        url: '/resources/images/new/map_point2.png',
		        height: 120,
		        width: 121,
		        anchor: [0, 0],
		        textColor: '#ffffff',
		        textSize: 40
			  }]];
		    
		    // Cluster 이미지
		    markerCluster = null;

			map.addListener('zoom_changed', function() {
			    var style = 9 - map.getZoom();
			});
			
		    markerCluster = new MarkerClusterer(map, markers, {
		    	  zoomOnClick: false,
		          styles: styles[0]
		        });
		   
		    // Cluster Event 추가
		    google.maps.event.addListener(markerCluster, 'clusterclick', function(cluster) {
		        var marker = cluster.markers_;
		        
		        var param = [];
		        for (var i = 0; i < marker.length; i++) {
		        	param.push(marker[i].title);
		        }
		        
		        projectMap.fn.selectMapProjectList(param);
		    });
		},
		prevMonth : function(date){
			var yy = parseInt(date[0]);
			var mm = parseInt(date[1]);
			
			if(mm == 1){
				yy = yy - 1;
				mm = 12;
			}
			else{
				mm = ("0" + (mm - 1)).slice(-2);
			}
			
			$("#monthInfo").text(yy + ". " + mm);
			
			var date = yy + "-" + mm;
			var startDate = date + "-01";
			var endDate = date + "-" + freemon.util.daysInMonth(parseInt(mm), yy);
			
			projectMap.param = {
				searchStrDate : startDate,
				searchEndDate : endDate,
				orderBy : freemon.util.isUndefinedOrNull(projectMap.param.orderBy) ? "projectDt" : projectMap.param.orderBy,
				paging : {
	        		pageNo : 1,    
		            listBlock : 100
	    		}
			}
			
		    if (markerCluster) {
		    	markerCluster.clearMarkers();
	        }
			
			projectMap.fn.projectMonthList(projectMap.param);
			
			$("#monthText").text(mm);
		},
		nextMonth : function(date){
			var yy = parseInt(date[0]);
			var mm = parseInt(date[1]);
			
			if(mm == 12){
				yy = yy + 1;
				mm = "01";
			}
			else{
				mm = ("0" + (mm + 1)).slice(-2);
			}
			
			$("#monthInfo").text(yy + ". " + mm);
			
			var date = yy + "-" + mm;
			var startDate = date + "-01";
			var endDate = date + "-" + freemon.util.daysInMonth(parseInt(mm), yy);
			
			projectMap.param = {
				searchStrDate : startDate,
				searchEndDate : endDate,
				orderBy : freemon.util.isUndefinedOrNull(projectMap.param.orderBy) ? "projectDt" : projectMap.param.orderBy,
				paging : {
	        		pageNo : 1,    
		            listBlock : 100
	    		}
			}
			
		    if (markerCluster) {
		    	markerCluster.clearMarkers();
	        }
			
			projectMap.fn.projectMonthList(projectMap.param);
			
			$("#monthText").text(mm);
		},
		orderBy : function(ordby){
			var date = $("#monthInfo").text().replace(". ", "-");
			var dateSplit = date.split("-");
			var yy = parseInt(dateSplit[0]);
			var mm = parseInt(dateSplit[1]);
			
			projectMap.param = {
					searchStrDate : date + "-01",
					searchEndDate : date + "-" + freemon.util.daysInMonth(parseInt(mm), yy),
					orderBy : ordby,
					paging : {
		        		pageNo : 1,    
			            listBlock : 100
		    		}
				}
			
			if (markerCluster) {
		    	markerCluster.clearMarkers();
	        }
			
			projectMap.fn.projectMonthList(projectMap.param);
		}
	}
}