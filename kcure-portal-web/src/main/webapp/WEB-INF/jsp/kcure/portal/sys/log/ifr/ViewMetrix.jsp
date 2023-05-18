<%
/* =================================================================
* @FileName : ViewMetrix.jsp
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
	    fieldName: "volume",
	    dataType: "text"
	  },
	  {
	    fieldName: "timestamp",
	    dataType: "text"
	  }
	];

var gridColumns = [
	{
		header: {
			text: "Volume"
		},
		name: "volume",
		fieldName: "volume",
		required: true,
		type: "data",
		width: "140",
		tag: {
			dataType: "text"
		},
		styleName: "ud-column-center",
		editor: {
	        type: "line",
	        maxLength: 50
	    },
	    renderer : {
	        showTooltip : true
	    }
	},
	{
		header: {
			text: "조회일시"
		},
		name: "timestamp",
		fieldName: "timestamp",
		type: "data",
		width: "50",
		tag: {
			dataType: "text"
		},
		styleName: "ud-column-center",
		editor: {
	        type: "line",
	        maxLength: 10
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
			if(fnInValidate()){
				return;
			}
			searchData();
		});

		var searchData = function() {
			RG.doQuery({
					action : "/portal/sys/log/ifr/selectMetrixList.do",
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
			gridProvider.insertChildRow(0, 0, [], -1, false);
// 			 RG.insertRowGrid({
// 				dataProviderPram : treeProvider,
// 				dataValues:[],
// 				endEvent: addEndEvent
// 			});
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
		/* $("#saveBtn").click(function() {
			var log = gridView.validateCells(null, false);
			if(JSON.stringify(log) == 'null'){
			    var rows = treeView.getCheckedRows();

				if(rows.length > 0){
				     RG.doSave({
				    	 action : "/portal/sys/mnu/mng/saveMenuManage.do" ,
					     endEvent : saveEndEvent,
					     dataProviderPram : treeProvider,
					     gridViewPram : treeView,
					     showEndMessage:true,
					     cud: ["C", "U","D","R"]
				     });
				}else{
					alert("선택된 값이 없습니다.");
					return;
				}
			}else{
				alert("필수 값을 입력하세요.");
				return;
			}
		}); */

		/*저장 후 실행 function  */
		var saveEndEvent = function() {
			console.log("--------------------saveEndEvent---------------------");
			searchDate();
			console.log("--------------------saveEndEvent---------------------");
		}
		
		$("#instanceGubun").change(function(){
			let gubunVal = $(this).val();
			
			$("#instance01").css("display", "none");
			$("#instance02").css("display", "none");
			$("#instance03").css("display", "none");
			
			if(gubunVal == "01"){
				$("#instance01").css("display", "flex");
			}else if(gubunVal == "02"){
				$("#instance02").css("display", "flex");
			}else{
				$("#instance03").css("display", "flex");
			}
		});

});


function fnInValidate(){
	let result = false;
	let gubunVal = $("#instanceGubun").val();
	
	if(gubunVal == "01"){
		let seletor = $("#instance01").find("select").val();
		if(seletor == ""){
			alert("인스턴스를 선택해주세요.");
			return true
		}
	}else if(gubunVal == "02"){
		let seletor = $("#instance02").find("select").val();
		if(seletor == ""){
			alert("인스턴스를 선택해주세요.");
			return true
		}
	}else if(gubunVal == "03"){
		let seletor = $("#instance03").find("select").val();
		if(seletor == ""){
			alert("인스턴스를 선택해주세요.");
			return true
		}
	}else{
		alert("인스턴스 구분을 선택해주세요.");
		return true
	}
	
	if($("#mtrxCd").val() == ""){
		alert("지표코드를 선택해주세요.");
		return true
	}
	
	if($("#startTime").val() == ""){
		alert("시작일시를 입력해주세요.");
		$("#startTime").focus();
		return true
	}
	
	if($("#endTime").val() == ""){
		alert("종료일시를 입력해주세요.");
		$("#endTime").focus();
		return true
	}
}

function fnSetInstanceId(val){
	$("#instanceId").val(val);
}

</script>

