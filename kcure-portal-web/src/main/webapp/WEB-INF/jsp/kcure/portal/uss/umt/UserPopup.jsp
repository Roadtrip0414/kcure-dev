<%
/* =================================================================
* @FileName : UserPopup.jsp
* @date: 2023. 1. 6.
* @author : hjjeon
* @설명 :
* =================================================================
* 수정일 작성자 내용
* -----------------------------------------------------------------------
* 2023. 1. 6. hjjeon 파일생성
* =================================================================
*/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	name: "afflPrtInstId",
	fieldName: "afflPrtInstId",
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
			gridCheckBoxFlag: true,
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
						action : "/portal/uss/umt/selectUserList.do",
						form : "srchForm",
						dataProviderPram : gridDataProvider,
						gridViewPram : gridView,
						endEvent: gridEndEvent,
						pagingId:"grid_paging"
					});
		}


		/* 조회 완료시 실행된 스크립트 정리   */
		var gridEndEvent = function(endEventParam, response) {
			console.log("--------------------gridEndEvent---------------------");
			console.log(endEventParam);
			console.log(response);
			if(typeof response !== "undefined"){
				$("#totalCnt").text(response.paginationInfo.totalRecordCount);
			}else{
				$("#totalCnt").text("0");
			}
			console.log("--------------------gridEndEvent---------------------");
		}

		/* 조회 */
		searchDate();

		$("#selBtn").click(function() {
			var rowDatas = [];
			var rows = gridView.getCheckedRows();

			if(rows.length > 0){
				for (var i in rows) {
				  var data = gridDataProvider.getJsonRow(rows[i]);
				  rowDatas.push(data);
				}

				var rtnStr = JSON.stringify(rowDatas);
				$(opener.location).attr("href", "javascript:setParent("+rtnStr+");");
				self.close();
			}else{
				alert("사용자를 선택해주세요.");
				return;
			}
		});
});
</script>
<div class="window_pop">
	<h1 class="title">사용자 선택</h1>

	<div class="subcon-wrap">
		<div class="inbox-wrap">
			<form id="srchForm" name="srchForm" method="post" action="#">
			<div class="boardtop-search">
				<fieldset>
					<legend>공지사항 검색</legend>
					<div class="input-inbox">
						<span class="fe-input">
							<input type="text" name="searchKeyword" id="searchKeyword" value="<c:out value='${ramVO.searchKeyword}'/>" placeholder="검색어 입력" title="검색 키워드">
							<button type="submit" class="btn-search" id="btnSearch"><span class="blind">검색</span></button>
						</span>
					</div>
				</fieldset>
			</div>
			</form>
			<!-- //boardtop-search -->
			<div class="boardpage-infor">
				<p>총<strong class="num" id="totalCnt"></strong>건</p>
			</div>
			<!-- //boardpage-infor -->
			<button id="selBtn" class="btn">선택</button>
			<div class="grid_table" id="gridView" style="width: 100%; height: 650px;"></div>
			<div id="grid_paging" class="pagination"></div>
		</div>
	</div>
	<!-- //subcon-wrap -->

</div>
<!-- //container -->