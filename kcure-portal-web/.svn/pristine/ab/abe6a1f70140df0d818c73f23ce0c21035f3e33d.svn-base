
<%
/* =================================================================
* @FileName : ViewPay.jsp
* @date: 2023. 4. 7.
* @author : parkgu
* @설명 :
* =================================================================
* 수정일 작성자 내용
* -----------------------------------------------------------------------
* 2023. 4. 7. parkgu 파일생성
* =================================================================
*/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>
<script src="https://web.nicepay.co.kr/v3/webstd/js/nicepay-3.0.js" type="text/javascript"></script>
<script type="text/javascript" src="/js/NicePay.js"></script>

<!-- wrap -->
<div class="wrap">
	<div class="con">
		<div class="area_wrap">
			<form name="payForm" method="post" action="/portal/sys/pay/request.do">
				<sec:csrfInput />
				<!-- 결제 수단 -->
				<input type="hidden" id="payMethod" name="PayMethod" value="" />

				<input type="hidden" name="MID" value="${pay.mid}" />
				<input type="hidden" name="ReturnURL" value="${pay.returnURL}" />

				<input type="hidden" name="Moid" value="${pay.moid}" />
				<!-- 결제 상품명 -->
				<input type="hidden" name="GoodsName" value="${pay.goodsName}" />
				<!-- 결제 상품금액 -->
				<input type="hidden" name="Amt" value="${pay.amt}" />

				<!-- 구매자명 -->
				<input type="hidden" name="BuyerName" value="${pay.buyerName}" />
				<!-- 구매자 이메일 -->
				<input type="hidden" name="BuyerEmail" value="${pay.buyerEmail}" />
				<!-- 구매자 연락처 -->
				<input type="hidden" name="BuyerTel" value="${pay.buyerTel}" />

				<!-- 옵션 -->
				<!-- 상품구분(실물(1),컨텐츠(0)) -->
				<input type="hidden" name="GoodsCl" value="1" />
				<!-- 일반(0)/에스크로(1) -->
				<input type="hidden" name="TransType" value="0" />
				<!-- 응답 파라미터 인코딩 방식 -->
				<input type="hidden" name="CharSet" value="utf-8" />
				<!-- 상점 예약필드 -->
				<input type="hidden" name="ReqReserved" value="" />

				<!-- 변경 불가능 -->
				<!-- 전문 생성일시 -->
				<input type="hidden" name="EdiDate" value="${pay.ediDate}" />
				<!-- 해쉬값 -->
				<input type="hidden" name="SignData" value="${pay.signData}" />
				<!-- 신청시퀀스 -->
				<input type="hidden" name="dataAplcNo" value="${pay.dataAplcNo}" />
			</form>

			<h1>Pay Request</h1>

		    <h3>결제방법</h3>

		    <label><input type="radio" name="rdoPayMethod" value="CARD" checked />신용카드</label>
		    <label><input type="radio" name="rdoPayMethod" value="BANK" />계좌이체</label>
		    <label><input type="radio" name="rdoPayMethod" value="VBANK" />가상계좌</label>
		    <button onclick="showNicepay(document.payForm, $(`input[name='rdoPayMethod']:checked`).val())">결제하기</button>
		</div>
	</div>
	<!-- //con -->
</div>
<!-- //wrap -->