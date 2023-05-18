(function (root, $, MESSAGE) {
    'use strict';
    
    var DataRealGrid = {
        dataProvider: undefined,
        gridView: undefined,
        options: {
            editable: true,
            checkBar: true,
            stateBar: true,
            footer: false,
            pageSizes: [100, 200, 300],
            defaultPageSize: 100,
            defaultPageNumber: 1,
            defaultMaxPageNumber: 1,
            excelSample: false,
            excelSampleSource: '',
            excelSampleOutput: '',
            exportFileName: 'grid_export.xlsx'
        },
        state: {
            isLoading: false,
            isColumnHide: false
        },
        init: function (dataProvider, gridView, options) {
            this.dataProvider = dataProvider;
            this.gridView = gridView;
            this.options = Object.assign({}, this.options, options);
            this.state = Object.assign({}, this.state);
            
            var $grid = $('#' + this.gridView.getContainer().id).closest('.grid');
            this.pageSizeContainer = $grid.find('select[name=cnt1]')[0];
            this.pageNumberContainer = $grid.find('select[name=cnt2]')[0];
            this.totalCountContainer = $grid.find("h3 > em")[0];
            this.totalQuantityContainer = $grid.find("h3 > em")[1];
            
            this.initializeGridOptions();
            this.initializeContextMenu();
            
            this.renderTotalCount(0);
            this.renderPageSize(this.options.pageSizes, this.options.defaultPageSize);
            this.renderPageNumber(this.options.defaultMaxPageNumber, this.options.defaultPageNumber);
            
            // bind page change event
            if (typeof this.options.onPageChanged === 'function') {
                var onPageChangedHandler = this.options.onPageChanged.bind(this);
                this.pageSizeContainer.addEventListener('change', onPageChangedHandler);
                this.pageNumberContainer.addEventListener('change', onPageChangedHandler);
            }
            
            if (typeof this.options.onInitialized === 'function') {
                var onInitializedHandler = this.options.onInitialized;
                onInitializedHandler.call(this);
            }
        },
        
        initializeGridOptions: function () {
            var gridView = this.gridView;
        
            gridView.setEditOptions({
                editable: this.options.editable,
                readOnly: !this.options.editable,
                enterToNextRow: true    // 엔터 입력 시 아래로 이동
            });
            gridView.setCheckBar({ visible: this.options.checkBar });
            gridView.setStateBar({ visible: this.options.stateBar });
            gridView.setFooters({ visible: this.options.footer });
            gridView.setDisplayOptions({ showEmptyMessage: false });
            gridView.setCopyOptions({ enabled: true, copyDisplayText: true });  // 클립보드 복사 옵션
            gridView.setPasteOptions({ checkReadOnly: true, checkDomainOnly: true, applyMaxLength: true });   // 붙여넣기로 값 덮어쓰기 방지
            
            // 필터 옵션 적용 시 lookupDisplay 의 label 값 출력
            gridView.setFilteringOptions({
                automating: {
                    lookupDisplay: true
                },
                selector: {
                    searchIgnoreCase: true,
                    textToTitle: true
                }
            });
            
            // 셀 편집 시 체크박스 체크
            gridView.onCellEdited = function (grid, itemIndex, rowIndex, field) {
                grid.checkItem(itemIndex, true);
            }
        
            // 셀 편집 완료 후 콤보박스가 아닐경우 다음행으로 이동
            gridView.onEditCommit = function (grid, index, oldValue, newValue) {
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
        
        initializeContextMenu: function () {
            var self = this;
            var gridView = this.gridView;
            
            gridView.onContextMenuPopup = function (grid, x, y, elementName) {
                if (elementName === undefined) {
                    return false;
                }
            
                if (elementName.cellType === 'head') {
                    grid.setContextMenu(self.getHeadCellContextMenu(self.options.excelSample));
                } else if (elementName.cellType === 'header') {
                    grid.setContextMenu(self.getHeaderCellContextMenu(self.state.isColumnHide));
                } else if (elementName.cellType === 'data') {
                    grid.setContextMenu(self.getDataCellContextMenu(self.options.excelSample));
                } else {
                    return false;
                }
            };
        
            gridView.onContextMenuItemClicked = function (grid, item, clickData) {
                if (item.tag === "excel") {
                    grid.exportGrid({
                        type: "excel",
                        target: "local",
                        lookupDisplay: true,
                        fileName: self.options.exportFileName
                    });
                } else if (item.tag === 'excelSample') {
                    self.downloadExcelSample(self.options.excelSampleSource, self.options.excelSampleOutput);
                } else if (item.tag === 'filter') {
                    // self.createColumnFilter(clickData.column);
                    gridView.setColumnProperty(clickData.column, "autoFilter", true);
                } else if (item.tag === 'visibleFalse') {
                    grid.setColumnProperty(clickData.column, "visible", false);
                    self.state.isColumnHide = true;
                } else if (item.tag === 'visibleTrue') {
                    grid.getColumns().forEach(function (column) {
                        grid.setColumnProperty(column.name, "visible", true);
                    });
                    self.state.isColumnHide = false;
                } else if (item.tag === 'fixedCol') {
                    var colCount = grid.getColumnProperty(clickData.column, "displayIndex") + 1;
                    grid.setFixedOptions({ colCount: colCount });
                } else if (item.tag === 'fixedRow') {
                    var rowCount = clickData.itemIndex + 1;
                    grid.setFixedOptions({ rowCount: rowCount });
                } else if (item.tag === 'fixedCancel') {
                    grid.setFixedOptions({ colCount: 0, rowCount: 0 });
                }
            }
        },
        
        /**
         * 컬럼 필터 생성
         *
         * @param columnName 컬럼 이름
         */
        createColumnFilter: function (columnName) {
            var dataProvider = this.dataProvider;
            var gridView = this.gridView;
            
            if (dataProvider.getRowCount() === 0) {
                return false;
            }
            
            var fieldName = gridView.getColumnProperty(columnName, "fieldName");
            var distinctValues = dataProvider.getDistinctValues(fieldName);
            var filters = [];
            
            for (var i = 0; i < distinctValues.length; i++) {
                filters.push({ name: distinctValues[i], criteria: "value = " + "'" + distinctValues[i] + "'" });
            }
            
            gridView.setColumnFilters(columnName, filters);
        },
        
        /**
         * Excel 샘플 파일 다운로드
         */
        downloadExcelSample: function (sourceFileName, outputFileName) {
            var $iframe = $("#excel-download-iframe");
            if (!$iframe.length) {
                $iframe = $('<iframe id="excel-download-iframe" style="display: none;" />');
                $iframe.appendTo('body');
            }
            
            var $downloadForm = $("#excel-download-form");
            if (!$downloadForm.length) {
                $downloadForm = $("<form id='excel-download-form' />");
                $downloadForm.attr({
                    action: "/common/downExcelSample.action",
                    method: "post",
                    target: "excel-download-iframe"
                })
                        .append('<input type="hidden" name="sample_id">')
                        .append('<input type="hidden" name="sample_name">')
                        .appendTo('body');
            }
            
            $downloadForm.find("input[name=sample_id]").val(sourceFileName);
            $downloadForm.find("input[name=sample_name]").val(outputFileName);
            $downloadForm.submit();
        },
        
        getHeadCellContextMenu: function (excelSample) {
            if (excelSample) {
                return [
                    { label: '엑셀 내보내기', tag: 'excel' },
                    { label: '엑셀 샘플받기', tag: 'excelSample' }
                ];
            }
            
            return [
                { label: '엑셀 내보내기', tag: 'excel' }
            ];
        },
    
        getHeaderCellContextMenu: function (isColumnHide) {
            return [
                { label: '엑셀 내보내기', tag: 'excel' },
                { label: '필터 만들기', tag: 'filter' },
                { label: "-" },
                { label: '컬럼 숨기기', tag: 'visibleFalse' },
                { label: '컬럼 모두 보이기', tag: 'visibleTrue', enabled: isColumnHide }
            ];
        },
    
        getDataCellContextMenu: function (excelSample) {
            if (excelSample) {
                return [
                    { label: '엑셀 내보내기', tag: 'excel' },
                    { label: '엑셀 샘플받기', tag: 'excelSample' },
                    { label: "-" },
                    { label: '열 고정', tag: 'fixedCol' },
                    { label: '행 고정', tag: 'fixedRow' },
                    { label: '고정 취소', tag: 'fixedCancel' }
                ];
            }
            
            return [
                { label: '엑셀 내보내기', tag: 'excel' },
                { label: "-" },
                { label: '열 고정', tag: 'fixedCol' },
                { label: '행 고정', tag: 'fixedRow' },
                { label: '고정 취소', tag: 'fixedCancel' }
            ];
        },
        
        /**
         * 전체 체크박스의 체크 상태를 변경한다.
         */
        setAllCheck: function (checked) {
            var gridView = this.gridView;
            
            var checkBar = gridView.getCheckBar();
            if (checkBar.visible) {
                gridView.setAllCheck(checked);
            }
        },
        
        /**
         * RealGrid 내부의 필수값을 체크합니다.
         * 필수값 여부는 header style이 "ud-column-required" 이어야만 합니다.
         *
         * @type {*|(function(*): (boolean|undefined))}
         * @return 성공시 true, 실패 시 false
         */
        validateRequiredField: function () {
            var gridView = this.gridView;
            
            // grid Type Check
            var checkedItemIndices = gridView.getCheckedItems(true);
            if (checkedItemIndices.length <= 0) {
                alert("선택된 데이터가 없습니다.");
                return false;
            }
            
            if (gridView.isEditing()) {
                alert("편집중인 셀이 있습니다. 편집을 먼저 완료해주세요.");
                return false;
            }
            
            // 그리드 유효성 검사 결과 초기화
            gridView.clearInvalidCells();
            
            var invalidCells = this.validateColumns(checkedItemIndices);
            if (invalidCells.length > 0) {
                alert(invalidCells[0].message);
                gridView.setCurrent({ dataRow: invalidCells[0].dataRow, column: invalidCells[0].column });
                return false;
            }
            
            return true;
        },
        
        /**
         * Column 필수값 체크
         *
         * @param itemIndices GridView 의 아이템 인덱스 배열
         */
        validateColumns: function (itemIndices) {
            var gridView = this.gridView;
            
            if (gridView.isItemEditing()) {
                gridView.commit();
            }
            
            // required 헤더 컬럼을 가져온다.
            var requiredFieldNames = [];
            gridView.getColumns().forEach(function (column) {
                if (column.header.styleName && column.header.styleName.indexOf("ud-column-required") !== -1) {
                    requiredFieldNames.push(column.fieldName);
                }
            });
            
            gridView.onValidateColumn = function (grid, column, inserting, value) {
                var error = {};
                requiredFieldNames.forEach(function (fieldName) {
                    // 필수인 값이 비어 있는지 확인한다.
                    if (column.fieldName === fieldName) {
                        if (value === null || value === undefined || value === '') {
                            error.level = "error";
                            error.message = column.header.text + " 필수값입니다."
                        }
                    }
                });
                
                return error;
            };
            
            var invalidCells = gridView.validateCells(itemIndices);
            
            // 그리드 컬럼 유효성 함수 제거
            gridView.onValidateColumn = null;
            
            return invalidCells ? invalidCells : [];
        },
        
        isLoading: function () {
            return this.state.isLoading;
        },
        
        /**
         * Data Query 요청
         *
         * @param queryOptions
         * @param {string} queryOptions.action 조회 url
         * @param {string} queryOptions.form form id
         * @param {object} queryOptions.params 파라미터
         * @param {function} queryOptions.onQueried 조회 후 콜백
         */
        query: function (queryOptions) {
            var self = this;
            
            var serializeOptions = queryOptions.delimiters !== undefined
                ? queryOptions.delimiters
                : extractSerializeOptions(queryOptions.form);
            
            var formParams = serializeJson(queryOptions.form, serializeOptions);
            var params = Object.assign({}, formParams, queryOptions.params, {
                pageSize: self.getCurrentPageSize(),
                pageNumber: self.getCurrentPageNumber()
            });
            
            if (!checkMaxValuesLength(params, serializeOptions)) {
                return false;
            }
            
            self.gridView.commit();
            self.dataProvider.clearRows();
            
            self.gridView.showLoading();
            self.state.isLoading = true;
            
            $.ajax({
                type: "POST",
                url: queryOptions.action,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify(params)
            }).done(function (response) {
                var data = self.extractQueryResponseData(response);
                
                self.dataProvider.fillJsonData(data.results);
                
                self.renderTotalCount(data.totalCount);
                self.renderTotalQuantity(data.totalQuantity);
                self.renderPageNumber(Math.ceil(data.totalCount / data.pageSize), data.pageNumber);
                
                if (typeof queryOptions.onQueried === 'function') {
                    queryOptions.onQueried(response, data);
                }
                
            }).always(function (response) {
                self.state.isLoading = false;
                self.gridView.closeLoading();
                
                self.setAllCheck(false);
            });
        },
    
        /**
         * 엑셀 다운로드 쿼리
         * 
         * @param queryOptions
         */
        queryExcel: function (queryOptions) {
            var self = this;
            var serializeOptions = queryOptions.delimiters !== undefined
                ? queryOptions.delimiters
                : extractSerializeOptions(queryOptions.form);
            
            var formParams = serializeJson(queryOptions.form, serializeOptions);
            var params = Object.assign({}, formParams, queryOptions.params, {
                pageSize: self.getCurrentPageSize(),
                pageNumber: self.getCurrentPageNumber()
            });
    
            if (!checkMaxValuesLength(params, serializeOptions)) {
                return false;
            }
            
            // 기존 그리드 데이터 삭제
            self.gridView.commit();
            LoadingOverlay.show();
            self.state.isLoading = true;
    
            $.ajax({
                type: "POST",
                url: queryOptions.action,
                contentType: "application/json; charset=utf-8",
                cache: false,
                xhrFields: {
                    responseType: "blob"
                },
                data: JSON.stringify(params),
                error: function (jqXHR, textStatus, errorThrown) {
                    alert("엑셀 다운로드 중 오류가 발생했습니다. 관리자에게 문의 바랍니다.");
                }
            }).done(function (blob, status, xhr) {
                // check for a filename
                var fileName = "";
                var disposition = xhr.getResponseHeader("Content-Disposition");
                
                if (disposition && disposition.indexOf("attachment") !== -1) {
                    var filenameRegex = /filename[^;=\n]*=((['"]).*?\2|[^;\n]*)/;
                    var matches = filenameRegex.exec(disposition);
        
                    if (matches != null && matches[1]) {
                        fileName = decodeURI(matches[1].replace(/['"]/g, ""));
                    }
                }
                
                if (!fileName) {
                    alert("다운로드할 파일 이름을 찾을 수 없습니다.");
                    return false;
                }
                
                // for IE
                if (window.navigator && window.navigator.msSaveOrOpenBlob) {
                    window.navigator.msSaveOrOpenBlob(blob, fileName);
                } else {
                    var URL = window.URL || window.webkitURL;
                    var downloadUrl = URL.createObjectURL(blob);
                    
                    var a = document.createElement("a");
                    a.href = downloadUrl;
                    a.download = fileName;
                    document.body.appendChild(a);
                    a.click();
                    a.remove();
                    
                    window.URL.revokeObjectURL(downloadUrl);
                }
                
            }).always(function (response) {
                LoadingOverlay.hide();
                self.state.isLoading = false;
            });
        },
        
        /**
         * Grid 데이터 저장 요청
         *
         * @param {string} saveOptions.action 요청 URL
         * @param {string} saveOptions.form 요청 form id
         * @param {string[]} saveOptions.states 서버 전송할 Grid Row 상태값
         * @param {function=} saveOptions.onSaved 저장 후 콜백
         * @param {boolean} saveOptions.showEndMessage 저장 후 완료 메시지 출력 여부
         */
        save: _.debounce(function (saveOptions) {
            var self = this;
            var dataProvider = self.dataProvider;
            var gridView = self.gridView;
            
            var showEndMessage = saveOptions.showEndMessage !== undefined ? saveOptions.showEndMessage : true;
            
            var payload = {
                creates: [],
                updates: [],
                deletes: [],
                reads: [],
                params: {}
            };
    
            var saveStates = saveOptions.states || [];
            var cud = saveOptions.cud || [];
            
            // Grid Data Setting
            var checkedRowIndices = gridView.getCheckedRows();
            checkedRowIndices.forEach(function (rowIndex) {
                var rowState = dataProvider.getRowState(rowIndex);
                var jsonRow = dataProvider.getJsonRow(rowIndex);
                
                if (saveOptions.fields !== undefined) {
                    jsonRow = pickObject(jsonRow, saveOptions.fields);
                }
                
                if (saveOptions.lowerCase) {
                    jsonRow = convertKeyToLowerCase(jsonRow);
                }
                
                if (rowState === "created" && (saveStates.includes("created") || cud.includes("C"))) {
                    payload.creates.push(jsonRow);
                }
                else if (rowState === "updated" && (saveStates.includes("updated") || cud.includes("U"))) {
                    payload.updates.push(jsonRow);
                }
                else if (rowState === "deleted" && (saveStates.includes("deleted") || cud.includes("D"))) {
                    payload.deletes.push(jsonRow);
                }
                else if (rowState === "none" && (saveStates.includes("none") || cud.includes("R"))) {
                    payload.reads.push(jsonRow);
                }
            });
            
            // form data Setting
            var formParam = jQuery("#" + saveOptions.form).serializeObject();
            payload.params = Object.assign({}, formParam, saveOptions.params);
            
            // loading spinner
            LoadingOverlay.show();
            this.state.isLoading = true;
            
            $.ajax({
                type: "POST",
                url: saveOptions.action,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify(payload)
            }).done(function (response) {
                if (showEndMessage) {
                    var message = response.message ? response.message : MESSAGE.save_success;
                    alert(message);
                }
                
                self.setAllCheck(false);
            }).always(function (response) {
                self.state.isLoading = false;
                LoadingOverlay.hide();
                
                if (typeof saveOptions.onSaved === 'function') {
                    saveOptions.onSaved(response);
                }
            });
        }, 500, { "leading": true, "trailing": false }),
        
        /**
         * query 응답 결과 data 추출
         */
        extractQueryResponseData: function (response) {
            if (Array.isArray(response)) {
                return {
                    results: response,
                    totalCount: response.length,
                    pageNumber: this.options.defaultPageNumber,
                    pageSize: this.options.defaultPageSize
                };
            } else if (Array.isArray(response.data)) {
                return {
                    results: response.data,
                    totalCount: response.data.length,
                    pageNumber: this.options.defaultPageNumber,
                    pageSize: this.options.defaultPageSize
                };
            } else {
                var data = response.data || {};
                return {
                    results:  data.results || [],
                    totalCount: data.totalCount !== undefined ? data.totalCount : 0,
                    totalQuantity: data.totalQuantity !== undefined ? data.totalQuantity : 0,
                    pageNumber: data.pageNumber !== undefined ? data.pageNumber : this.options.defaultPageNumber,
                    pageSize: data.pageSize !== undefined ? data.pageSize : this.options.defaultPageSize
                };
            }
        },
        
        /**
         * 총 건수 화면에 출력
         *
         * @param totalCount 총 건수
         */
        renderTotalCount: function (totalCount) {
            if (this.totalCountContainer !== null && this.totalCountContainer !== undefined) {
                this.totalCountContainer.textContent = "(" + MESSAGE.total + " " + totalCount.toLocaleString() + MESSAGE.count + ")";
            }
        },
        
        /**
         * 총 수량 화면에 출력
         *
         * @param totalQuantity 총 건수
         */
        renderTotalQuantity: function (totalQuantity) {
            if (this.totalQuantityContainer !== null && this.totalQuantityContainer !== undefined) {
                this.totalQuantityContainer.textContent = "(" + MESSAGE.total + " " + totalQuantity.toLocaleString() + MESSAGE.qty + ")";
            }
        },
        
        /**
         * 한 페이지에 조회할 크기 화면에 출력
         *
         * @param pageSizes 페이지 크기 목록
         * @param currentPageSize 현재 지정한 페이지 크기
         */
        renderPageSize: function (pageSizes, currentPageSize) {
            var pageSizeContainer = this.pageSizeContainer;
            if (pageSizeContainer !== null && pageSizeContainer !== undefined) {
                removeAllChildren(pageSizeContainer);
                pageSizes.forEach(function (pageSize) {
                    var option = document.createElement('option');
                    option.value = pageSize.toString();
                    option.textContent = pageSize.toString();
                    if (pageSize === currentPageSize) {
                        option.selected = true;
                    }
                    pageSizeContainer.appendChild(option);
                });
            }
        },
        
        /**
         * 페이지 번호 화면에 출력
         *
         * @param maxPageNumber 최대 페이지 번호
         * @param currentPageNumber 현재 페이지 번호
         */
        renderPageNumber: function (maxPageNumber, currentPageNumber) {
            var pageNumberContainer = this.pageNumberContainer;
            if (pageNumberContainer !== null && pageNumberContainer !== undefined) {
                removeAllChildren(pageNumberContainer);
                
                if (maxPageNumber > 0 && currentPageNumber > 0) {
                    for (var page = 1; page <= maxPageNumber; page++) {
                        var pageNumberOption = document.createElement('option');
                        pageNumberOption.value = page.toString();
                        pageNumberOption.textContent = page + '/' + maxPageNumber;
                        if (page === currentPageNumber) {
                            pageNumberOption.selected = true;
                        }
                        pageNumberContainer.appendChild(pageNumberOption);
                    }
                } else {
                    var pageNumberOption = document.createElement('option');
                    pageNumberOption.value = "1";
                    pageNumberOption.textContent = '1/1';
                    pageNumberContainer.appendChild(pageNumberOption);
                }
            }
        },
        
        /**
         * 현재 페이지 크기를 가져온다.
         *
         * @returns {number} 기본값 100
         */
        getCurrentPageSize: function () {
            if (this.pageSizeContainer === null || this.pageSizeContainer === undefined) {
                return this.options.defaultPageSize;
            }
            
            var currentPageSize = Number(this.pageSizeContainer.value);
            if (isNaN(currentPageSize)) {
                return this.options.defaultPageSize;
            }
            
            return currentPageSize;
        },
        
        /**
         * 현재 페이지 번호를 가져온다.
         *
         * @returns {number} 기본값 1
         */
        getCurrentPageNumber: function () {
            if (this.pageNumberContainer === null || this.pageNumberContainer === undefined) {
                return this.options.defaultPageNumber;
            }
            
            var currentPageNumber = Number(this.pageNumberContainer.value);
            if (isNaN(currentPageNumber)) {
                return this.options.defaultPageNumber;
            }
            
            return currentPageNumber;
        },
        
        /**
         * 체크한 아이템을 가져온다. 인덱스(itemIndex) 포함
         *
         * @returns {Array<object>} 체크된 아이템의 인덱스를 포함한 데이터 리스트
         */
        getCheckedItemData: function () {
            var gridView = this.gridView;
            
            if (gridView.isItemEditing()) {
                gridView.commit();
            }
            
            var result = [];
            var itemIndices = gridView.getCheckedItems(true);
            
            $.each(itemIndices, function (idx, itemIndex) {
                var itemValues = gridView.getValues(itemIndex);
                itemValues.Index = itemIndex;
                
                result.push(itemValues);
            });
            
            return result;
        }
    };
    
    /**
     * Utilities
     */
    function removeAllChildren(element) {
        if (element !== null && element !== undefined) {
            while (element.firstChild) {
                element.removeChild(element.firstChild);
            }
        }
    }
    
    /**
     * element 설정 기준 serialize option 세팅
     */
    function extractSerializeOptions(formId) {
        var result = [];
        
        var form = document.getElementById(formId);
        if (form === null) {
            return result;
        }
        
        var formElements = Array.from(form.elements);
        
        formElements.forEach(function (elem) {
            if (elem.dataset.serializeDelimiter !== undefined) {
                var serializeOption = {};
                serializeOption.name = elem.name;
                
                if (elem.dataset.serializeDelimiter === 'comma') {
                    serializeOption.delimiter = ',';
                }
                
                if (elem.dataset.serializeDelimiter === 'line') {
                    serializeOption.delimiter = '\n';
                }
                
                if (elem.dataset.serializeMax !== undefined) {
                    serializeOption.max = elem.dataset.serializeMax;
                }
                
                result.push(serializeOption);
            }
        });
        
        return result.length > 0 ? result : undefined;
    }
    
    /**
     * form 요소를 json 형태로 변환
     */
    function serializeJson(formId, serializeOptions) {
        var result = {};
        var form = document.getElementById(formId);
        
        if (form === null) {
            return result;
        }
        
        var formElements = Array.from(form.elements);
        formElements.forEach(function (elem) {
            if (!elem.name || elem.disabled || elem.type === 'submit' || elem.type === 'button' || elem.matches('form fieldset[disabled] *')) {
                return;
            }
            
            if (elem.type === 'select-one') {
                result[elem.name] = elem.value;
            } else if (elem.type === 'select-multiple') {
                var multipleValues = [];
                var selectOptions = Array.from(elem.options);
                selectOptions.forEach(function (opt) {
                    if (!opt.disabled && opt.selected) {
                        multipleValues.push(opt.value);
                    }
                });
                
                result[elem.name] = multipleValues;
                
            } else if (elem.type === 'checkbox' || elem.type === 'radio') {
                if (elem.checked) {
                    result[elem.name] = elem.value;
                }
            } else if (elem.type === 'textarea') {
                result[elem.name] = elem.value.replace(/\r?\n|\r/g, '\n');
            } else {
                result[elem.name] = (elem.value ? elem.value.trim() : elem.value);
            }
            
            // delimiter 추가
            serializeOptions = serializeOptions !== undefined ? serializeOptions : extractSerializeOptions(formId);
            
            var delimiter = findDelimiter(serializeOptions, elem.name);
            if (delimiter !== undefined) {
                if (result[elem.name] !== undefined) {
                    var values = result[elem.name]
                        .split(delimiter)
                        .map(function (value) { return value.trim(); })
                        .filter(function (value) { return value !== '' });
                    
                    result[elem.name] = values;
                }
            }
        });
        
        return result;
    }
    
    /**
     * 일치하는 구분자 찾기
     */
    function findDelimiter(serializeOptions, name) {
        if (serializeOptions !== undefined) {
            var matched = serializeOptions.find(function (each) {
                return each.name === name;
            });
            
            if (matched !== undefined) {
                return matched.delimiter;
            }
        }
    }
    
    function checkMaxValuesLength(obj, delimiters) {
        // 최대 길이 검증
        if (delimiters !== undefined) {
            for (var i = 0; i < delimiters.length; i++) {
                var each = delimiters[i];
                var max = each.max !== undefined ? each.max : 0;
            
                var values = obj[each.name];
                if (Array.isArray(values) && max > 0) {
                    if (values.length > max) {
                        alert('복수행 조회 조건은 ' + max + '행을 넘을 수 없습니다. [입력 행: ' + values.length + ']');
                        return false;
                    }
                }
            }
        }
    
        return true;
    }
    
    function pickObject(obj, fields) {
        if (fields === undefined || !Array.isArray(fields)) {
            return obj;
        }
        
        return _.pick(obj, fields);
    }
    
    function convertKeyToLowerCase(obj) {
        var newObj = {};
        
        var keys = Object.keys(obj);
        keys.forEach(function (key) {
            newObj[key.toLowerCase()] = obj[key];
        });
        
        return newObj;
    }
    
    var createDataRealGrid = function (dataProvider, gridView, options) {
        var dataRealGrid = Object.create(DataRealGrid);
        DataRealGrid.init.call(dataRealGrid, dataProvider, gridView, options);
        
        return dataRealGrid;
    };
    
    window.DataGrid = {
        createDataRealGrid: createDataRealGrid,
        serializeJson: serializeJson
    };
    
})(window, jQuery, GM);
