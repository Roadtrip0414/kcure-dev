
<%
/* =================================================================
* @FileName : ViewClcInfReserch
* @date: 2023. 2. 21.
* @author : shpark
* @설명 : 데이터신청 > 연구정보
* =================================================================
* 수정일 작성자 내용
* -----------------------------------------------------------------------
* 2023. 2. 21. shpark 파일생성
* =================================================================
*/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>
<script type="text/javascript">


function saveReserch(isTemp){
	if (isTemp) {
		$("input[name='saveGb']").val("01");
		$('#researchForm').submit();
	} else {
		$("input[name='saveGb']").val("02");

		if (checkForm()) {
			$('#researchForm').submit();
		}
	}
}

function moveToPrev() {
	$("#moveForm").attr("action", "/portal/dac/clc/inf/viewClcInfReserchSummary.do").submit();
}

//
function checkForm(){
	if(researchForm.rsrSbjNm.value ==''){
		alert("연구명을 입력해 주세요");
        return false;
	}

	if(researchForm.rsrSbjDissCont.value ==''){
		alert("연구주제(대상질환)을 입력해 주세요");
        return false;
	}

	if(researchForm.rsrPrpsCont.value ==''){
		alert("연구목적을 입력해 주세요");
        return false;
	}

	if(researchForm.trprConf.value ==''){
		alert("대상자 정의를 입력해 주세요");
        return false;
	}

	if(researchForm.rsrSbjCont.value ==''){
		alert("연구내용을 입력해 주세요");
        return false;
	}

	if(researchForm.rsrMthdConf.value ==''){
		alert("연구방법을 입력해 주세요");
        return false;
	}

	if(researchForm.expcConf.value ==''){
		alert("기대효과/활용방안을 입력해 주세요");
        return false;
	}

	if($("[name='rsrfunSprtYn']:checked").length == 0) {
		alert("연구비 지원 출처를 선택해 주세요");
        return false;
	}
	if($("[name='rsrfunSprtYn']:checked").val() == "Y" && researchForm.rsrfunSprtConf.value ==''){
		alert("연구비 지원 출처를 입력해 주세요");
        return false;
	}

	return true;

}

$(document).ready(function() {
	$("input[name='rsrfunSprtYn']").change(e => {
		if (e.target.value === "Y") {
			$("#rsrfunSprtConf").attr("disabled", false)
		} else {
			$("#rsrfunSprtConf").attr("disabled", true)
			$("#rsrfunSprtConf").val("")
		}
	})

	if ("${clcInfReserchVo.rsrfunSprtYn}" !== "Y") {
		$("#rsrfunSprtConf").attr("disabled", true);
	}
});

function limitText01(element) {
  var maxLength = 500;
  if (element.value.length > maxLength) {
    element.value = element.value.substring(0, maxLength);
  }
}

function limitText02(element) {
  var maxLength = 2000;
  if (element.value.length > maxLength) {
    element.value = element.value.substring(0, maxLength);
  }
}

