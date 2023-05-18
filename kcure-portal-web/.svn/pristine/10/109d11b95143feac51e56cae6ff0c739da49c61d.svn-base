<%
/* =================================================================
* @FileName : DetailViewKcn.jsp
* @date: 2023. 3. 15.
* @author : hjjeon
* @설명 : K-CURE 소식
* =================================================================
* 수정일 작성자 내용
* -----------------------------------------------------------------------
* 2023. 3. 15. hjjeon 파일생성
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
			console.log(resp.files);
			if(resp.files.length > 0){
				var html = "";
				for(var i=0; i <resp.files.length; i++){
					var fileObj = resp.files[i];
					if(fileObj.tmbnlYn == "N"){
						html += "<p class=\"hwp_file\">";
						html += "<a href=\"##\" onclick=\"fnFileDown('"+fileObj.oriName+"','"+fileObj.name+"','"+fileObj.url+"');\">"
						html += fileObj.oriName + " (" + (fileObj.fileSize/1024).toFixed(1) + "MB)";
						html += "</a>";
						html += "</p>";
					}
				}
				if(html.length > 0){
					$(".doc_file").html(html);
				}else{
					$(".doc_file").html("첨부파일이 없습니다.");
				}
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
	$("input[name='nttId']").val("0");
	$("#srchForm").attr("action", "/portal/bbs/kcn/viewKcn.do").submit();
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
	<div class="sub_visual_wrap">
		<div class="notice">
			<ul>
				<li>K-CURE 소식</li>
			</ul>
		</div>
	</div>
	<div class="notice_view_wrap">
		<div class="con">
			<form id="filedownFrm" name="filedownFrm" method="post">
				<input type="hidden" id="atchFileId" name="atchFileId" value="<c:out value='${result.atchFileId}'/>"/>
				<input type="hidden" id="baseUrl" name="baseUrl" value=""/>
				<input type="hidden" id="url" name="url" value=""/>
				<input type="hidden" id="nasFileName" name="nasFileName" value=""/>
				<input type="hidden" id="oriName" name="oriName" value=""/>
			</form>
			<form id="srchForm" name="srchForm" method="post">
				<input type="hidden" name="bbsId" value="<c:out value='${result.bbsId}'/>"/>
				<input type="hidden" name="nttId" value="<c:out value='${result.nttId}'/>"/>
				<input type="hidden" name="atchFileId" value="<c:out value='${result.atchFileId}'/>"/>
				<input type="hidden" name="pageIndex" value="${kcnVO.pageIndex}"/>
				
				<input type="hidden" name="searchCondition" value="${searchVO.searchCondition}"/>
				<input type="hidden" name="searchKeyword" value="${searchVO.searchKeyword}"/>
				<div class="tbl_inn">
				<table class="user_tb_l">
					<colgroup>
						<col style="width:16%;">
						<col style="width:auto;">
					</colgroup>
					<tbody>
						<tr>
							<th>제목</th>
							<td><c:out value="${result.nttSj}"/></td>
						</tr>
						<tr>
							<th>작성자</th>
							<td><c:out value="${result.ntcrNm}"/></td>
						</tr>
						<tr>
							<th>등록일</th>
							<td><c:out value="${result.frstRegistPnttm}"/></td>
						</tr>
						<tr>
							<th>파일첨부</th>
							<td>
								<div class="doc_file"></div>
							</td>
						</tr>
					</tbody>
				</table>
				</div>
				<div class="txt_inn">
					<p><c:out value="${result.nttCn}"  escapeXml="false"/></p>
				</div>
				<div class="n_btn_inn">
					<a href="#" class="bc_b_line l_btn" onclick="fnList();">목록</a>
				</div>
			</form>
		</div>
	</div>
</div>