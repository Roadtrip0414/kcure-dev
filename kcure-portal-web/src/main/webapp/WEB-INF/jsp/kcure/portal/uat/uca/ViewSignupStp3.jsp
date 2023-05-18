<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@include file="/WEB-INF/jsp/kcure/portal/com/global_scripts.jsp"%>

<script type="text/javascript">

	$( document ).ready(function() {
		 
		$("#seePswd").on("click", function() {
			$('#seePswd').toggleClass('on');
			if( $('#seePswd').hasClass('on') == true ){
			    $("#userPswd").attr("type", "text");
			} else {
			    $("#userPswd").attr("type", "password");
			}
		});
		
		$("#seePswdRe").on("click", function() {
			$('#seePswdRe').toggleClass('on');
			if( $('#seePswdRe').hasClass('on') == true ){
			    $("#userPswdRe").attr("type", "text");
			} else {
			    $("#userPswdRe").attr("type", "password");
			}
		}); 
		
		formatPhoneNumber();
	});
	
	function goHome(){
		location.href="/portal/uat/uca/viewSignup.do";
	}

	function formatPhoneNumber() {
		var userMbphNo = "${data.userMbphNo}";
		var formattedMbphNo = "";

		if (userMbphNo.length === 10) {
	    	formattedMbphNo = userMbphNo.slice(0, 3) + '-' + userMbphNo.slice(3, 6) + '-' + userMbphNo.slice(6);
		} else if (userMbphNo.length === 11) {
	    	 formattedMbphNo = userMbphNo.slice(0, 3) + '-' + userMbphNo.slice(3, 7) + '-' + userMbphNo.slice(7);
	    } else {
	         formattedMbphNo = userMbphNo; 
	    }
		$("#userMbphNo").val(formattedMbphNo);
	 }

</script>

<form name="frmSignup4" id="frmSignup4" action="/portal/uat/uca/viewSignupStp4.do" method="post"> 

