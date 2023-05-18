<%
/* =================================================================
* @FileName : ViewQnaManage.jsp
* @date: 2023. 3. 7.
* @author : hjjeon
* @설명 : Qna 목록
* =================================================================
* 수정일 작성자 내용
* -----------------------------------------------------------------------
* 2023. 3. 7. hjjeon 파일생성
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
var qstnDlnStCombo = RG.setGridComboBox({
    action:"/portal/sys/usr/stt/getGridCombo.do", // 호출할 url
    cdAndNm : {labels:"detlCdNm",values:"detlCd"}, // values와 labels에 입력할 json Name값들 및 values 값 속성
    params:{gbCd : "QSTN_DLN_STCD"}
});
var instGnrSpCombo = RG.setGridComboBox({
    action:"/portal/sys/usr/stt/getGridCombo.do", // 호출할 url
    cdAndNm : {labels:"detlCdNm",values:"detlCd"}, // values와 labels에 입력할 json Name값들 및 values 값 속성
    params:{gbCd : "INST_GNR_SPCD"}
});

var gridColumns = [
{
	header: {
		text: "일반/기관"
	},
	name: "instGnrSpcd",
	fieldName: "instGnrSpcd",
	lookupDisplay: true,
    values: instGnrSpCombo.values,
    labels: instGnrSpCombo.labels,
    editor : {
        type: "dropdown",
        domainOnly: true,
        textReadOnly: true
    }
},
{
	header: {
		text: "구분"
	},
	name: "qstnClsSpcd",
	fieldName: "qstnClsSpcd",
	lookupDisplay: true,
    values: qstnClsSpCombo.values,
    labels: qstnClsSpCombo.labels,
    editor : {
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
	type: "data",
	styleName: "ud-column-left",
	width: "200"
},
{
	header: {
		text: "문의자"
	},
	name: "frstRegpNm",
	fieldName: "frstRegpNm",
	type: "data",
	styleName: "ud-column-center"
},
{
	header: {
		text: "작성일"
	},
	name: "frstRgstDt",
	fieldName: "frstRgstDt",
	type: "data",
	styleName: "ud-column-center"
},
{
	header: {
		text: "상태"
	},
	name: "qstnDlnStcd",
	fieldName: "qstnDlnStcd",
	lookupDisplay: true,
    values: qstnDlnStCombo.values,
    labels: qstnDlnStCombo.labels,
    editor : {
        type: "dropdown",
        domainOnly: true,
        textReadOnly: true
    },
    styleCallback: function(grid, dataCell){
        var ret = {}

        if(dataCell.value == '01'){
        	ret.styleName  = 'f_red';
        }

        return ret;
	}
},
{
	header: {
		text: "답변등록일"
	},
	name: "ansDt",
	fieldName: "ansDt",
	styleName: "ud-column-center",
	datetimeFormat: "yyyy-MM-dd"
},
{
	header: {
		text: "관리"
	},
	name: "deleteBtn",
	fieldName: "deleteBtn",
	styleName: "ud-column-center",
	renderer:{
	      type:"html",
	      callback: function(grid, cell, w, h) {
	    	  var qstnId = grid.getValue(cell.index.dataRow, 'qstnId');
	    	  var attfId = grid.getValue(cell.index.dataRow, 'attfId');
	          var str = '<div class="btn"><a href="##" onclick="fnDelete(\''+qstnId+'\',\''+attfId+'\');">삭제</a></div>';
	          return str;
	      }
	}
},
{
	header: {
		text: "ID"
	},
	name: "qstnId",
	fieldName: "qstnId",
	visible: false
},
{
	header: {
		text: "첨부파일ID"
	},
	name: "attfId",
	fieldName: "attfId",
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
			if(clickData.cellType != "header" && clickData.column != "deleteBtn"){
				$("input[name='qstnId']").val(grid.getValue(clickData.dataRow,"qstnId"));
				$("input[name='qstnDlnStcd']").val(grid.getValue(clickData.dataRow,"qstnDlnStcd"));
		    	$("#srchForm").attr("action", "/portal/sys/bbs/qna/detailViewQnaManage.do").submit();
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
						action : "/portal/sys/bbs/qna/selectQnaList.do",
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

		/* 초기화 */
		$("#initBtn").click(function(){
			var getInput = $("#srchForm input[type=text],input[type=date]");
			$.each(getInput, function (index, value) {
				$(value).val("");
		    });
			$("#searchCondition").val("");
			$("#searchKeyword2").val("");
			$("#searchKeyword3").val("");
			searchDate();
		});

		$("#srchForm").keydown(function (event) {
			if (event.keyCode === 13) {
				event.preventDefault();
				$("#srchBtn").click();
			}
		});
	});

	function fnDelete(obj1, obj2){
		if(confirm("삭제 하시겠습니까?")){
			$("input[name='qstnId']").val(obj1);
			$("input[name='attfId']").val(obj2);

			var val = $("#srchForm").serialize();

			$.ajax({
				url : "<c:url value='/portal/sys/bbs/qna/deleteQna.do'/>",
				type : "POST",
				data : val,
				dataType : 'json',
				success : function(data) {
					location.href = "/portal/sys/bbs/qna/viewQnaManage.do"
				},
				error : function() {
					alert("삭제 실패 하였습니다.");
				}
			});

		}

		return false;
	}
