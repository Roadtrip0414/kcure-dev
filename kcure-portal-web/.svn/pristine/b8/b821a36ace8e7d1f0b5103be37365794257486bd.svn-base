<%
/* =================================================================
 * @FileName : ViewDataAplcEnd.jsp
 * @date: 2023.03.15
 * @author : parkgu
 * @설명 : 데이터 종료관리 화면
 * =================================================================
 * 수정일         작성자             내용
 * -----------------------------------------------------------------------
 * 2023.03.15     parkgu           파일생성
 * =================================================================
 */
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>
<script type="text/javascript">
/*rsr_sbj_nm	rsr_dt_term	aplc_prog_nm	rsr_rslt_cnt	data_aplp_nm
*/
var gridColumns = [
	{
		header: {
			text: "연구제목"
		},
		name: "rsrSbjNm",
		fieldName: "rsrSbjNm",
		type: "data",
		styleName: "ud-column-center",
		readOnly: true
	},
	{
		header: {
			text: "연구기간"
		},
		name: "rsrDtTerm",
		fieldName: "rsrDtTerm",
		type: "data",
		styleName: "ud-column-center",
		readOnly: true
	},
	{
		header: {
			text: "구분"
		},
		name: "status",
		fieldName: "status",
		type: "data",
		styleName: "ud-column-center",
		readOnly: true
	},
	{
		header: {
			text: "연구성과등록"
		},
		name: "rsrRsltCnt",
		fieldName: "rsrRsltCnt",
		styleName: "ud-column-center",
		renderer: {
			type: "html",
			callback: function (grid, cell) {
				const rsrRsltCnt = grid.getValue(cell.index.itemIndex, "rsrRsltCnt");
				var dataAplcNo = grid.getValue(cell.index.itemIndex, "dataAplcNo");
				var html = "";
				
				if (rsrRsltCnt == 0) {
					html += "미등록";
				} else {
					html = html + '등록중 <a onclick="javascript:getRsrRslt(\''+dataAplcNo+'\')" >보기</a>';
				}
				return html;
			},
		}
	},
	{
		header: {
			text: "등록자"
		},
		name: "dataAplpNm",
		fieldName: "dataAplpNm",
		type: "data",
		styleName: "ud-column-center",
		readOnly: true
	},
	{
		header: {
			text: "등록일"
		},
		name: "lastModfDt",
		fieldName: "lastModfDt",
		type: "data",
		styleName: "ud-column-center",
		readOnly: true
	},
	{
		header: {
			text: "데이터신청번호"
		},
		name: "dataAplcNo",
		fieldName: "dataAplcNo",
		type: "data",
		styleName: "ud-column-center",
		readOnly: true,
		visible: false
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
		gridCheckBoxFlag: true,
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
			action : "/portal/sys/rsr/dac/selectDataAplcEndList.do",
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
	
	$("#closeBtn").click(function() {
		$("#rsltPop").attr("class", "kc_layer_popup");
	});
});

function validForSearch() {
	const rsrEdtFrom = $("#rsrEdtFrom").val();
	const rsrEdtTo = $("#rsrEdtTo").val();
	if (rsrEdtFrom || rsrEdtTo) {
		if (!rsrEdtFrom || !rsrEdtTo) {
			return { valid: false, msg: "종료일은 시작일과 종료일을 모두 입력해야 합니다." };
		}
		if (rsrEdtFrom > rsrEdtTo) {
			return { valid: false, msg: "시작일이 종료일보다 빠릅니다." };
		}
	}

	return { valid: true, msg: "" };
}

