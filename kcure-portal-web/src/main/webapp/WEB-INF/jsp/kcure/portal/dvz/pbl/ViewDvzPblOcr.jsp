<%
/* =================================================================
 * @FileName : ViewDvzPblOcr.jsp
 * @date: 2023.02.01
 * @author : kyh
 * @설명 : 데이터시각화 공공라이브러리 암발생자 화면
 * =================================================================
 * 수정일         작성자             내용     
 * -----------------------------------------------------------------------
 * 2023.02.01     kyh           파일생성
 * =================================================================
 */ 
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>
<script type="text/javascript">
//차트용 전역 변수
var exporting;
var chartObjectChk = {};

$(document).ready(function() {	
	$("#left_menu").trigger("click");
	
	setStatTp("${searchVO.vslzDataStatTpcd}");
	
	$("#chartSave").click(function(e) {
		chartSave(e);
	});
	
	$("#chartCreate").click(function(e) {
		chartShow();
	});
});

function goDvzPblOcr(statsPbiCncrKncd){
	if ($("#vslzDataStatTpcd").val() != "00") {
		$("#statsPbiCncrKncd").val(statsPbiCncrKncd+"");
		$("#listFrm").attr("action", "/portal/dvz/pbl/ocr/viewDvzPblOcr.do").submit();
	}
	
	/*
	$("#statsPbiCncrKncd").val(statsPbiCncrKncd+"");
	$("#listFrm").attr("action", "/portal/dvz/pbl/ocr/viewDvzPblOcr.do").submit();
	*/
}

function setStatTp(statTpCd){
	$("#vslzDataStatTpcd").val(statTpCd);
	
	for (var i=0; i < 7 ;i++) {
		$("#statTp0"+i).attr("class", "");
	}
	
	$("#statTp"+statTpCd).attr("class", "on");
	/*
	if(statTpCd == "00") {
		$("#statsPbiCncrKncd").val("");
		//if($("#left_menu_ul > li:eq(0) > a").attr("class") != "on") $("#left_menu_ul > li:eq(0) > a").trigger("click");
		$("#left_menu_ul > li:eq(0) > a").attr("class", "on");
		$("#left_menu_ul > li:gt(0) > a").attr("class", "");
	}
	*/
	chartShow();
}

