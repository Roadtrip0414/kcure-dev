<%
/* =================================================================
 * @FileName : DvzMenuXlsUploadPopup.jsp
 * @date: 2023.02.01
 * @author : kyh
 * @설명 : 엑셀업로드팝업
 * =================================================================
 * 수정일         작성자             내용
 * -----------------------------------------------------------------------
 * 2023.02.01     kyh           파일생성
 * =================================================================
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
var fileEvent;

$(document).ready(function() {
	/* 엑셀템플릿 다운로드 버튼 클릭 S */
	$("#tmpltDownBtn").click(function(){
		location.href = "/tmplFiles/Template_dvzMenuList.xlsx";
	});
	/* 엑셀템플릿 다운로드 버튼 클릭 E */

	/* 닫기 버튼 클릭 S */
	$("#popCloseBtn").click(function(){
		window.close();
	});
	/* 닫기 버튼 클릭 E */

	//$("#file").bind("change", handleXlsFile);
	$("#file").bind("change", fileNmChg);

	/* 처리하기 버튼 클릭 S */
	$("#xlsProcBtn").click(function(){
		handleXlsFile(fileEvent);
	});
	/* 처리하기 버튼 클릭 E */
});

function fileNmChg(e) {
	fileEvent = e;
	$("#fileNm").val($("#file").val());
}

function fixdata(data) {
	var o = "", l = 0, w = 10240;
	for (; l < data.byteLength / w; ++l) o += String.fromCharCode.apply(null, new Uint8Array(data.slice(l * w, l * w + w)));
	o += String.fromCharCode.apply(null, new Uint8Array(data.slice(l * w)));
	return o;
}

function handleXlsFile(e) {
	var files = e.target.files;
	var i, f;
	for (i = 0, f = files[i]; i != files.length; ++i) {
		var reader = new FileReader();
		var name = f.name;
		reader.onload = function (e) {
			var data = e.target.result;

			var arr = fixdata(data);
			workbook = XLSX.read(btoa(arr), { type: "base64", cellText: true, cellDates: true });

			window.opener.process_wb(workbook);
		};

		reader.readAsArrayBuffer(f);
	}

	window.close();
}
</script>

<!-- container -->
	<div class="window_pop">
		<h1 class="title">엑셀업로드</h1>
		<div class="btn_info">
			<!-- p테그는 남겨줘야 자동으로 버튼이 오른쪽 정렬 -->
			<p></p>
			<div class="s_btn">
				<a href="javascript:void(0)" id="tmpltDownBtn">엑셀템플릿 다운로드</a>
			</div>
		</div>
		<div class="pop_search">
			<p class="txt">업로드 파일 선택</p>
			<input type="text" name="fileNm" id="fileNm" class="ad_input" value="" readonly/>
			<label for="file">
				<div class="btn_upload">파일선택</div>
				<input type="file" name="file" id="file" accept=".xlsx"/>
			</label>
		</div>
		<div class="win_btn">
			<a href="javascript:void(0)" id="popCloseBtn">닫기</a>
			<a href="javascript:void(0)" id="xlsProcBtn">처리하기</a>
		</div>
	</div>
<!-- //container -->