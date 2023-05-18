<%
/* =================================================================
 * @FileName : ViewDataAplcRvw.jsp
 * @date: 2023.03.15
 * @author : bhs
 * @설명 : 제공기관 심의 화면
 * =================================================================
 * 수정일         작성자             내용
 * -----------------------------------------------------------------------
 * 2023.03.15     bhs           파일생성
 * =================================================================
 */
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>

<script type="text/javascript">
	$('body').addClass('admin');
</script>

<form id="moveFrm" name="moveFrm" method="post" style="display: none;">
	<input type="hidden"  name="dataAplcNo" value='<c:out value="${data.dataAplcNo}"/>'>
	<input type="hidden"  name="rvwTmpId" value='<c:out value="${data.rvwTmpId}"/>'>
	<input type="hidden" id="moveStpSpcd" name="rvwStpSpcd">
</form>

<form id="sendFrm" name="sendFrm" method="post" style="display: none;">
	<input type="hidden" id="dataAplcNo" name="dataAplcNo" value='<c:out value="${data.dataAplcNo}"/>'>
	<input type="hidden" id="rvwTmpId" name="rvwTmpId" value='<c:out value="${data.rvwTmpId}"/>'>
	<input type="hidden" id="rvwStpSpcd" name="rvwStpSpcd" value='<c:out value="${stpData.rvwStpSpcd}"/>'>
	<input type="hidden" id="rvwStpStcd" name="rvwStpStcd" value='<c:out value="${data.rvwStpStcd}"/>'>
	<input type="hidden" id="preSpcd" name="preSpcd" value='<c:out value="${stpData.preSpcd}"/>'>
	<input type="hidden" id="nextSpcd" name="nextSpcd" value='<c:out value="${stpData.nextSpcd}"/>'>
	<input type="hidden" id="lstStpSpcd" name="lstStpSpcd" value='<c:out value="${data.lstStpSpcd}"/>'>
</form>

<form id="srchFrm" name="srchFrm" method="post" style="display: none;">
	<input type="hidden" id="dataAplcNo" name="dataAplcNo" value='<c:out value="${data.dataAplcNo}"/>'>
	<input type="hidden" id="prtiId" name="prtiId" value="">
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
						<p class="mark">제공기관심의</p>
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
				<div class="n_title_tb_wrap">
					<div class="title">
						<p>제공기관 심의</p>
						<a href="javascript:fnOpenPop02()" class="dk_gray">검토서 작성</a>
					</div>
					<!-- 리얼그리드 영역 | 나중에 style 삭제요망-->
					<div class="grid_area_wrap" id="gridView" style="height: 300px; background-color: #F9F9F9; border: 1px solid #DDDDDD; color: red;"></div>
				</div>
				<div class="mission_doc_wrap">
					<div class="title">
						<p>연구자 제출서류</p>
						<a href="javascript:void(0)"></a>
					</div>
					<div class="info">
						<c:forEach var="item" items="${fileList}" varStatus="idx">
						<div class="item">
							<div class="left">
								<img src="/images/n_doc_icon.svg" alt="서류아이콘">
								<p class="txt">${item.attfNm}</p>
							</div>
							<a href="javascript:void(0)" onclick="javascript:downFile('${item.attfPthNm}','${item.attfStrNm}','${item.attfNm}');">다운로드</a>
						</div>
						</c:forEach>
					</div>

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

