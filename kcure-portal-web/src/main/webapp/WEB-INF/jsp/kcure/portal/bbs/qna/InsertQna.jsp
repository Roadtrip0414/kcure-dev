<%
/* =================================================================
* @FileName : InsertQna.jsp
* @date: 2023. 3. 14.
* @author : hjjeon
* @설명 : 문의하기 등록 화면
* =================================================================
* 수정일 작성자 내용
* -----------------------------------------------------------------------
* 2023. 3. 14. hjjeon 파일생성
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
			<div id="` + uploadId + `Button" class="btn_upload" onclick="uploadButtonClick('` + uploadId + `')">파일찾기</div>
			<input type="file" id="` + uploadId + `File" multiple />
			`;
		},
		renderUpload: (file, index, files) => {
			return `
			<ul class="type_04">
			<li class="txt hwp_file">` + file.name + `</li>
			<li class="del_btn"><a href="javascript:void(0)" class="cancel" data-index="` + index + `">제거</a></li>
			</ul>
			`;
		},
		onInvalid: ({ isSize, index, value, max, files }) => {
			let msg = "";
			if (isSize) {
				//msg = "파일 크기: " + value.toLocaleString() + "가 최대 크기: " + max.toLocaleString() + "보다 큽니다.";
				msg = "파일 크기가 허용범위(10MB)를 넘었습니다.";
			} else {
				msg = "파일 갯수: " + value.toLocaleString() + "가 최대 갯수: " + max.toLocaleString() + "보다 큽니다.";
			}
			alert(msg);
		},
		onValid: () => {
		},
	});

	$("input[name='qstnOpnYn']").change(function(){
		if($(this).val() == "N"){
			$("input[name='wtrPswd']").addClass("required");
			$("#passwordDiv").show();
		}else{
			$("input[name='wtrPswd']").removeClass("required");
			$("input[name='wtrPswd']").val("");
			$("#passwordDiv").hide();
		}
	});

	$("input[name='wtrPswd']").on("keyup", function(){
		if(isNaN($(this).val())){
			$(this).val("");
			alert("숫자만 입력가능합니다.");
			return;
		}
	});
});

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

function fnList(){
	$("#insertFrm").attr("action", "/portal/bbs/qna/viewQna.do").submit();
}

function fnSave(){
	var chk = fnValidationChk();

	if(chk){
		if(typeof $("input[name='qstnOpnYn']:checked").val() == "undefined"){
			alert("공개 여부를 선택해주세요." );
			return false;
		}

		const files = [...fu1.getFilesAdded()];

		const data = new FormData(document.insertFrm);

		for (const file of files) {
			data.append(file.name, file);
		}

		$.ajax({
			type:"POST",
			url: "/portal/bbs/qna/saveQna.do",
			processData: false,
			contentType: false,
			dataType: "json",
			data,
			success: function(resp){
				console.log(resp);
				location.href = "/portal/bbs/qna/viewQna.do";
			},
			err: function(err){
				console.log("err:", err);
			}
		});
	}
}
</script>
<div class="wrap">
	<div class="sub_visual_wrap">
		<div class="notice">
			<ul>
				<li>문의하기</li>
			</ul>
		</div>
	</div>
	<div class="inquiry_write_wrap">
		<div class="con">
               <div class="int_table">
                   <div class="top">
                       <p class="title">문의하기</p>
                       <p><span>*</span>표시된 항목은 필수 입력항목입니다.</p>
                   </div>
					<form id="insertFrm" name="insertFrm" enctype="multipart/form-data" method="post">
						<input type="hidden" name="qstnDlnStcd" value="01"/>
						<input type="hidden" name="instGnrSpcd" value="01"/><!-- 01: 일반, 02:기관 -->
	                   <div class="item">
	                       <div class="int_list">
	                           <p class="title">이름</p>
	                           <ul>
	                               <li><c:out value="${userNm}"/></li>
	                           </ul>
	                       </div>
	                       <div class="int_list">
	                           <p class="title">카테고리<span class="must">*</span></p>
	                           <ul>
	                               <li>
										<kcure:select id="qstnClsSpcd" name="qstnClsSpcd" grpCd="QSTN_CLS_SPCD" defaultText="선택" attributes=" class=\"user_sel required\"  title=\"카테고리\" " selected=""/>
	                               </li>
	                           </ul>
	                       </div>
	                       <div class="int_list">
	                           <p class="title">제목<span class="must">*</span></p>
	                           <ul class="type_01">
	                               <li>
	                                   <input type="text" class="user_int required" title="제목" name="qstnTtlNm" maxlength="300"/>
	                                   <input type="text" style="width:0px; height:0px; border: 0;"/>
	                               </li>
	                           </ul>
	                       </div>
	                       <div class="int_list content">
	                           <p class="title">내용<span class="must">*</span></p>
	                           <ul class="type_01">
	                               <li>
	                                   <textarea class="user_text required" title="내용" name="qstnCont" maxlength="2000"></textarea>
	                               </li>
	                           </ul>
	                       </div>
	                       <div class="int_list file">
	                           <p class="title">파일첨부</p>
	                           <div class="file_inn">
									<div class="int_files list upload" id="boardUpload1ListUpload"></div>
									<ul class="type_04">
										<li>
											<label for="file1">
												<div id="boardUpload1"></div>
											</label>
										</li>
										<li class="txt">10MB 용량 제한</li>
									</ul>
									<ul class="caption">
									    <li>※ 파일 5개까지 첨부가능</li>
									</ul>
	                           </div>
	                       </div>
	                       <div class="int_list public">
	                           <p class="title">공개여부<span class="must">*</span></p>
	                           <ul class="type_03">
	                               <li>
	                                   <label class="n_radio_btn">
	                                       <input type="radio" name="qstnOpnYn" value="Y" checked="checked">
	                                       <span class="n_radio_mark"></span><span class="txt">공개</span>
	                                   </label>
	                               </li>
	                               <li>
	                                   <label class="n_radio_btn">
	                                       <input type="radio" name="qstnOpnYn" value="N">
	                                       <span class="n_radio_mark"></span><span class="txt">비공개</span>
	                                   </label>
	                               </li>
	                           </ul>
	                       </div>
	                       <div id="passwordDiv" class="int_list" style="display: none;">
	                           <p class="title">비밀번호<span class="must">*</span></p>
	                           <ul class="">
	                               <li>
	                               	   <input type="password" style="display: none;"/>
	                                   <input type="password" class="user_int" name="wtrPswd" maxlength="4" title="비밀번호" value=""/>
	                               </li>
	                           </ul>
	                       </div>
	                   </div>
                   </form>
               </div>
               <div class="n_btn_inn">
                   <a href="javascript:void(0)" class="l_btn bc_b_line" onclick="fnList();">취소</a>
                   <a href="javascript:void(0)" class="l_btn bc_blue" onclick="fnSave();">등록</a>
               </div>
		</div>
	</div>
</div>