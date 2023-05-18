<%
/* =================================================================
 * @FileName : ViewMypUsrChk.jsp
 * @date: 2023.02.01
 * @author : kyh
 * @설명 : 마이페이지 회원확인 화면
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
function actUsrChk(){
	if ($("#loginPswd").val() == "") {
		alert("비밀번호를 입력해 주세요.");
		$("#loginPswd").focus();
	} else {
		var form = $("#infoFrm").serialize();
		
		$.ajax({
	        type: "post",
	        url: "/portal/myp/usr/dtl/selectMypUsrDtlChk.do",
	        data: form,
	        dataType: 'json',
	        success: function (data) {
	        	if (data.result == "success") {
	        		window.location.href = "/portal/myp/usr/dtl/viewMypUsrDtl.do";
	        	} else {
	        		alert("비밀번호를 다시 확인해 주세요.");
	        		$("#loginPswd").val("");
	        		$("#loginPswd").focus();
	        	}
	        },
	        error: function (request, status, error) {
	            //console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	            alert('<spring:message code="fail.request.msg" />');
	        }
	    });
	}
}
</script>

<form id="infoFrm" name="infoFrm" method="post">
	<div class="wrap">
		<div class="sub_visual_wrap">
			<div class="member_info">
				<ul>
					<li>회원정보</li>
				</ul>
			</div>
		</div>
		<div class="member_info_wrap">
			<div class="con">
				<div class="change">
					<div class="sub_pag_title">
						<p>회원정보 수정</p>
						<span>안전한 회원정보 수정을 위해 비밀번호 입력 후 확인이 가능합니다.</span>
					</div>
					<div class="info">
						<ul>
							<li>이메일</li>
							<li>${loginVO.id}</li>
						</ul>
						<ul>
							<li>비밀번호</li>
							<li>
								<input type="password" name="loginPswd" id="loginPswd" class="user_int" placeholder="비밀번호를 입력하세요.">
							</li>
						</ul>
					</div>
					<a href="javascript:actUsrChk()" class="l_btn bc_blue">로그인</a>
				</div>
			</div>
		</div>
	</div>
</form>