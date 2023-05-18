<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="kr">
<!-- 상단 공통 시작 -->
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=yes"><meta name="keywords" content="">
	<meta name="description" content="">
	<meta property="og:image" content="">
	<title>K-CURE ADMIN</title>
	<%@include file="/WEB-INF/jsp/kcure/portal/com/global_scripts.jsp"%>
	<script type="text/javascript">
		//amchart 라이센스 적용
		am5.addLicense('AM5C391616705');
		
		window.onpageshow = function(event) {
			if (event.persisted || (window.performance && window.performance.navigation.type == 2)) {
		    	if($("#loading_box.on").length){
		    		$("#loading_box").removeClass("on");
		    	} 
		    }
		}
	</script>
</head>

<tiles:importAttribute name="nowMenuInfo" ignore="true" />
<c:set var="layoutCssNm" value="" />
<c:choose>
	<c:when test="${nowMenuInfo.menuDmnSpcd eq '02'}"><c:set var="layoutCssNm" value="admin" /></c:when>
	<c:otherwise><c:set var="layoutCssNm" value="" /></c:otherwise>
</c:choose>
<body class="${layoutCssNm}">

	<tiles:insertAttribute name="header" />
	
	<tiles:insertAttribute name="subtop" />

	<!-- 상단 공통 끝 -->
	
	<tiles:insertAttribute name="content" />
	
	<tiles:insertAttribute name="footer" />
	
	<input type="hidden" name="current_menu_name_info" id="current_menu_name_info"  value="${nowMenuInfo.menuNm}">
</body>
</html>