<%
/* =================================================================
 * @FileName : ViewMypRscInfUseForm.jsp
 * @date: 2023.02.01
 * @author : kyh
 * @설명 : 마이페이지 나의연구 활용 신청 화면
 * =================================================================
 * 수정일         작성자             내용     
 * -----------------------------------------------------------------------
 * 2023.02.01     kyh           파일생성
 * 2023.05.12     bhs           수정
 * =================================================================
 */ 
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>
<script type="text/javascript">
var aplCalDayCls = "---------------";
var chkStartDay = "";
var chkStartWeekNum = "";
var chkEndDay = "";
var chkEndWeekNum = "";

$(document).ready(function() {
	$("#aplCalDay").html(aplCalDayCls);
});

function chgSiDo() {
	resetDsgnYmd();
	
	if ($("#siDoCd").val() == "") {
		var strSelectList = '<option value="">선택</option>';
		$("#dszInstId").html(strSelectList);
	} else {
		$.ajax({
	        type: "post",
	        url: "/portal/myp/rsc/inf/selectMypRscInfDszPrtiIdList.do",
	        data: {"ctpvSpcd" : $("#siDoCd").val()},
	        dataType: 'json',
	        success: function (data) {
	            var strSelectList = '<option value="">선택</option>';
	        	
	        	if (data.result == "success") {
	        		$.each(data.prtiIdList, function( index, value ) {
	        			strSelectList = strSelectList + '<option value="' + value.prtiId + '">' + value.prtiNm + '</option>';
	        		});
	            }
	            
	            $("#dszInstId").html(strSelectList);
	        },
	        error: function (request, status, error) {
	            //console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	            alert('<spring:message code="fail.request.msg" />');
	        }
	    });
	}
}

