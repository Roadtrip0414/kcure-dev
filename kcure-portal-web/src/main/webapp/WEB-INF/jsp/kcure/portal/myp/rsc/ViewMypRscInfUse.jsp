<%
/* =================================================================
 * @FileName : ViewMypRscInfUse.jsp
 * @date: 2023.02.01
 * @author : kyh
 * @설명 : 마이페이지 나의연구 활용 화면
 * =================================================================
 * 수정일         작성자             내용
 * -----------------------------------------------------------------------
 * 2023.02.01     kyh           파일생성
 * =================================================================
 */
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>
<script type="text/javascript">
$(document).ready(
	function() {
		<c:if test="${not empty fn:trim(actMessage) &&  actMessage ne ''}">
	    alert("<c:out value='${actMessage}'/>");
	    </c:if>
	}
);

var gridColumns = [
	{
		header: {
			text: "활용 기간"
		},
		name: "dszDsgnDtTerm",
		fieldName: "dszDsgnDtTerm",
		type: "data",
		styleName: "ud-column-center",
		readOnly: true
	},
	{
		header: {
			text: "분석자"
		},
		name: "dtuAcid",
		fieldName: "dtuAcid",
		styleName: "ud-column-center",
		renderer: {
			type: "html",
			callback: function (grid, cell) {
				var acidNm = grid.getValue(cell.index.itemIndex, 'dtuAcidNm');
				var acidCnt = grid.getValue(cell.index.itemIndex, 'dtuAcidCnt');

				if (acidNm == undefined) acidNm = "";

				if (acidCnt > 1) {
					acidNm = acidNm + " 외 " + (acidCnt-1) + "명";
				}

				return acidNm;
			},
		}
	},
	{
		header: {
			text: "유형"
		},
		name: "aenvSpcdNm",
		fieldName: "aenvSpcdNm",
		type: "data",
		styleName: "ud-column-center",
		readOnly: true
	},
	{
		header: {
			text: "센터"
		},
		name: "dszInstIdNm",
		fieldName: "dszInstIdNm",
		styleName: "ud-column-center",
		renderer: {
			type: "html",
			callback: function (grid, cell) {
				var dszInstIdNm = grid.getValue(cell.index.itemIndex, 'dszInstIdNm');
				var aenvSpcd = grid.getValue(cell.index.itemIndex, 'aenvSpcd');
				var dszRsvCnt = grid.getValue(cell.index.itemIndex, 'dszRsvCnt');
				var dtuAplcProgStcd = grid.getValue(cell.index.itemIndex, 'dtuAplcProgStcd');
				var dataAplcNo = grid.getValue(cell.index.itemIndex, 'dataAplcNo');
				var dtuAplcNo = grid.getValue(cell.index.itemIndex, 'dtuAplcNo');
				var dszInstId = grid.getValue(cell.index.itemIndex, 'dszInstId');

				var str = "";

				str = '<div class="tb_btn_wrap">';
				if (aenvSpcd == "01") {	//01	폐쇄형
					str = str + '<p class="f_dk_gray">' + dszInstIdNm + ' / ';
					if (dszRsvCnt > 0) {
						str = str + '<span onClick="javascript:viewSeatPop(\''+dataAplcNo+'\', \''+dtuAplcNo+'\', \''+dszInstId+'\')">좌석보기</span>';
					} else {
						str = str + '좌석미정';
					}
					str = str + '</p>';
				} else if (aenvSpcd == "02") {	//02	원격형
					if (dtuAplcProgStcd == "U02") {	//U02	승인
						str = str + ' <a onClick="javascript:viewRemotePop()" class="bc_blue">원격 접속 방법</a>';
					} else {
						str = str + ' - ';
					}
				}
				str = str + '</div>';

				return str;
			}
		}
	},
	{
		header: {
			text: "상태"
		},
		name: "dtuAplcProgNm",
		fieldName: "dtuAplcProgNm",
		styleName: "ud-column-center",
		renderer: {
			type: "html",
			callback: function (grid, cell) {
				var cdChk = grid.getValue(cell.index.itemIndex, 'dtuAplcProgStcd');
				var cdNm = grid.getValue(cell.index.itemIndex, 'dtuAplcProgNm');
				var rjcRsnCont = grid.getValue(cell.index.itemIndex, 'rjcRsnCont');
				var dataAplcNo = grid.getValue(cell.index.itemIndex, 'dataAplcNo');
				var dtuAplcNo = grid.getValue(cell.index.itemIndex, 'dtuAplcNo');
				var str = "";

				str = '<div class="tb_btn_wrap">';
				if (cdChk == "U01") {	//U01	승인대기
					str = str + '<p class="f_dk_gray">' + cdNm + '</p>';
				} else if (cdChk == "U02") {	//U02	승인
					str = str + '<p class="f_green">' + cdNm + '</p>';
				} else if (cdChk == "U03") {	//U03	반려
					str = str + '<p class="f_red">' + cdNm + '</p>';
					str = str + ' <span onClick="javascript:viewRjcRsnCont(\''+dataAplcNo+'\', \''+dtuAplcNo+'\')" class="f_red">(사유보기)</span>';
				}
				str = str + '</div>';

				return str;
			}
		}
	},
	{
		header: {
			text: "데이터신청번호"
		},
		name: "dataAplcNo",
		fieldName: "dataAplcNo",
		type: "data",
		styleName: "ud-column-center",
		readOnly: true,
		visible: false
	},
	{
		header: {
			text: "데이터활용신청번호"
		},
		name: "dtuAplcNo",
		fieldName: "dtuAplcNo",
		type: "data",
		styleName: "ud-column-center",
		readOnly: true,
		visible: false
	},
	{
		header: {
			text: "데이터활용신청진행상태코드"
		},
		name: "dtuAplcProgStcd",
		fieldName: "dtuAplcProgStcd",
		type: "data",
		styleName: "ud-column-center",
		readOnly: true,
		visible: false
	},
	{
		header: {
			text: "대표분석자명"
		},
		name: "dtuAcidNm",
		fieldName: "dtuAcidNm",
		type: "data",
		styleName: "ud-column-center",
		readOnly: true,
		visible: false
	},
	{
		header: {
			text: "분석자수"
		},
		name: "dtuAcidCnt",
		fieldName: "dtuAcidCnt",
		type: "data",
		styleName: "ud-column-center",
		readOnly: true,
		visible: false
	},
	{
		header: {
			text: "반려사유"
		},
		name: "rjcRsnCont",
		fieldName: "rjcRsnCont",
		type: "data",
		styleName: "ud-column-center",
		readOnly: true,
		visible: false
	},
	{
		header: {
			text: "유형코드"
		},
		name: "aenvSpcd",
		fieldName: "aenvSpcd",
		type: "data",
		styleName: "ud-column-center",
		readOnly: true,
		visible: false
	},
	{
		header: {
			text: "예약좌석수"
		},
		name: "dszRsvCnt",
		fieldName: "dszRsvCnt",
		type: "data",
		styleName: "ud-column-center",
		readOnly: true,
		visible: false
	},
	{
		header: {
			text: "참여기관ID"
		},
		name: "dszInstId",
		fieldName: "dszInstId",
		type: "data",
		styleName: "ud-column-center",
		readOnly: true,
		visible: false
	}
];

