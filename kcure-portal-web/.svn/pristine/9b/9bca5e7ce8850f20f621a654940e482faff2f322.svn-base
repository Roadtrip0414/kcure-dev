

<%
/* =================================================================
 * @FileName : ViewMypRscInfApl.jsp
 * @date: 2023.05.08
 * @author : kyh
 * @설명 : 마이페이지 보관연장
 * =================================================================
 * 수정일         작성자             내용
 * -----------------------------------------------------------------------
 * 2023.05.08     shpark           파일생성
 * =================================================================
 */
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>
<script type="text/javascript">

$(document).ready(function() {
	
});


function subListBtn(rsrAsmtNo){
	var targetSubList = $('#sub_list_'+rsrAsmtNo);
	var  listBtn = $('#list_btn_'+rsrAsmtNo);
	//리스트 열려있는 상태일경우
	if($(listBtn).hasClass("on") === true) {
		$(listBtn).removeClass("on");
		$(targetSubList ).hide();
	//닫혀 있는경우.
	}else{
		schSubList(rsrAsmtNo);
	}
}

function schSubList(rsrAsmtNo){
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

//리스트 없을 경우 닫기
function subListBtnClose(rsrAsmtNo){
	var targetSubList = $('#sub_list_'+rsrAsmtNo);
	//리스트 열려있는 상태일경우
	$('#list_btn_'+rsrAsmtNo).removeClass("on");
	$(targetSubList ).hide();
}

//보관 /연장  신청 버튼 클릭
function reqBtnClick(rsrAsmtNo,dataAplcNo){
	//신청구분
	var extdStcd = $('#schExtdStcd_'+rsrAsmtNo).val();
	if(extdStcd != ''){
		//신청가능 여부 확인.
		//리스트 호출
		$.ajax({
			url: "/portal/myp/rsc/inf/checkExtdStcdCnt.do",
			dataType: "json",
			data: {"rsrAsmtNo" : rsrAsmtNo,"extdStcd":extdStcd },
			type: "POST",
			//async: false,
			success: function(response) {
				var checkYn = false;
				var checkData = response.checkExtdStcdYn;
				var msg = '';
				//"01"	"가상화사용연장신청" dtuExtdYn
				if(extdStcd == '01'){					
					//횟수 확인
					if(checkData.dtuExtdYn == 'Y')checkYn = true;
					msg = '가상화사용연장신청 은';
						
				//"02"	"보관연장신청" dataKepExtdYn
				}else if(extdStcd == '02'){
					//횟수 확인
					if(checkData.dataKepExtdYn == 'Y')checkYn = true;
					msg = '보관연장신청 은';
				
				//"03"	"재사용신청" rusExtdYn
				}else if(extdStcd == '03'){
					//횟수 확인
					if(checkData.rusExtdYn == 'Y')checkYn = true;
					msg = '재사용신청 은';
				//"04"	"연구유효기간연장신청" rsrTmvlExtdYn
				}else if(extdStcd == '04'){
					//횟수 확인
					if(checkData.rusExtdYn == 'Y')checkYn  = true;
					msg = '연구유효기간연장신청 은';
				}
				
				//횟수 오버일 경우.
				if(!checkYn){
					alert(msg+' 현재 신청진행 할수 없습니다.')
				}else if(checkData.ingCnt > 0 ){
					alert('승인 진행중인 건이 존재합니다. 승인완료후 진행 부탁 드립니다.');
				}else{
					//신청 페이지 호출
					fnExtnPopup(dataAplcNo,rsrAsmtNo,extdStcd);
				}
			}
		});
		
		
		
	}else{
		alert('구분을 선택해 주세요.');
	}
}

</script>
	<div class="wrap">
		<%@ include file="/WEB-INF/jsp/kcure/portal/myp/rsc/ViewMypRscInfNav.jsp" %>
		<div class="n_my_research_wiew_wrap">
			<div class="con">
				<div class="sub_pag_title">
					<p>보관 / 연장</p>
					<ul>
						<li>데이터 활용기간은 안심활용센터 또는 원격형 K-CURE 데이터 박스 사용 기간을 말합니다. 연장 신청은 한번만 가능합니다.  연장은 활용기간 전에 해주셔야 합니다.</li>
						<li>유효 연구기간은 IRB 승인문서에 있는 기간입니다. 신규 IRB 승인 문서로 연장할 수 있습니다.</li>
						<li>보관 신청은 데이터 활용기간 내에 가능합니다. 데이터 활용기간이 끝나고 나면 보관 할수 없습니다.</li>
						<li>재사용 신청 기간에도 보관신청을 할수 있습니다.</li>
					</ul>
				</div>
				<div class="n_gap_box">
					<div class="n_use_center_wrap">
						<p class="info_sub_red_txt">본인이 참여하거나 책임연구자로 지정된 연구의 활용센터 이용 신청 목록이 조회됩니다.</p>
						<c:forEach items="${extnList}" var="list">
							<c:choose>
								<c:when test="${list.dataTpcd eq '03'}">
									<div class="use_center_info">
										<div class="top">
											<div class="item">
												<ul>
													<li>연구명</li>
													<!-- onclick시 마우스 포인터 변환 및 언더라인 -->
													<li>${list.rsrSbjNm} ( 과제번호 :  ${list.rsrAsmtNo} )</li>
												</ul>
												<ul>
													<li>연구기간</li>
													<li>${list.rsrDtm}</li>
												</ul>
												<ul>
													<li>신청자</li>
													<li>${list.dataAplpUserNm}</li>
												</ul>
												<ul>
													<li>유형</li>
													<li>${list.dataTpnm}</li>
												</ul>
											</div>
										</div>
										<div class="sub_info_wrap">
											<p class="info_red_txt">* 결합은 안심활용센터가 아닌, 외부 결합기간의 분석센터를 활용하시게 됩니다.</p>
										</div>
									</div>
								</c:when>
								<c:otherwise>
									<div class="use_center_info">
										<div class="top">
											<div class="item">
												<ul>
													<li>연구명</li>
													<!-- onclick시 마우스 포인터 변환 및 언더라인 -->
													<li>${list.rsrSbjNm} ( 과제번호 : ${list.rsrAsmtNo} )</li>
												</ul>
												<ul>
													<li>신청자</li>
													<li>${list.dataAplpUserNm}</li>
												</ul>
												<ul>
													<li>유형</li>
													<li>${list.dataTpnm}</li>
												</ul>
											</div>
											<div class="data_item">
												<ul>
													<li>연구기간</li>
													<li>${list.rsrDtm}</li>
												</ul>
												<ul>
													<li>보관기간</li>
													<li>${list.dataKepDtm}</li>
												</ul>
												<ul>
													<li>가상화 사용기간</li>
													<li>${list.dtuDtm}</li>
												</ul>
												<c:if test="${list.rusSdt != null and list.rusSdt != '' and list.rusEdt != null and list.rusEdt != ''}">
													<ul>
														<li>가상화 재사용 기간</li>
														<li>${list.rusDtm}</li>
													</ul>
												</c:if>
											</div>
											<div class="n_use_ct_btn">
												<kcure:select id="schExtdStcd_${list.rsrAsmtNo}" name="schExtdStcd_${list.rsrAsmtNo}" grpCd="EXTD_STCD" defaultYn="false" selected="" attributes=" class=\"n_sel_xl\"" />
												<a href="javascript:void(0)" onclick="reqBtnClick('${list.rsrAsmtNo}','${list.dataAplcNo}')" class="n_m_btn">보관 / 연장</a>
											</div>
											<div class="ext_btn">
												<!-- class="n_plus_btn on"일시 닫기 글씨 변경 -->
												<a id="list_btn_${list.rsrAsmtNo}" href="javascript:void(0)" onclick="subListBtn('${list.rsrAsmtNo}')"  class="n_plus_btn">리스트</a>
											</div>
										</div>
										<div id="sub_list_${list.rsrAsmtNo}" class="n_table_info" style="display: none;"></div>
										
									</div>
								</c:otherwise>
							</c:choose>
							
						</c:forEach>
					</div>
					<div class="n_use_center_wrap">
						
					</div>
				</div>
			</div>
		</div>
	</div>
	

<%@ include file="/WEB-INF/jsp/kcure/portal/myp/rsc/ViewMypRscInfExtnPopup.jsp" %>
<%@ include file="/WEB-INF/jsp/kcure/portal/myp/rsc/ViewMypRscInfExtnPayPopup.jsp" %>


<!-- 반려사유 팝업 -->
<div id="rjcRsnPopup" class="kc_layer_popup">
	<div class="kc_popup_box person_sch">
		<a href="javascript:void(0)" class="btn kc_close"></a>
		<h1 class="title">반려사유</h1>
		<div class="popup_con">
			<div class="inst_deliber">
				<ul class="list">
					<li>
						<textarea id="rjcRsnCont" rows="25" cols="80" readonly="readonly"></textarea>
					</li>
				</ul>
			</div>
			<div class="l_btn">
				<a href="javascript:void(0)" class="bc_blue kc_close">확인</a>
			</div>
		</div>

	</div>
</div>