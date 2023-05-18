
<%
/* =================================================================
* @FileName : ViewSvcPrtiDsz.jsp
* @date: 2023. 3. 16
* @author : parkgu
* @설명 :
* =================================================================
* 수정일 작성자 내용
* -----------------------------------------------------------------------
* 2023. 3. 16 parkgu 파일생성
* =================================================================
*/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>
<script type="text/javascript">
const global = {
	siDoStcdList: [<c:forEach items="${siDoStcdList}" var="item">{ key:"${item.detlCd}", value:"${item.detlCdNm}" },</c:forEach>],
	useYnList: [{ key:"Y", value: "사용" }, { key:"N", value: "사용안함" }],
}

const gridColumns = [
	{
		header: {
			text: "지역"
		},
		name: "ctpvSpcd",
		fieldName: "ctpvSpcd",
		type: "data",
		width: "50",
		sortable: false,
		values: global.siDoStcdList.map(item => item.key),
		labels: global.siDoStcdList.map(item => item.value),
		lookupDisplay: true,
		editor : {
			type: "dropdown",
			domainOnly: true,
		},
		styleName: "ud-column-center",
	},
	{
		header: {
			text: "센터ID"
		},
		name: "prtiId",
		fieldName: "prtiId",
		type: "data",
		width: "50",
		tag: {
			dataType: "text"
		},
		styleName: "ud-column-center",
		readOnly: true,
	},
	{
		header: {
			text: "센터명"
		},
		name: "prtiNm",
		fieldName: "prtiNm",
		type: "data",
		width: "50",
		tag: {
			dataType: "text"
		},
		styleName: "ud-column-center",
		readOnly: true,
	},
	{
		header: {
			text: "전체 좌석수"
		},
		name: "dszCnt",
		fieldName: "dszCnt",
		type: "data",
		width: "50",
		tag: {
			dataType: "text"
		},
		styleName: "ud-column-center",
		readOnly: true,
	},
]

const gridColumnsDetl = [
	{
		name: "prtiId",
		fieldName: "prtiId",
		visible: false,
	},
	{
		name: "seatSeq",
		fieldName: "seatSeq",
		visible: false,
	},
	{
		header: {
			text: "좌석번호"
		},
		name: "seatNo",
		fieldName: "seatNo",
		type: "data",
		width: "50",
		tag: {
			dataType: "text"
		},
		styleName: "ud-column-center",
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
			text: "등록자"
		},
		name: "frstRegpId",
		fieldName: "frstRegpId",
		type: "data",
		width: "50",
		tag: {
			dataType: "text"
		},
		styleName: "ud-column-center",
		editable: false,
	},
	{
		header: {
			text: "등록일시"
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
	},
]
</script>

