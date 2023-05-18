

<%
/* =================================================================
 * @FileName : ViewMypRscInfExtnPopup.jsp
 * @date: 2023.05.09
 * @author : parkgu
 * @설명 : 마이페이지 보관연장 신청
 * =================================================================
 * 수정일         작성자             내용
 * -----------------------------------------------------------------------
 * 2023.05.09     parkgu           파일생성
 * =================================================================
 */
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>

<script>

function fnInsertShowData(data) {
	//연구명
	$("#extnReqFrm #rsrSbjNm").text(data.rsrSbjNm);
	//연구기간
	$("#extnReqFrm #rsrDtm").text(data.rsrDtm);
	//가상화 사용기간
	$("#extnReqFrm #dtuDtm").text(data.dtuDtm);
	$("#extnReqFrm #dtuEdt").val(data.dtuEdt);
	$("#extnReqFrm #dtuSdt").val(data.dtuSdt);
	
	//보관기간
	$("#extnReqFrm #dataKepDtm").text(data.dataKepDtm);
	$("#extnReqFrm #dataKepSdt").val(data.dataKepSdt);
	$("#extnReqFrm #dataKepEdt").val(data.dataKepEdt);
	
	
	//가상화 환경선택
	//$("#aenvSpcd").val(data.aenvSpcd);
	//신청자
	$("#extnReqFrm #dataAplpUserNm").text(data.dataAplpUserNm);
	//
	//$("#vrtAnlsDvceCont").text(data.vrtAnlsDvceCont);
	//$("#vrtAnlsDvceContNm").text(data.vrtAnlsDvceContNm);
}


// 보관 / 연장 신청 팝업
function fnExtnPopup(dataAplcNo,rsrAsmtNo,extdStcd){
	//값초기화
	$('#extnReqFrm input,#extnReqFrm select,#extnReqFrm textarea').val('');
	//파일 리셋
	removeFile('13');
	removeFile('04');
	removeFile('12');
	
	$('#extnReqFrm #dataAplcNo').val(dataAplcNo);
	$('#extnReqFrm #rsrAsmtNo').val(rsrAsmtNo);
	$.ajax({
		type:"POST",
		url: "/portal/myp/rsc/inf/selectExtnPopup.do",
		dataType: "json",
		data:{"dataAplcNo" : dataAplcNo},
		success: function(resp){
			if(resp.extnPopup != null){
				/*
				"01"	"가상화사용연장신청"
				"02"	"보관연장신청"
				"03"	"재사용신청"
				"04"	"연구유효기간연장신청"
				*/
				$("#extnReqFrm .extdStcd_01,#extnReqFrm .extdStcd_02,#extnReqFrm .extdStcd_03,#extnReqFrm .extdStcd_04").hide();
				$('#extnReqFrm .extdStcd_'+extdStcd).show();
				//신청값셋팅
				$('#extdStcd').val(extdStcd);
				fnInsertShowData(resp.extnPopup);
				$('#extnReqFrm #extnRequestPopup').addClass('on')
			}else{
				return;
			}
		},
		err: function(err){
			console.log("err:", err);
		}
	});
}

//파일 삭제
function removeFile(fileType){
	$('#extnReqFrm #file'+fileType).val(''); // 파일명만 추출
	$('#extnReqFrm #fileName'+fileType).html('');
	$('#extnReqFrm #fileDiv'+fileType).removeClass('on');
}

//파일 선택후
function selectFileForm(fileType){
	$('#extnReqFrm #fileDiv'+fileType).addClass('on');
	var filename = $('#extnReqFrm #file'+fileType).val().split('/').pop().split('\\').pop(); // 파일명만 추출
	$('#extnReqFrm #fileName'+fileType).html(filename);
	
}


