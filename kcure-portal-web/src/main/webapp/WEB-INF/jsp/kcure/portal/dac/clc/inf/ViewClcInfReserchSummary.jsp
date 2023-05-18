<%
/* =================================================================
* @FileName : ViewClcInfReserchSummary.jsp
* @date: 2023. 4. 14.
* @author : hjjeon
* @설명 : 서류작성 및 가상화 환경 선택
* =================================================================
* 수정일 작성자 내용
* -----------------------------------------------------------------------
* 2023. 4. 14. hjjeon 파일생성
* =================================================================
*/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>
<script type="text/javascript">
$(document).ready(function() {

	//정책유형
	$("#rsrSpcd").on("change", function(){
		if($(this).val() == "01"){ //정책연구일 경우
			$("#policyType").show();
			$("#plcrsrInstNm").addClass("required");
			$("#plcrsrDeptNm").addClass("required");
		}else{
			$("#policyType").hide();
			$("#plcrsrInstNm").val("");
			$("#plcrsrDeptNm").val("");
			$("#plcrsrInstNm").removeClass("required");
			$("#plcrsrDeptNm").removeClass("required");
		}
	});

	var rtnMonth = $("#useDtrnMnthVl").val() + "개월";
	var rtnWeek = $("#useDtrnMainVl").val() + "주";
	var rtnDay = $("#useDtrnDayVl").val() + "일";
	var m = parseInt($("#useDtrnMnthVl").val()) * 30;
	var w = parseInt($("#useDtrnMainVl").val()) * 7;
	var d = parseInt($("#useDtrnDayVl").val());

	//사용시작 예정일 셋팅
	$("#dszApdt").on("change", function(){
		var selDt = new Date($(this).val());
		var rsrSdt = new Date($("#rsrSdt").val());
		rsrSdt.setMonth(rsrSdt.getMonth() + 2);

		if(rsrSdt > selDt){
			alert("신청일로부터 2개월 이후로 선택해주세요.");
			$(this).val("");
			return;
		}else{
			var t = m+w+d;
			selDt.setDate(selDt.getDate()+t);
			$("#useDtrnEndDt").html(selDt.getFullYear() + "-" + lpad((selDt.getMonth()+1),2,'0') + "-" + lpad(selDt.getDate(),2,'0'));
		}
	});

	$("#useDtrnMnthVl, #useDtrnMainVl, #useDtrnDayVl").on("change", function(){
		var dszApdt = $("#dszApdt").val();
		if(dszApdt != ''){
			if($(this).attr("id") == "useDtrnMnthVl"){
				m = parseInt($(this).val()) * 30;
				rtnMonth = $(this).val() + "개월";
			}
			if($(this).attr("id") == "useDtrnMainVl"){
				if($(this).val() == "4"){
					m+=30;
				}else{
					w = parseInt($(this).val()) * 7;
				}
				rtnWeek = $(this).val() + "주";
			}
			if($(this).attr("id") == "useDtrnDayVl"){
				d = parseInt($(this).val());
				rtnDay = $(this).val() + "일";
			}
			var t = m+w+d;

			if(t > 180){
				alert("최대 사용기간이 6개월입니다. 다시 선택해주세요.");
				$(this).val("0");

				if($(this).attr("id") == "useDtrnMnthVl"){
					rtnMonth = "0개월";
				}
				if($(this).attr("id") == "useDtrnMainVl"){
					rtnWeek = "0주";
				}
				if($(this).attr("id") == "useDtrnDayVl"){
					rtnDay = "0일";
				}

				$(this).focus();
				$("#totalUseDt").html(rtnMonth + " " + rtnWeek + " " + rtnDay);
				return;
			}else{
				$("input[name='dtapUseDcnt']").val(t);
				var rsrEdt = new Date($("#rsrEdt").val());	//연구종료일
				$("#totalUseDt").html(rtnMonth + " " + rtnWeek + " " + rtnDay);

				dszApdt = new Date(dszApdt);
				dszApdt.setDate(dszApdt.getDate()+t);

				if(rsrEdt < dszApdt){
					alert("연구 종료일보다 클 수 없습니다. 다시 선택해주세요.");
					$(this).val("0");
					if($(this).attr("id") == "useDtrnMnthVl"){
						rtnMonth = "0개월";
					}
					if($(this).attr("id") == "useDtrnMainVl"){
						rtnWeek = "0주";
					}
					if($(this).attr("id") == "useDtrnDayVl"){
						rtnDay = "0일";
					}

					$(this).focus();
					$("#totalUseDt").html(rtnMonth + " " + rtnWeek + " " + rtnDay);
					return;
				}
				$("#useDtrnEndDt").html(dszApdt.getFullYear() + "-" + lpad((dszApdt.getMonth()+1),2,'0') + "-" + lpad(dszApdt.getDate(),2,'0'));
			}
		}else{
			alert("가상화환경 사용시작 예정일을 먼저 선택해주세요.");
			$(this).val("0");
			$("#dszApdt").focus();
			return;
		}

	});

	//폐쇄분석형 선택
	$("input[name='aenvSpcd']").on("change", function(){
		if($(this).val() == "01"){
			$("#vrtAnlsDvceSpcd6").parent().show();
			$("#vrtAnlsDvceSpcd7").parent().show();
		}else{
			$('input:checkbox[id="vrtAnlsDvceSpcd6"]').prop("checked", false);
			$('input:checkbox[id="vrtAnlsDvceSpcd7"]').prop("checked", false);
			$("#vrtAnlsDvceSpcd6").parent().hide();
			$("#vrtAnlsDvceSpcd7").parent().hide();
		}
	});

	$("#rdcRtSpcd").on("change", function(){
		if($(this).val() == "RDRT99"){
			$("#file13").prop("disabled", true);
		}else{
			$("#file13").prop("disabled", false);
		}
	});

	//초기 데이터 셋팅
	var totalDt = 0;
	var totalUseDt = "";
	var useDtrnMnthVl = $("#useDtrnMnthVl").val();

	if(useDtrnMnthVl != ''){
		totalUseDt = useDtrnMnthVl + "개월";
	}
	var useDtrnMainVl = $("#useDtrnMainVl").val();
	if(useDtrnMainVl != ''){
		totalUseDt += useDtrnMainVl + "주";
	}
	var useDtrnDayVl = $("#useDtrnDayVl").val();
	if(useDtrnDayVl != ''){
		totalUseDt += useDtrnDayVl + "일";
	}
	$("#totalUseDt").html(totalUseDt);

	if(parseInt(useDtrnMainVl) < 4){
		totalDt = (parseInt(useDtrnMnthVl) * 30) + (parseInt(useDtrnMainVl) * 7) +(parseInt(useDtrnDayVl))
	}else{
		totalDt = ((parseInt(useDtrnMnthVl)+1) * 30) +(parseInt(useDtrnDayVl))
	}
	var dszApdt = $("#dszApdt").val();
	if(dszApdt != ''){
		dszApdt = new Date(dszApdt);
		dszApdt.setDate(dszApdt.getDate()+totalDt);
		$("#useDtrnEndDt").html(dszApdt.getFullYear() + "-" + lpad((dszApdt.getMonth()+1),2,'0') + "-" + lpad(dszApdt.getDate(),2,'0'));
	}

	var vrtAnlsDvceCont = $("input[name='vrtAnlsDvceCont']").val();
	if(vrtAnlsDvceCont != ''){
		vrtAnlsDvceCont = vrtAnlsDvceCont.split(",");

		vrtAnlsDvceCont.forEach(function(el, index){
			$("input[name=vrtAnlsDvceSpcd][value="+el+"]").prop("checked",true);
		});
	}

	//연구계획서
	<c:if test = "${clcInfFile04 != null && clcInfFile04.dataAplcNo != '' }">
	var target = {attfPthNm:'${clcInfFile04.attfPthNm}'
					,attfStrNm:'${clcInfFile04.attfStrNm}'
					,attfNm:'${clcInfFile04.attfNm}'
					};

	makeFileList(target,"04");
	</c:if>

	//결과 통지서
	<c:if test = "${clcInfFile12 != null && clcInfFile12.dataAplcNo != '' }">
	var target = {attfPthNm:'${clcInfFile12.attfPthNm}'
					,attfStrNm:'${clcInfFile12.attfStrNm}'
					,attfNm:'${clcInfFile12.attfNm}'
					};

	makeFileList(target,"12");
	</c:if>

	//감면율 첨부파일
	<c:if test = "${clcInfFile13 != null && clcInfFile13.dataAplcNo != '' }">
	var target = {attfPthNm:'${clcInfFile13.attfPthNm}'
					,attfStrNm:'${clcInfFile13.attfStrNm}'
					,attfNm:'${clcInfFile13.attfNm}'
					};

	makeFileList(target,"13");
	</c:if>

});

