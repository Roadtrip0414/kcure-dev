<%
/* =================================================================
 * @FileName : ViewDvzClcBrs.jsp
 * @date: 2023.02.01
 * @author : kyh
 * @설명 : 데이터시각화 임상라이브러리 유방암 화면
 * =================================================================
 * 수정일         작성자             내용     
 * -----------------------------------------------------------------------
 * 2023.02.01     kyh           파일생성
 * =================================================================
 */ 
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>
<%-- 연구자 권한 일때만 --%>
<c:set var="chartDtlSrchYn" value="N" />
<c:if test="${loginVO ne null && loginVO.userStcd eq '03'}">
	<c:set var="chartDtlSrchYn" value="Y" />
</c:if>

<script type="text/javascript">
//차트용 전역 변수
var exporting;
var chartObjectChk = {};
var chartMaxCount = 10;

$(document).ready(function() {
	$("#left_${searchVO.frtVslzMenuId}").val("${searchVO.frtVslzMenuId}").trigger("click"); <!-- 상위메뉴 존재시에만 -->
	
	$("input[name=gndrCdAll]").prop("checked", true);
	$("input[name=ageCdAll]").prop("checked", true);
	$("input[name=critYrAll]").prop("checked", true);
	$("input[name=prtiCdAll]").prop("checked", true);
	
	setStatTp('01');	//연도별
	
	$("#chartSave").click(function(e) {
		chartSave(e);
	});
	
	$("#chartCreate").click(function(e) {
		chartShow();
		
		$("#detailDiv").trigger("click");
	});
});

function goDvzClcBrs(subVslzMenuId, frtVslzMenuId, srchVslzMenuId, smryStatsNo){
	$("#subVslzMenuId").val(subVslzMenuId);
	$("#frtVslzMenuId").val(frtVslzMenuId);
	$("#srchVslzMenuId").val(srchVslzMenuId);
	$("#smryStatsNo").val(smryStatsNo);
	$("#listFrm").attr("action", "/portal/dvz/clc/brs/viewDvzClcBrs.do").submit();
}

function resetCheckBox(checkBoxId, checkBoxVal){
	if (checkBoxVal == "ALL") {
		if ($("input:checkbox[name="+checkBoxId+"All]").is(":checked")) {
			$("input:checkbox[name="+checkBoxId+"]").each(function() {
				this.checked = false;
			});
		} else {
			$("input:checkbox[name="+checkBoxId+"All]").prop("checked", true);
		}
	} else {
		var chkCnt = 0;
		$("input:checkbox[name="+checkBoxId+"]:checked").each(function() {
			chkCnt = chkCnt + 1;
		});
		
		if (chkCnt > 0) {
			$("input:checkbox[name="+checkBoxId+"All]").prop("checked", false);
		} else {
			$("input:checkbox[name="+checkBoxId+"All]").prop("checked", true);
		}
	}
}

function setStatTp(statTpCd){
	$("#vslzDataStatTpcd").val(statTpCd);
	
	for (var i=1; i < 5 ;i++) {
		$("#statTp0"+i).attr("class", "");
	}
	
	$("#statTp"+statTpCd).attr("class", "on");
	
	chartShow();
}

function chartShow(){
	if(chartObjectChk["chartdiv"]){   //check if exist chart dispose that
		chartObjectChk["chartdiv"].dispose();
		exporting = null;
	}
	
	var form = $("#listFrm").serialize();
	
	$.ajax({
        type: "post",
        url: "/portal/dvz/clc/brs/selectDvzClcStatList.do",
        data: form,
        dataType: 'json',
        success: function (data) {
        	if (data.result == "success") {
        		if (data.statList.length > 0) {
        			$.each(data.statList, function( index, value ) {
        				if (index == 0) {
        					if (value.maxCateCorrCountSum > 0) {
        						chartMaxCount = value.maxCateCorrCountSum;
        					} else {
        						chartMaxCount = 10;
        					}
        					
        					return false;
        				}
        			});
        			
        			//비율 표시일 경우 모수 변경
        			if ($("input[name='vslzDataExprTpcd']:checked").val() == "02") chartMaxCount = 100;
        			
        			switch ($("input[name='vslzChartTpcd']:checked").val()) {
	        			case "02":
	        				chartStackedColumn(data.statList);	//누적(세로)
	        				break;
	        			case "03":
	        				chartClusteredBar(data.statList);	//막대(가로)
	        				break;
	        			case "04":
	        				chartStackedBar(data.statList);	//누적(가로)
	        				break;
	        			case "05":
	        				chartLineSeries(data.statList);	//선형
	        				break;
	        			case "06":
	        				chartDonut(data.statList);	//도넛형
	        				break;
	        			default:
	        				chartClusteredColumn(data.statList);	//막대(세로)
	        		}
        		} else {        			
        			//alert('조회된 내용이 없습니다.');
        		}
        	}
        },
        error: function (request, status, error) {
            //console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            alert('<spring:message code="fail.request.msg" />');
        }
    });
}

function chartSave(e){
	if (exporting == null) {
		alert("저장할 차트가 없습니다.");
	} else {
		exporting.download("png", e);
	}
}

