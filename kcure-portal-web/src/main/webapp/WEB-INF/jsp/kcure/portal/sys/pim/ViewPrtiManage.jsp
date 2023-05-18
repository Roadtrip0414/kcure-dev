<%
/* =================================================================
* @FileName : ViewPrtiManage.jsp
* @date: 2023. 2. 6.
* @author : hjjeon
* @설명 : 참여기관 관리
* =================================================================
* 수정일 작성자 내용
* -----------------------------------------------------------------------
* 2023. 2. 6. hjjeon 파일생성
* =================================================================
*/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>
<script type="text/javascript">
var instTpCombo = RG.setGridComboBox({
    action:"/portal/sys/usr/stt/getGridCombo.do", // 호출할 url
    cdAndNm : {labels:"detlCdNm",values:"detlCd"}, // values와 labels에 입력할 json Name값들 및 values 값 속성
    params:{gbCd : "INST_TPCD"}
});

var instClsSpCombo = RG.setGridComboBox({
    action:"/portal/sys/usr/stt/getGridCombo.do", // 호출할 url
    cdAndNm : {labels:"detlCdNm",values:"detlCd"}, // values와 labels에 입력할 json Name값들 및 values 값 속성
    params:{gbCd : "INST_CLS_SPCD"}
});

var ctpvSpcdCombo = RG.setGridComboBox({
    action:"/portal/sys/usr/stt/getGridCombo.do", // 호출할 url
    cdAndNm : {labels:"detlCdNm",values:"detlCd"}, // values와 labels에 입력할 json Name값들 및 values 값 속성
    params:{gbCd : "SI_DO_STCD"}
});