//유효성 체크
function fnValidationChk(){
	var get_input = $("[class*=required]");
	var chk = true;

	$.each(get_input, function () {
		if($(this).prop("tagName") == "SELECT"){
			if($(this).val() == "" || $(this).val() == null){
				chk = false;
				alert( $(this).attr("title") + "을(를) 선택해주세요." );
				$(this).focus();
				return false;
			}
		}else if($(this).attr("type") == "radio"){
			if(typeof $("input[name='"+$(this).attr("name")+"']:checked").val() == "undefined"){
				chk = false;
				alert( $(this).attr("title") + "을(를) 선택해주세요." );
				$(this).focus();
				return false;
			}
		}else if($(this).attr("type") == "date"){
			if($(this).val() == "" || $(this).val() == null){
				chk = false;
				alert( $(this).attr("title") + "을(를) 입력해주세요." );
				$(this).focus();
				return false;
			}
		}else if($(this).attr("type") == "text"){
			if($(this).val() == "" || $(this).val() == null){
				chk = false;
				alert( $(this).attr("title") + "을(를) 입력해주세요." );
				$(this).focus();
				return false;
			}
		}
	});

	return chk;
}

function preReserch(){
	$('#researchForm').attr("action","/portal/dac/clc/inf/viewClcInfTermAgree.do").submit();
}

