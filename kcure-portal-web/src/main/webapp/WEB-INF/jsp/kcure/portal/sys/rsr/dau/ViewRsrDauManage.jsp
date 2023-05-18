<%
/* =================================================================
 * @FileName : ViewRsrDauManage.jsp
 * @date: 2023.02.01
 * @author : kyh
 * @설명 : 데이터 활용관리
 * =================================================================
 * 수정일         작성자             내용
 * -----------------------------------------------------------------------
 * 2023.02.01     kyh           파일생성
 * =================================================================
 */
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>
<script type="text/javascript" src="/js/kcure/portal/sys/rsr/RsrSbjMemo.js"></script>
<script type="text/javascript">
var gridColumns = [
	{
		header: {
			text: "연구제목"
		},
		name: "rsrSbjNm",
		fieldName: "rsrSbjNm",
		type: "data",
		styleName: "ud-column-left",
		width: "150",
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
			text: "신청활용기간"
		},
		name: "dszDsgnDtTerm",
		fieldName: "dszDsgnDtTerm",
		type: "data",
		styleName: "ud-column-center",
		width: "150"
	},
	{
		header: {
			text: "데이터유형"
		},
		name: "dataTpnm",
		fieldName: "dataTpnm",
		type: "data",
		styleName: "ud-column-center",
		width: "100"
	},
	{
		header: {
			text: "분석자"
		},
		name: "dtuAcidNm",
		fieldName: "dtuAcidNm",
		type: "data",
		styleName: "ud-column-center",
		width: "150"
	},
	{
		header: {
			text: "유형"
		},
		name: "aenvSpnm",
		fieldName: "aenvSpnm",
		type: "data",
		styleName: "ud-column-center",
	},
	{
		header: {
			text: "분석도구"
		},
		name: "vrtAnlsDvceContNm",
		fieldName: "vrtAnlsDvceContNm",
		type: "data",
		styleName: "ud-column-center",
	},
	{
		header: {
			text: "센터"
		},
		name: "prtiNm",
		fieldName: "prtiNm",
		type: "data",
		styleName: "ud-column-center",
		width: "120"
	},
	{
		header: {
			text: "신청일"
		},
		name: "frstRgstDt",
		fieldName: "frstRgstDt",
		type: "data",
		styleName: "ud-column-center",
	},
	{
		header: {
			text: "상태"
		},
		name: "dtuAplcProgNm",
		fieldName: "dtuAplcProgNm",
		type: "data",
		styleName: "ud-column-center",
	},
	{
		header: {
			text: "심의"
		},
		name: "viewDtl",
		fieldName: "viewDtl",
		styleName: "ud-column-center",
		renderer: {
			type: "html",
			callback: function (grid, cell) {
				var cdChk = grid.getValue(cell.index.itemIndex, 'dtuAplcProgStcd');
				var dataAplcNo = grid.getValue(cell.index.itemIndex, 'dataAplcNo');
				var dtuAplcNo = grid.getValue(cell.index.itemIndex, 'dtuAplcNo');
				var str = "";

				str = '<div class="tb_btn_wrap">';
				if (cdChk == "U01") {	//U01	승인대기
					str = str + ' <a onClick="javascript:dtlView(\''+dataAplcNo+'\', \''+dtuAplcNo+'\')" class="bc_w_line_dk">심의하기</a>';
				} else {
					str = str + ' <a onClick="javascript:dtlView(\''+dataAplcNo+'\', \''+dtuAplcNo+'\')" class="bc_w_line_dk">결과보기</a>';
				}
				str = str + '</div>';

				return str;
			}
		}
	},
	{
		header: {
			text: "데이터신청번호"
		},
		name: "dataAplcNo",
		fieldName: "dataAplcNo",
		type: "data",
		styleName: "ud-column-center",
		visible: false
	},
	{
		header: {
			text: "데이터활용신청번호"
		},
		name: "dtuAplcNo",
		fieldName: "dtuAplcNo",
		type: "data",
		styleName: "ud-column-center",
		visible: false
	},
	{
		header: {
			text: "데이터활용신청진행상태코드"
		},
		name: "dtuAplcProgStcd",
		fieldName: "dtuAplcProgStcd",
		type: "data",
		styleName: "ud-column-center",
		visible: false
	}
];

$(document).ready(function() {
	$("#srchSiDoCd").val("${searchVO.srchSiDoCd}").trigger("change");

	if ("<c:out value='${searchVO.pageIndex}'/>" != "") {
		$("#pageIndex").val("${searchVO.pageIndex}");
	} else {
		$("#pageIndex").val("1");
	}

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
		editable : false,
		footerBarFlag : false
	});

	//인디케이터 설정
	gridView.setRowIndicator({visible: true});

	//상태바 설정
	gridView.setStateBar({visible: false});

	//체크바 설정
	gridView.setCheckBar({visible: false});

	/* 조회 버튼 클릭 S */
	var searchList = function() {
		RG.doQuery({
			action : "/portal/sys/rsr/dau/selectRsrDauList.do",
			form : "srchForm",
			dataProviderPram : gridDataProvider,
			gridViewPram : gridView,
			pagingId:"grid_paging",
			totalId: "totalCnt",
			currCntId: "currCnt",
			endEvent: srchEndEvent
		});
	}

	$("#srchBtn").click(function() {
		if ($("#searchCondition").val() == "" && $("#searchKeyword").val() != "") {
			$("#searchKeyword").val("");
		}

		if ($("#searchCondition").val() != "" && $("#searchKeyword").val() == "") {
			alert("검색어를 입력해 주세요.");
			return;
		}

		if ($("#searchKeywordFrom").val() != "" && $("#searchKeywordTo").val() != "") {
			if ($("#searchKeywordFrom").val() > $("#searchKeywordTo").val()) {
				alert("검색 종료일자가 시작일자보다 이전일 수 없습니다.");
				return;
			}
		}

		searchList();
	});

	var srchEndEvent = function(endEventParam, response) {
		console.log("--------------------srchEndEvent---------------------");
		console.log(endEventParam);
		console.log(response);
		console.log("--------------------srchEndEvent---------------------");
	}
	/* 조회 버튼 클릭 E */

	/* 조회 */
	searchList();
});

