<%
/* =================================================================
* @FileName : DetailViewDataPayment.jsp
* @date: 2023. 5. 2.
* @author : hjjeon
* @설명 : 연구과제 데이터 결제
* =================================================================
* 수정일 작성자 내용
* -----------------------------------------------------------------------
* 2023. 5. 2. hjjeon 파일생성
* =================================================================
*/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>
<script src="https://web.nicepay.co.kr/v3/webstd/js/nicepay-3.0.js" type="text/javascript"></script>
<script type="text/javascript" src="/js/NicePay.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	//가상화 사용기간 셋팅
	var dszApdt = '${dataAplcSmry.dszApdt}';				//가상화 사용 시작일
	const dtapUseDcnt = '${dataAplcSmry.dtapUseDcnt}';		//총 사용기간
	if(dszApdt != ''){
		dszApdt = new Date(dszApdt);
		dszApdt.setDate(dszApdt.getDate()+Number(dtapUseDcnt));
		$("#dszApEnddt").html(dszApdt.getFullYear() + "-" + lpad((dszApdt.getMonth()+1),2,'0') + "-" + lpad(dszApdt.getDate(),2,'0'));
	}
});

function fnList(){
	$("#listFrm").attr("action", "/portal/myp/rsc/inf/viewMypRscInfApl.do").submit();
}

//결제하기
function fnPayment(){
	const payMethod = "CARD";
	const amt = ${dataAplcDetail.pblStlmAmt};
	if (amt === 0) {
		$("#payMethod").val(payMethod);
		$("#payForm").attr("action", "/portal/myp/rsc/inf/requestZero.do").submit();
	} else {
		showNicepay(document.payForm, payMethod);
	}
}
</script>
<div class="wrap">
	<%@ include file="/WEB-INF/jsp/kcure/portal/myp/rsc/ViewMypRscInfNav.jsp" %>
	<form id="listFrm" name="listFrm" method="post">
		<input type="hidden" name="pageIndex" value="${pageIndex}"/>
	</form>
	
	<c:if test="${pay != null}">
		<form id="payForm" name="payForm" method="post" action="/portal/myp/rsc/inf/request.do">
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
			
			<!-- 목록 이동용 -->
			<input type="hidden" name="pageIndex" value="${pageIndex}"/>
		</form>
	</c:if>

 	<div class="n_my_research_wiew_wrap">
		<div class="con">
			<div class="sub_pag_title">
				<p>연구과제 데이터 결제</p>
			</div>
			<div class="n_gap_box">
				<div class="use_center_info type_01">
					<div class="top">
						<div class="item">
							<ul>
								<li>연구명</li>
								<li>${dataAplcDetail.rsrSbjNm}</li>
							</ul>
							<ul>
								<li>연구기간</li>
								<li>${dataAplcDetail.rsrSdtFmt} ~ ${dataAplcDetail.rsrEdtFmt}</li>
							</ul>
							<ul>
								<li>책임연구자</li>
								<li>${dataAplcDetail.rsp02}</li>
							</ul>
						</div>
					</div>
					<div class="sub_info_wrap">
						<p class="info_red_txt">* 결합은 안심활용센터가 아닌, 외부 결합기간의 분석센터를 활용하시게 됩니다.</p>
					</div>
				</div>
				<div class="n_table_info gray">
					<div class="title">
						<h3>결제하기</h3>
					</div>
					<div class="n_l_table type_02">
						<table>
							<tbody>
								<tr>
									<th>데이터 셋</th>
									<td>${dataAplcDetail.pblDtsSpcdNm}</td>
								</tr>
								<tr>
									<th>선택한 분석환경</th>
									<td>${dataAplcSmry.aenvSpcdNm}</td>
								</tr>
								<tr>
									<th>가상화 사용기간</th>
									<td>${dataAplcSmry.dszApdt} ~ <span id="dszApEnddt"></span> ( ${dataAplcSmry.useDtrnMnthVl}개월 ${dataAplcSmry.useDtrnMainVl}주 ${dataAplcSmry.useDtrnDayVl}일 )</td>
								</tr>
								<tr>
									<th>선택한 분석도구</th>
									<td>${dataAplcSmry.vrtAnlsDvceNm}</td>
								</tr>
								<tr>
									<th>감면대상여부</th>
									<td>${dataAplcSmry.rdcRtItemCont}<span class="r_txt">${dataAplcSmry.rdcRt}% 감면</span></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="final_amount">
						<a href="javascript:void(0)" class="n_l_btn gray_l" onclick="javascript:fnList();">목록으로</a>
						<ul class="list">
							<li>최종 결제 금액</li>
							<li><span><fmt:formatNumber value="${dataAplcDetail.pblStlmAmt}" pattern="#,###" /></span>원</li>
							<c:if test="${pay != null}">
								<li><a href="javascript:void(0)" class="n_s_btn r_b" onclick="javascript:fnPayment();">결제하기</a></li>
							</c:if>
							<c:if test="${pay == null}">
								<li><a href="javascript:void(0)" class="n_s_btn r_b">결제완료</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>