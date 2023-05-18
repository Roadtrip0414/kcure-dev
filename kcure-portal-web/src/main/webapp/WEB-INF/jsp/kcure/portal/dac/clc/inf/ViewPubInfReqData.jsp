
<%
/* =================================================================
* @FileName : ViewPubInfReqData
* @date: 2023. 4. 14.
* @author : bhs
* @설명 : 데이터신청 > 자료요청(공공)
* =================================================================
* 수정일 작성자 내용
* -----------------------------------------------------------------------
* 2023. 4. 14. bhs 파일생성
* =================================================================
*/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>


<div class="wrap">
		<div class="sub_visual_wrap">
			<div class="data_request">
				<ul>
					<li>공공 데이터 신청</li>
				</ul>
			</div>
		</div>
		<div class="n_data_apply_wrap">
			<div class="con">
				<%@include file="/WEB-INF/jsp/kcure/portal/dac/clc/inf/ViewClcInfNav.jsp"%>
				<div class="n_data_write_wrap">
					<div class="n_data_req_wrap">
						<div class="title">
							<h3>자료요청</h3>
							<p>데이터 결합에 필요한 데이터 제공기관 및 해당 데이터셋을 선택하고 엑셀 양식을 다운로드 받아 주세요. 엑셀양식에서 원하는 변수 항목을 체크하고 엑셀 파일을 업로드 해주세요.</p>
						</div>
						<div class="data_search">
							<div class="left">
								<div class="top">
									<p class="title">데이터 제공기관</p>
									
									<div class="scroll">
										<c:forEach var="list" items="${treeList}" varStatus="rowInx">
											<c:if test="${list.itemLvl eq 1}">
												<div class="public">
													<p class="sub">${list.itemNm1}</p>
													<ul>
														<c:forEach var="list2" items="${treeList}" varStatus="rowInx2">
															<c:if test="${list2.itemLvl eq 2}">
																<li>
																	<a href="javascript:fnGetDtslist('${list2.parentItemCd}', '${list2.itemKey}', '${list2.itemCd}')" class="divPrtiItem" data1="${list2.parentItemCd}" data2="${list2.itemKey}" data3="${list2.itemNm2}">
																		${list2.itemNm1}
																	</a>
																</li>
															</c:if>
														</c:forEach>
													</ul>
												</div>
											</c:if>											
										</c:forEach>
									</div>
									
								</div>
							</div>
							
							<div class="right">
								<p class="title">데이터셋</p>
								<div class="item"  id="divDtsTree"></div>	
							</div>
							
						</div>
					</div>
					<div class="n_table_info">
						<div class="title">
							<h3 style="font-size: 18px !important;">선택한 항목</h3>	
							<div class="btn"></div>		
						</div>
						<div class="grid_area_wrap" id="gridView" style="height: 300px; background-color: #F9F9F9; border: 1px solid #DDDDDD; color: red;"></div>
					</div>
				</div>
				<div class="n_table_r_btn">
					<a href="javascript:preBack()" class="n_m_btn n_bc_blue_dk">이전</a>
					<c:if test="${clcInfReserchVo.dtapStatSpcd ne '0000000017'}">						
						<a href="javascript:fnTempSave()" class="n_m_btn n_bc_b_line">임시저장</a>
						<a href="javascript:fnNext()" class="n_m_btn n_bc_blue_dk">다음</a>
					</c:if>
				</div>
			</div>
		</div>
	</div>


	<input type="hidden" id="selectedGubun" value=""/>

	<form id="frmDownExcel">
		<input type="hidden" id="selectGubunVal" name="gubun" />
		<input type="hidden" id="selectPrtiIdVal" name="prtiId" />
		<input type="hidden" id="selectPrtiNmVal" name="prtiNm" />
		<input type="hidden" id="dtsArray" name="dtsArray"/>
	</form>

	<form id="frmUpExcel" name="frmUpExcel" method="post" encType="multipart/form-data" onsubmit="return false;">
		 <div style="display:none;">
	          <input type="file" id="excelFile" name="excelFile" onchange="fnUploadExcelFile(this)" accept=".xls, .xlsx" />
	          <input type="hidden" id="excelDtsLclsCdVal" name="excelDtsLclsCdVal"/>
	          <input type="hidden" id="excelPrtiIdVal" name="excelPrtiId"/>
	          <input type="hidden" id="excelDataTpcd" name="excelDataTpcd"  value="${clcInfReserchVo.dataTpcd}"/>
	          <input type="hidden" id="dataAplcNoVal" name="excelDataAplcNo" value="${clcInfReserchVo.dataAplcNo}"/>
	          <input type="hidden" id="excelGubunVal" name="excelGubun" value=""/>
	     </div>
    </form>

    <form id="frmReqDts">
    	<input type="hidden" id="dataTpcd" name="dataTpcd"  value="${clcInfReserchVo.dataTpcd}"/>
    	<input type="hidden" id="pblDtsSpcd" name="pblDtsSpcd"  value="${clcInfReserchVo.pblDtsSpcd}"/>
    	<input type="hidden" id="dtapStatSpcd" name="dtapStatSpcd"  value="${clcInfReserchVo.dtapStatSpcd}"/>
		<input type="hidden" id="dataAplcNoParam" name="dataAplcNo"  value="${clcInfReserchVo.dataAplcNo}"/>
		<input type="hidden" id="currentAplcStpSpcd" value="${clcInfReserchVo.aplcStpSpcd}"/>
		<input type="hidden" id="histDataArray" name="histDataArray"/>
    </form>