function getRsrRslt(dataAplcNo) {
	
	$('#dataAplcNo').val(dataAplcNo);
	
	var form = $("#rsltFrm").serialize();
	
	$.ajax({
        type: "post",
        url: "/portal/myp/rsc/inf/selectMypRscInfRsrRslt.do",
        data: form,
        dataType: 'json',
        success: function (data) {
            $("#rsrSbjNm").html(data.aplcInfo.rsrSbjNm);
          	$("#rsrDtTerm").html(data.aplcInfo.rsrSdtFmt + " ~ " +data.aplcInfo.rsrEdtFmt);
            $("#rsrpNm").html(data.aplcInfo.rsrpNm);
            $("#spnsExpsY").prop("checked", true);
            
            if (data.result == "success") {
            	if (data.RsrRsltInfo.spnsExpsYn == "N") {
            		$("#spnsExpsN").prop("checked", true);
            	}
            	
            	$("#tesPblcCont").html(data.RsrRsltInfo.tesPblcCont);
            	$("#ancRsltCont").html(data.RsrRsltInfo.ancRsltCont);
            	$("#etcRsltCont").html(data.RsrRsltInfo.etcRsltCont);
            }
                        
            $("#rsltPop").attr("class", "kc_layer_popup on");
            $("input, textarea").attr("readonly", true);
        },
        error: function (request, status, error) {
            //console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            alert('<spring:message code="fail.request.msg" />');
        }
    });
}
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
						<h4>검색대상</h4>
						<div class="sel_int">
							<select id="searchCondition" name="searchCondition">
								<option value="">선택</option>
								<option value="aplcProgNm">연구제목</option>
								<option value="dataAplpNm">등록자</option>
							</select>
							<input type="text" id="searchKeyword" name="searchKeyword" value="" placeholder="검색어 입력" />
						</div>
					</div>
					<div class="item">
						<h4>종료일</h4>
						<div class="date_wrap">
							<ul>
								<li><input type="date" id="rsrEdtFrom" name="rsrEdtFrom" value="" placeholder="시작일자" maxlength="10"></li>
								<li>~</li>
								<li><input type="date" id="rsrEdtTo" name="rsrEdtTo" value="" placeholder="종료일자" maxlength="10"></li>
							</ul>
						</div>
					</div>
					<div class="item">
						<h4>성과등록여부</h4>
						<div class="sel_int">
							<select id="rsrRstExists" name="rsrRstExists">
								<option value="">선택</option>
								<option value="false">미등록</option>
								<option value="true">등록중</option>
							</select>
						</div>
					</div>
				</div>
				</form>
				<div class="btn_info">
					<p>총건수<span id="currCnt"></span>/<span id="totalCnt"></span></p>
				</div>

				<div class="grid_area_wrap" id="gridView" style="height: 55px;"></div>
				<div id="grid_paging" class="page_num"></div>
			</div>
		</div>
	</div>
</div>

<!-- class="on"시 데이터 활용 설문조사 팝업 -->
<form id="rsltFrm" name="rsltFrm" method="post">	
	<input type="hidden" id="dataAplcNo" name="dataAplcNo">
	<div class="kc_layer_popup"	id="rsltPop">
		<div class="kc_popup_box perform_regist">
			<a href="javascript:void(0)" class="kc_close btn"></a>
			<div class="title">
				<p>연구성과등록</p>
			</div>
			<div class="popup_con">
				<div class="pr_top">
					<table class="user_tb_l">
						<tbody>
							<tr>
								<th>연구명</th>
								<td colspan="3" id="rsrSbjNm">K-cure 암센터 활용에 따른 방안</td>
							</tr>
							<tr>
								<th>책임연구자</th>
								<td id="rsrpNm">홍길동</td>
								<th>연구기간</th>
								<td id="rsrDtTerm">2022/01/01 - 2022/01/01</td>
							</tr>
						</tbody>
					</table>
				</div>
				<table class="user_tb_l">
					<tbody>
						<tr class="name">
							<th>등록자</th>
							<td>${loginVO.name}</td>
						</tr>
						<tr class="whether">
							<th>데중<br>병원사사표시여부</th>
							<td>
								<div class="n_radio_inn">
									<label class="n_radio_btn">
										<input type="radio" name="spnsExpsYn" id="spnsExpsY" value="Y">
										<span class="n_radio_mark"></span><span class="txt">여</span>
									</label>
									<label class="n_radio_btn">
										<input type="radio" name="spnsExpsYn" id="spnsExpsN" value="N">
										<span class="n_radio_mark"></span><span class="txt">부</span>
									</label>
								</div>
							</td>
						</tr>
						<tr>
							<th>논문게재</th>
							<td>
								<div class="txt_inn">
									<textarea id="tesPblcCont" name="tesPblcCont" class="user_text" placeholder="논문제목, 학술지명, 2021, 19권 2호, 77p~96p ISSN 1598-8813"></textarea>
									<p>*논문명 제출 시 [붙임]으로 증빙을 첨부 요청드립니다.</p>
								</div>
							</td>
						</tr>
						<tr>
							<th>발표성과</th>
							<td>
								<textarea id="ancRsltCont" name="ancRsltCont" class="user_text" placeholder="학술대회명, 발표일자, 발표자, 발표유형(포스터발표) 등"></textarea>
							</td>
						</tr>
						<tr>
							<th>기타성과</th>
							<td>
								<textarea id="etcRsltCont" name="etcRsltCont" class="user_text"></textarea>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="l_btn">
				<a href="javascript:void(0)" class="bc_blue" id="closeBtn">확인</a>
			</div>
		</div>
	</div>
</form>
