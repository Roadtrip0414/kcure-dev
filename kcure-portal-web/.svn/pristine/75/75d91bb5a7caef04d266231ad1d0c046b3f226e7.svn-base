<!DOCTYPE html>
<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
/* =================================================================
 * @FileName : ViewFileNmSearch.jsp
 * @date: 2023.01.12
 * @author : bhs
 * @설명 : 프로그램명 검색화면
 * =================================================================
 * 수정일         작성자             내용     
 * -----------------------------------------------------------------------
 * 2023.01.12     bhs           파일생성
 * =================================================================
 */ 
%>
<html lang="ko">
<head>
<title><spring:message code="comSymPrm.fileNmSearch.title"/></title><!-- 프로그램파일명 검색 -->
<link href="<c:url value="/css/egovframework/com/com.css"/>" rel="stylesheet" type="text/css">
<link href="<c:url value="/css/egovframework/com/button.css"/>" rel="stylesheet" type="text/css">

<%@include file="/WEB-INF/jsp/kcure/portal/com/global_scripts.jsp"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>


<script type="text/javascript">
	
	var gridColumns = [
	   {
			header: {
				text: "프로그램 파일명"
			},
			name: "progrmFileNm",
			fieldName: "progrmFileNm",
			type: "data",
			tag: {
				dataType: "text"
			},
			styleName: "ud-column-center"
		},{
			header: {
				text: "프로그램 명"
			},
			name: "progrmKoreanNm",
			fieldName: "progrmKoreanNm",
			type: "data",
			tag: {
				dataType: "text"
			},
			styleName: "ud-column-center"
		}
	];

</script>

<script type="text/javascript">
	$(document).ready(
		function() {
			//그리드			
			var gridDataProvider = new RealGrid.LocalDataProvider();
			var gridView = new RealGrid.GridView('gridView');
			gridView.setDataSource(gridDataProvider);
			/* 자동 컬럼 크기 조절  */
			gridView.displayOptions.fitStyle = "fill";
			
			gridView.onCellClicked = function (grid, clickData) {				
				if(clickData.cellType != "gridEmpty"){
					window.opener.settingGridCellForPrm(gridDataProvider.getValue(clickData.dataRow, "progrmFileNm"));  
					window.close();
				}
			}
			
			//그리드 컬럼 정보 세팅
			setFieldsNColumns(gridDataProvider, gridView,gridColumns);

			//초기 세팅(주의: 조회 함수 밑에 둬야 함)
			RG.initPattern({
				dataProviderPram : gridDataProvider,
				gridViewPram : gridView,
				gridCheckBoxFlag: false,
				form : "srchForm",
				editable:false,
				footerBarFlag : false
			});

			
			// [Btn] 조회 Clik.
			$("#btnSearch").click(function() {
				$("input[type=hidden][name=pageIndex]").val("1");
				searchAction();

				return false;
			});
			
			
			var searchAction = function() {				
				RG.doQuery({
							form :  "srchForm",
							action : "/portal/sys/prm/nonCheck/SelectSrchProgramList.do",
							dataProviderPram : gridDataProvider,
							gridViewPram : gridView,
							endEvent: gridEndEvent,
							pagingId:"grid_paging"
						});
			}
			
			/* 조회 완료시 실행된 스크립트 정리   */
			var gridEndEvent = function(endEventParam, response) {
				console.log("--------------------gridEndEvent---------------------");
				console.log(endEventParam);
				console.log(response);
				if(typeof response !== "undefined"){
					$("#totalCnt").text(response.paginationInfo.totalRecordCount);
				}else{
					$("#totalCnt").text("0");
				}
				console.log("--------------------gridEndEvent---------------------");
				
			
			}	
			
			/* 조회 */
			searchAction();
		});
	
</script>


</head>
	<body>
		<form name="srchForm"  id="srchForm" action ="" method="post">
		
			<div class="board" style="width:480px;margin-left: 45px;">
				<h1><spring:message code="comSymPrm.fileNmSearch.pageTop.title"/></h1>
			
				<div class="search_box" title="<spring:message code="common.searchCondition.msg" />">
					<ul>
						<li>
							<label for=""><spring:message code="comSymPrm.fileNmSearch.progrmFileNm"/> : </label>
							<input class="s_input2 vat" name="searchKeyword1" id="searchKeyword1"  type="text" value="" size="30" maxlength="60" title="<spring:message code="title.searchCondition"/>" />
							
							<input class="s_btn" type="button" id="btnSearch" value='<spring:message code="button.inquire" />' title="<spring:message code="title.inquire"/>"/>
						</li>
					</ul>
				</div>
				
				<div class="grid_table" id="gridView" style="width: 100%; height: 400px;"></div>
			    <div id="grid_paging" class="pagination"></div>

			</div>
		</form>
	</body>
</html>

