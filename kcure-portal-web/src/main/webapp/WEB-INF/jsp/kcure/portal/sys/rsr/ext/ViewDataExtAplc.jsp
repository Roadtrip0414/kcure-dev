<%
/* =================================================================
 * @FileName : ViewDataExtAplc.jsp
 * @date: 2023.05.10
 * @author : pgj
 * @설명 : 데이터 연장 및 보관
 * =================================================================
 * 수정일         작성자             내용
 * -----------------------------------------------------------------------
 * 2023.05.10     pgj           파일생성
 * =================================================================
 */
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>
<script type="text/javascript">

var dataTpcdCombo = RG.setGridComboBox({ // 유형
    action:"/portal/sys/usr/stt/getGridCombo.do", // 호출할 url
    cdAndNm : {labels:"detlCdNm",values:"detlCd"}, // values와 labels에 입력할 json Name값들 및 values 값 속성
    params:{gbCd : "DATA_TPCD"}
});

var extdStcdCombo = RG.setGridComboBox({ // 구분
    action:"/portal/sys/usr/stt/getGridCombo.do", // 호출할 url
    cdAndNm : {labels:"detlCdNm",values:"detlCd"}, // values와 labels에 입력할 json Name값들 및 values 값 속성
    params:{gbCd : "EXTD_STCD"}
});

var gridColumns = [
	{
		name: "dataAplcNo",
		fieldName: "dataAplcNo",
		visible: false,
	},
	{
		name: "extdAplcNo",
		fieldName: "extdAplcNo",
		visible: false,
	},
	{
		name: "extdProgStcd",
		fieldName: "extdProgStcd",
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
			text: "연구명"
		},
		name: "rsrSbjNm",
		fieldName: "rsrSbjNm",
		type: "data",
		styleName: "ud-column-center",
		readOnly: true
	},
	{
		header: {
			text: "연구책임자"
		},
		name: "userNm",
		fieldName: "userNm",
		type: "data",
		styleName: "ud-column-center",
		readOnly: true
	},
	{
		header: {
			text: "유형"
		},
		name: "dataTpcd",
		fieldName: "dataTpcd",
		lookupDisplay: true,
	    values: dataTpcdCombo.values,
	    labels: dataTpcdCombo.labels
	},
	{
		header: {
			text: "구분"
		},
		name: "extdStcd",
		fieldName: "extdStcd",
		lookupDisplay: true,
	    values: extdStcdCombo.values,
	    labels: extdStcdCombo.labels
	},
	{
		header: {
			text: "연구기간"
		},
		name: "bfrRsrDt",
		fieldName: "bfrRsrDt",
		type: "data",
		styleName: "ud-column-center",
		width: "150",
		readOnly: true
	},
	{
		header: {
			text: "가상화 사용기간"
		},
		name: "bfrDtuDt",
		fieldName: "bfrDtuDt",
		type: "data",
		styleName: "ud-column-center",
		width: "150",
		readOnly: true
	},
	{
		header: {
			text: "보관기간"
		},
		name: "bfrDataKepDt",
		fieldName: "bfrDataKepDt",
		type: "data",
		styleName: "ud-column-center",
		width: "150",
		readOnly: true
	},
	{
		header: {
			text: "신청일"
		},
		name: "extdAplcYmd",
		fieldName: "extdAplcYmd",
		type: "data",
		styleName: "ud-column-center",
		readOnly: true,
	},
	{
		header: {
			text: "연장/보관날짜"
		},
		name: "aplcDt",
		fieldName: "aplcDt",
		type: "data",
		styleName: "ud-column-center",
		width: "150",
		readOnly: true,
	},
	{
		header: {
			text: "보관횟수"
		},
		name: "dataKepExtdNt",
		fieldName: "dataKepExtdNt",
		type: "data",
		styleName: "ud-column-center",
		readOnly: true,
	},
	{
		header: {
			text: "진행상태"
		},
		name: "extdProgStNm",
		fieldName: "extdProgStNm",
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
				const extdProgStcd = grid.getValue(cell.index.itemIndex, "extdProgStcd");
				const rsrAsmtNo = grid.getValue(cell.index.itemIndex, "rsrAsmtNo");
				const extdAplcNo = grid.getValue(cell.index.itemIndex, "extdAplcNo");
				const dataAplcNo = grid.getValue(cell.index.itemIndex, "dataAplcNo");

				const caption = extdProgStcd == "U01" ? "심의하기" : "결과보기";
				return `<a onclick="gotoDetail('` + rsrAsmtNo + `', '` + extdAplcNo + `', '` + dataAplcNo + `')">` + caption + `</a>`;
			},
		}
	}
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
			action : "/portal/sys/rsr/ext/selectDataExtAplcList.do",
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
		if (gridDataProvider.getRowCount() < 1) {
			alert("조회 결과가 없습니다.");
		}
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
			return { valid: false, msg: "시작일이 종료일보다 큽니다." };
		}
	}

	return { valid: true, msg: "" };
}

function gotoDetail(rsrAsmtNo, extdAplcNo, dataAplcNo) {
	$("#detailFrm input[name='rsrAsmtNo']").val(rsrAsmtNo);
	$("#detailFrm input[name='extdAplcNo']").val(extdAplcNo);
	$("#detailFrm input[name='dataAplcNo']").val(dataAplcNo);
	$("#detailFrm").submit();
}
</script>

<form id="detailFrm" name="detailFrm" method="post" action="/portal/sys/rsr/ext/detailDataExtAplc.do">
	<input type="hidden" name="rsrAsmtNo" />
	<input type="hidden" name="extdAplcNo" />
	<input type="hidden" name="dataAplcNo" />
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
								<option value="userNm">신청자</option>
								<option value="extdAplcRsnCont">신청사유</option>
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
						<h4>구분</h4>
						<div class="sel_int">
							<select id="extdStcd" name="extdStcd">
								<option value="">선택</option>
								<c:forEach items="${extdStcdList}" var="item">
									<option value="${item.detlCd}">${item.detlCdNm}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="item">
						<h4>진행상태</h4>
						<div class="sel_int">
							<select id="extdProgStcd" name="extdProgStcd">
								<option value="">선택</option>
								<c:forEach items="${extdProgStcd}" var="item">
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
