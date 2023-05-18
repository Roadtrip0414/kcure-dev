<%
/* =================================================================
 * @FileName : ViewMypUsrWth.jsp
 * @date: 2023.02.01
 * @author : kyh
 * @설명 : 마이페이지 회원탈퇴 화면
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
function goUsrDtl() {
	window.location.href = "/portal/myp/usr/dtl/viewMypUsrDtl.do";
}

function actUsrWth() {
	if (confirm("정말 탈퇴하시겠습니까?")) {
		var form = $("#infoFrm").serialize();
		
		$.ajax({
	        type: "post",
	        url: "/portal/myp/usr/wth/saveMypUsrWthChg.do",
	        data: form,
	        dataType: 'json',
	        success: function (data) {
	        	if (data.result == "success") {
	        		alert('탈퇴가 완료되었습니다.');
	        		
	        		window.location.href = "/portal/uat/uia/kcureLogOut.do";
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
				<div class="withdrawal">
					<div class="sub_pag_title">
						<p>회원 탈퇴</p>
						<span>회원 탈퇴시 K-CURE 플랫폼을 통해 이용했던 모든 데이터가 삭제됩니다. 반드시 아래 내용을 먼저 참고하시기 바랍니다.</span>
					</div>
					<div class="box">
						<ul>
							<li>&middot;</li>
							<li>회원 탈퇴시 회원 정보는 모두 삭제됩니다.
								<ul>
									<li>- 회원정보, 회원정보 변경이력은 탈퇴와 동시에 자동 삭제되며, 삭제된 데이터는 복구되지 않습니다.</li>
								</ul>
							</li>
						</ul>
						<ul>
							<li>&middot;</li>
							<li>회원 탈퇴시 데이터 제공신청은 자동 삭제되지 않으며 개인정보를 제외한 데이터 신청 이력은 통계 정보로 보관됩니다.</li>
						</ul>
						<ul>
							<li>&middot;</li>
							<li>회원 탈퇴시 기존에 등록한 게시물은 등록자 등의 개인정보는 자동 삭제되나 게시물은 그대로 남아 있습니다.
								<ul>
									<li>- 삭제를 원하는 게시물이 있는 경우 회원 탈퇴 전 삭제하시기 바랍니다.</li>
								</ul>
							</li>
						</ul>
					</div>
					<div class="btn_inn">
						<a href="javascript:goUsrDtl()" class="bc_b_line l_btn">취소하기</a>
						<a href="javascript:actUsrWth()" class="bc_blue l_btn">탈퇴하기</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>