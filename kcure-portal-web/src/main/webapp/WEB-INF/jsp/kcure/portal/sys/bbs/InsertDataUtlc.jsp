<%
/* =================================================================
* @FileName : InsertDataUtlc.jsp
* @date: 2023. 2. 7.
* @author : hjjeon
* @설명 : 데이터 활용사례 등록 페이지
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
		if($(this).attr("type") == "radio"){
			if(typeof $("input[name='"+$(this).attr("name")+"']:checked").val() == "undefined"){
				chk = false;
				alert( $(this).attr("title") + "을(를) 선택해주세요." );
				$(this).focus();
				return false;
			}
		}else{
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

//목록 이동
function fnList(){
	$("#srchForm").attr("action", "/portal/sys/bbs/dur/viewDataUtlc.do").submit();
}

//저장
function fnSave(){
	//필수체크
	var chk = fnValidationChk();


	if(chk){
		//기관리스트 체크
		var instList = $("#instList a");

		var rsrInstId = "";
		var rsrInstNm = "";
		if(instList.length > 0){
			$.each(instList, function(){
				rsrInstId += $(this).attr("id") + ",";
				rsrInstNm += $(this).text() + ",";
			});

			chk = true;
		}else{
			//기타 값 확인
			if($("input[name='rsrInstNmEtc']").val() == "" || $("input[name='rsrInstNmEtc']").val() == null){
				alert("연구 기관을 선택해주세요.");
				chk = false;
				return;
			}
		}

		if($("input[name='rsrInstNmEtc']").val() != "" && $("input[name='rsrInstNmEtc']").val() != null){
			rsrInstId += "9999";
			rsrInstNm += $("input[name='rsrInstNmEtc']").val();
		}

		$("input[name='rsrInstId']").val(rsrInstId);
		$("input[name='rsrInstNm']").val(rsrInstNm);

		if(chk){
			const files = [...fu1.getFilesAdded()];

// 			const uploadZipped = $("#uploadZipped").prop("checked");
			if (files.length > 1) {
				const zipFileName = "content.zip";
				getZippedAsync(files).then(blob => {
					const file = new File([blob], zipFileName, { type: "application/zip", lastModified: new Date().getTime() });
					const data = new FormData(document.srchForm);
					data.append(zipFileName, file);

					$.ajax({
						type:"POST",
						url: "/portal/sys/bbs/dur/saveDataUtlc.do",
						processData: false,
						contentType: false,
						dataType: "json",
						data,
						success: function(resp){
							console.log(resp);
							location.href = "/portal/sys/bbs/dur/viewDataUtlc.do";
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
					url: "/portal/sys/bbs/dur/saveDataUtlc.do",
					processData: false,
					contentType: false,
					dataType: "json",
					data,
					success: function(resp){
						console.log(resp);
						location.href = "/portal/sys/bbs/dur/viewDataUtlc.do";
					},
					err: function(err){
						console.log("err:", err);
					}
				});
			}
		}
	}
}

//팝업
function fnInstPopup(){
	window.open("<c:url value='/portal/sys/bbs/dur/instPopup.do'/>","기관조회","scrollbars=no,resizable=no");
}

function fnInstDel(obj){
	$("#instList a").remove("#"+obj);
}
</script>
<div class="wrap">
	<div class="con">
		<div class="area_wrap">
			<div class="section">
				<form id="srchForm" name="srchForm" enctype="multipart/form-data" method="post">
					<input type="hidden" name="rsrInstId" />
					<input type="hidden" name="rsrInstNm" />
					<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>">

					<table class="left_talbe">
						<tbody>
							<tr>
								<th>제목<span class="must">*</span></th>
								<td colspan="3"><input type="text" class="required" name="rsrSbjNm" maxlength="200" title="제목"/></td>
							</tr>
							<tr>
								<th>게시여부<span class="must">*</span></th>
								<td colspan="3">
									<div class="radio_wrap">
										<label>
											<input type="radio" name="viewYn" value="Y" title="게시여부" class="frmChk true required" data-gtm-form-interact-field-id="2">
											<span class="radio_mark"></span><span>게시</span>
										</label>
										<label>
											<input type="radio" name="viewYn" value="N" title="게시여부" class="frmChk false required" data-gtm-form-interact-field-id="1">
											<span class="radio_mark"></span><span>미게시</span>
										</label>
									</div>
								</td>
							</tr>
							<tr>
								<th>연구구분<span class="must">*</span></th>
								<td colspan="3">
									<kcure:select id="rsrSpcd" name="rsrSpcd" grpCd="RSR_SPCD" defaultText="선택" attributes=" class=\"required\"  title=\"연구구분\" style=\"width:500px;!important;\" "/>
								</td>
							</tr>
							<tr>
								<th>연구자료 다운로드 제한여부</th>
								<td colspan="3">
									<div class="radio_wrap">
										<label>
											<input type="radio" name="rsdUnldLmtYn" value="N" class="frmChk false" data-gtm-form-interact-field-id="2"/>
											<span class="radio_mark"></span><span>아니요</span>
										</label>
										<label>
											<input type="radio" name="rsdUnldLmtYn" value="Y" class="frmChk true" data-gtm-form-interact-field-id="1" checked/>
											<span class="radio_mark"></span><span>예</span>
											<div class="radio_sel_int">
												<input type="text" name="rsdUnldLmtYcnt" maxlength="3" value="2"/>
												<p>년 경과 후 다운로드 가능(진행연도 기준)</p>
											</div>
										</label>
									</div>
								</td>
							</tr>

							<tr>
								<th>진행연도<span class="must">*</span></th>
								<td colspan="3">
									<c:set var="now" value="<%=new java.util.Date()%>" />
									<c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy" /></c:set>
									<select class="required" name="rsrProgYr" style="width:500px;!important;">
										<c:forEach var="year" begin="${sysYear-1}" end="${sysYear}">
											<option value="${year}" <c:if test="${year == sysYear}"> selected='selected'</c:if>>${year}</option>
										</c:forEach>
									</select>
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
									</div>
								</td>
							</tr>
							<tr>
								<th>연구방법<span class="must">*</span></th>
								<td>
									<kcure:select id="rsrMtcd" name="rsrMtcd" grpCd="RSR_MTCD" defaultText="선택" attributes=" class=\"required\"  title=\"연구방법\" style=\"width:500px;!important;\" "/>
								</td>
							</tr>
							<tr>
								<th>연구 수행기관<span class="must">*</span></th>
								<td colspan="3">
									<div class="table_area">
										<div class="choice_wrap" id="instList">
											<label onclick="fnInstPopup();">
												<div class="btn_upload">기관조회</div>
											</label>
										</div>
										<div class="etc_int">
											<p>기타</p>
											<input type="text" class="ad_input" name="rsrInstNmEtc" maxlength="20" />
										</div>
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
		</div>
	</div>
	<!-- //subcon-wrap -->
</div>