//저장
function saveReserch(){
	if(fnValidationChk()){
		if(researchForm.rsrSdt.value > researchForm.rsrEdt.value){
	        alert("연구기간의 시작일자는 종료일자보다 클 수 없습니다.");
	        return false;
	  	}

		if(researchForm.file04 !=null &&!researchForm.file04.value){
			alert("제출서류 연구계획서를 업로드 해주세요");
	        return false;
		}

		if(researchForm.file12 !=null &&!researchForm.file12.value){
			alert("제출서류 IRB결과통지서를 업로드 해주세요");
	        return false;
		}

		//가상화사용기간선택 필수체크
		if($("#useDtrnMnthVl").val() == "0" && $("#useDtrnMainVl").val() == "0" && $("#useDtrnDayVl").val() == "0"){
			alert("가상화 사용기간을 선택 해주세요.");
	        return false;
		}

		//가상화분석도구 선택 필수 체크
		if($("input[name='vrtAnlsDvceSpcd']:checked").length == 0){
			alert("가상화분석도구를 선택 해주세요.");
	        return false;
		}

		if(researchForm.file13 !=null &&!researchForm.file13.value){
			if($("#rdcRtSpcd").val() != '' && $("#rdcRtSpcd").val() != "RDRT99"){
				alert("제출서류 감면율 첨부파일를 업로드 해주세요");
		        return false;
			}
		}

		var vrtAnlsDvceSpcd = "";
		var vrtAnlsDvceSpcdSize = $("input[name='vrtAnlsDvceSpcd']:checked").length;
		$("input[name='vrtAnlsDvceSpcd']:checked").each(function(index){
			if($(this).is(":checked")){
				vrtAnlsDvceSpcd += $(this).val();
				if(index < vrtAnlsDvceSpcdSize-1){
					vrtAnlsDvceSpcd += ","
				}
			}
		});
		$("input[name='vrtAnlsDvceCont']").val(vrtAnlsDvceSpcd);
		$("input[name='saveGb']").val("02");
		$('#researchForm').attr("action","/portal/dac/clc/inf/saveClcInfReserch01.do").submit();
	}
}

