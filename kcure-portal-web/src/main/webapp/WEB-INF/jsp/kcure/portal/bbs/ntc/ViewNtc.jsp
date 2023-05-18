<%
/* =================================================================
* @FileName : ViewNtc.jsp
* @date: 2023. 3. 13.
* @author : hjjeon
* @설명 : 공지사항
* =================================================================
* 수정일 작성자 내용
* -----------------------------------------------------------------------
* 2023. 3. 13. hjjeon 파일생성
* =================================================================
*/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>
<style type="text/css">
.top-text{
  background: #ffebcd;
}
</style>
<script type="text/javascript">
var nttSeCodeCombo = RG.setGridComboBox({
    action:"/portal/sys/usr/stt/getGridCombo.do", // 호출할 url
    cdAndNm : {labels:"detlCdNm",values:"detlCd"}, // values와 labels에 입력할 json Name값들 및 values 값 속성
    params:{gbCd : "NTT_SE_CODE"}
});

var gridColumns = [
{
	header: {
		text: "제목"
	},
	name: "nttSj",
	fieldName: "nttSj",
	styleName: "ud-column-left",
	width: "400",
	renderer:{
		type:"html",
		callback: function(grid, cell, w, h) {
		    var str = cell.value;

		    var atchFileId = grid.getValue(cell.index.dataRow, 'atchFileId');
		    var registDt = new Date(grid.getValue(cell.index.dataRow, 'frstRegistPnttm'));
		    var now = new Date();

		    const diffMSec = now.getTime() - registDt.getTime();
		    const diffHour = diffMSec / (60 * 60 * 1000);

		    if(cell.value.length > 55 && (typeof atchFileId != "undefined" && atchFileId != "" || diffHour <24 )){
		    	str = cell.value.substring(0,55) + "...";
		    }

			if(typeof atchFileId != "undefined" && atchFileId != ""){
				str += " <img src='/images/hwp_icon.png'/> ";
			}

			if(diffHour < 24){
				str += " <img src='/images/new_icon.svg'/> ";
			}

		    return str;
		}
	}
},
{
	header: {
		text: "작성자"
	},
	name: "ntcrNm",
	fieldName: "ntcrNm",
	styleName: "ud-column-center"
},
{
	header: {
		text: "등록일"
	},
	name: "frstRegistDt",
	fieldName: "frstRegistDt",
	type: "datetime",
	styleName: "ud-column-center",
    datetimeFormat: "yyyy.MM.dd"
},
{
	header: {
		text: "ID"
	},
	name: "nttId",
	fieldName: "nttId",
	styleName: "ud-column-center",
	visible: false
},
{
	header: {
		text: "등록일2"
	},
	name: "frstRegistPnttm",
	fieldName: "frstRegistPnttm",
	styleName: "ud-column-center",
	visible: false
},
{
	header: {
		text: "첨부파일"
	},
	name: "atchFileId",
	fieldName: "atchFileId",
	styleName: "ud-column-center",
	visible: false
},
{
	header: {
		text: "TOP"
	},
	name: "topAt",
	fieldName: "topAt",
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
				$("input[name='nttId']").val(grid.getValue(clickData.dataRow,"nttId"));
		    	$("#srchForm").attr("action", "/portal/bbs/ntc/detailViewNtc.do").submit();
			}
		}

		gridView.setRowStyleCallback(function(grid, item, fixed) {
		    var ret = {};
		    var topAt = grid.getValue(item.index, "topAt");

		    if (topAt == 'Y') {
		      return 'top-text'
		    }
		 });

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

		searchDate = function() {
			RG.doQuery({
						action : "/portal/bbs/ntc/selectNtcList.do",
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

		$("#searchKeyword").keydown(function (event) {
			if (event.keyCode === 13) {
				event.preventDefault();
				$("#srchBtn").click();
			}
		});
	});
</script>
<div class="wrap">
	<div class="sub_visual_wrap">
		<div class="notice">
			<ul>
				<li>공지사항</li>
			</ul>
		</div>
	</div>
	<div class="notice_list_wrap">
		<div class="con">
			<div class="sub_pag_title">
				<p>공지사항</p>
				<span>K-CURE 이용자들에게 알려드리는 공지사항입니다.</span>
			</div>

			<form id="srchForm" name="srchForm" method="post">
				<input type="hidden" name="bbsId" value="${searchVO.bbsId}"/>
				<input type="hidden" name="nttId" value="0"/>
				<input type="hidden" name="pageIndex" value="${searchVO.pageIndex}"/>
				<div class="board_info">
					<p>전체 <span id="totalCnt"></span>건</p>
					<div class="search">
						<select class="user_sel" id="searchCondition" name="searchCondition">
							<option value="0">전체</option>
							<option value="1" ${searchVO.searchCondition eq '1' ? 'selected' : ''}>제목</option>
							<option value="2" ${searchVO.searchCondition eq '2' ? 'selected' : ''}>내용</option>
						</select>
						<input type="text" class="user_int" id="searchKeyword" name="searchKeyword" value="${searchVO.searchKeyword}" placeholder="검색어 입력" title="검색 키워드"/>
						<a href="javascript:void(0)" class="btn" id="srchBtn">검색</a>
					</div>
				</div>
			</form>
				<!-- //boardpage-infor -->
				<div class="grid_area_wrap" id="gridView"></div>
				<div id="grid_paging" class="page_num"></div>
		</div>
	</div>
</div>