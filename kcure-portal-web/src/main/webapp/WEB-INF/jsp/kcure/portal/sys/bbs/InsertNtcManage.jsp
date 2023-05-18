<%
/* =================================================================
* @FileName : InsertNtcManage.jsp
* @date: 2023. 2. 7.
* @author : hjjeon
* @설명 : 공지사항 등록 페이지
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

$(document).ready(function() {
	fu1 = FileUpload({
		uploadId: "boardUpload1",
		listIdUpload: "boardUpload1ListUpload",
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
	});
});

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

function fnList(){
	$("#srchForm").attr("action", "/portal/sys/bbs/ntc/viewNtcManage.do").submit();
}

function fnSave(){
	var chk = fnValidationChk();

	if(chk){
		CKEDITOR.instances.nttCn.updateElement();
		var nttCn = $("#nttCn").val();
		if(nttCn == "" || nttCn == null){
			alert("내용을 입력해주세요." );
			return false;
		}

		const files = [...fu1.getFilesAdded()];

// 		console.log(files.length);
// 		const uploadZipped = $("#uploadZipped").prop("checked");
		if (files.length > 1) {
			const zipFileName = "content.zip";
			getZippedAsync(files).then(blob => {
				const file = new File([blob], zipFileName, { type: "application/zip", lastModified: new Date().getTime() });
				const data = new FormData(document.srchForm);
				data.append(zipFileName, file);

				$.ajax({
					type:"POST",
					url: "/portal/sys/bbs/ntc/saveBbs.do",
					processData: false,
					contentType: false,
					dataType: "json",
					data,
					success: function(resp){
						console.log(resp);
						location.href = "/portal/sys/bbs/ntc/viewNtcManage.do";
					},
					err: function(err){
						console.log("err:", err);
					}
				});
			})
		} else {
			const data = new FormData(document.srchForm);

			for (const file of files) {
				data.append(file.name, file);
			}

			$.ajax({
				type:"POST",
				url: "/portal/sys/bbs/ntc/saveBbs.do",
				processData: false,
				contentType: false,
				dataType: "json",
				data,
				success: function(resp){
					console.log(resp);
					location.href = "/portal/sys/bbs/ntc/viewNtcManage.do";
				},
				err: function(err){
					console.log("err:", err);
				}
			});
		}
	}
}



</script>
<div class="wrap">
	<div class="con">
		<div class="section">
			<form id="srchForm" name="srchForm" enctype="multipart/form-data" method="post">
				<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>">
				<table class="left_talbe">
					<tbody>
						<tr>
							<th>제목<span class="must">*</span></th>
							<td colspan="999"><input type="text" class="required" name="nttSj" maxlength="200" title="제목"/></td>
						</tr>
						<tr>
							<th>일반기관구분<span class="must">*</span></th>
							<td>
								<div class="radio_wrap">
									<label>
										<input type="radio" name="bbsId" value="BBSMSTR_000000000001" title="일반기관구분" class="frmChk true required" data-gtm-form-interact-field-id="2">
										<span class="radio_mark"></span><span>일반</span>
									</label>
									<label>
										<input type="radio" name="bbsId" value="BBSMSTR_000000000004" title="일반기관구분" class="frmChk false required" data-gtm-form-interact-field-id="1">
										<span class="radio_mark"></span><span>기관</span>
									</label>
								</div>
							</td>
						</tr>
						<tr>
							<th>게시여부<span class="must">*</span></th>
							<td>
								<div class="radio_wrap">
									<label>
										<input type="radio" name="useAt" value="Y" title="게시여부" class="frmChk true required" data-gtm-form-interact-field-id="2">
										<span class="radio_mark"></span><span>게시</span>
									</label>
									<label>
										<input type="radio" name="useAt" value="N" title="게시여부" class="frmChk false required" data-gtm-form-interact-field-id="1">
										<span class="radio_mark"></span><span>미게시</span>
									</label>
								</div>
							</td>
						</tr>
						<tr>
							<th>고정여부<span class="must">*</span></th>
							<td>
								<div class="radio_wrap">
									<label>
										<input type="radio" name="noticeAt" value="N" title="고정여부" class="frmChk true required" data-gtm-form-interact-field-id="2">
										<span class="radio_mark"></span><span>일반</span>
									</label>
									<label>
										<input type="radio" name="noticeAt" value="Y" title="고정여부" class="frmChk false required" data-gtm-form-interact-field-id="1">
										<span class="radio_mark"></span><span>TOP</span>
									</label>
								</div>
							</td>
						</tr>
						<tr>
							<th>첨부파일</th>
							<td colspan="999">
								<div class="choice_wrap">
									<label for="file">
										<div id="boardUpload1"></div>
									</label>
									<div class="file_list list upload" id="boardUpload1ListUpload"></div>
								</div>
							</td>
						</tr>
						<tr>
							<th>내용<span class="must">*</span></th>
							<td colspan="999">
								<div class="grid_area_wrap">
									<textarea id="nttCn" name="nttCn" rows="150" cols="14" cssClass="txaClass2" ></textarea>
									<ckeditor:replace replace="nttCn" basePath="/js/plugin/ckeditor" />
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
			<div class="btn_center">
				<!-- class | f_blue 블루 | bc_black 검정 | bc_white 화이트 | bc_line 블루라인 -->
				<a href="javascript:void(0)" class="bc_blue" onclick="fnSave();">등록</a>
				<a href="javascript:void(0)" class="bc_white" onclick="fnList();">취소</a>
				<a href="javascript:void(0)" class="bc_line" onclick="fnList();">목록</a>
			</div>
		</div>
		<!-- //subcon-wrap -->
	</div>
</div>