function fnPage(pageNo){
	$('input[name=pageIndex]').val(pageNo);
	$("#listFrm").attr("action", "/portal/myp/rsc/inf/viewMypRscInfUse.do").submit();
}

function srchEndEvent(endEventParam, response){
	console.log("--------------------srchEndEvent---------------------");
	console.log(endEventParam);
	console.log(response);

	if (endEventParam.length < 1) {
		alert("조회 결과가 없습니다.");
	}else{
		if($("#allListYn").val() == "N" && response.totCnt > 5){
			$("#gridMore" + $("#workIdx").val()).css("display", "block");
		}else if($("#allListYn").val() == "Y"){
			$("#gridMore" + $("#workIdx").val()).css("display", "none");
		}
	}
	console.log("--------------------srchEndEvent---------------------");
}

function openDtl(itemIndex, dataAplcNo, rsrAsmtNo){
	var toggleAct = $("#dtlItem"+itemIndex).attr("class");

	if (toggleAct == "n_plus_btn") {
		$("#dtlItem"+itemIndex).attr("class", "n_plus_btn on");
		$("#gridView"+itemIndex).css("display", "block");
		$("#dataAplcNo").val(dataAplcNo);
		$("#rsrAsmtNo").val(rsrAsmtNo);
		$("#workIdx").val(itemIndex);
		$("#allListYn").val("N");

		/* 활용신청 그리드 조회 S */
		//그리드
		var gridDataProvider = new RealGrid.LocalDataProvider();
		var gridView = new RealGrid.GridView('gridView'+itemIndex);
		gridView.setDataSource(gridDataProvider);

		/* 자동 컬럼 크기 조절  */
		gridView.displayOptions.fitStyle = "fill";
		gridView.displayOptions.syncGridHeight = "always";

		//그리드 컬럼 정보 세팅
		setFieldsNColumns(gridDataProvider, gridView, gridColumns);

		//초기 세팅(주의: 조회 함수 밑에 둬야 함)
		RG.initPattern({
			dataProviderPram : gridDataProvider,
			gridViewPram : gridView,
			gridCheckBoxFlag: false,
			//form : "srchForm",
			editable : false,
			footerBarFlag : false
		});

		//인디케이터 설정
		gridView.setRowIndicator({visible: false});

		//상태바 설정
		gridView.setStateBar({visible: false});

		//체크바 설정
		gridView.setCheckBar({visible: false});

		RG.doQuery({
			action : "/portal/myp/rsc/inf/selectMypRscInfUseList.do",
			form : "listFrm",
			dataProviderPram : gridDataProvider,
			gridViewPram : gridView,
			endEvent: srchEndEvent
		});
		/* 활용신청 그리드 조회 E */
	} else {
		$("#dtlItem"+itemIndex).attr("class", "n_plus_btn");
		$("#gridView"+itemIndex).css("display", "none");
		$("#dataAplcNo").val("");
		$("#rsrAsmtNo").val("");

		$("#gridView"+itemIndex).empty();
		$("#gridMore" + itemIndex).css("display", "none");
	}
}

