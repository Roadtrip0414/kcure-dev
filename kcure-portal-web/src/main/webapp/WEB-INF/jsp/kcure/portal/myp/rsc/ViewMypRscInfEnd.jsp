<%
/* =================================================================
 * @FileName : ViewMypRscInfEnd.jsp
 * @date: 2023.02.01
 * @author : kyh
 * @설명 : 마이페이지 나의연구 종료 화면
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
			text: "연구과제번호"
		},
		name: "rsrAsmtNo",
		fieldName: "rsrAsmtNo",
		type: "data",
		styleName: "ud-column-center",
		readOnly: true
	},
	{
		header: {
			text: "연구명"
		},
		name: "rsrSbjNm",
		fieldName: "rsrSbjNm",
		type: "data",
		styleName: "ud-column-center",
		readOnly: true
	},
	{
		header: {
			text: "연구기간"
		},
		name: "rsrDtTerm",
		fieldName: "rsrDtTerm",
		type: "data",
		styleName: "ud-column-center",
		readOnly: true
	},
	{
		header: {
			text: "상태"
		},
		name: "aplcProgNm",
		fieldName: "aplcProgNm",
		type: "data",
		styleName: "ud-column-center",
		readOnly: true,
		displayCallback: function(grid, index, value) {
			return "종료";
		}
	},
	{
		header: {
			text: "연구성과등록"
		},
		name: "rsrRslt",
		fieldName: "rsrRslt",
		styleName: "ud-column-center",
		renderer: {
			type: "html",
			callback: function (grid, cell) {
				var rsrRsltCnt = grid.getValue(cell.index.itemIndex, 'rsrRsltCnt');
				var dataAplcNo = grid.getValue(cell.index.itemIndex, 'dataAplcNo');
				var str = "";
				
				str = '<div class="tb_btn_wrap">';
				if (rsrRsltCnt > 0) {
					str = str + ' <a onclick="javascript:getRsrRslt(\''+dataAplcNo+'\')" class="bc_green">연구성과수정</a>';
				} else {
					str = str + ' <a onclick="javascript:getRsrRslt(\''+dataAplcNo+'\')" class="bc_red">연구성과등록</a>';
				}
				str = str + '</div>';				
				
				return str;
			},
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
			text: "연구성과등록건수"
		},
		name: "rsrRsltCnt",
		fieldName: "rsrRsltCnt",
		type: "data",
		styleName: "ud-column-center",
		readOnly: true,
		visible: false
	}
];

$(document).ready(function() {	
	//그리드
	var gridDataProvider = new RealGrid.LocalDataProvider();
	var gridView = new RealGrid.GridView('gridView');
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
	
	/* 조회 버튼 클릭 S */	
	var searchList = function() {	
		RG.doQuery({
			action : "/portal/myp/rsc/inf/selectMypRscInfEndList.do",
			//form : "srchForm",
			dataProviderPram : gridDataProvider,
			gridViewPram : gridView,
			pagingId:"grid_paging",
			//totalId: "totalCnt",
			//currCntId: "currCnt",
			endEvent: srchEndEvent
		});
	}
	
	var srchEndEvent = function(endEventParam, response) {
		console.log("--------------------srchEndEvent---------------------");
		console.log(endEventParam);
		console.log(response);
		
		if (gridDataProvider.getRowCount() < 1) {
			alert("조회 결과가 없습니다.");
		}
		
		console.log("--------------------srchEndEvent---------------------");
	}
	
	searchList();
	
	$("#saveBtn").click(function() {
		if ($("#dataAplcNo").val() == "") {
			alert("연구성과를 등록할 연구를 선택해 주세요.");
		} else if ($("#tesPblcCont").val() == "") {
			alert("논문게재 내용을 입력해 주세요.");
			$("#tesPblcCont").focus();
		} else if ($("#ancRsltCont").val() == "") {
			alert("발표성과 내용을 입력해 주세요.");
			$("#ancRsltCont").focus();
		} else if ($("#etcRsltCont").val() == "") {
			alert("기타성과 내용을 입력해 주세요.");
			$("#etcRsltCont").focus();
		} else {
			var form = $("#rsltFrm").serialize();
			
			$.ajax({
		        type: "post",
		        url: "/portal/myp/rsc/inf/saveMypRscInfRsrRslt.do",
		        data: form,
		        dataType: 'json',
		        success: function (data) {
		            if (data.result == "success") {
		            	alert(data.msg);
		            }
		                        
		            //$("#rsltPop").attr("class", "kc_layer_popup"); // re_layer_popup
		            $("#rsltPop").attr("class", "re_layer_popup");
		            
		            searchList();
		        },
		        error: function (request, status, error) {
		            //console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		            alert('<spring:message code="fail.request.msg" />');
		        }
		    });
		}
	});
});

