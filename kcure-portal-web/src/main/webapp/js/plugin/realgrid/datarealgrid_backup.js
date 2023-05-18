var GM = null;  //그리드 메세지
var toggle = false; // 컨텍스트 메뉴
/*(function ($) {
    NEORASS.GRID.MESSAGE = null;
    
    // 공통메세지 파일 load
    $.ajax({
        url: "/common/js/base/i18n/locale.js",
        dataType: "script",
        async: false,
        complete: function () {
            if ($.type(NEORASS.GRID.MESSAGE) !== "object") {
                GM = NEORASS.GRID.MESSAGE;
                NEORASS.GRID.MESSAGE = null;
            }
        },
        error: function () {
        }
    });
    
    // locale별 메세지 파일 load
    $.ajax({
        url: "/common/js/base/i18n/locale_" + NEORASS.language + ".js",
        dataType: "script",
        async: false,
        complete: function () {
            if ($.type(NEORASS.GRID.MESSAGE) === "object") {
                GM = $.extend(true, GM, NEORASS.GRID.MESSAGE);
            }
        },
        error: function () {
        }
    });
})(jQuery);*/

// IE 에서 지원하지 않을시 처리
if (typeof Object.values === 'undefined') {
    Object.values = function (obj) {
        var array = []
        for (var key in obj) {
            if (obj.hasOwnProperty(key)) {
                array.push(obj[key]);
            }
        }
        return array;
    }
}

// IE 에서 지원하지 않을시 처리
if (typeof Object.keys === 'undefined') {
    Object.keys = function (obj) {
        var array = [];
        for (var key in obj) {
            if (obj.hasOwnProperty(key)) {
                array.push(key);
            }
        }
        return array;
    }
}

