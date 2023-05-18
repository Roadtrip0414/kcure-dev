<%
/* =================================================================
* @FileName : ViewDtsColDfndManage.jsp
* @date: 2023. 2. 8.
* @author : parkgu
* @설명 :
* =================================================================
* 수정일 작성자 내용
* -----------------------------------------------------------------------
* 2023. 2. 7. parkgu 파일생성
* =================================================================
*/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>
<script type="text/javascript">
const global = {
	prtiList: [<c:forEach items="${prtiList}" var="item">{ key:"${item.detlCd}", value:"${item.detlCdNm}" },</c:forEach>],
	dtsDfndList: [<c:forEach items="${prtiDtsList}" var="item">{ key: ["${item.prtiId}", "${item.dtsId}"], value: ["${item.dtsKnm}"] },</c:forEach>],
	dataTpList: [<c:forEach items="${dataTpList}" var="item">{ key:"${item.detlCd}", value:"${item.detlCdNm}" },</c:forEach>],
	useYnList: [{ key:"Y", value: "사용" }, { key:"N", value: "사용안함" }],
	cdsYnList: [{ key:"Y", value: "사용" }, { key:"N", value: "사용안함" }],
	gridView: null,
	cdsYnPrev: "",
}

function styleCallbackPreventUpdate(grid, dataCell){
	const ret = {}

	if(dataCell.item.rowState == 'created' || dataCell.item.itemState == 'appending' || dataCell.item.itemState == 'inserting'){
		ret.editable = true;
	} else {
		ret.editable = false;
		//ret.styleName = "orange-column";
	}

	return ret;
}

const gridColumns = [
	{
		header: {
			text: "컬럼(한글)"
		},
		name: "colKnm",
		fieldName: "colKnm",
		type: "data",
		width: "50",
		tag: {
			dataType: "text"
		},
		styleName: "ud-column-center",
		editor: {
			type: "line",
			maxLength: 10,
		},
	},
	{
		header: {
			text: "컬럼(영문)"
		},
		name: "colEnm",
		fieldName: "colEnm",
		type: "data",
		width: "50",
		tag: {
			dataType: "text"
		},
		styleName: "ud-column-center",
		editor: {
			type: "line",
			maxLength: 50,
		},
		styleCallback: styleCallbackPreventUpdate,
	},
	{
		header: {
			text: "컬럼설명"
		},
		name: "colExplCont",
		fieldName: "colExplCont",
		type: "data",
		width: "50",
		tag: {
			dataType: "text"
		},
		styleName: "ud-column-center",
		editor: {
			type: "line",
			maxLength: 10,
		},
	},
	{
		header: {
			text: "타입"
		},
		name: "dataTpCont",
		fieldName: "dataTpCont",
		type: "data",
		width: "50",
		sortable: false,
		values: global.dataTpList.map(item => item.key),
		labels: global.dataTpList.map(item => item.value),
		lookupDisplay: true,
		editor : {
			type: "dropdown",
			domainOnly: true,
		},
		styleName: "ud-column-center",
	},
	{
		header: {
			text: "길이"
		},
		name: "dataLnthCont",
		fieldName: "dataLnthCont",
		type: "data",
		width: "50",
		tag: {
			dataType: "number"
		},
		styleName: "ud-column-center",
		editor: {
			type: "line",
			maxLength: 10,
		},
	},
	{
		header: {
			text: "코드셋유무"
		},
		name: "cdsYn",
		fieldName: "cdsYn",
		type: "data",
		width : 30,
		sortable: false,
		values: global.cdsYnList.map(item => item.key),
		labels: global.cdsYnList.map(item => item.value),
		lookupDisplay: true,
		editor : {
			type: "dropdown",
			domainOnly: true,
		},
		styleName: "ud-column-center",
	},
	{
		header: {
			text: "코드"
		},
		name: "cdId",
		fieldName: "cdId",
		type: "data",
		width: "50",
		tag: {
			dataType: "text"
		},
		styleName: "ud-column-center",
		button: "action",
		buttonVisibility: "always",
		editable: false,
	},
	{
		header: {
			text: "참여기관"
		},
		name: "prtiId",
		fieldName: "prtiId",
		type: "data",
		width: "50",
		sortable: false,
		values: global.prtiList.map(item => item.key),
		labels: global.prtiList.map(item => item.value),
		lookupDisplay: true,
		editor : {
			type: "dropdown",
			domainOnly: true,
		},
		styleName: "ud-column-center",
		styleCallback: styleCallbackPreventUpdate,
	},
	{
		header: {
			text: "데이터셋"
		},
		name: "dtsId",
		fieldName: "dtsId",
		type: "data",
		width: "50",
		sortable: false,
		lookupSourceId: "prtiLookup",
		lookupKeyFields: ["prtiId", "dtsId"],
		lookupDisplay: true,
		editor : {
			type: "dropdown",
			domainOnly: true,
		},
		styleName: "ud-column-center",
		styleCallback: styleCallbackPreventUpdate,
	},
	{
		header: {
			text: "사용여부"
		},
		name: "useYn",
		fieldName: "useYn",
		type: "data",
		width : 30,
		sortable: false,
		values: global.useYnList.map(item => item.key),
		labels: global.useYnList.map(item => item.value),
		lookupDisplay: true,
		editor : {
			type: "dropdown",
			domainOnly: true,
		},
		styleName: "ud-column-center",
	},
	{
		header: {
			text: "등록일자"
		},
		name: "frstRgstDt",
		fieldName: "frstRgstDt",
		type: "data",
		width: "50",
		tag: {
			dataType: "text"
		},
		styleName: "ud-column-center",
		editable: false,
		editor: {
			type: "line",
			maxLength: 10,
		},
	},
]
</script>

