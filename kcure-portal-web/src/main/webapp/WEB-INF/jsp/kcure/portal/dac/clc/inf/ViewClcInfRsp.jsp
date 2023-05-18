
<%
/* =================================================================
* @FileName : ViewClcInfRsp
* @date: 2023. 2. 24.
* @author : shpark
* @설명 : 데이터신청 > 연구자정보
* =================================================================
* 수정일 작성자 내용
* -----------------------------------------------------------------------
* 2023. 2. 24. shpark 파일생성
* =================================================================
*/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_scripts.jsp"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>
<script src="/js/FileUpload.js"></script>

<script type="text/javascript">
let callbackPopup = null;
let dataPopup = [];
let fu = null;

$(document).ready(() =>
{
	fu = FileUpload({
		uploadId: "file07",
		listIdUpload: "file07ListUpload",
		listIdDownload: "file07ListDownload",
		useDrop: true,
		maxNumberOfFiles: 1,
		maxSize: 1048576,
		renderHeader: (uploadId) => {
			return `
			<a id="` + uploadId + `Button" class="n_s_btn n_bc_gray_dk" onclick="uploadButtonClick('` + uploadId + `')">검색</a>
			<input type="file" id="` + uploadId + `File" multiple />
			`;
		},
		renderEmpty: () => {
			$("#file07").show();
		},
		renderUpload: (file, index, files) => {
			$("#file07").hide();

			return `<ul><li>`+file.name + `</li><li><a class="n_s_btn n_bc_gray_line cancel" data-index="` + index + `">취소</a></li></ul>`;
		},
		renderDownload: (file, index, files) => {
			$("#file07").hide();

			const { name, url, deleteUrl } = file;
			const htmlA = `<ul><li><a href="` + url + `">` + name + `</a></li>`;
			const htmlDelete = `<li><a class="delete"></a><a href="javascript:fu.setFilesUploaded([]);fu.showDownload();" class="n_s_btn n_bc_gray_line">삭제</a></li></ul>`;
			return htmlA + htmlDelete;
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

	let targetIndx = 0;
	let isForOther = true;
	let data = {};
	let html = "";
	<c:forEach items="${rspVoList}" var="rspVo"  varStatus="rspVoStatus">
		targetIndx = ${rspVoStatus.index};
		data = {
			actionType: "update",
			rsrpNm: "${rspVo.rsrpNm}",
			rsrpSpcd: "${rspVo.rsrpSpcd}",
			rsrpSpcdNm: "${rspVo.rsrpSpcdNm}",
			rsrpId: "${rspVo.rsrpId}",
			rsrAplpYn: "N",
			userMbphNo1: "${rspVo.userMbphNo1}",
			userMbphNo2: "${rspVo.userMbphNo2}",
			userMbphNo3: "${rspVo.userMbphNo3}",
			email: "${rspVo.email}",
			vrtUseYn: "${rspVo.vrtUseYn}"
		}
		html = getRowHtml(data, targetIndx);
		$('#tblList > tbody').append(html);
	</c:forEach>

	const attfNm = "${rspRequestVo.file07AttfNm}";
	const attfStrNm = "${rspRequestVo.file07AttfStrNm}";
	const attfPthNm = "${rspRequestVo.file07AttfPthNm}";
	if (attfNm) {
		const file = new File([], attfNm);
		file.url = "javascript:downFile('" + attfPthNm + "', '" + attfStrNm + "', '" + attfNm + "')";
		file.deleteUrl = "javascript:fu.setFilesUpload([]);";
		fu.setFilesUploaded([file]);
		fu.showDownload();
	}
});

 /**
  * @Method Name : saveRsp
  * @Method 설명 : 연구자 정보 저장
  */
function saveRsp(isTemp){
	if (isTemp) {
		$("input[name='saveGb']").val("01");
	} else {
		$("input[name='saveGb']").val("02");
	}

	if (!isTemp) {
		const { valid, msg } = checkValidate();
		if (!valid) {
			alert(msg);
			return;
		}
	}

	var form = document.rspForm
	const data = new FormData(form);
	let idx = -1;

	idx++;
	data.append("clcInfRspList[" + idx + "].rsrpSpcd", "${rspRequestVo.rsrpSpcd}");
	data.append("clcInfRspList[" + idx + "].actionType", "${rspRequestVo.actionType}");
	data.append("clcInfRspList[" + idx + "].rsrpId", "${rspRequestVo.rsrpId}");
	data.append("clcInfRspList[" + idx + "].rsrAplpYn", "${rspRequestVo.rsrAplpYn}");
	data.append("clcInfRspList[" + idx + "].vrtUseYn", "${rspRequestVo.vrtUseYn}");

	idx++;
	data.append("clcInfRspList[" + idx + "].rsrpSpcd", "02"); // 연구책임자
	data.append("clcInfRspList[" + idx + "].actionType", $("#actionTypeResponse").val());
	data.append("clcInfRspList[" + idx + "].rsrpId", $("#rsrpIdResponse").val());
	data.append("clcInfRspList[" + idx + "].rsrAplpYn", "N");
	data.append("clcInfRspList[" + idx + "].vrtUseYn", $("input[name=vrtUseYnResponse]:checked").val());

	$("#tblList > tbody > tr").each(function(index, item){
		idx++;
		$(this).find("input,select").each((subIndex, subItem) => {
			var targetName = $(subItem).attr("name").split("_")[0];
			if (targetName === "vrtUseYn") {
				if ($(subItem).prop("checked")) {
					data.append("clcInfRspList[" + idx + "]." + targetName, $(subItem).val());
				}
			} else {
				data.append("clcInfRspList[" + idx + "]." + targetName, $(subItem).val());
			}
		}) ;
	});

	const files = fu.getFilesAdded();
	for (const file of files) {
		data.append("file07", file);
	}

	$.ajax({
		type:"POST",
		url: $(form).attr("action"),
		processData: false,
		contentType: false,
		dataType: "json",
		data,
		success: function(resp){
			if (resp.resultMessage && resp.resultMessage.trim() !== "") {
				alert(resp.resultMessage);
			}
			const url = resp.targetStepUrl + "?dataAplcNo=" + resp.dataAplcNo;
			document.location.href = url;
		},
		beforeSend:function(){
        	$("#loading_box").addClass('on')
        },
		err: function(err){
			$("#loading_box").removeClass('on')
			console.log("err:", err);
		}
	});

	// $('#rspForm').submit();
}

function moveToPrev() {
	$("#moveForm").attr("action", "/portal/dac/clc/inf/viewClcInfReserch.do").submit();
}

function getMbphNo123(userMbphNo) {
	const userMbphNo_ = userMbphNo.replaceAll("-", "");
	const userMbphNo1 = userMbphNo_.substring(0, 3);
	const userMbphNo2 = userMbphNo_.substring(3, 7);
	const userMbphNo3 = userMbphNo_.substring(7);
	return { userMbphNo1, userMbphNo2, userMbphNo3 }
}

/**
 * @Method Name : fnSchPopup
 * @Method 설명 : 사용자 검색 레이어 팝업 오픈
 * @parma : obj 검색버튼 객체정보
 */
function fnSchPopup(rsrpSpcd){
	$("#noResultTxt").css("display", "none");
	
	if (rsrpSpcd === "02") { // 연구책임자
		callbackPopup = ({ userNm, userId, userMbphNo }) => {
			const actionType = $("#actionTypeResponse").val();
			if (actionType == 'update') {
				const rsrpId = $("#rsrpIdResponse").val();

				const deleteSpcdId = $('#deleteSpcdId').val();
				if (deleteSpcdId == '') {
					$('#deleteSpcdId').val("02" + rsrpId)
				} else {
					$('#deleteSpcdId').val(deleteSpcdId + ',' + "02" + rsrpId);
				}
			}

			$("#rsrpNmResponse").text(userNm);
			$("#actionTypeResponse").val("insert");
			$("#rsrpIdResponse").val(userId);

			const { userMbphNo1, userMbphNo2, userMbphNo3 } = getMbphNo123(userMbphNo);
			$("#userMbphNoResponse").text(userMbphNo1 + "-" + userMbphNo2 + "-" + userMbphNo3);
			$("#emailResponse").text(userId);

			$("#schPersonPop").removeClass("on");
		}
	} else if (rsrpSpcd === "03" || rsrpSpcd === "04") { // 공동연구자, 보조연구자
		let rsrpSpcdNm = "";
		if (rsrpSpcd === "03") {
			rsrpSpcdNm = "공동연구자";
		} else if (rsrpSpcd === "04") {
			rsrpSpcdNm = "보조연구자";
		}

		callbackPopup = ({ userNm, userId, userMbphNo }) => {
			const { userMbphNo1, userMbphNo2, userMbphNo3 } = getMbphNo123(userMbphNo);

			const idsOld = $.map($("#tblList > tbody > tr > td > input[name^=rsrpId_]"), el => $(el).val());
			if (idsOld.includes(userId)) {
				alert(userId + "는 이미 추가되었습니다");
				return;
			}

			const data = {
				actionType: "insert",
				rsrpSpcd,
				rsrpSpcdNm,
				rsrpNm: userNm,
				rsrpId: userId,
				rsrAplpYn: "N",
				userMbphNo1, userMbphNo2, userMbphNo3,
				email: userId,
				vrtUseYn: ""
			};
			const html = getRowHtml(data);
			$("#tblList > tbody").append(html);

			$("#schPersonPop").removeClass("on");
		}
	}

	$('#schPersonPop').find('input,select').val('');
	$('#schPersonPop #targetTbl').html('');
	$('#schPersonPop #targetTbl').hide();
	$('#schPersonPop').addClass('on');
}


/**
 * @Method Name : schPopUpBtn
 * @Method 설명 : 사용자 검색 레이어 팝업 사용자 검색
 */
function schPopUpBtn(){
	if($('#schPersonPop #name').val() == ''){
		alert('이름을 입력해주세요');
		return;
	}
	if($('#schPersonPop #userMbphNo').val() == ''){
		alert('휴대폰 번호를 입력해주세요');
		return;
	}
	if($('#schPersonPop #prtiId').val() == ''){
		alert('소속기관을 선택해주세요');
		return;
	}

	var param = $("#schPersonPop").find('input,select').serialize();

	$.ajax({
		//url: "/portal/sys/usr/stt/updateUsr.do",
		url: "/portal/dac/clc/inf/userSch.do",
		dataType: "json",
		data: param,
		type: "POST",
		async: false,
		success: function(response) {
			dataPopup = response.schUserList;
			$('#schPersonPop #targetTbl').html('');
			if(response.schUserList.length > 0){
				$.each(response.schUserList, function (index, item) {
					var html = '<ul>';
					html += '<li>';
					html += item.userNm + " " +item.prtiNm;
					html += '</li>';
					html += '<li>';
					html += '<a href="#" onclick="callbackPopup(dataPopup[' + index + ']);" class="n_m_btn n_bc_gray_dk">선택</a>';
					html += '</li><ul>';
					$('#schPersonPop #targetTbl').append(html);
				});
				$('#schPersonPop #targetTbl').show();
				$("#noResultTxt").css("display", "none");
			}else{
				$('#schPersonPop #targetTbl').hide();
				$("#noResultTxt").css("display", "block");
			}
		},
	});
}


/**
 * @Method Name : checkValidate
 * @Method 설명 : 연구자정보 validate 메소드
 */
function checkValidate(){
	if (!$("#rsrpIdResponse").val()) {
		return { valid: false, msg: "연구책임자를 선택해주세요" };
	}
	if ($("[name='vrtUseYnResponse']:checked").length === 0) {
		return { valid: false, msg: "연구책임자의 가상화 사용여부를 선택해주세요" };
	}

	let rows = $('#tblList > tbody > tr');
	if (rows.length === 0) {
		return { valid: false, msg: "공동/보조 연구자를 선택해주세요" };
	}

	let valid = true;
	let rsrpId = "";
	rows.each(function(index,item){
		if ($(item).find("input[name^='vrtUseYn_']:checked").length === 0) {
			rsrpId = $(item).find("input[name^='rsrpId_']").val();
			valid = false;
			return false; // break
		}
  	});
	if (!valid) {
		return { valid: false, msg: "공동/보조 연구자 " + rsrpId + "의 가상화 사용여부를 선택해주세요" };
	}

	if (fu.getFilesAdded().length === 0 && fu.getFilesUploaded().length === 0) {
		return { valid: false, msg: "연구자 동의서류를 업로드해주세요" }
	}

	return { valid: true, msg: "" };
}

function getRowHtml(data, targetIndx) {
	if (targetIndx === undefined) {
		let maxIndx = 0;
		$("#tblList > tbody > tr").each((index, elem) => {
			const rsrpIdName = $(elem).find("input[name^='rsrpId_']").attr("name");
			const curIndx = parseInt(rsrpIdName.split("_")[1], 10);
			if (curIndx > maxIndx) {
				maxIndx = curIndx;
			}
		})
		targetIndx = maxIndx + 1;
	}

	const { actionType, rsrpSpcd, rsrpSpcdNm, rsrpNm, rsrpId, rsrAplpYn, userMbphNo1, userMbphNo2, userMbphNo3, email, vrtUseYn } = data;

	let vrtUseYnRadio = `<kcure:radio2 name="vrtUseYn_` + targetIndx + `" grpCd="VRT_USE_YN" />`;
	// value="Y" -> value="Y" checked
	vrtUseYnRadio = vrtUseYnRadio.replace(`value="` + vrtUseYn + `"`, `value="` + vrtUseYn + `" checked`);


	const html = `
		<tr>
			<td>` + rsrpSpcdNm + `</td>
			<td>` + rsrpNm + `</td>
			<td>` + rsrpId + `</td>
			<td>` + userMbphNo1 + '-' + userMbphNo2 + '-' + userMbphNo3 + `</td>
			<td>` + email + `</td>
			<td>`
			+ vrtUseYnRadio
			+ `
				<input type="hidden" name="actionType_` + targetIndx + `" value="` + actionType + `">
				<input type="hidden" name="rsrpSpcd_` + targetIndx + `" value="` + rsrpSpcd + `">
				<input type="hidden" name="rsrpId_` + targetIndx + `" value="` + rsrpId + `">
				<input type="hidden" name="rsrAplpYn_` + targetIndx + `" value="` + rsrAplpYn + `">
				<input type="hidden" name="userMbphNo1_` + targetIndx + `" value="` + userMbphNo1 + `">
				<input type="hidden" name="userMbphNo2_` + targetIndx + `" value="` + userMbphNo2 + `">
				<input type="hidden" name="userMbphNo3_` + targetIndx + `" value="` + userMbphNo3 + `">
				<input type="hidden" name="email_` + targetIndx + `" value="` + email + `">
			</td>
			<td><a href="javascript:void(0)" class="n_del_btn_s" onclick="deleteRow(` + targetIndx + `, '` + rsrpSpcd + `', '` + rsrpId + `')"></a></td>
		</tr>
	`;

	return html;
}

/**
 * @Method Name : deleteRow
 * @Method 설명 : 공동/보조 연구자 삭제
 */
function deleteRow(targetIndx, rsrpSpcd, rsrpId){
	const td = $("#tblList > tbody > tr > td:contains(" + rsrpId + ")");
	if (!td.length) return;

	const actionType = $("input[name^='actionType_" + targetIndx + "']").val();
	if (actionType == 'update') {
		const deleteSpcdId = $('#deleteSpcdId').val();
		if (deleteSpcdId == '') {
			$('#deleteSpcdId').val(rsrpSpcd + rsrpId)
		} else {
			$('#deleteSpcdId').val(deleteSpcdId + ',' + rsrpSpcd + rsrpId);
		}
	}

	const tr = td.parent();
	tr.remove();
}

/**
 * @Method Name : tempDownFile
 * @Method 설명 : 서식다운로드
 * @param : 첨부서류명구분코드
 */
function tempDownFile(fileAttNmSpcd){
	$('#downLoadFilefrm #fileAttNmSpcd').val(('00' + fileAttNmSpcd).slice(-2));
	$('#downLoadFilefrm').attr("action", "/portal/dac/clc/inf/tempFileDown.do");
	$('#downLoadFilefrm').submit();
}

/* 파일 다운로드  */
function downFile(attfPthNm,attfStrNm,attfNm){
	$('#downLoadFilefrm #attfPthNm').val(attfPthNm);
	$('#downLoadFilefrm #attfStrNm').val(attfStrNm);
	$('#downLoadFilefrm #attfNm').val(attfNm);
	$('#downLoadFilefrm').attr("action", "/portal/dac/clc/inf/serviceFileDown.do");
	$('#downLoadFilefrm').submit();

}

</script>

<div class="wrap">
	<div class="sub_visual_wrap">
		<div class="data_request">
			<ul>
				<li><c:out value="${clcInfReserchVo.dataTpcdNm}"/> 데이터 신청</li>
			</ul>
		</div>
	</div>
	<div class="n_data_apply_wrap">
		<div class="con">
			<%@include file="/WEB-INF/jsp/kcure/portal/dac/clc/inf/ViewClcInfNav.jsp"%>

			<form id="moveForm">
				<input type="hidden" id="dataAplcNo" name="dataAplcNo" value="${clcInfRspVo.dataAplcNo}">
			</form>

			<form name="rspForm" id="rspForm" action="${pageContext.request.contextPath}/portal/dac/clc/inf/saveClcInfRsp.do" method="post" enctype="multipart/form-data">
				<input type="hidden" id="dataAplcNo" name="dataAplcNo" value="${clcInfRspVo.dataAplcNo }">
				<input type="hidden" name="saveGb" value="02" />
				<input type="hidden" id="deleteSpcdId" name="deleteSpcdId" value="">

				<div class="n_data_write_wrap">
					<div class="n_table_info">
						<div class="title">
							<h3>연구신청자</h3>
						</div>
						<div class="n_l_table">
							<table>
								<tbody>
									<tr>
										<th>신청자 명</th>
										<td>${rspRequestVo.rsrpId}</td>
										<th>휴대전화 번호</th>
										<td>${rspRequestVo.userMbphNo1}-${rspRequestVo.userMbphNo2}-${rspRequestVo.userMbphNo3}</td>
									</tr>
									<tr>
										<th>이메일 주소</th>
										<td colspan="3">${rspRequestVo.email}</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="n_table_info">
						<div class="title">
							<h3>연구책임자</h3>
							<div class="btn">
								<a href="javascript:void(0)" class="n_sh_btn_s" onclick="fnSchPopup('02')">연구책임자 검색</a>
								<input type="hidden" id="actionTypeResponse" name="actionTypeResponse" value="${rspResponseVo.actionType}" />
								<input type="hidden" id="rsrpIdResponse" name="rsrpNmResponse" value="${rspResponseVo.rsrpId}" />
							</div>
						</div>
						<div class="n_l_table">
							<table id="tblResponse">
								<tbody>
									<tr>
										<th>성명</th>
										<td id="rsrpNmResponse">${rspResponseVo.rsrpNm}</td>
										<th>휴대전화 번호</th>
										<td id="userMbphNoResponse">${rspResponseVo.userMbphNo1}-${rspResponseVo.userMbphNo2}-${rspResponseVo.userMbphNo3}</td>
									</tr>
									<tr>
										<th>이메일 주소</th>
										<td id="emailResponse">${rspResponseVo.email}</td>
										<th>가상화 사용여부<span class="must">*</span>
										<td>
											<kcure:radio2 name="vrtUseYnResponse" grpCd="VRT_USE_YN" defaultValue="${rspResponseVo.vrtUseYn}" />
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="n_table_info">
						<div class="title">
							<h3>공동/보조 연구자</h3>
							<div class="btn">
								<a href="javascript:void(0)" class="n_plus_btn_s_w" onclick="fnSchPopup('04')">보조연구자 추가</a>
								<a href="javascript:void(0)" class="n_plus_btn_s" onclick="fnSchPopup('03')">공동연구자 추가</a>
							</div>
						</div>
						<div class="re_table">
							<table id="tblList">
								<thead>
									<th>연구자유형</th>
									<th>성명</th>
									<th>아이디</th>
									<th>전화번호</th>
									<th>이메일</th>
									<th>가상화 사용여부<span class="must">*</span></th>
									<th>삭제</th>
								</thead>
								<tbody>
								</tbody>
							</table>
						</div>
						<div class="consent_form">
							<p>연구자 동의서류</p>
							<ul>
<!-- 								<li><input type="text" class="n_int_s" placeholder="파일선택"></li> -->
								<li><div id="file07" name="file07"></div></li>
								<li><a href="javascript:tempDownFile('07')" class="n_s_btn n_bc_blue">양식 다운로드</a></li>
							</ul>
						</div>
					</div>
				</div>
			</form>
			<div class="n_table_r_btn">
				<a href="javascript:void(0)" class="n_m_btn n_bc_blue_dk" onclick="moveToPrev();return false;">이전</a>
				<a href="javascript:void(0)" class="n_m_btn n_bc_b_line" onclick="saveRsp(true);return false;">임시저장</a>
				<a href="#" class="n_m_btn n_bc_blue_dk" onclick="saveRsp(false);return false;" class="bc_blue">다음</a>
			</div>
		</div>
	</div>
</div>

<!-- 사람 검색 팝업 -->
<div id="schPersonPop" class="re_layer_popup">
	<div class="re_popup_box person_sch">
		<a href="javascript:void(0)" class="btn kc_close"></a>
		<div class="title">
			<p>연구책임자(보조연구자, 공동연구자)검색</p>
		</div>
		<div class="popup_con">
			<div class="int">
				<input type="text" id="name" name="name" class="n_int_m" placeholder="이름을 입력해주세요">
				<input type="number" id="userMbphNo" name="userMbphNo" class="n_int_m" placeholder="-를 제외한 휴대폰 번호">
				<select id="prtiId" name="prtiId"  class="n_sel_m">
					<option value="">선택</option>
					<c:forEach var="prtiList" items="${prtiList}" varStatus="status">
						<option value="${prtiList.comCd}">${prtiList.comNm}</option>
					</c:forEach>
				</select>
				<a href="javascript:void(0)" class="n_l_btn n_bc_b_line" onclick="schPopUpBtn();return false;">검색</a>
				<div class="n_inst_sel" style="display: none;" id="targetTbl"></div>
			</div>
			<p class="comment">이름, 휴대폰번호, 소식 기관을 모두 입력하여 검색해주세요</p>
			<p class="comment f_red" id="noResultTxt" style="display:none;">회원정보가 검색 되지 않습니다. 다시 확인 후 검색해 주세요</p>
		</div>
	</div>
</div>
<form id="frmPop" name="frmPop" method="post" style="display: none;">
	<input type="hidden" name="targetIndex" value="">
</form>

	<!-- 파일 다운로드폼 -->
<form name="downLoadFilefrm" id="downLoadFilefrm" action="" method="post" style="display: none;" >
	<input type="hidden" id="fileAttNmSpcd" name="fileAttNmSpcd">
	<input type="hidden" id="dataAplcNo" name="dataAplcNo" value="${clcInfReserchVo.dataAplcNo}">
	<input type="hidden" id="attfPthNm" name="attfPthNm">
	<input type="hidden" id="attfStrNm" name="attfStrNm">
	<input type="hidden" id="attfNm" name="attfNm" >
</form>

<!-- title 및 navi -->
<%@include file="/WEB-INF/jsp/kcure/portal/dac/clc/inf/clcInfCommon.jsp"%>