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
$('body').addClass('admin');
	$( document ).ready(function() {
		fnInitBtn();
		//가상화 사용기간 셋팅
		var dszApdt = '${dataAplcSmry.dszApdt}';				//가상화 사용 시작일
		const dtapUseDcnt = '${dataAplcSmry.dtapUseDcnt}';		//총 사용기간
		dszApdt = new Date(dszApdt);
		dszApdt.setDate(dszApdt.getDate()+Number(dtapUseDcnt));
		$("#dszApEnddt").html(dszApdt.getFullYear() + "-" + lpad((dszApdt.getMonth()+1),2,'0') + "-" + lpad(dszApdt.getDate(),2,'0'));
	});
	

	/*
	* 버튼 초기화
	*/
	function fnInitBtn(){
		//현재 진행상태가 R01 이면
		var rvwStpSpcd = $("#rvwStpSpcd").val();
		//사무국검토 단계일경우.
		if(rvwStpSpcd == 'R01'){
			//반려, 보완요청 버튼 처리.
			var rjcStpStcd = $("#rjcStpStcd").val();
			if(rjcStpStcd != ''){
				$('#RP03_btn').hide();
				$('#RP04_btn').hide();
				$('#'+rjcStpStcd+'_btn').show();
			}	
		}else{
			$('#click_btn').hide();
		}
		
	}

	/*
	* 반려사유(등록) 팝업오픈
	*/
	function fnOpenRtn(stpStcd){
		/*RP03 : 반려 , RP04 보완요청.  */
		$("#rjcStpStcd").val(stpStcd);
		let dataAplcNo = $("#dataAplcNo").val();
		let rvwStpSpcd = $("#rvwStpSpcd").val();
		
		//제목부분.
		let title = '반려사유를 작성해 주세요'; 
		if(stpStcd == 'RP04'){
			title = '보완요청 사유를 작성해 주세요';
		}
		
		$("#rtnRgstTitle").html(title);
		//$("#rjcRgstRsnCont").val(cont);
		$("#rtnRgstLayerPop").addClass('on')
		
		/*
		$.ajax({
			type:"POST",
			url:"/portal/sys/dac/rvw/selectRjcRsnContView.do",
			data:{	
						"dataAplcNo"	: dataAplcNo, 
						"rvwStpSpcd"	: rvwStpSpcd
					 },
			dataType:'json',
			success:function(returnData){
				console.log(returnData);
			let resultData = returnData.data;
			let resultCode = returnData.resultCode;
			let rvwStpStcd= resultData.rvwStpStcd;
			let cont = ''
			alert(stpStcd);
			alert(rvwStpStcd);
			if(stpStcd == rvwStpStcd){
				cont = resultData.rjcRsnCont
			}
			//제목부분.
			let title = '반려사유를 작성해 주세요'; 
			if(stpStcd == 'RP04'){
				title = '보완사유를 작성해 주세요';
			}
			
			$("#rjcRgstRsnCont").val(cont);
			$("#rtnRgstLayerPop").addClass('on')
			
	      }	
		});
		*/
	}

	function fnMoveToList() {
		document.location.href = "/portal/sys/dac/rvw/viewDataAplcRvw.do";
	}

	/*
	* 반려하기
	*/
	function fnRgstRtn(){
		let rjcRgstRsnCont = $("#rjcRgstRsnCont").val();
		let dataAplcNo = $("#dataAplcNo").val();
		let rvwStpSpcd = $("#rvwStpSpcd").val();
		let dataTpcd = $("#dataTpcd").val();
/*
		if(rjcRgstRsnCont == ""){
			alert("반려사유를 등록해주세요");
			return;
		}
*/
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
			}
	      }
		});
	}
	
	// 반려, 보완요청 정보 저장.
	function updateRgstInfo(){
		let rjcRgstRsnCont = $("#rjcRgstRsnCont").val();
		let dataAplcNo = $("#dataAplcNo").val();
		let rjcStpStcd = $("#rjcStpStcd").val();
		let rvwStpSpcd = $("#rvwStpSpcd").val();
		
		if(rjcRgstRsnCont == ""){
			if(rjcStpStcd  =='RP04' ){
				alert("보완요청 사유를 등록해주세요");
			}else{
				alert("반려사유를 등록해주세요");	
			}
			return;
		}

		$.ajax({
			type:"POST",
			url:"/portal/sys/dac/rvw/updateRjcRgst.do",
			data:{
						"rjcRsnCont"	: rjcRgstRsnCont,
						"dataAplcNo"	: dataAplcNo,
						"rvwStpStcd"	: rjcStpStcd
					 },
			dataType:'json',
			success:function(returnData){

			let resultCode = returnData.resultCode;

			if(resultCode == "Y"){
				fnMovePage(rvwStpSpcd);
			}
	      }
		});
	}

	// 반려, 보완요청 정보 저장.
	function fnRgstRtnCanCel(){
		let dataAplcNo = $("#dataAplcNo").val();
		let rvwStpSpcd = $("#rvwStpSpcd").val();
		$.ajax({
			type:"POST",
			url:"/portal/sys/dac/rvw/updateRjcRgst.do",
			data:{
						"rjcRsnCont"	: '',
						"dataAplcNo"	: dataAplcNo,
						"rvwStpStcd"	: ''
					 },
			dataType:'json',
			success:function(returnData){
				//현재 상태로 돌아가기.
				fnMovePage(rvwStpSpcd);
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
		var rjcStpStcd = $("#rjcStpStcd").val();
		
		//반려 혹은 보완요청상태일 경우.
		if(rjcStpStcd != ''){
			/*RP03 : 반려 , RP04 보완요청.  */
			if(rjcStpStcd == 'RP03'){
				 if (confirm("반려 상태로 진행하시겠습니까?")) {
					 fnRgstRtn();
			    }
			}else{
				 if (confirm("보완요청 상태로 진행하시겠습니까?")) {
					 fnSaveSplmnt();
			    }
			}
		
			
			
		}else{
			let url = '/portal/sys/dac/rvw/saveRevAplcRsch.do';
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
	
	/*
	* 보완요청 진행
	*/
	function fnSaveSplmnt(){
		 //if (confirm("보완요청 하시겠습니까?")) {
				let dataAplcNo = $("#dataAplcNo").val();
				let rvwStpSpcd = $("#rvwStpSpcd").val();
				let dataTpcd = $("#dataTpcd").val();
				
				$.ajax({
					type:"POST",
					url:"/portal/sys/dac/rvw/splmntReq.do",
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
					}
			      }
				});
	}
	
	

</script>
<!-- 반려 , 보완요청 코드  -->
<input type="hidden" id="rjcStpStcd" value='<c:out value="${data.rjcStpStcd}"/>' >

<form id="moveFrm" name="moveFrm" method="post" style="display: none;">
	<input type="hidden"  name="dataAplcNo" value='<c:out value="${data.dataAplcNo}"/>'>
	<input type="hidden"  name="rvwTmpId" value='<c:out value="${data.rvwTmpId}"/>'>
	<input type="hidden" id="moveStpSpcd" name="rvwStpSpcd">
</form>


<form id="sendFrm" name="sendFrm" method="post" style="display: none;">
	<input type="hidden" id="dataAplcNo" name="dataAplcNo" value='<c:out value="${data.dataAplcNo}"/>'>
	<input type="hidden" id="rvwTmpId" name="rvwTmpId" value='<c:out value="${data.rvwTmpId}"/>'>
	<input type="hidden" id="dataTpcd" name="dataTpcd" value='<c:out value="${data.dataTpcd}"/>'>
	<input type="hidden" id="rvwStpSpcd" name="rvwStpSpcd" value='<c:out value="${stpData.rvwStpSpcd}"/>'>
	<input type="hidden" id="rvwStpStcd" name="rvwStpStcd" value='<c:out value="${data.rvwStpStcd}"/>'>
	<input type="hidden" id="preSpcd" name="preSpcd" value='<c:out value="${stpData.preSpcd}"/>'>
	<input type="hidden" id="nextSpcd" name="nextSpcd" value='<c:out value="${stpData.nextSpcd}"/>'>
</form>

<!-- 파일 다운로드폼 -->
<form name="downLoadFilefrm" id="downLoadFilefrm" action="" method="post" style="display: none;" >
	<input type="hidden" id="fileAttNmSpcd" name="fileAttNmSpcd">
	<input type="hidden" id="dataAplcNo" name="dataAplcNo" value='<c:out value="${data.dataAplcNo}"/>'>
	<input type="hidden" id="attfPthNm" name="attfPthNm">
	<input type="hidden" id="attfStrNm" name="attfStrNm">
	<input type="hidden" id="attfNm" name="attfNm" >
</form>

<form id="srchFrm" name="srchFrm">
	<input type="hidden" id="allListYn" name="allListYn" value="N"/>
	<input type="hidden" name="dataAplcNo" value="${data.dataAplcNo}"/>
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
								<li>${rchData.prtiNm} / ${rchData.dataAplpNm}</li>
							</ul>
							<ul>
								<li>신청일자</li>
								<li>${rchData.dataAplcYmd}</li>
							</ul>
						</div>
					</div>
					<div class="data_set_flow">
						<p class="title">심의절차</p>
						<ul>
							<!-- class="on"시 활성화 -->
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
							<p>신청유형</p>
						</div>
						<div class="ad_re_l_table">
							<table>
								<colgroup>
									<col style="width: 200px;">
									<col style="width: auto;">
									<col style="width: 200px;">
									<col style="width: auto;">
								</colgroup>
								<tbody>
									<tr>
										<th>신청자 유형</th>
										<td>${rchData.aplpTypeSpcdNm}</td>
										<th>연구유형</th>
										<td>${rchData.rsrSpcdNm}</td>
									</tr>
									<tr  <c:if test="${rchData.rsrSpcd != '01'}">style="display: none;"</c:if>>
										<th>정책연구</th>
										<td colspan="3">${rchData.plcrsrInstNm} ${rchData.plcrsrDeptNm}</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="n_title_tb_wrap">
						<div class="title">
							<p>IRB</p>
						</div>
						<div class="ad_re_l_table">
							<table>
								<colgroup>
									<col style="width: 200px;">
									<col style="width: auto;">
									<col style="width: 200px;">
									<col style="width: auto;">
								</colgroup>
								<tbody>
									<tr>
										<th>IRB 연구기간</th>
										<td colspan="3">${rchData.rsrSdt} ~ ${rchData.rsrEdt}</td>
									</tr>
									<tr>
										<th>IRB 승인번호</th>
										<td>${rchData.irbApriNm}</td>
										<th>IRB 승인기관</th>
										<td>작업필요</td>
									</tr>
									<tr>
										<th>IRB 연구계획서</th>
										<td>
											<div class="n_file_link">
												<c:forEach var="item" items="${fileList}" varStatus="idx">
													<c:if test="${item.attdNmSpcd == '04'}">
														<a href="#" onclick="javascript:downFile('${item.attfPthNm}','${item.attfStrNm}','${item.attfNm}');">${item.attfNm}</a>
													</c:if>
												</c:forEach>
											</div>
										</td>
										<th>IRB 결과통지서</th>
										<td>
											<div class="n_file_link">
												<c:forEach var="item" items="${fileList}" varStatus="idx">
													<c:if test="${item.attdNmSpcd == '12'}">
														<a href="#" onclick="javascript:downFile('${item.attfPthNm}','${item.attfStrNm}','${item.attfNm}');">${item.attfNm}</a>
													</c:if>
												</c:forEach>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="n_title_tb_wrap">
						<div class="title">
							<p>가상화 환경</p>
						</div>
						<div class="ad_re_l_table tb_fixed">
							<table>
								<colgroup>
									<col style="width: 200px;">
									<col style="width: auto;">
									<col style="width: 200px;">
									<col style="width: auto;">
								</colgroup>
								<tbody>
									<tr>
										<th>가상화 환경</th>
										<td>${dataAplcSmry.aenvSpcdNm}</td>
										<th>가상화 환경<br>사용 시작 예정일</th>
										<td>${dataAplcSmry.dszApdt}</td>
									</tr>
									<tr>
										<th>가상화 사용기간</th>
										<td colspan="3">${dataAplcSmry.dszApdt} ~ <span id="dszApEnddt"></span></td>
									</tr>
									<tr>
										<th>가상화분석도구</th>
										<td colspan="3">${dataAplcSmry.vrtAnlsDvceNm}</td>
									</tr>
									<tr>
										<th>감면율</th>
										<td>
											${dataAplcSmry.rdcRtItemCont}
											<c:if test="${dataAplcSmry.rdcRtSpcd  ne 'RDRT99'}">
												<span class="n_f_point">${dataAplcSmry.rdcRt}% 감면</span>
											</c:if>
										</td>
										<th>감면율 첨부파일</th>
										<td>
											<div class="n_file_link">
												<c:forEach var="item" items="${fileList}" varStatus="idx">
													<c:if test="${item.attdNmSpcd == '13'}">
														<a href="#" onclick="javascript:downFile('${item.attfPthNm}','${item.attfStrNm}','${item.attfNm}');">${item.attfNm}</a>
													</c:if>
												</c:forEach>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="n_title_tb_wrap">
						<div class="title">
							<p>연구정보</p>
						</div>
						<div class="ad_re_l_table">
							<table>
								<colgroup>
									<col style="width: 200px;">
									<col style="width: auto;">
								</colgroup>
								<tbody>
									<tr>
										<th>연구명</th>
										<td>${rchData.rsrSbjNm}</td>
									</tr>
									<tr>
										<th>연구주제(대상질환)</th>
										<td>${rchData.rsrSbjDissCont}</td>
									</tr>
									<tr>
										<th>연구목적</th>
										<td><pre>${rchData.rsrPrpsCont}</pre></td>
									</tr>
									<tr>
										<th>대상자 정의</th>
										<td>${rchData.trprConf}</td>
									</tr>
									<tr>
										<th>연구내용</th>
										<td><pre>${rchData.rsrSbjCont}</pre></td>
									</tr>
									<tr>
										<th>연구방법</th>
										<td><pre>${rchData.rsrMthdConf}</pre></td>
									</tr>
									<tr>
										<th>기대효과/활용방안</th>
										<td><pre>${rchData.expcConf}</pre></td>
									</tr>
									<tr>
										<th>연구비 지원 출처</th>
										<td>${rchData.rsrfunSprtConf}</td>
									</tr>
									<tr>
										<th>비고</th>
										<td><pre>${rchData.rsrInfExntCont}</pre></td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- <div class="title">
							<p>선택한 데이터</p>
						</div> -->
						<!-- 리얼그리드 영역 | 나중에 style 삭제요망-->
						<!-- <div class="grid_area_wrap" style="height: 300px; background-color: #F9F9F9; border: 1px solid #DDDDDD; color: red;">리얼그리드 영역 | 나중에 style 삭제요망</div> -->
					</div>
					<div class="n_title_tb_wrap">
						<div class="title">
							<p>연구신청자</p>
						</div>
						<div class="ad_re_l_table tb_fixed">
							<table>
								<colgroup>
									<col style="width: 200px;">
									<col style="width: auto;">
									<col style="width: 200px;">
									<col style="width: auto;">
								</colgroup>
								<tbody>
									<tr>
										<th>신청자 명</th>
										<td>${clcInfRspVo.rsrpNm}</td>
										<th>휴대전화 번호</th>
										<td>${clcInfRspVo.userMbphNo1 != null  ? clcInfRspVo.userMbphNo1.replaceAll("(.{3})(.*)(.{4})", "$1-$2-$3") : ''}</td>
									</tr>
									<tr>
										<th>이메일 주소</th>
										<td colspan="3">${clcInfRspVo.email}</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="n_title_tb_wrap">
						<div class="title">
							<p>연구책임자</p>
						</div>
						<div class="ad_re_l_table tb_fixed">
							<table>
								<colgroup>
									<col style="width: 200px;">
									<col style="width: auto;">
									<col style="width: 200px;">
									<col style="width: auto;">
								</colgroup>
								<tbody>
									
									<c:forEach var="list" items="${clcInfRspList}">
										<c:if test="${list.rsrpSpcd eq '02' }">
										<tr>
											<th>성명</th>
											<td>${list.rsrpNm}</td>
											<th>휴대전화 번호</th>
											<td>${list.userMbphNo1 != null ? list.userMbphNo1.replaceAll("(.{3})(.*)(.{4})", "$1-$2-$3") : ''}</td>
										</tr>
										<tr>
											<th>이메일 주소</th>
											<td>${list.email}</td>
											<th>가상화 사용여부</th>
											<td>
												<c:if test="${list.vrtUseYn eq 'Y' }">
													사용
												</c:if>
												<c:if test="${list.vrtUseYn eq 'N' }">
													미사용
												</c:if>
											</td>
										</tr>
										</c:if>
									</c:forEach>
									
								</tbody>
							</table>
						</div>
					</div>
					<!-- 연구자 정보 -->
				<c:if test="${rspCnt != null && rspCnt > 0}">
					<div class="n_title_tb_wrap">
						<div class="title">
							<p>공동/보조 연구자</p>
						</div>
						<div class="ad_re_r_table">
							<table>
								<thead>
									<tr>
										<th>연구자 유형</th>
										<th>성명</th>
										<!-- <th>아이디</th> -->
										<th>전화번호</th>
										<th>이메일</th>
										<th>가상화 사용여부</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="list" items="${clcInfRspList}">
										<c:if test="${list.rsrpSpcd ne '02' }">
										<tr>
											<td>${list.rsrpSpcdNm}  ,, ${list.rsrpSpcd}</td>
											<td>${list.rsrpNm}</td>
											<%-- <td>${list.rsrpId}</td> --%>
											<td>${list.userMbphNo1 != null ? list.userMbphNo1.replaceAll("(.{3})(.*)(.{4})", "$1-$2-$3") : ''}</td>
											<td>${list.email}</td>
											<td>
												<c:if test="${list.vrtUseYn eq 'Y' }">
													사용
												</c:if>
												<c:if test="${list.vrtUseYn eq 'N' }">
													미사용
												</c:if>
											</td>
										</tr>
										</c:if>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</c:if>
					<div class="n_title_tb_wrap">
						<div class="ad_re_l_table">
							<table>
								<colgroup>
									<col style="width: 200px;">
									<col style="width: auto;">
								</colgroup>
								<tbody>
									<tr>
										<th>연구자 동의 서류</th>
										<td>
											<div class="n_file_link">
												<c:forEach var="item" items="${fileList}" varStatus="idx">
													<c:if test="${item.attdNmSpcd == '07'}">
														<a href="#" onclick="javascript:downFile('${item.attfPthNm}','${item.attfStrNm}','${item.attfNm}');">${item.attfNm}</a>
													</c:if>
												</c:forEach>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- <div class="title">
							<p>선택한 데이터</p>
						</div> -->
						<!-- 리얼그리드 영역 | 나중에 style 삭제요망-->
						<!-- <div class="grid_area_wrap" style="height: 300px; background-color: #F9F9F9; border: 1px solid #DDDDDD; color: red;">리얼그리드 영역 | 나중에 style 삭제요망</div> -->
					</div>
					<div class="n_title_tb_wrap">
						<div class="title">
							<p>선택한 데이터</p>
						</div>
<!-- 						<div class="ad_re_r_table"> -->
							<!-- 리얼그리드 영역 | 나중에 style 삭제요망-->
							<div class="grid_area_wrap" id="gridView"></div>
							<div class="btn" id="gridMoreDisp" style="display:none;">
								<a href="javascript:fnSearchMore()"><span id="gridMoreCntTxt">320개 데이터 더보기</span></a>
							</div>
							<script src="/js/kcure/portal/sys/dac/rvw/RevAplcRschDts.js" ></script>
							
<!-- 						</div> -->
						<div class="n_grid_tb_btn">
							<div class="left">
								<a href="javascript:fnMoveToList()" class="line_gray">목록으로</a>
							</div>
							<div class="right" id="click_btn">
								<a href="javascript:fnOpenRtn('RP03')" class="dk_red" id="RP03_btn">반려</a>
								<a href="javascript:fnOpenRtn('RP04')" class="bc_green" id="RP04_btn">보완요청</a>
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
			<p id="rtnRgstTitle" >반려사유를 작성해 주세요</p>
		</div>
		<div class="popup_con">
			<div class="n_reject_wrap">
				<textarea rows="10" id="rjcRgstRsnCont">${data.rjcRsnCont}</textarea>
				<div class="ad_pop_btn">
					<a href="javascript:updateRgstInfo()" class="dk_blue">발송</a>
					<a href="javascript:fnRgstRtnCanCel()" class="dk_blue">취소</a>
				</div>
			</div>
		</div>
	</div>
</div>

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
	.multiline-editor{
	  white-space: pre;
	}
</style>
