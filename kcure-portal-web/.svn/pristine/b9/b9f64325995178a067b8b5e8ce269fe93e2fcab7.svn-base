<%
/* =================================================================
 * @FileName : ViewDataAplcRvw.jsp
 * @date: 2023.04.26
 * @author : parkgu
 * @설명 : 연구접수 결제금액 최종 금액 전송
 * =================================================================
 * 수정일         작성자             내용
 * -----------------------------------------------------------------------
 * 2023.04.26   parkgu           파일생성
 * =================================================================
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>

<script type="text/javascript">
	applyClicked = false;
	$('body').addClass('admin');
	
	$( document ).ready(function() {
		
		//버튼제어.
		fnInitBtn();
	});
	
	/*
	* 버튼 초기화
	*/
	function fnInitBtn(){
		//현재 진행상태가 R09 이면
		var rvwStpSpcd = $("#rvwStpSpcd").val();
		//결제정보입력 단계일경우.
		if(rvwStpSpcd != 'R09'){
			$('#click_btn').hide();
		}
		
	}

	function validate(forSend) {
		const pblInpAmt = parseInt($("#pblInpAmt").val(), 10);
		if (!pblInpAmt) {
			return { valid: false, msg: "금액을 입력하세요" };
		}

		if ($("#rdcRt").val() === "") {
			return { valid: false, msg: "감면율을 이전 단계에서 선택하지 않았습니다" }
		}

		if (forSend) {
			if (!applyClicked) {
				return { valid: false, msg: "적용을 누르세요" };
			}
		}

		const rdcRt = parseInt($("#rdcRt").val(), 10) / 100;


		return { valid: true, msg: "", pblInpAmt, rdcRt }
	}

	function setPblStlmAmt(pblInpAmt, rdcRt) {
		const pblStlmAmt = parseInt(pblInpAmt * (1 - rdcRt), 10);
		const pblStlmAmtComma = pblStlmAmt.toLocaleString("ko-KR");
		$("#pblStlmAmt").val(pblStlmAmt);
		$("#pblStlmAmtDisp").text(pblStlmAmtComma + "원");
	}

	function applyPblInpAmt() {
		const { valid, msg, pblInpAmt, rdcRt } = validate(false);
		if (!valid) {
			alert(msg);
			return;
		}

		setPblStlmAmt(pblInpAmt, rdcRt);
		applyClicked = true;
	}

	function updatePblAmt() {
		const { valid, msg, pblInpAmt, rdcRt } = validate(true);
		if (!valid) {
			alert(msg);
			return;
		}

		$("#sendFrm").submit();
	}

	function fnMoveToList() {
		document.location.href = "/portal/sys/dac/rvw/viewDataAplcRvw.do";
	}
	
	/*
	* 단계이동
	*/
	function fnMovePage(stpCd){
		$("#moveStpSpcd").val(stpCd);
		let url = '/portal/sys/dac/rvw/movePage.do';
		$("#moveFrm").attr('action', url).submit();
	}
</script>
<form id="moveFrm" name="moveFrm" method="post" style="display: none;">
	<input type="hidden"  name="dataAplcNo" value='<c:out value="${data.dataAplcNo}"/>'>
	<input type="hidden"  name="rvwTmpId" value='<c:out value="${data.rvwTmpId}"/>'>
	<input type="hidden" id="moveStpSpcd" name="rvwStpSpcd">
</form>

