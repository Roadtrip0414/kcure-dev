<%
/* =================================================================
* @FileName : ViewDataUtlc.jsp
* @date: 2023. 2. 7.
* @author : hjjeon
* @설명 : 데이터 활용사례
* =================================================================
* 수정일 작성자 내용
* -----------------------------------------------------------------------
* 2023. 2. 7. hjjeon 파일생성
* =================================================================
*/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>
<script type="text/javascript">
var gridColumns = [
{
	header: {
		text: "진행연도"
	},
	name: "rsrProgYr",
	fieldName: "rsrProgYr",
	type: "data",
	styleName: "ud-column-center",
	width: "50"
},
{
	header: {
		text: "연구제목"
	},
	name: "rsrSbjNm",
	fieldName: "rsrSbjNm",
	type: "data",
	styleName: "ud-column-left",
	width: "200",
    renderer : {
        showTooltip : true
    }
},
{
	header: {
		text: "게시"
	},
	name: "viewYn",
	fieldName: "viewYn",
	type: "data",
	styleName: "ud-column-center",
	width: "50"
},
{
	header: {
		text: "연구구분"
	},
	name: "rsrSpcdNm",
	fieldName: "rsrSpcdNm",
	type: "data",
	styleName: "ud-column-center"
},
{
	header: {
		text: "등록일"
	},
	name: "frstRgstDt",
	fieldName: "frstRgstDt",
	styleName: "ud-column-center",
    datetimeFormat: "yyyy-MM-dd"
},
{
	header: {
		text: "연구방법"
	},
	name: "rsrMtcdNm",
	fieldName: "rsrMtcdNm",
	type: "data",
	styleName: "ud-column-center"
},
{
	header: {
		text: "연구수행기관"
	},
	name: "rsrInstNm",
	fieldName: "rsrInstNm",
	type: "data",
	styleName: "ud-column-center",
    renderer : {
        showTooltip : true
    }
},
{
	header: {
		text: "작성자명"
	},
	name: "userNm",
	fieldName: "userNm",
	type: "data",
	styleName: "ud-column-center"
},
{
	header: {
		text: "다운로드수"
	},
	name: "fileCnt",
	fieldName: "fileCnt",
	type: "data",
	styleName: "ud-column-center"
},
{
	header: {
		text: "SEQ"
	},
	name: "utlcRgstSeq",
	fieldName: "utlcRgstSeq",
	type: "data",
	styleName: "ud-column-center",
	visible: false
}
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

		gridView.onCellClicked = function (grid, clickData) {
			if(clickData.cellType != "header"){
				$("#srchForm input[name='pageIndex']").val($("#grid_paging input[name='pageIndex']").val());
				$("input[name='utlcRgstSeq']").val(grid.getValue(clickData.dataRow,"utlcRgstSeq"));
		    	$("#srchForm").attr("action", "/portal/sys/bbs/dur/detailViewDataUtlc.do").submit();
			}
		}

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
			if($("#searchCondition").val() != "" && $("#searchCondition").val() != null){
				if($("#searchKeyword1").val() != "" && $("#searchKeyword1").val() != null){
					searchDate();
				}else{
					alert("검색어를 입력해주세요.");
					return false;
				}
			}else{
				searchDate();
			}
		});

		searchDate = function() {
			RG.doQuery({
						action : "/portal/sys/bbs/dur/selectDataUtlcList.do",
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

		/* 등록 버튼 클릭  */
		$("#registBtn").click(function() {
			$("#srchForm").attr("action", "/portal/sys/bbs/dur/insertDataUtlc.do").submit();
		});

		/* 조회 */
		searchDate();

		/* 초기화 */
		$("#initBtn").click(function(){
			var getInput = $("#srchForm input[type=text],input[type=date]");
			$.each(getInput, function (index, value) {
				$(value).val("");
		    });
			$("#searchCondition").val("");
			$("#searchKeyword").val("");
			$("#searchKeyword1").val("");
			$("#searchKeyword2").val("");
			$("#searchKeyword3").val("");

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
		<div class="section">
			<div class="btn_info">
				<!-- p테그는 남겨줘야 자동으로 버튼이 오른쪽 정렬 -->
				<p></p>
				<div class="s_btn">
					<a href="javascript:void(0)" id="srchBtn">검색</a>
					<a href="javascript:void(0)" id="initBtn">초기화</a>
				</div>
			</div>
			<form id="srchForm" name="srchForm" method="post">
				<input type="hidden" name="utlcRgstSeq" value="0"/>
				<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>">

				<div class="search_wrap">
					<div class="item">
						<h4>검색대상</h4>
						<div class="sel_int">
							<select id="searchCondition" name="searchCondition">
								<option value="">선택</option>
								<option value="1">제목</option>
<!-- 								<option value="2">제목 + 내용</option> -->
<!-- 								<option value="3">내용</option> -->
							</select>
							<input type="text" id="searchKeyword1" name="searchKeyword1" value="" placeholder="검색어 입력" title="검색 키워드"/>
						</div>
					</div>
					<div class="item">
						<h4>등록일</h4>
						<div class="date_wrap">
							<ul>
								<li><input type="date" id="searchKeywordFrom" name="searchKeywordFrom" value="" placeholder="시작일자" title="검색 키워드" maxlength="10"/></li>
								<li>~</li>
								<li><input type="date" id="searchKeywordTo" name="searchKeywordTo" value="" placeholder="종료일자" title="검색 키워드" maxlength="10"/></li>
							</ul>
						</div>
					</div>
					<div class="item">
						<h4>연구구분</h4>
						<kcure:select id="searchKeyword" name="searchKeyword" grpCd="RSR_SPCD" defaultText="선택"/>
					</div>
					<div class="item">
						<h4>연구수행기관</h4>
						<select name="searchKeyword2" id="searchKeyword2" title="검색 범위">
							<option value="">선택</option>
							<c:forEach items="${rsrInstcdList}" var="list">
								<option value="${list.detlCd}">${list.detlCdNm}</option>
							</c:forEach>
						</select>
					</div>
					<div class="item">
						<h4>연구방법</h4>
						<kcure:select id="searchKeyword3" name="searchKeyword3" grpCd="RSR_MTCD" defaultText="선택"/>
					</div>
				</div>
			</form>
			<!-- //boardtop-search -->
			<div class="btn_info">
				<p>총건수<span id="currCnt"></span>/<span id="totalCnt"></span></p>
				<div class="s_btn">
					<a href="javascript:void(0)" id="registBtn">등록</a>
				</div>
			</div>
			<!-- //boardpage-infor -->
			<div class="grid_area_wrap" id="gridView"></div>
			<div id="grid_paging" class="page_num"></div>
		</div>
	</div>
</div>