<script src="/js/kcure/portal/clc/inf/ClcInfReq.js" ></script>

<script type="text/javascript">

	$( document ).ready(function() {
		
		$('.divPrtiItem').click(function() {
			if($("#dtapStatSpcd").val() == "0000000017"){
				return;
			}
			
		    $('li').removeClass('on');
		    $(this).closest('li').addClass('on');
		 });
		
		$('input[name="data_set"]').change(function(){
		    var selectedValue = $('input[name="data_set"]:checked').val();
		    fnCheckDts3(selectedValue);
		});

		$(".divPrtiItem").on("click", function() {
			$("#selectGubunVal").val($(this).attr('data1'));
			$("#selectPrtiIdVal").val($(this).attr('data2'));
			$("#excelPrtiIdVal").val($(this).attr('data2'));
			$("#selectPrtiNmVal").val($(this).attr('data3'));

			if($('.divPrtiItem').hasClass('on') == true ){
				$('.divPrtiItem').removeClass('on');
				$(this).addClass('on');
			}else{
				$(this).addClass('on');
			}
		});

		//이전 데이터 요청
		fnGetHistDtslist();
	});


	//데이터 유형 선택
	function fnSetDataTp(obj){
		$("input[name='dataTpcd']").val(obj);
	}


	/*
	* 데이터셋 서브리스트 펼치기
	*/
	function fnOpenSub(id){
		let selUl = $("#jid_"+ id);

		if(selUl.css("display") == "none") {
			selUl.css("display", "block");
			setTimeout(() => fnInitChcekbox(), 100);
		}else{
			selUl.css("display", "none");
		}
	}

	/*
	* 데이터셋 리스트 가져오기
	*/
	function fnGetDtslist(gubun, prtiId){		
		if($("#dtapStatSpcd").val() == "0000000017"){
			return;
		}
		
		$("#selectedGubun").val(gubun);
		let pblDtsSpcd = $("#pblDtsSpcd").val();

		$.ajax({
			type:"POST",
			url:"/portal/dac/clc/inf/selectDtsTreeList.do",
			data:{"prtiId" : prtiId, "gubun" : gubun, "pblDtsSpcd" : pblDtsSpcd},
			dataType:'json',
			success:function(returnData){

			let resultList = returnData.dtsTreeList;
			let resultCnt = returnData.dtsTreeCnt;

			$("#divDtsTree").empty();

			if(resultCnt > 0){
				let html =  '<ul class="">';

				for(let i=0;i<resultCnt;i++){
					if(resultList[i].itemLvl == "1"){
						if(resultList[i].itemLvl == "1"){
							html += '<div class="list">'
							html += '<a href="javascript:fnOpenSub('+ i +')" class="rep">'
							html += '<label class="n_checkbox_s">'
							html += '<input type="checkbox" id="lnm_' + i + '" onchange="fnCheckDts1(' + i + ', ' + resultList[i].pblDtsSpcd + ')" value="'+resultList[i].pblDtsSpcd+'">'
							html += '<span><span class="check_img"></span></span>'
							html += '</label>'
							html += '<span class="txt">'
							html += resultList[i].itemNm1
							html += '</span>'
							html += '</a>'	
							
							html += '<div class="drop">'
							//html += '<ul>'
							
							html += '<ul id="jid_' + i + '">'
							
							for(let k=0;k<resultCnt;k++){
								if(resultList[k].itemLvl == "2" && resultList[i].itemCd == resultList[k].parentItemCd){
									html += '<li>'
									html += '<label class="re_checkbox_s">'
									html += '<input type="checkbox" '
									if(resultList[k].holdYn == "N"){
										html += 'disabled'
									}
									html += ' id="'+ 'sid_' + resultList[k].itemNm3 + '_' + resultList[k].itemCd +'" name="' + 'snm_' + resultList[k].itemNm3 + '_' + i + '" data="'+ resultList[k].holdYn +'" data1="' + resultList[k].dtsLclsCd +'" value="' + resultList[k].itemKey + '|' +  resultList[k].itemCd + '|' + resultList[k].itemNm2  + '" onclick="fnCheckDts2(event)">'
									html += '<span><span class="check_img"></span>'
									if(resultList[k].holdYn == "N"){
										html += '<font style="color:#bdb7b7;">'
									}
									html += resultList[k].itemNm1
									if(resultList[k].holdYn == "N"){
										html += '</font>'
									}
									html += '</span></label>'
									html += '</li>'
								}
							}

							html += '</ul>'
							html += '</div>'
							html += '</div>'
						}
					}
				}

				$("#divDtsTree").append(html);

				setTimeout(() => {
					  if ($("#selectedGubun").val() == "01") {
						 fnInitPubChcekbox();
					  } else {
						 fnInitChcekbox();
					  }
					}, 100);
			}
	      }
		});
	}

	/*
	* 데이터셋 히스토리 리스트 가져오기
	*/
	function fnGetHistDtslist(){
		$.ajax({
			type:"POST",
			url:"/portal/dac/clc/inf/selectAplDtsHistList.do",
			data:{"dataAplcNo" : $("#dataAplcNoParam").val()},
			dataType:'json',
			success:function(returnData){

			let resultList = returnData.list;
			let resultCnt = returnData.listCnt;

			if(resultCnt > 0){
				for(let i=0;i<resultList.length;i++){
					
					if(resultList[i].gubun == "공공"){
						fnAddGridHistoryPubData(resultList[i].dtslclscd, resultList[i].gubun, resultList[i].pritnm, resultList[i].prtiid, resultList[i].pritnm, resultList[i].dtslclscd, resultList[i].dtsknm, resultList[i].attfnm, resultList[i].attfseq, resultList[i].histdatayn);
					}else{
						let dtsEnmArray =  resultList[i].dtsenm.split("|");
						let dtsKnmArray =  resultList[i].dtsknm.split("|");

						if(dtsKnmArray.length > 0){
							for(let k=0;k<dtsKnmArray.length;k++){
								fnAddGridHistoryData(resultList[i].dtslclscd, resultList[i].gubun, resultList[i].pritnm, resultList[i].prtiid, resultList[i].pritnm, dtsEnmArray[k], dtsKnmArray[k], resultList[i].attfnm, resultList[i].attfseq, resultList[i].histdatayn);								
							}
						}
					}
					
				}
			}
	      }
		});
	}
	
	function fnAddGridHistoryPubData(dtsLclsCd, gubun, prtiNm, prtiId, prtiNm, dtsId, dtsNm, attFnm, attfSeqVal, histDataYn) {
		var rowCnt = _dataProvider.getRowCount();

		let idVal = "";
		
		if(dtsLclsCd == "05"){
			 idVal = "lnm_0";
		}else if(dtsLclsCd == "06"){
			 idVal = "lnm_0";
		}else if(dtsLclsCd == "07"){
			 idVal = "lnm_1";
		}else if(dtsLclsCd == "08"){
			 idVal = "lnm_2";
		}else if(dtsLclsCd == "09"){
			 idVal = "lnm_3";
		}else if(dtsLclsCd == "10"){
			 idVal = "lnm_4";
		}else if(dtsLclsCd == "11"){
			 idVal = "lnm_5";
		}

		let gubunVal = gubun;
		let dtsLclsCdVal = dtsLclsCd;
		let prtiIdVal = prtiId;
		let prtiNmVal = prtiNm;
		let dtsIdVal = dtsId;
		let dtsNmVal = dtsNm;
		let histDataVal = histDataYn;
		
		values = {dtsLclsCd: dtsLclsCdVal, selectId: idVal, gubun: gubunVal, prtiNm: prtiNmVal, prtiId: prtiIdVal, dtsId: dtsIdVal, dtsNm: dtsNmVal, isUpload: "Y", attfSeq: attfSeqVal, uploadFileNm: attFnm, histDataYn: histDataVal};

		dataRow = _dataProvider.addRow(values);

		btnSetRowHeight();

		_gridView.refresh();
	}

	/*
	* 히스토리 데이터셋 그리드 적용
	*/
	function fnAddGridHistoryData(dtsLclsCd, gubun, prtiNm, prtiId, prtiNm, dtsId, dtsNm, attFnm, attfSeqVal, histDataYn) {
		var rowCnt = _dataProvider.getRowCount();

		let idVal = "sid_" + prtiId + "_" + dtsId;
		let gubunVal = gubun;
		let dtsLclsCdVal = dtsLclsCd;
		let prtiIdVal = prtiId;
		let prtiNmVal = prtiNm;
		let dtsIdVal = dtsId;
		let dtsNmVal = dtsNm;
		let histDataVal = histDataYn;
		
		dtsNmVal = dtsNm + ' ( ' + dtsId + ' )';

		values = {dtsLclsCd: dtsLclsCdVal, selectId: idVal, gubun: gubunVal, prtiNm: prtiNmVal, prtiId: prtiIdVal, dtsId: dtsIdVal, dtsNm: dtsNmVal, isUpload: "Y", attfSeq: attfSeqVal, uploadFileNm: attFnm, histDataYn: histDataVal};

		let isEx = false;

		for(let k=0;k<rowCnt;k++){
			let checkData = _dataProvider.getValue(k, "prtiId");
			if(checkData == prtiIdVal){
				let tmp1Val = _dataProvider.getValue(k, 'dtsNm');
				tmp1Val = tmp1Val + "\n" + dtsNmVal;
				_dataProvider.setValue(k, 'dtsNm', tmp1Val);

				let tmp2Val = _dataProvider.getValue(k, 'dtsId');
				tmp2Val = tmp2Val + "|" + dtsIdVal;
				_dataProvider.setValue(k, 'dtsId', tmp2Val);

				let tmp3Val = _dataProvider.getValue(k, 'selectId');
				tmp3Val = tmp3Val + "|" + idVal;
				_dataProvider.setValue(k, 'selectId', tmp3Val);

				isEx = true;
				break;
			}
		}

		if(!isEx){
			dataRow = _dataProvider.addRow(values);
		}

		btnSetRowHeight();

		_gridView.refresh();
	}

	/*
	* 데이터셋 대분류 체크박스 이벤트
	*/
	function fnCheckDts1(id){
		if($("#dtapStatSpcd").val() == "0000000017"){
			return;
		}
		
		//공공 데이터셋 체크박스 선택처리
		if($("#selectedGubun").val() == "01"){
			
			var rowCnt = _dataProvider.getRowCount();
			
			var gubunVal = "공공";
			var dtsIdVal = "";
			var dtsNmVal = "";
			var prtiNmVal = "국립암센터";
			var prtiIdVal = "M0019";
			var idVal = "lnm_" + id;
			
			//공공 데이터셋 체크상태인 경우
			if($("#" + idVal).prop("checked")){
				if(id == "0") {
					if($("#pblDtsSpcd").val() == "01"){
						dtsNmVal = "암공공_표본_전체";
						dtsIdVal = "06";
					}else{
						dtsNmVal = "암공공_맞춤";
						dtsIdVal = "05";
					}
				}else if(id == "1"){
					dtsNmVal = "암공공_표본_위암";
					dtsIdVal = "07";
				}else if(id=="2"){
					dtsNmVal = "암공공_표본_유방암";
					dtsIdVal = "08";
				}else if(id=="3"){
					dtsNmVal = "암공공_표본_병기_위암";
					dtsIdVal = "09";
				}else if(id == "4"){
					dtsNmVal = "암공공_표본_병기_유방암";
					dtsIdVal = "10";
				}else if(id == "5"){
					dtsNmVal = "암공공_표본_병기_대장암";
					dtsIdVal = "11";
				}
				
				for(let k=0;k<rowCnt;k++){
					let comp = _dataProvider.getValue(k, "dtsId");
					if(comp == dtsIdVal){
						return;
					}
				}
				
				fnAddGridSelectedPubData(dtsIdVal, idVal, gubunVal, gubunVal, prtiIdVal, prtiNmVal, dtsIdVal, dtsNmVal);
			}
			//체크해제인 경우
			else{
				var rowCnt = _dataProvider.getRowCount();

				for(let k=0;k<rowCnt;k++){
					let comp = _dataProvider.getValue(k, "selectId");
					if(comp == idVal){
						if(_dataProvider.getValue(k, "isUpload") == "Y"){
							alert("해당 데이터는 이미 업로드처리된 상태입니다.\n업로드데이터를 제거 후 시도해주세요!");
							$("#"+idVal).prop("checked", true);
							return;
						}
						_dataProvider.removeRow(k);

						break;
					}
				}
			}
		}
		//임상 데이터셋 체크박스 선택처리
		else
		{
			if($('input:checkbox[id="lnm_' + id + '"]').is(":checked") == true){
				var rowCnt = _dataProvider.getRowCount();

				for(let k=0;k<rowCnt;k++){
					let comp = _dataProvider.getValue(k, "selectId");
					if(comp == $("#selectPrtiIdVal").val()){
						if(_dataProvider.getValue(k, "isUpload") == "Y"){
							alert("해당 데이터는 이미 업로드처리된 상태입니다.\n업로드데이터를 제거 후 시도해주세요!");
							$('input:checkbox[id="lnm_' + id + '"]').prop("checked", false);
							return;
						}
					}
				}

				$('input:checkbox[name="snm_'+ $("#selectPrtiIdVal").val() + '_' + id+'"]').each(function() {
					if($(this).attr("data") == "Y"){
						this.checked = true;
					}
				});
			}else{
				var rowCnt = _dataProvider.getRowCount();

				for(let k=0;k<rowCnt;k++){
					let comp = _dataProvider.getValue(k, "prtiId");
					if(comp == $("#selectPrtiIdVal").val()){
						if(_dataProvider.getValue(k, "isUpload") == "Y"){
							alert("해당 데이터는 이미 업로드처리된 상태입니다.\n업로드데이터를 제거 후 시도해주세요!");
							$('input:checkbox[id="lnm_' + id + '"]').prop("checked", true);
							return;
						}
					}
				}

				$('input:checkbox[name="snm_' + $("#selectPrtiIdVal").val() + '_' + id +'"]').each(function() {
					if($(this).attr("data") == "Y"){
						this.checked = false;
					}
				});
			}

			//전체선택 체크 or 미체크시 해당 참여기관 기선택 그리드데이터 일괄삭제 초기화
			if($('input:checkbox[id="lnm_' + id + '"]').is(":checked") == true){
				var rowCnt = _dataProvider.getRowCount();

				for(let k=0;k<rowCnt;k++){
					let comp = _dataProvider.getValue(k, "prtiId");
					if(comp == $("#selectPrtiIdVal").val()){
						if(_dataProvider.getValue(k, "isUpload") == "Y"){
							$('input:checkbox[name="snm_' + $("#selectPrtiIdVal").val() + '_' + id +'"]').each(function() {
								this.checked = false;
							});
							alert("해당 데이터는 이미 업로드처리된 상태입니다.\n업로드데이터를 제거 후 시도해주세요!");
							return;
						}
						break;
					}
				}

				//체크된 데이터셋 일괄 그리드 적용
				$('input:checkbox[name="snm_' +  $("#selectPrtiIdVal").val() + '_' + id + '"]:checked').each(function(idx){
					fnAddGridSelectedData($(this).attr('data1'), $(this).attr('id'), $(this).val(), $("#selectGubunVal").val(), $("#selectPrtiIdVal").val(), $("#selectPrtiNmVal").val(), "all");
				});
			}else{
				var rowCnt = _dataProvider.getRowCount();

				for(let k=0;k<rowCnt;k++){
					let comp = _dataProvider.getValue(k, "prtiId");
					if(comp == $("#selectPrtiIdVal").val()){
						_dataProvider.removeRow(k);

						$('input:checkbox[name*="snm_' +  $("#selectPrtiIdVal").val() + '_"]:checked').each(function(idx){
							fnAddGridSelectedData($(this).attr('data1'),$(this).attr('id'), $(this).val(), $("#selectGubunVal").val(), $("#selectPrtiIdVal").val(), $("#selectPrtiNmVal").val(), "all");
						});
						break;
					}
				}
			}
		}
	}


	/*
	* 데이터셋 중분류 체크박스 이벤트
	* gubun | dtsId | dtsNm
	*/
	function fnCheckDts2(event){
		if($("#dtapStatSpcd").val() == "0000000017"){
			return;
		}
		
		var total, checked;
		var tmpArray = new Array();

		if(event.target.checked){
			var rowCnt = _dataProvider.getRowCount();

			for(let k=0;k<rowCnt;k++){
				let comp = _dataProvider.getValue(k, "prtiId");
				if(comp == $("#selectPrtiIdVal").val()){
					if(_dataProvider.getValue(k, "isUpload") == "Y"){
						alert("해당 데이터는 이미 업로드처리된 상태입니다.\n업로드데이터를 제거 후 시도해주세요!");
						$('input:checkbox[id="' + event.target.id + '"]').prop("checked", false);
						return;
					}
				}
			}

			$('input:checkbox[name="' + event.target.name + '"]:checked').each(function(idx){
				//상위체크박스 초기화
				total = $("input:checkbox[name="+ event.target.name + "]:not(:disabled)").length;
				checked = $("input:checkbox[name="+ event.target.name +"]:checked").length;
				tmpArray = event.target.name.split('_');

				if(total != checked) $('input:checkbox[id="lnm_' + tmpArray[2] + '"]').prop("checked", false);
				else $('input:checkbox[id="lnm_' + tmpArray[2] + '"]').prop("checked", true);
			});

			fnAddGridSelectedData(event.target.data1, event.target.id, event.target.value, $("#selectGubunVal").val(), $("#selectPrtiIdVal").val(), $("#selectPrtiNmVal").val());
		}else{
			//개별체크 해제시 기등록 참여기관 데이터 일괄삭제 초기화처리 후 체크된 데이터 일괄적용
			var rowCnt = _dataProvider.getRowCount();

			for(let k=0;k<rowCnt;k++){
				let comp = _dataProvider.getValue(k, "prtiId");
				if(comp == $("#selectPrtiIdVal").val()){
					if(_dataProvider.getValue(k, "isUpload") == "Y"){
						alert("해당 데이터는 이미 업로드처리된 상태입니다.\n업로드데이터를 제거 후 시도해주세요!");
						$('input:checkbox[id="' + event.target.id + '"]').prop("checked", true);
						return;
					}
					_dataProvider.removeRow(k);

					break;
				}
			}

			$('input:checkbox[name*="snm_' + $("#selectPrtiIdVal").val() + '_"]:checked').each(function(idx){
				fnAddGridSelectedData($(this).attr('data1'), $(this).attr('id'), $(this).val(), $("#selectGubunVal").val(), $("#selectPrtiIdVal").val(), $("#selectPrtiNmVal").val(), "all");
			});

			//상위체크박스 초기화
			total = $("input:checkbox[name="+ event.target.name + "]:not(:disabled)").length;
			checked = $("input:checkbox[name="+ event.target.name +"]:checked").length;
			tmpArray = event.target.name.split('_');

			if(total != checked) $('input:checkbox[id="lnm_' + tmpArray[2] + '"]').prop("checked", false);
		}
	}

	function btnSetRowHeight() {
		  _gridView.displayOptions.rowHeight = -1;
		  _gridView.displayOptions.minRowHeight = 36;
	}

	/*
	* 엑셀 템플릿 다운로드
	*/
	function fnDownloadExcel() {
		if($("#dtapStatSpcd").val() == "0000000017"){
			return;
		}
		
		let selectedRows = _gridView.getSelectedRows();

		let prtiIdVal = _dataProvider.getValue(selectedRows, "prtiId");
		let prtiNmVal = _dataProvider.getValue(selectedRows, "prtiNm");
		let dtsIdVal = _dataProvider.getValue(selectedRows, "dtsId");
		let gubunVal = _dataProvider.getValue(selectedRows, "gubun");

		$("#selectPrtiIdVal").val(prtiIdVal);
		$("#selectPrtiNmVal").val(prtiNmVal);
		$("#dtsArray").val(dtsIdVal);
		$("#selectGubunVal").val(gubunVal)
		
		let url = "";
		
		if(gubunVal == "공공"){
			url = '/portal/dac/clc/inf/filedownTemplte02.do';
		}else{
			url = '/portal/dac/clc/inf/filedownTemplte01.do';
		}

 		$("#frmDownExcel").attr('action', url).submit();
	}

	/*
	* 엑셀파일 여부 체크
	*/
    function checkFileType(filePath) {
        let fileFmt = filePath.split(".");
        if (fileFmt.indexOf("xlsx") > -1 || fileFmt.indexOf("xls") > -1) {
            return true;
        } else {
            return false;
        }
    }

	/*
	* 엑셀 템플릿 업로드 이벤트
	*/
	function fnUploadExcel(){
		if($("#dtapStatSpcd").val() == "0000000017"){
			return;
		}
		$("#excelFile").click();
	}

	/*
	* 엑셀 템플릿 업로드
	*/
	function fnUploadExcelFile(){
		if($("#dtapStatSpcd").val() == "0000000017"){
			return;
		}
		
		let selectedRows = _gridView.getSelectedRows();
		let gubunVal = _dataProvider.getValue(selectedRows, "gubun");
		
		$("#excelDtsLclsCdVal").val(_dataProvider.getValue(selectedRows, "dtsLclsCd"));
		$("#excelPrtiIdVal").val(_dataProvider.getValue(selectedRows, "prtiId"));
		$("#excelGubunVal").val(_dataProvider.getValue(selectedRows, "gubun"));

		let filePath = $("#excelFile").val();
		let fileValue = filePath.split("\\");
		let fileNm = fileValue[fileValue.length-1]; // 파일명

        if (filePath == "" || filePath == null) {
            alert("엑셀 파일을 선택해주세요.");
            $("#excelFile").focus();
            return false;
        } else if (!checkFileType(filePath)) {
            alert("엑셀 파일만 업로드 가능합니다.");
            $("#excelFile").val("");
            return false;
        }

        let urlStr = "";
        
        if(gubunVal == "공공"){
			urlStr = '/portal/dac/clc/inf/uploadTemplte02.do';
		}else{
			urlStr = '/portal/dac/clc/inf/uploadTemplte01.do';
		}
        
        let form = $("#frmUpExcel")[0];
        let formData = new FormData(form);
        formData.append("file", $("#excelFile")[0].files[0]);

        $.ajax({
            type: "POST",
            url: urlStr,
            enctype: "multipart/form-data",
            async: true,
            processData: false,
            contentType: false,
            data: formData,
            dataType:'json',
            success: function (result) {
                if (result.resultCode == "Y") {
                	_dataProvider.setValue(selectedRows, "uploadFileNm", fileNm);
            		_dataProvider.setValue(selectedRows, "isUpload", "Y");
            		_dataProvider.setValue(selectedRows, "attfSeq", result.attfSeq);
            		alert("업로드 되었습니다.");
                } else {
                    alert(result.message);
                }
            },
            beforeSend:function(){
            	$("#loading_box").addClass('on')
            },
            complete:function(){
            	$("#loading_box").removeClass('on')
            }
        });
        $("#excelFile").val("");
	}

	/*
	* 엑셀 템플릿 삭제
	*/
	function fnDeleteExcel(){
		if($("#dtapStatSpcd").val() == "0000000017"){
			return;
		}
		
		let selectedRows = _gridView.getSelectedRows();

		let histDataVal =  _dataProvider.getValue(selectedRows, "histDataYn");
		let prtiIdVal =  _dataProvider.getValue(selectedRows, "prtiId");
		let attfSeqVal = _dataProvider.getValue(selectedRows, "attfSeq");
		let dtsLclsCdVal =  _dataProvider.getValue(selectedRows, "dtsLclsCd");
		let gubunVal =  _dataProvider.getValue(selectedRows, "gubun");
		let currentSpcd = $("#currentAplcStpSpcd").val();
		let dataAplcNoVal =  $("#dataAplcNoVal").val();

		$.ajax({
			type:"POST",
			url:"/portal/dac/clc/inf/deleteAplcTmpDts.do",
			data:{"prtiId" : prtiIdVal, "dataAplcNo" : dataAplcNoVal, "attfSeq" : attfSeqVal, "dtsLclsCd": dtsLclsCdVal, "gubun": gubunVal, "histDataYn" : histDataVal, "currentSpcd" : currentSpcd},
			dataType:'json',
			success: function (result) {
                if (result.resultCode == "Y") {
                	//ajax성공시 업로드여부 초기화
            		_dataProvider.setValue(selectedRows, "isUpload", "N");
            		alert("제거 되었습니다.");
                } else {
                    alert(result.message);
                }
            },
            beforeSend:function(){
            	$("#loading_box").addClass('on')
            },
            complete:function(){
            	$("#loading_box").removeClass('on')
            }
		});
	}

	/*
	* 테이터셋 로우 삭제
	*/
	function fnRemoveDts(){
		if($("#dtapStatSpcd").val() == "0000000017"){
			return;
		}
		
		let selectedRows = _gridView.getSelectedRows();
		let isUploadVal = _dataProvider.getValue(selectedRows, "isUpload");
		let gubunVal = _dataProvider.getValue(selectedRows, "gubun");
		let dtsIdVal = _dataProvider.getValue(selectedRows, "dtsId");

		if(isUploadVal == "Y"){
			alert("해당 데이터는 이미 업로드처리된 상태입니다.\n업로드데이터를 제거 후 시도해주세요!");
			return;
		}else{
			if(gubunVal == "공공"){
				fnDelInitPubChcekbox(selectedRows);
			}else{
				fnDelInitChcekbox(selectedRows);
			}
			_dataProvider.removeRow(selectedRows);
		}
	}

	/*
	* 데이터셋 선택영역 그리드 적용
	*/
	function fnAddGridSelectedData(dlCd, id, datas, data1, data2, data3, flag) {
		var rowCnt = _dataProvider.getRowCount();

		let dataArray = datas.split('|');

		let idVal = id;
		let gubunVal = data1 == '01' ? '공공' : '임상';
		let prtiNmVal = data3;
		let prtiIdVal = data2;
		let dtsIdVal = dataArray[1];
		let dtsNmVal = dataArray[2] + ' ( ' + dataArray[1] + ' )';

		values = {dtsLclsCd: dlCd, selectId: idVal, gubun: gubunVal, prtiNm: prtiNmVal, prtiId: prtiIdVal, dtsId: dtsIdVal, dtsNm: dtsNmVal, histDataYn: "N"};

		let isEx = false;

		for(let k=0;k<rowCnt;k++){
			let checkData = _dataProvider.getValue(k, "prtiId");
			if(checkData == prtiIdVal){
				let tmp1Val = _dataProvider.getValue(k, 'dtsNm');
				tmp1Val = tmp1Val + "\n" + dtsNmVal;
				_dataProvider.setValue(k, 'dtsNm', tmp1Val);

				let tmp2Val = _dataProvider.getValue(k, 'dtsId');
				tmp2Val = tmp2Val + "|" + dtsIdVal;
				_dataProvider.setValue(k, 'dtsId', tmp2Val);

				let tmp3Val = _dataProvider.getValue(k, 'selectId');
				tmp3Val = tmp3Val + "|" + idVal;
				_dataProvider.setValue(k, 'selectId', tmp3Val);

				isEx = true;
				break;
			}
		}

		if(!isEx){
			dataRow = _dataProvider.addRow(values);
		}

		btnSetRowHeight();

		_gridView.refresh();
	}
	
	/*
	* 데이터셋(공공) 선택영역 그리드 적용
	*/
	function fnAddGridSelectedPubData(dlCd, id, datas, data1, data2, data3, data4, data5) {
		var rowCnt = _dataProvider.getRowCount();

		let dataArray = datas.split('|');

		let idVal = id;
		let gubunVal = data1;
		let prtiNmVal = data3;
		let prtiIdVal = data2;
		let dtsIdVal = data4;
		let dtsNmVal = data5;

		values = {dtsLclsCd: dlCd, selectId: idVal, gubun: gubunVal, prtiNm: prtiNmVal, prtiId: prtiIdVal, dtsId: dtsIdVal, dtsNm: dtsNmVal, histDataYn: "N"};

		dataRow = _dataProvider.addRow(values);

		btnSetRowHeight();

		_gridView.refresh();
	}

	
	/*
	* 선택 공공 데이터셋 기준 체크박스 초기화
	*/
	function fnInitPubChcekbox(){
		var rowCnt = _dataProvider.getRowCount();
		var gubunVal;
		var selectIdVal;

		if(rowCnt > 0){
			for(let i=0;i<rowCnt;i++){
				gubunVal = _dataProvider.getValue(i, "gubun");
				selectIdVal = _dataProvider.getValue(i, "selectId");

				if(gubunVal == "공공"){
					$("#" + selectIdVal).prop("checked", true);
				}
			}
		}
	}
	
	/*
	* 선택 임상 데이터셋 기준 체크박스 초기화
	*/
	function fnInitChcekbox(){
		var rowCnt = _dataProvider.getRowCount();
		var tmpSeletorVal;
		var tmpSelectorArray1 = new Array();
		var tmpSelectorArray2 = new Array();
		var total = 0;
		var checked = 0;

		if(rowCnt > 0){
			var selectIdValTmp = "";

			for(let i=0;i<rowCnt;i++){
				selectIdValTmp += _dataProvider.getValue(i, "selectId");
				selectIdValTmp += "|";
			}

			var selectIdArray = selectIdValTmp.split("|");

			for(let i=0;i<selectIdArray.length;i++){

				tmpSelectorArray2 = selectIdArray[i].split('_');

				if(tmpSelectorArray2[1] == $("#selectPrtiIdVal").val()){
					$('input:checkbox[id="' + selectIdArray[i] + '"]').prop("checked", true);
					tmpSelectorArray1 = $('input:checkbox[id="' + selectIdArray[i] + '"]').parents('ul').attr('id').split('_');

					//상위체크박스 초기화
					total = $("input:checkbox[name=snm_"+ $("#selectPrtiIdVal").val() + "_" + tmpSelectorArray1[1] +"]:not(:disabled)").length;
					checked = $("input:checkbox[name=snm_"+ $("#selectPrtiIdVal").val() + "_" + tmpSelectorArray1[1] +"]:checked").length;

					if(total != checked) $('input:checkbox[id="lnm_' + tmpSelectorArray1[1] + '"]').prop("checked", false);
					else $('input:checkbox[id="lnm_' + tmpSelectorArray1[1] + '"]').prop("checked", true);
				}
			}
		}
	}

	/*
	* 선택 임상 데이터셋 삭제기준 체크박스 초기화
	*/
	function fnDelInitChcekbox(rowIdx){
		var selectIdValTmp = _dataProvider.getValue(rowIdx, "selectId");
		var selectIdArray = selectIdValTmp.split("|");
		var tmpSelectorArray1 = new Array();

		var tmpSelectorArray2 = selectIdArray[0].split('_');

		if(tmpSelectorArray2[1] == $("#selectPrtiIdVal").val()){
			for(let i=0;i<selectIdArray.length;i++){
				//하위체크박스 초기화
				$('input:checkbox[id="' + selectIdArray[i] + '"]').prop("checked", false);
				//상위체크박스 초기화
				var tmpObj = $('input:checkbox[id="' + selectIdArray[i] + '"]').parents('ul').attr('id');
				//트리 이동시 오류 체크로직
				if(tmpObj !== undefined){
					tmpSelectorArray1 = tmpObj.split('_');
					$('input:checkbox[id="lnm_' + tmpSelectorArray1[1] + '"]').prop("checked", false);
				}
			}
		}
	}
	
	/*
	* 선택 공공 데이터셋 삭제기준 체크박스 초기화
	*/
	function fnDelInitPubChcekbox(rowIdx){
		var selectIdVal = _dataProvider.getValue(rowIdx, "selectId");
		$("#" + selectIdVal).prop("checked", false);
	}

	/*
	* 제출이벤트
	*/
	function fnNext(){
		if($("#dtapStatSpcd").val() == "0000000017"){
			return;
		}
		
		var rowCnt = _dataProvider.getRowCount();
		var histDatas = "";

		if(rowCnt == 0){
			alert("선택된 데이터항목이 없습니다.");
			return;
		}else{
			for(let i=0;i<rowCnt;i++){
				let checkVal = _dataProvider.getValue(i, "isUpload");
				if(checkVal !== "Y"){
					alert("선택항목은 엑셀업로드가 되어야 합니다.");
					return;
				}

				let histDataYn = _dataProvider.getValue(i, "histDataYn");
				if(histDataYn == "Y"){
					histDatas += _dataProvider.getValue(i, "prtiId")
					histDatas += ","
				}
			}

			$("#histDataArray").val(histDatas);

			let url = '/portal/dac/clc/inf/saveClcInfReqData.do';
			$("#frmReqDts").attr('action', url).submit();
		}
	}
	
	/*
	* 임시저장 이벤트
	*/
	function fnTempSave(){
		if($("#dtapStatSpcd").val() == "0000000017"){
			return;
		}
		
		$('#frmReqDts').attr("action","/portal/dac/clc/inf/saveTmpClcInfReqData.do").submit();
	}
	
	/*
	* 이전가기 이벤트
	*/
	function preBack(){
		$('#frmReqDts').attr("action","/portal/dac/clc/inf/viewClcInfRsp.do").submit();
	}

</script>



<style>
	.multi-line-css {
	  padding-top: 10px !important;
	  padding-bottom: 10px;
	  text-align: left;
	  white-space: pre;
	  background: #ff8b00;
	}
	.rg-renderer {
	 margin-top: 15px;
	 margin-bottom: 15px;
	 max-height: fit-content !important;
	}
	.rg-body {
	 over-flow: auto !important;
	}
</style>

<!-- title 및 navi -->
<%@include file="/WEB-INF/jsp/kcure/portal/dac/clc/inf/clcInfCommon.jsp"%>