function chgSiDo() {
	if ($("#srchSiDoCd").val() == "") {
		var strSelectList = '<option value="">전체</option>';
		$("#srchPrtiId").html(strSelectList);
	} else {
		$.ajax({
	        type: "post",
	        url: "/portal/sys/rsr/dau/selectRsrDauPrtiIdList.do",
	        data: {"srchSiDoCd" : $("#srchSiDoCd").val()},
	        dataType: 'json',
	        success: function (data) {
	            var strSelectList = '<option value="">전체</option>';

	        	if (data.result == "success") {
	        		$.each(data.prtiIdList, function( index, value ) {
	        			strSelectList = strSelectList + '<option value="' + value.prtiId + '">' + value.prtiNm + '</option>';
	        		});
	            }

	            $("#srchPrtiId").html(strSelectList);

	            $("#srchPrtiId").val("${searchVO.srchPrtiId}");
	        },
	        error: function (request, status, error) {
	            //console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	            alert('<spring:message code="fail.request.msg" />');
	        }
	    });
	}
}

function dtlView(dataAplcNo, dtuAplcNo){
	$("#dataAplcNo").val(dataAplcNo);
	$("#dtuAplcNo").val(dtuAplcNo);
	$("#srchForm").attr("action", "/portal/sys/rsr/dau/detailRsrDauManage.do").submit();
}
</script>

<!-- container -->
<form id="srchForm" name="srchForm" method="post">
	<input type="hidden" id="dataAplcNo" name="dataAplcNo" value="">
	<input type="hidden" id="dtuAplcNo" name="dtuAplcNo" value="">
	<input type="hidden" id="limitPrtiId" name="limitPrtiId" value="${searchVO.limitPrtiId}">

	<div class="wrap">
		<div class="con">
			<div class="area_wrap">
				<div class="section">
					<div class="btn_info">
						<!-- p테그는 남겨줘야 자동으로 버튼이 오른쪽 정렬 -->
						<p></p>
						<div class="s_btn">
							<a href="javascript:void(0)" id="srchBtn">검색</a>
						</div>
					</div>

					<div class="search_wrap">
						<div class="item">
							<h4>검색대상</h4>
							<div class="sel_int">
								<select name="searchCondition" id="searchCondition">
									<option value="">선택</option>
									<option value="rsrSbjNm" <c:if test="${searchVO.searchCondition eq 'rsrSbjNm'}">selected="selected"</c:if>>연구제목</option>
									<option value="aplpNm" <c:if test="${searchVO.searchCondition eq 'aplpNm'}">selected="selected"</c:if>>분석자</option>
								</select>
								<input type="text" name="searchKeyword" id="searchKeyword" value="${searchVO.searchKeyword}">
							</div>
						</div>
						<div class="item">
							<h4>신청일</h4>
							<div class="date_wrap">
								<ul>
									<li><input type="date" name="searchKeywordFrom" id="searchKeywordFrom" maxlength="10" value="${searchVO.searchKeywordFrom}"></li>
									<li>~</li>
									<li><input type="date" name="searchKeywordTo" id="searchKeywordTo" maxlength="10" value="${searchVO.searchKeywordTo}"></li>
								</ul>
							</div>
						</div>
						<div class="item">
							<h4>유형</h4>
							<kcure:select id="srchAenvSpcd" name="srchAenvSpcd" grpCd="FORM_CD" defaultText="전체" selected="${searchVO.srchAenvSpcd}"/>
						</div>
						<div class="item">
							<h4>센터</h4>
							<div class="two_wrap">
								<ul>
									<li>
										<select name="srchSiDoCd" id="srchSiDoCd" onchange="javascript:chgSiDo();">
											<option value="">전체</option>
											<c:forEach items="${siDoCdList}" var="list" varStatus="rowInx">
												<option value="${list.detlCd}">${list.detlCdNm}</option>
											</c:forEach>
										</select>
									</li>
									<li>
										<select name="srchPrtiId" id="srchPrtiId">
											<option value="">전체</option>
										</select>
									</li>
								</ul>
							</div>
						</div>
						<div class="item">
							<h4>상태</h4>
							<kcure:select id="srchDtuAplcProgStcd" name="srchDtuAplcProgStcd" grpCd="DTU_APLC_PROG_STCD" defaultText="전체" selected="${searchVO.srchDtuAplcProgStcd}"/>
						</div>
					</div>

					<div class="btn_info">
						<!-- p테그는 남겨줘야 자동으로 버튼이 오른쪽 정렬 -->
						<p>총건수 <span><span id="currCnt"/></span> /<span id="totalCnt"/></p>
					</div>

					<!-- 리얼그리드 영역 | 나중에 style 삭제요망-->
					<div class="grid_area_wrap" id="gridView" style="height: 55px;"></div>
					<div id="grid_paging" class="page_num">
						<input type="hidden" id="pageIndex" name="pageIndex" value="">
					</div>
				</div>
			</div>
		</div>
	</div>
</form>
<!-- //container -->