<div class="wrap">
	<div class="con">
		<div class="area_wrap">
			<h1 style="font-size: x-large;font-weight: 500;">인프라 모니터링 [지표조회]</h1>
			<div class="section">
				<form id="srchForm" name="srchForm" method="post">
					<input type="hidden" id="instanceId" name="instanceId">
					<div class="search_wrap">
						<div class="item">
							<h4>구분</h4>
							<select name="instanceGubun" id="instanceGubun" title="검색 범위" >
								<option value="">선택</option>
								<option value="01" selected>DMZ VPC</option>
								<option value="02">Kcure Secure VPC</option>
								<option value="03">암센터 VPC</option>			
							</select>
						</div>
						<div class="item" id="instance01" >
							<h4>인스턴스</h4>
							<select name="instanceIdKey" id="instanceIdKey" title="검색 범위" onchange="fnSetInstanceId(this.value)">
								<option value="">선택</option>
								<option value="96540f8c-2159-4bf8-b0b6-ef5ef5d6c504">K-Cure Web #1 QA</option>
								<option value="2102b3c2-dbc4-4759-a8a1-e60d76fc8ee4">K-Cure Web #2 QA</option>
								<option value="d29bdd2d-0671-4149-92f8-0bb962a0d93f">K-Cure Web #1 OP</option>
								<option value="acf7d00c-365e-4321-aae3-04d09ba559d6">K-Cure Web #2 OP</option>						
							</select>
						</div>
						<div class="item" id="instance02" style="display:none;">
							<h4>인스턴스</h4>
							<select name="instanceIdKey" id="instanceIdKey" title="검색 범위" onchange="fnSetInstanceId(this.value)">
								<option value="">선택</option>
								<option value="ecb6315e-a976-420d-80a7-6a6c3515da06">K-Cure WAS #1 QA</option>
								<option value="2fc3599dd-afc2-4c54-9da0-1eced5b03166">K-Cure WAS #2 QA</option>
								<option value="7dabfc26-3f16-40cf-a43a-c77c386a191c">K-Cure WAS #1 OP</option>
								<option value="2075bf10-bec8-46ca-ab76-8c4b450bd48c">K-Cure WAS #2 OP</option>						
							</select>
						</div>
						<div class="item" id="instance03" style="display:none;">
							<h4>인스턴스</h4>
							<select name="instanceIdKey" id="instanceIdKey" title="검색 범위" onchange="fnSetInstanceId(this.value)">
								<option value="">선택</option>									
							</select>
						</div>
						<div class="item">
							<h4>지표코드</h4>
							<select name="metricCode" id="mtrxCd" title="검색 범위">
								<option value="">선택</option>
								<option value="cpu.util">CPU</option>
								<option value="memory.util">MEMORY</option>
								<option value="disk.device.read.bytes">DISK-READ</option>
								<option value="disk.device.write.bytes">DISK-WRITE</option>
								<option value="network.incoming.bytes">NETWORK-INCOMING</option>	
								<option value="network.outgoing.bytes">NETWORK-OUTGOING</option>						
							</select>
						</div>
						<div class="item">
							<h4>조회시간</h4>
							<input type="text" id="startTime" name="startTime" value="2023-03-01T00:00:00Z" placeholder="시작시간 입력" title="검색 키워드"/> ~
							<input type="text" id="endTime" name="endTime" value="2023-03-02T00:00:00Z" placeholder="종료시간 입력" title="검색 키워드"/>
						</div>		
					</div>			
				</form>
					<!-- p테그는 남겨줘야 자동으로 버튼이 오른쪽 정렬 -->
					<p></p>
	
					<div class="btn_center" style="justify-content: right;">
						<a href="javascript:void(0)" id="srchBtn" class="bc_blue">조회</a>
					 <!-- 	<a href="javascript:void(0)" id="addBtn" class="bc_blue">신규</a>
						<a href="javascript:void(0)" id="saveBtn" class="bc_blue">저장</a>
						<a href="javascript:void(0)" id="delBtn" class="bc_blue"> 삭제</a> -->
					</div>

				<!-- 리얼그리드 영역 | 나중에 style 삭제요망-->
			</div>
			
		</div>
		<div class="grid_area_wrap" id="gridView" style="height: 500px;overflow:auto;"></div>
	</div>
</div>