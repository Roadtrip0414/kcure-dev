<%
/* =================================================================
 * @FileName : ViewMypRscInfNav.jsp
 * @date: 2023.02.01
 * @author : kyh
 * @설명 : 마이페이지 나의연구 상단메뉴 화면
 * =================================================================
 * 수정일         작성자             내용     
 * -----------------------------------------------------------------------
 * 2023.02.01     kyh           파일생성
 * =================================================================
 */ 
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>

		<div class="sub_visual_wrap">
			<div class="data_request">
				<ul>
					<li>나의연구</li>
				</ul>
			</div>
		</div>
		
		<div class="sub_nav_wrap">
			<!-- class="on"시 색변경 및 보더 생김 -->
			<a href="/portal/myp/rsc/inf/viewMypRscInfApl.do" class="<c:if test='${viewGbnChk eq "viewApl"}'>on</c:if>">신청(${rscInfNavCnt.aplCnt})</a>
			<a href="/portal/myp/rsc/inf/viewMypRscInfUse.do" class="<c:if test='${viewGbnChk eq "viewUse"}'>on</c:if>">활용(${rscInfNavCnt.useCnt})</a>
			<a href="/portal/myp/rsc/inf/viewMypRscInfIn.do" class="<c:if test='${viewGbnChk eq "viewIn"}'>on</c:if>">반입(${rscInfNavCnt.inCnt})</a>
			<a href="/portal/myp/rsc/inf/viewMypRscInfOut.do" class="<c:if test='${viewGbnChk eq "viewOut"}'>on</c:if>">반출(${rscInfNavCnt.outCnt})</a>
			<%-- <a href="/portal/myp/rsc/inf/viewMypRscInfExtn.do" class="<c:if test='${viewGbnChk eq "viewExtn"}'>on</c:if>">보관/연장(${rscInfNavCnt.extnCnt})</a> --%>
			<a href="javascript:void(0)" class="<c:if test='${viewGbnChk eq "viewExtn"}'>on</c:if>">보관/연장(${rscInfNavCnt.extnCnt})</a>
			<a href="/portal/myp/rsc/inf/viewMypRscInfEnd.do" class="<c:if test='${viewGbnChk eq "viewEnd"}'>on</c:if>">종료(${rscInfNavCnt.endCnt})</a>
		</div>