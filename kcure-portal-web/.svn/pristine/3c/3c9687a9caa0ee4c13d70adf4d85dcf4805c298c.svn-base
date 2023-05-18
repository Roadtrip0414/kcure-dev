
<%
/* =================================================================
* @FileName : ViewCdsDfndManage.jsp
* @date: 2023. 2. 2.
* @author : parkgu
* @설명 :
* =================================================================
* 수정일 작성자 내용
* -----------------------------------------------------------------------
* 2023. 2. 2. parkgu 파일생성
* =================================================================
*/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>
<script type="text/javascript">
var gridColumns = [
	{
		header: {
			text: "코드목록ID"
		},
		name: "grpCd",
		fieldName: "grpCd",
		type: "data",
	    editor : {
	        type: "line",
	        ignoreCharacters: "ㄱ-힣",
	        maxLength: 100
	    },
		required: true,
		styleName: "ud-column-center",
	    styleCallback: function(grid, dataCell){
	        var ret = {}

	        if(dataCell.item.rowState == 'created' || dataCell.item.itemState == 'appending' || dataCell.item.itemState == 'inserting'){
	          ret.editable = true;
	        } else {
	          ret.editable = false;
	        }

	        return ret;
		}
	},
	{

		header: {
			text: "코드목록명"
		},
		name: "grpCdNm",
		required: true,
		fieldName: "grpCdNm",
		type: "data",
		tag: {
			dataType: "text"
		},
		styleName: "ud-column-center"
	},
	{

		header: {
			text: "코드설명"
		},
		name: "grpCdExplCont",
		fieldName: "grpCdExplCont",
		type: "data",
		tag: {
			dataType: "text"
		},
		styleName: "ud-column-left"
	},
	{

		header: {
			text: "상위코드목록ID"
		},
		width: 60,
		name: "grpCdOputOrd",
		fieldName: "grpCdOputOrd",
		type: "data",
		tag: {
			dataType: "text"
		},
		styleName: "ud-column-center"
	},
	{

		header: {
			text: "사용여부"
		},
		name: "grpCdUseYn",
		fieldName: "grpCdUseYn",
		values: ['Y', 'N'],
        labels: ['사용', '미사용'],
        type: "data",
		width : 50,
		required: true,
		sortable: false,
		lookupDisplay: true,
		editor : {type: "dropdown"},
		styleName: "ud-column-center",
		tag: {
			dataType: "dropdown"
		}
	},
// 	{
// 		header: {
// 			text: "상세조회"
// 		},
// 		width : 55,
// 		editable:false,
// 		name: "hstView",
// 		fieldName: "hstView",
// 		styleName: "ud-column-center",
// 		renderer:{
// 		      type:"html",
// 		      callback: function(grid, cell, w, h) {
// 		    	  var grpCd = grid.getValue(cell.index.dataRow, 'grpCd');
// 		          var str = '<button id="hideShowButton" class="btn" onclick="fnViewHstBtn(\''+grpCd+'\');">상세조회</button>';
// 		          return str;
// 			   }
// 		}
// 	},
	{
		header: {
			text: "등록일"
		},
		name: "frstRgstDt",
		fieldName: "frstRgstDt",
		editable:false,
		type: "data",
		tag: {
			dataType: "text"
		},
		styleName: "ud-column-center",
	},
	{
		header: {
			text: "데이터셋공통코드여부"
		},
		name: "dtsComCdYn",
		fieldName: "dtsComCdYn",
		type: "data",
		styleName: "ud-column-left",
		visible: false
	}
];

