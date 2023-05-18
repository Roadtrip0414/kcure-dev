<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>
<script type="text/javascript">
var gridColumns = [
{
	header: {
		text: "이름"
	},
	name: "userNm",
	fieldName: "userNm",
	type: "data",
	tag: {
		dataType: "text"
	},
	styleName: "ud-column-center",
	editor: {
        type: "line",
        maxLength: 30,
        inputCharacters: "A-Za-z"
    }
},
{
	header: {
		text: "아이디"
	},
	name: "userId",
	fieldName: "userId",
	type: "data",
	tag: {
		dataType: "text"
	},
	styleName: "ud-column-center",
	editor: {
        type: "line",
        maxLength: 60
    }
},
{
	header: {
		text: "소속기관"
	},
	name: "prtiNm",
	fieldName: "prtiNm",
	type: "data",
	tag: {
		dataType: "text"
	},
	styleName: "ud-column-center",
	editor: {
        type: "line",
        maxLength: 200
    }
}
,
{
	header: {
		text: "소속기관Id"
	},
	name: "prtiId",
	fieldName: "prtiId",
	type: "data",
	tag: {
		dataType: "text"
	},
	styleName: "ud-column-center",
	editor: {
        type: "line",
        maxLength: 200
    }
	,visible :false
}
];
$(document).ready(
	function() {
		//그리드
		var gridDataProvider = new RealGrid.LocalDataProvider();
		var gridView = new RealGrid.GridView('gridView');
		gridView.setDataSource(gridDataProvider);
		/* 자동 컬럼 크기 조절  */
		gridView.displayOptions.fitStyle = "fill";
		//그리드 컬럼 정보 세팅
		setFieldsNColumns(gridDataProvider, gridView, gridColumns);

		//초기 세팅(주의: 조회 함수 밑에 둬야 함)
		RG.initPattern({
			dataProviderPram : gridDataProvider,
			gridViewPram : gridView,
			gridCheckBoxFlag: false,
			form : "srchForm",
			editable: false,
			footerBarFlag : false
		});
		// [Btn] 조회 Clik.
		$("#srchBtn").click(function() {
			searchDate();
		});
		var searchDate = function() {
			RG.doQuery({
						action : "/portal/dac/clc/inf/selectUserList.do",
						form : "srchForm",
						dataProviderPram : gridDataProvider,
						gridViewPram : gridView
					});
		}
		//클릭시 
		gridView.onCellClicked =  function (grid, clickData) {
			var index = clickData.itemIndex;
			if(index  > -1){
			  var rowId =  gridView.getDataRow(index);
			  var data =  gridDataProvider.getJsonRow(rowId);
			  var rtnStr = JSON.stringify(data);
			  $(opener.location).attr("href", "javascript:setParent("+rtnStr+");");
			  self.close();
			}
		};
		
		/* 조회 */
		searchDate();
});
</script>
<div class="window_pop">
	<h1 class="title">사용자 선택</h1>

	<div class="subcon-wrap">
		<div class="inbox-wrap">
			<form id="srchForm" name="srchForm" method="post" action="#">
			<%-- <div class="boardtop-search">
				<fieldset>
					<legend>사용자 검색</legend>
					<div class="input-inbox">
						<span class="fe-input">
							<input type="text" name="searchKeyword" id="searchKeyword" value="<c:out value='${searchKeyword}'/>" placeholder="검색어 입력" title="검색 키워드">
							<button type="submit" class="btn-search" id="btnSearch"><span class="blind">검색</span></button>
						</span>
					</div>
				</fieldset>
			</div>
			 --%>
			</form>
			* 더블클릭 선택
			<!-- //boardpage-infor -->
			<!-- <button id="selBtn" class="btn">선택</button> -->
			<div class="grid_table" id="gridView" style="width: 100%; height: 650px;"></div>
		</div>
	</div>
	<!-- //subcon-wrap -->

</div>
<!-- //container -->