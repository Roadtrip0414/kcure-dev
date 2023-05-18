<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- subtop -->
	<div class="header_top">
		<!-- GNB 메뉴 목록 -->
		<tiles:importAttribute name = "gnbMenuList" ignore="true" />
		<!-- 미이페이지 메뉴 목록 -->
		<tiles:importAttribute name = "mypMenuList" ignore="true" />
		<!-- NAV 메뉴 목록 -->
		<tiles:importAttribute name = "navMenuList" ignore="true" />
		<div class="location_wrap">
			<a href="/">홈</a>
			<c:forEach items="${navMenuList}" var="navList" varStatus="rowInx" >
				<c:forEach items="${gnbMenuList}" var="list" varStatus="rowInx" >
					<c:if test="${list.menuId eq navList.menuId}">
						<c:choose>
							<c:when test="${empty list.menuUriAddr}"><a href="javascript:void(0)">${list.menuNm}</a></c:when>
							<c:otherwise><a href="${list.menuUriAddr}">${list.menuNm}</a></c:otherwise>
						</c:choose>
					</c:if>
				</c:forEach>
			</c:forEach>
			<c:forEach items="${navMenuList}" var="navList" varStatus="rowInx" >
				<c:forEach items="${mypMenuList}" var="list" varStatus="rowInx" >
					<c:if test="${list.menuId eq navList.menuId}">
						<c:choose>
							<c:when test="${empty list.menuUriAddr}"><a href="javascript:void(0)">${list.menuNm}</a></c:when>
							<c:otherwise><a href="${list.menuUriAddr}">${list.menuNm}</a></c:otherwise>
						</c:choose>
					</c:if>
				</c:forEach>
			</c:forEach>
		</div>
		
		<tiles:importAttribute name="nowMenuInfo" ignore="true" />
		<h1 class="title">${nowMenuInfo.menuNm}</h1>
	</div>
<!-- //subtop -->