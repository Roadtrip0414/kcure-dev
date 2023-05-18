<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>
<!-- header -->
<header id="header">
	<div class="header-wrap">
		<div class="header-inbox">
			<h1 class="logo">
				<a href="/" title="메인페이지로 이동"><span class="blind">K-CURE
						운영관리 포털</span></a>
			</h1>
			<!-- <ul class="top-link01">
				<li><a href="/EgovContent.do">로그인</a></li>
				<li><a href="/uss/umt/EgovStplatCnfirmMber.do">회원가입</a></li>
			</ul> -->
			<c:if test="${loginVO == null}">
			<ul class="top-link01">
				<li><a href="/portal/uat/uia/pub/viewLoginUsr.do">로그인</a></li>
			</ul>
			</c:if>
			<c:if test="${loginVO != null}">
			<ul class="top-link01">
				<li><a class="btn02" href="/portal/uat/uia/kcureLogOut.do">로그아웃</a><!-- 로그아웃 --></li>
				<c:if test="${loginVO.admAuthPossYn eq 'Y'}">
					<c:choose>
						<c:when test="${loginVO.usrMnuMode eq '01'}"><li><a class="btn02" href="/portal/uat/uia/kcureMnuModChg.do">관리자전환</a></li></c:when>
						<c:otherwise><li><a class="btn02" href="/portal/uat/uia/kcureMnuModChg.do">사용자전환</a></li></c:otherwise>
					</c:choose>
				</c:if>
			</ul>
		    </c:if>
			
			<div class="top-link02">
				<div class="sccontrol-box">
					<span>화면크기</span>
					<button type="button" class="zoom-plus">
						<span class="blind">화면확대</span>
					</button>
					<button type="button" class="zoom-minus">
						<span class="blind">화면축소</span>
					</button>
				</div>
				<!-- <button type="button" class="btn-searchopen">
					<span class="blind">통합검색 열기</span>
				</button>
				<button type="button" class="btn-allmenuopen">
					<span class="bar"></span> <span class="bar num02"></span> <span
						class="bar"></span> <span class="blind">전체메뉴 열기</span>
				</button> -->
			</div>
		</div>
		<!-- gnb -->
		<div id="gnb-bg"></div>
		<nav id="gnb">
			<ul class="gnb">
				<tiles:importAttribute name = "gnbMenuList" ignore="true" />
				<c:forEach items="${gnbMenuList}" var="list" varStatus="rowInx" >
					<c:if test="${list.menuLvlVl eq 1}">
						<li class="li-num0${rowInx.index+1}">
							<span class="a-depth01">
							<c:choose>
								<c:when test="${empty list.menuUriAddr}"><a href="javascript:void(0)">${list.menuNm}</a></c:when>
								<c:otherwise><a href="${list.menuUriAddr}">${list.menuNm}</a></c:otherwise>
							</c:choose>
							</span>
							<c:if test="${list.childMenuId ne null}">
								<div class="submenu-wrap">
									<ul class="munu-depth01">
										<c:forEach items="${gnbMenuList}" var="list2" begin="${rowInx.index+1}" varStatus="rowInx2" >
											<c:if test="${list2.menuLvlVl eq 2 and list2.hghrMenuId eq list.menuId}">
												<c:choose>
													<c:when test="${empty list2.menuUriAddr}"><li <c:if test='${list2.childMenuId ne null}'>class="yesdepth"</c:if>><a href="javascript:void(0)">${list2.menuNm}</a></c:when>
													<c:otherwise><li <c:if test='${list2.childMenuId ne null}'>class="yesdepth"</c:if>><a href="${list2.menuUriAddr}">${list2.menuNm}</a></c:otherwise>
												</c:choose>
													<c:if test="${list2.childMenuId ne null}">
														<div class="submenu-wrap02">
															<ul class="munu-depth02">
																<c:forEach items="${gnbMenuList}" var="list3" begin="${rowInx2.index+1}" varStatus="rowInx3" >
																	<c:if test="${list3.menuLvlVl eq 3 and list3.hghrMenuId eq list2.menuId}">
																		<c:choose>
																			<c:when test="${empty list3.menuUriAddr}"><li><a href="javascript:void(0)">${list3.menuNm}</a></li></c:when>
																			<c:otherwise><li><a href="${list3.menuUriAddr}">${list3.menuNm}</a></li></c:otherwise>
																		</c:choose>
																	</c:if>
																</c:forEach>
															</ul>
														</div>
													</c:if>
												</li>
											</c:if>
										</c:forEach>
									</ul>
								</div>
							</c:if>
						</li>
					</c:if>
				</c:forEach>
			</ul>
		</nav>
		<!-- //gnb -->
	</div>
</header>
<!-- //header -->
