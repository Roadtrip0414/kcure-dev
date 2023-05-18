<%
/* =================================================================
* @FileName : DetailViewQnaManage.jsp
* @date: 2023. 3. 7.
* @author : hjjeon
* @설명 : 공지사항 상세(수정) 페이지
* =================================================================
* 수정일 작성자 내용
* -----------------------------------------------------------------------
* 2023. 3. 7. hjjeon 파일생성
* =================================================================
*/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>
<script type="text/javascript">
$(document).ready(function() {
	const data = new FormData(document.srchForm);

	$.ajax({
		type:"POST",
		url: "/portal/file/getFileInfos.do",
		processData: false,
		contentType: false,
		dataType: "json",
		data,
		success: function(resp){
// 			console.log(resp.files);
			if(resp.files.length > 0){
				var html = "";
				for(var i=0; i <resp.files.length; i++){
					var fileObj = resp.files[i];
					html += "<p class=\"hwp_file\">";
					html += "<a href=\"##\" onclick=\"fnFileDown('"+fileObj.oriName+"','"+fileObj.name+"','"+fileObj.url+"');\">"
					html += fileObj.oriName + " (" + (fileObj.fileSize/1024).toFixed(1) + "MB)";
					html += "</a>";
					html += "</p>";
				}
				$(".doc_file").html(html);

			}else{
				$(".doc_file").html("첨부파일이 없습니다.");
			}
		},
		err: function(err){
			console.log("err:", err);
		}
	});
});

function fnList(){
	$("#srchForm").attr("action", "/portal/sys/bbs/qna/viewQnaManage.do").submit();
}

function fnSave(){

	var ansCont = $("#ansCont").val();
	if(ansCont == "" || ansCont == null){
		alert("내용을 입력해주세요." );
		return false;
	}

	var ansSeq = $("input[name='ansSeq']").val();
	if(ansSeq == "" || ansSeq == null){
		$("input[name='ansSeq']").val(0);
	}


	var val = $("#srchForm").serialize();

	$.ajax({
		url : "<c:url value='/portal/sys/bbs/qna/saveQnaAns.do'/>",
		type : "POST",
		data : val,
		dataType : 'json',
		success : function(data) {
			location.href = "/portal/sys/bbs/qna/viewQnaManage.do"
		},
		error : function() {
			alert("저장 실패 하였습니다.");
		}
	});
}

function fnFileDown(oriNm, nasFileNm, url){
	$('#filedownFrm #baseUrl').val(document.location.pathname);
	$('#filedownFrm #url').val(url);
	$('#filedownFrm #nasFileName').val(nasFileNm);
	$('#filedownFrm #oriName').val(oriNm);
    $('#filedownFrm').attr("action", "/portal/file/fileDown.do");
    $('#filedownFrm').submit();
}
</script>
<div class="wrap">
	<div class="con">
		<div class="area_wrap">
			<div class="section">
				<form id="filedownFrm" name="filedownFrm" method="post">
					<input type="hidden" id="atchFileId" name="atchFileId" value="<c:out value='${qnaQstnVO.attfId}'/>"/>
					<input type="hidden" id="baseUrl" name="baseUrl" value=""/>
					<input type="hidden" id="url" name="url" value=""/>
					<input type="hidden" id="nasFileName" name="nasFileName" value=""/>
					<input type="hidden" id="oriName" name="oriName" value=""/>
				</form>
				<form id="srchForm" name="srchForm" method="post">
					<input type="hidden" name="qstnId" value="${qnaQstnVO.qstnId}"/>
					<input type="hidden" name="ansSeq" value="${qnaQstnVO.ansSeq}"/>
					<input type="hidden" name="atchFileId" value="<c:out value='${qnaQstnVO.attfId}'/>"/>
					<table class="left_talbe">
						<tbody>
							<tr>
								<th>문의자</th>
								<td colspan="3"><c:out value="${qnaQstnVO.frstRegpNm}"/></td>
							</tr>
							<c:if test="${qnaQstnVO.instGnrSpcd == '02'}">
								<tr>
									<th>참여기관</th>
									<td colspan="3"><c:out value="${qnaQstnVO.prtiNm}"/></td>
								</tr>
							</c:if>
							<tr>
								<th>연락처</th>
								<td colspan="3"><c:out value="${qnaQstnVO.userMbphNo}"/></td>
							</tr>
							<tr>
								<th>이메일</th>
								<td colspan="3"><c:out value="${qnaQstnVO.frstRegpId}"/></td>
							</tr>
							<tr>
								<th>구분</th>
								<td colspan="3"><c:out value="${qnaQstnVO.qstnClsSpcdNm}"/></td>
							</tr>
							<tr>
								<th>작성일</th>
								<td colspan="3"><c:out value="${qnaQstnVO.frstRgstDt}"/></td>
							</tr>
							<tr>
								<th>답변등록일</th>
								<td colspan="3"><c:out value="${qnaQstnVO.ansDt}"/></td>
							</tr>
							<tr>
								<th>상태</th>
								<td colspan="3"><c:out value="${qnaQstnVO.qstnDlnStcdNm}"/></td>
							</tr>
							<tr>
								<th>제목</th>
								<td colspan="3"><c:out value="${qnaQstnVO.qstnTtlNm}"/></td>
							</tr>
							<tr>
								<th>문의</th>
								<td colspan="3"><pre><c:out value="${qnaQstnVO.qstnCont}"/></pre></td>
							</tr>
							<tr>
								<th>첨부파일</th>
								<td>
									<div class="doc_file"></div>
								</td>
							</tr>
							<tr>
								<th>답변<span class="must">*</span></th>
								<td colspan="3">
									<textarea id="ansCont" name="ansCont" rows="15" cols="180" cssClass="txaClass2" maxlength="3000"><c:out value='${qnaQstnVO.ansCont}'/></textarea>
								</td>
							</tr>
						</tbody>
					</table>
				</form>
					<div class="btn_center">
						<a href="#" class="bc_blue" onclick="fnSave();"><span>답변하기</span></a>
						<a href="#" class="bc_line" onclick="fnList();"><span>목록</span></a>
					</div>
			</div>
			<!-- //subcon-wrap -->
		</div>
	</div>
</div>