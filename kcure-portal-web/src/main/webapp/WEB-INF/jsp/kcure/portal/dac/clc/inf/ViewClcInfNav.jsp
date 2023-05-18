
<%
/* =================================================================
* @FileName : ViewClcInfNav
* @date: 2023. 4. 6.
* @author : parkgu
* @설명 : 데이터신청 > 네비게이션
* =================================================================
* 수정일 작성자 내용
* -----------------------------------------------------------------------
* 2023. 4. 6. parkgu 파일생성
* =================================================================
*/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="n_data_flow_wrap">
	<ul class="on">
		<li class="icon"></li>
		<li>01.약관동의</li>
	</ul>
	<ul class="" data-step="01">
		<li class="icon"></li>
		<li>02.서류작성 및<br>가상화환경 선택</li>
	</ul>
	<ul class="" data-step="02">
		<li class="icon"></li>
		<li>03.연구정보</li>
	</ul>
	<ul class="" data-step="03">
		<li class="icon"></li>
		<li>04.연구자정보</li>
	</ul>
	<ul class="" data-step="04">
		<li class="icon"></li>
		<li>05.데이터셋</li>
	</ul>
	<ul class="" data-step="05">
		<li class="icon"></li>
		<li>06.요청정보보기</li>
	</ul>
	<ul class="" data-step="06">
		<li class="icon"></li>
		<li>07.제출자료</li>
	</ul>
</div>
<form id="frmHistoryView" method="post">
	<input type="hidden"  name="dataAplcNo"  value="${naviDataAplcNo}"/>
</form>

<script type="text/javascript">
const stepCd = "${naviStepCd}";

const steps = [ <c:forEach items="${naviUrlsByStepCd}" var="item">"${item.key}", </c:forEach>];

const urlsByStepCd = {
	<c:forEach items="${naviUrlsByStepCd}" var="item">"${item.key}": "${item.value}",
	</c:forEach>
};

const stepCdOfPage = Object.entries(urlsByStepCd).find(([ _, url ]) => url === document.location.pathname)[0]

fnSetByStepCd(stepCd, stepCdOfPage);

function fnSetByStepCd(stepCd, stepCdOfPage) {
	$(".n_data_flow_wrap").removeClass("on");
	for (const step of steps) {
		const elem = $(".n_data_flow_wrap > [data-step='" + step + "']");
		if (step <= stepCd) {
			elem.addClass("on");
			if (step != stepCdOfPage) {
				elem.css("cursor", "pointer");
				elem.attr("onclick", "fnMoveStep('" + step + "')");
			} else {
				elem.find("li").css("color", "blue");
			}
		}
	}
}

function fnMoveStep(step){
	const url = urlsByStepCd[step];
	$("#frmHistoryView").attr('action', url).submit();
}
</script>