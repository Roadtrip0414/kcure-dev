<%
/* =================================================================
 * @FileName : ViewDataAplcRvw.jsp
 * @date: 2023.03.16
 * @author : shpark
 * @설명 : 데이터 제공
 * =================================================================
 * 수정일         작성자             내용
 * -----------------------------------------------------------------------
 * 2023.03.14     shpark           파일생성
 * =================================================================
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>
<script type="text/javascript">
//STODO : 퍼블 나오면 수정
$('body').addClass('admin');
var detalCd = 'RD'

var rvwStpStcdCombo = RG.setGridComboBox({
    action:"/portal/sys/dac/rvw/getComboStepCd.do", // 호출할 url
    cdAndNm : {labels:"detlCdNm",values:"detlCd"}, // values와 labels에 입력할 json Name값들 및 values 값 속성
    params:{grpCd:"RVW_STP_STCD",detlCd:detalCd}
});

var gridColumns = [
	{
		header: {
			text: "기관명"
		},
		name: "prtiNm",
		fieldName: "prtiNm",
		type: "data",
		styleName: "ud-column-center",
		editable: false
	},
	{
		header: {
			text: "직위"
		},
		name: "rvwPrncPstNm",
		fieldName: "rvwPrncPstNm",
		type: "data",
		styleName: "ud-column-center",
		editable: false
	},
	{
		header: {
			text: "이름"
		},
		name: "userNm",
		fieldName: "userNm",
		type: "data",
		styleName: "ud-column-center",
		editable: false
	},
	{
		header: {
			text: "근무처 전화번호"
		},
		name: "rvwPstPn",
		fieldName: "rvwPstPn",
		type: "data",
		styleName: "ud-column-center",
		editable: false
	},
	{
		header: {
			text: "E-mail"
		},
		name: "userId",
		fieldName: "userId",
		type: "data",
		styleName: "ud-column-center",
		editable: false
	},
	{
		header: {
			text: "상태"
		},
		name: "rvwStpStcd",
		fieldName: "rvwStpStcd",
		lookupDisplay: true,
	    values: rvwStpStcdCombo.values,
	    labels: rvwStpStcdCombo.labels,
	    editor : { type: "dropdown"},
	    styleCallback : function(grid, dataCell){
	        var targetStcd = grid.getValue(dataCell.index.itemIndex, "targetRvwStpStcd");
	        var stcd = grid.getValue(dataCell.index.itemIndex, "rvwStpStcd");
	        var ret = {};

	        if (targetStcd == 'RD02') {
	        	ret.editable = false;
            }
	        return ret;
	    },
	},
	{
		header: {
			text: "targetRvwStpStcd"
		},
		fieldName: "targetRvwStpStcd",
		name: "targetRvwStpStcd",
		type: "data",
		visible: false,

	},
	{
		header: {
			text: "dataAplcNo"
		},
		name: "dataAplcNo",
		fieldName: "dataAplcNo",
		type: "data",
		visible: false,
	},
	{
		header: {
			text: "prtiId"
		},
		name: "prtiId",
		fieldName: "prtiId",
		type: "data",
		visible: false,
	},

];



function fnMovePage(stpCd){
	$("#moveStpSpcd").val(stpCd);
	let url = '/portal/sys/dac/rvw/movePage.do';
	$("#dataForm").attr('action', url).submit();
}


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
		form:"dataForm",
		editable : true,
		footerBarFlag : false
	});

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
			action : "/portal/sys/dac/rvw/selectDataPrvd.do",
			dataProviderPram : gridDataProvider,
			gridViewPram : gridView,
			endEvent: srchEndEvent,
			form:"dataForm"


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


	/*상태저장 후 실행 function  */
	var saveEndEvent = function() {
		console.log("--------------------saveEndEvent---------------------");
		searchList();
		console.log("--------------------saveEndEvent---------------------");
	}

	/* 저장 버튼 클릭  */
	$("#saveBtn").click(
					function() {
						/*
						 * parameter: json 타입
						 *            action : 호출할 url
						 *            endEvent : 저장 이후 처리되는 함수 설정
						 *            endPram : endEvent에 넘길 파라미터
						 *            dataProviderPram : 조회된 리턴값 dataProvider
						 *            gridViewPram : 그리드 ID
						 *            checkBinding : 입력한 스트링값에 대해서 변수를 설정하고, 그 변수에 Y,N값을 체크에 따라서 설정하게 함
						 * ex : action : "/stock/report/searchStkReportDestructionListTest.action" ,
						 *            form : "srchForm",
						 *            endEvent : fnCall
						 *            endPram : "스트링,json,숫자"
						 *            dataProviderPram : dataProvider,
						 *            gridViewPram : realgrid
						 *            checkBinding : "checked"
						 */

					    gridView.commit();
						var rows = gridView.getCheckedRows();
						if(rows.length > 0){
							RG.doSave({
								action : "/portal/sys/dac/rvw/saveDataPrvd.do",
								endEvent : saveEndEvent,
								dataProviderPram : gridDataProvider,
								gridViewPram : gridView,
								showEndMessage : true,
								cud : ["U"]
							});
						}else{
							alert("저장할 값이 없습니다.");
							return;
						}


					});
})

