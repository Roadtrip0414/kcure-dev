<%
/* =================================================================
* @FileName : ViewPrtQna.jsp
* @date: 2023. 3. 14.
* @author : hjjeon
* @설명 : 문의하기(기관) 목록
* =================================================================
* 수정일 작성자 내용
* -----------------------------------------------------------------------
* 2023. 3. 14. hjjeon 파일생성
* =================================================================
*/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>
<script type="text/javascript">
var qstnClsSpCombo = RG.setGridComboBox({
    action:"/portal/sys/usr/stt/getGridCombo.do", // 호출할 url
    cdAndNm : {labels:"detlCdNm",values:"detlCd"}, // values와 labels에 입력할 json Name값들 및 values 값 속성
    params:{gbCd : "QSTN_CLS_SPCD"}
});
var qstnDlnStcdCombo = RG.setGridComboBox({
    action:"/portal/sys/usr/stt/getGridCombo.do", // 호출할 url
    cdAndNm : {labels:"detlCdNm",values:"detlCd"}, // values와 labels에 입력할 json Name값들 및 values 값 속성
    params:{gbCd : "QSTN_DLN_STCD"}
});

var gridColumns = [
	{
		header: {
			text: "카테고리"
		},
		name: "qstnClsSpcd",
		fieldName: "qstnClsSpcd",
		lookupDisplay: true,
		required: true,
		values: qstnClsSpCombo.values,
	    labels: qstnClsSpCombo.labels,
		editor: {
	        type: "dropdown",
	        domainOnly: true,
	        textReadOnly: true
	    }
	},
	{
		header: {
			text: "진행상태"
		},
		name: "qstnDlnStcd",
		fieldName: "qstnDlnStcd",
		lookupDisplay: true,
		required: true,
		values: qstnDlnStcdCombo.values,
	    labels: qstnDlnStcdCombo.labels,
		editor: {
	        type: "dropdown",
	        domainOnly: true,
	        textReadOnly: true
	    }
	},
	{
		header: {
			text: "제목"
		},
		name: "qstnTtlNm",
		fieldName: "qstnTtlNm",
		styleName: "ud-column-left",
		width: "200",
		renderer:{
			type:"html",
			callback: function(grid, cell, w, h) {
			    var str = cell.value;
			    var qstnOpnYn = grid.getValue(cell.index.dataRow, 'qstnOpnYn');
				if(qstnOpnYn == "N"){
					str = "비밀글입니다.";
				}

			    return str;
			},
		},
	},
	{
		header: {
			text: "참여기관"
		},
		name: "prtiNm",
		fieldName: "prtiNm",
		type: "data",
		styleName: "ud-column-center"
	},
	{
		header: {
			text: "작성자"
		},
		name: "frstRegpNm",
		fieldName: "frstRegpNm",
		styleName: "ud-column-center",
		renderer:{
			type:"html",
			callback: function(grid, cell, w, h) {
			    var str = cell.value;
			    var qstnOpnYn = grid.getValue(cell.index.dataRow, 'qstnOpnYn');

				if(qstnOpnYn == "N"){
					str = str.substring(0,1)+"**";
				}

			    return str;
			}
		},
	},
	{
		header: {
			text: "등록일"
		},
		name: "frstRgstDt",
		fieldName: "frstRgstDt",
		type: "data",
		styleName: "ud-column-center"
	},
	{
		header: {
			text: "id"
		},
		name: "qstnId",
		fieldName: "qstnId",
		visible: false
	},
	{
		header: {
			text: "오픈여부"
		},
		name: "qstnOpnYn",
		fieldName: "qstnOpnYn",
		visible: false
	}
	];

var searchDate;

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

		gridView.onCellClicked = function (grid, clickData) {
			if(clickData.cellType != "header"){
				$("#srchForm input[name='pageIndex']").val($("#grid_paging input[name='pageIndex']").val());
				$("input[name='qstnId']").val(grid.getValue(clickData.dataRow,"qstnId"));
				var qstnOpnYn = grid.getValue(clickData.dataRow,"qstnOpnYn");

				if(qstnOpnYn == "N"){
					$(".kc_layer_popup").addClass("on");
					return false;
				}

		    	$("#srchForm").attr("action", "/portal/bbs/prt/qna/detailViewPrtQna.do").submit();
			}
		}

		//초기 세팅(주의: 조회 함수 밑에 둬야 함)
		RG.initPattern({
			dataProviderPram : gridDataProvider,
			gridViewPram : gridView,
			gridCheckBoxFlag: false,
			form : "srchForm",
			editable: false,
			footerBarFlag : false
		});

		// [Btn] 조회 Clik.
		$("#srchBtn").click(function() {
			if($("#searchCondition").val() != "" && $("#searchCondition").val() != null){
				if($("#searchKeyword1").val() != "" && $("#searchKeyword1").val() != null){
					searchDate();
				}else{
					alert("검색어를 입력해주세요.");
					return false;
				}
			}else{
				searchDate();
			}
		});

		searchDate = function() {
			RG.doQuery({
						action : "/portal/bbs/prt/qna/selectQnaList.do",
						form : "srchForm",
						dataProviderPram : gridDataProvider,
						gridViewPram : gridView,
						endEvent: gridEndEvent,
						pagingId:"grid_paging",
						totalId: "totalCnt",
						currCntId: "currCnt"
					});
		}


		/* 조회 완료시 실행된 스크립트 정리   */
		var gridEndEvent = function(endEventParam, response) {
			console.log("--------------------gridEndEvent---------------------");
			console.log(endEventParam);
			console.log(response);
			console.log("--------------------gridEndEvent---------------------");
		}

		/* 조회 */
		searchDate();

		$("#srchForm").keydown(function (event) {
			if (event.keyCode === 13) {
				event.preventDefault();
				$("#srchBtn").click();
			}
		});
	});

