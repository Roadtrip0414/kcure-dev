<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@include file="/WEB-INF/jsp/kcure/portal/com/global_scripts.jsp"%>

<script language='javascript'>

	window.name ="Parent_window";
	
	function fnCertify(){
		window.open('', 'popupChk', 'width=500, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
		const f = document.frmChk;
        f.action = "https://nice.checkplus.co.kr/CheckPlusSafeModel/checkplus.cb";
        f.target = "popupChk";
        f.submit();
	}
	
	function setChildInfo(val){
		$("#usedData").val(val);
	}
	
	function validProc(){
		setTimeout(function run() {
			var dataArray = $("#usedData").val().split(",");
			if(dataArray[0] == "Y"){
				//핸드폰 가입자는 inner alert 발생 (로그인 링크제공)
				alert("info : " + dataArray[1]+ "\n" + dataArray[2] + "\n" + dataArray[3] + "\n 해당 정보로 로그인 해주세요." );
				
				const f = document.frmCertify;
		        f.action = "/portal/uat/uia/pub/viewLoginUsr.do";
		        f.submit();
				
			}else{
				//일반가입자는 다음단계 페이지로 이동
				const f = document.frmCertify;
		        f.action = "/portal/uat/uca/viewSignupStp3.do";
		        f.submit();
			}
		}, 500);
	}
	
	function goHome(){
		location.href="/portal/uat/uca/viewSignup.do";
	}
	
	//에레일시
	function pageReset(){
		alert("인증 에러가 발생하였습니다.");
		//일반가입자는 다음단계 페이지로 이동
		const f = document.frmCertify;
        f.action = "/portal/uat/uca/viewSignup.do";
        f.submit();
	}
	
</script>


<form id="frmCertify" name="frmCertify" method="post">	
	<input type="hidden" id="usedData" value="">
</form>

<form id="frmChk" name="frmChk" method="post">
<input type="hidden" name="m" value="checkplusService">						<!-- 필수 데이타로, 누락하시면 안됩니다. -->
<input type="hidden" name="EncodeData" value="<c:out value="${data.sEncData}"/>">		<!-- 위에서 업체정보를 암호화 한 데이타입니다. -->

<div class="wrap">
        <div class="join_wrap">
            <div class="con">
                <h1>회원가입</h1>
                <div class="progress">
                    <ul>
                        <!-- li에 class on 추가 시 색 변경 -->
                        <li class="on">
                            <p>STEP 01</p>
                            <h2>약관동의</h2>
                        </li>
                        <li class="on">
                            <p>STEP 02</p>
                            <h2>휴대폰 본인인증</h2>
                        </li>
                        <li>
                            <p>STEP 03</p>
                            <h2>회원정보 입력</h2>
                        </li>
                        <li>
                            <p>STEP 04</p>
                            <h2>회원가입 완료</h2>
                        </li>
                    </ul>
                </div>
                <div class="sub_title">
                    <h3>본인인증</h3>
                    <p>회원가입을 위하여 본인인증을 진행하셔야 합니다.</p>
                </div>
                <div class="phone">
                    <img src="/images/join_phone_certify_icon.svg" alt="휴대폰 인증 아이콘">
                    <ul>
                        <li>휴대폰 본인인증</li>
                        <li>본인 명의 휴대폰으로 본인인증을 하실 수 있습니다</li>
                    </ul>
                </div>
                <div class="l_btn">
					<a href="#" onclick="goHome()" class="bc_blue">취소하기</a>
					<a href="#" onclick="fnCertify()" class="bc_b_line">인증하기</a>
                </div>
            </div>
        </div>
	</div>
</form>

