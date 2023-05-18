<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- header -->
	<header class="">
		<div class="top">
			<c:if test="${loginVO == null}">
				<a href="/portal/uat/uia/pub/viewLoginUsr.do">로그인</a>
			</c:if>
			<c:if test="${loginVO != null}">
				<a href="/portal/uat/uia/kcureLogOut.do">로그아웃</a><!-- 로그아웃 -->
			</c:if>
			<!-- <a href="javascript:void(0)" class="all_menu">전체메뉴</a> -->
			<div class="body_size">
				<p>글자크기</p>
				<a href="javascript:void(0)" class="up"></a>
				<a href="javascript:void(0)" class="down"></a>
			</div>
		</div>
		<div class="middle">
			<div class="left">
				<a href="/" class="logo"></a>
			</div>
			<nav>
				<ul>
					<!-- GNB 메뉴 목록 -->
					<tiles:importAttribute name = "gnbMenuList" ignore="true" />
					<!-- <li><a href="/portal/uat/uia/kcureMnuModChg.do?menuMod=01&returnUrl=/portal/bbs/qna/viewQna.do">test</a></li> -->
					<!-- NAV 메뉴 목록 -->
					<tiles:importAttribute name = "navMenuList" ignore="true" />
					<c:set var="nowFstDepth" value="" />
					<c:forEach items="${navMenuList}" var="navList" varStatus="rowInx" >
						<c:if test="${rowInx.index eq 0}"><c:set var="nowFstDepth" value="${navList.menuId}" /></c:if>	<!-- GNB 1뎁스 선택 변수 -->
					</c:forEach>

					<c:forEach items="${gnbMenuList}" var="list" varStatus="rowInx" >
						<c:if test="${list.menuLvlVl eq 1}">
							<li class="gnb">
								<!-- class="on"시 색변경 및 보더 -->
								<c:choose>
									<c:when test="${empty list.menuUriAddr}"><a href="javascript:void(0)" class="<c:if test="${nowFstDepth eq list.menuId}">on</c:if>">${list.menuNm}</a></c:when>
									<c:otherwise><a href="${list.menuUriAddr}" class="<c:if test="${nowFstDepth eq list.menuId}">on</c:if>">${list.menuNm}</a></c:otherwise>
								</c:choose>
								<c:if test="${list.childMenuId ne null}">
									<!-- class="active"시 나타남 -->
									<div class="lnb_wrap ">
										<div class="item">
											<c:forEach items="${gnbMenuList}" var="list2" begin="${rowInx.index+1}" varStatus="rowInx2" >
												<c:if test="${list2.menuLvlVl eq 2 and list2.hghrMenuId eq list.menuId}">
													<!-- 서브 2뎁스 가 ul로 돌아감 -->
													<ul>
														<li>
															<c:choose>
																<c:when test="${empty list2.menuUriAddr}"><a href="javascript:void(0)" class="">${list2.menuNm}</a></c:when>
																<c:otherwise><a href="${list2.menuUriAddr}" class="">${list2.menuNm}</a></c:otherwise>
															</c:choose>
															<c:if test="${list2.childMenuId ne null}">
																<c:forEach items="${gnbMenuList}" var="list3" begin="${rowInx2.index+1}" varStatus="rowInx3" >
																	<c:if test="${list3.menuLvlVl eq 3 and list3.hghrMenuId eq list2.menuId}">
																		<c:choose>
																			<c:when test="${empty list3.menuUriAddr}"><a href="javascript:void(0)" class="">${list3.menuNm}</a></c:when>
																			<c:otherwise><a href="${list3.menuUriAddr}" class="">${list3.menuNm}</a></c:otherwise>
																		</c:choose>
																	</c:if>
																</c:forEach>
															</c:if>
														</li>
													</ul>
												</c:if>
											</c:forEach>
										</div>
									</div>
								</c:if>
							</li>
						</c:if>
					</c:forEach>
					<li class="gnb">
						<ul>
							<li class="search">
								<input id="inputSearch" type="text">
								<a href="javascript:void(0)" class="btn" onclick='doSearchKeyword("inputSearch")'>
									<img src="/images/m_search_icon.svg" alt="검색버튼">
								</a>
							</li>
						</ul>
					</li>
				</ul>
			</nav>
			<div class="right">
				<!-- 로그인전 div class="user"을 날림 | 부모 div class="right"는 있어야함 -->
				<c:if test="${loginVO != null}">
					<!-- 알림 카운트 -->
					<tiles:importAttribute name = "mypSvcAlmCnt" ignore="true" />

					<div class="user">
						<p class="name">${loginVO.prtiNm} ${loginVO.name}</p>
						<!--
						<div class="mark">
							<c:choose>
								<c:when test="${loginVO.userStcd eq '03'}"><p>승인<br>연구</p></c:when>
								<c:otherwise><p>미승인</p></c:otherwise>
							</c:choose>
							<c:if test="${mypSvcAlmCnt gt 0}">
								<span class="count">${mypSvcAlmCnt}</span>
							</c:if>
						</div>
						 -->
						<div class="drop">
							<div class="item">
								<!-- 미이페이지 메뉴 목록 -->
								<tiles:importAttribute name = "mypMenuList" ignore="true" />
								<ul>
									<c:forEach items="${mypMenuList}" var="list" varStatus="rowInx" >
										<c:if test="${list.menuLvlVl gt 1}">
											<c:choose>
												<c:when test="${empty list.menuUriAddr}"><li><a href="javascript:void(0)">${list.menuNm}</a></li></c:when>
												<c:otherwise>
													<!-- class="alarm" 알림이 있을시 클래스 추가 -->
													<c:choose>
														<c:when test="${mypSvcAlmCnt gt 0 && list.menuId eq '6104'}"><li><a href="${list.menuUriAddr}" class="alarm">${list.menuNm}<span class="count">${mypSvcAlmCnt}</span></a></li></c:when>
														<c:otherwise><li><a href="${list.menuUriAddr}">${list.menuNm}</a></li></c:otherwise>
													</c:choose>
												</c:otherwise>
											</c:choose>
										</c:if>
									</c:forEach>
								</ul>
								<ul>
									<c:if test="${loginVO.admAuthPossYn eq 'Y'}">
										<c:choose>
											<c:when test="${loginVO.usrMnuMode eq '01'}"><li><a href="/portal/uat/uia/kcureMnuModChg.do">관리자모드로 전환</a></li></c:when>
											<c:otherwise><li><a href="/portal/uat/uia/kcureMnuModChg.do">사용자모드로 전환</a></li></c:otherwise>
										</c:choose>
									</c:if>

									<li><a href="/portal/uat/uia/kcureLogOut.do">로그아웃</a></li>
								</ul>
							</div>
						</div>
					</div>
				</c:if>
			</div>
		</div>
	</header>
	<div class="bk_hide"></div>

	<form id="searchFrm" name="searchFrm" method="post" action="/portal/cmn/iim/search.do">
		<input id="searchKeyword" type="hidden" name="searchKeyword" value="${searchKeyword.searchKeyword}"/>
	</form>

	<script>

		//
		function doSearchKeyword(elemId)
		{
			let elemInputSearch = document.getElementById(elemId);
			alert("검색어 : " + elemInputSearch.value);
			$("#searchKeyword").val(elemInputSearch.value);
			$("#searchFrm").submit();
		}

		$("#inputSearch").keydown(function (event) {
			if (event.keyCode === 13) {
				event.preventDefault();
				let elemInputSearch = document.getElementById("inputSearch");
				$("#searchKeyword").val(elemInputSearch.value);
				$("#searchElement").val("header");
				$("#searchFrm").submit();
			}
		});

		//
		function doSearchShortcut(keyword){
			console.log(keyword);
			alert("검색어 : " + keyword);
			$("#searchKeyword").val(keyword);
			$("#searchFrm").submit();
		}

	</script>

<!-- //header -->

<!-- gony -->
