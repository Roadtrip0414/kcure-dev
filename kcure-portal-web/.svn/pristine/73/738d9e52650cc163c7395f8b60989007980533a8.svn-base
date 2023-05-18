<%
/* =================================================================
 * @FileName : DetailRsrDauManage.jsp
 * @date: 2023.02.01
 * @author : kyh
 * @설명 : 데이터 활용관리 상세보기
 * =================================================================
 * 수정일         작성자             내용
 * -----------------------------------------------------------------------
 * 2023.02.01     kyh           파일생성
 * =================================================================
 */
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>
<script type="text/javascript" src="/js/kcure/portal/sys/rsr/RsrSbjMemo.js"></script>
<script type="text/javascript">
var dsgnYmdCnt = 0;

$(document).ready(function() {
	//반려사유 영역 설정
	if ("<c:out value='${dtlInfo.dtuAplcProgStcd}'/>" == "U03") {
		$("#dtlInfoClass").attr("class", "utilization_wrap on");
	} else {
		$("#dtlInfoClass").attr("class", "utilization_wrap");
	}

	//승인여부 활성화 설정
	$(":radio[name='dtuAplcProgStcd'][value='<c:out value='${dtlInfo.dtuAplcProgStcd}'/>']").attr('checked', true);

	if ("<c:out value='${dtlInfo.dtuAplcProgStcd}'/>" != "U01") {
		$("input[name='dtuAplcProgStcd']").attr("disabled", "true");
	}
});

function goList(){
	$("#srchForm").attr("action", "/portal/sys/rsr/dau/viewRsrDauManage.do").submit();
}

function goSave(){
	if($("#seatRsvList").val() == undefined){
		alert("분석자 정보가 없는 데이터 입니다.");
		return;
	}
	
	var chkDtuAplcProgStcd = 0;
	var dtuAplcProgStcdVal = "";
	$("input[name=dtuAplcProgStcd]:checked").each(function() {
		chkDtuAplcProgStcd = chkDtuAplcProgStcd + 1;
		dtuAplcProgStcdVal = this.value;
	});

	if (chkDtuAplcProgStcd < 1) {
		alert("승인여부를 선택해 주세요.");
		return;
	}
	
	if (dtuAplcProgStcdVal == "U02") {
		if($("#seatRsvList").val() == ""){
			alert("좌석을 선택해 주세요.");
			return;
		}
	}

	if (dtuAplcProgStcdVal == "U03" && $("#rjcRsnCont").val() == "") {
		alert("반려사유를 입력해 주세요.");
		$("#rjcRsnCont").focus();
		return;
	}

	if (dtuAplcProgStcdVal == "U02") {
		$("#rjcRsnCont").val("");
	}
	
	// <input name="dataAplpId" value="a@a.com" />, <input name="dataAplpId" value="b@b.com" /> -> "a@a.com,b@b.com"
	$("#dataAplpIdList").val($.map($("input[name='dataAplpId']"), (v, i) => $(v).val()).join(","));
	
	var form = $("#srchForm").serialize();

	$.ajax({
        type: "post",
        url: "/portal/sys/rsr/dau/saveRsrDauManage.do",
        data: form,
        dataType: 'json',
        success: function (data) {
            if (data.result == "success") {
        		alert(data.msg);
            }

            goList();
        },
        error: function (request, status, error) {
            //console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            alert('<spring:message code="fail.request.msg" />');
        }
    });
}

/* 파일 다운로드  */
function downFile() {
	$('#filedownFrm').attr("action", "/portal/dac/clc/inf/serviceFileDown.do").submit();
}

