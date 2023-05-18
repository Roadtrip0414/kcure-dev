<%
/* =================================================================
* @FileName : ViewAuthorUserManage
* @date: 2023. 1. 3.
* @author : hjjeon
* @설명 : 권한 유저 맵핑 화면
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

var gridColumns = [
{
	header: {
		text: "사용자ID"
	},
	name: "userId",
	fieldName: "userId",
	styleName: "ud-column-center",
	width: "200",
	editable: false
},
{
	header: {
		text: "사용자명"
	},
	name: "userNm",
	fieldName: "userNm",
	styleName: "ud-column-center",
	editable: false
},
{
	header: {
		text: "권한"
	},
	name: "authId",
	fieldName: "authId",
	styleName: "ud-column-center",
	visible: false
}
];

$(document).ready(
	function() {
		var gridDataProvider = new RealGrid.LocalDataProvider();
		var gridView = new RealGrid.GridView('gridView');
		gridView.setDataSource(gridDataProvider);
		/* 자동 컬럼 크기 조절  */
		gridView.displayOptions.fitStyle = "fill";
		gridView.displayOptions.syncGridHeight = "always";
		gridView.editOptions.commitByCell = true;

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

		$("#srchBtn").click(function() {
			searchDate();
		});

		var searchDate = function() {
			if($("#searchKeywordFrom").val() > $("#searchKeywordTo").val()){
		         alert("<spring:message code="comSymLogLgm.validate.dateCheck" />"); //검색조건의 시작일자가 종료일자보다  늦습니다. 검색조건 날짜를 확인하세요!
		         return;
			}

			RG.doQuery({
						action : "/portal/sys/aum/usr/selectAuthorUserManage.do",
						form : "srchForm",
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
			if(typeof response != "undefined"){
				var addHeader = {};
				var authList = response.allAuthList;

				if(authList.length > 0){
					for(var i=0; i<authList.length; i++ ){
						var col = {};
						col.name = authList[i].authId;
						col.fieldName = authList[i].authId;
						col.renderer = { "type" : "check", "trueValues": authList[i].authId, "falseValues":"undefined"};
						addHeader.text = authList[i].authNm;
						col.header = addHeader;
						col.editable = false;
						if(gridView.layoutByColumn(authList[i].authId) == null){
							gridDataProvider.addField(col);
							gridView.addColumn(col);
						}
					}
				}

				//체크박스 체크
				for(var i=0; i< endEventParam.length; i++){
					var authIds = endEventParam[i].authId;
					if(authIds != null){
						var authArr = authIds.split(",");
						for(var j=0; j < authArr.length; j++){
							gridDataProvider.setValue(i, authArr[j] , authArr[j]);
						}
					}
				}

				//수정이벤트 추가
				var col = {};
				col.header = "관리";
				col.name = "update";
				col.renderer = {"type":"html"
						,"callback": function(grid, cell, w, h) {
										var userId = grid.getValue(cell.index.dataRow, 'userId');
										var str = '<a onclick="fnUpdate(\''+userId+'\');">수정</a>';
										return str;
		      						}
				};

				if(gridView.layoutByColumn("update") == null){
					gridView.addColumn(col);
				}
				
				$("#curPageIndex").val("0");
			}

			
			console.log("--------------------gridEndEvent---------------------");
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

			var stateParam = {};
			var param = {};

			var tempData = [];
			var gridId = ["gridView"];	//grid ID

			var rows = gridView.getCheckedRows();
			//console.log(rows);

			for(var i = 0; i < rows.length; i++){
				var temp = gridView.getValues(rows[i]);
				var authId = "";
				for(j of Object.keys(temp)){
					if("userId,userNm,authId,__rowId".indexOf(j) < 0){
						if(typeof temp[j] !== "undefined"){
							authId += temp[j] + ",";
						}
					}
				}
				temp.authId = authId;
		    	tempData.push(temp);
			}
			stateParam.CREATE = tempData;
			param.gridView = stateParam;
			param.IDS = gridId;

			//console.log(param);
			var GRID_DATA = "GRID_DATA=" + JSON.stringify(param);

			$.ajax({
				url: "/portal/sys/aum/usr/saveAuthorUser.do",
				dataType: "json",
				data: GRID_DATA,
				type: "POST",
				async: false,
				success: function(response) {
					alert(GM.save_success);
				},
				complete: function(response) {
					saveEndEvent(response.responseJSON);
				}
			});
		});

		/* 저장 후 실행 function  */
		var saveEndEvent = function(endEventParam) {
			console.log("--------------------saveEndEvent---------------------");
			console.log(endEventParam);
			searchDate();
			console.log("--------------------saveEndEvent---------------------");
		}

		searchDate();

		/* 초기화 */
		$("#initBtn").click(function(){
			var getInput = $("#srchForm input[type=text],input[type=date]");
			$.each(getInput, function (index, value) {
				$(value).val("");
		    });
			//select값 초기화
			$("#searchKeyword1").val("");
			searchDate();
		});

		$("#srchForm").keydown(function (event) {
			if (event.keyCode === 13) {
				event.preventDefault();
				$("#srchBtn").click();
			}
		});
	});

	//수정 페이지 이동
	var fnUpdate = function(obj){
		$("#curPageIndex").val($('input[name="pageIndex"]').val());
		$("input[name='userId']").val(obj);
		$("#srchForm").attr("action", "/portal/sys/aum/usr/detailViewAuthorUserManage.do").submit();
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

				<form id="srchForm" name="srchForm" method="post" action="#">
					<input type="hidden" id="curPageIndex" name="curPageIndex"  value='<c:out value="${curPageIndex}"/>'/>
					<input type="hidden" name="userId" />
					<input type="hidden" name="userId" />
					<div class="search_wrap">
						<div class="item">
							<h4>권한명</h4>
							<select name="searchKeyword1" id="searchKeyword1" title="검색 범위">
								<option value="">전체</option>
								<c:forEach items="${allAuthList}" var="list">
									<option value="${list.authId}">${list.authNm}</option>
								</c:forEach>
							</select>
						</div>
						<div class="item">
							<h4>사용자ID</h4>
							<input type="text" id="searchKeyword2" name="searchKeyword2" value="" placeholder="ID 입력" title="검색 키워드">
						</div>
						<div class="item">
							<h4>이름</h4>
							<input type="text" id="searchKeyword3" name="searchKeyword3" value="" placeholder="사용자명 입력" title="검색 키워드">
						</div>
						<div class="item">
							<h4>승인일자</h4>
							<div class="date_wrap">
								<ul>
									<li><input type="date" id="searchKeywordFrom" name="searchKeywordFrom" value="" placeholder="시작일자" title="검색 키워드"></li>
									<li>~</li>
									<li><input type="date" id="searchKeywordTo" name="searchKeywordTo" value="" placeholder="종료일자" title="검색 키워드"></li>
								</ul>
							</div>
						</div>
					</div>
				</form>
				<!-- //boardtop-search -->
				<div class="btn_info">
					<p>총건수<span id="currCnt"></span>/<span id="totalCnt"></span></p>
<!-- 					<div class="s_btn"> -->
<!-- 						<a href="javascript:void(0)" id="saveBtn">저장</a> -->
<!-- 					</div> -->
				</div>
				<!-- //boardpage-infor -->
				<div class="grid_area_wrap" id="gridView"></div>
				<div id="grid_paging" class="page_num"></div>
			</div>
		</div>
	</div>
</div>
