<%
/* =================================================================
* @FileName : ViewAlarmInstance.jsp
* @date: 2023. 3. 30.
* @author : bhs
* @설명 :
* =================================================================
* 수정일 작성자 내용
* -----------------------------------------------------------------------
* 2023. 3. 30.  파일생성
* =================================================================
*/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>
<script type="text/javascript">
/* var rsrSpcdCombo = RG.setGridComboBox({
    action:"/portal/sys/usr/stt/getGridCombo.do", // 호출할 url
    cdAndNm : {labels:"detlCdNm",values:"detlCd"}, // values와 labels에 입력할 json Name값들 및 values 값 속성
    params:{gbCd : "RSR_SPCD"}
});
 */
 
$('body').addClass('admin');

var _rowCnt = 0;

var fields = [
	  {
	    fieldName: "hostId",
	    dataType: "text"
	  },
	  {
	    fieldName: "instanceId",
	    dataType: "text"
	  },
	  {
	  	fieldName: "alarmGroupId",
	 	dataType: "text"
	  },
	  {
	  	fieldName: "alarmGroupNm",
	 	dataType: "text"
	  }
	];

var gridColumns = [
	{
		header: {
			text: "hostId"
		},
		name: "hostId",
		fieldName: "hostId",
		required: true,
		visible:false,
		type: "data",
		width: "140",
		tag: {
			dataType: "text"
		}
	},
	{
		header: {
			text: "알림그룹명"
		},
		name: "alarmGroupNm",
		fieldName: "alarmGroupNm",
		required: true,
		type: "data",
		width: "140",
		tag: {
			dataType: "text"
		}
	},
	{
		header: {
			text: "인스턴스명"
		},
		name: "instanceId",
		fieldName: "instanceId",
		required: true,
		type: "data",
		width: "80",
		sortable: false,
	    lookupDisplay: true,
	    values: [
	        "96540f8c-2159-4bf8-b0b6-ef5ef5d6c504",
	        "2102b3c2-dbc4-4759-a8a1-e60d76fc8ee4",
	        "d29bdd2d-0671-4149-92f8-0bb962a0d93f",
	        "acf7d00c-365e-4321-aae3-04d09ba559d6",
	        "ecb6315e-a976-420d-80a7-6a6c3515da06",
	        "7dabfc26-3f16-40cf-a43a-c77c386a191c",
	        "2075bf10-bec8-46ca-ab76-8c4b450bd48c"
	    ],
	    labels: [
	        "K-Cure Web #1 QA",
	        "K-Cure Web #2 QA",
	        "K-Cure Web #1 OP",
	        "K-Cure Web #2 OP",
	        "K-Cure WAS #1 QA",
	        "K-Cure WAS #1 OP",
	        "K-Cure WAS #2 OP"	        
	    ],
	    editor: {
	        type: "dropdown"
	    }
	},
	{
		header: {
			text: "alarmGroupId"
		},
		name: "alarmGroupId",
		fieldName: "alarmGroupId",
		required: true,
		visible: false,
		type: "data",
		width: "140",
		tag: {
			dataType: "text"
		}
	}
];