function chartShow(){
	if(chartObjectChk["chartdiv"]){   //check if exist chart dispose that
		chartObjectChk["chartdiv"].dispose();
		exporting = null;
	}
	
	//$("#left_menu").next("ul").children("li:nth-child(n+2)").css("display", $("#vslzDataStatTpcd").val() == "00" ? "none" : "block");
	//$("#left_menu_ul > li:nth-child(n+2)").css("display", $("#vslzDataStatTpcd").val() == "00" ? "none" : "block");
	
	var form = $("#listFrm").serialize();
	
	$.ajax({
        type: "post",
        url: "/portal/dvz/pbl/ocr/selectDvzPblOcrStatList.do",
        data: form,
        dataType: 'json',
        success: function (data) {
        	if (data.result == "success") {
        		if (data.statList.length > 0) {
        			switch ($("#vslzDataStatTpcd").val()) {
	        			case "01":
	        				chartLineSeries(data.statList);		//연도별 그래프 : 선형
	        				break;
	        			case "02":
	        				chartClusteredColumn(data.statList);	//연령별 그래프 : 막대(세로)
	        				break;
	        			case "05":
	        				chartPopulationPyramid(data.statList);	//지역(시도) 그래프 : 피라미드(맵)
	        				break;
	        			case "06":
	        				chartLineSeries(data.statList);	//요약병기별 그래프 : 선형
	        				break;
	        			default:
	        				chartClusteredBarDonut(data.genderList, data.statList);	//요약 그래프 : 도넛 및 가로막대
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

//도넛 및 가로막대
function chartClusteredBarDonut(genderList, statList){
	// Create root element
	var root = am5.Root.new("chartdiv");

	// Set themes
	root.setThemes([
		am5themes_Animated.new(root)
	]);

	// Create wrapper container
	var container = root.container.children.push(am5.Container.new(root, {
		layout: root.horizontalLayout,
		width: am5.p100,
		height: am5.p100
	}));

	// ===========================================================
	// Donut chart
	// ===========================================================
	// Create chart
	var donutChart = container.children.push(am5percent.PieChart.new(root, {
		layout: root.verticalLayout,
		innerRadius: am5.percent(50),
		width: am5.percent(35)
	}));
	
	// Create series
	var donutSeries = donutChart.series.push(am5percent.PieSeries.new(root, {
		valueField: "sumCount",
		categoryField: "cateGbn",
		alignLabels: false
	}));
	
	donutSeries.labels.template.setAll({
		textType: "circular",
		centerX: 0,
		centerY: 0
	});

	// Set data
	// 카테고리 리스트 생성
	var donutDataObj = new Array() ;
	
	var cateGbnChk = "";
	$.each(genderList, function( index, value ) {
		if (value.cateGbn != cateGbnChk) {
			cateGbnChk = value.cateGbn;
			// 객체 생성
			var dataMap = new Object() ;
			dataMap.cateGbn = value.cateGbn;
			dataMap.sumCount = value.sumCount;
			donutDataObj.push(dataMap) ;
		}
	});
	
	//alert(JSON.stringify(dataObj));
	
	donutSeries.data.setAll(donutDataObj);
	
	// 범례 영역 설정
	var donutLegend = donutChart.children.push(am5.Legend.new(root, {
		centerX: am5.percent(50),
		x: am5.percent(50),
		marginTop: 15,
		marginBottom: 15
	}));
	
	donutLegend.data.setAll(donutSeries.dataItems);
	
	// Make stuff animate on load
	donutChart.appear(1000, 100);

	// ===========================================================
	// ClusteredBar chart
	// ===========================================================
	// Create chart
	var chart = container.children.push(am5xy.XYChart.new(root, {
		panX: false,
		panY: false,
		wheelX: "panX",
		wheelY: "zoomX",
		layout: root.verticalLayout,
		width: am5.percent(65)
	}));

	// Create axes
	var xAxis = chart.xAxes.push(am5xy.ValueAxis.new(root, {
		min: 0,
		renderer: am5xy.AxisRendererX.new(root, {})
	}));

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
	//var legend = chart.children.push(am5.Legend.new(root, {
	//	centerX: am5.p50,
	//	x: am5.p50
	//}));
	
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
				dataMap[value.itemNm] = value.count;
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
				labelText: "[bold]{categoryY}[/] : {valueX}"
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
					text: "{valueX}",
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
					//text: "{name}",
					fill: am5.color(0xffffff),
					populateText: true
				})
			});
		});

		series.data.setAll(dataObj);

		// Make stuff animate on load
		series.appear();
	});
	
	//legend.data.setAll(chart.series.values);

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
		renderer: am5xy.AxisRendererY.new(root, {})
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
				labelText: "{count}"
			})
		}));
		
		// 항목 리스트 생성
		var dataItem = new Array() ;
		
		var cateGbnChk = "";
		$.each(statList.filter(statList => statList.itemNm == itemValue), function( index, value ) {
			// 객체 생성
			var dataMap = new Object() ;
			dataMap.cateGbn = value.cateGbn;
			dataMap.count = value.count;
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
		renderer: am5xy.AxisRendererY.new(root, {})
	}));

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
				dataMap[value.itemNm] = value.count;
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
			tooltipText: "{name}, {categoryX}:{valueY}",
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
					text: "{valueY}",
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
}

