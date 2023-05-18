<%
/* =================================================================
* @FileName : SelectCdsDfndPopup.jsp
* @date: 2023. 2. 9.
* @author : parkgu
* @설명 : 엑셀업로드 팝업
* =================================================================
* 수정일 작성자 내용
* -----------------------------------------------------------------------
* 2023. 2. 9. parkgu 파일생성
* =================================================================
*/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>
<script type="text/javascript">
const gridColumns = [
	{
		header: {
			text: "코드목록ID"
		},
		name: "grpCd",
		fieldName: "grpCd",
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
	{
		header: {
			text: "코드목록명"
		},
		name: "grpCdNm",
		fieldName: "grpCdNm",
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
$(document).ready(function() {
	//팝업 사이즈 조정
	window.resizeTo(750, 600);
	$('body').css('overflow-y', 'scroll');
	//그리드
	const gridDataProvider = new RealGrid.LocalDataProvider();

	const gridView = new RealGrid.GridView('gridView');
	
	gridView.setCheckBar({
		exclusive: true
	});

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
		form : "srchForm",
		editable:true,
		footerBarFlag : false
	});

	// [Btn] 조회 Clik.
	$("#btnSearch").click(function() {
		$("input[type=hidden][name=pageIndex]").val("1");
		searchAction();

		return false;
	});
	
	/*
	gridView.onCurrentRowChanged = function (grid, oldRow, newRow) {
		if (newRow < 0) {
			return;
		}

		var cdId = gridView.getValue(newRow, "grpCd");
		
		alert(oldRow + "//" + newRow);
		window.opener.setCdIdFromPopup(cdId);
	};
	*/
	
	gridView.onItemChecked = function (grid, itemIndex, checked) {
		var cdId = gridView.getValue(itemIndex, "grpCd");
		window.opener.setCdIdFromPopup(cdId);
		self.close();
	}

	const searchAction = function() {
		RG.doQuery({
					form :  "srchFrm",
					action : "/portal/sys/ctg/cds/selectCdsDfndList.do",
					dataProviderPram : gridDataProvider,
					gridViewPram : gridView,
					endEvent: gridEndEvent,
					pagingId:"grid_paging"
				});
	}

	/* 조회 완료시 실행된 스크립트 정리   */
	const gridEndEvent = function(endEventParam, response) {
		if(typeof response !== "undefined"){
			$("#totalCnt").text(response.paginationInfo.totalRecordCount);
		}else{
			$("#totalCnt").text("0");
		}
	}

	/* 조회 */
	searchAction();
});

</script>
<div class="window_pop" style="overflow: visible">
	<h1 class="title">코드 조회</h1>
	<form id="srchFrm" name="srchFrm" method="post">
		<div class="pop_search">
			<p class="txt">코드목록ID</p>
			<input type="text" class="ad_input" name="searchKeyword" id="searchKeyword" value="" placeholder="코드목록ID 입력" title="코드목록ID 입력">
			<p class="txt">코드목록명</p>
			<input type="text" class="ad_input" name="searchKeyword1" id="searchKeyword1" value="" placeholder="코드목록명 입력" title="코드목록명 입력">
			<a href="javascript:void(0)" class="btn" id="btnSearch">조회</a>
		</div>
	</form>
	<div class="grid_area_wrap" id="gridView"></div>
	<div id="grid_paging" class="page_num"></div>
	<div class="win_btn">
		<a href="javascript:void(0)" onclick="self.close();">닫기</a>
<!-- 		<a href="javascript:void(0)">확인</a> -->
	</div>
</div>
