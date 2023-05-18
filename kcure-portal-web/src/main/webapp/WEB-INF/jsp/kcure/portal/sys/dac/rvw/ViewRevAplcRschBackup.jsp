<%
/* =================================================================
 * @FileName : ViewDataAplcRvw.jsp
 * @date: 2023.03.15
 * @author : bhs
 * @설명 : 연구접수/사무국 검토 화면
 * =================================================================
 * 수정일         작성자             내용
 * -----------------------------------------------------------------------
 * 2023.03.15     bhs           파일생성
 * =================================================================
 */
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>

<script type="text/javascript">
	//디테일코드 그리드 셋팅 start
	var gridColumns = [
	   {
			header: {
				text: "구분"
			},
			name: "dataTpnm",
			fieldName: "dataTpnm",
			type: "data",
			styleName: "ud-column-center",
			width: "50",
		},
		{

			header: {
				text: "데이터제공기관"
			},
			required : true,
			name: "prtiNm",
			fieldName: "prtiNm",
			type: "data",
			styleName: "ud-column-center",
		},
		{

			header: {
				text: "데이터셋"
			},
			required : true,
			name: "dtsIdKnmList",
			fieldName: "dtsIdKnmList",
			type: "data",
			styleName: "ud-column-left",
			renderer:{
				type:"html",
				callback: function(grid, cell, w, h) {
				    const dtsIdKnmList = cell.value;
				    return dtsIdKnmList.replaceAll(":", "<br />");
				}
			},
		},
		{
			header: {
				text: "엑셀다운로드"
			},
			name: "fileList",
			fieldName: "fileList",
			type: "data",
			styleName: "ud-column-left",
			renderer:{
				type:"html",
				callback: function(grid, cell, w, h) {
					return getFileListHtml(cell.value);
				}
			},
		},
	];
	//디테일코드 그리드 셋팅 end

	$( document ).ready(function() {
		$('body').addClass('admin');

		fnInitBtn();

		var gridDataProvider = new RealGrid.LocalDataProvider();
		var gridView = new RealGrid.GridView('gridView');
		gridView.setDataSource(gridDataProvider);

		/* 자동 컬럼 크기 조절  */
		gridView.displayOptions.fitStyle = "fill";
		gridView.displayOptions.syncGridHeight = "always";
		gridView.setRowIndicator({ visible: false });
		//그리드 컬럼 정보 세팅
		setFieldsNColumns(gridDataProvider, gridView, gridColumns);

		//초기 세팅(주의: 조회 함수 밑에 둬야 함)
		RG.initPattern({
			dataProviderPram : gridDataProvider,
			gridViewPram : gridView,
			gridCheckBoxFlag: false,
			editable: false,
			footerBarFlag : false
		});
		//디테일코드 그리드 셋팅 end

		const dtsList = [
		<c:forEach var="item" items="${dtsList}" varStatus="idx">
			{ dataTpnm: "${item.dataTpnm}", prtiNm: "${item.prtiNm}", dtsIdKnmList: "${item.dtsIdKnmList}", fileList: "${item.fileList}" },
		</c:forEach>
		];
		gridDataProvider.setRows(dtsList);
		gridView.displayOptions.rowHeight = -1;
		gridView.displayOptions.minRowHeight = 36;
	});

	function getFileListHtml(fileList) {
		if (!fileList) return "";

		const list = [];
		for (const file of fileList.split(":")) {
			const nm_PthNm_StrNm = file.split('|');
			const attfNm = nm_PthNm_StrNm[0];
			const attfPthNm = nm_PthNm_StrNm[1];
			const attfStrNm = nm_PthNm_StrNm[2];
			const html = `<a href="#" onclick="javascript:downFile('` + attfPthNm + `', '` + attfStrNm + `', '` + attfNm + `');">` + attfNm + `</a>`;
			list.push(html);
		}

	    return list.join("<br />");
	}

	/*
	* 버튼 초기화
	*/
	function fnInitBtn(){

	}

	/*
	* 반려사유(등록) 팝업오픈
	*/
	function fnOpenRtn(){
		$("#rtnRgstLayerPop").addClass('on');
	}

	function fnMoveToList() {
		document.location.href = "/portal/sys/dac/rvw/viewDataAplcRvw.do";
	}

	/*
	* 반려사유 저장
	*/
	function fnRgstRtn(){
		let rjcRgstRsnCont = $("#rjcRgstRsnCont").val();
		let dataAplcNo = $("#dataAplcNo").val();
		let rvwStpSpcd = $("#rvwStpSpcd").val();
		let dataTpcd = $("#dataTpcd").val();

		if(rjcRgstRsnCont == ""){
			alert("반려사유를 등록해주세요");
			return;
		}

		$.ajax({
			type:"POST",
			url:"/portal/sys/dac/rvw/saveRtnRvw.do",
			data:{
						"rjcRsnCont"	: rjcRgstRsnCont,
						"dataAplcNo"	: dataAplcNo,
						"rvwStpSpcd"	: rvwStpSpcd,
						"dataTpcd"	: dataTpcd
					 },
			dataType:'json',
			success:function(returnData){

			let resultCode = returnData.resultCode;

			if(resultCode == "Y"){
				fnMovePage('00');
				/*
				$("#rtnRgstLayerPop").removeClass('on');
				$("#rvwStpStcd").val("RP03");
				fnInitBtn();
				*/
			}
	      }
		});
	}

	/*
	* 검토서 제출여부 조회 및 단계완료 숨기기
	*/
	function fnCheckAcptAprpRew(){
		let dataAplcNo = $("#dataAplcNo").val();

		$.ajax({
			type:"POST",
			url:"/portal/sys/dac/rvw/selectAcptAprpCnt.do",
			data:{
						"dataAplcNo"	: dataAplcNo
					 },
			dataType:'json',
			success:function(returnData){

			let resultData = returnData.data;
			let resultCode = returnData.resultCode;

			if(resultCode == "Y"){
				if(resultData > 0){
					$("#btnNext").css("display", "none");
					$("#btnAddRvw").css("display", "none");
				}
			}
	      }
		});
	}

	/* 파일 다운로드  */
	function downFile(attfPthNm,attfStrNm,attfNm){
		if (!attfNm) {
			alert("파일이 존재하지 않습니다.");
			return;
		}

		$('#downLoadFilefrm #attfPthNm').val(attfPthNm);
		$('#downLoadFilefrm #attfStrNm').val(attfStrNm);
		$('#downLoadFilefrm #attfNm').val(attfNm);
	    $('#downLoadFilefrm').attr("action", "/portal/dac/clc/inf/serviceFileDown.do");
	    $('#downLoadFilefrm').submit();
	}

	/*
	* 단계완료 처리
	*/
	function fnNext(){
		let url = '/portal/sys/dac/rvw/saveRevAplcRsch.do';
		$("#sendFrm").attr('action', url).submit();
	}

	/*
	* 단계이동
	*/
	function fnMovePage(stpCd){
		$("#moveStpSpcd").val(stpCd);
		let url = '/portal/sys/dac/rvw/movePage.do';
		$("#moveFrm").attr('action', url).submit();
	}

