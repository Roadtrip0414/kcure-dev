<%
/* =================================================================
* @FileName : ViewAlarmConfig.jsp
* @date: 2023. 3. 29.
* @author : bhs
* @설명 :
* =================================================================
* 수정일 작성자 내용
* -----------------------------------------------------------------------
* 2023. 3. 29.  파일생성
* =================================================================
*/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>
<script type="text/javascript">

$('body').addClass('admin');

var _rowCnt = 0;

var fields = [
	  {
	    fieldName: "id",
	    dataType: "text"
	  },
	  {
	    fieldName: "observeItemCode",
	    dataType: "text"
	  },
	  {
		    fieldName: "compareTypeCode",
		    dataType: "text"
	  },
	  {
		    fieldName: "continueTimeMinute",
		    dataType: "text"
	  },
	  {
		    fieldName: "eventGradeTypeCode",
		    dataType: "text"
	  },
	  {
		    fieldName: "criticalValueContent",
		    dataType: "text"
	  },
	  {
		    fieldName: "criticalValueUnit",
		    dataType: "text"
	  },
	  {
		    fieldName: "observeConfigDetailContent",
		    dataType: "text"
	  },
	  {
		    fieldName: "createdDateTime",
		    dataType: "text"
	  },
	  {
		  	fieldName: "alarmGroupId",
		 	dataType: "text"
	  }
	];

