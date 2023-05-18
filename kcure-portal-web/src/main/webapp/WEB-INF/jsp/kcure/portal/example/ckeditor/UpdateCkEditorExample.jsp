
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

	function save() {
		CKEDITOR.instances.col1.updateElement();
		var val = $("#editor_div input,textarea").serialize();
		console.log(val);
		$.ajax({
			url : "<c:url value='/portal/example/ckeditor/nonCheck/updateEditor.do'/>",
			type : "POST",
			data : val,
			dataType : 'json',
			success : function(data) {
				alert('성공');
				location.href = "/portal/example/ckeditor/nonCheck/viewCkEditorExample.do"
			},
			error : function() {
				alert("실패");
			}
		});
	}

	function goList(){
		location.href = "/portal/example/ckeditor/nonCheck/viewCkEditorExample.do"
	}
</script>
<div class="wrap">
	<div class="con">
		<div class="area_wrap">
		<br/><br/><br/><br/><br/>
<div id="editor_div">
	에디터 semple
	<input class="s_submit" type="submit" value="<spring:message code="button.save" />" onclick="save(); return false;" />
	<input class="s_submit" type="submit" value="목록" onclick="goList(); return false;" />
	<br />
	제목 :
	<input type="text" id="col2" name="col2" maxlength="20" value="<c:out value='${ExEditor.col2}'/>"/>
	<textarea id="col1" name="col1" rows="150" cols="14" cssClass="txaClass2" ><c:out value='${ExEditor.col1}'/></textarea>
	<input type="hidden" id="seq" name="seq" value="${ExEditor.seq}" >
	<!-- ckeditor  -->
	<ckeditor:replace replace="col1" basePath="/js/plugin/ckeditor" />
</div>
</div>
</div>
</div>