/**
 * 리스트 더보기 이벤트
*/
function openDtlMore(itemIndex, dataAplcNo, rsrAsmtNo){
	$("#gridView"+itemIndex).empty();
	$("#dataAplcNo").val(dataAplcNo);
	$("#rsrAsmtNo").val(rsrAsmtNo);
	$("#workIdx").val(itemIndex);
	$("#allListYn").val("Y");

	/* 반입신청 그리드 조회 S */
	//그리드
	var gridDataProvider = new RealGrid.LocalDataProvider();
	var gridView = new RealGrid.GridView('gridView'+itemIndex);
	gridView.setDataSource(gridDataProvider);

	/* 자동 컬럼 크기 조절  */
	gridView.displayOptions.fitStyle = "fill";
	gridView.displayOptions.syncGridHeight = "always";

	//그리드 컬럼 정보 세팅
	setFieldsNColumns(gridDataProvider, gridView, gridColumns);

	//초기 세팅(주의: 조회 함수 밑에 둬야 함)
	RG.initPattern({
		dataProviderPram : gridDataProvider,
		gridViewPram : gridView,
		gridCheckBoxFlag: false,
		editable : false,
		footerBarFlag : false
	});

	//인디케이터 설정
	gridView.setRowIndicator({visible: true});

	//상태바 설정
	gridView.setStateBar({visible: false});

	//체크바 설정
	gridView.setCheckBar({visible: false});

	RG.doQuery({
		action : "/portal/myp/rsc/inf/selectMypRscInfUseList.do",
		form : "listFrm",
		dataProviderPram : gridDataProvider,
		gridViewPram : gridView,
		endEvent: srchEndEvent
	});
}

function movUseForm(dataAplcNo){
	$("#dataAplcNo").val(dataAplcNo);
	$("#listFrm").attr("action", "/portal/myp/rsc/inf/viewMypRscInfUseForm.do").submit();
}

function viewRjcRsnCont(dataAplcNo, dtuAplcNo) {
	$("#dataAplcNo").val(dataAplcNo);
	$("#dtuAplcNo").val(dtuAplcNo);

	var form = $("#listFrm").serialize();

	$.ajax({
        type: "post",
        url: "/portal/myp/rsc/inf/selectMypRscInfUse.do",
        data: form,
        dataType: 'json',
        success: function (data) {
        	if (data.result == "success") {
            	$("#popRjcRsnCont").html(textToHtml(data.useInfo.rjcRsnCont));
            }

            $("#rjcRsnPop").attr("class", "kc_layer_popup on");
        },
        error: function (request, status, error) {
            //console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            alert('<spring:message code="fail.request.msg" />');
        }
    });
}