var gridColumns = [
	{
		header: {
			text: "id"
		},
		name: "id",
		fieldName: "id",
		required: true,
		visible: false,
		type: "data",
		width: "140",
		tag: {
			dataType: "text"
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
	},
	{
		header: {
			text: "알림설정타입"
		},
		name: "observeItemCode",
		fieldName: "observeItemCode",
		type: "data",
		width: "50",
		sortable: false,
	    lookupDisplay: true,
	    values: [
	        "10003",
	        "10004",
	        "10005",
	        "10006",
	        "10007",
	        "10008",
	        "10009",
	        "10010",
	        "10011",
	        "10016",
	        "10017",
	        "10018",
	        "10019",
	        "10021",
	        "10022",
	        "10024",
	        "10025",
	        "10026",
	        "10027",
	        "10028",
	        "10029",
	        "10030",
	        "10031",
	        "10032",
	        "10033",
	        "10034",
	        "10035",
	        "10036",
	        "10037",
	        "10038",
	        "10039",
	        "10041",
	        "10042",
	        "10043",
	        "10044",
	        "10045",
	        "10046",
	        "10047",
	        "10048",
	        "10049",
	        "10050",
	        "10051",
	        "10052",
	        "10053",
	        "10054",
	        "10055",
	        "10056",
	        "10057",
	        "10058",
	        "10060",
	        "10061"
	    ],
	    labels: [
	        "Reboot",
	        "CPU Used",
	        "CPU Idle",
	        "CPU User",
	        "CPU System",
	        "CPU nice",
	        "CPU irq",
	        "CPU softirq",
	        "CPU iowait",
	        "Load 1 Min",
	        "Load 5 Min",
	        "Load 15 Min",
	        "Memory Used",
	        "Memory Used",
	        "Memory Free",
	        "Memory Buffers",
	        "Memory Cached",
	        "Memory pgpgin",
	        "Memory pgpgout",
	        "Swap Used",
	        "Swap Total",
	        "Swap Used",
	        "Read Count",
	        "Write Count",
	        "Disk Read",
	        "Disk Write",
	        "FileSystem Used",
	        "FileSystem Avail",
	        "FileSystem Used",
	        "FileSystem Mount",
	        "FileSystem i-node Used",
	        "FileSystem Recv",
	        "FileSystem Send",
	        "NIC Recv Packets",
	        "NIC Send Packets",
	        "NIC Recv Error Count",
	        "NIC Send Error Count",
	        "NIC Collision Count",
	        "User Count",
	        "Process Down",
	        "Process Total Count",
	        "Process Count",
	        "Process CPU",
	        "Process Memory",
	        "Process Memory",
	        "Process Thread Count",
	        "File Content",
	        "File Modification",
	        "File Size",
	        "Non-Modification",
	        "Non-Exist"
	    ],
	    editor: {
	        type: "dropdown"
	    }
	},
	{
		header: {
			text: "비교연산자"
		},
		name: "compareTypeCode",
		fieldName: "compareTypeCode",
		type: "data",
		width: "50",
		sortable: false,
	    lookupDisplay: true,
	    values: [
	        "CMPRTP_HAVE",
	        "CMPRTP_HAVENOT",
	        "CMPRTP_CHG",
	        "CMPRTP_NOCHG",
	        "CMPRTP_GE",
	        "CMPRTP_LE",
	        "CMPRTP_EQ",
	        "CMPRTP_NEQ"
	    ],
	    labels: [
	        "포함",
	        "비포함",
	        "변경",
	        "무변경",
	        "이상",
	        "이하",
	        "일치",
	        "불일치"	        
	    ],
	    editor: {
	        type: "dropdown"
	    }
	},
	{
		header: {
			text: "알림체크 지속시간(분)"
		},
		name: "continueTimeMinute",
		fieldName: "continueTimeMinute",
		type: "data",
		width: "50",
		tag: {
			dataType: "text"
		},
		styleName: "ud-column-center"
	},
	{
		header: {
			text: "이벤트 위험도"
		},
		name: "eventGradeTypeCode",
		fieldName: "eventGradeTypeCode",
		type: "data",
		type: "data",
		width: "50",
		sortable: false,
	    lookupDisplay: true,
	    values: [
	        "EVTLVL_H",
	        "EVTLVL_M",
	        "EVTLVL_L"
	    ],
	    labels: [
	        "상",
	        "중",
	        "하"  
	    ],
	    editor: {
	        type: "dropdown"
	    }
	},
	{
		header: {
			text: "지표감시 임계값"
		},
		name: "criticalValueContent",
		fieldName: "criticalValueContent",
		type: "data",
		width: "50",
		tag: {
			dataType: "text"
		},
		styleName: "ud-column-center"
	},
	{
		header: {
			text: "임계값 단위"
		},
		name: "criticalValueUnit",
		fieldName: "criticalValueUnit",
		type: "data",
		width: "50",
		tag: {
			dataType: "text"
		},
		styleName: "ud-column-center"
	},
	{
		header: {
			text: "알림설정 추가요구 값"
		},
		name: "observeConfigDetailContent",
		fieldName: "observeConfigDetailContent",
		type: "data",
		width: "50",
		tag: {
			dataType: "text"
		},
		styleName: "ud-column-center"
	},
	{
		header: {
			text: "생성일시"
		},
		name: "createdDateTime",
		fieldName: "createdDateTime",
		type: "data",
		width: "50",
		tag: {
			dataType: "text"
		},
		styleName: "ud-column-center",
		readOnly: true
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
					action : "/portal/sys/log/ifr/selectAlarmConfigList.do",
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
			
			for(var i=0;i< _rowCnt;i++){
				gridProvider.setValue(i, "alarmGroupId", alarmGroupId);
			}
			
			console.log("--------------------gridEndEvent---------------------");
		}

		/* 행추가 버튼 클릭  */
		$("#addBtn").click(function() {
			var alarmGroupIdVal = $("#alarmGroupId").val();
			if(alarmGroupIdVal == ""){
				return;
			}
			var values = {alarmGroupId: alarmGroupIdVal};
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
		 
		/*행삭제 후 실행 function  */
		var delEndEvent = function() {
			console.log("--------------------delEndEvent---------------------");
			console.log("--------------------delEndEvent---------------------");
		}

		/* 저장 버튼 클릭  */
		$("#saveBtn").click(function() {
			if(_rowCnt > 0){
				RG.doSave({
			    	 action : "/portal/sys/log/ifr/saveAlarmConfig.do" ,
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


</script>

<div class="wrap">
	<div class="con">
		<div class="area_wrap">
			<h1 style="font-size: x-large;font-weight: 500;">인프라 모니터링 [감시설정]</h1>
			<div class="section">
					<form id="srchForm" name="srchForm" method="post">
						<div class="search_wrap">
							<div class="item">
								<h4>알람그룹</h4>
								<select name="alarmGroupId" id="alarmGroupId" title="검색 범위" >
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