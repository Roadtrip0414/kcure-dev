<%
/* =================================================================
* @FileName : ViewDvzMenuManage.jsp
* @date: 2023. 3. 27.
* @author : hjjeon
* @설명 : 시각화 메뉴 관리
* =================================================================
* 수정일 작성자 내용
* -----------------------------------------------------------------------
* 2023. 3. 27. hjjeon 파일생성
* =================================================================
*/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>
<script type="text/javascript">
var aprcAuthSpcdCombo = RG.setGridComboBox({
    action:"/portal/sys/usr/stt/getGridCombo.do", // 호출할 url
    cdAndNm : {labels:"detlCdNm",values:"detlCd"}, // values와 labels에 입력할 json Name값들 및 values 값 속성
    params:{gbCd : "APRC_AUTH_SPCD"}
});

var gridColumns = [
{
	header: {
		text: "분류명"
	},
	name: "vslzMenuNm",
	fieldName: "vslzMenuNm",
	required: true,
	type: "data",
	width: "140",
	styleName: "ud-column-center",
	editor: {
        type: "line",
        maxLength: 200
    },
    renderer : {
        showTooltip : true
    }
},
{
	header: {
		text: "연결메뉴ID"
	},
	name: "lnkgMenuId",
	fieldName: "lnkgMenuId",
	required: true,
	type: "data",
	width: "100",
	styleName: "ud-column-center",
	editor: {
        type: "line",
        maxLength: 10
    }
},
{
	header: {
		text: "상위분류ID"
	},
	name: "hghrVslzMenuId",
	fieldName: "hghrVslzMenuId",
	type: "data",
	width: "100",
	styleName: "ud-column-center",
	editor: {
        type: "line",
        maxLength: 10
    }
},
{
	header: {
		text: "분류ID"
	},
	name: "vslzMenuId",
	fieldName: "vslzMenuId",
	required: true,
	type: "data",
	width: "100",
	styleName: "ud-column-center",
	editor: {
        type: "line",
        maxLength: 10
    },
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
		text: "메뉴URI"
	},
	name: "menuUriAddr",
	fieldName: "menuUriAddr",
	type: "data",
	width: "250",
	styleName: "ud-column-left",
	editor: {
        type: "line",
        maxLength: 200
    },
    renderer : {
        showTooltip : true
    }
},
{
	header: {
		text: "분류설명"
	},
	name: "vslzMenuExplCont",
	fieldName: "vslzMenuExplCont",
	type: "data",
	width: "200",
	styleName: "ud-column-left",
	editor: {
        type: "line",
        maxLength: 4000
    }
},
{
	header: {
		text: "요약통계번호"
	},
	name: "smryStatsNo",
	fieldName: "smryStatsNo",
	type: "data",
	width: "80",
	styleName: "ud-column-center",
	editor: {
        type: "line",
        maxLength: 10
    }
},
{
	header: {
		text: "접근권한"
	},
	name: "aprcAuthSpcd",
	fieldName: "aprcAuthSpcd",
	lookupDisplay: true,
	required: true,
	values: aprcAuthSpcdCombo.values,
    labels: aprcAuthSpcdCombo.labels,
	width: "80",
	editor: {
        type: "dropdown",
        domainOnly: true,
        textReadOnly: true
    }
},
{
	header: {
		text: "분류순서"
	},
	name: "vslzMenuOrd",
	fieldName: "vslzMenuOrd",
	required: true,
	type: "data",
	width: "50",
	styleName: "ud-column-center",
	editor: {
        type: "number",
        maxLength: 3
    }
},
{
	header: {
		text: "사용여부"
	},
	name: "useYn",
	fieldName: "useYn",
	lookupDisplay: true,
	required: true,
	values: [
	       "Y",
	       "N"
	   ],
	labels: [
	     "사용",
	     "사용안함"
	 ],
	width: "50",
	styleName: "ud-column-center",
	editor: {
        type: "dropdown",
        domainOnly: true,
        textReadOnly: true
    }
}

];
var treeProvider;
var treeView;

	$(document).ready(function() {
		//그리드
		treeProvider = new RealGrid.LocalTreeDataProvider();
		treeView = new RealGrid.TreeView('gridView');
		treeView.setDataSource(treeProvider);
		/* 자동 컬럼 크기 조절  */
		treeView.displayOptions.fitStyle = "fill";
		treeView.displayOptions.syncGridHeight = "always";
		treeView.treeOptions.expanderIconStyle = "square";
		treeView.editOptions.movable = true;
		treeView.editOptions.rowMovable = true;
		treeView.editOptions.commitByCell = true;
		treeView.editOptions.commitLevel = "error";

		//그리드 컬럼 정보 세팅
		setFieldsNColumns(treeProvider, treeView, gridColumns);

		//초기 세팅(주의: 조회 함수 밑에 둬야 함)
		RG.initPattern({
			dataProviderPram : treeProvider,
			gridViewPram : treeView,
			gridCheckBoxFlag: true,
			form : "srchForm",
			editable:true,
			footerBarFlag : false
		});
		// [Btn] 조회 Clik.
		$("#srchBtn").click(function() {
			searchDate();
		});

		var searchDate = function() {
			RG.doQueryTree({
						action : "/portal/sys/mnu/dvz/selectMenuList.do",
						form : "srchForm",
						dataProviderPram : treeProvider,
						gridViewPram : treeView,
						endEvent: gridEndEvent,
						treeField: "vslzMenuId",
						childrenField: "",
						iconField:""
					});
		}


		/* 조회 완료시 실행된 스크립트 정리   */
		var gridEndEvent = function(endEventParam, response) {
			console.log("--------------------gridEndEvent---------------------");
			console.log(endEventParam);
			console.log(response);
			treeView.expandAll();
			console.log("--------------------gridEndEvent---------------------");
		}

		/* 행추가 버튼 클릭  */
		$("#addBtn").click(function() {
			treeProvider.insertChildRow(0, 0, [], -1, false);
		});

		/*행추가 후 실행 function  */
		var addEndEvent = function() {
			console.log("--------------------addEndEvent---------------------");
			console.log("--------------------addEndEvent---------------------");
		}

		/* 행삭제 버튼 클릭  */
		$("#delBtn").click(function() {
			RG.deleteRowGrid({
				gridViewPram: treeView
				, dataProviderPram: treeProvider
				, endEvent: delEndEvent
			});
		});

		/*행삭제 후 실행 function  */
		var delEndEvent = function() {
		}


		/* 저장 버튼 클릭  */
		$("#saveBtn").click(function() {
			var log = treeView.validateCells(null, false);
			if(JSON.stringify(log) == 'null'){
			    var rows = treeView.getCheckedRows();

				if(rows.length > 0){
				     RG.doSave({
				    	 action : "/portal/sys/mnu/dvz/saveMenuManage.do" ,
					     endEvent : saveEndEvent,
					     dataProviderPram : treeProvider,
					     gridViewPram : treeView,
					     showEndMessage:true,
					     cud: ["C", "U","D","R"]
				     });
				}else{
					alert("선택된 값이 없습니다.");
					return;
				}
			}else{
				alert("필수 값을 입력하세요.");
				return;
			}
		});

		/*저장 후 실행 function  */
		var saveEndEvent = function() {
			console.log("--------------------saveEndEvent---------------------");
			searchDate();
			console.log("--------------------saveEndEvent---------------------");
		}

		/* 조회 */
		searchDate();

		$("#xlsUploadBtn").click(function() {
			window.open("/portal/sys/mnu/dvz/dvzMenuXlsUploadPopup.do","xlsUp","scrollbars=no, resizable=no");
		});
	});

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
					if(typeof item.분류ID == "undefined"){
						alert("분류ID를 확인해주세요.");
						return;
					}
					return {
						vslzMenuNm: item.분류명,
						lnkgMenuId: item.연결메뉴ID,
						hghrVslzMenuId: item.상위분류ID,
						vslzMenuId: item.분류ID,
						menuUriAddr: item.메뉴URI,
						vslzMenuExplCont: item.분류설명,
						smryStatsNo: item.요약통계번호,
						aprcAuthSpcd: item.접근권한,
						vslzMenuOrd: item.분류순서,
						useYn: item.사용여부
					};
				});

				treeProvider.setRows(mappedData, "vslzMenuId", false, null, "");

				var rows = treeProvider.getRowStateCount("none");

				for (i = 1; i <= rows ; i++) {
					treeProvider.setRowState(i, "updated", true);
					treeView.checkRow(i, true);
				}

				treeView.expandAll();
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
<div class="wrap">
	<div class="con">
		<div class="area_wrap">
			<div class="section">
				<div class="btn_info">
					<form id="srchForm" name="srchForm" method="post">
					</form>
					<!-- p테그는 남겨줘야 자동으로 버튼이 오른쪽 정렬 -->
					<p></p>
					<div class="s_btn">
						<a href="javascript:void(0)" id="addBtn">신규</a>
						<a href="javascript:void(0)" id="saveBtn">저장</a>
						<a href="javascript:void(0)" id="delBtn">삭제</a>
						<a href="javascript:void(0)" id="xlsUploadBtn">엑셀업로드</a>
					</div>
				</div>
				<!-- 리얼그리드 영역 | 나중에 style 삭제요망-->
				<div class="grid_area_wrap" id="gridView"></div>
			</div>
		</div>
	</div>
</div>