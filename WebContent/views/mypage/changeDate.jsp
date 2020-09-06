<%@page import="java.util.Date"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="kh.semi.jsp.member.model.vo.*"%>
<%
	Member m = (Member)session.getAttribute("member");
%>
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
		<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
<script type="text/javascript" src="../../resources/freemon/common/freemonSearch9667.js?version=1.2"></script>

<div id="container">
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
                    <input type="text" id="joinPsblDt" name="joinPsblDt" class="dateRangePicker col-10" value="2020-10-23" placeholder="ex)2020-10-10"/>
                    <button id="changeDate" class="btn_resume col-2" style="cursor:pointer;">변경</button> <!-- 버튼을 누르면 날짜 전송 후 이전 jsp페이지로 이동 -->
                </form>
            </div>
			<img src="images/new/img_insert.png" class="hidden sm-visible" alt="" />
        </div>
    </section>
</div>
<script>
	$("#changeDate").click(function(){
		location.href="/myWeb/chageDate";
	});
</script>
	<%@ include file="../common/footer.jsp"%>


</body>
</html>