function seatPop() {
	dsgnYmdCnt = 0;

	var form = $("#srchForm").serialize();

	$.ajax({
        type: "post",
        url: "/portal/sys/rsr/dau/selectRsrDauPrtiSeatList.do",
        data: form,
        dataType: 'json',
        success: function (data) {
        	var strDiv = '';
        	var chkSeatNo = '';

        	if (data.result == "success") {
        		dsgnYmdCnt = data.dsgnYmdList.filter(dsgnYmdList => dsgnYmdList.hldYn == "N" && dsgnYmdList.excpYmdYn == "N").length;

        		<!-- class="on" 활성화 | class="off" 선택불가 | class="none" 제외 -->
    			strDiv = strDiv + '<table>';
    			strDiv = strDiv + '	<thead>';
    			strDiv = strDiv + '		<tr>';
    			strDiv = strDiv + '			<th class="seat_txt">좌석</th>';
        		$.each(data.dsgnYmdList, function( ymdIndex, ymdValue ) {
        			strDiv = strDiv + '			<th>' + ymdValue.calDsgnMdFmt + '</th>';
        		});
    			strDiv = strDiv + '		</tr>';
    			strDiv = strDiv + '	</thead>';
    			strDiv = strDiv + '	<tbody>';
        		$.each(data.prtiSeatList, function( index, value ) {
        			if (chkSeatNo != value.seatNo) {
        				if (index > 0) strDiv = strDiv + '		</tr>';
        				strDiv = strDiv + '		<tr>';
        				strDiv = strDiv + '			<td class="seat_num">' + value.seatNo + '</td>';
        				chkSeatNo = value.seatNo;
        			}

        			var chkClass = '';
            		// 휴일&제외일 처리

        			$.each(data.dsgnYmdList.filter(dsgnYmdList => dsgnYmdList.calDsgnYmd == value.calDsgnYmd), function( ymdIndex, ymdValue ) {
            			if (ymdValue.hldYn == "Y" || ymdValue.excpYmdYn == "Y") chkClass = 'off';
            		});

            		//해당일 기예약좌석 처리
            		if (value.rsvYn == "Y") chkClass = 'off';

        			strDiv = strDiv + '			<td><a onClick="javascript:seatInit(\'' + value.calDsgnYmd + '\', \'' + value.seatNo + '\')" class="' + chkClass + '" id="seat_' + value.calDsgnYmd + value.seatNo + '" data-ymd="' + value.calDsgnYmdFmt + '" data-seat="' + value.seatNo + '"></a></td>';

        			if (index == (data.prtiSeatList.length - 1)) strDiv = strDiv + '		</tr>';
        		});
    			strDiv = strDiv + '	</tbody>';
    			strDiv = strDiv + '</table>';
            }

        	const aplpNmList = $.map($("input[name='userNm']"), (v, i) => $(v).val()).join(", ");
            $("#aplpNmList").html(aplpNmList);
            $("#seatDiv").html(strDiv);
        	$("#seatPop").attr("class", "kc_layer_popup on");
        },
        error: function (request, status, error) {
            //console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            alert('<spring:message code="fail.request.msg" />');
        }
    });
}

function seatInit(calDsgnYmd, seatNo) {
	var varClass = $("#seat_"+calDsgnYmd + seatNo).attr("class");

	//선택가능한 좌석인지 확인
	if (varClass != "" && varClass != "on") {
		alert("선택할 수 없는 좌석입니다.");
		return;
	}

	if (varClass == "on") {
		$("#seat_"+calDsgnYmd + seatNo).attr("class", "");		//선택된 좌석은 해제처리
	} else {
		var chkLoopCnt = 0;
		$("a[id^='seat_"+calDsgnYmd+"']").each(function() {
			if ($(this).attr("class") == "on") chkLoopCnt = chkLoopCnt + 1;
		});

		if (chkLoopCnt > 0) {
			alert("동일한 일자에는 하나의 좌석만 선택할 수 있습니다.");
		} else {
			$("#seat_"+calDsgnYmd + seatNo).attr("class", "on");
		}
	}
}

function seatEnd() {
	if (dsgnYmdCnt < 1) {
		alert("좌석을 선택해 주세요.");
	} else {
		var chkLoopCnt = 0;
		var strDiv = new Array();
		var strValue = new Array();

		$("a[id^='seat_']").each(function() {
			if ($(this).attr("class") == "on") {
				strDiv[chkLoopCnt] = $(this).data("ymd") + " - " + $(this).data("seat") + "<br>";
				strValue[chkLoopCnt] = $(this).data("ymd").replace(/\./g,"") + "//" + $(this).data("seat");
				chkLoopCnt = chkLoopCnt + 1;
			}
		});

		//날짜별로 정렬 처리
		strDiv.sort();
		strValue.sort();

		if (chkLoopCnt < dsgnYmdCnt) {
			alert("좌석을 선택하지 않은 일자가 존재합니다.");
		} else {
			$("#seatRsvList").val(strValue.join(","));

			$("#tdArea").html(strDiv);

			$("#seatPop").attr("class", "kc_layer_popup");
		}
	}
}

</script>

<!-- container -->
<form id="filedownFrm" name="filedownFrm" method="post">
	<input type="hidden" id="attfPthNm" name="attfPthNm" value="${dtlInfo.attfPthNm}">
	<input type="hidden" id="attfNm" name="attfNm" value="${dtlInfo.attfNm}">
	<input type="hidden" id="attfStrNm" name="attfStrNm" value="${dtlInfo.attfStrNm}">
</form>

