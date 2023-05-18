var RG = RG || {};

/**
 * 그리드의 column을 자동정렬합니다.
 * gridColumn이 있으면 gridColumn에서 width가 있는 컬럼은 해당 width로 셋팅합니다.
 * width가 없으면 자동정렬 합니다..
 * @param grdView gridView
 * @param gridColumn (없으면 모든 컬럼 autofit)
 */
RG.searchAndAutoFitColumn = function (grdView, gridColumn) {
    // gridHeader 생성하던 list를 { column_name: width } 형식으로 추출한다.
    var gridHeaderWidthMap = {};
    if (gridColumn) {
        gridColumn.forEach(function (value) {
            gridHeaderWidthMap[value.name] = value.width;
        });
    }
    
    // width가 없으면 deafult 값을 셋팅한다.
    grdView.getColumns().forEach(function (column) {
        if (!gridHeaderWidthMap[column.name]) {
            grdView.fitLayoutWidth(column.name, 280, 100);
        }
    });
}

/**
 * 입력한 rowIndex의 행을 선택한다.
 * @param grid
 * @param fromIndex : 시작 row index
 * @param endIndex : 종료 row index (없으면 한 줄만 선택됨)
 */
RG.setFocusRow = function(grid, fromIndex, endIndex) {
    var displayColumns = grid.getDisplayColumns();

    if(!displayColumns) return;
    
    grid.setSelection({
        style: "block",
        startRow: fromIndex,
        endRow: endIndex || fromIndex, // toindex가 없으면 fromIndex만 설정
        startColumn: displayColumns[0],
        endColumn: displayColumns[displayColumns.length - 1] // 보이는 column 까지만 설정
    });
}
