<%
/* =================================================================
 * @FileName : ViewDataAplcRvw.jsp
 * @date: 2023.03.14
 * @author : parkgu
 * @설명 : 데이터신청관리 화면
 * =================================================================
 * 수정일         작성자             내용
 * -----------------------------------------------------------------------
 * 2023.03.14     parkgu           파일생성
 * =================================================================
 */
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>
<script type="text/javascript">
//STODO : 퍼블 나오면 수정
$('body').addClass('admin');


var gridColumns = [
	{
		header: {
			text: "연구과제번호"
		},
		name: "dataAplcNo",
		fieldName: "dataAplcNo",
		type: "data",
		styleName: "ud-column-center",
	},
	{
		header: {
			text: "연구명"
		},
		name: "rsrSbjNm",
		fieldName: "rsrSbjNm",
		type: "data",
		styleName: "ud-column-center",
		renderer: {
			type: "html",
			callback: function (grid, cell) {
				const rsrSbjNm = grid.getValue(cell.index.itemIndex, "rsrSbjNm");
				const str = `<a href="javascript:void(0)">` + rsrSbjNm + `</a>`;
				return str;
			},
		}
	},
	
	{
		header: {
			text: "기관"
		},
		name: "prtiNm",
		fieldName: "prtiNm",
		type: "data",
		styleName: "ud-column-center",
		renderer: {
			type: "html",
			callback: function (grid, cell) {
				const prtiNmes = grid.getValue(cell.index.itemIndex, "prtiNm");
				const prtiNm = prtiNmes.split(',');
				var str = '';
				prtiNm.forEach(function(nm) {
					if(str != '' ){
						str = str + ' <br/>';	
					}
					str = str + nm;
				});
				return str;
			},
		}
	},
	
	{
		header: {
			text: "유형"
		},
		name: "dataTpnm",
		fieldName: "dataTpnm",
		type: "data",
	},
	{
		header: {
			text: "신청자"
		},
		name: "dataAplpNm",
		fieldName: "dataAplpNm",
		type: "data",
		styleName: "ud-column-center",
	},
	{
		header: {
			text: "신청일"
		},
		name: "dataAplcYmd",
		fieldName: "dataAplcYmd",
		type: "data",
		styleName: "ud-column-center",
	},
	{
		header: {
			text: "진행상태"
		},
		name: "rvwStpSpnm",
		fieldName: "rvwStpSpnm",
		styleName: "ud-column-center",
		renderer: {
			type: "html",
			callback: function (grid, cell) {
				
				const rvwStpSpcd = grid.getValue(cell.index.itemIndex, "rvwStpSpcd");
				const rvwStpStcd = grid.getValue(cell.index.itemIndex, "rvwStpStcd");
				const rvwStpSpnm = grid.getValue(cell.index.itemIndex, "rvwStpSpnm");
				const dataUriAddr = grid.getValue(cell.index.itemIndex, "dataUriAddr");
				const dataAplcNo = grid.getValue(cell.index.itemIndex, "dataAplcNo");
				
				const colors = new Map([
					["R01", "bc_blue"],
					["R03", "bc_red"],
					["R08", "bc_green"],
					["R09", "bc_red"],
					["R10", "bc_green"],
				]);
				
				const className = colors.get(rvwStpSpcd);
				let str ='';
				//반려 , 보완요청
				if(rvwStpStcd == 'RP03' || rvwStpStcd == 'RP04'){
					str = `<div class="tb_btn_wrap" >
						<a href="javascript:void(0)"  class="f_red">` + rvwStpSpnm + `</a>
						</div>`;	
				}else{
					str = `
						<div class="tb_btn_wrap">
							<a href="javascript:void(0)"   class="` + className + `">` + rvwStpSpnm + `</a>
						</div>
						`;
				}
				
				
				return str;
			},
		}
	},
	{
		header: {
			text: "진행상태코드"
		},
		name: "rvwStpStcd",
		fieldName: "rvwStpStcd",
		type: "data",
		visible: false
	},
	{
		header: {
			text: "rvwStpSpcd"
		},
		name: "rvwStpSpcd",
		fieldName: "rvwStpSpcd",
		type: "data",
		visible: false
	},
	{
		header: {
			text: "dataUriAddr"
		},
		name: "dataUriAddr",
		fieldName: "dataUriAddr",
		type: "data",
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
	gridView.displayOptions.rowHeight = -1;

	//그리드 컬럼 정보 세팅
	setFieldsNColumns(gridDataProvider, gridView, gridColumns);

	//초기 세팅(주의: 조회 함수 밑에 둬야 함)
	RG.initPattern({
		dataProviderPram : gridDataProvider,
		gridViewPram : gridView,
		gridCheckBoxFlag: false,
		//form : "srchFrm",
		editable : false,
		footerBarFlag : false
	});

	//인디케이터 설정
	gridView.setRowIndicator({visible: true});
	//상태바 설정
	gridView.setStateBar({visible: false});
	//체크바 설정
	gridView.setCheckBar({visible: false});
	
	
	 gridView.onCellClicked = function (grid, clickData) {
	        if (clickData.cellType !== "data") {
	            return;
	        }
	        var cellId = clickData.column;
	        var itemIndex = clickData.itemIndex;
	        var objRow = gridView.getValues(itemIndex);
	        if (cellId == "rsrSbjNm" || cellId == "rvwStpSpnm" ) {
	        	//반려일 경우
	        	if(objRow.rvwStpStcd == 'RP03'|| objRow.rvwStpStcd == 'RP04'){
	        		$('#rtnViewTitle').html('반려사유 보기');
	        		if(objRow.rvwStpStcd == 'RP04'){
	        			$('#rtnRgstTitle').html('보완요청사유 보기');	
	        		}
	        		
	        		fnViewRtnRsn(objRow.dataAplcNo,objRow.rvwStpSpcd);
	        	//보완요청
	        	//}else if(objRow.rvwStpStcd == 'RP04'){
	        		//alert('보완요청중입니다.');
	        	}else{
	        		//해당 화면으로 이동 필요.
		        	$('#movePageForm #dataAplcNo').val(objRow.dataAplcNo);
		        	$('#movePageForm #rvwStpSpcd').val(objRow.rvwStpSpcd);
		        	//document.
		        	$("#movePageForm").attr("action", "/portal/sys/dac/rvw/movePage.do").submit();
	        	}
	        	
	        }
	    }
	 

	// [Btn] 조회 Clik.
	$("#btnSearch").click(function() {
		const { valid, msg } = validForSearch();
		if (!valid) {
			alert(msg);
			return;
		}

		$("input[type=hidden][name=pageIndex]").val("1");
		searchList();

		return false;
	});

	/* 초기화 */
	$("#initBtn").click(function(){
		$("#srchFrm").find("input,select").val("")
		$("#btnSearch").click();
	});

	$("#srchFrm").keydown(function (event) {
		if (event.keyCode === 13) {
			event.preventDefault();
			$("#btnSearch").click();
		}
	});

	/* 조회 버튼 클릭 S */
	var searchList = function() {
		RG.doQuery({
			action : "/portal/sys/dac/rvw/selectDataAplcRvwList.do",
			form : "srchFrm",
			dataProviderPram : gridDataProvider,
			gridViewPram : gridView,
			pagingId:"grid_paging",
			totalId: "totalCnt",
			currCntId: "currCnt",
			endEvent: srchEndEvent
		});
	}

	var srchEndEvent = function(endEventParam, response) {
		console.log("--------------------srchEndEvent---------------------");
		console.log(endEventParam);
		console.log(response);

		if (gridDataProvider.getRowCount() < 1) {
			alert("조회 결과가 없습니다.");
		}

		console.log("--------------------srchEndEvent---------------------");
	}

	searchList();
});

