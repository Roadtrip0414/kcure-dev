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
if('RC01' =='${data.rvwStpStcd}'){
	detalCd = 'RC'
}
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


function fnMoveToList() {
	document.location.href = "/portal/sys/dac/rvw/viewDataAplcRvw.do";
}

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
		//searchList();
		fnMovePage($('#targetRvwStpSpcd').val());
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
								form:"dataForm" ,
								cud : ["U"]
							});
						}else{
							alert("저장할 값이 없습니다.");
							return;
						}


					});
})

</script>

<form id="dataForm" name="dataForm" method="post" style="display: none;">
	<input type="hidden" name="dataAplcNo" value="${dacRvwDataPrvdVo.dataAplcNo}">
	<input type="hidden" id="moveStpSpcd" name="rvwStpSpcd">
	<input type="hidden" id="targetRvwStpSpcd" value="${dacRvwDataPrvdVo.rvwStpSpcd}">
</form>


<div class="wrap">
	<div class="con">
		<div class="area_wrap">
			<div class="section">
				<div class="data_set_title">
					<div class="top">
						<p class="mark">데이터제공</p>
						<p class="title">${clcInfReserchVo.rsrSbjNm}</p>
					</div>
					<div class="info">
						<ul>
							<li>연구기간</li>
							<li>${clcInfReserchVo.rsrSdt} ~ ${clcInfReserchVo.rsrEdt}</li>
						</ul>
						<ul>
							<li>유형</li>
							<li>${clcInfReserchVo.rsrSpcdNm}</li>
						</ul>
						<ul>
							<li>신청자</li>
							<li>${clcInfReserchVo.prtiNm} / ${clcInfReserchVo.dataAplpNm}</li>
						</ul>
						<ul>
							<li>신청일자</li>
							<li>${clcInfReserchVo.dataAplcYmd}</li>
						</ul>
					</div>
				</div>
				<div class="data_set_flow">
					<p class="title">심의절차</p>
					<!-- class="on" 활성화 | class="save" 완료 -->
					<ul>
					<c:forEach var="list" items="${list}" varStatus="rowInx">
						<li class="${list.stpSts == 'P' ? 'save' : ''} ${list.stpSts == 'C' ? 'on' : ''}">
							<c:choose>
								<c:when test="${list.stpSts == 'P' && list.moveUriYn == 'Y' }">
									<a href="javascript:void(0)" onclick="fnMovePage('${list.rvwStpSpcd}');">${list.rvwStpSpcdNm}</a>
								</c:when>
								<c:otherwise>
									${list.rvwStpSpcdNm}
								</c:otherwise>
							</c:choose>
							
						</li>
					</c:forEach>
					</ul>
				</div>
				<div class="n_title_tb_wrap">
					<div class="title">
						<p>제공기관 심의</p>
						<a href="javascript:void(0)" id="saveBtn" class="dk_gray">상태 저장</a>
					</div>
					<!-- 리얼그리드 영역 | 나중에 style 삭제요망-->
					<div class="grid_area_wrap" id="gridView" style="height: 300px; background-color: #F9F9F9; border: 1px solid #DDDDDD; color: red;"></div>
					<div class="n_grid_tb_btn">
						<div class="left">
							<a href="javascript:fnMoveToList()" class="line_gray">목록으로</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
