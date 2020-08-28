<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Document</title>
</head>
<body>
<%@ include file="../common/header.jsp" %>    
	<div class="centerContainer narrowCenterContainer"
		style="display: block; transform: none; opacity: 1; transition-duration: 250ms;">
		<div class="planFormContainer" data-uia="form-plan-selection">
			<div>
				<div class="stepHeader-container" data-uia="header">
					<div class="stepHeader" data-a11y-focus="true" tabindex="0">
						<span id="" class="stepIndicator" data-uia="">
							<b>1</b>/<b>3단계</b>
						</span>
						<h1 class="stepTitle" data-uia="stepTitle">원하는 멤버십을 선택하세요.</h1>
					</div>
				</div>
				<div class="changeAnytime">멤버십은 언제든지 변경하실 수 있습니다.</div>
			</div>
			<div class="planGrid planGrid--has3Plans" data-uia="plan-grid">
				<div class="planGrid__header">
					<div class="planGrid__selector planGrid__planSelector" role="radiogroup" aria-label="멤버십" aria-describedby="planGrid_planChoice_description" data-uia="plan-grid-plan-selector">
						<span class="planGrid__selectorDescription" id="planGrid_planChoice_description" data-uia="plan-grid-plan-selector+description" aria-hidden="true">원하는 멤버십을 선택하세요</span>
						<label class="planGrid__selectorChoice planGrid__planChoice" for="planGrid_planChoice_0" data-uia="plan-grid-plan-selector+label-text_1_stream_name">
							<input type="radio" name="planChoice" class="planGrid__selectorInput planGrid__planInput" id="planGrid_planChoice_0" data-uia="plan-grid-plan-selector+input-text_1_stream_name" value="314001031">
							<span class="planGrid__selectorLabel planGrid__planLabel">베이식</span>
						</label>
						<label class="planGrid__selectorChoice planGrid__planChoice" for="planGrid_planChoice_1" data-uia="plan-grid-plan-selector+label-text_2_stream_name">
							<input type="radio" name="planChoice" class="planGrid__selectorInput planGrid__planInput" id="planGrid_planChoice_1" data-uia="plan-grid-plan-selector+input-text_2_stream_name" value="10322">
							<span class="planGrid__selectorLabel planGrid__planLabel">스탠다드</span>
						</label>
						<label class="planGrid__selectorChoice planGrid__planChoice" for="planGrid_planChoice_2" data-uia="plan-grid-plan-selector+label-text_4_stream_name">
							<input type="radio" name="planChoice" class="planGrid__selectorInput planGrid__planInput" id="planGrid_planChoice_2" data-uia="plan-grid-plan-selector+input-text_4_stream_name" value="10341" checked="">
							<span class="planGrid__selectorLabel planGrid__planLabel">프리미엄</span>
						</label>
					</div>
				</div>
				<table class="planGrid__featureTable" role="table" data-uia="plan-grid-feature-table">
					<caption class="planGrid__featureTableCaption">Netflix 멤버십 유형별 혜택</caption>
					<tbody class="planGrid__featureTableBody" data-uia="plan-grid-feature-table-body">
						<tr role="row" class="planGrid__featureTableRow">
							<td class="planGrid__cell planGrid__featureCell" role="cell" data-uia="plan-grid-feature-table-cell+planPrice-feature">월 요금</td>
							<td class="planGrid__cell planGrid__stringCell" role="cell" data-uia="plan-grid-feature-table-cell+planPrice-text_1_stream_name" aria-label="베이식">KRW9,500</td>
							<td class="planGrid__cell planGrid__stringCell" role="cell" data-uia="plan-grid-feature-table-cell+planPrice-text_2_stream_name" aria-label="스탠다드">KRW12,000</td>
							<td class="planGrid__cell planGrid__cell--isSelected planGrid__stringCell" role="cell" data-uia="plan-grid-feature-table-cell+planPrice-text_4_stream_name" aria-label="프리미엄">KRW14,500</td>
						</tr>
						<tr role="row" class="planGrid__featureTableRow">
							<td class="planGrid__cell planGrid__featureCell" role="cell" data-uia="plan-grid-feature-table-cell+planHasHd-feature">HD 화질 지원</td>
							<td class="planGrid__cell planGrid__booleanCell" role="cell" data-uia="plan-grid-feature-table-cell+planHasHd-text_1_stream_name" aria-label="베이식">
								<span class="planGrid__booleanLabel">아니요</span>
								<span class="planGrid__booleanIcon" aria-hidden="true">
									<svg id="thin-x" viewBox="0 0 26 26" class="svg-icon svg-icon-thin-x planGrid__booleanGraphic" focusable="true">
										<path d="M10.5 9.3L1.8 0.5 0.5 1.8 9.3 10.5 0.5 19.3 1.8 20.5 10.5 11.8 19.3 20.5 20.5 19.3 11.8 10.5 20.5 1.8 19.3 0.5 10.5 9.3Z"></path>
									</svg>
								</span>
							</td>
							<td class="planGrid__cell planGrid__booleanCell" role="cell" data-uia="plan-grid-feature-table-cell+planHasHd-text_2_stream_name" aria-label="스탠다드">
								<span class="planGrid__booleanLabel">예</span>
								<span class="planGrid__booleanIcon" aria-hidden="true">
									<svg id="thin-check" viewBox="0 0 26 26" class="svg-icon svg-icon-thin-check planGrid__booleanGraphic" focusable="true">
										<path d="M9.19 22.892L.5 14.198l1.232-1.233 7.236 7.24L23.793.516l1.38 1.04L9.19 22.892"></path>
									</svg>
								</span>
							</td>
							<td class="planGrid__cell planGrid__cell--isSelected planGrid__booleanCell" role="cell" data-uia="plan-grid-feature-table-cell+planHasHd-text_4_stream_name" aria-label="프리미엄">
								<span class="planGrid__booleanLabel">예</span>
								<span class="planGrid__booleanIcon" aria-hidden="true">
									<svg id="thin-check" viewBox="0 0 26 26" class="svg-icon svg-icon-thin-check planGrid__booleanGraphic" focusable="true">
										<path d="M9.19 22.892L.5 14.198l1.232-1.233 7.236 7.24L23.793.516l1.38 1.04L9.19 22.892"></path>
									</svg>
								</span>
							</td>
						</tr>
						<tr role="row" class="planGrid__featureTableRow">
							<td class="planGrid__cell planGrid__featureCell" role="cell" data-uia="plan-grid-feature-table-cell+planHasUltraHd-feature">UHD 화질 이용가능</td>
							<td class="planGrid__cell planGrid__booleanCell" role="cell" data-uia="plan-grid-feature-table-cell+planHasUltraHd-text_1_stream_name" aria-label="베이식">
								<span class="planGrid__booleanLabel">아니요</span>
								<span class="planGrid__booleanIcon" aria-hidden="true">
									<svg id="thin-x" viewBox="0 0 26 26" class="svg-icon svg-icon-thin-x planGrid__booleanGraphic" focusable="true">
										<path d="M10.5 9.3L1.8 0.5 0.5 1.8 9.3 10.5 0.5 19.3 1.8 20.5 10.5 11.8 19.3 20.5 20.5 19.3 11.8 10.5 20.5 1.8 19.3 0.5 10.5 9.3Z"></path>
									</svg>
								</span>
							</td>
							<td class="planGrid__cell planGrid__booleanCell" role="cell" data-uia="plan-grid-feature-table-cell+planHasUltraHd-text_2_stream_name" aria-label="스탠다드">
								<span class="planGrid__booleanLabel">아니요</span>
								<span class="planGrid__booleanIcon" aria-hidden="true">
									<svg id="thin-x" viewBox="0 0 26 26" class="svg-icon svg-icon-thin-x planGrid__booleanGraphic" focusable="true">
										<path d="M10.5 9.3L1.8 0.5 0.5 1.8 9.3 10.5 0.5 19.3 1.8 20.5 10.5 11.8 19.3 20.5 20.5 19.3 11.8 10.5 20.5 1.8 19.3 0.5 10.5 9.3Z"></path>
									</svg>
								</span>
							</td>
							<td class="planGrid__cell planGrid__cell--isSelected planGrid__booleanCell" role="cell" data-uia="plan-grid-feature-table-cell+planHasUltraHd-text_4_stream_name" aria-label="프리미엄">
								<span class="planGrid__booleanLabel">예</span>
								<span class="planGrid__booleanIcon" aria-hidden="true">
									<svg id="thin-check" viewBox="0 0 26 26" class="svg-icon svg-icon-thin-check planGrid__booleanGraphic" focusable="true">
										<path d="M9.19 22.892L.5 14.198l1.232-1.233 7.236 7.24L23.793.516l1.38 1.04L9.19 22.892"></path>
									</svg>
								</span>
							</td>
						</tr>
						<tr role="row" class="planGrid__featureTableRow">
							<td class="planGrid__cell planGrid__featureCell" role="cell" data-uia="plan-grid-feature-table-cell+planMaxScreenCount-feature">동시접속가능 인원</td>
							<td class="planGrid__cell planGrid__stringCell" role="cell"data-uia="plan-grid-feature-table-cell+planMaxScreenCount-text_1_stream_name" aria-label="베이식">1</td>
							<td class="planGrid__cell planGrid__stringCell" role="cell" data-uia="plan-grid-feature-table-cell+planMaxScreenCount-text_2_stream_name" aria-label="스탠다드">2</td>
							<td class="planGrid__cell planGrid__cell--isSelected planGrid__stringCell" role="cell" data-uia="plan-grid-feature-table-cell+planMaxScreenCount-text_4_stream_name" aria-label="프리미엄">4</td>
						</tr>
						<tr role="row" class="planGrid__featureTableRow">
							<td class="planGrid__cell planGrid__featureCell" role="cell"
								data-uia="plan-grid-feature-table-cell+4-feature">노트북, TV,
								스마트폰, 태블릿으로 시청</td>
							<td class="planGrid__cell planGrid__booleanCell" role="cell"
								data-uia="plan-grid-feature-table-cell+4-text_1_stream_name"
								aria-label="베이식"><span class="planGrid__booleanLabel">예</span><span
								class="planGrid__booleanIcon" aria-hidden="true"><svg
										id="thin-check" viewBox="0 0 26 26"
										class="svg-icon svg-icon-thin-check planGrid__booleanGraphic"
										focusable="true">
										<path
											d="M9.19 22.892L.5 14.198l1.232-1.233 7.236 7.24L23.793.516l1.38 1.04L9.19 22.892"></path></svg></span></td>
							<td class="planGrid__cell planGrid__booleanCell" role="cell"
								data-uia="plan-grid-feature-table-cell+4-text_2_stream_name"
								aria-label="스탠다드"><span class="planGrid__booleanLabel">예</span><span
								class="planGrid__booleanIcon" aria-hidden="true"><svg
										id="thin-check" viewBox="0 0 26 26"
										class="svg-icon svg-icon-thin-check planGrid__booleanGraphic"
										focusable="true">
										<path
											d="M9.19 22.892L.5 14.198l1.232-1.233 7.236 7.24L23.793.516l1.38 1.04L9.19 22.892"></path></svg></span></td>
							<td
								class="planGrid__cell planGrid__cell--isSelected planGrid__booleanCell"
								role="cell"
								data-uia="plan-grid-feature-table-cell+4-text_4_stream_name"
								aria-label="프리미엄"><span class="planGrid__booleanLabel">예</span><span
								class="planGrid__booleanIcon" aria-hidden="true"><svg
										id="thin-check" viewBox="0 0 26 26"
										class="svg-icon svg-icon-thin-check planGrid__booleanGraphic"
										focusable="true">
										<path
											d="M9.19 22.892L.5 14.198l1.232-1.233 7.236 7.24L23.793.516l1.38 1.04L9.19 22.892"></path></svg></span></td>
						</tr>
						<tr role="row" class="planGrid__featureTableRow">
							<td class="planGrid__cell planGrid__featureCell" role="cell"
								data-uia="plan-grid-feature-table-cell+5-feature">영화와 TV
								프로그램 무제한 시청</td>
							<td class="planGrid__cell planGrid__booleanCell" role="cell"
								data-uia="plan-grid-feature-table-cell+5-text_1_stream_name"
								aria-label="베이식"><span class="planGrid__booleanLabel">예</span><span
								class="planGrid__booleanIcon" aria-hidden="true"><svg
										id="thin-check" viewBox="0 0 26 26"
										class="svg-icon svg-icon-thin-check planGrid__booleanGraphic"
										focusable="true">
										<path
											d="M9.19 22.892L.5 14.198l1.232-1.233 7.236 7.24L23.793.516l1.38 1.04L9.19 22.892"></path></svg></span></td>
							<td class="planGrid__cell planGrid__booleanCell" role="cell"
								data-uia="plan-grid-feature-table-cell+5-text_2_stream_name"
								aria-label="스탠다드"><span class="planGrid__booleanLabel">예</span><span
								class="planGrid__booleanIcon" aria-hidden="true"><svg
										id="thin-check" viewBox="0 0 26 26"
										class="svg-icon svg-icon-thin-check planGrid__booleanGraphic"
										focusable="true">
										<path
											d="M9.19 22.892L.5 14.198l1.232-1.233 7.236 7.24L23.793.516l1.38 1.04L9.19 22.892"></path></svg></span></td>
							<td
								class="planGrid__cell planGrid__cell--isSelected planGrid__booleanCell"
								role="cell"
								data-uia="plan-grid-feature-table-cell+5-text_4_stream_name"
								aria-label="프리미엄"><span class="planGrid__booleanLabel">예</span><span
								class="planGrid__booleanIcon" aria-hidden="true"><svg
										id="thin-check" viewBox="0 0 26 26"
										class="svg-icon svg-icon-thin-check planGrid__booleanGraphic"
										focusable="true">
										<path
											d="M9.19 22.892L.5 14.198l1.232-1.233 7.236 7.24L23.793.516l1.38 1.04L9.19 22.892"></path></svg></span></td>
						</tr>
						<tr role="row" class="planGrid__featureTableRow">
							<td class="planGrid__cell planGrid__featureCell" role="cell"
								data-uia="plan-grid-feature-table-cell+6-feature">언제든 해지 가능</td>
							<td class="planGrid__cell planGrid__booleanCell" role="cell"
								data-uia="plan-grid-feature-table-cell+6-text_1_stream_name"
								aria-label="베이식"><span class="planGrid__booleanLabel">예</span><span
								class="planGrid__booleanIcon" aria-hidden="true"><svg
										id="thin-check" viewBox="0 0 26 26"
										class="svg-icon svg-icon-thin-check planGrid__booleanGraphic"
										focusable="true">
										<path
											d="M9.19 22.892L.5 14.198l1.232-1.233 7.236 7.24L23.793.516l1.38 1.04L9.19 22.892"></path></svg></span></td>
							<td class="planGrid__cell planGrid__booleanCell" role="cell"
								data-uia="plan-grid-feature-table-cell+6-text_2_stream_name"
								aria-label="스탠다드"><span class="planGrid__booleanLabel">예</span><span
								class="planGrid__booleanIcon" aria-hidden="true"><svg
										id="thin-check" viewBox="0 0 26 26"
										class="svg-icon svg-icon-thin-check planGrid__booleanGraphic"
										focusable="true">
										<path
											d="M9.19 22.892L.5 14.198l1.232-1.233 7.236 7.24L23.793.516l1.38 1.04L9.19 22.892"></path></svg></span></td>
							<td
								class="planGrid__cell planGrid__cell--isSelected planGrid__booleanCell"
								role="cell"
								data-uia="plan-grid-feature-table-cell+6-text_4_stream_name"
								aria-label="프리미엄"><span class="planGrid__booleanLabel">예</span><span
								class="planGrid__booleanIcon" aria-hidden="true"><svg
										id="thin-check" viewBox="0 0 26 26"
										class="svg-icon svg-icon-thin-check planGrid__booleanGraphic"
										focusable="true">
										<path
											d="M9.19 22.892L.5 14.198l1.232-1.233 7.236 7.24L23.793.516l1.38 1.04L9.19 22.892"></path></svg></span></td>
						</tr>
					</tbody>
				</table>
				<small class="planGrid__legal"><span id=""
					data-uia="plan-grid-legal">HD 및&nbsp;UHD&nbsp;화질 이용 가능 여부는
						인터넷 서비스 및 디바이스 지원 여부에 따릅니다. 모든 콘텐츠가 HD 화질이나 UHD 화질로 제공되지는 않습니다.
						자세한 내용은 <a href="/termsofuse" target="_blank">이용 약관</a>을 확인하세요.
				</span></small>
			</div>
		</div>
		<div class="loadingText">
			<div class="loadingTextContent">
				<span></span>
			</div>
		</div>
		<div class="submitBtnContainer">
			<button type="button" autocomplete="off"
				class="nf-btn nf-btn-primary nf-btn-solid nf-btn-oversize"
				data-uia="cta-plan-selection"
				placeholder="planSelection_button_continue">다음</button>
		</div>
	</div>
	<%@ include file="../common/footer.jsp" %>    
</body>
</html>