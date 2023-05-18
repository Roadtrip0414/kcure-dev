<%
/* =================================================================
* @FileName : ViewAlarmGroup.jsp
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

var fields = [
	  {
	    fieldName: "id",
	    dataType: "text"
	  },
	  {
	    fieldName: "name",
	    dataType: "text"
	  },
	  {
		    fieldName: "alarmTypeEmail",
		    dataType: "text"
	  },
	  {
		    fieldName: "alarmTypePhone",
		    dataType: "text"
	  },
	  {
		    fieldName: "createdDateTime",
		    dataType: "text"
	  },
	  {
		    fieldName: "updatedDateTime",
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
			text: "알림그룹명"
		},
		name: "name",
		fieldName: "name",
		type: "data",
		width: "50",
		tag: {
			dataType: "text"
		},
		styleName: "ud-column-center",
		editor: {
	        type: "line",
	        maxLength: 30
	    }
	},
	{
		header: {
			text: "이메일 알림설정"
		},
		name: "alarmTypeEmail",
		fieldName: "alarmTypeEmail",
		type: "data",
		width: "50",
		renderer: {
			type: "check",
			trueValues: "true",
			falseValues: "false"
		}
	},
	{
		header: {
			text: "핸드폰 알림설정"
		},
		name: "alarmTypePhone",
		fieldName: "alarmTypePhone",
		type: "data",
		width: "50",
		renderer: {
			type: "check",
			trueValues: "true",
			falseValues: "false"
		}
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
	},
	{
		header: {
			text: "변경일시"
		},
		name: "updatedDateTime",
		fieldName: "updatedDateTime",
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
			searchData();
		});

		var searchData = function() {
			RG.doQuery({
					action : "/portal/sys/log/ifr/selectAlarmGroupList.do",
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
			console.log("--------------------gridEndEvent---------------------");
		}

		/* 행추가 버튼 클릭  */
		$("#addBtn").click(function() {
			 RG.insertRowGrid({
				dataProviderPram : gridProvider,
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
				, dataProviderPram: gridProvider
				, endEvent: delEndEvent
			});
			/* treeProvider.insertRow(0,[]); */
		});
		
		/*행삭제 후 실행 function  */
		var delEndEvent = function() {
			console.log("--------------------delEndEvent---------------------");
			console.log("--------------------delEndEvent---------------------");
		}


		/* 저장 버튼 클릭  */
		$("#saveBtn").click(function() {
			var log = gridView.validateCells(null, false);
			if(JSON.stringify(log) == 'null'){
			    RG.doSave({
			    	 action : "/portal/sys/log/ifr/saveAlarmGroup.do" ,
				     endEvent : saveEndEvent,
				     dataProviderPram : gridProvider,
				     gridViewPram : gridView,
				     showEndMessage:true,
				     cud: ["C", "U","D","R"]
			     });
			}else{
				alert("필수 값을 입력하세요.");
				return;
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
			<h1 style="font-size: x-large;font-weight: 500;">인프라 모니터링 [알림그룹]</h1>
			<div class="section">
					<form id="srchForm" name="srchForm" method="post">	
				    </form>
					<!-- p테그는 남겨줘야 자동으로 버튼이 오른쪽 정렬 -->
					<p></p>
	
					<div class="btn_center" style="justify-content: right;">
						<a href="javascript:void(0)" id="srchBtn" class="bc_blue">조회</a>
					  	<a href="javascript:void(0)" id="addBtn" class="bc_blue">신규</a>
						<a href="javascript:void(0)" id="saveBtn" class="bc_blue">저장</a>
						<a href="javascript:void(0)" id="delBtn" class="bc_red"> 삭제</a>
					</div>
			</div>		
		</div>
		
		<div class="grid_area_wrap" id="gridView" style="height: 500px;overflow:auto;"></div>
	</div>
</div>