//목록 이동
function fnList(obj){
	//tab search
	$("input[name='searchKeyword']").val(obj);

	//tab on 기능
	const aLink = $(".board_tab").find("a");
	if(aLink.length > 0){
		aLink.each(function(){
			$(this).removeClass("on");
		});
	}
	if(obj != ''){
		$("#qstnClsSp_"+obj).attr("class","on");
	}else{
		$("#qstnClsSpAll").attr("class","on");
	}

	//검색
	searchDate();
}

function fnRegist(){
	$("#srchForm").attr("action", "/portal/bbs/prt/qna/insertPrtQna.do").submit();
}

function fnPwCheck(){
	const wtrPswd = $("#wtrPswd").val();

	if(wtrPswd != null && wtrPswd != ""){
		$("input[name='wtrPswd']").val(wtrPswd);

		var data = $("#srchForm input").serialize();

		$.ajax({
			url: "<c:url value='/portal/bbs/prt/qna/qnaPwCheck.do'/>",
			type:"POST",
			data: data,
			dataType: "json",
			success: function(resp){
				console.log(resp);
				if(resp.errMsg != null && resp.errMsg != ""){
					alert(resp.errMsg);
					$("#wtrPswd").val("");
					return;
				}else{
					$("#srchForm").attr("action", "/portal/bbs/prt/qna/detailViewPrtQna.do").submit();
				}
			},
			err: function(err){
				console.log("err:", err);
			}
		});
	}else{
		alert("비밀번호를 입력해주세요.");
		return false;
	}
}
</script>
<div class="wrap">
	<div class="sub_visual_wrap">
		<div class="notice">
			<ul>
				<li>문의하기</li>
			</ul>
		</div>
	</div>
	<div class="sub_nav_wrap">
		<!-- class="on"시 색변경 및 보더 생김 -->
		<a href="/portal/bbs/prt/ntc/viewPrtNtc.do" class="">공지사항</a>
		<a href="/portal/bbs/prt/faq/viewPrtFaq.do" class="">FAQ</a>
		<a href="/portal/bbs/prt/qna/viewPrtQna.do" class="on">문의하기</a>
	</div>
	<div class="inquiry_list_wrap">
		<div class="con">
			<div class="sub_pag_title">
				<p>문의하기</p>
				<span>K-CURE 포털을 이용하시는 참여기관을 위한 문의/답변 창구입니다.</span>
			</div>
			<div class="board_tab">
				<ul>
					<!-- class="on"일때 활성화 -->
					<li><a href="javascript:void(0)" id="qstnClsSpAll" class="${searchVO.searchKeyword eq '00' || searchVO.searchKeyword eq '' ? 'on' : ''}" onclick="fnList('');">전체</a></li>
					<c:forEach var="list" items="${qstnClsSpcdList}" >
						<li><a href="javascript:void(0)" onclick="fnList('<c:out value="${list.detlCd}"/>');" class="${searchVO.searchKeyword eq list.detlCd ? 'on' : ''}" id="qstnClsSp_${list.detlCd}" tabId="${list.detlCd}">${list.detlCdNm}</a></li>
					</c:forEach>
				</ul>
			</div>
			<form id="srchForm" name="srchForm" method="post">
				<input type="hidden" name="searchKeyword" value="${searchVO.searchKeyword}"/>
				<input type="hidden" name="qstnId" />
				<input type="hidden" name="wtrPswd" />
				<input type="hidden" name="pageIndex" value="${searchVO.pageIndex}"/>
				<div class="board_info">
					<p>전체 <span id="totalCnt"></span>건</p>
					<div class="search">
						<select class="user_sel" id="searchCondition" name="searchCondition">
							<option value="2">전체</option>
							<option value="1" ${searchVO.searchCondition eq '1' ? 'selected' : ''}>제목</option>
							<option value="3" ${searchVO.searchCondition eq '3' ? 'selected' : ''}>내용</option>
						</select>
						<input type="text" class="user_int" id="searchKeyword1" name="searchKeyword1" value="${searchVO.searchKeyword1}" placeholder="검색어 입력" title="검색 키워드"/>
						<a href="javascript:void(0)" class="btn" id="srchBtn">검색</a>
					</div>
				</div>
			</form>
			<div class="grid_area_wrap" id="gridView"></div>
            <div class="n_btn_inn">
            	<c:if test="${loginVO != null }">
                <a href="javascript:void(0)" class="m_btn bc_blue" onclick="fnRegist();">문의하기</a>
                </c:if>
            </div>
			<div id="grid_paging" class="page_num"></div>
		</div>
	</div>
</div>
<div class="kc_layer_popup">
	<div class="kc_popup_box secret">
		<a href="javascript:void(0)" class="btn kc_close"></a>
		<div class="title">
			<p>비밀번호 입력</p>
		</div>
		<div class="popup_con">
			<p>이글은 비밀글 입니다. 비밀번호를 입력해주세요.</p>
               <input type="password" placeholder="비밀번호" class="user_int" id="wtrPswd" />
		</div>
		<div class="l_btn">
			<a href="javascript:void(0)" class="bc_blue" onclick="fnPwCheck();">확인</a>
		</div>
	</div>
</div>