function viewSeatPop(dataAplcNo, dtuAplcNo, dszInstId) {
	$("#dataAplcNo").val(dataAplcNo);
	$("#dtuAplcNo").val(dtuAplcNo);
	$("#dszInstId").val(dszInstId);

	var form = $("#listFrm").serialize();

	$.ajax({
        type: "post",
        url: "/portal/myp/rsc/inf/selectMypRscInfUseRsvSeat.do",
        data: form,
        dataType: 'json',
        success: function (data) {
        	var strAcidDiv = '';
        	var strRsvSeatDiv = '';

        	if (data.result == "success") {
        		$.each(data.acidList, function( index, value ) {
        			var strAcidDivClass = '';
        			var strRsvSeatDivClass = '';

        			if (index == 0) {
        				strAcidDivClass = 'on';
        				strRsvSeatDivClass = ' active';
        			}

        			strAcidDiv = strAcidDiv + '	<a href="javascript:void(0)" id="acidBtn' + index + '" onClick="javascript:clckAcidBtn(' + index + ')" class="' + strAcidDivClass + '">' + value.userNm + '</a>';

        			$.each(data.dszRsvList.filter(dszRsvList => dszRsvList.dataAplpId == value.dataAplpId), function( subIndex, subValue ) {
        				var listSize = data.dszRsvList.filter(dszRsvList => dszRsvList.dataAplpId == value.dataAplpId).length;

        				if (subIndex == 0) {
        					strRsvSeatDiv = strRsvSeatDiv + '	<div class="item' + strRsvSeatDivClass + '" id="acidItem' + index + '" >';
            				strRsvSeatDiv = strRsvSeatDiv + '		<table class="user_tb">';
        				}

        				if ((subIndex % 2) == 0) {
            				strRsvSeatDiv = strRsvSeatDiv + '			<tr>';
        				}

        				var strColspan = '';
        				if (subIndex == (listSize - 1) && (subIndex % 2) == 0) strColspan = ' colspan="3"';

        				strRsvSeatDiv = strRsvSeatDiv + '				<th>' + subValue.rsvDtFmt + '</th>';
        				strRsvSeatDiv = strRsvSeatDiv + '				<td' + strColspan + '>' + subValue.rsvSeatNo + '</td>';

        				if ((subIndex % 2) == 1) {
            				strRsvSeatDiv = strRsvSeatDiv + '			</tr>';
        				}

        				if (subIndex == (listSize - 1)) {
            				strRsvSeatDiv = strRsvSeatDiv + '		</table>';
            				strRsvSeatDiv = strRsvSeatDiv + '	</div>';
        				}
            		});
        		});
            }

        	$("#acidDiv").html(strAcidDiv);
        	$("#rsvSeatDiv").html(strRsvSeatDiv);
        	$("#seatPop").attr("class", "kc_layer_popup on");
        },
        error: function (request, status, error) {
            //console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            alert('<spring:message code="fail.request.msg" />');
        }
    });
}

function clckAcidBtn(btnIndex) {
	$("a[id^='acidBtn']").each(function() {
		$(this).attr("class", "");
	});
	$("div[id^='acidItem']").each(function() {
		$(this).attr("class", "item");
	});

	$("#acidBtn"+btnIndex).attr("class", "on");
	$("#acidItem"+btnIndex).attr("class", "item active");
}

