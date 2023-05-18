<%
/* =================================================================
 * @FileName : ViewMypRscInfInDetail.jsp
 * @date: 2023.05.04
 * @author : bhs
 * @설명 : 마이페이지 나의연구 반입 신청 상세화면
 * =================================================================
 * 수정일         작성자             내용     
 * -----------------------------------------------------------------------
 * 2023.05.04     bhs           파일생성
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
	$('#downLoadFilefrm #attfPthNm').val(attfPthNm);
	$('#downLoadFilefrm #attfStrNm').val(attfStrNm);
	$('#downLoadFilefrm #attfNm').val(attfNm);
    $('#downLoadFilefrm').attr("action", "/portal/dac/clc/inf/serviceFileDown.do");
    $('#downLoadFilefrm').submit();
}

/**
 * 목록이동
 */
function fnList(){
	$('#viewFrm').attr("action", "/portal/myp/rsc/inf/viewMypRscInfIn.do");
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
		<input type="hidden" id="dataAplcNo" name="dataAplcNo" value="${aplcInfo.dataAplcNo}">
		<input type="hidden" id="rsrAsmtNo" name="rsrAsmtNo" value="${aplcInfo.rsrAsmtNo}">
		
		<div id="filesUploadDiv"></div>
		
		<div class="n_my_research_wiew_wrap">
			<div class="con">
				<div class="sub_pag_title">
					<p>반입 신청 연구정보</p>
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
										<td>${aplcInfo.dszDsgnDtTerm}</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="n_table_info gray">
						<div class="title">
							<h3>반입신청</h3>
						</div>
						<div class="n_l_table type_02">
							<table>
								<tbody>
									<tr>
										<th>반입데이터명</th>
										<td>${tkinInfo.tkinDataNmCont}</td>
									</tr>
									<tr>
										<th>반입파일명세서</th>
										<td><div class="n_file_link"><a onclick="javascript:fnDownFile('${tkinInfo.attfPthNm}', '${tkinInfo.attfStrNm}', '${tkinInfo.attfNm}');">${tkinInfo.attfNm}</a></div></td>
									</tr>
									<tr>
										<th>반입파일</th>
										<td>
											<div class="carry_into_view">
												<c:forEach items="${fileList}" var="list" varStatus="rowInx" >
													<ul>
														<li>
															<c:if test="${list.tkinDataProgStcd ne 'U02'}">
																<div class="n_file_link">
																	${list.attfNm}
																</div>
															</c:if>
															<c:if test="${list.tkinDataProgStcd eq 'U02'}">
																<div class="n_file_link">
																	<a onclick="javascript:fnDownFile('${list.attfPthNm}', '${list.attfStrNm}', '${list.attfNm}');">${list.attfNm}</a>
																</div>
															</c:if>																													
														</li>
														<li>
															<c:choose>
															  <c:when test="${list.tkinDataProgStcd eq 'U01'}">
															    	<li>승인대기중</li>
															  </c:when>
															  <c:when test="${list.tkinDataProgStcd eq 'U02'}">
															    	<li class="f_green">승인완료</li>
															  </c:when>
															  <c:when test="${list.tkinDataProgStcd eq 'U03'}">
															    	<li class="f_red">반려 : ${list.rjcRsnCont}</li>
															  </c:when>															 
															</c:choose>
														</li>
													</ul>
												</c:forEach>																													
											</div>
										</td>
									</tr>
									<tr>
										<th>반입목적</th>
										<td>${tkinInfo.tkinDataPrpsCont}</td>
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