//막대(세로)
//https://www.amcharts.com/demos/clustered-column-chart/
function chartClusteredColumn(statList){
	// Create root element
	var root = am5.Root.new("chartdiv");

	// Set themes
	root.setThemes([
		am5themes_Animated.new(root)
	]);
	
	// Create chart
	var chart = root.container.children.push(am5xy.XYChart.new(root, {
		panX: true,
		panY: true,
		wheelX: "panX",
		wheelY: "zoomX",
		layout: root.verticalLayout
	}));

	// Create axes
	var xRenderer = am5xy.AxisRendererX.new(root, {
		minGridDistance: 30,
		cellStartLocation: 0.1,
		cellEndLocation: 0.9
	});
	
	var xAxis = chart.xAxes.push(am5xy.CategoryAxis.new(root, {
		maxDeviation: 0.3,
		categoryField: "cateGbn",
		renderer: xRenderer,
		tooltip: am5.Tooltip.new(root, {})
	}));
	
	xRenderer.grid.template.setAll({
		location: 1
	});
	
	xRenderer.labels.template.setAll({
		oversizedBehavior: "wrap",
		maxWidth: 85,
		textAlign: "center"
	});

	var yAxis = chart.yAxes.push(am5xy.ValueAxis.new(root, {
		min: 0,
		max: chartMaxCount,
		renderer: am5xy.AxisRendererY.new(root, {})
	}));
	
	var rendererY = yAxis.get("renderer");
	rendererY.grid.template.set("forceHidden", true);
	rendererY.labels.template.set("forceHidden", true);
	
	for (var i=0; i < 11 ; i++) {
		let rangeDataItem = yAxis.makeDataItem({
			value: (chartMaxCount/10) * i
		});
		
		var range = yAxis.createAxisRange(rangeDataItem);
		
		range.get("label").setAll({
			forceHidden: false,
			text: ((chartMaxCount/10) * i).toLocaleString()
		});
		
		range.get("grid").setAll({
			forceHidden: false,
			strokeOpacity: 0.1,
			location: 1
		});
	}

	// 범례 영역 설정
	var legend = chart.children.push(am5.Legend.new(root, {
		centerX: am5.p50,
		x: am5.p50
	}));
	
	// 카테고리 리스트 생성
	var dataObj = new Array() ;
	
	var cateGbnChk = "";
	$.each(statList, function( index, value ) {
		if (value.cateGbn != cateGbnChk) {
			cateGbnChk = value.cateGbn;
			// 객체 생성
			var dataMap = new Object() ;
			dataMap.cateGbn = value.cateGbn;
			
			$.each(statList.filter(statList => statList.cateGbn == value.cateGbn), function( index, value ) {
				//비율 표시일 경우 수치 변경
				if ($("input[name='vslzDataExprTpcd']:checked").val() == "02") {
					
					<c:if test="${chartDtlSrchYn eq 'Y'}">
					
					if ($("#vslzDataStatTpcd").val() == "02" || $("#vslzDataStatTpcd").val() == "03") {	//연령별, 성별
						dataMap[value.itemNm] = (value.corrCount/value.sumCorrCount)*100;
					} else if ($("#vslzDataStatTpcd").val() == "04") {	//기관별
						dataMap[value.itemNm] = (value.corrCount/value.itemCorrCountSum)*100;
					} else {	//연도별
						dataMap[value.itemNm] = (value.corrCount/value.cateCorrCountSum)*100;
					}
					
					</c:if>
					
				} else {
					dataMap[value.itemNm] = value.corrCount;
				}
			});
			
			dataObj.push(dataMap) ;
		}
	});
	
	//alert(JSON.stringify(dataObj));
	
	xAxis.data.setAll(dataObj);
	
	// 항목 리스트 생성
	var itemList = new Array() ;
	
	var itemChk = "";
	$.each(statList, function( index, value ) {
		if (itemChk == "" || value.cateGbn == itemChk) {
			itemChk = value.cateGbn;
			itemList[index] = value.itemNm;
		} else {
			return false;
		}
	});
	
	//alert(JSON.stringify(itemList));
	
	// Add series
	itemList.forEach( function( itemValue ) {
		var series = chart.series.push(am5xy.ColumnSeries.new(root, {
			name: itemValue,
			xAxis: xAxis,
			yAxis: yAxis,
			valueYField: itemValue,
			categoryXField: "cateGbn"
		}));

		series.columns.template.setAll({
			tooltipText: "{name}, {categoryX}:{valueY.formatNumber('#,###.##')}",
			width: am5.percent(90),
			tooltipY: 0,
			strokeOpacity: 0
		});

		series.data.setAll(dataObj);

		// Make stuff animate on load
		// https://www.amcharts.com/docs/v5/concepts/animations/
		series.appear();

		series.bullets.push(function() {
			return am5.Bullet.new(root, {
				locationY: 0,
				sprite: am5.Label.new(root, {
					text: "{valueY.formatNumber('#,###.##')}",
					fill: root.interfaceColors.get("alternativeText"),
					centerY: 0,
					centerX: am5.p50,
					populateText: true
				})
			});
		});

		legend.data.push(series);
	});
	
	// Make stuff animate on load
	chart.appear(1000, 100);
	
	// 차트 이미지(png)로 저장
	exporting = am5plugins_exporting.Exporting.new(root, {});
	
	chartObjectChk["chartdiv"]=root;
	
	//차트 높이 조정
	$("#chartdiv").css("height", "540px");
}