//임시저장
function tempSave(){
	var vrtAnlsDvceSpcd = "";
	var vrtAnlsDvceSpcdSize = $("input[name='vrtAnlsDvceSpcd']:checked").length;
	$("input[name='vrtAnlsDvceSpcd']:checked").each(function(index){
		if($(this).is(":checked")){
			vrtAnlsDvceSpcd += $(this).val();
			if(index < vrtAnlsDvceSpcdSize-1){
				vrtAnlsDvceSpcd += ","
			}
		}
	});
	$("input[name='vrtAnlsDvceCont']").val(vrtAnlsDvceSpcd);
	$("input[name='saveGb']").val("01");
	$('#researchForm').attr("action","/portal/dac/clc/inf/saveClcInfReserch01.do").submit();
}

//업로드 파일 제거
function removeFile(fileType){
	var html = '';

	html += `

		<label for="file`+fileType+`" >
			<span class="btn_upload n_bc_gray_dk">파일찾기</span>
			<input type="file" name="file`+fileType+`" id="file`+fileType+`" onchange="selectFileForm('`+fileType+`');">
		</label>


	`;

	$('#file_type_'+fileType).html(html);
	$('#file_type_'+fileType).show();

	$('#file_type_'+fileType+'_list').html('');
	$('#file_type_'+fileType+'_list').hide();

}

//파일 선택후
function selectFileForm(fileType,htmlRemoveYn,html){
	if(htmlRemoveYn == 'Y'){
		//삭제 여부
		$('#file_type_'+fileType ).html('');
	}
	$('#file_type_'+fileType ).hide();
	//html 삽입여부
	if(html){
		$('#file_type_'+fileType +'_list').html(html);
	}else{
		var filename = $('#file'+fileType).val().split('/').pop().split('\\').pop(); // 파일명만 추출
		var fileHtml = filename +`<a href="#" onclick="javascript:removeFile('`+fileType +`');return false;" class="n_s_btn n_bc_gray_line">삭제</a>`;
		$('#file_type_'+fileType +'_list').html(fileHtml)
	}
	$('#file_type_'+fileType+'_list').show();
}

function makeFileList(target,fileType){
	var html =`
		<a href="#" onclick="javascript:downFile('`+target.attfPthNm +`','`+target.attfStrNm +`','`+target.attfNm +`');return false;">`+target.attfNm +`</a>
		<a href="#" onclick="javascript:removeFile('`+fileType +`');return false;" class="n_s_btn n_bc_gray_line">삭제</a>
		`;
	selectFileForm(fileType,'Y',html);
}

