<%
/* =================================================================
* @FileName : ViewClcInfTermAgree
* @date: 2023. 2. 20.
* @author : hjjeon
* @설명 : 약관 동의
* =================================================================
* 수정일 작성자 내용
* -----------------------------------------------------------------------
* 2023. 2. 20. hjjeon 파일생성
* =================================================================
*/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/kcure/portal/com/global_import.jsp"%>
<script type="text/javascript">
$(document).ready(function() {	
	 $("#allChk").click(function() {
	    var isChecked = $(this).prop("checked");
	    $(".agreeCheck").prop("checked", isChecked);
	  });
	  $(".agreeCheck").click(function() {
	    var isAllChecked = $(".agreeCheck:checked").length === $(".agreeCheck").length;
	    $("#allChk").prop("checked", isAllChecked);
	  });
});

function fnAgree(){
	var agreeAt = true;

	if(!$("#chk01").is(":checked")){
		agreeAt = false;
		alert("데이터 신청을 하려면 개인정보 수집 및 이용에 대한 동의가 필요합니다.");
		$("#chk01").next("ul").focus();
		return;
	}

	if(!$("#chk02").is(":checked")){
		agreeAt = false;
		alert("데이터 신청을 하려면 개인정보 제3자 제공에 대한 별도 동의가 필요합니다.");
		$("#chk02").focus();
		return;
	}

	if(agreeAt){
		var val = $("#applyFrm").serialize();

		$.ajax({
			url : "<c:url value='/portal/dac/clc/inf/saveSvcDataAplc.do'/>",
			type : "POST",
			data : val,
			dataType : 'json',
			success : function(data) {
				$("input[name='dataAplcNo']").val(data.clcInfReserchVo.dataAplcNo);
				$("#applyFrm").attr("action","/portal/dac/clc/inf/viewClcInfReserchSummary.do").submit();
			},
			error : function() {
				alert("저장 실패 하였습니다.");
			}
		});
	}
}
</script>
<form id="applyFrm" name="applyFrm" method="post">
	<input type="hidden" name="dataTpcd" value="${clcInfReserchVo.dataTpcd}"/>
	<input type="hidden" name="dataAplcNo" value="${clcInfReserchVo.dataAplcNo}"/>
</form>
<div class="wrap">
	<div class="sub_visual_wrap">
		<div class="data_request">
			<ul>
				<li>
					<c:choose>
						<c:when test="${clcInfReserchVo.dataTpcd eq '01'}">임상 </c:when>
						<c:when test="${clcInfReserchVo.dataTpcd eq '02'}">공공 </c:when>
						<c:when test="${clcInfReserchVo.dataTpcd eq '03'}">결합 </c:when>
					</c:choose>
					데이터 신청
				</li>
			</ul>
		</div>
	</div>
	<div class="n_data_apply_wrap">
		<div class="con">
			<div class="n_data_flow_wrap">
				<!-- class="on"시 활성화 -->
				<ul class="on">
					<li class="icon"></li>
					<li>01.약관동의</li>
				</ul>
				<ul class="">
					<li class="icon"></li>
					<li>02.서류작성 및<br>가상화환경 선택</li>
				</ul>
				<ul class="">
					<li class="icon"></li>
					<li>03.연구정보</li>
				</ul>
				<ul class="">
					<li class="icon"></li>
					<li>04.연구자정보</li>
				</ul>
				<ul class="">
					<li class="icon"></li>
					<li>05.데이터셋</li>
				</ul>
				<ul class="">
					<li class="icon"></li>
					<li>06.요청정보보기</li>
				</ul>
			</div>
			<div class="personal_info">
				<h3>개인정보 수집 및 이용동의</h3>
				<div class="description">이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등 대부분의 네이버 서비스를 회원과 동일하게 이용할 수 있습니다.<br>이용자가 메일, 캘린더, 카페, 블로그 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우, 네이버는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다.<br>회원가입 시점에 네이버가 이용자로부터 수집하는 개인정보는 아래와 같습니다.<br>회원 가입 시 필수항목으로 아이디, 비밀번호, 이름, 생년월일, 성별, 휴대전화번호를, 선택항목으로 본인확인 이메일주소를 수집합니다. 단, 비밀번호 없이 회원 가입 시에는 필수항목으로 아이디, 이름, 생년월일, 휴대전화번호를, 선택항목으로 비밀번호를 수집합니다. 만약 이용자가 입력하는 생년월일이 만14세 미만 아동일 경우에는 법정대리인 정보(법정대리인의 이름, 생년월일, 성별, 중복가입확인정보(DI), 휴대전화번호)를 추가로 수집합니다.<br>단체 회원가입 시 필수 항목으로 단체아이디, 비밀번호, 단체이름, 이메일주소, 휴대전화번호를, 선택항목으로 단체 대표자명을 수집합니다.</div>
				<label class="re_checkbox_s">
					<input type="checkbox" id="chk01" class="agreeCheck"/>
					<span><span class="check_img"></span>이용약관에 동의합니다.</span>
				</label>
				<p class="txt">위의 개인정보 제3자 제공에 대한 별도 동의를 거부할 권리가 있습니다. 그러나 동의를 거부할 경우, 데이터신청 진행이 제한됩니다.</p>
			</div>
			<div class="personal_info">
				<h3>개인정보 제3자 제공에 대한 별도 동의</h3>
				<div class="description">이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등 대부분의 네이버 서비스를 회원과 동일하게 이용할 수 있습니다.<br>이용자가 메일, 캘린더, 카페, 블로그 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우, 네이버는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다.<br>회원가입 시점에 네이버가 이용자로부터 수집하는 개인정보는 아래와 같습니다.<br>회원 가입 시 필수항목으로 아이디, 비밀번호, 이름, 생년월일, 성별, 휴대전화번호를, 선택항목으로 본인확인 이메일주소를 수집합니다. 단, 비밀번호 없이 회원 가입 시에는 필수항목으로 아이디, 이름, 생년월일, 휴대전화번호를, 선택항목으로 비밀번호를 수집합니다. 만약 이용자가 입력하는 생년월일이 만14세 미만 아동일 경우에는 법정대리인 정보(법정대리인의 이름, 생년월일, 성별, 중복가입확인정보(DI), 휴대전화번호)를 추가로 수집합니다.<br>단체 회원가입 시 필수 항목으로 단체아이디, 비밀번호, 단체이름, 이메일주소, 휴대전화번호를, 선택항목으로 단체 대표자명을 수집합니다.</div>
				<label class="re_checkbox_s">
					<input type="checkbox" id="chk02" class="agreeCheck"/>
					<span><span class="check_img"></span>이용약관에 동의합니다.</span>
				</label>
				<p class="txt">위의 개인정보 제3자 제공에 대한 별도 동의를 거부할 권리가 있습니다. 그러나 동의를 거부할 경우, 데이터신청 진행이 제한됩니다.</p>
			</div>
			<div class="all_check">
				<label class="re_checkbox_s">
					<input type="checkbox" id="allChk"/>
					<span><span class="check_img"></span>전체동의</span>
				</label>
			</div>
			<div class="n_btn_center">
				<a href="javascript:void(0)" class="n_m_btn n_bc_blue_dk" onclick="fnAgree();">다음</a>
			</div>
		</div>
	</div>
</div>

<!-- title 및 navi -->
<%@include file="/WEB-INF/jsp/kcure/portal/dac/clc/inf/clcInfCommon.jsp"%>