</script>
<c:if test="${chartDtlSrchYn eq 'Y'}">
<script type="text/javascript">
//누적(세로)
//https://www.amcharts.com/demos/stacked-column-chart/
function chartStackedColumn(statList){
	// Create root element
	var root = am5.Root.new("chartdiv");

	// Set themes
	root.setThemes([
		am5themes_Animated.new(root)
	]);
	
	// Create chart
	var chart = root.container.children.push(am5xy.XYChart.new(root, {
		panX: true,
		panY: true,
		wheelX: "panX",
		wheelY: "zoomX",
		layout: root.verticalLayout
	}));

	// Create axes
	var xRenderer = am5xy.AxisRendererX.new(root, {
		minGridDistance: 30
	});
	
	var xAxis = chart.xAxes.push(am5xy.CategoryAxis.new(root, {
		categoryField: "cateGbn",
		renderer: xRenderer,
		tooltip: am5.Tooltip.new(root, {})
	}));
	
	xRenderer.grid.template.setAll({
		location: 1
	});
	
	xRenderer.labels.template.setAll({
		oversizedBehavior: "wrap",
		maxWidth: 85,
		textAlign: "center"
	});

	var yAxis = chart.yAxes.push(am5xy.ValueAxis.new(root, {
		min: 0,
		max: chartMaxCount,
		renderer: am5xy.AxisRendererY.new(root, {})
	}));
	
	var rendererY = yAxis.get("renderer");
	rendererY.grid.template.set("forceHidden", true);
	rendererY.labels.template.set("forceHidden", true);
	
	for (var i=0; i < 11 ; i++) {
		let rangeDataItem = yAxis.makeDataItem({
			value: (chartMaxCount/10) * i
		});
		
		var range = yAxis.createAxisRange(rangeDataItem);
		
		range.get("label").setAll({
			forceHidden: false,
			text: ((chartMaxCount/10) * i).toLocaleString()
		});
		
		range.get("grid").setAll({
			forceHidden: false,
			strokeOpacity: 0.1,
			location: 1
		});
	}

	// 범례 영역 설정
	var legend = chart.children.push(am5.Legend.new(root, {
		centerX: am5.p50,
		x: am5.p50
	}));
	
	// 카테고리 리스트 생성
	var dataObj = new Array() ;
	
	var cateGbnChk = "";
	$.each(statList, function( index, value ) {
		if (value.cateGbn != cateGbnChk) {
			cateGbnChk = value.cateGbn;
			// 객체 생성
			var dataMap = new Object() ;
			dataMap.cateGbn = value.cateGbn;
			
			$.each(statList.filter(statList => statList.cateGbn == value.cateGbn), function( index, value ) {
				//비율 표시일 경우 수치 변경
				if ($("input[name='vslzDataExprTpcd']:checked").val() == "02") {
					if ($("#vslzDataStatTpcd").val() == "02" || $("#vslzDataStatTpcd").val() == "03") {	//연령별, 성별
						dataMap[value.itemNm] = (value.corrCount/value.sumCorrCount)*100;
					} else if ($("#vslzDataStatTpcd").val() == "04") {	//기관별
						dataMap[value.itemNm] = (value.corrCount/value.itemCorrCountSum)*100;
					} else {	//연도별
						dataMap[value.itemNm] = (value.corrCount/value.cateCorrCountSum)*100;
					}
				} else {
					dataMap[value.itemNm] = value.corrCount;
				}
			});
			
			dataObj.push(dataMap) ;
		}
	});
	
	//alert(JSON.stringify(dataObj));
	
	xAxis.data.setAll(dataObj);
	
	// 항목 리스트 생성
	var itemList = new Array() ;
	
	var itemChk = "";
	$.each(statList, function( index, value ) {
		if (itemChk == "" || value.cateGbn == itemChk) {
			itemChk = value.cateGbn;
			itemList[index] = value.itemNm;
		} else {
			return false;
		}
	});
	
	//alert(JSON.stringify(itemList));
	
	// Add series
	itemList.forEach( function( itemValue ) {
		var series = chart.series.push(am5xy.ColumnSeries.new(root, {
			name: itemValue,
			stacked: true,
			xAxis: xAxis,
			yAxis: yAxis,
			valueYField: itemValue,
			categoryXField: "cateGbn"
		}));

		series.columns.template.setAll({
			tooltipText: "{name}, {categoryX}:{valueY.formatNumber('#,###.##')}",
			tooltipY: am5.percent(10)
		});

		series.data.setAll(dataObj);

		// Make stuff animate on load
		// https://www.amcharts.com/docs/v5/concepts/animations/
		series.appear();

		series.bullets.push(function() {
			return am5.Bullet.new(root, {
				sprite: am5.Label.new(root, {
					text: "{valueY.formatNumber('#,###.##')}",
					fill: root.interfaceColors.get("alternativeText"),
					centerY: am5.p50,
					centerX: am5.p50,
					populateText: true
				})
			});
		});

		legend.data.push(series);
	});
	
	// Make stuff animate on load
	chart.appear(1000, 100);
	
	// 차트 이미지(png)로 저장
	exporting = am5plugins_exporting.Exporting.new(root, {});
	
	chartObjectChk["chartdiv"]=root;
	
	//차트 높이 조정
	$("#chartdiv").css("height", "540px");
}

