<%
/* =================================================================
 * @FileName : ViewMypRscInfApl.jsp
 * @date: 2023.02.01
 * @author : kyh
 * @설명 : 마이페이지 나의연구 신청 화면
 * =================================================================
 * 수정일         작성자             내용
 * -----------------------------------------------------------------------
 * 2023.02.01     kyh           파일생성
 * =================================================================
 */
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>
<script type="text/javascript">
var gridColumns = [
	{
		header: {
			text: "연구명"
		},
		name: "rsrSbjNm",
		fieldName: "rsrSbjNm",
		type: "data",
		styleName: "ud-column-center",
		width: "200",
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
		width: "50",
		readOnly: true
	},
	{
		header: {
			text: "등록일"
		},
		name: "dataAplcYmd",
		fieldName: "dataAplcYmd",
		type: "data",
		styleName: "ud-column-center",
		readOnly: true
	},
	{
		header: {
			text: "신청자"
		},
		name: "dataAplpNm",
		fieldName: "dataAplpNm",
		type: "data",
		styleName: "ud-column-center",
		readOnly: true
	},
	{
		header: {
			text: "진행상태"
		},
		name: "mpSrlbNm",
		fieldName: "mpSrlbNm",
		styleName: "ud-column-center",
		width: "200",
		renderer: {
			type: "html",
			callback: function (grid, cell) {
				var dataAplcNo = grid.getValue(cell.index.itemIndex, 'dataAplcNo');
				var dtapStpSpcd = grid.getValue(cell.index.itemIndex, 'dtapStpSpcd');
				var detlCd = grid.getValue(cell.index.itemIndex, 'detlCd');
				var mpSrlbNm = grid.getValue(cell.index.itemIndex, 'mpSrlbNm');
				var mpBtnlbNm = grid.getValue(cell.index.itemIndex, 'mpBtnlbNm');

				var str = '<div class="tb_btn_wrap">';
				if (detlCd == "01") {	//작성중
					str += '<p class="f_dk_gray">' + mpSrlbNm + '</p>';
					str += ' <a href="javascript:sendAddApl(\''+dataAplcNo+'\',\''+dtapStpSpcd+'\')" class="bc_w_line_dk">'+mpBtnlbNm+'</a>';	//이어하기
					str += ' <a href="javascript:sendCancelApl(\''+dataAplcNo+'\')" class="bc_gray">취소</a>';
				} else if ("RP01, RP02, RA01, RD01, RC02".indexOf(detlCd) > -1) {	//심의중, 데이터준비중, 제공기관승인완료
					str += '<p class="f_dk_gray">' + mpSrlbNm + '</p>';
					if(typeof mpBtnlbNm != 'undefined'){
						str += ' <a href="javascript:sendDetailApl(\''+dataAplcNo+'\')" class="bc_w_line_dk">'+mpBtnlbNm+'</a>';	//자세히보기
					}
				} else if ("RP03, RP04".indexOf(detlCd) > -1) {	//보완 요청, 반려
					str += '<p class="f_red"><a href="##" onclick="fnRvwPopup(\''+dataAplcNo+'\');">' + mpSrlbNm + '</a></p>';
					if(typeof mpBtnlbNm != 'undefined'){
						str += ' <a href="javascript:sendAddApl(\''+dataAplcNo+'\',\'01\')" class="bc_red">'+mpBtnlbNm+'</a>';		//재수정하기
					}
				} else if (detlCd == "RD02") {	//심의승인
					str += '<p class="f_green">' + mpSrlbNm + '</p>';
					if(typeof mpBtnlbNm != 'undefined'){
						str += ' <a onclick="javascript:movUseForm(\''+dataAplcNo+'\')" class="bc_green">'+mpBtnlbNm+'</a>';		//활용센터신청
					}
				} else if ("RA02, RC01".indexOf(detlCd) > -1) {	//연구비결제
					str += '<p class="f_dk_gray">' + mpSrlbNm + '</p>';
					str += ' <a onclick="javascript:sendDataPayment(\''+dataAplcNo+'\')" class="bc_w_line_dk">'+mpBtnlbNm+'</a>';	//연구비 결제
				} else {
					str += '<p class="f_dk_gray">' + mpSrlbNm + '</p>';
				}
				str += '</div>';

				return str;
			},
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
			text: "진행상태코드"
		},
		name: "dtapStpSpcd",
		fieldName: "dtapStpSpcd",
		type: "data",
		styleName: "ud-column-center",
		visible: false
	},
	{
		header: {
			text: "버튼명"
		},
		name: "mpBtnlbNm",
		fieldName: "mpBtnlbNm",
		type: "data",
		styleName: "ud-column-center",
		visible: false
	},
	{
		header: {
			text: "진행상태상세코드"
		},
		name: "detlCd",
		fieldName: "detlCd",
		type: "data",
		styleName: "ud-column-center",
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
		gridCheckBoxFlag: false,
		//form : "srchForm",
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
			action : "/portal/myp/rsc/inf/selectMypRscInfAplList.do",
			//form : "srchForm",
			dataProviderPram : gridDataProvider,
			gridViewPram : gridView,
			pagingId:"grid_paging",
			//totalId: "totalCnt",
			//currCntId: "currCnt",
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

//이어하기, 자세히보기
function sendAddApl(dataAplcNo, aplcStpSpcd) {

	$.ajax({
		type:"POST",
		url: "/portal/myp/rsc/inf/selectAplcStpUrl.do",
		dataType: "json",
		data:{"aplcStpSpcd" : aplcStpSpcd},
		success: function(resp){
			$("#dataAplcNo").val(dataAplcNo);
			$("#listFrm").attr("action", resp).submit();
		},
		err: function(err){
			console.log("err:", err);
		}
	});

}

//취소
function sendCancelApl(dataAplcNo) {
	if(confirm("작성하시고 있는 과제를 완전히 삭제하시겠습니까?")){
		$.ajax({
			type:"POST",
			url: "/portal/myp/rsc/inf/deleteSvcDataAplc.do",
			dataType: "json",
			data:{"dataAplcNo" : dataAplcNo},
			success: function(resp){
				location.href = "/portal/myp/rsc/inf/viewMypRscInfApl.do"
			},
			err: function(err){
				console.log("err:", err);
			}
		});
	}
}

function sendReApl(dataAplcNo, aplcStpSpcd) {
	$.ajax({
		type:"POST",
		url: "/portal/myp/rsc/inf/selectAplcStpUrl.do",
		dataType: "json",
		data:{"aplcStpSpcd" : aplcStpSpcd},
		success: function(resp){
			$("#dataAplcNo").val(dataAplcNo);
			$("#listFrm").attr("action", resp).submit();
		},
		err: function(err){
			console.log("err:", err);
		}
	});
}

//활용센터 이동
function movUseForm(dataAplcNo){
	$("#dataAplcNo").val(dataAplcNo);
	$("#listFrm").attr("action", "/portal/myp/rsc/inf/viewMypRscInfUseForm.do").submit();
}

//자세히보기 이동
function sendDetailApl(dataAplcNo){
	$("#listFrm input[name='pageIndex']").val($("#grid_paging input[name='pageIndex']").val());
	$("#dataAplcNo").val(dataAplcNo);
	$("#listFrm").attr("action", "/portal/myp/rsc/inf/detailViewMypRsc.do").submit();
}

//연구비 결제하기 이동
function sendDataPayment(dataAplcNo){
	$("#listFrm input[name='pageIndex']").val($("#grid_paging input[name='pageIndex']").val());
	$("#dataAplcNo").val(dataAplcNo);
	$("#listFrm").attr("action", "/portal/myp/rsc/inf/detailViewDataPayment.do").submit();
}

//보완요청 사유 팝업
function fnRvwPopup(dataAplcNo){
	$.ajax({
		type:"POST",
		url: "/portal/myp/rsc/inf/selectDataAplcRvw.do",
		dataType: "json",
		data:{"dataAplcNo" : dataAplcNo},
		success: function(resp){
			if(resp.dataAplcRvw != null){
				$("#rjcRsnCont").val(resp.dataAplcRvw.rjcRsnCont);
				$(".kc_layer_popup").addClass("on");
			}else{
				alert("반려 및 보완요청 사유가 없습니다.");
				return;
			}
		},
		err: function(err){
			console.log("err:", err);
		}
	});
}
</script>
	<div class="wrap">
		<%@ include file="/WEB-INF/jsp/kcure/portal/myp/rsc/ViewMypRscInfNav.jsp" %>

		<form id="listFrm" name="listFrm" method="post">
			<input type="hidden" name="pageIndex" value="<c:out value='${pageIndex}'/>"/>
			<input type="hidden" id="dataAplcNo" name="dataAplcNo" value="">
		</form>
		<div class="my_research_wrap">
			<div class="con">
				<div class="sub_pag_title">
					<p>데이터 신청 결과</p>
					<span>본인이 신청했거나 책임연구자로 지정된 연구의 데이터 이용 신청 결과 목록이 조회됩니다.</span>
				</div>
				<div class="res_apply">
					<div class="grid_area_wrap" id="gridView"></div>
					<div id="grid_paging" class="page_num"></div>
				</div>
			</div>
		</div>
	</div>
	<!-- class="on"시 반려사유 팝업 -->
	<div class="kc_layer_popup">
	   <div class="kc_popup_box">
	      <a href="javascript:void(0)" class="kc_close btn"></a>
	      <div class="title">
	         <p>반려 및 보완요청 사유</p>
	      </div>
	      <div class="popup_con">
	         <textarea rows="10" style="height: 162px;" class="user_text" id="rjcRsnCont"></textarea>
	      </div>
	      <div class="l_btn">
	         <a href="javascript:void(0)" class="bc_blue kc_close">닫기</a>
	      </div>
	   </div>
	</div>