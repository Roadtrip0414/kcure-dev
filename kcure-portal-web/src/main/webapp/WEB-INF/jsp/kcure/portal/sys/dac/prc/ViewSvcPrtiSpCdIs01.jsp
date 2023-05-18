<%
/* =================================================================
* @FileName : ViewSvcPrtiSpCdIs01
* @date: 2023. 3. 10.
* @author : parkgu
* @설명 : 기관 심의담당자 관리
* =================================================================
* 수정일 작성자 내용
* -----------------------------------------------------------------------
* 2023. 3. 10. parkgu 파일생성
* =================================================================
*/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>
<style>
.not-saved {
	background-color: lightgray;
}
</style>
<script type="text/javascript">
const global = {
	gridView: null,
	rows: []
};

var gridColumns = [
{
	header: {
		text: "참여기관ID"
	},
	name: "prtiId",
	fieldName: "prtiId",
	styleName: "ud-column-center",
	editable: false,
	visible: false,
},
{
	header: {
		text: "참여기관"
	},
	name: "prtiNm",
	fieldName: "prtiNm",
	styleName: "ud-column-center",
	editable: false,
},
{
	header: {
		text: "직위"
	},
	name: "rvwPrncPstNm",
	fieldName: "rvwPrncPstNm",
	styleName: "ud-column-center",
	editable: true,
	editor: {
		type: "line",
		maxLength: 50,
	},
},
{
	header: {
		text: "이름"
	},
	name: "userNm",
	fieldName: "userNm",
	styleName: "ud-column-center",
	button: "action",
	buttonVisibility: "always",
	editable: false,
},
{
	header: {
		text: "근무처 전화번호"
	},
	name: "rvwPstPn",
	fieldName: "rvwPstPn",
	styleName: "ud-column-center",
	editable: true,
	editor: {
		type: "line",
		maxLength: 11,
		mask: {
		    editMask: '999-9999-9999',
		},
	},
},
{
	header: {
		text: "핸드폰 번호"
	},
	name: "userMbphNo",
	fieldName: "userMbphNo",
	styleName: "ud-column-center",
	editable: false,
},
{
	header: {
		text: "Email"
	},
	name: "userId",
	fieldName: "userId",
	styleName: "ud-column-center",
	editable: false,
},
];
</script>

<script type="text/javascript">
function validate(name, value) {
	if (name === "rvwPrncPstNm") {
		if (!value || !/^[A-Za-z\d가-힣]+$/.test(value)) {
			return { valid: false, msg: "직위는 대문자, 소문자, 숫자, 한글만 가능합니다." };
		}
	} else if (name === "userNm") {
		if (!value) {
			return { valid: false, msg: "이름은 필수 입력입니다." };
		}
	} else if (name === "rvwPstPn") {
		if (!value || !/^[\d]+$/.test(value)) {
			return { valid: false, msg: "근무처 전화번호는 숫자만 가능합니다." };
		}
	}

	return { valid: true, msg: "" };
}

function onValidateColumn(grid, column, inserting, value, itemIndex, dataRow) {
	const error = {};

	const userNm = global.gridView.getValue(dataRow, "userNm");
	if (!userNm) {
		return error;
	}

	const { valid, msg } = validate(column.fieldName, value);
	if (!valid) {
		error.level = "error";
		error.message = msg;
	}
	return error;
}

/**
 * @Method Name : setPersonInfo
 * @Method 설명 : 사용자 검색 레이어 팝업 사용자 선택
 * @param : userId 사용자 선택 id
 * @param : userNm 사용자 선택 이름
 * @param : userMbphNo 사용자 선택 핸드폰번호
 * @param : rvwPstPn 사용자 선택 근무처 전화번호
 */
function setPersonInfo(userId, userNm, userMbphNo, rvwPstPn) {
	const rows = global.gridView.getSelectedRows();
	if (rows.length === 0) return;

	const rowIdx = rows[0];
	if (rowIdx == -1) return;

	global.gridView.setValue(rowIdx, "userId", userId);
	global.gridView.setValue(rowIdx, "userNm", userNm);
	global.gridView.setValue(rowIdx, "userMbphNo", userMbphNo);
	global.gridView.setValue(rowIdx, "rvwPstPn", rvwPstPn);
	global.gridView.checkItem(rowIdx, true);
	$('#schPersonPop').removeClass('on');
}
/**
 * @Method Name : fnSchPopup
 * @Method 설명 : 사용자 검색 레이어 팝업 오픈
 */
