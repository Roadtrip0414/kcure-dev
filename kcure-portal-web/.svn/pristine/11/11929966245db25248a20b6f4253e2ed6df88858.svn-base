<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- inline -->
	<tiles:importAttribute name="navMenuList" ignore="false" />
	<c:set var="menuId" value="${navMenuList[0].menuId}" />
	<c:set var="menuNm" value="${navMenuList[0].menuNm}" />
	<c:set var="subMenuId" value="${navMenuList[1].menuId}" />

	<div class="sub_visual_wrap">
		<div class="<%= request.getParameter("className") %>">
			<ul>
				<li>${menuNm}</li>
			</ul>
		</div>
	</div>
	<div class="sub_nav_wrap">
		<tiles:importAttribute name = "gnbMenuList" ignore="false" />
		<c:forEach items="${gnbMenuList}" var="gnbMenu" varStatus="idx" >
			<c:if test="${gnbMenu.menuLvlVl eq 2 and gnbMenu.hghrMenuId eq menuId}">
				<a href="${gnbMenu.menuUriAddr}" class="<c:if test="${gnbMenu.menuId eq subMenuId}">on</c:if>">${gnbMenu.menuNm}</a>
			</c:if>
		</c:forEach>
	</div>
<!-- //inline -->