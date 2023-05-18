<%
/* =================================================================
 * @FileName : ViewMypRscInfInForm.jsp
 * @date: 2023.05.02
 * @author : bhs
 * @설명 : 마이페이지 나의연구 반입 신청 화면
 * =================================================================
 * 수정일         작성자             내용     
 * -----------------------------------------------------------------------
 * 2023.05.02     bhs           파일생성
 * =================================================================
 */ 
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>
<script type="text/javascript">

var filesIdx = 0;

$(document).ready(function() {

	$("#upfile_02_btn").click(function() {
		var fileName = "";

	    const fileList = $("#fileListDiv");
	    const ul = $("<ul id='attachUl_"+filesIdx+"'>").appendTo(fileList);
		const li1 = $("<li>");
		const li2 = $("<li>");
		  
		
	    const input = $("<input>")
	      .attr("type", "file")
	      .attr("id", "attachFile_" + filesIdx)
	      .attr("name", "attachFile_" + filesIdx)
	      .addClass("upload-hidden2")
	     .appendTo($("#filesUploadDiv"));
	    
	    input.change(function() {
	      const file = this.files[0];
	      const fileSize = Math.round((file.size / 1024 / 1024) * 100) / 100;
	    
		  if (fnGetTotFileSize() > 30) {
		     alert("반입 파일의 총합 사이즈가 30mb를 넘을 수 없습니다.");
		     return;
		  }
		    
	      fileName = file.name + " (" + fileSize + "MB)";
	      li1.text(fileName);
	     
		  li1.appendTo(ul);
		  li2.append("<a class='btn' onclick='javascript:fnDelFile02("+filesIdx+")'>파일삭제</a>");
		  li2.appendTo(ul);
		  
		  filesIdx++;
	    });
	    
	    input.trigger("click");
	  });
});


/**
 * 신청하기 이벤트
 */
function saveIn() {
	 if($("#tkinDataNmCont").val() == ""){
	   	alert("반입데이터명을 입력해주세요.");
	   	$("#tkinDataNmCont").focus();
	   	return;
	 }else{
		var maxBytes = 200; // 최대 입력바이트 수
		var inputText = $("#tkinDataNmCont").val();
	    var inputBytes = new Blob([inputText]).size;
	    
	    if (inputBytes > maxBytes) {
	    	$("#tkinDataNmCont").val(inputText.slice(0, maxBytes));
	      	alert('최대 200바이트까지 입력 가능합니다.');
	    }
	 }
	 
	const files = $("#attachFlMst")[0].files;
    if (files.length === 0) {
       alert("반입파일명세서롤 업로드 해주세요.");
       return;
    }
	
    let isExist = false;
    $('input[id*="attachFile_"]').each(function() { 
      const files = $(this)[0].files;
      if (files.length > 0) {
        isExist = true;
      }
    });
    
    if(! isExist){
    	alert("반입파일을 하나이상 업로드 해주세요.");
        return;
    }
	
    if($("#tkinDataPrpsCont").val() == ""){
    	alert("반입목적을 입력해주세요.");
    	$("#tkinDataPrpsCont").focus();
        return;
    }else{
    	var maxBytes = 2000; // 최대 입력바이트 수
		var inputText = $("#tkinDataPrpsCont").val();
	    var inputBytes = new Blob([inputText]).size;
	    
	    if (inputBytes > maxBytes) {
	    	$("#tkinDataPrpsCont").val(inputText.slice(0, maxBytes));
	      	alert('최대 2000바이트까지 입력 가능합니다.');
	    }
    }
   
    $("#inFrm").attr("action", "/portal/myp/rsc/inf/saveMypRscInfInAplc.do").submit();
}

/**
 * 반입파일명세서 파일업로드
 */
function fnSetFile01(){
	const input = document.getElementById('attachFlMst');
    const fileName = input.files[0].name;
    const fileSize = input.files[0].size;
    const inputText = document.getElementById('attachDscFlNm');
    if (fileSize > 10 * 1024 * 1024) {
        alert("반입파일명세서는 파일 사이즈가 10mb를 넘을 수 없습니다.");
        inputText.value = "";
        input.value = "";
    } else {
        inputText.value = fileName;
    }
}

