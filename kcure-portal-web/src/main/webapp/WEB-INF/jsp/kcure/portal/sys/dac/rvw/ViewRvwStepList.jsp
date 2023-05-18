<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>
<script type="text/javascript">
/*
	* 단계이동
	*/
	function fnMovePage(stpCd){
		$("#moveStpSpcd").val(stpCd);
		let url = '/portal/sys/dac/rvw/movePage.do';
		$("#moveFrm").attr('action', url).submit();
	}

</script>

<form id="moveFrm" name="moveFrm">
	<input type="hidden"  name="dataAplcNo" value='<c:out value="${data.dataAplcNo}"/>'>
	<input type="hidden"  name="rvwTmpId" value='<c:out value="${data.rvwTmpId}"/>'>
	<input type="hidden" id="moveStpSpcd" name="rvwStpSpcd">
</form>
<c:forEach var="list" items="${list}" varStatus="rowInx">
	<li class="${list.stpSts == 'P' ? 'save' : ''} ${list.stpSts == 'C' ? 'on' : ''}">
		<c:choose>
			<c:when test="${list.stpSts == 'P' && list.moveUriYn == 'Y' }">
				<a href="javascript:void(0)" onclick="fnMovePage('${list.rvwStpSpcd}');">${list.rvwStpSpcdNm}</a>
			</c:when>
			<c:otherwise>
				${list.rvwStpSpcdNm}
			</c:otherwise>
		</c:choose>
		
	</li>
</c:forEach>