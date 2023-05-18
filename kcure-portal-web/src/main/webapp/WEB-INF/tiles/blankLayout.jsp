<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
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
</head>
<body class="admin of_hi">

	<tiles:insertAttribute name="content" />
	
</body>
</html>