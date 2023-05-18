
<%
/* =================================================================
* @FileName : ViewClcInfViewReqInfo
* @date: 2023. 2. 22.
* @author : bhs
* @설명 : 데이터신청 > 요청정보보기
* =================================================================
* 수정일 작성자 내용
* -----------------------------------------------------------------------
* 2023. 2. 22. bhs 파일생성
* =================================================================
*/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>
<script type="text/javascript">
$(document).ready(function() {
	//총예상비용 계산
	//임상 - 0원, 결합 - 감면율 선택만
	//공공만 계산
	const dataTpcd = '${clcInfReserchVo.dataTpcd}';			//01-임상, 02-공공, 03-결합
	const aenvSpcd = '${dataAplcSmry.aenvSpcd}';			//가상화 환경 (01 - 폐쇄 , 02  - 원격)
	const useDtrnMnthVl = '${dataAplcSmry.useDtrnMnthVl}';	//월
	const useDtrnMainVl = '${dataAplcSmry.useDtrnMainVl}';	//주
	const useDtrnDayVl = '${dataAplcSmry.useDtrnDayVl}';	//일
	const rdcRt = '${dataAplcSmry.rdcRt}';					//감면율
	var totalAmt = 0;

	if(dataTpcd == '02'){
		if(aenvSpcd == '01'){
			totalAmt = ((useDtrnMnthVl * 35) + (useDtrnMainVl * 25) + (useDtrnDayVl * 10)) * (100-rdcRt)/100;
		}

		if(aenvSpcd == '02'){
			totalAmt = ((useDtrnMnthVl * 15) + (useDtrnMainVl * 10) + (useDtrnDayVl * 5))  * (100-rdcRt)/100;
		}
	}

	$("#totalAmt").html(addComma(totalAmt * 10000) + "원");

	//가상화 사용기간 셋팅
	var dszApdt = '${dataAplcSmry.dszApdt}';				//가상화 사용 시작일
	const dtapUseDcnt = '${dataAplcSmry.dtapUseDcnt}';		//총 사용기간
	dszApdt = new Date(dszApdt);
	dszApdt.setDate(dszApdt.getDate()+Number(dtapUseDcnt));
	$("#dszApEnddt").html(dszApdt.getFullYear() + "-" + lpad((dszApdt.getMonth()+1),2,'0') + "-" + lpad(dszApdt.getDate(),2,'0'));
});

/*
* 연구자 정보 더보기
*/
function fnViewMoreRsp(){
	$("#btnViewMoreRsp").css("display", "none");

	let param = $("#dataAplcNo").val();

	$.ajax({
		type:"POST",
		url:"/portal/dac/clc/inf/selectMoreRspList.do",
		data:{dataAplcNo : param},
		dataType:'json',
		success:function(returnData){

		let resultList = returnData.clcInfRspList;
		let resultCnt = returnData.clcInfRspCnt;

		if(resultCnt > 0){
			let html = "";
			for(let i=0;i<resultList.length;i++){
				html += '<div class="list"><table class="user_tb_l"><tbody>'
				html += '<tr><th>구분</th><td>'
				html += resultList[i].rsrpSpcdNm
				html += '<th>이름</th><td>'
				html += resultList[i].rsrpNm
				html += '</tr><tr><th>소속기관</th><td>'
				html += resultList[i].prtiNm
				html += '</td><th>직위</th><td>'
				html += resultList[i].rsrpPstNm
				html += '</td></tr><tr><th>휴대폰번호</th><td>'
				html += resultList[i].userMbphNo1
				html += '</td><th>이메일</th><td>'
				html += resultList[i].email
				html += '</td></tr><tr><th>참여기간</th><td colspan="3">'
				html += resultList[i].rsrPrtSdt
				html += ' - '
				html += resultList[i].rsrPrtEdt
				html += '</td></tr></tbody></table></div>'
			}
			$("#majorRspInfo").after(html);
		}

      }
	});
}

