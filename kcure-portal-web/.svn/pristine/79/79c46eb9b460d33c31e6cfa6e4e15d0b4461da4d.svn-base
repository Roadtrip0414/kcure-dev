<%
/* =================================================================
 * @FileName : ViewChartExample1.jsp
 * @date: 2023.01.13
 * @author : bhs
 * @설명 : Chart 샘풀 페이지
 * =================================================================
 * 수정일         작성자             내용     
 * -----------------------------------------------------------------------
 * 2023.01.13      bhs           파일생성
 * =================================================================
 */ 
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="//www.amcharts.com/lib/4/themes/animated.js"></script>
<script type="text/javascript">

	am4core.useTheme(am4themes_animated);
	am4core.useTheme(am4themes_material);

	//차트객체 생성
	var chart = am4core.create("chartdiv", am4charts.XYChart);
	
	//Json 파일 데이터 가져오기
	chart.dataSource.url = "/data/chart1.json";
	
	//차트좌표 설정
	var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
	categoryAxis.dataFields.category = "country";
	categoryAxis.title.text = "Local country offices";
	categoryAxis.renderer.grid.template.location = 0;
	categoryAxis.renderer.minGridDistance = 20;

	var  valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
	valueAxis.title.text = "Expenditure (M)";

	// Create series
	var series = chart.series.push(new am4charts.ColumnSeries());
	series.dataFields.valueY = "research";
	series.dataFields.categoryX = "country";
	series.name = "Research";
	series.tooltipText = "{name}: [bold]{valueY}[/]";
	// This has no effect
	// series.stacked = true;

	var series2 = chart.series.push(new am4charts.ColumnSeries());
	series2.dataFields.valueY = "marketing";
	series2.dataFields.categoryX = "country";
	series2.name = "Marketing";
	series2.tooltipText = "{name}: [bold]{valueY}[/]";
	// Do not try to stack on top of previous series
	// series2.stacked = true;

	var series3 = chart.series.push(new am4charts.ColumnSeries());
	series3.dataFields.valueY = "sales";
	series3.dataFields.categoryX = "country";
	series3.name = "Sales";
	series3.tooltipText = "{name}: [bold]{valueY}[/]";
	series3.stacked = true;

	// cursor 적용
	chart.cursor = new am4charts.XYCursor();

	// 차트범례 적용
	chart.legend = new am4charts.Legend();

</script>

<style>
	.btn{background-color: blue;color: #fff;height: 20px;
</style>

<div class="subtop-tab">
		<div class="mo-scrolltab">
			<ul>
				<li class="on"><a href="/portal/dvz/clb/nonCheck/viewScmIntroduce.do">임상라이브러리</a></li>
				<!-- <li><a href="#">공공라이브러리</a></li> -->
			</ul>
		</div>
	</div>
	<!-- //subtop-tab -->

	<div class="subtop-infor" id="content">
		<div class="inbox-wrap">
			<div class="location">
				<a href="#" class="home"><span class="blind">홈</span></a>
				<a href="#"><span>데이터 시각화</span></a>
				<a href="#"><span>임상라이브러리</span></a>
				<a href="#" class="current"><span>개요</span></a>
				<div class="locamenu-box">
					<a href="#" class="lt-openmenu"><span class="blind">메뉴열기</span></a>
					<div class="location-menu">
						<ul>
							<li><a href="#">개요</a></li>
						</ul>
					</div>
				</div>
			</div>
			<h2>개요</h2>
			<p class="txt-infor">10개 암 등록환자 수(‘20~’19)  약1675000명 중 K-CURE 참여 의료기관들이 보유한 데이터 현황입니다.<br> K-CURE 임상 데이터 네트워크에 10개 암종 데이터를 단계적으로 수집∙구축할 예정이며, 구축된 데이터 현황에 대하여 시각화 정보로 구성하였습니다.</p>
		</div>
	</div>
	<!-- //subtop-infor -->

<!-- container -->
<div id="container">
	<div class="subcon-wrap">
		<div class="inbox-wrap">
			<div><span>[ Sample1 ]</span></div>
			<!--  contents  -->
			<div id="chartdiv" style="width: 900px; height: 800px;"></div>
			
		</div>
	</div>
	<!-- //subcon-wrap -->
</div>
<!-- //container -->