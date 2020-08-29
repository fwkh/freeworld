<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
                <!-- 기본정보 입력 -->
                <div class="free_con" id="freelancerUpdate" >
                    <form id="updateForm" name="updateForm">
                        <div class="member_input input_small">
                            <div class="gray_box mb-5">
                                <ul class="cf">
                                    <li class="col-6 pr-5">
                                        <!-- <label for="">이름<span class="need orange">(필수)</span></label> -->
                                        <input type="text" id="korNm" name="korNm" value="<%=m.getName()%>" placeholder="실명으로 입력바랍니다."/>
                                    </li>
                                    <li class="col-6 pl-5">
                                        <!-- <label for="">출생년도<span class="need orange">(필수)</span></label> -->
                                        
                                        
                                        
                                        <select id="birthDay" name="birthDay">
                                            <option value="1989">
                                            
                                                
                                                    1989
                                                
                                                
                                            
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
                                        <input type="text" id="telNo" name="telNo" value="01031506595" placeholder="-없이 입력바랍니다."/>
                                    </li>
                                    <li class="col-6 pl-5">
                                        <!-- <label for="">이메일주소<span class="need orange">(필수)</span></label> -->
                                        <input type="hidden" id="userId" name="userId" value="1413481352"/>
                                        <input type="hidden" id="prfPhotoYn" name="prfPhotoYn" value="N"/>
                                        <input type="text" id="email" name="email" value="tap2@naver.com" placeholder="이메일 형식에 맞춰 입력바랍니다."/>
                                    </li>
                                </ul>
                            </div>
                            <ul class="cf">
                                <li class="col-6 pr-5">
                                    <label for="">전문기술<span class="need orange">(필수)</span></label>
                                    <input type="text" id="skills" name="skills" placeholder="선택하세요.(여러개 선택 가능)" value="" readonly="readonly"/>
    
                                    <div class="option depth2 multi" id="skillListModify" style="display: none;">
                                        <div class="select_box cf">
                                            <ul class="cf memberConfigJobList" id="memberModifyJobList">
                                                <!-- 스킬 대분류 -->
                                            </ul>
                                            <ul class="cf memberConfigSkillList" id="memberModifySkillList">
                                                <!-- 스킬 소분류 -->
                                            </ul>
                                        </div>
                                        <div class="view_box">
                                            <ul class="cf">
                                                <!-- 스킬 선택 정보 -->
                                            </ul>
                                            <div id="btnModifySkill" class="btn_close">닫기</div>
                                        </div>
                                    </div>
                                </li>
                                <li class="col-6 pl-5">
                                    <label for="">희망근무지역<span class="need orange">(필수)</span></label>
                                    <input type="text" class="input_local" id="area" name="area" placeholder="선택하세요.(여러개 선택 가능)" value="" readonly="readonly"/>
                                    
                                    <div class="option depth2 multi" id="workAreaList" style="display: none;">
                                        <div class="select_box cf">
                                            <ul class="cf" id="memberConfigAreaList">
                                            </ul>
                                            <ul class="cf" id="memberConfigArea2List">
                                            </ul>
                                        </div>
                                        <div class="view_box">
                                            <ul class="cf">
                                                <!-- 지역 선택 정보 -->
                                            </ul>
                                            <div id="btnArea" class="btn_close">닫기</div>
                                        </div>
                                    </div>
                                </li>
                                <li class="col-6 pr-5">
                                    <label for="">투입가능일<span class="need orange">(필수)</span></label>
                                    <input type="text" class="input_day" id="joinPsblDt" name="joinPsblDt" value=<%=m.getFuture()%> placeholder="투입가능일자를 선택하시면 회원님의 일정에 반영됩니다." readonly="readonly"/>
                                </li>
                             
                            </ul>
    
                        </div>                <!-- 기본정보 입력 -->
                <div class="free_con" id="freelancerUpdate" style="display:none;">
                <form id="updateForm" name="updateForm">
                    <div class="member_input input_small">
                    	<div class="gray_box mb-5">
	                        <ul class="cf">
	                            <li class="col-6 pr-5">
	                                <!-- <label for="">이름<span class="need orange">(필수)</span></label> -->
	                                <input type="text" id="korNm" name="korNm" value="" placeholder="실명으로 입력바랍니다."/>
	                            </li>
	                            <li class="col-6 pl-5">
	                                <!-- <label for="">출생년도<span class="need orange">(필수)</span></label> -->
	                                
	                                
	                                
	                                <select id="birthDay" name="birthDay">
	                                    <option value="1989">
	                                    
	                                        
	                                            1989
	                                        
	                                        
	                                    
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
	                                <input type="text" id="telNo" name="telNo" value="<%=m.getPhone()%>" placeholder="-없이 입력바랍니다."/>
	                            </li>
	                            <li class="col-6 pl-5">
	                                <!-- <label for="">이메일주소<span class="need orange">(필수)</span></label> -->
	                                <input type="hidden" id="userId" name="userId" value="1413481352"/>
	                                <input type="hidden" id="prfPhotoYn" name="prfPhotoYn" value="N"/>
	                                <input type="text" id="email" name="email" value="<%=m.getEmail()%>" placeholder="이메일 형식에 맞춰 입력바랍니다."/>
	                            </li>
							</ul>
						</div>
						<ul class="cf">
                            <li class="col-6 pr-5">
                                <label for="">전문기술<span class="need orange">(필수)</span></label>
                                <input type="text" id="skills" name="skills" placeholder="선택하세요.(여러개 선택 가능)" value="" readonly="readonly"/>

                                <div class="option depth2 multi" id="skillListModify" style="display: none;">
                                    <div class="select_box cf">
                                        <ul class="cf memberConfigJobList" id="memberModifyJobList">
                                            <!-- 스킬 대분류 -->
                                        </ul>
                                        <ul class="cf memberConfigSkillList" id="memberModifySkillList">
                                            <!-- 스킬 소분류 -->
                                        </ul>
                                    </div>
                                    <div class="view_box">
                                        <ul class="cf">
                                            <!-- 스킬 선택 정보 -->
                                        </ul>
                                        <div id="btnModifySkill" class="btn_close">닫기</div>
                                    </div>
                                </div>
                            </li>
                            <li class="col-6 pl-5">
                                <label for="">희망근무지역<span class="need orange">(필수)</span></label>
                                <input type="text" class="input_local" id="area" name="area" placeholder="선택하세요.(여러개 선택 가능)" value=""<%=m.getHope()%>"" readonly="readonly"/>

                                <div class="option depth2 multi" id="workAreaList" style="display: none;">
                                    <div class="select_box cf">
                                        <ul class="cf" id="memberConfigAreaList">
                                        </ul>
                                        <ul class="cf" id="memberConfigArea2List">
                                        </ul>
                                    </div>
                                    <div class="view_box">
                                        <ul class="cf">
                                            <!-- 지역 선택 정보 -->
                                        </ul>
                                        <div id="btnArea" class="btn_close">닫기</div>
                                    </div>
                                </div>
                            </li>
                            <li class="col-6 pr-5">
                                <label for="">투입가능일<span class="need orange">(필수)</span></label>
                                <input type="text" class="input_day" id="joinPsblDt" name="joinPsblDt" value="2020-10-23" placeholder="투입가능일자를 선택하시면 회원님의 일정에 반영됩니다." readonly="readonly"/>
                            </li>
                            <li class="col-6 pl-5">
                                <label for="">해시태그<span class="need orange">(필수)</span></label>
                                <input type="text" id="keyword" name="keyword" value="#장기" placeholder="예)#단기선호 #PL/PM전문 #해외출장경험자" />
                            </li>
                        </ul>

                    </div>
</body>
</html>