//신청 버튼 클릭시.
function reqSubmit(){
	
	if(!checkVal()){
		return;
	}
	
	let form = $("#extnReqFrm")[0];
    let formData = new FormData(form);
    
    var extdStcd = $('#extnReqFrm  #extdStcd').val();
    
	formData.append("file13", $("#extnReqFrm #file13")[0].files[0]);
	formData.append("file04", $("#extnReqFrm #file04")[0].files[0]);
	formData.append("file12", $("#extnReqFrm #file12")[0].files[0]);
    formData.append("extdStcd", extdStcd);
    
    $.ajax({
        type: "POST",
        url: "/portal/myp/rsc/inf/saveReqExit.do",
        enctype: "multipart/form-data",
        async: true,
        processData: false,
        contentType: false,
        data: formData,
        dataType:'json',
        success: function (result) {
        	alert("저장 되었습니다.");
        	$('#extnReqFrm #extnRequestPopup').removeClass('on');
        	//리스트 호출
        	var rsrAsmtNo = $('#extnReqFrm #rsrAsmtNo').val();
        	//값초기화
        	$('#extnReqFrm input,#extnReqFrm select,#extnReqFrm textarea').val('');
        	fnListReLoad(rsrAsmtNo);
        },

    });

}
//해당 리스트 재조회
function fnListReLoad(rsrAsmtNo){
	var targetSubList = $('#sub_list_'+rsrAsmtNo);
	//리스트 호출
	$.ajax({
		url: "/portal/myp/rsc/inf/viewExtnSubList.do",
		dataType: "html",
		data: {"rsrAsmtNo" : rsrAsmtNo},
		type: "POST",
		//async: false,
		success: function(response) {
			$('#list_btn_'+rsrAsmtNo).addClass("on");
			$(targetSubList ).html(response);
			$(targetSubList ).show();
		}
	});
}

