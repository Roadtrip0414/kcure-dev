

<%
/* =================================================================
 * @FileName : ViewMypRscInfExtnPayPopup.jsp
 * @date: 2023.05.09
 * @author : parkgu
 * @설명 : 마이페이지 보관연장 결제
 * =================================================================
 * 수정일         작성자             내용
 * -----------------------------------------------------------------------
 * 2023.05.10   parkgu           파일생성
 * =================================================================
 */
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>
<script src="https://web.nicepay.co.kr/v3/webstd/js/nicepay-3.0.js"	type="text/javascript"></script>
<script type="text/javascript" src="/js/NicePay.js"></script>

<script>
let _dataTpcd = "";

function fnShowData(data, extdStcd) {
	$("#rsrSbjNmPay").text(data.rsrSbjNm);
	$("#rsrDtmPay").text(data.rsrDtm);
	$("#dataKepDtmPay").text(data.dtuDtm);
	$("#dtuDtmPay").text(data.dtuDtm);
	$("#extdStnmPay").text(data.extdStnm);
	$("#extdProgStnmPay").text(data.extdProgStnm);
	$("#dataAplpNmPay").text(data.dataAplpNm);
	$("#reqExtdDtmPay").text(data.reqExtdDtm);
	$("#reqExtdDtmPayBank").text(data.reqExtdDtm);
	$("#rdcRtSpnmPay").text(data.rdcRtSpnm);
	$("#extdAplcRsnContPay").text(data.extdAplcRsnCont);
	
	_dataTpcd = data.dataTpcd;
}

function fnShowFile(fileList) {
	const attdNmSpcds = ["04", "12", "13"];
	console.log("------------------------------------------");
	console.log("fileList------------------------------------------");
	console.log("--------fileList----------------------------------");
	console.log("----------------fileList--------------------------");
	console.log(fileList);
	console.log(fileList);
	console.log("------------------------fileList------------------");
	console.log("--------------------------------fileList----------");
	console.log("----------------------------------------fileList--");
	console.log("-----------------------------------------fileList-");
	console.log("-----------------------------------------fileList-");
	for (const item of fileList) {
		if (attdNmSpcds.includes(item.attdNmSpcd)) {
			const html = `<a href="#" onclick="javascript:downFile('` + item.attfPthNm + `', '` + item.attfStrNm + `', '` + item.attfNm + `', '` + item.dataAplcNo + `' );">` + item.attfNm + `</a>`;
			$("#file" + item.attdNmSpcd + "Pay").html(html);
		}
	}
}

function fnFillPayForm(pay) {
	const html = `
	<!-- 결제 수단 -->
	<input type="hidden" id="payMethod" name="PayMethod" value="" />
	
	<input type="hidden" name="MID" value="` + pay.mid + `" />
	<input type="hidden" name="ReturnURL" value="` + pay.returnURL + `" />
	
	<input type="hidden" name="Moid" value="` + pay.moid + `" />
	<!-- 결제 상품명 -->
	<input type="hidden" name="GoodsName" value="` + pay.goodsName + `" />
	<!-- 결제 상품금액 -->
	<input type="hidden" name="Amt" value="` + pay.amt + `" />
	
	<!-- 구매자명 -->
	<input type="hidden" name="BuyerName" value="` + pay.buyerName + `" />
	<!-- 구매자 이메일 -->
	<input type="hidden" name="BuyerEmail" value="` + pay.buyerEmail + `" />
	<!-- 구매자 연락처 -->
	<input type="hidden" name="BuyerTel" value="` + pay.buyerTel + `" />
	
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
	<input type="hidden" name="EdiDate" value="` + pay.ediDate + `" />
	<!-- 해쉬값 -->
	<input type="hidden" name="SignData" value="` + pay.signData + `" />
	<!-- 데이터신청번호 -->
	<input type="hidden" name="dataAplcNo" value="` + pay.dataAplcNo + `" />
	<!-- 연구과제번호 -->
	<input type="hidden" name="rsrAsmtNo" value="` + pay.rsrAsmtNo + `" />
	<!-- 연장신청번호 -->
	<input type="hidden" name="extdAplcNo" value="` + pay.extdAplcNo + `" />
		<!-- 연장신청번호 -->
	<input type="hidden" name="extdStcd" value="` + pay.extdStcd + `" />
	
	<!-- 목록 이동용 -->
	<input type="hidden" name="pageIndex" value="1"/>
`;
	$("#payFormPay").html(html);
	
	const amtComma = pay.amt.toLocaleString("ko-KR") + "원";
	$("#amtPayBank").text(amtComma);
	
}