function saveUse() {
	var chkRsrpIdCnt = 0;
	$("input[name=rsrpId]:checked").each(function() {
		chkRsrpIdCnt = chkRsrpIdCnt + 1;
	});
	
	var aenvSpcdVal = $("input[name='aenvSpcd']:checked").val();
	
	if (aenvSpcdVal == "02") {
		alert("원격형 형태는 준비중입니다.");
		return;
	}
	
	if ($("#dataAplcNo").val() == "") {
		alert("연구성과를 등록할 연구를 선택해 주세요.");
		return;
	} 
	
	if($("#dataTpcd").val() == "01"){
		if ($("#dszInstId option:selected").val() == "") {
			alert("센터 위치를 선택해 주세요.");
			$("#siDoCd").focus();
			return;
		}
	}

	if($("input[name='vrtAnlsDvceSpcd']:checked").length == 0){
		alert("가상화분석도구를 선택 해주세요.");
        return;
	}
	
	if (chkRsrpIdCnt < 1) {
		alert("분석자를 선택해 주세요.");
		return;
	} 
	
	if ($("#calDsgnYmdList").val() == "") {
		alert("날짜를 선택해 주세요.");
		return;
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
	
	$("#useFrm").attr("action", "/portal/myp/rsc/inf/saveMypRscInfUseAplc.do").submit();
}

function getToday(){
    var date = new Date();
    var year = date.getFullYear();
    var month = (1 + date.getMonth()).toString().padStart(2, "0");
    var day = date.getDate().toString().padStart(2, "0");

    return year + month + day;
}

function calendarPop() {
	if($("#dataTpcd").val() == "01"){
		if ($("#dszInstId option:selected").val() == "") {
			alert("센터 위치를 선택해 주세요.");
			$("#siDoCd").focus();
			return;
		}
	}
	
	if($("input[name='vrtAnlsDvceSpcd']:checked").length == 0){
		alert("가상화분석도구를 선택 해주세요.");
        return;
	}

	var chkRsrpIdCnt = 0;
	$("input[name=rsrpId]:checked").each(function() {
		chkRsrpIdCnt = chkRsrpIdCnt + 1;
	});
	
	if (chkRsrpIdCnt < 1) {
		alert("분석자를 선택해 주세요.");
		return;
	} else {
		$("#chkRsrpIdCnt").val(chkRsrpIdCnt);
	}
	
	var form = $("#useFrm").serialize();
	
	$.ajax({
        type: "post",
        url: "/portal/myp/rsc/inf/selectMypRscInfDszCalList.do",
        data: form,
        dataType: 'json',
        success: function (data) {
            var strCalDiv = '';
        	
        	if (data.result == "success") {
        		//class="off" 빈공간 | class="start" 시작점 | class="line" 배경 라인 | class="except" 제외 날짜 | class="end" 끝나는점
        		
        		$.each(data.calList, function( index, value ) {
        			strCalDiv = strCalDiv + '<div class="date">';
        			strCalDiv = strCalDiv + '	<div class="date_top">';
        			strCalDiv = strCalDiv + '		<a href="javascript:void(0)" class="prev"></a>';
        			strCalDiv = strCalDiv + '		<p>' + value.yyyy + '년 ' + value.mm + '월</p>';
        			strCalDiv = strCalDiv + '		<a href="javascript:void(0)" class="next"></a>';
        			strCalDiv = strCalDiv + '	</div>';
        			strCalDiv = strCalDiv + '	<ul>';
        			strCalDiv = strCalDiv + '		<li><a href="javascript:void(0)" class="">일</a></li>';
        			strCalDiv = strCalDiv + '		<li><a href="javascript:void(0)" class="">월</a></li>';
        			strCalDiv = strCalDiv + '		<li><a href="javascript:void(0)" class="">화</a></li>';
        			strCalDiv = strCalDiv + '		<li><a href="javascript:void(0)" class="">수</a></li>';
        			strCalDiv = strCalDiv + '		<li><a href="javascript:void(0)" class="">목</a></li>';
        			strCalDiv = strCalDiv + '		<li><a href="javascript:void(0)" class="">금</a></li>';
        			strCalDiv = strCalDiv + '		<li><a href="javascript:void(0)" class="">토</a></li>';
        			strCalDiv = strCalDiv + '	</ul>';

        			for (var i = 1; i < value.firstDayOfWeek; i++) {
        				if ((i % 7) == 1) {
        					strCalDiv = strCalDiv + '	<ul>';
        				}
        				
        				strCalDiv = strCalDiv + '			<li><a href="javascript:void(0)" class="off"></a></li>';
        				
        				if ((i % 7) == 0) {
        					strCalDiv = strCalDiv + '	</ul>';
        				}
        			}
        			
        			for (var i = 1; i < value.lastDayOfMonth; i++) {
        				if (((i + value.firstDayOfWeek - 1) % 7) == 1) {
        					strCalDiv = strCalDiv + '	<ul>';
        				}
        				
        				var todayChk = getToday();
        				var dayVal = value.yyyy + value.mm + i.toString().padStart(2, "0");
        				var dayClass = '';
        				
        				if (dayVal < value.dtuSdt || dayVal > value.dtuEdt || dayVal < todayChk) dayClass = 'except';
        				
        				$.each(data.calExceptList, function( subIndex, subValue ) {
        					if (subValue.calDsgnYmd == dayVal) dayClass = 'except';
        				});
        				
        				strCalDiv = strCalDiv + '			<li><a onClick="javascript:calInit(\'' + dayVal + '\', \'' + ((i + value.firstDayOfWeek - 1) % 7) + '\')" class="' + dayClass + '" id="cal_' + dayVal + '">' + i + '</a></li>';
        				
        				if (((i + value.firstDayOfWeek - 1)% 7) == 0) {
        					strCalDiv = strCalDiv + '	</ul>';
        				}
        			}
        			
        			for (var i = value.lastDayOfWeek+1; i <= 7; i++) {
        				if ((i % 7) == 1) {
        					strCalDiv = strCalDiv + '	<ul>';
        				}
        				
        				strCalDiv = strCalDiv + '			<li><a href="javascript:void(0)" class="off"></a></li>';
        				
        				if ((i % 7) == 0) {
        					strCalDiv = strCalDiv + '	</ul>';
        				}
        			}
        			
        			strCalDiv = strCalDiv + '</div>';
        		});
            }
            
            $("#calDiv").html(strCalDiv);
            
            $("#popCalDay").html("");
    		$("#popCalExceptDay").html("");
            
            $("#calendarPop").attr("class", "kc_layer_popup on");
        },
        error: function (request, status, error) {
            //console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            alert('<spring:message code="fail.request.msg" />');
        }
    });
	
	chkStartDay = "";
	chkStartWeekNum = "";
	chkEndDay = "";
	chkEndWeekNum = "";
}

function calInit(varYYYYMMDD, varWeekNum) {
	if (varWeekNum == "0") varWeekNum = "7";		//요일 숫자 보정
	
	var varClass = $("#cal_"+varYYYYMMDD).attr("class");
	
	//선택가능한 날인지 확인
	if (varWeekNum == "1" || varWeekNum == "7" || varClass == "except") {
		alert("주말 또는 선택불가 일자는 선택할 수 없습니다.");
		return;
	}
	
	//이미 값이 있다면 초기화
	calSet(chkStartDay, chkEndDay, "", "", "C");

	if (chkStartDay == "") {	//첫번째 선택이라면
		calSet(varYYYYMMDD, "", varWeekNum, "", "S");
	
		chkStartDay = varYYYYMMDD;
		chkStartWeekNum = varWeekNum;
		chkEndDay = "";
		chkEndWeekNum = "";
	} else {					//두번째 선택이라면
		if (chkStartDay >= varYYYYMMDD) {		//시작일보다 작거나 같다면 클리어	
			chkStartDay = "";
			chkStartWeekNum = "";
			chkEndDay = "";
			chkEndWeekNum = "";
		} else {
			calSet(chkStartDay, varYYYYMMDD, chkEndWeekNum, varWeekNum, "S");
			
			chkEndDay = varYYYYMMDD;
			chkEndWeekNum = varWeekNum;
		}
	}
}

function calSet(startDay, endDay, startWeek, endweek, actGbn) {
	<!--class="off" 빈공간 | class="start" 시작점 | class="line" 배경 라인 | class="except" 제외 날짜 | class="end" 끝나는점 -->
	if (startDay == "" && endDay == "") {
		return;
	} else {
		if (endDay == "") endDay = startDay;
		
		var calDayStr = "";
		var calExceptStr = "";
		var tmpCalDsgnYmdList = "";
		var tmpCalDsgnYmdExptList = "";
		
		for (var i = startDay; i <= endDay; i++) {
			if (actGbn == "C") {		//초기화
				$("#cal_"+i).attr("class", "");
			} else if (actGbn == "S") {	//셋팅
				if (i == startDay) {
					$("#cal_"+i).attr("class", "start");
					calDayStr = cenvertDate(i+"", "." ,"YMD") + "(" + cenvertWeekNm(startWeek) + ")";
				} else if (i == endDay) {
					$("#cal_"+i).attr("class", "end");
					
					if (startDay != endDay) calDayStr = calDayStr + " ~ " + cenvertDate(i+"", "." ,"YMD") + "(" + cenvertWeekNm(endweek) + ")";
				} else {
					if ($("#cal_"+i).attr("class") == "") {
						$("#cal_"+i).attr("class", "line");
					} else if ($("#cal_"+i).attr("class") == "except") {
						if (calExceptStr != "") calExceptStr = calExceptStr + ",";
						calExceptStr = calExceptStr + cenvertDate(i+"", "." , "MD");
					}
				}

				if (($("#cal_"+i).attr("class") == "start") || ($("#cal_"+i).attr("class") == "end") || ($("#cal_"+i).attr("class") == "line")) {
					tmpCalDsgnYmdList = tmpCalDsgnYmdList + "," + i;
				} else if ($("#cal_"+i).attr("class") == "except") {
					tmpCalDsgnYmdExptList = tmpCalDsgnYmdExptList + "," + i;
				}
			}
		}
		
		if (calExceptStr != "") calExceptStr = calExceptStr + " 제외";
		
		$("#popCalDay").html(calDayStr);
		$("#popCalExceptDay").html(calExceptStr);
		
		$("#tmpCalDsgnYmdList").val(tmpCalDsgnYmdList);
		$("#tmpCalDsgnYmdExptList").val(tmpCalDsgnYmdExptList);
	}
}

function cenvertDate(strYMD, strDelimiter, actGbn) {
	var answer = "";
	
	if (actGbn == "MD") {
		answer = strYMD.substring(4,6) + strDelimiter + strYMD.substring(6,8);
	} else {
		answer = strYMD.substring(0,4) + strDelimiter + strYMD.substring(4,6) + strDelimiter + strYMD.substring(6,8);
	}
	
	return answer;
}

function calEnd() {
	if ($("#tmpCalDsgnYmdList").val() == "") {
		alert("날짜를 선택해 주세요.");
	} else {
		$("#calendarPop").attr("class", "kc_layer_popup");
		
		if ($("#popCalDay").html() == "") {
			$("#aplCalDay").html(aplCalDayCls);
		} else {
			$("#aplCalDay").html($("#popCalDay").html());
		}
		
		$("#aplCalExceptDay").html($("#popCalExceptDay").html());
		
		$("#calDsgnYmdList").val($("#tmpCalDsgnYmdList").val());		
		$("#calDsgnYmdExptList").val($("#tmpCalDsgnYmdExptList").val());
	}
}

function resetDsgnYmd() {
	$("#aplCalDay").html("---------------");
	$("#aplCalExceptDay").html("");
	$("#calDsgnYmdList").val("");		
	$("#calDsgnYmdExptList").val("");
}
</script>
	<div class="wrap">
		
		<%@ include file="/WEB-INF/jsp/kcure/portal/myp/rsc/ViewMypRscInfNav.jsp" %>
		
		<form id="useFrm" name="useFrm"  method="post" enctype="multipart/form-data">
			<input type="hidden" id="dataAplcNo" name="dataAplcNo" value="${aplcInfo.dataAplcNo}">
			<input type="hidden" id="rsrAsmtNo" name="rsrAsmtNo" value="${aplcInfo.rsrAsmtNo}">
			<input type="hidden" id="dataTpcd" name="dataTpcd" value="${aplcInfo.dataTpcd}">
			<input type="hidden" id="calDsgnYmdList" name="calDsgnYmdList" value="">
			<input type="hidden" id="calDsgnYmdExptList" name="calDsgnYmdExptList" value="">
			<input type="hidden" id="tmpCalDsgnYmdList" name="tmpCalDsgnYmdList" value="">
			<input type="hidden" id="tmpCalDsgnYmdExptList" name="tmpCalDsgnYmdExptList" value="">
			<input type="hidden" id="chkRsrpIdCnt" name="chkRsrpIdCnt" value="">
			<input type="hidden" name="vrtAnlsDvceCont" value=""/>
			
			<div class="n_my_research_wiew_wrap">
			<div class="con">
				<div class="sub_pag_title">
					<p>데이터 활용 신청 연구정보</p>
				</div>
				<div class="n_gap_box">
					<div class="use_center_info type_01">
						<div class="top">
							<div class="item">
								<ul>
									<li>연구명</li>
									<li>${aplcInfo.rsrSbjNm}</li>
								</ul>
								<ul>
									<li>연구기간</li>
									<li>${aplcInfo.dszDsgnDtTerm}</li>
								</ul>
								<ul>
									<li>책임연구자</li>
									<li>${aplcInfo.rsrpNm}</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="n_table_info gray">
						<div class="title">
							<h3>데이터 활용 신청</h3>
							<p class="must_txt">* 표시된 항목은 필수 입력 항목입니다.</p>
						</div>
						<!-- 테이블 th의 텍스트가 가운데 정렬일 때 class명 type_02 추가 -->
						<div class="n_l_table type_02">
							<table>
								<tbody>
									<tr>
										<th>형태<span class="must">*</span></th>
										<td>
											<div class="re_radio_box_s">
												<c:forEach items="${aenvSpcdList}" var="list" varStatus="rowInx">
														<label class="re_radio_btn_m">
															<input type="radio" name="aenvSpcd" id="aenvSpcd${rowInx.index}" value="${list.detlCd}"
																<c:if test="${rowInx.index eq 1}">disabled</c:if>
																<c:if test="${rowInx.index eq 0}">checked="checked"</c:if>>
															<span class="n_radio_mark"></span><span class="txt">${list.detlCdNm}</span>
														</label>
												</c:forEach>
											</div>																					
										</td>
									</tr>
									<c:if test="${aplcInfo.dataTpcd eq '01'}">
										<tr>
											<th>센터위치<span class="must">*</span></th>
											<td>
												<div class="item">
													<select class="n_sel_l" name="siDoCd" id="siDoCd" onchange="javascript:chgSiDo();">
														<option value="">선택</option>
														<c:forEach items="${siDoCdList}" var="list" varStatus="rowInx">
															<option value="${list.detlCd}">${list.detlCdNm}</option>
														</c:forEach>
													</select>
													<select class="n_sel_l" name="dszInstId" id="dszInstId" onchange="javascript:resetDsgnYmd();">
														<option value="">선택</option>
													</select>
												</div>
											</td>
										</tr>
									</c:if>
									<tr>
										<th>가상화분석도구<span class="must">*</span></th>
										<td>
											<%-- <div class="item">
												<select class="n_sel_l" name="vrtDvceCd" id="vrtDvceCd" onchange="javascript:resetDsgnYmd();">
													<option value="">선택</option>
													<c:forEach items="${vrtDvceCdList}" var="list" varStatus="rowInx">
														<option value="${list.detlCd}">${list.detlCdNm}</option>
													</c:forEach>
												</select>
											</div> --%>
											<div class="check_m_item">
												<c:forEach items="${vrtDvceCdList}" var="list" varStatus="rowInx">
													<label class="re_checkbox_m">
														<input type="checkbox" name="vrtAnlsDvceSpcd"  value="${list.detlCd}" onClick="javascript:resetDsgnYmd();">
														<span><span class="check_img"></span>${list.detlCdNm}</span>
													</label>
												</c:forEach>
											</div>
										</td>
									</tr>
									<tr>
										<th>분석자<span class="must">*</span></th>
										<td>
											<div class="check_m_item">
												<c:forEach items="${rspList}" var="list" varStatus="rowInx">
													<label class="re_checkbox_m">
														<input type="checkbox" name="rsrpId" id="rsrpId" value="${list.rsrpId}" onClick="javascript:resetDsgnYmd();">
														<span><span class="check_img"></span>${list.rsrpNm}</span>
													</label>
												</c:forEach>
											</div>
										</td>
									</tr>
									<tr>
										<th>날짜선택<span class="must">*</span></th>
										<td>
											<div class="calendar_wrap">
												<!-- a테그로 수정 -->
												<a onClick="javascript:calendarPop()" class="date_select">					
													<ul>
														<li id="aplCalDay">---------------</li>
													</ul>
													<span id="aplCalExceptDay"></span>
												</a>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="apply_btn">
						<a onclick="javascript:saveUse()" class="n_l_btn db_b">신청하기</a>
					</div>
				</div>
			</div>
		</div>
		</form>
	</div>

	<!-- class="on"시 날짜선택 팝업 -->
	<div class="kc_layer_popup" id="calendarPop">
		<div class="kc_popup_box connect_pw">
			<a href="javascript:void(0)" class="kc_close btn"></a>
			<div class="title">
				<p>날짜선택</p>
			</div>
			<div class="popup_con">
				<div class="calendar_wrap">
					<div class="date_select">
						<ul>
							<li id="popCalDay"></li>
						</ul>
						<span id="popCalExceptDay"></span>
					</div>
					<div class="date_list">
						<div class="box" id="calDiv">
						</div>
					</div>
				</div>
			</div>
			<div class="l_btn">
				<a onclick="javascript:calEnd()" class="bc_blue">선택완료</a>
			</div>
		</div>
	</div>
	