<%
/* =================================================================
* @FileName : StatChanRsnContPopup.jsp
* @date: 2023. 1. 30.
* @author : hjjeon
* @설명 : 처리 사유 입력 팝업
* =================================================================
* 수정일 작성자 내용
* -----------------------------------------------------------------------
* 2023. 1. 30. hjjeon 파일생성
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

	var userIdArr = opener.document.getElementById("pUserId").value.split(",");

	$.each(userIdArr, function (index, value) {
		param.push(value);
	});

	$("#saveBtn").click(function(){

		$.ajax({
			url: "/portal/sys/usr/stt/updateUsr.do",
			dataType: "json",
			data: {"usrList" : param , "userStcd" : opener.document.getElementById("pUserStcd").value , "statChanRsnCont" : $("#statChanRsnCont").val()},
			type: "POST",
			async: false,
			success: function(response) {
				alert(GM.save_success);
				opener.searchDate();
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
	<h1 class="title">처리사유</h1>
	<textarea id="statChanRsnCont" rows="5" cols="80"></textarea>
	<div class="win_btn">
		<a href="javascript:void(0)" onclick="self.close();">닫기</a>
		<a href="javascript:void(0)" id="saveBtn">처리하기</a>
	</div>
</div>