<script type="text/javascript">
	function onValidateColumn(grid, column, inserting, value) {
		const error = {};
		if (column.fieldName === "ctpvSpcd") {
			if (!value || !global.siDoStcdList.some(item => item.key === value)) {
				error.level = "error";
				error.message = "지역을 찾을 수 없습니다.";
			}
		}

		return error;
	}

	function onValidateColumnDetl(grid, column, inserting, value) {
		const error = {};
		if (column.fieldName === "seatNo") {
			if (!value || !/^[A-Z\d]+$/.test(value)) {
				error.level = "error";
				error.message = "좌석번호는 대문자, 숫자만 가능합니다.";
			}
		} else if (column.fieldName === "useYn") {
			if (!value || !global.useYnList.some(item => item.key === value)) {
				error.level = "error";
				error.message = "사용여부 값을 찾을 수 없습니다.";
			}
		}
		return error;
	}

	$(document).ready(
		function() {
			//그리드
			const gridDataProvider = new RealGrid.LocalDataProvider();
			const gridDataProviderDetl = new RealGrid.LocalDataProvider();

			const gridView = new RealGrid.GridView('gridView');
			const gridViewDetl = new RealGrid.GridView('gridViewDetl');

			gridView.setDataSource(gridDataProvider);
			gridViewDetl.setDataSource(gridDataProviderDetl);

			/* 자동 컬럼 크기 조절  */
			gridView.displayOptions.fitStyle = "fill";
			gridView.displayOptions.syncGridHeight = "always";
			gridViewDetl.displayOptions.fitStyle = "fill";
			gridViewDetl.displayOptions.syncGridHeight = "always";

			gridView.setRowIndicator({
				  visible: true
				});
			gridViewDetl.setRowIndicator({
				  visible: true
				});
			gridView.onEditChange = function (grid, index, value) {
				console.log("grid.onEditChange driven, " + index.column + ' at ' + index.dataRow + ' was replaced by value: ' + value);
			};

			$("#initBtn").click(function(){
				$("#srchFrm").find("input,select").val("")
				$("#btnSearch").click();
			});

			$("#srchFrm").keydown(function (event) {
				if (event.keyCode === 13) {
					event.preventDefault();
					$("#btnSearch").click();
				}
			})

			//그리드 컬럼 정보 세팅
			setFieldsNColumns(gridDataProvider, gridView, gridColumns);
			setFieldsNColumns(gridDataProviderDetl, gridViewDetl, gridColumnsDetl);

			//초기 세팅(주의: 조회 함수 밑에 둬야 함)
			RG.initPattern({
				dataProviderPram : gridDataProvider,
				gridViewPram : gridView,
				gridCheckBoxFlag: false,
				form : "srchFrm",
				editable:true,
				footerBarFlag : false
			});
			RG.initPattern({
				dataProviderPram : gridDataProviderDetl,
				gridViewPram : gridViewDetl,
				gridCheckBoxFlag: true,
				form : "srchFrmDetl",
				editable:true,
				footerBarFlag : false
			});

			// [Btn] 조회 Clik.
			$("#btnSearch").click(function() {
				$("input[type=hidden][name=pageIndex]").val("1");
				searchAction();

				return false;
			});
			gridView.onCurrentRowChanged = function (grid, oldRow, newRow) {
				searchActionDetl();
			};

			const getSelectedRowIdx = function () {
				const rows = gridView.getSelectedRows();

				if (rows.length === 0) return -1;

				const rowIdx = rows[0];
				if (rowIdx == -1) return -1;

				return rowIdx;
			}
			const getSelectedKeys = function () {
				const rowIdx = getSelectedRowIdx();
				if (rowIdx == -1) return {};

				const prtiId = gridView.getValue(rowIdx, "prtiId");
				return { prtiId };
			}
			const getSelectedDszCnt = function () {
				const rowIdx = getSelectedRowIdx();
				if (rowIdx == -1) return -1;

				const dszCnt = parseInt(gridView.getValue(rowIdx, "dszCnt"), 10);
				return dszCnt;
			}
			const setSelectedDszCnt = function (dszCnt) {
				const rowIdx = getSelectedRowIdx();
				if (rowIdx == -1) return;

				gridView.setValue(rowIdx, "dszCnt", dszCnt);
				gridDataProvider.setRowState(rowIdx, "none", true);
			}

			const searchAction = function() {
				RG.doQuery({
							form :  "srchFrm",
							action : "/portal/sys/rsr/daz/selectSvcPrtiSpCdIs02.do",
							dataProviderPram : gridDataProvider,
							gridViewPram : gridView,
							endEvent: gridEndEvent,
							pagingId:"grid_paging",
							totalId: "totalCnt",
							currCntId: "currCnt"
						});
			}
			const searchActionDetl = function() {
				let { prtiId } = getSelectedKeys();
				if (!prtiId) {
					//마스터 테이블의 첫번째 row로 가져오기
					prtiId = gridView.getValue(0, "prtiId");
				}

				$("input[name=prtiIdMaster]").val(prtiId);

				RG.doQuery({
							form :  "srchFrmDetl",
							action : "/portal/sys/rsr/daz/selectSvcPrtiDszList.do",
							dataProviderPram : gridDataProviderDetl,
							gridViewPram : gridViewDetl,
							endEvent: gridEndEventDetl,
							pagingId:"grid_paging_detl",
							totalId: "totalCntDetl",
							currCntId: "currCntDetl"
						});
			}

			/* 조회 완료시 실행된 스크립트 정리   */
			const gridEndEvent = function(endEventParam, response) {
				console.log("--------------------gridEndEvent---------------------");
				console.log(endEventParam);
				console.log(response);
				if(endEventParam.length > 0){
					searchActionDetl();
				}
				console.log("--------------------gridEndEvent---------------------");
			}
			const gridEndEventDetl = function(endEventParam, response) {
				const dszCnt = endEventParam.length && endEventParam[0]['dszCnt'] || 0;
				const dszCntMaster = getSelectedDszCnt();
				if (dszCntMaster !== -1 && dszCnt !== dszCntMaster) {
					setSelectedDszCnt(dszCnt);
				}
			}

			/* 행추가 버튼 클릭  */
			$("#addBtnDetl").click(function() {
				const { prtiId } = getSelectedKeys();
				if (!prtiId) {
					alert("센터를 선택하지 않았습니다.");
					return;
				}

				RG.insertRowGrid({
					dataProviderPram : gridDataProviderDetl,
					dataValues:[],
					endEvent: addEndEventDetl
				});
			});

			/*행추가 후 실행 function  */
			const addEndEvent = function() {
				console.log("--------------------addEndEvent---------------------");
				console.log("--------------------addEndEvent---------------------");
			}
			const addEndEventDetl = function() {
				const { prtiId } = getSelectedKeys();
				gridViewDetl.setValue(0, "prtiId", prtiId);
			}

			 /* RG.deleteCreateRowGrid({ gridViewPram: gridView, dataProviderPram: dataProvider }); */

			/* 행삭제 버튼 클릭  */
			$("#delBtnDetl").click(function() {
				const { prtiId } = getSelectedKeys();
				if (!prtiId) {
					alert("센터를 선택하지 않았습니다.");
					return;
				}

				RG.deleteRowGrid({
					gridViewPram: gridViewDetl
					, dataProviderPram: gridDataProviderDetl
					, endEvent: delEndEventDetl
				});
				/* gridDataProviderDetl.insertRow(0,[]); */
			});

			/*행삭제 후 실행 function  */
			const delEndEvent = function() {
				console.log("--------------------delEndEvent---------------------");
				console.log("--------------------delEndEvent---------------------");
			}
			const delEndEventDetl = function() {
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
					 action : "/portal/sys/rsr/daz/saveSvcPrtiCtpvSpcd.do" ,
					 endEvent : saveEndEvent,
					 dataProviderPram : gridDataProvider,
					 gridViewPram : gridView,
					 showEndMessage:true,
					 cud: ["C", "U","D","R"]
				 });

			});
			$("#saveBtnDetl").click(function() {
				const { prtiId } = getSelectedKeys();
				if (!prtiId) {
					alert("센터를 선택하지 않았습니다.");
					return;
				}

				const rowCount = gridDataProvider.getRowCount();
				const rows = Array(rowCount).fill(0).map((v, i) => i)
				gridViewDetl.onValidateColumn = onValidateColumnDetl;
				gridViewDetl.validateCells(rows);
				gridViewDetl.onValidateColumn = null;
				if (gridViewDetl.getInvalidCells() != null) {
					return;
				}

				RG.doSave({
					action : "/portal/sys/rsr/daz/saveSvcPrtiDsz.do" ,
					endEvent : saveEndEventDetl,
					dataProviderPram : gridDataProviderDetl,
					gridViewPram : gridViewDetl,
					showEndMessage:true,
					cud: ["C", "U","D","R"]
				});

			});

			/*저장 후 실행 function  */
			const saveEndEvent = function(e) {
				console.log("_____________________ result : " + JSON.stringify(e));
				searchAction();
			}
			const saveEndEventDetl = function(e) {
				console.log("_____________________ result : " + JSON.stringify(e));
				searchActionDetl();
			}

			/* 조회 */
			searchAction();
		});




