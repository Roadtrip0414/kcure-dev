<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>
<script type="text/javascript" src="/js/ElasticRequest.js"></script>

<style>
#result_template_api, #result_template_elastic {
	display: none;
}

.result-item {
	display: flex;
	flex-direction: column;
	margin-bottom: 10px;
	border-bottom: 1px solid #ccc;
	padding: 12px;
	width: 100%;
}

.result-item-row {
	display: flex;
	justify-content: space-between;
	align-items: center;
	width: 100%;
	margin-bottom: 0.5em;
}

.result-item-row>:nth-child(2) {
	min-width: 200px;
	text-align: right;
	margin: 0.5em 0;
}

.result-item-row .category_nm {
	color: blue;
}

.result-item-row .data_format {
	background-color: blue;
	color: white;
	padding: 0.3em;
}

.result-item-row .title {
	font-size: larger;
	font-weight: bold;
}

.result-item-row .list_title {
	/* */

}

.result-item-row .org_nm_updated_at_keywords {
	display: flex;
}

.result-item-row .org_nm_updated_at_keywords .caption_text {
	display: flex;
	align-items: center;
}

.result-item-row .org_nm_updated_at_keywords .caption_text .caption {
	font-weight: bold;
}

.result-item-row .org_nm_updated_at_keywords .caption_text .text {
	margin: 0 2em 0 0.2em;
}

.result-item-row .preview_request {
	display: flex;
	justify-content: flex-end;
}

.result-item-row .preview_request .preview, .result-item-row .preview_request .request
	{
	border: 1px solid black;
	border-radius: 0.4em;
	padding: 0.3em;
	margin-left: 0.5em;
}

.result-item-row .preview_request .request {
	background-color: black;
	color: white;
}

.tabs {
	margin-top: 100px;
}

.tabs .tab-header {
	display: flex;
}

.tabs .tab-title {
	font-size: large;
	font-weight: bold;
	margin: 1em 0;
	padding-bottom: 1em;
	border-bottom: 3px solid black;
}

.tabs .tab-btn {
	border: 1px solid #ccc;
	padding: 1em;
	cursor: pointer;
}

.tabs .tab-btn.active {
	border: 1px solid black;
}

.tabs .tab-content {
	display: none;
}

.tabs .tab-content.active {
	display: block;
}
</style>

<div class="wrap">
	<div class="con">
		<div class="area_wrap">
			<div class="section">
				<form id="srchForm" name="srchForm" method="post">
					<input type="hidden" id="page" name="page" />
					<div class="search_wrap" style="float: left; width: 82%">
						<div class="item">
							<h4>타이틀</h4>
							<input type="text" id="listTitle" name="listTitle" value=""
								placeholder="타이틀 입력" title="검색 키워드" style="width: 300px" />
						</div>
					</div>
					<div class="btn_center"
						style="justify-content: right; float: right; padding-top: 0px">
						<a href="javascript:reqData()" id="srchBtn" class="bc_blue">조회</a>
					</div>
				</form>
				<p></p>
			</div>
		</div>
		<div id="result_template_api">
			<div class="result-item">
				<div class="result-item-row">
<!-- 					<div class="category_nm">category_nm</div> -->
<!-- 					<div> -->
<!-- 						<span class="data_format">data_format</span> -->
<!-- 					</div> -->
				</div>
				<div class="result-item-row">
					<div class="title">title</div>
					<div></div>
				</div>
				<div class="result-item-row">
					<div class="list_title">list_title</div>
					<div></div>
				</div>
				<div class="result-item-row">
					<div class="org_nm_updated_at_keywords">
						<div class="caption_text">
							<span class="caption">제공기관</span> <span class="text org_nm">org_nm</span>
						</div>
						<div class="caption_text">
							<span class="caption">수집기간</span> <span class="text updated_at">updated_at</span>
						</div>
						<div class="caption_text">
							<span class="caption">키워드</span> <span class="text keywords">keywords</span>
						</div>
						<div class="caption_text">
							<a class="request" target="_blank" href="">활용신청</a>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div id="result_template_elastic">
			<div class="result-item">
				<div class="result-item-row">
					<div class="hosp_nm">병원명</div>
					<div></div>
				</div>
				<div class="result-item-row">
					<div class="ctlg_nm">카탈로그명</div>
					<div></div>
				</div>
				<div class="result-item-row">
					<div class="ctlg_smry_cont">카탈로그요약내용</div>
					<div></div>
				</div>
			</div>
		</div>

		<div class="tabs">
			<div class="tab-header">
				<button class="tab-btn active">
					특화디비<span id="cntSpdbData"></span>
				</button>
				<button class="tab-btn">
					K-Cure<span id="cntKcureData"></span>
				</button>
