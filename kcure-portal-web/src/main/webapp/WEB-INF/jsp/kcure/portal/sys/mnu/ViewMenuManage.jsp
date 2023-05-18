<%
/* =================================================================
* @FileName : ViewMenuManage.jsp
* @date: 2023. 1. 17.
* @author : hjjeon
* @설명 :
* =================================================================
* 수정일 작성자 내용
* -----------------------------------------------------------------------
* 2023. 1. 17. hjjeon 파일생성
* =================================================================
*/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>
<script type="text/javascript">
var menuDmnSpcdCombo = RG.setGridComboBox({
    action:"/portal/sys/usr/stt/getGridCombo.do", // 호출할 url
    cdAndNm : {labels:"detlCdNm",values:"detlCd"}, // values와 labels에 입력할 json Name값들 및 values 값 속성
    params:{gbCd : "MENU_DMN_SPCD"}
});

var gridColumns = [
{
	header: {
		text: "메뉴명"
	},
	name: "menuNm",
	fieldName: "menuNm",
	required: true,
	type: "data",
	width: "140",
	tag: {
		dataType: "text"
	},
	styleName: "ud-column-center",
	editor: {
        type: "line",
        maxLength: 50
    },
    renderer : {
        showTooltip : true
    }
},
{
	header: {
		text: "상위메뉴ID"
	},
	name: "hghrMenuId",
	fieldName: "hghrMenuId",
	type: "data",
	width: "50",
	tag: {
		dataType: "text"
	},
	styleName: "ud-column-center",
	editor: {
        type: "line",
        maxLength: 10
    }
},
{
	header: {
		text: "메뉴ID"
	},
	name: "menuId",
	fieldName: "menuId",
	required: true,
	type: "data",
	width: "50",
	tag: {
		dataType: "text"
	},
	styleName: "ud-column-center",
	editor: {
        type: "line",
        maxLength: 10
    },
    renderer : {
        showTooltip : true
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
		text: "메뉴구분"
	},
	name: "menuDmnSpcd",
	fieldName: "menuDmnSpcd",
	lookupDisplay: true,
	required: true,
	values: menuDmnSpcdCombo.values,
    labels: menuDmnSpcdCombo.labels,
	width: "80",
	editor: {
        type: "dropdown",
        domainOnly: true,
        textReadOnly: true
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
		text: "메뉴URI패턴"
	},
	name: "menuUriPattCont",
	fieldName: "menuUriPattCont",
	type: "data",
	width: "120",
	styleName: "ud-column-left",
	editor: {
        type: "line",
        maxLength: 200
    }
},
{
	header: {
		text: "메뉴설명"
	},
	name: "menuExplCont",
	fieldName: "menuExplCont",
	type: "data",
	width: "150",
	styleName: "ud-column-left",
	editor: {
        type: "line",
        maxLength: 4000
    },
    renderer : {
        showTooltip : true
    }
},
{
	header: {
		text: "메뉴순서"
	},
	name: "menuOputOrd",
	fieldName: "menuOputOrd",
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
	name: "menuUseYn",
	fieldName: "menuUseYn",
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
	$(document).ready(function() {
		//그리드
		var treeProvider = new RealGrid.LocalTreeDataProvider();
		var treeView = new RealGrid.TreeView('gridView');
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
						action : "/portal/sys/mnu/mng/selectMenuList.do",
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
			treeView.expandAll();
// 			treeView.orderBy(['menuOputOrd'],['ascending']);
			console.log("--------------------gridEndEvent---------------------");
		}

		/* 행추가 버튼 클릭  */
		//insertChildRow(rowId, index, values, iconIndex, hasChildren)
		$("#addBtn").click(function() {
			treeProvider.insertChildRow(0, 0, [], -1, false);
// 			 RG.insertRowGrid({
// 				dataProviderPram : treeProvider,
// 				dataValues:[],
// 				endEvent: addEndEvent
// 			});
		});

		/*행추가 후 실행 function  */
		var addEndEvent = function() {
			console.log("--------------------addEndEvent---------------------");
			console.log("--------------------addEndEvent---------------------");
		}


		 /* RG.deleteCreateRowGrid({ gridViewPram: gridView, dataProviderPram: dataProvider }); */

		/* 행삭제 버튼 클릭  */
		$("#delBtn").click(function() {
			RG.deleteRowGrid({
				gridViewPram: treeView
				, dataProviderPram: treeProvider
				, endEvent: delEndEvent
			});
			/* treeProvider.insertRow(0,[]); */
		});

		/*행삭제 후 실행 function  */
		var delEndEvent = function() {
			console.log("--------------------delEndEvent---------------------");
			console.log("--------------------delEndEvent---------------------");
		}


		/* 저장 버튼 클릭  */
		$("#saveBtn").click(function() {
			var log = treeView.validateCells(null, false);
			if(JSON.stringify(log) == 'null'){
			    var rows = treeView.getCheckedRows();

				if(rows.length > 0){
				     RG.doSave({
				    	 action : "/portal/sys/mnu/mng/saveMenuManage.do" ,
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
	});
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
					</div>
				</div>
				<!-- 리얼그리드 영역 | 나중에 style 삭제요망-->
				<div class="grid_area_wrap" id="gridView"></div>
			</div>
		</div>
	</div>
</div>