function getRsrRslt(dataAplcNo) { 
	
	$('#dataAplcNo').val(dataAplcNo);
	
	var form = $("#rsltFrm").serialize();
	
	$.ajax({
        type: "post",
        url: "/portal/myp/rsc/inf/selectMypRscInfRsrRslt.do",
        data: form,
        dataType: 'json',
        success: function (data) {
        	
            $("#rsrSbjNm").html(data.aplcInfo.rsrSbjNm);
            $("#rsrpNm").html(data.aplcInfo.rsrpNm);
            $("#dszDsgnDtTerm").html(data.aplcInfo.dszDsgnDtTerm);
            $("#dataAplpNm").html(data.aplcInfo.dataAplpNm);
            //$("#rsrDtTerm").html(data.aplcInfo.rsrSdtFmt + " ~ " +data.aplcInfo.rsrEdtFmt);
            $("#spnsExpsY").prop("checked", true);
            
            if (data.result == "success") {
            	if (data.RsrRsltInfo.spnsExpsYn == "N") {
            		$("#spnsExpsN").prop("checked", true);
            	}
            	
            	$("#tesPblcCont").html(data.RsrRsltInfo.tesPblcCont);
            	$("#ancRsltCont").html(data.RsrRsltInfo.ancRsltCont);
            	$("#etcRsltCont").html(data.RsrRsltInfo.etcRsltCont);
            }
                        
            //$("#rsltPop").attr("class", "kc_layer_popup on"); // re_layer_popup
            $("#rsltPop").attr("class", "re_layer_popup on");
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
		
		<div class="my_research_wrap">
			<div class="con">
				 
				<div class="sub_pag_title">
					<p>종료된 연구</p>
					<span>종료 후에는 다시 신청할 수 없습니다.</span>
				</div> 
				
				
				<div class="res_apply"> 
					<div class="grid_area_wrap" id="gridView" style="height: 55px;"></div>
					<div id="grid_paging" class="page_num"></div>
				</div>
				
				
			</div>
		</div>
	</div>
	
	<!-- class="on"시 데이터 활용 설문조사 팝업 -->
	<form id="rsltFrm" name="rsltFrm" method="post">	
		<input type="hidden" id="dataAplcNo" name="dataAplcNo">
		
		<div class="re_layer_popup" id="rsltPop">
			<div class="re_popup_box">
				<a href="javascript:void(0)" class="btn kc_close"></a>
				<div class="title">
					<p>연구성과등록</p>
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
													<th>책임연구자</th>
													<td id="rsrpNm"></td>
													<th>활용센터 연구기간</th>
													<td id="dszDsgnDtTerm"></td>
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
												<th>등록자</th>
												<td id="dataAplpNm"></td>
											</tr>
											<tr>
												<th>데중병원 사사표시여부</th>
												<td>
													<div class="re_radio_box_s">
														<label class="re_radio_btn_m">
															<input type="radio" name="spnsExpsYn" id="spnsExpsY" value="Y">
															<span class="n_radio_mark"></span><span class="txt">여</span>
														</label>
														<label class="re_radio_btn_m">
															<input type="radio" name="spnsExpsYn" id="spnsExpsN" value="N">
															<span class="n_radio_mark"></span><span class="txt">부</span>
														</label>
													</div> 
												</td>
											</tr>
											<tr>
												<th>논문게재</th>
												<td>
													<textarea class="n_text_l" name="tesPblcCont" rows="5" placeholder="논문제목, 학술지명, 2021, 19권, 2호, 77p~96p ISSN 1598-8813"></textarea>
													<p class="n_sm_point_txt">*논문명 제출 시 [붙임]으로 증빙을 첨부 요청드립니다</p>
												</td> 
											</tr>
											<tr>
												<th>발표성과</th>
												<td>
													<textarea class="n_text_l" name="ancRsltCont" rows="5" placeholder="학술대회명, 발표일자, 발표자, 발표유형 (포스터발표) 등"></textarea>
												</td>
											</tr>
											<tr>
												<th>기타성과<br>(특허 등)</th>
												<td>
													<textarea class="n_text_l" name="etcRsltCont" rows="5"></textarea>
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
					<a href="javascript:void(0)" class="n_l_btn n_bc_b_line" id="saveBtn">보관하기</a>
				</div>
			</div>
	</div>
		
	</form>