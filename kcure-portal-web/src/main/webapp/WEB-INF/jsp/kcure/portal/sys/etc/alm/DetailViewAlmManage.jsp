<%
/* =================================================================
* @FileName : 파일명
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
//목록 이동
function fnList(){
	$("#srchForm").attr("action", "/portal/sys/etc/alm/viewAlmManage.do").submit();
}

function fnSave(){
	var val = $("#srchForm").serialize();

	$.ajax({
		url : "<c:url value='/portal/sys/etc/alm/updateNtceMsg.do'/>",
		type : "POST",
		data : val,
		dataType : 'json',
		success : function(data) {
			location.href = "/portal/sys/etc/alm/viewAlmManage.do"
		},
		error : function() {
			alert("저장 실패 하였습니다.");
		}
	});
}
</script>
<div class="wrap">
	<div class="con">
		<div class="section">
			<form id="srchForm" name="srchForm" method="post">
				<input type="hidden" name="ntceMsgNo" value="<c:out value='${detailVO.ntceMsgNo}'/>"/>
				<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>">

				<table class="left_talbe">
					<tbody>
						<tr>
							<th>구분</th>
							<td><c:out value='${detailVO.ntceSpcdNm}'/></td>
							<th>상세구분</th>
							<td><c:out value='${detailVO.ntceDetlSpcdNm}'/></td>
						</tr>
						<tr>
							<th>알림 제목</th>
							<td colspan="3"><input type="text" id="ntceMsgTtlNm" name="ntceMsgTtlNm" maxlength="200" value="<c:out value='${detailVO.ntceMsgTtlNm}'/>"/></td>
						</tr>
						<tr>
							<th>알림 내용</th>
							<td colspan="3"><textarea name="ntceMsgCont" rows="15" cols="180" cssClass="txaClass2"><c:out value='${detailVO.ntceMsgCont}'/></textarea></td>
						</tr>
						<tr>
							<th>메일 제목</th>
							<td colspan="3"><input type="text" id="emailMsgTtlNm" name="emailMsgTtlNm" maxlength="200" value="<c:out value='${detailVO.emailMsgTtlNm}'/>"/></td>
						</tr>
						<tr>
							<th>메일 내용</th>
							<td colspan="3"><textarea name="emailMsgCont" rows="15" cols="180" cssClass="txaClass2"><c:out value='${detailVO.emailMsgCont}'/></textarea></td>
						</tr>
					</tbody>
				</table>
				<!-- //boardview-wrap -->
				<div class="btn_center">
					<a href="#" class="bc_blue" onclick="fnSave();"><span>등록</span></a>
					<a href="#" class="bc_white" onclick="fnList();"><span>취소</span></a>
					<a href="#" class="bc_line" onclick="fnList();"><span>목록</span></a>
				</div>
			</form>
		</div>
	</div>
	<!-- //subcon-wrap -->
</div>
<input type="hidden" name="current_menu_name_info" value="DetailViewAlmManage" />