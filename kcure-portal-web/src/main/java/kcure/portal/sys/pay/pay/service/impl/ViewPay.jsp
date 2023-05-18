
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

<script type="text/javascript">
	//결제창 최초 요청시 실행됩니다.
	function showNicepay() {
		const payMethod = $("input[name='rdoPayMethod']:checked").val();
		if (!payMethod) {
			alert("결제 수단을 선택해주세요.");
			return false;
		}
		$("#payMethod").val(payMethod);
		if (checkPlatform(window.navigator.userAgent) == "mobile") {
			//모바일 결제창 진입
			document.payForm.action = "https://web.nicepay.co.kr/v3/v3Payment.jsp";
			document.payForm.acceptCharset = "euc-kr";
			document.payForm.submit();
		} else {
			//PC 결제창 진입
			goPay(document.payForm);
		}
		setTimeout(() => hideLoadingBar(), 1000);
	}

	//[PC 결제창 전용]결제 최종 요청시 실행됩니다. <<'nicepaySubmit()' 이름 수정 불가능>>
	function nicepaySubmit() {
		document.payForm.submit();
	}
	//[PC 결제창 전용]결제창 종료 함수 <<'nicepayClose()' 이름 수정 불가능>>
	function nicepayClose() {
		alert("결제가 취소 되었습니다");
	}

	function noPaySubmit() {
		if (confirm("금액확인 하시겠습니까?")) {
			loading.start();
			$("#noPayForm").submit();
		} else {
			loading.end();
		}
	}

	//pc, mobile 구분(가이드를 위한 샘플 함수입니다.)
	function checkPlatform(ua) {
		if (ua === undefined) {
			ua = window.navigator.userAgent;
		}

		ua = ua.toLowerCase();
		var platform = {};
		var matched = {};
		var userPlatform = "pc";
		var platform_match =
			/(ipad)/.exec(ua) ||
			/(ipod)/.exec(ua) ||
			/(windows phone)/.exec(ua) ||
			/(iphone)/.exec(ua) ||
			/(kindle)/.exec(ua) ||
			/(silk)/.exec(ua) ||
			/(android)/.exec(ua) ||
			/(win)/.exec(ua) ||
			/(mac)/.exec(ua) ||
			/(linux)/.exec(ua) ||
			/(cros)/.exec(ua) ||
			/(playbook)/.exec(ua) ||
			/(bb)/.exec(ua) ||
			/(blackberry)/.exec(ua) ||
			[];

		matched.platform = platform_match[0] || "";

		if (matched.platform) {
			platform[matched.platform] = true;
		}

		if (
			platform.android ||
			platform.bb ||
			platform.blackberry ||
			platform.ipad ||
			platform.iphone ||
			platform.ipod ||
			platform.kindle ||
			platform.playbook ||
			platform.silk ||
			platform["windows phone"]
		) {
			userPlatform = "mobile";
		}

		if (platform.cros || platform.mac || platform.linux || platform.win) {
			userPlatform = "pc";
		}

		return userPlatform;
	}
</script>

<!-- wrap -->
<div class="wrap">
	<div class="con">
		<div class="area_wrap">
			<form name="payForm" method="post" action="/portal/sys/pay/request.do">
				<sec:csrfInput />
				<!-- 결제 수단 -->
				<input type="hidden" id="payMethod" name="PayMethod" value="" />

				<input type="hidden" name="MID" value="${MID}" />
				<input type="hidden" name="ReturnURL" value="${ReturnURL}" />

				<input type="hidden" name="Moid" value="${Moid}" />
				<!-- 결제 상품명 -->
				<input type="hidden" name="GoodsName" value="${GoodsName}" />
				<!-- 결제 상품금액 -->
				<input type="hidden" name="Amt" value="${Amt}" />

				<!-- 구매자명 -->
				<input type="hidden" name="BuyerName" value="${BuyerName}" />
				<!-- 구매자 이메일 -->
				<input type="hidden" name="BuyerEmail" value="${BuyerEmail}" />
				<!-- 구매자 연락처 -->
				<input type="hidden" name="BuyerTel" value="${BuyerTel}" />

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
				<input type="hidden" name="EdiDate" value="${EdiDate}" />
				<!-- 해쉬값 -->
				<input type="hidden" name="SignData" value="${SignData}" />
				<!-- 신청시퀀스 -->
				<input type="hidden" name="dataAplcNo" value="${dataAplcNo}" />
			</form>

			<h1>Pay Request</h1>

		    <h3>결제방법</h3>

		    <label><input type="radio" name="rdoPayMethod" value="CARD" checked />신용카드</label>
		    <label><input type="radio" name="rdoPayMethod" value="BANK" />계좌이체</label>
		    <label><input type="radio" name="rdoPayMethod" value="VBANK" />가상계좌</label>
		    <button onclick="showNicepay()">결제하기</button>
		</div>
	</div>
	<!-- //con -->
</div>
<!-- //wrap -->