//val check
function checkVal(){
	//연장구분
	var extdStcd = $('#extnReqFrm  #extdStcd').val();
	//01 가상화사용연장신청 시 값확인.
	//기간 확인 DTU_EDT 
	if(extdStcd == '01'){
		if($('#extnReqFrm  #mon_val').val() == '' && $('#extnReqFrm #week_val').val() == ''  && $('#extnReqFrm #day_val').val() == ''){
			 alert('요청기간을 선택해 주세요');
			 return false;
		}		
		
		//요청기간 체크
		var dtuEdt = $('#extnReqFrm #dtuEdt').val();
		//console.log("데이터활용기간 dtuEdt : ", dtuEdt );
		var checkDate = new Date(dtuEdt);	// 현재 날짜 및 시간
		//console.log("데이터활용기간 종료일자 : ", checkDate);
		//console.log("데이터활용기간 종료일자 : ", checkDate.getFullYear(),checkDate.getMonth()+1,checkDate.getDate());		
		var checkDateLater = new Date(checkDate.setMonth(checkDate.getMonth() + 3));	// 3개월후
		//console.log("3개월후 후 : ", checkDateLater.getFullYear(),checkDateLater.getMonth()+1,checkDateLater.getDate());
		
		checkDate = new Date(dtuEdt);
		//console.log("데이터활용기간 종료일자 확인 : ", checkDate,$('#mon_val').val());
		var inputDate =  new Date(checkDate.setMonth(checkDate.getMonth() + Number($('#extnReqFrm  #mon_val').val())));
		inputDate =  new Date(inputDate.setDate(inputDate.getDate() + Number($('#extnReqFrm  #week_val').val())*7 ));
		inputDate =  new Date(inputDate.setDate(inputDate.getDate() + Number($('#extnReqFrm  #day_val').val()) ));
		//console.log('inputDate : ', inputDate);
		//console.log('비교 : ', checkDateLater < inputDate);
		
		//연구기간 종료일보다 클수는 없다.
		
		//3개월 보다 클경우.
		if(checkDateLater < inputDate ){
		 alert('3개월 이하로 선택 가능합니다.');
		 	return false;
		}else{
			const yyyy = inputDate.getFullYear();
		    const mm = (inputDate.getMonth() + 1).toString().padStart(2, "0");
		    const dd = inputDate.getDate().toString().padStart(2, "0");
			$('#extnReqFrm #inputDtuEdt').val(yyyy+mm+dd);
		}		
		//감면율 선택 여부
		if($('#extnReqFrm #rdcRtSpcd').val() == ''){
			alert('감면율 항목을 선택해 주세요');
			return false;	
		}
		//감면율 첨부파일 체크
		if($('#extnReqFrm #file13').val() == ''){
			alert('감면율 파일을 선택해 주세요');
			return false;	
		}
	//02 : 보관연장신청
	}else if(extdStcd == '02'){
		//요청기간 end 데이트 확인.
		if($('#extnReqFrm  #dataKepEdtMonVal').val() == '' ){
			 alert('요청기간을 선택해 주세요');
			 return false;
		}
		
		var dataKepEdt = $('#extnReqFrm #dataKepEdt').val();
		//연구기간 종료일보다 클수는 없다. 
		
		
		var checkDate = new Date(dataKepEdt);
		//console.log("데이터활용기간 종료일자 확인 : ", checkDate,$('#mon_val').val());
		var inputDate =  new Date(checkDate.setMonth(checkDate.getMonth() + Number($('#extnReqFrm  #dataKepEdtMonVal').val())));
		const yyyy = inputDate.getFullYear();
	    const mm = (inputDate.getMonth() + 1).toString().padStart(2, "0");
	    const dd = inputDate.getDate().toString().padStart(2, "0");
// 	    alert(dataKepEdt);
// 	    alert(yyyy+mm+dd);
		$('#extnReqFrm #inputDataKepEdt').val(yyyy+mm+dd);
		
	//"03"	"재사용신청"
	}else if(extdStcd == '03'){
		if($('#extnReqFrm  #inputDtuSdt').val() == '' ){
			 alert('요청기간 시작일을 선택해 주세요');
			 return false;
		}
		
		if($('#extnReqFrm  #mon_val').val() == '' && $('#extnReqFrm #week_val').val() == ''  && $('#extnReqFrm #day_val').val() == ''){
			 alert('요청기간을 선택해 주세요');
			 return false;
		}	
		//감면율 선택 여부
		if($('#extnReqFrm #rdcRtSpcd').val() == ''){
			alert('감면율 항목을 선택해 주세요');
			return false;	
		}
		//감면율 첨부파일 체크
		if($('#extnReqFrm #file13').val() == ''){
			alert('감면율 파일을 선택해 주세요');
			return false;	
		}
		
		//3개월 체크
		//요청기간 체크
		var inputDtuSdt = $('#extnReqFrm #inputDtuSdt').val();
		console.log("데이터활용기간 inputDtuSdt : ", inputDtuSdt );
		var checkDate = new Date(inputDtuSdt);	// 현재 날짜 및 시간
		console.log("데이터활용기간 종료일자 : ", checkDate);
		console.log("데이터활용기간 종료일자 : ", checkDate.getFullYear(),checkDate.getMonth()+1,checkDate.getDate());		
		var checkDateLater = new Date(checkDate.setMonth(checkDate.getMonth() + 3));	// 3개월후
		console.log("3개월후 후 : ", checkDateLater.getFullYear(),checkDateLater.getMonth()+1,checkDateLater.getDate());
		
		checkDate = new Date(inputDtuSdt);
		console.log("데이터활용기간 종료일자 확인 : ", checkDate,$('#mon_val').val());
		var inputDate =  new Date(checkDate.setMonth(checkDate.getMonth() + Number($('#extnReqFrm  #mon_val').val())));
		inputDate =  new Date(inputDate.setDate(inputDate.getDate() + Number($('#extnReqFrm  #week_val').val())*7 ));
		inputDate =  new Date(inputDate.setDate(inputDate.getDate() + Number($('#extnReqFrm  #day_val').val()) ));
		console.log('inputDate : ', inputDate);
		console.log('inputDate : ', checkDateLater);
		console.log('비교 : ', checkDateLater < inputDate);
		
		//연구기간 종료일보다 클수는 없다.
		
		//3개월 보다 클경우.
		if(checkDateLater < inputDate ){
		 alert('3개월 이하로 선택 가능합니다.');
		 	return false;
		}else{
			const yyyy = inputDate.getFullYear();
		    const mm = (inputDate.getMonth() + 1).toString().padStart(2, "0");
		    const dd = inputDate.getDate().toString().padStart(2, "0");
			$('#extnReqFrm #inputDtuEdt').val(yyyy+mm+dd);
		}		
		
		
// 		"04"	"연구유효기간연장신청"
	}else if(extdStcd == '04'){
		//감면율 첨부파일 체크
		if($('#extnReqFrm #file04').val() == ''){
			alert('IRB연구계획서 파일을 선택해 주세요');
			return false;	
		}
		
		if($('#extnReqFrm #file12').val() == ''){
			alert('IRB결과통지서 파일을 선택해 주세요');
			return false;	
		}
		
		
	}
	//사유작성여부 확인
	if($('#extnReqFrm #extdAplcRsnCont').val() == ''){
		alert('사유를 작성해 주세요');
		return false;	
	}
	return true;
}
</script>
<form id="extnReqFrm" name="extnReqFrm" method="post" encType="multipart/form-data" onsubmit="return false;">
	<input type="hidden" id="dataAplcNo" name="dataAplcNo">
	<input type="hidden" id="rsrAsmtNo" name="rsrAsmtNo">
	
	<input type="hidden" id="dtuEdt" name="dtuEdt">
	<input type="hidden" id="dtuSdt" name="dtuSdt">
	
	<input type="hidden" id="dataKepSdt" name="dataKepSdt">
	<input type="hidden" id="dataKepEdt" name="dataKepEdt">
	
	
	
	<input type="hidden" id="inputDtuEdt" name="inputDtuEdt">
	<input type="hidden" id="inputDataKepEdt" name="inputDataKepEdt">
	