//피라미드(맵)
//https://www.amcharts.com/demos/population-pyramid/
function chartPopulationPyramid(statList){
	// 카테고리 리스트 생성
	var allSidoData = new Array() ;
	
	$.each(statList, function( index, value ) {
		if (value.cateGbnCd == "00") {
			// 객체 생성
			var dataMap = new Object() ;
			dataMap.itemNm = value.itemNm;
			dataMap.male = value.mCount;
			dataMap.female = value.feCount;
			allSidoData.push(dataMap) ;
		}
	});
	
	//alert(JSON.stringify(allSidoData));
	allSidoData = aggregateData(allSidoData);
	
	var sidoData = new Object() ;
	
	var sidoDataChk = "";
	$.each(statList, function( index, value ) {
		if (value.cateGbnCd != "00" && value.cateGbnCd != sidoDataChk) {
			sidoDataChk = value.cateGbnCd;
			
			var sidoDataDtl = new Array() ;
			$.each(statList.filter(statList => statList.cateGbnCd == value.cateGbnCd), function( index, value ) {
				// 객체 생성
				var dataMap = new Object() ;
				dataMap.itemNm = value.itemNm;
				dataMap.male = value.mCount;
				dataMap.female = value.feCount;
				sidoDataDtl.push(dataMap) ;
			});

			sidoData[tranSidoCDChart(value.cateGbnCd)] = sidoDataDtl;
		}
	});
	
	//alert(JSON.stringify(sidoData));
	
	// Create root element
	var root = am5.Root.new("chartdiv");

	// Set themes
	root.setThemes([
		am5themes_Animated.new(root)
	]);
	
	// Create wrapper container
	var container = root.container.children.push(am5.Container.new(root, {
		layout: root.horizontalLayout,
		width: am5.p100,
		height: am5.p100
	}));

	// Set up formats
	root.numberFormatter.setAll({
		numberFormat: "#.##as"
	});
	
	// ===========================================================
	// Map chart
	// ===========================================================	
	// Create chart
	var map = container.children.push(
		am5map.MapChart.new(root, {
		panX: "none",
		panY: "none",
		wheelY: "none",
		projection: am5map.geoMercator(),
			width: am5.percent(40)
		})
	);

	// ===========================================================
	// Pyramid chart
	// ===========================================================
	// Create chart
	var chart = container.children.push(am5xy.XYChart.new(root, {
		panX: false,
		panY: false,
		wheelX: "none",
		wheelY: "none",
		layout: root.verticalLayout,
		width: am5.percent(60)
	}));
	
	// Create axes
	var yAxis1 = chart.yAxes.push(am5xy.CategoryAxis.new(root, {
		categoryField: "itemNm",
		renderer: am5xy.AxisRendererY.new(root, {})
	}));
	yAxis1.get("renderer").labels.template.set("fontSize", 12);
	yAxis1.data.setAll(allSidoData);

	var yAxis2 = chart.yAxes.push(am5xy.CategoryAxis.new(root, {
		categoryField: "itemNm",
		renderer: am5xy.AxisRendererY.new(root, {
			opposite: true
		})
	}));
	yAxis2.get("renderer").labels.template.set("fontSize", 12);
	yAxis2.data.setAll(allSidoData);

	var xAxis = chart.xAxes.push(am5xy.ValueAxis.new(root, {
		min: -50,
		max: 50,
		numberFormat: "#.s'%'",
		renderer: am5xy.AxisRendererX.new(root, {
			minGridDistance: 40
		})
	}));

	// Create series
	var maleSeries = chart.series.push(am5xy.ColumnSeries.new(root, {
		name: "남",
		xAxis: xAxis,
		yAxis: yAxis1,
		valueXField: "malePercent",
		categoryYField: "itemNm",
		clustered: false
	}));

	maleSeries.columns.template.setAll({
		tooltipText: "남, 연령 {categoryY}: {male} ({malePercent.formatNumber('#.0s')}%)",
		tooltipX: am5.p100
	});

	maleSeries.data.setAll(allSidoData);

	var femaleSeries = chart.series.push(am5xy.ColumnSeries.new(root, {
		name: "여",
		xAxis: xAxis,
		yAxis: yAxis1,
		valueXField: "femalePercent",
		categoryYField: "itemNm",
		clustered: false
	}));

	femaleSeries.columns.template.setAll({
		tooltipText: "여, 연령 {categoryY}: {female} ({femalePercent.formatNumber('#.0s')}%)",
		tooltipX: am5.p100
	});

	femaleSeries.data.setAll(allSidoData);

	// Add labels
	var maleLabel = chart.plotContainer.children.push(am5.Label.new(root, {
		text: "남",
		fontSize: 20,
		y: 5,
		x: 5,
		//centerX: am5.p50,
		fill: maleSeries.get("fill"),
		background: am5.RoundedRectangle.new(root, {
			fill: am5.color(0xffffff),
			fillOpacity: 0.5
		})
	}));

	var femaleLabel = chart.plotContainer.children.push(am5.Label.new(root, {
		text: "여",
		fontSize: 20,
		y: 5,
		x: am5.p100,
		centerX: am5.p100,
		dx: -5,
		fill: femaleSeries.get("fill"),
		background: am5.RoundedRectangle.new(root, {
			fill: am5.color(0xffffff),
			fillOpacity: 0.5
		})
	}));

	// ===========================================================
	// Map chart
	// ===========================================================
/*
	// Create chart
	var map = container.children.push(
		am5map.MapChart.new(root, {
		panX: "none",
		panY: "none",
		wheelY: "none",
		projection: am5map.geoMercator(),
			width: am5.percent(40)
		})
	);
*/
	chart.getTooltip().set("autoTextColor", false);

	// Title
	var title = map.children.push(am5.Label.new(root, {
		text: "전국",
		fontSize: 20,
		y: -10,
		x: 230,
		centerX: am5.p50,
		background: am5.Rectangle.new(root, {
			fill: am5.color(0xffffff),
			fillOpacity: 0.5
		})
	}));

	// Create polygon series
	var polygonSeries = map.series.push(
		am5map.MapPolygonSeries.new(root, {
			fill: am5.color(0x999999),
			geoJSON: am5geodata_southKoreaLow
		})
	);
	
	polygonSeries.mapPolygons.template.adapters.add("tooltipText", function(text, target) {
		return tranSidoNmChart(target.dataItem.dataContext.id);
	});

	polygonSeries.mapPolygons.template.states.create("hover", {
		fill: chart.get("colors").getIndex(2)
	});

	polygonSeries.mapPolygons.template.states.create("active", {
		fill: chart.get("colors").getIndex(3)
	});

	var activePolygon;
	polygonSeries.mapPolygons.template.events.on("click", function(ev) {
		if (activePolygon) {
			activePolygon.set("active", false);
		}
		activePolygon = ev.target;
		activePolygon.set("active", true);
		var state  = ev.target.dataItem.dataContext.id.split("-").pop();
		var data = aggregateData(sidoData[state]);
		  
		for(var i = 0; i < data.length; i++){
			maleSeries.data.setIndex(i, data[i]);
			femaleSeries.data.setIndex(i, data[i]);
		}
	
		title.set("text", tranSidoNmChart(ev.target.dataItem.dataContext.id));
	});
	
	// 차트 이미지(png)로 저장
	exporting = am5plugins_exporting.Exporting.new(root, {});
	
	chartObjectChk["chartdiv"]=root;
}

