<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>

<style>

	.x-warp { margin-top: 10em; }

	h1 { margin-bottom: 3em; margin-bottom: 1em; }
	
	.x-title { display: inline-block; width: 10em; height: fit-content; padding: 0.4em; vertical-align: top; }
	.x-content { display: inline-block; width: 60em; padding: 0.4em; height: fit-content; }
	.x-data-detail { border: 1px solid black; padding: 1em; }
	.x-data-detail> h2,p,span { height: 2em; }
	.x-row { margin: 1em; }

	.x-data-summary { border-top: 3px solid black; border-bottom: 3px solid black;  height: max; }
	.x-data-usage { border: 1px solid black; height: max; }
	
	#btnBack { width: 10em;border-radius: 0.5em;}
	#tb_columns > td { text-indent: 2em; }
	#tb_columns > tr, td, th { border: 1px solid gray; border-collapse: collapse; }
	#tb_columns { border-collapse: collapse; width: 100%; }

	.box-btn { width: 10em;height: 4em;display: flex;text-align: center;margin:0 auto;}
	
	
</style>


<div class="wrap">
<div class="con">
<div class="area_wrap">
<div class="section">

<div class="x-warp">
		
	<div>
		<h1 style="font-weight: bold;font-size: 20px;">데이터 상세</h1>
		<div class="x-data-detail">
			<h2 style="font-weight: bold;">${detail.ctlg_nm}</h2>
			<p>${detail.ctlg_smry_cont}</p>
			<span style="font-weight: bold;">제공기관</span> <span>${detail.hosp_nm}</span> 
			<span style="font-weight: bold;">수집기간</span> <span>${detail.ctlg_coll_dtrn_vl}</span> 
			<span style="font-weight: bold;">키워드</span> <span>${detail.ctlg_kyw_cont}</span>
			<br>
		</div>
	</div>	
	<br>
	<br>		
	
	<div>
		<h1 style="font-weight: bold;font-size: 20px;">데이터 개요</h1>
		<div class="x-data-summary">
			<p class="x-row"><span class="x-title" style="font-weight: bold;">기관명</span> <span class="x-content">${detail.hosp_nm}</span></p>
			<p class="x-row"><span class="x-title" style="font-weight: bold;">데이터명</span> <span class="x-content">${detail.ctlg_nm}</span></p>
			<p class="x-row"><span class="x-title" style="font-weight: bold;">데이터소개</span> <span class="x-content" style="white-space: pre-line;">${detail.ctlg_smry_cont}</span></p>
			<p class="x-row"><span class="x-title" style="font-weight: bold;">수집기간</span> <span class="x-content">${detail.ctlg_rnwl_cycl_vl}</span></p>
			<p class="x-row"><span class="x-title" style="font-weight: bold;">테이블 및 컬럼 수</span> <span class="x-content">${detail.ctlg_tbl_col_vl}</span></p>
			<p class="x-row"><span class="x-title" style="font-weight: bold;">업데이트 주기</span> <span class="x-content">${detail.ctlg_rnwl_cycl_vl}</span></p>
			<p class="x-row"><span class="x-title" style="font-weight: bold;">주요 키워드</span> <span class="x-content">${detail.ctlg_kyw_cont}</span></p>
		</div>
	</div>
	<br>		
	<br>		
	
	<div>
		<h1 style="font-weight: bold;font-size: 20px;">데이터 활용 / 이용방법</h1>
		<div class="x-data-usage">
			<div><span class="x-title">데이터 항목<br>( Item )</span> <span class="x-content"> <table id="tb_columns"></table> </span> </div>
			<div><span class="x-title">데이터 내용<br>( Preview )</span> <span class="x-content">${detail.ctlg_cont}</span> </div>
			<div><span class="x-title">신청절차</span> <span class="x-content">${detail.ctlg_aplc_prcs_cont}</span> </div>
		</div>
	</div>	
	<br>		
	<br>
	
	<div class="box-btn">
		<input id="btnBack" type="button" value="돌아가기" onclick="goBack()" />
	</div>	

</div>	
	
</div>	
</div>
</div>
</div>

<form id="searchFrm" name="searchFrm" method="post"	action="/portal/cmn/iim/viewOpenApiDetail.do">
	<input id="searchKeyword" type="hidden" name="searchKeyword" value="" />
	<input id="searchElement" type="hidden" name="searchElement" value="" />
</form>


<script type="text/javascript">
	//
	const searchKeyword = "${detail.search_keyword}";
	const searchElement = "${detail.searchElement}";
	
	const strTempColumns = "${detail.columns}";
	const strColumns = strTempColumns.replaceAll('&quot;', '"');
	
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
			<spanr>
				<td>{column}</td>
				<td>{value}</td>
				<td></td>
			</tr>
		`
		elemColumnsTb.innterHtml = "";
		let objColumns = JSON.parse(strColumns);
		console.log(typeof(objColumns));
		console.table(objColumns);
	
	
		elemColumnsTb.innerHTML = `<tr style="background-color: #bbdefb;"> <th>구분</th> <th>항목명</th> <th>비고</th> </tr>`;
		for(item in objColumns)
		{
			let htmlTr = format.replaceAll("{column}", item);
			htmlTr = htmlTr.replaceAll("{value}", objColumns[item]);
			elemColumnsTb.innerHTML += htmlTr;
		}
	
		elemColumnsTb.style.color = 'blue';
	}
	
	//
	loadKeyword();
	renderColumnTable();

</script>


	<!-- gony -->
