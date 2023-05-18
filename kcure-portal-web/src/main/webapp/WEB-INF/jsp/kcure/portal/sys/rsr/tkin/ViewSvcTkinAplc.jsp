<%
/* =================================================================
 * @FileName : ViewSvcTkinAplc.jsp
 * @date: 2023.05.08
 * @author : bhs
 * @설명 : 데이터반입관리 화면
 * =================================================================
 * 수정일         작성자             내용
 * -----------------------------------------------------------------------
 * 2023.05.08    bhs           파일생성
 * =================================================================
 */
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>

<script type="text/javascript">

	var gridColumns = [
		{
			name: "dataAplcNo",
			fieldName: "dataAplcNo",
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
			name: "tkinDtapNo",
			fieldName: "tkinDtapNo",
			visible: false,
		},
		{
			header: {
				text: "연구제목"
			},
			name: "rsrSbjNm",
			fieldName: "rsrSbjNm",
			type: "data",
			styleName: "ud-column-left",
			readOnly: true
		},
		{
			header: {
				text: "반입데이터명"
			},
			name: "tkinDataNmCont",
			fieldName: "tkinDataNmCont",
			type: "data",
			styleName: "ud-column-left",
			readOnly: true
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
				text: "신청자"
			},
			name: "userNm",
			fieldName: "userNm",
			type: "data",
			styleName: "ud-column-center",
			readOnly: true
		},
		{
			header: {
				text: "신청일"
			},
			name: "tkinDtapYmd",
			fieldName: "tkinDtapYmd",
			type: "data",
			styleName: "ud-column-center",
			readOnly: true,
		},
		{
			header: {
				text: "상태"
			},
			name: "tkinDataProgStcdNm",
			fieldName: "tkinDataProgStcdNm",
			type: "data",
			styleName: "ud-column-center",
			readOnly: true
		},
		{
			header: {
				text: "심의"
			},
			name: "tkinDataProgStcd",
			fieldName: "tkinDataProgStcd",
			styleName: "ud-column-center",
			renderer: {
				type: "html",
				callback: function (grid, cell) {
					const tkinDataProgStcd = grid.getValue(cell.index.itemIndex, "tkinDataProgStcd");
					const dataAplcNo = grid.getValue(cell.index.itemIndex, "dataAplcNo");
					const rsrAsmtNo = grid.getValue(cell.index.itemIndex, "rsrAsmtNo");
					const tkinDtapNo = grid.getValue(cell.index.itemIndex, "tkinDtapNo");
	
					const caption = tkinDataProgStcd == "U01" ? "심의하기" : "결과보기";
					if(tkinDataProgStcd == "U01"){
						return `<a onclick="gotoDetail('` + dataAplcNo + `', '` + rsrAsmtNo + `', '` + tkinDtapNo + `')">` + caption + `</a>`;
					}else{
						return `<a onclick="gotoResult('` + dataAplcNo + `', '` + rsrAsmtNo + `', '` + tkinDtapNo + `')">` + caption + `</a>`;
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
				action : "/portal/sys/rsr/tkin/selectSvcTkinAplcList.do",
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
		const tkinAplcDtFrom = $("#tkinAplcDtFrom").val();
		const tkinAplcDtTo = $("#tkinAplcDtTo").val();
		if (tkinAplcDtFrom || tkinAplcDtTo) {
			if (!tkinAplcDtFrom || !tkinAplcDtTo) {
				return { valid: false, msg: "신청일은 시작일과 종료일을 모두 입력해야 합니다." };
			}
			if (tkinAplcDtFrom > tkinAplcDtTo) {
				return { valid: false, msg: "시작일이 종료일보다 빠릅니다." };
			}
		}
	
		return { valid: true, msg: "" };
	}
	
	function gotoResult(dataAplcNo, rsrAsmtNo, tkinDtapNo) {
		$("#detailFrm input[name='dataAplcNo']").val(dataAplcNo);
		$("#detailFrm input[name='rsrAsmtNo']").val(rsrAsmtNo);
		$("#detailFrm input[name='tkinDtapNo']").val(tkinDtapNo);
		$("#detailFrm").attr('action', '/portal/sys/rsr/tkin/detailSvcTkinRsltAplc.do');
		$("#detailFrm").submit();
	}
	
	function gotoDetail(dataAplcNo, rsrAsmtNo, tkinDtapNo) {
		$("#detailFrm input[name='dataAplcNo']").val(dataAplcNo);
		$("#detailFrm input[name='rsrAsmtNo']").val(rsrAsmtNo);
		$("#detailFrm input[name='tkinDtapNo']").val(tkinDtapNo);
		$("#detailFrm").attr('action', '/portal/sys/rsr/tkin/detailSvcTkinAplc.do');
		$("#detailFrm").submit();
	}
	
</script>

<form id="detailFrm" name="detailFrm" method="post">
	<input type="hidden" name="dataAplcNo" />
	<input type="hidden" name="rsrAsmtNo" />
	<input type="hidden" name="tkinDtapNo" />
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
								<option value="tkinDataNmCont">반입데이터명</option>
							</select>
							<input type="text" id="searchKeyword" name="searchKeyword" value="" placeholder="검색어 입력" />
						</div>
					</div>
					<div class="item">
						<h4>신청일</h4>
						<div class="date_wrap">
							<ul>
								<li><input type="date" id="tkinAplcDtFrom" name="tkinAplcDtFrom" value="" placeholder="시작일자" maxlength="10"></li>
								<li>~</li>
								<li><input type="date" id="tkinAplcDtTo" name="tkinAplcDtTo" value="" placeholder="종료일자" maxlength="10"></li>
							</ul>
						</div>
					</div>
					<div class="item">
						<h4>승인여부</h4>
						<div class="sel_int">
							<select id="tkinDataProgStcd" name="tkinDataProgStcd">
								<option value="">선택</option>
								<c:forEach items="${tkinDataProgStList}" var="item">
									<option value="${item.detlCd}">${item.detlCdNm}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
				</form>
				<div class="btn_info">
					<p>총건수<span id="currCnt"></span>/<span id="totalCnt"></span></p>					
				</div>

				<div class="grid_area_wrap" id="gridView" style="height: 55px;"></div>
				<div id="grid_paging" class="page_num">
					<input type="hidden" name="pageIndex"  value="<c:out value='${searchVO.pageIndex}'/>">
			</div>
		</div>
	</div>
</div>