//막대(가로)
//https://www.amcharts.com/demos/clustered-bar-chart/
function chartClusteredBar(statList){
	// Create root element
	var root = am5.Root.new("chartdiv");

	// Set themes
	root.setThemes([
		am5themes_Animated.new(root)
	]);
	
	// Create chart
	var chart = root.container.children.push(am5xy.XYChart.new(root, {
		panX: false,
		panY: false,
		wheelX: "panX",
		wheelY: "zoomX",
		layout: root.verticalLayout
	}));

	// Create axes
	var xAxis = chart.xAxes.push(am5xy.ValueAxis.new(root, {
		min: 0,
		max: chartMaxCount,
		renderer: am5xy.AxisRendererX.new(root, {})
	}));
	
	var rendererX = xAxis.get("renderer");
	rendererX.grid.template.set("forceHidden", true);
	rendererX.labels.template.set("forceHidden", true);
	
	for (var i=0; i < 11 ; i++) {
		let rangeDataItem = xAxis.makeDataItem({
			value: (chartMaxCount/10) * i
		});
		
		var range = xAxis.createAxisRange(rangeDataItem);
		
		range.get("label").setAll({
			forceHidden: false,
			text: ((chartMaxCount/10) * i).toLocaleString()
		});
		
		range.get("grid").setAll({
			forceHidden: false,
			strokeOpacity: 0.1,
			location: 1
		});
	}

	var yRenderer = am5xy.AxisRendererY.new(root, {
		minGridDistance: 15,
		cellStartLocation: 0.1,
		cellEndLocation: 0.9
	});
	
	var yAxis = chart.yAxes.push(am5xy.CategoryAxis.new(root, {
		categoryField: "cateGbn",
		renderer: yRenderer,
	}));
	
	yRenderer.grid.template.setAll({
		location: 1
	});

	// 범례 영역 설정
	var legend = chart.children.push(am5.Legend.new(root, {
		centerX: am5.p50,
		x: am5.p50
	}));
	
	// 카테고리 리스트 생성
	var dataObj = new Array() ;
	
	var cateGbnChk = "";
	$.each(statList, function( index, value ) {
		if (value.cateGbn != cateGbnChk) {
			cateGbnChk = value.cateGbn;
			// 객체 생성
			var dataMap = new Object() ;
			dataMap.cateGbn = value.cateGbn;
			
			$.each(statList.filter(statList => statList.cateGbn == value.cateGbn), function( index, value ) {
				//비율 표시일 경우 수치 변경
				if ($("input[name='vslzDataExprTpcd']:checked").val() == "02") {
					if ($("#vslzDataStatTpcd").val() == "02" || $("#vslzDataStatTpcd").val() == "03") {	//연령별, 성별
						dataMap[value.itemNm] = (value.corrCount/value.sumCorrCount)*100;
					} else if ($("#vslzDataStatTpcd").val() == "04") {	//기관별
						dataMap[value.itemNm] = (value.corrCount/value.itemCorrCountSum)*100;
					} else {	//연도별
						dataMap[value.itemNm] = (value.corrCount/value.cateCorrCountSum)*100;
					}
				} else {
					dataMap[value.itemNm] = value.corrCount;
				}
			});
			
			dataObj.push(dataMap) ;
		}
	});
	
	//alert(JSON.stringify(dataObj));
	
	yAxis.data.setAll(dataObj);
	
	// 항목 리스트 생성
	var itemList = new Array() ;
	
	var itemChk = "";
	$.each(statList, function( index, value ) {
		if (itemChk == "" || value.cateGbn == itemChk) {
			itemChk = value.cateGbn;
			itemList[index] = value.itemNm;
		} else {
			return false;
		}
	});
	
	//alert(JSON.stringify(itemList));
	
	// Add series
	itemList.forEach( function( itemValue ) {
		var series = chart.series.push(am5xy.ColumnSeries.new(root, {
			name: itemValue,
			xAxis: xAxis,
			yAxis: yAxis,
			valueXField: itemValue,
			categoryYField: "cateGbn",
			sequencedInterpolation: true,
			tooltip: am5.Tooltip.new(root, {
				pointerOrientation: "horizontal",
				labelText: "[bold]{name}[/]\n{categoryY}: {valueX.formatNumber('#,###.##')}"
			})
		}));

		series.columns.template.setAll({
			height: am5.p100,
			strokeOpacity: 0
		});

		series.bullets.push(function() {
			return am5.Bullet.new(root, {
				locationX: 1,
				locationY: 0.5,
				sprite: am5.Label.new(root, {
					centerY: am5.p50,
					text: "{valueX.formatNumber('#,###.##')}",
					populateText: true
				})
			});
		});

		series.bullets.push(function() {
			return am5.Bullet.new(root, {
				locationX: 1,
				locationY: 0.5,
				sprite: am5.Label.new(root, {
					centerX: am5.p100,
					centerY: am5.p50,
					text: "{name}",
					fill: am5.color(0xffffff),
					populateText: true
				})
			});
		});

		series.data.setAll(dataObj);

		// Make stuff animate on load
		series.appear();
	});
	
	legend.data.setAll(chart.series.values);

	// Add cursor
	// https://www.amcharts.com/docs/v5/charts/xy-chart/cursor/
	var cursor = chart.set("cursor", am5xy.XYCursor.new(root, {
		behavior: "zoomY"
	}));
	cursor.lineY.set("forceHidden", true);
	cursor.lineX.set("forceHidden", true);
	
	// Make stuff animate on load
	chart.appear(1000, 100);
	
	// 차트 이미지(png)로 저장
	exporting = am5plugins_exporting.Exporting.new(root, {});
	
	chartObjectChk["chartdiv"]=root;
	
	//차트 높이 조정
	var chartdivHeight = 540;
	
	if (chartdivHeight < (statList.length * 30)) chartdivHeight = statList.length * 30;
	
	$("#chartdiv").css("height", chartdivHeight + "px");
}