function aggregateData(list) {
	var maleTotal = 0;
	var femaleTotal = 0;
	
	for(var i = 0; i < list.length; i++) {
		var row = list[i];
		maleTotal += row.male;
		femaleTotal += row.female;
	}
	
	for(var i = 0; i < list.length; i++) {
		var row = list[i];
		row.malePercent = -1 * Math.round((row.male / maleTotal) * 10000) / 100;
		row.femalePercent = Math.round((row.female / femaleTotal) * 10000) / 100;
	}
	
	return list;
}
</script>

<form id="listFrm" name="listFrm" method="post">
	<input type="hidden" name="statsPbiCncrKncd" id="statsPbiCncrKncd" value="<c:out value="${searchVO.statsPbiCncrKncd}"/>">
	<input type="hidden" name="vslzDataStatTpcd" id="vslzDataStatTpcd" value="<c:out value="${searchVO.vslzDataStatTpcd}"/>">
	<div class="wrap">
		<div class="sub_visual_wrap">
			<div class="data_visual">
				<ul>
					<li>공공 라이브러리</li>
				</ul>
			</div>
		</div>
		<div class="sub_nav_wrap">
				<!-- class="on"시 색변경 및 보더 생김 -->
				<a href="/portal/dvz/pbl/ocr/viewDvzPblOcr.do" class="on">암 발생자 수</a>
				<a href="/portal/dvz/pbl/dth/viewDvzPblDth.do" class="">암 환자 사망자 수</a>
				<a href="/portal/dvz/pbl/svl/viewDvzPblSvl.do" class="">암 환자 생존자 수</a>
		</div>
		<div class="visualization_wrap">
			<div class="wide_con">
				<div class="wide_title"> </div>
				<div class="container">
					<div class="left">
						<div class="con_title">데이터 선택</div>
						<div class="list">
							<!-- 하위 메뉴 있을 시 자동으로 화살표 생성 -->
							<!-- class="active" 시 폰트 굵기 변경 -->
							<ul>
								<li>
									<a href="javascript:void(0)" class="" id="left_menu">암종</a>
									<ul id="left_menu_ul">
										<li>
											<!-- class="on" 시 색변경 -->
											<a onClick="javascript:goDvzPblOcr('')" class="<c:if test="${'' eq searchVO.statsPbiCncrKncd}">on</c:if>">모든 암</a>
										</li>
										<c:forEach items="${dvzPblLeftMnuList}" var="list" varStatus="rowInx" >
											<li>
												<!-- class="on" 시 색변경 -->
												<a onClick="javascript:goDvzPblOcr('${list.statCncrPblCd}')" class="<c:if test="${list.statCncrPblCd eq searchVO.statsPbiCncrKncd}">on</c:if>">${list.statCncrPblCdNm}</a>
											</li>
										</c:forEach>
									</ul>
								</li>
							</ul>
						</div>
					</div>
					<div class="right">
						<div class="con_title">${viewTitle}</div>
						<!-- 
						<p class="sub_txt">
							· 진단명의 구분 코드<br>· 위암 모집단관련 KCD 코드 분류 (C16, D002, 기타암 및 기타질환)
						</p>
						 -->
						<div class="graph_btn">
							<ul>
								<li>
									<!-- class="on" 시 색 변경 -->
									<a href="/portal/dvz/pbl/ocr/viewDvzPblOcr.do" id="statTp00">요약 그래프</a>
									<!-- <a onClick="javascript:setStatTp('00');" id="statTp00">요약 그래프</a> -->
								</li>
								<li>
									<a onClick="javascript:setStatTp('01');" id="statTp01">연도별 그래프</a>
								</li>
								<li>
									<a onClick="javascript:setStatTp('02');" id="statTp02">연령별 그래프</a>
								</li>
								<li>
									<a onClick="javascript:setStatTp('05');" id="statTp05">지역(시도) 그래프</a>
								</li>
								<li>
									<a onClick="javascript:setStatTp('06');" id="statTp06">요약병기별 그래프</a>
								</li>
							</ul>
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