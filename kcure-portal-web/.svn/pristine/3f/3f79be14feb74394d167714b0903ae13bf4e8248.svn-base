<%
/* =================================================================
 * @FileName : viewPwdFind.jsp
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
document.addEventListener('keydown', function(event) {
	if (event.keyCode === 13) {
		event.preventDefault();
		actionPwdChg();
	};
}, true);

function actionPwdChg() {
	if ($('#userId').val() =="") {
        alert('<spring:message code="comUatUia.idPw.validate.email" />'); <%-- 이메일주소를 입력하세요. --%>
    } else if (!fnChkEmail()) {
    	alert('<spring:message code="errors.email" arguments="'+$('#userId').val()+'" />');
    } else {
        $('#pwdForm').attr("action", "/portal/uat/uia/pwd/viewPwdFindChk.do");
        $('#pwdForm').submit();
    }
}

function fnChkEmail() {
	const emailRegExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	let	emailVal = $('#userId').val();
	
	if (emailRegExp.test(emailVal)) {
		return true;
	} else {
		return false;
	}
}
</script>
<!-- container -->
<form name="pwdForm" id="pwdForm" action="" method="post">
	<div class="wrap">
		<div class="pass_lost_wrap">
			<div class="info">
				<div class="title">
					<h1>비밀번호를 잊으셨나요?</h1>
					<p class="sub">계정에 연결된 이메일 주소를 입력하면<br>암호를 재설정할 수 있는 링크를 이메일로 보내드릴게요.</p>
				</div>
				<div class="panel_item">
					<div class="int">
						<ul>
							<li><input type="email" name="userId" id="userId" placeholder="이메일주소를 입력해주세요."></li>
						</ul>
						<!-- 기본 p태그 삭제 -->
						<c:if test="${not empty fn:trim(actMessage) &&  actMessage ne ''}">
						<p class="wrong">입력하신 이메일로 가입한 계정이 없어요. 입력한 정보를 확인해주세요.</p>
						</c:if>
					</div>
				</div>
				<a href="#" onclick="actionPwdChg()" class="summit_btn">재설정 링크 전송하기</a>
			</div>
		</div>
	</div>
</form>
<!-- //container -->