<div class="wrap">
        <div class="join_wrap">
            <div class="con">
                <h1>회원가입</h1>
                <div class="progress">
                    <ul>
                        <!-- li에 class on 추가 시 색 변경 -->
                        <li class="on">
                            <p>STEP 01</p>
                            <h2>약관동의</h2>
                        </li>
                        <li class="on">
                            <p>STEP 02</p>
                            <h2>휴대폰 본인인증</h2>
                        </li>
                        <li class="on">
                            <p>STEP 03</p>
                            <h2>회원정보 입력</h2>
                        </li>
                        <li>
                            <p>STEP 04</p>
                            <h2>회원가입 완료</h2>
                        </li>
                    </ul>
                </div>
                <div class="sub_title type_01">
                    <h3>회원정보 입력</h3>
                    <p>기본 정보 * 표시는 필수 입력사항입니다.</p>
                </div>
                <div class="mem_info">
					<table class="user_tb_l">
						<colgroup>
							<col width="16%">
							<col width="auto">
						</colgroup>
						<tbody>
							<tr>
								<th>성명</th>
								<td><input type="text" class="user_int" name="userNm" readonly value='<c:out value="${data.userNm}"/>'/></td>	
							</tr>
							<tr>
								<th>생년월일</th>
								<td><input type="number" class="user_int" name="userBirthDt" readonly value='<c:out value="${data.userBirthDt}"/>'/></td>
							</tr>
							<tr>
								<th>이메일</th>
								<td><input type="text" class="user_int" name="userId" readonly value='<c:out value="${data.userId}"/>'/></td>
							</tr>
							<tr>
								<th>전화번호</th>
								<td><input type="text" class="user_int" name="userMbphNo"  id="userMbphNo" readonly value=""/></td>
							</tr>
							<tr>
								<th>소속기관</th>
								<td>
									<select class="user_sel" name="prtiId" id="prtiId" onchange="fnSelectParti()" style="width: 50%;margin-right: 30px;">
                                        <option value="">기관유형</option>
                                        <c:forEach var="list" items="${prtiList}">
						                    <option value="${list.detlCd}">${list.detlCdNm}</option>
						                </c:forEach>
                                    </select>
                                    <span id="partiTyp"></span><div id="errorPrti"><div name="textContent"></div></div>
								</td>
							</tr>
							<tr class="pw">
								<th>비밀번호</th>
								<td>
									<div class="item" id="extPwdSetDiv">
										 <c:choose>
									         <c:when test = "${data.userEntMedmCd eq '01'}">
									            <p>비밀번호 입력</p>
									         </c:when>									         
									         <c:otherwise>
									            <p>미설정</p>
									            <a href="#" onclick="fnPopPwd()" class="m_btn bc_d_gray">외부 연동 비밀번호 설정</a>
									         </c:otherwise>
									      </c:choose>
									</div>
									<c:if test = "${data.userEntMedmCd ne '01'}">
										<p class="txt" id="pwdErrTxt"></p>
										<p class="txt">* 카카오톡, 네이버, 디지털 원패스로 가입하신 분들은 VDI와 같은 외부 프로그램 연동에 필요한 비밀번호를 설정해야 합니다.</p>
									</c:if>									
								</td>
							</tr>
							<tr class="email">
								<th>이메일 수신동의</th>
								<td>
									<div class="radio_inn">
										<label class="n_radio_btn">
											<input type="radio" name="emailRcvAgrYn"  value="Y">
											<span class="n_radio_mark"></span><span class="txt">동의</span>
										</label>
										<label class="n_radio_btn">
											<input type="radio" name="emailRcvAgrYn"  value="N">
											<span class="n_radio_mark"></span><span class="txt">동의안함</span>
										</label>
									</div>
								</td>
							</tr>
							<tr>
								<th>SMS 수신동의</th>
								<td>
									<div class="radio_inn">
										<label class="n_radio_btn">
											<input type="radio" name="smsRcvAgrYn"  value="Y">
											<span class="n_radio_mark"></span><span class="txt">동의</span>
										</label>
										<label class="n_radio_btn">
											<input type="radio" name="smsRcvAgrYn"  value="N">
											<span class="n_radio_mark"></span><span class="txt">동의안함</span>
										</label>
									</div>
									<p class="txt">* 수신동의를 하지 않으면, 데이터 신청 과정 중 중요알림이 안갈 수 있습니다.</p>
								</td>
							</tr>
						</tbody>
					</table>
                </div>
                <div class="l_btn">
					<a href="#" onclick="goHome()" class="bc_b_line">취소하기</a>
					<a href="#" onclick="fnNext()" class="bc_blue">가입하기</a>
                </div>
            </div>
        </div>
	</div>
	
	<div class="kc_layer_popup">
		<div class="kc_popup_box connect_pw">
			<a href="javascript:void(0)" class="kc_close btn"></a>
			<div class="title">
				<p>외부 연동 비밀번호 설정</p>
			</div>
			<div class="popup_con">
				<ul class="list">
					<li>이메일</li>
					<li>
						<input type="text" class="user_int" value='<c:out value="${data.userId}"/>' disabled>
					</li>
				</ul>
				<ul class="list" id="info_userPswd">
					<li>비밀번호</li>
					<li class="see_int">
						<input type="password" class="user_int" name="userPswd" id="userPswd" >
						<a href="#" id="seePswd"></a>
					</li>
					<li class="error_txt"></li>
				</ul>
				<ul class="list" id="info_userPswdRe">
					<li>비밀번호 확인</li>
					<li class="see_int">
						<input type="password" class="user_int" name="userPswdRe" id="userPswdRe">
						<a href="#" id="seePswdRe"></a>
					</li>
					<li class="error_txt"></li>
				</ul>
			</div>
			<div class="l_btn">
				<a href="#" onclick="fnCompltePwd()" class="bc_blue kc_close">확인</a>
			</div>
		</div>
</div>
</form>