<!-- class="on"시 검토서 작성 팝업 -->
<form id="frmSubPrtiRgstTmplt" name="frmSubPrtiRgstTmplt">
	<input type="hidden" name="dataAplcNo" value="${data.dataAplcNo}">
	<input type="hidden" id="sndPrtiId" name="prtiId" value="">
	<div class="ad_layer_popup">
		<div class="ad_popup_box">
			<a href="javascript:void(0)" class="kc_close btn"></a>
			<div class="title">
				<p><span id="spRvwPrtiNm"></span> 심의결과</p>
			</div>
			<div class="popup_con">
				<div class="n_deliber_wrap">
					<div class="ad_pop_l_table">
						<table>
							<colgroup>
								<col style="width: 160px;">
								<col style="width: auto;">
							</colgroup>
							<tr>
								<th>연구명<span class="must">*</span></th>
								<td>${rchData.rsrSbjNm}</td>
							</tr>
							<tr>
								<th>종합의견<span class="must">*</span></th>
								<td>
									<div class="rd_chk">
										<label>
											<input type="radio" name="ovpSpcd" value="01">
											<span class="radio_mark"></span><span>가</span>
										</label>
										<label>
											<input type="radio" name="ovpSpcd" value="02">
											<span class="radio_mark"></span><span>조건부</span>
										</label>
										<label>
											<input type="radio" name="ovpSpcd" value="03">
											<span class="radio_mark"></span><span>부</span>
										</label>
									</div>
								</td>
							</tr>
							<tr>
								<th>종합의견<span class="must">*</span></th>
								<td>
									<textarea rows="4" name="ovpCont"></textarea>
								</td>
							</tr>
						</table>
					</div>
					<div class="ad_pop_l_table">
						<p class="point">*표시된 부분은 필수항목입니다.</p>
						<table>
							<colgroup>
								<col style="width: 160px;">
								<col style="width: auto;">
							</colgroup>

							<tr>
								<th>데이터 결합의<br>필요성<span class="must">*</span></th>
								<td><textarea name="dataCmbNcsCont"></textarea></td>
							</tr>
							<tr>
								<th>요청범위의<br>적절성<span class="must">*</span></th>
								<td><textarea name="reqRangCont"></textarea></td>
							</tr>
							<tr>
								<th>요청변수의<br>적절성<span class="must">*</span></th>
								<td><textarea name="reqVarCont"></textarea></td>
							</tr>
							<tr>
								<th>기타<span class="must"></span></th>
								<td><textarea name="etcConfCont"></textarea></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<div class="ad_pop_btn">
				<a href="javascript:fnSubRvwTmplt()" id="rgstBtn02" class="dk_blue">등록</a>
				<a href="javascript:fnClosePop02()" id="closeBtn02" class="line_gray">닫기</a>
			</div>
		</div>
	</div>
</form>

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

<script src="/js/kcure/portal/sys/dac/rvw/DacRvwView.js" ></script>