<script type="text/javascript">
	function getPrtiListFromPopup() {
		return global.prtiList;
	}

	function getDetlCdFromPopup(detlCdNm) {
		const found = global.dataTpList.find(item => item.value === detlCdNm);
		if (!found) return "";
		return found.key;
	}

	function getDtsIdFromPopup(prtiId, dtsKnm) {
		const found = global.dtsDfndList.find(item => item.key[0] === prtiId && item.value[0] === dtsKnm);
		if (!found) return "";
		return found.key[1];
	}

	function validateDtsColDfnd(name, value) {
		if (name === "colKnm") {
			if (!value || !/^[A-Za-z\d가-힣]+$/.test(value)) {
				return { valid: false, msg: "컬럼(한글)은 대문자, 소문자, 숫자, 한글만 가능합니다." };
			}
		} else if (name === "colEnm") {
			if (!value || !/^[A-Z\d_]+$/.test(value)) {
				return { valid: false, msg: "컬럼(영문)은 대문자, 숫자, _만 가능합니다." };
			}
		} else if (name === "colExplCont") {
			if (!value) {
				return { valid: false, msg: "컬럼설명은 필수 입력입니다." };
			}
		} else if (name === "dataTpCont") {
			if (!value || !global.dataTpList.some(item => item.key === value)) {
				return { valid: false, msg: "타입 값을 찾을 수 없습니다." };
			}
		} else if (name === "dataLnthCont") {
			if (!value || !/^[\d]+$/.test(value)) {
				return { valid: false, msg: "길이는 숫자만 가능합니다." };
			}
		} else if (name === "cdsYn") {
			global.cdsYnPrev = value;
			if (!value || !global.cdsYnList.some(item => item.key === value)) {
				return { valid: false, msg: "코드셋유무 값을 찾을 수 없습니다." };
			}
		} else if (name === "cdId") {
			if (global.cdsYnPrev == "Y" && (!value || !/^[A-Z\d]+$/.test(value))) {
				return { valid: false, msg: "코드는 대문자, 숫자만 가능합니다." };
			}
		} else if (name === "prtiId") {
			if (!value || !global.prtiList.some(item => item.key === value)) {
				return { valid: false, msg: "참여기관 값을 찾을 수 없습니다." };
			}
		} else if (name === "dtsId") {
			if (!value || !global.dtsDfndList.some(item => item.key[1] === value)) {
				return { valid: false, msg: "데이터셋 값을 찾을 수 없습니다." };
			}
		} else if (name === "useYn") {
			if (!value || !global.useYnList.some(item => item.key === value)) {
				return { valid: false, msg: "사용여부 값을 찾을 수 없습니다." };
			}
		}

		return { valid: true, msg: "" };
	}

	function onValidateColumn(grid, column, inserting, value) {
		const error = {};
		const { valid, msg } = validateDtsColDfnd(column.fieldName, value);
		if (!valid) {
			error.level = "error";
			error.message = msg;
		}
		return error;
	}

	function setCdIdFromPopup(cdId) {
		const rows = global.gridView.getSelectedRows();
		
		if (rows.length === 0) return;

		const rowIdx = rows[0];
		if (rowIdx == -1) return;

		global.gridView.setValue(rowIdx, "cdId", cdId);
		global.gridView.checkRow(rowIdx, true);
	}

	$(document).ready(
		function() {
			//그리드
			const gridDataProvider = new RealGrid.LocalDataProvider();
			const gridView = new RealGrid.GridView('gridView');
			global.gridView = gridView;
			gridView.setDataSource(gridDataProvider);
			/* 자동 컬럼 크기 조절  */
			gridView.displayOptions.fitStyle = "fill";
			gridView.displayOptions.syncGridHeight = "always";
			gridView.setRowIndicator({
				  visible: true
				});
			gridView.onEditChange = function (grid, index, value) {
				if (index.column == "prtiId") {
					grid.setValue(index.dataRow, "dtsId", "");
				} else if (index.column == "cdsYn") {
					if (value == "N") {
						grid.setValue(index.dataRow, "cdId", "");
					}
				}
			};
			gridView.onCellButtonClicked = function(grid, index, column) {
				if (column.fieldName == "cdId") {
					window.open("/portal/sys/ctg/cds/selectCdsDfndPopup.do","코드 조회","height=480, width=640, top=50, left=20, scrollbars=yes, resizable=no");
				}
			};

			$("#searchKeyword").keydown(function (event) {
				if (event.keyCode === 13) {
					event.preventDefault();
					$("#btnSearch").click();
				}
			})

			//그리드 컬럼 정보 세팅
			setFieldsNColumns(gridDataProvider, gridView, gridColumns);

			gridView.setLookups([{
				id: "prtiLookup",
				levels: 2,
				keys: global.dtsDfndList.map(item => item.key),
				values: global.dtsDfndList.map(item => item.value),
			}]);

			//초기 세팅(주의: 조회 함수 밑에 둬야 함)
			RG.initPattern({
				dataProviderPram : gridDataProvider,
				gridViewPram : gridView,
				gridCheckBoxFlag: true,
				form : "srchFrm",
				editable:true,
				footerBarFlag : false
			});

			// [Btn] 조회 Clik.
			$("#btnSearch").click(function() {
				$("input[type=hidden][name=pageIndex]").val("1");
				searchAction();

				return false;
			});

			const searchAction = function() {
				RG.doQuery({
							form :  "srchFrm",
							action : "/portal/sys/ctg/col/selectDtsColDfndList.do",
							dataProviderPram : gridDataProvider,
							gridViewPram : gridView,
							endEvent: gridEndEvent,
							pagingId:"grid_paging",
							totalId: "totalCnt",
							currCntId: "currCnt"
						});
			}

			/* 조회 완료시 실행된 스크립트 정리   */
			const gridEndEvent = function(endEventParam, response) {
				console.log("--------------------gridEndEvent---------------------");
				console.log(endEventParam);
				console.log(response);
				console.log("--------------------gridEndEvent---------------------");


			}

			/* 행추가 버튼 클릭  */
			$("#addBtn").click(function() {
				 RG.insertRowGrid({
					dataProviderPram : gridDataProvider,
					dataValues:[],
					endEvent: addEndEvent
				});
			});

			/*행추가 후 실행 function  */
			const addEndEvent = function() {
				console.log("--------------------addEndEvent---------------------");
				console.log("--------------------addEndEvent---------------------");
			}


			 /* RG.deleteCreateRowGrid({ gridViewPram: gridView, dataProviderPram: dataProvider }); */

			/* 행삭제 버튼 클릭  */
			$("#delBtn").click(function() {
				RG.deleteRowGrid({
					gridViewPram: gridView
					, dataProviderPram: gridDataProvider
					, endEvent: delEndEvent
				});
				/* gridDataProvider.insertRow(0,[]); */
			});

			/*행삭제 후 실행 function  */
			const delEndEvent = function() {
				console.log("--------------------delEndEvent---------------------");
				console.log("--------------------delEndEvent---------------------");
			}


			/* 저장 버튼 클릭  */
			$("#saveBtn").click(function() {
				const rowCount = gridDataProvider.getRowCount();
				const rows = Array(rowCount).fill(0).map((v, i) => i)
				gridView.onValidateColumn = onValidateColumn;
				gridView.validateCells(rows);
				gridView.onValidateColumn = null;
				if (gridView.getInvalidCells() != null) {
					return;
				}

				 RG.doSave({
					 action : "/portal/sys/ctg/col/saveDtsColDfnd.do" ,
					 endEvent : saveEndEvent,
					 dataProviderPram : gridDataProvider,
					 gridViewPram : gridView,
					 showEndMessage:true,
					 cud: ["C", "U","D","R"]
				 });

			});

			$("#uploadExcelBtn").click(function() {
				//엑셀업로드 팝업
				window.open("/portal/sys/ctg/col/uploadDtsColDfndPopup.do","엑셀업로드","height=480, width=640, top=50, left=20, scrollbars=yes, resizable=no");
			});

			/*저장 후 실행 function  */
			const saveEndEvent = function(e) {
				console.log("_____________________ result : " + JSON.stringify(e));
				searchAction();
			}

			/* 조회 */
			searchAction();
		});




