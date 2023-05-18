<%
/* =================================================================
* @FileName : ViewDur.jsp
* @date: 2023. 3. 14.
* @author : hjjeon
* @설명 : 데이터 활용사례
* =================================================================
* 수정일 작성자 내용
* -----------------------------------------------------------------------
* 2023. 3. 14. hjjeon 파일생성
* =================================================================
*/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>
<script type="text/javascript">
var rsrSpcdCombo = RG.setGridComboBox({
    action:"/portal/sys/usr/stt/getGridCombo.do", // 호출할 url
    cdAndNm : {labels:"detlCdNm",values:"detlCd"}, // values와 labels에 입력할 json Name값들 및 values 값 속성
    params:{gbCd : "RSR_SPCD"}
});

var gridColumns = [
	{
		header: {
			text: "진행연도"
		},
		name: "rsrProgYr",
		fieldName: "rsrProgYr",
		type: "data",
		styleName: "ud-column-center",
		width: "50"
	},
	{
		header: {
			text: "연구구분"
		},
		name: "rsrSpcdNm",
		fieldName: "rsrSpcdNm",
		lookupDisplay: true,
		required: true,
		values: rsrSpcdCombo.values,
	    labels: rsrSpcdCombo.labels,
		editor: {
	        type: "dropdown",
	        domainOnly: true,
	        textReadOnly: true
	    }
	},
	{
		header: {
			text: "제목"
		},
		name: "rsrSbjNm",
		fieldName: "rsrSbjNm",
		type: "data",
		styleName: "ud-column-left",
		width: "200",
	    renderer : {
	        showTooltip : true
	    }
	},
	{
		header: {
			text: "연구수행기관명"
		},
		name: "rsrInstNm",
		fieldName: "rsrInstNm",
		type: "data",
		styleName: "ud-column-center",
	    renderer : {
	        showTooltip : true
	    }
	},
	{
		header: {
			text: "연구방법(기관)"
		},
		name: "rsrMtcdNm",
		fieldName: "rsrMtcdNm",
		type: "data",
		styleName: "ud-column-center"
	},
	{
		header: {
			text: "다운로드"
		},
		name: "rsdAttfId",
		fieldName: "rsdAttfId",
		styleName: "ud-column-center",
		renderer:{
		      type:"html",
		      callback: function(grid, cell, w, h) {
		          var str = '<div class="btn"><a href="##" onclick="fnGetFile(\''+cell.value+'\');">다운로드</a></div>';
		          return str;
		      }
		}
	},
	{
		header: {
			text: "SEQ"
		},
		name: "utlcRgstSeq",
		fieldName: "utlcRgstSeq",
		type: "data",
		styleName: "ud-column-center",
		visible: false
	}
	];

var searchDate;

	$(document).ready(function() {
		//그리드
		var gridDataProvider = new RealGrid.LocalDataProvider();
		var gridView = new RealGrid.GridView('gridView');
		gridView.setDataSource(gridDataProvider);
		/* 자동 컬럼 크기 조절  */
		gridView.displayOptions.fitStyle = "fill";
		gridView.displayOptions.syncGridHeight = "always";

		//그리드 컬럼 정보 세팅
		setFieldsNColumns(gridDataProvider, gridView, gridColumns);

		//초기 세팅(주의: 조회 함수 밑에 둬야 함)
		RG.initPattern({
			dataProviderPram : gridDataProvider,
			gridViewPram : gridView,
			gridCheckBoxFlag: false,
			form : "srchForm",
			editable: false,
			footerBarFlag : false
		});

		// [Btn] 조회 Clik.
		$("#srchBtn").click(function() {
			if($("#searchCondition").val() != "" && $("#searchCondition").val() != null){
				if($("#searchKeyword1").val() != "" && $("#searchKeyword1").val() != null){
					searchDate();
				}else{
					alert("검색어를 입력해주세요.");
					return false;
				}
			}else{
				searchDate();
			}
		});

		searchDate = function() {
			RG.doQuery({
						action : "/portal/bbs/dur/selectDurList.do",
						form : "srchForm",
						dataProviderPram : gridDataProvider,
						gridViewPram : gridView,
						endEvent: gridEndEvent,
						pagingId:"grid_paging",
						totalId: "totalCnt",
						currCntId: "currCnt"
					});
		}


		/* 조회 완료시 실행된 스크립트 정리   */
		var gridEndEvent = function(endEventParam, response) {
			console.log("--------------------gridEndEvent---------------------");
			console.log(endEventParam);
			console.log(response);
			console.log("--------------------gridEndEvent---------------------");
		}

		/* 조회 */
		searchDate();

		$("#srchForm").keydown(function (event) {
			if (event.keyCode === 13) {
				event.preventDefault();
				$("#srchBtn").click();
			}
		});
	});