</script>

<form id="moveFrm" name="moveFrm">
	<input type="hidden"  name="dataAplcNo" value='<c:out value="${data.dataAplcNo}"/>'>
	<input type="hidden"  name="rvwTmpId" value='<c:out value="${data.rvwTmpId}"/>'>
	<input type="hidden" id="moveStpSpcd" name="rvwStpSpcd">
</form>

<form id="sendFrm" name="sendFrm">
	<input type="hidden" id="dataAplcNo" name="dataAplcNo" value='<c:out value="${data.dataAplcNo}"/>'>
	<input type="hidden" id="rvwTmpId" name="rvwTmpId" value='<c:out value="${data.rvwTmpId}"/>'>
	<input type="hidden" id="dataTpcd" name="dataTpcd" value='<c:out value="${data.dataTpcd}"/>'>
	<input type="hidden" id="rvwStpSpcd" name="rvwStpSpcd" value='<c:out value="${stpData.rvwStpSpcd}"/>'>
	<input type="hidden" id="rvwStpStcd" name="rvwStpStcd" value='<c:out value="${data.rvwStpStcd}"/>'>
	<input type="hidden" id="preSpcd" name="preSpcd" value='<c:out value="${stpData.preSpcd}"/>'>
	<input type="hidden" id="nextSpcd" name="nextSpcd" value='<c:out value="${stpData.nextSpcd}"/>'>
	<input type="hidden" id="isRtnYn" value="N">
	<input type="hidden" id="isSubRvwYn" value="N">