/* 파일 다운로드  */
function downFile(attfPthNm,attfStrNm,attfNm){
	$('#downLoadFilefrm #attfPthNm').val(attfPthNm);
	$('#downLoadFilefrm #attfStrNm').val(attfStrNm);
	$('#downLoadFilefrm #attfNm').val(attfNm);
    $('#downLoadFilefrm').attr("action", "/portal/dac/clc/inf/serviceFileDown.do");
    $('#downLoadFilefrm').submit();

}


function fnPrev(){
	let url = '/portal/dac/clc/inf/viewClcInfReqData.do';
	$("#frmReqView").attr('action', url).submit();
}

/*
* 제출이벤트
*/
function fnNext(){
	let url = '/portal/dac/clc/inf/saveClcInfReqViewData.do';
	$("#frmReqView").attr('action', url).submit();
}

/*
* 임시저장 이벤트
*/
function fnTempSave(){
	$('#frmReqView').attr("action","/portal/dac/clc/inf/saveTmpClcInfReqData.do").submit();
}


</script>

<form id="frmReqView">
	<input type="hidden"  name="dataAplcNo"  value="${clcInfReserchVo.dataAplcNo}"/>
	<input type="hidden"  name="dataTpcd"  value="${clcInfReserchVo.dataTpcd}"/>
