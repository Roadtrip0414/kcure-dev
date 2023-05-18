<%
/* =================================================================
 * @FileName : ViewSvcDttoAplc.jsp
 * @date: 2023.03.20
 * @author : parkgu
 * @설명 : 데이터반출관리 화면
 * =================================================================
 * 수정일         작성자             내용
 * -----------------------------------------------------------------------
 * 2023.03.20     parkgu           파일생성
 * =================================================================
 */
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>
<script type="text/javascript" src="/js/kcure/portal/sys/rsr/RsrSbjMemo.js"></script>
<script type="text/javascript">

var gridColumns = [
	{
		name: "dataAplcNo",
		fieldName: "dataAplcNo",
		visible: false,
	},
	{
		name: "dttoAplcId",
		fieldName: "dttoAplcId",
		visible: false,
	},
	{
		header: {
			text: "연구과제번호"
		},
		name: "rsrAsmtNo",
		fieldName: "rsrAsmtNo",
		type: "data",
		styleName: "ud-column-center",
		readOnly: true
	},
	{
		header: {
			text: "연구제목"
		},
		name: "rsrSbjNm",
		fieldName: "rsrSbjNm",
		type: "data",
		styleName: "ud-column-left",
		readOnly: true,
		renderer: {
		    type: "html",
		    inputFocusable: true,
		    callback: function (grid, cell, w, h) {
		    	var dataAplcNo = grid.getValue(cell.index.dataRow, 'dataAplcNo');
		     	return cell.value + " <a href='##' onclick='fnMemoPopup(`"+dataAplcNo+"`);' style='display:inline;color:blue;'>[메모]</a>";
			},
		},
	},
	{
		header: {
			text: "유형"
		},
		name: "dataTpcdNm",
		fieldName: "dataTpcdNm",
		type: "data",
		styleName: "ud-column-center",
		readOnly: true
	},
	{
		header: {
			text: "센터"
		},
		name: "prtiNm",
		fieldName: "prtiNm",
		type: "data",
		styleName: "ud-column-center",
		readOnly: true
	},
	{
		header: {
			text: "신청자"
		},
		name: "dttoAplcNm",
		fieldName: "dttoAplcNm",
		type: "data",
		styleName: "ud-column-center",
		readOnly: true
	},
	{
		header: {
			text: "신청일"
		},
		name: "dttoAplcDt",
		fieldName: "dttoAplcDt",
		type: "data",
		styleName: "ud-column-center",
		readOnly: true,
	},
	{
		name: "dttoAplcDt2",
		fieldName: "dttoAplcDt2",
		visible: false,
	},
	{
		header: {
			text: "상태"
		},
		name: "dttoAplcProgStnm",
		fieldName: "dttoAplcProgStnm",
		type: "data",
		styleName: "ud-column-center",
		readOnly: true
	},
	{
		header: {
			text: "심의"
		},
		name: "dttoAplcProgStcd",
		fieldName: "dttoAplcProgStcd",
		styleName: "ud-column-center",
		renderer: {
			type: "html",
			callback: function (grid, cell) {
				const dttoAplcProgStcd = grid.getValue(cell.index.itemIndex, "dttoAplcProgStcd");
				const dataAplcNo = grid.getValue(cell.index.itemIndex, "dataAplcNo");
				const dttoAplcDt = grid.getValue(cell.index.itemIndex, "dttoAplcDt2");
				const rsrAsmtNo = grid.getValue(cell.index.itemIndex, "rsrAsmtNo");

				const caption = dttoAplcProgStcd == "U01" ? "심의하기" : "결과보기";
				
				if(dttoAplcProgStcd == "U01"){
					return `<a onclick="gotoDetail('` + dataAplcNo + `', '` + rsrAsmtNo + `', '` + dttoAplcDt + `')">` + caption + `</a>`;
				}else{
					return `<a onclick="gotoResult('` + dataAplcNo + `', '` + rsrAsmtNo + `', '` + dttoAplcDt + `')">` + caption + `</a>`;
				}
			},
		}
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

	//그리드 컬럼 정보 세팅
	setFieldsNColumns(gridDataProvider, gridView, gridColumns);

	//초기 세팅(주의: 조회 함수 밑에 둬야 함)
	RG.initPattern({
		dataProviderPram : gridDataProvider,
		gridViewPram : gridView,
		gridCheckBoxFlag: false,
		form : "srchFrm",
		editable : false,
		footerBarFlag : false
	});

	//인디케이터 설정
	gridView.setRowIndicator({visible: true});

	//상태바 설정
	gridView.setStateBar({visible: false});

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
			action : "/portal/sys/rsr/dto/selectSvcDttoAplcList.do",
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
	const dttoAplcDtFrom = $("#dttoAplcDtFrom").val();
	const dttoAplcDtTo = $("#dttoAplcDtTo").val();
	if (dttoAplcDtFrom || dttoAplcDtTo) {
		if (!dttoAplcDtFrom || !dttoAplcDtTo) {
			return { valid: false, msg: "신청일은 시작일과 종료일을 모두 입력해야 합니다." };
		}
		if (dttoAplcDtFrom > dttoAplcDtTo) {
			return { valid: false, msg: "시작일이 종료일보다 빠릅니다." };
		}
	}

	return { valid: true, msg: "" };
}

function gotoResult(dataAplcNo, rsrAsmtNo, dttoAplcDt) {
	$("#detailFrm input[name='dataAplcNo']").val(dataAplcNo);
	$("#detailFrm input[name='rsrAsmtNo']").val(rsrAsmtNo);
	$("#detailFrm input[name='dttoAplcDt']").val(dttoAplcDt);
	$("#detailFrm").attr('action', '/portal/sys/rsr/dto/detailSvcDttoRsltAplc.do');
	$("#detailFrm").submit();
}

function gotoDetail(dataAplcNo, rsrAsmtNo, dttoAplcDt) {
	$("#detailFrm input[name='dataAplcNo']").val(dataAplcNo);
	$("#detailFrm input[name='rsrAsmtNo']").val(rsrAsmtNo);
	$("#detailFrm input[name='dttoAplcDt']").val(dttoAplcDt);
	$("#detailFrm").attr('action', '/portal/sys/rsr/dto/detailSvcDttoAplc.do');
	$("#detailFrm").submit();
}
</script>

<form id="detailFrm" name="detailFrm" method="post">
	<input type="hidden" name="dataAplcNo" />
	<input type="hidden" name="dttoAplcDt" />
	<input type="hidden" name="rsrAsmtNo" />
</form>

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
						<h4>검색대상</h4>
						<div class="sel_int">
							<select id="searchCondition" name="searchCondition">
								<option value="">선택</option>
								<option value="rsrSbjNm">연구제목</option>
								<option value="dttoAplcNm">신청자</option>
							</select>
							<input type="text" id="searchKeyword" name="searchKeyword" value="" placeholder="검색어 입력" />
						</div>
					</div>
					<div class="item">
						<h4>신청일</h4>
						<div class="date_wrap">
							<ul>
								<li><input type="date" id="dttoAplcDtFrom" name="dttoAplcDtFrom" value="" placeholder="시작일자" maxlength="10"></li>
								<li>~</li>
								<li><input type="date" id="dttoAplcDtTo" name="dttoAplcDtTo" value="" placeholder="종료일자" maxlength="10"></li>
							</ul>
						</div>
					</div>
					<div class="item">
						<h4>센터</h4>
						<div class="sel_int">
							<select id="prtiId" name="prtiId">
								<option value="">선택</option>
								<c:forEach items="${prtiList}" var="item">
									<option value="${item.detlCd}">${item.detlCdNm}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="item">
						<h4>승인여부</h4>
						<div class="sel_int">
							<select id="dttoAplcProgStcd" name="dttoAplcProgStcd">
								<option value="">선택</option>
								<c:forEach items="${dttoAplcProgStList}" var="item">
									<option value="${item.detlCd}">${item.detlCdNm}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
				</form>
				<div class="btn_info">
					<p>총건수<span id="currCnt"></span>/<span id="totalCnt"></span></p>
					<div class="s_btn">
<!-- 						<a href="javascript:void(0)" id="saveBtn">저장</a> -->
					</div>
				</div>

				<div class="grid_area_wrap" id="gridView" style="height: 55px;"></div>
				<div id="grid_paging" class="page_num"></div>
			</div>
		</div>
	</div>
</div>