/* 파일 다운로드  */
function downFile(attfPthNm,attfStrNm,attfNm,dataAplcNo){
	if (!attfNm) {
		alert("파일이 존재하지 않습니다.");
		return;
	}

	$('#downLoadFilefrmPay #attfPthNmPay').val(attfPthNm);
	$('#downLoadFilefrmPay #attfStrNmPay').val(attfStrNm);
	$('#downLoadFilefrmPay #attfNmPay').val(attfNm);
	$('#downLoadFilefrmPay #dataAplcNoPay').val(dataAplcNo);
    $('#downLoadFilefrmPay').attr("action", "/portal/dac/clc/inf/serviceFileDown.do");
    $('#downLoadFilefrmPay').submit();
}

// 보관 / 연장 결제 팝업
function fnExtnPayPopup(rsrAsmtNo, extdAplcNo, dataAplcNo, extdStcd) {
	showByExtdStcd(extdStcd);
	
	$.ajax({
		type:"POST",
		url: "/portal/myp/rsc/inf/selectExtnPayPopup.do",
		dataType: "json",
		data: { rsrAsmtNo, extdAplcNo, dataAplcNo, extdStcd },
		success: function(resp){
			if (resp.extnPayPopup) {
				fnShowData(resp.extnPayPopup, extdStcd);
				$('#extnRequestPayPopup').addClass('on')
				console.log(resp.extnPayPopup);
				//승인 > 결제하기 가상화 사용기간 연장 ,보관연장,재사용연장.일경우
				if ( extdStcd != '04' && resp.extnPayPopup.extdProgStcd == "U02") {
					$('#paymentBtn').show();
				}else{
					$('#paymentBtn').hide();
				}
			}
			
			
			if (resp.fileList) {
				fnShowFile(resp.fileList);
			}
			if (resp.pay) {
				fnFillPayForm(resp.pay);
			}
		},
		err: function(err) {
			console.log("err:", err);
		}
	});
}

function showByExtdStcd(extdStcd) {
	$("#extnPayPopupTable").find("tr[data-extd-stcd]").each((i, elem) => {
		const extdStcds = $(elem).data("extd-stcd").split(",");
		if (extdStcds.includes(extdStcd)) {
			$(elem).show();
		} else {
			$(elem).hide();
		}
	})
}

function fnClosePayPopup() {
	$("#extnRequestPayPopup").removeClass("on");
}

function fnClosePayBankPopup() {
	$("#extnRequestPayBankPopup").removeClass("on");	
}

//결제하기
function fnPayment(){
	// 임상일 때는 입금 계좌정보만 표시
	if (_dataTpcd === "01") {
		$("#extnRequestPayBankPopup").addClass("on");
		return;
	}
	
	const payMethod = "CARD";
	const amt = parseInt(document.payFormPay.Amt.value, 10);
	if (amt === 0) {
		$("#payMethod").val(payMethod);
		$("#payFormPay").attr("action", "/portal/myp/rsc/inf/requestZeroExtn.do").submit();
	} else {
		showNicepay(document.payFormPay, payMethod);
	}
}
</script>

<form id="payFormPay" name="payFormPay" method="post" action="/portal/myp/rsc/inf/requestExtn.do">
</form>

<!-- 파일 다운로드폼 -->
<form name="downLoadFilefrmPay" id="downLoadFilefrmPay" action="" method="post" style="display: none;">
	<input type="hidden" id="fileAttNmSpcdPay" name="fileAttNmSpcd">
	<input type="hidden" id="attfPthNmPay" name="attfPthNm">
	<input type="hidden" id="attfStrNmPay" name="attfStrNm">
	<input type="hidden" id="attfNmPay" name="attfNm">
	<input type="hidden" id="dataAplcNoPay" name="dataAplcNo" />
</form>

