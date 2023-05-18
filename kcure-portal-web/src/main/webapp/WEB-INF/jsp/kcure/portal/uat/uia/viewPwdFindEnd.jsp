<%
/* =================================================================
 * @FileName : viewPwdFindEnd.jsp
 * @date: 2023.02.01
 * @author : kyh
 * @설명 : 비밀번호 찾기 초기 화면
 * =================================================================
 * 수정일         작성자             내용     
 * -----------------------------------------------------------------------
 * 2023.02.01     kyh           파일생성
 * =================================================================
 */ 
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>

<script type="text/javascript">
$(document).ready(
	function() {
		<c:if test="${not empty fn:trim(actMessage) &&  actMessage ne ''}">
	    alert("<c:out value='${actMessage}'/>");
	    window.location.href = "/portal/uat/uia/pwd/viewPwdFind.do";
	    </c:if>
	}
);
</script>
<!-- container -->
	<div class="wrap">
		<div class="pass_lost_wrap">
			<div class="bg">
				<div class="info">
					<div class="title">
						<h1>K-cure 비밀번호 재설정 안내</h1>
						<p class="sub">고객님의 비밀번호 재설정을 위해 메일을 보내드렸습니다.<br>새로운 비밀번호를 사용하시려면 아래버튼을 클릭해주세요.<br>아래 링크는 메일 발송시간을 기준으로 30분 이후 만료됩니다.<br>감사합니다.</p>
					</div>
					<a href="/portal/uat/uia/pwd/token${pswdRsetTknId}.do" class="summit_btn">비밀번호 재설정하기</a>
				</div>
				<div class="inquiry">
					<span>본 메일은 발신전용 메일이오니 문의사항이 있으시면 </span><a href="javascript:void(0)">고객센터</a><span>를 이용해주시기 바랍니다.</span>
				</div>
			</div>
		</div>
	</div>
<!-- //container -->