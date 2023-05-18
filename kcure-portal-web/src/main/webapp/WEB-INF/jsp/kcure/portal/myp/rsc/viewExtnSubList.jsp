

<%
/* =================================================================
 * @FileName : ViewMypRscInfApl.jsp
 * @date: 2023.05.09
 * @author : kyh
 * @설명 : 마이페이지 보관연장 상세 리스트
 * =================================================================
 * 수정일         작성자             내용
 * -----------------------------------------------------------------------
 * 2023.05.09     shpark           파일생성
 * =================================================================
 */
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>
<script type="text/javascript">

var gridColumns_${extnVO.rsrAsmtNo} = [
	{
		header: {
			text: "구분"
		},
		name: "extdStnm",
		fieldName: "extdStnm",
		type: "data",
		styleName: "ud-column-center",
	},
	{
		header: {
			text: "요청기간(보관/연장)"
		},
		name: "reqExtdDtm",
		fieldName: "reqExtdDtm",
		type: "data",
		styleName: "ud-column-center",
	},
	{
		header: {
			text: "신청자"
		},
		name: "reqUserNm",
		fieldName: "reqUserNm",
		type: "data",
		styleName: "ud-column-center",
	},
	{
		header: {
			text: "신청일"
		},
		name: "reqDtm",
		fieldName: "reqDtm",
		type: "data",
		styleName: "ud-column-center",
	},
	{
		name: "extdStcd",
		fieldName: "extdStcd",
		visible: false,
	},
	{
		name: "extdProgStcd",
		fieldName: "extdProgStcd",
		visible: false,
	},
	{
		name: "rsrAsmtNo",
		fieldName: "rsrAsmtNo",
		visible: false,
	},
	{
		name: "extdAplcNo",
		fieldName: "extdAplcNo",
		visible: false,
	},
	{
		name: "dataAplcNo",
		fieldName: "dataAplcNo",
		visible: false,
	},
	{
		name: "pblStlmCmptId",
		fieldName: "pblStlmCmptId",
		visible: false,
	},
	{
		name: "rjcRsnCont",
		fieldName: "rjcRsnCont",
		visible: false,
	},
	
	
	{
		header: {
			text: "상태"
		},
		name: "extdProgStnm",
		fieldName: "extdProgStnm",
		styleName: "ud-column-center",
		renderer: {
			type:"html",
			callback: function(grid, cell, w, h) {
				var rsrAsmtNo = grid.getValue(cell.index.dataRow, 'rsrAsmtNo');
				var extdAplcNo = grid.getValue(cell.index.dataRow, 'extdAplcNo');
				var dataAplcNo = grid.getValue(cell.index.dataRow, 'dataAplcNo');
				var extdProgStcd = grid.getValue(cell.index.dataRow, 'extdProgStcd');
				var extdProgStnm = grid.getValue(cell.index.dataRow, 'extdProgStnm');
				var extdStcd = grid.getValue(cell.index.dataRow, 'extdStcd');
				var pblStlmCmptId = grid.getValue(cell.index.dataRow, 'pblStlmCmptId');
				var rjcRsnCont = grid.getValue(cell.index.dataRow, 'rjcRsnCont');
				
				//반려 U03
				if (extdProgStcd === "U03") {
					return `<a onclick="fnExtnRsnPopup('` + cell.index.dataRow + `')">` + extdProgStnm + `</a>`;
				}else{
					return `<a onclick="fnExtnPayPopup('` + rsrAsmtNo + `', '` + extdAplcNo + `', '` + dataAplcNo + `', '` + extdStcd + `')">` + extdProgStnm + `</a>`;
				}
				/*
				// U02: 승인(결제하기)
				if (extdProgStcd === "U02") {
					if (pblStlmCmptId) {
						return extdProgStnm.replace("결제하기", "결제완료");
					} else {
						return `<a onclick="fnExtnPayPopup('` + rsrAsmtNo + `', '` + extdAplcNo + `', '` + dataAplcNo + `', '` + extdStcd + `')">` + extdProgStnm + `</a>`;
					}
				} else {
					return extdProgStnm;
				}
				*/
			}
		}
	}
];


//그리드
var gridDataProvider_${extnVO.rsrAsmtNo} = new RealGrid.LocalDataProvider();
var gridView_${extnVO.rsrAsmtNo} = new RealGrid.GridView('gridView_${extnVO.rsrAsmtNo}');

//반려사유 보기.	
var fnExtnRsnPopup = function(index){
	$('#rjcRsnCont').val(gridView_${extnVO.rsrAsmtNo}.getValue(index, 'rjcRsnCont'));
	$('#rjcRsnPopup').addClass('on');
	
}

$(document).ready(function() {
	
	gridView_${extnVO.rsrAsmtNo}.setDataSource(gridDataProvider_${extnVO.rsrAsmtNo});
	
	/* 자동 컬럼 크기 조절  */
	gridView_${extnVO.rsrAsmtNo}.displayOptions.fitStyle = "fill";
	gridView_${extnVO.rsrAsmtNo}.displayOptions.syncGridHeight = "always";

	//그리드 컬럼 정보 세팅
	setFieldsNColumns(gridDataProvider_${extnVO.rsrAsmtNo}, gridView_${extnVO.rsrAsmtNo}, gridColumns_${extnVO.rsrAsmtNo});

	//초기 세팅(주의: 조회 함수 밑에 둬야 함)
	RG.initPattern({
		dataProviderPram : gridDataProvider_${extnVO.rsrAsmtNo},
		gridViewPram : gridView_${extnVO.rsrAsmtNo},
		gridCheckBoxFlag: false,
		editable : false,
		footerBarFlag : false
	});

	//인디케이터 설정
	gridView_${extnVO.rsrAsmtNo}.setRowIndicator({visible: true});

	//상태바 설정
	gridView_${extnVO.rsrAsmtNo}.setStateBar({visible: false});

	//체크바 설정
	gridView_${extnVO.rsrAsmtNo}.setCheckBar({visible: false});

	/* 조회 버튼 클릭 S */
	var searchList_${extnVO.rsrAsmtNo} = function() {
		RG.doQuery({
			action : "/portal/myp/rsc/inf/selectExtnSubList.do",
			form : "schForm_${extnVO.rsrAsmtNo}",
			dataProviderPram : gridDataProvider_${extnVO.rsrAsmtNo},
			gridViewPram : gridView_${extnVO.rsrAsmtNo},
			endEvent: srchEndEvent_${extnVO.rsrAsmtNo}
		});
	}

	var srchEndEvent_${extnVO.rsrAsmtNo} = function(endEventParam, response) {

		if (gridDataProvider_${extnVO.rsrAsmtNo}.getRowCount() < 1) {
			alert("조회 결과가 없습니다.");
			subListBtnClose('${extnVO.rsrAsmtNo}');
		}
	}
	
	
	
	searchList_${extnVO.rsrAsmtNo}();
});




</script>
<form method="post" id="schForm_${extnVO.rsrAsmtNo}" name="schForm_${extnVO.rsrAsmtNo}" style="display: none;">
	<input type="hidden" name="rsrAsmtNo" value="${extnVO.rsrAsmtNo}">
</form>
<%-- ${extnVO.rsrAsmtNo} --%>

<div class="grid_area_wrap" id="gridView_${extnVO.rsrAsmtNo}"></div>


