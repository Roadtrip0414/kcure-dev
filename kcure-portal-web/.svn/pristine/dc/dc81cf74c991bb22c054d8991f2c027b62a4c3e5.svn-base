<%
/* =================================================================
 * @FileName : ViewMypRscInfOut.jsp
 * @date: 2023.02.01
 * @author : kyh
 * @설명 : 마이페이지 나의연구 반출 화면
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
var gridColumns = [
	{
		header: {
			text: "신청시간"
		},
		name: "dttoAplcDt",
		fieldName: "dttoAplcDt",
		type: "data",
		styleName: "ud-column-center",
		readOnly: true
	},
	{
		header: {
			text: "반출데이터"
		},
		name: "dataDttoAplcFileNm",
		fieldName: "dataDttoAplcFileNm",
		styleName: "ud-column-center",
		width: "220",
		renderer: {
			type: "html",
			callback: function (grid, cell) {
				var rsrAsmtNo = grid.getValue(cell.index.itemIndex, 'rsrAsmtNo');
				var dataAplcNo = grid.getValue(cell.index.itemIndex, 'dataAplcNo');
				var dttoAplcId = grid.getValue(cell.index.itemIndex, 'dttoAplcId');
				var dttoAplcDt = grid.getValue(cell.index.itemIndex, 'dttoAplcDt');
				
				var fileNm = grid.getValue(cell.index.itemIndex, 'dataDttoAplcFileNm');
				var fileCnt = grid.getValue(cell.index.itemIndex, 'dataDttoAplcFileCnt');
				var str = "";
				
				if (fileNm == undefined) fileNm = "";

				if (fileCnt > 1) {
					fileNm = fileNm + " 외 " + (fileCnt-1) + "개";
				}
				
				str += " <a onclick='fnDetail(\""+rsrAsmtNo+"\", \""+dataAplcNo+"\", \""+dttoAplcDt+"\");' style='display:inline;color:blue;'>";
				str += fileNm + '</a>';
				
				return str;
			},
		}
	},
	{
		header: {
			text: "신청자"
		},
		name: "dttoAplcNm",
		fieldName: "dttoAplcNm",
		type: "data",
		styleName: "ud-column-center",
		readOnly: true
	},
	{
		header: {
			text: "신청일자"
		},
		name: "aplcDt",
		fieldName: "aplcDt",
		type: "data",
		styleName: "ud-column-center",
		readOnly: true
	},
	{
		header: {
			text: "상태"
		},
		name: "dttoAplcProgNm",
		fieldName: "dttoAplcProgNm",
		styleName: "ud-column-center",
		renderer: {
			type: "html",
			callback: function (grid, cell) {
				var cdChk = grid.getValue(cell.index.itemIndex, 'dttoAplcProgStcd');
				var str = "";

				var fileRsrAsmtNo = grid.getValue(cell.index.itemIndex, 'rsrAsmtNo');
				var fileDataAplcNo = grid.getValue(cell.index.itemIndex, 'dataAplcNo');
				var fileDttoAplcId = grid.getValue(cell.index.itemIndex, 'dttoAplcId');
				var fileDttoAplcDt = grid.getValue(cell.index.itemIndex, 'dttoAplcDt');

				str = '<div class="tb_btn_wrap">';
				if (cdChk == "U01") {	//U01	승인대기
					str = str + '<p class="f_dk_gray">승인대기중</p>';
				} else if (cdChk == "U02") {	//U02	승인
					str = str + '<p class="f_green">승인완료</p>';
				} else if (cdChk == "U03") {	//U03	반려
					str = str + '<p class="f_red">반려</p>';
					str = str + ' <span onClick="javascript:viewRjcRsnCont(\''+fileRsrAsmtNo+'\', \''+fileDataAplcNo+'\', \''+fileDttoAplcDt+'\')" class="f_red">(사유보기)</span>';
				} else if (cdChk == "U04") {	//U04	부분승인
					str = str + '<p class="f_red">부분승인</p>';
					str = str + ' <span onClick="javascript:viewRjcRsnCont(\''+fileRsrAsmtNo+'\', \''+fileDataAplcNo+'\', \''+fileDttoAplcDt+'\')" class="f_red">(사유보기)</span>';
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
			text: "신청자ID"
		},
		name: "dttoAplcId",
		fieldName: "dttoAplcId",
		type: "data",
		styleName: "ud-column-center",
		readOnly: true,
		visible: false
	},
	{
		header: {
			text: "과제연구번호"
		},
		name: "rsrAsmtNo",
		fieldName: "rsrAsmtNo",
		type: "data",
		styleName: "ud-column-center",
		readOnly: true,
		visible: false
	},
	{
		header: {
			text: "진행상태코드"
		},
		name: "dttoAplcProgStcd",
		fieldName: "dttoAplcProgStcd",
		type: "data",
		styleName: "ud-column-center",
		readOnly: true,
		visible: false
	},
	{
		header: {
			text: "파일건수"
		},
		name: "dataDttoAplcFileCnt",
		fieldName: "dataDttoAplcFileCnt",
		type: "data",
		styleName: "ud-column-center",
		readOnly: true,
		visible: false
	}
];


function fnPage(pageNo){
	$('input[name=pageIndex]').val(pageNo);
	$("#listFrm").attr("action", "/portal/myp/rsc/inf/viewMypRscInfOut.do").submit();
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

function openDtl(itemIndex, rsrAsmtNo){
	var toggleAct = $("#dtlItem"+itemIndex).attr("class");

	if (toggleAct == "n_plus_btn") {
		$("#dtlItem"+itemIndex).attr("class", "n_plus_btn on");
		$("#gridView"+itemIndex).css("display", "block");
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
		gridView.setRowIndicator({visible: true});

		//상태바 설정
		gridView.setStateBar({visible: false});

		//체크바 설정
		gridView.setCheckBar({visible: false});

		RG.doQuery({
			action : "/portal/myp/rsc/inf/selectMypRscInfOutList.do",
			form : "listFrm",
			dataProviderPram : gridDataProvider,
			gridViewPram : gridView,
			endEvent: srchEndEvent
		});
		/* 활용신청 그리드 조회 E */
	} else {
		$("#dtlItem"+itemIndex).attr("class", "n_plus_btn");
		$("#gridView"+itemIndex).css("display", "none");
		$("#rsrAsmtNo").val("");

		$("#gridView"+itemIndex).empty();
		$("#gridMore" + itemIndex).css("display", "none");
	}
}

