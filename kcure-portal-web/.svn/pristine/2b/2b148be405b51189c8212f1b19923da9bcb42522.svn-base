<%
/* =================================================================
* @FileName : ViewAuthorMenuManage
* @date: 2023. 1. 3.
* @author : hjjeon
* @설명 : 권한 메뉴 맵핑 화면
* =================================================================
* 수정일 작성자 내용
* -----------------------------------------------------------------------
* 2023. 1. 3. hjjeon 파일생성
* =================================================================
*/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>
<script type="text/javascript">
var gridColumns2 = [
{
	header: {
		text: "권한ID"
	},
	name: "authId",
	fieldName: "authId",
	type: "data",
	tag: {
		dataType: "text"
	},
	styleName: "ud-column-center"
},
{
	header: {
		text: "권한명"
	},
	name: "authNm",
	fieldName: "authNm",
	type: "data",
	tag: {
		dataType: "text"
	},
	styleName: "ud-column-center"
}
];

var gridColumns = [
{
	header: {
		text: "메뉴명"
	},
	name: "menuNm",
	fieldName: "menuNm",
	styleName: "ud-column-center",
	width: "220"
},
{
	header: {
		text: "메뉴ID"
	},
	name: "menuId",
	fieldName: "menuId",
	styleName: "ud-column-center",
 	visible: false
},
{
	header: {
		text: "메뉴URI"
	},
	name: "menuUriAddr",
	fieldName: "menuUriAddr",
	styleName: "ud-column-left",
	width: "300"
},
{
	header: {
		text: "등록"
	},
	name: "regYn",
	fieldName: "regYn"
},
{
	header: {
		text: "권한ID"
	},
	name: "authId",
	fieldName: "authId",
 	visible: false
}
];

