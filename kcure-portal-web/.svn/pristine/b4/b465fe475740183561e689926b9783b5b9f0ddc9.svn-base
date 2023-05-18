<%
/* =================================================================
 * @FileName : ViewMypRscInfOutDetail.jsp
 * @date: 2023.05.10
 * @author : bhs
 * @설명 : 마이페이지 나의연구 반출 신청 상세화면
 * =================================================================
 * 수정일         작성자             내용     
 * -----------------------------------------------------------------------
 * 2023.05.10     bhs           파일생성
 * =================================================================
 */ 
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>
<script type="text/javascript">

/**
 * 파일다운로드
 */
function fnDownFile(attfPthNm,attfStrNm,attfNm){
	if (!attfNm) {
		alert("파일이 존재하지 않습니다.");
		return;
	}
	
	//반출파일다운로드 최초인 경우 설문조사 팝업호출
	if($("#tkotFileUnldYn").val() == "N"){
		fnUpdateFileUnldYn(attfPthNm,attfStrNm,attfNm);
	}else{
		fnDownFileProc(attfPthNm,attfStrNm,attfNm);
	}
}

function fnDownFileProc(attfPthNm,attfStrNm,attfNm){
	$('#downLoadFilefrm #attfPthNm').val(attfPthNm);
	$('#downLoadFilefrm #attfStrNm').val(attfStrNm);
	$('#downLoadFilefrm #attfNm').val(attfNm);
    $('#downLoadFilefrm').attr("action", "/portal/dac/clc/inf/serviceFileDown.do");
    $('#downLoadFilefrm').submit();
}

function fnSrvPopup(){
	setTimeout(function() {
		var addr = $("#srvLinkAddr").val();
		var titleNm = $("#srvIvstgTtlNm").val();
		window.open(addr, titleNm, "height=830, width=785, top=50, left=20, scrollbars=yes, resizable=yes");
	}, 3000);	
}

function fnUpdateFileUnldYn(attfPthNm,attfStrNm,attfNm){
	let rsrAsmtNo = $("#rsrAsmtNo").val();
	let dttoAplcDt = $("#dttoAplcDt").val();
	$.ajax({
		url: "/portal/myp/rsc/inf/updateFileUnldYn.do",
		dataType: "json",
		data: {"rsrAsmtNo" : rsrAsmtNo,"dttoAplcDt":dttoAplcDt },
		type: "POST",
		//async: false,
		success: function(response) {
			var checkData = response.result;
			if(checkData == "success"){
				$("#tkotFileUnldYn").val("Y");
				fnDownFileProc(attfPthNm,attfStrNm,attfNm);
				fnSrvPopup();
			}
		},
        error: function (request, status, error) {
            alert('<spring:message code="fail.request.msg" />');
        }
	});
}

/**
 * 목록이동
 */
function fnList(){
	$('#viewFrm').attr("action", "/portal/myp/rsc/inf/viewMypRscInfOut.do");
	$('#viewFrm').submit();
}

</script>

<div class="wrap">
	
	<%@ include file="/WEB-INF/jsp/kcure/portal/myp/rsc/ViewMypRscInfNav.jsp" %>
	
	<!-- 파일 다운로드폼 -->
	<form name="downLoadFilefrm" id="downLoadFilefrm" action="" method="post" style="display: none;" >
		<input type="hidden" id="fileAttNmSpcd" name="fileAttNmSpcd">
		<input type="hidden" id="dataAplcNo" name="dataAplcNo" value='<c:out value="${data.dataAplcNo}"/>'>
		<input type="hidden" id="attfPthNm" name="attfPthNm">
		<input type="hidden" id="attfStrNm" name="attfStrNm">
		<input type="hidden" id="attfNm" name="attfNm" >
	</form>
	
	<form id="viewFrm" name="viewFrm"  method="post">
		<input type="hidden" id="srvLinkAddr" name="srvLinkAddr" value="${srvyLnk.lnkAddr}">
		<input type="hidden" id="srvIvstgTtlNm" name="srvIvstgTtlNm" value="${srvyLnk.srvyIvstgTtlNm}">
		<input type="hidden" id="dttoAplcDt" name="dttoAplcDt" value="${dttoAplcDt}">
		<input type="hidden" id="tkotFileUnldYn" name="tkotFileUnldYn" value='<c:out value="${fileUnldYn}"/>'>
		<input type="hidden" id="dataAplcNo" name="dataAplcNo" value="${aplcInfo.dataAplcNo}">
		<input type="hidden" id="rsrAsmtNo" name="rsrAsmtNo" value="${aplcInfo.rsrAsmtNo}">
		
		<div id="filesUploadDiv"></div>
		
		<div class="n_my_research_wiew_wrap">
			<div class="con">
				<div class="sub_pag_title">
					<p>반출 신청 연구정보</p>
				</div>
				<div class="n_gap_box">
					<div class="n_table_info">
						<div class="n_l_table type_02">
							<table>
								<tbody>
									<tr>
										<th>연구명</th>
										<td>${aplcInfo.rsrSbjNm}</td>
										<th>연구과제번호</th>
										<td>${aplcInfo.rsrAsmtNo}</td>
									</tr>
									<tr>
										<th>책임연구자</th>
										<td>${aplcInfo.rsrpNm}</td>
										<th>연구기간</th>
										<td>${aplcInfo.rsrDtTerm}</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="n_table_info gray">
						<div class="title">
							<h3>반출신청</h3>
						</div>
						<div class="n_l_table type_02">
							<table>
								<tbody>							
									<tr>
										<th>반출파일</th>
										<td>
											<div class="carry_into_view">
												<c:forEach items="${fileList}" var="list" varStatus="rowInx" >
													<ul>
														<li>
															<c:if test="${list.dttoAplcProgStcd ne 'U02'}">
																<div class="n_file_link">
																	${list.attfNm}
																</div>
															</c:if>
															<c:if test="${list.dttoAplcProgStcd eq 'U02'}">
																<div class="n_file_link">
																	<a onclick="javascript:fnDownFile('${list.attfPthNm}', '${list.attfStrNm}', '${list.attfNm}');">${list.attfNm}</a>
																</div>
															</c:if>
														</li>
														<li>
															<c:choose>
															  <c:when test="${list.dttoAplcProgStcd eq 'U01'}">
															    	<li>승인대기중</li>
															  </c:when>
															  <c:when test="${list.dttoAplcProgStcd eq 'U02'}">
															    	<li class="f_green">승인완료</li>
															  </c:when>
															  <c:when test="${list.dttoAplcProgStcd eq 'U03'}">
															    	<li class="f_red">반려 : ${list.rjcRsnCont}</li>
															  </c:when>															 
															</c:choose>
														</li>
													</ul>
												</c:forEach>																													
											</div>
										</td>
									</tr>									
								</tbody>
							</table>
						</div>
					</div>
					<a onclick="javascript:fnList();" class="n_l_btn gray_l">목록으로</a>
				</div>
			</div>
		</div>
	</form>
</div>