//누적(가로)
//https://www.amcharts.com/demos/stacked-bar-chart/
function chartStackedBar(statList){
	// Create root element
	var root = am5.Root.new("chartdiv");

	// Set themes
	root.setThemes([
		am5themes_Animated.new(root)
	]);
	
	// Create chart
	var chart = root.container.children.push(am5xy.XYChart.new(root, {
		panX: false,
		panY: false,
		wheelX: "panX",
		wheelY: "zoomX",
		layout: root.verticalLayout
	}));

	// Create axes
	var xAxis = chart.xAxes.push(am5xy.ValueAxis.new(root, {
		min: 0,
		max: chartMaxCount,
		renderer: am5xy.AxisRendererX.new(root, {})
	}));
	
	var rendererX = xAxis.get("renderer");
	rendererX.grid.template.set("forceHidden", true);
	rendererX.labels.template.set("forceHidden", true);
	
	for (var i=0; i < 11 ; i++) {
		let rangeDataItem = xAxis.makeDataItem({
			value: (chartMaxCount/10) * i
		});
		
		var range = xAxis.createAxisRange(rangeDataItem);
		
		range.get("label").setAll({
			forceHidden: false,
			text: ((chartMaxCount/10) * i).toLocaleString()
		});
		
		range.get("grid").setAll({
			forceHidden: false,
			strokeOpacity: 0.1,
			location: 1
		});
	}

	var yRenderer = am5xy.AxisRendererY.new(root, {
		minGridDistance: 15
	});
	
	var yAxis = chart.yAxes.push(am5xy.CategoryAxis.new(root, {
		categoryField: "cateGbn",
		renderer: yRenderer,
		tooltip: am5.Tooltip.new(root, {})
	}));
	
	yRenderer.grid.template.setAll({
		location: 1
	});

	// 범례 영역 설정
	var legend = chart.children.push(am5.Legend.new(root, {
		centerX: am5.p50,
		x: am5.p50
	}));
	
	// 카테고리 리스트 생성
	var dataObj = new Array() ;
	
	var cateGbnChk = "";
	$.each(statList, function( index, value ) {
		if (value.cateGbn != cateGbnChk) {
			cateGbnChk = value.cateGbn;
			// 객체 생성
			var dataMap = new Object() ;
			dataMap.cateGbn = value.cateGbn;
			
			$.each(statList.filter(statList => statList.cateGbn == value.cateGbn), function( index, value ) {
				//비율 표시일 경우 수치 변경
				if ($("input[name='vslzDataExprTpcd']:checked").val() == "02") {
					if ($("#vslzDataStatTpcd").val() == "02" || $("#vslzDataStatTpcd").val() == "03") {	//연령별, 성별
						dataMap[value.itemNm] = (value.corrCount/value.sumCorrCount)*100;
					} else if ($("#vslzDataStatTpcd").val() == "04") {	//기관별
						dataMap[value.itemNm] = (value.corrCount/value.itemCorrCountSum)*100;
					} else {	//연도별
						dataMap[value.itemNm] = (value.corrCount/value.cateCorrCountSum)*100;
					}
				} else {
					dataMap[value.itemNm] = value.corrCount;
				}
			});
			
			dataObj.push(dataMap) ;
		}
	});
	
	//alert(JSON.stringify(dataObj));
	
	yAxis.data.setAll(dataObj);
	
	// 항목 리스트 생성
	var itemList = new Array() ;
	
	var itemChk = "";
	$.each(statList, function( index, value ) {
		if (itemChk == "" || value.cateGbn == itemChk) {
			itemChk = value.cateGbn;
			itemList[index] = value.itemNm;
		} else {
			return false;
		}
	});
	
	//alert(JSON.stringify(itemList));
	
	// Add series
	itemList.forEach( function( itemValue ) {
		var series = chart.series.push(am5xy.ColumnSeries.new(root, {
			name: itemValue,
			stacked: true,
			xAxis: xAxis,
			yAxis: yAxis,
			baseAxis: yAxis,
			valueXField: itemValue,
			categoryYField: "cateGbn",
			sequencedInterpolation: true
		}));

		series.columns.template.setAll({
			tooltipText: "{name}, {categoryY}: {valueX.formatNumber('#,###.##')}",
			tooltipY: am5.percent(90)
		});

		series.data.setAll(dataObj);

		// Make stuff animate on load
		series.appear();

		series.bullets.push(function() {
			return am5.Bullet.new(root, {
				sprite: am5.Label.new(root, {
					text: "{valueX.formatNumber('#,###.##')}",
					fill: root.interfaceColors.get("alternativeText"),
					centerY: am5.p50,
					centerX: am5.p50,
					populateText: true
				})
			});
		});
		
		legend.data.push(series);
	});
	
	// Make stuff animate on load
	chart.appear(1000, 100);
	
	// 차트 이미지(png)로 저장
	exporting = am5plugins_exporting.Exporting.new(root, {});
	
	chartObjectChk["chartdiv"]=root;
	
	//차트 높이 조정
	var chartdivHeight = 540;
	
	if (chartdivHeight < (statList.length * 30)) chartdivHeight = statList.length * 30;
	
	$("#chartdiv").css("height", chartdivHeight + "px");
}