<!-- 				<button class="tab-btn"> -->
<!-- 					파일 데이터<span id="cntFileData"></span> -->
<!-- 				</button> -->
				<button class="tab-btn">
					오픈 API<span id="cntOpenData"></span>
				</button>
<!-- 				<button class="tab-btn"> -->
<!-- 					표준데이터셋<span id="cntStndData"></span> -->
<!-- 				</button> -->
			</div>

			<div class="tab-content active">
				<div class="tab-title">
					특화DB<span id="titSpdbData"></span>
				</div>
				<div id="resSpdbData"></div>
			</div>

			<div class="tab-content">
				<div class="tab-title">
					K-Cure<span id="titKcureData"></span>
				</div>
				<div id="resKcureData"></div>
			</div>

<!-- 			<div class="tab-content"> -->
<!-- 				<div class="tab-title"> -->
<!-- 					파일 데이터<span id="titFileData"></span> -->
<!-- 				</div> -->
<!-- 				<div id="resFileData"></div> -->
<!-- 			</div> -->

			<div class="tab-content">
				<div class="tab-title">
					오픈 API<span id="titOpenData"></span>
				</div>
				<div id="resOpenData"></div>
			</div>

<!-- 			<div class="tab-content"> -->
<!-- 				<div class="tab-title"> -->
<!-- 					표준데이터셋<span id="titStndData"></span> -->
<!-- 				</div> -->
<!-- 				<div id="resStndData"></div> -->
<!-- 			</div> -->
		</div>
		
		<div id="pagenation">
			
		</div>
		
	</div>
</div>

<form id="detailFrm" name="detailFrm" method="post" action="/portal/cmn/iim/viewOpenApiDetail.do">
	<input id="search_keyword" type="hidden" name="search_keyword" value=""/>
	<input id="ctlg_cont" type="hidden" name="ctlg_cont" value=""/>
	<input id="ctlg_spcd" type="hidden" name="ctlg_spcd" value=""/>
	<input id="ctlg_rnwl_cycl_vl" type="hidden" name="ctlg_rnwl_cycl_vl" value=""/>
	<input id="ctlg_smry_cont" type="hidden" name="ctlg_smry_cont" value=""/>
	<input id="arry_ord_vl" type="hidden" name="arry_ord_vl" value=""/>
	<input id="ctlg_kyw_cont" type="hidden" name="ctlg_kyw_cont" value=""/>
	<input id="ctlg_item_nm" type="hidden" name="ctlg_item_nm" value=""/>
	<input id="ctlg_item_cont" type="hidden" name="ctlg_item_cont" value=""/>
	<input id="ctlg_nm" type="hidden" name="ctlg_nm" value=""/>
	<input id="crtn_dt" type="hidden" name="crtn_dt" value=""/>
	<input id="version" type="hidden" name="version" value=""/>
	<input id="ctlg_aplc_prcs_cont" type="hidden" name="ctlg_aplc_prcs_cont" value=""/>
	<input id="ctlg_coll_dtrn_vl" type="hidden" name="ctlg_coll_dtrn_vl" value=""/>
	<input id="ctlg_tbl_col_vl" type="hidden" name="ctlg_tbl_col_vl" value=""/>
	<input id="hosp_nm" type="hidden" name="hosp_nm" value=""/>
	<input id="ctlg_item_spnm" type="hidden" name="ctlg_item_spnm" value=""/>
	<input id="hosp_seq" type="hidden" name="hosp_seq" value=""/>
	<input id="timestamp" type="hidden" name="timestamp" value=""/>
	<input id="columns" type="hidden" name="columns" value=""/>
