/****************************************************************
 *
 * 파일명 : ViewRevAplcRsch.js
 * 설  명 : k-cure 심의-선택한 데이터 RealGrid Setting JavaScript
 *
 *   수정일         수정자           Function 명
 * ------------    ---------    ----------------------------
 * 2023.05.02	   parkgu		Copy from ClcInfReq.js
 *
 *
 */

	var _dataProvider,  _gridView;
	var _gridTotalCnt = 0;
	
	var fields = [
  {
    fieldName: "no",
    dataType: "text"
  },
  {
    fieldName: "gubun",
    dataType: "text"
  },
  {
	fieldName: "dtsLclsCd",
	dataType: "text"
   },
  {
    fieldName: "pritnm",
    dataType: "text"
  },
  {
    fieldName: "attfnm",
    dataType: "text"
  },
  {
    fieldName: "attfpthnm",
    dataType: "attfpthnm"
  },
  {
    fieldName: "attfstrnm",
    dataType: "attfstrnm"
  },
  {
    fieldName: "dtsinfo",
    dataType: "text"
  },
  {
    fieldName: "dtsHtml",
    dataType: "text"
  },
  {
    fieldName: "excelupload",
    dataType: "text"
  }
];
	
	
	var gridColumns = [
	 {
	    name: "no",
	    fieldName: "no",
	    width: "7",
		editable: false,
	    header: {
	      text: "번호"
	    }
	  },
	 {
	    name: "gubun",
	    fieldName: "gubun",
	    width: "7",
		editable: false,
	    header: {
	      text: "구분"
	    }
	  },
	  {
	    name: "dtsLclsCd",
	    fieldName: "dtsLclsCd",
	    visible: false,
	    header: {
	      text: "대분류"
	    }
	  },
	 {
	    name: "pritnm",
	    fieldName: "pritnm",
	    width: "40",
		editable: false,
	    header: {
	      text: "데이터 제공기관"
	    }
	  },
      {
	    name: "attfnm",
	    fieldName: "attfnm",
		visible: false,
	  },
      {
	    name: "attfpthnm",
	    fieldName: "attfpthnm",
		visible: false,
	  },
      {
	    name: "attfstrnm",
	    fieldName: "attfstrnm",
		visible: false,
	  },
	  {
	    name: "dtsHtml",
	    fieldName: "dtsHtml",
		header: {
	      text: "데이터셋"
	    },
	    width: "70",
		editable: false,
		styleName: "ud-column-left",
		renderer: {
			type: "html",
			callback: function (grid, cell) {
				var dtsInfo = grid.getValue(cell.index.itemIndex, 'dtsinfo');
				var str = "";
				str = '<div>';
				str = str + '<p class="f_dk_gray" style="text-align: left;">'+dtsInfo+'</p>';
				str = str + '</div>';
	
				return str;
			},
		}
	  },
	  {
	    name: "excelupload",
	    fieldName: "excelupload", 
		header: {
	      text: "엑셀다운로드"
	    },
		width: "50",
		editable: false,
	    styleName: "ud-column-left",
		renderer: {
			type: "html",
			callback: function (grid, cell) {
				const attfpthnm = grid.getValue(cell.index.itemIndex, 'attfpthnm');
				const attfstrnm = grid.getValue(cell.index.itemIndex, 'attfstrnm');
				const attfnm = grid.getValue(cell.index.itemIndex, 'attfnm');
				const html = `<div class="n_file_link"><a onclick="javascript:downFile('` + attfpthnm + `', '` + attfstrnm + `', '` + attfnm + `');">` + attfnm + `</a></div>`;
				return html;
			},
		}
	  }
	];
		
	//그리드 생성		
	_dataProvider = new RealGrid.LocalDataProvider();
	_gridView = new RealGrid.GridView("gridView");
	
	_gridView.setDataSource(_dataProvider);
	
	_dataProvider.setFields(fields);
	_gridView.setColumns(gridColumns);
	
	//_gridView.columnByName("prtiid").visible =  false;

	
	
	//gridView 속성설정
	_gridView.displayOptions.emptyMessage = "표시할 데이타가 없습니다.";
	_gridView.header.height = 40;
	_gridView.displayOptions.rowHeight = -1;
	_gridView.displayOptions.minRowHeight = 36;
	_gridView.stateBar.width = 16;
	_gridView.editOptions.insertable = true;
	_gridView.editOptions.appendable = true;
	_gridView.displayOptions.syncGridHeight = "over" //그리드 셀데이터 모두보이도록 높이자동설정
	//_gridView.displayOptions.fitStyle = "even";
	
	var headerHeight = _gridView.header.height;
	 _gridView.header.height = headerHeight + 10;

	_gridView.setCheckBar({
	    visible: false
	  });
	
	_gridView.setRowIndicator({
		  visible: false
	});
	
	_gridView.setFooter({
		  visible: false
	});
	
	_gridView.rowIndicator.visible = false;
	
	_gridView.setOptions({ summaryMode: "none" });
	
	/* 자동 컬럼 크기 조절  */
	_gridView.displayOptions.fitStyle = "even";
	
	const f1 = function() {
	     return {
	             styleName: 'multi-line-css'
	         }
	}
	
	let column = _gridView.columnByName('dtsHtml');
	column.styleCallback = f1;
	
	/*
	* 데이터셋 리스트 조회
	*/
	searchData = function() {
		RG.doQuery({
				action : "/portal/dac/clc/inf/selectAplDtsList.do",
				form : "srchFrm",
				dataProviderPram : _dataProvider,
				gridViewPram : _gridView,
				endEvent: gridEndEvent
			});
	}

	/*
	* 데이터셋 리스트 콜백
	*/
	var gridEndEvent = function(endEventParam, response) {
		console.log("--------------------gridEndEvent---------------------");
		console.log(endEventParam);
		console.log(response);
		console.log(response.totCnt);
		
		_gridView.displayOptions.rowHeight = -1;
		_gridView.displayOptions.minRowHeight = 36;
		
		_gridView.refresh();
		
		if($("#allListYn").val() == "N"){
			_gridTotalCnt = response.totCnt;
			let displayCnt = _gridTotalCnt - 20;
			
			if(displayCnt > 0){
				let tmpTxt = displayCnt + "개 데이터 더보기";
				$("#gridMoreCntTxt").text(tmpTxt);
				$("#gridMoreDisp").css("display", "flex");
			}
		}else{
			$("#gridMoreDisp").css("display", "none");
		}
		
		console.log("--------------------gridEndEvent---------------------");
	}
	
	searchData();
	
	//ROW 그룹처리
	//_gridView.setGroupPanel({ visible: false });
	//_gridView.groupBy(["prtiId"]);		
	
	fnSearchMore = function() {
		$("#allListYn").val("Y");
		searchData();
	}
	