</form>

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

			<form:form name="researchForm"  modelAttribute="clcInfReserchVo" action="${pageContext.request.contextPath}/portal/dac/clc/inf/saveClcInfReserch.do" method="post" onSubmit="saveReserch(document.forms[0]); return false;">

			<!-- 연구ID -->
			<input type="hidden" id="dataAplcNo" name="dataAplcNo" value="${clcInfReserchVo.dataAplcNo}">

			<div class="n_data_write_wrap">
				<div class="n_table_info">
					<div class="title">
						<h3>신청유형</h3>
					</div>
					<div class="n_l_table">
						<table>
							<tbody>
								<tr>
									<th>신청자유형</th>
									<td>${clcInfReserchVo.aplpTypeSpcdNm}</td>
									<th>연구유형</th>
									<td>${clcInfReserchVo.rsrSpcdNm}</td>
								</tr>
								<c:if test="${clcInfReserchVo.rsrSpcd eq '01'}">
									<tr>
										<th >정책연구</th>
										<td colspan="3">${clcInfReserchVo.plcrsrInstNm}&nbsp;&nbsp;${clcInfReserchVo.plcrsrDeptNm}</td>
									</tr>
								</c:if>
							</tbody>
						</table>
					</div>
				</div>
				<div class="n_table_info">
					<div class="title">
						<h3>IRB</h3>
					</div>
					<div class="n_l_table">
						<table>
							<tbody>
								<tr>
									<th>IRB 연구기간</th>
									<td>${clcInfReserchVo.rsrSdt} ~ ${clcInfReserchVo.rsrEdt}</td>
									<th>IRB 승인기관</th>
									<td>${clcInfReserchVo.irbApriNm}</td>
								</tr>
								<tr>
									<th>IRB 승인번호</th>
									<td>${clcInfReserchVo.irbNo}</td>
									<th>IRB 연구계획서</th>
									<td>
										<div class="n_file_link">
											<c:forEach var="item" items="${fileList}" varStatus="idx">
												<c:if test="${item.attdNmSpcd == '04'}">
													<a href="#" onclick="javascript:downFile('${item.attfPthNm}','${item.attfStrNm}','${item.attfNm}');">${item.attfNm}</a>
												</c:if>
											</c:forEach>
										</div>
									</td>
								</tr>
								<tr>
									<th>IRB 결과통지서</th>
									<td colspan="3">
										<div class="n_file_link">
											<c:forEach var="item" items="${fileList}" varStatus="idx">
												<c:if test="${item.attdNmSpcd == '12'}">
													<a href="#" onclick="javascript:downFile('${item.attfPthNm}','${item.attfStrNm}','${item.attfNm}');">${item.attfNm}</a>
												</c:if>
											</c:forEach>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="n_table_info">
					<div class="title">
						<h3>가상화환경선택</h3>
					</div>
					<div class="n_l_table">
						<table>
							<tbody>
								<tr>
									<th>선택한 가상화환경</th>
									<td>${dataAplcSmry.aenvSpcdNm}</td>
									<th>가상화 사용기간</th>
									<td>${dataAplcSmry.dszApdt} ~ <span id="dszApEnddt"></span></td>
								</tr>
								<tr>
									<th>선택한 가상화분석도구</th>
									<td colspan="3">${dataAplcSmry.vrtAnlsDvceNm}</td>
								</tr>
								<tr>
									<th>감면대상여부</th>
									<td colspan="3">
										${dataAplcSmry.rdcRtItemCont}
										<c:if test="${dataAplcSmry.rdcRtSpcd  ne 'RDRT99'}">
											<span class="n_f_point">${dataAplcSmry.rdcRt}% 감면</span>
										</c:if>
									</td>
								</tr>
								<tr>
									<th>총예상비용</th>
									<td colspan="3" id="totalAmt"></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="n_table_info">
					<div class="title">
						<h3>연구정보</h3>
					</div>
					<div class="n_l_table">
						<table>
							<tbody>
								<tr>
									<th>연구명</th>
									<td colspan="3">${clcInfReserchVo.rsrSbjNm}</td>
								</tr>
								<tr>
									<th>연구주제(대상질환)</th>
									<td colspan="3">${clcInfReserchVo.rsrSbjDissCont}</td>
								</tr>
								<tr>
									<th>연구목적</th>
									<td colspan="3"><pre>${clcInfReserchVo.rsrPrpsCont}</pre></td>
								</tr>
								<tr>
									<th>대상자정의</th>
									<td colspan="3">${clcInfReserchVo.trprConf}</td>
								</tr>
								<tr>
									<th>연구내용</th>
									<td colspan="3"><pre>${clcInfReserchVo.rsrSbjCont}</pre></td>
								</tr>
								<tr>
									<th>연구방법</th>
									<td colspan="3"><pre>${clcInfReserchVo.rsrMthdConf}</pre></td>
								</tr>
								<tr>
									<th>기대효과/활용방안</th>
									<td colspan="3"><pre>${clcInfReserchVo.expcConf}</pre></td>
								</tr>
								<tr>
									<th>연구비지원 출처</th>
									<td colspan="3">${clcInfReserchVo.rsrfunSprtConf}</td>
								</tr>
								<tr>
									<th>비고</th>
									<td colspan="3"><pre>${clcInfReserchVo.rsrInfExntCont}</pre></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="n_table_info">
					<div class="title">
						<h3>신청자 정보</h3>
					</div>
					<div class="n_l_table">
						<table>
							<tbody>
								<tr>
									<th>성명</th>
									<td>${clcInfRspVo.rsrpNm}</td>
									<th>이메일</th>
									<td>${clcInfRspVo.email}</td>
								</tr>
								<tr>
									<th>휴대폰번호</th>
									<td colspan="3">${clcInfRspVo.userMbphNo1 != null ? clcInfRspVo.userMbphNo1.replaceAll("(.{3})(.*)(.{4})", "$1-$2-$3") : ''}</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<!-- 연구자 정보 -->
				<c:if test="${rspCnt != null && rspCnt > 0}">
					<div class="n_table_info">
						<div class="title">
							<h3>연구자 정보</h3>
						</div>
						<div class="re_table">
							<table>
								<thead>
									<tr>
										<th>연구자 유형</th>
										<th>성명</th>
										<th>이메일</th>
										<th>휴대폰번호</th>
										<th>가상화 사용여부</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="list" items="${clcInfRspList}">
										<tr>
											<td>${list.rsrpSpcdNm}</td>
											<td>${list.rsrpNm}</td>
											<td>${list.email}</td>
											<td>${list.userMbphNo1 != null ? list.userMbphNo1.replaceAll("(.{3})(.*)(.{4})", "$1-$2-$3") : ''}</td>
											<td>
												<c:if test="${list.vrtUseYn eq 'Y' }">
													사용
												</c:if>
												<c:if test="${list.vrtUseYn eq 'N' }">
													미사용
												</c:if>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</c:if>
				<div class="n_table_info">
					<div class="title">
						<h3>데이터셋</h3>
					</div>
					<!-- 리얼그리드 영역 | 나중에 style 삭제요망-->
					<div class="grid_area_wrap" id="gridView"></div>

					<div class="btn" id="gridMoreDisp" style="display:none;">
						<a href="javascript:fnSearchMore()"><span id="gridMoreCntTxt">320개 데이터 더보기</span></a>
					</div>
				</div>
			</div>
			</form:form>
			<div class="n_table_r_btn">
				<a href="javascript:fnPrev();" class="n_m_btn n_bc_blue_dk">이전</a>
				<c:if test="${clcInfReserchVo.dataTpcd eq '01'}">
					<c:if test="${clcInfReserchVo.dtapStatSpcd ne '0000000007'}">
						<!-- <a href="javascript:fnTempSave()" class="n_m_btn n_bc_b_line">임시저장</a> -->
						<a href="javascript:fnNext()" class="n_m_btn n_bc_blue_dk">다음</a>
					</c:if>
				</c:if>

				<c:if test="${clcInfReserchVo.dataTpcd eq '02'}">
					<c:if test="${clcInfReserchVo.dtapStatSpcd ne '0000000017'}">
						<!-- <a href="javascript:fnTempSave()" class="n_m_btn n_bc_b_line">임시저장</a> -->
						<a href="javascript:fnNext()" class="n_m_btn n_bc_blue_dk">다음</a>
					</c:if>
				</c:if>

				<c:if test="${clcInfReserchVo.dataTpcd eq '03'}">
					<c:if test="${clcInfReserchVo.dtapStatSpcd ne '0000000027'}">
						<!-- <a href="javascript:fnTempSave()" class="n_m_btn n_bc_b_line">임시저장</a> -->
						<a href="javascript:fnNext()" class="n_m_btn n_bc_blue_dk">다음</a>
					</c:if>
				</c:if>
			</div>
		</div>
	</div>