function fnSchPopup(prtiId){
	$('#schPersonPop').find('input').val('');
	$("#prtiId").val(prtiId);
	$('#schPersonPop #targetTbody').html('');
	$('#schPersonPop').addClass('on');
}

/**
 * @Method Name : schPopUpBtn
 * @Method 설명 : 사용자 검색 레이어 팝업 사용자 검색
 */
function schPopUpBtn(){
	var param = $("#schPersonPop").find('input,select').serialize();

	$.ajax({
		url: "/portal/sys/dac/prc/selectUserList.do",
		dataType: "json",
		data: param,
		type: "POST",
		async: false,
		success: function(response) {
			console.log(response);
			$('#schPersonPop #targetTbody').html('');
			$.each(response.userList, function (index, item) {
				var html = `<tr>
				<td class="name">
					<p>` + item.userNm + `</p>
				</td>
				<td>` + item.userMbphNo + `</td>
				<td style="padding: 0 20px;">` + item.userId + `</td>
				<td>
					<a href="#" onclick="setPersonInfo('` + item.userId + `', '` + item.userNm + `','` + item.userMbphNo + `', '` + item.rvwPstPn + `'); return false;" class="bc_d_gray s_btn">선택</a>
				</td>`;
				$('#schPersonPop #targetTbody').append(html);
			});

			$('#schPersonPop #targetTbl').show();
		},
	});
}

