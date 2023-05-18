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
	
});


//2021.05.30, 정진오, 디지털원패스 로그인 추가
function fnOnepassLogin() {
		document.onepassForm.serviceType.value = 'LOGIN';
		document.onepassForm.target = '_top';
		document.onepassForm.action = '<c:url value="/portal/uat/uia/onepass/onepassLogin.do"/>';
		document.onepassForm.submit();
}

</script>

<form name="frmSignup" id="frmSignup" action="/portal/uat/uca/viewSignupStp1.do"  method="post"> 

<input type="hidden" name="userEntMedmCd" value="01"/>

<div class="wrap">
		<div class="login_wrap type_01">
			<h1>회원가입</h1>
			<div class="int">
				<ul class="list" id="info_userId">
					<li>이메일</li>
					<li>
						<input type="text" name="userId" id="userId">
					</li>
					<li class="error_txt">
					</li>
				</ul>
				<ul class="list" id="info_userPswd">
					<li>비밀번호</li>
					<li class="see_int">
						<input  type="password" name="userPswd" id="userPswd" >
						<a href="#" id="seePswd"></a>
					</li>
					<li class="error_txt"></li>
				</ul>
				<ul class="list" id="info_userPswdRe">
					<li>비밀번호 확인</li>
					<li class="see_int">
						<input  type="password" name="userPswdRe" id="userPswdRe" >
						<a href="#" id="seePswdRe"></a>
					</li>
					<li class="error_txt"></li>
				</ul>
			</div>
			<a href="#" onclick="fnNext()" class="login_btn">이메일 회원가입</a>
			<div class="social_login">
				<!-- <a href="#" onclick="javascript:fnOnepassLogin();" class="login_btn one">디지털 원패스로 시작하기</a> -->
				<a href="${ kakao_url }" class="login_btn kakao">카카오로 시작하기</a>
				<a href="${ naver_url }" class="login_btn naver">네이버로 시작하기</a>
			</div>
		</div>
	</div>
</form>

<form id="onepassForm" name="onepassForm" method="post">
	<input type="hidden" id="serviceType" name="serviceType"/>
</form>

<script type="text/javascript">
	let emailVal = "", pwVal = "", pwReVal = "", isEmailValid = false, isPwValid = false, isPwReValid = false
	
	const emailInputEl = document.querySelector('#info_userId input');
	const emailErrorMsgEl = document.querySelector('#info_userId .error_txt');
	
	const pwInputEl = document.querySelector('#info_userPswd input');
	const pwErrorMsgEl = document.querySelector('#info_userPswd .error_txt');
	
	const pwReInputEl = document.querySelector('#info_userPswdRe input');
	const pwReErrorMsgEl = document.querySelector('#info_userPswdRe .error_txt');

	//에러 메세지 객체
	const errMsg = {
	  id: { 
		input: "이메일 주소를 입력해주세요",
	    invalid: "이메일 형식이 맞지 않습니다.",
	    fail: "이미 사용 중인 이메일입니다."
	  },
	  pw: {
		  input: "비밀번호를 입력해주세요",
		  invalid: "8~16자 영문 대소문자, 숫자, 특수문자를 조합해 주세요",
	  },
	  pwRe: {
		input: "비밀번호를 확인해주세요",
	    fail: "비밀번호가 일치하지 않습니다"
	  }
	}

	//이메일 체크 ajax
	function fnCheckEmail(){
		let param = emailInputEl.value;
		
		$.ajax({
				type:"POST",
				url:"/portal/uat/uca/checkEmailDplct.do",
				data:{checkEmail : param},
				dataType:'json',
				success:function(returnData){
				let result = returnData.usedCnt;
				
				if(result > 0){
					emailErrorMsgEl.textContent = errMsg.id.fail;
					isEmailValid = false;
				}else{
					emailErrorMsgEl.textContent = "";
					isEmailValid = true;
				}
		      }
		});
	}
	
	//회원가입 유효성 검사1
	function fnValidate1(){		
		//이메일 유효성 검사
		emailInputEl.addEventListener('change', () => {
			 const emailRegExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i
			 emailVal = emailInputEl.value;
			 
			 if(emailVal !== ""){
				 if(emailRegExp.test(emailVal)){
					 isEmailValid = true;
					 emailErrorMsgEl.textContent = "";
				 }else{
					 isEmailValid = false;
					 emailErrorMsgEl.textContent = errMsg.id.invalid;
					 emailInputEl.focus();
					 return;
				 }
			 }else{
				 isEmailValid = false;
				 emailErrorMsgEl.textContent = "";
				 emailInputEl.focus();
				 return;
			 }

			 fnCheckEmail();			 
		});
		
		// 패스워드 유효성 검사
		pwInputEl.addEventListener('change', () => {
		  const pwRegExp = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\S])[A-Za-z\d\S]{8,16}$/;
		  pwVal = pwInputEl.value;
		  
		  if(pwVal !== ""){
			  if(pwRegExp.test(pwVal)) {
			    isPwValid = true;
			    pwErrorMsgEl.textContent = "";
			    
			    pwReVal = pwReInputEl.value;
			    
				if(pwReVal !== ""){
					 checkPwValid();
				}
			  } 
			  else {
				isPwValid = false;
			    pwErrorMsgEl.textContent = errMsg.pw.invalid;
			    pwInputEl.focus();
			    return;
			  }
		  }else{
			  isPwValid = false;
			  pwErrorMsgEl.textContent = "";
			  pwInputEl.focus();
			  return;
		  }
		 
		});

		// 패스워드 재입력 유효성 검사
		pwReInputEl.addEventListener('change', () => {
		  pwReVal = pwReInputEl.value;
		  
		  if(pwReVal !== ""){
			  checkPwValid();
		  }else{
			  isPwReValid = false;
			  pwReErrorMsgEl.textContent = "";
			  pwReInputEl.focus();
			  return;
		  }
		  
		});
	}
	
	//회원가입 유효성 검사2
	function fnValidate2(){		
		if(!isEmailValid){
			if(emailInputEl.value === ""){
				emailErrorMsgEl.textContent = errMsg.id.input;
				emailInputEl.focus();
				return false;
			}else{
				emailInputEl.focus();
				return false
			}
		}
		else if(!isPwValid){
			if(pwInputEl.value === ""){
				pwErrorMsgEl.textContent = errMsg.pw.input;
				pwInputEl.focus();
				return false;
			}else{
				pwInputEl.focus();
				return false
			}
		}
		else if(!isPwReValid){
			if(pwReInputEl.value === ""){
				pwReErrorMsgEl.textContent = errMsg.pwRe.input;
				pwReInputEl.focus();
				return false;
			}else{
				pwReInputEl.focus();
				return false
			}
		}

		return true;
	}

	// 비밀번호와 재입력 값 일치 여부
	function checkPwValid() {		  
		  if(pwReVal === "") { // 미입력
		     pwReErrorMsgEl.textContent = "";
		     pwReInputEl.focus();
		  }
		  else if(pwVal === pwReVal) { // 비밀번호 재입력 일치
			isPwReValid = true;
			 pwReErrorMsgEl.textContent = "";
		  }
		  else { // 비밀번호 재입력 불일치
			isPwReValid = false;
		  	pwReErrorMsgEl.textContent = errMsg.pwRe.fail;
		  	pwReInputEl.focus();
		  }
	}

	function fnNext(){
		if(fnValidate2()){
			$("#frmSignup").submit();
		}
	}
	
	fnValidate1();	

</script>