<script language='javascript'>
	
	let pwVal = "", pwReVal = "", isPwValid = false, isPwReValid = false
	let setPwdYn = "N"
	
	const partiErrorMsgEl = document.querySelector('#errorPrti');
	const pwInputEl = document.querySelector('#info_userPswd input');
	const pwErrorMsgEl = document.querySelector('#info_userPswd .error_txt');
	const pwReInputEl = document.querySelector('#info_userPswdRe input');
	const pwReErrorMsgEl = document.querySelector('#info_userPswdRe .error_txt');
	
	//에러 메세지 객체
	const errMsg = {
	  pw: {
		  input: "비밀번호를 입력해주세요",
		  invalid: "8~16자 영문 대소문자, 숫자, 특수문자를 조합해 주세요",
	  },
	  pwRe: {
		input: "비밀번호를 확인해주세요",
	    fail: "비밀번호가 일치하지 않습니다"
	  }
	}

	$( document ).ready(function() {
		// 패스워드 유효성 검사
		pwInputEl.addEventListener('change', () => {
		  //const pwRegExp = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,16}$/i
		  const pwRegExp = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\S])[A-Za-z\d\S]{8,16}$/;
		  pwVal = pwInputEl.value;
		  if(pwRegExp.test(pwVal)) {
		    isPwValid = true;
		    pwErrorMsgEl.textContent = "";
		  } 
		  else {
		    isPwValid = false;
		    pwErrorMsgEl.textContent = errMsg.pw.invalid;
		  }
		  
		  checkPwValid();
		});
	
		// 패스워드 재입력 유효성 검사
		pwReInputEl.addEventListener('change', () => {
		  pwReVal = pwReInputEl.value;
		  checkPwValid();
		});
	});
			
	function checkPwValid() {		  
		  if(pwReVal === "") { // 미입력
		     pwReErrorMsgEl.textContent = "";
		  }
		  else if(pwVal === pwReVal) { // 비밀번호 재입력 일치
			isPwReValid = true;
			pwReErrorMsgEl.textContent = "";
		  }
		  else { // 비밀번호 재입력 불일치
			isPwReValid = false;
		  	pwReErrorMsgEl.textContent = errMsg.pwRe.fail;
		  }
	}	

	function fnNext(){
		if(fnValidate()){
			$("#frmSignup4").submit();
		}
	}
	
	//소속기관 선택 이벤트
	function fnSelectParti(){
		partiErrorMsgEl.textContent = "";			
		let itemSelect = $("#prtiId option:selected").val();
		
		if(itemSelect == "M0016" || itemSelect == "M0017" || itemSelect == "M0018" || itemSelect == "M0019"){
			$("#partiTyp").text("공공기관");
		}else if(itemSelect == ""){
			$("#partiTyp").text("");
		}else{
			$("#partiTyp").text("참여기관");
		}
	}

	/*
	 * 외부연동 비밀번호 설정팝업 호출
	*/
	function fnValidate(){
		var selVar = $("#prtiId option:selected").val();
		
		if(selVar === ""){
			partiErrorMsgEl.style.color = "red";
			partiErrorMsgEl.textContent = "소속기관을 선택해 주세요";
			return false;
		}
		
		if('${data.userEntMedmCd}' != "01"){
			if(setPwdYn != "Y"){
				$("#pwdErrTxt").css("color", "red");
				$("#pwdErrTxt").text("외부연동 비밀번호를 설정해주세요");
				return false;
			}
		}
		
		return true;
	}
	
	/*
	 * 외부연동 비밀번호 설정완료
	*/
	function fnCompltePwd(){
		if(isPwValid == true && isPwReValid == true){
			$("#extPwdSetDiv").find('p').text("설정");
			$("#pwdErrTxt").text("");
			setPwdYn = "Y";			
		}else{
			$("#extPwdSetDiv").find('p').text("미설정");
			setPwdYn = "N";		
		}
	}
	
	/*
	 * 외부연동 비밀번호 설정팝업 호출
	*/
	function fnPopPwd(){
		$(".kc_layer_popup").addClass("on");
	}
		
</script>
