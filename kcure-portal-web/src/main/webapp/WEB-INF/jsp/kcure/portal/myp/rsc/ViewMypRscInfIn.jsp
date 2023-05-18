<%
/* =================================================================
 * @FileName : ViewMypRscInfIn.jsp
 * @date: 2023.02.01
 * @author : kyh
 * @설명 : 마이페이지 나의연구 반입 신청 화면
 * =================================================================
 * 수정일         작성자             내용
 * -----------------------------------------------------------------------
 * 2023.05.02    bhs          파일생성
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



function fnPage(pageNo){
	$('input[name=pageIndex]').val(pageNo);
	$("#listFrm").attr("action", "/portal/myp/rsc/inf/viewMypRscInfIn.do").submit();
}


</script>


	<div class="wrap">

		<%@ include file="/WEB-INF/jsp/kcure/portal/myp/rsc/ViewMypRscInfNav.jsp" %>
		<form id="rjcFrm" name="rjcFrm" method="post">
			<input type="hidden" id="dataAplcNo2" name="dataAplcNo" value="">
			<input type="hidden" id="rsrAsmtNo2" name="rsrAsmtNo" value="">
			<input type="hidden" id="tkinDtapNo2" name="tkinDtapNo" value="">
		</form>

		<form id="listFrm" name="listFrm" method="post">
			<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>">
			<input type="hidden" id="dataAplcNo" name="dataAplcNo" value="">
			<input type="hidden" id="rsrAsmtNo" name="rsrAsmtNo" value="">
			<input type="hidden" id="tkinDtapNo" name="tkinDtapNo" value="">
			<input type="hidden" id="workIdx" name="workIdx">
			<input type="hidden" id="allListYn" name="allListYn" value="N">
		</form>
		<<div class="n_my_research_wiew_wrap">
			<div class="con">
				<div class="sub_pag_title">
					<p>반입방법</p>
					<ul>
						<li>반입 신청 버튼을 눌러 반입을 관리하세요</li>
						<li>반입신청 후 승인까지 2~3일 소요 되오니, 미리 신청 부탁드립니다</li>
					</ul>
				</div>
				<div class="n_gap_box">
				<div class="n_use_center_wrap">
							<p class="info_sub_red_txt">본인이 참여하거나 책임연구자로 지정된 연구의 활용센터 이용 신청 목록이 조회됩니다.</p>

					<c:if test="${fn:length(rscInfInList) == 0}">
                        <div class="item">
                            <table class="user_tb_l">
                                <tbody>
                                    <tr>
                                        <td style="text-align: center;">조회된 내용이 없습니다.</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </c:if>

                    <c:forEach items="${rscInfInList}" var="list" varStatus="rowInx" >

							<div class="use_center_info" style="margin-bottom: 30px;">
								<div class="top">
									<div class="item">
										<ul>
											<li>연구명</li>
											<!-- onclick시 마우스 포인터 변환 및 언더라인 -->
											<li>${list.rsrSbjNm}</li>
										</ul>
										<ul>
											<li>연구기간</li>
											<li>${list.rsrDtTerm}</li>
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
										<c:if test="${list.dataTpcdNm ne '결합' and list.tkinDtapCnt > 0}">
											<a onclick="javascript:openDtl(${rowInx.index}, '${list.dataAplcNo}', '${list.rsrAsmtNo}')" id="listView${rowInx.index}" class="n_plus_btn">리스트</a>
										</c:if>
										<c:if test="${list.dataTpcdNm ne '결합'}">
											<a onclick="javascript:movInForm('${list.dataAplcNo}', '${list.rsrAsmtNo}', '${list.tkinDtapYn}')" class="n_m_btn">신규 반입 신청</a>
										</c:if>
									</div>
								</div>

								<c:if test="${list.dataTpcdNm ne '결합'}">
	                                <div class="n_table_info">
										<div class="grid_area_wrap" id="gridView${rowInx.index}" style="height: 300px; background-color: #e2e2e2; border: 1px solid #DDDDDD; color: red;display:none;"></div>
									</div>
									<a onclick="javascript:openDtlMore(${rowInx.index}, '${list.dataAplcNo}', '${list.rsrAsmtNo}')" class="more_btn" id="gridMore${rowInx.index}" style="display: none;">더보기</a>
                                 </c:if>

								<c:if test="${list.dataTpcdNm eq '결합'}">
									<div class="sub_info_wrap">
										<p class="info_red_txt">* 결합은 안심활용센터가 아닌, 외부 결합기간의 분석센터를 활용하시게 됩니다.</p>
									</div>
								</c:if>
							</div>

                    </c:forEach>
                    </div>
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


<script type="text/javascript">
	var gridColumns = [
		{
			header: {
				text: "반입번호"
			},
			name: "tkinDtapNo",
			fieldName: "tkinDtapNo",
			type: "data",
			styleName: "ud-column-center",
			readOnly: true
		},
		{
			header: {
				text: "반입데이터명"
			},
			name: "tkinDataNmCont",
			fieldName: "tkinDataNmCont",
			styleName: "ud-column-center",
			renderer: {
				type: "html",
				callback: function (grid, cell) {
					var prgNm = grid.getValue(cell.index.itemIndex, 'tkinDataNmCont');
					var dataAplcNo = grid.getValue(cell.index.itemIndex, 'dataAplcNo');
					var tkinDtapNo = grid.getValue(cell.index.itemIndex, 'tkinDtapNo');
					var rsrAsmtNo = grid.getValue(cell.index.itemIndex, 'rsrAsmtNo');
					var str = "";

					str += " <a href='#' onclick='fnDetail(\""+dataAplcNo+"\", \""+tkinDtapNo+"\", \""+rsrAsmtNo+"\");' style='display:inline;color:blue;'>";
					str += prgNm + '</a>';

					return str;
				}
			}
		},
		{
			header: {
				text: "신청자"
			},
			name: "dataAplpNm",
			fieldName: "dataAplpNm",
			type: "data",
			styleName: "ud-column-center",
			readOnly: true
		},
		{
			header: {
				text: "신청일자"
			},
			name: "tkinDtapYmd",
			fieldName: "tkinDtapYmd",
			type: "data",
			styleName: "ud-column-center",
			readOnly: true
		},
		{
			header: {
				text: "상태"
			},
			name: "tkinDataProgStcd",
			fieldName: "tkinDataProgStcd",
			styleName: "ud-column-center",
			renderer: {
				type: "html",
				callback: function (grid, cell) {
					var cdChk = grid.getValue(cell.index.itemIndex, 'tkinDataProgStcd');
					var dataAplcNo = grid.getValue(cell.index.itemIndex, 'dataAplcNo');
					var tkinDtapNo = grid.getValue(cell.index.itemIndex, 'tkinDtapNo');
					var rsrAsmtNo = grid.getValue(cell.index.itemIndex, 'rsrAsmtNo');

					var str = "";

					str = '<div class="tb_btn_wrap">';
					if (cdChk == "U01") {	//U01 신청
						str = str + '<p class="f_dk_gray">승인대기중</p>';
					} else if (cdChk == "U02") {	//U02	승인
						str = str + '<p class="f_green">승인완료</p>';
					} else if (cdChk == "U03") {	//U03	반려
						str = str + '<p class="f_red">반려</p>';
						str = str + '<span onClick="javascript:viewRjcRsnCont(\''+dataAplcNo+'\', \''+rsrAsmtNo+'\', \''+tkinDtapNo+'\')" class="f_red">(사유보기)</span>';
					}else if (cdChk == "U04") {	//U04	부분승인
						str = str + '<p class="f_red">일부승인</p>';
						str = str + '<span onClick="javascript:viewRjcRsnCont(\''+dataAplcNo+'\', \''+rsrAsmtNo+'\', \''+tkinDtapNo+'\')" class="f_red">(사유보기)</span>';
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
				text: "연구과제번호"
			},
			name: "rsrAsmtNo",
			fieldName: "rsrAsmtNo",
			type: "data",
			styleName: "ud-column-center",
			readOnly: true,
			visible: false
		}
	];

	/**
	 * 리스트 보기 이벤트
	*/
	function openDtl(itemIndex, dataAplcNo, rsrAsmtNo){
		var toggleAct = $("#listView"+itemIndex).attr("class");

		if (toggleAct == "n_plus_btn") {
			$("#listView"+itemIndex).addClass('on');
			$("#gridView"+itemIndex).css("display", "block");
			$("#dataAplcNo").val(dataAplcNo);
			$("#rsrAsmtNo").val(rsrAsmtNo);
			$("#workIdx").val(itemIndex);
			$("#allListYn").val("N");

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
				action : "/portal/myp/rsc/inf/selectMypRscInfTkinList.do",
				form : "listFrm",
				dataProviderPram : gridDataProvider,
				gridViewPram : gridView,
				endEvent: srchEndEvent
			});
			/* 반입신청 그리드 조회 E */
		} else {
			$("#listView"+itemIndex).removeClass('on');
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
			action : "/portal/myp/rsc/inf/selectMypRscInfTkinList.do",
			form : "listFrm",
			dataProviderPram : gridDataProvider,
			gridViewPram : gridView,
			endEvent: srchEndEvent
		});
	}

	function srchEndEvent(endEventParam, response){
		console.log("--------------------srchEndEvent---------------------");
		console.log(endEventParam);
		console.log(response);

		if($("#allListYn").val() == "N" && response.totCnt > 5){
			$("#gridMore" + $("#workIdx").val()).css("display", "block");
		}else if($("#allListYn").val() == "Y"){
			$("#gridMore" + $("#workIdx").val()).css("display", "none");
		}

		if (endEventParam.length < 1) {
			alert("조회 결과가 없습니다.");
		}
		console.log("--------------------srchEndEvent---------------------");
	}


	function movInForm(dataAplcNo, rsrAsmtNo, tkinDtapYn){
		if(tkinDtapYn == "N"){
			alert("신규반입신청을 하실 수 없습니다.");
			return;
		}
		$("#dataAplcNo").val(dataAplcNo);
		$("#rsrAsmtNo").val(rsrAsmtNo);
		$("#listFrm").attr("action", "/portal/myp/rsc/inf/viewMypRscInfInForm.do").submit();
	}

	/*
	* 그리드 상세보기
	*/
	function fnDetail(dataAplcNo, tkinDtapNo, rsrAsmtNo){
		$("#dataAplcNo").val(dataAplcNo);
		$("#tkinDtapNo").val(tkinDtapNo);
		$("#rsrAsmtNo").val(rsrAsmtNo);
		$("#listFrm").attr("action", "/portal/myp/rsc/inf/viewMypRscInfInDetail.do").submit();
	}

	/*
	* 반려사유 보기
	*/
	function viewRjcRsnCont(dataAplcNo, rsrAsmtNo, tkinDtapNo) {
		$('#dataAplcNo2').val(dataAplcNo);
		$('#rsrAsmtNo2').val(rsrAsmtNo);
		$('#tkinDtapNo2').val(tkinDtapNo);

		var form = $("#rjcFrm").serialize();

		$.ajax({
	        type: "post",
	        url: "/portal/myp/rsc/inf/selectMypRscInfIn.do",
	        data: form,
	        dataType: 'json',
	        success: function (data) {
	        	if (data.result == "success") {
	        		var list = data.inInfoList;
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

