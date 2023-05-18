<%
/* =================================================================
 * @FileName  : file_name
 * @date: 2023. 1. 31.
 * @author : shpark
 * @설명 : Login 화면
 * =================================================================
 * 수정일         작성자             내용     
 * -----------------------------------------------------------------------
 * 2023. 1. 31.        개발자명           파일생성
 * =================================================================
 */ 
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>


<!-- 일반로그인 -->
<form name="loginForm" id="loginForm" action="<c:url value='/portal/uat/uia/actionLogin.do'/>" method="post">
	<input type="hidden" id="message" name="message" value="<c:out value='${message}'/>">
	<div class="wrap">
		<div class="login_wrap">
			<h1>로그인</h1>
			<div class="int">
				<!-- 수정 -->
				<ul class="list" id="info_userId">
					<li>이메일</li>
					<li>
						<input type="email"  name="userId" id="userId"  placeholder="아이디 (이메일)">
					</li>
					<li class="error_txt"></li>
				</ul>
				<ul class="list" id="info_userPswd">
					<li>비밀번호</li>
					<li class="see_int">
						<input type="password"  name="loginPswd" id="loginPswd" placeholder="비밀번호">
						<a href="#" id="seePswd"></a>
					</li>
					<li class="error_txt"></li>
				</ul>
				<!-- 수정 -->
				
			</div>
			<a href="/portal/uat/uia/pwd/viewPwdFind.do" class="pass_lost">비밀번호를 잊으셨나요?</a>
			<a href="#" onclick="actionLogin()" class="login_btn">로그인</a>
			<div class="join">
				<p>아직 K-CURE 회원이 아니신가요?</p>
				<a href="/portal/uat/uca/viewSignup.do">회원가입</a>
			</div>
			<div class="social_login">
				<!-- <a href="#" onclick="javascript:fnOnepassLogin();" class="login_btn one">디지털 원패스로 로그인</a> -->
				<a href="${ kakao_url }" class="login_btn kakao">카카오로 로그인</a>
				<a href="${ naver_url }" class="login_btn naver">네이버로 로그인 로그인</a>
				<!-- <a href="javascript:void(0)" class="login_btn medical">보건의료빅데이터플랫폼으로 로그인</a> -->
			</div>
		</div>
	</div>
	<input name="j_username" type="hidden"/>
</form>

<form id="onepassForm" name="onepassForm" method="post">
	<input type="hidden" id="serviceType" name="serviceType"/>
</form>

<!-- 팝업 폼 -->
<%-- <form name="defaultForm" action ="" method="post" target="_blank">
<div style="visibility:hidden;display:none;">
<input name="iptSubmit3" type="submit" value="<spring:message code="comUatUia.loginForm.submit"/>" title="<spring:message code="comUatUia.loginForm.submit"/>">
</div>
</form> --%>
<!-- login영역 //-->


<script type="text/javascript">

	let emailVal = "", pwVal = "", isEmailValid = false, isPwValid = false
	
	const emailInputEl = document.querySelector('#info_userId input');
	const emailErrorMsgEl = document.querySelector('#info_userId .error_txt');
	
	const pwInputEl = document.querySelector('#info_userPswd input');
	const pwErrorMsgEl = document.querySelector('#info_userPswd .error_txt');
	
	//에러 메세지 객체
	const errMsg = {
	  id: { 
		input: "<spring:message code="comUatUia.validate.idCheck" />",
	    invalid: "<spring:message code="comUatUia.idPw.validate.emailFormat" />"
	  },
	  pw: {
		  input: "<spring:message code="comUatUia.validate.passCheck" />",
	  }
	}
	
	$( document ).ready(function() {
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
				
			});
			
			pwInputEl.addEventListener('change', () => {
				  if(pwInputEl.value != "") {
				  	pwErrorMsgEl.textContent = "";
				    isPwValid = true;
				    return;
				  }else{
					pwErrorMsgEl.textContent = "";
					isPwValid = false;
					return;
				  } 				  
			});
			
			<c:if test="${not empty fn:trim(loginMessage) &&  loginMessage ne ''}">
		    alert("<c:out value='${loginMessage}'/>");
		    </c:if>
		    
			//페이지 로딩시
			//getid(document.loginForm);
	});
	
	function getid(form) {
		form.checkId.checked = ((form.id.value = getCookie("saveid")) != "");
	}
	
	function getCookie(Name) {
	    var search = Name + "=";
	    if (document.cookie.length > 0) { // 쿠키가 설정되어 있다면
	        offset = document.cookie.indexOf(search);
	        if (offset != -1) { // 쿠키가 존재하면
	            offset += search.length;
	            // set index of beginning of value
	            end = document.cookie.indexOf(";", offset);
	            // 쿠키 값의 마지막 위치 인덱스 번호 설정
	            if (end == -1)
	                end = document.cookie.length;
	            return unescape(document.cookie.substring(offset, end));
	        }
	    }
	    return "";
	}
	
	
	function saveid(form) {
	    var expdate = new Date();
	    // 기본적으로 30일동안 기억하게 함. 일수를 조절하려면 * 30에서 숫자를 조절하면 됨
	    if (form.checkId.checked)
	        expdate.setTime(expdate.getTime() + 1000 * 3600 * 24 * 30); // 30일
	    else
	        expdate.setTime(expdate.getTime() - 1); // 쿠키 삭제조건
	    setCookie("saveid", form.id.value, expdate);
	}
	
	function setCookie (name, value, expires) {
	    document.cookie = name + "=" + escape (value) + "; path=/; expires=" + expires.toGMTString();
	}
	
	
	function actionLogin() {
		if(fnValidate()){
			document.loginForm.action="<c:url value='/portal/uat/uia/actionLogin.do'/>";
		    document.loginForm.submit();
		}
	}
	
	function fnValidate(){
		if(!isEmailValid){
			if(emailInputEl.value === ""){
				emailErrorMsgEl.textContent = errMsg.id.input;
				emailInputEl.focus();
				return false;
			}else{
				emailInputEl.focus();
				return false;
			}
		}
		else if(!isPwValid){
			if(pwInputEl.value === ""){
				pwErrorMsgEl.textContent = errMsg.pw.input;
				pwInputEl.focus();
				return false;
			}else{
				pwInputEl.focus();
				return false;
			}
		}		

		return true;
	}
	
	//2021.05.30, 정진오, 디지털원패스 로그인 추가
	function fnOnepassLogin() {
		if ('${authType}' == 'session') {
			document.onepassForm.serviceType.value = 'LOGIN';
			document.onepassForm.target = '_top';
			document.onepassForm.action = '<c:url value="/portal/uat/uia/onepass/onepassLogin.do"/>';
			document.onepassForm.submit();
		} else {
			alert('디지털원패스는 Session 권한인증일때만 사용하실 수 있습니다.');
		}
	}
	
</script>