var RG = {
    /**
     * 그리드 기본 설정(고정)
     * parameter: dataProviderParam: dataProvider 객체
     *            gridViewParam: gridview 객체
     */
    init: function (param) {
        var dataProviderParam = param.dataProviderPram;
        var gridViewParam = param.gridViewPram;
        
        // 컨텍스트 메뉴
        RG.setContextMenu(param);
        
        gridViewParam.setFooters({ visible: false });
        gridViewParam.setStateBar({ visible: false });
        gridViewParam.setCheckBar({ visible: false });
        gridViewParam.setDisplayOptions({ showEmptyMessage: false });
        
        // 클립보드 복사 옵션
        gridViewParam.setCopyOptions({
            enabled: true,
            copyDisplayText: true
        });
        
        // checkReadOnly: readOnly이거나 editable이 false인 Column은 paste대상에서 제외
        // checkDomainOnly: DropDown Editor의 domainOnly가 true인 컬럼에 붙여넣기 할때 values에 없는 값은 붙여넣기 되지 않음
        gridViewParam.setPasteOptions({
            checkReadOnly: true,
            checkDomainOnly: true
        });
        
        // 에디터시 자동 체크
        gridViewParam.onCellEdited = function (grid, itemIndex, rowIndex, field) {
            grid.checkItem(itemIndex, true);
        }
        
        // 에디트 커밋 시 콤보박스가 아닐경우 다음행으로 이동
        gridViewParam.onEditCommit = function (grid, index, oldValue, newValue) {
            var isLookupDisplay = grid.getColumnProperty(index.column, "lookupDisplay");
            
            if (!isLookupDisplay) {
                if (index.itemIndex + 1 <= grid.getItemCount()) {
                    setTimeout(function () {
                        grid.setCurrent({
                            itemIndex: index.itemIndex + 1,
                            column: index.column
                        });
                    }, 0);
                }
            }
        }
    },
    /**
     * 그리드 기본 설정(변경)
     * parameter: json 타입
     *            gridCheckBoxFlag:그리드 체크박스 생성     
     *            selectEventPaginComboFnNm:페이징에서 생겨난 콤보박스에 할당할
     *            editable:true일시 행추가 행수정 에디터 활성화, false시 비활성화, "ONLY"일 경우 한행만 선택됨,"CHECK"일 경우 화면 비활성화 상태에서 체크바만 활성화
     *            footerBarFlag:그리드 풋터를 생성시킨다.
     *            initialize: 초반에 실행될 function을 설정한다.
     *            showCheckAll: 전체 체크 표시 유무(default:보여줌)
     *            checkableOnly: 단건만 체크할수 있게 처리
     *            excelSampleFlag: 엑셀 템플릿 설정 (true일때 해당 기능 활성화)
     *            sampleId : 파일 ID 설정
     *            sampleName : 내려받을 파일명 설정
     *            dataProviderPram : 그리드 data 객체
     *            gridViewPram : 그리드 view 객체
     *            rows: 그리드 paging 콤보박스에 나타낼 행수 리스트
     *            default_rows:rows에 추가된 값중 기본값 세팅
     * ex : gridCheckBoxFlag : true     
     *        selectEventPaginComboFnNm: fnSelectFunction
     *        editable:true
     *        initialize: fnSearchTest
     *        showCheckAll: false
     *        checkableOnly: true
     *        excelSampleFlag: true
     *        sampleId : "bin_master_upload.xlsx"
     *        sampleName : "빈마스터_일괄등록_샘플.xlsx"
     *        dataProviderPram : dataProvider
     *        gridViewPram : "realgrid1"
     *        rows:[100,200,300]
     *        default_rows:100
     */
    initPattern: function (param) {
        var dataProviderParam = param.dataProviderPram;
        var gridViewParam = param.gridViewPram;
        
        // 그리드 기본설정(고정)
        RG.init(param);
        gridViewParam.setEditOptions({ enterToNextRow: true });//엔터시 아래로 이동
        //gridViewPram.setFooters({visible: false});
        
        // 그리드 체크박스 설정(디폴트 체크박스 생성된 상태로 되어 있음)
        if (param.gridCheckBoxFlag !== undefined) {
            if (param.gridCheckBoxFlag === true) {
                // 체크바 표시
                gridViewParam.setCheckBar({ visible: true });
            }
        }
        // 그리드 체크박스 전체 체크 표시 유무
        if (param.showCheckAll !== undefined) {
            if (param.showCheckAll === false) {
                // 체크바 표시
                gridViewParam.setCheckBar({ showAll: false });
            }
        }
        
        // 그리드 체크박스 체크 하나만 될수 있게
        if (param.checkableOnly !== undefined) {
            if (param.checkableOnly === true) {
                // 체크바 표시
                gridViewParam.setCheckBar({ visible: true });
                // 한행만 선택 가능
                gridViewParam.checkBar.exclusive = true;
            }
        }
        
        // 그리드 footerBar 설정(디폴트는 삭제된 상태)
        if (param.footerBarFlag !== undefined) {
            if (param.footerBarFlag === true) {
                gridViewParam.setFooters({ visible: true });
            }
        }
        
        // 초기 페이징 셀렉트 박스 생성
        if (param.rows !== undefined) {
            RG.setSelectRowsPerPage(param);
            RG.setRowsPage(param);
        }
        
        // 셀렉트 박스 이벤트 처리
        if (param.selectEventPaginComboFnNm !== undefined) {
            
            var gridId = gridViewParam.getContainer().id
            var grid = $("#" + gridId).closest(".grid");
            var select1 = grid.find("select[name=cnt1]");
            var select2 = grid.find("select[name=cnt2]");
            
            if (param.default_rows !== undefined) {
                var nDefaultRowCnt = param.default_rows;
                var regex = /^[0-9]$/g;
                if (!regex.test(nDefaultRowCnt)) {
                    select1.val(nDefaultRowCnt);
                }
            }
            
            select1.on("change", function () {
                var fnCall1 = param.selectEventPaginComboFnNm;
                select2.val(1);
                fnCall1();
            });
            select2.on("change", function () {
                var fnCall2 = param.selectEventPaginComboFnNm;
                fnCall2();
            });
        }
        
        if (param.editable !== undefined) {
            if (param.editable === true) {
                gridViewParam.setEditOptions({
                    insertable: true,
                    appendable: true,
                    deletable: true
                });
                // 체크바 표시
                gridViewParam.setCheckBar({ visible: true });
                // 상태바 표시
                gridViewParam.setStateBar({ visible: true });
            } else if (param.editable === "ONLY") {
                gridViewParam.setEditOptions({
                    insertable: true,
                    appendable: true,
                    deletable: true
                });
                // 체크바 표시
                gridViewParam.setCheckBar({ visible: true });
                // 상태바 표시
                gridViewParam.setStateBar({ visible: true });
                // 한행만 선택가능
                gridViewParam.checkBar.exclusive = true;
            } else if (param.editable === false) {
                gridViewParam.setEditOptions({
                    readOnly: true,
                    editable: false
                });
            } else if (param.editable === "CHECK") {
                gridViewParam.setEditOptions({
                    readOnly: true,
                    editable: false
                });
                // 체크바 표시
                gridViewParam.setCheckBar({ visible: true });
                // 상태바 표시
                gridViewParam.setStateBar({ visible: true });
            }
        }
        
        if (param.initialize !== undefined) {
            fnCall = param.initialize;
            fnCall();
        }
    },
    
    /**
     * 조회시 페이지수 콤보박스 설정 및 조회
     * 
     * parameter: json 타입
     *            action : 호출할 url
     *            form : 호출 url 조회 파라미터가 든 form(form을 설정하지 않을시 순수 json 형태로 날라옴)
     *            dataProviderPram : 그리드 data 객체
     *            gridViewPram : 그리드 view 객체
     *            endEvent : 조회 이후 처리되는 함수 설정
     *            endPram : endEvent에 넘길 파라미터
     *            params : 조회조건 추가
     * ex : action : "/stock/report/searchStkReportDestructionListTest.action" ,
     *            form : "srchForm",
     *            dataProviderPram : dataProvider,
     *            endPram : "파라미터"
     *            gridViewPram : "realgrid1"
     */
    doQuery: function (p) {
        var params = {};
        
        // 폼의 조회조건
        if (p.form !== undefined) {
            params = jQuery("#" + p.form).serializeObject();
        }
        
        // 사용자가 json으로 추가한 조회조건
        if (p.params !== undefined) {
            params = $.extend({}, params, p.params);
        }
        
        // 그리드 요청을 서버에서 인식하기 위한 변수
        params["GRID_DATA"] = "{}";
        
        var dataProviderPram = p.dataProviderPram;
        var gridViewPram = p.gridViewPram;
        
        // 기존 그리드 데이터
        gridViewPram.commit();
        // 기존 그리드 데이터 삭제
        dataProviderPram.clearRows();
        
        var gridId = gridViewPram.getContainer().id
        var grid = $("#" + gridId).closest(".grid");
        var select1 = grid.find("select[name=cnt1]");
        var select2 = grid.find("select[name=cnt2]");
        
        params.rows_per_page = RG.getPagedBox(select1);
        params.page_idx = RG.getPagedBox(select2);
        
        gridViewPram.showProgress();
        setTimeout(function () {
            $.ajax({
                url: p.action,
                dataType: "json",
                data: params,
                type: "POST",
                async: false,
                success: function (response) {
                	console.log(response);
                    var records = response.RECORDS || (response.data && response.data.results);
                    
                    if (records !== undefined) {
                        if (records.length > 0) {
                            dataProviderPram.setRows(records);
                            RG.endQuery(p, response, p);

                            if (p.endEvent !== undefined) {
                                var endEventParam = p.endPram !== undefined ? p.endPram : records;
                                p.endEvent(endEventParam, response);
                            }
                        } else {
                            RG.endQuery(p, response, p);
                            if (p.endEvent !== undefined) {
                                var endEventParam = p.endPram !== undefined ? p.endPram : records;
                                p.endEvent(endEventParam);
                            }
                        }
                    } else {
                        if (response.length > 0) {
                            dataProviderPram.setRows(response);
                        }
                        if (p.endEvent !== undefined) {
                            p.endEvent(response);
                        }
                    }
                },
                complete: function (data) {
                    gridViewPram.showProgress();
                    gridViewPram.closeProgress();
                    
                    var checkBar = gridViewPram.getCheckBar();
                    if (checkBar.visible) {
                        gridViewPram.setAllCheck(false);
                    }
                }
            });
        }, 500);
    },
    
    /**
     * 조회시 페이지수 콤보박스 설정 및 조회
     * parameter: json 타입
     *            action : 호출할 url
     *            form : 호출 url 조회 파라미터가 든 form(form을 설정하지 않을시 순수 json 형태로 날라옴)
     *            dataProviderPram : 그리드 data 객체
     *            gridViewPram : 그리드 view 객체
     *            endEvent : 조회 이후 처리되는 함수 설정
     *            endPram : endEvent에 넘길 파라미터
     *            params : 조회조건 추가
     * ex : action : "/stock/report/searchStkReportDestructionListTest.action" ,
     *            form : "srchForm",
     *            dataProviderPram : dataProvider,
     *            endPram : "파라미터"
     *            gridViewPram : "realgrid1"
     */
    doTreeQuery: function (p) {
        var params = {};
        
        // 폼의 조회조건
        if (p.form !== undefined) {
            params = $("#" + p.form).serializeObject();
        }
        
        // 사용자가 json으로 추가한 조회조건
        if (p.params !== undefined) {
            params = $.extend({}, params, p.params);
        }
        
        var dataProviderPram = p.dataProviderPram;
        var gridViewPram = p.gridViewPram;
        
        // 기존 그리드 데이터
        gridViewPram.commit();
        // 기존 그리드 데이터 삭제
        dataProviderPram.clearRows();
        
        var gridId = gridViewPram.getContainer().id
        var grid = $("#" + gridId).closest(".grid");
        var select1 = grid.find("select[name=cnt1]");
        var select2 = grid.find("select[name=cnt2]");
        
        params.rows_per_page = RG.getPagedBox(select1);
        params.page_idx = RG.getPagedBox(select1);
        
        gridViewPram.showProgress();
        
        $.ajax({
            url: p.action,
            dataType: "json",
            data: params,
            type: "POST",
            async: false,
            success: function (rtn) {
                var records = rtn.RECORDS || (rtn.data && rtn.data.results);
                
                if (records !== undefined) {
                    if (records.length > 0) {
                        var treeJson = records;
                        var sLever1 = "";
                        var sLever2 = "";
                        var sLever3 = "";
                        var treeArr = [];
                        
                        $.each(treeJson, function (idx, row) {
                            var sLever = "";
                            if (row["LEVEL"] === 1) {
                                sLever1 = row["MENU_NO"];
                                sLever = sLever1;
                                row["TREE_ID"] = sLever;
                            } else if (row["LEVEL"] === 2) {
                                sLever2 = row["MENU_NO"];
                                sLever = sLever1 + sLever2;
                                row["TREE_ID"] = sLever;
                            } else if (row["LEVEL"] === 3) {
                                sLever3 = row["MENU_NO"];
                                sLever = sLever1 + sLever2 + sLever3;
                                row["TREE_ID"] = sLever;
                            }
                            treeArr.push(row);
                        });
                        
                        dataProviderPram.setRows(treeArr, "TREE_ID");
                        
                        RG.endQuery(p, rtn, p);
                        //dataProvider.setRows(rtn.RECORDS);
                        if (p.endEvent !== undefined) {
                            fnCall = p.endEvent;
                            var oEndPram = records;
                            if (p.endPram !== undefined) {//
                                oEndPram = p.endPram;
                            }
                            fnCall(oEndPram);
                        }
                    } else {
                        RG.endQuery(p, rtn, p);
                        if (p.endEvent !== undefined) {
                            fnCall = p.endEvent;
                            var oEndPram = records;
                            if (p.endPram !== undefined) {//
                                oEndPram = p.endPram;
                            }
                            fnCall(oEndPram);
                        }
                    }
                } else {
                    if (rtn.length > 0) {
                        dataProviderPram.setRows(rtn);
                        
                        var treeJson = rtn;
                        var sLever1 = "";
                        var sLever2 = "";
                        var sLever3 = "";
                        
                        var treeArr = [];
                        
                        $.each(rtn, function (idx, row) {
                            var sLever = "";
                            if (row["LEVEL"] === 1) {
                                sLever1 = row["MENU_NO"];
                                sLever = sLever1;
                                row["TREE_ID"] = sLever;
                            } else if (row["LEVEL"] === 2) {
                                sLever2 = row["MENU_NO"];
                                sLever = sLever1 + sLever2;
                                row["TREE_ID"] = sLever;
                            } else if (row["LEVEL"] === 3) {
                                sLever3 = RG.lpad(row["MENU_NO"], 10, "0")
                                sLever = sLever1 + sLever2 + sLever3;
                                row["TREE_ID"] = sLever;
                            }
                            treeArr.push(row);
                            
                        });
                        dataProviderPram.setRows(treeArr, "TREE_ID");
                    }
                    if (p.endEvent !== undefined) {
                        fnCall = p.endEvent;
                        var oEndPram = rtn;
                        if (p.endPram !== undefined) {//
                            oEndPram = p.endPram;
                        }
                        fnCall(rtn);
                    }
                }
            },
            error: function () {
                
            },
            complete: function (data) {
                // 실패했어도 완료가 되었을 때 처리
                if (data.readyState === 4) {
                    var errorText = data.responseText;
                    var index = errorText.indexOf("}") + 1
                    var errorStr = errorText.substring(0, index);
                    
                    if (errorStr.indexOf("error_type") !== -1) {
                        var message = JSON.parse(errorStr);
                        if (message.code !== "S") {
                            alert("nerror_type : " + message.error_type + "\nerror_message : " + message.error_message);
                        }
                    }
                }
                gridViewPram.closeProgress();
            }
        });
    },
    
    /**
     * Grid 데이터 저장 요청
     * 
     * @param {string} options.action 요청 URL
     * @param {string} options.form 요청 form id
     * @param {string[]} options.states 서버 전송할 Grid Row 상태값
     * @param {DataProvider} options.dataProvider 리얼그리드 DataProvider
     * @param {GridView} options.gridView 리얼그리드 GridView
     * @param {function=} options.onSavedHandler 저장 후 콜백
     * @param {boolean} options.showEndMessage 저장 후 완료 메시지 출력 여부
     */
    save: function (options) {
        var dataProvider = options.dataProvider;
        var gridView = options.gridView;
        
        var showEndMessage = options.showEndMessage !== undefined ? options.showEndMessage : true;
        
        var payload = {
            creates: [],
            updates: [],
            params: {}
        };
        
        // Grid Data Setting
        var checkedRowIndices = gridView.getCheckedRows();
        checkedRowIndices.forEach(function (rowIndex) {
            var rowState = dataProvider.getRowState(rowIndex);
            if (rowState === "created" && options.states.includes("C")) {
                payload.creates.push(dataProvider.getJsonRow(rowIndex));
            }
            else if (rowState === "updated" && options.states.includes("U")) {
                payload.updates.push(dataProvider.getJsonRow(rowIndex));
            }
        });
    
        // form data Setting
        var formParam = jQuery("#" + options.form).serializeObject();
        payload.params = Object.assign({}, formParam, options.params);
        
        // loading spinner
        $(document.body).loading({
            message: '<span class="loading-overlay-spinner"></span>',
            zIndex: 9999
        });
        
        $.ajax({
            type: "POST",
            url: options.action,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            data: JSON.stringify(payload)
        }).done(function (response) {
            if (showEndMessage) {
                alert(GM.save_success);
            }
            
            var checkBar = gridView.getCheckBar();
            if (checkBar.visible) {
                gridView.setAllCheck(false);
            }
        }).always(function (response) {
            $(document.body).loading('stop');
            
            if (options.onSavedHandler !== undefined) {
                options.onSavedHandler(response);
            }
        });
    },
    
    /**
     * 등록 insert update
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
    doSave: function (p) {
        var dataProviderPram = p.dataProviderPram;
        var gridViewPram = p.gridViewPram;
        var async = p.async ? p.async : false;
        
        var cud = p.cud;
        var showEndMessage = p.showEndMessage === false ? false : true;
        
        var createdArr = []; // insert
        var updatedArr = []; // update
        var readArr = []; // none
        var deletedArr = []; //	delete
        var gridData = {};
        var param = {};// url과 같이 보낼 파라미터
        var stateParam = {};
        
        gridViewPram.commit();
        var createdRows = dataProviderPram.getStateRows('created');
        var updatedRows = dataProviderPram.getStateRows('updated');
        var deletedRows = dataProviderPram.getStateRows('deleted');
        var noneRows = dataProviderPram.getStateRows('none');
        var checkedRows = gridViewPram.getCheckedRows(true);
        
        if (p.checkBinding != undefined) {
            if ($.inArray("C", cud) !== -1) {
                $.each(createdRows, function (idx1) {
                    var arr = dataProviderPram.getJsonRow(createdRows[idx1]);
                    var flag = "N";
                    if (p.checkBinding !== "") {
                        $.each(checkedRows, function (idx2) {
                            if (createdRows[idx1] === checkedRows[idx2]) {
                                flag = "Y";
                            }
                        });
                    }
                    arr[p.checkBinding] = flag;
                    createdArr.push(arr);
                });
            }
            
            if ($.inArray("U", cud) !== -1) {
                $.each(updatedRows, function (idx1) {
                    var arr = dataProviderPram.getJsonRow(updatedRows[idx1]);
                    var flag = "N";
                    if (p.checkBinding !== "") {
                        $.each(checkedRows, function (idx2) {
                            if (updatedRows[idx1] === checkedRows[idx2]) {
                                flag = "Y";
                            }
                        });
                    }
                    arr[p.checkBinding] = flag;
                    updatedArr.push(arr);
                });
            }
            
            if ($.inArray("D", cud) !== -1) {
                $.each(deletedRows, function (idx1) {
                    var arr = dataProviderPram.getJsonRow(deletedRows[idx1]);
                    var flag = "N";
                    if (p.checkBinding !== "") {
                        $.each(checkedRows, function (idx2) {
                            if (deletedRows[idx1] === checkedRows[idx2]) {
                                flag = "Y";
                            }
                        });
                    }
                    deletedArr.push(arr);
                });
            }
            
            if ($.inArray("R", cud) !== -1) { // 그리드상의 모든값이 json의 READ에 세팅
                $.each(noneRows, function (idx1) {
                    var arr = dataProviderPram.getJsonRow(noneRows[idx1]);
                    var flag = "N";
                    if (p.checkBinding !== "") {
                        $.each(checkedRows, function (idx2) {
                            if (noneRows[idx1] === checkedRows[idx2]) {
                                flag = "Y";
                            }
                        });
                    }
                    arr[p.checkBinding] = flag;
                    readArr.push(arr);
                });
            }
        } else {
            if ($.inArray("C", cud) !== -1) {
                $.each(createdRows, function (idx1) {
                    $.each(checkedRows, function (idx2) {
                        if (createdRows[idx1] === checkedRows[idx2]) {
                            var arr = dataProviderPram.getJsonRow(createdRows[idx1]);
                            createdArr.push(arr);
                        }
                    });
                });
            }
            
            if ($.inArray("U", cud) !== -1) {
                $.each(updatedRows, function (idx1) {
                    $.each(checkedRows, function (idx2) {
                        if (updatedRows[idx1] === checkedRows[idx2]) {
                            var arr = dataProviderPram.getJsonRow(updatedRows[idx1]);
                            updatedArr.push(arr);
                        }
                    });
                });
            }
            
            if ($.inArray("D", cud) !== -1) {
                $.each(deletedRows, function (idx1) {
                    $.each(checkedRows, function (idx2) {
                        if (deletedRows[idx1] === checkedRows[idx2]) {
                            var arr = dataProviderPram.getJsonRow(deletedRows[idx1]);
                            deletedArr.push(arr);
                        }
                    });
                });
            }
            
            if ($.inArray("CH", cud) !== -1) { // 그리드상에서 체크된 값이	json의 READ에 세팅
                $.each(noneRows, function (idx1) {
                    $.each(checkedRows, function (idx2) {
                        if (noneRows[idx1] === checkedRows[idx2]) {
                            var arr = dataProviderPram.getJsonRow(noneRows[idx1]);
                            readArr.push(arr);
                        }
                    });
                });
            } else if ($.inArray("R", cud) !== -1) { // 그리드상의 수정 안된 json의 READ에 체크된것 세팅
                $.each(noneRows, function (idx1) {
                    $.each(checkedRows, function (idx2) {
                        if (noneRows[idx1] === checkedRows[idx2]) {
                            var arr = dataProviderPram.getJsonRow(noneRows[idx1]);
                            readArr.push(arr);
                        }
                    });
                });
            }
        }
        
        stateParam.CREATE = createdArr;
        stateParam.UPDATE = updatedArr;
        stateParam.DELETE = deletedArr;
        stateParam.READ = readArr;
        
        param.IDS = [gridViewPram.getContainer().id];
        param[gridViewPram.getContainer().id] = stateParam;
        
        // 그룹추가
        if (p.gridViewGroup != undefined && p.dataProviderGroup != undefined) {
            param = RG.groupSetState(p, param);
        }
        
        var GRID_DATA = "GRID_DATA=" + encodeURI(JSON.stringify(param));
        //var GRID_DATA = "GRID_DATA="+JSON.stringify(param);
        
        if (p.form !== undefined) {
            var params = "&" + jQuery("#" + p.form).serialize();
            GRID_DATA = GRID_DATA + params;
        }
        
        if (p.params != undefined) {
            var strPrams = "";
            $.each(p.params, function (k, v) {
                strPrams = RG.addParameter(k, v);
                GRID_DATA += "&" + strPrams;
            });
        }
        
        $.ajax({
            url: p.action,
            dataType: "json",
            data: GRID_DATA,
            type: "POST",
            async: async,
            success: function (response) {
                if (showEndMessage) {
                    alert(GM.save_success);
                }
                
                var checkBar = gridViewPram.getCheckBar();
                if (checkBar.visible) {
                    gridViewPram.setAllCheck(false);
                }
            },
            complete: function (response) {
                if (p.endEvent !== undefined) {
                    var endEventParam = p.endPram !== undefined ? p.endPram : response.responseJSON;
                    p.endEvent(endEventParam);
                }
            }
        });
    },
    
    groupSetState: function (p, pram) {
        var gridArr = p.gridViewGroup;
        $.each(gridArr, function (idxG, rowG) {
            var gridViewPram = p.gridViewGroup[idxG];
            var dataProviderPram = p.dataProviderGroup[idxG];
            
            var cud = p.cud;
            
            var createdArr = []; // insert
            var updatedArr = []; // update
            var readArr = []; // none
            var deletedArr = []; //	delete
            //var gridData={};
            //var param ={};// url과 같이 보낼 파라미터
            var stateParam = {};
            
            gridViewPram.commit();
            var createdRows = dataProviderPram.getStateRows('created');
            var updatedRows = dataProviderPram.getStateRows('updated');
            var deletedRows = dataProviderPram.getStateRows('deleted');
            var noneRows = dataProviderPram.getStateRows('none');
            var checkedRows = gridViewPram.getCheckedRows(true);
            
            if (p.checkBinding != undefined) {
                if ($.inArray("C", cud) !== -1) {
                    $.each(createdRows, function (idx1) {
                        var arr = dataProviderPram.getJsonRow(createdRows[idx1]);
                        var flag = "N";
                        if (p.checkBinding !== "") {
                            $.each(checkedRows, function (idx2) {
                                if (createdRows[idx1] === checkedRows[idx2]) {
                                    flag = "Y";
                                }
                            });
                        }
                        arr[p.checkBinding] = flag;
                        createdArr.push(arr);
                    });
                }
                
                if ($.inArray("U", cud) !== -1) {
                    $.each(updatedRows, function (idx1) {
                        var arr = dataProviderPram.getJsonRow(updatedRows[idx1]);
                        var flag = "N";
                        if (p.checkBinding !== "") {
                            $.each(checkedRows, function (idx2) {
                                if (updatedRows[idx1] === checkedRows[idx2]) {
                                    flag = "Y";
                                }
                            });
                        }
                        arr[p.checkBinding] = flag;
                        updatedArr.push(arr);
                    });
                }
                
                if ($.inArray("D", cud) !== -1) {
                    $.each(deletedRows, function (idx1) {
                        var arr = dataProviderPram.getJsonRow(deletedRows[idx1]);
                        var flag = "N";
                        if (p.checkBinding !== "") {
                            $.each(checkedRows, function (idx2) {
                                if (deletedRows[idx1] === checkedRows[idx2]) {
                                    flag = "Y";
                                }
                            });
                        }
                        deletedArr.push(arr);
                    });
                }
                if ($.inArray("R", cud) !== -1) { // 그리드상의 모든값이 json의 READ에 세팅
                    $.each(noneRows, function (idx1) {
                        var arr = dataProviderPram.getJsonRow(noneRows[idx1]);
                        var flag = "N";
                        if (p.checkBinding !== "") {
                            $.each(checkedRows, function (idx2) {
                                if (noneRows[idx1] === checkedRows[idx2]) {
                                    flag = "Y";
                                }
                            });
                        }
                        arr[p.checkBinding] = flag;
                        readArr.push(arr);
                    });
                }
            } else {
                if ($.inArray("C", cud) !== -1) {
                    $.each(createdRows, function (idx1) {
                        $.each(checkedRows, function (idx2) {
                            if (createdRows[idx1] === checkedRows[idx2]) {
                                var arr = dataProviderPram.getJsonRow(createdRows[idx1]);
                                createdArr.push(arr);
                            }
                        });
                    });
                }
                
                if ($.inArray("U", cud) !== -1) {
                    $.each(updatedRows, function (idx1) {
                        $.each(checkedRows, function (idx2) {
                            if (updatedRows[idx1] === checkedRows[idx2]) {
                                var arr = dataProviderPram.getJsonRow(updatedRows[idx1]);
                                updatedArr.push(arr);
                            }
                        });
                    });
                }
                
                if ($.inArray("D", cud) !== -1) {
                    $.each(deletedRows, function (idx1) {
                        $.each(checkedRows, function (idx2) {
                            if (deletedRows[idx1] === checkedRows[idx2]) {
                                var arr = dataProviderPram.getJsonRow(deletedRows[idx1]);
                                deletedArr.push(arr);
                            }
                        });
                    });
                }
                
                if ($.inArray("CH", cud) !== -1) { // 그리드상에서 체크된 값이	json의 READ에 세팅
                    
                    $.each(noneRows, function (idx1) {
                        $.each(checkedRows, function (idx2) {
                            if (noneRows[idx1] === checkedRows[idx2]) {
                                var arr = dataProviderPram.getJsonRow(noneRows[idx1]);
                                readArr.push(arr);
                            }
                        });
                    });
                } else if ($.inArray("R", cud) !== -1) { // 그리드상의 수정 안된 json의 READ에 세팅
                    $.each(noneRows, function (idx1) {
                        $.each(checkedRows, function (idx2) {
                            if (noneRows[idx1] === checkedRows[idx2]) {
                                var arr = dataProviderPram.getJsonRow(noneRows[idx1]);
                                readArr.push(arr);
                            }
                        });
                    });
                }
                
            }
            
            stateParam.CREATE = createdArr;
            stateParam.UPDATE = updatedArr;
            stateParam.DELETE = deletedArr;
            stateParam.READ = readArr;
            
            pram.IDS.push(gridViewPram.getContainer().id);
            pram[gridViewPram.getContainer().id] = stateParam;
        });
        
        return pram;
    },
    
    addParameter: function (k, v) {
        var parameters = [];
        if ($.type(k) != "object" || k.serialize() != "") {
            if ($.type(k) == "string") {
                if ($.type(v) == "array") {
                    $.each(v, function () {
                        parameters[parameters.length] = k + "=" + encodeURI(this);
                    });
                } else {
                    parameters[parameters.length] = k + "=" + encodeURI(v);
                }
            } else if ($.type(k) == "object") {
                $.each(k.serializeArray(), function (idx, input) {
                    parameters[parameters.length] = input.name + "=" + encodeURI(input.value);
                });
            }
        }
        return parameters;
    },
    
    /**
     * 페이징 select box 값 가져오기
     * parameter: String 타입
     *            name : select box name 값
     * ex : name : "cnt1"
     */
    getPagedBox: function (obj) {
        var mSelect = obj.val();
        return mSelect;
    },
    
    /**
     * 한 화면에 볼 row수 설정 셀력트 생성
     * parameter: 배열 타입
     *            pram : 그리드에 보여줄 행수 리시트
     * ex : pram : [100,200,300]
     * default:값을 세팅하지 않을시 [100,200,300]세팅
     */
    setSelectRowsPerPage: function (pram) {
        var rowsArray = pram.rows;
        var gridId = pram.gridViewPram.getContainer().id
        var grid = $("#" + gridId).closest(".grid");
        var select = grid.find("select[name=cnt1]");
        
        //var select = $(".grid select[name=cnt1]");
        select.empty();
        if (pram.rows !== undefined) {
            $.each(rowsArray, function (idx, row) {
                var rowSelected = pram.rowSelected == row ? "selected" : ""
                var oOption = $("<option value=" + row + " " + rowSelected + ">" + row + "</option>");
                select.append(oOption);
            });
        } else {
            $.each([100, 200, 300], function (idx, row) {
                var oOption = $("<option value=" + row + ">" + row + "</option>");
                select.append(oOption);
            });
        }
    },
    
    /**
     * 초기 세팅
     * parameter: pageIdx:선택된 현재 페이지
     *            totalPages : 조회된 총갯수에 그리드에 보여질 행수를 나눈 페이지수
     * ex : pageIdx : 1
     *        totalPages : {totalPages}
     */
    setRowsPage: function (pram) {
        var gridId = pram.gridViewPram.getContainer().id
        var grid = $("#" + gridId).closest(".grid");
        var select = grid.find("select[name=cnt2]");
        //var select = $(".grid select[name=cnt2]");
        select.empty();
        var option = $("<option value=1>1/1</option>");
        select.append(option);
        select.val(1);
    },
    
    /**
     * 페이징 총갯수 표시
     *
     * @param {string} gridViewId 그리드 ID
     * @param {number} count 조회된 총갯수
     */
    setTotalCount: function (gridViewId, count) {
        $("#" + gridViewId).parent().each(function () {
            var tot = null;
            if ($(this).attr("class") === "grid") {
                tot = $(this);
            } else {
                tot = $(this).parent();
            }
            
            if (tot !== null) {
                tot.find("h3 > em").empty();
                var str = "(" + GM.total + " " + count.toLocaleString() + GM.count + ")";
                tot.find("h3 > em").html(str);
            }
        });
    },
    
    /**
     * 쿼리 끝난뒤에 페이징 처리
     * parameter: message : 조회후 넘어온 페이징관련 json
     *            p : 그리드 ID가 세팅된 json
     */
    endQuery: function (pram, message, p) {
        //그리드 결과 처리
        var newTotalCount = message.data && message.data.totalCount;
        var newPageNumber = message.data && message.data.pageNumber;
        var newPageSize = message.data && message.data.pageSize;
        
        var total_count = parseInt(message.TOTAL_COUNT, 10) || parseInt(newTotalCount, 10) || 0;
        var page_idx = parseInt(message.PAGE_IDX, 10) || parseInt(newPageNumber, 10) || 0;
        var rows_per_page = parseInt(message.ROWS_PER_PAGE, 10) || parseInt(newPageSize, 10) || 0;
    
        // 페이지 정보가 있을 경우만 페이징 처리
        if (rows_per_page > 0) {
            //page_idx 셋팅
            var total_pages = parseInt(total_count / rows_per_page, 10);
            if (total_count % rows_per_page !== 0) {
                total_pages += 1;
            }
            
            var gridId = pram.gridViewPram.getContainer().id
            var grid = $("#" + gridId).closest(".grid");
            var select = grid.find("select[name=cnt2]");
            
            if (total_pages > 0) {
                select.empty();
                for (var i = 1; i <= total_pages; i++) {
                    var option = $("<option value=" + i + ">" + i + "/" + total_pages + "</option>");
                    select.append(option);
                }
            } else {
                select.empty();
                var option = $("<option value=1>1/1</option>");
                select.append(option);
            }
            select.val(page_idx);
        }
        
        if (p.gridViewPram !== undefined) {
            RG.setTotalCount(p.gridViewPram.getContainer().id, total_count);
        }
    },
    
    /**
     * 콤보 설정시 ajax url과 파라미터 직접 입력
     * parameter: json 타입
     *            action : ajax url
     *            cdAndNm : values 배열에 세팅할 컬럼명값    Label 배열 세팅할 컬럼명값
     *            params : ajax에 넘길 파라미터 값
     * ex : action:"/common/searchLsCtCdList.action",
     *        cdAndNm : {values:"ls_ct_cd",labels:"ls_ct_nm"},
     *        params:{work_grp_clss_cd: sWorkGrpClssCd, compy_cd :sCompyCdc}
     */
    setGridComboBox: function (p) {
        var sActionUrl = p.action; // ajax url
        var oPrams = p.params; // ajax에 넘길 파라미터 값
        var contentType = p.type === "json" ? "application/json; charset=utf-8" : "application/x-www-form-urlencoded; charset=utf-8";
        var oResult; // ajax에서 리턴된 값 받기
        var values = []; // value 갑 배열
        var labels = []; // Labels 값 배열 oLabels
        
        $.ajax({
            type: "POST",
            url: sActionUrl,
            contentType: contentType,
            dataType: "json",
            data: p.type === "json" ? JSON.stringify(oPrams) : oPrams,
            async: false,
            success: function (rtn) {
                oResult = rtn;
            }
        });
        if (p.cdAndNm !== undefined && oResult.length > 0) {
            var oCdAndNm = p.cdAndNm
            
            $.each(oResult, function (idx, row) {
                values.push(oResult[idx][oCdAndNm.values]);
            });
            
            $.each(oResult, function (idx, row) {
                labels.push(oResult[idx][oCdAndNm.labels]);
            });
        }

        return {
            type: "dropdown",
            displayLabels: 'label',
            values: values,
            labels: labels
        };
    },
    
    /**
     * 콤보 설정시 json 값만 설정
     * parameter: json 타입
     *            p : json값 입력
     */
    setJsonComboBox: function (p) {
        var values = Object.keys(p);
        var labels = Object.values(p);

        return {
            type: "dropdown",
            values: values,
            labels: labels,
            displayLabels: 'label',
            domainOnly: true,
            textReadOnly: true
        };
    },
    
    /**
     * 그리드 추가시 앞줄 추가 되게 수정
     * parameter: json 타입
     *    dataProviderPram : 그리드 data 객체
     *    gridViewPram : 그리드 view 객체
     */
    appendRowGrid: function (pram) {
        var dataProviderPram = pram.dataProviderPram;
        var gridViewPram = pram.gridViewPram;
        gridViewPram.commit(true);
        var mCount = dataProviderPram.getRowCount();
        
        if (mCount > 0) {
            gridViewPram.beginInsertRow(0);
        } else {
            gridViewPram.beginAppendRow();
        }
        gridViewPram.checkItem(0, true); // 추가시 체크
        gridViewPram.commit(true)
    },
    
    /**
     * 그리드 CREATE 상태인 행 전체 삭제
     * parameter: json 타입
     *    dataProviderPram : 그리드 data 객체
     *    gridViewPram : 그리드 view 객체
     */
    deleteCreateRowGrid: function (pram) {
        var dataProviderPram = pram.dataProviderPram;
        var gridViewPram = pram.gridViewPram;
        gridViewPram.commit();
        var createdRows = dataProviderPram.getStateRows('created');
        var checkedRows = gridViewPram.getCheckedRows(true);
        var deleteArr = [];
        
        $.each(createdRows, function (idx1) {
            $.each(checkedRows, function (idx2) {
                if (createdRows[idx1] === checkedRows[idx2]) {
                    deleteArr.push(createdRows[idx1]);
                }
            });
        });
        dataProviderPram.removeRows(deleteArr, true);
    },
    
    /**
     * 필수값 체크 (사용안함)
     * parameter: json 타입
     *    headerText:header text
     *    name:컬럼 name
     *    gridViewPram : 그리드 view 객체
     */
    setGridRequired: function (pram) {
        var text = pram.headerText;
        var name = pram.name;
        var gridViewPram = pram.gridViewPram;
        
        var validations = [
            {
                criteria: "value is not empty",
                message: text + " 필수값입니다.",
                mode: "always",
                level: "error"
            }
        ];
        
        var column = gridViewPram.columnByName(name);
        column.validations = validations;
        gridViewPram.setColumn(column);
    },
    
    /**
     *    체크한 로우의 인덱스값을 가져온다.(사용X)
     *    parameter: 객체타입
     *
     */
    getCheckedRows: function (pram) {
        var gridViewPram = pram;
        
        gridViewPram.commit();
        var rows = gridViewPram.getCheckedRows(true);
        return rows;
    },
    
    /**
     *    체크한 로우의 인덱스값을 가져온다.(권장)
     *    parameter: 객체타입
     *
     */
    getCheckedItems: function (pram) {
        var gridViewPram = pram;
        
        gridViewPram.commit();
        var rows = gridViewPram.getCheckedItems(true);
        return rows;
    },
    
    /**
     *    체크한 로우의 데이터를 가져온다.
     *    parameter: json 타입
     *    gridViewPram:
     *    dataProviderPram:
     *
     */
    getCheckedRowsData: function (pram) {
        var gridViewPram = pram.gridViewPram;
        var dataProviderPram = pram.dataProviderPram;
        gridViewPram.commit();
        var rowsIndex = gridViewPram.getCheckedRows(true);
        var checkedArr = [];
        
        $.each(rowsIndex, function (idx1) {
            var arr = dataProviderPram.getJsonRow(rowsIndex[idx1]);
            arr.Index = rowsIndex[idx1];
            arr.Checked = true;
            checkedArr.push(arr);
        });
        
        return checkedArr;
    },
    
    /**
     *    체크한 로우의 데이터를 가져온다.(gridView 기준)
     *    parameter: json 타입
     *    gridViewPram:
     *
     */
    getCheckedItemData: function (pram) {
        var gridViewPram = pram.gridViewPram;
        gridViewPram.commit();
        var rowsIndex = gridViewPram.getCheckedItems(true);
        var checkedArr = [];
        
        $.each(rowsIndex, function (idx1) {
            var arr = gridViewPram.getValues(rowsIndex[idx1]);
            arr.Index = rowsIndex[idx1];
            arr.Checked = true;
            checkedArr.push(arr);
        });
        
        return checkedArr;
    },
    
    /**
     *    전체 로우의 데이터를 가져온다.(gridView기준 체크될 경우 세팅해준다.)
     *    parameter: json 타입 or gridView
     *    gridViewPram:
     *
     */
    getAllRowsData: function (pram) {
        var gridViewPram = pram.gridViewPram || pram; // { gridViewParam: gridView } or gridView
        gridViewPram.commit();
        var count = gridViewPram.getItemCount();
        var arr = [];
        var checkedList = RG.getCheckedItems(gridViewPram);
        
        for (var i = 0; i < count; i++) {
            var row = gridViewPram.getValues(i);
            row.Checked = $.inArray(i, checkedList) != -1;
            row.Index = i;
            arr.push(row);
        }
        return arr;
    },
    
    /**
     * 빈값일 경우 특정값 세팅(최초조회시만 사용)
     * parameter:json타입
     * columnName : string 타입
     * paramValue : object 타입(숫자,string)
     * dataProviderPram : 데이터프로바이더 세팅
     * gridViewPram : 그리드 뷰 세팅
     */
    setUpdateRowValue: function (pram) {
        var columnName = pram.columnName;
        var paramValue = pram.paramValue;
        var dataProviderPram = pram.dataProviderPram;
        var gridViewPram = pram.gridViewPram;
        var mCnt = dataProviderPram.getRowCount();
        dataProviderPram.beginUpdate();
        try {
            for (var i = 0; i < mCnt; i++) {
                var oRow = dataProviderPram.getJsonRow(i);
                if (oRow[columnName] === "" || oRow[columnName] === undefined) {
                    dataProviderPram.setValue(i, columnName, paramValue);
                }
            }
        } finally {
            dataProviderPram.endUpdate();
        }
    },
    
    /**
     * 빈값일 경우 특정값 세팅(최초조회시만 사용)하고 상태바를 초기화시킨다.
     * parameter:json타입
     * columnName : string 타입
     * paramValue : object 타입(숫자,string)
     * dataProviderPram : 데이터프로바이더 세팅
     * gridViewPram : 그리드 뷰 세팅
     */
    setDefaultUpdateRowValue: function (pram) {
        var columnName = pram.columnName;
        var paramValue = pram.paramValue;
        var dataProviderPram = pram.dataProviderPram;
        var gridViewPram = pram.gridViewPram;
        var mCnt = dataProviderPram.getRowCount();
        dataProviderPram.beginUpdate();
        try {
            for (var i = 0; i < mCnt; i++) {
                var oRow = dataProviderPram.getJsonRow(i);
                if (oRow[columnName] === "" || oRow[columnName] === undefined) {
                    dataProviderPram.setValue(i, columnName, paramValue);
                }
            }
        } finally {
            dataProviderPram.endUpdate();
            dataProviderPram.clearRowStates(true, true);
        }
    },
    
    /**
     * 그리드에서 선택된 row의 데이터를 JSON형태로 가져옴(단건 권장)
     * parameter: json 타입
     *    gridViewPram : 그리드 view 객체
     * ex : gridViewPram : realgrid
     *
     */
    getCurrentItemData: function (pram) {
        var gridViewPram = pram.gridViewPram;
        var idx = gridViewPram.getCurrent(); // 위치정보
        var row = gridViewPram.getValues(idx.itemIndex); // 위치정보에 따른 row json
        return row;
    },
    
    /**
     * 풋터가 활성화시 합계 평균을 풋터에 나타낸다.
     * parameter: json 타입
     *            gridViewPram : 그리드 view 객체,
     *            columnNm : 컬럼명
     *            preFix : 나온 값 앞에 붙일 단어
     *            summary : 처리방법:("sum","avg")
     *
     * ex : dataProviderPram : dataProvider,
     *        gridViewPram : gridView
     *        columnNm : "col"
     *        preFix : "합계:"
     *        summary : "sum"
     */
    footerSet: function (pram) {
        var gridViewPram = pram.gridViewPram;
        var columnNm = pram.columnNm;
        var summary = pram.summary;
        var preFix = pram.preFix + " ";
        var count = gridViewPram.getItemCount();
        var sVal = 0;
        var rVal = 0;
        
        for (var i = 0; i < count; i++) {
            var itemValue = gridViewPram.getValue(i, columnNm);
            if ($.isNumeric(itemValue)) {
                
                itemValue = Number(itemValue);
            } else {
                itemValue = 0;
            }
            sVal = sVal + itemValue;
        }
        if ("sum" === summary) {
            rVal = sVal;
        } else if ("avg" === summary) {
            sVal = sVal / count;
            sVal = Math.floor(sVal * 100) / 100;
            rVal = sVal;
        }
        
        //var sum =	gridViewPram.getSummary(columnNm, summary);
        var strFooter = preFix + setComma(rVal);
        gridViewPram.setColumnProperty(columnNm, "footer", {
            text: strFooter,
            styleName: "ud-text-bold"
        });
    },
    
    /**
     * 특정 변수의 값이 일치할때 스타일 적용
     * parameter: json 타입
     *    variable : 변수명
     *    value : 비교할 값
     *    style : 적용할 css
     *    gridViewPram : 그리드 view 객체
     */
    setStyleCell: function (pram) {
        var variable = pram.variable;
        var value = pram.value;
        var style = pram.style;
        var gridViewPram = pram.gridViewPram;
        
        gridViewPram.setColumnProperty(variable, "styleCallback", function (grid, dataCell) {
            var ret = {};
            
            //주문지 변경시 연보라색 마킹 해줌
            if (pram.value != undefined) {
                if (dataCell.value === value) {
                    ret.editable = false;
                    ret.styleName = style;
                }
            } else {
                ret.styleName = style;
            }
            
            return ret;
        });
    },
    
    /**
     * 특정 변수의 값이 일치하지 않을때 스타일 적용
     * parameter: json 타입
     *    variable : 변수명
     *    value : 비교할 값
     *    style : 적용할 css
     *    gridViewPram : 그리드 view 객체
     */
    setStyleNotCell: function (pram) {
        var variable = pram.variable;
        var value = pram.value;
        var style = pram.style;
        var gridViewPram = pram.gridViewPram;
        
        gridViewPram.setColumnProperty(variable, "styleCallback", function (grid, dataCell) {
            var ret = {};
            
            //주문지 변경시 연보라색 마킹 해줌
            if (dataCell.value !== value) {
                ret.editable = false;
                ret.styleName = style;
            }
            
            return ret;
        });
    },
    
    /**
     * row의 스타일을 결정한다.
     * parameter: json 타입
     *    style : 적용할 css
     *    gridViewPram : 그리드 view 객체
     *
     */
    setRowStyleCallback: function (pram) {
        var style = pram.style;
        var gridViewPram = pram.gridViewPram;
        gridViewPram.setRowStyleCallback(function (grid, item, fixed) {
            return style;
        });
    },
    
    /**
     * 우측문자열채우기
     * parameter: String 타입
     *    str : 원 문자열
     *    padLen : 최대 채우고자 하는 길이
     *    padStr : 채우고자하는 문자(char)
     */
    rpad: function (str, padLen, padStr) {
        if (padStr.length > padLen) {
            console.log("오류 : 채우고자 하는 문자열이 요청 길이보다 큽니다");
            return str + "";
        }
        str += ""; // 문자로
        padStr += ""; // 문자로
        while (str.length < padLen)
            str += padStr;
        str = str.length >= padLen ? str.substring(0, padLen) : str;
        return str;
    },
    
    /**
     * 좌측문자열채우기
     * parameter:
     *    str : 원 문자열
     *    padLen : 최대 채우고자 하는 길이
     *    padStr : 채우고자하는 문자(char)
     */
    lpad: function (str, padLen, padStr) {
        if (padStr.length > padLen) {
            console.log("오류 : 채우고자 하는 문자열이 요청 길이보다 큽니다");
            return str;
        }
        str += ""; // 문자로
        padStr += ""; // 문자로
        while (str.length < padLen)
            str = padStr + str;
        str = str.length >= padLen ? str.substring(0, padLen) : str;
        return str;
    },
    
    /**
     * 그리드에 컨텍스트 메뉴 설정
     * parameter: json 타입
     *            excelSampleFlag: 엑셀 템플릿 설정 (true일때 해당 기능 활성화)
     *            sampleId : 파일 ID 설정
     *            sampleName : 내려받을 파일명 설정
     *            dataProviderPram : 그리드 data 객체
     *            gridViewPram : 그리드 view 객체
     *            groupColumnFixFlag : 그룹헤더가 있을 경우 설정(true일때 해당 기능 활성화)
     *            groupColumnFixArray : 배열을 통해서 열고정할 위치 설정
     * ex :
     *        excelSampleFlag: true
     *        sampleId : "bin_master_upload.xlsx"
     *        sampleName : "빈마스터_일괄등록_샘플.xlsx"
     *        dataProviderPram : dataProvider
     *        gridViewPram : gridView
     *        groupColumnFixFlag: true
     *        groupColumnFixArray: [1,2,3,3,4,4,5,5,6,6]
     */
    setContextMenu: function (pram) {
        var grid = pram.gridViewPram;
        var dataProviderPram = pram.dataProviderPram;
        
        if (pram.excelSampleFlag !== undefined && pram.excelSampleFlag === true) {
            var fileId = pram.gridViewPram.getContainer().id;
            RG.setImportExcel(pram);
        }
        
        grid.onContextMenuItemClicked = function (grid, data, index) {
            if (data.tag == 'excel') {
                grid.exportGrid({
                    type: "excel",
                    target: "local",
                    lookupDisplay: true,
                    fileName: pram.sampleName
                });
            } else if (data.tag == 'excelCancel') {
                dataProviderPram.clearRows();
            } else if (data.tag == 'excelImport') {
                if (pram.excelSampleFlag !== undefined && pram.excelSampleFlag === true) {
                    $("#" + fileId + "Excel").click();
                }
            } else if (data.tag == 'filter' && index.column) {
                RG.createColumnFilter(grid, index.column);
            } else if (data.tag == 'visibleTrue') {
                var columns = grid.getColumns();
                
                for (var i in columns) {
                    grid.setColumnProperty(columns[i].name, "visible", true);
                }
                toggleaaa = false;
                RG.setHeaderCellContextMenu(grid, toggleaaa);
            } else if (data.tag == 'visibleFalse') {
                grid.setColumnProperty(index.column, "visible", false);
                
                toggleaaa = true;
                RG.setHeaderCellContextMenu(grid, toggleaaa);
            } else if (data.tag == 'fixedCol') {
                var count = 0;
                if (pram.groupColumnFixFlag != undefined && pram.groupColumnFixFlag == true) {
                    count = grid.getColumnProperty(index.column, "index");
                    var arr = pram.groupColumnFixArray;
                    count = arr[count];
                } else {
                    count = grid.getColumnProperty(index.column, "displayIndex") + 1;
                }
                if (count != undefined) {
                    grid.setFixedOptions({ colCount: count });
                }
            } else if (data.tag == 'fixedRow') {
                var count = index.itemIndex + 1;
                grid.setFixedOptions({ rowCount: count });
            } else if (data.tag == 'fixedCancel') {
                grid.setFixedOptions({
                    colCount: 0,
                    rowCount: 0
                });
            } else if (data.tag == 'excelSample') {
                if (pram.excelSampleFlag !== undefined && pram.excelSampleFlag === true) {
                    if (pram.sampleId === undefined || $.trim(pram.sampleId) == "") {
                        alert(GM.invalid_excel_sample_id);
                        return;
                    }
                    
                    if (pram.sampleName === undefined || $.trim(pram.sampleName) == "") {
                        alert(GM.invalid_excel_sample_name);
                        return;
                    }
                    
                    var id = pram.sampleId;
                    var name = pram.sampleName;
                    RG.downloadExcelSample(id, name);
                }
                
            } else if (data.tag == 'saveColumns') {
                var columnArray = [];
                var columnNames = grid.getColumnNames(true, false);
                var sortInfo = grid.getSortedFields();
                var gridColumnKey = document.URL.substring(document.URL.lastIndexOf("/") + 9, document.URL.lastIndexOf(".")) + "_" + grid.getContainer().id;
                var fixedOption = grid.getFixedOptions();
                
                for (var i = 0; i < columnNames.length; i++) {
                    columnArray.push({
                        columnName: columnNames[i],
                        columnWidth: grid.getLayoutByColumn(columnNames[i])["cellWidth"],
                        columnVisible: grid.getColumnProperty(columnNames[i], "visible")
                    });
                    
                    if (sortInfo) {
                        for (var j = 0; j < sortInfo.length; j++) {
                            if (columnNames[i] == sortInfo[j]["fieldName"]) {
                                $.extend(columnArray[i], {
                                    sortOrder: "0",
                                    sortDirection: sortInfo[j]["direction"]
                                });
                            }
                        }
                    }
                    
                    if (fixedOption["colCount"] > 0 && fixedOption["colCount"] == i) {
                        $.extend(columnArray[i], {
                            colCount: fixedOption["colCount"]
                        });
                    }
                }
                RG.saveGridColumn(gridColumnKey, JSON.stringify(columnArray));
                
            } else if (data.tag == 'saveCancelColumns') {
                var gridColumnKey = document.URL.substring(document.URL.lastIndexOf("/") + 9, document.URL.lastIndexOf("."))
                        + "_" + grid.getContainer().id;
                
                RG.removeGridColumn(gridColumnKey);
            }
        }
        
        /**
         * 그리드 위치에 따라 즉 헤드 데이터셀 헤드셀을 오른쪽 마우스 클릭시 열릴 메뉴바들 설정
         * parameter: json 타입
         *        gridViewPram : 그리드 view 객체
         * ex :
         *        gridViewPram : gridView
         */
        grid.onContextMenuPopup = function (grid, x, y, elementName) {
            if (elementName == undefined) {
                return false;
            } // 그리드 빈값일시 오른쪽 클릭시 에러 방지 방어로직
            if (elementName.cellType == 'header') {
                RG.setHeaderCellContextMenu(grid, toggle);
            } else if (elementName.cellType == 'data') {
                //RG.setDataCellContextMenu(grid);
            } else if (elementName.cellType == 'head') {
                if (pram.excelSampleFlag !== undefined && pram.excelSampleFlag === true) {
                    RG.setHeadCellContextMenu(grid);
                }
            } else {
                return false;
            }
        };
        
        RG.setDataCellContextMenu(grid);
    },
    
    /**
     * 그리드 컬럼정보 저장
     * 해당그리드의 컬럼 순서, 넓이, 정렬, 숨김, 열고정등을 저장한다.
     */
    saveGridColumn: function (gridColumnKey, gridColumnValue) {
        var confirmMsg = "컬럼정보를 저장합니다.\n새로고침으로 변경되며,\n삭제 시 컬럼설정이 초기화됩니다.";
        
        if (!confirm(confirmMsg)) {
            return false;
        }
        
        $.ajax({
            url: "/realgrid/context/saveGridColumnPersonalization.action",
            dataType: "json",
            type: "PUT",
            data: {
                gridColumnKey: gridColumnKey,
                gridColumnValue: gridColumnValue
            },
            async: false,
            success: function (result) {
                if (result.resultCode == "00") {
                    alert("컬럼정보가 저장되었습니다.");
                } else {
                    alert("컬럼정보 저장에 실패했습니다.");
                }
            }
        });
    },
    
    /**
     * 그리드 컬럼정보 로드
     * 해당그리드의 컬럼 순서, 넓이, 정렬, 숨김, 열고정등을 가져온다.
     * 그리드 로드시에 실행
     */
    getGridColumn: function (gridColumnKey) {
        var gridColumnDataList = [];
        
        $.ajax({
            url: "/realgrid/context/getGridColumnPersonalization.action",
            dataType: "json",
            type: "GET",
            data: {
                gridColumnKey: gridColumnKey
            },
            async: false,
            success: function (data) {
                gridColumnDataList = data;
            }
        });
        
        return gridColumnDataList;
    },
    
    /**
     * 그리드 컬럼정보 삭제
     * 해당그리드의 컬럼 순서, 넓이, 정렬, 숨김, 열고정등을 삭제한다.
     */
    removeGridColumn: function (gridColumnKey) {
        if (!confirm("해당 그리드의 컬럼설정이 삭제됩니다.\n진행하시겠습니까?")) {
            return false;
        }
        
        $.ajax({
            url: "/realgrid/context/delRedisGridColumn.action",
            dataType: "json",
            type: "DELETE",
            data: {
                gridColumnKey: gridColumnKey
            },
            async: false,
            success: function (result) {
                if (result.resultCode == "00") {
                    alert("화면을 새로고침해주세요");
                } else {
                    alert("삭제 과정중 오류가 발생했습니다.");
                }
            }
        });
    },
    
    /**
     * 그리드 헤드 부분 컨텍스트 메뉴바 내용 설정
     * parameter: json 타입
     *        gridViewPram : 그리드 view 객체
     * ex :
     *        gridViewPram : "realgrid1"
     */
    setHeadCellContextMenu: function (grid, val) {
        var contextMenu = [
            {
                label: '엑셀 가져오기',
                tag: 'excelImport'
            }, {
                label: '엑셀 샘플받기',
                tag: 'excelSample'
            }, {
                label: '엑셀내보내기',
                tag: 'excel'
            }, {
                label: '변경 취소하기',
                tag: 'excelCancel'
            }
        ];
        
        grid.setContextMenu(contextMenu);
    },
    
    /**
     * 그리드 헤더셀 부분 컨텍스트 메뉴바 내용 설정
     * parameter: json 타입
     *        gridViewPram : 그리드 view 객체
     * ex :
     *        gridViewPram : "realgrid1"
     */
    setHeaderCellContextMenu: function (grid, val) {
        var contextMenu = [
            {
                label: '엑셀 내보내기',
                tag: 'excel'
            },
            {
                label: "-"
            },
            {
                label: '컬럼 숨기기',
                tag: 'visibleFalse'
            },
            {
                label: '열 고정',
                tag: 'fixedCol'
            },
            {
                label: '고정 취소',
                tag: 'fixedCancel'
            }
        ];
        
        grid.setContextMenu(contextMenu);
    },
    
    /**
     * 그리드 데이터셀 부분 컨텍스트 메뉴바 내용 설정
     * parameter: json 타입
     *        gridViewPram : 그리드 view 객체
     * ex :
     *        gridViewPram : "realgrid1"
     */
    setDataCellContextMenu: function (grid) {
        var contextMenu = [
            {
                label: '엑셀 내보내기',
                tag: 'excel'
            },
            {
                label: "-"
            },
            {
                label: '열 고정',
                tag: 'fixedCol'
            },
            {
                label: '고정 취소',
                tag: 'fixedCancel'
            }
        ];
        
        grid.setContextMenu(contextMenu);
    },
    
    /**
     * 필터 설정
     * parameter: json 타입
     *        gridViewPram : 그리드 view 객체
     * ex :
     *        gridViewPram : gridView1
     */
    createColumnFilter: function (grid, colName) {
        var fieldName = grid.getColumnProperty(colName, "fieldName");
        var distinctValues = dataProvider.getDistinctValues(fieldName);
        var filters = [];
        
        for (var i = 0; i < distinctValues.length; i++) {
            filters.push({
                name: distinctValues[i],
                criteria: "value = " + "'" + distinctValues[i] + "'"
            });
        }
        
        gridView.setColumnFilters(colName, filters);
    },
    
    /**
     * 샘플 다운로드(기존 로직)
     * parameter: json 타입
     *            id : 그리드 파일 id
     *            name: 다운 받을 그리드 파일 명
     * ex :
     */
    downloadExcelSample: function (id, name) {
        var $form = null;
        if ($("#_ExcelSampleForm").length == 0) {
            $form = $("<form id='_ExcelSampleForm' />").append("<input type='hidden' name='sample_id'>").append("<input type='hidden' name='sample_name'>");
            $form.attr({
                action: "/common/downExcelSample.action",
                method: "post"
            });
            $form.appendTo('body');
        } else {
            $form = $("#_ExcelSampleForm");
        }
        
        $form.find("input[name=sample_id]").val(id);
        $form.find("input[name=sample_name]").val(name);
        $.form($form).submit({ iframe: true });
        $.form($form).run(false);
    },
    
    /**
     * 엑셀 import 로직(바이러리)
     */
    fixdata: function (data) {
        var o = "", l = 0, w = 10240;
        for (; l < data.byteLength / w; ++l) o += String.fromCharCode.apply(null, new Uint8Array(data.slice(l * w, l * w + w)));
        o += String.fromCharCode.apply(null, new Uint8Array(data.slice(l * w)));
        return o;
    },
    
    /**
     * 엑셀 import 로직
     * parameter: json 타입
     *        dataProviderPram : 그리드 데이터 프로바이더 객체
     * ex :
     *        dataProviderPram : dataProvider
     */
    handleXlsFile: function (e, pram) {
        var files = e.target.files;
        var i, f;
        for (i = 0, f = files[i]; i != files.length; ++i) {
            var reader = new FileReader();
            var name = f.name;
            reader.onload = function (e) {
                var data = e.target.result;
                var arr = RG.fixdata(data);
                workbook = XLSX.read(btoa(arr), { type: 'base64' });
                RG.process_wb(workbook, pram);
            };
            reader.readAsArrayBuffer(f);
        }
    },
    
    /**
     * 엑셀 import 로직(데이터프로바이더에 적용)
     * parameter: json 타입
     *        dataProviderPram : 그리드 데이터 프로바이더 객체
     * ex :
     *        dataProviderPram : dataProvider
     **        gridViewPram : gridView1
     */
    process_wb: function (wb, pram) {
        var dataProviderPram = pram.dataProviderPram;
        var gridViewPram = pram.gridViewPram;
        
        var output = RG.to_json(wb); 
        
        var sheetNames = Object.keys(output);
        
        if (sheetNames.length > 0) {
            var colsObj = output[sheetNames[0]];
            
            if (colsObj) {
                var arr1 = output[sheetNames[0]]; // 엑셀 배열
                var arr2 = []; // 수정된 배열
                
                $.each(arr1, function (idx1, row1) {
                    
                    var oStr = "";
                    var obj = [];
                    $.each(row1, function (idx2, row2) {
                        if (idx2 != "No.") {
                            oStr = row2;
                            obj.push(row2);
                        }
                        
                    });
                    arr2.push(obj);
                });
                var outputExcel = {};
                outputExcel[sheetNames[0]] = arr2;
                
                dataProviderPram.setRows(outputExcel[sheetNames[0]]);
                dataProviderPram.setRows(outputExcel[sheetNames[0]]);
                gridViewPram.checkAll(true);
                var rows = gridViewPram.getCheckedRows();
                dataProviderPram.setRowStates(rows, "created", false, false);
            }
        }
    },
    
    /**
     * 엑셀 import 로직(json처리)
     */
    to_json: function (workbook) {
        var result = {};
        workbook.SheetNames.forEach(function (sheetName) {
            var roa = XLSX.utils.sheet_to_row_object_array(workbook.Sheets[sheetName], {});
            if (roa.length > 0) {
                result[sheetName] = roa;
            }
        });
        return result;
    },
    
    /**
     * 엑셀 import 로직(해당 페이지에 form에 감싼 파일 input 세팅)
     * parameter: json 타입
     *        gridViewPram : 그리드 view 객체
     * ex :
     *        gridViewPram : gridView
     */
    setImportExcel: function (pram) {
        var excelPram = pram;
        var gridViewPram = pram.gridViewPram;
        var id = gridViewPram.getContainer().id;
        
        var $form = null;
        if ($("#_ExcelImportForm").length == 0) {
            $form = $("<form id='_ExcelImportForm' />").append("<input type='file' name='" + id + "Excel' id='" + id + "Excel' />");
            $form.css('display', 'none');
            $form.appendTo('body');
        } else {
            $("#_ExcelImportForm").append("<input type='file' name='" + id + "Excel' id='" + id + "Excel' />");
        }
        
        var fileId = "#" + id + "Excel";
        $(document).on("change", fileId, function (e) {
            RG.handleXlsFile(e, excelPram);
        });
        
    },
    
    /**
     *리얼 그리드 2단 룩업
     *    리얼그리드의 콤보박스 변환시 연결된 콤보 박스의 필터 역할을 하는 룩업소스 구현
     *    2레벨 compareKey에 매칭되어 구현됨
     *    1레벨콤보 key == compareKey으로 2레벨 구현
     *ex :
     *    var    oParam = {
     *		params : [
     *			{
     *				id : "RET_REASON_CD",
     *				url : "/system/code/searchStCommCdDtlList.action",
     *				comm_cd : "RD",
     *				use_yn : "Y",
     *				value : "cd_nm",
     *				key : "comm_dtl_cd"
     *			},
     *			{
     *				id : "RET_REASON_DTL",
     *				url : "/system/code/searchStCommCdDtlList.action",
     *				comm_cd : "RS",
     *				use_yn : "Y",
     *				value : "cd_nm",
     *				key : "comm_dtl_cd",
     *				compareKey : "grp_cd1"
     *			}
     *		]
     *	}
     * **/
    createLookup: function (oParam) {
        var returnObject = {};    //리턴될 오브젝트
        var compareObject = {};   //비교대상 오브젝트
        
        fn_combo = function (sendParam) {
            var url = sendParam["url"]; 					//ajax url
            var params = sendParam; 						//ajax에 넘길 파라미터 값
            var result; 									//ajax에서 리턴된 값 받기
            
            $.ajax({
                url: url,
                dataType: "json",
                data: params,
                async: false,
                success: function (resultList) {
                    result = resultList;
                }
            });
            
            return result;
        }
        
        //비교 오브젝트 생성
        for (var i in oParam["params"]) {
            var sendParam = oParam["params"][i];
            compareObject[oParam["params"][i]["id"]] = fn_combo(sendParam);
        }
        
        //룩업 소스 생성
        makeLookupSource = function () {
            var firstLevelInputTf = false;              //부모레벨 구현플레그
            var paramsLength = oParam["params"].length; //구현객체 step 렝스
            
            for (var i = 0; i < paramsLength; i++) {
                var lookupId = oParam["params"][i]["id"];   //구현객체 아이디값
                
                //반환될 오브젝트 키값과 비교값 레벨 셋팅
                returnObject[lookupId] = {
                    id: lookupId,                                       //룩업의 실질적인 아이디
                    levels: i + 1,                                      //레벨 셋팅
                    keys: [],                                           //콤보박스연결 키값  1LEVEL : ["01"], 2LEBEL : ["01,1001"]
                    values: [],                                         //벨류
                    tags: [],                                           //화면에서 사용할 태그값 1레벨일 경우 상관 없지만 2레벨일 경우 벨류값을 사용할때 비교 군이 확실하지 않아 태그 값 셋팅
                    key: oParam["params"][i]["key"] || "",              //셋팅될 키값
                    value: oParam["params"][i]["value"] || "",          //셋팅될 벨류값
                    compareKey: oParam["params"][i]["compareKey"] || "" //이전 콤보 오브젝트와 비교될 키값, 매칭이 되지 않으면 다음레벨 셋팅이 되지 않음
                };
                
                if (!firstLevelInputTf) {   //1레벨 오브젝트가 생성되었는가?
                    for (var j in compareObject[lookupId]) {    //비교될 룩업 아이디 값 만큼
                        var pushData = [];  //키값만 따로 저장될 오브젝트
                        
                        pushData.push(compareObject[lookupId][j][returnObject[lookupId]["key"]]);                           //키값 셋팅
                        returnObject[lookupId].tags.push(compareObject[lookupId][j][returnObject[lookupId]["key"]]);        //태그값 셋팅
                        returnObject[lookupId].keys.push(pushData);                                                         //키값 셋팅
                        returnObject[lookupId].values.push(compareObject[lookupId][j][returnObject[lookupId]["value"]]);    //벨류 셋팅
                    }
                    firstLevelInputTf = true;                                                                               //1레벨 생성완료 플레그 true
                } else {
                    var prevLookupId = oParam["params"][i - 1]["id"];   //생성된 오브젝트의 비교할 이전 오브젝트 아이디값
                    var prevLookupObject = returnObject[prevLookupId];  //생성된 오브젝트의 비교할 이전 오브젝트
                    var lookupObject = compareObject[lookupId];         //이전 오브젝트와 비교될 오브젝트
                    
                    if (returnObject[lookupId]["compareKey"]) {                 //비교할 키 값이 있는가?
                        for (var j in prevLookupObject["keys"]) {               //이전 룩업키값만큼
                            var prevLookupObjectKey = prevLookupObject["keys"][j];  //이전 오브젝트 비교키값
                            var prevLookupObjectTags = prevLookupObject["tags"][j]; //이전 오브젝트 태그값
                            for (var k in lookupObject) {   //현재 오브젝트
                                if (prevLookupObjectTags == lookupObject[k][returnObject[lookupId]["compareKey"]]) {    //컴페어키 값과 이전 오브젝트 키값 비교 매칭되면 하위 셋팅
                                    returnObject[lookupId].tags.push(lookupObject[k][returnObject[lookupId]["key"]]);
                                    returnObject[lookupId].keys.push([prevLookupObjectKey, lookupObject[k][returnObject[lookupId]["key"]]]);
                                    returnObject[lookupId].values.push(lookupObject[k][returnObject[lookupId]["value"]]);
                                }
                            }
                        }
                    }
                }
            }
        }
        
        //실행 및 리턴
        makeLookupSource();
        
        return returnObject;
    }
}

/**
 * 숫자 콤마 추가
 */
setComma = function (n) {
    // 정규식
    var reg = /(^[+-]?\d+)(\d{3})/;
    n += '';                          // 숫자를 문자열로 변환
    while (reg.test(n)) {
        n = n.replace(reg, '$1' + ',' + '$2');
    }
    return n;
}
