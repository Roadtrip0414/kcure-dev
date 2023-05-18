<%
/* =================================================================
 * @FileName : ViewCkEditorExample.jsp
 * @date: 2022.12.29
 * @author : shpark
 * @설명 : CkEditor 예제 페이지
 * =================================================================
 * 수정일         작성자             내용     
 * -----------------------------------------------------------------------
 * 2022.01.06      shpark           파일생성
 * =================================================================
 */ 
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>
<script src="/js/kcure/portal/example/editorInfo.js" ></script>
<script type="text/javascript">
	$(document).ready(
		function() {
		
		
			//그리드
			var gridDataProvider = new RealGrid.LocalDataProvider();
			var gridView = new RealGrid.GridView('gridView');
			gridView.setDataSource(gridDataProvider);
			/* 자동 컬럼 크기 조절  */
			gridView.displayOptions.fitStyle = "fill";
			//그리드 컬럼 정보 세팅
			setFieldsNColumns(gridDataProvider, gridView,gridColumns);
			
			//초기 세팅(주의: 조회 함수 밑에 둬야 함)
			RG.initPattern({
				dataProviderPram : gridDataProvider,
				gridViewPram : gridView,
				gridCheckBoxFlag: true,
				/* form : "srchForm", */
				editable:false,
				footerBarFlag : false
			});
			
			 gridView.onCellClicked = function (grid, clickData) {
		            if (clickData.cellType !== "data") {
		                return;
		            }
		            
		            var cellId = clickData.column;
		            var itemIndex = clickData.itemIndex;
		            var objRow = gridView.getValues(itemIndex);
		        
		            if (cellId == "seq") {
		            	fnDetail(objRow["seq"]);
		            }
		        }
			
			// [Btn] 조회 Clik.
			$("#srchBtn").click(function() {
				searchDate();
			});
			
			var searchDate = function() {
				RG.doQuery({
							action : "/portal/example/ckeditor/nonCheck/selectCkEditorExample.do",
							dataProviderPram : gridDataProvider,
							gridViewPram : gridView,
							endEvent: gridEndEvent,
							pagingId:"grid_paging"
						});
			}
			
			
			/* 조회 완료시 실행된 스크립트 정리   */
			var gridEndEvent = function(endEventParam, data) {
				console.log("--------------------gridEndEvent---------------------");				
				console.log(endEventParam);
				console.log(data);
				console.log("--------------------gridEndEvent---------------------");
			}
			
			/* 등록버튼 클릭  */
			$("#addBtn").click(function() {
				 location.href = "/portal/example/ckeditor/nonCheck/insertCkEditorExample.do"
			});
			
			/* 조회 */
			searchDate();

		});
	
	function fnDetail(seq){
		$('input[name=seq]').val(seq);
		$("#editorFrm").attr("action", "/portal/example/ckeditor/nonCheck/detailViewCkEditorExample.do").submit();
	}
	

</script>
<style>
	.btn{background-color: blue;color: #fff;height: 20px;
</style>
<form id="editorFrm" name="editorFrm" method="post">
	<input type="hidden" name="seq" value=""/>
</form>

<div class="subtop-tab">
	<div class="mo-scrolltab">
		<ul>
			<li class="on"><a href="#">임상 라이브러리</a></li>
			<li><a href="#">공공 라이브러리</a></li>
		</ul>
	</div>
</div>
<!-- //subtop-tab -->

<div class="subtop-infor" id="content">
	<div class="inbox-wrap">
		<div class="location">
			<a href="#" class="home"><span class="blind">홈</span></a> <a href="#"><span>editor 예제</span></a> <a href="#"><span>임상 라이브러리</span></a> <a href="#"
				class="current"><span>BaselineDB</span></a>
		</div>
		<h2>editor 예제</h2>
		<p class="txt-infor">
			editor 예제
		</p>
	</div>
</div>
<!-- //subtop-infor -->

<!-- container -->
<div id="container">
	<div class="subcon-wrap">
		<div class="inbox-wrap">
			CkEditor Sample
              <button id="srchBtn" class="btn"> 조회 </button>
              <button id="addBtn" class="btn"> 등록 </button>
              <div class="grid_table" id="gridView" style="width: 100%;height: 500px;"></div>
              <div id="grid_paging" class="pagination"></div>
				
		</div>
	</div>
	<!-- //subcon-wrap -->
	
</div>
<!-- //container -->