//디테일코드 그리드 셋팅 start
var gridColumns2 = [
   {
		header: {
			text: "코드목록ID"
		},
		required : true,
		name: "grpCd",
		fieldName: "grpCd",
		type: "data",
	    editor : {
	        type: "line",
	        ignoreCharacters: "ㄱ-힣",
	        maxLength: 100
	    },
		styleName: "ud-column-center",
	    styleCallback: function(grid, dataCell){
	        var ret = {}

	        if(dataCell.item.rowState == 'created' || dataCell.item.itemState == 'appending' || dataCell.item.itemState == 'inserting'){
	          ret.editable = true;
	        } else {
	          ret.editable = false;
	        }

	        return ret;
		},
		width: 150
	},
	{

		header: {
			text: "코드ID"
		},
		required : true,
		name: "detlCd",
		fieldName: "detlCd",
		type: "data",
	    editor : {
	        type: "line",
	        ignoreCharacters: "ㄱ-힣",
	        maxLength: 10
	    },
		styleName: "ud-column-center",
	    styleCallback: function(grid, dataCell){
	        var ret = {}

	        if(dataCell.item.rowState == 'created' || dataCell.item.itemState == 'appending' || dataCell.item.itemState == 'inserting'){
	          ret.editable = true;
	        } else {
	          ret.editable = false;
	        }

	        return ret;
		},
		width: 50
	},
	{

		header: {
			text: "코드명"
		},
		required : true,
		name: "detlCdNm",
		fieldName: "detlCdNm",
		type: "data",
		tag: {
			dataType: "text"
		},
		styleName: "ud-column-center"
	},
	{

		header: {
			text: "설명"
		},
		name: "cdExplCont",
		fieldName: "cdExplCont",
		type: "data",
		tag: {
			dataType: "text"
		},
		styleName: "ud-column-left",
		width: 100

	},
	{

		header: {
			text: "정렬순서"
		},
		name: "cdOputOrd",
		fieldName: "cdOputOrd",
		type: "data",
		tag: {
			dataType: "text"
		},
		styleName: "ud-column-center"
	},
	{

		header: {
			text: "사용여부"
		},
		required : true,
		name: "cdUseYn",
		fieldName: "cdUseYn",
		values: ['Y', 'N'],
        labels: ['사용', '미사용'],
        type: "data",
		width : 50,
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
			text: "상위상세코드"
		},
		required : false,
		name: "upDetlCd",
		fieldName: "upDetlCd",
		type: "data",
		tag: {
			dataType: "text"
		},
		styleName: "ud-column-center",
		width: 50
	},
	{

		header: {
			text: "상위그룹코드"
		},
		required : false,
		name: "upGrpCd",
		fieldName: "upGrpCd",
		type: "data",
		tag: {
			dataType: "text"
		},
		styleName: "ud-column-center",
		width: 100
	},
	{
		header: {
			text: "등록일자"
		},
		name: "frstRgstDt",
		fieldName: "frstRgstDt",
		type: "data",
		editable:false,
		styleName: "ud-column-center",
	},
];
//디테일코드 그리드 셋팅 end

