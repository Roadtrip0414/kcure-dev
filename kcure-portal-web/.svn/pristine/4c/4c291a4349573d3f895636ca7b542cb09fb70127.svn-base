<%
/* =================================================================
* @FileName : ViewDtsDfndManage.jsp
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
const global = {
	prtiList: [<c:forEach items="${prtiList}" var="item">{ key:"${item.detlCd}", value:"${item.detlCdNm}" },</c:forEach>],
	useYnList: [{ key:"Y", value: "사용" }, { key:"N", value: "사용안함" }],
}

const gridColumns = [
	{
		header: {
			text: "데이터셋명"
		},
		name: "dtsId",
		fieldName: "dtsId",
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
		styleCallback: function(grid, dataCell){
			const ret = {}

			if(dataCell.item.rowState == 'created' || dataCell.item.itemState == 'appending' || dataCell.item.itemState == 'inserting'){
				ret.editable = true;
			} else {
				ret.editable = false;
				//ret.styleName = "orange-column";
			}

			return ret;
		},
	},
	{
		header: {
			text: "데이터셋한글명"
		},
		name: "dtsKnm",
		fieldName: "dtsKnm",
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
		styleCallback: function(grid, dataCell){
			const ret = {}

			if(dataCell.item.rowState == 'created' || dataCell.item.itemState == 'appending' || dataCell.item.itemState == 'inserting'){
				ret.editable = true;
			} else {
				ret.editable = false;
			}

			return ret;
		},
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
	}
]
</script>

<script type="text/javascript">
	function onValidateColumn(grid, column, inserting, value) {
		const error = {};
		if (column.fieldName === "dtsId") {
			if (!value || !/^[A-Z\d_]+$/.test(value)) {
				error.level = "error";
				error.message = "데이터셋명은 대문자, 숫자, 언더바(_)만 가능합니다.";
			}
		} else if (column.fieldName === "dtsKnm") {
			if (!value || !/^[A-Za-z\d_가-힣]+$/.test(value)) {
				error.level = "error";
				error.message = "데이터셋한글명은 대문자, 소문자, 숫자, 언더바(_), 한글만 가능합니다.";
			}
		} else if (column.fieldName === "prtiId") {
			if (!value || !global.prtiList.some(item => item.key === value)) {
				error.level = "error";
				error.message = "참여기관 값을 찾을 수 없습니다.";
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
			const gridView = new RealGrid.GridView('gridView');
			gridView.setDataSource(gridDataProvider);
			/* 자동 컬럼 크기 조절  */
			gridView.displayOptions.fitStyle = "fill";
			gridView.displayOptions.syncGridHeight = "always";
			gridView.setRowIndicator({
				  visible: true
				});

			$("#searchKeyword").keydown(function (event) {
				if (event.keyCode === 13) {
					event.preventDefault();
					$("#btnSearch").click();
				}
			})

			//그리드 컬럼 정보 세팅
			setFieldsNColumns(gridDataProvider, gridView, gridColumns);

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
							action : "/portal/sys/ctg/dts/selectDtsDfndList.do",
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
					 action : "/portal/sys/ctg/dts/saveDtsDfnd.do" ,
					 endEvent : saveEndEvent,
					 dataProviderPram : gridDataProvider,
					 gridViewPram : gridView,
					 showEndMessage:true,
					 cud: ["C", "U","D","R"]
				 });

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
	<!-- 					<a href="javascript:void(0)">초기화</a> -->
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
							<h4>데이터셋</h4>
							<input type="text" name="searchKeyword" id="searchKeyword" value="" placeholder="데이터셋 입력">
						</div>
					</div>
				</form>
				<div class="btn_info">
					<p>총건수<span id="currCnt"></span>/<span id="totalCnt"></span></p>
					<div class="s_btn">
						<a href="javascript:void(0)" id="addBtn">신규</a>
						<a href="javascript:void(0)" id="saveBtn">저장</a>
						<a href="javascript:void(0)" id="delBtn">삭제</a>
					</div>
				</div>
				<div class="grid_area_wrap" id="gridView"></div>
				<div id="grid_paging" class="page_num"></div>
			</div>
		</div>
	</div>
</div>
<!-- wrap -->