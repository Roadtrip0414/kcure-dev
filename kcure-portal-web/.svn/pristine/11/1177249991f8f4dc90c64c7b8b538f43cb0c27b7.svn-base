<%
/* =================================================================
* @FileName : DetailViewKcnManage.jsp
* @date: 2023. 2. 7.
* @author : hjjeon
* @설명 : K-CURE 소식 상세(수정) 페이지
* =================================================================
* 수정일 작성자 내용
* -----------------------------------------------------------------------
* 2023. 2. 7. hjjeon 파일생성
* =================================================================
*/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>
<script src="/js/plugin/js.zip/jszip.min.js"></script>
<script src="/js/FileUpload.js"></script>
<script type="text/javascript">
var fu1;
var fu2;
$(document).ready(function() {
	//기본 첨부파일
	fu1 = FileUpload({
		uploadId: "boardUpload1",
		listIdUpload: "boardUpload1ListUpload",
		listIdDownload: "boardUpload1ListDownload",
		useDrop: true,
		maxNumberOfFiles: 5,
		maxSize: 10485760,
		renderHeader: (uploadId) => {
			return `
			<div id="` + uploadId + `Button" class="btn_upload" onclick="uploadButtonClick('` + uploadId + `')">파일 업로드하기</div>
			<input type="file" id="` + uploadId + `File" multiple />
			`;
		},
		renderUpload: (file, index, files) => {
			return `<a href="javascript:void(0)">` + file.name + `</a><a href="javascript:void(0)" class="del_btn cancel" data-index="` + index + `"></a>`;
		},
		renderDownload: (file, index, files) => {
			const { name, url, deleteUrl, oriName } = file;
			const htmlA = `<a href="##" onclick="fnFileDown('`+oriName+`','`+name+`','`+url+`');">` + oriName + `</a>`;
			const htmlButton = `<a class="del_btn delete" data-index="` + index + `" data-url="` + deleteUrl + `"></a>`;
			return htmlA + htmlButton;
		},
		onInvalid: ({ isSize, index, value, max, files }) => {
			let msg = "";
			if (isSize) {
				msg = "파일 크기: " + value.toLocaleString() + "가 최대 크기: " + max.toLocaleString() + "보다 큽니다.";
			} else {
				msg = "파일 갯수: " + value.toLocaleString() + "가 최대 갯수: " + max.toLocaleString() + "보다 큽니다.";
			}
			alert(msg);
		},
		onValid: () => {
		},
		onDelete: (e, url, index) => {
		},
	});

	//썸네일
	fu2 = FileUpload({
		uploadId: "boardUpload2",
		listIdUpload: "boardUpload2ListUpload",
		listIdDownload: "boardUpload2ListDownload",
		useDrop: true,
		maxNumberOfFiles: 1,
		maxSize: 10485760,
		renderHeader: (uploadId) => {
			return `
			<div id="` + uploadId + `Button" class="btn_upload" onclick="uploadButtonClick('` + uploadId + `')">파일 업로드하기</div>
			<input type="file" id="` + uploadId + `File" multiple />
			`;
		},
		renderUpload: (file, index, files) => {
			return `<a href="javascript:void(0)">` + file.name + `</a><a href="javascript:void(0)" class="del_btn cancel" data-index="` + index + `"></a>`;
		},
		renderDownload: (file, index, files) => {
			const { name, url, deleteUrl, oriName } = file;
			const htmlA = `<a href="##" onclick="fnFileDown('`+oriName+`','`+name+`','`+url+`');">` + oriName + `</a>`;
			const htmlButton = `<a class="del_btn delete" data-index="` + index + `" data-url="` + deleteUrl + `"></a>`;
			return htmlA + htmlButton;
		},
		onInvalid: ({ isSize, index, value, max, files }) => {
			let msg = "";
			if (isSize) {
				msg = "파일 크기: " + value.toLocaleString() + "가 최대 크기: " + max.toLocaleString() + "보다 큽니다.";
			} else {
				msg = "파일 갯수: " + value.toLocaleString() + "가 최대 갯수: " + max.toLocaleString() + "보다 큽니다.";
			}
			alert(msg);
		},
		onValid: () => {
		},
		onDelete: (e, url, index) => {
			$("#boardUpload2Img").attr("src", "/images/thumb_s.png");
		},
	});

	//첨부파일 조회
	const data = new FormData(document.srchForm);

	$.ajax({
		type:"POST",
		url: "/portal/file/getFileInfos.do",
		processData: false,
		contentType: false,
		dataType: "json",
		data,
		success: function(resp){

			if(resp.files.length > 0){
				var file01 = [];
				var file02 = [];

				for(var i=0; i <resp.files.length; i++){
					if(resp.files[i].tmbnlYn == "Y"){
						file02.push(resp.files[i]);
						$("#boardUpload2Img").show();
						$("#boardUpload2Img").attr("src", resp.files[i].url+resp.files[i].name);
					}else{
						file01.push(resp.files[i]);
					}
				}

				fu1.setFilesUploaded(file01);
				fu1.showUpload();
				fu1.showDownload();
				fu2.setFilesUploaded(file02);
				fu2.showUpload();
				fu2.showDownload();
				console.log(resp);
			}

		},
		err: function(err){
			console.log("err:", err);
		}
	});
});

function fnList(){
	$("input[name='nttId']").val("0");
	$("#srchForm").attr("action", "/portal/sys/bbs/kcn/viewKcnManage.do").submit();
}

