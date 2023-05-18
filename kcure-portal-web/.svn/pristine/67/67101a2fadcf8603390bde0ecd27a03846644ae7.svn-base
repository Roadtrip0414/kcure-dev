<%
/* =================================================================
* @FileName : DetailViewMypRsc.jsp
* @date: 2023. 5. 2.
* @author : hjjeon
* @설명 : 연구과제 진행 상태 상세화면
* =================================================================
* 수정일 작성자 내용
* -----------------------------------------------------------------------
* 2023. 5. 2. hjjeon 파일생성
* =================================================================
*/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>
<script type="text/javascript">
function fnList(){
	$("#listFrm").attr("action", "/portal/myp/rsc/inf/viewMypRscInfApl.do").submit();
}
</script>
<div class="wrap">
	<%@ include file="/WEB-INF/jsp/kcure/portal/myp/rsc/ViewMypRscInfNav.jsp" %>
	<form id="listFrm" name="listFrm" method="post">
		<input type="hidden" name="pageIndex" value="${pageIndex}"/>
	</form>
 	<div class="n_my_research_wiew_wrap">
		<div class="con">
			<div class="sub_pag_title">
				<p>연구과제 진행 상태 상세화면</p>
			</div>
			<div class="n_gap_box">
				<div class="n_table_info">
					<div class="n_l_table type_02">
						<table>
							<tbody>
								<tr>
									<th>연구명</th>
									<td colspan="3">${dataAplcDetail.rsrSbjNm}</td>
								</tr>
								<tr>
									<th>책임연구자</th>
									<td>${dataAplcDetail.rsp02}</td>
									<th>연구기간</th>
									<td>${dataAplcDetail.rsrSdtFmt} ~ ${dataAplcDetail.rsrEdtFmt}</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="n_table_info gray">
					<div class="title">
						<h3>상태 개요</h3>
					</div>
					<div class="n_l_table type_02">
						<table>
							<tbody>
								<tr>
									<th>데이터 유형</th>
									<td>${dataAplcDetail.dataTpcdNm}</td>
								</tr>
								<tr>
									<th>진행상태</th>
									<td>${dataAplcDetail.mpSrlbNm}</td>
								</tr>
								<tr>
									<th>상세현황</th>
									<td>
										<c:forEach var="list" items="${dataPrvdInstList}">
											<p>${list.prtiNm} -
											<c:choose>
												<c:when test="${dataAplcDetail.dataTpcd ne '02' and list.detlCdNm eq null}">
													데이터 준비중
												</c:when>
												<c:otherwise>
													${list.detlCdNm}
												</c:otherwise>
											</c:choose>
											</p>
										</c:forEach>
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
</div>