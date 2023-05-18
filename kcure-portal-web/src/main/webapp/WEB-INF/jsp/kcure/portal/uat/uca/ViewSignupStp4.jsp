<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@include file="/WEB-INF/jsp/kcure/portal/com/global_scripts.jsp"%>

<script type="text/javaScript">

	function fnLogin(){
		location.href ="/portal/uat/uia/pub/viewLoginUsr.do";
	}
		
</script>


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
                        <li class="on">
                            <p>STEP 03</p>
                            <h2>회원정보 입력</h2>
                        </li>
                        <li class="on">
                            <p>STEP 04</p>
                            <h2>회원가입 완료</h2>
                        </li>
                    </ul>
                </div>
                <div class="complete">
                    <img src="/images/join_complete_icon.svg" alt="회원가입 완료 아이콘">
                    <ul>
                        <li>회원 가입 완료를 축하드립니다.</li>
                    </ul>
                </div>
                <div class="l_btn">
					<a href="#" onclick="fnLogin()" class="bc_b_line">로그인하기</a>
                </div>
            </div>
        </div>
	</div>