
<%
/* =================================================================
* @FileName : ViewClcInfComplete
* @date: 2023. 2. 22.
* @author : bhs
* @설명 : 데이터신청 > 제출완료
* =================================================================
* 수정일 작성자 내용
* -----------------------------------------------------------------------
* 2023. 2. 22. bhs 파일생성
* =================================================================
*/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>
<script type="text/javascript">

function fnGoMain(){
	location.href = "/";
}

$(".location_wrap").hide();
</script>

<div class="wrap">
		<div class="apply_finish_wrap">
			<div class="box">
				<img src="/images/apply_finish_icon.svg" alt="제출완료 이미지">
				<ul>
					<li>제출완료</li>
					<li>제출이 성공적으로 완료되었습니다</li>
					<li><a href="javascript:fnGoMain()" class="n_m_btn n_bc_b_line">메인으로 가기</a></li>
				</ul>
			</div>
		</div>
	</div>
