<%
/* =================================================================
* @FileName : ViewPrtFaq.jsp
* @date: 2023. 3. 23.
* @author : hjjeon
* @설명 :
* =================================================================
* 수정일 작성자 내용
* -----------------------------------------------------------------------
* 2023. 3. 14. hjjeon 파일생성
* =================================================================
*/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>
<script type="text/javascript">
//목록 이동
function fnList(obj){
	//tab search
	$("input[name='searchKeyword1']").val(obj);
	$("#srchForm").attr("action", "/portal/bbs/prt/faq/viewPrtFaq.do").submit();
}

</script>

<div class="wrap">
<div class="sub_visual_wrap">
		<div class="notice">
			<ul>
				<li>참여기관 문의</li>
			</ul>
		</div>
	</div>
	<div class="sub_nav_wrap">
		<!-- class="on"시 색변경 및 보더 생김 -->
		<a href="/portal/bbs/prt/ntc/viewPrtNtc.do" class="">공지사항</a>
		<a href="/portal/bbs/prt/faq/viewPrtFaq.do" class="on">FAQ</a>
		<a href="/portal/bbs/prt/qna/viewPrtQna.do" class="">문의하기</a>
	</div>
	<div class="faq_wrap">
		<div class="con">
			<div class="sub_pag_title">
				<p>FAQ</p>
				<span>K-CURE 포털을 이용하는 참여기관이 자주 질문해주시는 내용을 모아 보다 편리하게 궁금증을 알아볼 수 있습니다.</span>
			</div>
			<div class="board_tab">
				<ul>
					<li><a href="javascript:void(0)" <c:if test="${empty searchVO.searchKeyword1}">class="on"</c:if> onclick="fnList('');">전체</a></li>
					<c:forEach var="list" items="${nttSeCdList}">
						<!-- class="on"일때 활성화 -->
						<li><a href="javascript:void(0)" onclick="fnList('<c:out value="${list.detlCd}"/>');" <c:if test="${searchVO.searchKeyword1 == list.detlCd}">class="on"</c:if> id="nttSe_${list.detlCd}"><c:out value="${list.detlCdNm}"/></a></li>
					</c:forEach>
				</ul>
			</div>
			<form id="srchForm" name="srchForm" method="post">
				<input type="hidden" name="searchKeyword1" />
				<div class="board_info">
					<p>전체 <c:out value="${resultCnt}"/>건</p>
				</div>
			</form>
			<div class="faq_list">
				<c:set var="size" value="${fn:length(resultList)}"/>
				<c:forEach var="list" items="${resultList}" varStatus="status" >
				    <div class="item">
				        <div class="que">
				            <ul>
				                <li><c:out value="${size - status.index}"/></li>
				                <li><c:out value="${list.nttSj}" escapeXml="false"/></li>
				            </ul>
				        </div>
				        <div class="answer">
				            <pre><p><c:out value="${list.nttCn}" escapeXml="false"/></p></pre>
				        </div>
				    </div>
			    </c:forEach>
			</div>
		</div>
	</div>
</div>