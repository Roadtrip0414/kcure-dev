
<%
/* =================================================================
* @FileName : ViewDacRvwStepResult
* @date: 2023. 3. 14.
* @author : bhs
* @설명 : 데이터신청 심의관리 > setpResult 페이지 ( 상태 이동 )
* =================================================================
* 수정일 작성자 내용
* -----------------------------------------------------------------------
* 2023. 3. 14. bhs 파일생성
* =================================================================
*/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>
<script type="text/javascript">

$(document).ready(
		function() {
			
			var form = document.resultForm;
			form.action = '${targetStepUrl}';
			form.submit();
			
});

</script>
<form name="resultForm" action="" method="post" >
	<input type="hidden" id="dataAplcNo" name="dataAplcNo" value="${dataAplcNo}">
	<input type="hidden" id="rvwStpSpcd" name="rvwStpSpcd" value="${rvwStpSpcd}">
</form>
