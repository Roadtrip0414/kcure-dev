<%
/* =================================================================
 * @FileName : ViewSvcDttoRsltAplc.jsp
 * @date: 2023.05.11
 * @author : bhs
 * @설명 : 데이터반출관리 상세 결과화면
 * =================================================================
 * 수정일         작성자             내용
 * -----------------------------------------------------------------------
 * 2023.03.20     parkgu           파일생성
 * =================================================================
 */
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>
<script type="text/javascript" src="/js/kcure/portal/sys/rsr/RsrSbjMemo.js"></script>
<script type="text/javascript">

function fnFileDown(attfPthNm,attfStrNm,attfNm){
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

</script>

<div class="wrap">
	<div class="con">
		<div class="area_wrap">
			<div class="section">
				<form id="downLoadFilefrm" name="downLoadFilefrm" method="post">
					<input type="hidden" id="attfPthNm" name="attfPthNm" value=""/>
					<input type="hidden" id="attfStrNm" name="attfStrNm" value=""/>
					<input type="hidden" id="attfNm" name="attfNm" value=""/>
					<input type="hidden" name="dataAplcNo" value="${tkinInfo.dataAplcNo}" />
				</form>
				<form id="detailFrm" name="detailFrm" method="post">
					<input type="hidden" name="dataAplcNo" value="${detail.dataAplcNo}" />
					<input type="hidden" name="dttoAplcDt" value="${detail.dttoAplcDt}" />
					<input type="hidden" name="rsrAsmtNo" value="${detail.rsrAsmtNo}" />
					<input type="hidden" id="dttoFileListCnt" name="dttoFileListCnt" value="${dttoFileListCnt}" />
					<table class="left_talbe">
						<tbody>
							<tr>
								<th>연구과제번호</th>
								<td>${detail.rsrAsmtNo}</td>
							</tr>
							<tr>
								<th>연구명</th>
								<td>${detail.rsrSbjNm} <a href="##" onclick="fnMemoPopup('${detail.dataAplcNo}');" style="display:inline;color:blue;">[메모]</a></td>
							</tr>
							<tr>
								<th>연구기간</th>
								<td>${detail.rsrDtTerm}</td>
							</tr>
							<tr>
								<th>신청자</th>
								<td>${detail.dttoAplcNm}</td>
							</tr>
							<tr>
								<th>유형</th>
								<td>${detail.dataTpcdNm}</td>
							</tr>
							<tr>
								<th>반출파일</th>
								<td>
									<ul>
									<c:forEach items="${dttoFileList}" var="list" varStatus="rowInx" >
										<li>
											<input type="hidden" name="dttoAttfSeq_${rowInx.index}" value="${list.attfSeq}">
											<div style="margin-top:30px;margin-bottom: 30px;">
												<div class="n_file_link"><a onclick="javascript:fnFileDown('${list.attfPthNm}', '${list.attfStrNm}', '${list.attfNm}');" style="float:left;margin-right:30px;">${list.attfNm}</a></div>
												
												<c:if test="${list.dttoAplcProgStcd eq 'U03'}">
													<span style="margin-right:30px;" class="f_red">${list.dttoAplcProgStcdNm}</span>
													${list.rjcRsnCont}
												</c:if>
												<c:if test="${list.dttoAplcProgStcd ne 'U03'}">
													<span style="margin-right:30px;" class="f_green">${list.dttoAplcProgStcdNm}</span>
												</c:if>
											</div>
										</li>
									</c:forEach>	
									</ul>													
								</td>
							</tr>							
						</tbody>
					</table>
					<div class="btn_center">
						<a href="javascript:history.back()" class="bc_line">목록</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<input type="hidden" name="current_menu_name_info" value="DetailSvcDttoAplc" />