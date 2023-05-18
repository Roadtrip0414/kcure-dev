/****************************************************************
 *
 * 파일명 : ClcInfReq.js
 * 설  명 : k-cure 데이터신청-자료요청 RealGrid Setting JavaScript
 *
 *   수정일         수정자           Function 명
 * ------------    ---------    ----------------------------
 * 2023.03.08	   bhs		최초생성
 *
 *
 */


	var _dataProvider,  _gridView;
	
	var fields = [
	  {
	    fieldName: "selectId",
	    dataType: "text"
	  },
	  {
	    fieldName: "checkId",
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
	    fieldName: "prtiNm",
	    dataType: "text"
	  },
	  {
	    fieldName: "prtiId",
	    dataType: "text"
	  },
	  {
	    fieldName: "isUpload",
	    dataType: "text"
	  },
 	  {
	    fieldName: "attfSeq",
	    dataType: "text"
	  },
	  {
	    fieldName: "uploadFileNm",
	    dataType: "text"
	  },
	  {
	    fieldName: "dtsId",
	    dataType: "text"
	  },
	  {
	    fieldName: "histDataYn",
	    dataType: "text"
	  },
	  {
	    fieldName: "dtsNm",
	    dataType: "text"
	  },
	  {
	    fieldName: "엑셀업로드",
	    dataType: "text"
	  }
	];
	
	var gridColumns = [
	 {
	    name: "selectId",
	    fieldName: "selectId",
	    visible: false,
	    header: {
	      text: "selectId"
	    }
	  },
	  {
	    name: "checkId",
	    fieldName: "checkId",
	    visible: false,
	    header: {
	      text: "체크박스id"
	    }
	 },
	 {
	    name: "gubun",
	    fieldName: "gubun",
	    width: "7",
		editable:false,
		readOnly: true,
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
	    name: "prtiNm",
	    fieldName: "prtiNm",
		editable:false,
	    width: "20",
		readOnly: true,
	    header: {
	      text: "데이터 제공기관"
	    }
	  },
	 {
	    name: "prtiId",
	    fieldName: "prtiId",
		visible: false,
	    header: {
	      text: "데이터 제공기관ID"
	    }
	  },
	  {
	    name: "isUpload",
	    fieldName: "isUpload",
		visible: false,
	    header: {
	      text: "업로드여부"
	    }
	  },
	  {
	    name: "attfSeq",
	    fieldName: "attfSeq",
		visible: false,
	    header: {
	      text: "첨부파일번호"
	    }
	  },
      {
	    name: "uploadFileNm",
	    fieldName: "uploadFileNm",
		visible: false,
	    header: {
	      text: "업로드파일명"
	    }
	  },
	 {
	    name: "dtsId",
	    fieldName: "dtsId",
		visible: false,
	    header: {
	      text: "데이터셋"
	    }
	  },
      {
	    name: "histDataYn",
	    fieldName: "histDataYn",
		visible: false
	  },
	  {
	    name: "dtsNm",
	    fieldName: "dtsNm",
	    width: "40",
		editable:false,
		readOnly: true,
		styleName: "ud-column-auto",
	    header: {
	      text: "데이터셋"
	    }
	  },
	  {
	    name: "엑셀업로드",
	    fieldName: "엑셀업로드",
		width: "60",
		readOnly: true,
		editable:false,
	    styleName: "ud-column-left",
		renderer: {
			type: "html",
			callback: function (grid, cell) {
				var upChk = grid.getValue(cell.index.itemIndex, 'isUpload');
				var upFileNm = grid.getValue(cell.index.itemIndex, 'uploadFileNm');
				var str = "";
				
				str = '<div class="tb_btn_wrap">';
				if (upChk == "Y") {	//업로드 데이터인 경우
					str = str + '<p class="f_dk_gray">'+upFileNm+'</p>';
					str = str + ' <a href="javascript:fnDeleteExcel()" class="bc_w_line_dk">제거</a>';
					str = str + ' <a href="javascript:fnRemoveDts()" class="bc_w_line_dk">삭제</a>';
				}else{	//업로드 안된 데이터인 경우
					str = str + ' <a href="javascript:fnDownloadExcel()" class="bc_w_line_dk">엑셀다운로드</a>';
					str = str + ' <a href="javascript:fnUploadExcel()" class="bc_w_line_dk">선택항목 엑셀 업로드</a>';
					str = str + ' <a href="javascript:fnRemoveDts()" class="bc_w_line_dk">삭제</a>';
				}
				str = str + '</div>';
	
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
	
	_gridView.columnByName("prtiId").visible =  false;
	_gridView.columnByName("dtsId").visible =  false;
	_gridView.columnByName("histDataYn").visible =  false;
	
	
	//gridView 속성설정
	_gridView.displayOptions.emptyMessage = "표시할 데이타가 없습니다.";
	_gridView.header.height = 40;
	_gridView.displayOptions.rowHeight = 36;
	_gridView.stateBar.width = 16;
	_gridView.editOptions.insertable = false;
	_gridView.editOptions.appendable = false;
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
	
	_gridView.setOptions({ summaryMode: "none" });
	
	/* 자동 컬럼 크기 조절  */
	_gridView.displayOptions.fitStyle = "even";
	
	const f1 = function() {
	     return {
	             styleName: 'multi-line-css',
	             renderer: {
	                 type: 'text',
	                 absoluteValue: false
	             }
	         }
	}
	
	let column = _gridView.columnByName('dtsNm');
	column.styleCallback = f1;
	
	
	//ROW 그룹처리
	//_gridView.setGroupPanel({ visible: false });
	//_gridView.groupBy(["prtiId"]);		

