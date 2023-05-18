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
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_scripts.jsp"%>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/uat/uia/login.css' />">

<script type="text/javascript">
$(document).ready(
		function() {
			
			<c:if test="${not empty fn:trim(loginMessage) &&  loginMessage ne ''}">
		    alert("<c:out value='${loginMessage}'/>");
		    </c:if>
		    
			//페이지 로딩시
			getid(document.loginForm);
		
		}
);

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
	if (document.loginForm.userId.value =="") {
        alert("<spring:message code="comUatUia.validate.idCheck" />"); <%-- 아이디를 입력하세요 --%>
    } else if (document.loginForm.loginPswd.value =="") {
        alert("<spring:message code="comUatUia.validate.passCheck" />"); <%-- 비밀번호를 입력하세요 --%>
    } else {
        document.loginForm.action="<c:url value='/portal/uat/uia/actionLogin.do'/>";
        document.loginForm.submit();
    }
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
</head>
<body>

<!-- 일반로그인 -->

<div class="login_form">
	<form name="loginForm" id="loginForm" action="<c:url value='/portal/uat/uia/actionLogin.do'/>" method="post">
	<input type="hidden" id="message" name="message" value="<c:out value='${message}'/>">
	<div class="login_input">
		<ul>
			<!-- 아이디 -->
			<li>
				<label for="userId"><spring:message code="comUatUia.loginForm.id"/></label>
				<input type="text" name="userId" id="userId" maxlength="20" title="<spring:message code="comUatUia.loginForm.id"/>" placeholder="<spring:message code="comUatUia.loginForm.id"/>">
			</li>
			<!-- 비밀번호 -->
			<li>
				<label for="loginPswd"><spring:message code="comUatUia.loginForm.pw"/></label>
				<input type="password" name="loginPswd" id="loginPswd" maxlength="20" title="<spring:message code="comUatUia.loginForm.pw"/>" placeholder="<spring:message code="comUatUia.loginForm.pw"/>">
			</li>
			<!-- 아이디 저장 -->
			<li class="chk">
				<input type="checkbox" name="checkId" class="check2" onclick="javascript:saveid(document.loginForm);" id="checkId"><spring:message code="comUatUia.loginForm.idSave"/>
			</li>
			<li>
				<input type="button" class="btn_login" value="<spring:message code="comUatUia.loginForm.login"/>" onclick="actionLogin()"> <!-- 로그인  -->
			</li>				
		</ul>
	</div>
	<input name="j_username" type="hidden"/>
	</form>

	<!-- 2021.05.30, 정진오, 디지털원패스 로그인 추가 -->
	<div style="border:2px solid #e6e6e6; margin-top:20px;">
		<form id="onepassForm" name="onepassForm" method="post">
		<input type="hidden" id="serviceType" name="serviceType"/>
		</form>
		<ul style="margin:10px 0px 10px;">
			<li style="text-align:center;">
				하나의 아이디로 간편하게
				<a href="#" onclick="javascript:fnOnepassLogin();"><img src="<c:url value='/images/egovframework/com/uat/uia/onepass.png'/>" alt="디지털원패스 로그인" title="디지털원패스 로그인"></a>
				
			</li>
		</ul>
		
		<ul style="margin:10px 0px 10px;">
			<li style="text-align:center;">
				<a href="${ kakao_url }"><img width="300" src="<c:url value='/images/egovframework/com/uat/uia/kakao-login.png'/>" alt="Kakao Login" /></a>
				<%-- <a href="#" onclick="javascript:alert('개발중');"><img width="300" src="<c:url value='/images/egovframework/com/uat/uia/kakao-login.png'/>" alt="Kakao Login" /></a> --%>
			</li>
		</ul>
		
		<ul style="margin:10px 0px 10px;">
			<li style="text-align:center;">
				<a href="${ naver_url }"><img width="300" src="<c:url value='/images/egovframework/com/uat/uia/naver-login.png'/>" alt="Naver Login" /></a>
			</li>
		</ul>
		
	</div>

</div>

<!-- 팝업 폼 -->
<%-- <form name="defaultForm" action ="" method="post" target="_blank">
<div style="visibility:hidden;display:none;">
<input name="iptSubmit3" type="submit" value="<spring:message code="comUatUia.loginForm.submit"/>" title="<spring:message code="comUatUia.loginForm.submit"/>">
</div>
</form> --%>
<!-- login영역 //-->

</body>
</html>
