
<%
/* =================================================================
 * @FileName : ViewRealgridExample.jsp
 * @date: 2022.12.29
 * @author : shpark
 * @설명 : RealGrid 예제 페이지
 * =================================================================
 * 수정일         작성자             내용     
 * -----------------------------------------------------------------------
 * 2022.12.29      shpark           파일생성
 * =================================================================
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="/js/kcure/portal/example/gridInfo.js"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$('body').addClass('admin');
						
						//그리드
						var gridDataProvider = new RealGrid.LocalDataProvider();
						var gridView = new RealGrid.GridView('gridView');
						gridView.setDataSource(gridDataProvider);
						/* 자동 컬럼 크기 조절  */
						gridView.displayOptions.fitStyle = "fill";
						//그리드 컬럼 정보 세팅
						setFieldsNColumns(gridDataProvider, gridView,
								gridColumns);

						//초기 세팅(주의: 조회 함수 밑에 둬야 함)
						RG.initPattern({
							dataProviderPram : gridDataProvider,
							gridViewPram : gridView,
							gridCheckBoxFlag : true,
							/* form : "srchForm", */
							editable : true,
							footerBarFlag : false
						});
						// [Btn] 조회 Clik.
						$("#srchBtn").click(function() {
							searchDate();
						});
						var searchDate = function() {
							RG
									.doQuery({
										action : "/portal/example/realgrid/nonCheck/selectRealgridExample.do",
										dataProviderPram : gridDataProvider,
										gridViewPram : gridView,
										endEvent : gridEndEvent
									});
						}

						/* 조회 완료시 실행된 스크립트 정리   */
						var gridEndEvent = function(endEventParam, response) {
							console
									.log("--------------------gridEndEvent---------------------");
							console.log(endEventParam);
							console.log(response);
							console
									.log("--------------------gridEndEvent---------------------");
						}

						/* 행추가 버튼 클릭  */
						$("#addBtn").click(function() {
							RG.insertRowGrid({
								dataProviderPram : gridDataProvider,
								dataValues : [],
								endEvent : addEndEvent
							});
						});

						/*행추가 후 실행 function  */
						var addEndEvent = function() {
							console
									.log("--------------------addEndEvent---------------------");
							console
									.log("--------------------addEndEvent---------------------");
						}

						/* RG.deleteCreateRowGrid({ gridViewPram: gridView, dataProviderPram: dataProvider }); */

						/* 행삭제 버튼 클릭  */
						$("#delBtn").click(function() {
							RG.deleteRowGrid({
								gridViewPram : gridView,
								dataProviderPram : gridDataProvider,
								endEvent : delEndEvent
							});
							/* gridDataProvider.insertRow(0,[]); */
						});

						/*행삭제 후 실행 function  */
						var delEndEvent = function() {
							console
									.log("--------------------delEndEvent---------------------");
							console
									.log("--------------------delEndEvent---------------------");
						}

						/* 저장 버튼 클릭  */
						$("#saveBtn")
								.click(
										function() {
											/*
											 * parameter: json 타입
											 *            action : 호출할 url
											 *            endEvent : 저장 이후 처리되는 함수 설정
											 *            endPram : endEvent에 넘길 파라미터
											 *            dataProviderPram : 조회된 리턴값 dataProvider
											 *            gridViewPram : 그리드 ID
											 *            checkBinding : 입력한 스트링값에 대해서 변수를 설정하고, 그 변수에 Y,N값을 체크에 따라서 설정하게 함
											 * ex : action : "/stock/report/searchStkReportDestructionListTest.action" ,
											 *            form : "srchForm",
											 *            endEvent : fnCall
											 *            endPram : "스트링,json,숫자"
											 *            dataProviderPram : dataProvider,
											 *            gridViewPram : realgrid
											 *            checkBinding : "checked"
											 */
											RG
													.doSave({
														action : "/portal/example/realgrid/nonCheck/saveRealgridExample.do",
														endEvent : saveEndEvent,
														dataProviderPram : gridDataProvider,
														gridViewPram : gridView,
														showEndMessage : true,
														cud : [ "C", "U", "D",
																"R" ]
													});
										});

						/*행삭제 후 실행 function  */
						var saveEndEvent = function() {
							console
									.log("--------------------saveEndEvent---------------------");
							console
									.log("--------------------saveEndEvent---------------------");
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
					<br />
					<br />
					<br />
					<br />
				</div>

				<div class="grid_area_wrap">
					RealGrid Sample
					<button id="srchBtn" class="btn">조회</button>
					<button id="addBtn" class="btn">행추가</button>
					<button id="delBtn" class="btn">행삭제</button>
					<button id="saveBtn" class="btn">저장</button>
					<!-- ajax 처리시 페이지 처리  -->
					<div class="grid_table" id="gridView"
						style="width: 100%; height: 650px;"></div>
				</div>
				<!-- //boardlist-wrap -->
			</div>
		</div>
	</div>
</div>