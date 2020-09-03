
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="kh.semi.jsp.member.model.vo.*"%>
<%
	Member m = (Member)session.getAttribute("member");
	Calendar today = Calendar.getInstance();
	SimpleDateFormat df = new SimpleDateFormat("yy-MM");
%>

<!DOCTYPE html>
<html lang="ko">

<head>
	
	<style type="text/css">	  
	  #f_management{display:none;}
	  #p_management{display:none;}
	  #profile{display:none;}
	  #suggestion{display:none;}
	  #logout{display:none;} 
	  
	  ul, ol, li { list-style:none; margin:0; padding:0; }
   
	    ul.skillTable {}
	    ul.skillTable > li { display:inline-block; width:80px; padding:5px 10px; background:#eee; text-align:center; }
	  /*   ul.skillTable > li ul.submenu { display:none; } */
	</style>
	<style>
	li {
    list-style-type: none;
    margin: 0;
    padding: 0;
    width: 200px;
    background-color: #f1f1f1;
}  <link rel="stylesheet" type="text/css" href="../resources/css/resume.css">
	</style>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>


<body>

        <div class="load_box" style="display:none;">
            <div class="load_img">
                <img src="../resources/images/common/loading.gif" alt="loading"/>
            </div>
        </div>
   
<script type="text/javascript" src="../resources/js/Chart.js"></script>
<script type="text/javascript" src="../resources/js/resumeSearch.js"></script>

<div id="container">
<%@ include file="../common/header.jsp" %>   
	<section class="project_in">
        <h5 class="mb-20 ml-5">기본정보</h5>

        <div class="layer-2">
            <!-- 이력서 파일 -->
            <div id="resumfiles" class="card no_over p-20 cf">
                <div class="profile_big">
                    <div class="profile" style="background-image:url()">프로필사진</div>
                    <div class="btn_box no_gap mt-10 cf">
                        <a href="" data-action="profile" data-value="Y" class="btn b_xs b_red">보임</a>
                        <a href="" data-action="profile" data-value="N" class="btn b_xs ">숨김</a>
                    </div>
                </div>
                <!-- 기본정보 출력 -->
                <div  id="freelancerShow"  id="freelancerShow"  style="display:none;"><!-- class="free_con" -->
                    <h3><=m.getName()%></h3>
                    <div class="gray_box mt-10">
	                    <p class="small"> <=Integer.parseInt(m.getBirth())%></p>
	                    <ul class="ul_detail no_line cf">
		                    <li><span class="tit">전화</span><=m.getPhone()%></li>
		                    <li><span class="tit">이메일</span><=m.getEmail()%></li>
		                </ul>
	                </div>
	                <ul class="ul_detail no_line cf">
	                    <li><span class="tit">희망지역</span><=m.getArea() %></li>
	                    <li><span class="tit">전문기술</span><=m.getSkill1()%>
	                    
	                      <%--  <% if(m.getSkill2()!=null){ %>
                                  , <%=m.getSkill2() %>
                                                                
                                <%} %>
                                <% if(m.getSkill3()!=null){ %>
                                  , <%=m.getSkill3() %>
                                                                
                                <%} %> --%></li>
	                    <li><span class="tit">투입가능일</span><=m.getFuture()%><span class="add_info org">999 일후</span></li>
	                </ul>
	                <div class="add_con cf mt-10">
			            <div class="hash hash_detail">
			                <ul class="cf">
			                   
			                </ul>
			            </div>
			        </div>
                    <!-- 프로필 미리보기 버튼 -->
			        <div class="btn_box left">
			            <a class="btn b_m b_red" href="/talent/openTalentDetail?fno=1444427072" target="_blank">프로필 미리보기</a>
			            <a href="javascript:void(0);" class="i_note">
			                <span>등록된 경력을 기준으로 기업고객에게 보여지는 이력정보 화면입니다.</span>
			            </a>
			        </div>
			            <a href="" class="btn b_s absolute" id="modifyButton" onclick="changeInfo()">수정하기</a>
                </div>
                <script type="text/javascript">
                
                
	                function changeInfo(url){
	                	/* var ajaxOption =({
	                		type:"post",
	                		url:url,
	                		async:true,
	                		dataType:"html",
	                		cache : false
	                	});
	                	
	                	$.ajax(ajaxOption).done(function(data){
	                		
		                	$('#freelancerUpdate').toggle();
	                		$('#freelancerShow').toggle(); 
	                	}) */
	               
	            	}
                </script>

                <!-- 기본정보 입력 -->
                <div id="freelancerUpdate" style="display:block;"><!-- class="free_con"  -->>
                	<form id="updateForm" name="updateForm" action="/myWeb/mUpdate.do" method="post">
                    <div class="member_input input_small">
                    	<div class="gray_box mb-5">
	                        <ul class="cf">
	                            <li class="col-6 pr-5">
	                                <!-- <label for="">이름<span class="need orange">(필수)</span></label> -->
	                                <input type="text" id="korNm" name="korNm" value=" <=m.getName()%>" placeholder="실명으로 입력바랍니다." readonly="readonly"/>
	                            </li>
	                            <li class="col-6 pl-5">
	                                <!-- <label for="">출생년도<span class="need orange">(필수)</span></label> -->
	                                
	                                
	                                
	                                <select id="birthDay" name="birthDay">
	                                    <option value="<=m.getBirth()%>"> 
	                                    
	                                         
	                                           <=m.getBirth()%>
	                                        
	                                        
	                                    
	                                    </option>

	                                    
	                                    <option value="2000"  >2000</option>
	                                    
	                                    <option value="1999"  >1999</option>
	                                    
	                                    <option value="1998"  >1998</option>
	                                    
	                                    <option value="1997"  >1997</option>
	                                    
	                                    <option value="1996"  >1996</option>
	                                    
	                                    <option value="1995"  >1995</option>
	                                    
	                                    <option value="1994"  >1994</option>
	                                    
	                                    <option value="1993"  >1993</option>
	                                    
	                                    <option value="1992"  >1992</option>
	                                    
	                                    <option value="1991"  >1991</option>
	                                    
	                                    <option value="1990"  >1990</option>
	                                    
	                                    <option value="1989"  >1989</option>
	                                    
	                                    <option value="1988"  >1988</option>
	                                    
	                                    <option value="1987"  >1987</option>
	                                    
	                                    <option value="1986"  >1986</option>
	                                    
	                                    <option value="1985"  >1985</option>
	                                    
	                                    <option value="1984"  >1984</option>
	                                    
	                                    <option value="1983"  >1983</option>
	                                    
	                                    <option value="1982"  >1982</option>
	                                    
	                                    <option value="1981"  >1981</option>
	                                    
	                                    <option value="1980"  >1980</option>
	                                    
	                                    <option value="1979"  >1979</option>
	                                    
	                                    <option value="1978"  >1978</option>
	                                    
	                                    <option value="1977"  >1977</option>
	                                    
	                                    <option value="1976"  >1976</option>
	                                    
	                                    <option value="1975"  >1975</option>
	                                    
	                                    <option value="1974"  >1974</option>
	                                    
	                                    <option value="1973"  >1973</option>
	                                    
	                                    <option value="1972"  >1972</option>
	                                    
	                                    <option value="1971"  >1971</option>
	                                    
	                                    <option value="1970"  >1970</option>
	                                    
	                                    <option value="1969"  >1969</option>
	                                    
	                                    <option value="1968"  >1968</option>
	                                    
	                                    <option value="1967"  >1967</option>
	                                    
	                                    <option value="1966"  >1966</option>
	                                    
	                                    <option value="1965"  >1965</option>
	                                    
	                                    <option value="1964"  >1964</option>
	                                    
	                                    <option value="1963"  >1963</option>
	                                    
	                                    <option value="1962"  >1962</option>
	                                    
	                                    <option value="1961"  >1961</option>
	                                    
	                                    <option value="1960"  >1960</option>
	                                    
	                                    <option value="1959"  >1959</option>
	                                    
	                                    <option value="1958"  >1958</option>
	                                    
	                                    <option value="1957"  >1957</option>
	                                    
	                                    <option value="1956"  >1956</option>
	                                    
	                                    <option value="1955"  >1955</option>
	                                    
	                                    <option value="1954"  >1954</option>
	                                    
	                                    <option value="1953"  >1953</option>
	                                    
	                                    <option value="1952"  >1952</option>
	                                    
	                                    <option value="1951"  >1951</option>
	                                    
	                                    <option value="1950"  >1950</option>
	                                    
	                                </select>
	                            </li>
	                            <li class="col-12">
	                                <!-- <label for="">성별</label> -->
	                            	<div class="radio member_check">
		                                <label for="genderCd01">
		                                <input type="radio" id="genderCd01" name="genderCd" value="M" checked=""/>
		                                <i></i>
		                                                        남자</label>
		                                <label for="genderCd02">
		                                <input type="radio" id="genderCd02" name="genderCd" value="F" checked=""/>
		                                <i></i>
		                                                        여자</label>
		                                <label for="genderCd03">
		                                <input type="radio" id="genderCd03" name="genderCd" value="" checked=""/>
		                                <i></i>
		                                                        선택안함</label>
		                        	</div>
	                            </li>
	                            <li class="col-6 pr-5">
	                                <!-- <label for="">휴대폰번호<span class="need orange">(필수)</span></label> -->
	                                <input type="text" id="telNo" name="telNo" value="<=m.getPhone()%>" placeholder="-없이 입력바랍니다."/>
	                            </li>
	                            <li class="col-6 pl-5">
	                                <!-- <label for="">이메일주소<span class="need orange">(필수)</span></label> -->
	                                <input type="hidden" id="userId" name="userId" value="1444427072"/>
	                                <input type="hidden" id="prfPhotoYn" name="prfPhotoYn" value="Y"/>
	                                <input type="text" id="email" name="email" value="<=m.getEmail()%>" placeholder="이메일 형식에 맞춰 입력바랍니다."/>
	                            </li>
							</ul>
						</div>
						
						<div>
						<ul class="cf">
                            <li class="col-6 pr-5">
                                <label for="">전문기술(최대 3가지)<span class="need orange">(필수)</span></label>
                                
                                <input type="text"  onclick="display_change1()" id="skills" name="skills" placeholder="선택하세요.(여러개 선택 가능)" value="<=m.getSkill()%>" 
                                <%--  <% if(m.getSkill2()!=null){ %>
                                  , <%=m.getSkill2() %>
                                                                
                                <%} %>
                                <% if(m.getSkill3()!=null){ %>
                                  , <%=m.getSkill3() %>
                                                                
                                <%} %> --%>
                                readonly="readonly" >
                              
                               
                                
					
                                <div class="option depth2 multi" id="skillListModify" >
                                   
                                    <div class="view_box" id="test1" style="display:none;">
                                        	<ul id ="skillTable"> <!--  checked 조건 걸고 innerhtml로 id=>skills에 입력되게 한다. -->
										
												<li><input type="checkbox" name="skillbox" value="ASP">ASP</li>
												<li><input type="checkbox" name="skillbox" value="JSP">JSP</li>
												<li><input type="checkbox" name="skillbox" value="PHP">PHP</li>
												<li><input type="checkbox" name="skillbox" value="JAVA">JAVA</li>
												<li><input type="checkbox" name="skillbox" value="C">C</li>
												<li><input type="checkbox" name="skillbox" value="C++">C++</li>
												<li><input type="checkbox" name="skillbox" value="C#">C#</li>
												<li><input type="checkbox" name="skillbox" value="ASP.NET">ASP.NET</li>
												<li><input type="checkbox" name="skillbox" value="JavaScript">JavaScript</li>
												<li><input type="checkbox" name="skillbox" value="Ajax">Ajax</li>
												<li><input type="checkbox" name="skillbox" value="Jquery">Jquery</li>
												<li><input type="checkbox" name="skillbox" value="NodeJS">NodeJS</li>
												<li><input type="checkbox" name="skillbox" value="vue.js">vue.js</li>
												<li><input type="checkbox" name="skillbox" value="React.js">React.js</li>
												<li><input type="checkbox" name="skillbox" value="Ruby">Ruby</li>
												<li><input type="checkbox" name="skillbox" value="RubyonRails">RubyonRails</li>
												<li><input type="checkbox" name="skillbox" value="MiPlatform">MiPlatform</li>
												<li><input type="checkbox" name="skillbox" value="Nexacro">Nexacro</li>
												<li><input type="checkbox" name="skillbox" value="XPLATFORM">XPLATFORM</li>
												<li><input type="checkbox" name="skillbox" value="GO">GO</li>
												<li><input type="checkbox" name="skillbox" value="Oracle">Oracle</li>
												<li><input type="checkbox" name="skillbox" value="MS-SQL">MS-SQL</li>
												<li><input type="checkbox" name="skillbox" value="MySQL">MySQL</li>
												<li><input type="checkbox" name="skillbox" value="DB2">DB2</li>
												<li><input type="checkbox" name="skillbox" value="Pro-C">Pro-C</li>
												<li><input type="checkbox" name="skillbox" value="Python">Python</li>
												<li><input type="checkbox" name="skillbox" value="VB">VB</li>
												<li><input type="checkbox" name="skillbox" value="VB.NET">VB.NET</li>
												<li><input type="checkbox" name="skillbox" value="POS">POS</li>
												<li><input type="checkbox" name="skillbox" value="ABAP">ABAP</li>
												<li><input type="checkbox" name="skillbox" value="EJB">EJB</li>
												<li><input type="checkbox" name="skillbox" value="Kotlin">Kotlin</li>
												<li><input type="checkbox" name="skillbox" value="F#">F#</li>
												<li><input type="checkbox" name="skillbox" value="SAP">SAP</li>
												<li><input type="checkbox" name="skillbox" value="PowerBulder">PowerBulder</li>
												<li><input type="checkbox" name="skillbox" value="MFC">MFC</li>
												<li><input type="checkbox" name="skillbox" value="어셈블리">어셈블리</li>
												<li><input type="checkbox" name="skillbox" value="임베디드">임베디드</li>
												<li><input type="checkbox" name="skillbox" value="펌웨어">펌웨어</li>
												<li><input type="checkbox" name="skillbox" value="HMI">HMI</li>
												<li><input type="checkbox" name="skillbox" value="PLC">PLC</li>
												<li><input type="checkbox" name="skillbox" value="Android">Android</li>
												<li><input type="checkbox" name="skillbox" value="Objective-C">Objective-C</li>
												<li><input type="checkbox" name="skillbox" value="Swift">Swift</li>
												
											</ul>
                                        <div id="btnModifySkill" class="btn_close" onclick="closeSkill1();">닫기</div>
                                    </div>
                                </div>
                                
                            </li>
                            <li class="col-6 pl-5">
                                <label for="">희망근무지역<span class="need orange">(필수)</span></label>
                                <!--  -->
                                <input type="text" onclick="display_change2()" class="input_local" id="area" name="area" placeholder="지역을 선택하세요." readonly="readonly" value="<=m.getArea()%>" />
								
                                <div class="option depth2 multi" id="workAreaList" >
                                    
                                    <div class="view_box" id="test2" style="display: none;">
                                        
                                            <!-- 지역 선택 정보 -->
                                        <select id="area1" name="area1"><!-- 입력받은 값을 id=area에 입력되게 한다. -->
	                                    
		                                    <option  value="강남구">강남구</option>
		                                    <option  value="강동구">강동구</option>
		                                    <option  value="강서구">강서구</option>
		                                    <option  value="구로구">구로구</option>
		                                    <option  value="금천구">금천구</option>
		                                    <option  value="노원구">노원구</option>
		                                    <option  value="관악구">관악구</option>
		                                    <option  value="광진구">광진구</option>
		                                    <option  value="도봉구">도봉구</option>
		                                    <option  value="동대문구">동대문구</option>
		                                    <option  value="동작구">동작구</option>
		                                    <option  value="마포구">마포구</option>
		                                    <option  value="서대문구">서대문구</option>
		                                    <option  value="서초구">서초구</option>
		                                    <option  value="성동구">성동구</option>
		                                    <option  value="성북구">성북구</option>
		                                    <option  value="송파구">송파구</option>
		                                    <option  value="양천구">양천구</option>
		                                    <option  value="영등포구">영등포구</option>
		                                    <option  value="용산구">용산구</option>
		                                    <option  value="은평구">은평구</option>
		                                    <option  value="중랑구">중랑구</option>
		                                    <option  value="종로구">종로구</option>
		                                    <option  value="중구">중구</option>
	                                </select>
	                                <div id="btnArea" class="btn_close" onclick="closeSkill2();">닫기</div>
                                    </div>
                                </div>
                            </li>
                            <li class="col-6 pr-5">
                                <label for="">투입가능일<span class="need orange">(필수)</span></label>
                                <input type="text" class="input_day" id="joinPsblDt" name="future" value="<=m.getFuture()%>" placeholder="ex.2020-08-31"/>
                            </li>
                       
                           		<button type="submit"  id="save">저장</button>
		                        <button  href="" id="cancel">취소</button>
                	    				
                        </ul>

                    </div>
                               <script>
                               //skill 열기
                              	function display_change1(){
                              		document.getElementById("test1").style.display='block';
                               	}
                              //skill 닫기
                              	function closeSkill1(){
                            	  
                            		document.getElementById("test1").style.display='none';  
                            		
                            		var check= document.getElementsByName("skillbox");
									
									var str =""; // 선택한 문자열을 담을 변수
									var count= 0; // 몇개를 선택했는지 확인할  변수
									
                            		for(var i=0;i<check.length;i++){
                            			
                            			if (document.getElementsByName("skillbox")[i].checked == true) {
                            	              str+= document.getElementsByName("skillbox")[i].value+",";
                            	              count++;
                            	            } 
                            		} 
                            		if(count<=3){
                            			document.getElementById("skills").value=str;
                            		}else{
                            			alert("3가지만 선택해주세요.");
                            		}
                            	}
                              	// area 열기
                              	function display_change2(){
                              		document.getElementById("test2").style.display='block';
                               	}
                              	// area 닫기
                              	function closeSkill2(){
                              		
                            		document.getElementById("test2").style.display='none';
                            		
                            		var area = document.getElementById("area1");
                            		document.getElementById("area").value=area.options[area.selectedIndex].value;
                            	}
                              </script>   
				</div>
                </form>
                 
                </div>
                <!-- /기본정보 입력 -->
            </div>
            <!-- /이력서 파일 -->
            <!-- 이력서 파일 -->
	        <div class="card border_org over_hidden cf">
	            <div class="card_info">
	                <h3><span class="orange">파일 등록</span>으로 프로필을 <span class="orange">10초 완성</span>하세요~</h3>
	                <div class="file_btn cf">
	                <!--  경로 재설정 필요 -->
	                    <form id="registForm" name="registForm" enctype="multipart/form-data" action="<%= request.getContextPath() %>/fileUpdate.bo" > 
	                       <input type="file" name="file" id="file" />
	                        <button type="submit"style="size:10; cursor:pointer;">등록</button>
	                    </form>
	                  
	                </div>
	                <h6>이력서 파일을 올려주시면 프리몬에서 프로필을 완성해드립니다.</h6>
	                <p class="small">(최대 2~3일 소요, 프로필 완성 후 카카오톡 메시지로 안내드립니다.)</p>
	            </div>
	            <div class="card_info bg_gray">
	                <em class="f_note">공개 선택 시, 지원한 프로젝트에서 기업이 해당 파일을 다운로드할 수 있습니다.</em>
	                
	            </div>
	        </div>
	        <!-- /이력서 파일 -->
	    </div>

        <!-- 보유기술 *없애면 수행프로젝트 목록이 안나옴 display:none으로 처리 -->
        <div class="resume_box cf" style="display:none;">
            <div class="detail_info man_detail_graph cf sm-col-12" id="resumeSkillList">
            </div>
        </div>

        <!-- tab_menu -->
        <div class="tab_menu mt-20">
            <ul>
                <li id="projTab" data-action="setTabValue" data-value="1"><a href="javascript:void(0);">수행 프로젝트</a></li>
                <li id="schoolTab" data-action="setTabValue" data-value="2"><a href="javascript:void(0);">학력</a></li>
                <li id="certTab" data-action="setTabValue" data-value="3"><a href="javascript:void(0);">자격사항</a></li>
                <li id="etcTab" data-action="setTabValue" data-value="4"><a href="javascript:void(0);">기타</a></li>
            </ul>
        </div>
        <div class="man_list hidden" id="proj">
            <!-- 제목 *없애면 수행프로젝트 수정안됨 display:none으로 처리 -->
            <h4 class="middle_tit" style="display:none;">경력</h4>

            <button id="btnAdd" class="btn b_add" data-action="addViewClick" onClick="return false;">추가등록</button>

            <!-- 경력 입력/수정 -->
            <div class="card hidden" id="divInsert">
                <div class="card_info">
	            	<form id="regForm" name="regForm">
		            	<div class="member_input input_small">
	                        <ul class="cf">
		                    	<li class="col-4 pr-5">
                                    <label for="occupation">프로젝트 유형</label>
                                    <div class="radio member_check">
                                    
                                        <label for="occupation1"><input type="checkbox" id="occupation1" name="occupation" value="1" /> <i></i>SI</label>
                                    
                                        <label for="occupation2"><input type="checkbox" id="occupation2" name="occupation" value="2" /> <i></i>SM</label>
                                    
                                        <label for="occupation3"><input type="checkbox" id="occupation3" name="occupation" value="3" /> <i></i>기타</label>
                                    
                                    </div>
                                </li>
		                    	<li class="col-4 pl-5 pr-5">
									<label for="domain">분야</label>
									<div class="dropdown2">
										<div id="dt">
											<dt>
												<a href="#" onClick="return false;"> <span class="input_tech" id="hida2">분야를 선택해주세요.(여러개 선택 가능)</span>
													<p id="multiSel2"></p>
												</a>
											</dt>
										</div>
									</div>
									<div class="option depth1 multi" id="mutliSelect2" style="display: none;">
										<div class="select_box cf">
											<ul class="cf">
												
													<li><label style="color:#333; margin-bottom:0px; font-size:15px;" for="domain1"><input type="checkbox" id="domain1" name="domain" value="제조" data-value="1" data-role="domain" />제조</label></li>
												
													<li><label style="color:#333; margin-bottom:0px; font-size:15px;" for="domain2"><input type="checkbox" id="domain2" name="domain" value="금융" data-value="2" data-role="domain" />금융</label></li>
												
													<li><label style="color:#333; margin-bottom:0px; font-size:15px;" for="domain3"><input type="checkbox" id="domain3" name="domain" value="교육" data-value="3" data-role="domain" />교육</label></li>
												
													<li><label style="color:#333; margin-bottom:0px; font-size:15px;" for="domain4"><input type="checkbox" id="domain4" name="domain" value="의료" data-value="4" data-role="domain" />의료</label></li>
												
													<li><label style="color:#333; margin-bottom:0px; font-size:15px;" for="domain5"><input type="checkbox" id="domain5" name="domain" value="공공" data-value="5" data-role="domain" />공공</label></li>
												
													<li><label style="color:#333; margin-bottom:0px; font-size:15px;" for="domain6"><input type="checkbox" id="domain6" name="domain" value="법조" data-value="6" data-role="domain" />법조</label></li>
												
													<li><label style="color:#333; margin-bottom:0px; font-size:15px;" for="domain7"><input type="checkbox" id="domain7" name="domain" value="유통" data-value="7" data-role="domain" />유통</label></li>
												
													<li><label style="color:#333; margin-bottom:0px; font-size:15px;" for="domain8"><input type="checkbox" id="domain8" name="domain" value="디자인" data-value="8" data-role="domain" />디자인</label></li>
												
													<li><label style="color:#333; margin-bottom:0px; font-size:15px;" for="domain9"><input type="checkbox" id="domain9" name="domain" value="웹솔루션" data-value="9" data-role="domain" />웹솔루션</label></li>
												
													<li><label style="color:#333; margin-bottom:0px; font-size:15px;" for="domain10"><input type="checkbox" id="domain10" name="domain" value="모바일앱" data-value="10" data-role="domain" />모바일앱</label></li>
												
													<li><label style="color:#333; margin-bottom:0px; font-size:15px;" for="domain11"><input type="checkbox" id="domain11" name="domain" value="플랫폼" data-value="11" data-role="domain" />플랫폼</label></li>
												
													<li><label style="color:#333; margin-bottom:0px; font-size:15px;" for="domain12"><input type="checkbox" id="domain12" name="domain" value="챗봇" data-value="12" data-role="domain" />챗봇</label></li>
												
													<li><label style="color:#333; margin-bottom:0px; font-size:15px;" for="domain13"><input type="checkbox" id="domain13" name="domain" value="머신러닝/AI/빅데이터" data-value="13" data-role="domain" />머신러닝/AI/빅데이터</label></li>
												
													<li><label style="color:#333; margin-bottom:0px; font-size:15px;" for="domain14"><input type="checkbox" id="domain14" name="domain" value="기타" data-value="14" data-role="domain" />기타</label></li>
												
											</ul>
										</div>
									</div>
								</li>
								<li class="col-2 pl-5 pr-5">
		                            <div class="input cf">
		                                <label for="strtDt">프로젝트 시작일<span class="need orange">(필수)</span></label>
		                                <input type="text" class="input_day dateRangePicker" value="" style="cursor:pointer;" readonly="readonly" id="strtDt" name="strtDt" />
		                            </div>
		                        </li>
		                        <li class="col-2 pl-5">
		                            <div class="input cf">
		                                <label for="endDt">프로젝트 종료일<span class="need orange">(필수)</span></label>
		                                <input type="text" class="input_day dateRangePicker" value="" style="cursor:pointer;" readonly="readonly" id="endDt" name="endDt" />
		                            </div>
		                        </li>
		                        <li class="col-4 pr-5">
		                            <div class="input cf">
										<label for="customer">발주처<span class="need orange">(필수)</span></label>
		                                <input type="text" id="customer" name="customer" value=""  maxlength="50" />
		                            </div>
		                        </li>
								<li class="col-8 pl-5">
		                            <div class="input cf">
		                                <label for="projNm">프로젝트명<span class="need orange">(필수)</span></label>
		                                <input type="text" id="projNm" name="projNm" value=""  maxlength="50" />
		                            </div>
		                        </li>
								<li class="col-4 pr-5">
		                            <div class="input cf">
		                                <label for="workCompNm">근무회사</label>
		                                <input type="text" id="workCompNm" name="workCompNm" value="" maxlength="30" />
		                            </div>
		                        </li>
								<li class="col-4 pl-5 pr-5">
									<div class="input cf keywords-container">
										<label for="jobPos">역할</label>
										<div class="dropdown">
											<div id="dt">
												<dt>
													<a href="#" onClick="return false;"> <span class="input_tech" id="hida">역할을 선택해주세요.(여러개 선택 가능)</span>
														<p id="multiSel"></p>
													</a>
												</dt>
											</div>
										</div>
									</div>
									<div class="option depth1 multi" id="mutliSelect" style="display: none;">
										<div class="select_box cf">
											<ul class="cf">
												
													<li><label style="color:#333; margin-bottom:0px; font-size:15px;" for="jobPos1"><input type="checkbox" id="jobPos1" name="jobPos" value="PM" data-value="1" data-role="role" />PM</label></li>
												
													<li><label style="color:#333; margin-bottom:0px; font-size:15px;" for="jobPos2"><input type="checkbox" id="jobPos2" name="jobPos" value="PL" data-value="2" data-role="role" />PL</label></li>
												
													<li><label style="color:#333; margin-bottom:0px; font-size:15px;" for="jobPos3"><input type="checkbox" id="jobPos3" name="jobPos" value="DBA" data-value="3" data-role="role" />DBA</label></li>
												
													<li><label style="color:#333; margin-bottom:0px; font-size:15px;" for="jobPos4"><input type="checkbox" id="jobPos4" name="jobPos" value="AA" data-value="4" data-role="role" />AA</label></li>
												
													<li><label style="color:#333; margin-bottom:0px; font-size:15px;" for="jobPos5"><input type="checkbox" id="jobPos5" name="jobPos" value="TA" data-value="5" data-role="role" />TA</label></li>
												
													<li><label style="color:#333; margin-bottom:0px; font-size:15px;" for="jobPos6"><input type="checkbox" id="jobPos6" name="jobPos" value="개발" data-value="6" data-role="role" />개발</label></li>
												
													<li><label style="color:#333; margin-bottom:0px; font-size:15px;" for="jobPos7"><input type="checkbox" id="jobPos7" name="jobPos" value="기타" data-value="7" data-role="role" />기타</label></li>
												
											</ul>
										</div>
									</div>
								</li>
		                        <li class="col-4 pl-5">
		                            <div class="input cf">
		                                <label for="lang">주요 기술<span class="need orange">(필수)</span></label>
		                                <input type="text" id="lang" name="lang" value="" readonly="readonly" style="cursor:pointer;" placeholder="주요기술(언어, DBMS)을 선택해 주세요."/>
		                            </div>
		                            <div class="option depth2 multi" id="skillPartList" style="display:none;">
		                                <div class="select_box cf">
		                                    <ul class="cf memberConfigJobList" id="memberConfigJobList">
		                                    </ul>
		                                    <ul class="cf memberConfigSkillList" id="memberConfigSkillList">
		                                    </ul>
		                                </div>
		                                <div class="view_box">
		                                    <ul class="cf">
		                                    </ul>
		                                    <div id="btnSkill" class="btn_close">닫기</div>
		                                </div>
		                            </div>
		                        </li>
		                        <li class="col-4 pr-5">
		                            <div class="input textarea cf">
		                                <label for="role">주요업무</label>
		                                <textarea id="role" name="role"></textarea>
		                            </div>
		                        </li>
		                         <li class="col-4 pl-5 pr-5">
		                            <div class="input textarea cf">
		                                <label for="projectDtl">프로젝트 설명</label>
		                                <textarea id="projectDtl" name="projectDtl"></textarea>
		                            </div>
		                        </li>
		                        <li class="col-4 pl-5">
		                            <div class="input textarea cf">
		                                <label for="etc" style="width:100%;">비고(프레임워크, OS, 개발툴, 기종, 통신, 기타내용)</label>
		                                <textarea id="etc" name="etc"></textarea>
		                            </div>
		                        </li>
		                	</ul>
		                </div>
		                <div class="btn_box mt-10">
		                    <button id="btnInsert" class="btn b_m b_red" data-action="InsertClick" style="cursor:pointer;" onClick="return false;">저장</button>
		                    <button id="btnClose" class="btn b_m" data-action="closeViewClick" style="cursor:pointer;" onClick="return false;">닫기</button>
		                </div>
	                </form>
                </div>
            </div>

        	<!-- 경력 정보 -->
        	<div id="resumeSearchList">
                <div class="project_box cf" style="text-align:center; vertical-align:middle!important;height:100px;">
                    <span class="red" style="line-height:30px;font-size:16px;">
                        <p style="padding-top:15px;">이력서 파일을 첨부하시면 프리몬에서 이력정보를 업데이트 해 드립니다.</p>
                    </span>
                </div>
            </div>

            <!-- 더보기 -->
        	<div class="more_box" style="display:none;">
           		<a href="javascript:void(0);" class="btn_more center" data-action="moreViewClick"><span class="t_more">더보기</span></a>
        	</div>

        </div>

        <!-- 학력 -->
        <div class="man_list hidden" id="school">
            <button id="" class="btn b_add" data-action="addEducation" onClick="return false;">추가등록</button>
            <!-- 학력 입력/수정 -->
            <div class="card hidden" id="educationInsert">
                <div class="card_info">
                    <form id="schoolForm" name="schoolForm">
                        <div class="member_input input_small">
	                        <ul class="cf">
                                <li class="col-6 pr-5">
                                     <label for="">학교명<span class="need orange">(필수)</span></label>
                                     <input type="text" id="schoolNm" name="schoolNm"/>
                                </li>
                                <li class="col-3 pl-5 pr-5">
                                     <label for="">입학일<span class="need orange">(필수)</span></label>
                                     <input type="text" class="dateRangePicker" id="entrncDt" name="entrncDt" readonly="readonly"/>
                                </li>
                                <li class="col-3 pl-5">
                                     <label for="">졸업일<span class="need orange">(필수)</span></label>
                                     <input type="text" class="dateRangePicker" id="finishDt" name="finishDt" readonly="readonly"/>
                                </li>
                                <li class="col-6 pr-5">
                                     <label for="">전공</label>
                                     <input type="hidden" id="userId" name="userId" value="1444427072"/>
                                     <input type="text" id="major" name="major"/>
                                </li>
                                <li class="col-2 pl-5 pr-5">
                                     <label for="customer">졸업상태<span class="need orange">(필수)</span></label>
                                     <select id="state" name="state">
                                         <option value="0">선택</option>
                                         <option value="1">졸업</option>
                                         <option value="2">졸업예정</option>
                                         <option value="3">재학중</option>
                                         <option value="4">중퇴</option>
                                         <option value="5">수료</option>
                                         <option value="6">휴학</option>
                                     </select>
                                </li>
                                <li class="col-2 pl-5 pr-5">
                                     <label for="">학점</label>
                                     <input type="text" id="score" name="score"/>
                                </li>
                                <li class="col-2 pl-5">
                                     <label for="">학점기준</label>
                                     <select id="grade" name="grade">
                                         <option value="0">선택</option>
                                         <option value="4.0">4.0</option>
                                         <option value="4.3">4.3</option>
                                         <option value="4.5">4.5</option>
                                     </select>
                                </li>
						    </ul>
						</div>
						<div class="btn_box mt-10">
                            <button id="" class="btn b_m b_red" data-action="registSchool" style="cursor:pointer;" onClick="return false;">저장</button>
                            <button id="btnSchoolClose" class="btn b_m" data-action="closeSchoolClick" style="cursor:pointer;" onClick="return false;">닫기</button>
                        </div>
					</form>
				</div>
			</div>
			<!-- 학력 출력 -->
			<div id="schoolList">
                <div class="project_box cf" style="text-align:center; vertical-align:middle!important;height:100px;">
                    <span class="red" style="line-height:30px;font-size:16px;">
                        <p style="padding-top:15px;">이력서 파일을 첨부하시면 프리몬에서 이력정보를 업데이트 해 드립니다.</p>
                    </span>
                </div>
			</div>
		</div>
        <!-- /학력 -->

        <!-- 자격증 -->
        <div class="man_list hidden" id="cert">
            <button id="" class="btn b_add" data-action="addCertClick" onClick="return false;">추가등록</button>
            <!-- 자격증 입력/수정 -->
            <div class="card hidden" id="certInsert">
                <div class="card_info">
                    <form id="certForm" name="certForm">
                        <div class="member_input input_small">
	                        <ul class="cf">
                                <li class="col-6 pr-5">
                                     <label for="">자격증명<span class="need orange">(필수)</span></label>
                                     <input type="text" id="quilifNm" name="quilifNm"/>
                                </li>
                                <li class="col-3 pl-5 pr-5">
                                     <label for="">발행처/기관</label>
                                     <input type="text" id="publOrg" name="publOrg"/>
                                </li>
                                <li class="col-3 pl-5">
                                     <label for="">취득일<span class="need orange">(필수)</span></label>
                                     <input type="text" class="dateRangePicker" id="acqrDt" name="acqrDt" readonly="readonly"/>
                                </li>
						    </ul>
						</div>
						<div class="btn_box mt-10">
                            <button id="" class="btn b_m b_red" data-action="registCert" style="cursor:pointer;" onClick="return false;">저장</button>
                            <button id="certClose" class="btn b_m" data-action="closeCertClick" style="cursor:pointer;" onClick="return false;">닫기</button>
                        </div>
					</form>
				</div>
			</div>
			<!-- 자격증 출력 -->
			<div id="certList">
                <div class="project_box cf" style="text-align:center; vertical-align:middle!important;height:100px;">
                    <span class="red" style="line-height:30px;font-size:16px;">
                        <p style="padding-top:15px;">이력서 파일을 첨부하시면 프리몬에서 이력정보를 업데이트 해 드립니다.</p>
                    </span>
                </div>
			</div>

		</div>
        <!-- /자격증 -->

        <!-- 기타 -->
        <div class="man_list hidden" id="etcList">
            <button id="" class="btn b_add" data-action="addEtc" onClick="return false;">추가등록</button>
            <!-- 기타 입력/수정 -->
            <div class="card hidden" id="etcInsert">
                <div class="card_info">
                    <form id="etcForm" name="etcForm">
                        <div class="member_input input_small">
	                        <ul class="cf">
                                <li class="col-12">
                                    <label for="">항목명<span class="need orange">(필수)</span></label>
                                    <input type="text" id="subject" name="subject"/>
                                </li>
                                <li class="col-12">
                                    <label for="">내용<span class="need orange">(필수)</span></label>
                                    <textarea id="contents" name="contents" style="height:200px;"></textarea>
                                </li>
						    </ul>
						</div>
						<div class="btn_box mt-10">
                            <button id="" class="btn b_m b_red" data-action="registEtc" style="cursor:pointer;" onClick="return false;">저장</button>
                            <button id="" class="btn b_m" data-action="closeEtcClick" style="cursor:pointer;" onClick="return false;">닫기</button>
                        </div>
					</form>
				</div>
			</div>
			<!-- 기타 출력 -->
			<div id="etcViewList">
                <div class="project_box cf" style="text-align:center; vertical-align:middle!important;height:100px;">
                    <span class="red" style="line-height:30px;font-size:16px;">
                        <p style="padding-top:15px;">이력서 파일을 첨부하시면 프리몬에서 이력정보를 업데이트 해 드립니다.</p>
                    </span>
                </div>
		    </div>
		</div>
        <!-- /기타 -->
    </section>
</div>
	
<%@ include file="../common/footer.jsp"%>		

</body>
</html>