function validForSearch() {
	const dataAplcYmdFrom = $("#dataAplcYmdFrom").val();
	const dataAplcYmdTo = $("#dataAplcYmdTo").val();
	if (dataAplcYmdFrom || dataAplcYmdTo) {
		if (!dataAplcYmdFrom || !dataAplcYmdTo) {
			return { valid: false, msg: "신청일은 시작일과 종료일을 모두 입력해야 합니다." };
		}
		if (dataAplcYmdFrom > dataAplcYmdTo) {
			return { valid: false, msg: "시작일이 종료일보다 빠릅니다." };
		}
	}

	return { valid: true, msg: "" };
}




function fnViewRtnRsn(dataAplcNo,rvwStpSpcd){
	$.ajax({
		type:"POST",
		url:"/portal/sys/dac/rvw/selectRjcRsnContView.do",
		data:{	
					"dataAplcNo"	: dataAplcNo, 
					"rvwStpSpcd"	: rvwStpSpcd
				 },
		dataType:'json',
		success:function(returnData){
			
		let resultData = returnData.data;
		let resultCode = returnData.resultCode;
		console.log(resultData);
		if(resultCode == "Y"){
			let cont = ''
			if(resultData && resultData.rjcRsnCont){
				cont = resultData.rjcRsnCont;
			}
			$("#rjcViewRsnCont").val(cont);
			$("#rtnViewLayerPop").addClass('on');
		}
      }	
	});
	/*
	 $("#rtnRgstLayerPop").removeClass('on');
		$("#rtnViewLayerPop").addClass('on');
		*/
}


