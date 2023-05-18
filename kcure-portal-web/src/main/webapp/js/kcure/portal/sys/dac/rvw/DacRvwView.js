/****************************************************************
 *
 * 파일명 : DacRvwView.js
 * 설  명 : k-cure 데이터 심의관리 - 제공기관 심의 RealGrid Setting JavaScript
 *
 *   수정일         수정자           Function 명
 * ------------    ---------    ----------------------------
 * 2023.03.15	   bhs		최초생성
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
	    fieldName: "prtiid",
	    dataType: "text"
	  },
	  {
	    fieldName: "prtinm",
	    dataType: "text"
	  },
	  {
	    fieldName: "rvwprncpstnm",
	    dataType: "text"
	  },
	  {
	    fieldName: "usernm",
	    dataType: "text"
	  },
	  {
	    fieldName: "rvwpstpn",
	    dataType: "text"
	  },
	 {
	    fieldName: "usermbphno",
	    dataType: "text"
	  },
	 {
	    fieldName: "email",
	    dataType: "text"
	  },
	  {
	    fieldName: "wcmplte",
	    dataType: "text"
	  },
      {
	    fieldName: "iswcmplteyn",
	    dataType: "text"
	  },
	  {
	    fieldName: "htmlstr",
	    dataType: "text"
	  }
	];
	
	
	var gridColumns = [
	 {
	    name: "no",
	    fieldName: "no",
	    width: "7",
		readOnly: true,
	    header: {
	      text: "번호"
	    }
	  },
      {
	    name: "prtiId",
	    fieldName: "prtiid",
		visible: false
	  },
	 {
	    name: "prtiNm",
	    fieldName: "prtinm",
	    width: "25",
		readOnly: true,
	    header: {
	      text: "기관명"
	    }
	  },
	 {
	    name: "rvwPrncPstNm",
	    fieldName: "rvwprncpstnm",
	    width: "15",
		readOnly: true,
	    header: {
	      text: "직위"
	    }
	  },
      {
	    name: "userNm",
	    fieldName: "usernm",
		width: "20",
		readOnly: true,
	    header: {
	      text: "이름"
	    }
	  },
	  {
	    name: "rvwPstPn",
	    fieldName: "rvwpstpn",
        width: "20",
		readOnly: true,
	    header: {
	      text: "근무처 전화번호"
	    }
	  },
      {
	    name: "userMbphNo",
	    fieldName: "usermbphno",
        width: "20",
		readOnly: true,
	    header: {
	      text: "핸드폰 번호"
	    }
	  },
	  {
	    name: "email",
	    fieldName: "email",
        width: "20",
		readOnly: true,
	    header: {
	      text: "E-mail"
	    }
	  },
      {
	    name: "wCmplte",
	    fieldName: "wcmplte",
		visible: false
	  },
      {
	    name: "isWcmplteYn",
	    fieldName: "iswcmplteyn",
		visible: false
	  },
	  {
	    name: "htmlStr",
	    fieldName: "htmlstr", 
		header: {
	      text: "상태"
	    },
		width: "7",
		readOnly: true,
	    styleName: "ud-column-center",
		renderer: {
			type: "html",
			callback: function (grid, cell) {
				var wCmplte = grid.getValue(cell.index.itemIndex, 'isWcmplteYn');
				var prtiIdVal = grid.getValue(cell.index.itemIndex, 'prtiId');
				
				var str = "";
				
				if(wCmplte == "Y"){
					str = str + ' <a href="javascript:fnViewRstAprv('+ cell.index.itemIndex +')" class="revPrtiBtn02" >승인완료<br/>결과보기</a>';
				}else{
					str = '<div class="tb_btn_wrap">';
					str = str + '<p class="f_red">심의중</p>';
					str = str + '</div>';
				}

				return str;
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
	
	
	//gridView 속성설정
	_gridView.displayOptions.emptyMessage = "표시할 데이타가 없습니다.";
	_gridView.header.height = 40;
	_gridView.displayOptions.rowHeight = 36;
	_gridView.stateBar.width = 16;
	_gridView.editOptions.insertable = true;
	_gridView.editOptions.appendable = true;
	_gridView.displayOptions.syncGridHeight = "over" //그리드 셀데이터 모두보이도록 높이자동설정
	//_gridView.displayOptions.fitStyle = "even";
	
	var height = _gridView.displayOptions.rowHeight;
	_gridView.displayOptions.rowHeight = height + 25;

	_gridView.setCheckBar({
	    visible: true
	  });
	
	_gridView.setRowIndicator({
		  visible: false
	});
	
	_gridView.setFooter({
		  visible: false
	});
	
	_gridView.setCheckBar({
    	exclusive: true
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
	
	let column = _gridView.columnByName('htmlStr');
	column.styleCallback = f1;
	
	/*
	* 데이터셋 리스트 조회
	*/
	searchData = function() {
		RG.doQuery({
				action : "/portal/sys/dac/rvw/selectRevPrtiList.do",
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
		console.log("--------------------gridEndEvent---------------------");
	}
	
	searchData();
	
	//ROW 그룹처리
	//_gridView.setGroupPanel({ visible: false });
	//_gridView.groupBy(["prtiId"]);		
	
	