var gridColumns = [
{
	header: {
		text: "서비스기관ID"
	},
	name: "prtiId",
	fieldName: "prtiId",
	type: "data",
	required: true,
	styleName: "ud-column-center",
    editor : {
        type: "line",
        ignoreCharacters: "ㄱ-힣",
        maxLength: 10
    },
    styleCallback: function(grid, dataCell){
        var ret = {}

        if(dataCell.item.rowState == 'created' || dataCell.item.itemState == 'appending' || dataCell.item.itemState == 'inserting'){
          ret.editable = true;
        } else {
          ret.editable = false;
        }

        return ret;
      }
},
{
	header: {
		text: "서비스기관명"
	},
	name: "prtiNm",
	fieldName: "prtiNm",
	type: "data",
	required: true,
	styleName: "ud-column-center",
    editor : {
        type: "line",
        ignoreCharacters: "A-Za-z",
        maxLength: 200
    }
},
{
    header: {
        text: "기관분류"
    },
    name: "instClsSpcd",
	fieldName: "instClsSpcd",
	lookupDisplay: true,
	required: true,
    values: instClsSpCombo.values,
    labels: instClsSpCombo.labels,
    editor : {
        type: "dropdown",
        domainOnly: true,
        textReadOnly: true
    }
},
{
    header: {
        text: "기관유형"
    },
    name: "instTpcd",
	fieldName: "instTpcd",
	lookupDisplay: true,
    values: instTpCombo.values,
    labels: instTpCombo.labels,
    editor : {
        type: "dropdown",
        domainOnly: true,
        textReadOnly: true
    },
    styleCallback: function(grid, dataCell){
        var ret = {}

        var instClsSpcd = grid.getValue(dataCell.index.itemIndex, "instClsSpcd");

        if(instClsSpcd == '01'){
			ret.editable = true;
        } else {
			ret.editable = false;
        }

        return ret;
      }
},
{
	header: {
		text: "안심활용센터여부"
	},
	name: "dszYn",
	fieldName: "dszYn",
	lookupDisplay: true,
	required: true,
	values: [
        "Y",
        "N"
    ],
    labels: [
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
        text: "시도구분코드"
    },
    name: "ctpvSpcd",
	fieldName: "ctpvSpcd",
	lookupDisplay: true,
    values: ctpvSpcdCombo.values,
    labels: ctpvSpcdCombo.labels,
    editor : {
        type: "dropdown",
        domainOnly: true,
        textReadOnly: true
    },
    styleCallback: function(grid, dataCell){

        var ret = {}

        var dszYn = grid.getValue(dataCell.index.dataRow, "dszYn");

        if(dszYn == 'Y'){
			ret.editable = true;
        } else {
			ret.editable = false;
        }

        return ret;
      }
},
{
	header: {
		text: "도메인명"
	},
	name: "domnNm",
	fieldName: "domnNm",
	type: "data",
	required: true,
	styleName: "ud-column-center",
    editor : {
        type: "line",
//         ignoreCharacters: "A-Za-z",
        maxLength: 1000
    }
},
{
	header: {
		text: "사용여부"
	},
	name: "useYn",
	fieldName: "useYn",
	lookupDisplay: true,
	required: true,
	values: [
        "Y",
        "N"
    ],
    labels: [
        "사용",
        "미사용"
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
		text: "등록일시"
	},
	name: "frstRgstDt",
	editable: false,
	fieldName: "frstRgstDt",
	styleName: "ud-column-center",
    datetimeFormat: "yyyy-MM-dd"
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
		gridView.editOptions.commitLevel = "error";

		//그리드 컬럼 정보 세팅
		setFieldsNColumns(gridDataProvider, gridView, gridColumns);

		gridView.onValidateColumn = function(grid, column, inserting, value, itemIndex, dataRow) {
			var error = {};
			if (column.fieldName == "ctpvSpcd") {
				var dszYn = grid.getValue(dataRow, "dszYn");
				if(dszYn == "Y" && (typeof value == "undefined")){
			        error.level = "error";
			        error.message = "Value is required: ctpvSpcd";
				}
			};

			if (column.fieldName == "domnNm" && (typeof value != "undefined")) {
				var Url = /(http|https):\/\/((\w+)[.])+(asia|biz|cc|cn|com|de|eu|in|info|jobs|jp|kr|mobi|mx|name|net|nz|org|travel|tv|tw|uk|us)(\/(\w*))*$/i;
			    var urlTest = Url.test(value);
			    if(!urlTest){
			    	error.level = "error";
			        error.message = "도메인 형식이 잘못 되었습니다.";
			    }
			};
			return error;
		}

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

		searchDate = function() {
			RG.doQuery({
						action : "/portal/sys/pim/mng/selectPrtiList.do",
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

		gridView.onCellEdited = function (grid, itemIndex, row, field) {
			//기관분류코드
			var curVal = grid.getValue(itemIndex,"instClsSpcd");

			if(curVal != "01"){
				//기관분류코드가 01일때만 기관유형 선택 가능
	         	grid.setValue(itemIndex,"instTpcd", "");
	         	grid.commit();
	         	grid.checkItem(itemIndex, true);
			}
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

		/* 행삭제 버튼 클릭  
		$("#delBtn").click(function() {
			RG.deleteRowGrid({
				gridViewPram: gridView
				, dataProviderPram: gridDataProvider
				, endEvent: delEndEvent
			});
			/* gridDataProvider.insertRow(0,[]); 
		});
		*/

		/*행삭제 후 실행 function  */
		var delEndEvent = function() {
			console.log("--------------------delEndEvent---------------------");
			console.log("--------------------delEndEvent---------------------");
		}

		/* 저장 버튼 클릭  */
		$("#saveBtn").click(function() {
			//신규, 수정행에 대해서 유효성체크
			var cRows = gridDataProvider.getStateRows("created");
			var uRows = gridDataProvider.getStateRows("updated");
			var checkRow = $.merge(cRows, uRows);

			var errorCells = gridView.validateCells(checkRow, false);
			if(errorCells != null && errorCells.length > 0){
				alert("입력 데이터 값을 확인 해주세요.");
				gridView.setCurrent( {itemIndex: errorCells[0].dataRow , column: errorCells[0].column } );
				return;
			}else{
			    RG.doSave({
				   	 action : "/portal/sys/pim/mng/savePrti.do" ,
				     endEvent : saveEndEvent,
				     dataProviderPram : gridDataProvider,
				     gridViewPram : gridView,
				     showEndMessage: false,
				     cud: ["C", "U","D","R"]
			    });
			}
		});

		/* 저장 후 실행 function  */
		var saveEndEvent = function(endEventParam, response) {
			console.log("--------------------saveEndEvent---------------------");
			if(endEventParam.message != ""){
				alert(endEventParam.message);
				return;
			}else{
				alert(GM.save_success);
				searchDate();
			}
			console.log("--------------------saveEndEvent---------------------");
		}

		/* 조회 */
		searchDate();

		/* 초기화 */
		$("#initBtn").click(function(){
			var getInput = $("#srchForm input[type=text]");
			$.each(getInput, function (index, value) {
				$(value).val("");
		    });
			//select값 초기화
			$("#searchKeyword").val("");
			$("#searchKeyword2").val("");

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
	<div class="con">
		<div class="area_wrap">
			<div class="section">
				<div class="btn_info">
					<p></p>
					<div class="s_btn">
						<a href="javascript:void(0)" id="srchBtn">조회</a>
						<a href="javascript:void(0)" id="initBtn">초기화</a>
					</div>
				</div>
				<form id="srchForm" name="srchForm" method="post">
				<div class="search_wrap">
					<div class="item">
						<h4>기관분류</h4>
						<kcure:select id="searchKeyword2" name="searchKeyword2" grpCd="INST_CLS_SPCD" defaultText="전체"/>
					</div>
					<div class="item">
						<h4>기관유형</h4>
						<kcure:select id="searchKeyword" name="searchKeyword" grpCd="INST_TPCD" defaultText="전체"/>
					</div>
					<div class="item">
						<h4>서비스기관</h4>
						<input type="text" id="searchKeyword1" name="searchKeyword1" value="" placeholder="기관명 입력" title="검색 키워드"/>
					</div>
				</div>
				</form>
				<!-- //boardtop-search -->
				<div class="btn_info">
					<p>총건수<span id="currCnt"></span>/<span id="totalCnt"></span></p>
					<div class="s_btn">
						<a href="javascript:void(0)" id="addBtn"> 신규 </a>
						<a href="javascript:void(0)" id="saveBtn"> 저장 </a>
						<!-- <a href="javascript:void(0)" id="delBtn"> 삭제 </a> -->
					</div>
				</div>
				<!-- //boardpage-infor -->
				<div class="grid_area_wrap" id="gridView"></div>
				<div id="grid_paging" class="page_num"></div>
			</div>
		</div>
		<!-- //subcon-wrap -->
	</div>
</div>