/*
function movUseForm(rvwUrl,dataAplcNo){
	$("#dataAplcNo").val(dataAplcNo);
	$("#listFrm").attr("action", rvwUrl  "/portal/myp/rsc/inf/viewMypRscInfUseForm.do").submit();
}
*/
</script>



<div class="wrap">
		<div class="con">
			<div class="area_wrap">
				<div class="section">
					<div class="btn_info">
						<!-- p테그는 남겨줘야 자동으로 버튼이 오른쪽 정렬 -->
						<p></p>
						<div class="s_btn">
							<a href="javascript:void(0)" id="btnSearch">조회</a>
						<a href="javascript:void(0)" id="initBtn">초기화</a>
						</div>
					</div>
					<form id="srchFrm" name="srchFrm" method="post" action="#">
					<div class="search_wrap">
						<div class="item">
							<h4>신청일</h4>
							<div class="date_wrap">
								<ul>
									<li><input type="date" id="dataAplcYmdFrom" name="dataAplcYmdFrom" value="" placeholder="시작일자" maxlength="10"></li>
									<li>~</li>
									<li><input type="date" id="dataAplcYmdTo" name="dataAplcYmdTo" value="" placeholder="종료일자" maxlength="10"></li>
								</ul>
							</div>
						</div>
						<div class="item">
							<h4>검색대상</h4>
							<div class="sel_int">
								<select id="searchCondition" name="searchCondition">
									<option value="">선택</option>
									<option value="dataAplpNm">신청자</option>
									<option value="rsrSbjNm">연구명</option>
									<option value="dataAplcNo">연구과제번호</option>
								</select>
								<input type="text" id="searchKeyword" name="searchKeyword" value="" placeholder="검색어 입력" />
							</div>
						</div>
						<div class="item">
							<h4>진행상태</h4>
							<%-- <select id="rvwStpSpcd" name="rvwStpSpcd">
								<option value="">전체</option>
								<c:forEach items="${rvwStpSpcdList}" var="item" varStatus="idx">
									<option value="${item.detlCd}">${item.detlCdNm}</option>
								</c:forEach>
							</select> --%>
							<kcure:select id="rvwStpSpcd" name="rvwStpSpcd" grpCd="RVW_STP_SPCD" defaultText="전체" />
						</div>
					</div>
					</form>
					<div class="btn_info">
					<p>총건수<span id="currCnt"></span>/<span id="totalCnt"></span></p>
					<!-- 
					<div class="s_btn">
						<a href="javascript:void(0)" id="saveBtn">저장</a>
					</div> -->
				</div>

				<div class="grid_area_wrap" id="gridView" style="height: 55px;"></div>
				<div id="grid_paging" class="page_num"></div>
				</div>
			</div>
		</div>
	</div>
	
	<form id="movePageForm" name="movePageForm" method="post" style="display:none; ">
		<input type="hidden" name="dataAplcNo" id="dataAplcNo">
		<input type="hidden" name="rvwStpSpcd" id="rvwStpSpcd">
	</form>

	
<!-- class="on"시 반려사유 팝업 -->
<div id="rtnViewLayerPop" class="ad_layer_popup">
	<div class="ad_popup_box">
		<a href="javascript:void(0)" class="kc_close btn"></a>
		<div class="title">
			<p id="rtnRgstTitle" >반려사유를 작성해 주세요</p>
		</div>
		<div class="popup_con">
			<div class="n_reject_wrap">
				<textarea rows="10" id="rjcViewRsnCont" readonly="readonly"></textarea>
				<div class="ad_pop_btn">
					<a href="javascript:void(0)" class="bc_blue kc_close">확인</a>
				</div>
			</div>
		</div>
	</div>
</div>