<form id="sendFrm" name="sendFrm" method="post" action="/portal/sys/dac/rvw/updateClcInfPblAmt.do">
	<input type="hidden" name="dataAplcNo" value="${data.dataAplcNo}" />
	<input type="hidden" name="dataTpcd" value="${data.dataTpcd}" />
	<input type="hidden" id="rvwTmpId" name="rvwTmpId" value='<c:out value="${basicData.rvwTmpId}"/>'>
	<input type="hidden" id="rvwStpSpcd" name="rvwStpSpcd" value='<c:out value="${stpData.rvwStpSpcd}"/>'>
	<input type="hidden" id="rvwStpStcd" name="rvwStpStcd" value='<c:out value="${basicData.rvwStpStcd}"/>'>
	<input type="hidden" id="preSpcd" name="preSpcd" value='<c:out value="${stpData.preSpcd}"/>'>
	<input type="hidden" id="nextSpcd" name="nextSpcd" value='<c:out value="${stpData.nextSpcd}"/>'>

	<div class="wrap">
		<div class="con">
			<div class="area_wrap">
				<div class="section">
					<div class="data_set_title">
						<div class="top">
							<p class="mark">결제정보입력</p>
							<p class="title">${rchData.rsrSbjNm}</p>
						</div>
						<div class="info">
							<ul>
								<li>연구기간</li>
								<li>${rchData.rsrSdt} ~ ${rchData.rsrEdt}</li>
							</ul>
							<ul>
								<li>유형</li>
								<li>${rchData.rsrSpcdNm}</li>
							</ul>
							<ul>
								<li>신청자</li>
								<li>${rchData.prtiNm} / ${rchData.dataAplpNm}</li>
							</ul>
							<ul>
								<li>신청일자</li>
								<li>${rchData.dataAplcYmd}</li>
							</ul>
						</div>
					</div>
					<div class="data_set_flow">
						<p class="title">심의절차</p>
						<!-- class="on" 활성화 | class="save" 완료 -->
						<ul>
						<c:forEach var="list" items="${list}" varStatus="rowInx">
							<li class="${list.stpSts == 'P' ? 'save' : ''} ${list.stpSts == 'C' ? 'on' : ''}">
								<c:choose>
									<c:when test="${list.stpSts == 'P' && list.moveUriYn == 'Y' }">
										<a href="javascript:void(0)" onclick="fnMovePage('${list.rvwStpSpcd}');">${list.rvwStpSpcdNm}</a>
									</c:when>
									<c:otherwise>
										${list.rvwStpSpcdNm}
									</c:otherwise>
								</c:choose>
								
							</li>
						</c:forEach>
						</ul>
					</div>
					<div class="n_title_tb_wrap">
						<div class="title">
							<p>신청연구정보</p>
						</div>
						<div class="ad_re_l_table">
							<table>
								<colgroup>
									<col style="width: 200px;">
									<col style="width: auto;">
								</colgroup>
								<tbody>
									<tr>
										<th>데이터셋</th>
										<td>${data.pblDtsSpnm}</td>
									</tr>
									<tr>
										<th>선택한 분석환경</th>
										<td>${data.aenvSpnm}</td>
									</tr>
									<tr>
										<th>활용센터 이용기간</th>
										<td>${data.dszApdt} ~ ${data.dszApdtEnd} (${data.useDtrnMnthVl}개월 ${data.useDtrnMainVl}주 ${data.useDtrnDayVl}일)</td>
									</tr>
									<tr>
										<th>선택한 분석도구</th>
										<td>${data.vrtAnlsDvceNm}</td>
									</tr>
									<tr>
										<th>금액입력</th>
										<td>
											<div class="item">
												<input type="number" id="pblInpAmt" name="pblInpAmt" value="${data.pblInpAmt}" onchange="applyClicked = false" />
												<a href="javascript:void(0)" onclick="applyPblInpAmt();" class="n_bc_blue_dk">적용</a>
											</div>
										</td>
									</tr>
									<tr>
										<th>감면율</th>
										<td>
											${data.rdcRtItemCont}, ${data.rdcRt}%
											<input type="hidden" id="rdcRt" name="rdcRt" value="${data.rdcRt}" />
										</td>
									</tr>
									<tr>
										<th>최종금액</th>
										<td>
											<input type="hidden" id="pblStlmAmt" name="pblStlmAmt" value="${data.pblStlmAmt}" />
											<span id="pblStlmAmtDisp">
												<fmt:formatNumber type="number" maxFractionDigits="3" value="${data.pblStlmAmt}" />원
											</span>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="n_grid_tb_btn">
							<div class="left">
								<a href="javascript:fnMoveToList()" class="line_gray">목록으로</a>
							</div>
							<div class="right" id="click_btn">
								<a href="javascript:updatePblAmt()" class="dk_blue">단계완료</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>
