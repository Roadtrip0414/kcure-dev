
<%
/* =================================================================
* @FileName : ViewResult.jsp
* @date: 2023. 4. 10.
* @author : parkgu
* @설명 :
* =================================================================
* 수정일 작성자 내용
* -----------------------------------------------------------------------
* 2023. 4. 7. parkgu 파일생성
* =================================================================
*/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>

<style>
.pay-result-title {
	font-size: large;
	font-weight: bold;
}

table.pay-result th, table.pay-result td {
	padding: 5px;
}
table.pay-result th {
	font-weight: bold;
}
</style>

<!-- wrap -->
<div class="wrap">
	<div class="con">
		<div class="area_wrap">
			<div class="pay-result-title">결제 정보</div>

			<table class="pay-result">
				<tbody>
					<tr>
						<th>성공 여부</th>
						<td>
							<c:choose>
								<c:when test="${resultVO.success eq true}">성공</c:when>
								<c:otherwise>실패</c:otherwise>
							</c:choose>
						</td>
					</tr>

					<c:choose>
						<c:when test="${resultVO.paymentType eq 'VBANK'}">
							<tr>
								<th>가상계좌 번호</th>
								<td>${resultVO.vbankBankName} ( ${resultVO.vbankNum } )</td>
							</tr>
							<tr>
								<th>가상계좌 만료일</th>
								<td>
									<fmt:parseDate value="${resultVO.vbankExpDate}${resultVO.vbankExpTime }" var="registered" pattern="yyyyMMddHHmmss" />
									<fmt:formatDate value="${registered}" pattern="yyyy-MM-dd HH:mm:ss" var="endDate"/>
										${endDate}
								</td>
							</tr>
						</c:when>
						<c:otherwise>
							<tr>
								<th>결제수단</th>
								<td>
									<c:choose>
										<c:when test="${resultVO.paymentType eq 'BANK' }">
											계좌이체(${resultVO.bankName })
										</c:when>
										<c:when test="${resultVO.paymentType eq 'CARD' }">
											카드결제(${resultVO.cardName })
										</c:when>
										<c:otherwise>
											없음
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
						</c:otherwise>
					</c:choose>
					<tr>
						<th>결제금액</th>
						<td><span class="price"><fmt:formatNumber value="${resultVO.paymentAmount }" pattern="#,###" /></span> 원</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<!-- //con -->
</div>
<!-- //wrap -->