</script>

<!-- wrap -->
<div class="wrap">
	<div class="con">
		<div class="area_wrap">
			<div class="section">
				<div class="btn_info">
					<!-- p테그는 남겨줘야 자동으로 버튼이 오른쪽 정렬 -->
					<p></p>
					<div class="s_btn">
						<a href="javascript:void(0)" id="btnSearch">조회</a>
						<a href="javascript:void(0)" id="initBtn">초기화</a>
					</div>
				</div>

				<form id="srchFrm" name="srchFrm" method="post">
					<div class="search_wrap">
						<div class="item">
							<h4>센터명</h4>
							<input type="text" name="prtiNm" id="prtiNm" value="" placeholder="센터명 입력"/>
						</div>
						<div class="item">
							<h4>센터ID</h4>
							<input type="text" name="prtiId" id="prtiId" value="" placeholder="센터ID 입력"/>
						</div>
					</div>
				</form>
				<div class="btn_info">
					<!-- p테그는 남겨줘야 자동으로 버튼이 오른쪽 정렬 -->
					<p>총건수<span id="currCnt"></span>/<span id="totalCnt"></span></p>
					<div class="s_btn">
						<a href="javascript:void(0)" id="saveBtn">저장</a>
					</div>
				</div>

				<div class="grid_area_wrap" id="gridView"></div>
				<div id="grid_paging" class="page_num"></div>

				<form id="srchFrmDetl" name="srchFrmDetl" method="post">
					<input type="hidden" name="prtiIdMaster" />
				</form>
				<div class="btn_info">
					<p>총건수<span id="currCntDetl"></span>/<span id="totalCntDetl"></span></p>
					<div class="s_btn">
						<a href="javascript:void(0)" id="addBtnDetl">신규</a>
						<a href="javascript:void(0)" id="saveBtnDetl">저장</a>
						<a href="javascript:void(0)" id="delBtnDetl">삭제</a>
					</div>
				</div>

				<div class="grid_area_wrap" id="gridViewDetl"></div>
				<div id="grid_paging_detl" class="page_num"></div>
			</div>
		</div>
	</div>
	<!-- //con -->
</div>
<!-- //wrap -->