<%
/* =================================================================
 * @FileName : viewClsColManage.jsp
 * @date: 2023.02.01
 * @author : kyh
 * @설명 : 항목관리
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
var treeColumns = [
	{
		header: {
			text: "분류"
		},
		name: "treeVwNm",
		fieldName: "treeVwNm",
		type: "data",
		styleName: "ud-column-center"
	},
	{
		header: {
			text: "메뉴ID"
		},
		name: "treeOrdId",
		fieldName: "treeOrdId",
		type: "data",
		styleName: "ud-column-center",
		visible: false
	},
	{
		header: {
			text: "암종"
		},
		name: "crcnNm",
		fieldName: "crcnNm",
		type: "data",
		styleName: "ud-column-left",
		visible: false
	},
	{
		header: {
			text: "대분류"
		},
		name: "lclsNm",
		fieldName: "lclsNm",
		type: "data",
		styleName: "ud-column-left",
		visible: false
	},
	{
		header: {
			text: "중분류"
		},
		name: "mclsNm",
		fieldName: "mclsNm",
		type: "data",
		styleName: "ud-column-left",
		visible: false
	},
	{
		header: {
			text: "테이블한글명"
		},
		name: "tblKnm",
		fieldName: "tblKnm",
		type: "data",
		styleName: "ud-column-left",
		visible: false
	},
	{
		header: {
			text: "테이블영문명"
		},
		name: "tblEnm",
		fieldName: "tblEnm",
		type: "data",
		styleName: "ud-column-left",
		visible: false
	},
	{
		header: {
			text: "컬럼영문명"
		},
		name: "colEnm",
		fieldName: "colEnm",
		type: "data",
		styleName: "ud-column-left",
		visible: false
	},
	{
		header: {
			text: "컬럼한글명"
		},
		name: "colKnm",
		fieldName: "colKnm",
		type: "data",
		styleName: "ud-column-left",
		visible: false
	},
	{
		header: {
			text: "데이터셋대분류코드"
		},
		name: "dtsLclsCd",
		fieldName: "dtsLclsCd",
		type: "data",
		styleName: "ud-column-left",
		visible: false
	}
];

//헤더 병합 Layout
var layout = [
	"crcnNm",
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
	{
	    name: "colNm",
	    direction: "horizontal",
	    items: [
		    "colKnm",
		    "colEnm"
	    ],
	    header: {
	    	text: "항목명 *",
	    }
	},
	"colOrd",
	"dataTpCont",
	"pkOrd",
	"domnNm",
	"colExplCont",
	"colVlCont"
];
	
var gridColumns = [
	{
		header: {
			text: "암종"
		},
		name: "crcnNm",
		fieldName: "crcnNm",
		type: "data",
		styleName: "ud-column-left",
		readOnly: true
	},
	{
		header: {
			text: "대분류"
		},
		name: "lclsNm",
		fieldName: "lclsNm",
		type: "data",
		styleName: "ud-column-left",
		readOnly: true,
		width: "150"
	},
	{
		header: {
			text: "중분류"
		},
		name: "mclsNm",
		fieldName: "mclsNm",
		type: "data",
		styleName: "ud-column-left",
		readOnly: true,
		width: "150"
	},
	{
		header: {
			text: "한글"
		},
		name: "tblKnm",
		fieldName: "tblKnm",
		type: "data",
		styleName: "ud-column-left",
		readOnly: true,
		width: "150"
	},
	{
		header: {
			text: "영문"
		},
		name: "tblEnm",
		fieldName: "tblEnm",
		type: "data",
		styleName: "ud-column-left",
		readOnly: true,
		width: "150"
	},
	{
		header: {
			text: "한글 *"
		},
		name: "colKnm",
		fieldName: "colKnm",
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
		name: "colEnm",
		fieldName: "colEnm",
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
			text: "항목순번 *"
		},
		name: "colOrd",
		fieldName: "colOrd",
		type: "data",
		styleName: "ud-column-center",
		editor: {
	        type: "number",
	        maxLength: 3
	    }
	},
	{
		header: {
			text: "데이터타입 *"
		},
		name: "dataTpCont",
		fieldName: "dataTpCont",
		type: "data",
		styleName: "ud-column-left",
		width: "150"
	},
	{
		header: {
			text: "PK"
		},
		name: "pkOrd",
		fieldName: "pkOrd",
		type: "data",
		styleName: "ud-column-left"
	},
	{
		header: {
			text: "도메인명"
		},
		name: "domnNm",
		fieldName: "domnNm",
		type: "data",
		styleName: "ud-column-left",
		width: "150"
	},
	{
		header: {
			text: "설명"
		},
		name: "colExplCont",
		fieldName: "colExplCont",
		type: "data",
		styleName: "ud-column-left",
		editor: {
	        type: "line"
	    },
		width: "150"
	},
	{
		header: {
			text: "값"
		},
		name: "colVlCont",
		fieldName: "colVlCont",
		type: "data",
		styleName: "ud-column-left",
		editor: {
	        type: "line"
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
	},
	{
		header: {
			text: "기존영문컬럼명"
		},
		name: "oldColEnm",
		fieldName: "oldColEnm",
		type: "data",
		readOnly: true,
		visible: false
	}
];

var gridDataProvider, gridView;

$(document).ready(function() {
	/* 트리그리드 셋팅 S */
		//그리드
		var treeDataProvider = new RealGrid.LocalTreeDataProvider();
		var treeView = new RealGrid.TreeView('treeView');
		treeView.setDataSource(treeDataProvider);
		/* 자동 컬럼 크기 조절  */
		treeView.displayOptions.fitStyle = "fill";
		treeView.displayOptions.syncGridHeight = "always";
		
		treeView.treeOptions.expanderIconStyle = "square";
		treeView.editOptions.movable = true;
		treeView.editOptions.rowMovable = true;
		
		//그리드 컬럼 정보 세팅
		setFieldsNColumns(treeDataProvider, treeView, treeColumns);
		
		//초기 세팅(주의: 조회 함수 밑에 둬야 함)
		RG.initPattern({
			dataProviderPram : treeDataProvider,
			gridViewPram : treeView,
			gridCheckBoxFlag: false,
			form : "srchForm",
			editable : false,
			footerBarFlag : false
		});
		
		//인디케이터 설정
		treeView.setRowIndicator({visible: true});
		
		//상태바 설정
		treeView.setStateBar({visible: false});
		
		//체크바 설정
		treeView.setCheckBar({visible: false});
		
		/* 그리드 클릭이벤트 S */
		treeView.onCellClicked = function (grid, clickData) {
			var jsonObj = JSON.parse(JSON.stringify(clickData));
			
			if (jsonObj.cellType !== "header" && jsonObj.column === "treeVwNm") {
				var treeCurr = treeView.getCurrent();
				var treeObj = treeDataProvider.getJsonRow(treeCurr.dataRow)
				//alert(treeObj.dtsLclsCd);
				$("#dtsLclsCd").val(treeObj.dtsLclsCd);
				$("#lclsNm").val(treeObj.lclsNm);
				$("#mclsNm").val(treeObj.mclsNm);
				$("#tblKnm").val(treeObj.tblKnm);
				$("#tblEnm").val(treeObj.tblEnm);
				$("#colEnm").val(treeObj.colEnm);
				
				searchList();
			}
		}
		/* 그리드 클릭이벤트 E */
	/* 트리그리드 셋팅 E */
	
	/* 일반그리드 셋팅 S */
		//그리드
		gridDataProvider = new RealGrid.LocalDataProvider();
		gridView = new RealGrid.GridView('gridView');
		gridView.setDataSource(gridDataProvider);
		
		/* 자동 컬럼 크기 조절  */
		gridView.displayOptions.fitStyle = "fill";
		gridView.displayOptions.syncGridHeight = "always";
		
		//그리드 컬럼 특수문자 제한
		gridView.onEditRowChanged = function (grid, itemIndex, dataRow, field, oldValue, newValue) {
		    var v = grid.getValue(itemIndex, field);
		    var reg = /[`~!@#$%^&*|+\=?;:'",<>\{\}\[\]\\\/]/gim;
		    var resultData = v.replace(reg, "");		
		    
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
			    if (column.fieldName === "tblKnm"
				    || column.fieldName === "tblEnm"
				    || column.fieldName === "colKnm"
					|| column.fieldName === "colEnm"
				    || column.fieldName === "colOrd"
					|| column.fieldName === "dataTpCont") {
			        if (value == null) {
			            error.level = "error";
			            error.message = column.header.text.replace(" *", "") + "은(는) 필수값입니다.";
			        } else if((column.fieldName === "tblKnm" || column.fieldName === "tblEnm" || column.fieldName === "colKnm" || column.fieldName === "colEnm") && !chkValueFrm("all", value.replace(/_/g, ""))) {
			            error.level = "error";
			            error.message = column.header.text.replace(" *", "") + "은(는) 한글, 영어, '_'만 입력가능합니다.";
			        } else if(column.fieldName === "colOrd" && !chkValueFrm("num", value)) {
			            error.level = "error";
			            error.message = column.header.text.replace(" *", "") + "은(는) 숫자만 입력가능합니다.";
			        }
			    };
			    return error;
			}
		}
		
		setValidateColumn();
	/* 일반그리드 셋팅 E */
	
	/* 조회 버튼 클릭 S */	
	var searchList = function() {	
		RG.doQuery({
			action : "/portal/sys/clb/col/selectClsColList.do",
			form : "srchForm",
			dataProviderPram : gridDataProvider,
			gridViewPram : gridView,
			pagingId:"grid_paging",
			totalId: "totalCnt",
			currCntId: "currCnt",
			endEvent: srchEndEvent
		});
	}
	
	var srchEndEvent = function(endEventParam, response) {
		console.log("--------------------srchEndEvent---------------------");
		console.log(endEventParam);
		console.log(response);
		
		if (gridDataProvider.getRowCount() < 1) {
			alert("조회 결과가 없습니다.");
		}
		
		console.log("--------------------srchEndEvent---------------------");
	}
	
	var searchTreeList = function() {
		viewParamCls();
		
		$("#dtsLclsCd").val($('input[name=srchDtsLclsCd]:checked').val());
		
		RG.doQueryTree({
			action : "/portal/sys/clb/col/selectClsTblColTreeList.do",
			form : "srchForm",
			dataProviderPram : treeDataProvider,
			gridViewPram : treeView,
			endEvent: srchTreeEndEvent,
			treeField: "treeOrdId",
			childrenField: "",
			iconField:""
		});
		
		searchList();
	}
	
	$("#srchBtn").click(function() {
		searchTreeList();
	});
	
	var srchTreeEndEvent = function(endEventParam, response) {
		console.log("--------------------srchEndEvent---------------------");
		console.log(endEventParam);
		console.log(response);
		//treeView.expandAll();
		console.log("--------------------srchEndEvent---------------------");
	}
	/* 조회 버튼 클릭 E */
	
	/* 초기화 버튼 클릭 S */
	$("#initBtn").click(function(){
		$("#srchDtsLclsCd0").prop("checked", true);
		
		viewParamCls();
		
		searchTreeList();
	});
	/* 초기화 버튼 클릭 E */
	
	searchTreeList();
	
	/* 행추가 버튼 클릭 S */
	$("#addBtn").click(function() {
		if ($("#mclsNm").val() == "") {
			alert("중분류까지 선택해야 입력이 가능합니다.");
			return;
		}
		
		RG.insertRowGrid({
			dataProviderPram : gridDataProvider,
			//dataValues:[],
			DataValues: {dtsLclsCd: $("#dtsLclsCd").val(), lclsNm: $("#lclsNm").val(), mclsNm: $("#mclsNm").val(), tblKnm: $("#tblKnm").val(), tblEnm: $("#tblEnm").val()},
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
				action : "/portal/sys/clb/col/saveClsCol.do" ,
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
		window.open("/portal/sys/clb/col/tblXlsUploadPopup.do?xlsGbn=clsTblCol","xlsUp","scrollbars=no, resizable=no");
	});
	/* 엑셀업로드 버튼 클릭 E */
});

function viewParamCls() {
	$("#dtsLclsCd").val("");
	$("#lclsNm").val("");
	$("#mclsNm").val("");
	$("#tblKnm").val("");
	$("#tblEnm").val("");
	$("#colEnm").val("");
}

function process_wb(wb) {	
	var output = "";
	var reg = /[`~!@#$%^&*|+\=?;:'",<>\{\}\[\]\\\/]/gim;
	
	output = to_json(wb);
	var sheetNames = Object.keys(output);
	if (sheetNames.length > 0) {
		var colsObj = output[sheetNames][0];
		
		if (colsObj) {
			var data = output[sheetNames];
			
			var mappedData = data.map(item => {
				return {
					tblKnm: item.한글테이블명,
					tblEnm: item.영문테이블명,
					colOrd: item.컬럼순번,
					colKnm: item.한글컬럼명,
					colEnm: item.영문컬럼명,
					dataTpCont: item.데이터타입,
					pkOrd: item.PK,
					domnNm: item.도메인명,
					colExplCont: item.설명 ? String(item.설명).replace(reg, "") : item.설명,
					colVlCont: item.값 ? String(item.값).replace(reg, "") : item.값,
					oldTblEnm: item.영문테이블명,
					oldColEnm: item.영문컬럼명
				};
			});
			
			gridDataProvider.fillJsonData(mappedData, {  });
			
			var rows = gridDataProvider.getRowStateCount("none");

			for (i = 0; i < rows ; i++) {
				gridDataProvider.setRowState(i, "created", true);
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

<style>
.admin .section .column{
	grid-template-columns: 25% 73%;
}
</style>

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
						<input type="hidden" name="dtsLclsCd" id="dtsLclsCd" value=""/>
						<input type="hidden" name="lclsNm" id="lclsNm" value=""/>
						<input type="hidden" name="mclsNm" id="mclsNm" value=""/>
						<input type="hidden" name="tblKnm" id="tblKnm" value=""/>
						<input type="hidden" name="tblEnm" id="tblEnm" value=""/>
						<input type="hidden" name="colEnm" id="colEnm" value=""/>
					</form>
					
					<div class="btn_info">
						<!-- p테그는 남겨줘야 자동으로 버튼이 오른쪽 정렬 -->
						<p>총건수 <span><span id="currCnt"/></span> /<span id="totalCnt"/></p>
						<div class="s_btn">
							<a href="javascript:void(0)" id="addBtn">신규</a>
							<a href="javascript:void(0)" id="delBtn">삭제</a>
							<a href="javascript:void(0)" id="saveBtn">저장</a>
							<a href="javascript:void(0)" id="xlsUploadBtn">엑셀업로드</a>
						</div>
					</div>
					
					<div class="column">
						<div class="left">
							<div class="grid_area_wrap" id="treeView"></div>
						</div>
						<div class="right">
							<div class="grid_area_wrap" id="gridView"></div>
							<div id="grid_paging" class="page_num"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<!-- //container -->