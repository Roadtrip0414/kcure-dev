<%
/* =================================================================
* @FileName : ViewUsrAprvStatus
* @date: 2023. 1. 31.
* @author : hjjeon
* @설명 : 승인대기현황
* =================================================================
* 수정일 작성자 내용
* -----------------------------------------------------------------------
* 2023. 1. 31. hjjeon 파일생성
* 2023. 3. 31. shpark 화면 변경 이력조회 부분 제거 및 반력 프로세스 구현
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
	name: "prtiNm",
	fieldName: "prtiNm",
	styleName: "ud-column-center"
},
{
	header: {
		text: "상태"
	},
	name: "userStcdNm",
	fieldName: "userStcdNm",
	styleName: "ud-column-center"
},
{
	header: {
		text: "상태"
	},
	name: "userStcd",
	fieldName: "userStcd",
	styleName: "ud-column-center",
	visible: false
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
		text: "처리사유"
	},
	name: "hstView",
	fieldName: "hstView",
	styleName: "ud-column-center",
	renderer:{
	      type:"html",
	      callback: function(grid, cell, w, h) {
	    	  var userStcd = grid.getValue(cell.index.dataRow, 'userStcd');
	    	  var userId = grid.getValue(cell.index.dataRow, 'userId');
	          var str = '';
	          if(userStcd =='02'){
	        	  str = '<div class="btn"><a onclick="fnViewHstBtn(\''+userStcd+'\',\''+userId+'\');">사유보기</a></div>';
	          }
	          return str;
	      }
	}
},
];

var searchDate;
var gridDataProvider;
var gridView;

	$(document).ready(function() {
		//그리드
		gridDataProvider = new RealGrid.LocalDataProvider();
		gridView = new RealGrid.GridView('gridView');
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
						action : "/portal/sys/usr/apr/selectUsrAprList.do",
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
				//승인대기 상태 일때만 체크 가능
				gridView.setCheckableExpression("values['userStcd'] = '01'");
			}else{
				$("#lSection").hide();
				$("#grid_paging2").hide();
				$("#rSection").hide();
				gridDataProvider2.clearRows();
				gridDataProvider3.clearRows();
			}
			console.log("--------------------gridEndEvent---------------------");
		}

		/* 승인 버튼 클릭  */
		$("#aprvBtn").click(function() {
			$('#statChanRsnLayPop #saveBtn').show();
			var param = [];
			var items = gridView.getCheckedItems();
			if(items.length > 0){
				fnViewStatChanRsn("03");
			}else{
				alert("사용자를 선택해주세요.");
				return;
			}
		});

		/* 반려 버튼 클릭 function  */
		$("#rtnBtn").click(function() {
			$('#statChanRsnLayPop #saveBtn').show();
			var items = gridView.getCheckedItems();
			if(items.length > 0){
				fnViewStatChanRsn("02");
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

		$("#srchForm").keydown(function (event) {
			if (event.keyCode === 13) {
				event.preventDefault();
				$("#srchBtn").click();
			}
		});

		//승인 반려 처리 사유 저장
		$("#saveBtn").click(function(){
			var param = [];
			var userIdArr = $("#pUserId").val().split(",");
			$.each(userIdArr, function (index, value) {
				param.push(value);
			});

			$.ajax({
				url: "/portal/sys/usr/stt/updateUsr.do",
				dataType: "json",
				data: {"usrList" : param , "userStcd" : $("#pUserStcd").val() , "statChanRsnCont" : $("#statChanRsnCont").val()},
				type: "POST",
				async: false,
				success: function(response) {
					alert(GM.save_success);
					searchDate();
					$('#statChanRsnLayPop').removeClass('on');
				},
				complete: function(response) {
					$('#statChanRsnLayPop').removeClass('on');
				}
			});
		});
	});

	function fnViewStatChanRsn(userStcd){
		var param = [];
		var items = gridView.getCheckedItems();
		$.each(items, function (index, value) {
			param.push(gridView.getValue(value, "userId"));
    	});

		$("#pUserId").val(param);
		$("#pUserStcd").val(userStcd);
		//사유 작성창
		$('#statChanRsnLayPop #statChanRsnCont').val('');
		$('#statChanRsnLayPop #statChanRsnCont').attr("readonly",false);
		$('#statChanRsnLayPop').addClass('on');

	}



	//이력보기
	function fnViewHstBtn(userStcd,userId){
		//사유 보기
		$('#statChanRsnLayPop #statChanRsnCont').val('');
		$('#statChanRsnLayPop #statChanRsnCont').attr("readonly", true);
		$('#statChanRsnLayPop #saveBtn').hide();


		$.ajax({
			url: "/portal/sys/usr/stt/selectUserChanRsn.do",
			dataType: "json",
			data: {"userStcd" : userStcd , "userId" : userId},
			type: "POST",
			async: false,
			success: function(response) {
				$('#statChanRsnLayPop #statChanRsnCont').val(response.statChanRsnVo.statChanRsnCont);
				$('#statChanRsnLayPop').addClass('on');
			},
		});



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
					<input type="hidden" name="userStcd" value="01,02"/>	<!-- 승인대기, 반려 -->
					<input type="hidden" id="pUserId" />
					<input type="hidden" id="pUserStcd" />
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
							<h4>가입일자</h4>
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
						<a href="javascript:void(0)" id="aprvBtn">승인</a>
						<a href="javascript:void(0)" id="rtnBtn">반려</a>
					</div>
				</div>
				<!-- //boardpage-infor -->
				<div class="grid_area_wrap" id="gridView"></div>
				<div class="page_num" id="grid_paging"></div>
			</div>
		</div>
		<!-- //subcon-wrap -->
	</div>
</div>



<!-- class="on"시 이름 검색 팝업 -->
<div id="statChanRsnLayPop" class="kc_layer_popup">
	<div class="kc_popup_box person_sch">
		<a href="javascript:void(0)" class="btn kc_close"></a>
		<h1 class="title">처리사유</h1>
		<div class="popup_con">
			<div class="inst_deliber">
				<ul class="list">
					<li>
						<textarea id="statChanRsnCont" rows="5" cols="80" readonly="readonly"></textarea>
					</li>
				</ul>
			</div>
			<div class="l_btn">
				<a href="javascript:void(0)" class="bc_blue kc_close">닫기</a>
				<a href="javascript:void(0)" id="saveBtn" class="bc_blue">처리하기</a>
			</div>
		</div>

	</div>
</div>

