<%
/* =================================================================
* @FileName : ViewUsrWthdStatus.jsp
* @date: 2023. 2. 1.
* @author : hjjeon
* @설명 : 탈퇴계정현황
* =================================================================
* 수정일 작성자 내용
* -----------------------------------------------------------------------
* 2023. 2. 1. hjjeon 파일생성
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
	type: "data",
	styleName: "ud-column-center"
},
{
	header: {
		text: "탈퇴일시"
	},
	name: "userWthdDt",
	fieldName: "userWthdDt",
	styleName: "ud-column-center",
    datetimeFormat: "yyyy-MM-dd"
},
{
	header: {
		text: "탈퇴 사유"
	},
	name: "statChanRsnCont",
	fieldName: "statChanRsnCont",
	type: "data",
	styleName: "ud-column-center"
},
];
var searchDate;

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
			form : "srchForm",
			editable:false,
			footerBarFlag : false
		});

		// [Btn] 조회 Clik.
		$("#srchBtn").click(function() {
			searchDate();
		});

		searchDate = function() {
			RG.doQuery({
						action : "/portal/sys/usr/wth/selectUsrWthList.do",
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
			console.log("--------------------gridEndEvent---------------------");
		}

		/* 조회 */
		searchDate();

		/* 초기화 */
		$("#initBtn").click(function(){
			var getInput = $("#srchForm input[type=text],input[type=date]");
			$.each(getInput, function (index, value) {
				$(value).val("");
		    });
			searchDate();
		});

		$("#srchForm").keydown(function (event) {
			if (event.keyCode === 13) {
				event.preventDefault();
				$("#srchBtn").click();
			}
		});
	});
</script>
<div class="wrap">
	<div class="con">
		<div class="area_wrap">
			<div class="section">
				<div class="btn_info">
					<p></p>
					<div class="s_btn">
						<a href="javascript:void(0)" id="srchBtn">조회</a>
						<a href="javascript:void(0)" id="initBtn">초기화</a>
					</div>
				</div>
				<form id="srchForm" name="srchForm" method="post">
					<input type="hidden" name="userStcd" value="99"/>	<!-- 탈퇴 -->
					<div class="search_wrap">
						<div class="item">
							<h4>사용자ID</h4>
							<input type="text" id="searchKeyword1" name="searchKeyword1" value="" placeholder="ID 입력" title="검색 키워드"/>
						</div>
						<div class="item">
							<h4>휴면일자</h4>
							<div class="date_wrap">
								<ul>
									<li><input type="date" id="searchKeywordFrom" name="searchKeywordFrom" value="" placeholder="시작일자" title="검색 키워드" maxlength="10"/></li>
									<li>~</li>
									<li><input type="date" id="searchKeywordTo" name="searchKeywordTo" value="" placeholder="종료일자" title="검색 키워드" maxlength="10"/></li>
								</ul>
							</div>
						</div>
					</div>
				</form>
				<!-- //boardtop-search -->
				<div class="btn_info">
					<p>총건수<span id="currCnt"></span>/<span id="totalCnt"></span></p>
					<div class="s_btn"></div>
				</div>
				<!-- //boardpage-infor -->
				<div class="grid_area_wrap" id="gridView"></div>
				<div id="grid_paging" class="page_num"></div>
			</div>
		</div>
		<!-- //subcon-wrap -->
	</div>
</div>