<script type="text/javascript">
	let _selectedRowIdx;

	$( document ).ready(function() {
		fnInitBtn();
	});


	/*
	* 버튼 초기화
	*/
	function fnInitBtn(){

	}

	/*
	* 제공기관 심의보기 닫기
	*/
	function fnClosePop02(){
		$("#rvwPrtiRgstLayerPop").removeClass('on');
	}

	/*
	* 제공기관 심의직접작성 오픈
	*/
	function fnOpenPop02(){
		var rows = _gridView.getCheckedRows(true);

		if(rows == ""){
			alert("심의기관을 선택해야 합니다.");
			return;
		}

		let checkVal = _dataProvider.getValue(rows, "isWcmplteYn");

		if(checkVal == "Y"){
			alert("이미 승인완료된 건 입니다.");
			return;
		}

		initTmplte();

		_selectedRowIdx = rows;

		let prtiIdVal =  _dataProvider.getValue(rows, "prtiId");
		let prtiNmVal =  _dataProvider.getValue(rows, "prtiNm");

		$("#sndPrtiId").val(prtiIdVal);
		$("#spRvwPrtiNm").text(prtiNmVal);

		$("#closeBtn02").css("display", "none");
		$("#rgstBtn02").css("display", "block");

		$("#rvwPrtiRgstLayerPop").addClass('on');
	}


	/*
	* 기관심의 결과보기
	*/
	function fnViewRstAprv(row){
		let dataAplcNoVal = $("#dataAplcNo").val();
		let prtiIdVal = _dataProvider.getValue(row, "prtiId");

		initTmplte();

		$.ajax({
			type:"POST",
			url:"/portal/sys/dac/rvw/selectRvwPrtiTmplt.do",
			data: {"dataAplcNo" : dataAplcNoVal, "prtiId" : prtiIdVal},
			dataType:'json',
			success:function(returnData){

			let resultData = returnData.resultData;
			let resultCode = returnData.resultCode;

			if(resultCode == "Y"){
				$("input:radio[name ='ovpSpcd']:input[value='" + resultData.ovpSpcd + "']").prop('checked', true);
				$("textarea[name=ovpCont]").val(resultData.ovpCont);
				$("textarea[name=dataCmbNcsCont]").val(resultData.dataCmbNcsCont);
				$("textarea[name=reqRangCont]").val(resultData.reqRangCont);
				$("textarea[name=reqVarCont]").val(resultData.reqVarCont);
				$("textarea[name=etcConfCont]").val(resultData.etcConfCont);

				$("#closeBtn02").css("display", "block");
				$("#rgstBtn02").css("display", "none");

				$("#rvwPrtiRgstLayerPop").addClass('on');
			}
	      }
		});
	}

	/*
	* 기관심의 등록
	*/
	function fnSubRvwTmplt(){
		if(inputValid()){
			let formData = $("#frmSubPrtiRgstTmplt").serialize();

			$.ajax({
				type:"POST",
				url:"/portal/sys/dac/rvw/saveRvwPrtiTmplt.do",
				data: formData,
				dataType:'json',
				success:function(returnData){

				let resultCode = returnData.resultCode;

				if(resultCode == "Y"){
					_dataProvider.setValue(_selectedRowIdx, "isWcmplteYn", "Y");
					$("#rvwPrtiRgstLayerPop").removeClass('on');
				}
		      }
			});
		}
	}

	function fnMoveToList() {
		document.location.href = "/portal/sys/dac/rvw/viewDataAplcRvw.do";
	}

	/*
	* 반려사유(등록) 팝업오픈
	*/
	function fnOpenRtn(){
		$("#rtnRgstLayerPop").addClass('on');
	}

	/*
	* 반려사유 저장
	*/
	function fnRgstRtn(){
		let rjcRgstRsnCont = $("#rjcRgstRsnCont").val();
		let dataAplcNo = $("#dataAplcNo").val();
		let rvwStpSpcd = $("#rvwStpSpcd").val();

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
						"rvwStpSpcd"	: rvwStpSpcd
					 },
			dataType:'json',
			success:function(returnData){

			let resultCode = returnData.resultCode;

			if(resultCode == "Y"){
				$("#rtnRgstLayerPop").removeClass('on');
				$("#rvwStpStcd").val("RP03");
				fnInitBtn();
			}
	      }
		});
	}

	/*
	* 심의 입력유효성 체크
	*/
	function inputValid(){
		let ovpSpcdVal = $('input[name="ovpSpcd"]:checked').val();
		let ovpContVal = $('textarea[name="ovpCont"]').val();
		let dataCmbNcsContVal = $('textarea[name="dataCmbNcsCont"]').val();
		let reqRangContVal = $('textarea[name="reqRangCont"]').val();
		let reqVarContVal = $('textarea[name="reqVarCont"]').val();

		if(ovpSpcdVal == undefined){
			alert("종합의견 구분을 선택해주세요");
			return false;
		}
		if(ovpContVal == ""){
			alert("종합의견을 입력해주세요");
			return false;
		}
		if(dataCmbNcsContVal == ""){
			alert("데이터 결합필요성을 입력해주세요");
			return false;
		}
		if(reqRangContVal == ""){
			alert("요청번위 내용을 입력해주세요");
			return false;
		}
		if(reqVarContVal == ""){
			alert("요청변수 내용을 입력해주세요");
			return false;
		}

		return true;
	}

	/*
	* 심의양식 초기화
	*/
	function initTmplte(){
		$('input:radio[name="ovpSpcd"]').prop('checked', false);
		$("textarea[name=ovpCont]").val("");
		$("textarea[name=dataCmbNcsCont]").val("");
		$("textarea[name=reqRangCont]").val("");
		$("textarea[name=reqVarCont]").val("");
		$("textarea[name=etcConfCont]").val("");
	}


	/* 파일 다운로드  */
	function downFile(attfPthNm,attfStrNm,attfNm){
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
		let rowCnt = _dataProvider.getRowCount();
		let validProc = true;

		if($("#rvwStpStcd").val() == "RP03"){
			return;
		}

		for(let k=0;k<rowCnt;k++){
			let comp = _dataProvider.getValue(k, "isWcmplteYn");
			if(comp == "N"){
				alert("심의완료가 안된 신청건이 있습니다.");
				validProc = false;
				break;
			}
		}

		if(validProc){
			let url = '/portal/sys/dac/rvw/saveRevPrti.do';
			$("#sendFrm").attr('action', url).submit();
		}
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