$(document).ready(
	function() {
		//그리드
		const gridDataProvider = new RealGrid.LocalDataProvider();
		const gridView = new RealGrid.GridView('gridView');
		global.gridView = gridView;
		global.rows = gridDataProvider.getRows();
		gridView.setDataSource(gridDataProvider);
		gridView.setRowStyleCallback((grid, item, fixed) => {
			if (item.isDataRow) {
				const userNm = grid.getValue(item.dataRow, "userNm");
				if (!userNm) {
					return "not-saved";
				}
			}
		})
		/* 자동 컬럼 크기 조절  */
		gridView.displayOptions.fitStyle = "fill";
		gridView.displayOptions.syncGridHeight = "always";
		gridView.setRowIndicator({ visible: true });
		gridView.onEditChange = function (grid, index, value) {
			if (index.column == "userNm") {
				grid.setValue(index.dataRow, "rvwPrncPstNm", "");
				grid.setValue(index.dataRow, "rvwPstPn", "");
			}
		};
		gridView.onCellButtonClicked = function(grid, index, column) {
			if (column.fieldName == "userNm") {
				const prtiId = grid.getValue(index.dataRow, "prtiId");
				fnSchPopup(prtiId);
			}
		};

		$("#txtUserNmFilter").keydown(function (event) {
			if (event.keyCode === 13) {
				event.preventDefault();
			}
		})
		$("#txtUserNmFilter").keyup(function (event) {
			gridView.cancel();
			const userNm = $("#txtUserNmFilter").val();
			gridDataProvider.setRows(global.rows.filter(row => row.userNm.includes(userNm)));
		})

		$("#searchKeyword").keydown(function (event) {
			if (event.keyCode === 13) {
				event.preventDefault();
				$("#btnSearch").click();
			}
		})

		//그리드 컬럼 정보 세팅
		setFieldsNColumns(gridDataProvider, gridView, gridColumns);

		//초기 세팅(주의: 조회 함수 밑에 둬야 함)
		RG.initPattern({
			dataProviderPram : gridDataProvider,
			gridViewPram : gridView,
			gridCheckBoxFlag: true,
			form : "srchFrm",
			editable:true,
			footerBarFlag : false
		});

		// [Btn] 조회 Clik.
		$("#btnSearch").click(function() {
			$("input[type=hidden][name=pageIndex]").val("1");
			searchAction();

			return false;
		});

		const searchAction = function() {
			RG.doQuery({
						form :  "srchFrm",
						action : "/portal/sys/dac/prc/selectSvcPrtiSpCdIs01.do",
						dataProviderPram : gridDataProvider,
						gridViewPram : gridView,
						endEvent: gridEndEvent,
						//totalId: "totalCnt",
						//currCntId: "currCnt"
					});
		}

		/* 조회 완료시 실행된 스크립트 정리   */
		const gridEndEvent = function(endEventParam, response) {
			const records = response.RECORDS || response.gridRresults;
			global.rows = records;
			console.log("--------------------gridEndEvent---------------------");
			console.log(endEventParam);
			console.log(response);
			console.log("--------------------gridEndEvent---------------------");


		}

		/* 행추가 버튼 클릭  */
		$("#addBtn").click(function() {
			 RG.insertRowGrid({
				dataProviderPram : gridDataProvider,
				dataValues:[],
				endEvent: addEndEvent
			});
		});

		/*행추가 후 실행 function  */
		const addEndEvent = function() {
			console.log("--------------------addEndEvent---------------------");
			console.log("--------------------addEndEvent---------------------");
		}


		 /* RG.deleteCreateRowGrid({ gridViewPram: gridView, dataProviderPram: dataProvider }); */

		/* 행삭제 버튼 클릭  */
		$("#delBtn").click(function() {
			RG.deleteRowGrid({
				gridViewPram: gridView
				, dataProviderPram: gridDataProvider
				, endEvent: delEndEvent
			});
			/* gridDataProvider.insertRow(0,[]); */
		});

		/*행삭제 후 실행 function  */
		const delEndEvent = function() {
			console.log("--------------------delEndEvent---------------------");
			console.log("--------------------delEndEvent---------------------");
		}


		/* 저장 버튼 클릭  */
		$("#saveBtn").click(function() {
			gridView.commit();
			var rowChecked = gridView.getCheckedRows();
			if(rowChecked.length == 0){
				alert("저장할 데이터가 없습니다.");
				return;
			}
			
			if (!confirm("저장시 변경된 참여기관의 기존 '기관관리자' 권한은 모두 삭제됩니다. ( 선택된 담당자만 기관관리자 권한이 부여됨 )   ")) {
				return;
		    }
			
			//const rowCount = gridDataProvider.getRowCount();
			//const rows = Array(rowCount).fill(0).map((v, i) => i)
			//gridView.onValidateColumn = onValidateColumn;
			//gridView.validateCells(rows);
			//gridView.onValidateColumn = null;
			//if (gridView.getInvalidCells() != null) {
			//	return;
			//}

			 RG.doSave({
				 action : "/portal/sys/dac/prc/saveUserRvwPrncYn.do" ,
				 endEvent : saveEndEvent,
				 dataProviderPram : gridDataProvider,
				 gridViewPram : gridView,
				 showEndMessage:true,
				 cud: ["U"]
			 });
		});

		/*저장 후 실행 function  */
		const saveEndEvent = function(e) {
			console.log("_____________________ result : " + JSON.stringify(e));
			searchAction();
		}

		/* 조회 */
		searchAction();
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
						<a href="javascript:void(0)" id="btnSearch">조회</a>
						<!-- <a href="javascript:void(0)" id="initBtn">초기화</a> -->
					</div>
				</div>
				<form id="srchFrm" name="srchFrm" method="post" action="#">
				<div class="search_wrap">
					<div class="item">
						<h4>이름</h4>
						<input type="text" id="txtUserNmFilter" value="" placeholder="심의자명 입력" title="검색 키워드">
					</div>
				</div>
				</form>
				<div class="btn_info">
					<p></p>
					<div class="s_btn">
						<a href="javascript:void(0)" id="saveBtn">저장</a>
					</div>
				</div>

				<div class="grid_area_wrap" id="gridView"></div>
			</div>
		</div>
	</div>
</div>
<!-- 사람 검색 팝업 -->
<div id="schPersonPop" class="kc_layer_popup">
	<div class="kc_popup_box person_sch">
		<input type="hidden" name="prtiId" id="prtiId" value="" />
		<a href="javascript:void(0)" class="btn kc_close"></a>
		<div class="title">
			<p>이름 검색</p>
		</div>
		<div class="popup_con">
			<div class="inst_deliber">
				<ul class="list">
					<li>
						<input type="text" id="userNm" name="userNm" class="ad_input" placeholder="이름" />
					</li>
				</ul>
				<div class="l_btn">
					<a href="#" onclick="schPopUpBtn();return false;" class="bc_blue">검색</a>
				</div>
				<table class="user_tb_l" style="display: none;" id="targetTbl">
					<colgroup>
						<col style="width:18%">
						<col style="width:auto">
						<col style="width:auto">
						<col style="width:auto">
					</colgroup>
					<tbody id="targetTbody">
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
