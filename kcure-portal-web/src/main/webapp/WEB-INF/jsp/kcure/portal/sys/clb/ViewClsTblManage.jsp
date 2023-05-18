<%
/* =================================================================
 * @FileName : ViewClsTblManage.jsp
 * @date: 2023.02.01
 * @author : kyh
 * @설명 : 분류및테이블관리
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
var arrDtsLclsCd = new Array(); //배열선언
var arrDtsLclsNm = new Array(); //배열선언
<c:forEach items="${crcnNmList}" var="list" varStatus="rowInx">
	arrDtsLclsCd[${rowInx.index}] = '${list.detlCd}';
	arrDtsLclsNm[${rowInx.index}] = '${list.detlCdNm}';
</c:forEach>

//헤더 병합 Layout
var layout = [
	"dtsLclsCd",
	"lclsNm",
	"mclsNm",
	{
	    name: "tblNm",
	    direction: "horizontal",
	    items: [
		    "tblKnm",
		    "tblEnm"
	    ],
	    header: {
	    	text: "테이블명 *",
	    }
	},
	"tblOrd",
	"ldngDtrnCont",
	{
	    name: "collBldtColNm",
	    direction: "horizontal",
	    items: [
		    "collBldtColKnm",
		    "collBldtColEnm"
	    ],
	    header: {
	    	text: "수집일자 기준컬럼명",
	    }
	}
];
	
var gridColumns = [
	{

		header: {
			text: "암종 *"
		},
		name: "dtsLclsCd",
		fieldName: "dtsLclsCd",
		values: arrDtsLclsCd,
        labels: arrDtsLclsNm,
        type: "data",
		required: false,
		sortable: false,
		lookupDisplay: true,
		editor : {type: "dropdown"},
		styleName: "ud-column-center",
		tag: {
			dataType: "dropdown"
		}
	},
	{
		header: {
			text: "대분류 *"
		},
		name: "lclsNm",
		fieldName: "lclsNm",
        type: "data",
		required: false,
		sortable: false,
		lookupDisplay: true,
		editor : {type: "dropdown"},
		styleName: "ud-column-center",
		tag: {
			dataType: "dropdown"
		}
	},
	{
		header: {
			text: "중분류 *"
		},
		name: "mclsNm",
		fieldName: "mclsNm",
		type: "data",
		styleName: "ud-column-left",
		width: "150"
	},
	{
		header: {
			text: "한글 *"
		},
		name: "tblKnm",
		fieldName: "tblKnm",
		type: "data",
		styleName: "ud-column-left",
		editor: {
	        type: "line",
	        inputCharacters: "A-Za-zㄱ-힣_"
	    },
		width: "150"
	},
	{
		header: {
			text: "영문 *"
		},
		name: "tblEnm",
		fieldName: "tblEnm",
		type: "data",
		styleName: "ud-column-left",
		editor: {
	        type: "line",
	        inputCharacters: "A-Za-zㄱ-힣_"
	    },
		width: "150"
	},
	{
		header: {
			text: "테이블순번 *"
		},
		name: "tblOrd",
		fieldName: "tblOrd",
		type: "data",
		styleName: "ud-column-center",
		editor: {
	        type: "number",
	        maxLength: 3
	    }
	},
	{
		header: {
			text: "적재기간"
		},
		name: "ldngDtrnCont",
		fieldName: "ldngDtrnCont",
		type: "data",
		styleName: "ud-column-left"
	},
	{
		header: {
			text: "한글"
		},
		name: "collBldtColKnm",
		fieldName: "collBldtColKnm",
		type: "data",
		styleName: "ud-column-left",
		editor: {
	        type: "line",
	        inputCharacters: "A-Za-zㄱ-힣_"
	    },
		width: "150"
	},
	{
		header: {
			text: "영문"
		},
		name: "collBldtColEnm",
		fieldName: "collBldtColEnm",
		type: "data",
		styleName: "ud-column-left",
		editor: {
	        type: "line",
	        inputCharacters: "A-Za-zㄱ-힣_"
	    },
		width: "150"
	},
	{
		header: {
			text: "기존영문테이블명"
		},
		name: "oldTblEnm",
		fieldName: "oldTblEnm",
		type: "data",
		readOnly: true,
		visible: false
	}
];

var gridDataProvider, gridView;

$(document).ready(function() {
	//그리드
	gridDataProvider = new RealGrid.LocalDataProvider();
	gridView = new RealGrid.GridView('gridView');
	gridView.setDataSource(gridDataProvider);
	
	/* 자동 컬럼 크기 조절  */
	gridView.displayOptions.fitStyle = "fill";
	gridView.displayOptions.syncGridHeight = "always";
	
	var changeDropDown = function(key) {
		var acol = gridView.columnByName("lclsNm");
		
		if (key === "01") {
			var arrDtsMclsNm = new Array(); //배열선언
			<c:set var="looCnt" value="0" />
			<c:forEach items="${dtsMclsList}" var="list" varStatus="rowInx">
				<c:if test="${list.upDetlCd eq '01'}">
					arrDtsMclsNm[${looCnt}] = '${list.detlCdNm}';
					<c:set var="looCnt" value="${looCnt + 1}" />
				</c:if>
			</c:forEach>
			
			acol.values = arrDtsMclsNm;
			acol.labels = arrDtsMclsNm;
		} else if (key === "02") {
			var arrDtsMclsNm = new Array(); //배열선언
			<c:set var="looCnt" value="0" />
			<c:forEach items="${dtsMclsList}" var="list" varStatus="rowInx">
				<c:if test="${list.upDetlCd eq '02'}">
					arrDtsMclsNm[${looCnt}] = '${list.detlCdNm}';
					<c:set var="looCnt" value="${looCnt + 1}" />
				</c:if>
			</c:forEach>
			
			acol.values = arrDtsMclsNm;
			acol.labels = arrDtsMclsNm;
		} else if (key === "03") {
			var arrDtsMclsNm = new Array(); //배열선언
			<c:set var="looCnt" value="0" />
			<c:forEach items="${dtsMclsList}" var="list" varStatus="rowInx">
				<c:if test="${list.upDetlCd eq '03'}">
					arrDtsMclsNm[${looCnt}] = '${list.detlCdNm}';
					<c:set var="looCnt" value="${looCnt + 1}" />
				</c:if>
			</c:forEach>
			
			acol.values = arrDtsMclsNm;
			acol.labels = arrDtsMclsNm;
		} else if (key === "04") {
			var arrDtsMclsNm = new Array(); //배열선언
			<c:set var="looCnt" value="0" />
			<c:forEach items="${dtsMclsList}" var="list" varStatus="rowInx">
				<c:if test="${list.upDetlCd eq '04'}">
					arrDtsMclsNm[${looCnt}] = '${list.detlCdNm}';
					<c:set var="looCnt" value="${looCnt + 1}" />
				</c:if>
			</c:forEach>
			
			acol.values = arrDtsMclsNm;
			acol.labels = arrDtsMclsNm;
		} else {
			var arrDtsMclsNm = new Array(); //배열선언
			acol.values = arrDtsMclsNm;
			acol.labels = arrDtsMclsNm;
		}
		
		gridView.setColumn(acol);
	}
	
	gridView.onCurrentRowChanged = function (grid, oldRow, newRow) {
		if (newRow >= 0) {
			changeDropDown(grid.getValue(newRow, "dtsLclsCd"));
		}
	};
	
	//그리드 컬럼 특수문자 제한
	gridView.onEditRowChanged = function (grid, itemIndex, dataRow, field, oldValue, newValue) {
	    var v = grid.getValue(itemIndex, field);
	    var reg = /[`~!@#$%^&*()|+\=?;:'",<>\{\}\[\]\\\/]/gim;
	    var resultData = v.replace(reg, "");
	    
	    if (gridDataProvider.getOrgFieldName(field) === "dtsLclsCd") {
			if (oldValue !== newValue) {
				changeDropDown(newValue);
				gridView.commit();
				gridView.setValue(itemIndex, "lclsNm", null);
			}
		}
	    
	    gridView.commit();
	    
	    gridDataProvider.setValue(dataRow, field, resultData);
	    gridView.checkRow(itemIndex, true);
	};
	
	//헤더 병합 Layout 세팅
	gridView.setColumnLayout(layout);
	
	//그리드 컬럼 정보 세팅
	setFieldsNColumns(gridDataProvider, gridView, gridColumns);
	
	//초기 세팅(주의: 조회 함수 밑에 둬야 함)
	RG.initPattern({
		dataProviderPram : gridDataProvider,
		gridViewPram : gridView,
		gridCheckBoxFlag: true,
		form : "srchForm",
		editable : true,
		footerBarFlag : false
	});
	
	//인디케이터 설정
	gridView.setRowIndicator({visible: true});
	
	//상태바 설정
	gridView.setStateBar({visible: true});
	
	//체크바 설정
	gridView.setCheckBar({visible: true});
	
	/* 컬럼유효성 검사 S */
	var setValidateColumn = function() {
		gridView.onValidateColumn = function(grid, column, inserting, value) {
		    var error = {};
		    
		    if (column.fieldName === "dtsLclsCd"
			    || column.fieldName === "lclsNm"
				|| column.fieldName === "mclsNm"
				|| column.fieldName === "tblKnm"
				|| column.fieldName === "tblEnm"
			    || column.fieldName === "tblOrd") {
		        if (value == null) {
		            error.level = "error";
		            error.message = column.header.text.replace(" *", "") + "은(는) 필수값입니다.";
		        //} else if(column.fieldName === "tblKnm" && !chkValueFrm("kor", value.replace(/_/g, ""))) {
		        //    error.level = "error";
		        //    error.message = column.header.text.replace(" *", "") + "은(는) 한글만 입력가능합니다.";
		        } else if((column.fieldName === "tblKnm" || column.fieldName === "tblEnm") && !chkValueFrm("all", value.replace(/_/g, ""))) {
		            error.level = "error";
		            error.message = column.header.text.replace(" *", "") + "은(는) 한글, 영어, '_'만 입력가능합니다.";
		        } else if(column.fieldName === "tblOrd" && !chkValueFrm("num", value)) {
		            error.level = "error";
		            error.message = column.header.text.replace(" *", "") + "은(는) 숫자만 입력가능합니다.";
		        }
		    };
		    return error;
		}
	}
	
	setValidateColumn();
	/* 컬럼유효성 검사 E */
	
	/* 조회 버튼 클릭 S */
	var searchList = function() {
		RG.doQuery({
			action : "/portal/sys/clb/tbl/selectClsTblList.do",
			form : "srchForm",
			dataProviderPram : gridDataProvider,
			gridViewPram : gridView,
			endEvent: srchEndEvent
		});
	}
	
	$("#srchBtn").click(function() {
		searchList();
	});
	
	var srchEndEvent = function(endEventParam, response) {
		console.log("--------------------srchEndEvent---------------------");
		console.log(endEventParam);
		console.log(response);
		
		if (gridDataProvider.getRowCount() < 1) {
			alert("조회 결과가 없습니다.");
		}
		
		console.log("--------------------srchEndEvent---------------------");
	}
	/* 조회 버튼 클릭 E */
	
	/* 초기화 버튼 클릭 S */
	$("#initBtn").click(function(){
		$("#srchDtsLclsCd0").prop("checked", true);
		searchList();
	});
	/* 초기화 버튼 클릭 E */
	
	/* 행추가 버튼 클릭 S */
	$("#addBtn").click(function() {
		RG.insertRowGrid({
			dataProviderPram : gridDataProvider,
			dataValues:[],
			endEvent: addEndEvent
		});
	});
	
	var addEndEvent = function() {
		console.log("--------------------addEndEvent---------------------");
		console.log("--------------------addEndEvent---------------------");
	}
	/* 행추가 버튼 클릭 E */
	
	/* 삭제 버튼 클릭 S */
	$("#delBtn").click(function() {
	    var rows = gridView.getCheckedRows();

		if(rows.length > 0){
			RG.deleteRowGrid({
				gridViewPram: gridView
				, dataProviderPram: gridDataProvider
			});
		}else{
			alert("선택된 값이 없습니다.");
		}
	});
	/* 삭제 버튼 클릭 E */
	
	/* 저장 버튼 클릭 S */
	$("#saveBtn").click(function() {
		var log = gridView.validateCells(null, false);
		
		if (log !== null) {
			alert("입력된 값을 확인해 주세요");
			return;
		}
	    
		/*
		 * parameter: json 타입
	     *            action : 호출할 url
	     *            endEvent : 저장 이후 처리되는 함수 설정
	     *            endPram : endEvent에 넘길 파라미터
	     *            dataProviderPram : 조회된 리턴값 dataProvider
	     *            gridViewPram : 그리드 ID
	     *            checkBinding : 입력한 스트링값에 대해서 변수를 설정하고, 그 변수에 Y,N값을 체크에 따라서 설정하게 함
	     * ex : action : "/stock/report/searchStkReportDestructionListTest.action" ,
	     *            form : "srchForm",
	     *            endEvent : fnCall
	     *            endPram : "스트링,json,숫자"
	     *            dataProviderPram : dataProvider,
	     *            gridViewPram : realgrid
	     *            checkBinding : "checked"
	     */
	    var rows = gridView.getCheckedRows();

		if(rows.length > 0){
			RG.doSave({
				action : "/portal/sys/clb/tbl/saveClsTbl.do" ,
				endEvent : saveEndEvent,
				dataProviderPram : gridDataProvider,
				gridViewPram : gridView,
				showEndMessage:true,
				cud: ["C","U","D"]
			});
		}else{
			alert("선택된 값이 없습니다.");
			return;
		}
	});

	/*저장 후 실행 function  */
	var saveEndEvent = function() {
		console.log("--------------------saveEndEvent---------------------");
		location.reload(true);
		console.log("--------------------saveEndEvent---------------------");
	}
	/* 저장 버튼 클릭 E */
	
	/* 엑셀업로드 버튼 클릭 S */
	$("#xlsUploadBtn").click(function() {
		window.open("/portal/sys/clb/tbl/tblXlsUploadPopup.do?xlsGbn=clsTbl","xlsUp","scrollbars=no, resizable=no");
	});
	/* 엑셀업로드 버튼 클릭 E */
	
	/* 조회 */
	searchList();
});

function process_wb(wb, varDtsLclsCd) {
	var output = "";
	output = to_json(wb);
	var sheetNames = Object.keys(output);
	if (sheetNames.length > 0) {
		var colsObj = output[sheetNames][0];
		
		if (colsObj) {
			var data = output[sheetNames];
			
			var mappedData = data.map(item => {
				return {
					//crcnNm: item.암종,
					dtsLclsCd: varDtsLclsCd,
					lclsNm: item.대분류,
					tblOrd: item.테이블순번,
					mclsNm: item.중분류,
					tblKnm: item.한글테이블명,
					tblEnm: item.영문테이블명,
					ldngDtrnCont: item.적재기간,
					collBldtColKnm: item.수집기준일자컬럼명,
					collBldtColEnm: item.수집기준일자영문컬럼명,
					oldTblEnm: item.영문테이블명
				};
			});
			
			gridDataProvider.fillJsonData(mappedData, {  });
			
			var rows = gridDataProvider.getRowStateCount("none");

			for (i = 0; i < rows ; i++) {
				gridDataProvider.setRowState(i, "created", true);
				//changeDropDown(newValue);
				gridView.checkRow(i, true);
			}
		}
	}
}

function to_json(workbook) {
	var result = {};
	workbook.SheetNames.forEach(function (sheetName) {
		var roa = XLSX.utils.sheet_to_row_object_array(workbook.Sheets[sheetName], {rawNumbers: true});
		
		if (roa.length > 0) {
			result[sheetName] = roa;
		}
	});
	return result;
}
</script>

<!-- container -->
	<div class="wrap">
		<div class="con">
			<div class="area_wrap">
				<div class="section">
					<div class="btn_info">
						<!-- p테그는 남겨줘야 자동으로 버튼이 오른쪽 정렬 -->
						<p></p>
						<div class="s_btn">
							<a href="javascript:void(0)" id="srchBtn">조회</a>
							<a href="javascript:void(0)" id="initBtn">초기화</a>
						</div>
					</div>
					<form id="srchForm" name="srchForm" method="post">
						<div class="search_wrap">
							<div class="item">
								<h4>암종</h4>
								<div class="radio_wrap">
									<label>
										<input type="radio" id="srchDtsLclsCd0" name="srchDtsLclsCd" value="" checked="checked" class="frmChk" data-gtm-form-interact-field-id="0">
										<span class="radio_mark"></span><span>전체</span>
									</label>
									<c:forEach items="${crcnNmList}" var="list" varStatus="rowInx">
										<label>
											<input type="radio" id="srchDtsLclsCd${rowInx.count}" name="srchDtsLclsCd" value="${list.detlCd}" class="frmChk" data-gtm-form-interact-field-id="${rowInx.count}">
											<span class="radio_mark"></span><span>${list.detlCdNm}</span>
										</label>
									</c:forEach>
								</div>
							</div>
						</div>
					</form>
					<div class="btn_info">
						<!-- p테그는 남겨줘야 자동으로 버튼이 오른쪽 정렬 -->
						<p></p>
						<div class="s_btn">
							<a href="javascript:void(0)" id="addBtn">신규</a>
							<a href="javascript:void(0)" id="delBtn">삭제</a>
							<a href="javascript:void(0)" id="saveBtn">저장</a>
							<a href="javascript:void(0)" id="xlsUploadBtn">엑셀업로드</a>
						</div>
					</div>
					
					<div class="grid_area_wrap" id="gridView"></div>
				</div>
			</div>
		</div>
	</div>
<!-- //container -->