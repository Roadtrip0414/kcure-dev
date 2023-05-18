<%
/* =================================================================
 * @FileName  : file_name
 * @date: 2023. 1. 16.
 * @author : shpark
 * @설명 : 
 * =================================================================
 * 수정일         작성자             내용     
 * -----------------------------------------------------------------------
 * 2023. 1. 16.        개발자명           파일생성
 * =================================================================
 */ 
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>
저장후 파일 id <c:out value="${atchFileId}"/>
<br/>
<br/>
<br/>

리스트
	<!-- 첨부목록을 보여주기 위한 -->
<c:if test="${atchFileId ne null && atchFileId ne ''}">
	<c:import url="/cmm/fms/nonCheck/selectFileInfs.do" charEncoding="utf-8">
		<c:param name="param_atchFileId" value="${atchFileId}" />
		<c:param name="param_now_menu_nm" value="${nowMenuInfo.menuNm}" />
	</c:import>
			
</c:if>
<br/>
<br/>
<br/>
<br/>
