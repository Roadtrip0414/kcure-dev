
<%
/* =================================================================
* @FileName : DetailViewDataPaymentResult.jsp
* @date: 2023. 5. 4.
* @author : parkgu
* @설명 : 연구과제 결제 결과
* =================================================================
* 수정일 작성자 내용
* -----------------------------------------------------------------------
* 2023. 5. 4. parkgu 파일생성
* =================================================================
*/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>

<script type="text/javascript">
$(document).ready(() => {
	const success = ${success};
	const errorCode = "${errorCode}";
	const errorDesc = "${errorDesc}";
	const form = document.resultForm;
	
	if (!success) {
		msg = "결제 실패 " + (errorDesc ? errorDesc + " (" + errorCode + ")" : "");
		alert(msg);

		form.action = "/portal/myp/rsc/inf/detailViewDataPayment.do";
		form.submit();
	} else {
		const amt = "<fmt:formatNumber value="${amt}" pattern="#,###" />";
		const msg = amt + "원이 결제되었습니다.";
		alert(msg);
		
		form.action = "/portal/myp/rsc/inf/viewMypRscInfApl.do";
		form.submit();
	}
});

</script>
<form name="resultForm" action="" method="post" >
	<input type="hidden" name="pageIndex" value="${pageIndex}">
	<input type="hidden" name="dataAplcNo" value="${dataAplcNo}">
</form>
