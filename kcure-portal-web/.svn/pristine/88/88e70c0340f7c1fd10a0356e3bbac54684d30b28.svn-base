let _payForm = null;

//결제창 최초 요청시 실행됩니다.
function showNicepay(payForm, payMethod) {
	if (!payMethod) {
		alert("결제 수단을 선택해주세요.");
		return false;
	}
	
	// NICEPAY 상자가 가려지지 않도록 함.
	bringToBack(9999);
	
	_payForm = payForm;
	
	$("#payMethod").val(payMethod);
	if (checkPlatform(window.navigator.userAgent) == "mobile") {
		//모바일 결제창 진입
		_payForm.action = "https://web.nicepay.co.kr/v3/v3Payment.jsp";
		_payForm.acceptCharset = "euc-kr";
		_payForm.submit();
	} else {
		//PC 결제창 진입
		goPay(_payForm);
	}
	setTimeout(() => hideLoadingBar(), 1000);
}

function bringToBack(zIndexMax) {
	$("body *").each((i, el) => {
		if (parseInt($(el).css("zIndex"), 10) > zIndexMax) {
			$(el).css("zIndex", zIndexMax - 1);
		}
	});
}

//[PC 결제창 전용]결제 최종 요청시 실행됩니다. <<'nicepaySubmit()' 이름 수정 불가능>>
function nicepaySubmit() {
	_payForm.submit();
}
//[PC 결제창 전용]결제창 종료 함수 <<'nicepayClose()' 이름 수정 불가능>>
function nicepayClose() {
	alert("결제가 취소 되었습니다");
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