//선형
//https://www.amcharts.com/demos/highlighting-line-chart-series-on-legend-hover/
function chartLineSeries(statList){
	// Create root element
	var root = am5.Root.new("chartdiv");

	// Set themes
	root.setThemes([
		am5themes_Animated.new(root)
	]);
	
	// Create chart
	var chart = root.container.children.push(am5xy.XYChart.new(root, {
		panX: true,
		panY: true,
		wheelX: "panX",
		wheelY: "zoomX",
		maxTooltipDistance: 0,
		pinchZoomX:true
	}));

	// Create axes
	var xRenderer = am5xy.AxisRendererX.new(root, {
		minGridDistance: 30
	});
	
	var xAxis = chart.xAxes.push(am5xy.CategoryAxis.new(root, {
		maxDeviation: 0,
		categoryField: "cateGbn",
		renderer: xRenderer,
		tooltip: am5.Tooltip.new(root, {})
	}));
	
	xRenderer.grid.template.setAll({
		location: 1
	});
	
	xRenderer.labels.template.setAll({
		oversizedBehavior: "wrap",
		maxWidth: 85,
		textAlign: "center"
	});

	var yAxis = chart.yAxes.push(am5xy.ValueAxis.new(root, {
		min: 0,
		max: chartMaxCount,
		renderer: am5xy.AxisRendererY.new(root, {})
	}));
	
	var rendererY = yAxis.get("renderer");
	rendererY.grid.template.set("forceHidden", true);
	rendererY.labels.template.set("forceHidden", true);
	
	for (var i=0; i < 11 ; i++) {
		let rangeDataItem = yAxis.makeDataItem({
			value: (chartMaxCount/10) * i
		});
		
		var range = yAxis.createAxisRange(rangeDataItem);
		
		range.get("label").setAll({
			forceHidden: false,
			text: ((chartMaxCount/10) * i).toLocaleString()
		});
		
		range.get("grid").setAll({
			forceHidden: false,
			strokeOpacity: 0.1,
			location: 1
		});
	}
	
	// 카테고리 리스트 생성
	var dataObj = new Array() ;
	
	var cateGbnChk = "";
	$.each(statList, function( index, value ) {
		if (value.cateGbn != cateGbnChk) {
			cateGbnChk = value.cateGbn;
			// 객체 생성
			var dataMap = new Object() ;
			dataMap.cateGbn = value.cateGbn;
			dataObj.push(dataMap) ;
		}
		
		//if (index > ((3*3) - 2)) return false;
	});
	
	xAxis.data.setAll(dataObj);
	
	// 항목 리스트 생성
	var itemList = new Array() ;
	
	var itemChk = "";
	$.each(statList, function( index, value ) {
		if (itemChk == "" || value.cateGbn == itemChk) {
			itemChk = value.cateGbn;
			itemList[index] = value.itemNm;
		} else {
			return false;
		}
	});
	
	// Add series
	itemList.forEach( function( itemValue ) {
		var series = chart.series.push(am5xy.LineSeries.new(root, {
			name: itemValue,
			xAxis: xAxis,
			yAxis: yAxis,
			valueYField: "count",
			categoryXField: "cateGbn",
			//locationX: 0,
			tooltip: am5.Tooltip.new(root, {
				pointerOrientation: "horizontal",
				labelText: "{count.formatNumber('#,###.##')}"
			})
		}));
		
		// 항목 리스트 생성
		var dataItem = new Array() ;
		
		var cateGbnChk = "";
		$.each(statList.filter(statList => statList.itemNm == itemValue), function( index, value ) {
			// 객체 생성
			var dataMap = new Object() ;
			dataMap.cateGbn = value.cateGbn;
			
			//비율 표시일 경우 수치 변경
			if ($("input[name='vslzDataExprTpcd']:checked").val() == "02") {
				if ($("#vslzDataStatTpcd").val() == "02" || $("#vslzDataStatTpcd").val() == "03") {	//연령별, 성별
					dataMap.count = (value.corrCount/value.sumCorrCount)*100;
				} else if ($("#vslzDataStatTpcd").val() == "04") {	//기관별
					dataMap.count = (value.corrCount/value.itemCorrCountSum)*100;
				} else {	//연도별
					dataMap.count = (value.corrCount/value.cateCorrCountSum)*100;
				}
			} else {
				dataMap.count = value.corrCount;
			}
			
			dataItem.push(dataMap) ;
		});
		
		series.data.setAll(dataItem);
		
		// Make stuff animate on load
		series.appear();
	});

	// 커서 설정
	var cursor = chart.set("cursor", am5xy.XYCursor.new(root, {
		behavior: "none"
	}));
	cursor.lineY.set("visible", false);

	// 범례 영역 설정
	var legend = chart.rightAxesContainer.children.push(am5.Legend.new(root, {
		width: 200,
		paddingLeft: 15,
		height: am5.percent(100)
	}));

	// 범례 보이기
	legend.data.setAll(chart.series.values);
	
	// Make stuff animate on load
	chart.appear(1000, 100);
	
	// 차트 이미지(png)로 저장
	exporting = am5plugins_exporting.Exporting.new(root, {});
	
	chartObjectChk["chartdiv"]=root;
	
	//차트 높이 조정
	$("#chartdiv").css("height", "540px");
}

//도넛형
//https://www.amcharts.com/demos/donut-chart/
function chartDonut(statList){
	// Create root element
	var root = am5.Root.new("chartdiv");

	// Set themes
	root.setThemes([
		am5themes_Animated.new(root)
	]);
	
	// Create chart
	var chart = root.container.children.push(am5percent.PieChart.new(root, {
		layout: root.verticalLayout,
		innerRadius: am5.percent(50)
	}));
	
	// Create series
	var series = chart.series.push(am5percent.PieSeries.new(root, {
		valueField: "sumCount",
		categoryField: "cateGbn",
		alignLabels: false
	}));
	
	series.labels.template.setAll({
		textType: "circular",
		centerX: 0,
		centerY: 0
	});

	// Set data
	// 카테고리 리스트 생성
	var dataObj = new Array() ;
	
	var cateGbnChk = "";
	$.each(statList, function( index, value ) {
		if (value.cateGbn != cateGbnChk) {
			cateGbnChk = value.cateGbn;
			// 객체 생성
			var dataMap = new Object() ;
			dataMap.cateGbn = value.cateGbn;
			dataMap.sumCount = value.cateCorrCountSum;
			dataObj.push(dataMap) ;
		}
	});
	
	//alert(JSON.stringify(dataObj));
	
	series.data.setAll(dataObj);
	
	// 범례 영역 설정
	var legend = chart.children.push(am5.Legend.new(root, {
		centerX: am5.percent(50),
		x: am5.percent(50),
		marginTop: 15,
		marginBottom: 15
	}));
	
	legend.data.setAll(series.dataItems);
	
	// Make stuff animate on load
	chart.appear(1000, 100);
	
	// 차트 이미지(png)로 저장
	exporting = am5plugins_exporting.Exporting.new(root, {});
	
	chartObjectChk["chartdiv"]=root;
	
	//차트 높이 조정
	$("#chartdiv").css("height", "540px");
}
</script>
</c:if>

