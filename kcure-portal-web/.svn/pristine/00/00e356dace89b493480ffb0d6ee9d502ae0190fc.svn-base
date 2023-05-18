<%
/* =================================================================
* @FileName : ViewAuthorManage.jsp
* @date: 2023. 1. 3.
* @author : hjjeon
* @설명 :
* =================================================================
* 수정일 작성자 내용
* -----------------------------------------------------------------------
* 2023. 1. 3. hjjeon 파일생성
* =================================================================
*/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>
<script type="text/javascript">
var authSpcdCombo = RG.setGridComboBox({
    action:"/portal/sys/usr/stt/getGridCombo.do", // 호출할 url
    cdAndNm : {labels:"detlCdNm",values:"detlCd"}, // values와 labels에 입력할 json Name값들 및 values 값 속성
    params:{gbCd : "AUTH_SPCD"}
});

var gridColumns = [
{
	header: {
		text: "권한ID"
	},
	name: "authId",
	fieldName: "authId",
	type: "data",
// 	required: true,
	editable: false,
	tag: {
		dataType: "text"
	},
	styleName: "ud-column-center",
	width:"50",
	editor: {
        type: "line",
        maxLength: 10
    }
},
{
	header: {
		text: "권한구분"
	},
	name: "authSpcd",
	fieldName: "authSpcd",
	lookupDisplay: true,
	required: true,
	values: authSpcdCombo.values,
    labels: authSpcdCombo.labels,
	styleName: "ud-column-center",
	width:"50",
	editor: {
        type: "dropdown",
        domainOnly: true,
        textReadOnly: true
    }
},
{
	header: {
		text: "권한명"
	},
	name: "authNm",
	fieldName: "authNm",
	type: "data",
	required: true,
	tag: {
		dataType: "text"
	},
	styleName: "ud-column-center",
	width:"100",
	editor: {
        type: "line",
        maxLength: 200
    }
},
{
	header: {
		text: "설명"
	},
	name: "authExplCont",
	fieldName: "authExplCont",
	type: "data",
	required: true,
	tag: {
		dataType: "text"
	},
	styleName: "ud-column-left",
	width:"200",
	editor: {
        type: "line",
        maxLength: 200
    }
},
{
	header: {
		text: "사용여부"
	},
	name: "authUseYn",
	fieldName: "authUseYn",
	lookupDisplay: true,
	required: true,
	values: [
        "Y",
        "N"
    ],
	styleName: "ud-column-center",
	width:"50",
	editor: {
        type: "dropdown",
        domainOnly: true,
        textReadOnly: true
    }
},
{
	header: {
		text: "등록일자"
	},
	name: "frstRgstDt",
	fieldName: "frstRgstDt",
	styleName: "ud-column-center",
    datetimeFormat: "yyyy-MM-dd",
    width:"50",
    editable: false
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
		gridView.editOptions.commitLevel = "error";
		//그리드 컬럼 정보 세팅
		setFieldsNColumns(gridDataProvider, gridView, gridColumns);

		//초기 세팅(주의: 조회 함수 밑에 둬야 함)
		RG.initPattern({
			dataProviderPram : gridDataProvider,
			gridViewPram : gridView,
			gridCheckBoxFlag: true,
			form : "srchForm",
			editable:true,
			footerBarFlag : false
		});
		// [Btn] 조회 Clik.
		$("#srchBtn").click(function() {
			searchDate();
		});
		var searchDate = function() {
			RG.doQuery({
						action : "/portal/sys/aum/mng/selectAuthorManage.do",
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

		/* 행추가 버튼 클릭  */
		$("#addBtn").click(function() {
			 RG.insertRowGrid({
				dataProviderPram : gridDataProvider,
				dataValues:[],
				endEvent: addEndEvent
			});
		});

		/*행추가 후 실행 function  */
		var addEndEvent = function() {
			console.log("--------------------addEndEvent---------------------");
			console.log("--------------------addEndEvent---------------------");
		}


		 /* RG.deleteCreateRowGrid({ gridViewPram: gridView, dataProviderPram: dataProvider }); */

		/* 행삭제 버튼 클릭  */
		$("#delBtn").click(function() {
			RG.deleteRowGrid({
				gridViewPram: gridView
				, dataProviderPram: gridDataProvider
				, endEvent: delEndEvent
			});
			/* gridDataProvider.insertRow(0,[]); */
		});

		/*행삭제 후 실행 function  */
		var delEndEvent = function() {
			console.log("--------------------delEndEvent---------------------");
			console.log("--------------------delEndEvent---------------------");
		}


		/* 저장 버튼 클릭  */
		$("#saveBtn").click(function() {
			/*
			 * parameter: json 타입
		     *            action : 호출할 url
		     *            endEvent : 저장 이후 처리되는 함수 설정
		     *            endPram : endEvent에 넘길 파라미터
		     *            dataProviderPram : 조회된 리턴값 dataProvider
		     *            gridViewPram : 그리드 ID
		     *            checkBinding : 입력한 스트링값에 대해서 변수를 설정하고, 그 변수에 Y,N값을 체크에 따라서 설정하게 함
		     * ex : action : "/stock/report/searchStkReportDestructionListTest.action" ,
		     *            form : "srchForm",
		     *            endEvent : fnCall
		     *            endPram : "스트링,json,숫자"
		     *            dataProviderPram : dataProvider,
		     *            gridViewPram : realgrid
		     *            checkBinding : "checked"
		     */
			var errorCells = gridView.validateCells();
			if(errorCells != null && errorCells.length > 0){
				alert("입력 데이터 값을 확인 해주세요.");
				gridView.setCurrent( {itemIndex: errorCells[0].dataRow , column: errorCells[0].column } );
				return;
			}else{
			     RG.doSave({
			    	 action : "/portal/sys/aum/mng/saveAuthor.do" ,
				     endEvent : saveEndEvent,
				     dataProviderPram : gridDataProvider,
				     gridViewPram : gridView,
				     showEndMessage:true,
				     cud: ["C", "U","D","R"]
			     });
			}
		});

		/*저장 후 실행 function  */
		var saveEndEvent = function() {
			console.log("--------------------saveEndEvent---------------------");
			searchDate();
			console.log("--------------------saveEndEvent---------------------");
		}

		/* 조회 */
		searchDate();

		/* 초기화 */
		$("#initBtn").click(function(){
			$("#searchKeyword").val("");
			searchDate();
		});

		$("#srchForm").keydown(function (event) {
			if (event.keyCode === 13) {
				event.preventDefault();
				$("#srchBtn").click();
			}
		});
	});
</script>
<div class="wrap">
	<!-- con -->
	<div class="con">
		<div class="section">
			<div class="btn_info">
				<!-- p테그는 남겨줘야 자동으로 버튼이 오른쪽 정렬 -->
				<p></p>
				<div class="s_btn">
					<a href="javascript:void(0)" id="srchBtn">조회</a>
					<a href="javascript:void(0)" id="initBtn">초기화</a>
				</div>
			</div>
			<div class="search_wrap">
				<form id="srchForm" name="srchForm" method="post">
				<div class="item">
					<h4>권한명</h4>
					<input type="text" name="searchKeyword" id="searchKeyword"  value="" placeholder="검색어 입력" title="검색 키워드"/>
				</div>
				</form>
			</div>
			<div class="btn_info">
				<!-- p테그는 남겨줘야 자동으로 버튼이 오른쪽 정렬 -->
				<p>총건수<span id="currCnt"></span>/<span id="totalCnt"></span></p>
				<div class="s_btn">
					<a href="javascript:void(0)" id="addBtn">신규</a>
					<a href="javascript:void(0)" id="saveBtn">저장</a>
				</div>
			</div>

			<div class="grid_area_wrap" id="gridView"></div>
			<div id="grid_paging" class="page_num"></div>
		</div>
		<!-- //section -->
	</div>
	<!-- //con -->
</div>