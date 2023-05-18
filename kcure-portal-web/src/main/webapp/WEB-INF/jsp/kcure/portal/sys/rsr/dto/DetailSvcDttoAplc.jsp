<%
/* =================================================================
 * @FileName : ViewSvcDttoAplc.jsp
 * @date: 2023.03.20
 * @author : parkgu
 * @설명 : 데이터반출관리 상세 심의화면
 * =================================================================
 * 수정일         작성자             내용
 * -----------------------------------------------------------------------
 * 2023.03.20     parkgu           파일생성
 * =================================================================
 */
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>
<script type="text/javascript" src="/js/kcure/portal/sys/rsr/RsrSbjMemo.js"></script>
<script type="text/javascript">

/**
 * 저장이벤트
 */
function fnSave(){	
	var targetCnt = $("#dttoFileListCnt").val();
	
	if(targetCnt == 0) return;

	for(var i=0;i<targetCnt;i++){
		if($('input[name=dttoAplcProgStcd_'+ i +']:checked').length == 0){
		   alert("반출파일에 대한 승인 및 반려여부를 체크해주세요.");
		   return;		  
		}else{
			var selectedValue = $('input[name=dttoAplcProgStcd_'+ i +']:checked').val();
			if(selectedValue == "U03"){
				if($('#rjcRsnCont_'+i).val() == ""){
					alert("반려선택 시 반려사유를 입력해야 합니다.");
					return;
				}
			}
		} 
	}
	
	$("#detailFrm").attr("action", "/portal/sys/rsr/dto/saveDttoAplcProg.do").submit();
}

function fnFileDown(attfPthNm,attfStrNm,attfNm){
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


</script>

<div class="wrap">
	<div class="con">
		<div class="area_wrap">
			<div class="section">
				<form id="downLoadFilefrm" name="downLoadFilefrm" method="post">
					<input type="hidden" id="attfPthNm" name="attfPthNm" value=""/>
					<input type="hidden" id="attfStrNm" name="attfStrNm" value=""/>
					<input type="hidden" id="attfNm" name="attfNm" value=""/>
					<input type="hidden" name="dataAplcNo" value="${tkinInfo.dataAplcNo}" />
				</form>
				<form id="detailFrm" name="detailFrm" method="post" action="/portal/sys/rsr/dto/updateDttoAplcProgStcd.do">
					<input type="hidden" name="dataAplcNo" value="${detail.dataAplcNo}" />
					<input type="hidden" name="dttoAplcDt" value="${detail.dttoAplcDt}" />
					<input type="hidden" name="rsrAsmtNo" value="${detail.rsrAsmtNo}" />
					<input type="hidden" id="dttoFileListCnt" name="dttoFileListCnt" value="${dttoFileListCnt}" />
					<table class="left_talbe">
						<tbody>
							<tr>
								<th>연구과제번호</th>
								<td>${detail.rsrAsmtNo}</td>
							</tr>
							<tr>
								<th>연구명</th>
								<td>${detail.rsrSbjNm} <a href="##" onclick="fnMemoPopup('${detail.dataAplcNo}');" style="display:inline;color:blue;">[메모]</a></td>
							</tr>
							<tr>
								<th>연구기간</th>
								<td>${detail.rsrDtTerm}</td>
							</tr>
							<tr>
								<th>신청자</th>
								<td>${detail.dttoAplcNm}</td>
							</tr>
							<tr>
								<th>유형</th>
								<td>${detail.dataTpcdNm}</td>
							</tr>
							<tr>
								<th>반출파일</th>
								<td>
									<c:forEach items="${dttoFileList}" var="list" varStatus="rowInx" >
										<div style="margin-block: 10px;">
											<input type="hidden" name="dttoAttfSeq_${rowInx.index}" value="${list.attfSeq}">
											<div style="float: left;margin-top: 30px;margin-right: 20px;"><div class="n_file_link"><a onclick="javascript:fnFileDown('${list.attfPthNm}', '${list.attfStrNm}', '${list.attfNm}');">${list.attfNm}</a></div></div>
											<div class="radio_wrap" style="margin-left: 136px;">
												<label>
													<input type="radio" name="dttoAplcProgStcd_${rowInx.index}" value="U02">
													<span class="radio_mark"></span><span>승인</span>
												</label>
												<label>
													<input type="radio" name="dttoAplcProgStcd_${rowInx.index}" value="U03">
													<span class="radio_mark"></span><span>반려</span>
													<textarea id="rjcRsnCont_${rowInx.index}" name="rjcRsnCont_${rowInx.index}" style="margin-left: 21px;width: 500px;"></textarea>
												</label>
											</div>
										</div>
									</c:forEach>					
								</td>
							</tr>							
						</tbody>
					</table>
					<div class="btn_center">
						<a onclick="javascript:fnSave();" class="bc_blue">저장</a>
						<a href="javascript:detailFrm.reset()" class="bc_white">취소</a>
						<a href="javascript:history.back()" class="bc_line">목록</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<input type="hidden" name="current_menu_name_info" value="DetailSvcDttoAplc" />