<!-- class="on"시 보관 / 연장 신청 팝업 -->
	<div id="extnRequestPopup" class="re_layer_popup">
		<div class="re_popup_box">
			<a href="javascript:void(0)" class="btn kc_close"></a>
			<div class="title">
				<p>보관 / 연장 신청</p>
			</div>
			<div class="popup_con">
				<div class="pop_tbl_inn">
					<div class="use_center_info type_01">
						<div class="top">
							<div class="item">
								<ul>
									<li>연구명</li>
									<li id="rsrSbjNm"></li>
								</ul>
							</div>
							<div class="n_table_info">
								<!-- 테이블 th의 텍스트가 가운데 정렬일 때 class명 type_02 추가 -->
								<div class="n_l_table type_02">
									<table>
										<tbody>
											<tr>
												<th>연구기간</th>
												<td id="rsrDtm"></td>
												<th>가상화 사용기간</th>
												<td id="dtuDtm"></td>
											</tr>
											<tr>
												<th>보관기간</th>
												<td id="dataKepDtm"></td>
												<th>가상화 재사용기간</th>
												<td id="rusDtm"></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
					<div class="user_info_inn">
						<div class="n_table_info">
							<div class="n_l_table type_02">
								<table>
									<tbody>
										<tr>
											<th>신청구분<span class="must">*</span></th>
											<td>
												<div class="item">
													<kcure:select id="extdStcd" name="extdStcd" grpCd="EXTD_STCD" defaultYn="false" attributes=" class=\"n_sel_l\" disabled=\"disabled\" "/>
													<!-- <span>최대20GB 보관 가능</span> -->
												</div>
											</td>
										</tr>
										<tr>
											<th>신청자</th>
											<td id="dataAplpUserNm" ></td>
										</tr>
										<tr class="extdStcd_01 extdStcd_03">
											<th>요청기간<span class="must">*</span></th>
											<td>
												<div class="date_int_inn">
													<input type="date" class="extdStcd_03 n_int_tm " id="inputDtuSdt" name="inputDtuSdt">
													<select id="mon_val" class="n_sel_l">
														<option value="">월</option>
															<c:forEach var="i" begin="1" end="3">
																<option value="${i}" >${i}개월</option>
															</c:forEach>
													</select>
													<select id="week_val" class="n_sel_l">
														<option value="">주</option>
															<c:forEach var="i" begin="1" end="4">
																<option value="${i}">${i}주</option>
															</c:forEach>
													</select>
													<select id="day_val" class="n_sel_l">
														<option value="">일</option>
															<c:forEach var="i" begin="1" end="5">
																<option value="${i}" >${i}일</option>
															</c:forEach>
													</select>
													<span>최대 3개월</span>
												</div>
											</td>
										</tr>
										<tr class="extdStcd_01 extdStcd_03">
											<th>감면율 <span class="must">*</span></th>
											<td>
												<div class="item">
													<select id="rdcRtSpcd" name="rdcRtSpcd" class="n_sel_l" title="감면율">
														<option value="">선택</option>
														<c:forEach var="list" items="${rdrtItemList}">
															<option value="${list.rdcRtSpcd}" <c:if test="${dataAplcSmry.rdcRtSpcd == list.rdcRtSpcd}">selected="selected"</c:if>>${list.rdcRtItemCont}</option>
														</c:forEach>
													</select>
												</div>
											</td>
										</tr>
										<tr class="extdStcd_01 extdStcd_03">
											<th>감면율 첨부파일<span class="must">*</span></th>
											<td>
												<!-- class="on" 추가시 파일찾기 사라지고 제거 나옴 -->
												<div id="fileDiv13" class="data_file_wrap">
													<ul>
														<li>
															<label for="file13">
																<span class="btn_upload">파일찾기</span>
																<input type="file" name="file13" id="file13" onchange="selectFileForm('13');" />
															</label>
														</li>
														<li>10MB 용량제한</li>
													</ul>
													<ul>
														<li id="fileName13"></li>
														<li>
															<a href="javascript:void(0)" onclick="removeFile(13);" class="del_btn">제거</a>
														</li>
													</ul>
												</div>
											</td>
										</tr>
										<tr class="extdStcd_02">
											<th>요청기간<span class="must">*</span></th>
											<td>
												<div class="date_int_inn">
													<!-- inputDataRndmKepEdt -->
													<select id="dataKepEdtMonVal" class="n_sel_l">
														<option value="">월</option>
															<option value="3" >3개월</option>
															<option value="6" >6개월</option>
															<option value="9" >7개월</option>
															<option value="12" >12개월</option>
													</select>
												</div>
											</td>
										</tr>
										
										<tr class="extdStcd_04">
											<th>IRB연구계획서<span class="must">*</span></th>
											<td>
												<!-- class="on" 추가시 파일찾기 사라지고 제거 나옴 -->
												<div id="fileDiv04" class="data_file_wrap">
													<ul>
														<li>
															<label for="file04">
																<span class="btn_upload">파일찾기</span>
																<input type="file" name="file04" id="file04" onchange="selectFileForm('04');" />
															</label>
														</li>
														<li>10MB 용량제한</li>
													</ul>
													<ul>
														<li id="fileName04"></li>
														<li>
															<a href="javascript:void(0)" onclick="removeFile(04);" class="del_btn">제거</a>
														</li>
													</ul>
												</div>
											</td>
										</tr>
										<tr class="extdStcd_04">
											<th>IRB결과통지서<span class="must">*</span></th>
											<td>
												<!-- class="on" 추가시 파일찾기 사라지고 제거 나옴 -->
												<div id="fileDiv12" class="data_file_wrap">
													<ul>
														<li>
															<label for="file12">
																<span class="btn_upload">파일찾기</span>
																<input type="file" name="file12" id="file12" onchange="selectFileForm('12');" />
															</label>
														</li>
														<li>10MB 용량제한</li>
													</ul>
													<ul>
														<li id="fileName12"></li>
														<li>
															<a href="javascript:void(0)" onclick="removeFile(12);" class="del_btn">제거</a>
														</li>
													</ul>
												</div>
											</td>
										</tr>
										
										<tr>
											<th>사유<span class="must">*</span></th>
											<td>
												<textarea id="extdAplcRsnCont" name="extdAplcRsnCont" class="n_text_l" rows="5" placeholder="1000자 이내 입력 가능"></textarea>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="pop_btn">
				<!-- 버튼이 두개일때 a테그 생성하면 자동으로 나옴 -->
				<a href="javascript:void(0)" onclick="reqSubmit()" class="n_l_btn n_bc_b_line">신청하기</a>
	<!-- 			<a href="javascript:void(0)" class="n_l_btn n_bc_b_line">확인</a> -->
			</div>
		</div>
	</div>
	</form>