$(document).ready(function() {
		//그리드
		var gridProvider = new RealGrid.LocalDataProvider();
		var gridView = new RealGrid.GridView("gridView");
		gridView.setDataSource(gridProvider);

		gridView.setColumns(gridColumns);
		/* 자동 컬럼 크기 조절  */
		gridView.displayOptions.fitStyle = "fill";
		gridView.displayOptions.syncGridHeight = "always";
		gridView.editOptions.commitLevel = "error";
		
		gridView.displayOptions.syncGridHeight = "none" 
		
		//수정금지
		gridView.editOptions.editable = true;
		gridView.editOptions.updatable = false;

		//그리드 컬럼 정보 세팅
		gridView.setColumns(gridColumns);
		gridProvider.setFields(fields);

		//초기 세팅(주의: 조회 함수 밑에 둬야 함)
		RG.initPattern({
			dataProviderPram : gridProvider,
			gridViewPram : gridView,
			gridCheckBoxFlag: true,
			form : "srchForm",
			editable:true,
			footerBarFlag : false
		});
		
		// [Btn] 조회 Clik.
		$("#srchBtn").click(function() {
			if($("#alarmGroupId").val() == ""){
				return;
			}
			searchData();
		});

		var searchData = function() {
			RG.doQuery({
					action : "/portal/sys/log/ifr/selectAlarmInstanceList.do",
					form : "srchForm",
					dataProviderPram : gridProvider,
					gridViewPram : gridView,
					endEvent: gridEndEvent
				});
		}

		

		/* 조회 완료시 실행된 스크립트 정리   */
		var gridEndEvent = function(endEventParam, response) {
			console.log("--------------------gridEndEvent---------------------");
			console.log(endEventParam);
			console.log(response);
			
			_rowCnt = gridProvider.getRowCount();
			var alarmGroupId = $("#alarmGroupId").val();
			var alarmGroupNm = $("#alarmGroupId option:checked").text()
			
			for(var i=0;i< _rowCnt;i++){
				gridProvider.setValue(i, "alarmGroupId", alarmGroupId);
				gridProvider.setValue(i, "alarmGroupNm", alarmGroupNm);
			}
			
			console.log("--------------------gridEndEvent---------------------");
		}

		/* 행추가 버튼 클릭  */
		$("#addBtn").click(function() {
			var alarmGroupIdVal = $("#alarmGroupId").val();
			if(alarmGroupIdVal == ""){
				return;
			}
			var values = {alarmGroupId: alarmGroupIdVal, alarmGroupNm: $("#alarmGroupId option:checked").text()};
			var dataRow = gridProvider.addRow(values);
			gridView.setCurrent({dataRow: dataRow}); //추가된 행으로 포커스 이동
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
				, dataProviderPram: gridProvider
				, endEvent: delEndEvent
			});
		});
		 
		var timerId;

		$("#alarmGroupId").change(function() {
		  if ($("#alarmGroupId").val() == "") {
		    return;
		  }
		  clearTimeout(timerId);
		  timerId = setTimeout(function() {
		    searchData();
		  }, 500);
		});
		 
		/*행삭제 후 실행 function  */
		var delEndEvent = function() {
			console.log("--------------------delEndEvent---------------------");
			console.log("--------------------delEndEvent---------------------");
		}

		/* 저장 버튼 클릭  */
		$("#saveBtn").click(function() {
			if($("#alarmGroupId").val() != ""){
				RG.doSave({
			    	 action : "/portal/sys/log/ifr/saveAlarmInstance.do" ,
				     endEvent : saveEndEvent,
				     dataProviderPram : gridProvider,
				     gridViewPram : gridView,
				     showEndMessage:true,
				     cud: ["C", "U","D","R"]
			     });
			}
		}); 

		/*저장 후 실행 function  */
		var saveEndEvent = function() {
			console.log("--------------------saveEndEvent---------------------");
			searchData();
			console.log("--------------------saveEndEvent---------------------");
		}

});

function fnChangeCmb(){
	if($("#alarmGroupId").val() == ""){
		return;
	}
	searchData();
}


</script>

<div class="wrap">
	<div class="con">
		<div class="area_wrap">
			<h1 style="font-size: x-large;font-weight: 500;">인프라 모니터링 [알림-인스턴스 연동]</h1>
			<div class="section">
					<form id="srchForm" name="srchForm" method="post">
						<div class="search_wrap">
							<div class="item">
								<h4>알림그룹</h4>
								<select name="alarmGroupId" id="alarmGroupId" title="검색 범위" onchange="fnChangeCmb()">
									  <option value="">선택</option>
                                        <c:forEach var="list" items="${alarmGrpList}">
						                    <option value="${list.id}">${list.name}</option>
						                </c:forEach>
								</select>
							</div>
						</div>			
					</form>
					<!-- p테그는 남겨줘야 자동으로 버튼이 오른쪽 정렬 -->
					<p></p>
	
					<div class="btn_center" style="justify-content: right;">
						<a href="javascript:void(0)" id="srchBtn" class="bc_blue">조회</a>
					  	<a href="javascript:void(0)" id="addBtn" class="bc_blue">신규</a>
						<a href="javascript:void(0)" id="saveBtn" class="bc_blue">저장</a>
						<a href="javascript:void(0)" id="delBtn" class="bc_red"> 삭제</a>
					</div>

				<!-- 리얼그리드 영역 | 나중에 style 삭제요망-->
			</div>
			
		</div>
		<div class="grid_area_wrap" id="gridView" style="height: 500px;overflow:auto;"></div>
	</div>
</div>