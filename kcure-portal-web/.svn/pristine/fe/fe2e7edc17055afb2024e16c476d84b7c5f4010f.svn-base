
<%
/* =================================================================
* @FileName : ViewClcInfStepResult
* @date: 2023. 2. 28.
* @author : shpark
* @설명 : 데이터신청 > setpResult 페이지 ( 상태 이동 )
* =================================================================
* 수정일 작성자 내용
* -----------------------------------------------------------------------
* 2023. 2. 28. shpark 파일생성
* =================================================================
*/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>
<script type="text/javascript">

$(document).ready(
		function() {
			var form = document.resultForm;
			form.action = '/portal/uat/uca/procSignupStp1.do';
			form.submit();
			
});

</script>
<form name="resultForm" action="" method="post" >
	<input type="text" name="userEntMedmCd" id="userEntMedmCd" value="${userEntMedmCd}">
	<input type="text" name="entMedmRcvId" id="entMedmRcvId" value="${entMedmRcvId}">
	<input type="text" name="userId" id="userId" value="${userId}">
</form>