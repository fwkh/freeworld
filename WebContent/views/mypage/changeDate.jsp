<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<meta http-equiv="content-type" content="text/html;charset=UTF-8" />


<head>
	<%@ include file="../common/header.jsp"%>
	    <!-- 네비게이션바 -->
	<style type="text/css">	  
	  #f_management{display:none;}
	  #p_management{display:none;}
	  #profile{display:none;}
	  #suggestion{display:none;}
	  #login{display:none;}
	</style>
</head>
<body>


<div id="container">ㄴ
	<section class="project_in">
    	<!-- 제목부분 -->
    	<div class="pro_tit mb-0">
        	<h2>투입가능일자변경</h2>
        </div>
        
        <!-- 내용 -->
        <div class="detail_box insert">
        	<h4>투입일자 <span class="red">변경하기</span></h4>
            <p>
            한진선님 프로젝트 일정이 변경되었다면 <br class="hidden xxs-visible" />투입가능일을 변경하셔서<br/>다음 프로젝트 진행에 <br class="hidden xxs-visible" />프리몬 코디가 확인 후 연락 드립니다.</p>
            <div class="input_box cf">
                <form>
                    <input type="text" id="joinPsblDt" name="joinPsblDt" class="dateRangePicker col-10" value="2020-10-23"/>
                    <button id="changeDate" class="btn_resume col-2" style="cursor:pointer;" onClick="return false;"/>변경</button>
                </form>
            </div>
			<img src="images/new/img_insert.png" class="hidden sm-visible" alt="" />
        </div>
    </section>
</div>
	<%@ include file="../common/footer.jsp"%>


</body>
</html>