</div>

	<!-- 데이터신청 조회폼 -->
	<form id="srchFrm" name="srchFrm">
		<input type="hidden" id="allListYn" name="allListYn" value="N"/>
		<input type="hidden" id="dataTpcd" name="dataTpcd"  value="${clcInfReserchVo.dataTpcd}"/>
    	<input type="hidden" id="pblDtsSpcd" name="pblDtsSpcd"  value="${clcInfReserchVo.pblDtsSpcd}"/>
    	<input type="hidden" id="dtapStatSpcd" name="dtapStatSpcd"  value="${clcInfReserchVo.dtapStatSpcd}"/>
		<input type="hidden" name="dataAplcNo" value="${clcInfReserchVo.dataAplcNo}"/>
	</form>

	<!-- 파일 다운로드폼 -->
	<form name="downLoadFilefrm" id="downLoadFilefrm" action="" method="post" style="display: none;" >
		<input type="hidden" id="fileAttNmSpcd" name="fileAttNmSpcd">
		<input type="hidden" id="dataAplcNo" name="dataAplcNo" value="${clcInfReserchVo.dataAplcNo}">
		<input type="hidden" id="attfPthNm" name="attfPthNm">
		<input type="hidden" id="attfStrNm" name="attfStrNm">
		<input type="hidden" id="attfNm" name="attfNm" >
	</form>

	<script src="/js/kcure/portal/clc/inf/ClcInfReqView.js" ></script>

	<style>
	.multi-line-css {
	  padding-top: 10px !important;
	  padding-bottom: 10px;
	  text-align: left;
	  white-space: pre;
	  background: #ff8b00;
	}
	.rg-renderer {
	 margin-top: 15px;
	 margin-bottom: 15px;
	 max-height: fit-content !important;
	}
	.rg-body {
	 over-flow: auto !important;
	}
	.multiline-editor{
	  white-space: pre;
	}
</style>

<!-- title 및 navi -->
<%@include file="/WEB-INF/jsp/kcure/portal/dac/clc/inf/clcInfCommon.jsp"%>