/* 파일 다운로드  */
function downFile(attfPthNm,attfStrNm,attfNm){
	$('#downLoadFilefrm #attfPthNm').val(attfPthNm);
	$('#downLoadFilefrm #attfStrNm').val(attfStrNm);
	$('#downLoadFilefrm #attfNm').val(attfNm);
	$('#downLoadFilefrm').attr("action", "/portal/dac/clc/inf/serviceFileDown.do");
	$('#downLoadFilefrm').submit();

}
</script>
<div class="wrap">
	<div class="sub_visual_wrap">
		<div class="data_request">
			<ul>
				<li><c:out value="${clcInfReserchVo.dataTpcdNm}"/> 데이터 신청</li>
			</ul>
		</div>
	</div>
	<div class="n_data_apply_wrap">
		<div class="con">
			<%@include file="/WEB-INF/jsp/kcure/portal/dac/clc/inf/ViewClcInfNav.jsp"%>
			<form name="researchForm" id="researchForm" method="post" enctype="multipart/form-data" >
				<input type="hidden" name="dataTpcd" value="${clcInfReserchVo.dataTpcd}"/>
				<input type="hidden" name="dataAplcNo" value="${clcInfReserchVo.dataAplcNo}"/>
				<input type="hidden" name="saveGb" value=""/>
				<input type="hidden" name="dtapUseDcnt" value="0"/>
				<input type="hidden" name="vrtAnlsDvceCont" value="${dataAplcSmry.vrtAnlsDvceCont}"/>
				<div class="n_data_write_wrap">
					<div class="n_table_info">
						<div class="title">
							<h3>신청유형</h3>
						</div>
						<div class="n_l_table">
							<table>
								<tbody>
									<c:if test="${clcInfReserchVo.dataTpcd == '02'}">
									<tr>
										<th>데이터 유형 *</th>
										<td colspan="3">
											<div class="item">
												<kcure:radio2 name="pblDtsSpcd" grpCd="PBL_DTS_SPCD" defaultValue="${clcInfReserchVo.pblDtsSpcd}" attributes=" class=\"required\"  title=\"데이터 유형\" " />
											</div>
										</td>
									</tr>
									</c:if>
									<tr>
										<th>
											신청자 유형 *
											<div class="tool_tip_wrap">
												<div class="icon_w">?</div>
												<div class="txt">
													<p>정부부처: 정부의 부와 처</p>
													<p>공공기관: 정부의 출연·출자 또는 정부의 재정지원 등으로 설립·운영되는 기</p>
													<p>공공연구기관: 연구 개발과 관련된 법인ㆍ단체로서 대통령령이 정한 기관</p>
													<p>참여기관: 의료데이터 중심병원 사업 참여기관</p>
													<p>기타: 그 외 기관</p>
												</div>
											</div>
										</th>
										<td>
											<div class="item">
												<kcure:select id="aplpTypeSpcd" name="aplpTypeSpcd" grpCd="APLP_TYPE_SPCD" defaultText="선택" attributes=" class=\"n_sel_s required\"  title=\"신청자 유형\" " selected="${clcInfReserchVo.aplpTypeSpcd}" />
											</div>
										</td>
										<th>연구 유형 *
											<div class="tool_tip_wrap">
												<div class="txt">
													<p>연구유형 설명</p>
												</div>
											</div>
										</th>
										<td>
											<div class="item">
												<kcure:select id="rsrSpcd" name="rsrSpcd" grpCd="RSR_SPCD" defaultText="선택" attributes=" class=\"n_sel_s required\"  title=\"연구유형\" " selected="${clcInfReserchVo.rsrSpcd}"/>
											</div>
										</td>
									</tr>
									<tr id="policyType" <c:if test="${clcInfReserchVo.rsrSpcd != '01'}">style="display: none;"</c:if>>
										<th>정책연구 *</th>
										<td colspan="3">
											<div class="item">
												<input type="text" id="plcrsrInstNm" name="plcrsrInstNm" value="${clcInfReserchVo.plcrsrInstNm}" title="정책 연구 기관명" placeholder="기관명을 입력하세요" class="n_int_s" maxlength="100" style="width: 300px;"/>
												<input type="text" id="plcrsrDeptNm" name="plcrsrDeptNm" value="${clcInfReserchVo.plcrsrDeptNm}" title="정책 연구 부서명" placeholder="부서명을 입력하세요" class="n_int_s" maxlength="100" style="width: 300px;"/>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="n_table_info">
						<div class="title">
							<h3>IRB</h3>
						</div>
						<div class="n_l_table">
							<table>
								<tbody>
									<tr>
										<th>IRB 연구기간 *</th>
										<td colspan="3">
											<div class="date">
												<input type="date" id="rsrSdt" name="rsrSdt" value="${clcInfReserchVo.rsrSdt}" title="IRB 연구기간" class="n_int_s required" />
												<span>~</span>
												<input type="date" id="rsrEdt" name="rsrEdt" value="${clcInfReserchVo.rsrEdt}" title="IRB 연구기간" class="n_int_s required" />
											</div>
										</td>
									</tr>
									<tr>
										<th>IRB 승인번호 *</th>
										<td>
											<div class="item">
												<input type="text" id="irbNo" name="irbNo" value="${clcInfReserchVo.irbNo}" title="IRB 승인번호" class="n_int_s required" maxlength="100" />
											</div>
										</td>
										<th>IRB승인기관 *</th>
										<td>
											<div class="item">
												<input type="text" id="irbApriNm" name="irbApriNm" value="${clcInfReserchVo.irbApriNm}" title="IRB 승인기관" class="n_int_s required" maxlength="200"/>
											</div>
										</td>
									</tr>
									<tr>
										<th>IRB 연구계획서 *</th>
										<td>
											<div class="item" id="file_type_04">
