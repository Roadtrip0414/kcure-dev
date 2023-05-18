<%
/* =================================================================
* @FileName : DetailViewFaqManage.jsp
* @date: 2023. 2. 7.
* @author : hjjeon
* @설명 : FAQ 상세(수정) 페이지
* =================================================================
* 수정일 작성자 내용
* -----------------------------------------------------------------------
* 2023. 2. 7. hjjeon 파일생성
* =================================================================
*/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>
<script type="text/javascript">
function fnList(){
	$("input[name='nttId']").val("0");
	$("#srchForm").attr("action", "/portal/sys/bbs/faq/viewFaqManage.do").submit();
}

//유효성 체크
function fnValidationChk(){
	var get_input = $("[class*=required]");
	var chk = true;

	$.each(get_input, function () {
		if($(this).val() == "" || $(this).val() == null){
			chk = false;
			alert( $(this).attr("title") + "을 입력해주세요." );
			$(this).focus();
			return false;
		}
	});

	return chk;
}

function fnSave(){
	var chk = fnValidationChk();

	if(chk){
		//게시여부
		if(typeof $("input[name='useAt']:checked").val() == "undefined"){
			alert("게시여부를 선택해주세요.");
			$(":input:radio[name='useAt']").eq(0).focus();
			return false;
		}

		var nttSeCode = $("#nttSeCode").val();
		if(nttSeCode =="" || nttSeCode == null){
			alert("카테고리를 선택해주세요.");
			$("#nttSeCode").focus();
			return false;
		}

		//editor값
		var nttCn = $("#nttCn").val();
		if(nttCn == "" || nttCn == null){
			alert("답변을 입력해주세요." );
			return false;
		}

		var val = $("#srchForm").serialize();

		$.ajax({
			url : "<c:url value='/portal/sys/bbs/faq/saveBbs.do'/>",
			type : "POST",
			data : val,
			dataType : 'json',
			success : function(data) {
				location.href = "/portal/sys/bbs/faq/viewFaqManage.do"
			},
			error : function() {
				alert("저장 실패 하였습니다.");
			}
		});
	}
}

function fnDel(){
	var val = $("#srchForm input").serialize();

	$.ajax({
		url : "<c:url value='/portal/sys/bbs/faq/deleteBbs.do'/>",
		type : "POST",
		data : val,
		dataType : 'json',
		success : function(data) {
			location.href = "/portal/sys/bbs/faq/viewFaqManage.do"
		},
		error : function() {
			alert("삭제 실패 하였습니다.");
		}
	});
}
</script>
<div class="wrap">
	<div class="con">
		<div class="area_wrap">
			<div class="section">
				<form id="srchForm" name="srchForm" enctype="multipart/form-data" method="post">
<%-- 					<input type="hidden" name="bbsId" value="<c:out value='${bbsVO.bbsId}'/>"/> --%>
					<input type="hidden" name="nttId" value="<c:out value='${bbsVO.nttId}'/>"/>
					<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>">

					<table class="left_talbe">
						<tbody>
							<tr>
								<th>제목<span class="must">*</span></th>
								<td colspan="3"><input type="text" class="required" name="nttSj" maxlength="200" title="제목" value="<c:out value="${bbsVO.nttSj}"/>"/></td>
							</tr>
							<tr>
								<th>일반기관구분<span class="must">*</span></th>
								<td>
									<div class="radio_wrap">
										<label>
											<input type="radio" name="" value="" title="일반기관구분" class="frmChk true" disabled="disabled" data-gtm-form-interact-field-id="2" <c:if test="${bbsVO.bbsId == 'BBSMSTR_000000000002'}"> checked="checked" </c:if>>
											<span class="radio_mark"></span><span>일반</span>
										</label>
										<label>
											<input type="radio" name="" value="" title="일반기관구분" class="frmChk false" disabled="disabled" data-gtm-form-interact-field-id="1" <c:if test="${bbsVO.bbsId == 'BBSMSTR_000000000005'}"> checked="checked" </c:if>>
											<span class="radio_mark"></span><span>기관</span>
										</label>
										<input type="hidden" name="bbsId" value="${bbsVO.bbsId}"/>
									</div>
								</td>
							</tr>
							<tr>
								<th>게시여부<span class="must">*</span></th>
								<td>
									<div class="radio_wrap">
										<label>
											<input type="radio" name="useAt" value="Y" class="frmChk true" data-gtm-form-interact-field-id="2" <c:if test="${bbsVO.useAt == 'Y'}"> checked="checked" </c:if>>
											<span class="radio_mark"></span><span>게시</span>
										</label>
										<label>
											<input type="radio" name="useAt" value="N" class="frmChk false" data-gtm-form-interact-field-id="1" <c:if test="${bbsVO.useAt == 'N'}"> checked="checked" </c:if>>
											<span class="radio_mark"></span><span>미게시</span>
										</label>
									</div>
								</td>
								<th></th>
								<td></td>
							</tr>
							<tr>
								<th>카테고리<span class="must">*</span></th>
								<td>
									<kcure:select id="nttSeCode" name="nttSeCode" grpCd="NTT_SE_CODE" defaultText="선택" attributes=" title=\"카테고리\" " selected="${bbsVO.nttSeCode}"/>
								</td>
							</tr>
							<tr>
								<th>답변<span class="must">*</span></th>
								<td colspan="3">
									<div class="grid_area_wrap">
										<textarea id="nttCn" name="nttCn" rows="15" cols="180" cssClass="txaClass2" maxlength="3000"><c:out value='${bbsVO.nttCn}'/></textarea>
									</div>
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
			<!-- //subcon-wrap -->
		</div>
	</div>
</div>