</script>

<div class="wrap">
	<div class="con">
		<div class="area_wrap">
			<div class="section">
				<div class="btn_info">
					<!-- p테그는 남겨줘야 자동으로 버튼이 오른쪽 정렬 -->
					<p></p>
					<div class="s_btn">
						<a href="javascript:void(0)" id="btnSearch">조회</a>
<!-- 						<a href="javascript:void(0)">초기화</a> -->
					</div>
				</div>
				<form id="srchFrm" name="srchFrm" method="post">
					<div class="search_wrap">
						<div class="item">
							<h4>참여기관</h4>
							<select name="prtiId" id="prtiId">
								<option value="">전체</option>
								<c:forEach items="${prtiList}" var="item">
									<option value="${item.detlCd}">${item.detlCdNm}</option>
								</c:forEach>
							</select>
						</div>
						<div class="item">
							<h4>컬럼</h4>
							<input type="text" name="searchKeyword" id="searchKeyword" value="" placeholder="컬럼 입력">
						</div>
					</div>
				</form>
				<div class="btn_info">
					<!-- p테그는 남겨줘야 자동으로 버튼이 오른쪽 정렬 -->
					<p>총건수<span id="currCnt"></span>/<span id="totalCnt"></span></p>
					<div class="s_btn">
						<a href="javascript:void(0)" id="addBtn">신규</a>
						<a href="javascript:void(0)" id="saveBtn">저장</a>
						<a href="javascript:void(0)" id="delBtn">삭제</a>
						<a href="javascript:void(0)" id="uploadExcelBtn">엑셀업로드</a>
					</div>
				</div>

				<div class="grid_area_wrap" id="gridView"></div>
				<div id="grid_paging" class="page_num"></div>
			</div>
		</div>
	</div>
	<!-- //con -->
</div>
<!-- //wrap -->