</script>

<div class="wrap">
	<div class="con">
		<div class="area_wrap">
			<div class="section">
				<div class="btn_info">
					<!-- p테그는 남겨줘야 자동으로 버튼이 오른쪽 정렬 -->
					<p></p>
					<div class="s_btn">
						<a href="javascript:void(0)" id="srchBtn">검색</a>
						<a href="javascript:void(0)" id="initBtn">초기화</a>
					</div>
				</div>

				<form id="srchForm" name="srchForm" method="post">
					<input type="hidden" name="qstnId" />
					<input type="hidden" name="attfId" />
					<input type="hidden" name="qstnDlnStcd" />
					<div class="search_wrap">
						<div class="item">
							<h4>검색대상</h4>
							<div class="sel_int">
								<select id="searchCondition" name="searchCondition">
									<option value="">선택</option>
									<option value="1">제목</option>
									<option value="2">제목+내용</option>
									<option value="3">내용</option>
								</select>
								<input type="text" id="searchKeyword1" name="searchKeyword1" value="" placeholder="검색어 입력" title="검색 키워드"/>
							</div>
						</div>
						<div class="item">
							<h4>등록일</h4>
							<div class="date_wrap">
								<ul>
									<li><input type="date" id="searchKeywordFrom" name="searchKeywordFrom" value="" placeholder="시작일자" title="검색 키워드" maxlength="10"/></li>
									<li>~</li>
									<li><input type="date" id="searchKeywordTo" name="searchKeywordTo" value="" placeholder="종료일자" title="검색 키워드" maxlength="10"/></li>
								</ul>
							</div>
						</div>
						<div class="item">
							<h4>카테고리</h4>
							<kcure:select id="searchKeyword2" name="searchKeyword2" grpCd="QSTN_CLS_SPCD" defaultText="선택"/>
						</div>
						<div class="item">
							<h4>상태</h4>
							<kcure:select id="searchKeyword3" name="searchKeyword3" grpCd="QSTN_DLN_STCD" defaultText="선택"/>
						</div>
					</div>
				</form>
					<!-- //boardtop-search -->
					<div class="btn_info">
						<p>총건수<span id="currCnt"></span>/<span id="totalCnt"></span></p>
<!-- 						<div class="s_btn"> -->
<!-- 							<a href="javascript:void(0)" id="registBtn">등록</a> -->
<!-- 						</div> -->
					</div>
					<!-- //boardpage-infor -->
					<div class="grid_area_wrap" id="gridView"></div>
					<div id="grid_paging" class="page_num"></div>
			</div>
		</div>
	</div>
</div>