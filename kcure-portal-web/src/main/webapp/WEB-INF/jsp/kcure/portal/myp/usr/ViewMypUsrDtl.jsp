<%
/* =================================================================
 * @FileName : ViewMypUsrDtl.jsp
 * @date: 2023.02.01
 * @author : kyh
 * @설명 : 마이페이지 회원정보조회 화면
 * =================================================================
 * 수정일         작성자             내용     
 * -----------------------------------------------------------------------
 * 2023.02.01     kyh           파일생성
 * =================================================================
 */ 
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>
<script type="text/javascript">
$(document).ready(function() {
	$("#prtiId").val("${usrInfo.prtiId}").trigger("change");
});

function actInfoChg(varInput){
	var inputValue = "";
	
	if (varInput == "prtiId") {
		inputValue = $("#" + varInput + " option:selected").val();
		
		if (inputValue == "") {
			alert("소속 기관을 선택해 주세요.");
			$("#" + varInput).focus();
			
			return;
		}
	} else if (varInput == "emailRcvAgrYn" || varInput == "smsRcvAgrYn") {
		inputValue = $("input[name='" + varInput + "']:checked").val();
	} else {
		inputValue = $("#" + varInput).val();
	}
	
	if (inputValue != "") {
		$.ajax({
	        type: "post",
	        url: "/portal/myp/usr/dtl/updateMypUsrDtlInfo.do",
	        data: {[varInput] : inputValue},
	        dataType: 'json',
	        success: function (data) {
	        	if (data.result == "success") {
	        		switch (varInput) {
		        		case "userMbphNo":
		        			alert('전화번호가 변경되었습니다.');
		        			$("#userMbphNoTxt").html(inputValue);
		        			break;
		        		case "prtiId":
		        			alert('소속기관이 변경되었습니다.');
		        			break;
		        		case "emailRcvAgrYn":
		        			alert('이메일 수신동의가 변경되었습니다.');
		        			break;
		        		case "smsRcvAgrYn":
		        			alert('SMS 수신동의가 변경되었습니다.');
		        			break;
		        		default:
		        			alert('<spring:message code="success.common.update" />');
	        		}
	        		
	        		if (varInput == "userMbphNo") $("#userMbphNoTxt").html(inputValue);
	        	}
	        },
	        error: function (request, status, error) {
	            //console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	            alert('<spring:message code="fail.request.msg" />');
	        }
	    });
	}
}

function goUsrPwdChg() {
	window.location.href = "/portal/myp/usr/dtl/viewMypUsrPwdChg.do";
}

function goUsrWth() {
	window.location.href = "/portal/myp/usr/wth/viewMypUsrWth.do";
}

//소속기관 선택 이벤트
function fnSelectParti(){
	let itemSelect = $("#prtiId option:selected").val();
	
	if(itemSelect == "M0016" || itemSelect == "M0017" || itemSelect == "M0018" || itemSelect == "M0019"){
		$("#partiTyp").text("공공기관");
	}else if(itemSelect == ""){
		$("#partiTyp").text("");
	}else{
		$("#partiTyp").text("참여기관");
	}
}