<form id="srchForm" name="srchForm" method="post">
	<input type="hidden" id="dataAplcNo" name="dataAplcNo" value="${searchVO.dataAplcNo}">
	<input type="hidden" id="dtuAplcNo" name="dtuAplcNo" value="${searchVO.dtuAplcNo}">
	<input type="hidden" id="pageIndex" name="pageIndex" value="${searchVO.pageIndex}">
	<input type="hidden" id="searchCondition" name="searchCondition" value="${searchVO.searchCondition}">
	<input type="hidden" id="searchKeyword" name="searchKeyword" value="${searchVO.searchKeyword}">
	<input type="hidden" id="searchKeywordFrom" name="searchKeywordFrom" value="${searchVO.searchKeywordFrom}">
	<input type="hidden" id="searchKeywordTo" name="searchKeywordTo" value="${searchVO.searchKeywordTo}">
	<input type="hidden" id="srchAenvSpcd" name="srchAenvSpcd" value="${searchVO.srchAenvSpcd}">
	<input type="hidden" id="srchSiDoCd" name="srchSiDoCd" value="${searchVO.srchSiDoCd}">
	<input type="hidden" id="srchPrtiId" name="srchPrtiId" value="${searchVO.srchPrtiId}">
	<input type="hidden" id="srchDtuAplcProgStcd" name="srchDtuAplcProgStcd" value="${searchVO.srchDtuAplcProgStcd}">
	<input type="hidden" id="dszInstId" name="dszInstId" value="${dtlInfo.dszInstId}">
	<div class="wrap">
		<div class="con">
			<div class="area_wrap">
				<div class="section">
					<div class="utilization_wrap" id="dtlInfoClass">
						<div class="drop_table">
							<table class="left_talbe">
								<tbody>
									<tr>
										<th>연구명</th>
										<td>${dtlInfo.rsrSbjNm} <a href="##" onclick="fnMemoPopup('${searchVO.dataAplcNo}');" style="display:inline;color:blue;">[메모]</a> </td>
									</tr>
									<tr>
										<th>신청활용기간</th>
										<td>${dtlInfo.dszDsgnSdtFmt} - ${dtlInfo.dszDsgnEdtFmt}</td>
									</tr>
									<tr>
										<th>승인여부</th>
										<td>
											<div class="radio_wrap">
												<label>
													<input type="radio" name="dtuAplcProgStcd" id="dtuAplcProgStcd" value="U02">
													<span class="radio_mark"></span><span>승인</span>
												</label>
												<label>
													<input type="radio" name="dtuAplcProgStcd" id="dtuAplcProgStcd" value="U03">
													<span class="radio_mark"></span><span>반려</span>
												</label>
											</div>
										</td>
									</tr>
									<tr class="txt_int">
										<th>반려사유 입력</th>
										<td><textarea name="rjcRsnCont" id="rjcRsnCont" rows="4">${dtlInfo.rjcRsnCont}</textarea></td>
									</tr>
								</tbody>
							</table>
						</div>

						<c:if test="${dtlInfo.dtuAplcProgStcd eq 'U01'}">
							<div class="tb_btn_wrap">
								<a onClick="javascript:seatPop()" class="bc_blue">선택</a>
							</div>
						</c:if>

						<div class="grid_area_wrap">
							<table class="view_table">
								<tbody>
									<tr>
										<th>이름</th>
										<th>연락처</th>
										<th>선택된 좌석</th>
									</tr>
									<c:forEach items="${acidList}" var="list" varStatus="rowInx">
										<tr>
											<td>
												${list.userNm}
												<input type="hidden" name="dataAplpId" value="${list.dataAplpId}" />
												<input type="hidden" name="userNm" value="${list.userNm}" />
											</td>
											<td>${list.userMbphNo != null ? list.userMbphNo.replaceAll("(.{3})(.*)(.{4})", "$1-$2-$3") : ''}</td> 
											
											<c:if test="${rowInx.first}">
												<input type="hidden" id="seatRsvList" name="seatRsvList" value="">
												<input type="hidden" id="dataAplpIdList" name="dataAplpIdList" value="" />
												<td id="tdArea" rowspan="${acidList.size()}">
													<c:forEach items="${dszRsvList}" var="subList" varStatus="subRowInx">
														${subList.rsvDtFmt} - ${subList.rsvSeatNo}<br>
													</c:forEach>
												</td>
											</c:if>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>

						<div class="btn_center">
							<!-- class | f_blue 블루 | bc_black 검정 | bc_white 화이트 | bc_line 블루라인 -->
							<a href="javascript:void(0)" onClick="javascript:goList()" class="bc_white">취소</a>
							<a href="javascript:void(0)" onClick="javascript:goList()" class="bc_line">목록</a>
							<c:if test="${dtlInfo.dtuAplcProgStcd eq 'U01'}">
								<a href="javascript:void(0)" onClick="javascript:goSave()" class="bc_blue">등록</a>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>

	<!-- class="on"시 좌석 선택 팝업 -->
	<div class="kc_layer_popup" id="seatPop">
		<div class="kc_popup_box">
			<a href="javascript:void(0)" class="kc_close btn"></a>
			<div class="title">
				<p>좌석 선택</p>
			</div>
			<div class="popup_con">
				<div class="utili">
					<table class="user_tb_l type_01">
						<tbody>
							<tr>
								<th>분석자</th>
								<td id="aplpNmList">홍길동</td>
							</tr>
							<tr>
								<th>선택날짜</th>
								<td>${dtlInfo.dszDsgnSdtFmt} - ${dtlInfo.dszDsgnEdtFmt}</td>
							</tr>
						</tbody>
					</table>
					<div class="seat_table" id="seatDiv"></div>
				</div>
			</div>
			<div class="l_btn">
				<a onclick="javascript:seatEnd()" class="bc_blue">선택완료</a>
			</div>
		</div>
	</div>
<!-- //container -->