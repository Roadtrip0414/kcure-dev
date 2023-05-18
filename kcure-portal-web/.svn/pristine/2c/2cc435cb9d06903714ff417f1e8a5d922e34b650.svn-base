<%
/* =================================================================
* @FileName : ViewSrvyIvstg.jsp
* @date: 2023. 3. 29.
* @author : kyj
* @설명 :
* =================================================================
* 수정일 작성자 내용
* -----------------------------------------------------------------------
* 2023. 3. 29. kyj 파일생성
* =================================================================
*/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>
<script type="text/javascript">

var gridColumns = [
	{
		name: "prtiId",
		fieldName: "prtiId",
		visible: false,
	},
	{
		name: "srvyIvstgNo",
		fieldName: "srvyIvstgNo",
		visible: false,
	},
	{
		header: {
			text: "제목"
		},
		name: "srvyIvstgTtlNm",
		fieldName: "srvyIvstgTtlNm",
		type: "data",
		required: true,
		tag: {
			dataType: "text"
		},
		styleName: "ud-column-center",
		editor: {
			type: "line",
			maxLength: 200
		}
	},
	{
		header: {
			text: "링크 주소"
		},
		name: "lnkAddr",
		fieldName: "lnkAddr",
		renderer: { 
			type: "link",
			urlCallback: function (grid, cell) {
				return cell.value;
			},
			titleField: "lnkAddr"
		},
		styleName: "ud-column-center"
	},
	{
		header: {
			text: "처리자ID"
		},
		name: "lastModpId",
		fieldName: "lastModpId",
		type: "data",
		tag: {
			dataType: "text"
		},
		styleName: "ud-column-center",
		editable: false,
	},
	{
		header: {
			text: "게시"
		},
		name: "viewYn",
		fieldName: "viewYn",
		lookupDisplay: true,
		required: true,
		values: [
			"Y",
			"N"
		],
		styleName: "ud-column-center",
		editor: {
			type: "dropdown",
			domainOnly: true,
			textReadOnly: true
		}
	},
	{
		header: {
			text: "등록일"
		},
		name: "lastModfDt",
		fieldName: "lastModfDt",
		styleName: "ud-column-center",
		datetimeFormat: "yyyy-MM-dd",
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
			gridCheckBoxFlag: false,
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
						action : "/portal/sys/etc/srv/selectSrvyIvstg.do",
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

		/* 저장 버튼 클릭  */
		$("#saveBtn").click(function() {
			var errorCells = gridView.validateCells();			
			var rowCnt = gridDataProvider.getRowCount();
			var viewYn = gridView.getValue(0, "viewYn");
			
			if(errorCells != null && errorCells.length > 0){
				alert(lnkAddr);
				alert("입력 데이터 값을 확인 해주세요.");
				gridView.setCurrent({itemIndex: errorCells[0].dataRow , column: errorCells[0].column});
				return;

			}else {		
				for(let k=1; k<rowCnt; k++){				
					if(viewYn == "Y"){
						if(gridView.getValue(k, "viewYn") == "Y"){						
							alert("설문조사 게시는 하나만 할수 있습니다. 기존 설문 조사를 N으로 바꾼후 신규 설문조사를 Y로 게시해주세요");
							return;
						}
					}
				}
				
				RG.doSave({
					action : "/portal/sys/etc/srv/saveSrvyIvstg.do" ,
				    endEvent : saveEndEvent,
				    dataProviderPram : gridDataProvider,
				    gridViewPram : gridView,
				    showEndMessage:true,
				    cud: ["C","U","D","R"]
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
					<h4>검색어</h4>
					<input type="text" name="searchKeyword" id="searchKeyword"  value="" placeholder="검색어 입력"/>
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