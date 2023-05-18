<%
/* =================================================================
* @FileName : InstPopup.jsp
* @date: 2023. 2. 09.
* @author : hjjeon
* @설명 : 기관조회 팝업
* =================================================================
* 수정일 작성자 내용
* -----------------------------------------------------------------------
* 2023. 1. 30. hjjeon 파일생성
* =================================================================
*/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>
<script type="text/javascript">
var gridColumns = [
	{
		header: {
			text: "기관ID"
		},
		name: "prtiId",
		fieldName: "prtiId",
		type: "data",
		styleName: "ud-column-center"
	},
	{
		header: {
			text: "기관명"
		},
		name: "prtiNm",
		fieldName: "prtiNm",
		type: "data",
		styleName: "ud-column-center"
	}
];
$(document).ready(function() {
	var opener;

	if (window.dialogArguments) {
	    opener = window.dialogArguments; // Support IE
	} else {
	    opener = window.opener;    // Support Chrome, Firefox, Safari, Opera
	}

	//그리드
	var gridDataProvider = new RealGrid.LocalDataProvider();
	var gridView = new RealGrid.GridView('gridView');
	gridView.setDataSource(gridDataProvider);
	/* 자동 컬럼 크기 조절  */
	gridView.displayOptions.fitStyle = "fill";
	gridView.displayOptions.syncGridHeight = "always";

	//그리드 컬럼 정보 세팅
	setFieldsNColumns(gridDataProvider, gridView, gridColumns);

	//초기 세팅(주의: 조회 함수 밑에 둬야 함)
	RG.initPattern({
		dataProviderPram : gridDataProvider,
		gridViewPram : gridView,
		gridCheckBoxFlag: true,
		form : "pForm",
		editable: false,
		footerBarFlag : false
	});

	var searchDate = function() {
		RG.doQuery({
					action : "/portal/sys/pim/mng/selectPrtiList.do",
					form : "pForm",
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
		console.log("--------------------gridEndEvent---------------------");
	}

	searchDate();

	$("#btnSearch").click(function(){
		searchDate();
	});

	$("#saveBtn").click(function(){
		var pHtml = "";

		var items = gridView.getCheckedItems();
		$.each(items, function (index, value) {
			pHtml += "<a href=\"#\" class=\"file_list\" id=\""+gridView.getValue(value, "prtiId")+"\" onclick=\"fnInstDel(\'"+gridView.getValue(value, "prtiId")+"\');\">"+gridView.getValue(value, "prtiNm")+"</a>";
	    });

		$("#instList a", opener.document).remove();
		$("#instList", opener.document).append(pHtml);

		self.close();
	});

	gridView.onDataLoadComplated = function(grid){
		//화면 크기 조절
		window.resizeTo( $('.window_pop').outerWidth()+15, $('.window_pop').outerHeight()+70);
	}
});

</script>
<div class="window_pop">
	<h1 class="title">연구 수행기관</h1>
	<form id="pForm" name="pForm">
		<input type="hidden" id="searchKeyword2" name="searchKeyword2" value="03"/>
		<div class="pop_search">
			<p class="txt">기관</p>
			<input type="text" class="ad_input" name="searchKeyword1" maxlength="200"/>
			<a href="javascript:void(0)" class="btn" id="btnSearch">조회</a>
		</div>
	</form>

	<div class="grid_area_wrap" id="gridView"></div>
	<div id="grid_paging" class="page_num"></div>

	<div class="win_btn">
		<a href="javascript:void(0)" onclick="self.close();">닫기</a>
		<a href="javascript:void(0)" id="saveBtn">확인</a>
	</div>
</div>