//목록 이동
function fnList(obj){
	//tab search
	$("input[name='searchKeyword']").val(obj);

	//tab on 기능
	const aLink = $(".board_tab").find("a");
	if(aLink.length > 0){
		aLink.each(function(){
			$(this).removeClass("on");
		});
	}
	if(obj != ''){
		$("#rsrSp_"+obj).attr("class","on");
	}else{
		$("#rsrSpAll").attr("class","on");
	}

	//검색
	searchDate();
}

//파일 정보 조회
function fnGetFile(fileId){
	if(fileId != 'undefined' && fileId != ''){
		$('#filedownFrm #atchFileId').val(fileId);

		const data = new FormData(document.filedownFrm);

		$.ajax({
			type:"POST",
			url: "/portal/file/getFileInfos.do",
			processData: false,
			contentType: false,
			dataType: "json",
			data,
			success: function(resp){
				if(resp.files.length > 0){
					fnFileDown(resp.files);
				}
			},
			err: function(err){
				console.log("err:", err);
			}
		});

	}else{
		alert("첨부파일이 없습니다.");
		return;
	}

}

//파일 다운로드
function fnFileDown(files){
	$('#filedownFrm #baseUrl').val(document.location.pathname);

	if(files.length > 1){

		for(var i =0; i< files.length; i++){
			$('#filedownFrm #url').val(files[i].url);
			$('#filedownFrm #nasFileName').val(files[i].name);
			$('#filedownFrm #oriName').val(files[i].oriName);

			fnCreateIframe(i);

			$('#filedownFrm').attr("target", i);
		    $('#filedownFrm').attr("action", "/portal/file/fileDown.do");
		    $('#filedownFrm').submit();

			fnSleep(1000);
		}
	}else{
		$('#filedownFrm #url').val(files[0].url);
		$('#filedownFrm #nasFileName').val(files[0].name);
		$('#filedownFrm #oriName').val(files[0].oriName);
	    $('#filedownFrm').attr("action", "/portal/file/fileDown.do");
	    $('#filedownFrm').submit();
	}
}

function fnSleep(dTime){
    const start = new Date().getTime();
    while(start + dTime > new Date().getTime());
};

//iframe 생성
function fnCreateIframe(name){
	$("iframe[name='"+name+"']").remove();

	 var frm = $('<iframe name="' + name + '" style="display: none;"></iframe>');
     frm.appendTo("body");
}
</script>
<div class="wrap">
	<div class="sub_visual_wrap">
		<div class="notice">
			<ul>
				<li>데이터 활용 사례</li>
			</ul>
		</div>
	</div>
	<div class="data_case_wrap">
		<div class="con">
			<div class="sub_pag_title">
				<p>데이터 활용 사례</p>
				<span>진단치료, 산약개발, 의료기기개발, AI, 디지털 헬스케어 연구등의 분야별 2020년 ~ 2021년도 의료데이터 활용연구시나리오를 찾아보실 수 있습니다.</span>
			</div>
			<div class="board_tab">
				<ul>
					<li><a href="javascript:void(0)" id="rsrSpAll" class="on" onclick="fnList('');">전체</a></li>
					<c:forEach var="list" items="${rsrSpcdList}" >
						<li><a href="javascript:void(0)" onclick="fnList('<c:out value="${list.detlCd}"/>');" class="" id="rsrSp_${list.detlCd}">${list.detlCdNm}</a></li>
					</c:forEach>
				</ul>
			</div>
			<form id="filedownFrm" name="filedownFrm" method="post">
				<input type="hidden" id="atchFileId" name="atchFileId" value=""/>
				<input type="hidden" id="baseUrl" name="baseUrl" value=""/>
				<input type="hidden" id="url" name="url" value=""/>
				<input type="hidden" id="nasFileName" name="nasFileName" value=""/>
				<input type="hidden" id="oriName" name="oriName" value=""/>
			</form>
			<form id="srchForm" name="srchForm" method="post">
				<input type="hidden" name="searchKeyword" />
				<div class="board_info">
					<p>전체 <span id="totalCnt"></span>건</p>
					<div class="search">
						<select class="user_sel" id="searchCondition" name="searchCondition">
							<option value="1">연구주제</option>
						</select>
						<input type="text" class="user_int" id="searchKeyword1" name="searchKeyword1" value="" placeholder="검색어 입력" title="검색 키워드"/>
						<a href="javascript:void(0)" class="btn" id="srchBtn">검색</a>
					</div>
				</div>
			</form>

			<!-- //boardpage-infor -->
			<div class="grid_area_wrap" id="gridView"></div>
			<div id="grid_paging" class="page_num"></div>
		</div>
	</div>
</div>

<div id="iframeDiv">

</div>