<!-- class="on"시 보관 / 연장 신청 팝업 -->
<div id="extnRequestPayPopup" class="re_layer_popup">
	<div class="re_popup_box">
		<a href="javascript:void(0)" class="btn kc_close"></a>
		<div class="title">
			<p>보관 / 연장</p>
		</div>
		<div class="popup_con">
			<div class="pop_tbl_inn">
				<div class="use_center_info type_01">
					<div class="top">
						<div class="item">
							<ul>
								<li>연구명</li>
								<li id="rsrSbjNmPay"></li>
							</ul>
						</div>
						<div class="n_table_info">
							<!-- 테이블 th의 텍스트가 가운데 정렬일 때 class명 type_02 추가 -->
							<div class="n_l_table type_02">
								<table>
									<tbody>
										<tr>
											<th>연구기간</th>
											<td id="rsrDtmPay"></td>
											<th>가상화 사용기간</th>
											<td id="dtuDtmPay"></td>
										</tr>
										<tr>
											<th>보관기간</th>
											<td id="dataKepDtmPay"></td>
											<th>가상화 재사용 기간</th>
											<td id="rusDtmPay"></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<div class="user_info_inn">
					<div class="n_table_info">
						<div class="n_l_table type_02">
							<table id="extnPayPopupTable">
								<tbody>
									<tr>
										<th>신청구분</th>
										<td>
											<div id="extdStnmPay" class="item"></div>
										</td>
									</tr>
									<tr>
										<th>상태</th>
										<td>
											<div id="extdProgStnmPay" class="item"></div>
										</td>
									</tr>
									<tr>
										<th>신청자</th>
										<td id="dataAplpNmPay"></td>
									</tr>
									<tr data-extd-stcd="01,02,03,04">
										<th>요청기간</th>
										<td id="reqExtdDtmPay"></td>
									</tr>
									<tr data-extd-stcd="04">
										<th>IRB연구계획서</th>
										<td>
											<div id="file04Pay" class="n_file_link"></div>										
										</td>
									</tr>
									<tr data-extd-stcd="04">
										<th>IRB결과통지서</th>
										<td>
											<div id="file12Pay" class="n_file_link"></div>										
										</td>
									</tr>
									<tr data-extd-stcd="01,03">
										<th>감면율</th>
										<td id="rdcRtSpnmPay"></td>
									</tr>
									<tr data-extd-stcd="01,03">
										<th>감면율 첨부파일</th>
										<td>
											<div id="file13Pay" class="n_file_link"></div>										
										</td>
									</tr>
									<tr>
										<th>사유</th>
										<td id="extdAplcRsnContPay"></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="pop_btn">
			<a href="javascript:void(0)" class="n_l_btn n_bc_b_line" onclick="javascript:fnClosePayPopup();">확인</a>
			<a href="javascript:void(0)" id="paymentBtn" class="n_l_btn n_bc_b_line" onclick="javascript:fnPayment();">결제하기</a>
		</div>
	</div>
</div>

<!-- class="on"시 보관 / 연장 신청 결제 안내 팝업 -->
<div id="extnRequestPayBankPopup" class="re_layer_popup">
	<div class="re_popup_box">
		<a href="javascript:void(0)" class="btn kc_close"></a>
		<div class="title">
			<p>보관신청 결제 안내</p>
		</div>
		<div class="popup_con">
			<div class="pop_tbl_inn">
				<div class="user_info_inn">
					<div class="n_table_info">
						<div class="n_l_table type_02">
							<table>
								<tbody>
									<tr>
										<th>보관기간</th>
										<td id="reqExtdDtmPayBank"></td>
									</tr>
									<tr>
										<th>결제금액</th>
										<td id="amtPayBank"></td>
									</tr>
									<tr>
										<th>결제방법</th>
										<td>계좌이체</td>
									</tr>
									<tr>
										<th>계좌번호</th>
										<td>국민은행 642602-01-207934 ㈜ 인텍</td>
									</tr>
									<tr>
										<th>비고</th>
										<td>세금계산서 발행과 관련한 문의는 02)2832—932 주식회사 인텍에 문의하시길 바랍니다.</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="pop_btn">
			<a href="javascript:void(0)" class="n_l_btn n_bc_b_line" onclick="javascript:fnClosePayBankPopup()">확인</a>
		</div>
	</div>
</div>
