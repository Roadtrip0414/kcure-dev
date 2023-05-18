<%
/* =================================================================
* @FileName : ViewBfntHst.jsp
* @date: 2023. 2. 2.
* @author : hjjeon
* @설명 : Email발송이력현황
* =================================================================
* 수정일 작성자 내용
* -----------------------------------------------------------------------
* 2023. 2. 2. hjjeon 파일생성
* =================================================================
*/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>
<script type="text/javascript">
var gridColumns = [
{
	header: {
		text: "고지구분"
	},
	name: "bfntCscd",
	fieldName: "bfntCscd",
	type: "data",
	styleName: "ud-column-center"
},
{
	header: {
		text: "발송방법"
	},
	name: "bfntMtcd",
	fieldName: "bfntMtcd",
	type: "data",
	styleName: "ud-column-center"
},
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
		text: "사용자명"
	},
	name: "userNm",
	fieldName: "userNm",
	type: "data",
	styleName: "ud-column-center"
},
{
	header: {
		text: "발송일시"
	},
	name: "bfntSndDt",
	fieldName: "bfntSndDt",
	styleName: "ud-column-center",
    datetimeFormat: "yyyy-MM-dd"
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
						action : "/portal/sys/usr/bfn/selectBfntHstList.do",
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

			$("#searchKeyword3").val("");
			$("#searchKeyword4").val("");
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
					<div class="search_wrap">
						<div class="item">
							<h4>고지구분</h4>
							<kcure:select id="searchKeyword4" name="searchKeyword4" grpCd="BFNT_CSCD" defaultText="전체"/>
						</div>
						<div class="item">
							<h4>사용자ID</h4>
							<input type="text" id="searchKeyword1" name="searchKeyword1" value="" placeholder="ID 입력" title="검색 키워드"/>
						</div>
						<div class="item">
							<h4>이름</h4>
							<input type="text" id="searchKeyword2" name="searchKeyword2" value="" placeholder="사용자명 입력" title="검색 키워드"/>
						</div>
						<div class="item">
							<h4>발송방법</h4>
							<kcure:select id="searchKeyword3" name="searchKeyword3" grpCd="BFNT_MTCD" defaultText="전체"/>
						</div>
						<div class="item">
							<h4>발송일자</h4>
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
				</div>
				<!-- //boardpage-infor -->
				<div class="grid_area_wrap" id="gridView"></div>
				<div id="grid_paging" class="page_num"></div>
			</div>
		</div>
		<!-- //subcon-wrap -->
	</div>
</div>