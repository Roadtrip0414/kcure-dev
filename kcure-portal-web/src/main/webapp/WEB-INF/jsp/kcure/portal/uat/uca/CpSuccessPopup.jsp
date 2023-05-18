<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@include file="/WEB-INF/jsp/kcure/portal/com/global_scripts.jsp"%>

<html>
<head>
	<script language='javascript'>

		setTimeout(function run() {
			var dataArray = $("#isExistUsr").val() + "," + $("#usrMobile").val() + "," + $("#usrEmail").val() + "," + $("#usrSignupDt").val();
			opener.setChildInfo(dataArray);
			opener.validProc();
			
			window.close();
		}, 300);

	</script>
	
    <title>NICE평가정보 - CheckPlus 안심본인인증 테스트</title>
</head>
<body>
    <center>
    
    <input type="hidden" id="isExistUsr" value="<c:out value="${isExistUsr}"/>"/>
    <input type="hidden" id="userNm" value="<c:out value="${userInfo.userNm}"/>"/>
    <input type="hidden" id="usrMobile" value="<c:out value="${userInfo.mobile}"/>"/>
    <input type="hidden" id="usrEmail" value="<c:out value="${userInfo.userid}"/>"/>
    <input type="hidden" id="usrSignupDt" value="<c:out value="${userInfo.frstrgstdt}"/>"/>
    
    <p><p><p><p>
     ${resultMessage}<br>
    
    </center>
</body>
</html>