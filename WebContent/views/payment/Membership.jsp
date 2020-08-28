<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Document</title>
<style>
    <!-- 네비게이션바 -->
    #f_management{display:none;}
	#p_management{display:none;}
	#profile{display:none;}
	#suggestion{display:none;}
	
	.content{margin: 12% 0% 5% 18%;}
	.chooseMembership
	{
		margin:0% 0% 3% 0%;
		font-size:25px;
	}
	.columnMembership
	{
		display:inline-block;
		margin:3% 16% 0% 3%;
		font-size:20px;
	}
	.membership
	{
		margin:3% 3% 3% 3%;
		font-size:15px;
	}
	.grade
	{
		display:inline-block;
		margin:2% 5% 0% 0%;
		width:100px;
	}
	.rGrade
	{
		margin-right:5%;
	}
	.fee
	{
		margin:2% 0% 0% 12%;
		display:inline-block;
		width:200px;
	}
	.payment
	{
		border:1px solid #0000FF;
		color:#0000FF;
		background:white;
		font-size:20px;
		width:100px; height:50px;
		border-radius: 2px;
		margin:5% 0% 0% 30%;
	}
	<!-- 네비게이션바 -->
</style>
</head>
<body>
<%@ include file="../common/header.jsp" %>
 
	<div class="content">
		<div>
			<div class="chooseMembership">원하는 멤버십을 선택하세요.(멤버쉽은 연간 단위로 갱신 가능합니다.)</div>
			<div>
				<div class="columnMembership">회원 등급</div>
				<div class="columnMembership">연간 요금</div>
				<div class="columnMembership">최대 프로젝트 요금</div>
				<div class="membership">
					<div class="grade">
						<input type="radio" name="radio" class="rGrade" id="silver" value="silver">
						<label for="silver">SILVER</label>
					</div>
					<div class="fee">KRW 500,000</div>
					<div class="fee">KRW 3,000,000</div>
				</div>		
				<div class="membership">
					<div class="grade">
						<input type="radio" name="radio" class="rGrade" id="gold" value="gold">
						<label for="gold">GOLD</label>
					</div>
					<div class="fee">KRW 700,000</div>
					<div class="fee">KRW 10,00,000</div>
				</div>
				<div class="membership">
					<div class="grade">
						<input type="radio" name="radio" class="rGrade" id="diamond" value="diamond" checked="checked">
						<label for="diamond">DIAMOND</label>
					</div>
					<div class="fee">KRW 1,000,000</div>
					<div class="fee">제한없음(추후 협상가능)</div>
				</div>
			</div>
		</div>
		
		<button type="button" autocomplete="off" class="payment" placeholder="">결제</button>
	</div>
	
	<%@ include file="../common/footer.jsp" %>    
</body>
</html>