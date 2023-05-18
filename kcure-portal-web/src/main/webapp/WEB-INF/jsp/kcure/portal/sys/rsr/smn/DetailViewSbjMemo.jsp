<%
/* =================================================================
* @FileName : DetailViewSbjMemo.jsp
* @date: 2023. 3. 30.
* @author : hjjeon
* @설명 :
* =================================================================
* 수정일 작성자 내용
* -----------------------------------------------------------------------
* 2023. 3. 30. hjjeon 파일생성
* =================================================================
*/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>
<script type="text/javascript">
//목록 이동
function fnList(){
	$("#srchFrm").attr("action", "/portal/sys/rsr/smn/viewSbjMemo.do").submit();
}

function fnSave(){
	var val = $("#srchFrm").serialize();

	$.ajax({
		url : "<c:url value='/portal/sys/rsr/smn/saveSbjMeno.do'/>",
		type : "POST",
		data : val,
		dataType : 'json',
		success : function(data) {
			location.href = "/portal/sys/rsr/smn/viewSbjMemo.do"
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
			<form id="srchFrm" name="srchFrm" method="post">
				<input type="hidden" name="dataAplcNo" value="<c:out value='${searchVO.dataAplcNo}'/>"/>
				<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>">

				<table class="left_talbe">
					<tbody>
						<tr>
							<th>연구명</th>
							<td><c:out value='${detailVO.rsrSbjNm}'/></td>
						</tr>
						<tr>
							<th>연구기간</th>
							<td><c:out value='${detailVO.rsrSdt}'/> ~ <c:out value='${detailVO.rsrEdt}'/></td>
						</tr>
						<tr>
							<th>메모</th>
							<td>
								<textarea rows="15" cols="180" name="memoCont" cssClass="txaClass2" maxlength="4000"><c:out value='${detailVO.memoCont}'/></textarea>
							</td>
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
<input type="hidden" name="current_menu_name_info" value="DetailViewSbjMemo" />