//유효성 체크
function fnValidationChk(){
	var get_input = $("[class*=required]");
	var chk = true;

	$.each(get_input, function () {
		//console.log($(this).attr("type"));
		if($(this).attr("type") == "radio"){
			if(typeof $("input[name='"+$(this).attr("name")+"']:checked").val() == "undefined"){
				chk = false;
				alert( $(this).attr("title") + "을(를) 선택해주세요." );
				$(this).focus();
				return false;
			}
		}else if($(this).attr("type") == "text"){
			if($(this).val() == "" || $(this).val() == null){
				chk = false;
				alert( $(this).attr("title") + "을(를) 입력해주세요." );
				$(this).focus();
				return false;
			}
		}
	});

	return chk;
}

async function fnSave(){
	var chk = fnValidationChk();

	if(chk){
		//editor값
		CKEDITOR.instances.nttCn.updateElement();
		var nttCn = $("#nttCn").val();
		if(nttCn == "" || nttCn == null){
			alert("내용을 입력해주세요." );
			return false;
		}

		const files1 = fu1.getFilesAdded();
		const files2 = fu2.getFilesAdded();

		const data = new FormData(document.srchForm);
		if (files1.length > 1) {
			const zipFileName = "content.zip";
			const blob = await getZippedAsync(files1)
			const file = new File([blob], zipFileName, { type: "application/zip", lastModified: new Date().getTime() });
			data.append(zipFileName, file);
		} else {
			for (const file of files1) {
				data.append(file.name, file);
			}
		}

		for (const file of files2) {
			data.append("THUMB_"+file.name, file);
		}

		$.ajax({
			type:"POST",
			url: "/portal/sys/bbs/kcn/saveBbs.do",
			processData: false,
			contentType: false,
			dataType: "json",
			data,
			success: function(resp){
				console.log(resp);
				location.href = "/portal/sys/bbs/kcn/viewKcnManage.do";
			},
			err: function(err){
				console.log("err:", err);
			}
		});
	}
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
					<input type="hidden" id="atchFileId" name="atchFileId" value="<c:out value='${bbsVO.atchFileId}'/>"/>
					<input type="hidden" id="baseUrl" name="baseUrl" value=""/>
					<input type="hidden" id="url" name="url" value=""/>
					<input type="hidden" id="nasFileName" name="nasFileName" value=""/>
					<input type="hidden" id="oriName" name="oriName" value=""/>
				</form>
				<form id="srchForm" name="srchForm" enctype="multipart/form-data" method="post">
					<input type="hidden" name="bbsId" value="<c:out value='${bbsVO.bbsId}'/>"/>
					<input type="hidden" name="nttId" value="<c:out value='${bbsVO.nttId}'/>"/>
					<input type="hidden" name="atchFileId" value="<c:out value='${bbsVO.atchFileId}'/>"/>
					<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>">

					<table class="left_talbe">
						<tbody>
							<tr>
								<th>제목<span class="must">*</span></th>
								<td colspan="3"><input type="text" class="required" name="nttSj" maxlength="200" title="제목" value="<c:out value="${bbsVO.nttSj}"/>"/></td>
							</tr>
							<tr>
								<th>게시여부<span class="must">*</span></th>
								<td>
									<div class="radio_wrap">
										<label>
											<input type="radio" name="useAt" value="Y" title="게시여부" class="frmChk true required" data-gtm-form-interact-field-id="2" <c:if test="${bbsVO.useAt == 'Y'}"> checked="checked" </c:if>>
											<span class="radio_mark"></span><span>게시</span>
										</label>
										<label>
											<input type="radio" name="useAt" value="N" title="게시여부" class="frmChk false required" data-gtm-form-interact-field-id="1" <c:if test="${bbsVO.useAt == 'N'}"> checked="checked" </c:if>>
											<span class="radio_mark"></span><span>미게시</span>
										</label>
									</div>
								</td>
								<th></th>
								<td></td>
							</tr>
							<tr>
								<th>썸네일</th>
								<td colspan="3">
									<div class="choice_wrap">
										<img id="boardUpload2Img" src="/images/thumb_s.png" style="width: 150px;" onerror="this.src='/images/thumb_l.png'"/>
										<label for="file">
											<div id="boardUpload2"></div>
										</label>
										<div class="file_list list upload" id="boardUpload2ListUpload"></div>
										<div class="file_list list download" id="boardUpload2ListDownload"></div>
									</div>
								</td>
							</tr>
							<tr>
								<th>첨부파일</th>
								<td colspan="3">
									<div class="choice_wrap">
										<label for="file">
											<div id="boardUpload1"></div>
										</label>
										<div class="file_list list upload" id="boardUpload1ListUpload"></div>
										<div class="file_list list download" id="boardUpload1ListDownload"></div>
<!-- 										<label>Zip파일로 UPLOAD <input type="checkbox" id="uploadZipped" /></label> -->
									</div>
								</td>
							</tr>
							<tr>
								<th>내용<span class="must">*</span></th>
								<td colspan="3">
									<div class="grid_area_wrap">
										<textarea id="nttCn" name="nttCn" rows="150" cols="14" cssClass="txaClass2" ><c:out value='${bbsVO.nttCn}'/></textarea>
										<ckeditor:replace replace="nttCn" basePath="/js/plugin/ckeditor" />
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