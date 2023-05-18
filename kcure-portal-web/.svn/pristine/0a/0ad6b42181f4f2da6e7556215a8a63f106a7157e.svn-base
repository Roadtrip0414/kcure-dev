<%
/* =================================================================
 * @FileName : DetailDataExtAplc.jsp
 * @date: 2023.05.11
 * @author : pgj
 * @설명 : 데이터 연장 및 보관관리 상세 화면
 * =================================================================
 * 수정일         작성자             내용
 * -----------------------------------------------------------------------
 * 2023.05.11     pgj           파일생성
 * =================================================================
 */
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>
<% pageContext.setAttribute("newLineChar", "\n"); %>
<script type="text/javascript">
$(document).ready(function() {
	$("input[name='extdProgStcd']").on("change", function(){
		if($(this).val() == "N") {
			$("textarea[name='rjcRsnCont']").closest("tr").show(); // 반려사유
			$("input[name='clncPblInpAmt']").val("").prop("readonly", true); // 입력금액
			$("input[name='clncPblInpAmt']").closest("tr").hide(); // 입력금액
			$("#finClncPblInpAmt").closest("tr").hide(); // 최종금액
			$("#finClncPblInpAmt").html(""); // 최종금액
			
			$("input[name='rsrEdt']").closest("tr").hide(); // 연장일자
			$("input[name='rsrEdt']").val(""); // 연장일자
		} else {
			$("textarea[name='rjcRsnCont']").closest("tr").hide(); // 반려사유
			$("textarea[name='rjcRsnCont']").val(""); // 반려사유
			$("input[name='clncPblInpAmt']").prop("readonly", false); // 입력금액
			$("input[name='clncPblInpAmt']").closest("tr").show(); // 입력금액
			$("#finClncPblInpAmt").closest("tr").show(); // 최종금액
			
			$("input[name='rsrEdt']").closest("tr").show(); // 연장일자
		}
	});
	
	$("input[name='clncPblInpAmt']").on("keyup", function() {
		$(this).val($(this).val().replace(/[^0-9]/g,"").replace(/\B(?=(\d{3})+(?!\d))/g, ","));
		
		var finClncPblInpAmt = $("#finClncPblInpAmt");
		if(finClncPblInpAmt.length > 0) {
			var amt = parseInt($(this).val().replace(/[^0-9]/g,""), 10) // 입력금액
			var rdcRt = parseInt($("#rdcRt").val()); // 감면율
			var finAmt = 0; // 최종금액
			if(rdcRt > 0 && amt) { // 감면율 계산
				finAmt = parseInt(amt - (amt * (rdcRt / 100)));
			} else { // 감면율 없을 경우
				finAmt = amt;
			}
			if(amt > -1) finClncPblInpAmt.html((finAmt+"").replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원");
			else finClncPblInpAmt.html("");
		}
	});
	
	$("input[name='clncPblInpAmt']").on("keydown", function(e) { // 엔터 submit 방지
		if(e.keyCode === 13) { 
			e.preventDefault();
		}
	});
});

//저장
function onSave(){
	
	const extdProgStcd = $("input[name='extdProgStcd']:checked"); // 승인여부
	
	if(extdProgStcd.length == 0) {
		alert("승인 여부를 선택하세요.");
		return;
	}
	
	const clncPblInpAmt = $("input[name='clncPblInpAmt']");
	if(extdProgStcd.val() == "Y" && clncPblInpAmt.length && !clncPblInpAmt.val().trim()) {
		alert("금액을 입력하세요");
		return;
	}
	
	const rsrEdt = $("input[name='rsrEdt']")
	if(extdProgStcd.val() == "Y" && rsrEdt.length && !rsrEdt.val().trim()) {
		alert("연장일자를 선택하세요.");
		return;
	}
	
	const rjcRsnCont = $("textarea[name='rjcRsnCont']").val().trim();
	if (extdProgStcd.val() == "N" && !rjcRsnCont) {
		alert("반려 사유를 입력하세요.");
		return;
	}
	
	if(confirm("저장 하시겠습니까?")){
		$("#detailFrm").submit();
	}
}

function onConfirm() {
	if($("select[name='extdPayStd']").val() == "") {
		alert("결제상태를 선택하세요")
		return;
	}
	
	if(confirm("연장 하시겠습니까?")){
		$("#detailFrm").attr("action", "/portal/sys/rsr/ext/updateDataExtAplcCpl.do");
		$("#detailFrm").submit();	
	}
}

function fnDownFile(attfPthNm,attfStrNm,attfNm){
	if (!attfNm) {
		alert("파일이 존재하지 않습니다.");
		return;
	}
	$('#downLoadFilefrm #attfPthNm').val(attfPthNm);
	$('#downLoadFilefrm #attfStrNm').val(attfStrNm);
	$('#downLoadFilefrm #attfNm').val(attfNm);
    $('#downLoadFilefrm').attr("action", "/portal/dac/clc/inf/serviceFileDown.do");
    $('#downLoadFilefrm').submit();
}

function reset() {
	detailFrm.reset();
	$("textarea[name='rjcRsnCont']").closest("tr").hide(); // 반려사유
	$("input[name='clncPblInpAmt']").prop("readonly", false); // 입력금액
	$("input[name='clncPblInpAmt']").closest("tr").show(); // 입력금액
	$("#finClncPblInpAmt").closest("tr").show(); // 최종금액
	$("#finClncPblInpAmt").html(""); // 최종금액
	
	$("input[name='rsrEdt']").closest("tr").show(); // 연장일자
}
</script>
<c:set var="percent" value="%"/>

<div class="wrap">
	<div class="con">
		<div class="area_wrap">
			<div class="section">
				<form id="downLoadFilefrm" name="downLoadFilefrm" method="post">
					<input type="hidden" id="attfPthNm" name="attfPthNm" value=""/>
					<input type="hidden" id="attfStrNm" name="attfStrNm" value=""/>
					<input type="hidden" id="attfNm" name="attfNm" value=""/>
					<input type="hidden" name="dataAplcNo" value="${detail.dataAplcNo}" />
				</form>
				<form id="detailFrm" name="detailFrm" method="post" action="/portal/sys/rsr/ext/updateDataExtAplc.do">
					<input type="hidden" name="rsrAsmtNo" value="${detail.rsrAsmtNo}" />
					<input type="hidden" name="extdAplcNo" value="${detail.extdAplcNo}" />
					<input type="hidden" name="dataAplcNo" value="${detail.dataAplcNo}" />
					<input type="hidden" id="rdcRt" value="${detail.rdcRt}"/>
					<table class="left_talbe">
						<tbody>
							<tr>
								<th>연구명</th> 
								<td>${detail.rsrSbjNm}</td>
							</tr>
							<tr>
								<th>
									<c:if test="${detail.extdStcd eq '04' and detail.extdProgStcd eq 'U02'}">
									기존 
									</c:if>
									연구기간
								</th>
								<td>${detail.bfrRsrDt}</td>
							</tr>
							<tr>
								<th>연구과제번호</th>
								<td>${detail.rsrAsmtNo}</td>
							</tr>
							<tr>
								<th>유형</th>
								<td>${detail.dataTpcdNm}</td>
							</tr>
							<tr>
								<th>신청일</th>
								<td>${detail.extdAplcYmd}</td>
							</tr>
							<tr>
								<th>
									<c:if test="${detail.extdStcd eq '04'}">
									연구책임자
									</c:if>
									<c:if test="${detail.extdStcd ne '04'}">
									신청자
									</c:if>
								</th>
								<td>${detail.userNm}</td>
							</tr>
							
							<!-- IRB연구기간 연장심의에서는 사용 안함 -->
							<c:if test="${detail.extdStcd ne '04'}">
							<tr>
								<th>
									<c:if test="${detail.extdStcd eq '03'}">
									재사용 신청기간
									</c:if>
									<c:if test="${detail.extdStcd ne '03'}">
									연장 신청 기간
									</c:if>
								</th>
								<td>${detail.aplcDt}</td>
							</tr>
							</c:if>
							<!--  가상화 사용 연장 심의 시작-->
							<c:if test="${detail.extdStcd eq '01'}">
							<c:choose>
								<c:when test="${detail.extdProgStcd eq 'U01'}"> <!-- 신청 -->
							<tr>
								<th>승인여부 <span class="must">*</span></th>
								<td>
									<div class="radio_wrap">
									<label>
										<input type="radio" name="extdProgStcd" value="Y" class="frmChk true" data-gtm-form-interact-field-id="2">
										<span class="radio_mark"></span><span>승인</span>
									</label>
									<label>
										<input type="radio" name="extdProgStcd" value="N" class="frmChk false" data-gtm-form-interact-field-id="1">
										<span class="radio_mark"></span><span>반려</span>
									</label>
								</div>
								</td>
							</tr>
							<tr>
								<th>연장금액 <span class="must">*</span></th>
								<td>
									<input type="text" class="required" name="clncPblInpAmt" maxlength="200" title="보관금액" style="width: 200px;text-align: right;"> 원
								</td>
							</tr>
							<tr style="display: none;">
								<th>반려 사유 입력 <span class="must">*</span></th>
								<td>
									<textarea name="rjcRsnCont" rows="10" cols="180" cssclass="txaClass2" maxlength="3000" placeholder="1000글자 이내 입력"></textarea>
								</td>
							</tr>
								</c:when>
								<c:otherwise>
							<tr>
								<th>승인여부</th>
								<td>${detail.extdProgStcd eq 'U02' or detail.extdProgStcd eq 'U05' ? '승인' : '반려'}</td>
							</tr>
							<c:if test="${detail.extdProgStcd eq 'U02' or detail.extdProgStcd eq 'U05'}">
							<tr>
								<th>연장금액</th>
								<td><fmt:formatNumber value="${detail.clncPblStlmAmt}" pattern="#,###"/>원</td>
							</tr>
							</c:if>
							<c:if test="${detail.extdProgStcd eq 'U02'}"> <!-- 승인(결제확인) -->
							<tr>
								<th>결제상태</th>
								<td>
									<select name="extdPayStd" title="결제상태" style="width: 200px;">
										<option value="">결제대기</option>
										<option value="U05">결제완료</option>
									</select>
								</td>
							</tr>
							</c:if>
							<c:if test="${detail.extdProgStcd eq 'U03'}">
							<tr>
								<th>반려 사유</th>
								<td>${detail.extdProgStcd eq 'U03' ? fn:replace(detail.rjcRsnCont, newLineChar, '<br/>') : ''}</td>
							</tr>
							</c:if>
								</c:otherwise>
							</c:choose>
							
							<tr>
								<th>감면율</th>
								<td>${detail.rdcRtSpcdNm} ${detail.rdcRt != null ? detail.rdcRt : ''}${detail.rdcRt != null ? percent : ''}</td>
							</tr>
							<tr>
								<th>감면율 첨부파일</th>
								<td>
									<c:if test="${detail.rdcRtAttf != null}">
									<div class="n_file_link">
										<a onclick="javascript:fnDownFile('${fn:split(detail.rdcRtAttf, '|')[0]}', '${fn:split(detail.rdcRtAttf, '|')[1]}', '${fn:split(detail.rdcRtAttf, '|')[2]}');">${fn:split(detail.rdcRtAttf, '|')[2]}</a>
									</div>
									</c:if>
								</td>
							</tr>
							<c:if test="${detail.extdProgStcd eq 'U01'}">
							<tr>
								<th>최종금액</th>
								<td id="finClncPblInpAmt"></td>
							</tr>
							</c:if>
							<tr>
								<th>사유</th>
								<td>${fn:replace(detail.extdAplcRsnCont, newLineChar, '<br/>')}</td>
							</tr>
							<tr>
								<th>상태</th>
								<td>${detail.dtuStat}</td>
							</tr>
							<tr>
								<th>현재 가상화 사용기간</th>
								<td>${detail.bfrDtuDt} ${detail.bfrDtuDtPeriod}</td>
							</tr>
							</c:if>
							<!--  가상화 사용 연장 심의 종료-->
							
							<!-- 보관연장심의 시작 -->
							<c:if test="${detail.extdStcd eq '02'}">
							<c:choose>
								<c:when test="${detail.extdProgStcd eq 'U01'}"> <!-- 신청 -->
							<tr>
								<th>승인여부 <span class="must">*</span></th>
								<td>
									<div class="radio_wrap">
									<label>
										<input type="radio" name="extdProgStcd" value="Y" class="frmChk true" data-gtm-form-interact-field-id="2">
										<span class="radio_mark"></span><span>승인</span>
									</label>
									<label>
										<input type="radio" name="extdProgStcd" value="N" class="frmChk false" data-gtm-form-interact-field-id="1">
										<span class="radio_mark"></span><span>반려</span>
									</label>
								</div>
								</td>
							</tr>
							<tr>
								<th>보관금액 <span class="must">*</span></th>
								<td>
									<input type="text" class="required" name="clncPblInpAmt" maxlength="200" title="보관금액" style="width: 200px;text-align: right;"> 원
								</td>
							</tr>
							<tr style="display: none;">
								<th>반려 사유 입력 <span class="must">*</span></th>
								<td>
									<textarea name="rjcRsnCont" rows="10" cols="180" cssclass="txaClass2" maxlength="3000" placeholder="1000글자 이내 입력"></textarea>
								</td>
							</tr>
								</c:when>
								<c:otherwise>
							<tr>
								<th>승인여부</th>
								<td>${detail.extdProgStcd eq 'U02' or detail.extdProgStcd eq 'U05' ? '승인' : '반려'}</td>
							</tr>
							<c:if test="${detail.extdProgStcd eq 'U02' or detail.extdProgStcd eq 'U05'}">
							<tr>
								<th>보관금액</th>
								<td><fmt:formatNumber value="${detail.clncPblStlmAmt}" pattern="#,###"/>원</td>
							</tr>
							</c:if>
							<c:if test="${detail.extdProgStcd eq 'U02'}"> <!-- 승인(결제확인) -->
							<tr>
								<th>결제상태</th>
								<td>
									<select name="extdPayStd" title="결제상태" style="width: 200px;">
										<option value="">결제대기</option>
										<option value="U05">결제완료</option>
									</select>
								</td>
							</tr>
							</c:if>
							<c:if test="${detail.extdProgStcd eq 'U03'}">
							<tr>
								<th>반려 사유</th>
								<td>${detail.extdProgStcd eq 'U03' ? fn:replace(detail.rjcRsnCont, newLineChar, '<br/>') : ''}</td>
							</tr>
							</c:if>
								</c:otherwise>
							</c:choose>
							<tr>
								<th>사유</th>
								<td>${fn:replace(detail.extdAplcRsnCont, newLineChar, '<br/>')}</td>
							</tr>
							<tr>
								<th>상태</th>
								<td>${detail.dtuStat}</td>
							</tr>
							<tr>
								<th>재사용 기간</th>
								<td>${detail.bfrDtuDt} ${detail.bfrDtuDtPeriod} <span class="n_f_point">재사용신청 남은 횟수 : ${detail.rusExtdNt}회</span></td>
							</tr>
							<tr>
								<th>현재 보관 기간</th>
								<td>${detail.bfrDataKepDt} ${detail.bfrDataKepDtPeriod} <span class="n_f_point">보관연장 남은 횟수 : ${detail.dataKepExtdNt}회</span></td>
							</tr>
							<tr>
								<th>현재 가상화 사용기간</th>
								<td>${detail.bfrDtuDt} ${detail.bfrDtuDtPeriod}</td>
							</tr>
							</c:if>
							<!-- 보관연장심의 종료 -->
							
							<!--  재사용 심의 시작-->
							<c:if test="${detail.extdStcd eq '03'}">
							<c:choose>
								<c:when test="${detail.extdProgStcd eq 'U01'}"> <!-- 신청 -->
							<tr>
								<th>승인여부 <span class="must">*</span></th>
								<td>
									<div class="radio_wrap">
									<label>
										<input type="radio" name="extdProgStcd" value="Y" class="frmChk true" data-gtm-form-interact-field-id="2">
										<span class="radio_mark"></span><span>승인</span>
									</label>
									<label>
										<input type="radio" name="extdProgStcd" value="N" class="frmChk false" data-gtm-form-interact-field-id="1">
										<span class="radio_mark"></span><span>반려</span>
									</label>
								</div>
								</td>
							</tr>
							<tr>
								<th>재사용금액 <span class="must">*</span></th>
								<td>
									<input type="text" class="required" name="clncPblInpAmt" maxlength="200" title="보관금액" style="width: 200px;text-align: right;"> 원
								</td>
							</tr>
							<tr>
								<th>감면율</th>
								<td>${detail.rdcRtSpcdNm} ${detail.rdcRt != null ? detail.rdcRt : ''}${detail.rdcRt != null ? percent : ''}</td>
							</tr>
							<tr>
								<th>감면율 첨부파일</th>
								<td>
									<c:if test="${detail.rdcRtAttf != null}">
									<div class="n_file_link">
										<a onclick="javascript:fnDownFile('${fn:split(detail.rdcRtAttf, '|')[0]}', '${fn:split(detail.rdcRtAttf, '|')[1]}', '${fn:split(detail.rdcRtAttf, '|')[2]}');">${fn:split(detail.rdcRtAttf, '|')[2]}</a>
									</div>
									</c:if>
								</td>
							</tr>
							<tr>
								<th>최종금액</th>
								<td id="finClncPblInpAmt"></td> 
							</tr>
							<tr style="display: none;">
								<th>반려 사유 입력 <span class="must">*</span></th>
								<td>
									<textarea name="rjcRsnCont" rows="10" cols="180" cssclass="txaClass2" maxlength="3000" placeholder="1000글자 이내 입력"></textarea>
								</td>
							</tr>
								</c:when>
								<c:otherwise>
							<tr>
								<th>승인여부</th>
								<td>${detail.extdProgStcd eq 'U02' or detail.extdProgStcd eq 'U05' ? '승인' : '반려'}</td>
							</tr>
							<c:if test="${detail.extdProgStcd eq 'U02' or detail.extdProgStcd eq 'U05'}">
							<tr>
								<th>보관금액</th>
								<td><fmt:formatNumber value="${detail.clncPblStlmAmt}" pattern="#,###"/>원</td>
							</tr>
							</c:if>
							<c:if test="${detail.extdProgStcd eq 'U02'}"> <!-- 승인(결제확인) -->
							<tr>
								<th>결제상태</th>
								<td>
									<select name="extdPayStd" title="결제상태" style="width: 200px;">
										<option value="">결제대기</option>
										<option value="U05">결제완료</option>
									</select>
								</td>
							</tr>
							</c:if>
							<c:if test="${detail.extdProgStcd eq 'U03'}">
							<tr>
								<th>반려 사유</th>
								<td>${detail.extdProgStcd eq 'U03' ? fn:replace(detail.rjcRsnCont, newLineChar, '<br/>') : ''}</td>
							</tr>
							</c:if>
								</c:otherwise>
							</c:choose>
							<tr>
								<th>사유</th>
								<td>${fn:replace(detail.extdAplcRsnCont, newLineChar, '<br/>')}</td>
							</tr>
							<tr>
								<th>상태</th>
								<td>${detail.dtuStat}</td>
							</tr>
							<tr>
								<th>현재 가상화 사용기간</th>
								<td>${detail.bfrDtuDt} ${detail.bfrDtuDtPeriod}</td>
							</tr>
							</c:if>
							<!--  재사용 심의 종료-->
							
							<!--  IRB 연구유효기간 연장 시작-->
							<c:if test="${detail.extdStcd eq '04'}">
							<tr>
								<th>IRB 연구계획서</th>
								<td>
									<c:if test="${detail.irbRsrPlanAttf != null}">
									<div class="n_file_link">
										<a onclick="javascript:fnDownFile('${fn:split(detail.irbRsrPlanAttf, '|')[0]}', '${fn:split(detail.irbRsrPlanAttf, '|')[1]}', '${fn:split(detail.irbRsrPlanAttf, '|')[2]}');">${fn:split(detail.irbRsrPlanAttf, '|')[2]}</a>
									</div>
									</c:if>
								</td>
							</tr>
							<tr>
								<th>IRB 결과통지서</th>
								<td>
									<c:if test="${detail.irbRsltAvtsmtAttf != null}">
									<div class="n_file_link">
										<a onclick="javascript:fnDownFile('${fn:split(detail.irbRsltAvtsmtAttf, '|')[0]}', '${fn:split(detail.irbRsltAvtsmtAttf, '|')[1]}', '${fn:split(detail.irbRsltAvtsmtAttf, '|')[2]}');">${fn:split(detail.irbRsltAvtsmtAttf, '|')[2]}</a>
									</div>
									</c:if>
								</td>
							</tr>
							<c:choose>
								<c:when test="${detail.extdProgStcd eq 'U01'}"> <!-- 신청 -->
							<tr>
								<th>승인여부 <span class="must">*</span></th>
								<td>
									<div class="radio_wrap">
										<label>
											<input type="radio" name="extdProgStcd" value="Y" class="frmChk true" data-gtm-form-interact-field-id="2">
											<span class="radio_mark"></span><span>승인</span>
										</label>
										<label>
											<input type="radio" name="extdProgStcd" value="N" class="frmChk false" data-gtm-form-interact-field-id="1">
											<span class="radio_mark"></span><span>반려</span>
										</label>
									</div>
								</td>
							</tr>
							<tr>
								<th>연장일자 <span class="must">*</span></th>
								<td>
									<input type="date" name="rsrEdt" value="" placeholder="종료일자" maxlength="10" style="width:150px;">
								</td>
							</tr>
							<tr style="display: none;">
								<th>반려 사유 입력 <span class="must">*</span></th>
								<td>
									<textarea name="rjcRsnCont" rows="10" cols="180" cssclass="txaClass2" maxlength="3000" placeholder="1000글자 이내 입력"></textarea>
								</td>
							</tr>
								</c:when>
								<c:otherwise> <!-- 승인 / 반려 -->
							<tr>
								<th>승인여부</th>
								<td>${detail.extdProgStcd eq 'U02' ? '승인' : '반려'}</td>
							</tr>
							<c:if test="${detail.extdProgStcd eq 'U02'}">
							<tr>
								<th>연장된 연구기간</th>
								<td>${detail.extdProgStcd eq 'U02' ? detail.aplcDt : ''}</td>
							</tr>
							</c:if>
							<c:if test="${detail.extdProgStcd eq 'U03'}">
							<tr>
								<th>반려 사유</th>
								<td>${detail.extdProgStcd eq 'U03' ? fn:replace(detail.rjcRsnCont, newLineChar, '<br/>') : ''}</td>
							</tr>
							</c:if>
								</c:otherwise>
							</c:choose>
							<tr>
								<th>사유</th>
								<td>${fn:replace(detail.extdAplcRsnCont, newLineChar, '<br/>')}</td>
							</tr>
							<tr>
								<th>상태</th>
								<td>${detail.dtuStat}</td>
							</tr>
							<tr>
								<th>재사용 기간</th>
								<td>${detail.bfrDtuDt} ${detail.bfrDtuDtPeriod} <span class="n_f_point">재사용신청 남은 횟수 : ${detail.rusExtdNt}회</span></td>
							</tr>
							<tr>
								<th>현재 보관 기간</th>
								<td>${detail.bfrDataKepDt} ${detail.bfrDataKepDtPeriod} <span class="n_f_point">보관연장 남은 횟수 : ${detail.dataKepExtdNt}회</span></td>
							</tr>
							<tr>
								<th>현재 가상화 사용기간</th>
								<td>${detail.bfrDtuDt} ${detail.bfrDtuDtPeriod} <span class="n_f_point">가상화연장 남은 횟수 : ${detail.dtuExtdNt}회</span></td>
							</tr>
							</c:if>
							<!--  IRB 연구유효기간 연장 종료-->
						</tbody>
					</table>
					<div class="btn_center">
						<!-- class | f_blue 블루 | bc_black 검정 | bc_white 화이트 | bc_line 블루라인 -->
						<c:if test="${detail.extdProgStcd eq 'U01'}"> <!-- 신청상태면 -->
						<a href="javascript:onSave()" class="bc_blue">저장</a>
						<a href="javascript:reset()" class="bc_white">취소</a>
						</c:if>
						<c:if test="${detail.extdStcd ne '04'}"><!-- IRB가 아니면 -->
							<c:if test="${detail.extdProgStcd eq 'U02'}"> <!-- 승인상태면 -->
							<a href="javascript:onConfirm()" class="bc_blue">연장하기</a>
							</c:if>
						</c:if>
						<a href="javascript:history.back()" class="bc_line">목록</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<input type="hidden" name="current_menu_name_info" value="DetailDataExtAplc" />

<script type="text/javascript">
	$(".title").html("${detail.extdStcdNm}")
</script>