<form id="listFrm" name="listFrm" method="post">
	<input type="hidden" name="topVslzMenuId" id="topVslzMenuId" value="<c:out value="${searchVO.topVslzMenuId}"/>">
	<input type="hidden" name="subVslzMenuId" id="subVslzMenuId" value="<c:out value="${searchVO.subVslzMenuId}"/>">
	<input type="hidden" name="frtVslzMenuId" id="frtVslzMenuId" value="<c:out value="${searchVO.frtVslzMenuId}"/>"> <!-- 상위메뉴 존재 체크 변수 -->
	<input type="hidden" name="srchVslzMenuId" id="srchVslzMenuId" value="<c:out value="${searchVO.srchVslzMenuId}"/>">
	<input type="hidden" name="smryStatsNo" id="smryStatsNo" value="<c:out value="${searchVO.smryStatsNo}"/>">
	<input type="hidden" name="vslzDataStatTpcd" id="vslzDataStatTpcd" value="">
	<div class="wrap">
		<div class="sub_visual_wrap">
			<div class="data_visual">
				<ul>
					<li>임상 라이브러리</li>
				</ul>
			</div>
		</div>
		<div class="sub_nav_wrap">
			<c:forEach items="${dvzClcTopMnuList}" var="list" varStatus="rowInx" >
				<!-- class="on"시 색변경 및 보더 생김 -->
				<a onClick="javascript:goDvzClcBrs('${list.vslzMenuId}', '', '', '')" class="<c:if test="${list.vslzMenuId eq searchVO.subVslzMenuId}">on</c:if>">${list.vslzMenuNm}</a>
			</c:forEach>
		</div>
		<div class="visualization_wrap">
			<div class="wide_con">
				<div class="wide_title">${viewTitle}</div>
				<div class="container">
					<div class="left">
						<div class="con_title">데이터 선택</div>
						<div class="list">
							<!-- 하위 메뉴 있을 시 자동으로 화살표 생성 -->
							<!-- class="active" 시 폰트 굵기 변경 -->
							<c:forEach items="${dvzClcLeftMnuList}" var="list" varStatus="rowInx" >
								<c:if test="${list.depLv eq 1}">
									<ul>
										<li>
											<c:if test="${list.childCnt eq 0}">
												<a onClick="javascript:goDvzClcBrs('${searchVO.subVslzMenuId}', '', '${list.vslzMenuId}', '${list.smryStatsNo}')" class="<c:if test="${list.vslzMenuId eq searchVO.srchVslzMenuId}">active</c:if>" id="left_${list.vslzMenuId}">${list.vslzMenuNm}</a>
											</c:if>
											<c:if test="${list.childCnt gt 0}">
												<a href="javascript:void(0)" class="" id="left_${list.vslzMenuId}">${list.vslzMenuNm}</a>
												<ul>
													<c:forEach items="${dvzClcLeftMnuList}" var="list2" begin="${rowInx.index+1}" varStatus="rowInx2" >
														<c:if test="${list2.depLv eq 2 and list2.hghrVslzMenuId eq list.vslzMenuId}">
															<li>
																<!-- class="on" 시 색변경 -->
																<a onClick="javascript:goDvzClcBrs('${searchVO.subVslzMenuId}', '${list.vslzMenuId}', '${list2.vslzMenuId}', '${list2.smryStatsNo}')" class="<c:if test="${list2.vslzMenuId eq searchVO.srchVslzMenuId}">on</c:if>">${list2.vslzMenuNm}</a>
															</li>
														</c:if>
													</c:forEach>
												</ul>
											</c:if>
										</li>
									</ul>
								</c:if>
							</c:forEach>
						</div>
					</div>
					<div class="right">
						<div class="con_title">${mnuDtlInfo.vslzMenuNm}</div>
						<p class="sub_txt"><c:out value="${mnuDtlInfo.vslzMenuExplCont}" escapeXml="false" /></p>
						<div class="graph_btn">
							<ul>
								<li>
									<!-- class="on" 시 색 변경 -->
									<a onClick="javascript:setStatTp('01');" id="statTp01">연도별 그래프</a>
								</li>
								<li>
									<a onClick="javascript:setStatTp('02');" id="statTp02">연령별 그래프</a>
								</li>
								<li>
									<a onClick="javascript:setStatTp('03');" id="statTp03">성별 그래프</a>
								</li>
								<li>
									<a onClick="javascript:setStatTp('04');" id="statTp04">기관별 그래프</a>
								</li>
							</ul>
							<!-- 상세설정 버튼 클릭 시 graph 내용 보임 -->
							<!-- class="disable" 추가 시 버튼 비활성화 -->
							<a href="javascript:void(0)" class="detail_btn <c:if test="${chartDtlSrchYn eq 'N'}">disable</c:if>" id="detailDiv">상세설정</a>
						</div>
						<c:if test="${chartDtlSrchYn eq 'N'}">
							<!-- 회원가입 안되어 있을때 나오는 문구 -->
							<div class="info_txt">회원가입 후 연구자로 승인 된 회원에 한해 상세 설정이 가능합니다.</div>
						</c:if>
						<div class="graph">
							<div class="check_wrap">
								<div class="item">
									<div class="data">
										<div class="list">
											<p class="title">그래프 출력 유형</p>
											<ul>
												<c:forEach items="${chartTpcdList}" var="list" varStatus="rowInx">
													<li>
														<label class="n_radio_btn">
															<input type="radio" name="vslzChartTpcd" id="vslzChartTpcd${rowInx.index}" value="${list.detlCd}" <c:if test="${rowInx.index eq 0}">checked="checked"</c:if>>
															<span class="n_radio_mark"></span><span class="txt">${list.detlCdNm}</span>
														</label>
													</li>
												</c:forEach>
											</ul>
										</div>
										<div class="list">
											<p class="title">데이터 수치 표현</p>
											<ul>
												<c:forEach items="${dataExprTpcdList}" var="list" varStatus="rowInx">
													<li>
														<label class="n_radio_btn">
															<input type="radio" name="vslzDataExprTpcd" id="vslzDataExprTpcd${rowInx.index}" value="${list.detlCd}" <c:if test="${rowInx.index eq 0}">checked="checked"</c:if>>
															<span class="n_radio_mark"></span><span class="txt">${list.detlCdNm}</span>
														</label>
													</li>
												</c:forEach>
											</ul>
										</div>
									</div>
								</div>
								<div class="item">
									<div class="info">
										<div class="list">
											<p class="title">성별</p>
											<ul>
												<li>
													<label class="n_checkbox_s">
														<input type="checkbox" name="gndrCdAll" id="gndrCdAll" value="ALL" onClick="javascript:resetCheckBox('gndrCd', this.value);">
														<span><span class="check_img"></span>전체</span>
													</label>
												</li>
												<c:forEach items="${gndrCdList}" var="list" varStatus="rowInx">
													<li>
														<label class="n_checkbox_s">
															<input type="checkbox" name="gndrCd" id="gndrCd" value="${list.statCncrClncCd}" onClick="javascript:resetCheckBox('gndrCd', this.value);">
															<span><span class="check_img"></span>${list.statCncrClncCdNm}</span>
														</label>
													</li>
												</c:forEach>
											</ul>
										</div>
										<div class="list">
											<p class="title">연령</p>
											<ul>
												<li>
													<label class="n_checkbox_s">
														<input type="checkbox" name="ageCdAll" id="ageCdAll" value="ALL" onClick="javascript:resetCheckBox('ageCd', this.value);">
														<span><span class="check_img"></span>전체</span>
													</label>
												</li>
												<c:forEach items="${ageCdList}" var="list" varStatus="rowInx">
													<li>
														<label class="n_checkbox_s">
															<input type="checkbox" name="ageCd" id="ageCd" value="${list.statCncrClncCd}" onClick="javascript:resetCheckBox('ageCd', this.value);">
															<span><span class="check_img"></span>${list.statCncrClncCdNm}</span>
														</label>
													</li>
												</c:forEach>
											</ul>
										</div>
									</div>
								</div>
								<div class="item">
									<div class="year">
										<div class="list">
											<p class="title">연도</p>
											<ul>
												<li>
													<label class="n_checkbox_s">
														<input type="checkbox" name="critYrAll" id="critYrAll" value="ALL" onClick="javascript:resetCheckBox('critYr', this.value);">
														<span><span class="check_img"></span>전체</span>
													</label>
												</li>
												<c:forEach items="${yrList}" var="list" varStatus="rowInx">
													<li>
														<label class="n_checkbox_s">
															<input type="checkbox" name="critYr" id="critYr" value="${list.critYr}" onClick="javascript:resetCheckBox('critYr', this.value);">
															<span><span class="check_img"></span>${list.critYr}</span>
														</label>
													</li>
												</c:forEach>
										</div>
									</div>
								</div>
								<div class="item">
									<div class="insti">
										<div class="list">
											<p class="title">기관</p>
											<ul>
												<li>
													<label class="n_checkbox_s">
														<input type="checkbox" name="prtiCdAll" id="prtiCdAll" value="ALL" onClick="javascript:resetCheckBox('prtiCd', this.value);">
														<span><span class="check_img"></span>전체</span>
													</label>
												</li>
												<c:forEach items="${prtiCdList}" var="list" varStatus="rowInx">
													<c:if test="${fn:startsWith(list.statCncrClncCd, '0')}">
														<li>
															<label class="n_checkbox_s">
																<input type="checkbox" name="prtiCd" id="prtiCd" value="${list.statCncrClncCd}" onClick="javascript:resetCheckBox('prtiCd', this.value);">
																<span><span class="check_img"></span>${list.statCncrClncCdNm}</span>
															</label>
														</li>
													</c:if>
												</c:forEach>
											</ul>
										</div>
									</div>
								</div>
								<a href="javascript:void(0)" class="l_btn bc_blue" id="chartCreate">적용</a>
							</div>
						</div>
						<!-- 차트 라이브러리 -->
						<div class="visual_chart_wrap">
							<div id="chartdiv"></div>
							<a href="javascript:void(0)" class="l_btn bc_blue" id="chartSave">그래프 이미지 저장</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>