function viewRemotePop() {
	alert("원격 접속 방법 화면 오픈");
}
</script>
	<div class="wrap">

		<%@ include file="/WEB-INF/jsp/kcure/portal/myp/rsc/ViewMypRscInfNav.jsp" %>

		<form id="listFrm" name="listFrm" method="post">
			<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>">
			<input type="hidden" id="dataAplcNo" name="dataAplcNo" value="">
			<input type="hidden" id="rsrAsmtNo" name="rsrAsmtNo" value="">
			<input type="hidden" id="dtuAplcNo" name="dtuAplcNo" value="">
			<input type="hidden" id="dszInstId" name="dszInstId" value="">
			<input type="hidden" id="workIdx" name="workIdx">
			<input type="hidden" id="allListYn" name="allListYn" value="N">
		</form>
		<div class="n_my_research_wiew_wrap">
            <div class="con">
            	<div class="sub_pag_title">
					<p>활용센터 이용방법</p>
					<ul>
						<li>연구과제에 할당된 다스 ID와 비밀번호를 숙제하세요. (다스는 보건복지부에서 보안을 위해 제공하는 가상PC입니다.)</li>
						<li>원격형으로 외부에서 접속하거나 안심활용센터에서 접속시 해당 다스 ID와 비밀번호로 접속하시면 됩니다.</li>
						<li>다스에 접속시 해당 아이디에 할당된 데이터를 확인하실 수 있습니다.</li>
					</ul>
				</div>
                <div class="n_gap_box">
                	<c:if test="${fn:length(rscInfAplList) == 0}">
                        <div class="n_use_center_wrap">
                           	<p class="info_sub_red_txt">본인이 참여하거나 책임연구자로 지정된 연구의 활용센터 이용 신청 목록이 조회됩니다.</p>
                            <div class="use_center_info">
								<p style="text-align: center;">조회된 내용이 없습니다.</p>
                            </div>
                        </div>
                    </c:if>
                   	<c:forEach items="${rscInfAplList}" var="list" varStatus="rowInx" >
                        <div class="n_use_center_wrap">
                        	<c:if test="${rowInx.index eq '0'}">
								<p class="info_sub_red_txt">본인이 참여하거나 책임연구자로 지정된 연구의 활용센터 이용 신청 목록이 조회됩니다.</p>
							</c:if>
							<div class="use_center_info">
								<div class="top">
									<div class="item">
										<ul>
											<li>연구명</li>
											<!-- onclick시 마우스 포인터 변환 및 언더라인 -->
											<li><a href="##">${list.rsrSbjNm}</a></li>
										</ul>
										<ul>
											<li>연구기간</li>
											<li>${list.rsrSdtFmt} ~ ${list.rsrEdtFmt}</li>
										</ul>
										<ul>
											<li>신청자</li>
											<li>${list.dataAplpNm}</li>
										</ul>
										<ul>
											<li>유형</li>
											<li>${list.dataTpcdNm}</li>
										</ul>
										<ul>
											<li>연구과제번호</li>
											<li>${list.rsrAsmtNo}</li>
										</ul>
									</div>
									<div class="n_use_ct_btn">
										<!-- class="n_plus_btn on"일시 닫기 글씨 변경 -->
										<c:if test="${list.dataTpcd ne '03'}">
											<a href="javascript:void(0)" class="n_plus_btn" onclick="javascript:openDtl(${rowInx.index}, '${list.dataAplcNo}', '${list.rsrAsmtNo}')" id="dtlItem${rowInx.index}">리스트</a>
											<a href="javascript:void(0)" class="n_m_btn" onclick="javascript:movUseForm('${list.dataAplcNo}')">활용 센터 신청</a>
										</c:if>
									</div>
								</div>
								<c:if test="${list.dataTpcd ne '03'}">
									<div class="n_table_info">
										<div class="grid_area_wrap" id="gridView${rowInx.index}" style="height: 55px; display: none;"></div>
									</div>
									<a href="javascript:void(0)" onclick="javascript:openDtlMore(${rowInx.index}, '${list.dataAplcNo}', '${list.rsrAsmtNo}')" class="more_btn" id="gridMore${rowInx.index}" style="display: none;">더보기</a>
								</c:if>
								<c:if test="${list.dataTpcd eq '03'}">
									<div class="sub_info_wrap">
										<p class="info_red_txt">* 결합은 안심활용센터가 아닌, 외부 결합기간의 분석센터를 활용하시게 됩니다.</p>
									</div>
								</c:if>
							</div>
                        </div>
                   	</c:forEach>
					<div class="page_num">
						<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fnPage"/>
					</div>
                </div>
			</div>
		</div>
	</div>

	<!-- class="on"시 반려사유 팝업 -->
	<div class="kc_layer_popup" id="rjcRsnPop">
		<div class="kc_popup_box connect_pw">
			<a href="javascript:void(0)" class="kc_close btn"></a>
			<div class="title">
				<p>반려사유</p>
			</div>
			<div class="popup_con" id="popRjcRsnCont">반려사유내용</div>
			<div class="l_btn">
				<a href="javascript:void(0)" class="bc_blue kc_close">확인</a>
			</div>
		</div>
	</div>

	<!-- class="on"시 좌석보기 팝업 -->
	<div class="kc_layer_popup" id="seatPop">
		<div class="kc_popup_box connect_pw">
			<a href="javascript:void(0)" class="kc_close btn"></a>
			<div class="title">
				<p>좌석보기</p>
			</div>
			<div class="popup_con">
				<div class="seat_wrap">
					<div class="tab_nav_wrap">
						<div class="tab_btn" id="acidDiv">
						</div>
						<div class="tab_con" id="rsvSeatDiv">
						</div>
					</div>
				</div>
			</div>
			<div class="l_btn">
				<a href="javascript:void(0)" class="bc_blue kc_close">확인</a>
			</div>
		</div>
	</div>