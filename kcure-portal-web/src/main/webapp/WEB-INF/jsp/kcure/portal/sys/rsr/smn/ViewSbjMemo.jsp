<%
/* =================================================================
* @FileName : ViewSbjMemo.jsp
* @date: 2023. 3. 30.
* @author : hjjeon
* @설명 :
* =================================================================
* 수정일 작성자 내용
* -----------------------------------------------------------------------
* 2023. 3. 30. hjjeon 파일생성
* =================================================================
*/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>
<script type="text/javascript">
var gridColumns = [
	{
		header: {
			text: "연구제목"
		},
		name: "rsrSbjNm",
		fieldName: "rsrSbjNm",
		type: "data",
		styleName: "ud-column-left",
		width: "200"
	},
	{
		header: {
			text: "연구기간"
		},
		name: "rsrSdt",
		fieldName: "rsrSdt",
		styleName: "ud-column-center",
		renderer: {
		    type: "html",
		    inputFocusable: true,
		    callback: function (grid, cell, w, h) {
		    	var rsrSdt = cell.value;
		     	return rsrSdt + " ~ " + grid.getValue(cell.index.dataRow, "rsrEdt");
			},
		},
	},
	{
		header: {
			text: "종료일"
		},
		name: "rsrEdt",
		fieldName: "rsrEdt",
		visible: false
	},
	{
		header: {
			text: "메모"
		},
		name: "memoCont",
		fieldName: "memoCont",
		type: "data",
		styleName: "ud-column-center",
		renderer: {
		    type: "html",
		    inputFocusable: true,
		    callback: function (grid, cell, w, h) {
		    	var dataAplcNo = grid.getValue(cell.index.dataRow, 'dataAplcNo');

		     	return "<a href='##' onclick='fnDetail(`"+dataAplcNo+"`);'>보기</a>";
			},
		},
	},
	{
		header: {
			text: "ID"
		},
		name: "dataAplcNo",
		fieldName: "dataAplcNo",
		type: "data",
		styleName: "ud-column-center",
		visible: false
	}
];

$(document).ready(function() {
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
		gridCheckBoxFlag: false,
		form : "srchFrm",
		editable: false,
		footerBarFlag : false
	});

	// [Btn] 조회 Clik.
	$("#srchBtn").click(function() {
		if($("#searchCondition").val() != "" && $("#searchCondition").val() != null){
			if($("#searchKeyword").val() != "" && $("#searchKeyword").val() != null){
				searchDate();
			}else{
				alert("검색어를 입력해주세요.");
				return false;
			}
		}else{
			searchDate();
		}
	});

	var searchDate = function() {
		if(srchFrm.searchKeywordFrom.value > srchFrm.searchKeywordTo.value){
	         alert("<spring:message code="comSymLogLgm.validate.dateCheck" />"); //검색조건의 시작일자가 종료일자보다  늦습니다. 검색조건 날짜를 확인하세요!
	         return;
		  }
		RG.doQuery({
					action : "/portal/sys/rsr/smn/selectSbjMemoList.do",
					form : "srchFrm",
					dataProviderPram : gridDataProvider,
					gridViewPram : gridView,
					endEvent: gridEndEvent,
					pagingId:"grid_paging",
					totalId: "totalCnt",
					currCntId: "currCnt"
				});
	}


	/* 조회 완료시 실행된 스크립트 정리   */
	var gridEndEvent = function(endEventParam, response) {
		console.log("--------------------gridEndEvent---------------------");
		console.log(endEventParam);
		console.log(response);
		console.log("--------------------gridEndEvent---------------------");
	}

	/* 조회 */
	searchDate();

	$("#srchFrm").keydown(function (event) {
		if (event.keyCode === 13) {
			event.preventDefault();
			$("#srchBtn").click();
		}
	});

	/* 초기화 */
	$("#initBtn").click(function(){
		var getInput = $("#srchFrm input[type=text],input[type=date]");
		$.each(getInput, function (index, value) {
			$(value).val("");
	    });
		$("#searchCondition").val("");
		searchDate();
	});
});

//상세 보기 이동
function fnDetail(obj){
	$("#srchFrm input[name='pageIndex']").val($("#grid_paging input[name='pageIndex']").val());
	$("input[name='dataAplcNo']").val(obj);
	$("#srchFrm").attr("action", "/portal/sys/rsr/smn/detailViewSbjMemo.do").submit();
}

</script>
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

				<form id="srchFrm" name="srchFrm" method="post" action="#">
				<input type="hidden" name="dataAplcNo" value="0">
				<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>">
				<div class="search_wrap">
					<div class="item">
						<h4>검색대상</h4>
						<div class="sel_int">
							<select id="searchCondition" name="searchCondition">
								<option value="">선택</option>
								<option value="1">연구제목</option>
								<option value="2">내용</option>
							</select>
							<input type="text" id="searchKeyword" name="searchKeyword" value="" placeholder="검색어 입력" />
						</div>
					</div>
					<div class="item">
						<h4>기간</h4>
						<div class="date_wrap">
							<ul>
								<li><input type="date" id="searchKeywordFrom" name="searchKeywordFrom" value="" placeholder="시작일자" maxlength="10"></li>
								<li>~</li>
								<li><input type="date" id="searchKeywordTo" name="searchKeywordTo" value="" placeholder="종료일자" maxlength="10"></li>
							</ul>
						</div>
					</div>
				</div>
				</form>
				<div class="btn_info">
					<p>총건수<span id="currCnt"></span>/<span id="totalCnt"></span></p>
				</div>

				<div class="grid_area_wrap" id="gridView"></div>
				<div id="grid_paging" class="page_num"></div>
			</div>
		</div>
	</div>
</div>