/**
 * 반입파일명세서 파일삭제
 */
function fnDelFile01() {
    const input = document.getElementById('attachFlMst');
    input.value = '';
    const inputText = document.getElementById('attachDscFlNm');
    inputText.value = '';
}

/**
 * 반입파일 파일삭제
 */
function fnDelFile02(fIdx) {
	var delFile = $("#attachFile_" + fIdx);
	var delUl = $("#attachUl_" + fIdx);
	delFile.remove();
	delUl.remove();
}

/**
 * 반입파일 전체사이즈
 */
function fnGetTotFileSize(){
	 let totalSize = 0;
     $('input[id^="attachFile_"]').each(function() {
       const files = $(this)[0].files; 
       if (files.length > 0) {
         const fileSize = files[0].size; 
         totalSize += fileSize;
       }
     });
     const totalSizeInMb = (totalSize / 1024 / 1024).toFixed(2);

     return totalSizeInMb;
}

</script>

<div class="wrap">
	
	<%@ include file="/WEB-INF/jsp/kcure/portal/myp/rsc/ViewMypRscInfNav.jsp" %>
	
	<form id="inFrm" name="inFrm"  method="post" enctype="multipart/form-data">
		<input type="hidden" id="dataAplcNo" name="dataAplcNo" value="${aplcInfo.dataAplcNo}">
		<input type="hidden" id="rsrAsmtNo" name="rsrAsmtNo" value="${aplcInfo.rsrAsmtNo}">
		
		<div id="filesUploadDiv"></div>
		
		<div class="n_my_research_wiew_wrap">
			<div class="con">
				<div class="sub_pag_title">
					<p>반입 신청 연구정보</p>
				</div>
				<div class="n_gap_box">
					<div class="n_table_info">
						<div class="n_l_table type_02">
							<table>
								<tbody>
									<tr>
										<th>연구명</th>
										<td>${aplcInfo.rsrSbjNm}</td>
										<th>연구과제번호</th>
										<td>${aplcInfo.rsrAsmtNo}</td>
									</tr>
									<tr>
										<th>책임연구자</th>
										<td>${aplcInfo.rsrpNm}</td>
										<th>연구기간</th>
										<td>${aplcInfo.dszDsgnDtTerm}</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="n_table_info gray">
						<div class="title">
							<h3>반입신청</h3>
						</div>
						<div class="n_l_table type_02">
							<table>
								<tbody>
									<tr>
										<th>반입데이터명</th>
										<td><input type="text" id="tkinDataNmCont" name="tkinDataNmCont" class="n_int_tm" placeholder="100글자 이내 입력"></td>
									</tr>
									<tr>
										<th>반입파일명세서</th>
										<td>
											<div class="n_file_wrap">
												<input type="text" class="n_int_tm upload_name" name="attachDscFlNm" id="attachDscFlNm" placeholder="10MB용량제한" disabled="disabled">
												<label for="attachFlMst">
													<span class="btn_upload">파일찾기</span>
												</label>
												<input type="file" name="attachFlMst" id="attachFlMst" onchange="fnSetFile01()" class="upload-hidden">
												<!-- 파일을 찾았을때 | 기본은 삭제 -->
												<a href="javascript:fnDelFile01()" class="btn">파일삭제</a>
											</div>
										</td>
									</tr>
									<tr>
										<th>반입파일</th>
										<td>
											<div class="n_file_list_wrap">
												<label id="upfile_02_btn">
													<span class="btn_upload">파일찾기</span>
													<span>30MB 용량 제한</span>
												</label>
												
												<div class="item_list" id="fileListDiv">
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<th>반입목적</th>
										<td>
											<textarea rows="5" id="tkinDataPrpsCont" name="tkinDataPrpsCont" class="n_text_l" placeholder="1000글자 이내 입력"></textarea>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="apply_btn">
						<a onclick="javascript:saveIn()" class="n_l_btn db_b">신청하기</a>
					</div>
				</div>
			</div>
		</div>
	</form>
</div>
