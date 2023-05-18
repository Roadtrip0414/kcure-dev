
<%
/* =================================================================
 * @FileName  : DetailViewCkEditorExample.jsp
 * @date: 2023. 1. 3.
 * @author : shpark
 * @설명 : 에디터 상세 보기 예제
 * =================================================================
 * 수정일         작성자             내용
 * -----------------------------------------------------------------------
 * 2023. 1. 3.        shpark           파일생성
 * =================================================================
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>
<script type="text/javascript">
	$(document).ready(function() {

	}

	);

	function updateForm() {

		$("#editorFrm").attr("action", "/portal/example/ckeditor/nonCheck/updateCkEditorExampleForm.do").submit();

	}

	function goList(){
		location.href = "/portal/example/ckeditor/nonCheck/viewCkEditorExample.do"
	}
</script>
<div class="wrap">
	<div class="con">
		<div class="area_wrap">
		<br/><br/><br/><br/><br/>
<form id="editorFrm" name="editorFrm" method="post">
	에디터 semple
	<input class="s_submit" type="submit" value="수정" onclick="updateForm(); return false;" />
	<input class="s_submit" type="submit" value="목록" onclick="goList(); return false;" />
	<br />
	제목 :  <c:out value="${ExEditor.col2}" escapeXml="false" />
	<br/>
	<c:out value="${ExEditor.col1}" escapeXml="false" />
	<input type="hidden" id="seq" name="seq" value="${ExEditor.seq}" >
</form>
</div>
</div>
</div>