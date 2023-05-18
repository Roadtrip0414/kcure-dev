<%
/* =================================================================
* @FileName : UploadDtsColDfndPopup.jsp
* @date: 2023. 2. 9.
* @author : parkgu
* @설명 : 엑셀업로드 팝업
* =================================================================
* 수정일 작성자 내용
* -----------------------------------------------------------------------
* 2023. 2. 7. parkgu 파일생성
* =================================================================
*/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>
<script src="/js/plugin/xlsx.js"></script>
<script type="text/javascript">
const global = {
	rows: []
};

$(document).ready(function() {
	addPrti();

	function addPrti() {
		const prtiList = window.opener.getPrtiListFromPopup();
		const options = prtiList
					.map(item => "<option value='" + item.key + "'>" + item.value + "</option>")
					.join("\n");
		$("#prtiId").html(options);
	}

	function validate(rows) {
		if (rows.length === 0) {
			return { valid: false, msg: "데이터를 입력하지 않았습니다." };
		}

		const nameHs = new Map([
			["컬럼(한글)", "colKnm"], ["컬럼(영문)", "colEnm"], ["컬럼설명", "colExplCont"],
			["타입", "dataTpCont"], ["길이", "dataLnthCont"], ["코드셋유무", "cdsYn"],
			["코드", "cdId"], ["데이터셋", "dtsKnm"], ["사용여부", "useYn"]
		]);
		const rowsNew = [];
		for (let rw = 0; rw < rows.length; rw++) {
			const row = rows[rw];

			const rowNew = {};
			for (let [nameH, name] of nameHs) {
				let value = row[nameH];

				if (name == "dataTpCont") {
					value = window.opener.getDetlCdFromPopup(value);
				} else if (name === "dtsKnm") {
					const prtiId = $("#prtiId").val();
					value = window.opener.getDtsIdFromPopup(prtiId, value);
					name = "dtsId";
				}

				const { valid, msg } = window.opener.validateDtsColDfnd(name, value);
				if (!valid) {
					return { valid, msg: msg + " (" + (rw + 1) + "번째 행)" };
				}

				rowNew[name] = value;
			}
			rowNew["prtiId"] = $("#prtiId").val();

			rowsNew.push(rowNew);
		}

		return { valid: true, rowsNew };
	}

	$("#prtiId").change(function () {
		$("#file").val("");
	})

	$("#file").change(async function (e) {
		const file = e.target.files[0];
		const data = await file.arrayBuffer();
		const workbook = XLSX.read(data);
		const sheetFirst = workbook.Sheets[workbook.SheetNames[0]];
		const rows = XLSX.utils.sheet_to_json(sheetFirst, {});
		console.log(rows);
		const { valid, msg, rowsNew } = validate(rows);
		if (!valid) {
			alert(msg);
			return;
		}
		global.rows = rowsNew;
		$("#fileNm").val(file.name);	//파일 이름 추가
	});

	$("#saveBtn").click(function(){
		if (global.rows.length === 0) {
			alert("업로드할 파일을 선택하지 않았습니다.");
			return;
		}
		console.log(global.rows);

		$.ajax({
			url: "/portal/sys/ctg/dts/insertDtsColDfndFromExcel.do",
			dataType: "json",
			data: { rows: JSON.stringify(global.rows) },
			type: "POST",
			async: false,
			success: function(response) {
				alert(GM.save_success);
				window.opener.$("#btnSearch").click();
				window.close();
			},
		})
	});
});

</script>
<div class="window_pop">
	<h1 class="title">엑셀업로드</h1>
	<div class="btn_info">
		<p></p>
		<div class="s_btn">
			<a href="/tmplFiles/DtsColDfndTemplate.xlsx"> 엑셀 템플릿 다운로드 </a>
		</div>
	</div>

	<select class="ad_select" id="prtiId"></select>

	<div class="pop_search">
		<p class="txt">업로드 파일 선택</p>
		<input type="text" class="ad_input" id="fileNm">
		<label for="file">
			<div class="btn_upload">파일선택</div>
			<input type="file" id="file">
		</label>
	</div>
	<div class="win_btn">
		<a href="javascript:void(0)" onclick="self.close();"> 닫기 </a>
		<a href="javascript:void(0)" id="saveBtn"> 확인 </a>
	</div>
</div>