<%
/* =================================================================
 * @FileName  : file_name
 * @date: 2023. 1. 11.
 * @author : shpark
 * @설명 : 
 * =================================================================
 * 수정일         작성자             내용     
 * -----------------------------------------------------------------------
 * 2023. 1. 11.        개발자명           파일생성
 * =================================================================
 */ 
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>
<script type="text/javascript">
	$(document).ready(
		function() {
			/* 등록버튼 클릭  */
			$("#errBtn").click(function() {
				var ajaxUrl = "<c:url value='/portal/example/sample/nonCheck/ajaxErr.do' />";
				var param = {test:"1"}
				$.ajax({
					url: ajaxUrl
					,type: 'post'
					,data: param
					,dataType: 'json'
					,success: function(data) {
						console.log('--------------------');
						console.log(data);
						console.log('--------------------');
						alert("success : ");
					} ,
					error: function(err) {
						console.log('-------별도의 에러처리 가능.-------------');
					}
				});
			});
			
		});
</script>

<button id="errBtn" class="btn"> 에러 </button>