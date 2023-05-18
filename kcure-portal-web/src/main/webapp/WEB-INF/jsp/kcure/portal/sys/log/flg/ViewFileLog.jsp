<%
/* =================================================================
 * @FileName  : ViewWebLog.jsp
 * @date: 2023. 1. 19.
 * @author : shpark
 * @설명 :
 * =================================================================
 * 수정일         작성자             내용
 * -----------------------------------------------------------------------
 * 2023. 1. 19.        개발자명           파일생성
 * =================================================================
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>
<script src="/js/kcure/portal/sys/log/flg/fileLogInfo.js" ></script>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/cmm/jqueryui.css' />">
<script src="<c:url value='/js/egovframework/com/cmm/jqueryui.js' />"></script>
<script type="text/javascript">
$(document).ready(
		function() {
			//그리드
			var gridDataProvider = new RealGrid.LocalDataProvider();
			var gridView = new RealGrid.GridView('gridView');
			gridView.setDataSource(gridDataProvider);
			/* 자동 컬럼 크기 조절  */
			gridView.displayOptions.fitStyle = "fill";
			gridView.displayOptions.syncGridHeight = "always";
			//그리드 컬럼 정보 세팅
			setFieldsNColumns(gridDataProvider, gridView,gridColumns);

			//초기 세팅(주의: 조회 함수 밑에 둬야 함)
			RG.initPattern({
				dataProviderPram : gridDataProvider,
				gridViewPram : gridView,
				gridCheckBoxFlag: false,
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
				  if(SysLogForm.searchBgnDe.value > SysLogForm.searchEndDe.value){
				         alert("<spring:message code="comSymLogLgm.validate.dateCheck" />"); //검색조건의 시작일자가 종료일자보다  늦습니다. 검색조건 날짜를 확인하세요!
				         return;
					  }

				RG.doQuery({
							action : "/portal/sys/log/flg/SelectFileLogList.do",
							dataProviderPram : gridDataProvider,
							gridViewPram : gridView,
							endEvent: gridEndEvent,
							form : "SysLogForm",
							pagingId:"grid_paging",
							totalId:"totalCount",
							currCntId: "currCnt"
						});
			}


			/* 조회 완료시 실행된 스크립트 정리   */
			var gridEndEvent = function(endEventParam, data) {

			}



			/* 조회 */
			searchDate();

		});



</script>

<div class="wrap">
	<div class="con">
		<div class="area_wrap">
			<div class="section">
				<div class="btn_info">
					<!-- p테그는 남겨줘야 자동으로 버튼이 오른쪽 정렬 -->
					<p></p>
					<div class="s_btn">
						<a href="javascript:void(0)" id="srchBtn">조회</a>
<!-- 						<a href="javascript:void(0)">초기화</a> -->
					</div>
				</div>
				<form id="SysLogForm" name="SysLogForm" method="post">
					<div class="search_wrap">
						<div class="item">
							<h4>발생일자</h4>
							<div class="date_wrap">
								<ul>
									<li><input type="date" name="searchBgnDe" id="searchBgnDe" size="15" maxlength="10" value="${searchVO.searchBgnDe}" title="검색시작일" ></li>
									<li>~</li>
									<li><input type="date" name="searchEndDe" id="searchEndDe" size="15" maxlength="10" value="${searchVO.searchEndDe}" title="검색종료일" ></li>
								</ul>
							</div>
						</div>
						<div class="item">
							<h4>파일명</h4>
							<input class="s_input" name="searchFileNm" type="text"  size="15" title="검색어 입력" value='<c:out value="${searchVO.searchFileNm}"/>'  maxlength="15" >
						</div>
						<div class="item">
							<h4>사용자 ID</h4>
							<input class="s_input" name="searchId" type="text"  size="15" title="검색어 입력" value='<c:out value="${searchVO.searchId}"/>'  maxlength="15" >
						</div>
					</div>
				</form>
				<div class="btn_info">
					<p>총건수<span id="currCnt"></span>/<span id="totalCount"></span></p>
				</div>
				<div class="grid_area_wrap" id="gridView"></div>
				<div id="grid_paging" class="page_num"></div>
			</div>
		</div>
	</div>
</div>