</script>
<div class="wrap">
	<div class="sub_visual_wrap">
		<div class="data_request">
			<ul>
				<li><c:out value="${clcInfReserchVo.dataTpcdNm}"/> 데이터 신청</li>
			</ul>
		</div>
	</div>
	<div class="n_data_apply_wrap">
		<div class="con">
			<%@include file="/WEB-INF/jsp/kcure/portal/dac/clc/inf/ViewClcInfNav.jsp"%>

			<form id="moveForm">
				<input type="hidden" id="dataAplcNo" name="dataAplcNo" value="${clcInfReserchVo.dataAplcNo}">
			</form>

			<form name="researchForm" id="researchForm" action="${pageContext.request.contextPath}/portal/dac/clc/inf/saveClcInfReserch.do" method="post" enctype="multipart/form-data" >

				<!-- 연구ID -->
				<input type="hidden" id="dataAplcNo" name="dataAplcNo" value="${clcInfReserchVo.dataAplcNo}">
				<input type="hidden" name="saveGb" value="02" />
				<div class="n_data_write_wrap">
					<div class="n_table_info">
						<div class="title">
							<h3>연구정보</h3>
						</div>
						<div class="n_l_table type_01">
							<table>
								<tbody>
									<tr>
										<th>연구명 *</th>
										<td>
											<input type="text" id="rsrSbjNm" name="rsrSbjNm" oninput="limitText01(this)" class="n_int_s"
											placeholder="연구명 입력 (최대 500자)"
											value="${clcInfReserchVo.rsrSbjNm}"
											/>
										</td>
									</tr>
									<tr>
										<th>
											연구주제(대상질환) *
											<div class="tool_tip_wrap">
												<div class="icon_w">?</div>
												<div class="txt">
													<p>위암, 유방암 등의 대상질환을 위주로 작성</p>
												</div>
											</div>
										</th>
										<td>
											<input type="text" id="rsrSbjDissCont" name="rsrSbjDissCont" oninput="limitText01(this)"  class="n_int_s"
											placeholder="연구주제 입력 (최대 500자)"
											value="${clcInfReserchVo.rsrSbjDissCont}"
											/>
										</td>
									</tr>
									<tr>
										<th>
											연구목적 *
											<div class="tool_tip_wrap">
												<div class="icon_w">?</div>
												<div class="txt">
													<p>데이터를 분석하여 얻고자 하는 연구의 목적을 구체적으로 기술하고, 가설을 입증하기 위한 설명을 구체적으로 작성</p>
												</div>
											</div>
										</th>
										<td>
											<textarea id="rsrPrpsCont" name="rsrPrpsCont"  oninput="limitText02(this)" class="n_text_s"
											placeholder="연구목적 입력 (최대 2000자)" rows="3"><c:out value="${clcInfReserchVo.rsrPrpsCont}" /></textarea>
										</td>
									</tr>
									<tr>
										<th>
											대상자 정의 *
											<div class="tool_tip_wrap">
												<div class="icon_w">?</div>
												<div class="txt">
													<p>대상자 수 등 연구대상군에 대한 구체적인 정의 작성</p>
												</div>
											</div>
										</th>
										<td>
											<input type="text" id="trprConf" name="trprConf" oninput="limitText02(this)" class="n_int_s"
											placeholder="대상자 정의 입력 (최대 2000자)"
											value="${clcInfReserchVo.trprConf}"
											/>
										</td>
									</tr>
									<tr>
										<th>
											연구내용 *
											<div class="tool_tip_wrap">
												<div class="icon_w">?</div>
												<div class="txt">
													<p>연구배경 및 가설, 연구의 필요성, 연구내용 등을 구체적으로 작성</p>
												</div>
											</div>
										</th>
										<td>
											<textarea id="rsrSbjCont" name="rsrSbjCont" class="n_text_s" oninput="limitText02(this)"
											placeholder="연구내용 입력 (최대 2000자)" rows="3"><c:out value="${clcInfReserchVo.rsrSbjCont}"/></textarea>
										</td>
									</tr>
									<tr>
										<th>
											연구방법 *
											<div class="tool_tip_wrap">
												<div class="icon_w">?</div>
												<div class="txt">
													<p>독립변수, 종속변수, 데이터를 통해 얻어지는 정보의 내용과 그 방법을 구체적으로 작성</p>
												</div>
											</div>
										</th>
										<td>
											<textarea id="rsrMthdConf" name="rsrMthdConf" class="n_text_s" oninput="limitText02(this)"
											placeholder="연구방법 입력 (최대 2000자)" rows="3"><c:out value="${clcInfReserchVo.rsrMthdConf}"/></textarea>
										</td>
									</tr>
									<tr>
										<th>
											기대효과/활용방안 *
											<div class="tool_tip_wrap">
												<div class="icon_w">?</div>
												<div class="txt">
													<p>데이터를 활용한 연구를 통해 얻어지는 기대효과 및 활용방안 작성</p>
												</div>
											</div>
										</th>
										<td>
											<textarea id="expcConf" name="expcConf" class="n_text_s" oninput="limitText02(this)"
											placeholder="기대효과/활용방안 입력 (최대 2000자)" rows="3"><c:out value="${clcInfReserchVo.expcConf}"/></textarea>
										</td>
									</tr>
									<tr>
										<th>
											연구비 지원 출처 *
											<div class="tool_tip_wrap">
												<div class="icon_w">?</div>
												<div class="txt">
													<p>연구비 지원 출처가 있을 경우 출처 기관을 입력</p>
												</div>
											</div>
										</th>
										<td>
											<div class="chk_int">
												<div class="chk_wrap">
													<kcure:radio2 name="rsrfunSprtYn" grpCd="RSRFUN_SPRT_YN" defaultValue="${clcInfReserchVo.rsrfunSprtYn}" />
												</div>
												<input type="text" id="rsrfunSprtConf" name="rsrfunSprtConf" class="n_int_s" oninput="limitText01(this)"
													placeholder="연구비 지원 출처 입력 (최대 500자)"
													value="${clcInfReserchVo.rsrfunSprtConf}"
												/>
											</div>
										</td>
									</tr>
									<tr>
										<th>비고</th>
										<td>
											<textarea type="text" id="rsrInfExntCont" name="rsrInfExntCont" class="n_text_s" oninput="limitText02(this)"
											placeholder="비고 입력 (최대 2000자)" rows="3"><c:out value="${clcInfReserchVo.rsrInfExntCont}" /></textarea>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="n_table_r_btn">
					<a href="javascript:void(0)" onclick="moveToPrev();return false;" class="n_m_btn n_bc_blue_dk">이전</a>
					<a href="javascript:void(0)" onclick="saveReserch(true);return false;" class="n_m_btn n_bc_b_line">임시저장</a>
					<a href="javascript:void(0)" onclick="saveReserch(false);return false;" class="n_m_btn n_bc_blue_dk">다음</a>
				</div>
			<!-- </form> -->
			</form>
		</div>
	</div>
</div>

<!-- title 및 navi -->
<%@include file="/WEB-INF/jsp/kcure/portal/dac/clc/inf/clcInfCommon.jsp"%>