<!-- 												<input class="n_int_s" type="text" placeholder="파일선택"> -->
												<label for="file04">
													<span class="btn_upload n_bc_gray_dk">파일찾기</span>
													<input type="file" name="file04" id="file04" onchange="selectFileForm('04');"/>
												</label>
											</div>
											<div class="item" id="file_type_04_list" style="display: none;"></div>
										</td>
										<th>IRB결과통지서 *</th>
										<td>
											<div class="item" id="file_type_12">
<!-- 												<input class="n_int_s" type="text" placeholder="파일선택"> -->
												<label for="file12">
													<span class="btn_upload n_bc_gray_dk">파일찾기</span>
													<input type="file" name="file12" id="file12" onchange="selectFileForm('12');"/>
												</label>
											</div>
											<div class="item" id="file_type_12_list" style="display: none;"></div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="n_table_info">
						<div class="title">
							<h3>
								가상화환경
								<a href="javascript:void(0)" class="view_btn">예상비용 보기</a>
							</h3>
						</div>
						<div class="n_l_table">
							<table>
								<tbody>
									<tr>
										<th>
											가상화환경선택 *
											<div class="tool_tip_wrap">
												<div class="icon_w">?</div>
												<div class="txt">
													<p>
														현재 사용 예정인 가상화 환경을 선택하여 주시기 바라며, 추후 가상화 신청 시 변경할 수 있습니다.
													</p>
												</div>
											</div>
										</th>
										<td>
											<div class="item">
												<kcure:radio2 name="aenvSpcd" grpCd="AENV_SPCD" defaultValue="${dataAplcSmry.aenvSpcd}" attributes=" class=\"required\"  title=\"가상화환경선택\" "/>
											</div>
										</td>
										<th>가상화환경 사용시작 예정일 *</th>
										<td>
											<div class="item">
												<input type="date" id="dszApdt" name="dszApdt" value="${dataAplcSmry.dszApdt}" title="가상화환경 사용시작 예정일" class="n_int_s required" />
												<div class="tool_tip_wrap">
													<div class="icon_g">?</div>
													<div class="txt">
														<p>가상화환경 사용 시작예정일은 신청일로부터 최소 2개월 후부터 선택가능합니다.</p>
														<p>심의승임 및 결제, 가상화 생성 이후 사용 가능하며, 진행 상황에 따라 일정이 변경 될 수 있습니다.</p>
													</div>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<th>가상화 사용기간 선택 *</th>
										<td colspan="3">
											<div class="period">
												<ul>
													<li>월</li>
													<li>
														<select id="useDtrnMnthVl" name="useDtrnMnthVl" title="가상화 사용기간 월" class="n_sel_s">
															<option value="0">선택</option>
															<c:forEach var="i" begin="1" end="6">
																<option value="${i}" <c:if test="${dataAplcSmry.useDtrnMnthVl == i}">selected="selected"</c:if>>${i}개월</option>
															</c:forEach>
														</select>
													</li>
												</ul>
												<ul>
													<li>주</li>
													<li>
														<select id="useDtrnMainVl" name="useDtrnMainVl" title="가상화 사용기간 주" class="n_sel_s">
															<option value="0">선택</option>
															<c:forEach var="i" begin="1" end="4">
																<option value="${i}" <c:if test="${dataAplcSmry.useDtrnMainVl == i}">selected="selected"</c:if>>${i}주</option>
															</c:forEach>
														</select>
													</li>
												</ul>
												<ul>
													<li>일</li>
													<li>
														<select id="useDtrnDayVl" name="useDtrnDayVl" title="가상화 사용기간 일" class="n_sel_s">
															<option value="0">선택</option>
															<c:forEach var="i" begin="1" end="5">
																<option value="${i}" <c:if test="${dataAplcSmry.useDtrnDayVl == i}">selected="selected"</c:if>>${i}일</option>
															</c:forEach>
														</select>
													</li>
												</ul>
												<p>총 사용기간 :<span id="totalUseDt"></span></p>
												<p>종료일자 :<span id="useDtrnEndDt"></span></p>
											</div>
										</td>
									</tr>
									<tr>
										<th>가상화분석도구 선택 *</th>
										<td colspan="3">
											<div class="item">
												<c:forEach var="list" items="${vrtAnlsDvceSpcdList}" varStatus="status">
													<label class="re_checkbox_s" for="vrtAnlsDvceSpcd${status.count}">
														<input type="checkbox" id="vrtAnlsDvceSpcd${status.count}" name="vrtAnlsDvceSpcd" value="${list.detlCd}" />
														<span><span class="check_img"></span>${list.detlCdNm}</span>
													</label>
												</c:forEach>
											</div>
										</td>
									</tr>
									<tr>
										<th>
											감면율 *
											<div class="tool_tip_wrap">
												<div class="icon_w">?</div>
												<div class="txt">
													<p>선택하신 감면율의 증명을 위해 첨부파일을 업로드하여 주시기 바랍니다.</p>
													<p>증명이 불가능할 경우 감면율이 적용되지 않을 수 있습니다.</p>
												</div>
											</div>
										</th>
										<td>
											<div class="item">
												<select id="rdcRtSpcd" name="rdcRtSpcd" class="n_sel_s required" title="감면율">
													<option value="">선택</option>
													<c:forEach var="list" items="${rdrtItemList}">
														<option value="${list.rdcRtSpcd}" <c:if test="${dataAplcSmry.rdcRtSpcd == list.rdcRtSpcd}">selected="selected"</c:if>>${list.rdcRtItemCont}</option>
													</c:forEach>
												</select>
											</div>
										</td>
										<th>감면율 첨부파일 *
											<div class="tool_tip_wrap">
												<div class="icon_w">?</div>
												<div class="txt">
													<p>파일이 2개 이상일 경우 압축 파일로 업로드하여 주시기 바랍니다.</p>
												</div>
											</div>
										</th>
										<td>
											<div class="item" id="file_type_13">
												<label for="file13">
													<span class="btn_upload n_bc_gray_dk">파일찾기</span>
													<input type="file" name="file13" id="file13" onchange="selectFileForm('13');" />
												</label>
											</div>
											<div class="item" id="file_type_13_list" style="display: none;"></div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- <p class="re_mark">※ 분석환경(폐쇄분석형, 원격분석형)은 변경과 교차이용이 불가하오니, 신중하게 선택하여 주시기 바랍니다. </p> -->
					</div>
				</div>
			</form>
			<div class="n_table_r_btn">
				<a href="#" onclick="tempSave();return false;" class="n_m_btn n_bc_b_line">임시저장</a>
				<a href="#" onclick="saveReserch();return false;" class="n_m_btn n_bc_blue_dk">다음</a>
			</div>
		</div>
	</div>
</div>
<!-- 파일 다운로드폼 -->
	<form name="downLoadFilefrm" id="downLoadFilefrm" action="" method="post" style="display: none;" >
		<input type="hidden" id="fileAttNmSpcd" name="fileAttNmSpcd">
		<input type="hidden" id="dataAplcNo" name="dataAplcNo" value="${clcInfReserchVo.dataAplcNo}">
		<input type="hidden" id="attfPthNm" name="attfPthNm">
		<input type="hidden" id="attfStrNm" name="attfStrNm">
		<input type="hidden" id="attfNm" name="attfNm" >
	</form>

<!-- title 및 navi -->
<%@include file="/WEB-INF/jsp/kcure/portal/dac/clc/inf/clcInfCommon.jsp"%>	