<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>
<script type="text/javascript" src="/js/ElasticRequest.js"></script>
<script type="text/javascript"></script>
<style>
#data-detail {
	border: 1px solid #BCBCBC;
  	height: auto;
 	padding-left: 0px;
/*  	padding-bottom: 1em; */
/*  	padding-top: 10px; */
 	margin-left: 158.4px;
/*  	width: 85%; */
}
#box1 {
	border: 1px solid #BCBCBC;
}

#tb_columns{

	border: 1px solid #BCBCBC;
	width: 70%;
	border-collapse: collapse;
}
#tb_columns td,tr{

	border: 1px solid #BCBCBC;
}
.middleTB td,tr{
	padding-bottom: 23px;

}
.middleTB td{
 	padding-left: 130px;
}
#df{
	padding-left: 0px;

}
</style>
<div class="wrap" align="center">

	<div class="con">
			<p id="dataset"></p>
			<p id="dataset-detail"></p>
	</div>
<!-- 데이터 상세 start  -->
	<h4 style="font-weight:bold;padding-left: 10%; font-size:20px;">데이터 상세</h4>
	<div class="con" style="height: auto; padding-left: 0px;padding-top: 30px; padding-bottom: 0px;">
		<div id="data-detail">
				<div style="font-weight:bold; font-size:14px;height:10px;">
					<td>${detail.ctlg_cont}</td>
				</div>
				<div style="font-size:12px;height:10px;padding-top: 15px;">
					<td>${detail.ctlg_aplc_prcs_cont}</td>
				</div>
				<div id="tdCssDiv" style="height:100px;padding-top: 25px;">
					<a1 style="font-weight: bold;font-size:12px;padding-right: 20px;">제공기관</a1>
					<b style="font-size:12px;padding-right: 20px;">${detail.ctlg_nm}</b>
					<c style="font-weight: bold;font-size:12px;padding-right: 20px;">수집기간</c>
					<d style="font-size:12px;padding-right: 20px;">${detail.crtn_dt}</d>
					<e style="font-weight: bold;font-size:12px;padding-right: 20px;">키워드</e>
					<f style="font-size:12px;padding-right: 20px;">${detail.ctlg_kyw_cont}</f>
				</div>
		</div>
	</div>
<!-- 데이터 상세 end  -->
<div class="con">
<!-- 데이터 개요 start  -->
<h4 style="padding-left: 10%; padding-bottom: 20px; font-size:20px; font-weight: bold;">데이터 개요</h4>
	<div class="con" style="height: auto; width: 75%; border-top: 2px solid; padding-left: 0px; border-bottom: 2px solid;  padding-top: 30px; padding-bottom: 0px;">
			<table class="middleTB" style="margin:">
				<tr> <td id="df">기관명 </td> <td id="departement" > ${detail.ctlg_nm}</td> </tr>
				<tr> <td id="df">데이터명 </td> 	<td id="data-name" > ${detail.ctlg_nm} </td> </tr>
				<tr> <td id="df">데이터소개</td> 	<td id="data-introduce"> ${detail.ctlg_cont}</td> </tr>
				<tr> <td id="df">수집기간</td> 	<td id="data-range"> ${detail.ctlg_smry_cont}</td> </tr>
				<tr> <td id="df">테이블 및 컬럼 수</td> 	<td id="data-cnts"> ${detail.ctlg_tbl_col_vl}</td> </tr>
				<tr> <td id="df">업데이트 주기</td> 	<td id="data-period"> ${detail.ctlg_rnwl_cycl_vl}</td> </tr>
				<tr> <td id="df">주요 키워드</td> 	<td id="data-keyword"></td> </tr>
			</table>
	</div>
<!-- 데이터 개요 end  -->
	<div class="con">

	</div>
<!-- 데이터 활용 / 이용방법 start  -->
	<h4 style="padding-left: 10%; padding-bottom: 20px; font-size:20px; font-weight: bold; " > 데이터 활용 / 이용방법</h4>
	<div>

	</div>
	<div class="con" style="height: auto; width: 75%; border-top: 1px solid; padding-left: 0px; padding-top: 5px;">
		<table>
			<tr>
				<th>데이터 항목</th>
			</tr>
			<tr>
				<th>( Item )</th>
			</tr>

		</table>
		<table id="tb_columns" style="margin-top: 20px;"></table>
	</div>

	<div  class="con" style="border-bottom: 1px solid;  height: auto; width: 75%; padding-left: 0px; padding-bottom: 30px; padding-top: 0px;">
		<table >
			<tr>
				<th>데이터 내용 (Preview) : </th>
				<th> 메타 통계데이터, sample 데이터, fake데이터 등 제공 여부 등 내용 설명</th>
			</tr>
		</table>
		<table>
			<tr>
				<th>신청절차 :</th>
				<th>OOO포털에 회원 가입 후 데이터 신청 및 심의 절타 진행 OOO병원
					OOO데이터센터(asdf@abcd.com)을 통한 데이터 신청, 심의 등 문의</th>
			</tr>
		</table>
	</div>
	<div>
		<input type="button" value="돌아가기" onclick="goBack()" />
	</div>
</div>
<!-- 데이터 활용 / 이용방법 end -->

<form id="searchFrm" name="searchFrm" method="post"
	action="/portal/cmn/iim/viewOpenApiDetail.do">
	<input id="searchKeyword" type="hidden" name="searchKeyword" value="" />
	<input id="searchElement" type="hidden" name="searchElement" value="" />
</form>

<script type="text/javascript">

// --
const searchKeyword = "${detail.search_keyword}";
const searchElement = "${detail.searchElement}";
console.log(searchKeyword);
console.log(searchElement);
const strTempColumns = "${detail.columns}";
const strColumns = strTempColumns.replaceAll('&quot;', '"');
//console.log(strColumns);

// alert("searchKeyword : " + searchKeyword);

//
function loadKeyword() {
	let elemlistTitle = document.getElementById("inputSearch");
	elemlistTitle.value = null;
}

//
function goBack() {
	$("#searchKeyword").val(searchKeyword);
	$("#searchElement").val("detail");
	$("#searchFrm").submit();
}

//
function renderColumnTable() {
	let elemColumnsTb = document.getElementById("tb_columns");

	let format = `
		<tr>
			<td>{column}</td>
			<td>{value}</td>
			<td></td>
		</tr>
	`
	elemColumnsTb.innterHtml = "";
	let objColumns = JSON.parse(strColumns);
	console.log(typeof(objColumns));
	console.table(objColumns);

// 	objColumns.forEach(function(item){
// 		format = format.replaceAll("{column}", item);
// 		format = format.replaceAll("{value}", objColumns.key);
// 		elemColumnsTb.innterHtml += format;
// 	});
	elemColumnsTb.innerHTML = `<tr style="background-color: #bbdefb;"> <td>구분</td> <td>항목명</td> <td>비고</td> </tr>`;
	for(item in objColumns){
		let htmlTr = format.replaceAll("{column}", item);
		htmlTr = htmlTr.replaceAll("{value}", objColumns[item]);
		console.log(htmlTr);
		elemColumnsTb.innerHTML += htmlTr;
	}

	elemColumnsTb.style.color = 'blue';
}

//
loadKeyword();

//
renderColumnTable();
</script>


<!-- gony -->