</form>

<script type="text/javascript">

	let searchKeyword = "${searchKeyword.searchKeyword}";
	const searchElement = "${searchKeyword.searchElement}";

	var resp = {};
	resp.spdpDataList = [];
	resp.kcureDataList = [];
	resp.fileDataList = [];
	resp.openDataList = [];
	resp.stndDataList = [];

	var pageCurrent = 1;
	var pageTotal = 0;
	var pageSize = 10;
	
	$("#srchForm").keydown(function (event) {
		if (event.keyCode === 13) {
			event.preventDefault();
			document.getElementById("srchBtn").click();

		}
	});

	$("body").addClass("admin");

	const tabButtons = document.querySelectorAll(".tab-btn");
	const tabContents = document.querySelectorAll(".tab-content");

	function openTab(tabIndex) {
		
		console.log("Debug>>> (tabIndex) " + tabIndex);
		
		tabButtons.forEach((btn) => {
			btn.classList.remove("active");
		});
		tabContents.forEach((content) => {
			content.classList.remove("active");
		});
		tabButtons[tabIndex].classList.add("active");
		tabContents[tabIndex].classList.add("active");
		
		// reqData();
	}

	tabButtons.forEach((btn, index) => {
		btn.addEventListener("click", () => {
			openTab(index);
		});
	});

	function showResultApiEach(
			template,
			elemId,
			tabCntId,
			titleCntId,
			rows,
			doName
		) {
		$("#" + elemId).html("");
		$("#" + tabCntId).html("(" + rows.length + "건)");
		$("#" + titleCntId).html("(" + rows.length + "건)");

// 		pageTotal = rows.length / pageSize;
// 		alert("Debug>>> (pageTotal) " + pageTotal);
// 		let pageRowNumMin = pageCurrent * pageSize - pageSize + 1;
// 		let pageRowNumMax = pageCurrent * pageSize;
// 		let rowNum = 0;
		for (const row of rows) {
// 			rowNum = rowNum + 1;
			
// 			if(rowNum < pageRowNumMin || rowNum > pageRowNumMax)
// 				continue;
			
			const list_id = row.list_id;
			cur = template.clone();
// 			$(cur).find(".category_nm").html(row.search_keyword || row.ctlg_kyw_cont);
			$(cur).find(".title").html(row.ctlg_nm);
			$(cur).find(".list_title").html(row.ctlg_smry_cont);
			$(cur).find(".org_nm").html(row.hosp_nm);
			$(cur).find(".updated_at").html(row.ctlg_coll_dtrn_vl);
			$(cur).find(".keywords").html(row.ctlg_kyw_cont);
			$(cur).find(".data_format").html(row.data_format);

			//console.log(JSON.stringify(row));
 			// $(cur).attr("id", "click-" + list_id);
 			$(cur).get(0).originData = row;
			//alert($(this).get(0).originData);
 			$(cur).click(function() {

				// console.log("\\Debug>>> (id)");
				// console.log( $("#click-" + list_id).get(0).id );
				// let dataDetail = $("#click-" + list_id).get(0).originData;
				let dataDetail = $(this).get(0).originData
				dataDetail.tags = "";
				console.table(dataDetail);
				//console.log(JSON.stringify(dataDetail));
				$("#search_keyword").val(searchKeyword);
				$("#ctlg_cont").val(dataDetail.ctlg_cont);
				$("#ctlg_spcd").val(dataDetail.ctlg_spcd);
				$("#ctlg_smry_cont").val(dataDetail.ctlg_smry_cont);
				$("#ctlg_rnwl_cycl_vl").val(dataDetail.ctlg_rnwl_cycl_vl);
				$("#arry_ord_vl").val(dataDetail.arry_ord_vl);
				$("#ctlg_kyw_cont").val(dataDetail.ctlg_kyw_cont);
				$("#ctlg_item_nm").val(dataDetail.ctlg_item_nm);
				$("#ctlg_item_cont").val(dataDetail.ctlg_item_cont);
				$("#ctlg_aplc_prcs_cont").val(dataDetail.ctlg_aplc_prcs_cont);
				$("#ctlg_coll_dtrn_vl").val(dataDetail.ctlg_coll_dtrn_vl);
				$("#ctlg_nm").val(dataDetail.ctlg_nm);
				$("#hosp_nm").val(dataDetail.hosp_nm);
				$("#crtn_dt").val(dataDetail.crtn_dt);
				$("#version").val(dataDetail.version);
				$("#ctlg_tbl_col_vl").val(dataDetail.ctlg_tbl_col_vl);
				$("#ctlg_item_spnm").val(dataDetail.ctlg_item_spnm);
				$("#hosp_seq").val(dataDetail.hosp_seq);
				$("#timestamp").val(dataDetail.timestamp);
				$("#columns").val(dataDetail.columns);
				$("#detailFrm").submit();
			});

 			if(tabCntId === "cntOpenData") {
				const url = "https://www.data.go.kr/data/" + list_id + "/" + doName;
				$(cur).find(".request").attr("href", url); 				
 			} else {
 				$(cur).find(".request").remove();
 			} 
 			
			$("#" + elemId).append(cur);
		}
	}

	async function showResultApi(data) {
		const templateApi = $("#result_template_api").children().first();
		showResultApiEach(
			templateApi,
			"resSpdbData",
			"cntSpdbData",
			"titSpdbData",
			data.spdpDataList,
			"spdbData.do"
		);
		showResultApiEach(
			templateApi,
			"resKcureData",
			"cntKcureData",
			"titKcureData",
			data.kcureDataList,
			"kcureData.do"
		);
// 		showResultApiEach(
// 			templateApi,
// 			"resFileData",
// 			"cntFileData",
// 			"titFileData",
// 			data.fileDataList,
// 			"fileData.do"
// 		);
		showResultApiEach(
			templateApi,
			"resOpenData",
			"cntOpenData",
			"titOpenData",
			data.openDataList,
			"openapi.do"
		);
// 		showResultApiEach(
// 			templateApi,
// 			"resStndData",
// 			"cntStndData",
// 			"titStndData",
// 			data.stndDataList,
// 			"standard.do"
// 		);
	}


	async function requestApi(listTitle) {
		const page = 1;
		const perPage = 1000;

		const params = $("#srchForm").serialize();

		const urlStr = "/portal/cmn/iim/selectComOpenList.do";

		return $.ajax({
			type: "POST",
			url: urlStr,
			data: { listTitle, page, perPage },
			dataType: "json",
			success: function (result) {
				// showResultApi(result.data);
				// console.log(JSON.stringify(result.data));
				resp.fileDataList = result.data.fileDataList;
				resp.openDataList = result.data.openDataList;
				resp.stndDataList = result.data.stndDataList;
			},
		});
	}

	// 특화디비
	async function requestElasticCtlg1(search) {
		const size = 1000;

	    const elasticCtlg1 = ElasticRequest({
	        url: "/portal/example/elastic/nonCheck/searchExample.do",
	        path: "/cncr_spzn_ctlg_1/_search",
	      });

        const query = {
                match: {
                  ctlg_kyw_cont: search
                }
              };

        const rows = await elasticCtlg1.search(JSON.stringify(query), size);
        return rows;
	}

	// K-Cure
	async function requestElasticCtlg2(search) {
		const size = 1000;

	    const elasticCtlg2 = ElasticRequest({
	        url: "/portal/example/elastic/nonCheck/searchExample.do",
	        path: "/cncr_spzn_ctlg_2/_search",
	      });

        const query = {
                match: {
                  ctlg_kyw_cont: search
                }
              };

        const rows = await elasticCtlg2.search(JSON.stringify(query), size);
        return rows;
	}


	async function reqData() {
		const listTitle = $("#listTitle").val();
		if (!listTitle) {
			alert("타이틀을 입력하세요.");
			return;
		}

		console.log("\n\nDEBUG>>> (locaton) reqData");
		await requestApi(listTitle);
		//
		let spdpDataList = [];
		spdpDataList = await requestElasticCtlg1(listTitle);
		console.table(resp.spdpDataList);
		let doneHosp = [];
		spdpDataList.forEach(item => {
			//
			if(item.ctlg_kyw_cont.includes(listTitle))
			{			
				if(!doneHosp.includes(item.hosp_seq))
				{
					// alert(item.hosp_seq);
					doneHosp.push(item.hosp_seq);
					//console.table(doneHosp);
	
					let sampHosp = spdpDataList.filter(x=> x.hosp_seq === item.hosp_seq);
					let objColumns = {};
					sampHosp.forEach( item2 => {
						objColumns[item2.ctlg_item_spnm] = item2.ctlg_item_nm;
					});
					//
					//console.table(objColumns);
					item.columns = JSON.stringify(objColumns);
					resp.spdpDataList.push(item);
				}
			}
 		});
		console.table(resp.spdpDataList);

		//
		let kcureDataList = [];
		kcureDataList = await requestElasticCtlg2(listTitle);
		doneHosp = [];
		kcureDataList.forEach(item => {
			//
			if(!doneHosp.includes(item.hosp_seq))
			{
				// alert(item.hosp_seq);
				doneHosp.push(item.hosp_seq);
				//console.table(doneHosp);

				let sampHosp = kcureDataList.filter(x=> x.hosp_seq === item.hosp_seq);
				let objColumns = {};
				sampHosp.forEach( item2 => {
					objColumns[item2.ctlg_item_spnm] = item2.ctlg_item_nm;
				});
				//
				//console.table(objColumns);
				item.columns = JSON.stringify(objColumns);
				resp.kcureDataList.push(item);
			}
 		});
		//console.table(data.kcureDataList[0].columns);

		// console.log("\n\nDEBUG>>> (data) data");
        // console.log(JSON.stringify(data));

        console.log("\n\nDEBUG>>> (size) data.spdpDataList");
       	console.log(resp.spdpDataList.length);
        console.log("\n\nDEBUG>>> (size) data.kcureDataList");
       	console.log(resp.kcureDataList.length);
       	console.log("\n\nDEBUG>>> (size) data.fileDataList");
       	console.log(resp.fileDataList.length);
        console.log("\n\nDEBUG>>> (size) data.openDataList");
       	console.log(resp.openDataList.length);
        console.log("\n\nDEBUG>>> (size) data.stndDataList");
       	console.log(resp.stndDataList.length);

       	if(resp.openDataList.length > 0) {
       		openTab(2);
       	} 

       	if(resp.kcureDataList.length > 0) {
       		openTab(1);
       	} 

       	if(resp.spdpDataList.length >= 0) {
       		openTab(0);
       	} 

        await showResultApi(resp);
	}


	function loadKeyword() {

		console.log("searchKeyword : " + searchKeyword);
		console.log("searchElement : " + searchElement);

		let elemlistTitle = document.getElementById("listTitle");
		elemlistTitle.value = searchKeyword;

		let elemFromSearchKeyword = document.getElementById("search_keyword");
		elemFromSearchKeyword.value = searchKeyword;

		let elemSearch = document.getElementById("inputSearch");
		elemSearch.value = null;

		if(searchKeyword !== ""){
			document.getElementById("srchBtn").click();
		}
	}

	loadKeyword();

</script>


<!-- gony -->
