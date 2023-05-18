<%
/* =================================================================
* @FileName : ViewUsrDrmtStatus.jsp
* @date: 2023. 2. 1.
* @author : hjjeon
* @설명 : 휴면계정현황
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
		text: "사용자명"
	},
	name: "userNm",
	fieldName: "userNm",
	type: "data",
	styleName: "ud-column-center"
},
{
	header: {
		text: "가입경로"
	},
	name: "userEntMedmCd",
	fieldName: "userEntMedmCd",
	type: "data",
	styleName: "ud-column-center"
},
{
	header: {
		text: "휴대폰번호"
	},
	name: "userMbphNo",
	fieldName: "userMbphNo",
	styleName: "ud-column-center"
},
// {
// 	header: {
// 		text: "Email"
// 	},
// 	name: "userEmailAddr",
// 	fieldName: "userEmailAddr",
// 	styleName: "ud-column-center"
// },
{
	header: {
		text: "기관유형"
	},
	name: "instTpcdNm",
	fieldName: "instTpcdNm",
	styleName: "ud-column-center"
},
{
	header: {
		text: "참여기관"
	},
	name: "prtiKnm",
	fieldName: "prtiKnm",
	styleName: "ud-column-center"
},
{
	header: {
		text: "가입일시"
	},
	name: "userEntDt",
	fieldName: "userEntDt",
	styleName: "ud-column-center",
    datetimeFormat: "yyyy-MM-dd"
},
{
	header: {
		text: "휴면계정전환일시"
	},
	name: "drmtStatChanDt",
	fieldName: "drmtStatChanDt",
	styleName: "ud-column-center",
    datetimeFormat: "yyyy-MM-dd"
},
{
	header: {
		text: "이력조회"
	},
	name: "hstView",
	fieldName: "hstView",
	styleName: "ud-column-center",
	renderer:{
	      type:"html",
	      callback: function(grid, cell, w, h) {
	    	  var userId = grid.getValue(cell.index.dataRow, 'userId');
	          var str = '<div class="btn"><a onclick="fnViewHstBtn(\''+userId+'\');">이력</a></div>';
	          return str;
	      }
	}
},
];

var gridColumns2 = [
	{
		header: {
			text: "구분"
		},
		name: "afchgStcd",
		fieldName: "afchgStcd",
		type: "data",
		styleName: "ud-column-center"
	},
	{
		header: {
			text: "사유"
		},
		name: "statChanRsnCont",
		fieldName: "statChanRsnCont",
		type: "data",
		styleName: "ud-column-center"
	},
	{
		header: {
			text: "처리자ID"
		},
		name: "frstRegpId",
		fieldName: "frstRegpId",
		type: "data",
		styleName: "ud-column-center"
	},
	{
		header: {
			text: "처리일시"
		},
		name: "userStatHstDt",
		fieldName: "userStatHstDt",
		styleName: "ud-column-center",
		datetimeFormat: "yyyy-MM-dd"
	},
];

var gridColumns3 = [
	{
		header: {
			text: "권한"
		},
		name: "authNm",
		fieldName: "authNm",
		type: "data",
		styleName: "ud-column-center",
	}
];
var searchDate;
var searchDate2;
var searchDate3;

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
			gridCheckBoxFlag: true,
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
						action : "/portal/sys/usr/drm/selectUsrDrmList.do",
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
			if(endEventParam.length > 0){
				searchDate2(endEventParam[0].userId);
				searchDate3(endEventParam[0].userId);
			}else{
				$("#lSection").hide();
				$("#grid_paging2").hide();
				$("#rSection").hide();
				gridDataProvider2.clearRows();
				gridDataProvider3.clearRows();
			}
			console.log("--------------------gridEndEvent---------------------");
		}

		/* 휴면계정 복구 버튼 클릭  */
		$("#aprvBtn").click(function() {
			var param = [];
			var items = gridView.getCheckedItems();
			if(items.length > 0){
	 			$.each(items, function (index, value) {
					param.push(gridView.getValue(value, "userId"));
		    	});

				$("#pUserId").val(param);
				$("#pUserStcd").val("03");

				//처리 사유 팝업
				window.open("<c:url value='/portal/sys/usr/stt/statChanRsnContPopup.do'/>","처리사유","height=630, width=585, top=50, left=20, scrollbars=yes, resizable=no");
			}else{
				alert("사용자를 선택해주세요.");
				return;
			}
		});

		/* 탈퇴 버튼 클릭 function  */
		$("#wtdrBtn").click(function() {
			var param = [];
			var items = gridView.getCheckedItems();
			if(items.length > 0){
	 			$.each(items, function (index, value) {
					param.push(gridView.getValue(value, "userId"));
		    	});

				$("#pUserId").val(param);
				$("#pUserStcd").val("99");

				//처리 사유 팝업
				window.open("<c:url value='/portal/sys/usr/stt/statChanRsnContPopup.do'/>","처리사유","height=630, width=585, top=50, left=20, scrollbars=yes, resizable=no");
			}else{
				alert("사용자를 선택해주세요.");
				return;
			}
		});

		/* 조회 */
		searchDate();

		/* 초기화 */
		$("#initBtn").click(function(){
			var getInput = $("#srchForm input[type=text],input[type=date]");
			$.each(getInput, function (index, value) {
				$(value).val("");
		    });
			//select값 초기화
			$("#searchKeyword").val("");
			$("#searchKeyword3").val("");
			$("#searchKeyword4").val("");
			searchDate();
		});

		/***사용자 이력목록 Grid start********************************************************************************/
		//그리드
		var gridDataProvider2 = new RealGrid.LocalDataProvider();
		var gridView2 = new RealGrid.GridView('gridView2');
		gridView2.setDataSource(gridDataProvider2);
		/* 자동 컬럼 크기 조절  */
		gridView2.displayOptions.fitStyle = "fill";
		gridView2.displayOptions.syncGridHeight = "always";
		//그리드 컬럼 정보 세팅
		setFieldsNColumns(gridDataProvider2, gridView2, gridColumns2);

		//초기 세팅(주의: 조회 함수 밑에 둬야 함)
		RG.initPattern({
			dataProviderPram : gridDataProvider2,
			gridViewPram : gridView2,
			gridCheckBoxFlag: false,
			editable:false,
			footerBarFlag : false
		});

		searchDate2 = function(userId) {
			RG.doQuery({
						action : "/portal/sys/usr/stt/selectUsrHstList.do",
						params : {"userId":userId},
						dataProviderPram : gridDataProvider2,
						gridViewPram : gridView2,
						endEvent: gridEndEvent2,
						pagingId:"grid_paging2"
					});
		}

		/* 조회 완료시 실행된 스크립트 정리   */
		var gridEndEvent2 = function(endEventParam, response) {
			console.log("--------------------gridEndEvent2---------------------");
			console.log(endEventParam);
			console.log(response);
			if(endEventParam.length > 0){
				$("#lSection").show();
				$("#grid_paging2").show();
			}else{
				$("#lSection").hide();
				$("#grid_paging2").hide();
			}
			console.log("--------------------gridEndEvent2---------------------");
		}
		/***사용자 이력목록 Grid end********************************************************************************/

		/***사용자 권한목록 Grid start********************************************************************************/
		//그리드
		var gridDataProvider3 = new RealGrid.LocalDataProvider();
		var gridView3 = new RealGrid.GridView('gridView3');
		gridView3.setDataSource(gridDataProvider3);
		/* 자동 컬럼 크기 조절  */
		gridView3.displayOptions.fitStyle = "fill";
		gridView3.displayOptions.syncGridHeight = "always";
		//그리드 컬럼 정보 세팅
		setFieldsNColumns(gridDataProvider3, gridView3, gridColumns3);

		//초기 세팅(주의: 조회 함수 밑에 둬야 함)
		RG.initPattern({
			dataProviderPram : gridDataProvider3,
			gridViewPram : gridView3,
			gridCheckBoxFlag: false,
			editable:false,
			footerBarFlag : false
		});

		searchDate3 = function(userId) {
			RG.doQuery({
						action : "/portal/sys/usr/stt/selectUsrAuthList.do",
						params : {"userId":userId},
						dataProviderPram : gridDataProvider3,
						gridViewPram : gridView3,
						endEvent: gridEndEvent3
					});
		}

		/* 조회 완료시 실행된 스크립트 정리   */
		var gridEndEvent3 = function(endEventParam, response) {
			console.log("--------------------gridEndEvent3---------------------");
			console.log(endEventParam);
			console.log(response);
			if(endEventParam.length > 0){
				$("#rSection").show();
			}else{
				$("#rSection").hide();
			}
			console.log("--------------------gridEndEvent3---------------------");
		}
		/***사용자 권한목록 Grid end********************************************************************************/

		$("#srchForm").keydown(function (event) {
			if (event.keyCode === 13) {
				event.preventDefault();
				$("#srchBtn").click();
			}
		});
	});

	//이력보기
	function fnViewHstBtn(userId){
		searchDate2(userId);
		searchDate3(userId);
	}


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
					<input type="hidden" name="userStcd" value="04"/>	<!-- 휴면 -->
					<input type="hidden" id="pUserId" />	<!-- 팝업용 사용자id -->
					<input type="hidden" id="pUserStcd" />	<!-- 팝업용 사용자상태값 -->
					<div class="search_wrap">
						<div class="item">
							<h4>권한</h4>
							<select name="searchKeyword" id="searchKeyword" title="검색 범위">
								<option value="">전체</option>
								<c:forEach items="${allAuthList}" var="list">
									<option value="${list.authId}">${list.authNm}</option>
								</c:forEach>
							</select>
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
							<h4>기관유형</h4>
							<kcure:select id="searchKeyword3" name="searchKeyword3" grpCd="INST_TPCD" defaultText="전체"/>
						</div>
						<div class="item">
							<h4>참여기관</h4>
							<select name="searchKeyword4" id="searchKeyword4" title="검색 범위">
								<option value="">전체</option>
								<c:forEach items="${prtiList}" var="list">
									<option value="${list.detlCd}">${list.detlCdNm}</option>
								</c:forEach>
							</select>
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
					<div class="s_btn">
						<a href="javascript:void(0)" id="aprvBtn">휴면계정복구</a>
						<a href="javascript:void(0)" id="wtdrBtn">탈퇴처리</a>
					</div>
				</div>
				<!-- //boardpage-infor -->
				<div class="grid_area_wrap" id="gridView"></div>
				<div id="grid_paging" class="page_num"></div>

				<div class="section type_01">
					<div class="column">
						<div class="left">
							<h1 class="title" id="lSection" style="display: none;">사용자 이력조회</h1>
							<div class="grid_area_wrap" id="gridView2"></div>
							<div id="grid_paging2" class="page_num"></div>
						</div>
						<div class="rigth">
							<h1 class="title" id="rSection" style="display: none;">사용자 권한조회</h1>
							<div class="grid_area_wrap" id="gridView3"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- //subcon-wrap -->
	</div>
</div>