$(document).ready(
	function() {
		/* 권한 그리드 셋팅 start */
		var gridDataProvider2 = new RealGrid.LocalDataProvider();
		var gridView2 = new RealGrid.GridView('gridView2');
		gridView2.setDataSource(gridDataProvider2);
		/* 자동 컬럼 크기 조절  */
		gridView2.displayOptions.fitStyle = "fill";
		gridView2.displayOptions.syncGridHeight = "always";
		/* 체크박스를 radio 버튼으로 변경 */
		gridView2.setCheckBar({exclusive: true});
		//그리드 컬럼 정보 세팅
		setFieldsNColumns(gridDataProvider2, gridView2, gridColumns2);

		//초기 세팅(주의: 조회 함수 밑에 둬야 함)
		RG.initPattern({
			dataProviderPram : gridDataProvider2,
			gridViewPram : gridView2,
			gridCheckBoxFlag: true,
			form : "srchForm2",
			editable:false,
			footerBarFlag : false

		});

		var searchDate2 = function() {
			RG.doQuery({
						action : "/portal/sys/aum/mng/selectAllAuth.do",
						form : "srchForm2",
						dataProviderPram : gridDataProvider2,
						gridViewPram : gridView2,
						endEvent: gridEndEvent2,
						pagingId:"grid_paging2",
						totalId: "totalCnt2",
						currCntId: "currCnt2"
					});
		}

		/* 조회 완료시 실행된 스크립트 정리   */
		var gridEndEvent2 = function(endEventParam, response) {
			console.log("--------------------gridEndEvent---------------------");
			console.log(endEventParam);
			console.log(response);
			console.log("--------------------gridEndEvent---------------------");
		}

		/* 조회 */
		searchDate2();

		/* 권한 그리드 셋팅 end */

		/* 메뉴 그리드 셋팅 start */
		var treeProvider = new RealGrid.LocalTreeDataProvider();
		var treeView = new RealGrid.TreeView('gridView');

		treeView.setDataSource(treeProvider);
		treeView.displayOptions.fitStyle = "fill";
		treeView.treeOptions.expanderIconStyle = "square";
		treeView.displayOptions.syncGridHeight = "always";
		setFieldsNColumns(treeProvider, treeView, gridColumns);

		RG.initPattern({
			dataProviderPram : treeProvider,
			gridViewPram : treeView,
			gridCheckBoxFlag: true,
			form : "srchForm",
			editable:false,
			footerBarFlag : false,
		});

		var searchDate = function() {
			RG.doQueryTree({
						action : "/portal/sys/aum/mnu/selectAuthorMenuManage.do",
						form : "srchForm",
						dataProviderPram : treeProvider,
						gridViewPram : treeView,
						endEvent: gridEndEvent,
						treeField: "menuId",
						childrenField: "",
						iconField:""
					});
		}

		/* 조회 완료시 실행된 스크립트 정리   */
		var gridEndEvent = function(endEventParam, response) {
			console.log("--------------------gridEndEvent---------------------");
			console.log(endEventParam);
			console.log(response);
			treeView.setStateBar({visible: true});
			treeView.expandAll();
			console.log("--------------------gridEndEvent---------------------");
		}


		/* 메뉴 그리드 셋팅 end */
		var authId = "";
		gridView2.onItemChecked = function (grid, itemIndex, checked) {
			authId = grid.getValue(itemIndex, "authId");
			$("#srchForm #searchKeyword").val(authId);
			searchDate();
		}

		gridView2.onCellClicked = function (grid, clickData) {
			if(clickData.cellType != "header"){
				authId = grid.getValue(clickData.dataRow, 'authId');
				$("#srchForm #searchKeyword").val(authId);
				searchDate();
			}
		}

		/* 저장 버튼 클릭  */
		$("#saveBtn").click(function() {
			/*
			 * parameter: json 타입
		     * action : 호출할 url
		     * endEvent : 저장 이후 처리되는 함수 설정
		     * endPram : endEvent에 넘길 파라미터
		     * dataProviderPram : 조회된 리턴값 dataProvider
		     * gridViewPram : 그리드 ID
		     * checkBinding : 입력한 스트링값에 대해서 변수를 설정하고, 그 변수에 Y,N값을 체크에 따라서 설정하게 함
		     * ex : action : "/stock/report/searchStkReportDestructionListTest.action" ,
		     *      form : "srchForm",
		     *      endEvent : fnCall
		     *      endPram : "스트링,json,숫자"
		     *      dataProviderPram : dataProvider,
		     *      gridViewPram : realgrid
		     *      checkBinding : "checked"
		     */
		    //권한 선택
		    var authRows = gridView2.getCheckedRows();
			if(authRows.length == 0){
				alert("권한을 선택해주세요.");
				return;
			}

			//등록할 메뉴 선택
		    var rows = treeView.getCheckedRows();

			if(rows.length > 0){

				for (var i in rows) {
			 		treeProvider.setValue(rows[i], "authId", authId);
				}

				RG.doSave({
					action : "/portal/sys/aum/mnu/saveAuthorMenu.do",
					endEvent : saveEndEvent,
					dataProviderPram : treeProvider,
					gridViewPram : treeView,
					showEndMessage:true,
					cud: ["U"]
				});

			}else{
				alert("선택된 값이 없습니다.");
				return;
			}


		});

		/* 저장 버튼 클릭  */
		$("#delBtn").click(function() {
			/*
			 * parameter: json 타입
		     * action : 호출할 url
		     * endEvent : 저장 이후 처리되는 함수 설정
		     * endPram : endEvent에 넘길 파라미터
		     * dataProviderPram : 조회된 리턴값 dataProvider
		     * gridViewPram : 그리드 ID
		     * checkBinding : 입력한 스트링값에 대해서 변수를 설정하고, 그 변수에 Y,N값을 체크에 따라서 설정하게 함
		     * ex : action : "/stock/report/searchStkReportDestructionListTest.action" ,
		     *      form : "srchForm",
		     *      endEvent : fnCall
		     *      endPram : "스트링,json,숫자"
		     *      dataProviderPram : dataProvider,
		     *      gridViewPram : realgrid
		     *      checkBinding : "checked"
		     */
		    //권한 선택
		    var authRows = gridView2.getCheckedRows();
			if(authRows.length == 0){
				alert("권한을 선택해주세요.");
				return;
			}

			//등록할 메뉴 선택
		    var rows = treeView.getCheckedRows();

			if(rows.length > 0){

				for (var i in rows) {
			 		treeProvider.setValue(rows[i], "authId", authId);
			 		treeProvider.setRowState(rows[i], "deleted");
				}

				RG.doSave({
					action : "/portal/sys/aum/mnu/saveAuthorMenu.do",
					endEvent : saveEndEvent,
					dataProviderPram : treeProvider,
					gridViewPram : treeView,
					showEndMessage:true,
					cud: ["D"]
				});

			}else{
				alert("선택된 값이 없습니다.");
				return;
			}


		});

		/* 저장 후 실행 function  */
		var saveEndEvent = function() {
			console.log("--------------------saveEndEvent---------------------");
			searchDate();
			console.log("--------------------saveEndEvent---------------------");
		}

		searchDate();


		/* 메뉴 그리드 셋팅 start */
	});
</script>
<div class="wrap">
	<div class="con">
		<div class="area_wrap">
			<div class="section">
				<div class="btn_info">
				<!-- p테그는 남겨줘야 자동으로 버튼이 오른쪽 정렬 -->
					<p>총건수<span id="currCnt2"></span>/<span id="totalCnt2"></span></p>
					<div class="s_btn">
						<a href="javascript:void(0)" id="saveBtn">등록</a>
						<a href="javascript:void(0)" id="delBtn">등록해제</a>
					</div>
				</div>
				<div class="column">
					<div class="left">
						<h1 class="title">권한 조회</h1>
						<form id="srchForm2" name="srchForm2" method="post" action="#">
						</form>
						<div class="grid_area_wrap" id="gridView2"></div>
						<div id="grid_paging2" class="page_num"></div>
					</div>
					<div class="right">
						<h1 class="title">메뉴조회</h1>
						<form id="srchForm" name="srchForm" method="post" action="#">
							<input type="hidden" id="searchKeyword" name="searchKeyword" value=""/>
						</form>
						<div class="grid_area_wrap" id="gridView"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>