</script>

<form id="dataForm" name="dataForm" style="display: none;" method="post">
	<input type="hidden" name="dataAplcNo" value="${dacRvwDataPrvdVo.dataAplcNo}">

	<input type="hidden" id="moveStpSpcd" name="rvwStpSpcd">
</form>


<div class="wrap">
		<div class="con">
			<div class="area_wrap">
				<div class="section">
					<div class="deliberative_wrap">
						<div class="con_title">
							<p><c:out value="${clcInfReserchVo.rsrSbjNm}" /></p>
							<ul>
								<li><c:out value="${clcInfReserchVo.dataAplcYmd}" /></li>
								<li><a href="javascript:void(0)" class="bc_green">데이터 제공</a></li>
							</ul>
						</div>
						<div class="drop_table">
							<a href="javascript:void(0)" class="drop_btn">상세보기</a>
							<table class="left_talbe">
								<tbody>
									<tr>
										<th>연구기간</th>
										<td><c:out value="${clcInfReserchVo.rsrSdt}" /> ~ <c:out value="${clcInfReserchVo.rsrEdt}" /></td>
										<th>신청자</th>
										<td><c:out value="${clcInfReserchVo.prtiNm}" /> / <c:out value="${clcInfReserchVo.dataAplpNm}" /></td>
									</tr>
								</tbody>
								<tbody>
									<tr>
										<th>IRB NO.</th>
										<td><c:out value="${clcInfReserchVo.irbNo}" /></td>
										<th>IRB 승인기간</th>
										<td><c:out value="${clcInfReserchVo.irbApriNm}" /></td>
									</tr>
									<tr>
										<th>연구유형</th>
										<td><c:out value="${clcInfReserchVo.rsrSpcdNm}" /></td>
										<th>연구목적</th>
										<td><c:out value="${clcInfReserchVo.rsrPrpsCont}" /></td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="progress_nav">
							<div class="title">
								<p>심의절차</p>
								<!-- <a href="javascript:void(0)">수정하기</a> -->
							</div>
							<div class="info">
							<!-- class="on" 활성화 | class="save" 완료 -->
							<c:forEach var="list" items="${list}" varStatus="rowInx">
							  	<c:if test="${list.stpSts eq 'P'}">
							    	<ul class="save">
							  	</c:if>
							  	<c:if test="${list.stpSts eq 'C'}">
							    	<ul class="on">
							  	</c:if>
									<li class="img" onclick="fnMovePage('${list.rvwStpSpcd}')" style="cursor: pointer;"></li>
									<li class="txt">${list.rvwStpSpcdNm}</li>
								</ul>
							</c:forEach>
						</div>
						</div>
						<div class="con_title">
							<p>제공기관 심의 (심의번호 <c:out value="${dacRvwDataPrvdVo.dataAplcNo}"/> )</p>
						</div>
						<div class="table_con">
							<div class="btn_info type_01">
								<div class="require">
									<p>데이터 제공 상태 설정</p>
								</div>
								<a href="javascript:void(0)" id="saveBtn" class="bc_blue">상태 저장</a>
							</div>

							<!-- //boardpage-infor -->
							<div class="grid_area_wrap" id="gridView"></div>
							<!-- class="on"일때 반려중 -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
