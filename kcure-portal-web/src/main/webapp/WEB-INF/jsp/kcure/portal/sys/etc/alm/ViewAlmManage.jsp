<%
/* =================================================================
* @FileName : 파일명
* @date: 2023. 3. 31.
* @author : hjjeon
* @설명 :
* =================================================================
* 수정일 작성자 내용
* -----------------------------------------------------------------------
* 2023. 3. 31. hjjeon 파일생성
* =================================================================
*/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>
<script type="text/javascript">
var ntceSpcdCombo = RG.setGridComboBox({
    action:"/portal/sys/usr/stt/getGridCombo.do", // 호출할 url
    cdAndNm : {labels:"detlCdNm",values:"detlCd"}, // values와 labels에 입력할 json Name값들 및 values 값 속성
    params:{gbCd : "NTCE_SPCD"}
});
var ntceDetlSpcdCombo = RG.setGridComboBox({
    action:"/portal/sys/usr/stt/getGridCombo.do", // 호출할 url
    cdAndNm : {labels:"detlCdNm",values:"detlCd"}, // values와 labels에 입력할 json Name값들 및 values 값 속성
    params:{gbCd : "NTCE_DETL_SPCD"}
});

var gridColumns = [
{
	header: {
		text: "구분"
	},
	name: "ntceSpcd",
	fieldName: "ntceSpcd",
	lookupDisplay: true,
	width: "50",
	values: ntceSpcdCombo.values,
    labels: ntceSpcdCombo.labels,
	styleName: "ud-column-center",
	editor: {
        type: "dropdown",
        domainOnly: true,
        textReadOnly: true
    }
},
{
	header: {
		text: "상세구분"
	},
	name: "ntceDetlSpcd",
	fieldName: "ntceDetlSpcd",
	lookupDisplay: true,
	width: "50",
	values: ntceDetlSpcdCombo.values,
    labels: ntceDetlSpcdCombo.labels,
	styleName: "ud-column-center",
	editor: {
        type: "dropdown",
        domainOnly: true,
        textReadOnly: true
    }
},
{
	header: {
		text: "알림 제목"
	},
	name: "ntceMsgTtlNm",
	fieldName: "ntceMsgTtlNm",
	type: "data",
	styleName: "ud-column-left",
},
{
	header: {
		text: "알림 내용"
	},
	name: "ntceMsgCont",
	fieldName: "ntceMsgCont",
	type: "data",
	styleName: "ud-column-left",
},
{
	header: {
		text: "메일 제목"
	},
	name: "emailMsgTtlNm",
	fieldName: "emailMsgTtlNm",
	type: "data",
	styleName: "ud-column-left",
},
{
	header: {
		text: "메일 내용"
	},
	name: "emailMsgCont",
	fieldName: "emailMsgCont",
	type: "data",
	styleName: "ud-column-left",
},
{
	header: {
		text: "관리"
	},
	name: "btn",
	fieldName: "btn",
	styleName: "ud-column-center",
	width: "50",
	renderer:{
	      type:"html",
	      callback: function(grid, cell, w, h) {
	    	  var ntceMsgNo = grid.getValue(cell.index.dataRow, 'ntceMsgNo');
	          var str = '<a onclick="fnDetail(\''+ntceMsgNo+'\');">수정</a>';
	          return str;
	      }
	}
},
{
	header: {
		text: "ntceMsgNo"
	},
	name: "ntceMsgNo",
	fieldName: "ntceMsgNo",
	type: "data",
	styleName: "ud-column-center",
	visible: false
},
];
	$(document).ready(function() {
		//그리드
		var gridDataProvider = new RealGrid.LocalDataProvider();
		var gridView = new RealGrid.GridView('gridView');
		gridView.setDataSource(gridDataProvider);
		/* 자동 컬럼 크기 조절  */
		gridView.displayOptions.fitStyle = "fill";
		gridView.displayOptions.syncGridHeight = "always";
		gridView.editOptions.commitLevel = "error";
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
		var searchDate = function() {
			RG.doQuery({
						action : "/portal/sys/etc/alm/selectNtceMsgList.do",
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
			$("#searchKeyword").val("");
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

	var fnDetail = function(obj){
		$("input[name='ntceMsgNo']").val(obj);
		$("#srchForm").attr("action", "/portal/sys/etc/alm/detailViewAlmManage.do").submit();
	}
</script>
<div class="wrap">
	<!-- con -->
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
				<form id="srchForm" name="srchForm" method="post">
					<input type="hidden" name="ntceMsgNo" />
					<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>">
					<div class="search_wrap">
						<div class="item">
							<h4>검색어</h4>
							<input type="text" name="searchKeyword" id="searchKeyword"  value="" placeholder="검색어 입력" title="검색 키워드"/>
						</div>
						<div class="item">
							<h4>구분</h4>
							<kcure:select id="searchKeyword1" name="searchKeyword1" grpCd="NTCE_SPCD" defaultText="전체"/>
						</div>
					</div>
				</form>
				<div class="btn_info">
					<!-- p테그는 남겨줘야 자동으로 버튼이 오른쪽 정렬 -->
					<p>총건수<span id="currCnt"></span>/<span id="totalCnt"></span></p>
				</div>

				<div class="grid_area_wrap" id="gridView"></div>
				<div id="grid_paging" class="page_num"></div>
			</div>
			<!-- //section -->
		</div>
	</div>
	<!-- //con -->
</div>