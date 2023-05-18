<%
/* =================================================================
 * @FileName  : viewNasFtpExample
 * @date: 2023. 1. 16.
 * @author : kyh
 * @설명 : 
 * =================================================================
 * 수정일         작성자             내용     
 * -----------------------------------------------------------------------
 * 2023. 1. 16.        개발자명           파일생성
 * =================================================================
 */ 
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>

<script type="text/javascript">
$(document).ready(
		function() {
			<c:if test="${not empty fn:trim(actMessage) &&  actMessage ne ''}">
		    alert("<c:out value='${actMessage}'/>");
		    </c:if>
		}
	);
	
document.addEventListener('keydown', function(event) {
	if (event.keyCode === 13) {
		event.preventDefault();
	};
}, true);

//파일 전송
function actionFtpSend() {
	var chkFileCnt = 0;
	
	var fileInput = $('.files');
	
	for (var i = 0; i < fileInput.length; i++) {
		if ($('#sendFile'+i).val() != "") {
			chkFileCnt = 1;
		}
	}
	
	if ($('#sendFolder').val() =="") {
		alert("파일전송 폴더경로를 입력해 주세요.");
    } else if (chkFileCnt < 1) {
    	alert("전송할 파일을 선택해 주세요.");
    } else {
    	$('#actChk').val("fileSend");
    	
        $('#frm').attr("action", "/portal/example/ftp/nonCheck/sendFtpExample.do");
        $('#frm').submit();
    }
}

//파일 조회
function actionFtpRead() {	
	if ($('#sendFolder').val() =="") {
		alert("파일전송 폴더경로를 입력해 주세요.");
	} else {
		$('#actChk').val("fileRead");
  	
		$('#frm').attr("action", "/portal/example/ftp/nonCheck/viewNasFtpExample.do");
		$('#frm').submit();
  }
}

//파일 다운
function actionFtpDown(fileName) {	
	if ($('#sendFolder').val() =="") {
		alert("파일전송 폴더경로를 입력해 주세요.");
	} else {
		$('#fileName').val(fileName);
	
		$('#frm').attr("action", "/portal/example/ftp/nonCheck/downFtpExample.do");
		$('#frm').submit();
	}
}

//파일 삭제
function actionFtpDel(fileName) {	
	if ($('#sendFolder').val() =="") {
		alert("파일전송 폴더경로를 입력해 주세요.");
	} else {
		$('#fileName').val(fileName);
	
		$('#frm').attr("action", "/portal/example/ftp/nonCheck/delFtpExample.do");
		$('#frm').submit();
	}
}

//파일 일괄다운로드
function actionFtpAllDown() {	
	if ($('#sendFolder').val() =="") {
		alert("파일전송 폴더경로를 입력해 주세요.");
	} else {
		$('#fileName').val(fileName);
	
		$('#frm').attr("action", "/portal/example/ftp/nonCheck/allDownFtpExample.do");
		$('#frm').submit();
	}
}

//파일 일괄삭제
function actionFtpAllDel() {	
	if ($('#sendFolder').val() =="") {
		alert("파일전송 폴더경로를 입력해 주세요.");
	} else {
		$('#fileName').val(fileName);
	
		$('#frm').attr("action", "/portal/example/ftp/nonCheck/allDelFtpExample.do");
		$('#frm').submit();
	}
}
</script>

<form name="frm" id="frm" method="post" enctype="multipart/form-data" action="">
<input type="hidden" id="actChk" name="actChk" value=""/>
<input type="hidden" id="fileName" name="fileName" value=""/>
	<div class="wrap">
		<div class="data_apply_wrap">
			<div class="con">
				<div class="data_finish_wrap">
					<div class="txt" style="text-align: left;">
						<span>주의 사항</span>
						<p>1. 파일일괄다운로드는 지정된 폴더에 저장됨(C:\kcure_dev)</p>
						<p>
						   2. 연결 방식</br>
						      - FTP : 사업단 내부 NAS</br>
						      - SFTP : nhn NAS
						</p>
						<p>
						   3. NAS 폴더 경로</br>
						      - FTP : /HDD1/ftpTest/</br>
						      - SFTP : /nasdata/svcAplc/
						</p>
						<p>
						   4. NAS 캐릭터셋</br>
						      - FTP : EUC-KR(CP949)(한글 파일명 및 폴더명 처리를 위한 별도 로직 존재)</br>
						      - SFTP : UFF-8
						</p>
					</div>
				</div>
				<div class="apply_int_wrap">
					<div class="int_table">
						<div class="item">
							<div class="int_list">
								<p class="title">파일전송 폴더경로</p>
								<ul>
									<li><input type="text" name="sendFolder" id="sendFolder" class="user_int" value="${sendFolder}"></li>
									<li class="txt">(* FTP 저장 및 조회할 폴더 경로 지정)</li>
								</ul>
							</div>
							<div class="int_list">
								<p class="title">전송대상 파일</p>
								<ul class="type_03">
									<li>
										<label for="file_03">
											<input type="file" name="sendFile" id="sendFile0" class="files" style="display: block;">
											<input type="file" name="sendFile" id="sendFile1" class="files" style="display: block;">
										</label>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<c:if test="${fn:length(fileList) == 0 && actChk ne null}">
					<div class="apply_int_wrap">
						<div class="int_table">
							<div class="item">
								<div class="int_list">
									<p class="title">저장된 파일이 없습니다.</p>
								</div>
							</div>
						</div>
					</div>
				</c:if>
				<c:if test="${fn:length(fileList) > 0}">
					<div class="apply_int_wrap">
						<div class="int_table">
							<div class="item">
								<div class="int_list">
									<p class="title">파일전송 폴더경로</p>
								</div>
								<c:forEach items="${fileList}" var="list" varStatus="rowInx" >
								<div class="int_list">
									<ul>
										<li class="txt" style="width:100%">
											${list.fileName}
											<a href="#" onclick="actionFtpDown('${list.fileName}')" style="display: inline; margin-left: 20px;">(개별파일다운로드)</a>
											<a href="#" onclick="actionFtpDel('${list.fileName}')" style="display: inline; margin-left: 20px;">(개별파일삭제)</a>
										</li>
									</ul>
								</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</c:if>
				<div class="btn_c_wrap">
					<c:if test="${fn:length(fileList) > 0}">
						<a href="#" onclick="actionFtpAllDown()" class="bc_blue">파일일괄다운로드</a>
						<a href="#" onclick="actionFtpAllDel()" class="bc_blue">파일일괄삭제</a>
					</c:if>
					<a href="#" onclick="actionFtpRead()" class="bc_blue">파일 조회</a>
					<a href="#" onclick="actionFtpSend()" class="bc_blue">파일 전송</a>
				</div>
			</div>
		</div>
	</div>
</form>