$(document).ready(function() {
	//마스터테이블코드 그리드 start
	var gridDataProvider = new RealGrid.LocalDataProvider();
	var gridView = new RealGrid.GridView('gridView');
	gridView.setDataSource(gridDataProvider);
	/* 자동 컬럼 크기 조절  */
	gridView.displayOptions.fitStyle = "fill";
	gridView.displayOptions.syncGridHeight = "always";
	gridView.editOptions.commitByCell = true;
	gridView.editOptions.commitLevel = "error";

	//그리드 컬럼 정보 세팅
	setFieldsNColumns(gridDataProvider, gridView, gridColumns);

	gridView.onCellClicked = function (grid, clickData) {
		if(clickData.cellType != "header"){
			var grpCd = grid.getValue(clickData.dataRow, 'grpCd');
			fnViewHstBtn(grpCd);
		}
	}
	
	//gridView.onCellDblClicked = function (grid, clickData) {
	//	console.log("--------------------gridEndEvent---------------------");
	//}

	//초기 세팅(주의: 조회 함수 밑에 둬야 함)
	RG.initPattern({
		dataProviderPram : gridDataProvider,
		gridViewPram : gridView,
		gridCheckBoxFlag: true,
		gridStatebar: true,
		form : "srchForm",
		editable:true,
		footerBarFlag : false
	});

	// [Btn] 조회 Clik.
	$("#srchBtn").click(function() {
		searchGrpCode();
	});

	 searchGrpCode = function() {
		RG.doQuery({
					action : "/portal/sys/ctg/cds/selectCdsDfndList.do",
					form : "srchForm",
					dataProviderPram : gridDataProvider,
					gridViewPram : gridView,
					endEvent: gridEndEvent,
					pagingId:"grid_paging",
					totalId: "totalCnt"
				});
	}


	/* 조회 완료시 실행된 스크립트 정리   */
	var gridEndEvent = function(endEventParam, response) {
		console.log("--------------------gridEndEvent---------------------");
		console.log(endEventParam);
		console.log(response);
		if(endEventParam.length > 0){
			fnViewHstBtn(endEventParam[0].grpCd);
		}else{
			$("#hideform").hide();
			$("#hideform2").hide();
			gridDataProvider2.clearRows();
		}
		console.log("--------------------gridEndEvent---------------------");
	}
	//마스터테이블코드 그리드 end

	//마스터테이블 행추가 수정 삭제 Start

	/* 행추가 버튼 클릭  */
	$("#addBtn").click(function() {
		 RG.insertRowGrid({
			dataProviderPram : gridDataProvider,
			dataValues:{dtsComCdYn: "Y"},
			endEvent: addEndEvent
		});
	});

	/*행추가 후 실행 function  */
	var addEndEvent = function() {

		console.log("--------------------addEndEvent---------------------");
		console.log("--------------------addEndEvent---------------------");
	}

	/* 행삭제 버튼 클릭  */
	$("#delBtn").click(function() {
		RG.deleteRowGrid({
		     gridViewPram: gridView ,
			 dataProviderPram: gridDataProvider,
			 endEvent: delEndEvent,
			 showEndMessage:true
		});
	});

	/*행삭제 후 실행 function  */
	var delEndEvent = function() {
		dataProvider.removeRow(curr.dataRow);
		console.log("--------------------delEndEvent---------------------");
		console.log("--------------------delEndEvent---------------------");
	}


	/* 저장 버튼 클릭  */
	$("#saveBtn").click(function() {
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
	    var errorCells = gridView.validateCells();
		if(errorCells != null && errorCells.length > 0){
			alert("입력 데이터 값을 확인 해주세요.");
			gridView.setCurrent( {itemIndex: errorCells[0].dataRow , column: errorCells[0].column } );
			return;
		}else{
			RG.doSave({
				action : "/portal/sys/ctg/cds/saveCdsDfnd.do",
				endEvent : saveEndEvent,
				dataProviderPram : gridDataProvider,
				gridViewPram : gridView,
				showEndMessage:true,
				cud: ["C", "U","D","R"]
			});
		}
	});

	/*저장 후 실행 function  */
	var saveEndEvent = function() {
		console.log("--------------------saveEndEvent---------------------");
		searchGrpCode();
		console.log("--------------------saveEndEvent---------------------");
	}

	/* 조회 */
	searchGrpCode();

	//마스터테이블 행추가 수정 삭제 end

    /* 초기화 */
	$("#initBtn").click(function(){
		$("#searchKeyword").val("");
		$("#searchKeyword1").val("");
		searchGrpCode();
	});

	//디테일코드 그리드 셋팅 start
	var gridDataProvider2 = new RealGrid.LocalDataProvider();
	var gridView2 = new RealGrid.GridView('gridView2');
	gridView2.setDataSource(gridDataProvider2);
	/* 자동 컬럼 크기 조절  */
	gridView2.displayOptions.fitStyle = "fill";
	gridView2.displayOptions.syncGridHeight = "always";
	gridView2.editOptions.commitByCell = true;
	gridView2.editOptions.commitLevel = "error";
	//그리드 컬럼 정보 세팅
	setFieldsNColumns(gridDataProvider2, gridView2, gridColumns2);

	//초기 세팅(주의: 조회 함수 밑에 둬야 함)
	RG.initPattern({
		dataProviderPram : gridDataProvider2,
		gridViewPram : gridView2,
		gridCheckBoxFlag: true,
		editable:true,
		footerBarFlag : false
	});
	// 디테일코드 조회
	searchGrpCode2 = function(grpCd) {
		RG.doQuery({
					action : "/portal/sys/ctg/cds/selectCdsDetlList.do",
					params : {"grpCd":grpCd},
					dataProviderPram : gridDataProvider2,
					gridViewPram : gridView2,
					form : "srchForm2",
					endEvent: gridEndEvent2,
					pagingId:"grid_paging2",
					totalId: "totalCnt2"
				});
	}


	/* 조회 완료시 실행된 스크립트 정리   */
	var gridEndEvent2 = function(endEventParam, response) {
		console.log("--------------------gridEndEvent2---------------------");
		console.log(endEventParam);
		console.log(response);
		console.log("--------------------gridEndEvent2---------------------");
	}
	//디테일코드 그리드 셋팅 end

	//디테일코드 저장 조회 삭제 수정 세팅 Start

	/* 행추가 버튼 클릭  */
	$("#addBtn2").click(function() {
		 var current = gridView.getCurrent();
		 RG.insertRowGrid({
			dataProviderPram : gridDataProvider2,
			dataValues:{grpCd: gridView.getValue(current.itemIndex,"grpCd")},
			endEvent: addEndEvent2
		});
	});

	/*행추가 후 실행 function  */
	var addEndEvent2 = function() {
		console.log("--------------------addEndEvent2---------------------");
		console.log("--------------------addEndEvent2---------------------");
	}

	/* 행삭제 버튼 클릭  */
	$("#delBtn2").click(function() {
		RG.deleteRowGrid({
		     gridViewPram: gridView2 ,
			 dataProviderPram: gridDataProvider2 ,
			 endEvent: delEndEvent2,
			 showEndMessage:true
		});
	});

	/*행삭제 후 실행 function  */
	var delEndEvent2 = function() {
		dataProvider.removeRow(curr.dataRow);
		console.log("--------------------delEndEvent2---------------------");
		console.log("--------------------delEndEvent2---------------------");
	}

	/* 저장 버튼 클릭  */
	$("#saveBtn2").click(function() {
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
	    var errorCells = gridView2.validateCells();
		if(errorCells != null && errorCells.length > 0){
			alert("입력 데이터 값을 확인 해주세요.");
			gridView.setCurrent( {itemIndex: errorCells[0].dataRow , column: errorCells[0].column } );
			return;
		}else{
			RG.doSave({
				action : "/portal/sys/ctg/cds/saveCdsDetl.do" ,
				endEvent : saveEndEvent2,
				dataProviderPram : gridDataProvider2,
				gridViewPram : gridView2,
				showEndMessage:true,
				cud: ["C", "U","D","R"]
			});
		}
	});

	/*저장 후 실행 function  */
	var saveEndEvent2 = function() {
		console.log("--------------------saveEndEvent2---------------------");
		searchGrpCode2();
		console.log("--------------------saveEndEvent2---------------------");
	}
	//디테일코드 저장 조회 삭제 수정 세팅 end

	$("#srchForm").keydown(function (event) {
		if (event.keyCode === 13) {
			event.preventDefault();
			$("#srchBtn").click();
		}
	});
});

	//상세보기
	function fnViewHstBtn(grpCd){
		$("#hideform").show();
		$("#hideform2").show();
		$("#searchKeyword3").val(grpCd);
		searchGrpCode2(grpCd);
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
					<!-- 마스터코드 그리드 뷰 start-->
					<form id="srchForm" name="srchForm" method="post">
						<div class="search_wrap">
							<div class="item">
								<h4>코드목록ID</h4>
								<input type="text" name="searchKeyword" id="searchKeyword" value="" placeholder="코드목록ID 입력" title="코드목록ID 입력">
							</div>
							<div class="item">
								<h4>코드목록명</h4>
								<input type="text" name="searchKeyword1" id="searchKeyword1" value="" placeholder="코드목록명 입력" title="코드목록명 입력">
							</div>
						</div>
					</form>
					<div class="btn_info">
						<!-- p테그는 남겨줘야 자동으로 버튼이 오른쪽 정렬 -->
						<p>총건수<span id="totalCnt"></span>건</p>
						<div class="s_btn">
							<a href="javascript:void(0)" id="addBtn">신규</a>
							<a href="javascript:void(0)" id="saveBtn">저장</a>
							<a href="javascript:void(0)" id="delBtn">삭제</a>
						</div>
					</div>
					<div class="grid_area_wrap" id="gridView"></div>
					<!-- 마스터코드 그리드 뷰 end-->

					<div class="page_num" id="grid_paging"></div>

					<!-- 디테일코드 그리드 뷰start-->
					<h1 class="title" id="hideform" style="display: none;">코드상세조회</h1>
					<form id="srchForm2" name="srchForm2" method="post">
			     		 <div class="input-inbox">
							<span class="fe-input">
								<input type="hidden" type="text" name="searchKeyword3" id="searchKeyword3" value="" placeholder="코드목록ID 입력" title="코드목록ID 입력">
							</span>
						</div>
					</form>
					<div class="btn_info"  id="hideform2" style="display: none;">
						<!-- p테그는 남겨줘야 자동으로 버튼이 오른쪽 정렬 -->
						<p></p>
						<div class="s_btn">
							<a href="javascript:void(0)" id="addBtn2">신규</a>
							<a href="javascript:void(0)" id="saveBtn2">저장</a>
							<a href="javascript:void(0)" id="delBtn2">삭제</a>
						</div>
					</div>
					<div class="grid_area_wrap" id="gridView2"></div>
					<!-- 디테일코드 그리드 뷰end-->
				</div>
			</div>
		</div>
	</div>