</form>

<!-- 파일 다운로드폼 -->
<form name="downLoadFilefrm" id="downLoadFilefrm" action="" method="post" style="display: none;" >
	<input type="hidden" id="fileAttNmSpcd" name="fileAttNmSpcd">
	<input type="hidden" id="dataAplcNo" name="dataAplcNo" value='<c:out value="${data.dataAplcNo}"/>'>
	<input type="hidden" id="attfPthNm" name="attfPthNm">
	<input type="hidden" id="attfStrNm" name="attfStrNm">
	<input type="hidden" id="attfNm" name="attfNm" >
</form>

<div class="wrap">
	<div class="con">
		<div class="area_wrap">
			<div class="section">
				<div class="data_set_title">
					<div class="top">
						<p class="mark">연구접수</p>
						<p class="title">${rchData.rsrSbjNm}</p>
					</div>
					<div class="info">
						<ul>
							<li>연구기간</li>
							<li>${rchData.rsrSdt} ~ ${rchData.rsrEdt}</li>
						</ul>
						<ul>
							<li>유형</li>
							<li>${rchData.rsrSpcdNm}</li>
						</ul>
						<ul>
							<li>신청자</li>
							<li>${rchData.prtiNm}/${rchData.dataAplpNm}</li>
						</ul>
						<ul>
							<li>신청일자</li>
							<li>${rchData.dataAplcYmd}</li>
						</ul>
					</div>
				</div>
				<div class="data_set_flow">
					<p class="title">심의절차</p>
					<!-- class="on" 활성화 | class="save" 완료 -->
					<ul>
					<c:forEach var="list" items="${list}" varStatus="rowInx">
						<li class="${list.stpSts == 'P' ? 'save' : ''} ${list.stpSts == 'C' ? 'on' : ''}">
							${list.rvwStpSpcdNm}
						</li>
					</c:forEach>
					</ul>
				</div>
				<div class="mission_doc_wrap">
					<div class="title">
						<p>연구자 제출서류</p>
					</div>
					<div class="info">
						<c:forEach var="item" items="${fileList}" varStatus="idx">
						<div class="item">
							<div class="left">
								<img src="/images/n_doc_icon.svg" alt="서류아이콘">
								<p class="txt">${item.attfCdnm}</p>
							</div>
							<a href="javascript:void(0)" onclick="javascript:downFile('${item.attfPthNm}','${item.attfStrNm}','${item.attfNm}');">다운로드</a>
						</div>
						</c:forEach>
					</div>
				</div>
				<div class="n_title_tb_wrap">
					<div class="title">
						<p>선택한 데이터</p>
					</div>
					<!-- 리얼그리드 영역 | 나중에 style 삭제요망-->
					<div class="grid_area_wrap" id="gridView" style="height: 300px; background-color: #F9F9F9; border: 1px solid #DDDDDD; color: red;"></div>
					<div class="n_grid_tb_btn">
						<div class="left">
							<a href="javascript:fnMoveToList()" class="line_gray">목록으로</a>
						</div>
						<div class="right">
							<a href="javascript:fnOpenRtn()" class="dk_red">반려</a>
							<a href="javascript:fnNext()" class="dk_blue">단계완료</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- class="on"시 반려사유 팝업 -->
<div id="rtnRgstLayerPop" class="ad_layer_popup">
	<div class="ad_popup_box">
		<a href="javascript:void(0)" class="kc_close btn"></a>
		<div class="title">
			<p>반려사유를 작성해 주세요</p>
		</div>
		<div class="popup_con">
			<div class="n_reject_wrap">
				<textarea rows="10" id="rjcRgstRsnCont"></textarea>
				<div class="ad_pop_btn">
					<a href="javascript:fnRgstRtn()" class="dk_blue">발송</a>
				</div>
			</div>
		</div>
	</div>
</div>