/**
 * 리스트 더보기 이벤트
*/
function openDtlMore(itemIndex, rsrAsmtNo){
	$("#dtlItem"+itemIndex).attr("class", "n_plus_btn on");
	$("#gridView"+itemIndex).css("display", "block");
	$("#rsrAsmtNo").val(rsrAsmtNo);
	$("#workIdx").val(itemIndex);
	$("#allListYn").val("Y");

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
	gridView.setRowIndicator({visible: true});

	//상태바 설정
	gridView.setStateBar({visible: false});

	//체크바 설정
	gridView.setCheckBar({visible: false});

	RG.doQuery({
		action : "/portal/myp/rsc/inf/selectMypRscInfOutList.do",
		form : "listFrm",
		dataProviderPram : gridDataProvider,
		gridViewPram : gridView,
		endEvent: srchEndEvent
	});
}

/*
* 그리드 상세보기
*/
function fnDetail(rsrAsmtNo, dataAplcNo, dttoAplcDt){
	$("#dataAplcNo").val(dataAplcNo);
	$("#dttoAplcDt").val(dttoAplcDt);
	$("#rsrAsmtNo").val(rsrAsmtNo);
	$("#listFrm").attr("action", "/portal/myp/rsc/inf/viewMypRscInfOutDetail.do").submit();
}

/*
* 반려사유 보기
*/
function viewRjcRsnCont(rsrAsmtNo, dataAplcNo, dttoAplcDt) {
	$('#dataAplcNoRjc').val(dataAplcNo);
	$('#rsrAsmtNoRjc').val(rsrAsmtNo);
	$('#dttoAplcDtRjc').val(dttoAplcDt);

	var form = $("#rjcFrm").serialize();

	$.ajax({
        type: "post",
        url: "/portal/myp/rsc/inf/selectMypRscInfOut.do",
        data: form,
        dataType: 'json',
        success: function (data) {
        	if (data.result == "success") {
        		var list = data.outInfoList;
        		var rjcStr = "";
        		for (var i = 0; i < list.length; i++) {
        			rjcStr += textToHtml(list[i].rjcRsnCont);
        			rjcStr +=  '<br><br>';
        		 }
        		$("#popRjcRsnCont").empty();
        		$("#popRjcRsnCont").append(rjcStr);
            }
            $("#rjcRsnPop").attr("class", "kc_layer_popup on");
        },
        error: function (request, status, error) {
            //console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            alert('<spring:message code="fail.request.msg" />');
        }
    });
}

</script>
	<div class="wrap">

		<%@ include file="/WEB-INF/jsp/kcure/portal/myp/rsc/ViewMypRscInfNav.jsp" %>

		<form id="listFrm" name="listFrm" method="post">
			<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>">
			<input type="hidden" id="dataAplcNo" name="dataAplcNo" value="">
			<input type="hidden" id="rsrAsmtNo" name="rsrAsmtNo" value="">
			<input type="hidden" id="dttoAplcId" name="dttoAplcId" value="">
			<input type="hidden" id="dttoAplcDt" name="dttoAplcDt" value="">
			<input type="hidden" id="workIdx" name="workIdx">
			<input type="hidden" id="allListYn" name="allListYn" value="N">
		</form>

		<form id="rjcFrm" name="rjcFrm" method="post">
			<input type="hidden" id="dataAplcNoRjc" name="dataAplcNo" value="">
			<input type="hidden" id="rsrAsmtNoRjc" name="rsrAsmtNo" value="">
			<input type="hidden" id="dttoAplcDtRjc" name="dttoAplcDt" value="">
		</form>
		
		<div class="n_my_research_wiew_wrap">
			<div class="con">
				<div class="sub_pag_title">
					<p>데이터 반출</p>
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
                   	<c:forEach items="${rscInfAplList}" var="list" varStatus="rowInx">
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
									<c:if test="${list.dataTpcd ne '03' and list.dttoAplcCnt > 0}">
										<div class="n_use_ct_btn">
											<!-- class="n_plus_btn on"일시 닫기 글씨 변경 -->
											<a href="javascript:void(0)" class="n_plus_btn" onclick="javascript:openDtl(${rowInx.index}, '${list.rsrAsmtNo}')" id="dtlItem${rowInx.index}">리스트</a>
										</div>
									</c:if>
								</div>
								<c:if test="${list.dataTpcd ne '03'}">
									<div class="n_table_info">
										<div class="grid_area_wrap" id="gridView${rowInx.index}" style="height:50px; display: none;"></div>
									</div>
									<a href="javascript:void(0)" class="more_btn" onclick="javascript:openDtlMore(${rowInx.index}, '${list.rsrAsmtNo}')" id="gridMore${rowInx.index}" style="display: none;">더보기</a>
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