//휴대폰 인증
function fnCertify(){
	window.open('', 'popupChk', 'width=500, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
	const f = document.frmChk;
    f.action = "https://nice.checkplus.co.kr/CheckPlusSafeModel/checkplus.cb";
    f.target = "popupChk";
    f.submit();
}

function setChildInfo(val){
	$("#usedData").val(val);
}

function validProc(){
	setTimeout(function run() {
		var dataArray = $("#usedData").val().split(",");
		if(dataArray[0] == "Y"){
			//핸드폰 가입자는 inner alert 발생 (로그인 링크제공)
			//alert("info : " + dataArray[1]);
			if (dataArray[2] == "${usrInfo.userId}") {
				$("#userMbphNo").val(dataArray[1]);
				
				actInfoChg('userMbphNo');
			} else {
				alert("사용자의 개인인증정보가 아닙니다. 관리자에게 문의해 주세요.");
			}
		}else{
			alert("개인인증정보가 존재하지 않습니다. 휴대폰번호를 변경하실 수 없습니다.");
		}
	}, 500);
}
</script>

<form id="frmChk" name="frmChk" method="post">
	<input type="hidden" name="m" value="checkplusService">						<!-- 필수 데이타로, 누락하시면 안됩니다. -->
	<input type="hidden" name="EncodeData" value="<c:out value="${data.sEncData}"/>">		<!-- 위에서 업체정보를 암호화 한 데이타입니다. -->
</form>

<form id="infoFrm" name="infoFrm" method="post">
	<div class="wrap">
		<div class="sub_visual_wrap">
			<div class="member_info">
				<ul>
					<li>회원정보</li>
				</ul>
			</div>
		</div>
		<div class="member_info_wrap">
			<div class="con">
				<div class="enter">
					<div class="sm_title">
						<p>회원정보입력</p>
					</div>
					<table class="user_tb_l">
						<tbody>
							<tr>
								<th>성명</th>
								<td>${usrInfo.userNm}</td>
							</tr>
							<tr>
								<th>이메일</th>
								<td>${usrInfo.userId}</td>
							</tr>
							<tr>
								<th>전화번호</th>
								<td>
									<ul class="list">
										<li id="userMbphNoTxt">${usrInfo.userMbphNo != null ? usrInfo.userMbphNo.replaceAll("(.{3})(.*)(.{4})", "$1-$2-$3") : ''}</li>
										<input type="hidden" name="userMbphNo" id="userMbphNo" value="${usrInfo.userMbphNo}">
										<input type="hidden" id="usedData" value="">
										<li>
											<a href="javascript:fnCertify()" class="c_btn">변경</a>
										</li>
									</ul>
								</td>
							</tr>
							<tr>
								<th>비밀번호</th>
								<td>
									<ul class="list">
										<li>*******</li>
										<li>
											<a href="javascript:goUsrPwdChg()" class="c_btn">변경</a>
										</li>
									</ul>
								</td>
							</tr>
							<tr>
								<th>소속기관</th>
								<td>
									<ul class="list">
										<li>
											<select class="user_sel" name="prtiId" id="prtiId" onchange="javascript:fnSelectParti()" style="margin-right: 30px;">
												<option value="">기관유형</option>
												<c:forEach var="list" items="${prtiList}">
													<option value="${list.detlCd}">${list.detlCdNm}</option>
												</c:forEach>
											</select>
											<span id="partiTyp"></span>
										</li>
										<li>
											<a href="javascript:actInfoChg('prtiId')" class="c_btn">변경</a>
										</li>
									</ul>
								</td>
							</tr>
							<tr class="email">
								<th>이메일 수신동의</th>
								<td>
									<ul class="list">
										<li>
											<label class="n_radio_btn">
												<input type="radio" name="emailRcvAgrYn" value="Y" <c:if test="${usrInfo.emailRcvAgrYn eq 'Y'}">checked="checked"</c:if>>
												<span class="n_radio_mark"></span><span class="txt">동의</span>
											</label>
										</li>
										<li>
											<label class="n_radio_btn">
												<input type="radio" name="emailRcvAgrYn" value="N" <c:if test="${usrInfo.emailRcvAgrYn eq 'N'}">checked="checked"</c:if>>
												<span class="n_radio_mark"></span><span class="txt">동의안함</span>
											</label>
										</li>
										<li>
											<a href="javascript:actInfoChg('emailRcvAgrYn')" class="c_btn">변경</a>
										</li>
									</ul>
								</td>
							</tr>
							<tr class="sms">
								<th>SMS 수신동의</th>
								<td>
									<ul class="list">
										<li>
											<label class="n_radio_btn">
												<input type="radio" name="smsRcvAgrYn" value="Y" <c:if test="${usrInfo.smsRcvAgrYn eq 'Y'}">checked="checked"</c:if>>
												<span class="n_radio_mark"></span><span class="txt">동의</span>
											</label>
										</li>
										<li>
											<label class="n_radio_btn">
												<input type="radio" name="smsRcvAgrYn" value="N" <c:if test="${usrInfo.smsRcvAgrYn eq 'N'}">checked="checked"</c:if>>
												<span class="n_radio_mark"></span><span class="txt">동의안함</span>
											</label>
										</li>
										<li>
											<a href="javascript:actInfoChg('smsRcvAgrYn')" class="c_btn">변경</a>
										</li>
									</ul>
									<p class="txt">*수신 동의를 하지 않으면, 데이터 신청 과정 중 중요 알림이 안갈 수 있습니다.</p>
								</td>
							</tr>
							<tr>
								<th>탈퇴</th>
								<td>
									<a href="javascript:goUsrWth()" class="c_btn">탈퇴하기</a>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</form>