<%
/* =================================================================
* @FileName : SbjMemoPopup.jsp
* @date: 2023. 3. 31.
* @author : hjjeon
* @설명 :
* =================================================================
* 수정일 작성자 내용
* -----------------------------------------------------------------------
* 2023. 3. 31. hjjeon 파일생성
* =================================================================
*/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>
<script type="text/javascript">
$(document).ready(function() {

	var param = [];
	var opener;

	if (window.dialogArguments) {
	    opener = window.dialogArguments; // Support IE
	} else {
	    opener = window.opener;    // Support Chrome, Firefox, Safari, Opera
	}

	$("#saveBtn").click(function(){
		$.ajax({
			url: "/portal/sys/rsr/smn/saveSbjMeno.do",
			dataType: "json",
			data: {"dataAplcNo" : '<c:out value='${detailVO.dataAplcNo}'/>', "memoCont" : $("#memoCont").val()},
			type: "POST",
			async: false,
			success: function(response) {
				alert(GM.save_success);
				window.close();
			},
			complete: function(response) {
				window.close();
			}
		});
	});
});

</script>
<div class="window_pop">
	<h1 class="title">${detailVO.rsrSbjNm}</h1>
	<textarea id="memoCont" name="memoCont" rows="5" cols="80"><c:out value='${detailVO.memoCont}'/></textarea>
	<div class="win_btn">
<!-- 		<a href="javascript:void(0)" onclick="self.close();">닫기</a> -->
		<a href="javascript:void(0)" id="saveBtn">저장</a>
	</div>
</div>