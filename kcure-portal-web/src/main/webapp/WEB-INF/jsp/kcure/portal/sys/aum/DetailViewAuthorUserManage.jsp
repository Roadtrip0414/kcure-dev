<%
/* =================================================================
* @FileName : DetailViewAuthorUserManage.jsp
* @date: 2023. 4. 3.
* @author : hjjeon
* @설명 : 사용자별 권한 관리 상세 화면
* =================================================================
* 수정일 작성자 내용
* -----------------------------------------------------------------------
* 2023. 4. 3. hjjeon 파일생성
* =================================================================
*/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>
<script type="text/javascript">
//목록 이동
function fnList(){
	$("#srchForm").attr("action", "/portal/sys/aum/usr/viewAuthorUserManage.do").submit();
}

//저장
function fnSave(){
	var authId = [];
	$('input:checkbox[name=authId]').each(function (index) {
		if($(this).is(":checked")==true){
	    	authId.push($(this).val());
	    }
	});

	$("input[name='authIdArr']").val(authId);

	var val = $("#srchForm").serialize();

	$.ajax({
		url : "<c:url value='/portal/sys/aum/usr/saveAuthorUser.do'/>",
		type : "POST",
		data : val,
		dataType : 'json',
		success : function(data) {
			$("#srchForm").attr("action", "/portal/sys/aum/usr/viewAuthorUserManage.do").submit();
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
				<input type="hidden" name="authIdArr" />
				<input type="hidden" name="userId" value="<c:out value='${detailVO.userId}'/>">
				<input type="hidden" name="curPageIndex" value="<c:out value='${searchVO.curPageIndex}'/>">
				
				<table class="left_talbe">
					<tbody>
						<tr>
							<th>사용자ID</th>
							<td><c:out value='${detailVO.userId}'/></td>
						</tr>
						<tr>
							<th>사용자명</th>
							<td><c:out value='${detailVO.userNm}'/></td>
						</tr>
						<tr>
							<th>권한</th>
							<td>
								<div style="display: flex;flex-direction: column;grid-gap: 10px;">
									<c:forEach items="${allAuthList}" var="list" varStatus="status">
									<c:if test="${list.authId != 'AU002' }">
										<label class="n_checkbox_s">
											<input type="checkbox" name="authId" value="${list.authId}" <c:if test="${fn:indexOf(detailVO.authId, list.authId) > -1}"> checked="checked" </c:if>/>
											<span><span class="check_img"></span>${list.authNm}</span>
										</label>
										</c:if>
									</c:forEach>
								</div>
							</td>
						</tr>
						<tr>
							<th>변경사유</th>
							<td>
								<textarea name="statChanRsnCont" cssClass="txaClass2" maxlength="4000"></textarea>
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
<input type="hidden" name="current_menu_name_info" value="DetailViewAuthorUserManage" />